@interface SARecipe
- (NSArray)states;
- (uint64_t)addState:(unsigned char *)a3 hasConcurrentExecution:;
- (uint64_t)addStates:(unsigned char *)a3 hasConcurrentExecution:;
- (uint64_t)indexOfFirstStateOnOrAfterTime:(unint64_t)a3 sampleIndex:;
- (uint64_t)indexOfLastStateOnOrBeforeTime:(unint64_t)a3 sampleIndex:;
- (unint64_t)identifier;
- (void)enumerateStatesBetweenStartTime:(unint64_t)a3 startSampleIndex:(void *)a4 endTime:(unint64_t)a5 endSampleIndex:(char)a6 reverseOrder:(void *)a7 block:;
- (void)initWithId:(void *)a1;
- (void)insertState:(unsigned char *)a3 hasConcurrentExecution:;
@end

@implementation SARecipe

- (void)initWithId:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)SARecipe;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[2] = a2;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = (void *)v4[1];
    v4[1] = v5;
  }
  return v4;
}

- (uint64_t)addState:(unsigned char *)a3 hasConcurrentExecution:
{
  id v5 = a2;
  if (a1)
  {
    if (a3)
    {
      v6 = [*(id *)(a1 + 8) lastObject];
      v7 = v6;
      if (v6)
      {
        objc_super v8 = [v6 thread];
        v9 = [v5 thread];
        if (v8 == v9)
        {
          char v13 = 0;
        }
        else
        {
          v15 = [v7 threadState];
          v10 = [v15 endTimestamp];
          v11 = [v5 threadState];
          v12 = [v11 startTimestamp];
          char v13 = [v10 ge:v12];
        }
      }
      else
      {
        char v13 = 0;
      }
      *a3 = v13;
    }
    [*(id *)(a1 + 8) addObject:v5];
    a1 = [*(id *)(a1 + 8) count] - 1;
  }

  return a1;
}

- (void)insertState:(unsigned char *)a3 hasConcurrentExecution:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [*(id *)(a1 + 8) addObject:v5];
  [*(id *)(a1 + 8) sortUsingComparator:&__block_literal_global_6];
  if (a3)
  {
    v19 = a3;
    id v20 = v5;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = *(id *)(a1 + 8);
    uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v11 = [0 thread];
          uint64_t v12 = [v10 thread];
          if (v11 == (void *)v12)
          {
          }
          else
          {
            char v13 = (void *)v12;
            v14 = [0 threadState];
            v15 = [v14 endTimestamp];
            v16 = [v10 threadState];
            v17 = [v16 startTimestamp];
            int v18 = [v15 ge:v17];

            if (v18)
            {
              unsigned char *v19 = 1;
              goto LABEL_13;
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
    }
LABEL_13:

    id v5 = v20;
  }
}

uint64_t __47__SARecipe_insertState_hasConcurrentExecution___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 threadState];
  uint64_t v6 = [v5 startTimestamp];
  uint64_t v7 = [v4 threadState];

  uint64_t v8 = [v7 startTimestamp];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (uint64_t)addStates:(unsigned char *)a3 hasConcurrentExecution:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a1)
  {
LABEL_12:

    return a1;
  }
  if ([v5 count])
  {
    if (a3)
    {
      uint64_t v7 = [*(id *)(a1 + 8) lastObject];
      uint64_t v8 = v7;
      if (v7)
      {
        uint64_t v9 = [v7 thread];
        v10 = [v6 firstObject];
        v11 = [v10 thread];
        if (v9 == v11)
        {
          char v15 = 0;
        }
        else
        {
          uint64_t v27 = [v8 threadState];
          v26 = [v27 endTimestamp];
          uint64_t v12 = [v6 firstObject];
          [v12 threadState];
          char v13 = v28 = v9;
          v14 = [v13 startTimestamp];
          char v15 = [v26 ge:v14];

          uint64_t v9 = v28;
        }
      }
      else
      {
        char v15 = 0;
      }
      *a3 = v15;
    }
    [*(id *)(a1 + 8) addObjectsFromArray:v6];
    a1 = [*(id *)(a1 + 8) count] - 1;
    goto LABEL_12;
  }
  int v17 = *__error();
  int v18 = _sa_logt();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BF22B000, v18, OS_LOG_TYPE_ERROR, "0 recipeStates.count", buf, 2u);
  }

  *__error() = v17;
  _SASetCrashLogMessage(3534, "0 recipeStates.count", v19, v20, v21, v22, v23, v24, v25);
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

- (void)enumerateStatesBetweenStartTime:(unint64_t)a3 startSampleIndex:(void *)a4 endTime:(unint64_t)a5 endSampleIndex:(char)a6 reverseOrder:(void *)a7 block:
{
  id v13 = a2;
  id v14 = a4;
  id v15 = a7;
  if (a1)
  {
    uint64_t v16 = -[SARecipe indexOfFirstStateOnOrAfterTime:sampleIndex:](a1, v13, a3);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v17 = v16;
      unint64_t v18 = -[SARecipe indexOfLastStateOnOrBeforeTime:sampleIndex:](a1, v14, a5);
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v19 = v18;
        if (v17 <= v18)
        {
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __103__SARecipe_enumerateStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke;
          v22[3] = &unk_1E63F8D70;
          v22[4] = a1;
          id v23 = v15;
          uint64_t v20 = (uint64_t (**)(void, void))MEMORY[0x1C18A6C80](v22);
          if (a6)
          {
            do
            {
              if (v19 + 1 <= v17) {
                break;
              }
              char v21 = v20[2](v20, v19--);
            }
            while ((v21 & 1) == 0);
          }
          else
          {
            do
            {
              if (v20[2](v20, v17)) {
                break;
              }
              ++v17;
            }
            while (v17 <= v19);
          }
        }
      }
    }
  }
}

- (uint64_t)indexOfFirstStateOnOrAfterTime:(unint64_t)a3 sampleIndex:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    if (v5)
    {
      uint64_t v7 = *(void **)(a1 + 8);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __55__SARecipe_indexOfFirstStateOnOrAfterTime_sampleIndex___block_invoke;
      v15[3] = &unk_1E63F8E58;
      id v16 = v5;
      unint64_t v8 = SABinarySearchArray(v7, 1280, (uint64_t)v15);
    }
    else
    {
      unint64_t v8 = 0;
    }
    if (a3 != 0x7FFFFFFFFFFFFFFFLL && v8 < [*(id *)(a1 + 8) count])
    {
      do
      {
        uint64_t v9 = [*(id *)(a1 + 8) objectAtIndexedSubscript:v8];
        v10 = [v9 threadState];
        if ([v10 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {
        }
        else
        {
          v11 = [*(id *)(a1 + 8) objectAtIndexedSubscript:v8];
          uint64_t v12 = [v11 threadState];
          unint64_t v13 = [v12 endSampleIndex];

          if (v13 >= a3) {
            break;
          }
        }
        ++v8;
      }
      while (v8 < [*(id *)(a1 + 8) count]);
    }
    if (v8 >= [*(id *)(a1 + 8) count]) {
      a1 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      a1 = v8;
    }
  }

  return a1;
}

- (uint64_t)indexOfLastStateOnOrBeforeTime:(unint64_t)a3 sampleIndex:
{
  id v5 = a2;
  if (!a1)
  {
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  if (![*(id *)(a1 + 8) count]) {
    goto LABEL_5;
  }
  uint64_t v6 = *(void **)(a1 + 8);
  if (v5)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__SARecipe_indexOfLastStateOnOrBeforeTime_sampleIndex___block_invoke;
    v15[3] = &unk_1E63F8E58;
    id v16 = v5;
    uint64_t v7 = SABinarySearchArray(v6, 1536, (uint64_t)v15);

    if (!v7) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 8) count];
  }
  uint64_t v8 = v7 - 1;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_8;
  }
  while (1)
  {
    v10 = [*(id *)(a1 + 8) objectAtIndexedSubscript:v8];
    v11 = [v10 threadState];
    if ([v11 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
    }
    else
    {
      uint64_t v12 = [*(id *)(a1 + 8) objectAtIndexedSubscript:v8];
      unint64_t v13 = [v12 threadState];
      unint64_t v14 = [v13 startSampleIndex];

      if (v14 <= a3) {
        goto LABEL_8;
      }
    }
    if (!v8) {
      break;
    }
    --v8;
  }
LABEL_5:
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_8:

  return v8;
}

uint64_t __103__SARecipe_enumerateStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v5 = 0;
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:a2];
  (*(void (**)(uint64_t, void *, unsigned __int8 *))(v2 + 16))(v2, v3, &v5);

  return v5;
}

uint64_t __55__SARecipe_indexOfFirstStateOnOrAfterTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  unsigned __int8 v5 = [v3 threadState];
  uint64_t v6 = [v5 startTimestamp];
  LOBYTE(v4) = [v4 lt:v6];

  if (v4)
  {
    uint64_t v7 = -1;
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v3 threadState];
    v10 = [v9 endTimestamp];
    LODWORD(v7) = [v8 gt:v10];

    uint64_t v7 = v7;
  }

  return v7;
}

uint64_t __55__SARecipe_indexOfLastStateOnOrBeforeTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  unsigned __int8 v5 = [v3 threadState];
  uint64_t v6 = [v5 startTimestamp];
  LOBYTE(v4) = [v4 lt:v6];

  if (v4)
  {
    uint64_t v7 = -1;
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v3 threadState];
    v10 = [v9 endTimestamp];
    LODWORD(v7) = [v8 gt:v10];

    uint64_t v7 = v7;
  }

  return v7;
}

- (NSArray)states
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end