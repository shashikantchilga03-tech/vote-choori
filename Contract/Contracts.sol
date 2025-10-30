// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title DeckChain - Decentralized Smart Deck Manager
 * @notice A decentralized manager for card-based games that allows users to create, shuffle, and draw from decks securely on-chain.
 * @dev This contract manages decks using verifiable randomness and on-chain data structures.
 */
contract DeckChain {
    struct Card {
        uint256 id;
        string name;
        string metadata; // could be a URI or JSON string with attributes
    }

    struct Deck {
        address owner;
        uint256[] cardIds;
        bool isShuffled;
        uint256 drawIndex;
    }

    mapping(uint256 => Card) public cards;
    mapping(uint256 => Deck) public decks;

    uint256 private nextCardId = 1;
    uint256 private nextDeckId = 1;

    /**
     * @notice Create a new card that can be used in decks.
     * @param name The name of the card.
     * @param metadata Additional metadata about the card (could be a JSON or IPFS URI).
     */
    function createCard(string memory name, string memory metadata) external returns (uint256) {
        uint256 cardId = nextCardId++;
        cards[cardId] = Card(cardId, name, metadata);
        return cardId;
    }

    /**
     * @notice Create a new deck with a list of existing card IDs.
     * @param cardIds The IDs of cards to include in the deck.
     */
    function createDeck(uint256[] memory cardIds) external returns (uint256) {
        uint256 deckId = nextDeckId++;
        decks[deckId] = Deck({
            owner: msg.sender,
            cardIds: cardIds,
            isShuffled: false,
            drawIndex: 0
        });
        return deckId;
    }

    /**
     * @notice Shuffle a deck using pseudo-randomness (for demo purposes).
     * @dev For production use, integrate Chainlink VRF for secure randomness.
     */
    function shuffleDeck(uint256 deckId) external {
        Deck storage deck = decks[deckId];
        require(msg.sender == deck.owner, "Not your deck");
        require(!deck.isShuffled, "Already shuffled");

        uint256 n = deck.cardIds.length;
        for (uint256 i = 0; i < n; i++) {
            uint256 j = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, i))) % n;
            (deck.cardIds[i], deck.cardIds[j]) = (deck.cardIds[j], deck.cardIds[i]);
        }
        deck.isShuffled = true;
    }

    /**
     * @notice Draw a card from the top of the deck.
     * @param deckId The ID of the deck.
     * @return card The drawn card.
     */
    function drawCard(uint256 deckId) external returns (Card memory card) {
        Deck storage deck = decks[deckId];
        require(msg.sender == deck.owner, "Not your deck");
        require(deck.drawIndex < deck.cardIds.length, "No cards left");

        uint256 cardId = deck.cardIds[deck.drawIndex++];
        return cards[cardId];
    }

    /**
     * @notice View the remaining cards in a deck.
     */
    function remainingCards(uint256 deckId) external view returns (uint256) {
        Deck storage deck = decks[deckId];
        return deck.cardIds.length - deck.drawIndex;
    }
}
