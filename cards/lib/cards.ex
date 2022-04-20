defmodule Cards do

  @moduledoc """
    Provides methods for creating and handling deck for cards project
  """

  @doc """
    create_deck will return the strings represents each a paying card
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Diamonds", "Hearts"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end


  @doc """
    Returns shuffled deck of cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Return weather a card is exist in a deck or not


  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "Ace of Diamonds")
      true
      iex> Cards.contains?(deck, "Ten of Spades")
      false

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    This function will take two arguments. 1. deck 2. hand_size
    based upon `hand_size` it will
    return strings (where each string represents playing card)

  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, rest_deck} = Cards.deal(deck, 3)
      iex> hand
      ["Ace of Spades", "Ace of Clubs", "Ace of Diamonds"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    This function will save the deck locally.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loading deck from locally saved file.
  """
  def load(filename) do
    { status, binary } = File.read(filename)

    case File.read(filename) do
      { :ok, binary } -> binary
      { :error, _reason } -> "Something went wrong! may be file not found! Reason = #{_reason}"
    end
  end


  @doc """
    Just execute and play!
  """
  def create_hand(hand_size) do
    # deck = Cards.create_deck()
    # deck = Cards.shuffle(deck)
    # Cards.deal(deck, hand_size)

    # let's make use of pipe operator. whatever returned from previous function that will automatically
    # goes to next function as firt parameter. $$ THIS IS PRETTY COOL 😎 $$
    Cards.create_deck() |> Cards.shuffle() |> Cards.deal(hand_size)

  end
end
