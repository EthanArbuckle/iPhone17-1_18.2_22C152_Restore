@interface NSMutableIndexSet(PLAdditions)
- (void)pl_adjustIndexesForDeletions:()PLAdditions;
- (void)pl_adjustIndexesForInsertions:()PLAdditions;
@end

@implementation NSMutableIndexSet(PLAdditions)

- (void)pl_adjustIndexesForInsertions:()PLAdditions
{
  objc_msgSend(a1, "pl_indexSetAdjustedForInsertions:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 removeAllIndexes];
  [a1 addIndexes:v2];
}

- (void)pl_adjustIndexesForDeletions:()PLAdditions
{
  objc_msgSend(a1, "pl_indexSetAdjustedForDeletions:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 removeAllIndexes];
  [a1 addIndexes:v2];
}

@end