@interface AnnotatedPositionOffset
@end

@implementation AnnotatedPositionOffset

uint64_t ___qsort_AnnotatedPositionOffset_t_block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*a2 == *a3) {
    unsigned int v3 = 0;
  }
  else {
    unsigned int v3 = -1;
  }
  if (*a2 > *a3) {
    return 1;
  }
  else {
    return v3;
  }
}

void ___qsort_big_AnnotatedPositionOffset_t_block_invoke(uint64_t a1)
{
  madvise((void *)(**(void **)(a1 + 32) + 56 * *(void *)(*(void *)(a1 + 32) + 8)), 56 * (*(void *)(*(void *)(a1 + 32) + 16) - *(void *)(*(void *)(a1 + 32) + 8)), 4);
  v2 = *(void **)(a1 + 32);
  OSAtomicEnqueue(&qsort_cached_allocations_10728, v2, 0);
}

@end