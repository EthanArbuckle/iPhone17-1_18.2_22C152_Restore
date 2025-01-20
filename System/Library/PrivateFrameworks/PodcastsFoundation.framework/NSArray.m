@interface NSArray
@end

@implementation NSArray

uint64_t __50__NSArray_MTAdditions__mt_firstObjectPassingTest___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return (*(uint64_t (**)(void))(v1 + 16))();
  }
  else {
    return 1;
  }
}

uint64_t __50__NSArray_MTAdditions__mt_firstObjectPassingTest___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a4 = result;
  return result;
}

uint64_t __40__NSArray_MTAdditions__mt_uniqueOrdered__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 32) containsObject:v3];
    uint64_t v4 = v6;
    if ((v3 & 1) == 0)
    {
      uint64_t v3 = [*(id *)(a1 + 40) addObject:v6];
      uint64_t v4 = v6;
    }
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

void __62__NSArray_MTStride__concurrentMapWithStrideSize_on_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1AD11A870]();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = objc_msgSend(*(id *)(a1 + 32), "subarrayForStrideIndex:withStrideSize:", a2, *(void *)(a1 + 48), 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

@end