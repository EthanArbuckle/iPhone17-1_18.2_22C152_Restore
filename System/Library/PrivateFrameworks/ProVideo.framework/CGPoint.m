@interface CGPoint
@end

@implementation CGPoint

uint64_t __pv_CGPoint_array_from_NSArray_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v3 = (void *)(*(void *)(a1 + 32) + 16 * a3);
  uint64_t result = [a2 CGPointValue];
  void *v3 = v5;
  v3[1] = v6;
  return result;
}

@end