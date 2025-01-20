@interface NSArray(FCAdditions)
+ (id)fc_array:()FCAdditions;
+ (id)fc_arrayByAddingObjectsFromArray:()FCAdditions toArray:;
+ (id)fc_arrayByAddingObjectsFromArray:()FCAdditions toArray:inRelativeOrder:;
+ (id)fc_arrayByAddingUniqueObjectsFromArray:()FCAdditions toArray:;
+ (id)fc_generatedArrayWithCount:()FCAdditions generator:;
+ (void)fc_walkArray:()FCAdditions andArray:withBlock:;
- (BOOL)fc_containsObjectPassingTest:()FCAdditions;
- (BOOL)fc_containsObjectsWithValue:()FCAdditions forKey:;
- (BOOL)fc_isEqualToArray:()FCAdditions inRange:;
- (BOOL)fc_isSortedUsingComparator:()FCAdditions;
- (double)fc_cosineDistanceToArray:()FCAdditions;
- (double)fc_euclideanDistanceToArray:()FCAdditions;
- (double)fc_reduceArrayWithDouble:()FCAdditions block:;
- (id)fc_arrayByAddingNonContainedObjectsFromArray:()FCAdditions;
- (id)fc_arrayByCollectingObjectsWithBlock:()FCAdditions;
- (id)fc_arrayByFlattening;
- (id)fc_arrayByMergingAdjacentObjectsWithMergePolicy:()FCAdditions mergeBlock:;
- (id)fc_arrayByRemovingFirstObject;
- (id)fc_arrayByRemovingKeysInDictionary:()FCAdditions;
- (id)fc_arrayByRemovingObject:()FCAdditions;
- (id)fc_arrayByRemovingObjectIdenticalTo:()FCAdditions;
- (id)fc_arrayByRemovingObjectsAtIndexes:()FCAdditions;
- (id)fc_arrayByRemovingObjectsInArray:()FCAdditions;
- (id)fc_arrayByRemovingObjectsInRange:()FCAdditions;
- (id)fc_arrayByRemovingObjectsPassingTest:()FCAdditions;
- (id)fc_arrayByReplacingObjectAtIndex:()FCAdditions withObject:;
- (id)fc_arrayByReplacingObjectIdenticalTo:()FCAdditions withObject:;
- (id)fc_arrayByReplacingObjectsInRange:()FCAdditions withObject:;
- (id)fc_arrayByReversingObjects;
- (id)fc_arrayByTransformingWithBlock:()FCAdditions;
- (id)fc_arrayByTransformingWithBlockWithIndex:()FCAdditions;
- (id)fc_arrayOfObjectsFailingTest:()FCAdditions;
- (id)fc_arrayOfObjectsPassingTest:()FCAdditions;
- (id)fc_arraysByExcisingRange:()FCAdditions;
- (id)fc_arraysByPartitioningOnObjectsPassingTest:()FCAdditions;
- (id)fc_arraysByPartitioningWithBudget:()FCAdditions indicesOfOverBudgetObjects:appraiser:accumulator:comparator:;
- (id)fc_dictionaryOfSortedObjectsWithKeyBlock:()FCAdditions;
- (id)fc_dictionaryOfTransformedSortedObjectsWithKeyBlock:()FCAdditions valueBlock:;
- (id)fc_dictionaryWithKeyBlock:()FCAdditions;
- (id)fc_dictionaryWithKeyBlock:()FCAdditions valueBlock:;
- (id)fc_dictionaryWithKeySelector:()FCAdditions;
- (id)fc_dictionaryWithKeySelector:()FCAdditions valueSelector:;
- (id)fc_dictionaryWithValueBlock:()FCAdditions;
- (id)fc_diffAgainstSortedOrderedCollection:()FCAdditions usingComparator:;
- (id)fc_firstObjectFromIndex:()FCAdditions passingTest:;
- (id)fc_firstObjectOfClass:()FCAdditions;
- (id)fc_firstObjectPassingTest:()FCAdditions;
- (id)fc_firstObjectWithValue:()FCAdditions forKey:;
- (id)fc_indexesOfObjectsIdenticalTo:()FCAdditions;
- (id)fc_indexesOfObjectsPassingTest:()FCAdditions;
- (id)fc_lastObjectPassingTest:()FCAdditions;
- (id)fc_objectInSortedOrderedCollectionWithFeature:()FCAdditions usingFeatureProvider:comparator:;
- (id)fc_objectsOfMaxValueWithValueBlock:()FCAdditions comparator:;
- (id)fc_objectsOfMinValueWithValueBlock:()FCAdditions comparator:;
- (id)fc_onlyObject;
- (id)fc_orderedSetByTransformingWithBlock:()FCAdditions;
- (id)fc_randomObject;
- (id)fc_randomlyMergeWithArray:()FCAdditions;
- (id)fc_reduceArrayWithInitial:()FCAdditions block:;
- (id)fc_rotateElementsFromTheIndexOfSelectedItem:()FCAdditions;
- (id)fc_safeObjectAtIndex:()FCAdditions;
- (id)fc_setByCollectingObjectsWithBlock:()FCAdditions;
- (id)fc_setByTransformingWithBlock:()FCAdditions;
- (id)fc_setOfObjectsPassingTest:()FCAdditions;
- (id)fc_sortedArrayStartingWithElementsSatisfying:()FCAdditions sortedBy:;
- (id)fc_subarrayFromIndex:()FCAdditions withMaxCount:range:;
- (id)fc_subarrayInOrder:()FCAdditions relativeToIndex:inclusive:;
- (id)fc_subarrayInOrder:()FCAdditions relativeToIndex:withMaxCount:range:;
- (id)fc_subarrayToIndex:()FCAdditions withMaxCount:range:;
- (id)fc_subarrayUpToCountInclusive:()FCAdditions;
- (id)fc_subarrayWithPercentFromBeginning:()FCAdditions;
- (id)fc_subarrayWithPercentToEnd:()FCAdditions;
- (id)fc_uniqueByValueBlock:()FCAdditions;
- (uint64_t)fc_allObjectsPassTest:()FCAdditions;
- (uint64_t)fc_containsObjectsAtBack:()FCAdditions;
- (uint64_t)fc_containsObjectsAtFront:()FCAdditions;
- (uint64_t)fc_countOfObjectsPassingTest:()FCAdditions;
- (uint64_t)fc_distanceFromArray:()FCAdditions;
- (uint64_t)fc_expandIndex:()FCAdditions toIncludeAdjacentObjectsPassingTest:;
- (uint64_t)fc_indexOfFirstObjectWithValue:()FCAdditions forKey:;
- (uint64_t)fc_isEqualToArray:()FCAdditions;
- (uint64_t)fc_safeSubarrayWithCountFromBack:()FCAdditions;
- (uint64_t)fc_safeSubarrayWithCountFromFront:()FCAdditions;
- (uint64_t)fc_subarrayFromCount:()FCAdditions;
- (uint64_t)fc_subarrayFromIndex:()FCAdditions inclusive:;
- (uint64_t)fc_subarrayUpToIndex:()FCAdditions inclusive:;
- (uint64_t)fc_subarrayWithMaxCount:()FCAdditions;
- (uint64_t)fc_uniqueCount;
- (void)fc_enumerateIslandsOfCommonValuesForKeyBlock:()FCAdditions withBlock:;
- (void)fc_enumerateObjectsFromIndex:()FCAdditions usingBlock:;
- (void)fc_enumerateObjectsInReverse:()FCAdditions usingSkipAheadBlock:;
- (void)fc_enumerateObjectsPairwiseUsingBlock:()FCAdditions;
- (void)fc_enumerateSideBySideWithArray:()FCAdditions reverse:block:;
- (void)fc_splitArrayWithTest:()FCAdditions result:;
- (void)fc_subarrayWithCount:()FCAdditions result:;
- (void)fc_visitSubarraysWithMaxCount:()FCAdditions block:;
@end

@implementation NSArray(FCAdditions)

- (BOOL)fc_containsObjectPassingTest:()FCAdditions
{
  v1 = objc_msgSend(a1, "fc_firstObjectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)fc_firstObjectPassingTest:()FCAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a1;
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)fc_arrayByTransformingWithBlock:()FCAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__NSArray_FCAdditions__fc_arrayByTransformingWithBlock___block_invoke;
  v8[3] = &unk_1E5B585E0;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "fc_arrayByTransformingWithBlockWithIndex:", v8);

  return v6;
}

- (id)fc_arrayByTransformingWithBlockWithIndex:()FCAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__NSArray_FCAdditions__fc_arrayByTransformingWithBlockWithIndex___block_invoke;
  v11[3] = &unk_1E5B58590;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  v8 = v12;
  id v9 = v6;

  return v9;
}

- (uint64_t)fc_countOfObjectsPassingTest:()FCAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * i));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)fc_onlyObject
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a1 count] != 1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v4 = [NSString alloc];
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
    uint64_t v6 = (void *)[v4 initWithFormat:@"expected one element; got %@", v5];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[NSArray(FCAdditions) fc_onlyObject]";
    __int16 v9 = 2080;
    v10 = "NSArray+FCAdditions.m";
    __int16 v11 = 1024;
    int v12 = 260;
    __int16 v13 = 2114;
    long long v14 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  BOOL v2 = [a1 firstObject];
  return v2;
}

- (id)fc_arrayByRemovingObject:()FCAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithArray:a1];
  [v6 removeObject:v5];

  return v6;
}

- (void)fc_splitArrayWithTest:()FCAdditions result:
{
  id v6 = a3;
  uint64_t v7 = a4;
  uint64_t v8 = objc_opt_new();
  __int16 v9 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__NSArray_FCAdditions__fc_splitArrayWithTest_result___block_invoke;
  v13[3] = &unk_1E5B58748;
  id v15 = v8;
  id v16 = v6;
  id v14 = v9;
  id v10 = v8;
  id v11 = v9;
  id v12 = v6;
  [a1 enumerateObjectsUsingBlock:v13];
  v7[2](v7, v10, v11);
}

+ (id)fc_array:()FCAdditions
{
  v3 = a3;
  id v4 = objc_opt_new();
  if (v3) {
    v3[2](v3, v4);
  }
  id v5 = (void *)[v4 copy];
  id v6 = v5;
  if (!v5) {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v5;

  return v7;
}

- (id)fc_reduceArrayWithInitial:()FCAdditions block:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = a1;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  id v11 = v8;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v18;
    id v11 = v8;
    do
    {
      uint64_t v14 = 0;
      id v15 = v11;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v9);
        }
        id v11 = v7[2](v7, v15, *(void *)(*((void *)&v17 + 1) + 8 * v14));

        ++v14;
        id v15 = v11;
      }
      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v11;
}

- (id)fc_setByCollectingObjectsWithBlock:()FCAdditions
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "collectionBlock");
    *(_DWORD *)buf = 136315906;
    long long v20 = "-[NSArray(FCAdditions) fc_setByCollectingObjectsWithBlock:]";
    __int16 v21 = 2080;
    uint64_t v22 = "NSArray+FCAdditions.m";
    __int16 v23 = 1024;
    int v24 = 832;
    __int16 v25 = 2114;
    v26 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
        objc_msgSend(v5, "fc_safelyUnionSet:", v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)fc_dictionaryWithKeyBlock:()FCAdditions valueBlock:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "keyBlock");
    *(_DWORD *)buf = 136315906;
    v28 = "-[NSArray(FCAdditions) fc_dictionaryWithKeyBlock:valueBlock:]";
    __int16 v29 = 2080;
    v30 = "NSArray+FCAdditions.m";
    __int16 v31 = 1024;
    int v32 = 134;
    __int16 v33 = 2114;
    v34 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "valueBlock");
    *(_DWORD *)buf = 136315906;
    v28 = "-[NSArray(FCAdditions) fc_dictionaryWithKeyBlock:valueBlock:]";
    __int16 v29 = 2080;
    v30 = "NSArray+FCAdditions.m";
    __int16 v31 = 1024;
    int v32 = 135;
    __int16 v33 = 2114;
    v34 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  id v21 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = a1;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        long long v14 = v6[2](v6, v13);
        uint64_t v15 = v7[2](v7, v13);
        long long v16 = (void *)v15;
        if (v14) {
          BOOL v17 = v15 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17) {
          [v21 setObject:v15 forKeyedSubscript:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  return v21;
}

- (id)fc_dictionaryWithKeyBlock:()FCAdditions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block");
    *(_DWORD *)buf = 136315906;
    id v21 = "-[NSArray(FCAdditions) fc_dictionaryWithKeyBlock:]";
    __int16 v22 = 2080;
    long long v23 = "NSArray+FCAdditions.m";
    __int16 v24 = 1024;
    int v25 = 184;
    __int16 v26 = 2114;
    uint64_t v27 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
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
        uint64_t v12 = v4[2](v4, v11);
        if (v12) {
          [v5 setObject:v11 forKeyedSubscript:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)fc_subarrayUpToCountInclusive:()FCAdditions
{
  if ([a1 count] <= a3)
  {
    id v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (uint64_t)fc_subarrayWithMaxCount:()FCAdditions
{
  unint64_t v5 = [a1 count];
  if (v5 >= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = v5;
  }
  return objc_msgSend(a1, "fc_subarrayUpToCountInclusive:", v6);
}

- (id)fc_arrayOfObjectsPassingTest:()FCAdditions
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__NSArray_FCAdditions__fc_arrayOfObjectsPassingTest___block_invoke;
  v11[3] = &unk_1E5B58608;
  id v12 = v4;
  id v5 = v4;
  unint64_t v6 = [a1 indexesOfObjectsPassingTest:v11];
  uint64_t v7 = [v6 count];
  if (v7 == [a1 count])
  {
    uint64_t v8 = [a1 copy];
  }
  else
  {
    uint64_t v8 = [a1 objectsAtIndexes:v6];
  }
  uint64_t v9 = (void *)v8;

  return v9;
}

- (id)fc_setByTransformingWithBlock:()FCAdditions
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__NSArray_FCAdditions__fc_setByTransformingWithBlock___block_invoke;
  v11[3] = &unk_1E5B58590;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  uint64_t v8 = v12;
  id v9 = v6;

  return v9;
}

+ (id)fc_arrayByAddingObjectsFromArray:()FCAdditions toArray:
{
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 array];
  [v8 addObjectsFromArray:v6];

  [v8 addObjectsFromArray:v7];
  return v8;
}

- (id)fc_dictionaryWithKeySelector:()FCAdditions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
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
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = ((void (*)(void *, uint64_t))[v11 methodForSelector:a3])(v11, a3);
          if (v12) {
            [v5 setObject:v11 forKeyedSubscript:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "keySelector != NULL");
      *(_DWORD *)buf = 136315906;
      id v21 = "-[NSArray(FCAdditions) fc_dictionaryWithKeySelector:]";
      __int16 v22 = 2080;
      long long v23 = "NSArray+FCAdditions.m";
      __int16 v24 = 1024;
      int v25 = 109;
      __int16 v26 = 2114;
      uint64_t v27 = v14;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v5 = 0;
  }
  return v5;
}

- (id)fc_dictionaryOfSortedObjectsWithKeyBlock:()FCAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "keyBlock != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v9 = "-[NSArray(FCAdditions) fc_dictionaryOfSortedObjectsWithKeyBlock:]";
    __int16 v10 = 2080;
    uint64_t v11 = "NSArray+FCAdditions.m";
    __int16 v12 = 1024;
    int v13 = 223;
    __int16 v14 = 2114;
    long long v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = objc_msgSend(a1, "fc_dictionaryOfTransformedSortedObjectsWithKeyBlock:valueBlock:", v4, &__block_literal_global_130);

  return v5;
}

- (id)fc_dictionaryOfTransformedSortedObjectsWithKeyBlock:()FCAdditions valueBlock:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "keyBlock != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v28 = "-[NSArray(FCAdditions) fc_dictionaryOfTransformedSortedObjectsWithKeyBlock:valueBlock:]";
    __int16 v29 = 2080;
    v30 = "NSArray+FCAdditions.m";
    __int16 v31 = 1024;
    int v32 = 233;
    __int16 v33 = 2114;
    v34 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v21 = (void (**)(void, void))v7;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "valueBlock != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v28 = "-[NSArray(FCAdditions) fc_dictionaryOfTransformedSortedObjectsWithKeyBlock:valueBlock:]";
    __int16 v29 = 2080;
    v30 = "NSArray+FCAdditions.m";
    __int16 v31 = 1024;
    int v32 = 234;
    __int16 v33 = 2114;
    v34 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v8 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a1;
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        __int16 v14 = v6[2](v6, v13);
        if (v14)
        {
          long long v15 = [v8 objectForKeyedSubscript:v14];
          if (!v15)
          {
            long long v15 = objc_opt_new();
            [v8 setObject:v15 forKeyedSubscript:v14];
          }
          uint64_t v16 = v21[2](v21, v13);
          [v15 addObject:v16];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  return v8;
}

- (void)fc_visitSubarraysWithMaxCount:()FCAdditions block:
{
  uint64_t v13 = a4;
  uint64_t v6 = [a1 count];
  if (v6)
  {
    unint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = v13;
    do
    {
      uint64_t v10 = (void *)MEMORY[0x1A6260FD0](v9);
      if (v7 - v8 >= a3) {
        unint64_t v11 = a3;
      }
      else {
        unint64_t v11 = v7 - v8;
      }
      if (v13)
      {
        __int16 v12 = objc_msgSend(a1, "subarrayWithRange:", v8, v11);
        v13[2](v13, v12);
      }
      v8 += v11;
    }
    while (v8 < v7);
  }
}

- (id)fc_arrayByFlattening
{
  BOOL v2 = [MEMORY[0x1E4F1CA48] array];
  FCFlattenArrayToArray(a1, v2);
  return v2;
}

- (void)fc_enumerateObjectsPairwiseUsingBlock:()FCAdditions
{
}

- (void)fc_enumerateObjectsInReverse:()FCAdditions usingSkipAheadBlock:
{
  uint64_t v6 = a4;
  uint64_t v7 = [a1 count];
  uint64_t v8 = v7;
  char v14 = 0;
  if (a3)
  {
    uint64_t v9 = v7 - 1;
    if (v7 >= 1)
    {
      do
      {
        uint64_t v10 = [a1 objectAtIndexedSubscript:v9];
        v9 -= v6[2](v6, v10, v9, &v14);
      }
      while ((v9 & 0x8000000000000000) == 0 && !v14);
    }
  }
  else if (v7 >= 1)
  {
    uint64_t v11 = 0;
    do
    {
      __int16 v12 = [a1 objectAtIndexedSubscript:v11];
      v11 += v6[2](v6, v12, v11, &v14);
    }
    while (v11 < v8 && v14 == 0);
  }
}

- (void)fc_enumerateObjectsFromIndex:()FCAdditions usingBlock:
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28D60];
  id v7 = a4;
  objc_msgSend(v6, "indexSetWithIndexesInRange:", a3, objc_msgSend(a1, "count") - a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [a1 enumerateObjectsAtIndexes:v8 options:0 usingBlock:v7];
}

- (BOOL)fc_isSortedUsingComparator:()FCAdditions
{
  return isOrderedCollectionSorted(a1, a3);
}

- (id)fc_diffAgainstSortedOrderedCollection:()FCAdditions usingComparator:
{
  return diffSortedOrderedCollections(a3, a1, a4);
}

- (id)fc_objectInSortedOrderedCollectionWithFeature:()FCAdditions usingFeatureProvider:comparator:
{
  return findObjectWithFeatureInSortedOrderedCollection(a1, a3, a4, a5);
}

- (void)fc_enumerateSideBySideWithArray:()FCAdditions reverse:block:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = a5;
  if (v9)
  {
    if (v8)
    {
      if (a4)
      {
        uint64_t v10 = [a1 reverseObjectEnumerator];
        [v8 reverseObjectEnumerator];
      }
      else
      {
        uint64_t v10 = [a1 objectEnumerator];
        [v8 objectEnumerator];
      uint64_t v11 = };
      uint64_t v12 = [v10 nextObject];
      uint64_t v13 = [v11 nextObject];
      if (v12 | v13)
      {
        char v14 = (void *)v13;
        while (1)
        {
          buf[0] = 0;
          v9[2](v9, v12, v14, buf);
          if (buf[0]) {
            break;
          }
          uint64_t v15 = [v10 nextObject];

          uint64_t v16 = [v11 nextObject];

          char v14 = (void *)v16;
          uint64_t v12 = v15;
          if (!(v15 | v16)) {
            goto LABEL_14;
          }
        }
      }
LABEL_14:

      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block != nil");
    *(_DWORD *)buf = 136315906;
    long long v18 = "-[NSArray(FCAdditions) fc_enumerateSideBySideWithArray:reverse:block:]";
    __int16 v19 = 2080;
    long long v20 = "NSArray+FCAdditions.m";
    __int16 v21 = 1024;
    int v22 = 59;
    __int16 v23 = 2114;
    long long v24 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_15:
  }
}

- (id)fc_randomlyMergeWithArray:()FCAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count") + objc_msgSend(a1, "count"));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__NSArray_FCAdditions__fc_randomlyMergeWithArray___block_invoke;
  aBlock[3] = &unk_1E5B584F8;
  id v18 = v6;
  id v7 = v6;
  id v8 = _Block_copy(aBlock);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  char v14 = __50__NSArray_FCAdditions__fc_randomlyMergeWithArray___block_invoke_2;
  uint64_t v15 = &unk_1E5B58520;
  id v16 = v8;
  id v9 = v8;
  objc_msgSend(a1, "fc_enumerateSideBySideWithArray:reverse:block:", v5, 0, &v12);

  uint64_t v10 = objc_msgSend(v7, "copy", v12, v13, v14, v15);
  return v10;
}

- (id)fc_dictionaryWithKeySelector:()FCAdditions valueSelector:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "keySelector != NULL");
      *(_DWORD *)buf = 136315906;
      uint64_t v27 = "-[NSArray(FCAdditions) fc_dictionaryWithKeySelector:valueSelector:]";
      __int16 v28 = 2080;
      __int16 v29 = "NSArray+FCAdditions.m";
      __int16 v30 = 1024;
      int v31 = 155;
      __int16 v32 = 2114;
      __int16 v33 = v19;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (!a4)
      {
LABEL_18:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          long long v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "valueSelector != NULL");
          *(_DWORD *)buf = 136315906;
          uint64_t v27 = "-[NSArray(FCAdditions) fc_dictionaryWithKeySelector:valueSelector:]";
          __int16 v28 = 2080;
          __int16 v29 = "NSArray+FCAdditions.m";
          __int16 v30 = 1024;
          int v31 = 156;
          __int16 v32 = 2114;
          __int16 v33 = v20;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
      }
    }
    else if (!a4)
    {
      goto LABEL_18;
    }
    id v7 = 0;
    goto LABEL_21;
  }
  if (!a4) {
    goto LABEL_18;
  }
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = a1;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        char v14 = ((void (*)(void *, uint64_t))[v13 methodForSelector:a3])(v13, a3);
        uint64_t v15 = ((void (*)(void *, uint64_t))[v13 methodForSelector:a4])(v13, a4);
        id v16 = (void *)v15;
        if (v14) {
          BOOL v17 = v15 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17) {
          [v7 setObject:v15 forKeyedSubscript:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

LABEL_21:
  return v7;
}

- (id)fc_dictionaryWithValueBlock:()FCAdditions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    char v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block");
    *(_DWORD *)buf = 136315906;
    long long v21 = "-[NSArray(FCAdditions) fc_dictionaryWithValueBlock:]";
    __int16 v22 = 2080;
    long long v23 = "NSArray+FCAdditions.m";
    __int16 v24 = 1024;
    int v25 = 203;
    __int16 v26 = 2114;
    uint64_t v27 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
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
        id v11 = *(id *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = v4[2](v4, v11);
        if (v12) {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)fc_firstObjectFromIndex:()FCAdditions passingTest:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "testBlock");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[NSArray(FCAdditions) fc_firstObjectFromIndex:passingTest:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v15) = 279;
    WORD2(v15) = 2114;
    *(void *)((char *)&v15 + 6) = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v15 = __Block_byref_object_copy__55;
  *((void *)&v15 + 1) = __Block_byref_object_dispose__55;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__NSArray_FCAdditions__fc_firstObjectFromIndex_passingTest___block_invoke;
  v11[3] = &unk_1E5B58458;
  id v7 = v6;
  id v12 = v7;
  uint64_t v13 = buf;
  objc_msgSend(a1, "fc_enumerateObjectsFromIndex:usingBlock:", a3, v11);
  id v8 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v8;
}

- (id)fc_firstObjectWithValue:()FCAdditions forKey:
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__NSArray_FCAdditions__fc_firstObjectWithValue_forKey___block_invoke;
  v12[3] = &unk_1E5B58548;
  id v13 = v7;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = objc_msgSend(a1, "fc_firstObjectPassingTest:", v12);

  return v10;
}

- (id)fc_firstObjectOfClass:()FCAdditions
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__NSArray_FCAdditions__fc_firstObjectOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v5[4] = a3;
  v3 = objc_msgSend(a1, "fc_firstObjectPassingTest:", v5);
  return v3;
}

- (id)fc_lastObjectPassingTest:()FCAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11))
        {
          id v12 = v11;

          id v8 = v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)fc_randomObject
{
  BOOL v2 = (void *)[a1 count];
  if (v2)
  {
    BOOL v2 = objc_msgSend(a1, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(a1, "count")));
  }
  return v2;
}

- (uint64_t)fc_containsObjectsAtFront:()FCAdditions
{
  id v4 = a3;
  unint64_t v5 = [a1 count];
  if (v5 >= [v4 count])
  {
    uint64_t v7 = objc_msgSend(a1, "fc_safeSubarrayWithCountFromFront:", objc_msgSend(v4, "count"));
    uint64_t v6 = [v7 isEqualToArray:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)fc_containsObjectsAtBack:()FCAdditions
{
  id v4 = a3;
  unint64_t v5 = [a1 count];
  if (v5 >= [v4 count])
  {
    uint64_t v7 = objc_msgSend(a1, "fc_safeSubarrayWithCountFromBack:", objc_msgSend(v4, "count"));
    uint64_t v6 = [v7 isEqualToArray:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)fc_containsObjectsWithValue:()FCAdditions forKey:
{
  v1 = objc_msgSend(a1, "fc_firstObjectWithValue:forKey:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)fc_allObjectsPassTest:()FCAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__NSArray_FCAdditions__fc_allObjectsPassTest___block_invoke;
  v8[3] = &unk_1E5B555A8;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = objc_msgSend(a1, "fc_containsObjectPassingTest:", v8) ^ 1;

  return v6;
}

- (id)fc_objectsOfMaxValueWithValueBlock:()FCAdditions comparator:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__NSArray_FCAdditions__fc_objectsOfMaxValueWithValueBlock_comparator___block_invoke;
  v13[3] = &unk_1E5B585B8;
  void v13[4] = a1;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = objc_msgSend(v8, "fc_array:", v13);

  return v11;
}

- (id)fc_objectsOfMinValueWithValueBlock:()FCAdditions comparator:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__NSArray_FCAdditions__fc_objectsOfMinValueWithValueBlock_comparator___block_invoke;
  v13[3] = &unk_1E5B585B8;
  void v13[4] = a1;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = objc_msgSend(v8, "fc_array:", v13);

  return v11;
}

- (id)fc_setOfObjectsPassingTest:()FCAdditions
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__NSArray_FCAdditions__fc_setOfObjectsPassingTest___block_invoke;
  v11[3] = &unk_1E5B58590;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  id v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)fc_orderedSetByTransformingWithBlock:()FCAdditions
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__NSArray_FCAdditions__fc_orderedSetByTransformingWithBlock___block_invoke;
  v11[3] = &unk_1E5B58590;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  id v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)fc_arrayOfObjectsFailingTest:()FCAdditions
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__NSArray_FCAdditions__fc_arrayOfObjectsFailingTest___block_invoke;
  v11[3] = &unk_1E5B58608;
  id v12 = v4;
  id v5 = v4;
  id v6 = [a1 indexesOfObjectsPassingTest:v11];
  uint64_t v7 = [v6 count];
  if (v7 == [a1 count])
  {
    uint64_t v8 = [a1 copy];
  }
  else
  {
    uint64_t v8 = [a1 objectsAtIndexes:v6];
  }
  id v9 = (void *)v8;

  return v9;
}

- (id)fc_arrayByRemovingObjectIdenticalTo:()FCAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 arrayWithArray:a1];
  [v6 removeObjectIdenticalTo:v5];

  return v6;
}

- (id)fc_arrayByRemovingObjectsInArray:()FCAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 arrayWithArray:a1];
  [v6 removeObjectsInArray:v5];

  return v6;
}

- (id)fc_arrayByRemovingKeysInDictionary:()FCAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__NSArray_FCAdditions__fc_arrayByRemovingKeysInDictionary___block_invoke;
  v8[3] = &unk_1E5B54780;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "fc_arrayOfObjectsPassingTest:", v8);

  return v6;
}

- (id)fc_arrayByReplacingObjectIdenticalTo:()FCAdditions withObject:
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a3;
  id v9 = [v7 arrayWithArray:a1];
  uint64_t v10 = [a1 indexOfObjectIdenticalTo:v8];

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6) {
      [v9 replaceObjectAtIndex:v10 withObject:v6];
    }
    else {
      [v9 removeObjectAtIndex:v10];
    }
  }

  return v9;
}

- (id)fc_arrayByReplacingObjectAtIndex:()FCAdditions withObject:
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:a1];
  id v8 = v7;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && v6) {
    [v7 replaceObjectAtIndex:a3 withObject:v6];
  }

  return v8;
}

- (id)fc_arrayByRemovingFirstObject
{
  if ([a1 count])
  {
    objc_msgSend(a1, "fc_arrayByRemovingObjectsInRange:", 0, 1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

- (id)fc_arrayByRemovingObjectsInRange:()FCAdditions
{
  id v6 = [MEMORY[0x1E4F1CA48] arrayWithArray:a1];
  objc_msgSend(v6, "removeObjectsInRange:", a3, a4);
  return v6;
}

- (id)fc_arrayByRemovingObjectsAtIndexes:()FCAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 arrayWithArray:a1];
  [v6 removeObjectsAtIndexes:v5];

  return v6;
}

- (id)fc_arrayByRemovingObjectsPassingTest:()FCAdditions
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__NSArray_FCAdditions__fc_arrayByRemovingObjectsPassingTest___block_invoke;
  v9[3] = &unk_1E5B58608;
  id v5 = v4;
  id v10 = v5;
  id v6 = [a1 indexesOfObjectsPassingTest:v9];
  if ([v6 count])
  {
    id v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:a1];
    [v7 removeObjectsAtIndexes:v6];
  }
  else
  {
    id v7 = a1;
  }

  return v7;
}

- (id)fc_arrayByReplacingObjectsInRange:()FCAdditions withObject:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = a5;
  id v10 = [v8 arrayWithArray:a1];
  v13[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  objc_msgSend(v10, "replaceObjectsInRange:withObjectsFromArray:", a3, a4, v11);
  return v10;
}

- (id)fc_arraysByExcisingRange:()FCAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a3 + a4;
  unint64_t v7 = [a1 count];
  if (v7 < v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "maxRange <= count");
    *(_DWORD *)buf = 136315906;
    id v15 = "-[NSArray(FCAdditions) fc_arraysByExcisingRange:]";
    __int16 v16 = 2080;
    long long v17 = "NSArray+FCAdditions.m";
    __int16 v18 = 1024;
    int v19 = 673;
    __int16 v20 = 2114;
    long long v21 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v8 = objc_msgSend(a1, "subarrayWithRange:", 0, a3);
  v13[0] = v8;
  if (v7 == v6)
  {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v9 = objc_msgSend(a1, "subarrayWithRange:", v6, v7 - v6);
  }
  v13[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  if (v7 != v6) {

  }
  return v10;
}

- (id)fc_arraysByPartitioningOnObjectsPassingTest:()FCAdditions
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "testBlock");
    *(_DWORD *)buf = 136315906;
    long long v23 = "-[NSArray(FCAdditions) fc_arraysByPartitioningOnObjectsPassingTest:]";
    __int16 v24 = 2080;
    int v25 = "NSArray+FCAdditions.m";
    __int16 v26 = 1024;
    int v27 = 683;
    __int16 v28 = 2114;
    __int16 v29 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
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
        if (v4[2](v4, v12))
        {
          uint64_t v20 = v12;
          id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
          [v5 addObject:v13];

          id v9 = 0;
        }
        else
        {
          if (!v9)
          {
            id v9 = objc_opt_new();
            [v5 addObject:v9];
          }
          [v9 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v5;
}

- (id)fc_arraysByPartitioningWithBudget:()FCAdditions indicesOfOverBudgetObjects:appraiser:accumulator:comparator:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "budget");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[NSArray(FCAdditions) fc_arraysByPartitioningWithBudget:indicesOfOverBudgetObjects:appraiser:a"
                         "ccumulator:comparator:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v50) = 718;
    WORD2(v50) = 2114;
    *(void *)((char *)&v50 + 6) = v30;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!a4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "indicesOfOverBudgetObjectsOut");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[NSArray(FCAdditions) fc_arraysByPartitioningWithBudget:indicesOfOverBudgetObjects:appraiser:a"
                         "ccumulator:comparator:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v50) = 719;
    WORD2(v50) = 2114;
    *(void *)((char *)&v50 + 6) = v31;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "appraiser");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[NSArray(FCAdditions) fc_arraysByPartitioningWithBudget:indicesOfOverBudgetObjects:appraiser:a"
                         "ccumulator:comparator:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v50) = 720;
    WORD2(v50) = 2114;
    *(void *)((char *)&v50 + 6) = v32;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "accumulator");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[NSArray(FCAdditions) fc_arraysByPartitioningWithBudget:indicesOfOverBudgetObjects:appraiser:a"
                         "ccumulator:comparator:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v50) = 721;
    WORD2(v50) = 2114;
    *(void *)((char *)&v50 + 6) = v33;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "comparator");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[NSArray(FCAdditions) fc_arraysByPartitioningWithBudget:indicesOfOverBudgetObjects:appraiser:a"
                         "ccumulator:comparator:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v50) = 722;
    WORD2(v50) = 2114;
    *(void *)((char *)&v50 + 6) = v34;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  long long v16 = objc_opt_new();
  long long v17 = objc_opt_new();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v50 = __Block_byref_object_copy__55;
  *((void *)&v50 + 1) = __Block_byref_object_dispose__55;
  id v51 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__55;
  v47[4] = __Block_byref_object_dispose__55;
  id v48 = &unk_1EF8D80A0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __118__NSArray_FCAdditions__fc_arraysByPartitioningWithBudget_indicesOfOverBudgetObjects_appraiser_accumulator_comparator___block_invoke;
  aBlock[3] = &unk_1E5B58630;
  id v18 = v15;
  id v46 = v18;
  id v35 = v12;
  id v45 = v35;
  long long v19 = _Block_copy(aBlock);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __118__NSArray_FCAdditions__fc_arraysByPartitioningWithBudget_indicesOfOverBudgetObjects_appraiser_accumulator_comparator___block_invoke_2;
  v36[3] = &unk_1E5B58680;
  id v20 = v13;
  id v39 = v20;
  id v21 = v19;
  id v40 = v21;
  uint64_t v22 = a1;
  id v23 = v16;
  id v37 = v23;
  id v24 = v17;
  id v38 = v24;
  v42 = buf;
  id v25 = v14;
  id v41 = v25;
  v43 = v47;
  [v22 enumerateObjectsUsingBlock:v36];
  id v26 = v23;
  *a4 = v26;
  int v27 = v41;
  id v28 = v24;

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(buf, 8);

  return v28;
}

- (uint64_t)fc_indexOfFirstObjectWithValue:()FCAdditions forKey:
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__NSArray_FCAdditions__fc_indexOfFirstObjectWithValue_forKey___block_invoke;
  v12[3] = &unk_1E5B586A8;
  id v13 = v7;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = [a1 indexOfObjectPassingTest:v12];

  return v10;
}

- (id)fc_indexesOfObjectsIdenticalTo:()FCAdditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28D30] hashTableWithOptions:512];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addObject:*(void *)(*((void *)&v16 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__NSArray_FCAdditions__fc_indexesOfObjectsIdenticalTo___block_invoke;
  v14[3] = &unk_1E5B586D0;
  id v15 = v5;
  id v11 = v5;
  id v12 = [a1 indexesOfObjectsPassingTest:v14];

  return v12;
}

- (id)fc_indexesOfObjectsPassingTest:()FCAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__NSArray_FCAdditions__fc_indexesOfObjectsPassingTest___block_invoke;
  v8[3] = &unk_1E5B58608;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 indexesOfObjectsPassingTest:v8];

  return v6;
}

- (id)fc_arrayByCollectingObjectsWithBlock:()FCAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        objc_msgSend(v5, "addObjectsFromArray:", v11, (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)fc_arrayByAddingNonContainedObjectsFromArray:()FCAdditions
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (uint64_t v6 = [v4 count]) != 0)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = [v5 objectAtIndex:v9];
      if (([a1 containsObject:v10] & 1) == 0)
      {
        if (!v8)
        {
          uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count") + v7);
          [v8 addObjectsFromArray:a1];
        }
        [v8 addObject:v10];
      }

      ++v9;
      --v7;
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = a1;
  }
  id v12 = v11;

  return v12;
}

- (uint64_t)fc_subarrayUpToIndex:()FCAdditions inclusive:
{
  return objc_msgSend(a1, "subarrayWithRange:", 0, a3 - (a4 ^ 1u) + 1);
}

- (uint64_t)fc_subarrayFromIndex:()FCAdditions inclusive:
{
  return objc_msgSend(a1, "fc_subarrayFromCount:", (a4 ^ 1u) + a3);
}

- (uint64_t)fc_subarrayFromCount:()FCAdditions
{
  uint64_t v5 = [a1 count] - a3;
  return objc_msgSend(a1, "subarrayWithRange:", a3, v5);
}

- (id)fc_subarrayInOrder:()FCAdditions relativeToIndex:inclusive:
{
  if (a3 == 1)
  {
    uint64_t v5 = objc_msgSend(a1, "fc_subarrayFromIndex:inclusive:", a4, a5);
  }
  else if (a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend(a1, "fc_subarrayUpToIndex:inclusive:", a4, a5);
  }
  return v5;
}

- (id)fc_subarrayInOrder:()FCAdditions relativeToIndex:withMaxCount:range:
{
  if (a3 == 1)
  {
    uint64_t v6 = objc_msgSend(a1, "fc_subarrayFromIndex:withMaxCount:range:", a4, a5, a6);
  }
  else if (a3)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = objc_msgSend(a1, "fc_subarrayToIndex:withMaxCount:range:", a4, a5, a6);
  }
  return v6;
}

- (id)fc_subarrayFromIndex:()FCAdditions withMaxCount:range:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = [a1 count];
  unint64_t v10 = v9 - a3;
  if (v9 <= a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "index < count");
    *(_DWORD *)buf = 136315906;
    long long v16 = "-[NSArray(FCAdditions) fc_subarrayFromIndex:withMaxCount:range:]";
    __int16 v17 = 2080;
    uint64_t v18 = "NSArray+FCAdditions.m";
    __int16 v19 = 1024;
    int v20 = 934;
    __int16 v21 = 2114;
    uint64_t v22 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (v10 >= a4) {
    uint64_t v11 = a4;
  }
  else {
    uint64_t v11 = v10;
  }
  if (a5)
  {
    *a5 = a3;
    a5[1] = v11;
  }
  id v12 = objc_msgSend(a1, "subarrayWithRange:", a3, v11);
  return v12;
}

- (id)fc_subarrayToIndex:()FCAdditions withMaxCount:range:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([a1 count] <= a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "index < count");
    *(_DWORD *)buf = 136315906;
    long long v15 = "-[NSArray(FCAdditions) fc_subarrayToIndex:withMaxCount:range:]";
    __int16 v16 = 2080;
    __int16 v17 = "NSArray+FCAdditions.m";
    __int16 v18 = 1024;
    int v19 = 949;
    __int16 v20 = 2114;
    __int16 v21 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (a3 + 1 >= a4) {
    unint64_t v9 = a3 + 1 - a4;
  }
  else {
    unint64_t v9 = 0;
  }
  uint64_t v10 = a3 - v9 + 1;
  if (a5)
  {
    *a5 = v9;
    a5[1] = v10;
  }
  uint64_t v11 = objc_msgSend(a1, "subarrayWithRange:", v9, v10);
  return v11;
}

- (id)fc_arrayByMergingAdjacentObjectsWithMergePolicy:()FCAdditions mergeBlock:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "policy");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[NSArray(FCAdditions) fc_arrayByMergingAdjacentObjectsWithMergePolicy:mergeBlock:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v23) = 965;
    WORD2(v23) = 2114;
    *(void *)((char *)&v23 + 6) = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "mergeBlock");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[NSArray(FCAdditions) fc_arrayByMergingAdjacentObjectsWithMergePolicy:mergeBlock:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v23) = 966;
    WORD2(v23) = 2114;
    *(void *)((char *)&v23 + 6) = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [a1 count];
  if (v9)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&long long v23 = __Block_byref_object_copy__55;
    *((void *)&v23 + 1) = __Block_byref_object_dispose__55;
    id v24 = [a1 firstObject];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 1, v9 - 1);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __83__NSArray_FCAdditions__fc_arrayByMergingAdjacentObjectsWithMergePolicy_mergeBlock___block_invoke;
    v17[3] = &unk_1E5B586F8;
    id v19 = v6;
    __int16 v21 = buf;
    id v20 = v7;
    id v11 = v8;
    id v18 = v11;
    [a1 enumerateObjectsAtIndexes:v10 options:0 usingBlock:v17];

    id v12 = *(void **)(*(void *)&buf[8] + 40);
    long long v13 = [v11 lastObject];
    LOBYTE(v12) = v12 == v13;

    if ((v12 & 1) == 0) {
      [v11 addObject:*(void *)(*(void *)&buf[8] + 40)];
    }

    _Block_object_dispose(buf, 8);
  }

  return v8;
}

- (id)fc_safeObjectAtIndex:()FCAdditions
{
  if ([a1 count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [a1 objectAtIndex:a3];
  }
  return v5;
}

- (uint64_t)fc_safeSubarrayWithCountFromFront:()FCAdditions
{
  unint64_t v5 = [a1 count];
  if (v5 >= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = v5;
  }
  return objc_msgSend(a1, "subarrayWithRange:", 0, v6);
}

- (uint64_t)fc_safeSubarrayWithCountFromBack:()FCAdditions
{
  unint64_t v5 = [a1 count];
  if (v5 < a3) {
    a3 = v5;
  }
  unint64_t v6 = [a1 count] - a3;
  return objc_msgSend(a1, "subarrayWithRange:", v6, a3);
}

- (void)fc_subarrayWithCount:()FCAdditions result:
{
  id v11 = a4;
  if ([a1 count])
  {
    unint64_t v6 = [a1 count];
    if (v6 < a3) {
      a3 = v6;
    }
    if (a3 >= [a1 count])
    {
      unint64_t v7 = 0;
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t v7 = [a1 count] - a3;
      uint64_t v8 = a3;
    }
    uint64_t v9 = objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11[2](v11, v9, MEMORY[0x1E4F1CBF0]);
    }
    else
    {
      uint64_t v10 = objc_msgSend(a1, "subarrayWithRange:", v8, v7);
      ((void (**)(id, void *, void *))v11)[2](v11, v9, v10);
    }
  }
  else
  {
    v11[2](v11, (void *)MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0]);
  }
}

- (id)fc_subarrayWithPercentFromBeginning:()FCAdditions
{
  double v3 = fmin(a2, 1.0);
  if (v3 >= 0.0) {
    double v4 = v3;
  }
  else {
    double v4 = 0.0;
  }
  uint64_t v5 = [a1 count];
  if (v4 == 0.0 || v5 == 0)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    double v8 = round(v4 * (double)(unint64_t)[a1 count]);
    unint64_t v9 = [a1 count];
    double v10 = (double)v9;
    if (v8 < (double)v9) {
      double v10 = v8;
    }
    unint64_t v7 = objc_msgSend(a1, "subarrayWithRange:", 0, (unint64_t)v10);
  }
  return v7;
}

- (id)fc_subarrayWithPercentToEnd:()FCAdditions
{
  double v3 = fmin(a2, 1.0);
  if (v3 >= 0.0) {
    double v4 = v3;
  }
  else {
    double v4 = 0.0;
  }
  uint64_t v5 = [a1 count];
  if (v4 == 0.0 || v5 == 0) {
    goto LABEL_12;
  }
  double v7 = round(v4 * (double)(unint64_t)[a1 count]);
  double v8 = (double)(unint64_t)[a1 count];
  if (v7 < v8) {
    double v8 = v7;
  }
  unint64_t v9 = (unint64_t)v8;
  if ([a1 count] <= (unint64_t)v8)
  {
LABEL_12:
    double v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    double v10 = objc_msgSend(a1, "subarrayWithRange:", v9, objc_msgSend(a1, "count") - v9);
  }
  return v10;
}

- (double)fc_reduceArrayWithDouble:()FCAdditions block:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        a2 = v6[2](v6, *(void *)(*((void *)&v13 + 1) + 8 * v11++), a2);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return a2;
}

+ (id)fc_arrayByAddingObjectsFromArray:()FCAdditions toArray:inRelativeOrder:
{
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    uint64_t v10 = a1;
    id v11 = v9;
    id v12 = v8;
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    uint64_t v10 = a1;
    id v11 = v8;
    id v12 = v9;
LABEL_5:
    long long v13 = objc_msgSend(v10, "fc_arrayByAddingObjectsFromArray:toArray:", v11, v12);
    goto LABEL_7;
  }
  long long v13 = 0;
LABEL_7:

  return v13;
}

+ (id)fc_arrayByAddingUniqueObjectsFromArray:()FCAdditions toArray:
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 set];
  [v8 addObjectsFromArray:v6];

  [v8 addObjectsFromArray:v7];
  id v9 = [v8 allObjects];

  return v9;
}

+ (id)fc_generatedArrayWithCount:()FCAdditions generator:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "generator");
    *(_DWORD *)buf = 136315906;
    id v12 = "+[NSArray(FCAdditions) fc_generatedArrayWithCount:generator:]";
    __int16 v13 = 2080;
    long long v14 = "NSArray+FCAdditions.m";
    __int16 v15 = 1024;
    int v16 = 1154;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
  if (a3)
  {
    uint64_t v7 = 0;
    do
    {
      id v8 = v5[2](v5, v7);
      [v6 setObject:v8 atIndexedSubscript:v7];

      ++v7;
    }
    while (a3 != v7);
  }

  return v6;
}

- (id)fc_arrayByReversingObjects
{
  v1 = [a1 reverseObjectEnumerator];
  id v2 = [v1 allObjects];

  return v2;
}

- (uint64_t)fc_uniqueCount
{
  v1 = [MEMORY[0x1E4F1CAD0] setWithArray:a1];
  uint64_t v2 = [v1 count];

  return v2;
}

- (uint64_t)fc_distanceFromArray:()FCAdditions
{
  double v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 setWithArray:a1];
  uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__NSArray_FCAdditions__fc_distanceFromArray___block_invoke;
  v15[3] = &unk_1E5B54780;
  id v16 = v7;
  id v8 = v7;
  uint64_t v9 = objc_msgSend(a1, "fc_countOfObjectsPassingTest:", v15);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __45__NSArray_FCAdditions__fc_distanceFromArray___block_invoke_2;
  v13[3] = &unk_1E5B54780;
  id v14 = v6;
  id v10 = v6;
  uint64_t v11 = objc_msgSend(v5, "fc_countOfObjectsPassingTest:", v13);

  return v11 + v9;
}

- (id)fc_uniqueByValueBlock:()FCAdditions
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__NSArray_FCAdditions__fc_uniqueByValueBlock___block_invoke;
  v10[3] = &unk_1E5B58720;
  id v11 = v5;
  id v12 = v4;
  id v6 = v5;
  id v7 = v4;
  id v8 = objc_msgSend(a1, "fc_arrayOfObjectsPassingTest:", v10);

  return v8;
}

+ (void)fc_walkArray:()FCAdditions andArray:withBlock:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = a5;
  uint64_t v10 = [v7 count];
  if (v10 != [v8 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v17 = (void *)[[NSString alloc] initWithFormat:@"can't walk side-by-side arrays with different counts"];
    int v18 = 136315906;
    uint64_t v19 = "+[NSArray(FCAdditions) fc_walkArray:andArray:withBlock:]";
    __int16 v20 = 2080;
    __int16 v21 = "NSArray+FCAdditions.m";
    __int16 v22 = 1024;
    int v23 = 1207;
    __int16 v24 = 2114;
    uint64_t v25 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v18, 0x26u);

    if (!v9) {
      goto LABEL_8;
    }
  }
  else if (!v9)
  {
    goto LABEL_8;
  }
  uint64_t v11 = [v7 count];
  if (v11 == [v8 count])
  {
    uint64_t v12 = [v7 count];
    if (v12)
    {
      uint64_t v13 = v12;
      for (uint64_t i = 0; i != v13; ++i)
      {
        __int16 v15 = [v7 objectAtIndexedSubscript:i];
        id v16 = [v8 objectAtIndexedSubscript:i];
        v9[2](v9, v15, v16, i);
      }
    }
  }
LABEL_8:
}

- (uint64_t)fc_expandIndex:()FCAdditions toIncludeAdjacentObjectsPassingTest:
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = v7;
      if (!(a3 + v7)) {
        break;
      }
      --v7;
      uint64_t v9 = [a1 objectAtIndexedSubscript:v8 - 1 + a3];
      char v10 = v6[2](v6, v9);
    }
    while ((v10 & 1) != 0);
    unint64_t v11 = [a1 count];
    unint64_t v12 = a3 + 1;
    uint64_t v13 = 1 - v8;
    a3 += v8;
    do
    {
      uint64_t v14 = v13;
      if (v12 >= v11) {
        break;
      }
      __int16 v15 = [a1 objectAtIndexedSubscript:v12];
      char v16 = v6[2](v6, v15);

      uint64_t v13 = v14 + 1;
      ++v12;
    }
    while ((v16 & 1) != 0);
  }

  return a3;
}

- (void)fc_enumerateIslandsOfCommonValuesForKeyBlock:()FCAdditions withBlock:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "keyBlock");
    *(_DWORD *)buf = 136315906;
    __int16 v24 = "-[NSArray(FCAdditions) fc_enumerateIslandsOfCommonValuesForKeyBlock:withBlock:]";
    __int16 v25 = 2080;
    uint64_t v26 = "NSArray+FCAdditions.m";
    __int16 v27 = 1024;
    int v28 = 1272;
    __int16 v29 = 2114;
    uint64_t v30 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block");
    *(_DWORD *)buf = 136315906;
    __int16 v24 = "-[NSArray(FCAdditions) fc_enumerateIslandsOfCommonValuesForKeyBlock:withBlock:]";
    __int16 v25 = 2080;
    uint64_t v26 = "NSArray+FCAdditions.m";
    __int16 v27 = 1024;
    int v28 = 1273;
    __int16 v29 = 2114;
    uint64_t v30 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  unint64_t v8 = [a1 count];
  unint64_t v9 = 0;
  do
  {
    if (v9 >= v8) {
      break;
    }
    char v10 = [a1 objectAtIndexedSubscript:v9];
    unint64_t v11 = v6[2](v6, v10);

    unint64_t v12 = v9 + 1;
    if (v8 <= v9 + 1)
    {
      unint64_t v15 = v9;
    }
    else
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v9 + 1, v8 - (v9 + 1));
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __79__NSArray_FCAdditions__fc_enumerateIslandsOfCommonValuesForKeyBlock_withBlock___block_invoke;
      v20[3] = &unk_1E5B58770;
      __int16 v22 = v6;
      id v21 = v11;
      uint64_t v14 = [a1 indexOfObjectAtIndexes:v13 options:0 passingTest:v20];

      unint64_t v12 = v14 == 0x7FFFFFFFFFFFFFFFLL ? v8 : v14;
      unint64_t v15 = v12 - 1;
    }
    uint64_t v16 = v15 - v9 + 1;
    __int16 v17 = objc_msgSend(a1, "subarrayWithRange:", v9, v16);
    buf[0] = 0;
    v7[2](v7, v17, v11, v9, v16, buf);
    LODWORD(v16) = buf[0];

    unint64_t v9 = v12;
  }
  while (!v16);
}

- (id)fc_sortedArrayStartingWithElementsSatisfying:()FCAdditions sortedBy:
{
  if (a3) {
    id v5 = a3;
  }
  else {
    id v5 = &__block_literal_global_52_0;
  }
  id v6 = a4;
  uint64_t v7 = _Block_copy(v5);
  if (v6) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = &__block_literal_global_55_1;
  }
  unint64_t v9 = _Block_copy(v8);

  char v10 = (void *)MEMORY[0x1E4F1C978];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__NSArray_FCAdditions__fc_sortedArrayStartingWithElementsSatisfying_sortedBy___block_invoke_3;
  v15[3] = &unk_1E5B585B8;
  void v15[4] = a1;
  id v16 = v7;
  id v17 = v9;
  id v11 = v9;
  id v12 = v7;
  uint64_t v13 = objc_msgSend(v10, "fc_array:", v15);

  return v13;
}

- (id)fc_rotateElementsFromTheIndexOfSelectedItem:()FCAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([a1 count] <= a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v11 = (void *)[[NSString alloc] initWithFormat:@"indexOfSelectedItem must be within range of array length"];
    int v12 = 136315906;
    uint64_t v13 = "-[NSArray(FCAdditions) fc_rotateElementsFromTheIndexOfSelectedItem:]";
    __int16 v14 = 2080;
    unint64_t v15 = "NSArray+FCAdditions.m";
    __int16 v16 = 1024;
    int v17 = 1343;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);
  }
  if ([a1 count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    if ([a1 count] > a3)
    {
      unint64_t v6 = a3;
      do
      {
        uint64_t v7 = [a1 objectAtIndexedSubscript:v6];
        [v5 addObject:v7];

        ++v6;
      }
      while (v6 < [a1 count]);
    }
    if (a3)
    {
      uint64_t v8 = 0;
      do
      {
        unint64_t v9 = [a1 objectAtIndexedSubscript:v8];
        [v5 addObject:v9];

        ++v8;
      }
      while (a3 != v8);
    }
  }
  return v5;
}

- (BOOL)fc_isEqualToArray:()FCAdditions inRange:
{
  id v8 = a3;
  __int16 v18 = a1;
  unint64_t v9 = [a1 count];
  uint64_t v10 = [v8 count];
  unint64_t v11 = a4 + a5;
  if (a4 >= a4 + a5)
  {
    BOOL v13 = 1;
  }
  else
  {
    unint64_t v12 = v10;
    BOOL v13 = 0;
    do
    {
      if (a4 >= v9)
      {
        __int16 v14 = 0;
      }
      else
      {
        __int16 v14 = [v18 objectAtIndexedSubscript:a4];
      }
      if (a4 >= v12)
      {
        unint64_t v15 = 0;
      }
      else
      {
        unint64_t v15 = [v8 objectAtIndexedSubscript:a4];
      }
      char v16 = objc_msgSend(MEMORY[0x1E4FBA8A8], "nf_object:isEqualToObject:", v14, v15);

      if ((v16 & 1) == 0) {
        break;
      }
      BOOL v13 = ++a4 >= v11;
      --a5;
    }
    while (a5);
  }

  return v13;
}

- (uint64_t)fc_isEqualToArray:()FCAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5 == [v4 count]) {
    uint64_t v6 = objc_msgSend(a1, "fc_isEqualToArray:inRange:", v4, 0, v5);
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (double)fc_euclideanDistanceToArray:()FCAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5 != [v4 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v14 = (void *)[[NSString alloc] initWithFormat:@"Lengths of vectors should be the same when computing euclidean distance."];
    int v15 = 136315906;
    char v16 = "-[NSArray(FCAdditions) fc_euclideanDistanceToArray:]";
    __int16 v17 = 2080;
    __int16 v18 = "NSArray+FCAdditions.m";
    __int16 v19 = 1024;
    int v20 = 1396;
    __int16 v21 = 2114;
    __int16 v22 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }
  if ([a1 count])
  {
    unint64_t v6 = 0;
    double v7 = 0.0;
    do
    {
      id v8 = [a1 objectAtIndexedSubscript:v6];
      [v8 doubleValue];
      double v10 = v9;
      unint64_t v11 = [v4 objectAtIndexedSubscript:v6];
      [v11 doubleValue];
      double v7 = v7 + (v10 - v12) * (v10 - v12);

      ++v6;
    }
    while ([a1 count] > v6);
  }
  else
  {
    double v7 = 0.0;
  }

  return sqrt(v7);
}

- (double)fc_cosineDistanceToArray:()FCAdditions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5 != [v4 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v19 = (void *)[[NSString alloc] initWithFormat:@"Lengths of vectors should be the same when computing cosine distance."];
    int v20 = 136315906;
    __int16 v21 = "-[NSArray(FCAdditions) fc_cosineDistanceToArray:]";
    __int16 v22 = 2080;
    uint64_t v23 = "NSArray+FCAdditions.m";
    __int16 v24 = 1024;
    int v25 = 1407;
    __int16 v26 = 2114;
    __int16 v27 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v20, 0x26u);
  }
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  if ([a1 count])
  {
    unint64_t v9 = 0;
    do
    {
      double v10 = [a1 objectAtIndexedSubscript:v9];
      [v10 doubleValue];
      double v12 = v11;

      BOOL v13 = [v4 objectAtIndexedSubscript:v9];
      [v13 doubleValue];
      double v15 = v14;

      double v8 = v8 + v12 * v15;
      double v6 = v6 + v12 * v12;
      ++v9;
      double v7 = v7 + v15 * v15;
    }
    while ([a1 count] > v9);
  }
  double v16 = sqrt(v6) * sqrt(v7);
  if (v16 <= 0.0) {
    double v17 = 0.0;
  }
  else {
    double v17 = v8 / v16;
  }

  return v17;
}

@end