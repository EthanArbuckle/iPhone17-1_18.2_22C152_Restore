@interface BookmarksDatabaseHealthReporter
- (BOOL)_shouldReportDatabaseHealth;
- (id)_userDefaults;
- (void)reportDatabaseHealth;
@end

@implementation BookmarksDatabaseHealthReporter

- (id)_userDefaults
{
  return (id)[MEMORY[0x1E4F1CB18] standardUserDefaults];
}

- (BOOL)_shouldReportDatabaseHealth
{
  double lastReportTimeInterval = self->_lastReportTimeInterval;
  if (lastReportTimeInterval == 0.0)
  {
    v4 = [(BookmarksDatabaseHealthReporter *)self _userDefaults];
    v5 = objc_msgSend(v4, "safari_dateForKey:", @"LastBookmarksDatabaseHealthReportDate");

    [v5 timeIntervalSinceReferenceDate];
    self->_double lastReportTimeInterval = v6;

    double lastReportTimeInterval = self->_lastReportTimeInterval;
  }
  double v7 = lastReportTimeInterval + 604800.0;
  v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceReferenceDate];
  BOOL v10 = v7 < v9;

  return v10;
}

- (void)reportDatabaseHealth
{
  if ([(BookmarksDatabaseHealthReporter *)self _shouldReportDatabaseHealth])
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceReferenceDate];
    self->_double lastReportTimeInterval = v4;
    uint64_t v5 = *MEMORY[0x1E4FB2748];
    double v6 = (void *)*MEMORY[0x1E4FB2608];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__BookmarksDatabaseHealthReporter_reportDatabaseHealth__block_invoke;
    v13[3] = &__block_descriptor_40_e5_v8__0l;
    v13[4] = v5;
    uint64_t v7 = [v6 beginBackgroundTaskWithName:@"com.apple.mobilesafari.BookmarksDatabaseHealthReporter" expirationHandler:v13];
    v8 = dispatch_get_global_queue(17, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__BookmarksDatabaseHealthReporter_reportDatabaseHealth__block_invoke_2;
    v10[3] = &unk_1E6D78A48;
    v10[4] = self;
    id v11 = v3;
    uint64_t v12 = v7;
    id v9 = v3;
    dispatch_async(v8, v10);
  }
}

uint64_t __55__BookmarksDatabaseHealthReporter_reportDatabaseHealth__block_invoke(uint64_t a1)
{
  return [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(a1 + 32)];
}

void __55__BookmarksDatabaseHealthReporter_reportDatabaseHealth__block_invoke_2(uint64_t a1)
{
  id v7 = (id)[objc_alloc(MEMORY[0x1E4FB60F0]) initReadonlySafariBookmarkCollection];
  v2 = [v7 databaseHealthInformation];
  uint64_t v3 = [v2 topLevelDuplicateBookmarksCount];
  uint64_t v4 = [v2 allDuplicateBookmarksCount];
  uint64_t v5 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v5 reportNumberOfDuplicateBookmarksWithTopLevelDuplicatesCount:v3 allDuplicatesCount:v4];

  double v6 = [*(id *)(a1 + 32) _userDefaults];
  [v6 setObject:*(void *)(a1 + 40) forKey:@"LastBookmarksDatabaseHealthReportDate"];
  [v6 synchronize];
  [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(a1 + 48)];
}

@end