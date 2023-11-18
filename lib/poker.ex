defmodule Poker do
  @moduledoc """
    Providers methods for creating and handling a deck of cards and poker games
  """

  @doc """
    Return a list of strings representing a deck of playing cards

  ## Examples

      iex> deck = Poker.create_deck
      iex> deck
      [
        "Ace of Spades",
        "Two of Spades",
        "Three of Spades",
        "Four of Spades",
        "Five of Spades",
        "Ace of Clubs",
        "Two of Clubs",
        "Three of Clubs",
        "Four of Clubs",
        "Five of Clubs",
        "Ace of Diamonds",
        "Two of Diamonds",
        "Three of Diamonds",
        "Four of Diamonds",
        "Five of Diamonds",
        "Ace of Hearts",
        "Two of Hearts",
        "Three of Hearts",
        "Four of Hearts",
        "Five of Hearts"
      ]
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Diamonds", "Hearts"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Return a deck randomized
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines wheter a deck contains a given card

  ## Examples

      iex> deck = Poker.create_deck
      iex> Poker.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument is the length of cards to hand
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Save the deck in file.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Load the deck from a file, like lock.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  @doc """
    Create a deck, then shuffle this and get a hand with `hand_size` argument.
  """
  def create_hand(hand_size) do
    Poker.create_deck
    |> Poker.shuffle
    |> Poker.deal(hand_size)
  end
end
