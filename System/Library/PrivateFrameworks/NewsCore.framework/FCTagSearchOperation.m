@interface FCTagSearchOperation
- (BOOL)validateOperation;
- (FCAssetManager)assetManager;
- (FCCKContentDatabase)contentDatabase;
- (FCContentContext)contentContext;
- (FCStreamingResults)searchResults;
- (FCTagRecordSource)tagRecordSource;
- (NSError)searchError;
- (NSString)searchString;
- (id)_establishStreamOfTags;
- (id)_localIdentifier;
- (id)searchResultsBlock;
- (unint64_t)batchSize;
- (unint64_t)tagType;
- (void)_performSearchQuery:(id)a3;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)setAssetManager:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setContentContext:(id)a3;
- (void)setContentDatabase:(id)a3;
- (void)setSearchError:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)setSearchResultsBlock:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setTagRecordSource:(id)a3;
- (void)setTagType:(unint64_t)a3;
@end

@implementation FCTagSearchOperation

- (BOOL)validateOperation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(FCTagSearchOperation *)self contentContext];

  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)[[NSString alloc] initWithFormat:@"tag search operation requires a content context"];
    int v8 = 136315906;
    v9 = "-[FCTagSearchOperation validateOperation]";
    __int16 v10 = 2080;
    v11 = "FCTagSearchOperation.m";
    __int16 v12 = 1024;
    int v13 = 58;
    __int16 v14 = 2114;
    v15 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
  }
  if ([(FCTagSearchOperation *)self tagType] == 2 || [(FCTagSearchOperation *)self tagType] == 1)
  {
    BOOL v4 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)[[NSString alloc] initWithFormat:@"tag search operation requires a channel or topic tag type"];
      int v8 = 136315906;
      v9 = "-[FCTagSearchOperation validateOperation]";
      __int16 v10 = 2080;
      v11 = "FCTagSearchOperation.m";
      __int16 v12 = 1024;
      int v13 = 62;
      __int16 v14 = 2114;
      v15 = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
    }
    BOOL v4 = 0;
  }
  return v3 && v4;
}

- (void)prepareOperation
{
  v3 = [(FCTagSearchOperation *)self contentContext];
  BOOL v4 = [v3 internalContentContext];
  v5 = [v4 tagRecordSource];
  [(FCTagSearchOperation *)self setTagRecordSource:v5];

  v6 = [(FCTagSearchOperation *)self contentContext];
  v7 = [v6 internalContentContext];
  int v8 = [v7 contentDatabase];
  [(FCTagSearchOperation *)self setContentDatabase:v8];

  id v10 = [(FCTagSearchOperation *)self contentContext];
  v9 = [v10 assetManager];
  [(FCTagSearchOperation *)self setAssetManager:v9];
}

- (void)performOperation
{
  v3 = [(FCTagSearchOperation *)self searchString];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__FCTagSearchOperation_performOperation__block_invoke;
    v5[3] = &unk_1E5B5A270;
    v5[4] = self;
    [(FCTagSearchOperation *)self _performSearchQuery:v5];
  }
  else
  {
    [(FCOperation *)self finishedPerformingOperationWithError:0];
  }
}

void __40__FCTagSearchOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setSearchResults:a2];
  [*(id *)(a1 + 32) setSearchError:v6];
  [*(id *)(a1 + 32) finishedPerformingOperationWithError:v6];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(FCTagSearchOperation *)self searchResultsBlock];

  if (v4)
  {
    v5 = [(FCTagSearchOperation *)self searchResultsBlock];
    id v6 = [(FCTagSearchOperation *)self searchResults];
    v7 = [(FCTagSearchOperation *)self searchError];
    if (v7) {
      id v8 = v7;
    }
    else {
      id v8 = v9;
    }
    ((void (**)(void, void *, id))v5)[2](v5, v6, v8);
  }
}

- (void)_performSearchQuery:(id)a3
{
  id v4 = a3;
  v5 = [(FCTagSearchOperation *)self _establishStreamOfTags];
  unint64_t v6 = [(FCTagSearchOperation *)self batchSize];
  uint64_t v7 = [(FCTagSearchOperation *)self qualityOfService];
  id v8 = FCDispatchQueueForQualityOfService([(FCTagSearchOperation *)self qualityOfService]);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  __int16 v14 = __44__FCTagSearchOperation__performSearchQuery___block_invoke;
  v15 = &unk_1E5B51660;
  id v16 = v5;
  id v17 = v4;
  id v9 = v5;
  id v10 = v4;
  v11 = [v9 fetchMoreResultsWithLimit:v6 qualityOfService:v7 callbackQueue:v8 completionHandler:&v12];

  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v11, v12, v13, v14, v15);
}

void __44__FCTagSearchOperation__performSearchQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  unint64_t v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "fc_isCancellationError");
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v7 = [[FCStreamingResults alloc] initWithResults:v8 followedByStream:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_localIdentifier
{
  v2 = NSString;
  v3 = +[FCAppleAccount sharedAccount];
  id v4 = [v3 primaryLanguageCode];
  id v5 = +[FCAppleAccount sharedAccount];
  unint64_t v6 = [v5 contentStoreFrontID];
  uint64_t v7 = [v2 stringWithFormat:@"%@_%@", v4, v6];

  return v7;
}

- (id)_establishStreamOfTags
{
  v3 = objc_alloc_init(FCTagSearchRecordStream);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__FCTagSearchOperation__establishStreamOfTags__block_invoke;
  v11[3] = &unk_1E5B5A298;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  [(FCTagSearchRecordStream *)v3 setOperationConstructor:v11];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__69;
  v9[4] = __Block_byref_object_dispose__69;
  id v10 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [FCTransformedResultsStream alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__FCTagSearchOperation__establishStreamOfTags__block_invoke_21;
  v7[3] = &unk_1E5B5A310;
  objc_copyWeak(&v8, &location);
  v7[4] = v9;
  id v5 = [(FCTransformedResultsStream *)v4 initWithStream:v3 asyncTransformBlock:v7];
  objc_destroyWeak(&v8);
  _Block_object_dispose(v9, 8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v5;
}

FCCKTagSearchQueryOperation *__46__FCTagSearchOperation__establishStreamOfTags__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v4 = (FCCKTagSearchQueryOperation *)objc_loadWeakRetained(&to);

  if (v4)
  {
    id v4 = objc_alloc_init(FCCKTagSearchQueryOperation);
    id v5 = objc_loadWeakRetained(&to);
    unint64_t v6 = [v5 contentDatabase];
    -[FCCKTagSearchQueryOperation setDatabase:]((uint64_t)v4, v6);

    id v7 = objc_loadWeakRetained(&to);
    id v8 = [v7 tagRecordSource];
    id v10 = [v8 desiredKeys];
    if (v4) {
      objc_setProperty_nonatomic_copy(v4, v9, v10, 408);
    }

    id v11 = objc_loadWeakRetained(&to);
    uint64_t v13 = [v11 searchString];
    if (v4) {
      objc_setProperty_nonatomic_copy(v4, v12, v13, 384);
    }

    id v14 = objc_loadWeakRetained(&to);
    uint64_t v15 = [v14 tagType];
    if (v4)
    {
      uint64_t v16 = 1;
      if (v15 != 1) {
        uint64_t v16 = 2;
      }
      v4->_tagType = v16;
    }

    v18 = [*(id *)(a1 + 32) _localIdentifier];
    if (v4) {
      objc_setProperty_nonatomic_copy(v4, v17, v18, 416);
    }

    -[FCCKTagSearchQueryOperation setCursor:]((uint64_t)v4, v3);
    id v19 = objc_loadWeakRetained(&to);
    uint64_t v20 = [v19 batchSize];
    if (v4) {
      v4->_resultsLimit = v20;
    }
  }
  objc_destroyWeak(&to);

  return v4;
}

void __46__FCTagSearchOperation__establishStreamOfTags__block_invoke_21(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v8 = objc_loadWeakRetained(&to);

  if (v8)
  {
    id v9 = objc_loadWeakRetained(&to);
    id v10 = [v9 tagRecordSource];
    id v11 = [v10 saveTagRecords:v6];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __46__FCTagSearchOperation__establishStreamOfTags__block_invoke_3;
    v23[3] = &unk_1E5B5A2C0;
    objc_copyWeak(&v24, &to);
    id v12 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v23);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __46__FCTagSearchOperation__establishStreamOfTags__block_invoke_4;
    uint64_t v20 = &unk_1E5B5A2E8;
    objc_copyWeak(&v22, (id *)(a1 + 40));
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v13 = [v11 transformRecordsInOrder:v12 withBlock:&v17];
    id v14 = objc_loadWeakRetained(&to);
    uint64_t v15 = objc_msgSend(v14, "contentContext", v17, v18, v19, v20);
    uint64_t v16 = [v15 tagController];
    [v16 saveTagsToCache:v13];

    v7[2](v7, v13);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&v24);
  }
  objc_destroyWeak(&to);
}

id __46__FCTagSearchOperation__establishStreamOfTags__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained tagRecordSource];
  id v6 = [(id)objc_opt_class() identifierFromCKRecord:v3];

  return v6;
}

FCTag *__46__FCTagSearchOperation__establishStreamOfTags__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v7 = objc_loadWeakRetained(&to);

  if (v7)
  {
    id v8 = [FCTag alloc];
    id v9 = objc_loadWeakRetained(&to);
    id v10 = [v9 assetManager];
    id v11 = [(FCTag *)v8 initWithTagRecord:v5 assetManager:v10 interestToken:v6];

    if (+[FCTagController isTagAllowed:v11]
      && (id v12 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40),
          [(FCTag *)v11 name],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v12) = [v12 containsObject:v13],
          v13,
          (v12 & 1) == 0))
    {
      uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v16 = [(FCTag *)v11 name];
      [v15 addObject:v16];

      id v14 = v11;
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }
  objc_destroyWeak(&to);

  return v14;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (unint64_t)tagType
{
  return self->_tagType;
}

- (void)setTagType:(unint64_t)a3
{
  self->_tagType = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (id)searchResultsBlock
{
  return objc_getProperty(self, a2, 400, 1);
}

- (void)setSearchResultsBlock:(id)a3
{
}

- (FCTagRecordSource)tagRecordSource
{
  return self->_tagRecordSource;
}

- (void)setTagRecordSource:(id)a3
{
}

- (FCCKContentDatabase)contentDatabase
{
  return self->_contentDatabase;
}

- (void)setContentDatabase:(id)a3
{
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (FCStreamingResults)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
}

- (NSError)searchError
{
  return self->_searchError;
}

- (void)setSearchError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchError, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_contentDatabase, 0);
  objc_storeStrong((id *)&self->_tagRecordSource, 0);
  objc_storeStrong(&self->_searchResultsBlock, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end