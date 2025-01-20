@interface AVURLAsset
@end

@implementation AVURLAsset

void __78__AVURLAsset_FCAdditions__fc_fetchContentKeyIdentifiersWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = [v2 metadata];
    v4 = objc_msgSend(v3, "fc_firstObjectPassingTest:", &__block_literal_global_173_0);
  }
  else
  {
    v4 = 0;
  }
  v5 = [v4 stringValue];

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = FCKeyIdentifiersFromHLSMetadata(v5);
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    v8 = (void (**)(id, void))*(id *)(a1 + 40);
    v8[2](v8, MEMORY[0x1E4F1CBF0]);
  }
}

uint64_t __78__AVURLAsset_FCAdditions__fc_fetchContentKeyIdentifiersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__AVURLAsset_FCAdditions___fc_hlsKeysMetadataItem__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 key];
  uint64_t v3 = [v2 isEqual:@"com.apple.hls.keys"];

  return v3;
}

@end