@interface FCCKMultiFetchQueryOperation
- (BOOL)validateOperation;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setDatabase:(uint64_t)a1;
- (void)setKnownRecordIDsToEtags:(uint64_t)a1;
- (void)setRecordIDs:(uint64_t)a1;
- (void)setRecordSpecs:(uint64_t)a1;
@end

@implementation FCCKMultiFetchQueryOperation

- (BOOL)validateOperation
{
  v2 = self;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self && self->_database) {
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)[[NSString alloc] initWithFormat:@"multi-fetch query requires a database"];
    int v12 = 136315906;
    v13 = "-[FCCKMultiFetchQueryOperation validateOperation]";
    __int16 v14 = 2080;
    v15 = "FCCKMultiFetchQueryOperation.m";
    __int16 v16 = 1024;
    int v17 = 36;
    __int16 v18 = 2114;
    v19 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

    if (v2) {
      goto LABEL_5;
    }
LABEL_22:
    recordIDs = 0;
    goto LABEL_6;
  }
  if (!v2) {
    goto LABEL_22;
  }
LABEL_5:
  recordIDs = v2->_recordIDs;
LABEL_6:
  if (![(NSArray *)recordIDs count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)[[NSString alloc] initWithFormat:@"multi-fetch query requires at least one record ID"];
    int v12 = 136315906;
    v13 = "-[FCCKMultiFetchQueryOperation validateOperation]";
    __int16 v14 = 2080;
    v15 = "FCCKMultiFetchQueryOperation.m";
    __int16 v16 = 1024;
    int v17 = 37;
    __int16 v18 = 2114;
    v19 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);
  }
  if (v2) {
    recordSpecs = v2->_recordSpecs;
  }
  else {
    recordSpecs = 0;
  }
  if (![(NSArray *)recordSpecs count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)[[NSString alloc] initWithFormat:@"multi-fetch query requires at least one record spec"];
    int v12 = 136315906;
    v13 = "-[FCCKMultiFetchQueryOperation validateOperation]";
    __int16 v14 = 2080;
    v15 = "FCCKMultiFetchQueryOperation.m";
    __int16 v16 = 1024;
    int v17 = 38;
    __int16 v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

    if (!v2) {
      return (char)v2;
    }
  }
  else if (!v2)
  {
    return (char)v2;
  }
  v5 = v2->_database;
  if (v5)
  {
    v6 = v5;
    v7 = v2->_recordIDs;
    if ([(NSArray *)v7 count]) {
      LOBYTE(v2) = [(NSArray *)v2->_recordSpecs count] != 0;
    }
    else {
      LOBYTE(v2) = 0;
    }
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return (char)v2;
}

void __48__FCCKMultiFetchQueryOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [v11 recordType];
  int v4 = [v3 isEqualToString:@"Results"];

  if (v4)
  {
    v5 = [v11 objectForKeyedSubscript:@"notFound"];

    v6 = (void *)MEMORY[0x1E4F1CBF0];
    if (v5) {
      v6 = v5;
    }
    id v11 = v6;

    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      v8 = *(void **)(v7 + 456);
    }
    else {
      v8 = 0;
    }
    [v8 addObjectsFromArray:v11];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      v10 = *(void **)(v9 + 448);
    }
    else {
      v10 = 0;
    }
    [v10 addObject:v11];
  }
}

void __44__FCCKMultiFetchQueryOperation__desiredKeys__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v4 = *(void **)(a1 + 32);
  if (v4) {
    int v4 = (void *)v4[49];
  }
  v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        if (v10) {
          uint64_t v11 = *(void *)(v10 + 24);
        }
        else {
          uint64_t v11 = 0;
        }
        objc_msgSend(v3, "addObjectsFromArray:", v11, (void)v13);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v12 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v7 = v12;
    }
    while (v12);
  }

  [v3 addObject:@"notFound"];
}

- (void)prepareOperation
{
  v2 = self;
  if (self) {
    self = (FCCKMultiFetchQueryOperation *)self->_recordSpecs;
  }
  id v3 = [(FCCKMultiFetchQueryOperation *)self fc_dictionaryWithKeyBlock:&__block_literal_global_167];
  if (v2) {
    objc_storeStrong((id *)&v2->_recordSpecsByType, v3);
  }

  int v4 = [MEMORY[0x1E4F1CA48] array];
  if (v2) {
    objc_storeStrong((id *)&v2->_resultFetchedRecords, v4);
  }

  v5 = [MEMORY[0x1E4F1CA80] set];
  if (v2)
  {
    id v6 = v5;
    objc_storeStrong((id *)&v2->_resultMissingRecordIDs, v5);

    if (!v2->_networkEventType) {
      v2->_networkEventType = 12;
    }
  }
  else
  {
    MEMORY[0x1F41817F8](v5, v5);
  }
}

id __48__FCCKMultiFetchQueryOperation_prepareOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(id *)(a2 + 16);
  }
  else {
    return 0;
  }
}

- (void)performOperation
{
  location[16] = *(id *)MEMORY[0x1E4F143B8];
  if (self)
  {
    v63 = [MEMORY[0x1E4F1CA48] array];
    v62 = [MEMORY[0x1E4F1CA48] array];
    v61 = [MEMORY[0x1E4F1CA48] array];
    v60 = [MEMORY[0x1E4F1CA48] array];
    v65 = [MEMORY[0x1E4F1CA48] array];
    v64 = [MEMORY[0x1E4F1CA48] array];
    [(NSArray *)self->_recordSpecs sortedArrayUsingComparator:&__block_literal_global_16_1];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [obj countByEnumeratingWithState:&v74 objects:location count:16];
    if (v2)
    {
      uint64_t v3 = *(void *)v75;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v75 != v3) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void *)(*((void *)&v74 + 1) + 8 * v4);
          if (v5)
          {
            [v63 addObject:*(void *)(v5 + 16)];
            id v6 = *(void **)(v5 + 32);
          }
          else
          {
            [v63 addObject:0];
            id v6 = 0;
          }
          uint64_t v7 = [v6 sortedArrayUsingSelector:sel_compare_];
          uint64_t v8 = [v7 componentsJoinedByString:@","];
          uint64_t v9 = (void *)v8;
          if (v8) {
            uint64_t v10 = (__CFString *)v8;
          }
          else {
            uint64_t v10 = &stru_1EF8299B8;
          }
          [v62 addObject:v10];

          if (v5) {
            uint64_t v11 = *(void **)(v5 + 24);
          }
          else {
            uint64_t v11 = 0;
          }
          uint64_t v12 = [v11 sortedArrayUsingSelector:sel_compare_];
          long long v13 = [v12 componentsJoinedByString:@","];
          [v61 addObject:v13];

          if (v5) {
            BOOL v14 = *(unsigned char *)(v5 + 8) != 0;
          }
          else {
            BOOL v14 = 0;
          }
          long long v15 = [NSNumber numberWithBool:v14];
          [v60 addObject:v15];

          ++v4;
        }
        while (v2 != v4);
        uint64_t v16 = [obj countByEnumeratingWithState:&v74 objects:location count:16];
        uint64_t v2 = v16;
      }
      while (v16);
    }

    int v17 = self->_knownRecordIDsToEtags;
    uint64_t v18 = [(NSDictionary *)v17 allKeys];
    v19 = [v18 sortedArrayUsingSelector:sel_compare_];

    long long v73 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v70 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v70 objects:v78 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v71 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void *)(*((void *)&v70 + 1) + 8 * i);
          [v65 addObject:v24];
          v25 = [(NSDictionary *)self->_knownRecordIDsToEtags objectForKeyedSubscript:v24];
          [v64 addObject:v25];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v70 objects:v78 count:16];
      }
      while (v21);
    }

    v26 = [(NSArray *)self->_recordIDs sortedArrayUsingSelector:sel_compare_];
    v27 = [MEMORY[0x1E4F1CA48] array];
    v28 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ CONTAINS %K", v26, @"recordIDs"];
    [v27 addObject:v28];

    v29 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ CONTAINS %K", v63, @"recordTypes"];
    [v27 addObject:v29];

    v30 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ CONTAINS %K", v62, @"fetchFields"];
    [v27 addObject:v30];

    v31 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ CONTAINS %K", v61, @"requestedFields"];
    [v27 addObject:v31];

    v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ CONTAINS %K", v60, @"shortcut"];
    [v27 addObject:v32];

    v33 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ CONTAINS %K", v65, @"knownRecordIDs"];
    [v27 addObject:v33];

    v34 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ CONTAINS %K", v64, @"knownEtags"];
    [v27 addObject:v34];

    v35 = (void *)MEMORY[0x1E4F28F60];
    v36 = NSNumber;
    int64_t v37 = [(FCOperation *)self relativePriority];
    uint64_t v38 = 300;
    if (!v37) {
      uint64_t v38 = 200;
    }
    if (v37 == -1) {
      uint64_t v39 = 100;
    }
    else {
      uint64_t v39 = v38;
    }
    v40 = [v36 numberWithUnsignedInteger:v39];
    v41 = [v35 predicateWithFormat:@"%K == %@", @"priority", v40];
    [v27 addObject:v41];

    v42 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v27];
    v43 = (void *)[objc_alloc(MEMORY[0x1E4F1A2A0]) initWithRecordType:@"MultiFetch" predicate:v42];
  }
  else
  {
    v43 = 0;
  }
  v44 = objc_alloc_init(FCCKContentQueryOperation);
  uint64_t v45 = (uint64_t)v44;
  if (self)
  {
    -[FCCKContentQueryOperation setDatabase:]((uint64_t)v44, self->_database);
    -[FCCKContentQueryOperation setQuery:](v45, v43);
    BOOL v47 = v45 == 0;
    if (v45)
    {
      *(_DWORD *)(v45 + 372) = self->_networkEventType;
      objc_setProperty_nonatomic_copy((id)v45, v46, self->_networkActivityBlock, 472);
      objc_setProperty_nonatomic_copy((id)v45, v48, self->_edgeCacheHint, 448);
      *(unsigned char *)(v45 + 368) = self->_ignoreCache;
      int64_t v49 = [(FCOperation *)self relativePriority];
      uint64_t v50 = 300;
      if (!v49) {
        uint64_t v50 = 200;
      }
      if (v49 == -1) {
        uint64_t v50 = 100;
      }
      *(void *)(v45 + 456) = v50;
    }
    else
    {
      [(FCOperation *)self relativePriority];
    }
    location[0] = (id)MEMORY[0x1E4F143A8];
    location[1] = (id)3221225472;
    location[2] = __44__FCCKMultiFetchQueryOperation__desiredKeys__block_invoke;
    location[3] = &unk_1E5B4C2F0;
    location[4] = self;
    v51 = objc_msgSend(MEMORY[0x1E4F1CAD0], "fc_set:", location);
    v52 = [v51 allObjects];
  }
  else
  {
    -[FCCKContentQueryOperation setDatabase:]((uint64_t)v44, 0);
    -[FCCKContentQueryOperation setQuery:](v45, v43);
    if (v45)
    {
      *(_DWORD *)(v45 + 372) = 0;
      objc_setProperty_nonatomic_copy((id)v45, v57, 0, 472);
      objc_setProperty_nonatomic_copy((id)v45, v58, 0, 448);
      BOOL v47 = 0;
      v52 = 0;
      *(unsigned char *)(v45 + 368) = 0;
      *(void *)(v45 + 456) = 0;
    }
    else
    {
      v52 = 0;
      BOOL v47 = 1;
    }
  }
  v54 = [v52 sortedArrayUsingSelector:sel_compare_];
  if (!v47) {
    objc_setProperty_nonatomic_copy((id)v45, v53, v54, 408);
  }

  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __48__FCCKMultiFetchQueryOperation_performOperation__block_invoke;
  newValue[3] = &unk_1E5B4D0C8;
  newValue[4] = self;
  if (!v47) {
    objc_setProperty_nonatomic_copy((id)v45, v55, newValue, 416);
  }
  objc_initWeak(location, (id)v45);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __48__FCCKMultiFetchQueryOperation_performOperation__block_invoke_2;
  v67[3] = &unk_1E5B5A9D0;
  v67[4] = self;
  objc_copyWeak(&v68, location);
  if (!v47) {
    objc_setProperty_nonatomic_copy((id)v45, v56, v67, 424);
  }
  [(FCOperation *)self associateChildOperation:v45];
  [(id)v45 start];
  objc_destroyWeak(&v68);
  objc_destroyWeak(location);
}

- (void)operationWillFinishWithError:(id)a3
{
  id v7 = a3;
  if (self)
  {
    id queryCompletionHandler = self->_queryCompletionHandler;
    if (queryCompletionHandler)
    {
      uint64_t v5 = (void (**)(id, NSMutableArray *, NSMutableSet *, id))queryCompletionHandler;
      id v6 = self->_resultFetchedRecords;
      v5[2](v5, v6, self->_resultMissingRecordIDs, v7);
    }
  }
}

void __48__FCCKMultiFetchQueryOperation_performOperation__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 40);
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = WeakRetained;
  if (WeakRetained) {
    id v7 = (void *)*((void *)WeakRetained + 58);
  }
  else {
    id v7 = 0;
  }
  id v9 = v7;
  uint64_t v10 = *(void **)(a1 + 32);
  if (v10) {
    objc_setProperty_nonatomic_copy(v10, v8, v9, 416);
  }

  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v11];
}

- (void)setRecordSpecs:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 392), a2);
  }
}

- (void)setRecordIDs:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 384), a2);
  }
}

- (void)setKnownRecordIDsToEtags:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 400), a2);
  }
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 376), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultMissingRecordIDs, 0);
  objc_storeStrong((id *)&self->_resultFetchedRecords, 0);
  objc_storeStrong((id *)&self->_recordSpecsByType, 0);
  objc_storeStrong(&self->_queryCompletionHandler, 0);
  objc_storeStrong(&self->_networkActivityBlock, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_knownRecordIDsToEtags, 0);
  objc_storeStrong((id *)&self->_recordSpecs, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

uint64_t __47__FCCKMultiFetchQueryOperation__constructQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = v4;
  if (!a2)
  {
    id v6 = 0;
    if (v4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  id v6 = *(void **)(a2 + 16);
  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v7 = v4[2];
LABEL_4:
  id v8 = v6;
  uint64_t v9 = [v8 compare:v7];

  return v9;
}

@end