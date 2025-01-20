@interface HKMHNotification
+ (id)allNotificationCategories;
+ (id)assessmentsNotificationCategories;
+ (id)notificationCategoryForString:(id)a3;
+ (id)stateOfMindNotificationCategories;
- (HKMHNotification)init;
- (HKMHNotification)initWithCategory:(id)a3;
- (NSString)category;
@end

@implementation HKMHNotification

- (HKMHNotification)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMHNotification)initWithCategory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMHNotification;
  v6 = [(HKMHNotification *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_category, a3);
  }

  return v7;
}

+ (id)allNotificationCategories
{
  v3 = [a1 stateOfMindNotificationCategories];
  uint64_t v4 = [a1 assessmentsNotificationCategories];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

+ (id)stateOfMindNotificationCategories
{
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = @"MentalHealthAppPlugin.CustomReminder";
  v4[1] = @"MentalHealthAppPlugin.MiddayReminder";
  v4[2] = @"MentalHealthAppPlugin.EndOfDayReminder";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  return v2;
}

+ (id)assessmentsNotificationCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"MentalHealthAppPlugin.PeriodicPromptedAssessmentReminder";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)notificationCategoryForString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[HKMHNotification allNotificationCategories];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__HKMHNotification_notificationCategoryForString___block_invoke;
  v8[3] = &unk_2653EF228;
  id v9 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "hk_firstObjectPassingTest:", v8);

  return v6;
}

uint64_t __50__HKMHNotification_notificationCategoryForString___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualToString:a2];
}

- (NSString)category
{
  return self->_category;
}

- (void).cxx_destruct
{
}

@end