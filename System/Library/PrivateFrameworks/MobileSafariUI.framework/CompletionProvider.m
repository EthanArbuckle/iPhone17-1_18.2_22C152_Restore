@interface CompletionProvider
- (BOOL)isFailing;
- (CompletionProvider)init;
- (CompletionProviderDelegate)delegate;
- (id)completionsForQuery:(id)a3;
- (id)completionsForQuery:(id)a3 isCFSearch:(BOOL)a4;
- (id)findCompletionsForKey:(id)a3 isCFSearch:(BOOL)a4;
- (id)getKeyForQueryString:(id)a3 isCFSearch:(BOOL)a4;
- (unint64_t)maximumCachedCompletionCount;
- (void)_pruneCachedCompletions;
- (void)clearCachedCompletions;
- (void)fail;
- (void)setCompletions:(id)a3 forString:(id)a4;
- (void)setCompletions:(id)a3 forString:(id)a4 isCFSearch:(BOOL)a5;
- (void)setDelegate:(id)a3;
@end

@implementation CompletionProvider

- (CompletionProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)CompletionProvider;
  v2 = [(CompletionProvider *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    completionsByString = v2->_completionsByString;
    v2->_completionsByString = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completedStringsInPruneOrder = v2->_completedStringsInPruneOrder;
    v2->_completedStringsInPruneOrder = v5;

    v7 = v2;
  }

  return v2;
}

- (id)completionsForQuery:(id)a3
{
  return [(CompletionProvider *)self completionsForQuery:a3 isCFSearch:0];
}

- (id)completionsForQuery:(id)a3 isCFSearch:(BOOL)a4
{
  BOOL v4 = a4;
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 queryString];
  v8 = v7;
  if (v7)
  {
    if ([v7 length])
    {
      objc_super v9 = [(CompletionProvider *)self findCompletionsForKey:v8 isCFSearch:v4];
      v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        self->_inCompletionsForString = 1;
        v16[0] = @"time";
        v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:CFAbsoluteTimeGetCurrent()];
        v16[1] = @"query";
        v17[0] = v13;
        v17[1] = v8;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
        +[Application postTestNotificationName:@"completionProviderDidStart" object:self userInfo:v14];

        [(CompletionProvider *)self setQueryToComplete:v6];
        self->_inCompletionsForString = 0;
        id v11 = [(CompletionProvider *)self findCompletionsForKey:v8 isCFSearch:v4];
      }
      v12 = v11;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)findCompletionsForKey:(id)a3 isCFSearch:(BOOL)a4
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_completionsByString, "objectForKeyedSubscript:", a3, a4);
}

- (void)_pruneCachedCompletions
{
  unint64_t v3 = [(CompletionProvider *)self maximumCachedCompletionCount];
  unint64_t v4 = [(NSMutableDictionary *)self->_completionsByString count];
  BOOL v5 = v4 >= v3;
  unint64_t v6 = v4 - v3;
  if (v5)
  {
    if (v6)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        v8 = [(NSMutableArray *)self->_completedStringsInPruneOrder objectAtIndex:i];
        [(NSMutableDictionary *)self->_completionsByString removeObjectForKey:v8];
      }
    }
    completedStringsInPruneOrder = self->_completedStringsInPruneOrder;
    -[NSMutableArray removeObjectsInRange:](completedStringsInPruneOrder, "removeObjectsInRange:", 0, v6);
  }
}

- (void)clearCachedCompletions
{
  [(NSMutableDictionary *)self->_completionsByString removeAllObjects];
  completedStringsInPruneOrder = self->_completedStringsInPruneOrder;
  [(NSMutableArray *)completedStringsInPruneOrder removeAllObjects];
}

- (void)setCompletions:(id)a3 forString:(id)a4
{
}

- (void)setCompletions:(id)a3 forString:(id)a4 isCFSearch:(BOOL)a5
{
  BOOL v5 = a5;
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)[v9 copy];
  if (!v5)
  {
    v16[0] = @"time";
    id v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:CFAbsoluteTimeGetCurrent()];
    v16[1] = @"query";
    v17[0] = v11;
    v17[1] = v9;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    +[Application postTestNotificationName:@"completionProviderDidFinish" object:self userInfo:v12];
  }
  v13 = [(CompletionProvider *)self getKeyForQueryString:v10 isCFSearch:v5];
  v14 = [(NSMutableDictionary *)self->_completionsByString objectForKeyedSubscript:v13];

  if (v14) {
    [(NSMutableArray *)self->_completedStringsInPruneOrder removeObject:v13];
  }
  [(NSMutableDictionary *)self->_completionsByString setObject:v8 forKeyedSubscript:v13];
  [(NSMutableArray *)self->_completedStringsInPruneOrder addObject:v13];
  [(CompletionProvider *)self _pruneCachedCompletions];
  if (!v5)
  {
    self->_failing = 0;
    if (!self->_inCompletionsForString)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained completionProvider:self didFinishCompletingString:v9];
    }
  }
}

- (void)fail
{
  if (!self->_failing)
  {
    self->_failing = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained completionProviderDidFail:self];
  }
}

- (unint64_t)maximumCachedCompletionCount
{
  return 1;
}

- (id)getKeyForQueryString:(id)a3 isCFSearch:(BOOL)a4
{
  id v4 = a3;
  return v4;
}

- (CompletionProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CompletionProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isFailing
{
  return self->_failing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_completedStringsInPruneOrder, 0);
  objc_storeStrong((id *)&self->_completionsByString, 0);
}

@end