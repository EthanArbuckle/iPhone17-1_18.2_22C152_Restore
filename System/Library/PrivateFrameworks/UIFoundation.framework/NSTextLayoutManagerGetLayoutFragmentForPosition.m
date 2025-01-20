@interface NSTextLayoutManagerGetLayoutFragmentForPosition
@end

@implementation NSTextLayoutManagerGetLayoutFragmentForPosition

uint64_t ____NSTextLayoutManagerGetLayoutFragmentForPosition_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 state];
  if (!result) {
    return result;
  }
  uint64_t result = [a2 layoutFragmentFrame];
  double v10 = *(double *)(a1 + 48);
  if (v10 >= v8 && v10 < v8 + v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
LABEL_14:
    *a4 = 1;
    return result;
  }
  if (v10 > v8 && *(unsigned char *)(a1 + 56) != 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
    return result;
  }
  if (v10 < v8) {
    goto LABEL_14;
  }
  return result;
}

@end