@interface FCPuzzleFetchOperation
- (BOOL)overrideTargetsCachePolicy;
- (FCAssetManager)assetManager;
- (FCCoreConfiguration)configuration;
- (FCCoreConfigurationManager)configurationManager;
- (FCHeldRecords)heldPuzzleRecords;
- (FCPuzzleFetchOperation)init;
- (FCPuzzleFetchOperation)initWithPuzzleIDs:(id)a3 puzzleTypeController:(id)a4 puzzleRecordSource:(id)a5 assetManager:(id)a6 configurationManager:(id)a7 delegate:(id)a8;
- (FCPuzzleFetchOperationDelegate)delegate;
- (FCPuzzleRecordSource)puzzleRecordSource;
- (FCPuzzleTypeController)puzzleTypeController;
- (NSArray)puzzleIDs;
- (NSDictionary)fetchedPuzzleTypes;
- (double)targetsMaximumCachedAge;
- (id)completeFetchOperation;
- (id)determineAppropriateFetchStepsWithCompletion:(id)a3;
- (id)fetchConfigWithCompletion:(id)a3;
- (id)fetchPuzzleRecordsWithCompletion:(id)a3;
- (id)interestTokenHandler;
- (unint64_t)targetsCachePolicy;
- (void)customizeChildOperation:(id)a3 forFetchStep:(SEL)a4;
- (void)setAssetManager:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchedPuzzleTypes:(id)a3;
- (void)setHeldPuzzleRecords:(id)a3;
- (void)setInterestTokenHandler:(id)a3;
- (void)setOverrideTargetsCachePolicy:(BOOL)a3;
- (void)setPuzzleIDs:(id)a3;
- (void)setPuzzleRecordSource:(id)a3;
- (void)setPuzzleTypeController:(id)a3;
- (void)setTargetsCachePolicy:(unint64_t)a3;
- (void)setTargetsMaximumCachedAge:(double)a3;
@end

@implementation FCPuzzleFetchOperation

- (FCPuzzleFetchOperation)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPuzzleFetchOperation init]";
    __int16 v9 = 2080;
    v10 = "FCPuzzleFetchOperation.m";
    __int16 v11 = 1024;
    int v12 = 45;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPuzzleFetchOperation init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCPuzzleFetchOperation)initWithPuzzleIDs:(id)a3 puzzleTypeController:(id)a4 puzzleRecordSource:(id)a5 assetManager:(id)a6 configurationManager:(id)a7 delegate:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)FCPuzzleFetchOperation;
  v18 = [(FCMultiStepFetchOperation *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_puzzleIDs, a3);
    objc_storeStrong((id *)&v19->_puzzleTypeController, a4);
    objc_storeStrong((id *)&v19->_puzzleRecordSource, a5);
    objc_storeStrong((id *)&v19->_assetManager, a6);
    objc_storeStrong((id *)&v19->_configurationManager, a7);
    objc_storeWeak((id *)&v19->_delegate, v17);
    [(FCMultiStepFetchOperation *)v19 addFetchStep:sel_determineAppropriateFetchStepsWithCompletion_];
  }

  return v19;
}

- (id)determineAppropriateFetchStepsWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  v5 = [(FCPuzzleFetchOperation *)self configuration];

  if (!v5) {
    [(FCMultiStepFetchOperation *)self addNonCriticalFetchStep:sel_fetchConfigWithCompletion_];
  }
  [(FCMultiStepFetchOperation *)self addFetchStep:sel_fetchPuzzleRecordsWithCompletion_];
  v4[2](v4, 0);

  return 0;
}

- (id)fetchConfigWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(FCPuzzleFetchOperation *)self configurationManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__FCPuzzleFetchOperation_fetchConfigWithCompletion___block_invoke;
  v8[3] = &unk_1E5B502D8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  FCCoreConfigurationFetch(v5, v8);

  return 0;
}

void __52__FCPuzzleFetchOperation_fetchConfigWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5)
  {

    id v6 = 0;
    uint64_t v7 = 3;
  }
  else
  {
    uint64_t v7 = 0;
    id v6 = v9;
  }
  id v10 = v6;
  [*(id *)(a1 + 32) setConfiguration:v6];
  v8 = +[FCFetchOperationResult resultWithStatus:v7 fetchedObject:v10 error:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)customizeChildOperation:(id)a3 forFetchStep:(SEL)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCPuzzleFetchOperation;
  [(FCMultiStepFetchOperation *)&v7 customizeChildOperation:v6 forFetchStep:a4];
  if (sel_fetchPuzzleRecordsWithCompletion_ == a4
    && [(FCPuzzleFetchOperation *)self overrideTargetsCachePolicy])
  {
    objc_msgSend(v6, "setCachePolicy:", -[FCPuzzleFetchOperation targetsCachePolicy](self, "targetsCachePolicy"));
    [(FCPuzzleFetchOperation *)self targetsMaximumCachedAge];
    objc_msgSend(v6, "setMaximumCachedAge:");
  }
}

- (id)fetchPuzzleRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FCPuzzleFetchOperation *)self puzzleRecordSource];
  id v6 = [(FCPuzzleFetchOperation *)self puzzleIDs];
  objc_super v7 = [v5 fetchOperationForRecordsWithIDs:v6];

  objc_msgSend(v7, "setCachePolicy:", -[FCFetchOperation cachePolicy](self, "cachePolicy"));
  [(FCFetchOperation *)self maximumCachedAge];
  objc_msgSend(v7, "setMaximumCachedAge:");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke;
  v10[3] = &unk_1E5B4CC58;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  [v7 setFetchCompletionBlock:v10];

  return v7;
}

void __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 fetchedObject];
  [*(id *)(a1 + 32) setHeldPuzzleRecords:v4];

  id v5 = [*(id *)(a1 + 32) heldPuzzleRecords];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    objc_super v7 = [*(id *)(a1 + 32) interestTokenHandler];

    if (v7)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_3;
      aBlock[3] = &unk_1E5B55290;
      aBlock[4] = *(void *)(a1 + 32);
      id v8 = (void (**)(void *, void *))_Block_copy(aBlock);
      id v9 = [*(id *)(a1 + 32) heldPuzzleRecords];
      v8[2](v8, v9);
    }
    id v10 = objc_opt_new();
    id v11 = [*(id *)(a1 + 32) heldPuzzleRecords];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_5;
    v23[3] = &unk_1E5B5B8D0;
    id v24 = v10;
    id v12 = v10;
    [v11 enumerateRecordsAndInterestTokensWithBlock:v23];

    __int16 v13 = [*(id *)(a1 + 32) puzzleTypeController];
    v14 = [v12 allObjects];
    uint64_t v15 = [*(id *)(a1 + 32) qualityOfService];
    id v16 = [*(id *)(a1 + 32) fetchCompletionQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_6;
    v20[3] = &unk_1E5B5B8F8;
    id v17 = *(void **)(a1 + 40);
    v20[4] = *(void *)(a1 + 32);
    id v21 = v3;
    id v22 = v17;
    v18 = (void (**)(id, id))v3;
    [v13 fetchPuzzleTypesForPuzzleTypeIDs:v14 cachePolicy:0 qualityOfService:v15 callbackQueue:v16 completionHandler:v20];
  }
  else
  {
    aBlock[5] = MEMORY[0x1E4F143A8];
    aBlock[6] = 3221225472;
    aBlock[7] = __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_2;
    aBlock[8] = &unk_1E5B4C7C0;
    v19 = (void (**)(id, id))*(id *)(a1 + 40);
    aBlock[9] = v3;
    aBlock[10] = v19;
    id v12 = v3;
    v19[2](v19, v12);

    v18 = v19;
  }
}

uint64_t __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 interestTokensByID];
  id v4 = [v3 allValues];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_4;
  v5[3] = &unk_1E5B55268;
  v5[4] = *(void *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:v5];
}

void __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 interestTokenHandler];
  v4[2](v4, v3);
}

void __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 puzzleTypeID];
  [v2 addObject:v3];
}

uint64_t __59__FCPuzzleFetchOperation_fetchPuzzleRecordsWithCompletion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setFetchedPuzzleTypes:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (id)completeFetchOperation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(FCPuzzleFetchOperation *)self configuration];
  id v5 = [v4 puzzlesConfig];

  uint64_t v6 = [v5 difficultyDescriptions];
  objc_super v7 = [(FCPuzzleFetchOperation *)self heldPuzzleRecords];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__FCPuzzleFetchOperation_completeFetchOperation__block_invoke;
  v14[3] = &unk_1E5B50B18;
  v14[4] = self;
  id v15 = v6;
  id v8 = v3;
  id v16 = v8;
  id v9 = v6;
  [v7 enumerateRecordsAndInterestTokensWithBlock:v14];

  id v10 = [(FCPuzzleFetchOperation *)self delegate];
  if (v10)
  {
    id v11 = [v8 allValues];
    [v10 puzzleFetchOperation:self didFetchPuzzles:v11];
  }
  id v12 = v8;

  return v12;
}

void __48__FCPuzzleFetchOperation_completeFetchOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 536);
  objc_super v7 = [v14 puzzleTypeID];
  id v8 = [v6 objectForKey:v7];

  if (v8)
  {
    id v9 = [FCPuzzle alloc];
    id v10 = [*(id *)(a1 + 32) assetManager];
    id v11 = [(FCPuzzle *)v9 initWithPuzzleRecord:v14 puzzleType:v8 assetManager:v10 interestToken:v5 difficultyDescriptions:*(void *)(a1 + 40)];

    id v12 = *(void **)(a1 + 48);
    __int16 v13 = [(FCPuzzle *)v11 identifier];
    [v12 setObject:v11 forKey:v13];
  }
}

- (id)interestTokenHandler
{
  return self->_interestTokenHandler;
}

- (void)setInterestTokenHandler:(id)a3
{
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

- (FCCoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSArray)puzzleIDs
{
  return self->_puzzleIDs;
}

- (void)setPuzzleIDs:(id)a3
{
}

- (FCHeldRecords)heldPuzzleRecords
{
  return self->_heldPuzzleRecords;
}

- (void)setHeldPuzzleRecords:(id)a3
{
}

- (FCPuzzleRecordSource)puzzleRecordSource
{
  return self->_puzzleRecordSource;
}

- (void)setPuzzleRecordSource:(id)a3
{
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (FCPuzzleFetchOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCPuzzleFetchOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FCPuzzleTypeController)puzzleTypeController
{
  return self->_puzzleTypeController;
}

- (void)setPuzzleTypeController:(id)a3
{
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (NSDictionary)fetchedPuzzleTypes
{
  return self->_fetchedPuzzleTypes;
}

- (void)setFetchedPuzzleTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedPuzzleTypes, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_puzzleTypeController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_puzzleRecordSource, 0);
  objc_storeStrong((id *)&self->_heldPuzzleRecords, 0);
  objc_storeStrong((id *)&self->_puzzleIDs, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_interestTokenHandler, 0);
}

@end