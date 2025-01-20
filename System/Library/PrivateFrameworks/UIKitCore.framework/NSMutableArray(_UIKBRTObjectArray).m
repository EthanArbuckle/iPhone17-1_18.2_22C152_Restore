@interface NSMutableArray(_UIKBRTObjectArray)
- (id)_syncQueue;
- (uint64_t)_listContainsOrderedItems;
- (void)_set_listContainsOrderedItems:()_UIKBRTObjectArray;
- (void)_set_syncQueue:()_UIKBRTObjectArray;
- (void)_uikbrtInsert:()_UIKBRTObjectArray after:;
- (void)_uikbrtInsert:()_UIKBRTObjectArray before:;
- (void)_uikbrtInsert:()_UIKBRTObjectArray beforeItemPassingTest:;
- (void)_uikbrtRemove:()_UIKBRTObjectArray;
@end

@implementation NSMutableArray(_UIKBRTObjectArray)

- (uint64_t)_listContainsOrderedItems
{
  v1 = objc_getAssociatedObject(a1, &_listContainsOrderedItemsKey);
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_set_listContainsOrderedItems:()_UIKBRTObjectArray
{
  if (a3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v3 = 0;
  }
  objc_setAssociatedObject(a1, &_listContainsOrderedItemsKey, v3, (void *)3);
}

- (id)_syncQueue
{
  v2 = objc_getAssociatedObject(a1, &_syncQueueKey);
  if (!v2)
  {
    v2 = dispatch_queue_create("_UIKBRTObjectArrayQueue", 0);
    objc_setAssociatedObject(a1, &_syncQueueKey, v2, (void *)1);
  }
  return v2;
}

- (void)_set_syncQueue:()_UIKBRTObjectArray
{
}

- (void)_uikbrtInsert:()_UIKBRTObjectArray before:
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"_UIKBRTObjectArray.m", 134, @"Invalid parameter not satisfying: %@", @"entry" object file lineNumber description];
  }
  v9 = [v7 owner];

  if (v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"_UIKBRTObjectArray.m", 135, @"Invalid parameter not satisfying: %@", @"entry.owner == nil" object file lineNumber description];

    if (!v8) {
      goto LABEL_7;
    }
  }
  else if (!v8)
  {
    goto LABEL_7;
  }
  v10 = [v8 owner];

  if (v10 != a1)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"_UIKBRTObjectArray.m", 136, @"Invalid parameter not satisfying: %@", @"nextEntry == nil || nextEntry.owner == self" object file lineNumber description];
  }
LABEL_7:
  if ([a1 count] && objc_msgSend(a1, "_listContainsOrderedItems"))
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"_UIKBRTObjectArray.m", 138, @"Invalid parameter not satisfying: %@", @"!self._listContainsOrderedItems" object file lineNumber description];
  }
  v12 = [a1 _syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_before___block_invoke;
  block[3] = &unk_1E52ED900;
  id v19 = v7;
  v20 = a1;
  id v21 = v8;
  uint64_t v22 = a2;
  id v13 = v8;
  id v14 = v7;
  dispatch_sync(v12, block);
}

- (void)_uikbrtInsert:()_UIKBRTObjectArray after:
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"_UIKBRTObjectArray.m", 156, @"Invalid parameter not satisfying: %@", @"entry" object file lineNumber description];
  }
  v9 = [v7 owner];

  if (v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"_UIKBRTObjectArray.m", 157, @"Invalid parameter not satisfying: %@", @"entry.owner == nil" object file lineNumber description];

    if (!v8) {
      goto LABEL_7;
    }
  }
  else if (!v8)
  {
    goto LABEL_7;
  }
  v10 = [v8 owner];

  if (v10 != a1)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"_UIKBRTObjectArray.m", 158, @"Invalid parameter not satisfying: %@", @"previousEntry == nil || previousEntry.owner == self" object file lineNumber description];
  }
LABEL_7:
  if ([a1 count] && objc_msgSend(a1, "_listContainsOrderedItems"))
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"_UIKBRTObjectArray.m", 160, @"Invalid parameter not satisfying: %@", @"!self._listContainsOrderedItems" object file lineNumber description];
  }
  v12 = [a1 _syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_after___block_invoke;
  block[3] = &unk_1E52ED900;
  id v19 = v7;
  v20 = a1;
  id v21 = v8;
  uint64_t v22 = a2;
  id v13 = v8;
  id v14 = v7;
  dispatch_sync(v12, block);
}

- (void)_uikbrtInsert:()_UIKBRTObjectArray beforeItemPassingTest:
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"_UIKBRTObjectArray.m", 178, @"Invalid parameter not satisfying: %@", @"entry" object file lineNumber description];
  }
  v9 = [v7 owner];

  if (v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"_UIKBRTObjectArray.m", 179, @"Invalid parameter not satisfying: %@", @"entry.owner == nil" object file lineNumber description];

    if (v8) {
      goto LABEL_5;
    }
  }
  else if (v8)
  {
    goto LABEL_5;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, a1, @"_UIKBRTObjectArray.m", 180, @"Invalid parameter not satisfying: %@", @"test" object file lineNumber description];

LABEL_5:
  if ([a1 count])
  {
    if (([a1 _listContainsOrderedItems] & 1) == 0)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, a1, @"_UIKBRTObjectArray.m", 182, @"Invalid parameter not satisfying: %@", @"self._listContainsOrderedItems" object file lineNumber description];
    }
  }
  else
  {
    objc_msgSend(a1, "_set_listContainsOrderedItems:", 1);
  }
  v11 = [a1 _syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__NSMutableArray__UIKBRTObjectArray___uikbrtInsert_beforeItemPassingTest___block_invoke;
  block[3] = &unk_1E52E3298;
  id v18 = v7;
  id v19 = a1;
  id v20 = v8;
  id v12 = v8;
  id v13 = v7;
  dispatch_sync(v11, block);
}

- (void)_uikbrtRemove:()_UIKBRTObjectArray
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"_UIKBRTObjectArray.m", 208, @"Invalid parameter not satisfying: %@", @"entry" object file lineNumber description];
  }
  v6 = [v5 owner];

  if (v6 != a1)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"_UIKBRTObjectArray.m", 209, @"Invalid parameter not satisfying: %@", @"entry.owner == self" object file lineNumber description];
  }
  id v7 = [a1 _syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NSMutableArray__UIKBRTObjectArray___uikbrtRemove___block_invoke;
  block[3] = &unk_1E52D9F98;
  void block[4] = a1;
  id v12 = v5;
  id v8 = v5;
  dispatch_sync(v7, block);
}

@end