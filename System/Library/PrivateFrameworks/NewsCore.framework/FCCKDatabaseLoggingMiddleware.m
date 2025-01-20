@interface FCCKDatabaseLoggingMiddleware
- (FCCKDatabaseLoggingMiddleware)init;
- (_BYTE)initAllowingNilDesiredKeys:(unsigned char *)result;
- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5;
@end

@implementation FCCKDatabaseLoggingMiddleware

- (_BYTE)initAllowingNilDesiredKeys:(unsigned char *)result
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)FCCKDatabaseLoggingMiddleware;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result) {
      result[8] = a2;
    }
  }
  return result;
}

- (FCCKDatabaseLoggingMiddleware)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCKDatabaseLoggingMiddleware init]";
    __int16 v9 = 2080;
    v10 = "FCCKDatabaseLoggingMiddleware.m";
    __int16 v11 = 1024;
    int v12 = 35;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCCKDatabaseLoggingMiddleware init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5
{
  v90[2] = *(id *)MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v7 = a4;
  objc_opt_class();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v50 = v7;
    if (!self || !self->_allowNilDesiredKeys)
    {
      v8 = [v50 desiredKeys];

      if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v47 = (void *)[[NSString alloc] initWithFormat:@"No desired keys given for CKQueryOperation: %@", v50];
        *(_DWORD *)aBlock = 136315906;
        *(void *)&aBlock[4] = "-[FCCKDatabaseLoggingMiddleware database:willEnqueueOperation:error:]";
        *(_WORD *)&aBlock[12] = 2080;
        *(void *)&aBlock[14] = "FCCKDatabaseLoggingMiddleware.m";
        *(_WORD *)&aBlock[22] = 1024;
        LODWORD(v87) = 56;
        WORD2(v87) = 2114;
        *(void *)((char *)&v87 + 6) = v47;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", aBlock, 0x26u);
      }
    }
    objc_opt_class();
  }
  else
  {
    objc_opt_class();
    id v50 = 0;
    if (!v7)
    {
LABEL_14:
      id v49 = 0;
      goto LABEL_15;
    }
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  id v9 = v7;
  if (self && self->_allowNilDesiredKeys)
  {
    id v49 = v9;
    id v10 = v54;
    objc_opt_class();
    goto LABEL_17;
  }
  id v49 = v9;
  v44 = [v9 desiredKeys];
  BOOL v45 = v44 == 0;

  if (v45 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v46 = (void *)[[NSString alloc] initWithFormat:@"No desired keys given for CKFetchRecordsOperation: %@", v49];
    *(_DWORD *)aBlock = 136315906;
    *(void *)&aBlock[4] = "-[FCCKDatabaseLoggingMiddleware database:willEnqueueOperation:error:]";
    *(_WORD *)&aBlock[12] = 2080;
    *(void *)&aBlock[14] = "FCCKDatabaseLoggingMiddleware.m";
    *(_WORD *)&aBlock[22] = 1024;
    LODWORD(v87) = 62;
    WORD2(v87) = 2114;
    *(void *)((char *)&v87 + 6) = v46;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", aBlock, 0x26u);
  }
LABEL_15:
  id v11 = v7;
  id v12 = v54;
  if (!self) {
    goto LABEL_81;
  }
  objc_opt_class();
  if (!v7)
  {
    __int16 v13 = 0;
    goto LABEL_21;
  }
LABEL_17:
  if (objc_opt_isKindOfClass()) {
    __int16 v13 = v7;
  }
  else {
    __int16 v13 = 0;
  }
LABEL_21:
  id v53 = v13;
  objc_opt_class();
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v14 = v7;
    }
    else {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }
  id v15 = v14;
  objc_opt_class();
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v16 = v7;
    }
    else {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  id v52 = v16;
  objc_opt_class();
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v17 = v7;
    }
    else {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }
  id v51 = v17;
  objc_opt_class();
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v18 = v7;
    }
    else {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  id v19 = v18;
  objc_opt_class();
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v20 = v7;
    }
    else {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }
  id v21 = v20;
  objc_opt_class();
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v22 = v7;
    }
    else {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }
  id v23 = v22;
  objc_opt_class();
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v24 = v7;
    }
    else {
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }
  id v25 = v24;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v27 = v26;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2020000000;
  int v85 = 0;
  v28 = [MEMORY[0x1E4F1CA48] array];
  if (objc_opt_respondsToSelector())
  {
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke;
    v80[3] = &unk_1E5B543F0;
    id v81 = v28;
    [v7 setRequestCompletedBlock:v80];
  }
  objc_initWeak(&location, v7);
  *(void *)aBlock = MEMORY[0x1E4F143A8];
  *(void *)&aBlock[8] = 3221225472;
  *(void *)&aBlock[16] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_2;
  *(void *)&long long v87 = &unk_1E5B54440;
  objc_copyWeak(v90, &location);
  v90[1] = v27;
  id v48 = v28;
  *((void *)&v87 + 1) = v48;
  v89 = &v82;
  id v88 = v54;
  v29 = _Block_copy(aBlock);
  if (v53)
  {
    *((_DWORD *)v83 + 6) = 1;
    v30 = [v53 fetchRecordsCompletionBlock];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_29;
    v76[3] = &unk_1E5B54468;
    id v77 = v29;
    id v31 = v30;
    id v78 = v31;
    [v53 setFetchRecordsCompletionBlock:v76];
  }
  if (v15)
  {
    *((_DWORD *)v83 + 6) = 2;
    v32 = [v15 modifyRecordsCompletionBlock];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_2_31;
    v73[3] = &unk_1E5B54490;
    id v74 = v29;
    id v33 = v32;
    id v75 = v33;
    [v15 setModifyRecordsCompletionBlock:v73];
  }
  if (v52)
  {
    *((_DWORD *)v83 + 6) = 3;
    v34 = [v52 fetchRecordZonesCompletionBlock];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_3_33;
    v70[3] = &unk_1E5B54468;
    id v71 = v29;
    id v35 = v34;
    id v72 = v35;
    [v52 setFetchRecordZonesCompletionBlock:v70];
  }
  if (v51)
  {
    *((_DWORD *)v83 + 6) = 7;
    v36 = [v51 fetchRecordZoneChangesCompletionBlock];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_4;
    v67[3] = &unk_1E5B544B8;
    id v68 = v29;
    id v37 = v36;
    id v69 = v37;
    [v51 setFetchRecordZoneChangesCompletionBlock:v67];
  }
  if (v19)
  {
    *((_DWORD *)v83 + 6) = 4;
    v38 = [v19 modifyRecordZonesCompletionBlock];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_5;
    v64[3] = &unk_1E5B544E0;
    id v65 = v29;
    id v39 = v38;
    id v66 = v39;
    [v19 setModifyRecordZonesCompletionBlock:v64];
  }
  if (v21)
  {
    *((_DWORD *)v83 + 6) = 8;
    v40 = [v21 fetchDatabaseChangesCompletionBlock];
    if (v40)
    {
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_6;
      v61[3] = &unk_1E5B54508;
      id v62 = v29;
      id v63 = v40;
      [v21 setFetchDatabaseChangesCompletionBlock:v61];
    }
  }
  if (v23)
  {
    *((_DWORD *)v83 + 6) = 5;
    v41 = [v23 fetchSubscriptionCompletionBlock];
    if (v41)
    {
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_7;
      v58[3] = &unk_1E5B53E98;
      id v59 = v29;
      id v60 = v41;
      [v23 setFetchSubscriptionCompletionBlock:v58];
    }
  }
  if (v25)
  {
    *((_DWORD *)v83 + 6) = 6;
    v42 = [v25 modifySubscriptionsCompletionBlock];
    if (v42)
    {
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_8;
      v55[3] = &unk_1E5B544E0;
      id v56 = v29;
      id v57 = v42;
      [v25 setModifySubscriptionsCompletionBlock:v55];
    }
  }

  objc_destroyWeak(v90);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v82, 8);
LABEL_81:

  return 0;
}

uint64_t __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_3;
  v8[3] = &unk_1E5B54418;
  uint64_t v12 = *(void *)(a1 + 64);
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v11 = v7;
  id v6 = v3;
  FCPerformIfNonNil(WeakRetained, v8);
}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v38 = a2;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3 - *(double *)(a1 + 64);
  id v39 = (double *)a1;
  if (![*(id *)(a1 + 32) count])
  {
    id v5 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      long long v7 = objc_opt_class();
      id v8 = v7;
      id v9 = [v38 operationID];
      id v10 = [v38 database];
      long long v11 = [v10 container];
      uint64_t v12 = [v11 containerIdentifier];
      *(_DWORD *)buf = 138544130;
      BOOL v45 = v7;
      __int16 v46 = 2114;
      v47 = v9;
      __int16 v48 = 2114;
      id v49 = v12;
      __int16 v50 = 2048;
      double v51 = v4;
      _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ ran against %{public}@ with no requests, total time: %f", buf, 0x2Au);
    }
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v37 = [obj countByEnumeratingWithState:&v40 objects:v56 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v41 != v36) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v15 = [FCNetworkEvent alloc];
        uint64_t v16 = *(unsigned int *)(*(void *)(*((void *)v39 + 7) + 8) + 24);
        v17 = [v38 operationID];
        double v18 = v39[8];
        id v19 = [v38 database];
        v20 = [v19 container];
        id v21 = [v20 containerIdentifier];
        v22 = [(FCNetworkEvent *)v15 initWithType:v16 ckRequestInfo:v14 operationID:v17 startTime:v21 containerName:*((void *)v39 + 5) error:v18];

        id v23 = (void *)FCOperationLog;
        if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          id v25 = objc_opt_class();
          id v26 = v25;
          v27 = [v38 operationID];
          v28 = [v38 database];
          v29 = [v28 container];
          v30 = [v29 containerIdentifier];
          id v31 = [v14 requestUUID];
          [(FCNetworkEvent *)v22 totalDuration];
          *(_DWORD *)buf = 138544642;
          BOOL v45 = v25;
          __int16 v46 = 2114;
          v47 = v27;
          __int16 v48 = 2114;
          id v49 = v30;
          __int16 v50 = 2114;
          double v51 = *(double *)&v31;
          __int16 v52 = 2048;
          uint64_t v53 = v32;
          __int16 v54 = 2048;
          double v55 = v4;
          _os_log_impl(&dword_1A460D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ ran against %{public}@ with request UUID %{public}@, network time: %f, total time: %f", buf, 0x3Eu);
        }
        id v33 = (void *)*((void *)v39 + 6);
        if (v33) {
          id v33 = (void *)v33[3];
        }
        v34 = v33;
        [v34 logNetworkEvent:v22];
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v40 objects:v56 count:16];
    }
    while (v37);
  }
}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_2_31(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);
  }
}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_3_33(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);
  }
}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v7 = a4;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, id))(v8 + 16))(v8, v9, a3, v7);
  }
}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);
  }
}

@end