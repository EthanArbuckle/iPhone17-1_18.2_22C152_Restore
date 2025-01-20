@interface NSOrderedSet(FCAdditions)
+ (id)fc_orderedSet:()FCAdditions;
- (BOOL)fc_containsObjectPassingTest:()FCAdditions;
- (BOOL)fc_isEqualToOrderedSet:()FCAdditions inRange:;
- (BOOL)fc_isSortedUsingComparator:()FCAdditions;
- (id)fc_diffAgainstOrderedSet:()FCAdditions;
- (id)fc_diffAgainstOrderedSet:()FCAdditions withEqualityTest:identityValueProvider:;
- (id)fc_diffAgainstSortedOrderedCollection:()FCAdditions usingComparator:;
- (id)fc_firstObjectPassingTest:()FCAdditions;
- (id)fc_indexesOfObjectsInOrderedSet:()FCAdditions;
- (id)fc_objectInSortedOrderedCollectionWithFeature:()FCAdditions usingFeatureProvider:comparator:;
- (id)fc_orderedSetByAddingObject:()FCAdditions;
- (id)fc_orderedSetByCollectingObjectsWithBlock:()FCAdditions;
- (id)fc_orderedSetByMinusingOrderedSet:()FCAdditions;
- (id)fc_orderedSetByTransformingWithBlock:()FCAdditions;
- (id)fc_orderedSetOfObjectsPassingTest:()FCAdditions;
- (id)fc_orderedSetWithObjectsAtIndexes:()FCAdditions;
- (uint64_t)fc_orderedSetWithObjectsInRange:()FCAdditions;
- (void)fc_enumerateObjectsPairwiseUsingBlock:()FCAdditions;
@end

@implementation NSOrderedSet(FCAdditions)

+ (id)fc_orderedSet:()FCAdditions
{
  v3 = a3;
  v4 = [MEMORY[0x1E4F1CA70] orderedSet];
  if (v3) {
    v3[2](v3, v4);
  }
  if (v4)
  {
    uint64_t v5 = [v4 copy];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CAA0] orderedSet];
  }
  v6 = (void *)v5;

  return v6;
}

- (id)fc_orderedSetByTransformingWithBlock:()FCAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__NSOrderedSet_FCAdditions__fc_orderedSetByTransformingWithBlock___block_invoke;
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

- (void)fc_enumerateObjectsPairwiseUsingBlock:()FCAdditions
{
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

- (id)fc_diffAgainstOrderedSet:()FCAdditions withEqualityTest:identityValueProvider:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "left");
    *(_DWORD *)buf = 136315906;
    v37 = "-[NSOrderedSet(FCAdditions) fc_diffAgainstOrderedSet:withEqualityTest:identityValueProvider:]";
    __int16 v38 = 2080;
    v39 = "NSOrderedSet+FCAdditions.m";
    __int16 v40 = 1024;
    int v41 = 65;
    __int16 v42 = 2114;
    v43 = v24;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "equalityTest");
    *(_DWORD *)buf = 136315906;
    v37 = "-[NSOrderedSet(FCAdditions) fc_diffAgainstOrderedSet:withEqualityTest:identityValueProvider:]";
    __int16 v38 = 2080;
    v39 = "NSOrderedSet+FCAdditions.m";
    __int16 v40 = 1024;
    int v41 = 66;
    __int16 v42 = 2114;
    v43 = v25;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identityValueProvider");
    *(_DWORD *)buf = 136315906;
    v37 = "-[NSOrderedSet(FCAdditions) fc_diffAgainstOrderedSet:withEqualityTest:identityValueProvider:]";
    __int16 v38 = 2080;
    v39 = "NSOrderedSet+FCAdditions.m";
    __int16 v40 = 1024;
    int v41 = 67;
    __int16 v42 = 2114;
    v43 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet_withEqualityTest_identityValueProvider___block_invoke;
  aBlock[3] = &unk_1E5B58DB0;
  id v35 = v10;
  id v27 = v10;
  v11 = _Block_copy(aBlock);
  id v12 = objc_msgSend(v8, "fc_orderedSetByTransformingWithBlock:", v11);
  id v13 = objc_msgSend(a1, "fc_orderedSetByTransformingWithBlock:", v11);
  v14 = objc_msgSend(v13, "fc_diffAgainstOrderedSet:", v12);
  v15 = (void *)[v14 mutableCopy];

  v16 = objc_opt_new();
  v17 = [v15 objectForKeyedSubscript:@"deletedIndices"];
  v18 = [v15 objectForKeyedSubscript:@"movedIndices"];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __93__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet_withEqualityTest_identityValueProvider___block_invoke_2;
  v28[3] = &unk_1E5B58DD8;
  id v29 = v17;
  id v30 = v18;
  id v32 = v16;
  id v33 = v9;
  v31 = a1;
  id v19 = v16;
  id v20 = v9;
  id v21 = v18;
  id v22 = v17;
  [v8 enumerateObjectsUsingBlock:v28];
  [v15 setObject:v19 forKeyedSubscript:@"updatedIndices"];

  return v15;
}

- (id)fc_diffAgainstOrderedSet:()FCAdditions
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = a1;
    id v27 = [v4 set];
    v26 = [v5 set];
    id v6 = objc_msgSend(v26, "fc_diffAgainstSet:", v27);
    id v7 = [v6 objectForKeyedSubscript:@"FCInsertedElementsKey"];
    id v8 = [v6 objectForKeyedSubscript:@"FCDeletedElementsKey"];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke;
    aBlock[3] = &unk_1E5B54780;
    id v41 = v8;
    id v25 = v8;
    id v9 = _Block_copy(aBlock);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke_2;
    v38[3] = &unk_1E5B54780;
    id v39 = v7;
    id v24 = v7;
    id v10 = _Block_copy(v38);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke_3;
    v36[3] = &unk_1E5B58608;
    id v11 = v9;
    id v37 = v11;
    id v12 = [v4 indexesOfObjectsPassingTest:v36];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke_4;
    v34[3] = &unk_1E5B58608;
    id v13 = v10;
    id v35 = v13;
    v14 = [v5 indexesOfObjectsPassingTest:v34];
    v15 = objc_opt_new();
    v16 = objc_opt_new();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke_5;
    v28[3] = &unk_1E5B58E00;
    id v32 = v13;
    id v33 = v11;
    id v29 = v4;
    id v30 = v15;
    id v31 = v16;
    id v17 = v16;
    id v18 = v15;
    id v19 = v11;
    id v20 = v13;
    [v5 enumerateObjectsUsingBlock:v28];

    v42[0] = @"insertedIndices";
    v42[1] = @"deletedIndices";
    v43[0] = v14;
    v43[1] = v12;
    v42[2] = @"movedIndices";
    v42[3] = @"unmovedIndices";
    v43[2] = v18;
    v43[3] = v17;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:4];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "left");
      *(_DWORD *)buf = 136315906;
      v45 = "-[NSOrderedSet(FCAdditions) fc_diffAgainstOrderedSet:]";
      __int16 v46 = 2080;
      v47 = "NSOrderedSet+FCAdditions.m";
      __int16 v48 = 1024;
      int v49 = 112;
      __int16 v50 = 2114;
      v51 = v23;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v21 = 0;
  }

  return v21;
}

- (id)fc_indexesOfObjectsInOrderedSet:()FCAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E60] indexSet];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
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
        uint64_t v11 = objc_msgSend(a1, "indexOfObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
          [v5 addIndex:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)fc_firstObjectPassingTest:()FCAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "testBlock");
    *(_DWORD *)buf = 136315906;
    id v10 = "-[NSOrderedSet(FCAdditions) fc_firstObjectPassingTest:]";
    __int16 v11 = 2080;
    id v12 = "NSOrderedSet+FCAdditions.m";
    __int16 v13 = 1024;
    int v14 = 192;
    __int16 v15 = 2114;
    long long v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = [a1 objectEnumerator];
  id v6 = objc_msgSend(v5, "fc_firstObjectPassingTest:", v4);

  return v6;
}

- (BOOL)fc_containsObjectPassingTest:()FCAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "testBlock");
    *(_DWORD *)buf = 136315906;
    id v10 = "-[NSOrderedSet(FCAdditions) fc_containsObjectPassingTest:]";
    __int16 v11 = 2080;
    id v12 = "NSOrderedSet+FCAdditions.m";
    __int16 v13 = 1024;
    int v14 = 199;
    __int16 v15 = 2114;
    long long v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = objc_msgSend(a1, "fc_firstObjectPassingTest:", v4);
  BOOL v6 = v5 != 0;

  return v6;
}

- (id)fc_orderedSetOfObjectsPassingTest:()FCAdditions
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "testBlock");
    *(_DWORD *)buf = 136315906;
    id v20 = "-[NSOrderedSet(FCAdditions) fc_orderedSetOfObjectsPassingTest:]";
    __int16 v21 = 2080;
    id v22 = "NSOrderedSet+FCAdditions.m";
    __int16 v23 = 1024;
    int v24 = 206;
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
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)fc_orderedSetWithObjectsInRange:()FCAdditions
{
  return objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithOrderedSet:range:copyItems:", a1, a3, a4, 0);
}

- (id)fc_orderedSetWithObjectsAtIndexes:()FCAdditions
{
  v1 = (void *)MEMORY[0x1E4F1CAA0];
  v2 = objc_msgSend(a1, "objectsAtIndexes:");
  v3 = [v1 orderedSetWithArray:v2];

  return v3;
}

- (id)fc_orderedSetByMinusingOrderedSet:()FCAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA70];
  id v5 = a3;
  id v6 = [v4 orderedSetWithOrderedSet:a1];
  [v6 minusOrderedSet:v5];

  return v6;
}

- (id)fc_orderedSetByCollectingObjectsWithBlock:()FCAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
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
        uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
        id v12 = objc_msgSend(v11, "array", (void)v14);
        [v5 addObjectsFromArray:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)fc_orderedSetByAddingObject:()FCAdditions
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 addObject:v4];

  return v5;
}

- (BOOL)fc_isEqualToOrderedSet:()FCAdditions inRange:
{
  id v8 = a3;
  uint64_t v18 = a1;
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
        long long v14 = 0;
      }
      else
      {
        long long v14 = [v18 objectAtIndexedSubscript:a4];
      }
      if (a4 >= v12)
      {
        long long v15 = 0;
      }
      else
      {
        long long v15 = [v8 objectAtIndexedSubscript:a4];
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

@end