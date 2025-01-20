@interface SBTreeNodeIndexPathFromReverseOfNSArray
@end

@implementation SBTreeNodeIndexPathFromReverseOfNSArray

uint64_t ___SBTreeNodeIndexPathFromReverseOfNSArray_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 unsignedIntegerValue];
  *(void *)(*(void *)(a1 + 32) + 8 * (*(void *)(a1 + 40) + ~a3)) = result;
  return result;
}

@end