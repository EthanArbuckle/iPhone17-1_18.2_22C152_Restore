@interface FCCKMultiFeedQueryOperation
- (BOOL)validateOperation;
- (id)_feedRelativeDictionaryFromResultsArray:(uint64_t)a1;
- (id)_predicateForPerFeedFieldName:(void *)a3 key:(void *)a4 defaultValue:;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)resetForRetry;
- (void)setResultError:(uint64_t)a1;
@end

@implementation FCCKMultiFeedQueryOperation

- (BOOL)validateOperation
{
  v2 = self;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self && self->_database) {
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"feed query must have a database"];
    int v10 = 136315906;
    v11 = "-[FCCKMultiFeedQueryOperation validateOperation]";
    __int16 v12 = 2080;
    v13 = "FCCKMultiFeedQueryOperation.m";
    __int16 v14 = 1024;
    int v15 = 81;
    __int16 v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

    if (v2) {
      goto LABEL_5;
    }
LABEL_21:
    feedRequests = 0;
    goto LABEL_6;
  }
  if (!v2) {
    goto LABEL_21;
  }
LABEL_5:
  feedRequests = v2->_feedRequests;
LABEL_6:
  if (![(NSArray *)feedRequests count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)[[NSString alloc] initWithFormat:@"feed query must have at least one feed request"];
    int v10 = 136315906;
    v11 = "-[FCCKMultiFeedQueryOperation validateOperation]";
    __int16 v12 = 2080;
    v13 = "FCCKMultiFeedQueryOperation.m";
    __int16 v14 = 1024;
    int v15 = 82;
    __int16 v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
  }
  if (!v2 || !v2->_resultsLimit)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)[[NSString alloc] initWithFormat:@"feed query must have a non-zero results limit"];
      int v10 = 136315906;
      v11 = "-[FCCKMultiFeedQueryOperation validateOperation]";
      __int16 v12 = 2080;
      v13 = "FCCKMultiFeedQueryOperation.m";
      __int16 v14 = 1024;
      int v15 = 83;
      __int16 v16 = 2114;
      v17 = v9;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

      if (!v2) {
        return (char)v2;
      }
    }
    else if (!v2)
    {
      return (char)v2;
    }
  }
  v4 = v2->_database;
  if (v4)
  {
    v5 = v4;
    if ([(NSArray *)v2->_feedRequests count]) {
      LOBYTE(v2) = v2->_resultsLimit != 0;
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

- (void)prepareOperation
{
  v2 = self;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (FCCKMultiFeedQueryOperation *)self->_feedRequests;
  }
  if ((unint64_t)[(FCCKMultiFeedQueryOperation *)self count] >= 0x191
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)[[NSString alloc] initWithFormat:@"exceeded maximum number of feed requests"];
    int v11 = 136315906;
    __int16 v12 = "-[FCCKMultiFeedQueryOperation prepareOperation]";
    __int16 v13 = 2080;
    __int16 v14 = "FCCKMultiFeedQueryOperation.m";
    __int16 v15 = 1024;
    int v16 = 91;
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);

    if (v2) {
      goto LABEL_6;
    }
  }
  else if (v2)
  {
LABEL_6:
    feedRequests = v2->_feedRequests;
    goto LABEL_7;
  }
  feedRequests = 0;
LABEL_7:
  if ([(NSArray *)feedRequests count] >= 0x191)
  {
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
      v9 = v7;
      int v10 = [(FCOperation *)v2 shortOperationDescription];
      int v11 = 138543362;
      __int16 v12 = v10;
      _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "%{public}@ dropping feeds because the limit was exeeded", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)performOperation
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v3 = (id)FCOperationLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = [(FCOperation *)self shortOperationDescription];
    v33 = (void *)v32;
    if (self) {
      feedRequests = self->_feedRequests;
    }
    else {
      feedRequests = 0;
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v32;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = feedRequests;
    _os_log_debug_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ started with feed requests: %@", buf, 0x16u);
  }
  if (self)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = -[FCCKMultiFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)self, @"tagID", @"feedID", 0);
    [v4 addObject:v5];

    v6 = [MEMORY[0x1E4F1C9B8] data];
    v7 = -[FCCKMultiFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)self, @"cursor", @"startCursor", v6);
    [v4 addObject:v7];

    v8 = -[FCCKMultiFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)self, @"maxOrder", @"startOrder", &unk_1EF8D78D8);
    [v4 addObject:v8];

    v9 = -[FCCKMultiFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)self, @"minOrder", @"orderLimit", &unk_1EF8D78F0);
    [v4 addObject:v9];

    int v10 = [NSNumber numberWithUnsignedInteger:self->_resultsLimit];
    int v11 = -[FCCKMultiFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)self, @"softLimit", @"softResultsLimit", v10);
    [v4 addObject:v11];

    __int16 v12 = [NSNumber numberWithUnsignedInteger:self->_resultsLimit];
    __int16 v13 = -[FCCKMultiFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]((uint64_t)self, @"hardLimit", @"hardResultsLimit", v12);
    [v4 addObject:v13];

    if (self->_sortingFunction == 1) {
      __int16 v14 = @"relativeNewness";
    }
    else {
      __int16 v14 = @"order";
    }
    __int16 v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"sortingFunction", v14];
    [v4 addObject:v15];

    int v16 = (void *)MEMORY[0x1E4F28F60];
    __int16 v17 = [NSNumber numberWithUnsignedInteger:self->_queryPriority];
    uint64_t v18 = [v16 predicateWithFormat:@"%K == %@", @"priority", v17];
    [v4 addObject:v18];

    if ([(NSArray *)self->_articleLinkKeys count])
    {
      uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"tagField", self->_articleLinkKeys];
      [v4 addObject:v19];
    }
    v20 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];
    v21 = (uint64_t (*)(uint64_t, uint64_t))[objc_alloc(MEMORY[0x1E4F1A2A0]) initWithRecordType:@"MultiFeed" predicate:v20];
  }
  else
  {
    v21 = 0;
  }
  v22 = (id)FCOperationLog;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = [(FCOperation *)self shortOperationDescription];
    v36 = (void *)v35;
    if (self) {
      unint64_t resultsLimit = self->_resultsLimit;
    }
    else {
      unint64_t resultsLimit = 0;
    }
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v35;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = resultsLimit;
    *(_WORD *)&buf[22] = 2112;
    v52 = v21;
    _os_log_debug_impl(&dword_1A460D000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ issuing query with results limit %lu: %@", buf, 0x20u);
  }
  v23 = objc_alloc_init(FCCKContentQueryOperation);
  uint64_t v24 = (uint64_t)v23;
  if (self)
  {
    -[FCCKContentQueryOperation setDatabase:]((uint64_t)v23, self->_database);
    -[FCCKContentQueryOperation setQuery:](v24, v21);
    if (v24) {
      *(void *)(v24 + 400) = self->_resultsLimit;
    }
    v25 = self->_desiredKeys;
    if (v25)
    {
      v27 = v25;
      v28 = self->_desiredKeys;
      if (qword_1E96597D0 != -1) {
        dispatch_once(&qword_1E96597D0, &__block_literal_global_75);
      }
      id v29 = (id)_MergedGlobals_29;
      v30 = [(NSArray *)v28 arrayByAddingObjectsFromArray:v29];

      if (v24)
      {
        objc_setProperty_nonatomic_copy((id)v24, v31, v30, 408);

        *(_DWORD *)(v24 + 372) = 11;
      }
      else
      {
      }
LABEL_30:
      unint64_t queryPriority = self->_queryPriority;
      if (!v24) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  else
  {
    -[FCCKContentQueryOperation setDatabase:]((uint64_t)v23, 0);
    -[FCCKContentQueryOperation setQuery:](v24, v21);
    if (!v24) {
      goto LABEL_29;
    }
    *(void *)(v24 + 400) = 0;
  }
  if (v24)
  {
    objc_setProperty_nonatomic_copy((id)v24, v26, 0, 408);
    *(_DWORD *)(v24 + 372) = 11;
  }
LABEL_29:
  if (self) {
    goto LABEL_30;
  }
  unint64_t queryPriority = 0;
  if (v24) {
LABEL_31:
  }
    *(void *)(v24 + 456) = queryPriority;
LABEL_32:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v52 = __Block_byref_object_copy__21;
  v53 = __Block_byref_object_dispose__21;
  id v54 = [MEMORY[0x1E4F1CA48] array];
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__21;
  v49[4] = __Block_byref_object_dispose__21;
  id v50 = [MEMORY[0x1E4F1CA48] array];
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__21;
  v47[4] = __Block_byref_object_dispose__21;
  id v48 = [MEMORY[0x1E4F1CA48] array];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__21;
  v45[4] = __Block_byref_object_dispose__21;
  id v46 = 0;
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __47__FCCKMultiFeedQueryOperation_performOperation__block_invoke;
  newValue[3] = &unk_1E5B503F0;
  newValue[4] = v45;
  newValue[5] = v49;
  newValue[6] = v47;
  newValue[7] = buf;
  if (v24) {
    objc_setProperty_nonatomic_copy((id)v24, v39, newValue, 416);
  }
  objc_initWeak(&location, (id)v24);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __47__FCCKMultiFeedQueryOperation_performOperation__block_invoke_2;
  v41[3] = &unk_1E5B50418;
  v41[4] = self;
  v41[5] = buf;
  v41[6] = v49;
  v41[7] = v45;
  v41[8] = v47;
  objc_copyWeak(&v42, &location);
  if (v24) {
    objc_setProperty_nonatomic_copy((id)v24, v40, v41, 424);
  }
  [(FCOperation *)self associateChildOperation:v24];
  [(id)v24 start];
  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(buf, 8);
}

void __47__FCCKMultiFeedQueryOperation_performOperation__block_invoke(void *a1, void *a2)
{
  id v11 = a2;
  v4 = [v11 recordType];
  int v5 = [v4 isEqualToString:@"Results"];

  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  }
  else
  {
    v6 = [v11 recordType];
    int v7 = [v6 isEqualToString:@"Tag"];

    if (v7)
    {
      uint64_t v8 = a1[5];
    }
    else
    {
      v9 = [v11 recordType];
      int v10 = [v9 isEqualToString:@"Issue"];

      if (v10) {
        uint64_t v8 = a1[6];
      }
      else {
        uint64_t v8 = a1[7];
      }
    }
    [*(id *)(*(void *)(v8 + 8) + 40) addObject:v11];
  }
}

void __47__FCCKMultiFeedQueryOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v186 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  int v7 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(void **)(a1 + 32);
    int v10 = v7;
    id v11 = [v9 shortOperationDescription];
    uint64_t v12 = a1;
    uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    uint64_t v14 = [*(id *)(*(void *)(*(void *)(v12 + 48) + 8) + 40) count];
    uint64_t v15 = *(void *)(*(void *)(*(void *)(v12 + 56) + 8) + 40);
    *(_DWORD *)buf = 138544130;
    v181 = v11;
    __int16 v182 = 2048;
    v183 = (char *)v13;
    a1 = v12;
    __int16 v184 = 2048;
    *(void *)v185 = v14;
    *(_WORD *)&v185[8] = 2112;
    *(void *)&v185[10] = v15;
    _os_log_debug_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ received response with %lu FeedItemAndArticleRecords, %lu TagRecords and Results record: %@", buf, 0x2Au);

    if (v6) {
      goto LABEL_3;
    }
  }
  else if (v6)
  {
LABEL_3:
    uint64_t v8 = FCErrorForCKError(v6);
    -[FCCKMultiFeedQueryOperation setResultError:](*(void *)(a1 + 32), v8);

    goto LABEL_109;
  }
  int v16 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v16)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v115 = (void *)[[NSString alloc] initWithFormat:@"must always have a Results record"];
      *(_DWORD *)buf = 136315906;
      v181 = "-[FCCKMultiFeedQueryOperation performOperation]_block_invoke";
      __int16 v182 = 2080;
      v183 = "FCCKMultiFeedQueryOperation.m";
      __int16 v184 = 1024;
      *(_DWORD *)v185 = 147;
      *(_WORD *)&v185[4] = 2114;
      *(void *)&v185[6] = v115;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      int v16 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    else
    {
      int v16 = 0;
    }
  }
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v20 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v21 = v16;
  id v136 = v18;
  id v142 = v18;
  id v137 = v19;
  id v140 = v19;
  id v138 = v20;
  id v139 = v20;
  uint64_t v149 = v17;
  if (v17)
  {
    id v135 = v5;
    v141 = [v21 objectForKeyedSubscript:@"droppedFeeds"];
    if ([v141 unsignedIntegerValue])
    {
      v22 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        uint64_t v24 = [(id)v149 shortOperationDescription];
        id v25 = v21;
        uint64_t v26 = a1;
        uint64_t v27 = [v141 unsignedIntegerValue];
        v28 = v6;
        id v29 = *(id *)(v149 + 376);
        uint64_t v30 = [v29 count];
        *(_DWORD *)buf = 138543874;
        v181 = v24;
        __int16 v182 = 2048;
        v183 = (char *)v27;
        a1 = v26;
        id v21 = v25;
        __int16 v184 = 2048;
        *(void *)v185 = v30;
        _os_log_impl(&dword_1A460D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ %lu of %lu feeds were dropped", buf, 0x20u);

        v6 = v28;
      }
    }
    uint64_t v133 = a1;
    uint64_t v148 = [MEMORY[0x1E4F1CA48] array];
    v31 = [v21 objectForKeyedSubscript:@"reachedMinOrder"];
    v147 = -[FCCKMultiFeedQueryOperation _feedRelativeDictionaryFromResultsArray:](v149, v31);

    uint64_t v32 = [v21 objectForKeyedSubscript:@"reachedEnd"];
    v146 = -[FCCKMultiFeedQueryOperation _feedRelativeDictionaryFromResultsArray:](v149, v32);

    v33 = [v21 objectForKeyedSubscript:@"cursor"];
    v145 = -[FCCKMultiFeedQueryOperation _feedRelativeDictionaryFromResultsArray:](v149, v33);

    v34 = [v21 objectForKeyedSubscript:@"topOrder"];
    v144 = -[FCCKMultiFeedQueryOperation _feedRelativeDictionaryFromResultsArray:](v149, v34);

    id v132 = v21;
    uint64_t v35 = [v21 objectForKeyedSubscript:@"feedDropped"];
    uint64_t v143 = -[FCCKMultiFeedQueryOperation _feedRelativeDictionaryFromResultsArray:](v149, v35);

    v36 = [MEMORY[0x1E4F1CA60] dictionary];
    v154 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    id obj = v142;
    uint64_t v37 = [obj countByEnumeratingWithState:&v160 objects:buf count:16];
    v155 = v36;
    v134 = v6;
    if (v37)
    {
      uint64_t v38 = v37;
      id v39 = 0;
      id v152 = *(id *)v161;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(id *)v161 != v152) {
            objc_enumerationMutation(obj);
          }
          v41 = *(void **)(*((void *)&v160 + 1) + 8 * i);
          id v42 = [v41 objectForKeyedSubscript:@"articleID"];

          if (!v42 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v53 = (void *)[[NSString alloc] initWithFormat:@"feedItemAndArticle must always have an ArticleID, this is a CloudKit issue please file a radar, record: %@", v41];
            *(_DWORD *)v172 = 136315906;
            v173 = "-[FCCKMultiFeedQueryOperation _processResultsRecord:feedItemAndArticleRecords:tagRecords:issueRecords:]";
            __int16 v174 = 2080;
            v175 = "FCCKMultiFeedQueryOperation.m";
            __int16 v176 = 1024;
            int v177 = 289;
            __int16 v178 = 2114;
            v179 = v53;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v172, 0x26u);
          }
          v43 = [v41 objectForKeyedSubscript:@"tagID"];

          if (!v43 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            id v54 = (void *)[[NSString alloc] initWithFormat:@"feedItemAndArticle must always have a FeedID (currently named TagID), this is a CloudKit issue please file a radar, record: %@", v41];
            *(_DWORD *)v172 = 136315906;
            v173 = "-[FCCKMultiFeedQueryOperation _processResultsRecord:feedItemAndArticleRecords:tagRecords:issueRecords:]";
            __int16 v174 = 2080;
            v175 = "FCCKMultiFeedQueryOperation.m";
            __int16 v176 = 1024;
            int v177 = 290;
            __int16 v178 = 2114;
            v179 = v54;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v172, 0x26u);
          }
          v44 = [v41 objectForKeyedSubscript:@"tagID"];
          v45 = [v36 objectForKeyedSubscript:v44];

          if (!v45)
          {
            id v46 = [MEMORY[0x1E4F1CA48] array];
            [v36 setObject:v46 forKeyedSubscript:v44];
          }
          v47 = [v36 objectForKeyedSubscript:v44];
          [v47 addObject:v41];

          id v48 = [v41 objectForKeyedSubscript:@"order"];
          v49 = [v154 objectForKeyedSubscript:v44];
          if (v49)
          {
            id v50 = [v154 objectForKeyedSubscript:v44];
            v51 = objc_msgSend(v50, "fc_smallerNumber:", v48);
            [v154 setObject:v51 forKeyedSubscript:v44];
          }
          else
          {
            [v154 setObject:v48 forKeyedSubscript:v44];
          }

          if (v39)
          {
            uint64_t v52 = objc_msgSend(v39, "fc_smallerNumber:", v48);

            id v39 = (id)v52;
          }
          else
          {
            id v39 = v48;
          }
          v36 = v155;
        }
        uint64_t v38 = [obj countByEnumeratingWithState:&v160 objects:buf count:16];
      }
      while (v38);
    }
    else
    {
      id v39 = 0;
    }

    long long v158 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    id v153 = *(id *)(v149 + 376);
    uint64_t v55 = [v153 countByEnumeratingWithState:&v156 objects:v172 count:16];
    v56 = (void *)v148;
    v57 = (void *)v143;
    if (v55)
    {
      uint64_t v58 = v55;
      uint64_t v59 = *(void *)v157;
      uint64_t v151 = *(void *)v157;
      do
      {
        uint64_t v60 = 0;
        do
        {
          if (*(void *)v157 != v59) {
            objc_enumerationMutation(v153);
          }
          uint64_t v61 = *(void *)(*((void *)&v156 + 1) + 8 * v60);
          v62 = objc_alloc_init(FCCKFeedResponse);
          if (v61) {
            v63 = *(void **)(v61 + 8);
          }
          else {
            v63 = 0;
          }
          id v65 = v63;
          if (v62) {
            objc_setProperty_nonatomic_copy(v62, v64, v65, 16);
          }

          if (v61) {
            v66 = *(void **)(v61 + 8);
          }
          else {
            v66 = 0;
          }
          id v67 = v66;
          v68 = [v57 objectForKeyedSubscript:v67];
          char v69 = [v68 BOOLValue];
          if (v62)
          {
            v62->_wasDropped = v69;

            if (v62->_wasDropped) {
              goto LABEL_90;
            }
            if (v61)
            {
LABEL_49:
              v70 = *(void **)(v61 + 8);
              goto LABEL_50;
            }
          }
          else
          {

            if (v61) {
              goto LABEL_49;
            }
          }
          v70 = 0;
LABEL_50:
          id v71 = v70;
          v72 = [v155 objectForKeyedSubscript:v71];

          if (v61) {
            v73 = *(void **)(v61 + 8);
          }
          else {
            v73 = 0;
          }
          id v74 = v73;
          v75 = [v144 objectForKeyedSubscript:v74];

          if (!v75 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v102 = (void *)[[NSString alloc] initWithFormat:@"topOrder should never be nil in 15E or later"];
            *(_DWORD *)v164 = 136315906;
            v165 = "-[FCCKMultiFeedQueryOperation _processResultsRecord:feedItemAndArticleRecords:tagRecords:issueRecords:]";
            __int16 v166 = 2080;
            v167 = "FCCKMultiFeedQueryOperation.m";
            __int16 v168 = 1024;
            int v169 = 317;
            __int16 v170 = 2114;
            v171 = v102;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v164, 0x26u);
          }
          v76 = [NSString stringWithFormat:@"@min.%@", @"order"];
          v77 = [v72 valueForKeyPath:v76];

          if (![v72 count])
          {
            id v78 = v75;

            v77 = v78;
          }
          if (v61) {
            v79 = *(void **)(v61 + 8);
          }
          else {
            v79 = 0;
          }
          id v80 = v79;
          v82 = [v155 objectForKeyedSubscript:v80];
          if (v62) {
            objc_setProperty_nonatomic_copy(v62, v81, v82, 24);
          }

          if (v61) {
            v83 = *(void **)(v61 + 8);
          }
          else {
            v83 = 0;
          }
          id v84 = v83;
          v85 = [v146 objectForKeyedSubscript:v84];
          char v86 = [v85 BOOLValue];
          if (v62) {
            v62->_reachedEnd = v86;
          }

          if (v61) {
            v87 = *(void **)(v61 + 8);
          }
          else {
            v87 = 0;
          }
          id v88 = v87;
          v89 = [v147 objectForKeyedSubscript:v88];
          char v90 = [v89 BOOLValue];
          if (v62)
          {
            v62->_reachedOrderLimit = v90;

            feedItemAndArticleRecords = v62->_feedItemAndArticleRecords;
          }
          else
          {

            feedItemAndArticleRecords = 0;
          }
          v92 = feedItemAndArticleRecords;
          if ([(NSArray *)v92 count])
          {
            uint64_t v93 = [v77 unsignedLongLongValue];
            if (!v62) {
              goto LABEL_72;
            }
LABEL_71:
            v62->_uint64_t extent = v93;
            goto LABEL_72;
          }
          uint64_t v93 = [v75 unsignedLongLongValue] + 1;
          if (v62) {
            goto LABEL_71;
          }
LABEL_72:

          if (v61) {
            v94 = *(void **)(v61 + 8);
          }
          else {
            v94 = 0;
          }
          id v95 = v94;
          v96 = [v145 objectForKeyedSubscript:v95];
          v98 = v96;
          if (v62)
          {
            objc_setProperty_nonatomic_copy(v62, v97, v96, 40);

            if (v62->_reachedEnd) {
              v62->_uint64_t extent = 0;
            }
          }
          else
          {
          }
          v56 = (void *)v148;
          if (*(void *)(v149 + 400) || !v39)
          {
            uint64_t v101 = [obj count];
            if (v62) {
              goto LABEL_85;
            }
          }
          else
          {
            uint64_t v99 = [v39 unsignedLongLongValue];
            if (v62)
            {
              if (v99 + 1 < v62->_extent) {
                uint64_t extent = v99 + 1;
              }
              else {
                uint64_t extent = v62->_extent;
              }
              v62->_uint64_t extent = extent;
              uint64_t v101 = [obj count];
LABEL_85:
              if (!v101 && !v62->_reachedEnd && !v62->_reachedOrderLimit) {
                *(_WORD *)&v62->_reachedEnd = 257;
              }
              goto LABEL_89;
            }
            [obj count];
          }
LABEL_89:

          v57 = (void *)v143;
          uint64_t v59 = v151;
LABEL_90:
          [v56 addObject:v62];

          ++v60;
        }
        while (v58 != v60);
        uint64_t v103 = [v153 countByEnumeratingWithState:&v156 objects:v172 count:16];
        uint64_t v58 = v103;
      }
      while (v103);
    }

    objc_storeStrong((id *)(v149 + 440), v136);
    objc_storeStrong((id *)(v149 + 464), v56);
    objc_storeStrong((id *)(v149 + 448), v137);
    objc_storeStrong((id *)(v149 + 456), v138);

    v6 = v134;
    id v5 = v135;
    id v21 = v132;
    a1 = v133;
  }

LABEL_109:
  v104 = *(void **)(a1 + 32);
  if (v104)
  {
    v105 = FCOperationLog;
    if (v104[59])
    {
      if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_122;
      }
      v106 = v105;
      v107 = [v104 shortOperationDescription];
      uint64_t v108 = a1;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      v110 = WeakRetained;
      v111 = v6;
      if (WeakRetained) {
        v112 = (void *)*((void *)WeakRetained + 54);
      }
      else {
        v112 = 0;
      }
      id v113 = v112;
      v114 = [v113 firstObject];
      *(_DWORD *)buf = 138543874;
      v181 = v107;
      __int16 v182 = 2114;
      v183 = v111;
      __int16 v184 = 2114;
      *(void *)v185 = v114;
      _os_log_error_impl(&dword_1A460D000, v106, OS_LOG_TYPE_ERROR, "%{public}@ query failed with error: %{public}@, request UUID: %{public}@", buf, 0x20u);

      v6 = v111;
      goto LABEL_121;
    }
  }
  else
  {
    v105 = FCOperationLog;
  }
  if (!os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_122;
  }
  v116 = v105;
  v117 = [v104 shortOperationDescription];
  uint64_t v108 = a1;
  id v118 = objc_loadWeakRetained((id *)(a1 + 72));
  v119 = v118;
  v120 = v6;
  if (v118) {
    v121 = (void *)*((void *)v118 + 54);
  }
  else {
    v121 = 0;
  }
  id v122 = v121;
  v123 = [v122 firstObject];
  *(_DWORD *)buf = 138543618;
  v181 = v117;
  __int16 v182 = 2114;
  v183 = v123;
  _os_log_impl(&dword_1A460D000, v116, OS_LOG_TYPE_DEFAULT, "%{public}@ query succeeded with request UUID: %{public}@", buf, 0x16u);

  v6 = v120;
LABEL_121:
  a1 = v108;
LABEL_122:
  id v124 = objc_loadWeakRetained((id *)(a1 + 72));
  v125 = v124;
  if (v124) {
    v126 = (void *)*((void *)v124 + 58);
  }
  else {
    v126 = 0;
  }
  id v128 = v126;
  v129 = *(void **)(a1 + 32);
  if (v129) {
    objc_setProperty_nonatomic_copy(v129, v127, v128, 432);
  }

  v130 = *(void **)(a1 + 32);
  if (v130) {
    uint64_t v131 = v130[59];
  }
  else {
    uint64_t v131 = 0;
  }
  [v130 finishedPerformingOperationWithError:v131];
}

- (void)setResultError:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 472), a2);
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
  -[FCCKMultiFeedQueryOperation setResultError:]((uint64_t)self, 0);
}

- (void)operationWillFinishWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = (NSError *)a3;
  id v5 = (id)FCOperationLog;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [(FCOperation *)self shortOperationDescription];
    if (self) {
      resultFeedResponses = self->_resultFeedResponses;
    }
    else {
      resultFeedResponses = 0;
    }
    uint64_t v15 = resultFeedResponses;
    int v16 = [(NSArray *)v15 description];
    int v17 = 138543618;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    v20 = v16;
    _os_log_debug_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ finished with feed responses: %@", (uint8_t *)&v17, 0x16u);
  }
  if (self)
  {
    id queryCompletionHandler = self->_queryCompletionHandler;
    if (queryCompletionHandler)
    {
      int v7 = (void (**)(id, NSArray *, NSArray *, NSArray *, NSArray *, NSError *))queryCompletionHandler;
      uint64_t v8 = self->_resultFeedItemAndArticleRecords;
      v9 = self->_resultFeedResponses;
      int v10 = self->_resultTagRecords;
      id v11 = self->_resultIssueRecords;
      if (self->_resultError) {
        resultError = self->_resultError;
      }
      else {
        resultError = v4;
      }
      v7[2](v7, v8, v9, v10, v11, resultError);
    }
  }
}

- (id)_predicateForPerFeedFieldName:(void *)a3 key:(void *)a4 defaultValue:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F1CA48] array];
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
    uint64_t v14 = MEMORY[0x1E4F14500];
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        int v16 = [*(id *)(*((void *)&v24 + 1) + 8 * v15) valueForKey:v7];
        if (v16)
        {
          int v17 = v9;
          id v18 = v16;
LABEL_10:
          [v17 addObject:v18];
          goto LABEL_11;
        }
        if (v8)
        {
          int v17 = v9;
          id v18 = v8;
          goto LABEL_10;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          __int16 v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "defaultValue");
          *(_DWORD *)buf = 136315906;
          id v29 = "-[FCCKMultiFeedQueryOperation _predicateForPerFeedFieldName:key:defaultValue:]";
          __int16 v30 = 2080;
          v31 = "FCCKMultiFeedQueryOperation.m";
          __int16 v32 = 1024;
          int v33 = 240;
          __int16 v34 = 2114;
          uint64_t v35 = v19;
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

  uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ CONTAINS %K", v9, v23];

  return v21;
}

uint64_t __44__FCCKMultiFeedQueryOperation__requiredKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"reachedMinOrder", @"reachedEnd", @"cursor", @"feedDropped", @"droppedFeeds", @"droppedItems", @"topOrder", @"articleID", @"tagID", @"order", 0);
  uint64_t v1 = _MergedGlobals_29;
  _MergedGlobals_29 = v0;
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
      uint64_t v13 = "-[FCCKMultiFeedQueryOperation _feedRelativeDictionaryFromResultsArray:]";
      __int16 v14 = 2080;
      uint64_t v15 = "FCCKMultiFeedQueryOperation.m";
      __int16 v16 = 1024;
      int v17 = 361;
      __int16 v18 = 2114;
      __int16 v19 = v8;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v3 count])
  {
    v6 = *(void **)(a1 + 376);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__FCCKMultiFeedQueryOperation__feedRelativeDictionaryFromResultsArray___block_invoke;
    v9[3] = &unk_1E5B50440;
    id v10 = v3;
    id v11 = v5;
    [v6 enumerateObjectsUsingBlock:v9];
  }
  return v5;
}

void __71__FCCKMultiFeedQueryOperation__feedRelativeDictionaryFromResultsArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id v5 = [*(id *)(a1 + 32) objectAtIndex:a3];
  if (v7) {
    uint64_t v6 = v7[1];
  }
  else {
    uint64_t v6 = 0;
  }
  [*(id *)(a1 + 40) setObject:v5 forKey:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong((id *)&self->_resultFeedResponses, 0);
  objc_storeStrong((id *)&self->_resultIssueRecords, 0);
  objc_storeStrong((id *)&self->_resultTagRecords, 0);
  objc_storeStrong((id *)&self->_resultFeedItemAndArticleRecords, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong(&self->_queryCompletionHandler, 0);
  objc_storeStrong((id *)&self->_articleLinkKeys, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_feedRequests, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end