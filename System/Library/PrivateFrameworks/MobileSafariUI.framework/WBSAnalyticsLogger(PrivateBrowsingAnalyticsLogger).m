@interface WBSAnalyticsLogger(PrivateBrowsingAnalyticsLogger)
- (void)_performAdvancedPrivacyProtectionPreferenceReport;
- (void)_performPrivateBrowsingReport;
- (void)schedulePeriodicPrivateBrowsingReport;
@end

@implementation WBSAnalyticsLogger(PrivateBrowsingAnalyticsLogger)

- (void)_performPrivateBrowsingReport
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v0 = +[Application sharedApplication];
  v1 = [v0 browserControllers];

  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    char v4 = 0;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v1);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v7 isPrivateBrowsingEnabled])
        {
          v8 = [v7 scene];

          if (v8)
          {

            uint64_t v9 = 0;
            goto LABEL_16;
          }
          char v4 = 1;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }

    if (v4)
    {
      uint64_t v9 = 1;
      goto LABEL_16;
    }
  }
  else
  {
  }
  uint64_t v9 = 2;
LABEL_16:
  v10 = [MEMORY[0x1E4F97E48] sharedLogger];
  objc_msgSend(v10, "_sf_reportPrivateWindowStatus:", v9);
}

- (void)_performAdvancedPrivacyProtectionPreferenceReport
{
  id v0 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v0 reportAdvancedPrivacyProtectionPreference];
}

- (void)schedulePeriodicPrivateBrowsingReport
{
  dispatch_time_t WeeklyAnalyticsReportForKey = WBSTimeUntilNextWeeklyAnalyticsReportForKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__WBSAnalyticsLogger_PrivateBrowsingAnalyticsLogger__schedulePeriodicPrivateBrowsingReport__block_invoke;
  block[3] = &unk_1E6D77E20;
  block[4] = a1;
  dispatch_after(WeeklyAnalyticsReportForKey, MEMORY[0x1E4F14428], block);
}

@end