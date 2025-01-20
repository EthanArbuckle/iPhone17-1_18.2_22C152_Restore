@interface SearchHistoryOperation
- (BOOL)_removeCompletionItemForStringKey:(id)a3 query:(id)a4 fromCompletions:(id)a5;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (SearchHistoryOperation)initWithSearchQuery:(id)a3 searchMode:(unsigned int)a4 history:(id)a5 context:(id)a6;
- (SearchHistoryOperationDelegate)delegate;
- (id)_historyResultsForSearchQuery:(id)a3 searchMode:(unsigned int)a4;
- (id)shortAddressForMapItem:(id)a3;
- (void)main;
- (void)setDelegate:(id)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
@end

@implementation SearchHistoryOperation

- (SearchHistoryOperation)initWithSearchQuery:(id)a3 searchMode:(unsigned int)a4 history:(id)a5 context:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SearchHistoryOperation;
  v14 = [(SearchHistoryOperation *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_searchQuery, a3);
    v15->_searchMode = a4;
    v15->_stateLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_history, a5);
    objc_storeStrong((id *)&v15->_context, a6);
  }

  return v15;
}

- (void)main
{
  if ([(SearchHistoryOperation *)self isCancelled])
  {
    v3 = sub_100109E50();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SearchHistoryOperation: %@ - is cancelled before starting", (uint8_t *)&v11, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained historyOperation:self didFindMatches:&__NSArray0__struct];

    [(SearchHistoryOperation *)self setFinished:1];
  }
  else
  {
    [(SearchHistoryOperation *)self setExecuting:1];
    v5 = sub_100109E50();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SearchHistoryOperation - collecting results", (uint8_t *)&v11, 2u);
    }

    v6 = [(SearchHistoryOperation *)self _historyResultsForSearchQuery:self->_searchQuery searchMode:self->_searchMode];
    [(SearchHistoryOperation *)self willChangeValueForKey:@"isFinished"];
    [(SearchHistoryOperation *)self willChangeValueForKey:@"isExecuting"];
    os_unfair_lock_lock(&self->_stateLock);
    if (([(SearchHistoryOperation *)self isCancelled] & 1) == 0)
    {
      self->_isFinished = 1;
      self->_isExecuting = 0;
    }
    os_unfair_lock_unlock(&self->_stateLock);
    [(SearchHistoryOperation *)self didChangeValueForKey:@"isFinished"];
    [(SearchHistoryOperation *)self didChangeValueForKey:@"isExecuting"];
    v7 = sub_100109E50();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (SearchHistoryOperation *)[v6 count];
      int v11 = 134217984;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SearchHistoryOperation - collected %lu results", (uint8_t *)&v11, 0xCu);
    }

    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 historyOperation:self didFindMatches:v6];
    }
  }
}

- (BOOL)_removeCompletionItemForStringKey:(id)a3 query:(id)a4 fromCompletions:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unsigned int v9 = [v7 _web_hasCaseInsensitivePrefix:a4];
  if (v9)
  {
    id v10 = [v7 lowercaseString];
    int v11 = [v10 stringByRemovingPunctuation];

    [v8 removeObjectForKey:v11];
  }

  return v9;
}

- (id)shortAddressForMapItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 _addressFormattedAsName];
  if (![v4 length])
  {
    uint64_t v5 = [v3 _addressFormattedAsShortenedAddress];

    v4 = (void *)v5;
  }

  return v4;
}

- (id)_historyResultsForSearchQuery:(id)a3 searchMode:(unsigned int)a4
{
  id v5 = a3;
  if ([v5 length] && (objc_msgSend(v5, "isEqualToString:", @" ") & 1) == 0)
  {
    v21 = v5;
    v20 = +[NSMutableArray array];
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obj = self->_history;
    id v8 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v32;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ([(SearchHistoryOperation *)self isCancelled])
          {

            id v6 = 0;
            objc_super v17 = v20;
            goto LABEL_14;
          }
          id v13 = [v12 historyEntry];
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_100A071F8;
          v27[3] = &unk_101314198;
          v27[4] = v12;
          id v14 = v21;
          id v28 = v14;
          v29 = self;
          id v15 = v20;
          id v30 = v15;
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_100A07438;
          v22[3] = &unk_1013141C0;
          v22[4] = self;
          id v23 = v14;
          id v24 = v7;
          v25 = v12;
          id v26 = v15;
          [v13 ifSearch:v27 ifRoute:0 ifPlaceDisplay:v22 ifTransitLineItem:&stru_1013141E0];
        }
        id v9 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    v16 = [v7 allValues];
    objc_super v17 = v20;
    [v20 addObjectsFromArray:v16];

    [v20 sortUsingFunction:sub_100A07888 context:0];
    id v6 = [v20 copy];
LABEL_14:

    id v5 = v21;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isFinished
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_isFinished;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)isExecuting
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_isExecuting;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (void)setFinished:(BOOL)a3
{
  [(SearchHistoryOperation *)self willChangeValueForKey:@"isFinished"];
  os_unfair_lock_lock(&self->_stateLock);
  self->_isFinished = a3;
  os_unfair_lock_unlock(&self->_stateLock);

  [(SearchHistoryOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)a3
{
  [(SearchHistoryOperation *)self willChangeValueForKey:@"isExecuting"];
  os_unfair_lock_lock(&self->_stateLock);
  self->_isExecuting = a3;
  os_unfair_lock_unlock(&self->_stateLock);

  [(SearchHistoryOperation *)self didChangeValueForKey:@"isExecuting"];
}

- (SearchHistoryOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SearchHistoryOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_history, 0);

  objc_storeStrong((id *)&self->_searchQuery, 0);
}

@end