@interface TermTrieWalkFatParallel
@end

@implementation TermTrieWalkFatParallel

uint64_t ___TermTrieWalkFatParallel_block_invoke(uint64_t a1)
{
  return term_fat_level_iterate_helper(*(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(atomic_uint **)(a1 + 64), *(unsigned __int8 *)(a1 + 80));
}

@end