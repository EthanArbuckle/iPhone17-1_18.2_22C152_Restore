@interface NSArray(_PASAdditions)
+ (id)_pas_arrayNoCopyLeavesWithPropertyListData:()_PASAdditions error:;
+ (id)_pas_proxyArrayWithObject:()_PASAdditions repetitions:;
+ (void)_pas_proxyArrayUsingObjectAtIndexBlock:()_PASAdditions andCountBlock:;
- (__CFString)_pas_proxyComponentsJoinedByString:()_PASAdditions;
- (id)_pas_componentsJoinedByString:()_PASAdditions;
- (id)_pas_ensureImmutable;
- (id)_pas_filteredArrayWithIndexedTest:()_PASAdditions;
- (id)_pas_filteredArrayWithTest:()_PASAdditions;
- (id)_pas_leftFoldWithInitialObject:()_PASAdditions accumulate:;
- (id)_pas_leftFoldWithInitialObject:()_PASAdditions indexedAccumulate:;
- (id)_pas_mappedArrayWithIndexedTransform:()_PASAdditions;
- (id)_pas_mappedArrayWithTransform:()_PASAdditions;
- (id)_pas_proxyArrayByAppendingArray:()_PASAdditions;
- (id)_pas_proxyArrayDistillingStrings;
- (id)_pas_proxyArrayReversed;
- (id)_pas_proxyArrayRevivingStrings;
- (id)_pas_proxyArrayWithMapping:()_PASAdditions;
- (id)_pas_proxyArrayWithObjectsAtIndexes:()_PASAdditions;
- (id)_pas_proxyArrayWithRepetitions:()_PASAdditions;
- (id)_pas_proxySubarrayWithRange:()_PASAdditions;
- (id)_pas_rightFoldWithInitialObject:()_PASAdditions accumulate:;
- (id)_pas_rightFoldWithInitialObject:()_PASAdditions indexedAccumulate:;
- (id)_pas_shuffledArrayUsingRng:()_PASAdditions;
- (id)_pas_unlazyArray;
- (void)_pas_enumerateChunksOfSize:()_PASAdditions usingBlock:;
@end

@implementation NSArray(_PASAdditions)

- (id)_pas_componentsJoinedByString:()_PASAdditions
{
  v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "_pas_componentsJoinedByString called with a nil separator. Will use @\"\" instead.", v7, 2u);
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
    v4 = &stru_1EF678A50;
  }
  v5 = _PASJoinStrings(a1, v4);

  return v5;
}

- (id)_pas_mappedArrayWithTransform:()_PASAdditions
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"NSArray+_PASAdditions.m", 88, @"Invalid parameter not satisfying: %@", @"transform" object file lineNumber description];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__NSArray__PASAdditions___pas_mappedArrayWithTransform___block_invoke;
  v10[3] = &unk_1E5AEA958;
  id v11 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a1, "_pas_mappedArrayWithIndexedTransform:", v10);

  return v7;
}

- (id)_pas_filteredArrayWithIndexedTest:()_PASAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"NSArray+_PASAdditions.m", 96, @"Invalid parameter not satisfying: %@", @"test" object file lineNumber description];
  }
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1A62450A0]();
        if (v5[2](v5, v12, v9 + i)) {
          [v17 addObject:v12];
        }
      }
      v9 += i;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v17 copy];

  return v14;
}

- (id)_pas_mappedArrayWithIndexedTransform:()_PASAdditions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"NSArray+_PASAdditions.m", 75, @"Invalid parameter not satisfying: %@", @"transform" object file lineNumber description];
  }
  long long v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1A62450A0]();
        v14 = v5[2](v5, v12, v9 + i);
        if (v14) {
          [v18 addObject:v14];
        }
      }
      v9 += i;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  v15 = (void *)[v18 copy];

  return v15;
}

- (id)_pas_filteredArrayWithTest:()_PASAdditions
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"NSArray+_PASAdditions.m", 108, @"Invalid parameter not satisfying: %@", @"test" object file lineNumber description];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__NSArray__PASAdditions___pas_filteredArrayWithTest___block_invoke;
  v10[3] = &unk_1E5AEA980;
  id v11 = v5;
  id v6 = v5;
  uint64_t v7 = objc_msgSend(a1, "_pas_filteredArrayWithIndexedTest:", v10);

  return v7;
}

+ (id)_pas_proxyArrayWithObject:()_PASAdditions repetitions:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    if (a4 == 1)
    {
      v14[0] = v5;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __64__NSArray__PASAdditions___pas_proxyArrayWithObject_repetitions___block_invoke;
      v11[3] = &unk_1E5AEAAD0;
      uint64_t v13 = a4;
      id v12 = v5;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __64__NSArray__PASAdditions___pas_proxyArrayWithObject_repetitions___block_invoke_2;
      v10[3] = &__block_descriptor_40_e5_Q8__0l;
      void v10[4] = a4;
      uint64_t v7 = objc_msgSend(v8, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v11, v10);
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (id)_pas_unlazyArray
{
  if (objc_opt_respondsToSelector())
  {
    v2 = objc_msgSend(a1, "_pas_overrideUnlazyArray");
  }
  else
  {
    v2 = (void *)[a1 copy];
  }

  return v2;
}

- (id)_pas_proxyArrayReversed
{
  v1 = objc_msgSend(a1, "_pas_ensureImmutable");
  unint64_t v2 = [v1 count];
  if (v2 >= 2)
  {
    v3 = (void *)MEMORY[0x1E4F1C978];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__NSArray__PASAdditions___pas_proxyArrayReversed__block_invoke;
    v7[3] = &unk_1E5AEAAD0;
    id v8 = v1;
    unint64_t v9 = v2;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__NSArray__PASAdditions___pas_proxyArrayReversed__block_invoke_2;
    v6[3] = &__block_descriptor_40_e5_Q8__0l;
    v6[4] = v2;
    id v4 = v1;
    v1 = objc_msgSend(v3, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v7, v6);
  }

  return v1;
}

- (id)_pas_proxyArrayRevivingStrings
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__NSArray__PASAdditions___pas_proxyArrayRevivingStrings__block_invoke;
  v4[3] = &unk_1E5AEAB20;
  v4[4] = a1;
  v4[5] = a2;
  unint64_t v2 = objc_msgSend(a1, "_pas_proxyArrayWithMapping:", v4);

  return v2;
}

- (id)_pas_proxyArrayDistillingStrings
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__NSArray__PASAdditions___pas_proxyArrayDistillingStrings__block_invoke;
  v4[3] = &unk_1E5AEAAF8;
  v4[4] = a1;
  v4[5] = a2;
  unint64_t v2 = objc_msgSend(a1, "_pas_proxyArrayWithMapping:", v4);

  return v2;
}

- (id)_pas_proxyArrayWithRepetitions:()_PASAdditions
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = a1;
    }
    else
    {
      id v5 = objc_msgSend(a1, "_pas_ensureImmutable");
      uint64_t v6 = [v5 count];
      if (v6)
      {
        uint64_t v7 = v6;
        id v8 = (void *)MEMORY[0x1E4F1C978];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __57__NSArray__PASAdditions___pas_proxyArrayWithRepetitions___block_invoke;
        v11[3] = &unk_1E5AEAA60;
        uint64_t v13 = v6;
        uint64_t v14 = a3;
        id v12 = v5;
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __57__NSArray__PASAdditions___pas_proxyArrayWithRepetitions___block_invoke_2;
        v10[3] = &__block_descriptor_48_e5_Q8__0l;
        void v10[4] = v7;
        void v10[5] = a3;
        objc_msgSend(v8, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v11, v10);
        id v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v4 = (id)MEMORY[0x1E4F1CBF0];
      }
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (id)_pas_proxyArrayByAppendingArray:()_PASAdditions
{
  id v4 = a3;
  if (a1 == v4)
  {
    id v12 = objc_msgSend(a1, "_pas_proxyArrayWithRepetitions:", 2);
    goto LABEL_10;
  }
  id v5 = objc_msgSend(a1, "_pas_ensureImmutable");
  uint64_t v6 = [v5 count];
  uint64_t v7 = objc_msgSend(v4, "_pas_ensureImmutable");
  id v8 = v7;
  if (!v6)
  {
    id v13 = v7;
LABEL_8:
    id v12 = v13;
    goto LABEL_9;
  }
  uint64_t v9 = [v7 count];
  if (!v9)
  {
    id v13 = v5;
    goto LABEL_8;
  }
  uint64_t v10 = v9;
  id v11 = (void *)MEMORY[0x1E4F1C978];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__NSArray__PASAdditions___pas_proxyArrayByAppendingArray___block_invoke;
  v16[3] = &unk_1E5AEAA18;
  uint64_t v19 = v6;
  id v17 = v5;
  id v18 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__NSArray__PASAdditions___pas_proxyArrayByAppendingArray___block_invoke_2;
  v15[3] = &__block_descriptor_48_e5_Q8__0l;
  v15[4] = v6;
  v15[5] = v10;
  id v12 = objc_msgSend(v11, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v16, v15);

LABEL_9:
LABEL_10:

  return v12;
}

- (id)_pas_proxyArrayWithMapping:()_PASAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_pas_ensureImmutable");
  if ([v5 count])
  {
    uint64_t v6 = (void *)[v4 copy];
    uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__NSArray__PASAdditions___pas_proxyArrayWithMapping___block_invoke;
    v13[3] = &unk_1E5AEAAA8;
    id v15 = v6;
    id v14 = v5;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__NSArray__PASAdditions___pas_proxyArrayWithMapping___block_invoke_2;
    v11[3] = &unk_1E5AEAE40;
    id v12 = v14;
    id v8 = v6;
    uint64_t v9 = objc_msgSend(v7, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v13, v11);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)_pas_proxyArrayWithObjectsAtIndexes:()_PASAdditions
{
  id v5 = a3;
  uint64_t v6 = [v5 count];
  if (v6)
  {
    size_t v7 = v6;
    id v8 = objc_msgSend(a1, "_pas_ensureImmutable");
    unint64_t v9 = [v8 count];
    uint64_t v10 = [v5 firstIndex];
    unint64_t v11 = [v5 lastIndex];
    if (v11 >= v9) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"index %tu from indexSet out of range for array with count %tu", v11, v9);
    }
    if (v7 == v11 - v10 + 1)
    {
      id v12 = objc_msgSend(a1, "_pas_proxySubarrayWithRange:", v10, v7);
    }
    else
    {
      id v13 = malloc_type_calloc(v7, 8uLL, 0x100004000313F17uLL);
      if (!v13)
      {
        id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
        objc_exception_throw(v21);
      }
      id v14 = v13;
      uint64_t v15 = [v5 getIndexes:v13 maxCount:v7 inIndexRange:0];
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v14 length:8 * v7 freeWhenDone:1];
      if (v15 != v7)
      {
        long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, a1, @"NSArray+_PASAdditions.m", 328, @"Invalid parameter not satisfying: %@", @"indexesGotten == indexSetCount" object file lineNumber description];
      }
      id v17 = (void *)MEMORY[0x1E4F1C978];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __62__NSArray__PASAdditions___pas_proxyArrayWithObjectsAtIndexes___block_invoke;
      v23[3] = &unk_1E5AEAA18;
      size_t v26 = v7;
      id v24 = v16;
      id v25 = v8;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __62__NSArray__PASAdditions___pas_proxyArrayWithObjectsAtIndexes___block_invoke_2;
      v22[3] = &__block_descriptor_40_e5_Q8__0l;
      v22[4] = v7;
      id v18 = v16;
      id v12 = objc_msgSend(v17, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v23, v22);
    }
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)_pas_proxySubarrayWithRange:()_PASAdditions
{
  id v8 = objc_msgSend(a1, "_pas_ensureImmutable");
  NSUInteger v9 = [v8 count];
  v24.location = 0;
  v24.length = v9;
  v27.location = a3;
  v27.length = a4;
  NSRange v10 = NSIntersectionRange(v24, v27);
  if (a3 != v10.location || a4 != v10.length)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v25.location = a3;
    v25.length = a4;
    uint64_t v15 = NSStringFromRange(v25);
    v26.location = 0;
    v26.length = v9;
    v16 = NSStringFromRange(v26);
    [v14 handleFailureInMethod:a2, a1, @"NSArray+_PASAdditions.m", 272, @"Range %@ out of array bounds %@", v15, v16 object file lineNumber description];

    if (!a4) {
      goto LABEL_12;
    }
LABEL_7:
    if (a3 || v9 != a4)
    {
      id v13 = (void *)MEMORY[0x1E4F1C978];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __54__NSArray__PASAdditions___pas_proxySubarrayWithRange___block_invoke;
      v19[3] = &unk_1E5AEAA60;
      NSUInteger v21 = a3;
      NSUInteger v22 = a4;
      id v20 = v8;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __54__NSArray__PASAdditions___pas_proxySubarrayWithRange___block_invoke_2;
      v18[3] = &__block_descriptor_48_e5_Q8__0l;
      v18[4] = a3;
      v18[5] = a4;
      objc_msgSend(v13, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v19, v18);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = v8;
    }
    goto LABEL_13;
  }
  if (a4) {
    goto LABEL_7;
  }
LABEL_12:
  id v12 = (id)MEMORY[0x1E4F1CBF0];
LABEL_13:

  return v12;
}

- (id)_pas_ensureImmutable
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = (id)[a1 copy];
  }
  else {
    id v2 = a1;
  }

  return v2;
}

- (__CFString)_pas_proxyComponentsJoinedByString:()_PASAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5)
  {
    uint64_t v6 = v5;
    size_t v7 = (void *)[a1 copy];
    id v8 = (void *)[v4 copy];
    uint64_t v9 = 2 * v6 - 1;
    NSRange v10 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __61__NSArray__PASAdditions___pas_proxyComponentsJoinedByString___block_invoke;
    NSRange v24 = &unk_1E5AEAA18;
    id v26 = v8;
    uint64_t v27 = v9;
    id v25 = v7;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __61__NSArray__PASAdditions___pas_proxyComponentsJoinedByString___block_invoke_2;
    uint64_t v19 = &__block_descriptor_40_e5_Q8__0l;
    uint64_t v20 = v9;
    id v11 = v8;
    id v12 = v7;
    id v13 = objc_msgSend(v10, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", &v21, &v16);
    objc_msgSend(NSString, "_pas_proxyStringByConcatenatingStrings:", v13, v16, v17, v18, v19, v20, v21, v22, v23, v24);
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = &stru_1EF678A50;
  }

  return v14;
}

- (void)_pas_enumerateChunksOfSize:()_PASAdditions usingBlock:
{
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (a3)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"NSArray+_PASAdditions.m" lineNumber:177 description:@"Chunk size must be nonzero"];

    if (v8) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"NSArray+_PASAdditions.m", 178, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_3:
  if ([a1 count])
  {
    if ([a1 count] <= a3)
    {
      char v17 = 0;
      ((void (**)(void, void *, char *))v8)[2](v8, a1, &v17);
    }
    else
    {
      NSUInteger v9 = [a1 count];
      unsigned __int8 v16 = 0;
      if ([a1 count])
      {
        NSUInteger v10 = 0;
        do
        {
          id v11 = (void *)MEMORY[0x1A62450A0]();
          v18.location = v10;
          v18.length = a3;
          v19.location = 0;
          v19.length = v9;
          NSRange v12 = NSIntersectionRange(v18, v19);
          id v13 = objc_msgSend(a1, "subarrayWithRange:", v12.location, v12.length);
          ((void (**)(void, void *, unsigned __int8 *))v8)[2](v8, v13, &v16);

          LODWORD(v13) = v16;
          if (v13) {
            break;
          }
          v10 += a3;
        }
        while (v10 < [a1 count]);
      }
    }
  }
}

- (id)_pas_shuffledArrayUsingRng:()_PASAdditions
{
  id v5 = a3;
  if ((unint64_t)[a1 count] > 1)
  {
    if (v5)
    {
      id v7 = v13;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __53__NSArray__PASAdditions___pas_shuffledArrayUsingRng___block_invoke;
      v13[3] = &unk_1E5AEA9D0;
      v3 = &v14;
      id v14 = v5;
    }
    else
    {
      id v7 = &__block_literal_global_408;
    }
    id v8 = (uint64_t (**)(void, void))MEMORY[0x1A6245320](v7);
    NSUInteger v9 = (void *)[a1 mutableCopy];
    uint64_t v10 = [v9 count];
    uint64_t v11 = v10 - 1;
    if (v10 != 1)
    {
      do
      {
        objc_msgSend(v9, "exchangeObjectAtIndex:withObjectAtIndex:", v11, v8[2](v8, v11 + 1));
        --v11;
      }
      while (v11);
    }
    uint64_t v6 = (void *)[v9 copy];

    if (v5) {
  }
    }
  else
  {
    uint64_t v6 = (void *)[a1 copy];
  }

  return v6;
}

- (id)_pas_rightFoldWithInitialObject:()_PASAdditions accumulate:
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    NSRange v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"NSArray+_PASAdditions.m", 151, @"Invalid parameter not satisfying: %@", @"accumulate" object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__NSArray__PASAdditions___pas_rightFoldWithInitialObject_accumulate___block_invoke;
  v13[3] = &unk_1E5AEA9A8;
  id v14 = v8;
  id v9 = v8;
  uint64_t v10 = objc_msgSend(a1, "_pas_rightFoldWithInitialObject:indexedAccumulate:", v7, v13);

  return v10;
}

- (id)_pas_rightFoldWithInitialObject:()_PASAdditions indexedAccumulate:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    NSRange v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"NSArray+_PASAdditions.m", 139, @"Invalid parameter not satisfying: %@", @"accumulate" object file lineNumber description];
  }
  id v9 = v7;
  uint64_t v10 = [a1 count];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [a1 reverseObjectEnumerator];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  id v13 = v9;
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v21;
    id v13 = v9;
    do
    {
      uint64_t v16 = 0;
      char v17 = v13;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v11);
        }
        id v13 = v8[2](v8, v17, *(void *)(*((void *)&v20 + 1) + 8 * v16), --v10);

        ++v16;
        char v17 = v13;
      }
      while (v14 != v16);
      uint64_t v14 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  return v13;
}

- (id)_pas_leftFoldWithInitialObject:()_PASAdditions accumulate:
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"NSArray+_PASAdditions.m", 129, @"Invalid parameter not satisfying: %@", @"accumulate" object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__NSArray__PASAdditions___pas_leftFoldWithInitialObject_accumulate___block_invoke;
  v13[3] = &unk_1E5AEA9A8;
  id v14 = v8;
  id v9 = v8;
  uint64_t v10 = objc_msgSend(a1, "_pas_leftFoldWithInitialObject:indexedAccumulate:", v7, v13);

  return v10;
}

- (id)_pas_leftFoldWithInitialObject:()_PASAdditions indexedAccumulate:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    NSRange v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"NSArray+_PASAdditions.m", 117, @"Invalid parameter not satisfying: %@", @"accumulate" object file lineNumber description];
  }
  id v9 = v7;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a1;
  uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  long long v20 = v9;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0;
      uint64_t v15 = v9;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v14);
        char v17 = (void *)MEMORY[0x1A62450A0]();
        v8[2](v8, v15, v16, v12 + v14);
        id v9 = (id)objc_claimAutoreleasedReturnValue();

        ++v14;
        uint64_t v15 = v9;
      }
      while (v11 != v14);
      v12 += v14;
      uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  return v9;
}

+ (id)_pas_arrayNoCopyLeavesWithPropertyListData:()_PASAdditions error:
{
  id v5 = a3;
  uint64_t v6 = +[_PASLazyPlist arrayWithData:v5 error:a4];
  id v7 = objc_msgSend(v6, "_pas_unlazyArray");

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:a4];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v11 = 0;
    if (isKindOfClass)
    {
      id v11 = v9;
      if (a4) {
        *a4 = 0;
      }
    }
    id v8 = v11;
  }

  return v8;
}

+ (void)_pas_proxyArrayUsingObjectAtIndexBlock:()_PASAdditions andCountBlock:
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  uint64_t v8 = [v6 copy];

  id v9 = (void *)v7[1];
  v7[1] = v8;

  uint64_t v10 = [v5 copy];
  id v11 = (void *)v7[2];
  v7[2] = v10;

  return v7;
}

@end