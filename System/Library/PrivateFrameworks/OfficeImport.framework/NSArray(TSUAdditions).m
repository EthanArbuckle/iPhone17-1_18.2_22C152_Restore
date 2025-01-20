@interface NSArray(TSUAdditions)
+ (id)tsu_arrayWithCGFloats:()TSUAdditions count:;
+ (id)tsu_arrayWithInts:()TSUAdditions count:;
+ (id)tsu_arrayWithUIntegers:()TSUAdditions count:;
+ (uint64_t)tsu_arrayByUnioningArray:()TSUAdditions withArray:;
+ (uint64_t)tsu_arrayWithNonNilObject:()TSUAdditions;
- (id)tsu_arrayByMappingObjectsUsingBlock:()TSUAdditions;
- (id)tsu_localizedList;
- (uint64_t)tsu_arrayByRemovingFirstObject;
- (uint64_t)tsu_arrayByTransformingWithBlock:()TSUAdditions;
- (uint64_t)tsu_arrayOfObjectsPassingTest:()TSUAdditions;
- (uint64_t)tsu_containsObjectPassingTest:()TSUAdditions;
- (uint64_t)tsu_firstObjectPassingTest:()TSUAdditions;
- (uint64_t)tsu_indexOfSmallestObject;
- (uint64_t)tsu_initWithCGFloats:()TSUAdditions count:;
- (uint64_t)tsu_initWithInts:()TSUAdditions count:;
- (uint64_t)tsu_initWithUIntegers:()TSUAdditions count:;
- (uint64_t)tsu_isHomogeneousForClass:()TSUAdditions;
- (uint64_t)tsu_objectPriorToObject:()TSUAdditions;
- (uint64_t)tsu_onlyObject;
- (uint64_t)tsu_rangeCheckedObjectAtIndex:()TSUAdditions;
- (uint64_t)tsu_uniqueObjects;
- (void)tsu_arrayByAddingNonContainedObjectsFromArray:()TSUAdditions;
- (void)tsu_arrayByFlattening;
- (void)tsu_arrayByRemovingObjectsIdenticalToObjectsInArray:()TSUAdditions;
- (void)tsu_arrayByReversingOrder;
- (void)tsu_arrayWithObjectsInSet:()TSUAdditions;
- (void)tsu_enumerateSnapshotObjectsUsingBlock:()TSUAdditions;
- (void)tsu_indexesOfObjects:()TSUAdditions;
- (void)tsu_intersectionWithArray:()TSUAdditions;
@end

@implementation NSArray(TSUAdditions)

- (uint64_t)tsu_initWithCGFloats:()TSUAdditions count:
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

+ (id)tsu_arrayWithCGFloats:()TSUAdditions count:
{
  v4 = objc_msgSend([a1 alloc], "tsu_initWithCGFloats:count:", a3, a4);
  return v4;
}

- (uint64_t)tsu_initWithInts:()TSUAdditions count:
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

+ (id)tsu_arrayWithInts:()TSUAdditions count:
{
  v4 = objc_msgSend([a1 alloc], "tsu_initWithInts:count:", a3, a4);
  return v4;
}

+ (uint64_t)tsu_arrayByUnioningArray:()TSUAdditions withArray:
{
  if (a3) {
    return objc_msgSend(a3, "tsu_arrayByAddingNonContainedObjectsFromArray:", a4);
  }
  else {
    return a4;
  }
}

- (uint64_t)tsu_initWithUIntegers:()TSUAdditions count:
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
      *(void *)&v7[8 * v8] = [NSNumber numberWithInteger:*(void *)(a3 + 8 * v8)];
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

+ (id)tsu_arrayWithUIntegers:()TSUAdditions count:
{
  v4 = objc_msgSend([a1 alloc], "tsu_initWithUIntegers:count:", a3, a4);
  return v4;
}

- (uint64_t)tsu_rangeCheckedObjectAtIndex:()TSUAdditions
{
  if ([a1 count] <= a3) {
    return 0;
  }
  return [a1 objectAtIndex:a3];
}

- (uint64_t)tsu_objectPriorToObject:()TSUAdditions
{
  uint64_t v2 = objc_msgSend(a1, "indexOfObject:");
  if (!v2 || v2 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  return [a1 objectAtIndex:v2 - 1];
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

- (void)tsu_arrayByAddingNonContainedObjectsFromArray:()TSUAdditions
{
  if (a3 && (uint64_t v5 = [a3 count]) != 0)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = [a3 objectAtIndex:v7];
      if (([a1 containsObject:v9] & 1) == 0)
      {
        if (!v8)
        {
          uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count") + v6);
          [v8 addObjectsFromArray:a1];
        }
        [v8 addObject:v9];
      }
      ++v7;
      --v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v8) {
    return v8;
  }
  else {
    return a1;
  }
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

- (uint64_t)tsu_arrayByRemovingFirstObject
{
  if (![a1 count])
  {
    uint64_t v2 = [NSString stringWithUTF8String:"-[NSArray(TSUAdditions) tsu_arrayByRemovingFirstObject]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSArrayAdditions.m"], 231, 1, "Can't remove the first object of an empty array!");
    TSUCrash((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Can't remove the first object of an empty array!", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[NSArray(TSUAdditions) tsu_arrayByRemovingFirstObject]");
  }
  long long v10 = (void *)[MEMORY[0x263EFF980] arrayWithArray:a1];
  [v10 removeObjectAtIndex:0];
  long long v11 = objc_opt_class();
  return [v11 arrayWithArray:v10];
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

- (uint64_t)tsu_containsObjectPassingTest:()TSUAdditions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a1);
        }
        if ((*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, *(void *)(*((void *)&v9 + 1) + 8 * i))) {
          return 1;
        }
      }
      uint64_t v6 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t result = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return result;
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

- (uint64_t)tsu_arrayOfObjectsPassingTest:()TSUAdditions
{
  if (a3)
  {
    uint64_t v3 = a1;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __55__NSArray_TSUAdditions__tsu_arrayOfObjectsPassingTest___block_invoke;
    v9[3] = &unk_264D60D88;
    v9[4] = a3;
    uint64_t v4 = (void *)[a1 indexesOfObjectsPassingTest:v9];
    if (!v4) {
      return [MEMORY[0x263EFF8C0] array];
    }
    uint64_t v5 = v4;
    if (![v4 count]) {
      return [MEMORY[0x263EFF8C0] array];
    }
    if (objc_msgSend(v5, "containsIndexesInRange:", 0, objc_msgSend(v3, "count"))) {
      return (uint64_t)v3;
    }
    return [v3 objectsAtIndexes:v5];
  }
  long long v7 = (void *)MEMORY[0x263EFF8C0];
  return [v7 array];
}

- (uint64_t)tsu_arrayByTransformingWithBlock:()TSUAdditions
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__NSArray_TSUAdditions__tsu_arrayByTransformingWithBlock___block_invoke;
  v7[3] = &unk_264D60DB0;
  v7[4] = v5;
  v7[5] = a3;
  [a1 enumerateObjectsUsingBlock:v7];
  return v5;
}

- (id)tsu_arrayByMappingObjectsUsingBlock:()TSUAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [a1 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(a1);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, v8);
        if (v9)
        {
          [v13 addObject:v9];
        }
        else
        {
          uint64_t v10 = [NSString stringWithUTF8String:"-[NSArray(TSUAdditions) tsu_arrayByMappingObjectsUsingBlock:]"];
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSArrayAdditions.m"], 335, 0, "Block returned a nil object for %@.", v8);
          +[OITSUAssertionHandler logBacktraceThrottled];
        }
      }
      uint64_t v5 = [a1 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  return (id)[v13 copy];
}

- (void)tsu_arrayByFlattening
{
  uint64_t v2 = (void *)[MEMORY[0x263EFF980] array];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = __Block_byref_object_copy__1;
  v5[4] = __Block_byref_object_dispose__1;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__NSArray_TSUAdditions__tsu_arrayByFlattening__block_invoke;
  v4[3] = &unk_264D60DD8;
  v4[4] = v5;
  v5[5] = v4;
  __46__NSArray_TSUAdditions__tsu_arrayByFlattening__block_invoke((uint64_t)v4, a1, v2);
  _Block_object_dispose(v5, 8);
  return v2;
}

- (uint64_t)tsu_uniqueObjects
{
  return [MEMORY[0x263EFFA08] setWithArray:a1];
}

- (uint64_t)tsu_onlyObject
{
  if ((unint64_t)[a1 count] >= 2)
  {
    uint64_t v2 = [NSString stringWithUTF8String:"-[NSArray(TSUAdditions) tsu_onlyObject]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSArrayAdditions.m"], 365, 0, "As this method returns the only object in the array, it only makes sense if the array has at most one object.");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  return [a1 firstObject];
}

- (id)tsu_localizedList
{
  uint64_t v2 = (void *)[MEMORY[0x263F089D8] string];
  uint64_t v3 = [a1 count];
  if (v3)
  {
    unint64_t v4 = v3;
    uint64_t v5 = 2;
    for (unint64_t i = v3; i; --i)
    {
      [v2 appendFormat:@"%@", objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", v5 - 2), "description")];
      if (i < 3)
      {
        if (v4 >= 3 && i == 2)
        {
          long long v7 = (void *)SFUBundle();
          uint64_t v8 = @"TSU_LIST_SEPARATOR_FINAL";
          uint64_t v9 = @", and ";
        }
        else
        {
          if (v4 != 2 || v5 != 2) {
            goto LABEL_12;
          }
          long long v7 = (void *)SFUBundle();
          uint64_t v8 = @"TSU_LIST_SEPARATOR_TWO_ITEMS";
          uint64_t v9 = @" and ";
        }
      }
      else
      {
        long long v7 = (void *)SFUBundle();
        uint64_t v8 = @"TSU_LIST_SEPARATOR";
        uint64_t v9 = @", ";
      }
      [v2 appendFormat:@"%@", objc_msgSend(v7, "localizedStringForKey:value:table:", v8, v9, @"TSUtility"];
LABEL_12:
      ++v5;
    }
  }
  uint64_t v10 = (void *)[v2 copy];
  return v10;
}

+ (uint64_t)tsu_arrayWithNonNilObject:()TSUAdditions
{
  v4[1] = *MEMORY[0x263EF8340];
  if (!a3) {
    return MEMORY[0x263EFFA68];
  }
  v4[0] = a3;
  return [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
}

@end