defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "greets the world" do
    assert 1 + 1 == 2
  end

  #  Writing second type of test which is  case
  test "check number of cards in newly created deck" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 20
  end

  # after shuffling of the deck is it equals to generated one ?
  test "randomization of shuffled deck" do
    deck = Cards.create_deck()
    assert deck != Cards.shuffle(deck)
    # another way to do exact same thing using refute keyword
    # refute deck == Cards.shuffle(deck)
  end



end
