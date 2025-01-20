@interface NSSet(TSUAdditions)
+ (id)tsu_setWithSelectors:()TSUAdditions;
+ (uint64_t)tsu_intersectionOfSets:()TSUAdditions;
+ (uint64_t)tsu_set:()TSUAdditions isEqualToSet:;
- (id)tsu_setByMappingObjectsUsingBlock:()TSUAdditions;
- (uint64_t)tsu_containsObjectIdenticalTo:()TSUAdditions;
- (uint64_t)tsu_isHomogeneousForClass:()TSUAdditions;
- (uint64_t)tsu_onlyObject;
- (uint64_t)tsu_setByIntersectingSet:()TSUAdditions;
- (uint64_t)tsu_setBySubtractingSet:()TSUAdditions;
- (uint64_t)tsu_sortedArray;
@end

@implementation NSSet(TSUAdditions)

+ (id)tsu_setWithSelectors:()TSUAdditions
{
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v14 = (const char **)&a9;
  if (a3)
  {
    do
    {
      [v10 addObject:NSStringFromSelector(a3)];
      v11 = v14++;
      a3 = *v11;
    }
    while (*v11);
  }
  id v12 = (id)[v10 copy];

  return v12;
}

+ (uint64_t)tsu_set:()TSUAdditions isEqualToSet:
{
  if (a3 == (void *)a4) {
    return 1;
  }
  uint64_t v11 = v5;
  uint64_t v12 = v4;
  uint64_t v8 = a4;
  v9 = a3;
  if (!a3)
  {
    v9 = (void *)[MEMORY[0x263EFFA08] set];
    if (v8) {
      goto LABEL_4;
    }
LABEL_9:
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFFA08], "set", v11, v12, v6);
    goto LABEL_4;
  }
  if (!a4) {
    goto LABEL_9;
  }
LABEL_4:
  return [v9 isEqualToSet:v8];
}

+ (uint64_t)tsu_intersectionOfSets:()TSUAdditions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v4) {
    return [MEMORY[0x263EFF9C0] set];
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v12;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(a3);
      }
      uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
      if (v6) {
        [v6 intersectSet:v9];
      }
      else {
        uint64_t v6 = (void *)[MEMORY[0x263EFF9C0] setWithSet:v9];
      }
    }
    uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v5);
  if (!v6) {
    return [MEMORY[0x263EFF9C0] set];
  }
  return (uint64_t)v6;
}

- (uint64_t)tsu_containsObjectIdenticalTo:()TSUAdditions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a1);
        }
        if (*(void *)(*((void *)&v9 + 1) + 8 * v8) == a3) {
          return 1;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (uint64_t)tsu_sortedArray
{
  v1 = (void *)[a1 allObjects];
  return [v1 sortedArrayUsingSelector:sel_compare_];
}

- (id)tsu_setByMappingObjectsUsingBlock:()TSUAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"-[NSSet(TSUAdditions) tsu_setByMappingObjectsUsingBlock:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSSetAdditions.m"], 86, 0, "Invalid parameter not satisfying: %{public}s", "block != nil");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  long long v13 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(a1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [a1 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a1);
        }
        uint64_t v10 = (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v10)
        {
          [v13 addObject:v10];
        }
        else
        {
          uint64_t v11 = [NSString stringWithUTF8String:"-[NSSet(TSUAdditions) tsu_setByMappingObjectsUsingBlock:]"];
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSSetAdditions.m"], 96, 0, "Block returned a nil object.");
          +[OITSUAssertionHandler logBacktraceThrottled];
        }
      }
      uint64_t v7 = [a1 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  return (id)[v13 copy];
}

- (uint64_t)tsu_isHomogeneousForClass:()TSUAdditions
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [a1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(a1);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return 0;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [a1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (uint64_t)tsu_onlyObject
{
  if ((unint64_t)[a1 count] >= 2)
  {
    uint64_t v2 = [NSString stringWithUTF8String:"-[NSSet(TSUAdditions) tsu_onlyObject]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSSetAdditions.m"], 117, 0, "As this method returns the only object in the set, it only makes sense if the set has at most one object.");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  return [a1 anyObject];
}

- (uint64_t)tsu_setByIntersectingSet:()TSUAdditions
{
  uint64_t v4 = (void *)[MEMORY[0x263EFF9C0] setWithSet:a1];
  [v4 intersectSet:a3];
  uint64_t v5 = objc_opt_class();
  return [v5 setWithSet:v4];
}

- (uint64_t)tsu_setBySubtractingSet:()TSUAdditions
{
  uint64_t v4 = (void *)[MEMORY[0x263EFF9C0] setWithSet:a1];
  [v4 minusSet:a3];
  uint64_t v5 = objc_opt_class();
  return [v5 setWithSet:v4];
}

@end