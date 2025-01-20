@interface WBSUnifiedBarAnalyticsRecorder
- (WBSUnifiedBarAnalyticsRecorderDelegate)delegate;
- (void)_reportAnalytics;
- (void)schedulePeriodicReport;
- (void)setDelegate:(id)a3;
@end

@implementation WBSUnifiedBarAnalyticsRecorder

- (void)schedulePeriodicReport
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB00]);
  v4 = [MEMORY[0x1E4F1C9C8] now];
  id v6 = (id)[v3 initWithFireDate:v4 interval:self target:sel__reportAnalytics selector:0 userInfo:1 repeats:600.0];

  v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v5 addTimer:v6 forMode:*MEMORY[0x1E4F1C3A0]];
}

- (void)_reportAnalytics
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained unifiedBarAnalyticsProvider];

  if ([v4 shouldReportUnifiedTabBarAnalytics])
  {
    id v3 = +[WBSAnalyticsLogger sharedLogger];
    objc_msgSend(v3, "reportUnifiedTabBarStatusWithLayout:numberOfTabsInCurrentTabBar:tabBarIsCurrentlyScrollable:tabsShowOnlyIcons:backgroundColorInTabBarEnabled:", objc_msgSend(v4, "unifiedTabBarLayoutStyle"), objc_msgSend(v4, "numberOfTabsInCurrentTabBar"), objc_msgSend(v4, "tabBarIsCurrentlyScrollable"), objc_msgSend(v4, "tabsShowOnlyIcons"), objc_msgSend(v4, "backgroundColorInTabBarEnabled"));
  }
}

- (WBSUnifiedBarAnalyticsRecorderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSUnifiedBarAnalyticsRecorderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end