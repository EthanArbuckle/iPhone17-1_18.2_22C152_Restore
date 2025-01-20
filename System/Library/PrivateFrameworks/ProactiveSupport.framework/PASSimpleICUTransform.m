@interface PASSimpleICUTransform
@end

@implementation PASSimpleICUTransform

void ___PASSimpleICUTransform_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) length];
  size_t v3 = 2 * (int)v2;
  unint64_t v4 = v3 | 1;
  memptr = 0;
  uint64_t v12 = 0;
  if ((v3 | 1) > 0x200)
  {
    int v8 = malloc_type_posix_memalign(&memptr, 8uLL, v3, 0x1000040BDFB0063uLL);
    LOBYTE(v12) = 0;
    if (v8)
    {
      id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v9);
    }
    v5 = (char *)memptr;
  }
  else
  {
    v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v5, v3 | 1);
  }
  if (v2 << 32)
  {
    uint64_t v6 = 0;
    if ((unint64_t)(int)v2 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = (int)v2;
    }
    do
    {
      *(_WORD *)&v5[2 * v6] = [*(id *)(a1 + 32) characterAtIndex:v6];
      ++v6;
    }
    while (v7 != v6);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = utrans_openU();
  if (v4 > 0x200) {
    free(v5);
  }
}

@end