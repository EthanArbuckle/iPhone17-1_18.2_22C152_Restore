@interface MDSimpleQueryModifyForMatching
@end

@implementation MDSimpleQueryModifyForMatching

uint64_t ___MDSimpleQueryModifyForMatching_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = a2;
  if (*(_WORD *)(a2 + 48) == 2) {
    *(_WORD *)(a2 + 48) = 1;
  }
  return result;
}

@end