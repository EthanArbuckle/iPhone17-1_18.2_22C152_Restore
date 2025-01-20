@interface PXConcatenatingAudioAssetFetchResult
@end

@implementation PXConcatenatingAudioAssetFetchResult

void __68___PXConcatenatingAudioAssetFetchResult_enumerateObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  v7 = (void *)MEMORY[0x1AD10CB00]();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68___PXConcatenatingAudioAssetFetchResult_enumerateObjectsUsingBlock___block_invoke_2;
  v10[3] = &unk_1E5DC6180;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = v8;
  uint64_t v12 = v9;
  uint64_t v13 = a4;
  [v6 enumerateObjectsUsingBlock:v10];
}

uint64_t __68___PXConcatenatingAudioAssetFetchResult_enumerateObjectsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  **(unsigned char **)(a1 + 48) = *a4;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

void __58___PXConcatenatingAudioAssetFetchResult_objectsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectAtIndex:a2];
  [v2 addObject:v3];
}

BOOL __62___PXConcatenatingAudioAssetFetchResult_initWithFetchResults___block_invoke(uint64_t a1, void *a2)
{
  return [a2 count] > 0;
}

@end