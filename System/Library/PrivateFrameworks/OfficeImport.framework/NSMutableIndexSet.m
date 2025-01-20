@interface NSMutableIndexSet
@end

@implementation NSMutableIndexSet

uint64_t __67__NSMutableIndexSet_TSUAdditions__tsu_moveIndexesInRange_toOffset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", a2 - *(void *)(a1 + 40) + *(void *)(a1 + 56), a3);
}

@end