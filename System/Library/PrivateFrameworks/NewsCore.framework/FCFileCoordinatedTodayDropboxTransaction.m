@interface FCFileCoordinatedTodayDropboxTransaction
+ (id)collapsedTransactionOfTransactions:(id)a3;
+ (id)transactionOfIdentity;
+ (id)transactionToClearSeenArticles;
+ (id)transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:(id)a3 deletedArticleIDs:(id)a4;
+ (void)_mergeItem:(id)a3 intoItem:(id)a4;
- (FCFileCoordinatedTodayDropboxTransaction)init;
- (FCFileCoordinatedTodayDropboxTransaction)initWithTransactionType:(unint64_t)a3 insertedOrUpdatedHistoryItems:(id)a4 deletedArticleIDs:(id)a5;
- (NSArray)insertedOrUpdatedHistoryItems;
- (NSSet)deletedArticleIDs;
- (id)todayPrivateDataAccessor;
- (unint64_t)transactionType;
- (void)_mergeItem:(id)a3 intoItem:(id)a4;
- (void)setDeletedArticleIDs:(id)a3;
- (void)setInsertedOrUpdatedHistoryItems:(id)a3;
- (void)setTransactionType:(unint64_t)a3;
@end

@implementation FCFileCoordinatedTodayDropboxTransaction

+ (id)transactionOfIdentity
{
  v3 = objc_opt_new();
  v4 = [a1 transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:MEMORY[0x1E4F1CBF0] deletedArticleIDs:v3];

  return v4;
}

+ (id)transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:(id)a3 deletedArticleIDs:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "insertedOrUpdatedHistoryItems");
    *(_DWORD *)buf = 136315906;
    v12 = "+[FCFileCoordinatedTodayDropboxTransaction transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:de"
          "letedArticleIDs:]";
    __int16 v13 = 2080;
    v14 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v15 = 1024;
    int v16 = 390;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "deletedArticleIDs");
    *(_DWORD *)buf = 136315906;
    v12 = "+[FCFileCoordinatedTodayDropboxTransaction transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:de"
          "letedArticleIDs:]";
    __int16 v13 = 2080;
    v14 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v15 = 1024;
    int v16 = 391;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTransactionType:0 insertedOrUpdatedHistoryItems:v5 deletedArticleIDs:v6];

  return v7;
}

- (FCFileCoordinatedTodayDropboxTransaction)initWithTransactionType:(unint64_t)a3 insertedOrUpdatedHistoryItems:(id)a4 deletedArticleIDs:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FCFileCoordinatedTodayDropboxTransaction;
  v10 = [(FCFileCoordinatedTodayDropboxTransaction *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_transactionType = a3;
    uint64_t v12 = [v8 copy];
    insertedOrUpdatedHistoryItems = v11->_insertedOrUpdatedHistoryItems;
    v11->_insertedOrUpdatedHistoryItems = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    deletedArticleIDs = v11->_deletedArticleIDs;
    v11->_deletedArticleIDs = (NSSet *)v14;
  }
  return v11;
}

- (FCFileCoordinatedTodayDropboxTransaction)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCFileCoordinatedTodayDropboxTransaction init]";
    __int16 v9 = 2080;
    v10 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v11 = 1024;
    int v12 = 359;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFileCoordinatedTodayDropboxTransaction init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (id)transactionToClearSeenArticles
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTransactionType:1 insertedOrUpdatedHistoryItems:0 deletedArticleIDs:0];
  return v2;
}

+ (id)collapsedTransactionOfTransactions:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v55 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v48 = v3;
  obuint64_t j = (id)[v3 copy];
  uint64_t v5 = [obj countByEnumeratingWithState:&v64 objects:v78 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v65;
    uint64_t v49 = *(void *)v65;
    do
    {
      uint64_t v9 = 0;
      uint64_t v50 = v6;
      do
      {
        if (*(void *)v65 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v64 + 1) + 8 * v9);
        uint64_t v11 = [v10 transactionType];
        uint64_t v12 = v11;
        if (v11)
        {
          if (v11 == 1)
          {
            [v55 removeAllObjects];
            [v7 removeAllObjects];
            [v4 removeAllObjects];
          }
        }
        else
        {
          uint64_t v52 = v9;
          __int16 v13 = [v10 deletedArticleIDs];
          uint64_t v14 = [v13 count];

          if (v14)
          {
            uint64_t v15 = [v10 deletedArticleIDs];
            int v16 = v15;
            if (v7)
            {
              [v7 unionSet:v15];

              objc_super v17 = [v10 deletedArticleIDs];
              [v55 minusSet:v17];

              int v16 = [v10 deletedArticleIDs];
              v18 = [v16 allObjects];
              [v4 removeObjectsForKeys:v18];
            }
            else
            {
              v7 = (void *)[v15 mutableCopy];
            }
          }
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          uint64_t v19 = [v10 insertedOrUpdatedHistoryItems];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v60 objects:v77 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v61;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v61 != v22) {
                  objc_enumerationMutation(v19);
                }
                v24 = *(void **)(*((void *)&v60 + 1) + 8 * i);
                v25 = [v24 articleID];
                if (v25)
                {
                  [v7 removeObject:v25];
                  [v55 addObject:v25];
                  v26 = [v4 objectForKeyedSubscript:v25];
                  if (v26)
                  {
                    FCCheckedProtocolCast((uint64_t)&unk_1EF9333E0, v26);
                    v27 = v4;
                    v29 = v28 = v7;
                    [a1 _mergeItem:v24 intoItem:v29];

                    v7 = v28;
                    uint64_t v4 = v27;
                  }
                  else
                  {
                    [v4 setObject:v24 forKeyedSubscript:v25];
                  }
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v60 objects:v77 count:16];
            }
            while (v21);
          }

          uint64_t v9 = v52;
          uint64_t v12 = 0;
          uint64_t v8 = v49;
          uint64_t v6 = v50;
        }
        ++v9;
      }
      while (v9 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v64 objects:v78 count:16];
    }
    while (v6);
    uint64_t v53 = v12;
  }
  else
  {
    v7 = 0;
    uint64_t v53 = 1;
  }

  v30 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v55, "count"));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v31 = v55;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v56 objects:v76 count:16];
  v33 = v7;
  if (v32)
  {
    uint64_t v34 = v32;
    uint64_t v35 = *(void *)v57;
    v36 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v57 != v35) {
          objc_enumerationMutation(v31);
        }
        v38 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v56 + 1) + 8 * j)];
        if (v38)
        {
          [v30 addObject:v38];
        }
        else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v39 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "existingItem");
          *(_DWORD *)buf = 136315906;
          v69 = "+[FCFileCoordinatedTodayDropboxTransaction collapsedTransactionOfTransactions:]";
          __int16 v70 = 2080;
          v71 = "FCFileCoordinatedTodayDropbox.m";
          __int16 v72 = 1024;
          int v73 = 493;
          __int16 v74 = 2114;
          v75 = v39;
          _os_log_error_impl(&dword_1A460D000, v36, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          v7 = v33;
        }
      }
      uint64_t v34 = [v31 countByEnumeratingWithState:&v56 objects:v76 count:16];
    }
    while (v34);
  }

  v40 = (void *)[v7 copy];
  v41 = v40;
  if (v40)
  {
    id v42 = v40;
  }
  else
  {
    id v42 = [MEMORY[0x1E4F1CAD0] set];
  }
  v43 = v42;

  v44 = [FCFileCoordinatedTodayDropboxTransaction alloc];
  v45 = (void *)[v30 copy];
  v46 = [(FCFileCoordinatedTodayDropboxTransaction *)v44 initWithTransactionType:v53 insertedOrUpdatedHistoryItems:v45 deletedArticleIDs:v43];

  return v46;
}

- (id)todayPrivateDataAccessor
{
  unint64_t v3 = [(FCFileCoordinatedTodayDropboxTransaction *)self transactionType];
  if (v3 == 1)
  {
    v10 = &__block_literal_global_367;
  }
  else if (v3)
  {
    v10 = 0;
  }
  else
  {
    uint64_t v4 = [(FCFileCoordinatedTodayDropboxTransaction *)self insertedOrUpdatedHistoryItems];
    uint64_t v5 = (void *)[v4 copy];

    uint64_t v6 = [(FCFileCoordinatedTodayDropboxTransaction *)self deletedArticleIDs];
    v7 = (void *)[v6 copy];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__FCFileCoordinatedTodayDropboxTransaction_todayPrivateDataAccessor__block_invoke;
    aBlock[3] = &unk_1E5B4DE90;
    id v14 = v5;
    uint64_t v15 = self;
    id v16 = v7;
    id v8 = v7;
    id v9 = v5;
    v10 = _Block_copy(aBlock);
  }
  uint64_t v11 = _Block_copy(v10);

  return v11;
}

void __68__FCFileCoordinatedTodayDropboxTransaction_todayPrivateDataAccessor__block_invoke(id *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  id v26 = v3;
  uint64_t v5 = [v3 recentlySeenHistoryItems];
  uint64_t v6 = [v4 arrayWithArray:v5];

  v7 = objc_msgSend(a1[4], "fc_setByTransformingWithBlock:", &__block_literal_global_14);
  id v8 = objc_opt_new();
  id v9 = objc_opt_new();
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __68__FCFileCoordinatedTodayDropboxTransaction_todayPrivateDataAccessor__block_invoke_3;
  v31[3] = &unk_1E5B4DE68;
  id v24 = v7;
  id v32 = v24;
  id v10 = v8;
  id v33 = v10;
  id v11 = v9;
  id v34 = v11;
  [v6 enumerateObjectsUsingBlock:v31];
  v25 = v6;
  v23 = v11;
  [v6 removeObjectsAtIndexes:v11];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = a1[4];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_super v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v18 = [v17 articleID];
        uint64_t v19 = [v10 objectForKeyedSubscript:v18];

        if (v19)
        {
          uint64_t v20 = FCCheckedProtocolCast((uint64_t)&unk_1EF9333E0, v17);
          [a1[5] _mergeItem:v19 intoItem:v20];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v14);
  }

  [v25 addObjectsFromArray:a1[4]];
  uint64_t v21 = [a1[6] allObjects];
  id v22 = (id)objc_msgSend(v25, "fc_arrayByRemovingObjectsInArray:", v21);

  if ((unint64_t)[v25 count] >= 0x65) {
    objc_msgSend(v25, "removeObjectsInRange:", 0, objc_msgSend(v25, "count") - 100);
  }
  [v26 setRecentlySeenHistoryItems:v25];
}

uint64_t __68__FCFileCoordinatedTodayDropboxTransaction_todayPrivateDataAccessor__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

void __68__FCFileCoordinatedTodayDropboxTransaction_todayPrivateDataAccessor__block_invoke_3(id *a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  uint64_t v5 = [v6 articleID];
  if ([a1[4] containsObject:v5])
  {
    [a1[5] setObject:v6 forKeyedSubscript:v5];
    [a1[6] addIndex:a3];
  }
}

uint64_t __68__FCFileCoordinatedTodayDropboxTransaction_todayPrivateDataAccessor__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setRecentlySeenHistoryItems:0];
}

- (void)_mergeItem:(id)a3 intoItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [(id)objc_opt_class() _mergeItem:v6 intoItem:v5];
}

+ (void)_mergeItem:(id)a3 intoItem:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "rightItem");
    *(_DWORD *)buf = 136315906;
    id v12 = "+[FCFileCoordinatedTodayDropboxTransaction _mergeItem:intoItem:]";
    __int16 v13 = 2080;
    uint64_t v14 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v15 = 1024;
    int v16 = 596;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "leftItem");
    *(_DWORD *)buf = 136315906;
    id v12 = "+[FCFileCoordinatedTodayDropboxTransaction _mergeItem:intoItem:]";
    __int16 v13 = 2080;
    uint64_t v14 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v15 = 1024;
    int v16 = 597;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v7 = FCCheckedProtocolCast((uint64_t)&unk_1EF9333E0, v6);
  id v8 = FCCheckedProtocolCast((uint64_t)&unk_1EF9332D0, v5);
  FCMergeHistoryItemSeenFields(v7, v8);
}

- (unint64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(unint64_t)a3
{
  self->_transactionType = a3;
}

- (NSArray)insertedOrUpdatedHistoryItems
{
  return self->_insertedOrUpdatedHistoryItems;
}

- (void)setInsertedOrUpdatedHistoryItems:(id)a3
{
}

- (NSSet)deletedArticleIDs
{
  return self->_deletedArticleIDs;
}

- (void)setDeletedArticleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedArticleIDs, 0);
  objc_storeStrong((id *)&self->_insertedOrUpdatedHistoryItems, 0);
}

@end