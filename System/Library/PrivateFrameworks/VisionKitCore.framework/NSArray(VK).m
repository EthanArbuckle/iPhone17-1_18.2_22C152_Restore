@interface NSArray(VK)
+ (id)vk_arrayFromNonNilObject:()VK;
+ (void)heapsAlgorithm:()VK k:result:;
- (BOOL)vk_containsObjectPassingTest:()VK;
- (BOOL)vk_indexIsValid:()VK;
- (id)vk_arrayByAddingNonNilObject:()VK;
- (id)vk_arrayByAddingObjectsFromNonNilArray:()VK;
- (id)vk_arrayByGroupingIntoArraysWithMaxCount:()VK;
- (id)vk_arrayFromReplacingObject:()VK withObject:;
- (id)vk_compactMap:()VK;
- (id)vk_firstObjectOfClass:()VK;
- (id)vk_flatMap:()VK;
- (id)vk_generateAllPermutations;
- (id)vk_map:()VK;
- (id)vk_objectAfter:()VK wrap:;
- (id)vk_objectBefore:()VK wrap:;
- (id)vk_objectPassingTest:()VK;
- (id)vk_objectsConformingToProtocol:()VK;
- (id)vk_objectsOfClass:()VK;
- (id)vk_objectsPassingTest:()VK;
- (id)vk_randomObject;
- (id)vk_randomizedArray;
- (id)vk_safeObjectAtIndex:()VK;
- (uint64_t)vk_countOfObjectsPassingTest:()VK;
- (uint64_t)vk_objectAfter:()VK;
- (uint64_t)vk_objectBefore:()VK;
- (unint64_t)vk_indexOfSortedObject:()VK insertionIndex:usingComparator:;
@end

@implementation NSArray(VK)

+ (id)vk_arrayFromNonNilObject:()VK
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7[0] = a3;
    v3 = (void *)MEMORY[0x1E4F1C978];
    id v4 = a3;
    v5 = [v3 arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (id)vk_randomObject
{
  v2 = (void *)[a1 count];
  if (v2)
  {
    v2 = objc_msgSend(a1, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(a1, "count")));
  }
  return v2;
}

- (id)vk_randomizedArray
{
  v1 = (void *)[a1 mutableCopy];
  objc_msgSend(v1, "vk_randomize");
  v2 = (void *)[v1 copy];

  return v2;
}

- (id)vk_generateAllPermutations
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = (void *)[a1 mutableCopy];
  objc_msgSend((id)objc_opt_class(), "heapsAlgorithm:k:result:", v3, objc_msgSend(v3, "count"), v2);
  id v4 = (void *)[v2 copy];

  return v4;
}

+ (void)heapsAlgorithm:()VK k:result:
{
  id v12 = a3;
  id v8 = a5;
  if (a4 == 1)
  {
    v9 = (void *)[v12 copy];
    [v8 addObject:v9];
  }
  else if (a4 >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      [a1 heapsAlgorithm:v12 k:a4 - 1 result:v8];
      if (a4) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = v10;
      }
      [v12 exchangeObjectAtIndex:v11 withObjectAtIndex:a4 - 1];
      ++v10;
    }
    while (a4 != v10);
  }
}

- (id)vk_objectPassingTest:()VK
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

- (uint64_t)vk_countOfObjectsPassingTest:()VK
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v14;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v5);
      }
      v9 += v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * v11), v8 + v11, &v17);
      if (v17) {
        break;
      }
      if (v7 == ++v11)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
        v8 += v11;
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)vk_arrayFromReplacingObject:()VK withObject:
{
  id v6 = a4;
  id v7 = a1;
  uint64_t v8 = [v7 indexOfObject:a3];
  if (v6)
  {
    uint64_t v9 = v8;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = (void *)[v7 mutableCopy];
      [v10 replaceObjectAtIndex:v9 withObject:v6];
      uint64_t v11 = [v10 copy];

      id v7 = (id)v11;
    }
  }
  else
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "newObject", "-[NSArray(VK) vk_arrayFromReplacingObject:withObject:]", 0, 0, @"vk_arrayFromReplacingObject, Trying to replace an object with nil.");
  }

  return v7;
}

- (BOOL)vk_containsObjectPassingTest:()VK
{
  v1 = objc_msgSend(a1, "vk_objectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)vk_objectsPassingTest:()VK
{
  BOOL v2 = objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v3 = [a1 objectsAtIndexes:v2];

  return v3;
}

- (id)vk_objectsOfClass:()VK
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__NSArray_VK__vk_objectsOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24lu32l8;
  v5[4] = a3;
  v3 = objc_msgSend(a1, "vk_objectsPassingTest:", v5);
  return v3;
}

- (id)vk_firstObjectOfClass:()VK
{
  v1 = objc_msgSend(a1, "vk_objectsOfClass:");
  BOOL v2 = [v1 firstObject];

  return v2;
}

- (id)vk_safeObjectAtIndex:()VK
{
  if ((a3 & 0x8000000000000000) != 0)
  {
    id v6 = 0;
  }
  else
  {
    if ([a1 count] <= a3)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [a1 objectAtIndexedSubscript:a3];
    }
  }
  return v6;
}

- (id)vk_objectsConformingToProtocol:()VK
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__NSArray_VK__vk_objectsConformingToProtocol___block_invoke;
  v8[3] = &unk_1E6BF39C8;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "vk_objectsPassingTest:", v8);

  return v6;
}

- (id)vk_arrayByGroupingIntoArraysWithMaxCount:()VK
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        unint64_t v13 = objc_msgSend(v9, "count", (void)v16);
        if (!v9 || v13 >= a3)
        {
          uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];

          [v5 addObject:v14];
          id v9 = (void *)v14;
        }
        [v9 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v5;
}

- (unint64_t)vk_indexOfSortedObject:()VK insertionIndex:usingComparator:
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(a1, "count"), 1280, v9);

  if (a4) {
    *a4 = v10;
  }
  if (v10 >= [a1 count]
    || ([a1 objectAtIndexedSubscript:v10],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isEqual:v8],
        v11,
        (v12 & 1) == 0))
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (BOOL)vk_indexIsValid:()VK
{
  return (a3 & 0x8000000000000000) == 0 && [a1 count] > a3;
}

- (uint64_t)vk_objectBefore:()VK
{
  return objc_msgSend(a1, "vk_objectBefore:wrap:", a3, 0);
}

- (uint64_t)vk_objectAfter:()VK
{
  return objc_msgSend(a1, "vk_objectAfter:wrap:", a3, 0);
}

- (id)vk_objectBefore:()VK wrap:
{
  uint64_t v6 = objc_msgSend(a1, "indexOfObject:");
  uint64_t v7 = 0;
  if (v6) {
    int v8 = 1;
  }
  else {
    int v8 = a4;
  }
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8)
  {
    uint64_t v7 = objc_msgSend(a1, "objectAtIndexedSubscript:", (v6 + objc_msgSend(a1, "count") - 1) % (unint64_t)objc_msgSend(a1, "count"));
  }
  return v7;
}

- (id)vk_objectAfter:()VK wrap:
{
  uint64_t v6 = objc_msgSend(a1, "indexOfObject:");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v7 = v6, (a4 & 1) == 0) && v6 == [a1 count] - 1)
  {
    int v8 = 0;
  }
  else
  {
    int v8 = objc_msgSend(a1, "objectAtIndexedSubscript:", (v7 + 1) % (unint64_t)objc_msgSend(a1, "count"));
  }
  return v8;
}

- (id)vk_arrayByAddingNonNilObject:()VK
{
  id v4 = a1;
  id v5 = v4;
  if (a3)
  {
    uint64_t v6 = [v4 arrayByAddingObject:a3];

    id v5 = (void *)v6;
  }
  return v5;
}

- (id)vk_arrayByAddingObjectsFromNonNilArray:()VK
{
  id v4 = a1;
  id v5 = v4;
  if (a3)
  {
    uint64_t v6 = [v4 arrayByAddingObjectsFromArray:a3];

    id v5 = (void *)v6;
  }
  return v5;
}

- (id)vk_compactMap:()VK
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5 == 1)
  {
    uint64_t v6 = [a1 firstObject];
    v4[2](v4, v6, 0, 1);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v16[0] = v7;
      int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    }
    else
    {
      int v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v9 = v5;
    unint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __29__NSArray_VK__vk_compactMap___block_invoke;
    v12[3] = &unk_1E6BF39F0;
    uint64_t v14 = v4;
    uint64_t v15 = v9;
    id v13 = v10;
    id v7 = v10;
    [a1 enumerateObjectsUsingBlock:v12];
    int v8 = (void *)[v7 copy];
  }
  return v8;
}

- (id)vk_map:()VK
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5 == 1)
  {
    id v6 = [a1 firstObject];
    id v7 = v4[2](v4, v6, 0, 1);
    v16[0] = v7;
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  else
  {
    uint64_t v9 = v5;
    unint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __22__NSArray_VK__vk_map___block_invoke;
    v12[3] = &unk_1E6BF39F0;
    uint64_t v14 = v4;
    uint64_t v15 = v9;
    id v13 = v10;
    id v6 = v10;
    [a1 enumerateObjectsUsingBlock:v12];
    int v8 = (void *)[v6 copy];

    id v7 = v14;
  }

  return v8;
}

- (id)vk_flatMap:()VK
{
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5 == 1)
  {
    id v6 = [a1 firstObject];
    id v7 = v4[2](v4, v6, 0, 1);
  }
  else
  {
    uint64_t v8 = v5;
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __26__NSArray_VK__vk_flatMap___block_invoke;
    v11[3] = &unk_1E6BF39F0;
    id v13 = v4;
    uint64_t v14 = v8;
    id v12 = v9;
    id v6 = v9;
    [a1 enumerateObjectsUsingBlock:v11];
    id v7 = (void *)[v6 copy];
  }
  return v7;
}

@end