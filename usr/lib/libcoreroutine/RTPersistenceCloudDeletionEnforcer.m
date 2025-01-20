@interface RTPersistenceCloudDeletionEnforcer
- (BOOL)applyTombstonesToEntityWithName:(id)a3 identifiers:(id)a4 context:(id)a5 error:(id *)a6;
- (BOOL)performBatchDeleteOfEntityWithName:(id)a3 identifiers:(id)a4 context:(id)a5 error:(id *)a6;
- (BOOL)processRequestsSinceReferenceDate:(id)a3 context:(id)a4 error:(id *)a5;
@end

@implementation RTPersistenceCloudDeletionEnforcer

- (BOOL)processRequestsSinceReferenceDate:(id)a3 context:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v9 options] & 2) == 0)
    {
      id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This opertion requires a context with RTPersistenceContextOptionsAllowTombstones." userInfo:0];
      objc_exception_throw(v15);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__104;
    v24 = __Block_byref_object_dispose__104;
    id v25 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__RTPersistenceCloudDeletionEnforcer_processRequestsSinceReferenceDate_context_error___block_invoke;
    v16[3] = &unk_1E6B997D8;
    id v17 = v8;
    v19 = self;
    p_long long buf = &buf;
    id v18 = v9;
    [v18 performBlockAndWait:v16];
    if (a5) {
      *a5 = *(id *)(*((void *)&buf + 1) + 40);
    }
    BOOL v10 = *(void *)(*((void *)&buf + 1) + 40) == 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"A managed object context is required.";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v11];
    v13 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"A managed object context is required.";
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
    }

    if (a5) {
      *a5 = v12;
    }

    BOOL v10 = 0;
  }

  return v10;
}

void __86__RTPersistenceCloudDeletionEnforcer_processRequestsSinceReferenceDate_context_error___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v2 = +[RTEntityDeletionRequestMO fetchRequest];
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = *(void **)(a1 + 32);
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  v6 = [v3 predicateWithFormat:@"%K >= %@", @"creationDate", v5];
  [v2 setPredicate:v6];

  if (!v4) {
  [v2 setFetchLimit:10];
  }
  id v7 = 0;
  v39 = v2;
  while (1)
  {
    id v8 = *(void **)(a1 + 40);
    id v52 = 0;
    id v9 = [v8 executeFetchRequest:v2 error:&v52];
    id v10 = v52;

    if (v10) {
      break;
    }
    uint64_t v11 = [v9 count];
    v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (!v11)
    {
      if (v13)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "no entity deletion requests to process", buf, 2u);
      }
      goto LABEL_31;
    }
    if (v13)
    {
      uint64_t v14 = [v9 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v55 = v14;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "processing %lu entity deletion requests", buf, 0xCu);
    }

    v40 = [*(id *)(a1 + 40) transactionAuthor];
    [*(id *)(a1 + 40) setTransactionAuthor:@"CloudDeletion"];
    v43 = objc_opt_new();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v41 = v9;
    id v7 = v9;
    uint64_t v15 = [v7 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v49;
      id obj = v7;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v49 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1E016D870]();
          v21 = [v19 recordIDs];
          uint64_t v22 = [v19 targetDeviceIdentifier];
          uint64_t v23 = a1;
          v24 = [*(id *)(a1 + 40) currentDevice];
          id v25 = [v24 identifier];
          int v26 = [v22 isEqual:v25];

          if (v26)
          {
            v27 = (int8x16_t *)v47;
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v28 = __86__RTPersistenceCloudDeletionEnforcer_processRequestsSinceReferenceDate_context_error___block_invoke_20;
          }
          else
          {
            v27 = (int8x16_t *)v46;
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v28 = __86__RTPersistenceCloudDeletionEnforcer_processRequestsSinceReferenceDate_context_error___block_invoke_2;
          }
          v27[1].i64[0] = (uint64_t)v28;
          v27[1].i64[1] = (uint64_t)&unk_1E6B997B0;
          a1 = v23;
          int8x16_t v44 = *(int8x16_t *)(v23 + 40);
          id v29 = (id)v44.i64[0];
          void v27[2] = vextq_s8(v44, v44, 8uLL);
          v27[3].i64[0] = (uint64_t)v43;
          [v21 enumerateKeysAndObjectsUsingBlock:v27];
        }
        id v7 = obj;
        uint64_t v16 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v16);
    }

    v2 = v39;
    id v9 = v41;
    if ([*(id *)(a1 + 40) hasChanges])
    {
      v30 = *(void **)(a1 + 40);
      id v45 = 0;
      [v30 save:&v45];
      id v31 = v45;
      if (v31) {
        [v43 addObject:v31];
      }
    }
    v32 = _RTSafeArray();
    uint64_t v33 = _RTMultiErrorCreate();
    uint64_t v34 = *(void *)(*(void *)(a1 + 56) + 8);
    v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = v33;

    [*(id *)(a1 + 40) setTransactionAuthor:v40];
    [v39 setFetchOffset:[v39 fetchOffset] + [v7 count]];
    [*(id *)(a1 + 40) reset];

    if (![v7 count]) {
      goto LABEL_32;
    }
  }
  v36 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v55 = (uint64_t)v10;
    _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "error while fetching entity deletion requests to process, %@", buf, 0xCu);
  }

  uint64_t v37 = *(void *)(*(void *)(a1 + 56) + 8);
  v38 = *(void **)(v37 + 40);
  *(void *)(v37 + 40) = v10;
  v12 = v10;

LABEL_31:
LABEL_32:
}

void __86__RTPersistenceCloudDeletionEnforcer_processRequestsSinceReferenceDate_context_error___block_invoke_20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = 0;
  [v4 performBatchDeleteOfEntityWithName:a2 identifiers:a3 context:v5 error:&v7];
  id v6 = v7;
  if (v6) {
    [*(id *)(a1 + 48) addObject:v6];
  }
}

void __86__RTPersistenceCloudDeletionEnforcer_processRequestsSinceReferenceDate_context_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = 0;
  [v4 applyTombstonesToEntityWithName:a2 identifiers:a3 context:v5 error:&v7];
  id v6 = v7;
  if (v6) {
    [*(id *)(a1 + 48) addObject:v6];
  }
}

- (BOOL)performBatchDeleteOfEntityWithName:(id)a3 identifiers:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = v12;
  if (!v10)
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityName", buf, 2u);
    }

    if (a6)
    {
      uint64_t v16 = @"entityName";
LABEL_15:
      _RTErrorInvalidParameterCreate((uint64_t)v16);
      BOOL v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_16:
    BOOL v14 = 0;
    goto LABEL_18;
  }
  if (!v12)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a6)
    {
      uint64_t v16 = @"context";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if ([v11 count])
  {
    *(void *)long long buf = 0;
    int v26 = buf;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__104;
    id v29 = __Block_byref_object_dispose__104;
    id v30 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__RTPersistenceCloudDeletionEnforcer_performBatchDeleteOfEntityWithName_identifiers_context_error___block_invoke;
    v19[3] = &unk_1E6B964B8;
    id v20 = v10;
    id v21 = v11;
    uint64_t v23 = buf;
    SEL v24 = a2;
    id v22 = v13;
    [v22 performBlockAndWait:v19];
    if (a6) {
      *a6 = *((id *)v26 + 5);
    }
    BOOL v14 = *((void *)v26 + 5) == 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v14 = 1;
  }
LABEL_18:

  return v14;
}

void __99__RTPersistenceCloudDeletionEnforcer_performBatchDeleteOfEntityWithName_identifiers_context_error___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:*(void *)(a1 + 32)];
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in (%@)", @"identifier", *(void *)(a1 + 40)];
  [v2 setPredicate:v3];

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v2];
  [v4 setResultType:2];
  uint64_t v5 = *(void **)(a1 + 48);
  id v13 = 0;
  id v6 = [v5 executeRequest:v4 error:&v13];
  id v7 = v13;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v10 = [v6 result];
    *(_DWORD *)long long buf = 138413058;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    __int16 v18 = 2112;
    v19 = v10;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v7;
}

- (BOOL)applyTombstonesToEntityWithName:(id)a3 identifiers:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (!v10)
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: entityName", buf, 2u);
    }

    if (a6)
    {
      __int16 v16 = @"entityName";
LABEL_15:
      _RTErrorInvalidParameterCreate((uint64_t)v16);
      BOOL v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_16:
    BOOL v14 = 0;
    goto LABEL_18;
  }
  if (!v12)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a6)
    {
      __int16 v16 = @"context";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if ([v11 count])
  {
    *(void *)long long buf = 0;
    int v26 = buf;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__104;
    id v29 = __Block_byref_object_dispose__104;
    id v30 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __96__RTPersistenceCloudDeletionEnforcer_applyTombstonesToEntityWithName_identifiers_context_error___block_invoke;
    v19[3] = &unk_1E6B964B8;
    id v20 = v10;
    id v21 = v11;
    uint64_t v23 = buf;
    SEL v24 = a2;
    id v22 = v13;
    [v22 performBlockAndWait:v19];
    if (a6) {
      *a6 = *((id *)v26 + 5);
    }
    BOOL v14 = *((void *)v26 + 5) == 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v14 = 1;
  }
LABEL_18:

  return v14;
}

void __96__RTPersistenceCloudDeletionEnforcer_applyTombstonesToEntityWithName_identifiers_context_error___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C038]) initWithEntityName:*(void *)(a1 + 32)];
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in (%@)", @"identifier", *(void *)(a1 + 40)];
  [v2 setPredicate:v3];

  v4 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"bitwiseOr:with:(%@, %lu)", @"flags", 1];
  uint64_t v23 = @"flags";
  v24[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  [v2 setPropertiesToUpdate:v5];

  [v2 setResultType:2];
  id v6 = *(void **)(a1 + 48);
  id v14 = 0;
  id v7 = [v6 executeRequest:v2 error:&v14];
  id v8 = v14;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v11 = [v7 result];
    *(_DWORD *)long long buf = 138413058;
    __int16 v16 = v10;
    __int16 v17 = 2112;
    __int16 v18 = v2;
    __int16 v19 = 2112;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, request, %@, updated count, %@, error, %@", buf, 0x2Au);
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
}

@end