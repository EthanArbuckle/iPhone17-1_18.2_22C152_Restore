@interface NSMutableArray
@end

@implementation NSMutableArray

uint64_t __59__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_before___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setOwner:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 48);
  if (!v2
    || ([*(id *)(a1 + 40) firstObject],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2 == v3))
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) indexOfObject:*(void *)(a1 + 48)];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"_UIKBRTObjectArray.m", 147, @"Invalid parameter not satisfying: %@", @"index != NSNotFound" object file lineNumber description];

      uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  return [v6 insertObject:v7 atIndex:v4];
}

uint64_t __58__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_after___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setOwner:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 48);
  if (!v2
    || ([*(id *)(a1 + 40) lastObject],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2 == v3))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    return [v8 addObject:v9];
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) indexOfObject:*(void *)(a1 + 48)];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"_UIKBRTObjectArray.m", 169, @"Invalid parameter not satisfying: %@", @"index != NSNotFound" object file lineNumber description];
    }
    uint64_t v6 = *(void *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    return [v5 insertObject:v6 atIndex:v4 + 1];
  }
}

void __74__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_beforeItemPassingTest___block_invoke(id *a1)
{
  [a1[4] setOwner:a1[5]];
  uint64_t v2 = [a1[5] count];
  id v4 = a1[4];
  id v3 = a1[5];
  if (v2)
  {
    uint64_t v5 = [a1[5] count];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_beforeItemPassingTest___block_invoke_2;
    v8[3] = &unk_1E52FDB78;
    id v9 = a1[6];
    objc_msgSend(a1[5], "insertObject:atIndex:", a1[4], objc_msgSend(v3, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v5, 1024, v8));
  }
  else
  {
    id v6 = a1[5];
    id v7 = a1[4];
    [v6 addObject:v7];
  }
}

uint64_t __74__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_beforeItemPassingTest___block_invoke_2(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t __52__NSMutableArray__UIKBRTObjectArray___uikbrtRemove___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setOwner:0];
  uint64_t result = [*(id *)(a1 + 32) count];
  if (!result)
  {
    id v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_set_listContainsOrderedItems:", 0);
  }
  return result;
}

@end