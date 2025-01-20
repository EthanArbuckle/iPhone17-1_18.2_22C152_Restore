@interface MTDistributedNotificationPoster
+ (BOOL)_shouldNotifyForTrigger:(id)a3;
- (void)postNotificationForScheduledAlarm:(id)a3 completionBlock:(id)a4;
- (void)postNotificationForScheduledTimer:(id)a3 completionBlock:(id)a4;
@end

@implementation MTDistributedNotificationPoster

+ (BOOL)_shouldNotifyForTrigger:(id)a3
{
  return [a3 isForAlert];
}

- (void)postNotificationForScheduledAlarm:(id)a3 completionBlock:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = objc_opt_class();
  v9 = [v6 trigger];
  LODWORD(v8) = [v8 _shouldNotifyForTrigger:v9];

  if (v8)
  {
    v10 = [v6 scheduleable];
    v11 = [v10 alarmIDString];
    v20 = @"MTAlarmID";
    v21[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v13 = MTLogForCategory(3);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v10 alarmID];
      int v16 = 138543618;
      v17 = self;
      __int16 v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ posting distributed notification for alarm: %{public}@", (uint8_t *)&v16, 0x16u);
    }
    v15 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v15 postNotificationName:@"com.apple.mobiletimer.MTAlarmDidFireNotification" object:0 userInfo:v12 deliverImmediately:1];
  }
  v7[2](v7);
}

- (void)postNotificationForScheduledTimer:(id)a3 completionBlock:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  v7 = [a3 scheduleable];
  v8 = [v7 timerIDString];
  v17 = @"MTTimerID";
  v18[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v10 = MTLogForCategory(4);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v7 timerID];
    int v13 = 138543618;
    v14 = self;
    __int16 v15 = 2114;
    int v16 = v11;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ posting distributed notification for timer: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  v12 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v12 postNotificationName:@"com.apple.mobiletimer.MTTimerDidFireNotification" object:0 userInfo:v9 deliverImmediately:1];

  v6[2](v6);
}

@end