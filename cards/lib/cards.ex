defmodule Cards do

  # creating deck
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Diamonds", "Hearts"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  # shuffle the deck
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  # is deck contains the card
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # deal function that uses split to segregate the no_of_cards
  def deal(deck, hand_size) do
    { cards, rest_cards } = Enum.split(deck, hand_size)
    cards
  end

  def save_deck_file(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    binary
    File.write(filename, binary)
  end

  def read_deck_file(filename) do
    { status, binary } = File.read(filename)

    # case pattern matching!

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "Something went wrong! may be file not found!"
    end

  end

end
