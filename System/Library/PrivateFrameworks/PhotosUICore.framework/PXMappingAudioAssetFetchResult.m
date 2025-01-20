@interface PXMappingAudioAssetFetchResult
@end

@implementation PXMappingAudioAssetFetchResult

void __62___PXMappingAudioAssetFetchResult_enumerateObjectsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v6 + 16))(v6, v7, a3, a4);
}

void __50___PXMappingAudioAssetFetchResult_containsObject___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = (void *)a1[4];
  id v7 = (*(void (**)(void))(*(void *)(a1[5] + 16) + 16))();
  LODWORD(v6) = [v6 isEqual:v7];

  if (v6)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
}

uint64_t __52___PXMappingAudioAssetFetchResult_objectsAtIndexes___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

@end