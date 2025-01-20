@interface MTSleepObjCWrapper
+ (void)toggleNextSleepAlarmWithCompletion:(id)a3;
+ (void)turnNextSleepAlarmEnabled:(BOOL)a3 completion:(id)a4;
@end

@implementation MTSleepObjCWrapper

+ (void)turnNextSleepAlarmEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = objc_alloc((Class)getHKSPSleepStoreClass());
  id v7 = objc_alloc_init((Class)getHKHealthStoreClass());
  id v9 = (id)[v6 initWithHealthStore:v7];

  v8 = [MEMORY[0x1E4F1C9C8] date];
  [v9 setUpcomingWakeUpAlarmEnabled:v4 date:v8 completion:v5];
}

+ (void)toggleNextSleepAlarmWithCompletion:(id)a3
{
  v3 = (void (**)(id, void, id))a3;
  id v4 = objc_alloc((Class)getHKSPSleepStoreClass());
  id v5 = objc_alloc_init((Class)getHKHealthStoreClass());
  id v6 = (void *)[v4 initWithHealthStore:v5];

  uint64_t v13 = 0;
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  id v12 = 0;
  id v8 = (id)[v6 upcomingScheduleOccurrenceAfterDate:v7 alarmStatus:&v13 error:&v12];
  id v9 = v12;

  if (v9)
  {
    v3[2](v3, 0, v9);
  }
  else
  {
    BOOL v10 = v13 == 1;
    v11 = [MEMORY[0x1E4F1C9C8] date];
    [v6 setUpcomingWakeUpAlarmEnabled:v10 date:v11 completion:v3];
  }
}

@end