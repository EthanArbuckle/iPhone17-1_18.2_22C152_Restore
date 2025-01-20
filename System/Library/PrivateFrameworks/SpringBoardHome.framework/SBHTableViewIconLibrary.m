@interface SBHTableViewIconLibrary
- (SBHIconLibraryQueryEngine)queryEngine;
- (SBHIconLibraryQueryResult)lastQueryResults;
- (SBHIconModel)iconModel;
- (SBHTableViewIconLibrary)initWithIconModel:(id)a3;
- (SBHTableViewIconLibrary)initWithIconModel:(id)a3 queryEngine:(id)a4;
- (void)_dispatchQueryResult:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)engine:(id)a3 failedToExecuteQuery:(id)a4 withError:(id)a5;
- (void)engine:(id)a3 queryResultsWereUpdated:(id)a4;
- (void)executeQuery:(id)a3;
- (void)executeQuery:(id)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation SBHTableViewIconLibrary

- (SBHTableViewIconLibrary)initWithIconModel:(id)a3
{
  id v4 = a3;
  v5 = [(SBHIconLibraryAbstractQueryEngine *)[SBHIconLibraryPredicateQueryEngine alloc] initWithIconModel:v4];
  v6 = [(SBHTableViewIconLibrary *)self initWithIconModel:v4 queryEngine:v5];

  return v6;
}

- (SBHTableViewIconLibrary)initWithIconModel:(id)a3 queryEngine:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHTableViewIconLibrary;
  v9 = [(SBHTableViewIconLibrary *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_iconModel, a3);
    objc_storeStrong((id *)&v10->_queryEngine, a4);
    [(SBHIconLibraryQueryEngine *)v10->_queryEngine addObserver:v10];
  }

  return v10;
}

- (void)dealloc
{
  [(SBHIconLibraryQueryEngine *)self->_queryEngine shutdown];
  queryEngine = self->_queryEngine;
  self->_queryEngine = 0;

  iconModel = self->_iconModel;
  self->_iconModel = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBHTableViewIconLibrary;
  [(SBHTableViewIconLibrary *)&v5 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)executeQuery:(id)a3
{
}

- (void)executeQuery:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v6)
  {
    completionHandlerForQuery = self->_completionHandlerForQuery;
    if (!completionHandlerForQuery)
    {
      id v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      v9 = self->_completionHandlerForQuery;
      self->_completionHandlerForQuery = v8;

      completionHandlerForQuery = self->_completionHandlerForQuery;
    }
    v10 = (void *)[v6 copy];
    v11 = _Block_copy(v10);
    [(NSMapTable *)completionHandlerForQuery setObject:v11 forKey:v12];
  }
  [(SBHIconLibraryQueryEngine *)self->_queryEngine executeQuery:v12];
}

- (void)engine:(id)a3 queryResultsWereUpdated:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  BSDispatchMain();
}

uint64_t __58__SBHTableViewIconLibrary_engine_queryResultsWereUpdated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dispatchQueryResult:*(void *)(a1 + 40)];
}

- (void)engine:(id)a3 failedToExecuteQuery:(id)a4 withError:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  BSDispatchMain();
}

void __65__SBHTableViewIconLibrary_engine_failedToExecuteQuery_withError___block_invoke(uint64_t a1)
{
  v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  v2 = +[SBHIconLibraryQueryResult nullQueryResults];
  if (v3)
  {
    v3[2](v3, v2, *(void *)(a1 + 48));
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) _dispatchQueryResult:v2];
}

- (void)_dispatchQueryResult:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  lastQueryResults = self->_lastQueryResults;
  if (!lastQueryResults
    || ![(SBHIconLibraryQueryResult *)lastQueryResults isEqualToQueryResult:v5])
  {
    objc_storeStrong((id *)&self->_lastQueryResults, a3);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = self->_observers;
    uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v11++), "iconLibrary:hasUpdatedQueryResult:", self, v5, (void)v17);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    completionHandlerForQuery = self->_completionHandlerForQuery;
    v13 = [v5 query];
    v14 = [(NSMapTable *)completionHandlerForQuery objectForKey:v13];

    if (v14)
    {
      ((void (**)(void, id, void))v14)[2](v14, v5, 0);
      v15 = self->_completionHandlerForQuery;
      v16 = [v5 query];
      [(NSMapTable *)v15 removeObjectForKey:v16];
    }
  }
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (SBHIconLibraryQueryEngine)queryEngine
{
  return self->_queryEngine;
}

- (SBHIconLibraryQueryResult)lastQueryResults
{
  return self->_lastQueryResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastQueryResults, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_queryEngine, 0);
  objc_storeStrong((id *)&self->_completionHandlerForQuery, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end