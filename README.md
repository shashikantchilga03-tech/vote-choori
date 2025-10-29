# vote-choori
# 🃏 DeckChain – Decentralized Smart Deck Manager

![Solidity](https://img.shields.io/badge/Solidity-^0.8.20-363636?logo=solidity)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Build-Stable-blue)
![Contributions Welcome](https://img.shields.io/badge/Contributions-Welcome-brightgreen)

> **DeckChain** is a fully on-chain card deck manager that allows players and developers to create, shuffle, and draw cards directly on the blockchain — enabling decentralized, verifiable, and tamper-proof gameplay logic.

---


<img width="1920" height="1080" alt="Screenshot (5)" src="https://github.com/user-attachments/assets/faf02d3e-6784-449e-97fc-b0f8385196b2" />

## 📘 Overview

DeckChain brings the mechanics of physical card decks into the blockchain world.  
Users can **create unique cards**, group them into **decks**, and **shuffle/draw** cards transparently using smart contracts.

It’s perfect for:
- 🎮 Blockchain-based card games  
- 🎨 NFT collectible systems  
- 🧩 Random pack or loot-box style draws  
- 🧠 Solidity learning & demos  

---

## ⚙️ Features

✅ Create unique cards with metadata (IPFS or JSON URIs)  
✅ Create and own multiple decks  
✅ Shuffle decks (pseudo-random for demo; Chainlink VRF ready)  
✅ Draw cards sequentially  
✅ View remaining cards  
✅ Fully decentralized and transparent  

---

## 🧠 How It Works

### 1️⃣ Create Cards
```solidity
uint256 card1 = createCard("Fire Dragon", "ipfs://Qm123");
uint256 card2 = createCard("Water Spirit", "ipfs://Qm456");

https://celo-sepolia.blockscout.com/tx/0x9aa628781ed4450c7bb261f06579686fb0daa4a8bf0855892c10879e142a0642?tab=token_transfers
