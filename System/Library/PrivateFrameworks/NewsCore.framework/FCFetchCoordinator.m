@interface FCFetchCoordinator
- (FCFetchCoordinator)init;
- (FCFetchCoordinatorDelegate)delegate;
- (id)fetchKey:(id)a3 qualityOfService:(int64_t)a4 completionQueue:(id)a5 completion:(id)a6;
- (id)fetchKeys:(id)a3 context:(id)a4 qualityOfService:(int64_t)a5 relativePriority:(int64_t)a6 completionQueue:(id)a7 completion:(id)a8;
- (id)fetchKeysUnconditionally:(id)a3 context:(id)a4 qualityOfService:(int64_t)a5 relativePriority:(int64_t)a6 completionQueue:(id)a7 completion:(id)a8;
- (unint64_t)maxConcurrentFetchCount;
- (void)addFetchGroup:(uint64_t)a1;
- (void)operationThrottlerPerformOperation:(id)a3;
- (void)removeFetchGroup:(uint64_t)a1;
- (void)setDelegate:(id)a3;
- (void)setMaxConcurrentFetchCount:(unint64_t)a3;
@end

@implementation FCFetchCoordinator

- (void)removeFetchGroup:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__FCFetchCoordinator_removeFetchGroup___block_invoke;
    v6[3] = &unk_1E5B4BE70;
    v6[4] = a1;
    id v7 = v3;
    [v5 performWithLockSync:v6];
  }
}

void __116__FCFetchCoordinator_fetchKeysUnconditionally_context_qualityOfService_relativePriority_completionQueue_completion___block_invoke(uint64_t a1)
{
}

void __101__FCFetchCoordinator_fetchKeys_context_qualityOfService_relativePriority_completionQueue_completion___block_invoke(uint64_t a1)
{
}

uint64_t __36__FCFetchCoordinator_addFetchGroup___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 24);
  }
  else {
    id v3 = 0;
  }
  [v3 addObject:*(void *)(a1 + 40)];
  v4 = *(void **)(a1 + 32);
  if (v4) {
    v4 = (void *)v4[4];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    uint64_t v6 = *(void *)(v5 + 16);
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v4;
  [v7 unionSet:v6];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    v9 = *(void **)(v8 + 56);
  }
  else {
    v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    uint64_t v11 = *(void *)(v10 + 32);
  }
  else {
    uint64_t v11 = 0;
  }
  return [v9 tickleWithQualityOfService:v11];
}

- (void)setDelegate:(id)a3
{
}

- (FCFetchCoordinator)init
{
  v14.receiver = self;
  v14.super_class = (Class)FCFetchCoordinator;
  uint64_t v2 = [(FCFetchCoordinator *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] hashTableWithOptions:512];
    fetchGroups = v2->_fetchGroups;
    v2->_fetchGroups = (NSHashTable *)v3;

    uint64_t v5 = +[FCMapTable mapTableWithKeyOptions:512 valueOptions:0];
    fetchOperationsByGroup = v2->_fetchOperationsByGroup;
    v2->_fetchOperationsByGroup = (FCMapTable *)v5;

    id v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    allKeys = v2->_allKeys;
    v2->_allKeys = v7;

    v9 = (NFMutexLock *)objc_alloc_init(MEMORY[0x1E4F81BE0]);
    accessLock = v2->_accessLock;
    v2->_accessLock = v9;

    uint64_t v11 = [[FCBoostableOperationThrottler alloc] initWithDelegate:v2];
    fetchThrottler = v2->_fetchThrottler;
    v2->_fetchThrottler = v11;
  }
  return v2;
}

void __57__FCFetchCoordinator_operationThrottlerPerformOperation___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v1 = *(id **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = a1;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v3 = (void *)[v1[5] copy];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v71 objects:v75 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v57 = v2;
      char v6 = 0;
      uint64_t v7 = *(void *)v72;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v72 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v71 + 1) + 8 * v8);
          if (v9) {
            uint64_t v10 = *(void *)(v9 + 16);
          }
          else {
            uint64_t v10 = 0;
          }
          id v11 = v1[4];
          char v12 = [v11 intersectsSet:v10];

          if ((v12 & 1) == 0)
          {
            v13 = [v1[5] objectForKey:v9];
            [v13 cancel];
            [v1[5] removeObjectForKey:v9];

            char v6 = 1;
          }
          ++v8;
        }
        while (v5 != v8);
        uint64_t v14 = [v3 countByEnumeratingWithState:&v71 objects:v75 count:16];
        uint64_t v5 = v14;
      }
      while (v14);

      uint64_t v2 = v57;
      if (v6) {
        [v1[7] tickle];
      }
    }
    else
    {
    }
    v15 = *(id **)(v2 + 32);
    if (v15)
    {
      v16 = [MEMORY[0x1E4F1CA80] set];
      v56 = [MEMORY[0x1E4F1CA80] set];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v17 = v15[5];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v67 objects:v75 count:16];
      if (!v18)
      {
        char v20 = 0;
        goto LABEL_33;
      }
      uint64_t v19 = v18;
      char v20 = 0;
      uint64_t v21 = *(void *)v68;
      while (1)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v68 != v21) {
            objc_enumerationMutation(v17);
          }
          uint64_t v23 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          if (v23)
          {
            uint64_t v24 = *(void *)(v23 + 16);
            if (*(unsigned char *)(v23 + 9))
            {
              [v16 unionSet:v24];
              char v20 = 1;
              continue;
            }
          }
          else
          {
            uint64_t v24 = 0;
          }
          [v56 unionSet:v24];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v67 objects:v75 count:16];
        if (!v19)
        {
LABEL_33:

          id v25 = v15[3];
          v26 = [v25 allObjects];
          v27 = [v26 sortedArrayUsingSelector:sel_comparePriority_];

          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __50__FCFetchCoordinator_beginFetchesIfNeededWithLock__block_invoke;
          v65[3] = &unk_1E5B54860;
          v65[4] = v15;
          char v66 = v20 & 1;
          v54 = v27;
          objc_msgSend(v27, "fc_arrayOfObjectsPassingTest:", v65);
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v28 = [obj countByEnumeratingWithState:&v61 objects:&v71 count:16];
          v29 = v56;
          if (!v28) {
            goto LABEL_75;
          }
          uint64_t v30 = v28;
          uint64_t v58 = *(void *)v62;
          while (1)
          {
            uint64_t v31 = 0;
            do
            {
              if (*(void *)v62 != v58) {
                objc_enumerationMutation(obj);
              }
              uint64_t v32 = *(void *)(*((void *)&v61 + 1) + 8 * v31);
              if (!v32)
              {
                v33 = (void *)[0 mutableCopy];
                if (![v33 count]) {
                  goto LABEL_63;
                }
LABEL_48:
                BOOL v37 = 0;
                goto LABEL_49;
              }
              v33 = (void *)[*(id *)(v32 + 16) mutableCopy];
              if (*(unsigned char *)(v32 + 8))
              {
                v34 = [v15 delegate];
                [v34 fetchCoordinator:v15 filterKeysToFetch:v33 isFirstAttempt:*(void *)(v32 + 48) == 0 context:*(void *)(v32 + 24)];
              }
              if (![v33 count])
              {
LABEL_63:
                -[FCFetchGroup fireCompletion]((void *)v32);
                [v15[3] removeObject:v32];
                if (v32) {
                  uint64_t v52 = *(void *)(v32 + 16);
                }
                else {
                  uint64_t v52 = 0;
                }
                id v46 = v15[4];
                [v46 minusSet:v52];
LABEL_66:

                goto LABEL_67;
              }
              if (!*(unsigned char *)(v32 + 8)) {
                goto LABEL_48;
              }
              uint64_t v35 = [v33 count];
              if (*(unsigned char *)(v32 + 9)) {
                v36 = v16;
              }
              else {
                v36 = v29;
              }
              [v33 minusSet:v36];
              BOOL v37 = v35 != [v33 count];
LABEL_49:
              if (![v33 count]) {
                goto LABEL_67;
              }
              v38 = v16;
              if (![v15 maxConcurrentFetchCount]
                || (id v39 = v15[5],
                    unint64_t v40 = [v39 count],
                    unint64_t v41 = [v15 maxConcurrentFetchCount],
                    v39,
                    v40 < v41))
              {
                v42 = [v15 delegate];
                if (v32)
                {
                  id v43 = *(id *)(v32 + 24);
                  uint64_t v44 = *(void *)(v32 + 32);
                  uint64_t v45 = *(void *)(v32 + 40);
                }
                else
                {
                  uint64_t v44 = 0;
                  id v43 = 0;
                  uint64_t v45 = 0;
                }
                id v46 = [v42 fetchCoordinator:v15 fetchOperationForKeys:v33 context:v43 qualityOfService:v44 relativePriority:v45];

                if (v32) {
                  uint64_t v47 = *(void *)(v32 + 32);
                }
                else {
                  uint64_t v47 = 0;
                }
                v16 = v38;
                [v46 setQualityOfService:v47];
                v59[0] = MEMORY[0x1E4F143A8];
                v59[1] = 3221225472;
                v59[2] = __50__FCFetchCoordinator_beginFetchesIfNeededWithLock__block_invoke_2;
                v59[3] = &unk_1E5B4C710;
                v59[4] = v15;
                v59[5] = v32;
                BOOL v60 = v37;
                [v46 setCompletionBlock:v59];
                [v15[5] setObject:v46 forKey:v32];
                v29 = v56;
                v48 = v56;
                if (v32)
                {
                  if (*(unsigned char *)(v32 + 9)) {
                    v48 = v16;
                  }
                  else {
                    v48 = v56;
                  }
                }
                [v48 unionSet:v33];
                v49 = [v15 delegate];
                v50 = v49;
                if (v32) {
                  uint64_t v51 = *(void *)(v32 + 24);
                }
                else {
                  uint64_t v51 = 0;
                }
                [v49 fetchCoordinator:v15 addFetchOperation:v46 context:v51];

                goto LABEL_66;
              }
              v16 = v38;
              v29 = v56;
LABEL_67:

              ++v31;
            }
            while (v30 != v31);
            uint64_t v53 = [obj countByEnumeratingWithState:&v61 objects:&v71 count:16];
            uint64_t v30 = v53;
            if (!v53)
            {
LABEL_75:

              return;
            }
          }
        }
      }
    }
  }
}

- (FCFetchCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCFetchCoordinatorDelegate *)WeakRetained;
}

- (void)operationThrottlerPerformOperation:(id)a3
{
  if (self) {
    accessLock = self->_accessLock;
  }
  else {
    accessLock = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__FCFetchCoordinator_operationThrottlerPerformOperation___block_invoke;
  v4[3] = &unk_1E5B4C018;
  v4[4] = self;
  [(NFMutexLock *)accessLock performWithLockSync:v4];
}

- (unint64_t)maxConcurrentFetchCount
{
  return self->_maxConcurrentFetchCount;
}

void __50__FCFetchCoordinator_beginFetchesIfNeededWithLock__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  uint64_t v3 = v2;
  if ([v3 containsObject:*(void *)(a1 + 40)])
  {
    int v4 = *(unsigned __int8 *)(a1 + 48);

    if (v4) {
      goto LABEL_13;
    }
    -[FCFetchGroup fireCompletion](*(void **)(a1 + 40));
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      char v6 = *(void **)(v5 + 24);
    }
    else {
      char v6 = 0;
    }
    [v6 removeObject:*(void *)(a1 + 40)];
    uint64_t v7 = *(void **)(a1 + 32);
    if (v7) {
      uint64_t v7 = (void *)v7[4];
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      uint64_t v9 = *(void *)(v8 + 16);
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v3 = v7;
    [v3 minusSet:v9];
  }

LABEL_13:
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    id v11 = *(void **)(v10 + 40);
  }
  else {
    id v11 = 0;
  }
  [v11 removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    ++*(void *)(v12 + 48);
  }
  v13 = *(void **)(a1 + 32);
  if (v13) {
    v13 = (void *)v13[3];
  }
  uint64_t v14 = v13;
  v15 = [v14 allObjects];
  id v21 = [v15 sortedArrayUsingSelector:sel_comparePriority_];

  if ([v21 count])
  {
    v16 = *(void **)(a1 + 32);
    if (v16) {
      v16 = (void *)v16[7];
    }
    id v17 = v16;
    uint64_t v18 = [v21 firstObject];
    uint64_t v19 = (void *)v18;
    if (v18) {
      uint64_t v20 = *(void *)(v18 + 32);
    }
    else {
      uint64_t v20 = 0;
    }
    [v17 tickleWithQualityOfService:v20];
  }
}

BOOL __50__FCFetchCoordinator_beginFetchesIfNeededWithLock__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 40);
  }
  else {
    uint64_t v5 = 0;
  }
  char v6 = [v5 objectForKey:v3];
  if (v6) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v3 && v3[9] || *(unsigned char *)(a1 + 40) == 0;
  }

  return v7;
}

uint64_t __50__FCFetchCoordinator_beginFetchesIfNeededWithLock__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 48);
  }
  else {
    uint64_t v2 = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__FCFetchCoordinator_beginFetchesIfNeededWithLock__block_invoke_3;
  v5[3] = &unk_1E5B4C710;
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = v1;
  v5[5] = v3;
  char v6 = *(unsigned char *)(a1 + 48);
  return [v2 performWithLockSync:v5];
}

uint64_t __39__FCFetchCoordinator_removeFetchGroup___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t result = [v3 containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    -[FCFetchGroup fireCompletion](*(void **)(a1 + 40));
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      char v6 = *(void **)(v5 + 24);
    }
    else {
      char v6 = 0;
    }
    [v6 removeObject:*(void *)(a1 + 40)];
    BOOL v7 = *(void **)(a1 + 32);
    if (v7) {
      BOOL v7 = (void *)v7[4];
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      uint64_t v9 = *(void *)(v8 + 16);
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = v7;
    [v10 minusSet:v9];

    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      uint64_t v12 = *(void **)(v11 + 56);
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      uint64_t v14 = *(void *)(v13 + 32);
    }
    else {
      uint64_t v14 = 0;
    }
    return [v12 tickleWithQualityOfService:v14];
  }
  return result;
}

- (id)fetchKeys:(id)a3 context:(id)a4 qualityOfService:(int64_t)a5 relativePriority:(int64_t)a6 completionQueue:(id)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [FCFetchGroup alloc];
  uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];

  uint64_t v20 = -[FCFetchGroup initWithKeys:context:shouldFilter:qualityOfService:relativePriority:completionQueue:completion:]((id *)&v18->super.isa, v19, v16, 1, (void *)a5, (void *)a6, v15, v14);
  -[FCFetchCoordinator addFetchGroup:]((uint64_t)self, v20);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __101__FCFetchCoordinator_fetchKeys_context_qualityOfService_relativePriority_completionQueue_completion___block_invoke;
  v24[3] = &unk_1E5B4BE70;
  v24[4] = self;
  id v25 = v20;
  id v21 = v20;
  v22 = +[FCInterestToken interestTokenWithRemoveInterestBlock:v24];

  return v22;
}

- (id)fetchKeysUnconditionally:(id)a3 context:(id)a4 qualityOfService:(int64_t)a5 relativePriority:(int64_t)a6 completionQueue:(id)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [FCFetchGroup alloc];
  uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];

  uint64_t v20 = -[FCFetchGroup initWithKeys:context:shouldFilter:qualityOfService:relativePriority:completionQueue:completion:]((id *)&v18->super.isa, v19, v16, 0, (void *)a5, (void *)a6, v15, v14);
  -[FCFetchCoordinator addFetchGroup:]((uint64_t)self, v20);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __116__FCFetchCoordinator_fetchKeysUnconditionally_context_qualityOfService_relativePriority_completionQueue_completion___block_invoke;
  v24[3] = &unk_1E5B4BE70;
  v24[4] = self;
  id v25 = v20;
  id v21 = v20;
  v22 = +[FCInterestToken interestTokenWithRemoveInterestBlock:v24];

  return v22;
}

- (void)addFetchGroup:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__FCFetchCoordinator_addFetchGroup___block_invoke;
    v6[3] = &unk_1E5B4BE70;
    v6[4] = a1;
    id v7 = v3;
    [v5 performWithLockSync:v6];
  }
}

- (id)fetchKey:(id)a3 qualityOfService:(int64_t)a4 completionQueue:(id)a5 completion:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v10 arrayWithObjects:&v17 count:1];

  id v15 = -[FCFetchCoordinator fetchKeys:context:qualityOfService:relativePriority:completionQueue:completion:](self, "fetchKeys:context:qualityOfService:relativePriority:completionQueue:completion:", v14, 0, a4, 0, v12, v11, v17, v18);

  return v15;
}

- (void)setMaxConcurrentFetchCount:(unint64_t)a3
{
  self->_maxConcurrentFetchCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchThrottler, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_fetchOperationsByGroup, 0);
  objc_storeStrong((id *)&self->_allKeys, 0);
  objc_storeStrong((id *)&self->_fetchGroups, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end