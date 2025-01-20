@interface SIDirectoryStoreIterate
@end

@implementation SIDirectoryStoreIterate

BOOL ___SIDirectoryStoreIterate_block_invoke(uint64_t a1, int a2)
{
  BOOL result = 0;
  char v5 = 0;
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
      return v5 != 0;
    }
  }
  return result;
}

@end