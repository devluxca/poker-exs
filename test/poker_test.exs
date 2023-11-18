defmodule PokerTest do
  use ExUnit.Case
  doctest Poker

  test "create_deck makes 20 cards" do
    deck_length = length(Poker.create_deck)
    assert deck_length == 20
  end

  test "get two cards using create_hand" do
    {hand, rest_of_deck} = Poker.create_hand(2)
    assert length(hand) === 2 and length(rest_of_deck) == 18
  end

end
