@interface NSOrderedSet(IC)
- (BOOL)ic_containsObjectPassingTest:()IC;
- (id)ic_objectPassingTest:()IC;
- (id)ic_objectsMovedFromOrderedSet:()IC;
- (uint64_t)ic_containsObjectMatchingPredicate:()IC;
@end

@implementation NSOrderedSet(IC)

- (id)ic_objectPassingTest:()IC
{
  uint64_t v2 = objc_msgSend(a1, "indexOfObjectPassingTest:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = [a1 objectAtIndex:v2];
  }
  return v3;
}

- (BOOL)ic_containsObjectPassingTest:()IC
{
  v1 = objc_msgSend(a1, "ic_objectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)ic_containsObjectMatchingPredicate:()IC
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__NSOrderedSet_IC__ic_containsObjectMatchingPredicate___block_invoke;
  v8[3] = &unk_2640CDF48;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = objc_msgSend(a1, "ic_containsObjectPassingTest:", v8);

  return v6;
}

- (id)ic_objectsMovedFromOrderedSet:()IC
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  uint64_t v6 = (void *)[a1 mutableCopy];
  [v6 intersectOrderedSet:v4];
  v7 = (void *)[v4 mutableCopy];
  [v7 intersectOrderedSet:a1];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__NSOrderedSet_IC__ic_objectsMovedFromOrderedSet___block_invoke;
  v12[3] = &unk_2640CE230;
  id v8 = v6;
  id v13 = v8;
  v15 = v16;
  id v9 = v5;
  id v14 = v9;
  [v7 enumerateObjectsUsingBlock:v12];
  v10 = (void *)[v9 copy];

  _Block_object_dispose(v16, 8);
  return v10;
}

@end