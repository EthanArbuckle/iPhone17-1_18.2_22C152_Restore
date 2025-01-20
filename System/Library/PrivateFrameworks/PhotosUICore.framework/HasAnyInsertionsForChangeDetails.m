@interface HasAnyInsertionsForChangeDetails
@end

@implementation HasAnyInsertionsForChangeDetails

void ___HasAnyInsertionsForChangeDetails_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v7 = [*(id *)(a1 + 32) itemChangesInSection:a2];
  if (![v7 hasIncrementalChanges]
    || ([v7 insertedIndexes],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

@end