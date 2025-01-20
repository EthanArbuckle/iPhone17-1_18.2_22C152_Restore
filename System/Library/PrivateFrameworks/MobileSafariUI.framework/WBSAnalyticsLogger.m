@interface WBSAnalyticsLogger
@end

@implementation WBSAnalyticsLogger

uint64_t __79__WBSAnalyticsLogger_TabGroupsAnalyticsLogger__schedulePeriodicTabGroupsReport__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _performTabGroupsReport];
  [*(id *)(a1 + 32) _performTabsForNonTabGroupUserReport];
  [*(id *)(a1 + 32) _performSyncSuccessesCountReport];
  objc_msgSend(*(id *)(a1 + 32), "_tabGroupsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime");
  v2 = *(void **)(a1 + 32);
  return [v2 schedulePeriodicTabGroupsReport];
}

uint64_t __77__WBSAnalyticsLogger_SettingsAnalyticsLogger__schedulePeriodicSettingsReport__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _performNewTabBehaviorReport];
  objc_msgSend(*(id *)(a1 + 32), "_settingsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime");
  v2 = *(void **)(a1 + 32);
  return [v2 schedulePeriodicSettingsReport];
}

uint64_t __91__WBSAnalyticsLogger_PrivateBrowsingAnalyticsLogger__schedulePeriodicPrivateBrowsingReport__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _performPrivateBrowsingReport];
  [*(id *)(a1 + 32) _performAdvancedPrivacyProtectionPreferenceReport];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setDouble:@"LastPeriodicPrivateBrowsingReportTime" forKey:CFAbsoluteTimeGetCurrent()];

  v3 = *(void **)(a1 + 32);
  return [v3 schedulePeriodicPrivateBrowsingReport];
}

void __78__WBSAnalyticsLogger_BrowsingAssistantAnalyticsLogger___performScribbleReport__block_invoke(uint64_t a1, int a2)
{
  id v3 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v3 reportNumberOfWebsitesWithScribbleActive:a2];
}

uint64_t __87__WBSAnalyticsLogger_BrowsingAssistantAnalyticsLogger__scheduleBrowsingAssistantReport__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _performUserConsentReport];
  [*(id *)(a1 + 32) _performScribbleReport];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setDouble:@"LastPeriodicBrowsingAssistantReportTime" forKey:CFAbsoluteTimeGetCurrent()];

  id v3 = *(void **)(a1 + 32);
  return [v3 scheduleBrowsingAssistantReport];
}

uint64_t __93__WBSAnalyticsLogger_StandaloneTabBarAnalyticsLogger__schedulePeriodicStandaloneTabBarReport__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _performStandaloneTabBarReport];
  objc_msgSend(*(id *)(a1 + 32), "_standaloneTabBarAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime");
  v2 = *(void **)(a1 + 32);
  return [v2 schedulePeriodicStandaloneTabBarReport];
}

@end