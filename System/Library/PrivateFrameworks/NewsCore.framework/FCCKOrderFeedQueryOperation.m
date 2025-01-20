@interface FCCKOrderFeedQueryOperation
- (BOOL)validateOperation;
- (id)_feedRelativeDictionaryFromResultsArray:(uint64_t)a1;
- (id)_predicateForPerFeedFieldName:(void *)a3 key:(void *)a4 defaultValue:;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)resetForRetry;
- (void)setDatabase:(uint64_t)a1;
- (void)setResultError:(uint64_t)a1;
@end

@implementation FCCKOrderFeedQueryOperation

- (BOOL)validateOperation
{
  v2 = self;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self && self->_database) {
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"feed query must have a database"];
    int v9 = 136315906;
    v10 = "-[FCCKOrderFeedQueryOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCCKOrderFeedQueryOperation.m";
    __int16 v13 = 1024;
    int v14 = 84;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    if (v2) {
      goto LABEL_5;
    }
LABEL_14:
    feedRequests = 0;
    goto LABEL_6;
  }
  if (!v2) {
    goto LABEL_14;
  }
LABEL_5:
  feedRequests = v2->_feedRequests;
LABEL_6:
  if (![(NSArray *)feedRequests count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)[[NSString alloc] initWithFormat:@"feed query must have at least one feed request"];
    int v9 = 136315906;
    v10 = "-[FCCKOrderFeedQueryOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCCKOrderFeedQueryOperation.m";
    __int16 v13 = 1024;
    int v14 = 85;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    if (!v2) {
      return (char)v2;
    }
  }
  else if (!v2)
  {
    return (char)v2;
  }
  v4 = v2->_database;
  if (v4)
  {
    v5 = v4;
    LOBYTE(v2) = [(NSArray *)v2->_feedRequests count] != 0;
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return (char)v2;
}

- (void)prepareOperation
{
  v2 = self;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (FCCKOrderFeedQueryOperation *)self->_feedRequests;
  }
  if ((unint64_t)[(FCCKOrderFeedQueryOperation *)self count] >= 0x191
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = (void *)[[NSString alloc] initWithFormat:@"exceeded maximum number of feed requests"];
    int v14 = 136315906;
    __int16 v15 = "-[FCCKOrderFeedQueryOperation prepareOperation]";
    __int16 v16 = 2080;
    uint64_t v17 = "FCCKOrderFeedQueryOperation.m";
    __int16 v18 = 1024;
    int v19 = 93;
    __int16 v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

    if (v2) {
      goto LABEL_6;
    }
LABEL_19:
    feedRequests = 0;
    goto LABEL_7;
  }
  if (!v2) {
    goto LABEL_19;
  }
LABEL_6:
  feedRequests = v2->_feedRequests;
  if ([(NSArray *)feedRequests count] < 0x191) {
    goto LABEL_13;
  }
LABEL_7:
  if (v2) {
    v4 = v2->_feedRequests;
  }
  else {
    v4 = 0;
  }
  v6 = [(NSArray *)v4 fc_subarrayWithMaxCount:400];
  if (v2) {
    objc_setProperty_nonatomic_copy(v2, v5, v6, 376);
  }

  v7 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    v12 = v7;
    __int16 v13 = [(FCOperation *)v2 shortOperationDescription];
    int v14 = 138543362;
    __int16 v15 = v13;
    _os_log_error_impl(&dword_1A460D000, v12, OS_LOG_TYPE_ERROR, "%{public}@ dropping feeds because the limit was exeeded", (uint8_t *)&v14, 0xCu);

    if (v2) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_13:
    if (v2)
    {
LABEL_14:
      v8 = v2->_feedRequests;
      goto LABEL_15;
    }
  }
  v8 = 0;
LABEL_15:
  v10 = [(NSArray *)v8 sortedArrayUsingComparator:&__block_literal_global_75];
  if (v2) {
    objc_setProperty_nonatomic_copy(v2, v9, v10, 376);
  }
}

uint64_t __47__FCCKOrderFeedQueryOperation_prepareOperation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = a3;
  v5 = v4;
  if (!a2)
  {
    v6 = 0;
    if (v4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  v6 = *(void **)(a2 + 8);
  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v7 = v4[1];
LABEL_4:
  id v8 = v6;
  uint64_t v9 = [v8 caseInsensitiveCompare:v7];

  return v9;
}

- (void)performOperation
{
  v2 = self;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (FCCKOrderFeedQueryOperation *)self->_feedRequests;
  }
  unint64_t v3 = [(FCCKOrderFeedQueryOperation *)self count];
  v4 = (id)FCOperationLog;
  v5 = v4;
  if (v3 > 2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v43 = [(FCOperation *)v2 shortOperationDescription];
      v44 = (void *)v43;
      if (v2) {
        feedRequests = v2->_feedRequests;
      }
      else {
        feedRequests = 0;
      }
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = feedRequests;
      _os_log_debug_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ started with feed requests: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(FCOperation *)v2 shortOperationDescription];
    uint64_t v7 = (void *)v6;
    if (v2) {
      id v8 = v2->_feedRequests;
    }
    else {
      id v8 = 0;
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ started with feed requests: %@", buf, 0x16u);
  }
  if (v2)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = -[FCCKOrderFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)v2, @"tagID", @"feedID", 0);
    [v9 addObject:v10];

    __int16 v11 = -[FCCKOrderFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)v2, @"maxOrder", @"maxOrder", &unk_1EF8D7D58);
    [v9 addObject:v11];

    v12 = -[FCCKOrderFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)v2, @"minOrder", @"minOrder", &unk_1EF8D7D70);
    [v9 addObject:v12];

    __int16 v13 = [NSNumber numberWithUnsignedInteger:v2->_resultsLimit];
    int v14 = -[FCCKOrderFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)v2, @"hardLimit", @"resultsLimit", v13);
    [v9 addObject:v14];

    __int16 v15 = -[FCCKOrderFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)v2, @"topK", @"topK", &unk_1EF8D7D88);
    [v9 addObject:v15];

    __int16 v16 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v17 = [NSNumber numberWithUnsignedInteger:v2->_queryPriority];
    __int16 v18 = [v16 predicateWithFormat:@"%K == %@", @"priority", v17];
    [v9 addObject:v18];

    if ([(NSArray *)v2->_articleLinkKeys count])
    {
      int v19 = (void *)MEMORY[0x1E4F28F60];
      __int16 v20 = [(NSArray *)v2->_articleLinkKeys sortedArrayUsingSelector:sel_compare_];
      v21 = [v19 predicateWithFormat:@"%K == %@", @"fetchFields", v20];
      [v9 addObject:v21];
    }
    uint64_t v22 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v9];
    v23 = (uint64_t (*)(uint64_t, uint64_t))[objc_alloc(MEMORY[0x1E4F1A2A0]) initWithRecordType:@"OrderFeed" predicate:v22];

    v24 = v2->_feedRequests;
  }
  else
  {
    v23 = 0;
    v24 = 0;
  }
  unint64_t v25 = [(NSArray *)v24 count];
  v26 = (id)FCOperationLog;
  v27 = v26;
  if (v25 > 2)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v46 = [(FCOperation *)v2 shortOperationDescription];
      v47 = (void *)v46;
      if (v2) {
        unint64_t resultsLimit = v2->_resultsLimit;
      }
      else {
        unint64_t resultsLimit = 0;
      }
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v46;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = resultsLimit;
      *(_WORD *)&buf[22] = 2112;
      v62 = v23;
      _os_log_debug_impl(&dword_1A460D000, v27, OS_LOG_TYPE_DEBUG, "%{public}@ issuing query with results limit %lu: %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = [(FCOperation *)v2 shortOperationDescription];
    v29 = (void *)v28;
    if (v2) {
      unint64_t v30 = v2->_resultsLimit;
    }
    else {
      unint64_t v30 = 0;
    }
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v28;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v30;
    *(_WORD *)&buf[22] = 2112;
    v62 = v23;
    _os_log_impl(&dword_1A460D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ issuing query with results limit %lu: %@", buf, 0x20u);
  }
  v31 = objc_alloc_init(FCCKContentQueryOperation);
  uint64_t v32 = (uint64_t)v31;
  if (v2)
  {
    -[FCCKContentQueryOperation setDatabase:]((uint64_t)v31, v2->_database);
    -[FCCKContentQueryOperation setQuery:](v32, v23);
    BOOL v34 = v32 == 0;
    if (v32)
    {
      *(void *)(v32 + 400) = v2->_resultsLimit;
      *(_DWORD *)(v32 + 372) = 10;
      objc_setProperty_nonatomic_copy((id)v32, v33, v2->_additionalRequestHTTPHeaders, 440);
      objc_setProperty_nonatomic_copy((id)v32, v35, v2->_edgeCacheHint, 448);
      *(void *)(v32 + 456) = v2->_queryPriority;
    }
    v36 = v2->_desiredKeys;
    if (qword_1EB5D0E08 != -1) {
      dispatch_once(&qword_1EB5D0E08, &__block_literal_global_70_0);
    }
    id v37 = (id)_MergedGlobals_32;
  }
  else
  {
    -[FCCKContentQueryOperation setDatabase:]((uint64_t)v31, 0);
    -[FCCKContentQueryOperation setQuery:](v32, v23);
    BOOL v34 = v32 == 0;
    if (v32)
    {
      *(void *)(v32 + 400) = 0;
      *(_DWORD *)(v32 + 372) = 10;
      objc_setProperty_nonatomic_copy((id)v32, v49, 0, 440);
      objc_setProperty_nonatomic_copy((id)v32, v50, 0, 448);
      *(void *)(v32 + 456) = 0;
    }
    v36 = 0;
    id v37 = 0;
  }
  v38 = [(NSArray *)v36 arrayByAddingObjectsFromArray:v37];
  v39 = [v38 sortedArrayUsingSelector:sel_compare_];

  if (!v34) {
    objc_setProperty_nonatomic_copy((id)v32, v40, v39, 408);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v62 = __Block_byref_object_copy__34;
  v63 = __Block_byref_object_dispose__34;
  id v64 = [MEMORY[0x1E4F1CA48] array];
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__34;
  v59[4] = __Block_byref_object_dispose__34;
  id v60 = [MEMORY[0x1E4F1CA60] dictionary];
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__34;
  v57[4] = __Block_byref_object_dispose__34;
  id v58 = [MEMORY[0x1E4F1CA60] dictionary];
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__34;
  v55[4] = __Block_byref_object_dispose__34;
  id v56 = 0;
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __47__FCCKOrderFeedQueryOperation_performOperation__block_invoke;
  newValue[3] = &unk_1E5B503F0;
  newValue[4] = v55;
  newValue[5] = v59;
  newValue[6] = v57;
  newValue[7] = buf;
  if (!v34) {
    objc_setProperty_nonatomic_copy((id)v32, v41, newValue, 416);
  }
  objc_initWeak(&location, (id)v32);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __47__FCCKOrderFeedQueryOperation_performOperation__block_invoke_2;
  v51[3] = &unk_1E5B55490;
  objc_copyWeak(&v52, &location);
  v51[4] = v2;
  v51[5] = buf;
  v51[6] = v59;
  v51[7] = v55;
  v51[8] = v57;
  if (!v34) {
    objc_setProperty_nonatomic_copy((id)v32, v42, v51, 424);
  }
  [(FCOperation *)v2 associateChildOperation:v32];
  [(id)v32 start];
  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);
  _Block_object_dispose(v55, 8);

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);

  _Block_object_dispose(buf, 8);
}

void __47__FCCKOrderFeedQueryOperation_performOperation__block_invoke(void *a1, void *a2)
{
  id v14 = a2;
  v4 = [v14 recordType];
  int v5 = [v4 isEqualToString:@"Results"];

  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
    goto LABEL_9;
  }
  uint64_t v6 = [v14 recordType];
  int v7 = [v6 isEqualToString:@"Tag"];

  if (v7)
  {
    uint64_t v8 = a1[5];
LABEL_7:
    __int16 v11 = *(void **)(*(void *)(v8 + 8) + 40);
    v12 = [v14 recordID];
    __int16 v13 = [v12 recordName];
    [v11 setObject:v14 forKey:v13];

    goto LABEL_9;
  }
  uint64_t v9 = [v14 recordType];
  int v10 = [v9 isEqualToString:@"Issue"];

  if (v10)
  {
    uint64_t v8 = a1[6];
    goto LABEL_7;
  }
  [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v14];
LABEL_9:
}

void __47__FCCKOrderFeedQueryOperation_performOperation__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v6 = WeakRetained;
  if (WeakRetained) {
    int v7 = (void *)*((void *)WeakRetained + 54);
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;
  uint64_t v9 = [v8 firstObject];

  id v10 = objc_loadWeakRetained((id *)(a1 + 72));
  __int16 v11 = v10;
  if (v10) {
    v12 = (void *)*((void *)v10 + 58);
  }
  else {
    v12 = 0;
  }
  id v14 = v12;
  __int16 v15 = *(void **)(a1 + 32);
  if (v15) {
    objc_setProperty_nonatomic_copy(v15, v13, v14, 432);
  }

  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    uint64_t v17 = *(void **)(v16 + 376);
  }
  else {
    uint64_t v17 = 0;
  }
  unint64_t v18 = [v17 count];
  int v19 = (void *)FCOperationLog;
  if (v18 <= 2)
  {
    if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v20 = *(void **)(a1 + 32);
    v21 = v19;
    uint64_t v22 = [v20 shortOperationDescription];
    uint64_t v23 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    uint64_t v24 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    unint64_t v25 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) values];
    *(_DWORD *)buf = 138544130;
    v169 = v22;
    __int16 v170 = 2048;
    v171 = (char *)v23;
    __int16 v172 = 2048;
    *(void *)v173 = v24;
    *(_WORD *)&v173[8] = 2112;
    *(void *)&v173[10] = v25;
    _os_log_impl(&dword_1A460D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ received response with %lu FeedItemAndArticleRecords, %lu TagRecords and Results record: %@", buf, 0x2Au);
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEBUG))
  {
    v117 = *(void **)(a1 + 32);
    v21 = v19;
    uint64_t v22 = [v117 shortOperationDescription];
    uint64_t v118 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    uint64_t v119 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    unint64_t v25 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) values];
    *(_DWORD *)buf = 138544130;
    v169 = v22;
    __int16 v170 = 2048;
    v171 = (char *)v118;
    __int16 v172 = 2048;
    *(void *)v173 = v119;
    *(_WORD *)&v173[8] = 2112;
    *(void *)&v173[10] = v25;
    _os_log_debug_impl(&dword_1A460D000, v21, OS_LOG_TYPE_DEBUG, "%{public}@ received response with %lu FeedItemAndArticleRecords, %lu TagRecords and Results record: %@", buf, 0x2Au);
LABEL_12:
  }
LABEL_14:
  if (v4)
  {
    FCErrorForCKError(v4);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    -[FCCKOrderFeedQueryOperation setResultError:](*(void *)(a1 + 32), v26);
    goto LABEL_135;
  }
  v132 = v9;
  v27 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v27)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v120 = (void *)[[NSString alloc] initWithFormat:@"must always have a Results record"];
      *(_DWORD *)buf = 136315906;
      v169 = "-[FCCKOrderFeedQueryOperation performOperation]_block_invoke";
      __int16 v170 = 2080;
      v171 = "FCCKOrderFeedQueryOperation.m";
      __int16 v172 = 1024;
      *(_DWORD *)v173 = 164;
      *(_WORD *)&v173[4] = 2114;
      *(void *)&v173[6] = v120;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      v27 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    else
    {
      v27 = 0;
    }
  }
  uint64_t v28 = *(id **)(a1 + 32);
  v29 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  unint64_t v30 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) allValues];
  v31 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) allValues];
  id v32 = v27;
  id v127 = v29;
  id v33 = v29;
  id v129 = v30;
  id v26 = v30;
  id v128 = v31;
  id v130 = v31;
  uint64_t v9 = v132;
  id v133 = v132;
  v134 = v28;
  if (v28)
  {
    v131 = [v32 objectForKeyedSubscript:@"droppedFeeds"];
    if ([v131 unsignedIntegerValue])
    {
      BOOL v34 = (id)FCOperationLog;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        [v28 shortOperationDescription];
        id v35 = v33;
        v36 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v37 = [v131 unsignedIntegerValue];
        id v38 = v134[47];
        uint64_t v39 = [v38 count];
        *(_DWORD *)buf = 138543874;
        v169 = v36;
        __int16 v170 = 2048;
        v171 = (char *)v37;
        __int16 v172 = 2048;
        *(void *)v173 = v39;
        _os_log_impl(&dword_1A460D000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ %lu of %lu feeds were dropped", buf, 0x20u);

        id v33 = v35;
      }
    }
    id v125 = v26;
    uint64_t v126 = a1;
    id v142 = [MEMORY[0x1E4F1CA48] array];
    v40 = [v32 objectForKeyedSubscript:@"reachedMinOrder"];
    v141 = -[FCCKOrderFeedQueryOperation _feedRelativeDictionaryFromResultsArray:]((uint64_t)v134, v40);

    v41 = [v32 objectForKeyedSubscript:@"reachedEnd"];
    v140 = -[FCCKOrderFeedQueryOperation _feedRelativeDictionaryFromResultsArray:]((uint64_t)v134, v41);

    v42 = [v32 objectForKeyedSubscript:@"feedDropped"];
    v139 = -[FCCKOrderFeedQueryOperation _feedRelativeDictionaryFromResultsArray:]((uint64_t)v134, v42);

    id v124 = v32;
    uint64_t v43 = [v32 objectForKeyedSubscript:@"nextOrder"];
    v135 = -[FCCKOrderFeedQueryOperation _feedRelativeDictionaryFromResultsArray:]((uint64_t)v134, v43);

    v44 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    id v123 = v33;
    id obj = v33;
    uint64_t v45 = [obj countByEnumeratingWithState:&v148 objects:buf count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v149;
      v48 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v149 != v47) {
            objc_enumerationMutation(obj);
          }
          SEL v50 = *(void **)(*((void *)&v148 + 1) + 8 * i);
          v51 = [v50 objectForKeyedSubscript:@"articleID"];

          if (!v51)
          {
            id v52 = v48;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              v59 = (void *)[[NSString alloc] initWithFormat:@"feedItemAndArticle must always have an ArticleID, this is a CloudKit issue please file a radar, record: %@", v50];
              *(_DWORD *)v160 = 136315906;
              v161 = "-[FCCKOrderFeedQueryOperation _processResultsRecord:feedItemAndArticleRecords:tagRecords:issueRecor"
                     "ds:requestUUID:]";
              __int16 v162 = 2080;
              v163 = "FCCKOrderFeedQueryOperation.m";
              __int16 v164 = 1024;
              int v165 = 301;
              __int16 v166 = 2114;
              v167 = v59;
              _os_log_error_impl(&dword_1A460D000, v48, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v160, 0x26u);
            }
          }
          v53 = [v50 objectForKeyedSubscript:@"tagID"];

          if (!v53)
          {
            v54 = v48;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              id v60 = (void *)[[NSString alloc] initWithFormat:@"feedItemAndArticle must always have a FeedID (currently named TagID), this is a CloudKit issue please file a radar, record: %@", v50];
              *(_DWORD *)v160 = 136315906;
              v161 = "-[FCCKOrderFeedQueryOperation _processResultsRecord:feedItemAndArticleRecords:tagRecords:issueRecor"
                     "ds:requestUUID:]";
              __int16 v162 = 2080;
              v163 = "FCCKOrderFeedQueryOperation.m";
              __int16 v164 = 1024;
              int v165 = 302;
              __int16 v166 = 2114;
              v167 = v60;
              _os_log_error_impl(&dword_1A460D000, v48, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v160, 0x26u);
            }
          }
          v55 = [v50 objectForKeyedSubscript:@"tagID"];
          id v56 = [v44 objectForKeyedSubscript:v55];

          if (!v56)
          {
            v57 = [MEMORY[0x1E4F1CA48] array];
            [v44 setObject:v57 forKeyedSubscript:v55];
          }
          id v58 = [v44 objectForKeyedSubscript:v55];
          [v58 addObject:v50];
        }
        uint64_t v46 = [obj countByEnumeratingWithState:&v148 objects:buf count:16];
      }
      while (v46);
    }

    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    id v136 = v134[47];
    uint64_t v143 = [v136 countByEnumeratingWithState:&v144 objects:v160 count:16];
    if (v143)
    {
      uint64_t v138 = *(void *)v145;
      v61 = MEMORY[0x1E4F14500];
      do
      {
        uint64_t v62 = 0;
        do
        {
          if (*(void *)v145 != v138) {
            objc_enumerationMutation(v136);
          }
          v63 = *(void **)(*((void *)&v144 + 1) + 8 * v62);
          id v64 = objc_alloc_init(FCCKOrderFeedResponse);
          if (v63) {
            uint64_t v65 = (void *)v63[1];
          }
          else {
            uint64_t v65 = 0;
          }
          id v67 = v65;
          if (v64) {
            objc_setProperty_nonatomic_copy(v64, v66, v67, 16);
          }

          if (v63) {
            v68 = (void *)v63[1];
          }
          else {
            v68 = 0;
          }
          id v69 = v68;
          v71 = [v44 objectForKeyedSubscript:v69];
          if (v64) {
            objc_setProperty_nonatomic_copy(v64, v70, v71, 24);
          }

          if (v63) {
            v72 = (void *)v63[1];
          }
          else {
            v72 = 0;
          }
          id v73 = v72;
          v74 = [v139 objectForKeyedSubscript:v73];
          char v75 = [v74 BOOLValue];
          if (v64) {
            v64->_wasDropped = v75;
          }

          if (v63) {
            v76 = (void *)v63[1];
          }
          else {
            v76 = 0;
          }
          id v77 = v76;
          v78 = [v140 objectForKeyedSubscript:v77];
          char v79 = [v78 BOOLValue];
          if (v64) {
            v64->_reachedEnd = v79;
          }

          if (v63) {
            v80 = (void *)v63[1];
          }
          else {
            v80 = 0;
          }
          id v81 = v80;
          v82 = [v141 objectForKeyedSubscript:v81];
          char v83 = [v82 BOOLValue];
          if (v64)
          {
            v64->_reachedMinOrder = v83;

            feedItemAndArticleRecords = v64->_feedItemAndArticleRecords;
          }
          else
          {

            feedItemAndArticleRecords = 0;
          }
          v85 = feedItemAndArticleRecords;
          v86 = [NSString stringWithFormat:@"@min.%@", @"order"];
          v87 = [(NSArray *)v85 valueForKeyPath:v86];

          if (!v64)
          {
            [obj count];
            goto LABEL_119;
          }
          if (!v64->_wasDropped)
          {
            if (![obj count] && !v64->_reachedEnd && !v64->_reachedMinOrder) {
              *(_WORD *)&v64->_reachedEnd = 257;
            }
            if (v64->_reachedMinOrder || v64->_reachedEnd)
            {
              if (v63) {
                goto LABEL_79;
              }
LABEL_130:
              v92 = 0;
            }
            else
            {
LABEL_119:
              if (!v63) {
                goto LABEL_130;
              }
              if (v63[5])
              {
                v108 = v64 ? v64->_feedItemAndArticleRecords : 0;
                v109 = v108;
                unint64_t v110 = [(NSArray *)v109 count];
                unint64_t v111 = v63[5];

                if (v64)
                {
                  if (v110 >= v111) {
                    v64->_reachedMinOrder = 1;
                  }
                }
              }
LABEL_79:
              v92 = (void *)v63[1];
            }
            id v93 = v92;
            v94 = [v135 objectForKeyedSubscript:v93];

            if (v94 && [v94 unsignedLongLongValue])
            {
              uint64_t v95 = [v94 unsignedLongLongValue];
              if (v64)
              {
                uint64_t v96 = v95 + 1;
                goto LABEL_88;
              }
LABEL_126:
              v100 = 0;
            }
            else
            {
              if (v64) {
                v97 = v64->_feedItemAndArticleRecords;
              }
              else {
                v97 = 0;
              }
              v98 = v97;
              uint64_t v99 = [(NSArray *)v98 count];

              if (v99)
              {
                uint64_t v96 = [v87 unsignedLongLongValue];
                if (!v64) {
                  goto LABEL_126;
                }
LABEL_88:
                v64->_unint64_t extent = v96;
              }
              else if (!v64)
              {
                goto LABEL_126;
              }
              v100 = v64->_feedItemAndArticleRecords;
            }
            v101 = v100;
            if ([(NSArray *)v101 count])
            {
              if (v64) {
                unint64_t extent = v64->_extent;
              }
              else {
                unint64_t extent = 0;
              }
              unint64_t v103 = [v87 unsignedLongValue];

              if (extent > v103)
              {
                v104 = v61;
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                {
                  v107 = (void *)[[NSString alloc] initWithFormat:@"OrderFeed returned a bad nextOrder value for request UUID %@", v133];
                  *(_DWORD *)v152 = 136315906;
                  v153 = "-[FCCKOrderFeedQueryOperation _processResultsRecord:feedItemAndArticleRecords:tagRecords:issueR"
                         "ecords:requestUUID:]";
                  __int16 v154 = 2080;
                  v155 = "FCCKOrderFeedQueryOperation.m";
                  __int16 v156 = 1024;
                  int v157 = 352;
                  __int16 v158 = 2114;
                  v159 = v107;
                  _os_log_error_impl(&dword_1A460D000, v61, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v152, 0x26u);
                }
                uint64_t v105 = [v87 unsignedLongLongValue];
                if (v64)
                {
                  v64->_unint64_t extent = v105;
                  goto LABEL_101;
                }
                goto LABEL_109;
              }
            }
            else
            {
            }
            if (v64)
            {
LABEL_101:
              if (v64->_reachedMinOrder)
              {
                if (v63) {
                  unint64_t v106 = v63[3];
                }
                else {
                  unint64_t v106 = 0;
                }
                if (v64->_extent < v106) {
                  unint64_t v106 = v64->_extent;
                }
                v64->_unint64_t extent = v106;
              }
              if (v64->_reachedEnd) {
                v64->_unint64_t extent = 0;
              }
            }
LABEL_109:

            goto LABEL_110;
          }
          v88 = (void *)FCOperationLog;
          if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
          {
            v89 = v88;
            v90 = [v134 shortOperationDescription];
            feedID = (char *)v64->_feedID;
            *(_DWORD *)v152 = 138543618;
            v153 = v90;
            __int16 v154 = 2114;
            v155 = feedID;
            _os_log_impl(&dword_1A460D000, v89, OS_LOG_TYPE_DEFAULT, "%{public}@ feed was dropped: %{public}@", v152, 0x16u);
          }
          *(_WORD *)&v64->_reachedEnd = 0;
          v64->_unint64_t extent = 0;
          if ([(NSArray *)v64->_feedItemAndArticleRecords count]) {
            v64->_unint64_t extent = [v87 unsignedLongLongValue];
          }
LABEL_110:
          [v142 addObject:v64];

          ++v62;
        }
        while (v143 != v62);
        uint64_t v112 = [v136 countByEnumeratingWithState:&v144 objects:v160 count:16];
        uint64_t v143 = v112;
      }
      while (v112);
    }

    objc_storeStrong(v134 + 56, v127);
    objc_storeStrong(v134 + 59, v142);
    objc_storeStrong(v134 + 57, v129);
    objc_storeStrong(v134 + 58, v128);

    a1 = v126;
    id v4 = 0;
    uint64_t v9 = v132;
    id v32 = v124;
    id v26 = v125;
    id v33 = v123;
  }

LABEL_135:
  v113 = *(void **)(a1 + 32);
  if (v113)
  {
    v114 = FCOperationLog;
    if (v113[60])
    {
      if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_148;
      }
      v115 = v114;
      v116 = [v113 shortOperationDescription];
      *(_DWORD *)buf = 138543874;
      v169 = v116;
      __int16 v170 = 2114;
      v171 = (char *)v4;
      __int16 v172 = 2114;
      *(void *)v173 = v9;
      _os_log_error_impl(&dword_1A460D000, v115, OS_LOG_TYPE_ERROR, "%{public}@ query failed with error: %{public}@, request UUID: %{public}@", buf, 0x20u);
      goto LABEL_147;
    }
  }
  else
  {
    v114 = FCOperationLog;
  }
  if (!os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_148;
  }
  v115 = v114;
  v116 = [v113 shortOperationDescription];
  *(_DWORD *)buf = 138543618;
  v169 = v116;
  __int16 v170 = 2114;
  v171 = (char *)v9;
  _os_log_impl(&dword_1A460D000, v115, OS_LOG_TYPE_DEFAULT, "%{public}@ query succeeded with request UUID: %{public}@", buf, 0x16u);
LABEL_147:

LABEL_148:
  v121 = *(void **)(a1 + 32);
  if (v121) {
    uint64_t v122 = v121[60];
  }
  else {
    uint64_t v122 = 0;
  }
  [v121 finishedPerformingOperationWithError:v122];
}

- (void)setResultError:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 480), a2);
  }
}

- (void)resetForRetry
{
  if (self)
  {
    objc_storeStrong((id *)&self->_resultFeedItemAndArticleRecords, 0);
    objc_storeStrong((id *)&self->_resultTagRecords, 0);
    objc_storeStrong((id *)&self->_resultIssueRecords, 0);
    objc_storeStrong((id *)&self->_resultFeedResponses, 0);
  }
  -[FCCKOrderFeedQueryOperation setResultError:]((uint64_t)self, 0);
}

- (void)operationWillFinishWithError:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = (NSError *)a3;
  if (self) {
    feedRequests = self->_feedRequests;
  }
  else {
    feedRequests = 0;
  }
  unint64_t v6 = [(NSArray *)feedRequests count];
  int v7 = (id)FCOperationLog;
  id v8 = v7;
  if (v6 <= 2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    uint64_t v9 = [(FCOperation *)self shortOperationDescription];
    if (self) {
      resultFeedResponses = self->_resultFeedResponses;
    }
    else {
      resultFeedResponses = 0;
    }
    __int16 v11 = resultFeedResponses;
    v12 = [(NSArray *)v11 description];
    int v24 = 138543618;
    unint64_t v25 = v9;
    __int16 v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ finished with feed responses: %@", (uint8_t *)&v24, 0x16u);
    goto LABEL_8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [(FCOperation *)self shortOperationDescription];
    if (self) {
      uint64_t v23 = self->_resultFeedResponses;
    }
    else {
      uint64_t v23 = 0;
    }
    __int16 v11 = v23;
    v12 = [(NSArray *)v11 description];
    int v24 = 138543618;
    unint64_t v25 = v9;
    __int16 v26 = 2112;
    v27 = v12;
    _os_log_debug_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ finished with feed responses: %@", (uint8_t *)&v24, 0x16u);
LABEL_8:
  }
LABEL_10:

  __int16 v13 = [FCCKOrderFeedQueryResult alloc];
  if (self)
  {
    id v14 = self->_resultFeedItemAndArticleRecords;
    __int16 v15 = self->_resultFeedResponses;
    uint64_t v16 = self->_resultTagRecords;
    resultIssueRecords = self->_resultIssueRecords;
  }
  else
  {
    uint64_t v16 = 0;
    id v14 = 0;
    __int16 v15 = 0;
    resultIssueRecords = 0;
  }
  unint64_t v18 = -[FCCKOrderFeedQueryResult initWithFeedItemAndArticleRecords:feedResponses:tagRecords:issueRecords:]((id *)&v13->super.isa, v14, v15, v16, resultIssueRecords);

  if (self)
  {
    id queryCompletionHandler = self->_queryCompletionHandler;
    if (queryCompletionHandler)
    {
      id v20 = queryCompletionHandler;
      v21 = v20;
      if (self->_resultError) {
        resultError = self->_resultError;
      }
      else {
        resultError = v4;
      }
      (*((void (**)(id, id *, NSError *))v20 + 2))(v20, v18, resultError);
    }
  }
}

- (id)_predicateForPerFeedFieldName:(void *)a3 key:(void *)a4 defaultValue:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = *(id *)(a1 + 376);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    id v14 = MEMORY[0x1E4F14500];
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = [*(id *)(*((void *)&v24 + 1) + 8 * v15) valueForKey:v7];
        if (v16)
        {
          uint64_t v17 = v9;
          id v18 = v16;
LABEL_10:
          [v17 addObject:v18];
          goto LABEL_11;
        }
        if (v8)
        {
          uint64_t v17 = v9;
          id v18 = v8;
          goto LABEL_10;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "defaultValue");
          *(_DWORD *)buf = 136315906;
          v29 = "-[FCCKOrderFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]";
          __int16 v30 = 2080;
          v31 = "FCCKOrderFeedQueryOperation.m";
          __int16 v32 = 1024;
          int v33 = 252;
          __int16 v34 = 2114;
          id v35 = v19;
          _os_log_error_impl(&dword_1A460D000, v14, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
LABEL_11:

        ++v15;
      }
      while (v12 != v15);
      uint64_t v20 = [v10 countByEnumeratingWithState:&v24 objects:v36 count:16];
      uint64_t v12 = v20;
    }
    while (v20);
  }

  v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ CONTAINS %K", v9, v23];

  return v21;
}

uint64_t __44__FCCKOrderFeedQueryOperation__requiredKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"reachedMinOrder", @"reachedEnd", @"feedDropped", @"droppedFeeds", @"droppedItems", @"nextOrder", @"articleID", @"tagID", @"order", 0);
  uint64_t v1 = _MergedGlobals_32;
  _MergedGlobals_32 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)_feedRelativeDictionaryFromResultsArray:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = [v3 count];
    if (v4 != [*(id *)(a1 + 376) count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v8 = (void *)[[NSString alloc] initWithFormat:@"results don't align with feed IDs"];
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = "-[FCCKOrderFeedQueryOperation _feedRelativeDictionaryFromResultsArray:]";
      __int16 v14 = 2080;
      uint64_t v15 = "FCCKOrderFeedQueryOperation.m";
      __int16 v16 = 1024;
      int v17 = 392;
      __int16 v18 = 2114;
      int v19 = v8;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
  int v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v3 count])
  {
    unint64_t v6 = *(void **)(a1 + 376);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__FCCKOrderFeedQueryOperation__feedRelativeDictionaryFromResultsArray___block_invoke;
    v9[3] = &unk_1E5B554B8;
    id v10 = v3;
    id v11 = v5;
    [v6 enumerateObjectsUsingBlock:v9];
  }
  return v5;
}

void __71__FCCKOrderFeedQueryOperation__feedRelativeDictionaryFromResultsArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  int v5 = [*(id *)(a1 + 32) objectAtIndex:a3];
  if (v7) {
    uint64_t v6 = v7[1];
  }
  else {
    uint64_t v6 = 0;
  }
  [*(id *)(a1 + 40) setObject:v5 forKey:v6];
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 368), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong((id *)&self->_resultFeedResponses, 0);
  objc_storeStrong((id *)&self->_resultIssueRecords, 0);
  objc_storeStrong((id *)&self->_resultTagRecords, 0);
  objc_storeStrong((id *)&self->_resultFeedItemAndArticleRecords, 0);
  objc_storeStrong(&self->_queryCompletionHandler, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_additionalRequestHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_articleLinkKeys, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_feedRequests, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end