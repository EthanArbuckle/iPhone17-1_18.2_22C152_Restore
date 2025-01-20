@interface NSMutableIndexSet
@end

@implementation NSMutableIndexSet

uint64_t __70__NSMutableIndexSet_PhotosUIFoundation__px_adjustIndexesForDeletions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_adjustIndexesForDeletedRange:", a2, a3);
}

uint64_t __71__NSMutableIndexSet_PhotosUIFoundation__px_adjustIndexesForInsertions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_adjustIndexesForInsertedRange:", a2, a3);
}

@end