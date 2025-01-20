@interface TPSTargetingValidator
+ (BOOL)validateConditions:(id)a3 joinType:(int64_t)a4 context:(id)a5 cache:(id)a6 completionQueue:(id)a7 error:(id *)a8;
+ (void)_validateCondition:(id)a3 joinType:(int64_t)a4 context:(id)a5 cache:(id)a6 completionQueue:(id)a7 completionHandler:(id)a8;
+ (void)validateConditions:(id)a3 joinType:(int64_t)a4 context:(id)a5 cache:(id)a6 completionQueue:(id)a7 completionHandler:(id)a8;
@end

@implementation TPSTargetingValidator

uint64_t __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

+ (void)validateConditions:(id)a3 joinType:(int64_t)a4 context:(id)a5 cache:(id)a6 completionQueue:(id)a7 completionHandler:(id)a8
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  v13 = (__CFString *)a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v17 = @"unspecified";
  v49 = v13;
  if (v13) {
    v17 = v13;
  }
  v48 = v17;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2020000000;
  char v81 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6E6AF20;
  v77 = &v78;
  id v41 = v15;
  id v75 = v41;
  id v40 = v16;
  id v76 = v40;
  v50 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  if (([MEMORY[0x1E4FAF450] ignoreTargetingValidator] & 1) != 0 || !objc_msgSend(v42, "count"))
  {
    v50[2](v50, 1, 0);
  }
  else
  {
    if ([v42 count] == 1)
    {
      id v18 = [v42 firstObject];
      [a1 _validateCondition:v18 joinType:a4 context:v13 cache:v14 completionQueue:v41 completionHandler:v50];
    }
    else
    {
      v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v42, "count"));
      id v20 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      [v20 setMaxConcurrentOperationCount:-1];
      [v20 setSuspended:1];
      v46 = v20;
      v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v22 = dispatch_queue_create(0, v21);

      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_3;
      v73[3] = &__block_descriptor_40_e8_B16__0q8l;
      v73[4] = a4;
      v45 = _Block_copy(v73);
      v43 = objc_opt_new();
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id obj = v42;
      uint64_t v23 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v70 != v24) {
              objc_enumerationMutation(obj);
            }
            v26 = *(void **)(*((void *)&v69 + 1) + 8 * i);
            v27 = [[TPSTargetingValidateOperation alloc] initWithTargetingCondition:v26];
            [(TPSTargetingValidateOperation *)v27 setContext:v49];
            v28 = [v26 identifier];
            if (v14)
            {
              uint64_t v29 = [v14 cacheResultForIdentifier:v28];
              if (v29 != -1)
              {
                [(TPSTargetingValidateOperation *)v27 setResult:v29];
                [v43 addObject:v27];
              }
            }
            objc_initWeak(&location, v27);
            v58[0] = MEMORY[0x1E4F143A8];
            v58[1] = 3221225472;
            v58[2] = __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_4;
            v58[3] = &unk_1E6E6AF90;
            objc_copyWeak(v67, &location);
            v59 = v22;
            id v60 = v14;
            id v30 = v28;
            id v61 = v30;
            id v64 = v45;
            v66 = &v78;
            v62 = v48;
            v65 = v50;
            v67[1] = (id)a4;
            id v63 = v46;
            [(TPSTargetingValidateOperation *)v27 setCompletionBlock:v58];
            [v19 addObject:v27];

            objc_destroyWeak(v67);
            objc_destroyWeak(&location);
          }
          uint64_t v23 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
        }
        while (v23);
      }

      v31 = v46;
      [v46 addOperations:v19 waitUntilFinished:0];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_8;
      v51[3] = &unk_1E6E6AFE0;
      v32 = v22;
      v52 = v32;
      v33 = v48;
      v53 = v33;
      v56 = &v78;
      id v18 = v19;
      id v54 = v18;
      int64_t v57 = a4;
      v34 = v50;
      id v55 = v34;
      [v46 addBarrierBlock:v51];
      if ([v43 count])
      {
        v35 = (void *)MEMORY[0x1E4F28F60];
        v36 = [NSNumber numberWithInteger:a4 == 1];
        v37 = [v35 predicateWithFormat:@"(result == %@)", v36];
        v38 = [v18 filteredArrayUsingPredicate:v37];

        if ([v38 count])
        {
          v39 = [MEMORY[0x1E4FAF480] targeting];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
            +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:completionHandler:]((uint64_t)v33, a4 == 1, v39);
          }

          v34[2](v34, a4 == 1, 0);
        }

        v31 = v46;
      }
      if (*((unsigned char *)v79 + 24)) {
        [v31 cancelAllOperations];
      }
      [v31 setSuspended:0];
    }
  }

  _Block_object_dispose(&v78, 8);
}

+ (void)_validateCondition:(id)a3 joinType:(int64_t)a4 context:(id)a5 cache:(id)a6 completionQueue:(id)a7 completionHandler:(id)a8
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v12 = (__CFString *)a5;
  id v13 = a6;
  id v14 = a8;
  id v15 = [v11 identifier];
  if (!v13 || (uint64_t v16 = [v13 cacheResultForIdentifier:v15], v16 == -1))
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __101__TPSTargetingValidator__validateCondition_joinType_context_cache_completionQueue_completionHandler___block_invoke;
    v21[3] = &unk_1E6E6B008;
    id v22 = v13;
    id v23 = v15;
    id v24 = v14;
    [v11 validateWithCompletion:v21];
  }
  else
  {
    uint64_t v17 = v16;
    id v18 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = @"unspecified";
      if (v12) {
        v19 = v12;
      }
      id v20 = @"NO";
      *(_DWORD *)buf = 138412802;
      v26 = v19;
      __int16 v27 = 2112;
      v28 = v15;
      if (v17 == 1) {
        id v20 = @"YES";
      }
      __int16 v29 = 2112;
      id v30 = v20;
      _os_log_debug_impl(&dword_1E4492000, v18, OS_LOG_TYPE_DEBUG, "[%@] - Using cached result for precondition (%@) - Valid: %@", buf, 0x20u);
    }

    (*((void (**)(id, BOOL, void))v14 + 2))(v14, v17 == 1, 0);
  }
}

void __101__TPSTargetingValidator__validateCondition_joinType_context_cache_completionQueue_completionHandler___block_invoke(void *a1, unsigned int a2, void *a3)
{
  uint64_t v4 = a2;
  v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  id v7 = a3;
  [v5 addCacheResult:v4 forIdentifier:v6];
  (*(void (**)(void))(a1[6] + 16))();
}

void __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v6 + 24))
  {
    *(unsigned char *)(v6 + 24) = 1;
    id v7 = *(void **)(a1 + 32);
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      v8 = MEMORY[0x1E4F14428];
      id v9 = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_2;
    block[3] = &unk_1E6E6AEF8;
    id v12 = *(id *)(a1 + 40);
    char v13 = a2;
    id v11 = v5;
    dispatch_async(v8, block);
  }
}

uint64_t __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  if ([*(id *)(a1 + 32) result] != -1) {
    objc_msgSend(*(id *)(a1 + 40), "addCacheResult:forIdentifier:", objc_msgSend(*(id *)(a1 + 32), "result"), *(void *)(a1 + 48));
  }
  uint64_t result = (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), [*(id *)(a1 + 32) result]);
  if (result && !*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    v3 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_5_cold_1(a1, v3);
    }

    (*(void (**)(void, BOOL, void))(*(void *)(a1 + 80) + 16))(*(void *)(a1 + 80), *(void *)(a1 + 96) == 1, 0);
    uint64_t result = [*(id *)(a1 + 64) operationCount];
    if (result) {
      return [*(id *)(a1 + 64) cancelAllOperations];
    }
  }
  return result;
}

BOOL __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(void *)(a1 + 32) == 0) != a2;
}

void __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_2_9(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_2_9_cold_1(a1, v2);
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(result == %@)", &unk_1F4022200];
    id v5 = [v3 filteredArrayUsingPredicate:v4];

    uint64_t v6 = *(void *)(a1 + 64);
    [v5 count];
    if (!v6) {
      [*(id *)(a1 + 40) count];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_5;
  block[3] = &unk_1E6E6AF68;
  id v10 = WeakRetained;
  v3 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 88);
  id v15 = v4;
  uint64_t v17 = v5;
  id v13 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 104);
  id v16 = v6;
  uint64_t v18 = v7;
  id v14 = *(id *)(a1 + 64);
  id v8 = WeakRetained;
  dispatch_async(v3, block);
}

void __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_8(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_2_9;
  block[3] = &unk_1E6E6AFB8;
  v2 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  id v8 = v3;
  uint64_t v11 = v4;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 72);
  id v9 = v5;
  uint64_t v12 = v6;
  id v10 = *(id *)(a1 + 56);
  dispatch_async(v2, block);
}

+ (BOOL)validateConditions:(id)a3 joinType:(int64_t)a4 context:(id)a5 cache:(id)a6 completionQueue:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy_;
  uint64_t v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  uint64_t v18 = objc_opt_class();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __89__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_error___block_invoke;
  v23[3] = &unk_1E6E6AED0;
  v25 = &v33;
  v26 = &v27;
  v19 = v17;
  id v24 = v19;
  [v18 validateConditions:v13 joinType:a4 context:v14 cache:v15 completionQueue:v16 completionHandler:v23];
  dispatch_time_t v20 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v19, v20);
  if (a8) {
    *a8 = (id) v28[5];
  }
  char v21 = *((unsigned char *)v34 + 24);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v21;
}

void __89__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_error___block_invoke(uint64_t a1, char a2, id obj)
{
  if (obj) {
    char v5 = 0;
  }
  else {
    char v5 = a2;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v6 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)validateConditions:(os_log_t)log joinType:context:cache:completionQueue:completionHandler:.cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = @"YES";
  if ((a2 & 1) == 0) {
    id v3 = @"NO";
  }
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1E4492000, log, OS_LOG_TYPE_DEBUG, "[%@] - Using cached results - Valid: %@", (uint8_t *)&v4, 0x16u);
}

void __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "[%@] - EARLY EXITING", (uint8_t *)&v3, 0xCu);
}

void __101__TPSTargetingValidator_validateConditions_joinType_context_cache_completionQueue_completionHandler___block_invoke_2_9_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "[%@] - ALL FINISHED", (uint8_t *)&v3, 0xCu);
}

@end