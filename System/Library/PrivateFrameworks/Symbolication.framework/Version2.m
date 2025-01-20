@interface Version2
@end

@implementation Version2

BOOL ___variantForNSSlice_Version2_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = a4;
  uint64_t v7 = v6[2](v6, *(unsigned int *)(a1 + 32) + a2, 32);
  v9 = v7 && (uint64_t v8 = v6[2](v6, *(void *)(v7 + 8), 24)) != 0 && *(unsigned char *)(v8 + 1) != 0;

  return v9;
}

@end