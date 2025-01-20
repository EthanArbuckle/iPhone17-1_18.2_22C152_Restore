@interface NSUserDefaults
- (BOOL)AllowAutoDownloadsForPurchasesFromOtherDevices;
- (BOOL)BAResetAnalyticsUserID;
- (BOOL)BAResetAnalyticsUserIDTrigger;
- (BOOL)BCWWebRepExternalLoadApprovalCacheClearTrigger;
- (BOOL)BEDocumentExternalLoadApprovalCacheDefaultsClearKey;
- (BOOL)BKFinishedAssetRemovalEnabledKey;
- (BOOL)BKReadingGoalsShouldClearDataKey;
- (BOOL)BKReadingGoalsShouldClearDataTrigger;
- (BOOL)BKReadingGoalsUserDefaultsKey;
- (BOOL)readerShowStatusBar;
- (void)setAllowAutoDownloadsForPurchasesFromOtherDevices:(BOOL)a3;
- (void)setBAResetAnalyticsUserID:(BOOL)a3;
- (void)setBAResetAnalyticsUserIDTrigger:(BOOL)a3;
- (void)setBCWWebRepExternalLoadApprovalCacheClearTrigger:(BOOL)a3;
- (void)setBEDocumentExternalLoadApprovalCacheDefaultsClearKey:(BOOL)a3;
- (void)setBKFinishedAssetRemovalEnabledKey:(BOOL)a3;
- (void)setBKReadingGoalsShouldClearDataKey:(BOOL)a3;
- (void)setBKReadingGoalsShouldClearDataTrigger:(BOOL)a3;
- (void)setBKReadingGoalsUserDefaultsKey:(BOOL)a3;
@end

@implementation NSUserDefaults

- (BOOL)readerShowStatusBar
{
  v2 = self;
  NSString v3 = sub_1007FDC30();
  unsigned __int8 v4 = [(NSUserDefaults *)v2 BOOLForKey:v3];

  return v4;
}

- (BOOL)BKReadingGoalsShouldClearDataTrigger
{
  return sub_1006C7684(self);
}

- (void)setBKReadingGoalsShouldClearDataTrigger:(BOOL)a3
{
}

- (BOOL)BKReadingGoalsShouldClearDataKey
{
  return sub_1006C7684(self);
}

- (void)setBKReadingGoalsShouldClearDataKey:(BOOL)a3
{
}

- (BOOL)BAResetAnalyticsUserIDTrigger
{
  return sub_1006C7684(self);
}

- (void)setBAResetAnalyticsUserIDTrigger:(BOOL)a3
{
}

- (BOOL)BCWWebRepExternalLoadApprovalCacheClearTrigger
{
  return sub_1006C7684(self);
}

- (void)setBCWWebRepExternalLoadApprovalCacheClearTrigger:(BOOL)a3
{
}

- (BOOL)AllowAutoDownloadsForPurchasesFromOtherDevices
{
  return sub_1006C7684(self);
}

- (void)setAllowAutoDownloadsForPurchasesFromOtherDevices:(BOOL)a3
{
}

- (BOOL)BEDocumentExternalLoadApprovalCacheDefaultsClearKey
{
  return [(NSUserDefaults *)self BOOLForKey:BEDocumentExternalLoadApprovalCacheDefaultsClearKey];
}

- (void)setBEDocumentExternalLoadApprovalCacheDefaultsClearKey:(BOOL)a3
{
}

- (BOOL)BAResetAnalyticsUserID
{
  return [(NSUserDefaults *)self BOOLForKey:kBAResetAnalyticsUserID];
}

- (void)setBAResetAnalyticsUserID:(BOOL)a3
{
}

- (BOOL)BKReadingGoalsUserDefaultsKey
{
  return sub_1006C7684(self);
}

- (void)setBKReadingGoalsUserDefaultsKey:(BOOL)a3
{
}

- (BOOL)BKFinishedAssetRemovalEnabledKey
{
  return sub_1006C7684(self);
}

- (void)setBKFinishedAssetRemovalEnabledKey:(BOOL)a3
{
}

@end