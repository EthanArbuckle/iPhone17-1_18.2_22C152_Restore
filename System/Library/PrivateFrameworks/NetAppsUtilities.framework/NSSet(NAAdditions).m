@interface NSSet(NAAdditions)
+ (id)na_setWithSafeObject:()NAAdditions;
- (BOOL)na_all:()NAAdditions;
- (id)na_dictionaryByBucketingObjectsUsingKeyGenerator:()NAAdditions;
- (id)na_dictionaryWithKeyGenerator:()NAAdditions;
- (id)na_filter:()NAAdditions;
- (id)na_firstObjectPassingTest:()NAAdditions;
- (id)na_flatMap:()NAAdditions;
- (id)na_map:()NAAdditions;
- (id)na_reduceWithInitialValue:()NAAdditions reducer:;
- (id)na_setByDiffingWithSet:()NAAdditions;
- (id)na_setByFlattening;
- (id)na_setByIntersectingWithSet:()NAAdditions;
- (id)na_setByRemovingObjectsFromSet:()NAAdditions;
- (uint64_t)na_allObjectsPassTest:()NAAdditions;
- (uint64_t)na_any:()NAAdditions;
- (uint64_t)na_safeContainsObject:()NAAdditions;
- (void)na_each:()NAAdditions;
@end

@implementation NSSet(NAAdditions)

- (uint64_t)na_any:()NAAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__NSSet_NAAdditions__na_any___block_invoke;
  v8[3] = &unk_1E610A1F0;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)na_setByFlattening
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__NSSet_NAAdditions__na_setByFlattening__block_invoke;
  v5[3] = &unk_1E6109EE8;
  id v3 = v2;
  id v6 = v3;
  objc_msgSend(a1, "na_each:", v5);

  return v3;
}

- (void)na_each:()NAAdditions
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__NSSet_NAAdditions__na_each___block_invoke;
  v6[3] = &unk_1E610A218;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v6];
}

- (id)na_dictionaryByBucketingObjectsUsingKeyGenerator:()NAAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 count])
  {
    id v5 = objc_opt_new();
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
          v12 = v4[2](v4, v11);
          if (v12)
          {
            uint64_t v13 = objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v12, &__block_literal_global_5, (void)v15);
            [v13 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

- (id)na_flatMap:()NAAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(a1, "count"));
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
        uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        if (v11) {
          objc_msgSend(v5, "unionSet:", v11, (void)v13);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)na_map:()NAAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __29__NSSet_NAAdditions__na_map___block_invoke;
  v11[3] = &unk_1E610A1A0;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  uint64_t v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)na_filter:()NAAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__NSSet_NAAdditions__na_filter___block_invoke;
  v8[3] = &unk_1E610A1C8;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 objectsPassingTest:v8];

  return v6;
}

- (uint64_t)na_safeContainsObject:()NAAdditions
{
  if (a3) {
    return objc_msgSend(a1, "containsObject:");
  }
  else {
    return 0;
  }
}

+ (id)na_setWithSafeObject:()NAAdditions
{
  if (a3) {
    objc_msgSend(a1, "setWithObject:");
  }
  else {
  id v3 = [a1 set];
  }
  return v3;
}

- (id)na_firstObjectPassingTest:()NAAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__1;
  long long v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__NSSet_NAAdditions__na_firstObjectPassingTest___block_invoke;
  v8[3] = &unk_1E610A1F0;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)na_all:()NAAdditions
{
  id v4 = a3;
  if ([a1 count])
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 1;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __29__NSSet_NAAdditions__na_all___block_invoke;
    v7[3] = &unk_1E610A1F0;
    id v8 = v4;
    id v9 = &v10;
    [a1 enumerateObjectsUsingBlock:v7];
    BOOL v5 = *((unsigned char *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)na_setByRemovingObjectsFromSet:()NAAdditions
{
  id v4 = a3;
  BOOL v5 = (void *)[a1 mutableCopy];
  [v5 minusSet:v4];

  return v5;
}

- (id)na_setByIntersectingWithSet:()NAAdditions
{
  id v4 = a3;
  BOOL v5 = (void *)[a1 mutableCopy];
  [v5 intersectSet:v4];

  return v5;
}

- (id)na_setByDiffingWithSet:()NAAdditions
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__NSSet_NAAdditions__na_setByDiffingWithSet___block_invoke;
  v5[3] = &unk_1E610A240;
  void v5[4] = a1;
  id v3 = objc_msgSend(a3, "na_map:", v5);
  return v3;
}

- (id)na_reduceWithInitialValue:()NAAdditions reducer:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  id v8 = v6;
  id v20 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__NSSet_NAAdditions__na_reduceWithInitialValue_reducer___block_invoke;
  v12[3] = &unk_1E610A178;
  long long v14 = &v15;
  id v9 = v7;
  id v13 = v9;
  [a1 enumerateObjectsUsingBlock:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (uint64_t)na_allObjectsPassTest:()NAAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__NSSet_NAAdditions__na_allObjectsPassTest___block_invoke;
  v8[3] = &unk_1E610A1F0;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)na_dictionaryWithKeyGenerator:()NAAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
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
        uint64_t v12 = v4[2](v4, v11);
        if (v12) {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

@end