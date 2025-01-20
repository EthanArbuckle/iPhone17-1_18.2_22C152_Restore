@interface WBSAnalyticsLogger(StandaloneTabBarAnalyticsLogger)
- (void)_performStandaloneTabBarReport;
- (void)_standaloneTabBarAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime;
- (void)schedulePeriodicStandaloneTabBarReport;
@end

@implementation WBSAnalyticsLogger(StandaloneTabBarAnalyticsLogger)

- (void)_standaloneTabBarAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 setDouble:@"LastPeriodicStandaloneTabBarReportTime" forKey:CFAbsoluteTimeGetCurrent()];
}

- (void)_performStandaloneTabBarReport
{
  id v1 = [MEMORY[0x1E4F97E48] sharedLogger];
  id v0 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  objc_msgSend(v1, "reportShowStandaloneTabBarPreference:", objc_msgSend(v0, "BOOLForKey:", *MEMORY[0x1E4F786E0]));
}

- (void)schedulePeriodicStandaloneTabBarReport
{
  dispatch_time_t WeeklyAnalyticsReportForKey = WBSTimeUntilNextWeeklyAnalyticsReportForKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__WBSAnalyticsLogger_StandaloneTabBarAnalyticsLogger__schedulePeriodicStandaloneTabBarReport__block_invoke;
  block[3] = &unk_1E6D77E20;
  block[4] = a1;
  dispatch_after(WeeklyAnalyticsReportForKey, MEMORY[0x1E4F14428], block);
}

@end