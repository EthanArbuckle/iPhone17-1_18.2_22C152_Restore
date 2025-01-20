@interface NSArray(NAAdditions)
+ (id)na_arrayByRepeatingWithCount:()NAAdditions generatorBlock:;
+ (id)na_arrayWithSafeObject:()NAAdditions;
+ (id)na_arrayWithTerminator:()NAAdditions nullableObjects:;
- (BOOL)na_all:()NAAdditions;
- (id)na_arrayByFlattening;
- (id)na_arrayWithResultsOfBlock:()NAAdditions;
- (id)na_dictionaryByBucketingObjectsUsingKeyGenerator:()NAAdditions;
- (id)na_dictionaryWithKeyGenerator:()NAAdditions;
- (id)na_filter:()NAAdditions;
- (id)na_firstObjectPassingTest:()NAAdditions;
- (id)na_flatMap:()NAAdditions;
- (id)na_map:()NAAdditions;
- (id)na_reduceWithInitialValue:()NAAdditions reducer:;
- (uint64_t)na_allObjectsPassTest:()NAAdditions;
- (uint64_t)na_any:()NAAdditions;
- (uint64_t)na_safeContainsObject:()NAAdditions;
- (uint64_t)na_safeSubarrayWithRange:()NAAdditions;
- (void)na_each:()NAAdditions;
@end

@implementation NSArray(NAAdditions)

- (uint64_t)na_any:()NAAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__NSArray_NAAdditions__na_any___block_invoke;
  v8[3] = &unk_1E6109E48;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)na_firstObjectPassingTest:()NAAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  char v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__NSArray_NAAdditions__na_firstObjectPassingTest___block_invoke;
  v8[3] = &unk_1E6109E48;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)na_flatMap:()NAAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
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
          objc_msgSend(v5, "addObjectsFromArray:", v11, (void)v13);
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
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
          objc_msgSend(v5, "addObject:", v11, (void)v13);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)na_filter:()NAAdditions
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__NSArray_NAAdditions__na_filter___block_invoke;
  v9[3] = &unk_1E6109E98;
  id v10 = v4;
  id v5 = v4;
  id v6 = [a1 indexesOfObjectsPassingTest:v9];
  uint64_t v7 = [a1 objectsAtIndexes:v6];

  return v7;
}

- (void)na_each:()NAAdditions
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__NSArray_NAAdditions__na_each___block_invoke;
  v6[3] = &unk_1E6109EC0;
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
            long long v13 = objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v12, &__block_literal_global_4, (void)v15);
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

- (uint64_t)na_allObjectsPassTest:()NAAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__NSArray_NAAdditions__na_allObjectsPassTest___block_invoke;
  v8[3] = &unk_1E6109E48;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
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

- (id)na_reduceWithInitialValue:()NAAdditions reducer:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  id v8 = v6;
  id v20 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__NSArray_NAAdditions__na_reduceWithInitialValue_reducer___block_invoke;
  v12[3] = &unk_1E6109E20;
  char v14 = &v15;
  id v9 = v7;
  id v13 = v9;
  [a1 enumerateObjectsUsingBlock:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
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
        v12 = v4[2](v4, v11);
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

- (id)na_arrayWithResultsOfBlock:()NAAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__NSArray_NAAdditions__na_arrayWithResultsOfBlock___block_invoke;
  v11[3] = &unk_1E6109E70;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  uint64_t v8 = v12;
  id v9 = v6;

  return v9;
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
    v7[2] = __31__NSArray_NAAdditions__na_all___block_invoke;
    v7[3] = &unk_1E6109E48;
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

- (id)na_arrayByFlattening
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__NSArray_NAAdditions__na_arrayByFlattening__block_invoke;
  v5[3] = &unk_1E6109EE8;
  id v3 = v2;
  id v6 = v3;
  objc_msgSend(a1, "na_each:", v5);

  return v3;
}

- (uint64_t)na_safeSubarrayWithRange:()NAAdditions
{
  unint64_t v6 = a3 + a4;
  unint64_t v7 = [a1 count];
  if (v6 >= v7) {
    unint64_t v6 = v7;
  }
  unint64_t v8 = [a1 count];
  if (a3 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = a3;
  }
  return objc_msgSend(a1, "subarrayWithRange:", v9, v6 - v9);
}

+ (id)na_arrayByRepeatingWithCount:()NAAdditions generatorBlock:
{
  BOOL v5 = a4;
  for (uint64_t i = [MEMORY[0x1E4F1CA48] array];
  {
    unint64_t v7 = v5[2](v5);
    [i addObject:v7];
  }
  return i;
}

+ (id)na_arrayWithSafeObject:()NAAdditions
{
  if (a3) {
    objc_msgSend(a1, "arrayWithObject:");
  }
  else {
  id v3 = [a1 array];
  }
  return v3;
}

+ (id)na_arrayWithTerminator:()NAAdditions nullableObjects:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v28 = (id *)&a9;
  id v12 = a4;
  char v13 = v12;
  if (v12 == v11)
  {
    unint64_t v14 = 0;
    long long v18 = v12;
  }
  else
  {
    unint64_t v14 = 0;
    long long v15 = v12;
    do
    {
      ++v14;
      long long v16 = v28++;
      id v17 = *v16;

      long long v15 = v17;
    }
    while (v17 != v11);
    long long v18 = v11;
  }

  uint64_t v19 = (id **)((char *)&v28 - ((8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v19, 8 * v14);
  if (v14)
  {
    v28 = (id *)&a9;
    if (v13)
    {
      *uint64_t v19 = v13;
    }
    else
    {
      id v20 = [MEMORY[0x1E4F1CA98] null];
      *uint64_t v19 = v20;
    }
    if (v14 >= 2)
    {
      unint64_t v21 = v14 - 1;
      v22 = v19 + 1;
      do
      {
        v23 = v28++;
        id v24 = *v23;
        if (v24)
        {
          void *v22 = v24;
        }
        else
        {
          v25 = [MEMORY[0x1E4F1CA98] null];
          void *v22 = v25;
        }
        ++v22;
        --v21;
      }
      while (v21);
    }
  }
  v26 = objc_msgSend(a1, "arrayWithObjects:count:", (char *)&v28 - ((8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0), v14, v28, v29);

  return v26;
}

@end