@interface WBSAnalyticsLogger(WBSAnalyticsLoggerExtras)
- (void)reportNumberOfFlaggedPasswordsUsingSavedAccountAuditorIfNeeded:()WBSAnalyticsLoggerExtras;
@end

@implementation WBSAnalyticsLogger(WBSAnalyticsLoggerExtras)

- (void)reportNumberOfFlaggedPasswordsUsingSavedAccountAuditorIfNeeded:()WBSAnalyticsLoggerExtras
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v6 = objc_msgSend(v5, "safari_dateForKey:", @"WBSLastWeakPasswordReportTime");

  if (!v6 || (objc_msgSend(v6, "safari_timeIntervalUntilNow"), v7 <= 43200.0))
  {
    v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v9 = [MEMORY[0x1E4F1C9C8] date];
    objc_msgSend(v8, "safari_setDate:forKey:", v9, @"WBSLastWeakPasswordReportTime");

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __111__WBSAnalyticsLogger_WBSAnalyticsLoggerExtras__reportNumberOfFlaggedPasswordsUsingSavedAccountAuditorIfNeeded___block_invoke;
    v10[3] = &unk_1E5C8C398;
    id v11 = v4;
    [a1 _sendEvent:@"com.apple.Safari.WeakPasswordReport" usingBlock:v10];
  }
}

@end