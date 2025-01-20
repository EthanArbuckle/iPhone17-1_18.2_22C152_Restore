@interface PXSettingsIndexer
- (NSMutableArray)completionHandlers;
- (NSProgress)indexingProgress;
- (PXSettings)rootSettings;
- (PXSettingsIndex)index;
- (PXSettingsIndexer)init;
- (PXSettingsIndexer)initWithRootSettings:(id)a3;
- (id)startIndexingWithCompletionHandler:(id)a3;
- (int64_t)state;
- (void)_callCompletionHandlersIfNecessary;
- (void)_handleResultIndex:(id)a3;
- (void)_startIndexingIfNecessary;
- (void)setIndex:(id)a3;
- (void)setIndexingProgress:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation PXSettingsIndexer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexingProgress, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_rootSettings, 0);
}

- (void)setIndexingProgress:(id)a3
{
}

- (NSProgress)indexingProgress
{
  return self->_indexingProgress;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setIndex:(id)a3
{
}

- (PXSettingsIndex)index
{
  return self->_index;
}

- (PXSettings)rootSettings
{
  return self->_rootSettings;
}

- (void)_callCompletionHandlersIfNecessary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(PXSettingsIndexer *)self state] == 2)
  {
    v3 = [(PXSettingsIndexer *)self completionHandlers];
    v4 = (void *)[v3 copy];

    if ([v4 count])
    {
      v5 = [(PXSettingsIndexer *)self completionHandlers];
      [v5 removeAllObjects];

      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)_handleResultIndex:(id)a3
{
  id v4 = a3;
  [(PXSettingsIndexer *)self setIndexingProgress:0];
  if (v4)
  {
    [(PXSettingsIndexer *)self setIndex:v4];
    [(PXSettingsIndexer *)self setState:2];
    [(PXSettingsIndexer *)self _callCompletionHandlersIfNecessary];
  }
  else
  {
    [(PXSettingsIndexer *)self setState:0];
  }
}

- (void)_startIndexingIfNecessary
{
  if (![(PXSettingsIndexer *)self state])
  {
    [(PXSettingsIndexer *)self setState:1];
    objc_initWeak(&location, self);
    v3 = [(PXSettingsIndexer *)self rootSettings];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    uint64_t v7 = __46__PXSettingsIndexer__startIndexingIfNecessary__block_invoke;
    uint64_t v8 = &unk_1E5DC7F48;
    objc_copyWeak(&v9, &location);
    id v4 = +[PXSettingsIndex createIndexForSettings:v3 resultHandler:&v5];
    -[PXSettingsIndexer setIndexingProgress:](self, "setIndexingProgress:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __46__PXSettingsIndexer__startIndexingIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleResultIndex:v3];
}

- (id)startIndexingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXSettingsIndexer *)self completionHandlers];
  uint64_t v6 = (void *)[v4 copy];

  uint64_t v7 = _Block_copy(v6);
  [v5 addObject:v7];

  [(PXSettingsIndexer *)self _startIndexingIfNecessary];
  [(PXSettingsIndexer *)self _callCompletionHandlersIfNecessary];
  return [(PXSettingsIndexer *)self indexingProgress];
}

- (PXSettingsIndexer)initWithRootSettings:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXSettingsIndexer;
  uint64_t v6 = [(PXSettingsIndexer *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootSettings, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    completionHandlers = v7->_completionHandlers;
    v7->_completionHandlers = (NSMutableArray *)v8;
  }
  return v7;
}

- (PXSettingsIndexer)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSettingsIndexer.m", 35, @"%s is not available as initializer", "-[PXSettingsIndexer init]");

  abort();
}

@end