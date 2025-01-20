@interface WBSCyclerCloudKitMigrationTestSuite
+ (BOOL)setValue:(id)a3 forConfigurationKey:(id)a4;
- (BOOL)isFinished;
- (WBSCyclerCloudKitMigrationTestSuite)init;
- (id)_descriptionForErrorCode:(int64_t)a3;
- (id)_errorWithCode:(int64_t)a3;
- (void)_createRandomBookmarkWithTarget:(id)a3 completionHandler:(id)a4;
- (void)_fetchBookmarksPriorToMigrationWithTarget:(id)a3 completionHandler:(id)a4;
- (void)_generateDAVServerIDsForExistingBookmarksWithTarget:(id)a3 completionHandler:(id)a4;
- (void)_migrateToCloudKitWithTarget:(id)a3 completionHandler:(id)a4;
- (void)_validateResultsOfMigrationWithTarget:(id)a3 completionHandler:(id)a4;
- (void)runWithTarget:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCyclerCloudKitMigrationTestSuite

- (WBSCyclerCloudKitMigrationTestSuite)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSCyclerCloudKitMigrationTestSuite;
  v2 = [(WBSCyclerCloudKitMigrationTestSuite *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(WBSCyclerTestSuiteBookmarkAuxiliary);
    bookmarkAuxiliary = v2->_bookmarkAuxiliary;
    v2->_bookmarkAuxiliary = v3;

    v5 = v2;
  }

  return v2;
}

- (void)runWithTarget:(id)a3 completionHandler:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!shouldMigrateExistingBookmarks
    && ![(WBSCyclerTestSuiteBookmarkAuxiliary *)self->_bookmarkAuxiliary hasPerformedOperation:0])
  {
    v23 = @"forCloudKitTest";
    v24[0] = MEMORY[0x1E4F1CC38];
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    bookmarkAuxiliary = self->_bookmarkAuxiliary;
    uint64_t v16 = 0;
    goto LABEL_20;
  }
  if (![(WBSCyclerTestSuiteBookmarkAuxiliary *)self->_bookmarkAuxiliary hasPerformedOperation:1])
  {
    v8 = self->_bookmarkAuxiliary;
    uint64_t v9 = 1;
    goto LABEL_8;
  }
  if (shouldMigrateExistingBookmarks || self->_bookmarksGeneratedPriorToMigration > 0x63)
  {
    if (![(WBSCyclerTestSuiteBookmarkAuxiliary *)self->_bookmarkAuxiliary hasPerformedOperation:2])
    {
      [(WBSCyclerCloudKitMigrationTestSuite *)self _generateDAVServerIDsForExistingBookmarksWithTarget:v6 completionHandler:v7];
      goto LABEL_21;
    }
    v10 = self->_bookmarkAuxiliary;
    if (!self->_hasValidatedResultsOfPrimaryMigration)
    {
      if (![(WBSCyclerTestSuiteBookmarkAuxiliary *)v10 hasPerformedOperation:3])
      {
        [(WBSCyclerCloudKitMigrationTestSuite *)self _migrateToCloudKitWithTarget:v6 completionHandler:v7];
        goto LABEL_21;
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __71__WBSCyclerCloudKitMigrationTestSuite_runWithTarget_completionHandler___block_invoke;
      v19[3] = &unk_1E5C8DC00;
      v19[4] = self;
      id v20 = v7;
      [(WBSCyclerCloudKitMigrationTestSuite *)self _validateResultsOfMigrationWithTarget:v6 completionHandler:v19];
      v13 = v20;
      goto LABEL_18;
    }
    BOOL v11 = [(WBSCyclerTestSuiteBookmarkAuxiliary *)v10 hasPerformedOperation:4];
    v12 = self->_bookmarkAuxiliary;
    if (v11)
    {
      if ([(WBSCyclerTestSuiteBookmarkAuxiliary *)v12 hasPerformedOperation:3])
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __71__WBSCyclerCloudKitMigrationTestSuite_runWithTarget_completionHandler___block_invoke_2;
        v17[3] = &unk_1E5C8DC00;
        v17[4] = self;
        id v18 = v7;
        [(WBSCyclerCloudKitMigrationTestSuite *)self _validateResultsOfMigrationWithTarget:v6 completionHandler:v17];
        v13 = v18;
LABEL_18:

        goto LABEL_21;
      }
      v8 = self->_bookmarkAuxiliary;
      uint64_t v9 = 3;
LABEL_8:
      [(WBSCyclerTestSuiteBookmarkAuxiliary *)v8 performOperation:v9 withTarget:v6 completionHandler:v7];
      goto LABEL_21;
    }
    [(WBSCyclerTestSuiteBookmarkAuxiliary *)v12 resetOperation:3];
    v21 = @"includeMigrationState";
    uint64_t v22 = MEMORY[0x1E4F1CC38];
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    bookmarkAuxiliary = self->_bookmarkAuxiliary;
    uint64_t v16 = 4;
LABEL_20:
    [(WBSCyclerTestSuiteBookmarkAuxiliary *)bookmarkAuxiliary performOperation:v16 withTarget:v6 options:v14 completionHandler:v7];

    goto LABEL_21;
  }
  [(WBSCyclerCloudKitMigrationTestSuite *)self _createRandomBookmarkWithTarget:v6 completionHandler:v7];
LABEL_21:
}

uint64_t __71__WBSCyclerCloudKitMigrationTestSuite_runWithTarget_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = a2 == 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __71__WBSCyclerCloudKitMigrationTestSuite_runWithTarget_completionHandler___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)setValue:(id)a3 forConfigurationKey:(id)a4
{
  id v5 = a3;
  int v6 = [a4 isEqualToString:@"migrate-existing-bookmarks"];
  if (v6)
  {
    int v7 = [v5 BOOLValue];
    shouldMigrateExistingBookmarks = v7;
    v8 = WBS_LOG_CHANNEL_PREFIXCycler();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        __int16 v14 = 0;
        v10 = "Migration test will migrate existing bookmarks at ~/Library/Safari/Bookmarks.plist";
        BOOL v11 = (uint8_t *)&v14;
LABEL_7:
        _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, v10, v11, 2u);
      }
    }
    else if (v9)
    {
      __int16 v13 = 0;
      v10 = "Migration test will wipe all existing bookmarks and generate random ones prior to migration";
      BOOL v11 = (uint8_t *)&v13;
      goto LABEL_7;
    }
  }

  return v6;
}

- (void)_createRandomBookmarkWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__WBSCyclerCloudKitMigrationTestSuite__createRandomBookmarkWithTarget_completionHandler___block_invoke;
  v10[3] = &unk_1E5C9A5C8;
  id v11 = v6;
  v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [v9 fetchTopLevelBookmarkList:v10];
}

void __89__WBSCyclerCloudKitMigrationTestSuite__createRandomBookmarkWithTarget_completionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(WBSCyclerOperationContext);
  [(WBSCyclerOperationContext *)v4 setTestTarget:a1[4]];
  [(WBSCyclerOperationContext *)v4 setTopLevelItem:v3];

  id v5 = objc_alloc_init(WBSCyclerCreateBookmarkOperation);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__WBSCyclerCloudKitMigrationTestSuite__createRandomBookmarkWithTarget_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5C9A5C8;
  id v6 = (void *)a1[6];
  v8[4] = a1[5];
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  [(WBSCyclerCreateBookmarkOperation *)v5 executeWithContext:v7 completionHandler:v8];
}

void __89__WBSCyclerCloudKitMigrationTestSuite__createRandomBookmarkWithTarget_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v3 + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__WBSCyclerCloudKitMigrationTestSuite__createRandomBookmarkWithTarget_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5C8DC00;
  v6[4] = v3;
  id v7 = *(id *)(a1 + 48);
  [v5 fetchAndValidateBookmarksWithExpectedBookmarks:a2 context:v4 completionHandler:v6];
}

uint64_t __89__WBSCyclerCloudKitMigrationTestSuite__createRandomBookmarkWithTarget_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    ++*(void *)(*(void *)(a1 + 32) + 16);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_generateDAVServerIDsForExistingBookmarksWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "Generating DAV server IDs for new bookmarks", buf, 2u);
  }
  bookmarkAuxiliary = self->_bookmarkAuxiliary;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __109__WBSCyclerCloudKitMigrationTestSuite__generateDAVServerIDsForExistingBookmarksWithTarget_completionHandler___block_invoke;
  v11[3] = &unk_1E5C8DCF8;
  id v12 = v6;
  id v10 = v6;
  [(WBSCyclerTestSuiteBookmarkAuxiliary *)bookmarkAuxiliary performOperation:2 withTarget:v7 completionHandler:v11];
}

void __109__WBSCyclerCloudKitMigrationTestSuite__generateDAVServerIDsForExistingBookmarksWithTarget_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXCycler();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __109__WBSCyclerCloudKitMigrationTestSuite__generateDAVServerIDsForExistingBookmarksWithTarget_completionHandler___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEFAULT, "Generated DAV server IDs for new bookmarks", v6, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchBookmarksPriorToMigrationWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "Fetching bookmarks prior to CloudKit migration", buf, 2u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__WBSCyclerCloudKitMigrationTestSuite__fetchBookmarksPriorToMigrationWithTarget_completionHandler___block_invoke;
  v10[3] = &unk_1E5C9A5A0;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 fetchTopLevelBookmarkList:v10];
}

void __99__WBSCyclerCloudKitMigrationTestSuite__fetchBookmarksPriorToMigrationWithTarget_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__WBSCyclerCloudKitMigrationTestSuite__fetchBookmarksPriorToMigrationWithTarget_completionHandler___block_invoke_2;
  block[3] = &unk_1E5C8C8F8;
  uint64_t v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __99__WBSCyclerCloudKitMigrationTestSuite__fetchBookmarksPriorToMigrationWithTarget_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)_migrateToCloudKitWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__WBSCyclerCloudKitMigrationTestSuite__migrateToCloudKitWithTarget_completionHandler___block_invoke;
  v10[3] = &unk_1E5C8C8F8;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(WBSCyclerCloudKitMigrationTestSuite *)self _fetchBookmarksPriorToMigrationWithTarget:v9 completionHandler:v10];
}

uint64_t __86__WBSCyclerCloudKitMigrationTestSuite__migrateToCloudKitWithTarget_completionHandler___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) performOperation:3 withTarget:a1[5] completionHandler:a1[6]];
}

- (void)_validateResultsOfMigrationWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(WBSCyclerOperationContext);
  [(WBSCyclerOperationContext *)v8 setTestTarget:v7];

  bookmarkAuxiliary = self->_bookmarkAuxiliary;
  topLevelBookmarksPriorToMigration = self->_topLevelBookmarksPriorToMigration;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__WBSCyclerCloudKitMigrationTestSuite__validateResultsOfMigrationWithTarget_completionHandler___block_invoke;
  v12[3] = &unk_1E5C8DC00;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(WBSCyclerTestSuiteBookmarkAuxiliary *)bookmarkAuxiliary fetchAndValidateBookmarksWithExpectedBookmarks:topLevelBookmarksPriorToMigration context:v8 completionHandler:v12];
}

void __95__WBSCyclerCloudKitMigrationTestSuite__validateResultsOfMigrationWithTarget_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 32)) {
    uint64_t v4 = @"secondary";
  }
  else {
    uint64_t v4 = @"primary";
  }
  id v5 = v4;
  id v6 = WBS_LOG_CHANNEL_PREFIXCycler();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __95__WBSCyclerCloudKitMigrationTestSuite__validateResultsOfMigrationWithTarget_completionHandler___block_invoke_cold_1((uint64_t)v5, (uint64_t)v3, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_DEFAULT, "Validated results of %{public}@ migration successfully", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_errorWithCode:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  id v5 = -[WBSCyclerCloudKitMigrationTestSuite _descriptionForErrorCode:](self, "_descriptionForErrorCode:");
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v4 errorWithDomain:@"WBSCyclerCloudKitMigrationTestSuiteErrorDomain" code:a3 userInfo:v6];

  return v7;
}

- (id)_descriptionForErrorCode:(int64_t)a3
{
  return @"Not implemented yet. See <rdar://problem/28898761>.";
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLevelBookmarksPriorToMigration, 0);
  objc_storeStrong((id *)&self->_bookmarkAuxiliary, 0);
}

void __109__WBSCyclerCloudKitMigrationTestSuite__generateDAVServerIDsForExistingBookmarksWithTarget_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Failed to generate DAV server IDs for new bookmarks: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __95__WBSCyclerCloudKitMigrationTestSuite__validateResultsOfMigrationWithTarget_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to validate %{public}@ migration results: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end