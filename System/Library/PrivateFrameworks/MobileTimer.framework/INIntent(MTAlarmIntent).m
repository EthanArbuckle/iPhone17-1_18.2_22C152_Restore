@interface INIntent(MTAlarmIntent)
+ (MTCreateAlarmIntent)mt_intentForAlarmCreate:()MTAlarmIntent;
+ (MTToggleAlarmIntent)mt_intentForAlarmDisable:()MTAlarmIntent;
+ (MTToggleAlarmIntent)mt_intentForAlarmEnable:()MTAlarmIntent;
+ (MTUpdateAlarmIntent)mt_intentForAlarmUpdate:()MTAlarmIntent;
+ (__CFString)mt_nanoAlarmBundleIDForAlarm:()MTAlarmIntent;
+ (void)mt_deleteDonationsForAlarm:()MTAlarmIntent completion:;
- (id)mt_initWithAlarm:()MTAlarmIntent verb:;
@end

@implementation INIntent(MTAlarmIntent)

+ (MTCreateAlarmIntent)mt_intentForAlarmCreate:()MTAlarmIntent
{
  id v4 = a3;
  v5 = objc_alloc_init(MTCreateAlarmIntent);
  [(MTCreateAlarmIntent *)v5 _setExtensionBundleId:@"com.apple.mobiletimer-framework.MobileTimerIntents"];
  [(MTCreateAlarmIntent *)v5 _setLaunchId:@"com.apple.mobiletimer"];
  v6 = objc_msgSend(a1, "mt_nanoAlarmBundleIDForAlarm:", v4);
  [(MTCreateAlarmIntent *)v5 _setNanoLaunchId:v6];

  v7 = [v4 intentLabel];
  [(MTCreateAlarmIntent *)v5 setLabel:v7];

  v8 = [v4 dateComponents];
  [(MTCreateAlarmIntent *)v5 setDateComponents:v8];

  uint64_t v9 = [v4 repeatSchedule];
  v10 = MTRepeatDaysForAlarmRepeatSchedule(v9);
  [(MTCreateAlarmIntent *)v5 setRepeatSchedule:v10];

  return v5;
}

+ (MTUpdateAlarmIntent)mt_intentForAlarmUpdate:()MTAlarmIntent
{
  id v4 = a3;
  v5 = objc_alloc_init(MTUpdateAlarmIntent);
  [(MTUpdateAlarmIntent *)v5 _setExtensionBundleId:@"com.apple.mobiletimer-framework.MobileTimerIntents"];
  [(MTUpdateAlarmIntent *)v5 _setLaunchId:@"com.apple.mobiletimer"];
  v6 = objc_msgSend(a1, "mt_nanoAlarmBundleIDForAlarm:", v4);
  [(MTUpdateAlarmIntent *)v5 _setNanoLaunchId:v6];

  v7 = [v4 alarmIDIntentObject];

  [(MTUpdateAlarmIntent *)v5 setAlarmID:v7];
  return v5;
}

+ (MTToggleAlarmIntent)mt_intentForAlarmEnable:()MTAlarmIntent
{
  id v4 = a3;
  v5 = objc_alloc_init(MTToggleAlarmIntent);
  [(MTToggleAlarmIntent *)v5 _setExtensionBundleId:@"com.apple.mobiletimer-framework.MobileTimerIntents"];
  [(MTToggleAlarmIntent *)v5 _setLaunchId:@"com.apple.mobiletimer"];
  v6 = objc_msgSend(a1, "mt_nanoAlarmBundleIDForAlarm:", v4);
  [(MTToggleAlarmIntent *)v5 _setNanoLaunchId:v6];

  v7 = [v4 intentAlarm];

  [(MTToggleAlarmIntent *)v5 setAlarm:v7];
  [(MTToggleAlarmIntent *)v5 setOperation:1];
  [(MTToggleAlarmIntent *)v5 setState:1];
  return v5;
}

+ (MTToggleAlarmIntent)mt_intentForAlarmDisable:()MTAlarmIntent
{
  id v4 = a3;
  v5 = objc_alloc_init(MTToggleAlarmIntent);
  [(MTToggleAlarmIntent *)v5 _setExtensionBundleId:@"com.apple.mobiletimer-framework.MobileTimerIntents"];
  [(MTToggleAlarmIntent *)v5 _setLaunchId:@"com.apple.mobiletimer"];
  v6 = objc_msgSend(a1, "mt_nanoAlarmBundleIDForAlarm:", v4);
  [(MTToggleAlarmIntent *)v5 _setNanoLaunchId:v6];

  v7 = [v4 intentAlarm];

  [(MTToggleAlarmIntent *)v5 setAlarm:v7];
  [(MTToggleAlarmIntent *)v5 setOperation:1];
  [(MTToggleAlarmIntent *)v5 setState:2];
  return v5;
}

- (id)mt_initWithAlarm:()MTAlarmIntent verb:
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  objc_msgSend(v8, "setHour:", objc_msgSend(v7, "hour"));
  objc_msgSend(v8, "setMinute:", objc_msgSend(v7, "minute"));
  uint64_t v9 = [v7 displayTitle];
  v10 = [v7 alarmIDString];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
  uint64_t v12 = [v7 repeatSchedule];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__INIntent_MTAlarmIntent__mt_initWithAlarm_verb___block_invoke;
  v17[3] = &unk_1E5916468;
  id v13 = v11;
  id v18 = v13;
  MTAlarmRepeatScheduleEnumerateDays(v12, v17);
  v14 = objc_opt_new();
  objc_msgSend(v14, "na_safeSetObject:forKey:", v8, @"time");
  objc_msgSend(v14, "na_safeSetObject:forKey:", v9, @"label");
  objc_msgSend(v14, "na_safeSetObject:forKey:", v10, @"identifier");
  if ([v13 count]) {
    [v14 setObject:v13 forKeyedSubscript:@"repeat"];
  }
  v15 = (void *)[a1 initWithDomain:@"Alarm" verb:v6 parametersByName:v14];

  return v15;
}

+ (void)mt_deleteDonationsForAlarm:()MTAlarmIntent completion:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = @"com.apple.mobiletimer";
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v8 = (void *)getCSSearchableIndexClass_softClass;
  uint64_t v17 = getCSSearchableIndexClass_softClass;
  if (!getCSSearchableIndexClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getCSSearchableIndexClass_block_invoke;
    v13[3] = &unk_1E5914EC0;
    v13[4] = &v14;
    __getCSSearchableIndexClass_block_invoke((uint64_t)v13);
    v8 = (void *)v15[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v14, 8);
  v10 = [v9 defaultSearchableIndex];
  v11 = [v5 alarmIDString];
  v18[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v10 deleteInteractionsWithGroupIdentifiers:v12 bundleID:v7 protectionClass:0 completionHandler:v6];
}

+ (__CFString)mt_nanoAlarmBundleIDForAlarm:()MTAlarmIntent
{
  return @"com.apple.NanoAlarm";
}

@end