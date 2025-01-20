@interface NSSet(FCAdditions)
+ (id)fc_set:()FCAdditions;
+ (id)fc_unionOfSetsInArray:()FCAdditions;
- (BOOL)fc_containsObjectPassingTest:()FCAdditions;
- (id)fc_arrayByTransformingWithBlock:()FCAdditions;
- (id)fc_arrayOfObjectsPassingTest:()FCAdditions;
- (id)fc_dictionaryOfSortedSetsWithKeyBlock:()FCAdditions;
- (id)fc_diffAgainstSet:()FCAdditions;
- (id)fc_firstObjectPassingTest:()FCAdditions;
- (id)fc_mutableSetByTransformingWithBlock:()FCAdditions;
- (id)fc_onlyObject;
- (id)fc_setByIntersectingSet:()FCAdditions;
- (id)fc_setByMinusingSet:()FCAdditions;
- (id)fc_setByRemovingObject:()FCAdditions;
- (id)fc_setByTransformingWithBlock:()FCAdditions;
- (id)fc_setByUnioningSet:()FCAdditions;
- (id)fc_setOfObjectsPassingTest:()FCAdditions;
- (uint64_t)fc_containsAnyObjectInArray:()FCAdditions;
- (uint64_t)fc_countOfObjectsIntersectingSet:()FCAdditions;
- (uint64_t)fc_countOfObjectsPassingTest:()FCAdditions;
@end

@implementation NSSet(FCAdditions)

- (id)fc_arrayOfObjectsPassingTest:()FCAdditions
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "predicate");
    *(_DWORD *)buf = 136315906;
    v20 = "-[NSSet(FCAdditions) fc_arrayOfObjectsPassingTest:]";
    __int16 v21 = 2080;
    v22 = "NSSet+FCAdditions.m";
    __int16 v23 = 1024;
    int v24 = 84;
    __int16 v25 = 2114;
    v26 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = objc_opt_new();
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

+ (id)fc_unionOfSetsInArray:()FCAdditions
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = objc_msgSend(v3, "fc_reduceArrayWithInitial:block:", v4, &__block_literal_global_159);

  return v5;
}

+ (id)fc_set:()FCAdditions
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  if (v3) {
    v3[2](v3, v4);
  }
  if (v4)
  {
    uint64_t v5 = [v4 copy];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)fc_setByTransformingWithBlock:()FCAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "transformBlock");
    *(_DWORD *)buf = 136315906;
    uint64_t v9 = "-[NSSet(FCAdditions) fc_setByTransformingWithBlock:]";
    __int16 v10 = 2080;
    uint64_t v11 = "NSSet+FCAdditions.m";
    __int16 v12 = 1024;
    int v13 = 115;
    __int16 v14 = 2114;
    long long v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v5 = objc_msgSend(a1, "fc_mutableSetByTransformingWithBlock:", v4);

  return v5;
}

- (id)fc_mutableSetByTransformingWithBlock:()FCAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "transformBlock");
    *(_DWORD *)buf = 136315906;
    uint64_t v16 = "-[NSSet(FCAdditions) fc_mutableSetByTransformingWithBlock:]";
    __int16 v17 = 2080;
    v18 = "NSSet+FCAdditions.m";
    __int16 v19 = 1024;
    int v20 = 122;
    __int16 v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v5 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__NSSet_FCAdditions__fc_mutableSetByTransformingWithBlock___block_invoke;
  v12[3] = &unk_1E5B59F38;
  id v14 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v12];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)fc_diffAgainstSet:()FCAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = a1;
    id v6 = (void *)[v4 mutableCopy];
    [v6 minusSet:v5];
    id v7 = (void *)[v5 mutableCopy];

    [v7 minusSet:v4];
    v13[0] = @"FCInsertedElementsKey";
    uint64_t v8 = (void *)[v7 copy];
    v13[1] = @"FCDeletedElementsKey";
    v14[0] = v8;
    id v9 = (void *)[v6 copy];
    v14[1] = v9;
    __int16 v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "left != nil");
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = "-[NSSet(FCAdditions) fc_diffAgainstSet:]";
      __int16 v17 = 2080;
      v18 = "NSSet+FCAdditions.m";
      __int16 v19 = 1024;
      int v20 = 30;
      __int16 v21 = 2114;
      v22 = v12;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    __int16 v10 = 0;
  }

  return v10;
}

- (id)fc_firstObjectPassingTest:()FCAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
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
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
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

- (id)fc_onlyObject
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a1 count] != 1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v4 = [NSString alloc];
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
    id v6 = (void *)[v4 initWithFormat:@"expected one element; got %@", v5];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[NSSet(FCAdditions) fc_onlyObject]";
    __int16 v9 = 2080;
    __int16 v10 = "NSSet+FCAdditions.m";
    __int16 v11 = 1024;
    int v12 = 66;
    __int16 v13 = 2114;
    long long v14 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v2 = [a1 anyObject];
  return v2;
}

- (BOOL)fc_containsObjectPassingTest:()FCAdditions
{
  v1 = objc_msgSend(a1, "fc_firstObjectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)fc_setOfObjectsPassingTest:()FCAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__NSSet_FCAdditions__fc_setOfObjectsPassingTest___block_invoke;
  v8[3] = &unk_1E5B59F10;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 objectsPassingTest:v8];

  return v6;
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

- (id)fc_arrayByTransformingWithBlock:()FCAdditions
{
  id v4 = a3;
  id v5 = [a1 allObjects];
  uint64_t v6 = objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", v4);

  return v6;
}

- (uint64_t)fc_containsAnyObjectInArray:()FCAdditions
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__NSSet_FCAdditions__fc_containsAnyObjectInArray___block_invoke;
  v7[3] = &unk_1E5B59F60;
  v7[4] = a1;
  v7[5] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)fc_dictionaryOfSortedSetsWithKeyBlock:()FCAdditions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block != nil");
    *(_DWORD *)buf = 136315906;
    v22 = "-[NSSet(FCAdditions) fc_dictionaryOfSortedSetsWithKeyBlock:]";
    __int16 v23 = 2080;
    int v24 = "NSSet+FCAdditions.m";
    __int16 v25 = 1024;
    int v26 = 154;
    __int16 v27 = 2114;
    v28 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a1;
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
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = v4[2](v4, v11);
        if (v12)
        {
          long long v13 = [v5 objectForKeyedSubscript:v12];
          if (!v13)
          {
            long long v13 = objc_opt_new();
            [v5 setObject:v13 forKeyedSubscript:v12];
          }
          [v13 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)fc_countOfObjectsIntersectingSet:()FCAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__NSSet_FCAdditions__fc_countOfObjectsIntersectingSet___block_invoke;
  v8[3] = &unk_1E5B54780;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = objc_msgSend(a1, "fc_countOfObjectsPassingTest:", v8);

  return v6;
}

- (id)fc_setByIntersectingSet:()FCAdditions
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  objc_msgSend(v5, "fc_safelyIntersectSet:", v4);

  return v5;
}

- (id)fc_setByMinusingSet:()FCAdditions
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  objc_msgSend(v5, "fc_safelyMinusSet:", v4);

  uint64_t v6 = (void *)[v5 copy];
  return v6;
}

- (id)fc_setByUnioningSet:()FCAdditions
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  objc_msgSend(v5, "fc_safelyUnionSet:", v4);

  uint64_t v6 = (void *)[v5 copy];
  return v6;
}

- (id)fc_setByRemovingObject:()FCAdditions
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  objc_msgSend(v5, "fc_safelyRemoveObject:", v4);

  uint64_t v6 = (void *)[v5 copy];
  return v6;
}

@end