@interface WBSIgnoredSiriSuggestedSitesController
+ (WBSIgnoredSiriSuggestedSitesController)sharedController;
+ (id)_databaseURL;
- (WBSIgnoredSiriSuggestedSitesController)initWithDatabaseURL:(id)a3;
- (id)databaseController;
- (void)_pruneIgnoredSiriSuggestedSitesIfNeeded;
- (void)addIgnoredSiriSuggestedSiteWithURLString:(id)a3 inProfile:(id)a4 withQuery:(id)a5 visitedURLString:(id)a6;
- (void)dealloc;
- (void)getIgnoredSiriSuggestedSitesURLStringsInProfile:(id)a3 withQuery:(id)a4 completionHandler:(id)a5;
- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3;
- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 afterDate:(id)a4;
- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4;
- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 visitedURLHost:(id)a4;
- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 visitedURLHost:(id)a4 completionHandler:(id)a5;
- (void)removeIgnoredSiriSuggestedSitesWithURLHost:(id)a3 inProfile:(id)a4;
- (void)updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4 visitedURLString:(id)a5;
@end

@implementation WBSIgnoredSiriSuggestedSitesController

+ (id)_databaseURL
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = objc_msgSend(v2, "safari_settingsDirectoryURL");
  v4 = [v3 URLByAppendingPathComponent:@"IgnoredSiriSuggestedSites.db" isDirectory:0];

  return v4;
}

+ (WBSIgnoredSiriSuggestedSitesController)sharedController
{
  if (+[WBSIgnoredSiriSuggestedSitesController sharedController]::onceToken != -1) {
    dispatch_once(&+[WBSIgnoredSiriSuggestedSitesController sharedController]::onceToken, &__block_literal_global_74);
  }
  v2 = (void *)+[WBSIgnoredSiriSuggestedSitesController sharedController]::controller;
  return (WBSIgnoredSiriSuggestedSitesController *)v2;
}

void __58__WBSIgnoredSiriSuggestedSitesController_sharedController__block_invoke()
{
  v0 = [[WBSIgnoredSiriSuggestedSitesController alloc] initWithDatabaseURL:0];
  v1 = (void *)+[WBSIgnoredSiriSuggestedSitesController sharedController]::controller;
  +[WBSIgnoredSiriSuggestedSitesController sharedController]::controller = (uint64_t)v0;
}

- (WBSIgnoredSiriSuggestedSitesController)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSIgnoredSiriSuggestedSitesController;
  v5 = [(WBSIgnoredSiriSuggestedSitesController *)&v17 init];
  if (v5)
  {
    v6 = [WBSIgnoredSiriSuggestedSitesDatabaseController alloc];
    v7 = v4;
    if (!v4)
    {
      v7 = [(id)objc_opt_class() _databaseURL];
    }
    uint64_t v8 = [(WBSSQLiteStore *)v6 initWithURL:v7];
    databaseController = v5->_databaseController;
    v5->_databaseController = (WBSIgnoredSiriSuggestedSitesDatabaseController *)v8;

    if (!v4) {
    v10 = v5->_databaseController;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__WBSIgnoredSiriSuggestedSitesController_initWithDatabaseURL___block_invoke;
    v14[3] = &unk_1E5C9DB78;
    id v15 = v4;
    v11 = v5;
    v16 = v11;
    [(WBSSQLiteStore *)v10 openAndCheckIntegrity:1 createIfNeeded:1 fallBackToMemoryStoreIfError:0 lockingPolicy:0 completionHandler:v14];
    v12 = v11;
  }
  return v5;
}

void __62__WBSIgnoredSiriSuggestedSitesController_initWithDatabaseURL___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXSiriSuggestedSites();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v5;
      if (!v5)
      {
        v6 = [(id)objc_opt_class() _databaseURL];
      }
      int v7 = 134218243;
      uint64_t v8 = a2;
      __int16 v9 = 2117;
      v10 = v6;
      _os_log_error_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_ERROR, "Failed to open the ignored suggested sites database. Error code: %ld URL: %{sensitive}@", (uint8_t *)&v7, 0x16u);
      if (!v5) {
    }
      }
  }
}

- (void)dealloc
{
  [(WBSIgnoredSiriSuggestedSitesController *)self _pruneIgnoredSiriSuggestedSitesIfNeeded];
  [(WBSSQLiteStore *)self->_databaseController savePendingChangesBeforeTermination];
  v3.receiver = self;
  v3.super_class = (Class)WBSIgnoredSiriSuggestedSitesController;
  [(WBSIgnoredSiriSuggestedSitesController *)&v3 dealloc];
}

- (id)databaseController
{
  [(WBSIgnoredSiriSuggestedSitesController *)self _pruneIgnoredSiriSuggestedSitesIfNeeded];
  databaseController = self->_databaseController;
  return databaseController;
}

- (void)addIgnoredSiriSuggestedSiteWithURLString:(id)a3 inProfile:(id)a4 withQuery:(id)a5 visitedURLString:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(WBSIgnoredSiriSuggestedSitesController *)self databaseController];
  [v13 addIgnoredSiriSuggestedSiteWithURLString:v14 inProfile:v10 withQuery:v11 visitedURLString:v12];
}

- (void)updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4 visitedURLString:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(WBSIgnoredSiriSuggestedSitesController *)self databaseController];
  [v10 updateTimestampsOfIgnoredSiriSuggestedSitesInProfile:v11 query:v8 visitedURLString:v9];
}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3
{
  id v5 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(WBSIgnoredSiriSuggestedSitesController *)self removeIgnoredSiriSuggestedSitesInProfile:v5 afterDate:v4];
}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 afterDate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  int v7 = [(WBSIgnoredSiriSuggestedSitesController *)self databaseController];
  [v7 removeIgnoredSiriSuggestedSitesInProfile:v8 afterDate:v6];
}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 query:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  int v7 = [(WBSIgnoredSiriSuggestedSitesController *)self databaseController];
  [v7 removeIgnoredSiriSuggestedSitesInProfile:v8 query:v6];
}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 visitedURLHost:(id)a4
{
}

- (void)removeIgnoredSiriSuggestedSitesInProfile:(id)a3 visitedURLHost:(id)a4 completionHandler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(WBSIgnoredSiriSuggestedSitesController *)self databaseController];
  [v10 removeIgnoredSiriSuggestedSitesInProfile:v11 visitedURLHost:v8 completionHandler:v9];
}

- (void)removeIgnoredSiriSuggestedSitesWithURLHost:(id)a3 inProfile:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  int v7 = [(WBSIgnoredSiriSuggestedSitesController *)self databaseController];
  [v7 removeIgnoredSiriSuggestedSitesWithURLHost:v8 inProfile:v6];
}

- (void)getIgnoredSiriSuggestedSitesURLStringsInProfile:(id)a3 withQuery:(id)a4 completionHandler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(WBSIgnoredSiriSuggestedSitesController *)self databaseController];
  [v10 getIgnoredSiriSuggestedSitesURLStringsInProfile:v11 withQuery:v8 completionHandler:v9];
}

- (void)_pruneIgnoredSiriSuggestedSitesIfNeeded
{
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v3 doubleForKey:@"WBSDebugIgnoredSiriSuggestedSitesPruningTimeIntervalOverride"];
  double v5 = v4;

  if (([MEMORY[0x1E4F97EA0] isInternalInstall] & (v5 != 0.0)) != 0) {
    double v6 = v5;
  }
  else {
    double v6 = 86400.0;
  }
  if (!self->_dateOfLastPruning
    || ([MEMORY[0x1E4F1C9C8] now],
        int v7 = objc_claimAutoreleasedReturnValue(),
        [v7 timeIntervalSinceDate:self->_dateOfLastPruning],
        double v9 = v8,
        v7,
        v9 >= v6))
  {
    id v10 = [MEMORY[0x1E4F1C9C8] now];
    dateOfLastPruning = self->_dateOfLastPruning;
    self->_dateOfLastPruning = v10;

    databaseController = self->_databaseController;
    [(WBSIgnoredSiriSuggestedSitesDatabaseController *)databaseController pruneIgnoredSiriSuggestedSites];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastPruning, 0);
  objc_storeStrong((id *)&self->_databaseController, 0);
}

@end