@interface FCCKTagSearchQueryOperation
- (BOOL)validateOperation;
- (id)_constructTagSearchQuery;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)resetForRetry;
- (void)setCursor:(uint64_t)a1;
- (void)setDatabase:(uint64_t)a1;
- (void)setResultCursor:(uint64_t)a1;
- (void)setResultError:(uint64_t)a1;
- (void)setResultRecords:(uint64_t)a1;
@end

@implementation FCCKTagSearchQueryOperation

- (BOOL)validateOperation
{
  v2 = self;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self || !self->_database)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)[[NSString alloc] initWithFormat:@"tag search query must have a database"];
      int v9 = 136315906;
      v10 = "-[FCCKTagSearchQueryOperation validateOperation]";
      __int16 v11 = 2080;
      v12 = "FCCKTagSearchQueryOperation.m";
      __int16 v13 = 1024;
      int v14 = 45;
      __int16 v15 = 2114;
      v16 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

      if (!v2) {
        goto LABEL_6;
      }
    }
    else if (!v2)
    {
      goto LABEL_6;
    }
  }
  if (v2->_searchString) {
    goto LABEL_8;
  }
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)[[NSString alloc] initWithFormat:@"tag search query must have a non-nil search string"];
    int v9 = 136315906;
    v10 = "-[FCCKTagSearchQueryOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCCKTagSearchQueryOperation.m";
    __int16 v13 = 1024;
    int v14 = 46;
    __int16 v15 = 2114;
    v16 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    if (v2)
    {
LABEL_8:
      if (v2->_tagType) {
        goto LABEL_11;
      }
    }
  }
  else if (v2)
  {
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"tag search query must have a known tag type"];
    int v9 = 136315906;
    v10 = "-[FCCKTagSearchQueryOperation validateOperation]";
    __int16 v11 = 2080;
    v12 = "FCCKTagSearchQueryOperation.m";
    __int16 v13 = 1024;
    int v14 = 47;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    if (!v2)
    {
LABEL_12:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)[[NSString alloc] initWithFormat:@"tag search query must have a non-zero results limit"];
        int v9 = 136315906;
        v10 = "-[FCCKTagSearchQueryOperation validateOperation]";
        __int16 v11 = 2080;
        v12 = "FCCKTagSearchQueryOperation.m";
        __int16 v13 = 1024;
        int v14 = 48;
        __int16 v15 = 2114;
        v16 = v8;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

        if (v2) {
          goto LABEL_14;
        }
      }
      else if (v2)
      {
        goto LABEL_14;
      }
      v3 = 0;
      goto LABEL_18;
    }
  }
  else if (!v2)
  {
    goto LABEL_12;
  }
LABEL_11:
  if (!v2->_resultsLimit) {
    goto LABEL_12;
  }
LABEL_14:
  v3 = v2->_database;
  LOBYTE(v2) = v3 && v2->_tagType && v2->_resultsLimit != 0;
LABEL_18:

  return (char)v2;
}

- (void)prepareOperation
{
  if (self)
  {
    int64_t tagType = self->_tagType;
    if (tagType == 1)
    {
      v3 = @"topics";
    }
    else
    {
      if (tagType != 2) {
        return;
      }
      v3 = @"channels";
    }
    objc_storeStrong((id *)&self->_tagTypeString, v3);
  }
}

- (void)performOperation
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = (id)FCOperationLog;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = [(FCOperation *)self shortOperationDescription];
    v24 = (void *)v23;
    if (self) {
      searchString = self->_searchString;
    }
    else {
      searchString = 0;
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = searchString;
    _os_log_debug_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ started with search string: %@", buf, 0x16u);
  }
  v4 = objc_alloc_init(FCCKContentQueryOperation);
  uint64_t v5 = (uint64_t)v4;
  if (!self)
  {
    -[FCCKContentQueryOperation setDatabase:]((uint64_t)v4, 0);
    -[FCCKContentQueryOperation setQuery:](v5, 0);
    -[FCCKContentQueryOperation setCursor:](v5, 0);
    if (v5)
    {
      desiredKeys = 0;
      *(void *)(v5 + 400) = 0;
      goto LABEL_5;
    }
LABEL_30:
    [(FCOperation *)self relativePriority];
    v12 = 0;
    char v10 = 1;
    goto LABEL_10;
  }
  -[FCCKContentQueryOperation setDatabase:]((uint64_t)v4, self->_database);
  v6 = -[FCCKTagSearchQueryOperation _constructTagSearchQuery]((id *)&self->super.super.super.isa);
  -[FCCKContentQueryOperation setQuery:](v5, v6);

  -[FCCKContentQueryOperation setCursor:](v5, self->_cursor);
  if (!v5) {
    goto LABEL_30;
  }
  *(void *)(v5 + 400) = self->_resultsLimit;
  desiredKeys = self->_desiredKeys;
LABEL_5:
  objc_setProperty_nonatomic_copy((id)v5, v7, desiredKeys, 408);
  *(_DWORD *)(v5 + 372) = 13;
  int64_t v9 = [(FCOperation *)self relativePriority];
  char v10 = 0;
  uint64_t v11 = 300;
  if (!v9) {
    uint64_t v11 = 200;
  }
  if (v9 == -1) {
    uint64_t v11 = 100;
  }
  *(void *)(v5 + 456) = v11;
  v12 = *(void **)(v5 + 384);
LABEL_10:
  id v13 = v12;
  BOOL v14 = v13 == 0;

  __int16 v15 = (id)FCOperationLog;
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (!v14)
  {
    if (!v16) {
      goto LABEL_17;
    }
    uint64_t v17 = [(FCOperation *)self shortOperationDescription];
    if (self)
    {
      unint64_t resultsLimit = self->_resultsLimit;
      if ((v10 & 1) == 0)
      {
LABEL_14:
        v19 = *(void **)(v5 + 384);
LABEL_15:
        v20 = v19;
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = resultsLimit;
        *(_WORD *)&buf[22] = 2112;
        v34 = v20;
        _os_log_debug_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ issuing query with results limit %lu: %@", buf, 0x20u);

        goto LABEL_17;
      }
    }
    else
    {
      unint64_t resultsLimit = 0;
      if ((v10 & 1) == 0) {
        goto LABEL_14;
      }
    }
    v19 = 0;
    goto LABEL_15;
  }
  if (v16)
  {
    uint64_t v26 = [(FCOperation *)self shortOperationDescription];
    v27 = (void *)v26;
    if (self) {
      unint64_t v28 = self->_resultsLimit;
    }
    else {
      unint64_t v28 = 0;
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v26;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v28;
    _os_log_debug_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ issuing query from cursor with results limit %lu", buf, 0x16u);
  }
LABEL_17:

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy__48;
  v35 = __Block_byref_object_dispose__48;
  id v36 = [MEMORY[0x1E4F1CA48] array];
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __47__FCCKTagSearchQueryOperation_performOperation__block_invoke;
  newValue[3] = &unk_1E5B57070;
  newValue[4] = buf;
  if ((v10 & 1) == 0) {
    objc_setProperty_nonatomic_copy((id)v5, v21, newValue, 416);
  }
  objc_initWeak(&location, (id)v5);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __47__FCCKTagSearchQueryOperation_performOperation__block_invoke_2;
  v29[3] = &unk_1E5B57098;
  v29[4] = self;
  v29[5] = buf;
  objc_copyWeak(&v30, &location);
  if ((v10 & 1) == 0) {
    objc_setProperty_nonatomic_copy((id)v5, v22, v29, 424);
  }
  [(FCOperation *)self associateChildOperation:v5];
  [(id)v5 start];
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

- (id)_constructTagSearchQuery
{
  v1 = a1;
  v23[1] = *(id *)MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA48] array];
    v3 = (void *)MEMORY[0x1E4F28F60];
    v23[0] = v1[48];
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = v23[0];
    v6 = [v4 arrayWithObjects:v23 count:1];

    v7 = [v3 predicateWithFormat:@"%@ CONTAINS %K", v6, @"query"];

    [v2 addObject:v7];
    v8 = (void *)MEMORY[0x1E4F28F60];
    id v22 = v1[54];
    int64_t v9 = (void *)MEMORY[0x1E4F1C978];
    id v10 = v22;
    uint64_t v11 = [v9 arrayWithObjects:&v22 count:1];

    v12 = [v8 predicateWithFormat:@"%@ CONTAINS %K", v11, @"queryNames"];

    [v2 addObject:v12];
    id v13 = v1[52];
    if (v13)
    {
      BOOL v14 = (void *)MEMORY[0x1E4F28F60];
      v21 = v13;
      __int16 v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = v13;
      uint64_t v17 = [v15 arrayWithObjects:&v21 count:1];

      v18 = [v14 predicateWithFormat:@"%@ CONTAINS %K", v17, @"locale", v21];

      [v2 addObject:v18];
    }
    v19 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v2];
    v1 = (id *)[objc_alloc(MEMORY[0x1E4F1A2A0]) initWithRecordType:@"TagSearch" predicate:v19];
  }
  return v1;
}

uint64_t __47__FCCKTagSearchQueryOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

void __47__FCCKTagSearchQueryOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEBUG))
  {
    v18 = *(void **)(a1 + 32);
    v19 = v7;
    v20 = [v18 shortOperationDescription];
    uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    id v22 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v27 = 138543874;
    unint64_t v28 = v20;
    __int16 v29 = 2048;
    uint64_t v30 = v21;
    __int16 v31 = 2112;
    v32 = v22;
    _os_log_debug_impl(&dword_1A460D000, v19, OS_LOG_TYPE_DEBUG, "%{public}@ received response with %lu Tag records: %@", (uint8_t *)&v27, 0x20u);
  }
  v8 = FCErrorForCKError(v6);
  -[FCCKTagSearchQueryOperation setResultError:](*(void *)(a1 + 32), v8);

  int64_t v9 = *(void **)(a1 + 32);
  if (v9)
  {
    id v10 = FCOperationLog;
    if (v9[57])
    {
      if (!os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      uint64_t v11 = v10;
      v12 = [v9 shortOperationDescription];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      BOOL v14 = WeakRetained;
      if (WeakRetained) {
        __int16 v15 = (void *)*((void *)WeakRetained + 54);
      }
      else {
        __int16 v15 = 0;
      }
      id v16 = v15;
      uint64_t v17 = [v16 firstObject];
      int v27 = 138543874;
      unint64_t v28 = v12;
      __int16 v29 = 2114;
      uint64_t v30 = (uint64_t)v6;
      __int16 v31 = 2114;
      v32 = v17;
      _os_log_error_impl(&dword_1A460D000, v11, OS_LOG_TYPE_ERROR, "%{public}@ query failed with error: %{public}@, request UUID: %{public}@", (uint8_t *)&v27, 0x20u);
      goto LABEL_14;
    }
  }
  else
  {
    id v10 = FCOperationLog;
  }
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_15;
  }
  uint64_t v11 = v10;
  v12 = [v9 shortOperationDescription];
  id v23 = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v14 = v23;
  if (v23) {
    v24 = (void *)*((void *)v23 + 54);
  }
  else {
    v24 = 0;
  }
  id v16 = v24;
  uint64_t v17 = [v16 firstObject];
  int v27 = 138543618;
  unint64_t v28 = v12;
  __int16 v29 = 2112;
  uint64_t v30 = (uint64_t)v17;
  _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ query succeeded with request UUID: %@", (uint8_t *)&v27, 0x16u);
LABEL_14:

LABEL_15:
  -[FCCKTagSearchQueryOperation setResultRecords:](*(void *)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  -[FCCKTagSearchQueryOperation setResultCursor:](*(void *)(a1 + 32), v5);
  v25 = *(void **)(a1 + 32);
  if (v25) {
    uint64_t v26 = v25[57];
  }
  else {
    uint64_t v26 = 0;
  }
  [v25 finishedPerformingOperationWithError:v26];
}

- (void)setResultError:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 456), a2);
  }
}

- (void)setResultRecords:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 440), a2);
  }
}

- (void)setResultCursor:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 448), a2);
  }
}

- (void)resetForRetry
{
  -[FCCKTagSearchQueryOperation setResultRecords:]((uint64_t)self, 0);
  -[FCCKTagSearchQueryOperation setResultCursor:]((uint64_t)self, 0);
  -[FCCKTagSearchQueryOperation setResultError:]((uint64_t)self, 0);
}

- (void)operationWillFinishWithError:(id)a3
{
  int64_t v9 = (NSError *)a3;
  if (self)
  {
    id queryCompletionHandler = self->_queryCompletionHandler;
    if (queryCompletionHandler)
    {
      id v5 = (void (**)(id, NSArray *, CKQueryCursor *, NSError *))queryCompletionHandler;
      id v6 = self->_resultRecords;
      v7 = self->_resultCursor;
      if (self->_resultError) {
        resultError = self->_resultError;
      }
      else {
        resultError = v9;
      }
      v5[2](v5, v6, v7, resultError);
    }
  }
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 368), a2);
  }
}

- (void)setCursor:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 400), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong((id *)&self->_resultCursor, 0);
  objc_storeStrong((id *)&self->_resultRecords, 0);
  objc_storeStrong((id *)&self->_tagTypeString, 0);
  objc_storeStrong(&self->_queryCompletionHandler, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end