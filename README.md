# Decentralized Energy Prosumer Network

A blockchain-based platform for peer-to-peer energy trading, prosumer verification, and smart grid management using Clarity smart contracts.

## Overview

The Decentralized Energy Prosumer Network enables individuals and organizations to participate in a decentralized energy marketplace where they can both produce and consume energy. The platform provides verification, trading, grid balancing, community benefits, and smart device integration.

## Smart Contracts

### 1. Prosumer Verification Contract (`prosumer-verification.clar`)
- **Purpose**: Validates energy producers and consumers
- **Features**:
    - Prosumer registration and verification
    - Capacity and location tracking
    - Admin verification process
    - Verification status queries

### 2. Energy Trading Contract (`energy-trading.clar`)
- **Purpose**: Manages peer-to-peer energy exchange
- **Features**:
    - Create sell orders for excess energy
    - Buy energy from other prosumers
    - Energy balance management
    - Order matching and execution

### 3. Grid Balancing Contract (`grid-balancing.clar`)
- **Purpose**: Maintains system stability
- **Features**:
    - Regional supply and demand tracking
    - Stability score calculation
    - Balancing service rewards
    - Grid status monitoring

### 4. Community Benefits Contract (`community-benefits.clar`)
- **Purpose**: Distributes network advantages
- **Features**:
    - Community fund contributions
    - Energy sharing rewards
    - Benefit program creation
    - Community score tracking

### 5. Technology Integration Contract (`technology-integration.clar`)
- **Purpose**: Manages smart energy devices
- **Features**:
    - Smart device registration
    - IoT data collection
    - Automation rule creation
    - Device status monitoring

## Key Features

### For Energy Producers
- Register and verify production capacity
- List excess energy for sale
- Earn rewards for grid balancing services
- Integrate smart devices for automated trading

### For Energy Consumers
- Purchase energy directly from producers
- Access community benefit programs
- Monitor energy usage through smart devices
- Participate in demand response programs

### For Grid Operators
- Monitor regional supply and demand
- Maintain grid stability through automated balancing
- Access real-time device data
- Implement dynamic pricing strategies

## Getting Started

### Prerequisites
- Clarity development environment
- Stacks blockchain testnet access
- Smart energy devices (optional)

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd energy-prosumer-network
   \`\`\`

2. Deploy contracts to Stacks testnet:
   \`\`\`bash
   clarinet deploy --testnet
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Usage Examples

#### Register as a Prosumer
\`\`\`clarity
(contract-call? .prosumer-verification register-prosumer "solar-producer" u5000 "California-Grid-A")
\`\`\`

#### Create Energy Sell Order
\`\`\`clarity
(contract-call? .energy-trading create-sell-order u1000 u50 "California-Grid-A")
\`\`\`

#### Register Smart Device
\`\`\`clarity
(contract-call? .technology-integration register-device "solar-panel-001" "solar-panel" "Rooftop-A")
\`\`\`

## Architecture

The system follows a modular architecture with five interconnected smart contracts:

\`\`\`
┌─────────────────────┐    ┌─────────────────────┐
│  Prosumer           │    │  Energy Trading     │
│  Verification       │◄──►│  Contract           │
└─────────────────────┘    └─────────────────────┘
│                           │
▼                           ▼
┌─────────────────────┐    ┌─────────────────────┐
│  Grid Balancing     │    │  Community Benefits │
│  Contract           │◄──►│  Contract           │
└─────────────────────┘    └─────────────────────┘
│                           │
▼                           ▼
┌─────────────────────────────────────────────────┐
│         Technology Integration Contract         │
└─────────────────────────────────────────────────┘
\`\`\`

## Security Considerations

- All contracts implement proper access controls
- Energy transfers are atomic and reversible
- Device data is validated before storage
- Community funds are protected by multi-signature requirements

## Contributing

1. Fork the repository
2. Create a feature branch
3. Write tests for new functionality
4. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions and support, please open an issue in the GitHub repository or contact the development team.

