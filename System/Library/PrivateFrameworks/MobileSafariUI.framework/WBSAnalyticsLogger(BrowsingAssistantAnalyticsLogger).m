@interface WBSAnalyticsLogger(BrowsingAssistantAnalyticsLogger)
- (void)_performScribbleReport;
- (void)_performUserConsentReport;
- (void)scheduleBrowsingAssistantReport;
@end

@implementation WBSAnalyticsLogger(BrowsingAssistantAnalyticsLogger)

- (void)_performUserConsentReport
{
  if ([MEMORY[0x1E4F989E8] isAvailableInCurrentLocale])
  {
    id v1 = [MEMORY[0x1E4F97E48] sharedLogger];
    [MEMORY[0x1E4F989E8] userConsentState];
    v0 = WBSBrowsingAssistantConsentStateName();
    [v1 reportUserConsentStateSBA:v0];
  }
}

- (void)_performScribbleReport
{
  id v1 = +[Application sharedApplication];
  v0 = [v1 userDefinedContentBlockerManager];
  [v0 getNumberOfContentBlockersThatContainActionsWithCompletionHandler:&__block_literal_global_68];
}

- (void)scheduleBrowsingAssistantReport
{
  dispatch_time_t WeeklyAnalyticsReportForKey = WBSTimeUntilNextWeeklyAnalyticsReportForKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__WBSAnalyticsLogger_BrowsingAssistantAnalyticsLogger__scheduleBrowsingAssistantReport__block_invoke;
  block[3] = &unk_1E6D77E20;
  block[4] = a1;
  dispatch_after(WeeklyAnalyticsReportForKey, MEMORY[0x1E4F14428], block);
}

@end