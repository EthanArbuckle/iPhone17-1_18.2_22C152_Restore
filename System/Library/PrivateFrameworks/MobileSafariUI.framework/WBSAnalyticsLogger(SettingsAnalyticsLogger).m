@interface WBSAnalyticsLogger(SettingsAnalyticsLogger)
- (void)_performNewTabBehaviorReport;
- (void)_settingsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime;
- (void)schedulePeriodicSettingsReport;
@end

@implementation WBSAnalyticsLogger(SettingsAnalyticsLogger)

- (void)_settingsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 setDouble:@"LastPeriodicSettingsReportTime" forKey:CFAbsoluteTimeGetCurrent()];
}

- (void)_performNewTabBehaviorReport
{
  id v0 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  int v1 = [v0 BOOLForKey:*MEMORY[0x1E4F78740]];

  v2 = [MEMORY[0x1E4F97E48] sharedLogger];
  id v4 = v2;
  if (v1) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 5;
  }
  [v2 reportNewTabBehavior:v3];
}

- (void)schedulePeriodicSettingsReport
{
  dispatch_time_t WeeklyAnalyticsReportForKey = WBSTimeUntilNextWeeklyAnalyticsReportForKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WBSAnalyticsLogger_SettingsAnalyticsLogger__schedulePeriodicSettingsReport__block_invoke;
  block[3] = &unk_1E6D77E20;
  block[4] = a1;
  dispatch_after(WeeklyAnalyticsReportForKey, MEMORY[0x1E4F14428], block);
}

@end