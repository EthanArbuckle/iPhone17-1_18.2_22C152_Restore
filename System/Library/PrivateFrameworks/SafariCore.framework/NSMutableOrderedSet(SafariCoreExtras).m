@interface NSMutableOrderedSet(SafariCoreExtras)
- (BOOL)safari_containsObjectPassingTest:()SafariCoreExtras;
- (BOOL)safari_isSortedInAscendingOrDescendingOrderUsingComparator:()SafariCoreExtras;
- (void)safari_insertObject:()SafariCoreExtras inSortedOrderUsingComparator:;
@end

@implementation NSMutableOrderedSet(SafariCoreExtras)

- (void)safari_insertObject:()SafariCoreExtras inSortedOrderUsingComparator:
{
  id v13 = a3;
  v6 = a4;
  uint64_t v7 = [a1 count];
  if (v7)
  {
    unint64_t v8 = v7;
    unint64_t v9 = 0;
    while (1)
    {
      unint64_t v10 = (v9 + v8) >> 1;
      v11 = [a1 objectAtIndex:v10];
      uint64_t v12 = v6[2](v6, v11, v13);

      switch(v12)
      {
        case -1:
          unint64_t v9 = v10 + 1;
          break;
        case 1:
          unint64_t v8 = (v9 + v8) >> 1;
          break;
        case 0:
          unint64_t v9 = v10 + 1;
          goto LABEL_12;
      }
      if (v9 >= v8) {
        goto LABEL_12;
      }
    }
  }
  unint64_t v9 = 0;
LABEL_12:
  [a1 insertObject:v13 atIndex:v9];
}

- (BOOL)safari_isSortedInAscendingOrDescendingOrderUsingComparator:()SafariCoreExtras
{
  v4 = a3;
  unint64_t v5 = [a1 count];
  if (v5 >= 3)
  {
    unint64_t v7 = v5;
    unint64_t v8 = [a1 objectAtIndex:1];
    unint64_t v9 = [a1 objectAtIndex:0];
    uint64_t v10 = v4[2](v4, v9, v8);
    id v11 = v8;

    uint64_t v12 = [a1 objectAtIndex:2];

    if (v4[2](v4, v11, v12) == v10)
    {
      uint64_t v13 = 3;
      while (1)
      {
        unint64_t v14 = v13;
        if (v7 == v13) {
          break;
        }
        id v15 = v12;

        uint64_t v12 = [a1 objectAtIndex:v14];

        uint64_t v16 = v4[2](v4, v15, v12);
        uint64_t v13 = v14 + 1;
        id v11 = v15;
        if (v16 != v10) {
          goto LABEL_10;
        }
      }
      id v15 = v11;
LABEL_10:
      BOOL v6 = v14 >= v7;
      id v11 = v15;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)safari_containsObjectPassingTest:()SafariCoreExtras
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__NSMutableOrderedSet_SafariCoreExtras__safari_containsObjectPassingTest___block_invoke;
  v8[3] = &unk_1E615B370;
  id v9 = v4;
  id v5 = v4;
  BOOL v6 = [a1 indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

@end