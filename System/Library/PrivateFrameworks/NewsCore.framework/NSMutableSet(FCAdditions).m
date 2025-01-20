@interface NSMutableSet(FCAdditions)
- (void)fc_removeObjectsFromArray:()FCAdditions;
- (void)fc_safelyAddObject:()FCAdditions;
- (void)fc_safelyAddObjects:()FCAdditions;
- (void)fc_safelyIntersectSet:()FCAdditions;
- (void)fc_safelyMinusSet:()FCAdditions;
- (void)fc_safelyRemoveObject:()FCAdditions;
- (void)fc_safelyUnionSet:()FCAdditions;
@end

@implementation NSMutableSet(FCAdditions)

- (void)fc_removeObjectsFromArray:()FCAdditions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [a1 removeObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)fc_safelyAddObject:()FCAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (void)fc_safelyUnionSet:()FCAdditions
{
  if (a3) {
    return objc_msgSend(a1, "unionSet:");
  }
  return a1;
}

- (void)fc_safelyAddObjects:()FCAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObjectsFromArray:");
  }
  return a1;
}

- (void)fc_safelyIntersectSet:()FCAdditions
{
  if (a3) {
    return objc_msgSend(a1, "intersectSet:");
  }
  return a1;
}

- (void)fc_safelyMinusSet:()FCAdditions
{
  if (a3) {
    return objc_msgSend(a1, "minusSet:");
  }
  return a1;
}

- (void)fc_safelyRemoveObject:()FCAdditions
{
  if (a3) {
    return objc_msgSend(a1, "removeObject:");
  }
  return a1;
}

@end