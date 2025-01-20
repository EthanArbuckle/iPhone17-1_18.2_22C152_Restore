@interface ArrayContainsStringIgnoringCase
@end

@implementation ArrayContainsStringIgnoringCase

BOOL ___ArrayContainsStringIgnoringCase_block_invoke(uint64_t a1, void *a2)
{
  return [a2 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;
}

@end