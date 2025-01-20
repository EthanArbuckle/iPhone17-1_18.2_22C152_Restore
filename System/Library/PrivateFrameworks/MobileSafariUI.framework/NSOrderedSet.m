@interface NSOrderedSet
- (id)safari_indexesNotInSet:(void *)a1;
@end

@implementation NSOrderedSet

- (id)safari_indexesNotInSet:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__NSOrderedSet_SafariExtras__safari_indexesNotInSet___block_invoke;
    v6[3] = &unk_1E6D7C088;
    id v7 = v3;
    a1 = [a1 indexesOfObjectsPassingTest:v6];
  }
  return a1;
}

void __73__NSOrderedSet_SafariExtras__safari_changeFromSet_withModificationCheck___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v16 = a2;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "countOfIndexesInRange:", 0, a3);
    uint64_t v8 = a3 - v7 + objc_msgSend(*(id *)(a1 + 48), "countOfIndexesInRange:", 0, v6);
    v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v6];
    uint64_t v10 = *(void *)(a1 + 64);
    if (v10) {
      uint64_t v11 = (*(uint64_t (**)(uint64_t, id, void *))(v10 + 16))(v10, v16, v9);
    }
    else {
      uint64_t v11 = 0;
    }
    if (v6 != v8 && v6 != a3 || v11 != 0)
    {
      v14 = *(void **)(a1 + 56);
      v15 = [[IndexMove alloc] initWithIndexBeforeMove:a3 indexAfterMove:v6 modified:v11];
      [v14 addObject:v15];
    }
  }
}

uint64_t __53__NSOrderedSet_SafariExtras__safari_indexesNotInSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

@end