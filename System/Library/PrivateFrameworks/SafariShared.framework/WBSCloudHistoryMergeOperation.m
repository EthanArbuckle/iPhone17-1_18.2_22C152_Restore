@interface WBSCloudHistoryMergeOperation
- (WBSCloudHistoryMergeOperation)initWithDatabase:(id)a3 fetchResult:(id)a4 profileServerIdentifier:(id)a5;
- (void)_buildRedirectChains;
- (void)_buildVisitsByVisitIdentifiersMap;
- (void)_filterVisitsByTombstones;
- (void)_loadTombstonesWithCompletion:(id)a3;
- (void)_lookUpExistingItemsWithCompletion:(id)a3;
- (void)_mergeVisitsWithCompletion:(id)a3;
- (void)_removeDuplicateVisits;
- (void)_replayAndAddTombstones:(id)a3;
- (void)_updateClientVersions;
- (void)mergeWithCompletion:(id)a3;
@end

@implementation WBSCloudHistoryMergeOperation

- (WBSCloudHistoryMergeOperation)initWithDatabase:(id)a3 fetchResult:(id)a4 profileServerIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WBSCloudHistoryMergeOperation;
  v12 = [(WBSCloudHistoryMergeOperation *)&v17 init];
  if (v12)
  {
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.SafariShared.WBSCloudHistoryMergeOperation", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_fetchResult, a4);
    objc_storeStrong((id *)&v12->_database, a3);
    objc_storeStrong((id *)&v12->_profileServerIdentifier, a5);
    v15 = v12;
  }

  return v12;
}

- (void)mergeWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  [*(id *)(a1 + 32) _updateClientVersions];
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5C8CDF0;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  [v2 _replayAndAddTombstones:v3];
}

void __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _buildVisitsByVisitIdentifiersMap];
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke_3;
  v3[3] = &unk_1E5C8CDF0;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  [v2 _loadTombstonesWithCompletion:v3];
}

void __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _buildRedirectChains];
  [*(id *)(a1 + 32) _filterVisitsByTombstones];
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke_4;
  v3[3] = &unk_1E5C8CDF0;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  [v2 _lookUpExistingItemsWithCompletion:v3];
}

uint64_t __53__WBSCloudHistoryMergeOperation_mergeWithCompletion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeDuplicateVisits];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _mergeVisitsWithCompletion:v3];
}

- (void)_updateClientVersions
{
  uint64_t v3 = [(WBSCloudHistoryFetchResult *)self->_fetchResult clientVersions];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__WBSCloudHistoryMergeOperation__updateClientVersions__block_invoke;
  v4[3] = &unk_1E5C8DBD8;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __54__WBSCloudHistoryMergeOperation__updateClientVersions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v5 = a3;
  objc_msgSend(v4, "setLastSeenDate:forCloudClientVersion:completionHandler:", v5, objc_msgSend(a2, "unsignedIntegerValue"), &__block_literal_global_16);
}

void __54__WBSCloudHistoryMergeOperation__updateClientVersions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __54__WBSCloudHistoryMergeOperation__updateClientVersions__block_invoke_2_cold_1(v3);
    }
  }
}

- (void)_replayAndAddTombstones:(id)a3
{
  id v4 = a3;
  database = self->_database;
  id v6 = [(WBSCloudHistoryFetchResult *)self->_fetchResult tombstonesForProfileWithServerIdentifier:self->_profileServerIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__WBSCloudHistoryMergeOperation__replayAndAddTombstones___block_invoke;
  v8[3] = &unk_1E5C8DC00;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(WBSHistoryServiceDatabaseProtocol *)database replayAndAddTombstones:v6 completionHandler:v8];
}

void __57__WBSCloudHistoryMergeOperation__replayAndAddTombstones___block_invoke(uint64_t a1)
{
}

- (void)_buildVisitsByVisitIdentifiersMap
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  visitsByVisitIdentifiers = self->_visitsByVisitIdentifiers;
  self->_visitsByVisitIdentifiers = v3;

  id v5 = [MEMORY[0x1E4F28BD0] set];
  v25 = self;
  id v6 = [(WBSCloudHistoryFetchResult *)self->_fetchResult visitsForProfileWithServerIdentifier:self->_profileServerIdentifier];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = NSNumber;
        v12 = [*(id *)(*((void *)&v30 + 1) + 8 * i) visitIdentifier];
        [v12 visitTime];
        v14 = [v11 numberWithUnsignedInteger:(unint64_t)(v13 / 10.0)];
        [v5 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        v21 = [v20 visitIdentifier];
        [v21 visitTime];
        v23 = [NSNumber numberWithUnsignedInteger:(unint64_t)(v22 / 10.0)];
        unint64_t v24 = [v5 countForObject:v23];

        if (v24 <= 0x63) {
          [(NSMutableDictionary *)v25->_visitsByVisitIdentifiers setObject:v20 forKeyedSubscript:v21];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v17);
  }
}

- (void)_loadTombstonesWithCompletion:(id)a3
{
  id v4 = a3;
  database = self->_database;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__WBSCloudHistoryMergeOperation__loadTombstonesWithCompletion___block_invoke;
  v7[3] = &unk_1E5C8DC28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(WBSHistoryServiceDatabaseProtocol *)database fetchAllTombstonesWithCompletionHandler:v7];
}

void __63__WBSCloudHistoryMergeOperation__loadTombstonesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__WBSCloudHistoryMergeOperation__loadTombstonesWithCompletion___block_invoke_cold_1(v7);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(NSObject **)(v8 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__WBSCloudHistoryMergeOperation__loadTombstonesWithCompletion___block_invoke_6;
  block[3] = &unk_1E5C8C8F8;
  block[4] = v8;
  id v12 = v5;
  id v13 = *(id *)(a1 + 40);
  id v10 = v5;
  dispatch_async(v9, block);
}

uint64_t __63__WBSCloudHistoryMergeOperation__loadTombstonesWithCompletion___block_invoke_6(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)_buildRedirectChains
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableDictionary *)self->_visitsByVisitIdentifiers allValues];
  id v4 = [MEMORY[0x1E4F1CA80] setWithArray:v3];
  redirectChainEarliestVisits = self->_redirectChainEarliestVisits;
  self->_redirectChainEarliestVisits = v4;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
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
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "redirectSourceVisitIdentifier", (void)v14);
        if (v12)
        {
          id v13 = [(NSMutableDictionary *)self->_visitsByVisitIdentifiers objectForKeyedSubscript:v12];
          [v11 setRedirectSourceVisit:v13];
          [v13 setRedirectDestinationVisit:v11];
          if (v13) {
            [(NSMutableSet *)self->_redirectChainEarliestVisits removeObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)_filterVisitsByTombstones
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v40 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v37 = self;
  id v4 = self->_tombstones;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v50 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v10 = [v9 urlString];
        if ([v10 length])
        {
          id v11 = [v3 objectForKeyedSubscript:v10];
          if (!v11)
          {
            id v11 = [MEMORY[0x1E4F1CA48] array];
            [v3 setObject:v11 forKeyedSubscript:v10];
          }
          [v11 addObject:v9];
        }
        else
        {
          [v40 addObject:v9];
        }
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v6);
  }

  id v12 = [MEMORY[0x1E4F1CA48] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v37->_visitsByVisitIdentifiers;
  uint64_t v39 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v46 != v38) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v15 = [v14 urlString];
        long long v16 = [v3 objectForKeyedSubscript:v15];
        long long v17 = [v40 arrayByAddingObjectsFromArray:v16];

        uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v53 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v42;
          while (2)
          {
            for (uint64_t k = 0; k != v19; ++k)
            {
              if (*(void *)v42 != v20) {
                objc_enumerationMutation(v17);
              }
              double v22 = *(void **)(*((void *)&v41 + 1) + 8 * k);
              [v14 visitTime];
              double v24 = v23;
              v25 = [v14 urlString];
              LODWORD(v22) = [v22 matchesVisitTime:v25 urlString:v24];

              if (v22)
              {
                id v26 = [(NSMutableDictionary *)v37->_visitsByVisitIdentifiers objectForKeyedSubscript:v14];
                long long v27 = v26;
                if (v26)
                {
                  long long v28 = [v26 visitIdentifier];
                  [v12 addObject:v28];

                  uint64_t v29 = [v27 redirectSourceVisit];
                  long long v30 = v27;
                  if (v29)
                  {
                    long long v31 = v27;
                    do
                    {
                      long long v30 = (void *)v29;

                      long long v32 = [v30 visitIdentifier];
                      [v12 addObject:v32];

                      uint64_t v29 = [v30 redirectSourceVisit];
                      long long v31 = v30;
                    }
                    while (v29);
                  }
                  [(NSMutableSet *)v37->_redirectChainEarliestVisits removeObject:v30];
                }
                long long v33 = [v27 redirectDestinationVisit];
                if (v33)
                {
                  do
                  {
                    v34 = [v33 visitIdentifier];
                    [v12 addObject:v34];

                    uint64_t v35 = [v33 redirectDestinationVisit];

                    long long v33 = (void *)v35;
                  }
                  while (v35);
                }

                goto LABEL_35;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v53 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }
LABEL_35:
      }
      uint64_t v39 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v39);
  }

  [(NSMutableDictionary *)v37->_visitsByVisitIdentifiers removeObjectsForKeys:v12];
}

- (void)_lookUpExistingItemsWithCompletion:(id)a3
{
  id v4 = a3;
  database = self->_database;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = [(NSMutableDictionary *)self->_visitsByVisitIdentifiers allKeys];
  uint64_t v8 = [v6 setWithArray:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__WBSCloudHistoryMergeOperation__lookUpExistingItemsWithCompletion___block_invoke;
  v10[3] = &unk_1E5C8DC28;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(WBSHistoryServiceDatabaseProtocol *)database visitIdentifiersMatchingExistingVisits:v8 desiredVisitTimePrecision:0 completionHandler:v10];
}

void __68__WBSCloudHistoryMergeOperation__lookUpExistingItemsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__WBSCloudHistoryMergeOperation__lookUpExistingItemsWithCompletion___block_invoke_cold_1(v7);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__WBSCloudHistoryMergeOperation__lookUpExistingItemsWithCompletion___block_invoke_11;
  block[3] = &unk_1E5C8C8F8;
  block[4] = v8;
  id v12 = v5;
  id v13 = *(id *)(a1 + 40);
  id v10 = v5;
  dispatch_async(v9, block);
}

uint64_t __68__WBSCloudHistoryMergeOperation__lookUpExistingItemsWithCompletion___block_invoke_11(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v5();
}

- (void)_removeDuplicateVisits
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v3 = (void *)[(NSMutableSet *)self->_redirectChainEarliestVisits copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v19 + 1) + 8 * v7);
        id v9 = v8;
        if (v8)
        {
          id v10 = v8;
          while (1)
          {
            existingVisits = self->_existingVisits;
            id v12 = [v10 visitIdentifier];
            BOOL v13 = [(NSSet *)existingVisits containsObject:v12];

            uint64_t v14 = [v10 redirectDestinationVisit];
            long long v15 = (void *)v14;
            if (!v13) {
              break;
            }

            id v10 = v15;
            if (!v15) {
              goto LABEL_10;
            }
          }
          if (v14)
          {
            while (1)
            {
              long long v16 = self->_existingVisits;
              long long v17 = [v15 visitIdentifier];
              LOBYTE(v16) = [(NSSet *)v16 containsObject:v17];

              if (v16) {
                break;
              }
              uint64_t v18 = [v15 redirectDestinationVisit];

              long long v15 = (void *)v18;
              if (!v18) {
                goto LABEL_14;
              }
            }
            [(NSMutableSet *)self->_redirectChainEarliestVisits removeObject:v9];
          }
          else
          {
LABEL_14:
            if (v10 != v9)
            {
              [(NSMutableSet *)self->_redirectChainEarliestVisits removeObject:v9];
              [(NSMutableSet *)self->_redirectChainEarliestVisits addObject:v10];
            }
          }
        }
        else
        {
LABEL_10:
          [(NSMutableSet *)self->_redirectChainEarliestVisits removeObject:v9];
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
}

- (void)_mergeVisitsWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  blocuint64_t k = a3;
  uint64_t v4 = [(NSMutableSet *)self->_redirectChainEarliestVisits allObjects];
  uint64_t v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_14];

  uint64_t v6 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v5;
  uint64_t v19 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v7;
        id v8 = *(id *)(*((void *)&v23 + 1) + 8 * v7);
        if (v8)
        {
          do
          {
            id v9 = [v8 visitIdentifier];
            dispatch_group_enter(v6);
            database = self->_database;
            id v11 = [v8 redirectSourceVisitIdentifier];
            id v12 = [v8 title];
            uint64_t v13 = [v8 wasHTTPNonGet];
            uint64_t v14 = [v8 loadWasSuccessful];
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __60__WBSCloudHistoryMergeOperation__mergeVisitsWithCompletion___block_invoke_2;
            v21[3] = &unk_1E5C8DC70;
            long long v22 = v6;
            [(WBSHistoryServiceDatabaseProtocol *)database recordVisitWithIdentifier:v9 sourceVisit:v11 title:v12 wasHTTPNonGet:v13 loadSuccessful:v14 origin:1 attributes:0 statusCode:0 completionHandler:v21];

            uint64_t v15 = [v8 redirectDestinationVisit];

            id v8 = (id)v15;
          }
          while (v15);
        }
        uint64_t v7 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v19);
  }

  dispatch_group_notify(v6, (dispatch_queue_t)self->_queue, block);
}

uint64_t __60__WBSCloudHistoryMergeOperation__mergeVisitsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 visitIdentifier];
  [v5 visitTime];
  double v7 = v6;

  id v8 = [v4 visitIdentifier];

  [v8 visitTime];
  double v10 = v9;

  uint64_t v11 = -1;
  if (v7 >= v10) {
    uint64_t v11 = 1;
  }
  if (v7 == v10) {
    return 0;
  }
  else {
    return v11;
  }
}

void __60__WBSCloudHistoryMergeOperation__mergeVisitsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__WBSCloudHistoryMergeOperation__mergeVisitsWithCompletion___block_invoke_2_cold_1(v4);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingVisits, 0);
  objc_storeStrong((id *)&self->_tombstonesByURLString, 0);
  objc_storeStrong((id *)&self->_tombstones, 0);
  objc_storeStrong((id *)&self->_redirectChainEarliestVisits, 0);
  objc_storeStrong((id *)&self->_visitsByVisitIdentifiers, 0);
  objc_storeStrong((id *)&self->_profileServerIdentifier, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __54__WBSCloudHistoryMergeOperation__updateClientVersions__block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to update cloud client version table: %{public}@", v6, v7, v8, v9, v10);
}

void __63__WBSCloudHistoryMergeOperation__loadTombstonesWithCompletion___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to fetch all tombstones: %{private}@", v6, v7, v8, v9, v10);
}

void __68__WBSCloudHistoryMergeOperation__lookUpExistingItemsWithCompletion___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to find matching existing visits: %{private}@", v6, v7, v8, v9, v10);
}

void __60__WBSCloudHistoryMergeOperation__mergeVisitsWithCompletion___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to record visit: %{public}@", v6, v7, v8, v9, v10);
}

@end