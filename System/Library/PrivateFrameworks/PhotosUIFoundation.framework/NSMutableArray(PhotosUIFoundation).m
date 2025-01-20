@interface NSMutableArray(PhotosUIFoundation)
- (id)px_popFirst;
- (id)px_popFirstPassingTest:()PhotosUIFoundation;
- (id)px_popLast;
- (id)px_popRange:()PhotosUIFoundation;
- (void)px_addObject:()PhotosUIFoundation removingFirstObjectIfNeededToKeepMaximumCount:;
- (void)px_addObjectIfNotNil:()PhotosUIFoundation;
- (void)px_insertObjects:()PhotosUIFoundation atIndex:;
@end

@implementation NSMutableArray(PhotosUIFoundation)

- (id)px_popLast
{
  if ([a1 count])
  {
    uint64_t v2 = [a1 count] - 1;
    v3 = [a1 objectAtIndex:v2];
    [a1 removeObjectAtIndex:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)px_popFirst
{
  if ([a1 count])
  {
    uint64_t v2 = [a1 objectAtIndex:0];
    [a1 removeObjectAtIndex:0];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (void)px_addObject:()PhotosUIFoundation removingFirstObjectIfNeededToKeepMaximumCount:
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    while ([a1 count] >= a4)
      [a1 removeObjectAtIndex:0];
    [a1 addObject:v7];
    id v6 = v7;
  }
}

- (void)px_addObjectIfNotNil:()PhotosUIFoundation
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (void)px_insertObjects:()PhotosUIFoundation atIndex:
{
  id v6 = (objc_class *)MEMORY[0x263F088D0];
  id v7 = a3;
  id v8 = (id)objc_msgSend([v6 alloc], "initWithIndexesInRange:", a4, objc_msgSend(v7, "count"));
  [a1 insertObjects:v7 atIndexes:v8];
}

- (id)px_popFirstPassingTest:()PhotosUIFoundation
{
  uint64_t v2 = objc_msgSend(a1, "indexOfObjectPassingTest:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = v2;
    v3 = [a1 objectAtIndex:v2];
    [a1 removeObjectAtIndex:v4];
  }

  return v3;
}

- (id)px_popRange:()PhotosUIFoundation
{
  id v7 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:");
  id v8 = [a1 objectsAtIndexes:v7];

  objc_msgSend(a1, "removeObjectsInRange:", a3, a4);

  return v8;
}

@end