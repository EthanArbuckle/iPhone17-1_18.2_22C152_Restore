@interface MDStoreOIDArrayAppendMultipleOIDArrays
@end

@implementation MDStoreOIDArrayAppendMultipleOIDArrays

void *___MDStoreOIDArrayAppendMultipleOIDArrays_block_invoke(void *result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result[4] + 8 * a2);
  if (v2)
  {
    uint64_t v3 = *(unsigned int *)(v2 + 32);
    if (v3)
    {
      v4 = *(void **)(result[5] + 8 * a2);
      v5 = *(const void **)(v2 + 16);
      return memcpy(v4, v5, 8 * v3);
    }
  }
  return result;
}

@end