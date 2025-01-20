@interface UNNotificationRequest(HKMentalHealth)
+ (id)_contentForCategoryIdentifier:()HKMentalHealth;
+ (id)hkmh_requestForCategoryIdentifier:()HKMentalHealth;
@end

@implementation UNNotificationRequest(HKMentalHealth)

+ (id)hkmh_requestForCategoryIdentifier:()HKMentalHealth
{
  id v4 = a3;
  v5 = [a1 _contentForCategoryIdentifier:v4];
  v6 = [MEMORY[0x263F1DF48] requestWithIdentifier:v4 content:v5 trigger:0];

  return v6;
}

+ (id)_contentForCategoryIdentifier:()HKMentalHealth
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  id v5 = v3;
  if (([v5 isEqualToString:@"MentalHealthAppPlugin.CustomReminder"] & 1) != 0
    || ([v5 isEqualToString:@"MentalHealthAppPlugin.MiddayReminder"] & 1) != 0)
  {
    v6 = @"NOTIFICATION_STATE_OF_MIND_MOMENTARY_TITLE";
  }
  else if ([v5 isEqualToString:@"MentalHealthAppPlugin.EndOfDayReminder"])
  {
    v6 = @"NOTIFICATION_STATE_OF_MIND_DAILY_TITLE";
  }
  else
  {
    if (![v5 isEqualToString:@"MentalHealthAppPlugin.PeriodicPromptedAssessmentReminder"])
    {
      v7 = 0;
      goto LABEL_5;
    }
    v6 = @"NOTIFICATION_PERIODIC_PROMPTED_ASSESSMENTS_TITLE";
  }
  v7 = HKMHLocalizedString(v6);
LABEL_5:

  [v4 setTitle:v7];
  id v8 = v5;
  if (([v8 isEqualToString:@"MentalHealthAppPlugin.CustomReminder"] & 1) != 0
    || ([v8 isEqualToString:@"MentalHealthAppPlugin.MiddayReminder"] & 1) != 0)
  {
    v9 = @"NOTIFICATION_STATE_OF_MIND_MOMENTARY_BODY";
LABEL_8:
    v10 = HKMHLocalizedString(v9);
    goto LABEL_9;
  }
  if ([v8 isEqualToString:@"MentalHealthAppPlugin.EndOfDayReminder"])
  {
    v9 = @"NOTIFICATION_STATE_OF_MIND_DAILY_BODY";
    goto LABEL_8;
  }
  if ([v8 isEqualToString:@"MentalHealthAppPlugin.PeriodicPromptedAssessmentReminder"])
  {
    v9 = @"NOTIFICATION_PERIODIC_PROMPTED_ASSESSMENTS_BODY_IOS";
    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:

  [v4 setBody:v10];
  [v4 setCategoryIdentifier:v8];
  v11 = [MEMORY[0x263F1DF68] defaultSound];
  [v4 setSound:v11];

  v12 = [v4 userInfo];
  v13 = (void *)[v12 mutableCopy];

  [v13 setObject:&unk_2704AD5B8 forKeyedSubscript:*MEMORY[0x263F0ADA8]];
  v14 = (void *)[v13 copy];
  [v4 setUserInfo:v14];

  return v4;
}

@end