defmodule Cards do

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Diamonds", "Hearts"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    { cards, rest_cards } = Enum.split(deck, hand_size)
    cards
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    { status, binary } = File.read(filename)

    case File.read(filename) do
      { :ok, binary } -> binary
      { :error, _reason } -> "Something went wrong! may be file not found! Reason = #{_reason}"
    end
  end


  def create_hand(hand_size) do
    # deck = Cards.create_deck()
    # deck = Cards.shuffle(deck)
    # Cards.deal(deck, hand_size)

    # let's make use of pipe operator. whatever returned from previous function that will automatically
    # goes to next function as firt parameter. $$ THIS IS PRETTY COOL 😎 $$
    Cards.create_deck() |> Cards.shuffle() |> Cards.deal(hand_size)

  end


end
