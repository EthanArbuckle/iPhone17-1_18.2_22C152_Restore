@interface SSNewCFArrayFromXPCArray
@end

@implementation SSNewCFArrayFromXPCArray

BOOL ___SSNewCFArrayFromXPCArray_block_invoke(void *a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(a1[4] + 16))();
  if (v2)
  {
    uint64_t v3 = a1[6];
    uint64_t v4 = *(void *)(a1[5] + 8);
    uint64_t v5 = *(void *)(v4 + 24);
    *(void *)(v4 + 24) = v5 + 1;
    *(void *)(v3 + 8 * v5) = v2;
  }
  return v2 != 0;
}

@end