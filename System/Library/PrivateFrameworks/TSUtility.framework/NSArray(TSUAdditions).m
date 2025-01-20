@interface NSArray(TSUAdditions)
+ (id)arrayWithCGFloats:()TSUAdditions count:;
+ (id)arrayWithInts:()TSUAdditions count:;
- (BOOL)tsu_containsObjectIdenticalTo:()TSUAdditions;
- (id)tsu_arrayByMappingObjectsUsingBlock:()TSUAdditions;
- (id)tsu_mutableArrayByMakingObjectsPerformSelector:()TSUAdditions;
- (uint64_t)initWithCGFloats:()TSUAdditions count:;
- (uint64_t)initWithInts:()TSUAdditions count:;
- (uint64_t)tsu_arrayByTransformingWithBlock:()TSUAdditions;
- (uint64_t)tsu_arrayOfObjectsAtIndexes:()TSUAdditions options:passingTest:;
- (uint64_t)tsu_arrayOfObjectsPassingTest:()TSUAdditions;
- (uint64_t)tsu_firstObjectPassingTest:()TSUAdditions;
- (uint64_t)tsu_indexOfSmallestObject;
- (uint64_t)tsu_makeObjectsPerformSelector:()TSUAdditions withObject:withObject:;
- (uint64_t)tsu_makeObjectsPerformSelectorIfImplemented:()TSUAdditions;
- (uint64_t)tsu_makeObjectsPerformSelectorIfImplemented:()TSUAdditions withObject:;
- (uint64_t)tsu_objectAfterObjectIdenticalTo:()TSUAdditions;
- (uint64_t)tsu_objectBeforeObjectIdenticalTo:()TSUAdditions;
- (void)tsu_arrayByFlattening;
- (void)tsu_arrayByRemovingObjectsIdenticalToObjectsInArray:()TSUAdditions;
- (void)tsu_arrayByRemovingObjectsInArray:()TSUAdditions;
- (void)tsu_arrayByReversingOrder;
- (void)tsu_arrayWithObjectsInSet:()TSUAdditions;
- (void)tsu_enumerateSnapshotObjectsUsingBlock:()TSUAdditions;
- (void)tsu_indexesOfObjects:()TSUAdditions;
- (void)tsu_intersectionWithArray:()TSUAdditions;
- (void)tsu_map:()TSUAdditions;
@end

@implementation NSArray(TSUAdditions)

- (uint64_t)initWithCGFloats:()TSUAdditions count:
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (count < 0x11)
  {
    if (!count) {
      return [a1 initWithObjects:v11 count:0];
    }
    v7 = v11;
LABEL_5:
    uint64_t v8 = 0;
    do
    {
      *(void *)&v7[8 * v8] = [NSNumber numberWithDouble:*(double *)(a3 + 8 * v8)];
      ++v8;
    }
    while (count != v8);
    uint64_t v9 = [a1 initWithObjects:v7 count:count];
    if (v7 != v11) {
      free(v7);
    }
    return v9;
  }
  v7 = malloc_type_calloc(count, 8uLL, 0x80040B8603338uLL);
  if (v7) {
    goto LABEL_5;
  }
  return [a1 initWithObjects:0 count:count];
}

+ (id)arrayWithCGFloats:()TSUAdditions count:
{
  v4 = (void *)[[a1 alloc] initWithCGFloats:a3 count:a4];
  return v4;
}

- (uint64_t)initWithInts:()TSUAdditions count:
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (count < 0x11)
  {
    if (!count) {
      return [a1 initWithObjects:v11 count:0];
    }
    v7 = v11;
LABEL_5:
    uint64_t v8 = 0;
    do
    {
      *(void *)&v7[8 * v8] = [NSNumber numberWithInt:*(unsigned int *)(a3 + 4 * v8)];
      ++v8;
    }
    while (count != v8);
    uint64_t v9 = [a1 initWithObjects:v7 count:count];
    if (v7 != v11) {
      free(v7);
    }
    return v9;
  }
  v7 = malloc_type_calloc(count, 8uLL, 0x80040B8603338uLL);
  if (v7) {
    goto LABEL_5;
  }
  return [a1 initWithObjects:0 count:count];
}

+ (id)arrayWithInts:()TSUAdditions count:
{
  v4 = (void *)[[a1 alloc] initWithInts:a3 count:a4];
  return v4;
}

- (uint64_t)tsu_objectBeforeObjectIdenticalTo:()TSUAdditions
{
  uint64_t v2 = objc_msgSend(a1, "indexOfObjectIdenticalTo:");
  if (!v2 || v2 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  return [a1 objectAtIndex:v2 - 1];
}

- (uint64_t)tsu_objectAfterObjectIdenticalTo:()TSUAdditions
{
  uint64_t v2 = objc_msgSend(a1, "indexOfObjectIdenticalTo:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v3 = v2 + 1;
  if (v2 + 1 >= (unint64_t)[a1 count]) {
    return 0;
  }
  return [a1 objectAtIndex:v3];
}

- (uint64_t)tsu_indexOfSmallestObject
{
  uint64_t v2 = [a1 count];
  if (!v2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = 0;
  v5 = 0;
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v7 = (void *)[a1 objectAtIndex:v4];
    uint64_t v8 = v7;
    if (!v5 || [v7 compare:v5] == -1)
    {
      uint64_t v6 = v4;
      v5 = v8;
    }
    ++v4;
  }
  while (v3 != v4);
  return v6;
}

- (void)tsu_indexesOfObjects:()TSUAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263F089C8] indexSet];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = [a1 indexOfObject:*(void *)(*((void *)&v12 + 1) + 8 * v9)];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
          [v5 addIndex:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v5;
}

- (uint64_t)tsu_makeObjectsPerformSelector:()TSUAdditions withObject:withObject:
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(a1);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) performSelector:a3 withObject:a4 withObject:a5];
      }
      while (v10 != v12);
      uint64_t result = [a1 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v10 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)tsu_makeObjectsPerformSelectorIfImplemented:()TSUAdditions withObject:
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(a1);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 performSelector:a3 withObject:a4];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t result = [a1 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v8 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)tsu_makeObjectsPerformSelectorIfImplemented:()TSUAdditions
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a1);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 performSelector:a3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [a1 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

- (void)tsu_arrayWithObjectsInSet:()TSUAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263EFF980] array];
  if (a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [a1 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(a1);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if ([a3 containsObject:v10]) {
            [v5 addObject:v10];
          }
        }
        uint64_t v7 = [a1 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

- (void)tsu_intersectionWithArray:()TSUAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263EFF980] array];
  if (a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [a1 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(a1);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if ([a3 indexOfObject:v10] != 0x7FFFFFFFFFFFFFFFLL) {
            [v5 addObject:v10];
          }
        }
        uint64_t v7 = [a1 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

- (void)tsu_arrayByRemovingObjectsInArray:()TSUAdditions
{
  uint64_t v4 = (void *)[MEMORY[0x263EFF980] arrayWithArray:a1];
  [v4 removeObjectsInArray:a3];
  return v4;
}

- (void)tsu_arrayByRemovingObjectsIdenticalToObjectsInArray:()TSUAdditions
{
  uint64_t v5 = [a3 count];
  if (!v5) {
    return a1;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = a1;
  do
  {
    uint64_t v10 = [a3 objectAtIndex:v7];
    uint64_t v11 = [v9 indexOfObjectIdenticalTo:v10];
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t i = v11; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v9 indexOfObjectIdenticalTo:v10])
      {
        if (!v8)
        {
          uint64_t v9 = (void *)[MEMORY[0x263EFF980] arrayWithArray:a1];
          uint64_t v8 = v9;
        }
        [v8 removeObjectAtIndex:i];
      }
    }
    ++v7;
  }
  while (v7 != v6);
  return v9;
}

- (void)tsu_arrayByReversingOrder
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = objc_msgSend(a1, "reverseObjectEnumerator", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [v2 addObject:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  return v2;
}

- (id)tsu_mutableArrayByMakingObjectsPerformSelector:()TSUAdditions
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithResultsOfPerformingSelector:a3 onObjectsFromArray:a1];
  return v3;
}

- (void)tsu_map:()TSUAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a1);
        }
        uint64_t v10 = (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, *(void *)(*((void *)&v12 + 1) + 8 * v9));
        if (v10) {
          [v5 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a1 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v5;
}

- (void)tsu_enumerateSnapshotObjectsUsingBlock:()TSUAdditions
{
  id v4 = (id)[a1 copy];
  [v4 enumerateObjectsUsingBlock:a3];
}

- (uint64_t)tsu_firstObjectPassingTest:()TSUAdditions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [a1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_4:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(a1);
    }
    uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, v9)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [a1 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v9 = 0;
      if (v6) {
        goto LABEL_4;
      }
      return v9;
    }
  }
}

- (uint64_t)tsu_arrayOfObjectsPassingTest:()TSUAdditions
{
  uint64_t v2 = objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  return [a1 objectsAtIndexes:v2];
}

- (id)tsu_arrayByMappingObjectsUsingBlock:()TSUAdditions
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [a1 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(a1);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, v10);
        if (v11)
        {
          [v5 addObject:v11];
        }
        else
        {
          id v12 = +[TSUAssertionHandler currentHandler];
          uint64_t v13 = [NSString stringWithUTF8String:"-[NSArray(TSUAdditions) tsu_arrayByMappingObjectsUsingBlock:]"];
          [v12 handleFailureInFunction:v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSArrayAdditions.m"), 293, @"Block returned a nil object for %@.", v10 file lineNumber description];
        }
      }
      uint64_t v7 = [a1 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  return (id)[v5 copy];
}

- (uint64_t)tsu_arrayOfObjectsAtIndexes:()TSUAdditions options:passingTest:
{
  uint64_t v2 = objc_msgSend(a1, "indexesOfObjectsAtIndexes:options:passingTest:");
  return [a1 objectsAtIndexes:v2];
}

- (uint64_t)tsu_arrayByTransformingWithBlock:()TSUAdditions
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__NSArray_TSUAdditions__tsu_arrayByTransformingWithBlock___block_invoke;
  v7[3] = &unk_26462A368;
  v7[4] = v5;
  v7[5] = a3;
  [a1 enumerateObjectsUsingBlock:v7];
  return v5;
}

- (BOOL)tsu_containsObjectIdenticalTo:()TSUAdditions
{
  return objc_msgSend(a1, "indexOfObjectIdenticalTo:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)tsu_arrayByFlattening
{
  uint64_t v2 = (void *)[MEMORY[0x263EFF980] array];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = __Block_byref_object_copy__0;
  v5[4] = __Block_byref_object_dispose__0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__NSArray_TSUAdditions__tsu_arrayByFlattening__block_invoke;
  v4[3] = &unk_26462A390;
  v4[4] = v5;
  v5[5] = v4;
  __46__NSArray_TSUAdditions__tsu_arrayByFlattening__block_invoke((uint64_t)v4, a1, v2);
  _Block_object_dispose(v5, 8);
  return v2;
}

@end