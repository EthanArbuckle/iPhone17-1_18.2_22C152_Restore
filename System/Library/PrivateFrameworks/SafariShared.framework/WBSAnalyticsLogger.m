@interface WBSAnalyticsLogger
@end

@implementation WBSAnalyticsLogger

id __111__WBSAnalyticsLogger_WBSAnalyticsLoggerExtras__reportNumberOfFlaggedPasswordsUsingSavedAccountAuditorIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) savedAccountStore];
  v3 = [v2 savedAccountsWithPasswords];

  v4 = [*(id *)(a1 + 32) duplicatePasswordsInPasswords:v3];
  unint64_t v5 = [v4 count];
  unint64_t v21 = [v3 count];
  v6 = [MEMORY[0x1E4F97F58] standardPasswordEvaluator];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v12 userIsNeverSaveMarker] & 1) == 0
          && ([v4 containsObject:v12] & 1) == 0)
        {
          v13 = [v12 password];
          v14 = [v6 evaluatePassword:v13];
          unsigned int v15 = [v14 userShouldBeShownPassiveWarning];

          v5 += v15;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }

  v26[0] = @"numberOfFlaggedPasswords";
  v16 = [NSNumber numberWithUnsignedInteger:v5];
  v27[0] = v16;
  v26[1] = @"totalNumberOfPasswords";
  v17 = [NSNumber numberWithUnsignedInteger:v21];
  v27[1] = v17;
  v26[2] = @"percentageOfFlaggedPasswords";
  v18 = [NSNumber numberWithUnsignedInteger:(unint64_t)((double)v5 * 100.0 / (double)v21)];
  v27[2] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];

  return v19;
}

@end