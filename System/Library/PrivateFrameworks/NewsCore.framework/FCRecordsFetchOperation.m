@interface FCRecordsFetchOperation
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
@end

@implementation FCRecordsFetchOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_fetchToken, 0);
  objc_storeStrong((id *)&self->_holdTokens, 0);
  objc_storeStrong((id *)&self->_ignoreCacheForRecordIDs, 0);
  objc_storeStrong((id *)&self->_recordIdentifiers, 0);
  objc_storeStrong((id *)&self->_recordSource, 0);
}

- (void)operationWillFinishWithError:(id)a3
{
  holdTokens = self->_holdTokens;
  self->_holdTokens = 0;

  fetchToken = self->_fetchToken;
  self->_fetchToken = 0;

  refreshToken = self->_refreshToken;
  self->_refreshToken = 0;
}

void __43__FCRecordsFetchOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 440), *(id *)(a1 + 40));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 424);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v29;
    unint64_t v7 = 0x1EB5BD000uLL;
    *(void *)&long long v4 = 136315906;
    long long v27 = v4;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * v8);
        uint64_t v10 = *(int *)(v7 + 1296);
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + v10);
        if (v11) {
          v12 = *(void **)(v11 + 104);
        }
        else {
          v12 = 0;
        }
        if (objc_msgSend(v12, "cacheContainsKey:", *(void *)(*((void *)&v28 + 1) + 8 * v8), v27, (void)v28))
        {
          if ([*(id *)(a1 + 48) containsObject:v9])
          {
            v13 = *(void **)(a1 + 56);
LABEL_21:
            [v13 addObject:v9];
            goto LABEL_37;
          }
          uint64_t v16 = *(void *)(*(void *)(a1 + 32) + v10);
          if (v16) {
            v17 = *(void **)(v16 + 96);
          }
          else {
            v17 = 0;
          }
          v15 = [v17 objectForKey:v9];
          v18 = -[FCFaultableRecord recordBase]((uint64_t)v15);
          v19 = v18;
          switch(*(void *)(a1 + 80))
          {
            case 0:
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                v25 = (void *)[[NSString alloc] initWithFormat:@"record sources must always specify a concrete default cache policy"];
                *(_DWORD *)buf = v27;
                v33 = "-[FCRecordsFetchOperation performOperation]_block_invoke";
                __int16 v34 = 2080;
                v35 = "FCRecordSource.m";
                __int16 v36 = 1024;
                int v37 = 1436;
                __int16 v38 = 2114;
                v39 = v25;
                _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
              }
              goto LABEL_26;
            case 1:
              goto LABEL_23;
            case 2:
            case 3:
              if (-[NTPBRecordBase hasExpiredAssetURLs](v18)
                || *(double *)(a1 + 88) != 0.0 && objc_msgSend(v19, "fc_isCachedAgeGreaterThan:"))
              {
                v14 = +[FCFetchOperationResult resultWithStatus:2 fetchedObject:0 error:0];
                v20 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
                [v14 setMissingObjectDescriptions:v20];
              }
              else
              {
                v20 = -[FCFaultableRecord record]((uint64_t)v15);
                v14 = +[FCFetchOperationResult resultWithStatus:0 fetchedObject:v20 error:0];
              }

              goto LABEL_34;
            case 4:
            case 5:
              if (-[NTPBRecordBase needsAssetURLRefresh](v18))
              {
LABEL_23:
                [*(id *)(a1 + 56) addObject:v9];
LABEL_26:
                v14 = 0;
              }
              else
              {
                uint64_t v21 = [v19 fetchDate];
                if (v21
                  && (v22 = (void *)v21,
                      int v23 = objc_msgSend(v19, "fc_isCachedAgeLessThan:", *(double *)(a1 + 88)),
                      v22,
                      !v23))
                {
                  [*(id *)(a1 + 56) addObject:v9];
                  v14 = 0;
                }
                else
                {
                  v24 = -[FCFaultableRecord record]((uint64_t)v15);
                  v14 = +[FCFetchOperationResult resultWithStatus:0 fetchedObject:v24 error:0];
                }
                unint64_t v7 = 0x1EB5BD000;
              }
LABEL_34:

              break;
            default:
              goto LABEL_26;
          }
        }
        else
        {
          if (*(void *)(a1 + 80) != 3)
          {
            v13 = *(void **)(a1 + 64);
            goto LABEL_21;
          }
          v14 = +[FCFetchOperationResult resultWithStatus:2 fetchedObject:0 error:0];
          v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
          [v14 setMissingObjectDescriptions:v15];
        }

        if (v14)
        {
          [*(id *)(a1 + 72) addObject:v14];
        }
LABEL_37:
        ++v8;
      }
      while (v5 != v8);
      uint64_t v26 = [v2 countByEnumeratingWithState:&v28 objects:v40 count:16];
      uint64_t v5 = v26;
    }
    while (v26);
  }
}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v26;
    uint64_t v6 = off_1E5B4A000;
    *(void *)&long long v3 = 138543874;
    long long v23 = v3;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 416);
        if (v9) {
          uint64_t v10 = *(void **)(v9 + 104);
        }
        else {
          uint64_t v10 = 0;
        }
        int v11 = objc_msgSend(v10, "cacheContainsKey:", *(void *)(*((void *)&v25 + 1) + 8 * v7), v23);
        v12 = *(void **)(*(void *)(a1 + 40) + 416);
        if (v11)
        {
          if (v12) {
            v12 = (void *)v12[12];
          }
          v13 = [v12 objectForKey:v8];
          v14 = v6[190];
          v15 = -[FCFaultableRecord record]((uint64_t)v13);
          uint64_t v16 = [(__objc2_class *)v14 resultWithStatus:0 fetchedObject:v15 error:0];
        }
        else
        {
          v13 = -[FCRecordSource _fetchErrorForKey:](v12, v8);
          uint64_t v16 = [(__objc2_class *)v6[190] resultWithStatus:3 fetchedObject:0 error:v13];
          v17 = (void *)FCRecordSourceLog;
          if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = v5;
            v19 = *(void **)(a1 + 40);
            v20 = v17;
            uint64_t v21 = [v19 operationID];
            *(_DWORD *)buf = v23;
            long long v30 = v21;
            __int16 v31 = 2114;
            v32 = v8;
            __int16 v33 = 2114;
            __int16 v34 = v13;
            _os_log_impl(&dword_1A460D000, v20, OS_LOG_TYPE_INFO, "operation with ID %{public}@ failed to fetch record %{public}@ with error %{public}@", buf, 0x20u);

            uint64_t v5 = v18;
            uint64_t v6 = off_1E5B4A000;
          }
          v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
          [v16 setMissingObjectDescriptions:v15];
        }

        [*(id *)(a1 + 48) addObject:v16];
        ++v7;
      }
      while (v4 != v7);
      uint64_t v22 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
      uint64_t v4 = v22;
    }
    while (v22);
  }
}

- (void)performOperation
{
  if ([(NSArray *)self->_recordIdentifiers count])
  {
    -[FCRecordSource _prepareForUse]((uint64_t)self->_recordSource);
    v54 = [MEMORY[0x1E4F1C9C8] date];
    queue = FCDispatchQueueForQualityOfService([(FCRecordsFetchOperation *)self qualityOfService]);
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    recordSource = self->_recordSource;
    if (recordSource) {
      recordSource = (FCRecordSource *)recordSource->_cacheCoordinator;
    }
    recordIdentifiers = self->_recordIdentifiers;
    uint64_t v8 = recordSource;
    uint64_t v9 = [(FCRecordSource *)v8 holdTokensForKeys:recordIdentifiers];

    if ([(FCFetchOperation *)self cachePolicy])
    {
      uint64_t v10 = [(FCFetchOperation *)self cachePolicy];
    }
    else
    {
      int v11 = [(id)objc_opt_class() defaultCachePolicy];
      uint64_t v10 = [v11 cachePolicy];
    }
    if ([(FCFetchOperation *)self cachePolicy])
    {
      [(FCFetchOperation *)self maximumCachedAge];
      double v13 = v12;
    }
    else
    {
      v14 = [(id)objc_opt_class() defaultCachePolicy];
      [v14 maximumCachedAge];
      double v13 = v15;
    }
    uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_ignoreCacheForRecordIDs];
    v17 = self->_recordSource;
    if (v17) {
      cacheCoordinator = v17->_cacheCoordinator;
    }
    else {
      cacheCoordinator = 0;
    }
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __43__FCRecordsFetchOperation_performOperation__block_invoke;
    v78[3] = &unk_1E5B4DCE0;
    v78[4] = self;
    id v49 = v9;
    id v79 = v49;
    id v50 = v16;
    id v80 = v50;
    id v57 = v5;
    id v81 = v57;
    uint64_t v84 = v10;
    double v85 = v13;
    id v19 = v4;
    id v82 = v19;
    id v20 = v3;
    id v83 = v20;
    [(FCCacheCoordinator *)cacheCoordinator performCacheRead:v78];
    uint64_t v21 = dispatch_group_create();
    v51 = v19;
    if ([v19 count])
    {
      dispatch_group_enter(v21);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __43__FCRecordsFetchOperation_performOperation__block_invoke_303;
      aBlock[3] = &unk_1E5B4DD08;
      aBlock[4] = self;
      id v22 = v19;
      id v75 = v22;
      id v76 = v53;
      v48 = v21;
      v77 = v21;
      long long v23 = _Block_copy(aBlock);
      v24 = objc_alloc_init(FCRecordSourceFetchContext);
      long long v25 = v24;
      if (v24) {
        v24->_refresh = 0;
      }
      long long v26 = self->_recordSource;
      if (v26) {
        long long v26 = (FCRecordSource *)v26->_fetchCoordinator;
      }
      long long v27 = v26;
      long long v28 = [(FCRecordSource *)v27 fetchKeys:v22 context:v25 qualityOfService:[(FCRecordsFetchOperation *)self qualityOfService] relativePriority:[(FCOperation *)self relativePriority] completionQueue:queue completion:v23];
      fetchToken = self->_fetchToken;
      self->_fetchToken = v28;
    }
    if (objc_msgSend(v57, "count", v48))
    {
      dispatch_group_enter(v21);
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __43__FCRecordsFetchOperation_performOperation__block_invoke_304;
      v68[3] = &unk_1E5B4DD58;
      v68[4] = self;
      id v30 = v57;
      id v69 = v30;
      uint64_t v73 = v10;
      id v70 = v54;
      id v71 = v52;
      v72 = v21;
      __int16 v31 = _Block_copy(v68);
      v32 = objc_alloc_init(FCRecordSourceFetchContext);
      __int16 v33 = v32;
      if (v32)
      {
        v32->_refresh = 1;
        v32->_cachePolicy = v10;
        v32->_maxCachedAge = v13;
      }
      if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1 || [v50 count])
      {
        __int16 v34 = self->_recordSource;
        if (v34) {
          __int16 v34 = (FCRecordSource *)v34->_fetchCoordinator;
        }
        v35 = v34;
        uint64_t v36 = [(FCRecordSource *)v35 fetchKeysUnconditionally:v30 context:v33 qualityOfService:[(FCRecordsFetchOperation *)self qualityOfService] relativePriority:[(FCOperation *)self relativePriority] completionQueue:queue completion:v31];
      }
      else
      {
        v47 = self->_recordSource;
        if (v47) {
          v47 = (FCRecordSource *)v47->_fetchCoordinator;
        }
        v35 = v47;
        uint64_t v36 = [(FCRecordSource *)v35 fetchKeys:v30 context:v33 qualityOfService:[(FCRecordsFetchOperation *)self qualityOfService] relativePriority:[(FCOperation *)self relativePriority] completionQueue:queue completion:v31];
      }
      refreshToken = self->_refreshToken;
      self->_refreshToken = v36;
    }
    if (FCDispatchGroupIsEmpty(v21))
    {
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __43__FCRecordsFetchOperation_performOperation__block_invoke_309;
      v63[3] = &unk_1E5B4DC70;
      __int16 v38 = &v64;
      id v64 = v20;
      v39 = &v65;
      v40 = v53;
      id v65 = v53;
      uint64_t v41 = &v66;
      v42 = v52;
      id v66 = v52;
      v43 = (id *)v67;
      v44 = v20;
      v45 = v49;
      v67[0] = v49;
      v67[1] = self;
      __43__FCRecordsFetchOperation_performOperation__block_invoke_309((uint64_t)v63);
      v46 = queue;
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __43__FCRecordsFetchOperation_performOperation__block_invoke_3;
      block[3] = &unk_1E5B4DC70;
      __int16 v38 = &v59;
      id v59 = v20;
      v39 = &v60;
      v40 = v53;
      id v60 = v53;
      uint64_t v41 = &v61;
      v42 = v52;
      id v61 = v52;
      v43 = (id *)v62;
      v44 = v20;
      v45 = v49;
      v62[0] = v49;
      v62[1] = self;
      v46 = queue;
      dispatch_group_notify(v21, queue, block);
    }
  }
  else
  {
    v56 = objc_alloc_init(FCHeldRecords);
    [(FCFetchOperation *)self finishExecutingWithFetchedObject:v56];
  }
}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_309(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 3;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__9;
  long long v26 = __Block_byref_object_dispose__9;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__9;
  id v20 = __Block_byref_object_dispose__9;
  id v21 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __43__FCRecordsFetchOperation_performOperation__block_invoke_2_310;
  int v11 = &unk_1E5B4DD80;
  id v3 = v2;
  id v12 = v3;
  double v13 = &v28;
  v14 = &v22;
  double v15 = &v16;
  uint64_t v4 = _Block_copy(&v8);
  objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", v4, v8, v9, v10, v11);
  [*(id *)(a1 + 40) enumerateObjectsUsingBlock:v4];
  [*(id *)(a1 + 48) enumerateObjectsUsingBlock:v4];
  uint64_t v5 = v29[3];
  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [[FCHeldRecords alloc] initWithRecordsByID:v3 interestTokensByID:*(void *)(a1 + 56)];
    uint64_t v5 = v29[3];
  }
  uint64_t v7 = +[FCFetchOperationResult resultWithStatus:v5 fetchedObject:v6 error:v23[5]];
  [v7 setMissingObjectDescriptions:v17[5]];
  [*(id *)(a1 + 64) finishExecutingWithResult:v7];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_2_310(void *a1, void *a2)
{
  id v16 = a2;
  id v3 = [v16 fetchedObject];

  if (v3)
  {
    uint64_t v4 = [v16 fetchedObject];
    uint64_t v5 = [v4 base];
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = [v5 identifier];
    [v6 setObject:v4 forKey:v7];
  }
  if ((unint64_t)[v16 status] < *(void *)(*(void *)(a1[5] + 8) + 24)) {
    *(void *)(*(void *)(a1[5] + 8) + 24) = [v16 status];
  }
  if ([v16 status] == 3)
  {
    uint64_t v8 = [v16 error];

    uint64_t v9 = v16;
    if (!v8) {
      goto LABEL_10;
    }
    uint64_t v10 = [v16 error];
    uint64_t v11 = *(void *)(a1[6] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    uint64_t v13 = *(void *)(a1[6] + 8);
    id v12 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
  }

  uint64_t v9 = v16;
LABEL_10:
  if ([v9 status])
  {
    v14 = *(void **)(*(void *)(a1[7] + 8) + 40);
    double v15 = [v16 missingObjectDescriptions];
    objc_msgSend(v14, "fc_safelyUnionSet:", v15);
  }
}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_4(void *a1, void *a2)
{
  id v16 = a2;
  id v3 = [v16 fetchedObject];

  if (v3)
  {
    uint64_t v4 = [v16 fetchedObject];
    uint64_t v5 = [v4 base];
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = [v5 identifier];
    [v6 setObject:v4 forKey:v7];
  }
  if ((unint64_t)[v16 status] < *(void *)(*(void *)(a1[5] + 8) + 24)) {
    *(void *)(*(void *)(a1[5] + 8) + 24) = [v16 status];
  }
  if ([v16 status] == 3)
  {
    uint64_t v8 = [v16 error];

    uint64_t v9 = v16;
    if (!v8) {
      goto LABEL_10;
    }
    uint64_t v10 = [v16 error];
    uint64_t v11 = *(void *)(a1[6] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    uint64_t v13 = *(void *)(a1[6] + 8);
    id v12 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
  }

  uint64_t v9 = v16;
LABEL_10:
  if ([v9 status])
  {
    v14 = *(void **)(*(void *)(a1[7] + 8) + 40);
    double v15 = [v16 missingObjectDescriptions];
    objc_msgSend(v14, "fc_safelyUnionSet:", v15);
  }
}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_2_305(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v25 = *(void *)v27;
    *(void *)&long long v3 = 136315906;
    long long v23 = v3;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v27 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v26 + 1) + 8 * v5);
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 416);
        if (v7) {
          uint64_t v8 = *(void **)(v7 + 96);
        }
        else {
          uint64_t v8 = 0;
        }
        uint64_t v9 = objc_msgSend(v8, "objectForKey:", *(void *)(*((void *)&v26 + 1) + 8 * v5), v23);
        uint64_t v10 = -[FCFaultableRecord recordBase]((uint64_t)v9);
        uint64_t v11 = v10;
        if (v9)
        {
          int v12 = 1;
          switch(*(void *)(a1 + 64))
          {
            case 0:
            case 3:
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"shouldn't get here"];
                *(_DWORD *)buf = v23;
                uint64_t v31 = "-[FCRecordsFetchOperation performOperation]_block_invoke_2";
                __int16 v32 = 2080;
                __int16 v33 = "FCRecordSource.m";
                __int16 v34 = 1024;
                int v35 = 1550;
                __int16 v36 = 2114;
                int v37 = v13;
                _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

                int v12 = 1;
              }
              break;
            case 1:
            case 5:
              id v16 = (void *)MEMORY[0x1E4F1C9C8];
              v17 = [v10 fetchDate];
              uint64_t v18 = [v16 dateWithPBDate:v17];
              int v12 = objc_msgSend(v18, "fc_isLaterThan:", *(void *)(a1 + 48));

              break;
            default:
              break;
          }
          if (!-[NTPBRecordBase hasExpiredAssetURLs](v11) && v12 != 0)
          {
            id v21 = -[FCFaultableRecord record]((uint64_t)v9);
            double v15 = +[FCFetchOperationResult resultWithStatus:0 fetchedObject:v21 error:0];
            goto LABEL_21;
          }
          id v20 = -[FCRecordSource _fetchErrorForKey:](*(id *)(*(void *)(a1 + 40) + 416), v6);
          double v15 = +[FCFetchOperationResult resultWithStatus:3 fetchedObject:0 error:v20];
        }
        else
        {
          v14 = -[FCRecordSource _fetchErrorForKey:](*(id *)(*(void *)(a1 + 40) + 416), v6);
          double v15 = +[FCFetchOperationResult resultWithStatus:3 fetchedObject:0 error:v14];
        }
        id v21 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
        [v15 setMissingObjectDescriptions:v21];
LABEL_21:

        [*(id *)(a1 + 56) addObject:v15];
        ++v5;
      }
      while (v4 != v5);
      uint64_t v22 = [obj countByEnumeratingWithState:&v26 objects:v38 count:16];
      uint64_t v4 = v22;
    }
    while (v22);
  }
}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_303(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 416);
  if (v2) {
    long long v3 = *(void **)(v2 + 104);
  }
  else {
    long long v3 = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__FCRecordsFetchOperation_performOperation__block_invoke_2;
  v6[3] = &unk_1E5B4C738;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 48);
  [v3 performCacheRead:v6];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_304(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 416);
  if (v2) {
    long long v3 = *(void **)(v2 + 104);
  }
  else {
    long long v3 = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__FCRecordsFetchOperation_performOperation__block_invoke_2_305;
  v6[3] = &unk_1E5B4DD30;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  uint64_t v11 = *(void *)(a1 + 72);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  [v3 performCacheRead:v6];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __43__FCRecordsFetchOperation_performOperation__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 3;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__9;
  long long v26 = __Block_byref_object_dispose__9;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__9;
  id v20 = __Block_byref_object_dispose__9;
  id v21 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __43__FCRecordsFetchOperation_performOperation__block_invoke_4;
  uint64_t v11 = &unk_1E5B4DD80;
  id v3 = v2;
  id v12 = v3;
  uint64_t v13 = &v28;
  v14 = &v22;
  double v15 = &v16;
  id v4 = _Block_copy(&v8);
  objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", v4, v8, v9, v10, v11);
  [*(id *)(a1 + 40) enumerateObjectsUsingBlock:v4];
  [*(id *)(a1 + 48) enumerateObjectsUsingBlock:v4];
  uint64_t v5 = v29[3];
  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [[FCHeldRecords alloc] initWithRecordsByID:v3 interestTokensByID:*(void *)(a1 + 56)];
    uint64_t v5 = v29[3];
  }
  id v7 = +[FCFetchOperationResult resultWithStatus:v5 fetchedObject:v6 error:v23[5]];
  [v7 setMissingObjectDescriptions:v17[5]];
  [*(id *)(a1 + 64) finishExecutingWithResult:v7];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

@end