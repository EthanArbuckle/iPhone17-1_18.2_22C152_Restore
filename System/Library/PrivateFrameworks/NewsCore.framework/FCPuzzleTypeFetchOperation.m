@interface FCPuzzleTypeFetchOperation
- (BOOL)overrideTargetsCachePolicy;
- (FCAssetManager)assetManager;
- (FCContentContext)context;
- (FCHeldRecords)heldPuzzleTypeRecords;
- (FCPuzzleTypeFetchOperation)init;
- (FCPuzzleTypeFetchOperation)initWithPuzzleTypeIDs:(id)a3 puzzleTypeRecordSource:(id)a4 assetManager:(id)a5 context:(id)a6 delegate:(id)a7;
- (FCPuzzleTypeFetchOperationDelegate)delegate;
- (FCPuzzleTypeRecordSource)puzzleTypeRecordSource;
- (NSArray)puzzleTypeIDs;
- (double)targetsMaximumCachedAge;
- (id)completeFetchOperation;
- (id)fetchPuzzleTypeRecordsWithCompletion:(id)a3;
- (unint64_t)targetsCachePolicy;
- (void)customizeChildOperation:(id)a3 forFetchStep:(SEL)a4;
- (void)setAssetManager:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeldPuzzleTypeRecords:(id)a3;
- (void)setOverrideTargetsCachePolicy:(BOOL)a3;
- (void)setPuzzleTypeIDs:(id)a3;
- (void)setPuzzleTypeRecordSource:(id)a3;
- (void)setTargetsCachePolicy:(unint64_t)a3;
- (void)setTargetsMaximumCachedAge:(double)a3;
@end

@implementation FCPuzzleTypeFetchOperation

- (FCPuzzleTypeFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPuzzleTypeFetchOperation init]";
    __int16 v9 = 2080;
    v10 = "FCPuzzleTypeFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 37;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPuzzleTypeFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCPuzzleTypeFetchOperation)initWithPuzzleTypeIDs:(id)a3 puzzleTypeRecordSource:(id)a4 assetManager:(id)a5 context:(id)a6 delegate:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)FCPuzzleTypeFetchOperation;
  v17 = [(FCMultiStepFetchOperation *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_puzzleTypeIDs, a3);
    objc_storeStrong((id *)&v18->_puzzleTypeRecordSource, a4);
    objc_storeStrong((id *)&v18->_assetManager, a5);
    objc_storeStrong((id *)&v18->_context, a6);
    objc_storeWeak((id *)&v18->_delegate, v16);
    [(FCMultiStepFetchOperation *)v18 addFetchStep:sel_fetchPuzzleTypeRecordsWithCompletion_];
  }

  return v18;
}

- (void)customizeChildOperation:(id)a3 forFetchStep:(SEL)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCPuzzleTypeFetchOperation;
  [(FCMultiStepFetchOperation *)&v7 customizeChildOperation:v6 forFetchStep:a4];
  if (sel_fetchPuzzleTypeRecordsWithCompletion_ == a4
    && [(FCPuzzleTypeFetchOperation *)self overrideTargetsCachePolicy])
  {
    objc_msgSend(v6, "setCachePolicy:", -[FCPuzzleTypeFetchOperation targetsCachePolicy](self, "targetsCachePolicy"));
    [(FCPuzzleTypeFetchOperation *)self targetsMaximumCachedAge];
    objc_msgSend(v6, "setMaximumCachedAge:");
  }
}

- (id)fetchPuzzleTypeRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(FCPuzzleTypeFetchOperation *)self puzzleTypeRecordSource];
  id v6 = [(FCPuzzleTypeFetchOperation *)self puzzleTypeIDs];
  objc_super v7 = [v5 fetchOperationForRecordsWithIDs:v6];

  objc_msgSend(v7, "setCachePolicy:", -[FCFetchOperation cachePolicy](self, "cachePolicy"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__FCPuzzleTypeFetchOperation_fetchPuzzleTypeRecordsWithCompletion___block_invoke;
  v10[3] = &unk_1E5B4CC58;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  [v7 setFetchCompletionBlock:v10];

  return v7;
}

void __67__FCPuzzleTypeFetchOperation_fetchPuzzleTypeRecordsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [v4 fetchedObject];
  [*(id *)(a1 + 32) setHeldPuzzleTypeRecords:v3];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)completeFetchOperation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(FCPuzzleTypeFetchOperation *)self heldPuzzleTypeRecords];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  int v12 = __52__FCPuzzleTypeFetchOperation_completeFetchOperation__block_invoke;
  id v13 = &unk_1E5B59318;
  id v14 = self;
  id v5 = v3;
  id v15 = v5;
  [v4 enumerateRecordsAndInterestTokensWithBlock:&v10];

  id v6 = [(FCPuzzleTypeFetchOperation *)self delegate];
  if (v6)
  {
    objc_super v7 = [v5 allValues];
    [v6 puzzleTypeFetchOperation:self didFetchPuzzleTypes:v7];
  }
  id v8 = v5;

  return v8;
}

void __52__FCPuzzleTypeFetchOperation_completeFetchOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_super v7 = [FCPuzzleType alloc];
  id v8 = [*(id *)(a1 + 32) assetManager];
  __int16 v9 = [*(id *)(a1 + 32) context];
  int v12 = [(FCPuzzleType *)v7 initWithPuzzleTypeRecord:v6 assetManager:v8 context:v9 interestToken:v5];

  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v11 = [(FCPuzzleType *)v12 identifier];
  [v10 setObject:v12 forKey:v11];
}

- (BOOL)overrideTargetsCachePolicy
{
  return self->_overrideTargetsCachePolicy;
}

- (void)setOverrideTargetsCachePolicy:(BOOL)a3
{
  self->_overrideTargetsCachePolicy = a3;
}

- (unint64_t)targetsCachePolicy
{
  return self->_targetsCachePolicy;
}

- (void)setTargetsCachePolicy:(unint64_t)a3
{
  self->_targetsCachePolicy = a3;
}

- (double)targetsMaximumCachedAge
{
  return self->_targetsMaximumCachedAge;
}

- (void)setTargetsMaximumCachedAge:(double)a3
{
  self->_targetsMaximumCachedAge = a3;
}

- (NSArray)puzzleTypeIDs
{
  return self->_puzzleTypeIDs;
}

- (void)setPuzzleTypeIDs:(id)a3
{
}

- (FCHeldRecords)heldPuzzleTypeRecords
{
  return self->_heldPuzzleTypeRecords;
}

- (void)setHeldPuzzleTypeRecords:(id)a3
{
}

- (FCPuzzleTypeRecordSource)puzzleTypeRecordSource
{
  return self->_puzzleTypeRecordSource;
}

- (void)setPuzzleTypeRecordSource:(id)a3
{
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (FCPuzzleTypeFetchOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCPuzzleTypeFetchOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_puzzleTypeRecordSource, 0);
  objc_storeStrong((id *)&self->_heldPuzzleTypeRecords, 0);
  objc_storeStrong((id *)&self->_puzzleTypeIDs, 0);
}

@end