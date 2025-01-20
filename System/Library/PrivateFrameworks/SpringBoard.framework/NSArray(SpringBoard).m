@interface NSArray(SpringBoard)
- (id)sb_arrayByAddingOrMovingObject:()SpringBoard;
- (id)sb_arrayByInsertingOrMovingObject:()SpringBoard toIndex:;
- (id)sb_arrayByRemovingObject:()SpringBoard;
- (id)sb_arrayByRemovingObjects:()SpringBoard;
@end

@implementation NSArray(SpringBoard)

- (id)sb_arrayByInsertingOrMovingObject:()SpringBoard toIndex:
{
  id v6 = a3;
  v7 = (void *)[a1 mutableCopy];
  uint64_t v8 = [a1 indexOfObject:v6];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
    [v7 removeObjectAtIndex:v8];
  }
  [v7 insertObject:v6 atIndex:a4];

  return v7;
}

- (id)sb_arrayByAddingOrMovingObject:()SpringBoard
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  uint64_t v6 = [a1 indexOfObject:v4];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 removeObjectAtIndex:v6];
  }
  [v5 addObject:v4];

  return v5;
}

- (id)sb_arrayByRemovingObject:()SpringBoard
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"NSArray+SpringBoard.m", 40, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
  }
  if ([a1 containsObject:v5])
  {
    id v6 = (id)[a1 mutableCopy];
    [v6 removeObject:v5];
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

- (id)sb_arrayByRemovingObjects:()SpringBoard
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (id)[a1 mutableCopy];
    [v5 removeObjectsInArray:v4];
  }
  else
  {
    id v5 = a1;
  }

  return v5;
}

@end