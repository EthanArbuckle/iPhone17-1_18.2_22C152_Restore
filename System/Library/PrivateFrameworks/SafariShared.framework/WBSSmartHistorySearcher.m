@interface WBSSmartHistorySearcher
- (WBSSmartHistorySearcher)initWithTopics:(id)a3;
- (id)_searchItemsInTopic:(id)a3 forText:(id)a4 options:(unint64_t)a5;
- (id)_searchTopicsForText:(id)a3 options:(unint64_t)a4;
- (void)performSearchWithText:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation WBSSmartHistorySearcher

- (WBSSmartHistorySearcher)initWithTopics:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSmartHistorySearcher;
  v5 = [(WBSSmartHistorySearcher *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    topics = v5->_topics;
    v5->_topics = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)_searchItemsInTopic:(id)a3 forText:(id)a4 options:(unint64_t)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [MEMORY[0x1E4F1CA48] array];
  v23 = v7;
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [v7 historyItems];
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v14 = [v13 title];
        if (v14)
        {
          v15 = (void *)v14;
          v16 = [v13 title];
          uint64_t v17 = [v16 rangeOfString:v8 options:a5];

          if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_10;
          }
        }
        uint64_t v18 = [v13 urlString];
        if (v18)
        {
          v19 = (void *)v18;
          v20 = [v13 urlString];
          uint64_t v21 = [v20 rangeOfString:v8 options:a5];

          if (v21 != 0x7FFFFFFFFFFFFFFFLL) {
LABEL_10:
          }
            [v24 addObject:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  return v24;
}

- (id)_searchTopicsForText:(id)a3 options:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v18 = self;
  id obj = self->_topics;
  uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "title", v18);
        uint64_t v14 = [v13 rangeOfString:v6 options:a4];

        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = [(WBSSmartHistorySearcher *)v18 _searchItemsInTopic:v12 forText:v6 options:a4];
          if ([v15 count])
          {
            v16 = [[WBSHistoryTopicTag alloc] initWithTag:v12 historyItems:v15];
            [v7 addObject:v16];
          }
        }
        else
        {
          [v7 addObject:v12];
        }
      }
      uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v7;
}

- (void)performSearchWithText:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 length])
  {
    objc_initWeak(&location, self);
    searchQueue = self->_searchQueue;
    if (!searchQueue)
    {
      id v11 = [NSString stringWithFormat:@"com.apple.SafariShared.%@.%p.searchQueue", objc_opt_class(), self];
      v12 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v11 UTF8String], 0);
      v13 = self->_searchQueue;
      self->_searchQueue = v12;

      searchQueue = self->_searchQueue;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__WBSSmartHistorySearcher_performSearchWithText_options_completionHandler___block_invoke;
    block[3] = &unk_1E5C9FFA8;
    objc_copyWeak(v17, &location);
    id v16 = v9;
    id v15 = v8;
    v17[1] = (id)a4;
    dispatch_async(searchQueue, block);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, NSArray *))v9 + 2))(v9, self->_topics);
  }
}

void __75__WBSSmartHistorySearcher_performSearchWithText_options_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained _searchTopicsForText:*(void *)(a1 + 32) options:*(void *)(a1 + 56)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_topics, 0);
}

@end