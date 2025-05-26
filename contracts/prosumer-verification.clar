;; Prosumer Verification Contract
;; Validates energy producers and consumers in the network

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_VERIFIED (err u101))
(define-constant ERR_NOT_FOUND (err u102))
(define-constant ERR_INVALID_CAPACITY (err u103))

;; Prosumer data structure
(define-map prosumers
  { address: principal }
  {
    verified: bool,
    prosumer-type: (string-ascii 20),
    energy-capacity: uint,
    location: (string-ascii 50),
    verification-date: uint
  }
)

;; Verification requests
(define-map verification-requests
  { address: principal }
  {
    prosumer-type: (string-ascii 20),
    energy-capacity: uint,
    location: (string-ascii 50),
    requested-at: uint
  }
)

;; Register as prosumer
(define-public (register-prosumer (prosumer-type (string-ascii 20)) (energy-capacity uint) (location (string-ascii 50)))
  (let ((caller tx-sender))
    (asserts! (> energy-capacity u0) ERR_INVALID_CAPACITY)
    (asserts! (is-none (map-get? prosumers { address: caller })) ERR_ALREADY_VERIFIED)
    (map-set verification-requests
      { address: caller }
      {
        prosumer-type: prosumer-type,
        energy-capacity: energy-capacity,
        location: location,
        requested-at: block-height
      }
    )
    (ok true)
  )
)

;; Verify prosumer (admin only)
(define-public (verify-prosumer (prosumer-address principal))
  (let ((request (unwrap! (map-get? verification-requests { address: prosumer-address }) ERR_NOT_FOUND)))
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (map-set prosumers
      { address: prosumer-address }
      {
        verified: true,
        prosumer-type: (get prosumer-type request),
        energy-capacity: (get energy-capacity request),
        location: (get location request),
        verification-date: block-height
      }
    )
    (map-delete verification-requests { address: prosumer-address })
    (ok true)
  )
)

;; Get prosumer info
(define-read-only (get-prosumer (address principal))
  (map-get? prosumers { address: address })
)

;; Check if prosumer is verified
(define-read-only (is-verified (address principal))
  (match (map-get? prosumers { address: address })
    prosumer (get verified prosumer)
    false
  )
)
