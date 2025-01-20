@interface NSMutableArray(PKMutableArrayAdditions)
- (void)pk_removeObjectsPassingTest:()PKMutableArrayAdditions;
- (void)pk_safelyAddObjectsFromArray:()PKMutableArrayAdditions;
- (void)safelyAddObject:()PKMutableArrayAdditions;
@end

@implementation NSMutableArray(PKMutableArrayAdditions)

- (void)safelyAddObject:()PKMutableArrayAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (void)pk_safelyAddObjectsFromArray:()PKMutableArrayAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObjectsFromArray:");
  }
  return a1;
}

- (void)pk_removeObjectsPassingTest:()PKMutableArrayAdditions
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__NSMutableArray_PKMutableArrayAdditions__pk_removeObjectsPassingTest___block_invoke;
    v7[3] = &unk_1E56DC6D0;
    id v8 = v4;
    v6 = [a1 indexesOfObjectsPassingTest:v7];
    [a1 removeObjectsAtIndexes:v6];
  }
}

@end