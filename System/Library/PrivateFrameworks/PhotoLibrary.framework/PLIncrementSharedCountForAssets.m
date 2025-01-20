@interface PLIncrementSharedCountForAssets
@end

@implementation PLIncrementSharedCountForAssets

uint64_t ___PLIncrementSharedCountForAssets_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = *(void **)(a1 + 32);
  uint64_t result = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F38ED0], "changeRequestForAsset:", *(void *)(*((void *)&v6 + 1) + 8 * v5++)), "incrementShareCount");
      }
      while (v3 != v5);
      uint64_t result = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

@end