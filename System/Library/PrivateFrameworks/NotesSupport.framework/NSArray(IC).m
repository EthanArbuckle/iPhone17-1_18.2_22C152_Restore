@interface NSArray(IC)
+ (id)ic_arrayFromNonNilObject:()IC;
- (BOOL)ic_allSatisfy:()IC;
- (BOOL)ic_containsObjectOfClass:()IC;
- (BOOL)ic_containsObjectPassingTest:()IC;
- (BOOL)ic_indexIsValid:()IC;
- (ICTuple)ic_arrayBySplittingIntoTwoArraysWithMaxPrefixCount:()IC;
- (ICTuple)ic_arrayBySplittingIntoTwoArraysWithMaxPrefixCount:()IC prefixMatchingPredicate:;
- (id)ic_arrayByAddingNonNilObject:()IC;
- (id)ic_arrayByAddingObjectsFromNonNilArray:()IC;
- (id)ic_arrayByGroupingIntoArraysWithMaxCount:()IC;
- (id)ic_compactMap:()IC;
- (id)ic_dictionaryByHashingContentWithFunction:()IC;
- (id)ic_firstObjectConformingToProtocol:()IC;
- (id)ic_firstObjectOfClass:()IC;
- (id)ic_flatMap:()IC;
- (id)ic_map:()IC;
- (id)ic_objectAfter:()IC wrap:;
- (id)ic_objectBefore:()IC wrap:;
- (id)ic_objectPassingTest:()IC;
- (id)ic_objectsConformingToProtocol:()IC;
- (id)ic_objectsOfClass:()IC;
- (id)ic_objectsPassingTest:()IC;
- (id)ic_randomObject;
- (id)ic_reduceStartingWithState:()IC usingBlock:;
- (uint64_t)ic_containsObjectMatchingPredicate:()IC;
- (uint64_t)ic_objectAfter:()IC;
- (uint64_t)ic_objectBefore:()IC;
- (uint64_t)ic_subarrayFromIndex:()IC;
- (unint64_t)ic_indexOfSortedObject:()IC insertionIndex:usingComparator:;
@end

@implementation NSArray(IC)

- (id)ic_firstObjectOfClass:()IC
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__NSArray_IC__ic_firstObjectOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24lu32l8;
  v5[4] = a3;
  v3 = objc_msgSend(a1, "ic_objectPassingTest:", v5);
  return v3;
}

- (BOOL)ic_containsObjectPassingTest:()IC
{
  v1 = objc_msgSend(a1, "ic_objectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

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

+ (id)ic_arrayFromNonNilObject:()IC
{
  v7[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v7[0] = a3;
    v3 = (void *)MEMORY[0x263EFF8C0];
    id v4 = a3;
    v5 = [v3 arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFFA68];
  }
  return v5;
}

- (id)ic_objectsPassingTest:()IC
{
  uint64_t v2 = objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v3 = [a1 objectsAtIndexes:v2];

  return v3;
}

- (id)ic_map:()IC
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __22__NSArray_IC__ic_map___block_invoke;
  v13 = &unk_2640CDFB8;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)ic_compactMap:()IC
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __29__NSArray_IC__ic_compactMap___block_invoke;
  v13 = &unk_2640CDFB8;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (BOOL)ic_containsObjectOfClass:()IC
{
  v1 = objc_msgSend(a1, "ic_firstObjectOfClass:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)ic_randomObject
{
  BOOL v2 = (void *)[a1 count];
  if (v2)
  {
    BOOL v2 = objc_msgSend(a1, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(a1, "count")));
  }
  return v2;
}

- (uint64_t)ic_containsObjectMatchingPredicate:()IC
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__NSArray_IC__ic_containsObjectMatchingPredicate___block_invoke;
  v8[3] = &unk_2640CDF48;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = objc_msgSend(a1, "ic_containsObjectPassingTest:", v8);

  return v6;
}

- (id)ic_objectsOfClass:()IC
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__NSArray_IC__ic_objectsOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24lu32l8;
  v5[4] = a3;
  v3 = objc_msgSend(a1, "ic_objectsPassingTest:", v5);
  return v3;
}

- (id)ic_objectsConformingToProtocol:()IC
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__NSArray_IC__ic_objectsConformingToProtocol___block_invoke;
  v8[3] = &unk_2640CDF48;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = objc_msgSend(a1, "ic_objectsPassingTest:", v8);

  return v6;
}

- (id)ic_firstObjectConformingToProtocol:()IC
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__NSArray_IC__ic_firstObjectConformingToProtocol___block_invoke;
  v8[3] = &unk_2640CDF48;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = objc_msgSend(a1, "ic_objectPassingTest:", v8);

  return v6;
}

- (ICTuple)ic_arrayBySplittingIntoTwoArraysWithMaxPrefixCount:()IC
{
  if ([a1 count] <= a3)
  {
    v8 = [ICTuple alloc];
    id v7 = [(ICTuple *)v8 initWithFirstObject:a1 secondObject:MEMORY[0x263EFFA68]];
  }
  else
  {
    id v5 = objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    uint64_t v6 = objc_msgSend(a1, "subarrayWithRange:", a3, objc_msgSend(a1, "count") - a3);
    id v7 = [[ICTuple alloc] initWithFirstObject:v5 secondObject:v6];
  }
  return v7;
}

- (ICTuple)ic_arrayBySplittingIntoTwoArraysWithMaxPrefixCount:()IC prefixMatchingPredicate:
{
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
  v8 = [MEMORY[0x263EFF980] arrayWithArray:a1];
  if ([v7 count] < a3)
  {
    while ([v8 count])
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __90__NSArray_IC__ic_arrayBySplittingIntoTwoArraysWithMaxPrefixCount_prefixMatchingPredicate___block_invoke;
      v14[3] = &unk_2640CDF90;
      id v15 = v6;
      uint64_t v9 = [v8 indexOfObjectPassingTest:v14];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {

        break;
      }
      uint64_t v10 = v9;
      uint64_t v11 = [v8 objectAtIndexedSubscript:v9];
      [v8 removeObjectAtIndex:v10];
      [v7 addObject:v11];

      if ([v7 count] >= a3) {
        break;
      }
    }
  }
  v12 = [[ICTuple alloc] initWithFirstObject:v7 secondObject:v8];

  return v12;
}

- (id)ic_arrayByGroupingIntoArraysWithMaxCount:()IC
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
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
          uint64_t v14 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];

          [v5 addObject:v14];
          uint64_t v9 = (void *)v14;
        }
        [v9 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v5;
}

- (unint64_t)ic_indexOfSortedObject:()IC insertionIndex:usingComparator:
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

- (BOOL)ic_indexIsValid:()IC
{
  return (a3 & 0x8000000000000000) == 0 && [a1 count] > a3;
}

- (uint64_t)ic_objectBefore:()IC
{
  return objc_msgSend(a1, "ic_objectBefore:wrap:", a3, 0);
}

- (uint64_t)ic_objectAfter:()IC
{
  return objc_msgSend(a1, "ic_objectAfter:wrap:", a3, 0);
}

- (id)ic_objectBefore:()IC wrap:
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

- (id)ic_objectAfter:()IC wrap:
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

- (id)ic_arrayByAddingNonNilObject:()IC
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

- (id)ic_arrayByAddingObjectsFromNonNilArray:()IC
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

- (id)ic_flatMap:()IC
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  char v12 = __26__NSArray_IC__ic_flatMap___block_invoke;
  unint64_t v13 = &unk_2640CDFB8;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  int v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)ic_reduceStartingWithState:()IC usingBlock:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__6;
  long long v19 = __Block_byref_object_dispose__6;
  id v8 = v6;
  id v20 = v8;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__NSArray_IC__ic_reduceStartingWithState_usingBlock___block_invoke;
  v12[3] = &unk_2640CDFE0;
  id v14 = &v15;
  id v9 = v7;
  id v13 = v9;
  [a1 enumerateObjectsUsingBlock:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (uint64_t)ic_subarrayFromIndex:()IC
{
  uint64_t v5 = [a1 count] - a3;
  return objc_msgSend(a1, "subarrayWithRange:", a3, v5);
}

- (id)ic_dictionaryByHashingContentWithFunction:()IC
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        char v12 = v4[2](v4, v11);
        if (v12) {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12, (void)v15);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = (void *)[v5 copy];
  return v13;
}

- (BOOL)ic_allSatisfy:()IC
{
  BOOL v2 = objc_msgSend(a1, "ic_objectsPassingTest:");
  uint64_t v3 = [v2 count];
  BOOL v4 = v3 == [a1 count];

  return v4;
}

@end