@interface NSIndexSet
@end

@implementation NSIndexSet

uint64_t __78__NSIndexSet_PLAdditions___pl_indexSetByUpdatingWithChangedIndexes_asInserts___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) shiftIndexesStartingAtIndex:a2 by:a3];
}

uint64_t __78__NSIndexSet_PLAdditions___pl_indexSetByUpdatingWithChangedIndexes_asInserts___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a2 - *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", v5, a3);
  uint64_t result = [*(id *)(a1 + 32) shiftIndexesStartingAtIndex:v5 + a3 by:-a3];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a3;
  return result;
}

void __46__NSIndexSet_PLAdditions__pl_shortDescription__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (a3 < 2) {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", a2, v4);
  }
  else {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu-%lu", a2, a3 + a2 - 1);
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v5];
}

@end