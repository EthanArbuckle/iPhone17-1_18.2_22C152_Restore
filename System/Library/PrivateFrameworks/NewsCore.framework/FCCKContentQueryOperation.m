@interface FCCKContentQueryOperation
- (BOOL)validateOperation;
- (FCCKContentQueryOperation)init;
- (id)throttleGroup;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setCursor:(uint64_t)a1;
- (void)setDatabase:(uint64_t)a1;
- (void)setQuery:(uint64_t)a1;
- (void)setResultCursor:(uint64_t)a1;
@end

@implementation FCCKContentQueryOperation

void __45__FCCKContentQueryOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  v3 = NSString;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void *)(v4 + 456);
  }
  else {
    uint64_t v5 = 0;
  }
  id v9 = a2;
  v6 = objc_msgSend(v3, "stringWithFormat:", @"%lu", v5);
  [v9 setObject:v6 forKeyedSubscript:@"X-Apple-CloudKit-Request-Priority"];

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    uint64_t v8 = *(void *)(v7 + 440);
  }
  else {
    uint64_t v8 = 0;
  }
  [v9 addEntriesFromDictionary:v8];
}

id __57__FCCKContentQueryOperation__ckRecordsFromQueryResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    v3 = *(void **)(a2 + 24);
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = -[FCCKProtocolTranslator recordFromPRecord:](v2, v4);

  return v5;
}

- (id)throttleGroup
{
  uint64_t v2 = self;
  if (self) {
    self = (FCCKContentQueryOperation *)self->_database;
  }
  v3 = [(FCCKContentQueryOperation *)self containerIdentifier];
  if ([(FCOperation *)v2 relativePriority] == -1 && (!v2 || !v2->_edgeCacheHint))
  {
    uint64_t v4 = [v3 stringByAppendingString:@"-lowpriority"];

    v3 = (void *)v4;
  }
  return v3;
}

- (BOOL)validateOperation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self && self->_database)
  {
    char v3 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"can't issue query without a database"];
      int v11 = 136315906;
      v12 = "-[FCCKContentQueryOperation validateOperation]";
      __int16 v13 = 2080;
      v14 = "FCCKContentQueryOperation.m";
      __int16 v15 = 1024;
      int v16 = 75;
      __int16 v17 = 2114;
      v18 = v8;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);
    }
    char v3 = 0;
    if (!self) {
      goto LABEL_13;
    }
  }
  uint64_t v4 = self->_query;
  if (!v4)
  {
    if (self->_cursor) {
      goto LABEL_10;
    }
LABEL_13:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)[[NSString alloc] initWithFormat:@"can't issue query without a query or cursor"];
      int v11 = 136315906;
      v12 = "-[FCCKContentQueryOperation validateOperation]";
      __int16 v13 = 2080;
      v14 = "FCCKContentQueryOperation.m";
      __int16 v15 = 1024;
      int v16 = 79;
      __int16 v17 = 2114;
      v18 = v10;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);
    }
    char v5 = 0;
    if (!self) {
      goto LABEL_16;
    }
    goto LABEL_11;
  }

LABEL_10:
  char v5 = 1;
LABEL_11:
  if (self->_networkEventType)
  {
    char v6 = 1;
    return v3 & v6 & v5;
  }
LABEL_16:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = (void *)[[NSString alloc] initWithFormat:@"can't issue a query without a valid network event type"];
    int v11 = 136315906;
    v12 = "-[FCCKContentQueryOperation validateOperation]";
    __int16 v13 = 2080;
    v14 = "FCCKContentQueryOperation.m";
    __int16 v15 = 1024;
    int v16 = 83;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);
  }
  char v6 = 0;
  return v3 & v6 & v5;
}

- (void)prepareOperation
{
  if (self)
  {
    char v3 = self->_edgeCacheHint;
    if (v3)
    {
      uint64_t v4 = v3;
      char v5 = NewsCoreUserDefaults();
      int v6 = [v5 BOOLForKey:@"disable_cloudkit_edge_caching"];

      if (v6)
      {
        objc_setProperty_nonatomic_copy(self, v7, 0, 448);
      }
    }
  }
}

void __45__FCCKContentQueryOperation_performOperation__block_invoke_2_32(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    int v11 = [v7 firstObject];
    v12 = -[FCCKPResponseOperation queryRetrieveResponse](v11);

    uint64_t v13 = *(void *)(a1 + 32);
    if (!v13) {
      goto LABEL_42;
    }
    if (!*(void *)(v13 + 416)) {
      goto LABEL_19;
    }
    v14 = v12;
    __int16 v15 = +[FCCKProtocolTranslator sharedInstance]();
    if (v14) {
      int v16 = (void *)v14[2];
    }
    else {
      int v16 = 0;
    }
    id v17 = v16;

    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __57__FCCKContentQueryOperation__ckRecordsFromQueryResponse___block_invoke;
    *(void *)&long long v63 = &unk_1E5B593E0;
    *((void *)&v63 + 1) = v15;
    id v18 = v15;
    uint64_t v19 = objc_msgSend(v17, "fc_arrayByTransformingWithBlock:", buf);

    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v56;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v56 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(a1 + 32);
          if (v24) {
            uint64_t v25 = *(void *)(v24 + 416);
          }
          else {
            uint64_t v25 = 0;
          }
          (*(void (**)(uint64_t, void))(v25 + 16))(v25, *(void *)(*((void *)&v55 + 1) + 8 * v23++));
        }
        while (v21 != v23);
        uint64_t v26 = [v19 countByEnumeratingWithState:&v55 objects:v61 count:16];
        uint64_t v21 = v26;
      }
      while (v26);
    }

    if (*(void *)(a1 + 32))
    {
LABEL_19:
      v27 = (objc_class *)MEMORY[0x1E4F1A2A8];
      v28 = v12;
      id v29 = [v27 alloc];
      if (v28) {
        v30 = (void *)v28[1];
      }
      else {
        v30 = 0;
      }
      id v31 = v30;

      id v32 = objc_alloc(MEMORY[0x1E4F1A320]);
      v33 = (void *)[v32 initWithZoneName:*MEMORY[0x1E4F19D88] ownerName:*MEMORY[0x1E4F19C08]];
      v10 = (void *)[v29 initWithData:v31 zoneID:v33];
    }
    else
    {
LABEL_42:
      v10 = 0;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v35 = WeakRetained;
  if (WeakRetained) {
    v36 = (void *)*((void *)WeakRetained + 58);
  }
  else {
    v36 = 0;
  }
  id v37 = v36;

  if (v37)
  {
    id v38 = objc_loadWeakRetained((id *)(a1 + 40));
    v39 = v38;
    if (v38) {
      v40 = (void *)*((void *)v38 + 58);
    }
    else {
      v40 = 0;
    }
    id v41 = v40;
    id v60 = v41;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
    v44 = *(void **)(a1 + 32);
    if (v44) {
      objc_setProperty_nonatomic_copy(v44, v42, v43, 464);
    }
  }
  -[FCCKContentQueryOperation setResultCursor:](*(void *)(a1 + 32), v10);
  id v45 = objc_loadWeakRetained((id *)(a1 + 40));
  v46 = v45;
  if (v45) {
    v47 = (void *)*((void *)v45 + 57);
  }
  else {
    v47 = 0;
  }
  id v48 = v47;
  id v59 = v48;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
  v51 = *(void **)(a1 + 32);
  if (v51) {
    objc_setProperty_nonatomic_copy(v51, v49, v50, 432);
  }

  v52 = [v9 domain];
  int v53 = [v52 isEqualToString:*MEMORY[0x1E4F19CA0]];

  if (v53 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v54 = (void *)[[NSString alloc] initWithFormat:@"shouldn't return errors from the internal domain"];
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "-[FCCKContentQueryOperation performOperation]_block_invoke_2";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCCKContentQueryOperation.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v63) = 183;
    WORD2(v63) = 2114;
    *(void *)((char *)&v63 + 6) = v54;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v9];
}

- (void)setResultCursor:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 480), a2);
  }
}

- (void)performOperation
{
  location[16] = *(id *)MEMORY[0x1E4F143B8];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __45__FCCKContentQueryOperation_performOperation__block_invoke;
  v78[3] = &unk_1E5B4BF78;
  v78[4] = self;
  v70 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionary:", v78);
  if (self)
  {
    if ([(FCCKContentDatabase *)self->_database shouldUseCloudd])
    {
      uint64_t v2 = self->_cursor;
      id v3 = objc_alloc(MEMORY[0x1E4F1A2B8]);
      if (v2)
      {
        selfa = (FCCKDirectRequestOperation *)[v3 initWithCursor:self->_cursor];
      }
      else
      {
        selfa = (FCCKDirectRequestOperation *)[v3 initWithQuery:self->_query];
      }
      [(FCCKDirectRequestOperation *)selfa setResultsLimit:self->_resultsLimit];
      [(FCCKDirectRequestOperation *)selfa setDesiredKeys:self->_desiredKeys];
      id recordFetchedBlock = self->_recordFetchedBlock;
      goto LABEL_26;
    }
    uint64_t v4 = [FCCKDirectRequestOperation alloc];
    database = self->_database;
  }
  else
  {
    if ([0 shouldUseCloudd])
    {
      selfa = (FCCKDirectRequestOperation *)[objc_alloc(MEMORY[0x1E4F1A2B8]) initWithQuery:0];
      [(FCCKDirectRequestOperation *)selfa setResultsLimit:0];
      [(FCCKDirectRequestOperation *)selfa setDesiredKeys:0];
      id recordFetchedBlock = 0;
LABEL_26:
      [(FCCKDirectRequestOperation *)selfa setRecordFetchedBlock:recordFetchedBlock];
      v28 = [(FCCKDirectRequestOperation *)selfa configuration];
      id v29 = (void *)[v28 copy];
      v30 = v29;
      if (v29) {
        id v31 = v29;
      }
      else {
        id v31 = (id)objc_opt_new();
      }
      id v32 = v31;

      [v32 setAdditionalRequestHTTPHeaders:v70];
      [(FCCKDirectRequestOperation *)selfa setConfiguration:v32];
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __45__FCCKContentQueryOperation_performOperation__block_invoke_2;
      v77[3] = &unk_1E5B59368;
      v77[4] = self;
      [(FCCKDirectRequestOperation *)selfa setQueryCompletionBlock:v77];
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __45__FCCKContentQueryOperation_performOperation__block_invoke_3;
      v76[3] = &unk_1E5B543F0;
      v76[4] = self;
      [(FCCKDirectRequestOperation *)selfa setRequestCompletedBlock:v76];
      [(FCOperation *)self associateChildOperation:selfa];
      if (self) {
        v33 = self->_database;
      }
      else {
        v33 = 0;
      }
      [(FCCKContentDatabase *)v33 addOperation:selfa];

      goto LABEL_69;
    }
    uint64_t v4 = [FCCKDirectRequestOperation alloc];
    database = 0;
  }
  int v6 = [(FCCKContentDatabase *)database networkReachability];
  selfa = [(FCCKDirectRequestOperation *)v4 initWithNetworkReachability:v6];

  if (selfa) {
    selfa->_requestType = 2;
  }
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __45__FCCKContentQueryOperation_performOperation__block_invoke_5;
  v75[3] = &unk_1E5B59390;
  v75[4] = self;
  id v8 = __45__FCCKContentQueryOperation_performOperation__block_invoke_5((uint64_t)v75);
  if (selfa) {
    objc_setProperty_nonatomic_copy(selfa, v7, v8, 392);
  }

  if (self)
  {
    v10 = [(FCCKContentDatabase *)self->_database containerIdentifier];
    if (selfa) {
      objc_setProperty_nonatomic_copy(selfa, v9, v10, 400);
    }

    int v11 = self->_database;
  }
  else
  {
    v68 = [0 containerIdentifier];
    if (selfa) {
      objc_setProperty_nonatomic_copy(selfa, v67, v68, 400);
    }

    int v11 = 0;
  }
  BOOL v12 = [(FCCKContentDatabase *)v11 isProductionEnvironment];
  if (selfa) {
    selfa->_production = v12;
  }
  if (!self)
  {
    v54 = 0;
    goto LABEL_55;
  }
  v14 = (id *)objc_opt_new();
  __int16 v15 = objc_opt_new();
  -[FCCKPRequestOperation setRequest:]((uint64_t)v14, v15);

  int v16 = CKCreateGUID();
  id v17 = v16;
  if (v14)
  {
    id v18 = v14[4];
    -[FCCKPOperation setOperationUUID:]((uint64_t)v18, v17);

    uint64_t v19 = v14[4];
    if (v19)
    {
      v19[24] |= 1u;
      *((_DWORD *)v19 + 4) = 220;
    }

    uint64_t v20 = v14[4];
    if (v20)
    {
      v20[24] |= 2u;
      v20[20] = 1;
    }
  }
  else
  {

    uint64_t v20 = 0;
  }

  uint64_t v21 = objc_opt_new();
  -[FCCKPRequestOperation setQueryRetrieveRequest:]((uint64_t)v14, v21);

  uint64_t v22 = self;
  cursor = self->_cursor;
  if (cursor)
  {
    uint64_t v24 = cursor;
    uint64_t v25 = [(CKQueryCursor *)v24 data];
    -[FCCKPRequestOperation queryRetrieveRequest](v14);
    id v26 = (id)objc_claimAutoreleasedReturnValue();

    -[FCCKPQueryRetrieveRequest setContinuationMarker:]((uint64_t)v26, v25);
LABEL_34:

    uint64_t v22 = self;
    goto LABEL_35;
  }
  if (self->_query)
  {
    uint64_t v25 = +[FCCKProtocolTranslator sharedInstance]();
    query = self->_query;
    id v83 = 0;
    v35 = query;
    v36 = -[FCCKProtocolTranslator pQueryFromQuery:error:]((uint64_t)v25, v35, &v83);
    id v26 = v83;
    id v37 = -[FCCKPRequestOperation queryRetrieveRequest](v14);

    -[FCCKPQueryRetrieveRequest setQuery:]((uint64_t)v37, v36);
    goto LABEL_34;
  }
LABEL_35:
  if (v22->_desiredKeys)
  {
    id v38 = objc_opt_new();
    v39 = -[FCCKPRequestOperation queryRetrieveRequest](v14);
    -[FCCKPQueryRetrieveRequest setRequestedFields:]((uint64_t)v39, v38);

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v40 = self->_desiredKeys;
    uint64_t v41 = [(NSArray *)v40 countByEnumeratingWithState:&v79 objects:location count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v80;
      do
      {
        uint64_t v43 = 0;
        do
        {
          if (*(void *)v80 != v42) {
            objc_enumerationMutation(v40);
          }
          uint64_t v44 = *(void *)(*((void *)&v79 + 1) + 8 * v43);
          id v45 = objc_opt_new();
          [v45 setName:v44];
          uint64_t v46 = -[FCCKPRequestOperation queryRetrieveRequest](v14);
          v47 = (void *)v46;
          if (v46) {
            id v48 = *(void **)(v46 + 32);
          }
          else {
            id v48 = 0;
          }
          id v49 = v48;
          -[FCCKPRequestedFields addFields:]((uint64_t)v49, v45);

          ++v43;
        }
        while (v41 != v43);
        uint64_t v50 = [(NSArray *)v40 countByEnumeratingWithState:&v79 objects:location count:16];
        uint64_t v41 = v50;
      }
      while (v50);
    }

    uint64_t v22 = self;
  }
  unint64_t resultsLimit = v22->_resultsLimit;
  if (resultsLimit)
  {
    uint64_t v52 = -[FCCKPRequestOperation queryRetrieveRequest](v14);
    if (v52)
    {
      int v53 = -1;
      if (resultsLimit < 0xFFFFFFFF) {
        int v53 = resultsLimit;
      }
      *(unsigned char *)(v52 + 48) |= 1u;
      *(_DWORD *)(v52 + 16) = v53;
    }
  }
  v84 = v14;
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];

LABEL_55:
  if (selfa) {
    objc_setProperty_nonatomic_copy(selfa, v13, v54, 384);
  }

  if (self)
  {
    long long v55 = [(FCCKContentDatabase *)self->_database networkBehaviorMonitor];
    -[FCCKDirectRequestOperation setNetworkBehaviorMonitor:]((uint64_t)selfa, v55);

    if (selfa)
    {
      long long v57 = selfa;
      long long v58 = self;
      selfa->_networkEventType = self->_networkEventType;
      id networkActivityBlock = self->_networkActivityBlock;
LABEL_60:
      BOOL v60 = v58 == 0;
      objc_setProperty_nonatomic_copy(v57, v56, networkActivityBlock, 472);
      objc_setProperty_nonatomic_copy(selfa, v61, v70, 416);
      if (v60)
      {
        objc_setProperty_nonatomic_copy(selfa, v62, 0, 432);
        BOOL ignoreCache = 0;
      }
      else
      {
        objc_setProperty_nonatomic_copy(selfa, v62, self->_edgeCacheHint, 432);
        BOOL ignoreCache = self->_ignoreCache;
      }
      selfa->_BOOL ignoreCache = ignoreCache;
      objc_setProperty_nonatomic_copy(selfa, v63, &__block_literal_global_31_1, 440);
    }
  }
  else
  {
    v69 = [0 networkBehaviorMonitor];
    -[FCCKDirectRequestOperation setNetworkBehaviorMonitor:]((uint64_t)selfa, v69);

    if (selfa)
    {
      id networkActivityBlock = 0;
      long long v57 = selfa;
      long long v58 = 0;
      selfa->_networkEventType = 0;
      goto LABEL_60;
    }
  }
  objc_initWeak(location, selfa);
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __45__FCCKContentQueryOperation_performOperation__block_invoke_2_32;
  newValue[3] = &unk_1E5B593B8;
  newValue[4] = self;
  objc_copyWeak(&v74, location);
  if (selfa) {
    objc_setProperty_nonatomic_copy(selfa, v65, newValue, 448);
  }
  [(FCOperation *)self associateChildOperation:selfa];
  if ([(FCOperation *)self relativePriority] < 1)
  {
    v66 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_throttledCKRequestOperationQueue");
    [v66 addOperation:selfa];
  }
  else
  {
    [(FCOperation *)selfa start];
  }
  objc_destroyWeak(&v74);
  objc_destroyWeak(location);
LABEL_69:
}

id __45__FCCKContentQueryOperation_performOperation__block_invoke_5(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 384);
  }
  else {
    id v3 = 0;
  }
  uint64_t v4 = [v3 recordType];
  int v5 = [v4 isEqualToString:@"MultiFetch"];

  uint64_t v6 = *(void *)(a1 + 32);
  if (v5)
  {
    if (!v6) {
      goto LABEL_33;
    }
    id v7 = *(id *)(v6 + 448);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v7)
    {
      id v9 = v7;
      if (v8) {
        v10 = *(void **)(v8 + 376);
      }
      else {
        v10 = 0;
      }
      uint64_t v11 = [v10 baseURLForEdgeCachedMultiFetch];
LABEL_17:
      uint64_t v19 = (void *)v11;

      goto LABEL_28;
    }
    if (v8) {
      uint64_t v21 = *(void **)(v8 + 376);
    }
    else {
LABEL_33:
    }
      uint64_t v21 = 0;
    uint64_t v20 = [v21 baseURLForMultiFetch];
  }
  else
  {
    if (v6) {
      BOOL v12 = *(void **)(v6 + 384);
    }
    else {
      BOOL v12 = 0;
    }
    uint64_t v13 = [v12 recordType];
    int v14 = [v13 isEqualToString:@"OrderFeed"];

    if (v14)
    {
      uint64_t v15 = *(void *)(a1 + 32);
      if (!v15) {
        goto LABEL_35;
      }
      id v16 = *(id *)(v15 + 448);
      uint64_t v17 = *(void *)(a1 + 32);
      if (v16)
      {
        id v9 = v16;
        if (v17) {
          id v18 = *(void **)(v17 + 376);
        }
        else {
          id v18 = 0;
        }
        uint64_t v11 = [v18 baseURLForEdgeCachedOrderFeed];
        goto LABEL_17;
      }
      if (v17) {
        uint64_t v22 = *(void **)(v17 + 376);
      }
      else {
LABEL_35:
      }
        uint64_t v22 = 0;
      uint64_t v20 = [v22 baseURLForOrderFeed];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = (void *)[[NSString alloc] initWithFormat:@"unsupported query type, falling back to hardcoded base URL"];
        int v25 = 136315906;
        id v26 = "-[FCCKContentQueryOperation performOperation]_block_invoke_5";
        __int16 v27 = 2080;
        v28 = "FCCKContentQueryOperation.m";
        __int16 v29 = 1024;
        int v30 = 135;
        __int16 v31 = 2114;
        id v32 = v24;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v25, 0x26u);
      }
      uint64_t v20 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://gateway.icloud.com:443/ckdatabase"];
    }
  }
  uint64_t v19 = (void *)v20;
LABEL_28:
  return v19;
}

- (void)setQuery:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 384), a2);
  }
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 376), a2);
  }
}

- (FCCKContentQueryOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCCKContentQueryOperation;
  result = [(FCOperation *)&v3 init];
  if (result)
  {
    result->_networkEventType = 0;
    result->_queryPriority = 200;
  }
  return result;
}

- (void)operationWillFinishWithError:(id)a3
{
  if (self) {
    database = self->_database;
  }
  else {
    database = 0;
  }
  id v5 = a3;
  [(FCCKContentDatabase *)database maximumRetryAfterForCK];
  objc_msgSend(v5, "fc_errorWithMaximumRetryAfter:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    id v6 = self->_queryCompletionBlock;
    uint64_t v7 = (uint64_t)v6 + 16;
    resultCursor = self->_resultCursor;
  }
  else
  {
    id v6 = 0;
    resultCursor = 0;
    uint64_t v7 = 16;
  }
  (*(void (**)(id, CKQueryCursor *, id))v7)(v6, resultCursor, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCursor, 0);
  objc_storeStrong(&self->_networkActivityBlock, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_additionalRequestHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_requestUUIDs, 0);
  objc_storeStrong(&self->_queryCompletionBlock, 0);
  objc_storeStrong(&self->_recordFetchedBlock, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __45__FCCKContentQueryOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  -[FCCKContentQueryOperation setResultCursor:](v5, a2);
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v6];
}

void __45__FCCKContentQueryOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [a2 requestUUID];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6 && (id v7 = *(id *)(v6 + 432)) != 0)
    {
      uint64_t v8 = v7;
      id v9 = *(void **)(a1 + 32);
      if (v9) {
        id v9 = (void *)v9[54];
      }
      v10 = v9;
      BOOL v12 = [v10 arrayByAddingObject:v5];
      char v13 = 0;
    }
    else
    {
      v15[0] = v5;
      char v13 = 1;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      uint64_t v8 = 0;
      BOOL v12 = v10;
    }
    int v14 = *(void **)(a1 + 32);
    if (v14) {
      objc_setProperty_nonatomic_copy(v14, v11, v12, 432);
    }
    if ((v13 & 1) == 0) {
  }
    }
}

uint64_t __45__FCCKContentQueryOperation_performOperation__block_invoke_28()
{
  return 1;
}

- (void)setCursor:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 392), a2);
  }
}

@end