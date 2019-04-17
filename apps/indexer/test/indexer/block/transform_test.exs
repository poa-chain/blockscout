defmodule Indexer.Block.TransformTest do
  use ExUnit.Case

  alias Indexer.Block.Transform

  @block %{
    difficulty: 1,
    extra_data:
      "0xd68301080d846765746886676f312e3130856c696e7578000000000000000000773ab2ca8f47904a14739ad80a75b71d9d29b9fff8b7ecdcb73efffa6f74122f17d304b5dc8e6e5f256c9474dd115c8d4dae31b7a3d409e5c3270f8fde41cd8c00",
    gas_limit: 7_753_377,
    gas_used: 1_810_195,
    hash: "0x7004c895e812c55b0c2be8a46d72ca300a683dc27d1d7917ee7742d4d0359c1f",
    logs_bloom:
      "0x00000000000000020000000000002000000400000000000000000000000000000000000000000000040000080004000020000010000000000000000000000000000000000000000008000008000000000000000000200000000000000000000000000000020000000000000000000800000000000000804000000010080000000800000000000000000000000000000000000000000000800000000000080000000008000400000000404000000000000000000000000200000000000000000000000002000000000000001002000000000000002000000008000000000020000000000000000000000000000000000000000000000000400000800000000000",
    miner_hash: "0x0000000000000000000000000000000000000000",
    mix_hash: "0x0000000000000000000000000000000000000000000000000000000000000000",
    nonce: "0x0000000000000000",
    number: 2_848_394,
    parent_hash: "0x20350fc367e19d3865be1ea7da72ab81f8f9941c43ac6bb24a34a0a7caa2f3df",
    receipts_root: "0x6ade4ac1079ea50cfadcce2b75ffbe4f9b14bf69b4607bbf1739463076ca6246",
    sha3_uncles: "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
    size: 6437,
    state_root: "0x23f63347851bcd109059d007d71e19c4f5e73b7f0862bebcd04458333a004d92",
    timestamp: DateTime.from_unix!(1_534_796_040),
    total_difficulty: 5_353_647,
    transactions: [
      "0x7e3bb851fc74a436826d2af6b96e4db9484431811ef0d9c9e78370488d33d4e5",
      "0x3976fd1e3d2a715c3cfcfde9bd3210798c26c017b8edb841d319227ecb3322fb",
      "0xd8db124005bb8b6fda7b71fd56ac782552a66af58fe843ba3c4930423b87d1d2",
      "0x10c1a1ca4d9f4b2bd5b89f7bbcbbc2d69e166fe23662b8db4f6beae0f50ac9fd",
      "0xaa58a6545677c796a56b8bc874174c8cfd31a6c6e6ca3a87e086d4f66d52858a"
    ],
    transactions_root: "0xde8d25c0b9b54310128a21601331094b43f910f9f96102869c2e2dca94884bf4",
    uncles: []
  }

  @blocks [@block, @block]

  describe "transform_blocks/1" do
    setup do
      original = Application.get_env(:indexer, :block_transformer)

      on_exit(fn -> Application.put_env(:indexer, :block_transformer, original) end)
    end

    test "transforms a list of blocks" do
      assert Transform.transform_blocks(@blocks)
    end
  end
end