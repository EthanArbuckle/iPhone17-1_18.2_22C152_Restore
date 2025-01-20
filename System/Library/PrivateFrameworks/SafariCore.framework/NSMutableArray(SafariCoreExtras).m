@interface NSMutableArray(SafariCoreExtras)
- (id)safari_takeFirstObject;
- (void)safari_addObjectUnlessNil:()SafariCoreExtras;
- (void)safari_addObjectsFromArrayUnlessNil:()SafariCoreExtras;
- (void)safari_insertObject:()SafariCoreExtras afterObject:;
- (void)safari_insertObject:()SafariCoreExtras inSortedOrderUsingComparator:;
- (void)safari_insertObjects:()SafariCoreExtras afterObject:;
- (void)safari_removeObjectsAtIndexes:()SafariCoreExtras withOffset:startingAtIndex:;
- (void)safari_removeObjectsPassingTest:()SafariCoreExtras;
- (void)safari_setObject:()SafariCoreExtras atIndex:withPaddingObject:;
@end

@implementation NSMutableArray(SafariCoreExtras)

- (void)safari_addObjectUnlessNil:()SafariCoreExtras
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (void)safari_addObjectsFromArrayUnlessNil:()SafariCoreExtras
{
  if (a3) {
    return objc_msgSend(a1, "addObjectsFromArray:");
  }
  return a1;
}

- (void)safari_insertObjects:()SafariCoreExtras afterObject:
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [a1 indexOfObject:v6];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
    uint64_t v8 = v7 + 1;
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v8, objc_msgSend(v10, "count"));
  [a1 insertObjects:v10 atIndexes:v9];

LABEL_6:
}

- (void)safari_setObject:()SafariCoreExtras atIndex:withPaddingObject:
{
  id v12 = a3;
  id v8 = a5;
  unint64_t v9 = [a1 count];
  if (v9 < a4)
  {
    unint64_t v10 = v9;
    do
      [a1 setObject:v8 atIndexedSubscript:v10++];
    while (a4 != v10);
  }
  if (v12) {
    id v11 = v12;
  }
  else {
    id v11 = v8;
  }
  [a1 setObject:v11 atIndexedSubscript:a4];
}

- (void)safari_removeObjectsPassingTest:()SafariCoreExtras
{
  objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 removeObjectsAtIndexes:v2];
}

- (void)safari_removeObjectsAtIndexes:()SafariCoreExtras withOffset:startingAtIndex:
{
  id v8 = a3;
  if (v8)
  {
    id v11 = v8;
    BOOL v9 = [a1 count] > a5;
    id v8 = v11;
    if (v9)
    {
      unint64_t v10 = (void *)[v11 mutableCopy];
      [v10 shiftIndexesStartingAtIndex:a5 by:a4];
      [a1 removeObjectsAtIndexes:v10];

      id v8 = v11;
    }
  }
}

- (void)safari_insertObject:()SafariCoreExtras afterObject:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v10 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = [v6 arrayWithObjects:&v10 count:1];

  objc_msgSend(a1, "safari_insertObjects:afterObject:", v9, v7, v10, v11);
}

- (void)safari_insertObject:()SafariCoreExtras inSortedOrderUsingComparator:
{
  id v6 = a4;
  id v8 = a3;
  uint64_t v7 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(a1, "count"), 1024, v6);

  [a1 insertObject:v8 atIndex:v7];
}

- (id)safari_takeFirstObject
{
  id v2 = [a1 firstObject];
  if ([a1 count]) {
    [a1 removeObjectAtIndex:0];
  }
  return v2;
}

@end