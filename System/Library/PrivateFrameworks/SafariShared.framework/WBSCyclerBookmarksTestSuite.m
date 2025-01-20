@interface WBSCyclerBookmarksTestSuite
+ (BOOL)setValue:(id)a3 forConfigurationKey:(id)a4;
- (BOOL)canHandleRequest:(id)a3;
- (NSArray)operations;
- (WBSCyclerBookmarksTestSuite)init;
- (WBSCyclerIterationCounter)iterationCounter;
- (id)_descriptionForErrorCode:(int64_t)a3;
- (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4;
- (id)relativeProbabilitiesForOperationsWithTopLevelItem:(id)a3;
- (void)_performCloudKitSecondaryMigrationAfterClearingBookmarksWithTarget:(id)a3 initialBookmarks:(id)a4 completionHandler:(id)a5;
- (void)_performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks:(id)a3 completionHandler:(id)a4;
- (void)_validateServerBookmarksAfterClearingLocallyWithTarget:(id)a3 initialBookmarks:(id)a4 completionHandler:(id)a5;
- (void)_validateServerBookmarksAfterInitialSyncWithTarget:(id)a3 completionHandler:(id)a4;
- (void)_validateServerBookmarksWithTarget:(id)a3 completionHandler:(id)a4;
- (void)_validateServerBookmarksWithTarget:(id)a3 initialBookmarks:(id)a4 completionHandler:(id)a5;
- (void)handleRequest:(id)a3 withTarget:(id)a4 completionHandler:(id)a5;
- (void)runWithTarget:(id)a3 completionHandler:(id)a4;
- (void)setIterationCounter:(id)a3;
- (void)setUp;
- (void)tearDown;
@end

@implementation WBSCyclerBookmarksTestSuite

- (WBSCyclerBookmarksTestSuite)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSCyclerBookmarksTestSuite;
  v2 = [(WBSCyclerBookmarksTestSuite *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(WBSCyclerOperationContext);
    operationContext = v2->_operationContext;
    v2->_operationContext = v3;

    v5 = objc_alloc_init(WBSCyclerTestSuiteBookmarkAuxiliary);
    bookmarkAuxiliary = v2->_bookmarkAuxiliary;
    v2->_bookmarkAuxiliary = v5;

    v7 = v2;
  }

  return v2;
}

- (NSArray)operations
{
  if (operations_onceToken != -1) {
    dispatch_once(&operations_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)operations_operations;
  return (NSArray *)v2;
}

void __41__WBSCyclerBookmarksTestSuite_operations__block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v0 = objc_alloc_init(WBSCyclerCreateBookmarkOperation);
  v6[0] = v0;
  v1 = objc_alloc_init(WBSCyclerDeleteBookmarkOperation);
  v6[1] = v1;
  v2 = objc_alloc_init(WBSCyclerMoveBookmarkOperation);
  v6[2] = v2;
  v3 = objc_alloc_init(WBSCyclerModifyBookmarkOperation);
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v5 = (void *)operations_operations;
  operations_operations = v4;
}

- (id)relativeProbabilitiesForOperationsWithTopLevelItem:(id)a3
{
  if (relativeProbabilitiesForOperationsWithTopLevelItem__onceToken != -1) {
    dispatch_once(&relativeProbabilitiesForOperationsWithTopLevelItem__onceToken, &__block_literal_global_9_1);
  }
  v3 = (void *)relativeProbabilitiesForOperationsWithTopLevelItem__relativeProbabilitiesForOperations;
  return v3;
}

void __82__WBSCyclerBookmarksTestSuite_relativeProbabilitiesForOperationsWithTopLevelItem___block_invoke()
{
  v0 = (void *)relativeProbabilitiesForOperationsWithTopLevelItem__relativeProbabilitiesForOperations;
  relativeProbabilitiesForOperationsWithTopLevelItem__relativeProbabilitiesForOperations = (uint64_t)&unk_1EFC220D0;
}

- (void)setUp
{
  v2 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_INFO, "Blocking automatic migration in the sync agent", v4, 2u);
  }
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_cloudBookmarksDefaults");
  [v3 setBool:1 forKey:*MEMORY[0x1E4F981D8]];
}

- (void)tearDown
{
  v2 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_INFO, "Unblocking automatic migration in the sync agent", v4, 2u);
  }
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_cloudBookmarksDefaults");
  [v3 setBool:0 forKey:*MEMORY[0x1E4F981D8]];
}

- (void)runWithTarget:(id)a3 completionHandler:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(WBSCyclerTestSuiteBookmarkAuxiliary *)self->_bookmarkAuxiliary hasPerformedOperation:0])
  {
    if (shouldRunInCloudKitMode)
    {
      v22 = @"forCloudKitTest";
      v23[0] = MEMORY[0x1E4F1CC38];
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    }
    else
    {
      v13 = 0;
    }
    [(WBSCyclerTestSuiteBookmarkAuxiliary *)self->_bookmarkAuxiliary performOperation:0 withTarget:v6 options:v13 completionHandler:v7];

    goto LABEL_17;
  }
  if (shouldRunInCloudKitMode)
  {
    BOOL v8 = [(WBSCyclerTestSuiteBookmarkAuxiliary *)self->_bookmarkAuxiliary hasPerformedOperation:1];
    bookmarkAuxiliary = self->_bookmarkAuxiliary;
    if (v8)
    {
      if ([(WBSCyclerTestSuiteBookmarkAuxiliary *)bookmarkAuxiliary hasPerformedOperation:3])
      {
        goto LABEL_5;
      }
      bookmarkAuxiliary = self->_bookmarkAuxiliary;
      uint64_t v14 = 3;
    }
    else
    {
      uint64_t v14 = 1;
    }
    [(WBSCyclerTestSuiteBookmarkAuxiliary *)bookmarkAuxiliary performOperation:v14 withTarget:v6 completionHandler:v7];
    goto LABEL_17;
  }
LABEL_5:
  [(WBSCyclerIterationCounter *)self->_iterationCounter incrementIterationCount];
  v10 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    iterationCounter = self->_iterationCounter;
    v12 = v10;
    *(_DWORD *)buf = 134218240;
    uint64_t v19 = [(WBSCyclerIterationCounter *)iterationCounter iterationCount];
    __int16 v20 = 2048;
    unint64_t v21 = +[WBSCyclerRandomnessUtilities seed];
    _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_DEFAULT, "Beginning iteration %lu with seed %lu", buf, 0x16u);
  }
  if (__ROR8__(0x8F5C28F5C28F5C29 * [(WBSCyclerIterationCounter *)self->_iterationCounter iterationCount], 2) <= 0x28F5C28F5C28F5CuLL)
  {
    [(WBSCyclerBookmarksTestSuite *)self _validateServerBookmarksWithTarget:v6 completionHandler:v7];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke;
    v15[3] = &unk_1E5C9A5C8;
    v15[4] = self;
    id v16 = v6;
    id v17 = v7;
    [v16 fetchTopLevelBookmarkList:v15];
  }
LABEL_17:
}

void __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8) setTestTarget:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 8) setTopLevelItem:v3];
  [*(id *)(*(void *)(a1 + 32) + 8) setTitlePrefix:bookmarkTitlePrefix];
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
LABEL_10:
    v5 = [v3 randomProfileDescendant];
    [*(id *)(*(void *)(a1 + 32) + 8) setTabGroupsParent:v5];
    id v7 = [*(id *)(a1 + 32) operations];
    BOOL v8 = [*(id *)(a1 + 32) relativeProbabilitiesForOperationsWithTopLevelItem:v5];
    objc_super v9 = +[WBSCyclerRandomnessUtilities randomElementOfArray:v7 relativeProbabilities:v8];

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v10 + 8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_16;
    v12[3] = &unk_1E5C9A5A0;
    v12[4] = v10;
    id v13 = *(id *)(a1 + 48);
    [v9 executeWithContext:v11 completionHandler:v12];

    goto LABEL_11;
  }
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_cold_3();
  }
  v5 = [*(id *)(*(void *)(a1 + 32) + 16) validateBookmarks:v3 expectingBookmarks:*(void *)(*(void *)(a1 + 32) + 24) context:*(void *)(*(void *)(a1 + 32) + 8)];
  id v6 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_cold_1();
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_cold_2();
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_11:
}

void __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v4;

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v7 + 8);
  BOOL v8 = *(void **)(v7 + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_2;
  v10[3] = &unk_1E5C8DCF8;
  id v11 = *(id *)(a1 + 40);
  [v8 fetchAndValidateBookmarksWithExpectedBookmarks:v3 context:v9 completionHandler:v10];
}

uint64_t __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canHandleRequest:(id)a3
{
  return [a3 isEqualToString:@"validate-server"];
}

- (void)handleRequest:(id)a3 withTarget:(id)a4 completionHandler:(id)a5
{
}

+ (BOOL)setValue:(id)a3 forConfigurationKey:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"bookmark-prefix"])
  {
    BOOL v8 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v15 = 138543362;
      id v16 = v6;
      _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "Bookmark prefix set to %{public}@", (uint8_t *)&v15, 0xCu);
    }
    objc_storeStrong((id *)&bookmarkTitlePrefix, a3);
    BOOL v9 = 1;
    goto LABEL_19;
  }
  if ([v7 isEqualToString:@"enable-cloudkit"])
  {
    shouldRunInCloudKitMode = [(__CFString *)v6 BOOLValue];
    uint64_t v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    BOOL v9 = 1;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    if (shouldRunInCloudKitMode) {
      id v11 = @"enabled";
    }
    else {
      id v11 = @"disabled";
    }
    int v15 = 138543362;
    id v16 = v11;
    v12 = "CloudKit mode %{public}@";
LABEL_17:
    _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v15, 0xCu);
    goto LABEL_19;
  }
  if (![v7 isEqualToString:@"enable-secondary-migration"])
  {
    BOOL v9 = 0;
    goto LABEL_19;
  }
  shouldSyncDownUsingSecondaryMigration = [(__CFString *)v6 BOOLValue];
  uint64_t v10 = WBS_LOG_CHANNEL_PREFIXCycler();
  BOOL v9 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (shouldSyncDownUsingSecondaryMigration) {
      id v13 = @"enabled";
    }
    else {
      id v13 = @"disabled";
    }
    int v15 = 138543362;
    id v16 = v13;
    v12 = "CloudKit secondary migration sync down %{public}@";
    goto LABEL_17;
  }
LABEL_19:

  return v9;
}

- (void)_validateServerBookmarksWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_DEFAULT, "Validating server bookmarks", buf, 2u);
  }
  BOOL v9 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_INFO, "Performing initial sync before syncing down server bookmarks", buf, 2u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_completionHandler___block_invoke;
  v12[3] = &unk_1E5C9A5F0;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [v10 syncBookmarksWithCompletionHandler:v12];
}

void __84__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 2:
      id v6 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Bookmark sync is disabled; skipping validation of server bookmarks",
          v10,
          2u);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      break;
    case 1:
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      [v7 _validateServerBookmarksAfterInitialSyncWithTarget:v8 completionHandler:v9];
      break;
    case 0:
      id v3 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __84__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_completionHandler___block_invoke_cold_1();
      }
      uint64_t v4 = *(void *)(a1 + 48);
      uint64_t v5 = [*(id *)(a1 + 32) _errorWithCode:1 userInfo:0];
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

      break;
  }
}

- (void)_validateServerBookmarksAfterInitialSyncWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "Saving off initial bookmarks before server bookmark validation", buf, 2u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __100__WBSCyclerBookmarksTestSuite__validateServerBookmarksAfterInitialSyncWithTarget_completionHandler___block_invoke;
  v11[3] = &unk_1E5C9A5C8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v10 fetchTopLevelBookmarkList:v11];
}

uint64_t __100__WBSCyclerBookmarksTestSuite__validateServerBookmarksAfterInitialSyncWithTarget_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _validateServerBookmarksWithTarget:*(void *)(a1 + 40) initialBookmarks:a2 completionHandler:*(void *)(a1 + 48)];
}

- (void)_validateServerBookmarksWithTarget:(id)a3 initialBookmarks:(id)a4 completionHandler:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_INFO, "Clearing local bookmarks for server bookmark validation", buf, 2u);
  }
  if (shouldRunInCloudKitMode)
  {
    if (shouldSyncDownUsingSecondaryMigration)
    {
      v26 = @"includeMigrationState";
      v27[0] = MEMORY[0x1E4F1CC38];
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    }
    else
    {
      id v12 = 0;
    }
    [(WBSCyclerTestSuiteBookmarkAuxiliary *)self->_bookmarkAuxiliary resetOperation:4];
    bookmarkAuxiliary = self->_bookmarkAuxiliary;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke;
    v21[3] = &unk_1E5C9A618;
    v21[4] = self;
    id v22 = v8;
    id v23 = v9;
    id v24 = v10;
    id v15 = v9;
    id v13 = v8;
    id v14 = v10;
    [(WBSCyclerTestSuiteBookmarkAuxiliary *)bookmarkAuxiliary performOperation:4 withTarget:v13 options:v12 completionHandler:v21];
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_38;
    v17[3] = &unk_1E5C9A640;
    v17[4] = self;
    id v18 = v8;
    id v19 = v9;
    id v20 = v10;
    id v13 = v9;
    id v14 = v8;
    id v12 = v10;
    [v14 clearBookmarksWithOptions:0 completionHandler:v17];

    id v15 = v20;
  }
}

void __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _validateServerBookmarksAfterClearingLocallyWithTarget:*(void *)(a1 + 40) initialBookmarks:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  }
}

void __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_38(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    [v3 _validateServerBookmarksAfterClearingLocallyWithTarget:v4 initialBookmarks:v5 completionHandler:v6];
  }
  else
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_38_cold_1();
    }
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = [*(id *)(a1 + 32) _errorWithCode:0 userInfo:0];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

- (void)_validateServerBookmarksAfterClearingLocallyWithTarget:(id)a3 initialBookmarks:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_INFO, "Cleared local bookmarks for server bookmark validation. Performing sync.", buf, 2u);
  }
  if (shouldRunInCloudKitMode && shouldSyncDownUsingSecondaryMigration)
  {
    [(WBSCyclerBookmarksTestSuite *)self _performCloudKitSecondaryMigrationAfterClearingBookmarksWithTarget:v8 initialBookmarks:v9 completionHandler:v10];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __121__WBSCyclerBookmarksTestSuite__validateServerBookmarksAfterClearingLocallyWithTarget_initialBookmarks_completionHandler___block_invoke;
    v12[3] = &unk_1E5C9A5F0;
    id v14 = v10;
    v12[4] = self;
    id v13 = v9;
    [v8 syncBookmarksWithCompletionHandler:v12];
  }
}

void __121__WBSCyclerBookmarksTestSuite__validateServerBookmarksAfterClearingLocallyWithTarget_initialBookmarks_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Bookmark sync was apparently disabled between initial and final syncs for server validation; skipping validation",
        buf,
        2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if (a2)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_INFO, "Synced bookmarks down after clearing them", v8, 2u);
    }
    [*(id *)(a1 + 32) _performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __121__WBSCyclerBookmarksTestSuite__validateServerBookmarksAfterClearingLocallyWithTarget_initialBookmarks_completionHandler___block_invoke_cold_1();
    }
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = [*(id *)(a1 + 32) _errorWithCode:1 userInfo:0];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)_performCloudKitSecondaryMigrationAfterClearingBookmarksWithTarget:(id)a3 initialBookmarks:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_INFO, "Cleared local bookmarks for server bookmark validation. Performing secondary migration.", buf, 2u);
  }
  [(WBSCyclerTestSuiteBookmarkAuxiliary *)self->_bookmarkAuxiliary resetOperation:3];
  bookmarkAuxiliary = self->_bookmarkAuxiliary;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __133__WBSCyclerBookmarksTestSuite__performCloudKitSecondaryMigrationAfterClearingBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke;
  v15[3] = &unk_1E5C9A668;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  [(WBSCyclerTestSuiteBookmarkAuxiliary *)bookmarkAuxiliary performOperation:3 withTarget:v10 completionHandler:v15];
}

void __133__WBSCyclerBookmarksTestSuite__performCloudKitSecondaryMigrationAfterClearingBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXCycler();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __133__WBSCyclerBookmarksTestSuite__performCloudKitSecondaryMigrationAfterClearingBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Secondary migration succeeded", v6, 2u);
  }
  [*(id *)(a1 + 32) _performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "Performing final validation of bookmarks after clearing and syncing down from server", buf, 2u);
  }
  p_operationContext = &self->_operationContext;
  operationContext = self->_operationContext;
  id v10 = p_operationContext[1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __130__WBSCyclerBookmarksTestSuite__performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks_completionHandler___block_invoke;
  v13[3] = &unk_1E5C8DCF8;
  id v14 = v6;
  id v12 = v6;
  [(WBSCyclerOperationContext *)v10 fetchAndValidateBookmarksWithExpectedBookmarks:v7 context:operationContext completionHandler:v13];
}

void __130__WBSCyclerBookmarksTestSuite__performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXCycler();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __130__WBSCyclerBookmarksTestSuite__performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks_completionHandler___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEFAULT, "Validated server-side bookmarks successfully", v6, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6 = (void *)[a4 mutableCopy];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v9 = v8;

  id v10 = [(WBSCyclerBookmarksTestSuite *)self _descriptionForErrorCode:a3];
  [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSCyclerBookmarksTestSuiteErrorDomain" code:a3 userInfo:v9];

  return v11;
}

- (id)_descriptionForErrorCode:(int64_t)a3
{
  if (a3) {
    return @"Could not sync bookmarks";
  }
  else {
    return @"Could not clear local bookmarks";
  }
}

- (WBSCyclerIterationCounter)iterationCounter
{
  return self->_iterationCounter;
}

- (void)setIterationCounter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterationCounter, 0);
  objc_storeStrong((id *)&self->_expectedTopLevelBookmarksFromPreviousIteration, 0);
  objc_storeStrong((id *)&self->_bookmarkAuxiliary, 0);
  objc_storeStrong((id *)&self->_operationContext, 0);
}

void __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_DEBUG, "Bookmarks are still valid", v1, 2u);
}

void __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Bookmarks have changed since last cycler operation", v2, v3, v4, v5, v6);
}

void __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_DEBUG, "Re-validating bookmarks before performing next operation", v1, 2u);
}

void __84__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to perform initial sync", v2, v3, v4, v5, v6);
}

void __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to clear local bookmarks for server validation", v2, v3, v4, v5, v6);
}

void __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_38_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to clear local bookmarks for server bookmark validation", v2, v3, v4, v5, v6);
}

void __121__WBSCyclerBookmarksTestSuite__validateServerBookmarksAfterClearingLocallyWithTarget_initialBookmarks_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to sync bookmarks back down after clearing bookmarks", v2, v3, v4, v5, v6);
}

void __133__WBSCyclerBookmarksTestSuite__performCloudKitSecondaryMigrationAfterClearingBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Secondary migration failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __130__WBSCyclerBookmarksTestSuite__performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Server validation failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end