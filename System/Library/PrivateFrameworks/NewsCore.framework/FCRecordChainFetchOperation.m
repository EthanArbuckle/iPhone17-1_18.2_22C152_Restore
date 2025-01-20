@interface FCRecordChainFetchOperation
- (BOOL)_shouldIgnoreCache;
- (BOOL)shouldBypassRecordSourcePersistence;
- (BOOL)shouldFailOnLimitExceededError;
- (BOOL)shouldReturnErrorWhenSomeRecordsMissing;
- (BOOL)validateOperation;
- (FCCachePolicy)cachePolicy;
- (FCContentContext)context;
- (FCEdgeCacheHint)edgeCacheHint;
- (FCRecordChainFetchOperation)init;
- (NSArray)additionalRecordSources;
- (NSArray)networkEvents;
- (NSArray)topLevelRecordIDs;
- (NSDictionary)cachePoliciesByRecordID;
- (NSDictionary)cachePoliciesByRecordType;
- (NSDictionary)linkKeysByRecordType;
- (id)_errorForMissingRecordNames:(uint64_t)a1;
- (id)_partialFetchErrorForMissingRecordName:(uint64_t)a1;
- (id)_recordSourceForRecordType:(id *)a1;
- (id)_recordTypeForRecordID:(uint64_t)a1;
- (id)cachedRecordsLookupBlock;
- (id)dynamicCachePolicyBlock;
- (id)networkActivityBlock;
- (id)recordChainCompletionHandler;
- (int)networkEventType;
- (uint64_t)_pbRecordTypeForRecordType:(uint64_t)result;
- (void)_collectActualTopLevelRecordIDsFromRecordIDs:(void *)a3 visitedRecordIDs:;
- (void)_finalizeResultFromCachedRecords;
- (void)_walkRecordChainStartingWithRecordIDs:(void *)a3 visitedRecordIDs:(void *)a4 recordsLookupBlock:(void *)a5 visitorBlock:;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setAdditionalRecordSources:(id)a3;
- (void)setCachePoliciesByRecordID:(id)a3;
- (void)setCachePoliciesByRecordType:(id)a3;
- (void)setCachePolicy:(id)a3;
- (void)setCachedRecords:(uint64_t)a1;
- (void)setCachedRecordsLookupBlock:(id)a3;
- (void)setContext:(id)a3;
- (void)setDynamicCachePolicyBlock:(id)a3;
- (void)setEdgeCacheHint:(id)a3;
- (void)setLinkKeysByRecordType:(id)a3;
- (void)setNetworkActivityBlock:(id)a3;
- (void)setNetworkEventType:(int)a3;
- (void)setRecordChainCompletionHandler:(id)a3;
- (void)setShouldBypassRecordSourcePersistence:(BOOL)a3;
- (void)setShouldFailOnLimitExceededError:(BOOL)a3;
- (void)setShouldReturnErrorWhenSomeRecordsMissing:(BOOL)a3;
- (void)setTopLevelRecordIDs:(id)a3;
@end

@implementation FCRecordChainFetchOperation

- (id)_recordTypeForRecordID:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = *(id *)(a1 + 472);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        if ([v10 recognizesRecordID:v3]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v26 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      v11 = [v10 recordType];

      if (v11) {
        goto LABEL_15;
      }
    }
    else
    {
LABEL_10:
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)[[NSString alloc] initWithFormat:@"unrecognized record ID %@", v3];
      *(_DWORD *)buf = 136315906;
      v19 = "-[FCRecordChainFetchOperation _recordTypeForRecordID:]";
      __int16 v20 = 2080;
      v21 = "FCRecordChainFetchOperation.m";
      __int16 v22 = 1024;
      int v23 = 816;
      __int16 v24 = 2114;
      v25 = v13;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v11 = 0;
LABEL_15:
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableNetworkEvents, 0);
  objc_storeStrong((id *)&self->_resultHeldRecordsByType, 0);
  objc_storeStrong((id *)&self->_missingCachedOnlyTopLevelRecordIDs, 0);
  objc_storeStrong((id *)&self->_skippedTopLevelRecordIDs, 0);
  objc_storeStrong((id *)&self->_actualTopLevelRecordIDs, 0);
  objc_storeStrong((id *)&self->_cachedRecords, 0);
  objc_storeStrong((id *)&self->_pbRecordTypesByRecordType, 0);
  objc_storeStrong((id *)&self->_recordSourcesByRecordType, 0);
  objc_storeStrong((id *)&self->_recordSources, 0);
  objc_storeStrong(&self->_recordChainCompletionHandler, 0);
  objc_storeStrong(&self->_cachedRecordsLookupBlock, 0);
  objc_storeStrong(&self->_networkActivityBlock, 0);
  objc_storeStrong((id *)&self->_additionalRecordSources, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong(&self->_dynamicCachePolicyBlock, 0);
  objc_storeStrong((id *)&self->_cachePoliciesByRecordID, 0);
  objc_storeStrong((id *)&self->_cachePoliciesByRecordType, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
  objc_storeStrong((id *)&self->_linkKeysByRecordType, 0);
  objc_storeStrong((id *)&self->_topLevelRecordIDs, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

BOOL __65__FCRecordChainFetchOperation__recordIDsMissingFromCachedRecords__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 base];
  BOOL v4 = [v3 recordType] == *(_DWORD *)(a1 + 32);

  return v4;
}

uint64_t __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 base];
  BOOL v4 = [v3 identifier];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

BOOL __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 base];
  BOOL v4 = [v3 recordType] == *(_DWORD *)(a1 + 32);

  return v4;
}

uint64_t __47__FCRecordChainFetchOperation_prepareOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (void *)MEMORY[0x1E4FBA8A8];
  id v5 = a2;
  uint64_t v6 = [a3 recordIDPrefixes];
  uint64_t v7 = [v6 firstObject];
  uint64_t v8 = [v5 recordIDPrefixes];

  uint64_t v9 = [v8 firstObject];
  uint64_t v10 = objc_msgSend(v4, "nf_compareObject:toObject:", v7, v9);

  return v10;
}

- (void)_collectActualTopLevelRecordIDsFromRecordIDs:(void *)a3 visitedRecordIDs:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (-[FCRecordChainFetchOperation _shouldIgnoreCache](a1))
    {
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __93__FCRecordChainFetchOperation__collectActualTopLevelRecordIDsFromRecordIDs_visitedRecordIDs___block_invoke;
      v54[3] = &unk_1E5B4BE70;
      v54[4] = a1;
      id v55 = v5;
      __93__FCRecordChainFetchOperation__collectActualTopLevelRecordIDsFromRecordIDs_visitedRecordIDs___block_invoke((uint64_t)v54);
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
      id v33 = v6;
      [v6 unionSet:v5];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v34 = v5;
      obuint64_t j = v5;
      uint64_t v41 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
      if (v41)
      {
        unint64_t v8 = 0x1EB5BD000uLL;
        uint64_t v40 = *(void *)v51;
        v35 = a1;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v51 != v40) {
              objc_enumerationMutation(obj);
            }
            uint64_t v10 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            v11 = [*(id *)((char *)a1 + *(int *)(v8 + 2592)) recordWithID:v10];
            v42 = v10;
            v12 = -[FCRecordChainFetchOperation _recordTypeForRecordID:]((uint64_t)a1, v10);
            v44 = -[FCRecordChainFetchOperation _recordSourceForRecordType:](a1, (uint64_t)v12);
            v13 = [a1 dynamicCachePolicyBlock];

            if (!v13) {
              goto LABEL_45;
            }
            long long v14 = [a1 dynamicCachePolicyBlock];
            [v11 base];
            long long v15 = a1;
            long long v16 = v12;
            v18 = uint64_t v17 = i;
            v19 = ((void (**)(void, uint64_t, void *))v14)[2](v14, [v18 recordType], v11);

            uint64_t i = v17;
            v12 = v16;
            a1 = v15;
            unint64_t v8 = 0x1EB5BD000;

            if (!v19)
            {
LABEL_45:
              __int16 v20 = [a1 cachePoliciesByRecordID];
              v19 = [v20 objectForKey:v42];

              if (!v19)
              {
                v21 = [a1 cachePoliciesByRecordType];
                v19 = [v21 objectForKey:v12];

                if (!v19)
                {
                  v19 = [a1 cachePolicy];
                }
              }
            }
            v45 = v19;
            if (v11) {
              int v22 = [v44 isRecordStale:v11 withCachePolicy:v19];
            }
            else {
              int v22 = 1;
            }
            uint64_t v23 = [v19 cachePolicy];
            if (!v22 || v23 == 3)
            {
              if (!v11 && v23 == 3) {
                [a1[65] addObject:v42];
              }
              [a1[64] addObject:v42];
              __int16 v24 = [a1 linkKeysByRecordType];
              v25 = [v24 objectForKey:v12];

              if ([v25 count])
              {
                v38 = v12;
                v39 = v11;
                uint64_t v43 = i;
                v26 = [v44 keyValueRepresentationOfRecord:v11];
                long long v46 = 0u;
                long long v47 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                v37 = v25;
                id v27 = v25;
                uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v56 count:16];
                if (v28)
                {
                  uint64_t v29 = v28;
                  uint64_t v30 = *(void *)v47;
                  do
                  {
                    for (uint64_t j = 0; j != v29; ++j)
                    {
                      if (*(void *)v47 != v30) {
                        objc_enumerationMutation(v27);
                      }
                      v32 = [v26 valueForKey:*(void *)(*((void *)&v46 + 1) + 8 * j)];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v7 addObject:v32];
                      }
                      else
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass()) {
                          [v7 addObjectsFromArray:v32];
                        }
                      }
                    }
                    uint64_t v29 = [v27 countByEnumeratingWithState:&v46 objects:v56 count:16];
                  }
                  while (v29);
                }

                a1 = v35;
                unint64_t v8 = 0x1EB5BD000;
                uint64_t i = v43;
                v12 = v38;
                v11 = v39;
                v25 = v37;
              }
            }
            else
            {
              [a1[63] addObject:v42];
            }
          }
          uint64_t v41 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
        }
        while (v41);
      }

      id v6 = v33;
      [v7 minusSet:v33];
      if ([v7 count]) {
        -[FCRecordChainFetchOperation _collectActualTopLevelRecordIDsFromRecordIDs:visitedRecordIDs:](a1, v7, v33);
      }

      id v5 = v34;
    }
  }
}

- (id)_recordSourceForRecordType:(id *)a1
{
  if (a1)
  {
    a1 = [a1[60] objectForKey:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)dynamicCachePolicyBlock
{
  return self->_dynamicCachePolicyBlock;
}

- (NSDictionary)cachePoliciesByRecordType
{
  return self->_cachePoliciesByRecordType;
}

- (NSDictionary)cachePoliciesByRecordID
{
  return self->_cachePoliciesByRecordID;
}

- (void)_walkRecordChainStartingWithRecordIDs:(void *)a3 visitedRecordIDs:(void *)a4 recordsLookupBlock:(void *)a5 visitorBlock:
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v46 = a3;
  id v48 = a4;
  long long v47 = a5;
  uint64_t v10 = (void *)[v9 mutableCopy];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v70 objects:v85 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    v13 = MEMORY[0x1E4F14500];
    uint64_t v14 = *(void *)v71;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v71 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v70 + 1) + 8 * v15);
        uint64_t v17 = -[FCRecordChainFetchOperation _recordTypeForRecordID:]((uint64_t)a1, v16);
        if (v17)
        {
          v18 = [a1 linkKeysByRecordType];
          v19 = [v18 objectForKeyedSubscript:v17];

          if (v19) {
            goto LABEL_12;
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            __int16 v20 = (void *)[[NSString alloc] initWithFormat:@"missing link entry for record ID %@", v16];
            *(_DWORD *)buf = 136315906;
            v78 = "-[FCRecordChainFetchOperation _walkRecordChainStartingWithRecordIDs:visitedRecordIDs:recordsLookupBloc"
                  "k:visitorBlock:]";
            __int16 v79 = 2080;
            v80 = "FCRecordChainFetchOperation.m";
            __int16 v81 = 1024;
            int v82 = 623;
            __int16 v83 = 2114;
            v84 = v20;
            v21 = v13;
LABEL_15:
            _os_log_error_impl(&dword_1A460D000, v21, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          __int16 v20 = (void *)[[NSString alloc] initWithFormat:@"unknown type for record ID %@", v16];
          *(_DWORD *)buf = 136315906;
          v78 = "-[FCRecordChainFetchOperation _walkRecordChainStartingWithRecordIDs:visitedRecordIDs:recordsLookupBlock:visitorBlock:]";
          __int16 v79 = 2080;
          v80 = "FCRecordChainFetchOperation.m";
          __int16 v81 = 1024;
          int v82 = 618;
          __int16 v83 = 2114;
          v84 = v20;
          v21 = v13;
          goto LABEL_15;
        }
        [v10 removeObject:v16];
LABEL_12:

        ++v15;
      }
      while (v12 != v15);
      uint64_t v22 = [obj countByEnumeratingWithState:&v70 objects:v85 count:16];
      uint64_t v12 = v22;
    }
    while (v22);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v50 = a1;
  id v49 = [a1 linkKeysByRecordType];
  uint64_t v23 = [v49 countByEnumeratingWithState:&v66 objects:v76 count:16];
  __int16 v24 = v46;
  v25 = v48;
  if (v23)
  {
    uint64_t v26 = v23;
    uint64_t v27 = *(void *)v67;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v67 != v27) {
          objc_enumerationMutation(v49);
        }
        uint64_t v29 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __118__FCRecordChainFetchOperation__walkRecordChainStartingWithRecordIDs_visitedRecordIDs_recordsLookupBlock_visitorBlock___block_invoke;
        v65[3] = &unk_1E5B54738;
        v65[4] = a1;
        v65[5] = v29;
        uint64_t v30 = objc_msgSend(v10, "fc_arrayOfObjectsPassingTest:", v65);
        if ([v30 count])
        {
          objc_msgSend(v10, "fc_removeObjectsFromArray:", v30);
          v31 = (void *)MEMORY[0x1A6260FD0]([v46 addObjectsFromArray:v30]);
          v25 = v48;
          v32 = (*((void (**)(id, uint64_t, void *))v48 + 2))(v48, v29, v30);
          v47[2](v47, v30, v32);
          id v33 = [v50 linkKeysByRecordType];
          id v34 = [v33 objectForKey:v29];

          v54 = v34;
          if ([v34 count])
          {
            v44 = v31;
            v45 = v30;
            long long v53 = -[FCRecordChainFetchOperation _recordSourceForRecordType:]((id *)v50, v29);
            long long v61 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            uint64_t v43 = v32;
            id v51 = [v32 allRecords];
            uint64_t v55 = [v51 countByEnumeratingWithState:&v61 objects:v75 count:16];
            if (v55)
            {
              uint64_t v52 = *(void *)v62;
              do
              {
                for (uint64_t j = 0; j != v55; ++j)
                {
                  if (*(void *)v62 != v52) {
                    objc_enumerationMutation(v51);
                  }
                  v36 = [v53 keyValueRepresentationOfRecord:*(void *)(*((void *)&v61 + 1) + 8 * j)];
                  long long v57 = 0u;
                  long long v58 = 0u;
                  long long v59 = 0u;
                  long long v60 = 0u;
                  id v37 = v54;
                  uint64_t v38 = [v37 countByEnumeratingWithState:&v57 objects:v74 count:16];
                  if (v38)
                  {
                    uint64_t v39 = v38;
                    uint64_t v40 = *(void *)v58;
                    do
                    {
                      for (uint64_t k = 0; k != v39; ++k)
                      {
                        if (*(void *)v58 != v40) {
                          objc_enumerationMutation(v37);
                        }
                        v42 = [v36 valueForKey:*(void *)(*((void *)&v57 + 1) + 8 * k)];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          [v10 addObject:v42];
                        }
                        else
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            [v10 addObjectsFromArray:v42];
                          }
                        }
                      }
                      uint64_t v39 = [v37 countByEnumeratingWithState:&v57 objects:v74 count:16];
                    }
                    while (v39);
                  }
                }
                uint64_t v55 = [v51 countByEnumeratingWithState:&v61 objects:v75 count:16];
              }
              while (v55);
            }

            uint64_t v30 = v45;
            __int16 v24 = v46;
            v25 = v48;
            v32 = v43;
            v31 = v44;
          }

          goto LABEL_47;
        }
      }
      uint64_t v26 = [v49 countByEnumeratingWithState:&v66 objects:v76 count:16];
      v25 = v48;
      if (v26) {
        continue;
      }
      break;
    }
  }
LABEL_47:

  [v10 minusSet:v24];
  if ([v10 count]) {
    -[FCRecordChainFetchOperation _walkRecordChainStartingWithRecordIDs:visitedRecordIDs:recordsLookupBlock:visitorBlock:](v50, v10, v24, v25, v47);
  }
}

- (NSDictionary)linkKeysByRecordType
{
  return self->_linkKeysByRecordType;
}

uint64_t __118__FCRecordChainFetchOperation__walkRecordChainStartingWithRecordIDs_visitedRecordIDs_recordsLookupBlock_visitorBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = -[FCRecordChainFetchOperation _recordTypeForRecordID:](*(void *)(a1 + 32), a2);
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 40)];

  return v4;
}

void __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v11 = [v6 base];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "recordType"));
  unint64_t v8 = [v11 identifier];
  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  [v9 setObject:v6 forKeyedSubscript:v8];

  uint64_t v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
  [v10 setObject:v5 forKeyedSubscript:v8];
}

- (BOOL)_shouldIgnoreCache
{
  uint64_t v2 = [a1 cachePolicy];
  uint64_t v3 = [v2 cachePolicy];

  if (v3 != 1) {
    return 0;
  }
  uint64_t v4 = [a1 cachePoliciesByRecordID];
  uint64_t v5 = [v4 count];

  if (v5) {
    return 0;
  }
  id v6 = [a1 cachePoliciesByRecordType];
  uint64_t v7 = [v6 count];

  if (v7) {
    return 0;
  }
  uint64_t v10 = [a1 dynamicCachePolicyBlock];
  BOOL v8 = v10 == 0;

  return v8;
}

- (FCCachePolicy)cachePolicy
{
  return self->_cachePolicy;
}

id __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(id **)(a1 + 32);
  id v5 = a3;
  id v6 = -[FCRecordChainFetchOperation _recordSourceForRecordType:](v4, a2);
  uint64_t v7 = [v6 cachedRecordsWithIDs:v5];

  return v7;
}

void __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    id v5 = (void *)v5[62];
  }
  id v6 = v5;
  id v7 = +[FCHeldRecords heldRecordsByMerging:v6 with:a3];
  -[FCRecordChainFetchOperation setCachedRecords:](*(void *)(a1 + 32), v7);
}

- (void)setCachedRecords:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 496), a2);
  }
}

id __65__FCRecordChainFetchOperation__recordIDsMissingFromCachedRecords__block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v3 = -[FCRecordChainFetchOperation _pbRecordTypeForRecordType:](*(void *)(a1 + 32), a2);
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4) {
    uint64_t v4 = (void *)v4[62];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__FCRecordChainFetchOperation__recordIDsMissingFromCachedRecords__block_invoke_3;
  v7[3] = &__block_descriptor_36_e8_B16__0_8l;
  int v8 = v3;
  id v5 = [v4 heldRecordsPassingTest:v7];
  return v5;
}

void __65__FCRecordChainFetchOperation__recordIDsMissingFromCachedRecords__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = a3;
  id v8 = [v5 setWithArray:a2];
  id v7 = [v6 allRecordIDs];

  objc_msgSend(v8, "fc_removeObjectsFromArray:", v7);
  [*(id *)(a1 + 32) unionSet:v8];
}

void __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        id v9 = [FCHeldRecords alloc];
        uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
        id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
        uint64_t v12 = [(FCHeldRecords *)v9 initWithRecordsByID:v10 interestTokensByID:v11];

        [v3 setObject:v12 forKeyedSubscript:v8];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

id __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v3 = -[FCRecordChainFetchOperation _pbRecordTypeForRecordType:](*(void *)(a1 + 32), a2);
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4) {
    uint64_t v4 = (void *)v4[62];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke_3;
  v7[3] = &__block_descriptor_36_e8_B16__0_8l;
  int v8 = v3;
  uint64_t v5 = [v4 heldRecordsPassingTest:v7];
  return v5;
}

void __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = [a3 allRecordIDs];
  [v3 addObjectsFromArray:v4];
}

- (void)prepareOperation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v3 = [(FCRecordChainFetchOperation *)self context];
  id v4 = [v3 internalContentContext];
  uint64_t v5 = [v4 recordSources];
  uint64_t v6 = [(FCRecordChainFetchOperation *)self additionalRecordSources];
  uint64_t v7 = [v5 arrayByAddingObjectsFromArray:v6];

  uint64_t v23 = v7;
  int v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_67];
  if (self) {
    objc_storeStrong((id *)&self->_recordSources, v8);
  }

  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  if (self) {
    recordSources = self->_recordSources;
  }
  else {
    recordSources = 0;
  }
  uint64_t v12 = recordSources;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v18 = [v17 recordType];
        [v9 setObject:v17 forKey:v18];

        uint64_t v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "pbRecordType"));
        __int16 v20 = [v17 recordType];
        [v10 setObject:v19 forKey:v20];
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  if (self)
  {
    objc_storeStrong((id *)&self->_recordSourcesByRecordType, v9);
    objc_storeStrong((id *)&self->_pbRecordTypesByRecordType, v10);
  }
  v21 = [(FCRecordChainFetchOperation *)self cachePolicy];

  if (!v21)
  {
    uint64_t v22 = +[FCCachePolicy defaultCachePolicy];
    [(FCRecordChainFetchOperation *)self setCachePolicy:v22];
  }
}

- (BOOL)validateOperation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v3 = [(FCRecordChainFetchOperation *)self context];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"record chain fetch operation requires a context"];
    int v12 = 136315906;
    uint64_t v13 = "-[FCRecordChainFetchOperation validateOperation]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCRecordChainFetchOperation.m";
    __int16 v16 = 1024;
    int v17 = 59;
    __int16 v18 = 2114;
    uint64_t v19 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);
  }
  id v4 = [(FCRecordChainFetchOperation *)self linkKeysByRecordType];
  uint64_t v5 = [v4 count];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v11 = (void *)[[NSString alloc] initWithFormat:@"record chain fetch operation requires a list of link keys for each record type in the chain"];
    int v12 = 136315906;
    uint64_t v13 = "-[FCRecordChainFetchOperation validateOperation]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCRecordChainFetchOperation.m";
    __int16 v16 = 1024;
    int v17 = 60;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);
  }
  uint64_t v6 = [(FCRecordChainFetchOperation *)self context];
  if (v6)
  {
    uint64_t v7 = [(FCRecordChainFetchOperation *)self linkKeysByRecordType];
    BOOL v8 = [v7 count] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (FCContentContext)context
{
  return self->_context;
}

- (NSArray)additionalRecordSources
{
  return self->_additionalRecordSources;
}

- (void)setCachePolicy:(id)a3
{
}

id __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    -[FCRecordChainFetchOperation _partialFetchErrorForMissingRecordName:](*(void *)(a1 + 40), a2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = -[FCRecordChainFetchOperation _recordSourceForRecordType:](*(id **)(a1 + 32), a2);
  uint64_t v7 = [v6 fetchErrorsByKey];
  BOOL v8 = [v7 readOnlyDictionary];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v8, "objectForKeyedSubscript:", v14, (void)v17);
        __int16 v16 = v15;
        if (!v15 || (objc_msgSend(v15, "fc_isCKUnknownItemError") & 1) == 0) {
          [*(id *)(a1 + 40) addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) linkKeysByRecordType];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_2_28;
  v6[3] = &unk_1E5B545F8;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

- (void)setEdgeCacheHint:(id)a3
{
}

- (void)setTopLevelRecordIDs:(id)a3
{
}

- (void)setRecordChainCompletionHandler:(id)a3
{
}

- (void)setLinkKeysByRecordType:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (FCRecordChainFetchOperation)init
{
  v12.receiver = self;
  v12.super_class = (Class)FCRecordChainFetchOperation;
  uint64_t v2 = [(FCOperation *)&v12 init];
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    actualTopLevelRecordIDs = v2->_actualTopLevelRecordIDs;
    v2->_actualTopLevelRecordIDs = v3;

    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    skippedTopLevelRecordIDs = v2->_skippedTopLevelRecordIDs;
    v2->_skippedTopLevelRecordIDs = v5;

    id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    missingCachedOnlyTopLevelRecordIDs = v2->_missingCachedOnlyTopLevelRecordIDs;
    v2->_missingCachedOnlyTopLevelRecordIDs = v7;

    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableNetworkEvents = v2->_mutableNetworkEvents;
    v2->_mutableNetworkEvents = v9;
  }
  return v2;
}

- (void)setCachePoliciesByRecordType:(id)a3
{
}

id __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke_3()
{
  v0 = objc_opt_new();
  return v0;
}

uint64_t __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = -[FCRecordChainFetchOperation _pbRecordTypeForRecordType:](*(void *)(a1 + 32), a2);
  return [v2 numberWithInt:v3];
}

- (uint64_t)_pbRecordTypeForRecordType:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = [*(id *)(result + 488) objectForKey:a2];
    uint64_t v3 = [v2 intValue];

    return v3;
  }
  return result;
}

- (void)operationWillFinishWithError:(id)a3
{
  id v8 = a3;
  id v4 = [(FCRecordChainFetchOperation *)self recordChainCompletionHandler];

  if (v4)
  {
    uint64_t v5 = [(FCRecordChainFetchOperation *)self recordChainCompletionHandler];
    uint64_t v6 = (void *)v5;
    if (self) {
      resultHeldRecordsByType = self->_resultHeldRecordsByType;
    }
    else {
      resultHeldRecordsByType = 0;
    }
    (*(void (**)(uint64_t, NSDictionary *, id))(v5 + 16))(v5, resultHeldRecordsByType, v8);
  }
}

- (id)recordChainCompletionHandler
{
  return self->_recordChainCompletionHandler;
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) containsObject:v16]
          && [v9 containsObject:v16])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            id v17 = [NSString alloc];
            long long v18 = [v10 requestUUID];
            long long v19 = (void *)[v17 initWithFormat:@"a canary was missing from a MultiFetch response, canary=%@, uuid=%@", v16, v18, (void)v20];
            *(_DWORD *)buf = 136315906;
            long long v25 = "-[FCRecordChainFetchOperation _issueCloudRequestIfNeeded]_block_invoke_5";
            __int16 v26 = 2080;
            long long v27 = "FCRecordChainFetchOperation.m";
            __int16 v28 = 1024;
            int v29 = 416;
            __int16 v30 = 2114;
            v31 = v19;
            _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingCanary) : %s %s:%d %{public}@", buf, 0x26u);
          }
          goto LABEL_13;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v32 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)performOperation
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(FCRecordChainFetchOperation *)self topLevelRecordIDs];
  id v5 = [v3 setWithArray:v4];
  if (self)
  {
    if (-[FCRecordChainFetchOperation _shouldIgnoreCache](self))
    {
      aBlocuint64_t k = MEMORY[0x1E4F143A8];
      uint64_t v91 = 3221225472;
      v92 = __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke;
      v93 = &unk_1E5B4C018;
      v94 = self;
      __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke((uint64_t)&aBlock);
    }
    else
    {
      aBlocuint64_t k = MEMORY[0x1E4F143A8];
      uint64_t v91 = 3221225472;
      v92 = __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke_2;
      v93 = &unk_1E5B54580;
      v94 = self;
      uint64_t v6 = _Block_copy(&aBlock);
      if (![(FCRecordChainFetchOperation *)self shouldBypassRecordSourcePersistence]|| ([(FCRecordChainFetchOperation *)self cachedRecordsLookupBlock], id v7 = objc_claimAutoreleasedReturnValue(), v8 = v7 == 0, v7, v8))
      {
        *(void *)&long long v82 = MEMORY[0x1E4F143A8];
        *((void *)&v82 + 1) = 3221225472;
        id v9 = __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke_4;
      }
      else
      {
        *(void *)&long long v82 = MEMORY[0x1E4F143A8];
        *((void *)&v82 + 1) = 3221225472;
        id v9 = __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke_3;
      }
      *(void *)&long long v83 = v9;
      *((void *)&v83 + 1) = &unk_1E5B545A8;
      *(void *)&long long v84 = self;
      id v10 = _Block_copy(&v82);
      id v11 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v12 = [(FCRecordChainFetchOperation *)self topLevelRecordIDs];
      uint64_t v13 = [v11 setWithArray:v12];
      uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
      -[FCRecordChainFetchOperation _walkRecordChainStartingWithRecordIDs:visitedRecordIDs:recordsLookupBlock:visitorBlock:](self, v13, v14, v10, v6);
    }
  }

  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = [(FCRecordChainFetchOperation *)self topLevelRecordIDs];
  id v17 = [v15 setWithArray:v16];
  long long v18 = [MEMORY[0x1E4F1CA80] set];
  -[FCRecordChainFetchOperation _collectActualTopLevelRecordIDsFromRecordIDs:visitedRecordIDs:]((id *)&self->super.super.super.isa, v17, v18);

  if (self)
  {
    if ([(NSMutableSet *)self->_actualTopLevelRecordIDs count])
    {
      id v69 = [(NSMutableSet *)self->_actualTopLevelRecordIDs allObjects];
      long long v19 = objc_opt_new();
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke;
      v89[3] = &unk_1E5B545D0;
      v89[4] = self;
      long long v67 = objc_msgSend(v69, "fc_dictionaryOfSortedObjectsWithKeyBlock:", v89);
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_2;
      v87[3] = &unk_1E5B545F8;
      v87[4] = self;
      id v68 = v19;
      id v88 = v68;
      [v67 enumerateKeysAndObjectsUsingBlock:v87];
      if ([v68 count])
      {
        long long v20 = objc_alloc_init(FCCKBatchedMultiFetchQueryOperation);
        long long v21 = [(FCRecordChainFetchOperation *)self context];
        long long v22 = [v21 internalContentContext];
        long long v23 = [v22 contentDatabase];
        -[FCCKBatchedMultiFetchQueryOperation setDatabase:]((uint64_t)v20, v23);

        long long v24 = [(FCRecordChainFetchOperation *)self edgeCacheHint];
        __int16 v26 = v24;
        if (v20)
        {
          objc_setProperty_nonatomic_copy(v20, v25, v24, 416);

          v20->_networkEventType = [(FCRecordChainFetchOperation *)self networkEventType];
          long long v27 = [(FCRecordChainFetchOperation *)self networkActivityBlock];
          objc_setProperty_nonatomic_copy(v20, v28, v27, 424);
        }
        else
        {

          [(FCRecordChainFetchOperation *)self networkEventType];
          long long v27 = [(FCRecordChainFetchOperation *)self networkActivityBlock];
        }

        int v29 = [(FCRecordChainFetchOperation *)self cachePolicy];
        uint64_t v30 = [v29 cachePolicy];
        if (v20) {
          v20->_ignoreCache = v30 == 1;
        }

        v31 = objc_opt_new();
        v32 = [(FCRecordChainFetchOperation *)self edgeCacheHint];
        BOOL v33 = v32 == 0;

        if (v33)
        {
          [v31 addObjectsFromArray:v68];
          v86[0] = MEMORY[0x1E4F143A8];
          v86[1] = 3221225472;
          v86[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_3;
          v86[3] = &unk_1E5B4BF78;
          v86[4] = self;
          long long v47 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionary:", v86);
          -[FCCKBatchedMultiFetchQueryOperation setKnownRecordIDsToEtags:]((uint64_t)v20, v47);
        }
        else
        {
          id v34 = [(FCRecordChainFetchOperation *)self topLevelRecordIDs];
          [v31 addObjectsFromArray:v34];
        }
        id v48 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v31];
        id v49 = [(FCRecordChainFetchOperation *)self linkKeysByRecordType];
        long long v50 = [v49 allKeys];
        [v48 addObjectsFromArray:v50];

        id v51 = [MEMORY[0x1E4F1CA80] set];
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v52 = v48;
        uint64_t v53 = [v52 countByEnumeratingWithState:&v82 objects:&aBlock count:16];
        if (v53)
        {
          uint64_t v54 = *(void *)v83;
          do
          {
            for (uint64_t i = 0; i != v53; ++i)
            {
              if (*(void *)v83 != v54) {
                objc_enumerationMutation(v52);
              }
              v56 = -[FCRecordChainFetchOperation _recordSourceForRecordType:]((id *)&self->super.super.super.isa, *(void *)(*((void *)&v82 + 1) + 8 * i));
              long long v57 = objc_opt_class();

              if ([v57 supportsDeletions])
              {
                long long v58 = [v57 canaryRecordName];
                [v31 addObject:v58];
                [v51 addObject:v58];
              }
            }
            uint64_t v53 = [v52 countByEnumeratingWithState:&v82 objects:&aBlock count:16];
          }
          while (v53);
        }

        -[FCCKBatchedMultiFetchQueryOperation setRecordIDs:]((uint64_t)v20, v31);
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_27;
        v81[3] = &unk_1E5B4BF30;
        v81[4] = self;
        long long v59 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v81);
        -[FCCKBatchedMultiFetchQueryOperation setRecordSpecs:]((uint64_t)v20, v59);

        objc_initWeak(&location, v20);
        v78[0] = 0;
        v78[1] = v78;
        v78[2] = 0x2020000000;
        char v79 = 0;
        newValue[0] = MEMORY[0x1E4F143A8];
        newValue[1] = 3221225472;
        newValue[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_5;
        newValue[3] = &unk_1E5B54620;
        id v61 = v51;
        id v76 = v61;
        v77 = v78;
        if (v20) {
          objc_setProperty_nonatomic_copy(v20, v60, newValue, 432);
        }
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_37;
        v71[3] = &unk_1E5B54710;
        v71[4] = self;
        objc_copyWeak(&v74, &location);
        id v63 = v61;
        id v72 = v63;
        long long v73 = v78;
        if (v20) {
          objc_setProperty_nonatomic_copy(v20, v62, v71, 440);
        }
        [(FCOperation *)self associateChildOperation:v20];
        [(FCOperation *)v20 start];

        objc_destroyWeak(&v74);
        _Block_object_dispose(v78, 8);
        objc_destroyWeak(&location);

        goto LABEL_42;
      }
      -[FCRecordChainFetchOperation _finalizeResultFromCachedRecords]((uint64_t)self);
      v45 = self->_cachedRecords;
      if ([(FCHeldRecords *)v45 count])
      {
        BOOL v46 = [(FCRecordChainFetchOperation *)self shouldReturnErrorWhenSomeRecordsMissing];

        if (!v46)
        {
          [(FCOperation *)self finishedPerformingOperationWithError:0];
LABEL_42:

          return;
        }
      }
      else
      {
      }
      long long v64 = -[FCRecordChainFetchOperation _errorForMissingRecordNames:]((uint64_t)self, v69);
      [(FCOperation *)self finishedPerformingOperationWithError:v64];

      goto LABEL_42;
    }
    -[FCRecordChainFetchOperation _finalizeResultFromCachedRecords]((uint64_t)self);
    v35 = [MEMORY[0x1E4F1CA80] set];
    aBlocuint64_t k = MEMORY[0x1E4F143A8];
    uint64_t v91 = 3221225472;
    v92 = __65__FCRecordChainFetchOperation__recordIDsMissingFromCachedRecords__block_invoke;
    v93 = &unk_1E5B54580;
    v36 = v35;
    v94 = v36;
    id v37 = _Block_copy(&aBlock);
    *(void *)&long long v82 = MEMORY[0x1E4F143A8];
    *((void *)&v82 + 1) = 3221225472;
    *(void *)&long long v83 = __65__FCRecordChainFetchOperation__recordIDsMissingFromCachedRecords__block_invoke_2;
    *((void *)&v83 + 1) = &unk_1E5B545A8;
    *(void *)&long long v84 = self;
    uint64_t v38 = _Block_copy(&v82);
    uint64_t v39 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v40 = [(FCRecordChainFetchOperation *)self topLevelRecordIDs];
    uint64_t v41 = [v39 setWithArray:v40];
    v42 = [MEMORY[0x1E4F1CA80] set];
    -[FCRecordChainFetchOperation _walkRecordChainStartingWithRecordIDs:visitedRecordIDs:recordsLookupBlock:visitorBlock:](self, v41, v42, v38, v37);

    long long v70 = v36;
    if (![(FCRecordChainFetchOperation *)v70 count]) {
      goto LABEL_21;
    }
    uint64_t v43 = self->_cachedRecords;
    if ([(FCHeldRecords *)v43 count])
    {
      BOOL v44 = [(FCRecordChainFetchOperation *)self shouldReturnErrorWhenSomeRecordsMissing];

      if (!v44)
      {
LABEL_21:
        [(FCOperation *)self finishedPerformingOperationWithError:0];
LABEL_46:

        return;
      }
    }
    else
    {
    }
    v65 = [(FCRecordChainFetchOperation *)v70 allObjects];
    long long v66 = -[FCRecordChainFetchOperation _errorForMissingRecordNames:]((uint64_t)self, v65);

    [(FCOperation *)self finishedPerformingOperationWithError:v66];
    goto LABEL_46;
  }
}

- (NSArray)topLevelRecordIDs
{
  return self->_topLevelRecordIDs;
}

- (BOOL)shouldBypassRecordSourcePersistence
{
  return self->_shouldBypassRecordSourcePersistence;
}

- (void)_finalizeResultFromCachedRecords
{
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke;
    aBlock[3] = &unk_1E5B4F628;
    aBlock[4] = a1;
    uint64_t v2 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v3 = v2[2]();
    id v4 = ((void (*)(void (**)(void)))v2[2])(v2);
    id v5 = *(void **)(a1 + 496);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke_4;
    v16[3] = &unk_1E5B547F0;
    id v6 = v3;
    id v17 = v6;
    id v7 = v4;
    id v18 = v7;
    [v5 enumerateRecordsAndInterestTokensWithBlock:v16];
    BOOL v8 = (void *)MEMORY[0x1E4F1C9E8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke_5;
    v13[3] = &unk_1E5B4CDC0;
    id v14 = v6;
    id v15 = v7;
    id v9 = v7;
    id v10 = v6;
    uint64_t v11 = objc_msgSend(v8, "fc_dictionary:", v13);
    uint64_t v12 = *(void **)(a1 + 528);
    *(void *)(a1 + 528) = v11;
  }
}

id __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) linkKeysByRecordType];
  uint64_t v3 = [v2 allKeys];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__FCRecordChainFetchOperation__finalizeResultFromCachedRecords__block_invoke_2;
  v6[3] = &unk_1E5B547A8;
  v6[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "fc_dictionaryWithKeyBlock:valueBlock:", v6, &__block_literal_global_58_3);

  return v4;
}

- (FCEdgeCacheHint)edgeCacheHint
{
  return self->_edgeCacheHint;
}

id __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return -[FCRecordChainFetchOperation _recordTypeForRecordID:](*(void *)(a1 + 32), a2);
}

- (int)networkEventType
{
  return self->_networkEventType;
}

- (id)networkActivityBlock
{
  return self->_networkActivityBlock;
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_2_28(uint64_t a1, void *a2, void *a3)
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v5 = *(id **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  BOOL v8 = -[FCRecordChainFetchOperation _recordSourceForRecordType:](v5, (uint64_t)v7);
  id v9 = [v8 localizedLanguageSpecificKeysByOriginalKey];
  id v10 = [v8 localizedKeysByOriginalKey];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_3_29;
  v29[3] = &unk_1E5B4DDA8;
  id v30 = v10;
  id v11 = v10;
  uint64_t v12 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v29);
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  __int16 v26 = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_4;
  long long v27 = &unk_1E5B4DDA8;
  id v28 = v9;
  id v13 = v9;
  id v14 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &v24);
  v31[0] = v6;
  v31[1] = v12;
  v31[2] = v14;
  id v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v31, 3, v24, v25, v26, v27);
  uint64_t v16 = objc_msgSend(v15, "fc_arrayByFlattening");

  id v17 = objc_opt_new();
  long long v19 = v17;
  if (v17) {
    objc_setProperty_nonatomic_copy(v17, v18, v7, 16);
  }

  long long v20 = [v8 desiredKeys];
  long long v22 = v20;
  if (v19)
  {
    objc_setProperty_nonatomic_copy(v19, v21, v20, 24);

    objc_setProperty_nonatomic_copy(v19, v23, v16, 32);
  }
  else
  {
  }
  [*(id *)(a1 + 40) addObject:v19];
}

- (NSArray)networkEvents
{
  if (self) {
    self = (FCRecordChainFetchOperation *)self->_mutableNetworkEvents;
  }
  return (NSArray *)self;
}

void __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(FCHeldRecords);
  -[FCRecordChainFetchOperation setCachedRecords:](*(void *)(a1 + 32), v2);
}

id __66__FCRecordChainFetchOperation__collectCachedRecordsFromRecordIDs___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  BOOL v8 = objc_msgSend(v5, "numberWithInt:", -[FCRecordChainFetchOperation _pbRecordTypeForRecordType:](v6, a2));
  id v9 = [*(id *)(a1 + 32) cachedRecordsLookupBlock];
  id v10 = ((void (**)(void, void *, id))v9)[2](v9, v8, v7);

  return v10;
}

uint64_t __93__FCRecordChainFetchOperation__collectActualTopLevelRecordIDsFromRecordIDs_visitedRecordIDs___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 40) mutableCopy];
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = v2;
    objc_storeStrong((id *)(v4 + 504), v2);
    uint64_t v3 = v6;
  }
  return MEMORY[0x1F41817F8](v2, v3);
}

- (id)_errorForMissingRecordNames:(uint64_t)a1
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__FCRecordChainFetchOperation__errorForMissingRecordNames___block_invoke_2;
    v8[3] = &unk_1E5B54838;
    v8[4] = a1;
    uint64_t v2 = objc_msgSend(a2, "fc_dictionaryWithKeyBlock:valueBlock:", &__block_literal_global_73, v8);
    uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F19C40];
    uint64_t v9 = *MEMORY[0x1E4F19CD8];
    v10[0] = v2;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v6 = [v3 errorWithDomain:v4 code:2 userInfo:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 496);
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = [v5 allRecords];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    id v10 = MEMORY[0x1E4F14500];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [*(id *)(*((void *)&v18 + 1) + 8 * v11) base];
        id v13 = [v12 changeTag];

        if (!v13 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "base.changeTag");
          *(_DWORD *)buf = 136315906;
          SEL v23 = "-[FCRecordChainFetchOperation _issueCloudRequestIfNeeded]_block_invoke_3";
          __int16 v24 = 2080;
          uint64_t v25 = "FCRecordChainFetchOperation.m";
          __int16 v26 = 1024;
          int v27 = 355;
          __int16 v28 = 2114;
          int v29 = v17;
          _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        id v14 = [v12 changeTag];

        if (v14)
        {
          id v15 = [v12 changeTag];
          uint64_t v16 = [v12 identifier];
          [v3 setObject:v15 forKey:v16];
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v30 count:16];
    }
    while (v8);
  }
}

uint64_t __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_3_29(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

uint64_t __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_37(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  if (v10) {
    id v10 = (void *)v10[67];
  }
  uint64_t v11 = v10;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v13 = -[FCCKBatchedMultiFetchQueryOperation networkEvents](WeakRetained);
  [v11 addObjectsFromArray:v13];

  if (!v9
    || (![*(id *)(a1 + 32) shouldFailOnLimitExceededError]
     || !objc_msgSend(v9, "fc_isCKErrorWithCode:", 27))
    && ![*(id *)(a1 + 32) shouldReturnErrorWhenSomeRecordsMissing])
  {
    uint64_t v94 = a1;
    v89 = v9;
    v90 = v8;
    id v14 = [MEMORY[0x1E4F1CA80] set];
    v93 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v91 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    id v87 = v7;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v111 objects:v121 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v112;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v112 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v111 + 1) + 8 * i);
          long long v21 = objc_msgSend(v20, "recordID", v87);
          long long v22 = [v21 recordName];
          char v23 = [v14 containsObject:v22];

          if ((v23 & 1) == 0)
          {
            __int16 v24 = *(void **)(a1 + 40);
            uint64_t v25 = [v20 recordID];
            __int16 v26 = [v25 recordName];
            LODWORD(v24) = [v24 containsObject:v26];

            if (v24)
            {
              int v27 = [v20 recordID];
              __int16 v28 = [v27 recordName];
              int v29 = v93;
            }
            else
            {
              id v30 = [v20 recordType];
              uint64_t v31 = [v91 objectForKeyedSubscript:v30];

              if (!v31)
              {
                v32 = [MEMORY[0x1E4F1CA48] array];
                BOOL v33 = [v20 recordType];
                [v91 setObject:v32 forKeyedSubscript:v33];
              }
              id v34 = [v20 recordType];
              v35 = [v91 objectForKeyedSubscript:v34];
              [v35 addObject:v20];

              int v27 = [v20 recordID];
              __int16 v28 = [v27 recordName];
              int v29 = v14;
            }
            [v29 addObject:v28];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v111 objects:v121 count:16];
      }
      while (v17);
    }

    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_2_38;
    v110[3] = &unk_1E5B54648;
    v110[4] = *(void *)(a1 + 32);
    [v91 enumerateKeysAndObjectsUsingBlock:v110];

    v36 = *(void **)(a1 + 32);
    if (v36)
    {
      id v37 = [MEMORY[0x1E4F1CA80] set];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke;
      aBlock[3] = &unk_1E5B54580;
      id v38 = v37;
      id v119 = v38;
      uint64_t v39 = _Block_copy(aBlock);
      v117[0] = MEMORY[0x1E4F143A8];
      v117[1] = 3221225472;
      v117[2] = __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke_2;
      v117[3] = &unk_1E5B545A8;
      v117[4] = v36;
      uint64_t v40 = _Block_copy(v117);
      uint64_t v41 = (void *)MEMORY[0x1E4F1CAD0];
      v42 = [v36 topLevelRecordIDs];
      uint64_t v43 = [v41 setWithArray:v42];
      BOOL v44 = [MEMORY[0x1E4F1CA80] set];
      -[FCRecordChainFetchOperation _walkRecordChainStartingWithRecordIDs:visitedRecordIDs:recordsLookupBlock:visitorBlock:](v36, v43, v44, v40, v39);

      v45 = (void *)v36[62];
      v115[0] = MEMORY[0x1E4F143A8];
      v115[1] = 3221225472;
      v115[2] = __62__FCRecordChainFetchOperation__filterOrphansFromCachedRecords__block_invoke_4;
      v115[3] = &unk_1E5B54780;
      id v116 = v38;
      id v46 = v38;
      id v47 = v45;
      uint64_t v48 = [v47 heldRecordsPassingTest:v115];
      id v49 = (void *)v36[62];
      v36[62] = v48;
    }
    id v9 = v89;
    id v8 = v90;
    if (v89
      && ((uint64_t v50 = *(void *)(a1 + 32)) == 0 ? (v51 = 0) : (v51 = *(void **)(v50 + 496)),
          !objc_msgSend(v51, "count", v87)))
    {
      [*(id *)(a1 + 32) finishedPerformingOperationWithError:v89];
      id v7 = v87;
    }
    else
    {
      uint64_t v52 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v87);
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      uint64_t v53 = *(void *)(a1 + 32);
      v92 = (void *)v52;
      if (v53) {
        uint64_t v54 = *(void **)(v53 + 496);
      }
      else {
        uint64_t v54 = 0;
      }
      uint64_t v55 = [v54 allRecords];
      uint64_t v56 = [v55 countByEnumeratingWithState:&v106 objects:v120 count:16];
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = *(void *)v107;
        unint64_t v59 = 0x1EB5BD000uLL;
        do
        {
          uint64_t v60 = 0;
          do
          {
            if (*(void *)v107 != v58) {
              objc_enumerationMutation(v55);
            }
            id v61 = [*(id *)(*((void *)&v106 + 1) + 8 * v60) base];
            long long v62 = [v61 identifier];

            id v63 = -[FCRecordChainFetchOperation _recordTypeForRecordID:](*(void *)(v94 + 32), v62);
            if (([v14 containsObject:v62] & 1) == 0)
            {
              uint64_t v64 = *(void *)(v94 + 32);
              v65 = v64 ? *(void **)(v64 + *(int *)(v59 + 2520)) : 0;
              if (([v65 containsObject:v62] & 1) == 0)
              {
                unint64_t v66 = v59;
                long long v67 = [v92 objectForKeyedSubscript:v63];

                if (!v67)
                {
                  id v68 = [MEMORY[0x1E4F1CA48] array];
                  [v92 setObject:v68 forKeyedSubscript:v63];
                }
                id v69 = [v92 objectForKeyedSubscript:v63];
                [v69 addObject:v62];

                unint64_t v59 = v66;
              }
            }

            ++v60;
          }
          while (v57 != v60);
          uint64_t v70 = [v55 countByEnumeratingWithState:&v106 objects:v120 count:16];
          uint64_t v57 = v70;
        }
        while (v70);
      }

      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_3_39;
      v105[3] = &unk_1E5B54648;
      v105[4] = *(void *)(v94 + 32);
      [v92 enumerateKeysAndObjectsUsingBlock:v105];

      id v8 = v90;
      if ([v90 count])
      {
        v104[0] = MEMORY[0x1E4F143A8];
        v104[1] = 3221225472;
        v104[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_4_40;
        v104[3] = &unk_1E5B545D0;
        v104[4] = *(void *)(v94 + 32);
        long long v71 = objc_msgSend(v90, "fc_dictionaryOfSortedSetsWithKeyBlock:", v104);
        v103[0] = MEMORY[0x1E4F143A8];
        v103[1] = 3221225472;
        v103[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_5_41;
        v103[3] = &unk_1E5B54670;
        uint64_t v72 = *(void *)(v94 + 48);
        v103[4] = *(void *)(v94 + 32);
        v103[5] = v72;
        [v71 enumerateKeysAndObjectsUsingBlock:v103];
      }
      -[FCRecordChainFetchOperation _finalizeResultFromCachedRecords](*(void *)(v94 + 32));
      id v7 = v88;
      id v9 = v89;
      if ([v90 count])
      {
        long long v73 = [v90 allObjects];
        v100[0] = MEMORY[0x1E4F143A8];
        v100[1] = 3221225472;
        v100[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_6;
        v100[3] = &unk_1E5B54698;
        id v74 = v89;
        uint64_t v75 = *(void *)(v94 + 32);
        id v101 = v74;
        uint64_t v102 = v75;
        id v76 = objc_msgSend(v73, "fc_dictionaryWithValueBlock:", v100);

        v99[0] = MEMORY[0x1E4F143A8];
        v99[1] = 3221225472;
        v99[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_7;
        v99[3] = &unk_1E5B546C0;
        v99[4] = *(void *)(v94 + 32);
        v77 = objc_msgSend(v76, "fc_sortedEntriesWithKeyBlock:", v99);
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_8;
        v95[3] = &unk_1E5B546E8;
        id v78 = v74;
        uint64_t v79 = *(void *)(v94 + 48);
        uint64_t v80 = *(void *)(v94 + 32);
        id v96 = v78;
        uint64_t v97 = v80;
        uint64_t v98 = v79;
        [v77 enumerateKeysAndObjectsUsingBlock:v95];
        __int16 v81 = *(void **)(v94 + 32);
        if (v81) {
          __int16 v81 = (void *)v81[62];
        }
        long long v82 = v81;
        if ([v82 count])
        {
          char v83 = [*(id *)(v94 + 32) shouldReturnErrorWhenSomeRecordsMissing];

          if ((v83 & 1) == 0)
          {
            [*(id *)(v94 + 32) finishedPerformingOperationWithError:0];
LABEL_58:

            goto LABEL_59;
          }
        }
        else
        {
        }
        uint64_t v84 = *(void *)(v94 + 32);
        long long v85 = [v90 allObjects];
        uint64_t v86 = -[FCRecordChainFetchOperation _errorForMissingRecordNames:](v84, v85);

        [*(id *)(v94 + 32) finishedPerformingOperationWithError:v86];
        goto LABEL_58;
      }
      [*(id *)(v94 + 32) finishedPerformingOperationWithError:0];
    }
LABEL_59:

    goto LABEL_60;
  }
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v9];
LABEL_60:
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_2_38(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(id **)(a1 + 32);
  id v6 = a3;
  -[FCRecordChainFetchOperation _recordSourceForRecordType:](v5, a2);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if ([*(id *)(a1 + 32) shouldBypassRecordSourcePersistence]) {
    [v11 convertRecords:v6];
  }
  else {
  id v7 = [v11 saveRecords:v6];
  }

  id v8 = *(void **)(a1 + 32);
  if (v8) {
    id v8 = (void *)v8[62];
  }
  id v9 = v8;
  id v10 = +[FCHeldRecords heldRecordsByMerging:v7 with:v9];
  -[FCRecordChainFetchOperation setCachedRecords:](*(void *)(a1 + 32), v10);
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_3_39(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(id **)(a1 + 32);
  id v5 = a3;
  -[FCRecordChainFetchOperation _recordSourceForRecordType:](v4, a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 updateFetchDateForRecordIDs:v5];
}

id __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_4_40(uint64_t a1, void *a2)
{
  return -[FCRecordChainFetchOperation _recordTypeForRecordID:](*(void *)(a1 + 32), a2);
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_5_41(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  id v5 = -[FCRecordChainFetchOperation _recordSourceForRecordType:](*(id **)(a1 + 32), a2);
  if ([(id)objc_opt_class() supportsDeletions]
    && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v6 = [v5 deleteRecordsWithIDs:v10];
    id v7 = *(void **)(a1 + 32);
    if (v7) {
      id v7 = (void *)v7[62];
    }
    id v8 = v7;
    id v9 = +[FCHeldRecords heldRecordsByMerging:v6 with:v8];
    -[FCRecordChainFetchOperation setCachedRecords:](*(void *)(a1 + 32), v9);
  }
}

- (id)_partialFetchErrorForMissingRecordName:(uint64_t)a1
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [NSString stringWithFormat:@"Record %@ missing from MultiFetch query", a2];
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F19C40];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = v2;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v6 = [v3 errorWithDomain:v4 code:11 userInfo:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

id __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_7(uint64_t a1, void *a2)
{
  return -[FCRecordChainFetchOperation _recordTypeForRecordID:](*(void *)(a1 + 32), a2);
}

void __57__FCRecordChainFetchOperation__issueCloudRequestIfNeeded__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (*(void *)(a1 + 32) || !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v6 = -[FCRecordChainFetchOperation _recordSourceForRecordType:](*(id **)(a1 + 40), (uint64_t)v8);
    id v7 = [v6 fetchErrorsByKey];
    [v7 addEntriesFromDictionary:v5];
  }
}

id __59__FCRecordChainFetchOperation__errorForMissingRecordNames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithRecordName:v3];

  return v4;
}

id __59__FCRecordChainFetchOperation__errorForMissingRecordNames___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 520);
  }
  else {
    id v5 = 0;
  }
  int v6 = [v5 containsObject:v3];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6)
  {
    if (v7)
    {
      id v8 = [NSString stringWithFormat:@"Record %@ not cached", v3];
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      v14[0] = v8;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      id v11 = [v9 errorWithDomain:@"FCErrorDomain" code:5 userInfo:v10];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = -[FCRecordChainFetchOperation _partialFetchErrorForMissingRecordName:](v7, (uint64_t)v3);
  }

  return v11;
}

- (void)setCachePoliciesByRecordID:(id)a3
{
}

- (void)setDynamicCachePolicyBlock:(id)a3
{
}

- (BOOL)shouldReturnErrorWhenSomeRecordsMissing
{
  return self->_shouldReturnErrorWhenSomeRecordsMissing;
}

- (void)setShouldReturnErrorWhenSomeRecordsMissing:(BOOL)a3
{
  self->_shouldReturnErrorWhenSomeRecordsMissing = a3;
}

- (BOOL)shouldFailOnLimitExceededError
{
  return self->_shouldFailOnLimitExceededError;
}

- (void)setShouldFailOnLimitExceededError:(BOOL)a3
{
  self->_shouldFailOnLimitExceededError = a3;
}

- (void)setAdditionalRecordSources:(id)a3
{
}

- (void)setNetworkEventType:(int)a3
{
  self->_networkEventType = a3;
}

- (void)setNetworkActivityBlock:(id)a3
{
}

- (void)setShouldBypassRecordSourcePersistence:(BOOL)a3
{
  self->_shouldBypassRecordSourcePersistence = a3;
}

- (id)cachedRecordsLookupBlock
{
  return self->_cachedRecordsLookupBlock;
}

- (void)setCachedRecordsLookupBlock:(id)a3
{
}

@end