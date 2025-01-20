@interface MTUserNotificationActionDispatcher
+ (unint64_t)_alarmNotificationActionForUserNotificationAction:(id)a3 category:(id)a4;
+ (unint64_t)_timerNotificationActionForUserNotificationAction:(id)a3;
- (MTAlarmStorage)alarmStorage;
- (MTMetrics)metrics;
- (MTTimerStorage)timerStorage;
- (MTUserNotificationActionDispatcher)initWithAlarmStorage:(id)a3 timerStorage:(id)a4;
- (void)_handleAlarmNotificationResponse:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleTimerNotificationResponse:(id)a3 withCompletionHandler:(id)a4;
- (void)handleAlarmNotificationIdentifier:(id)a3 action:(unint64_t)a4 category:(id)a5 completionHandler:(id)a6;
- (void)setAlarmStorage:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setTimerStorage:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation MTUserNotificationActionDispatcher

- (MTUserNotificationActionDispatcher)initWithAlarmStorage:(id)a3 timerStorage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTUserNotificationActionDispatcher;
  v9 = [(MTUserNotificationActionDispatcher *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alarmStorage, a3);
    objc_storeStrong((id *)&v10->_timerStorage, a4);
    uint64_t v11 = objc_opt_new();
    metrics = v10->_metrics;
    v10->_metrics = (MTMetrics *)v11;
  }
  return v10;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  kdebug_trace();
  v9 = MTLogForCategory(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = self;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ received notification response", buf, 0xCu);
  }

  v10 = [v7 notification];
  uint64_t v11 = [v10 request];
  v12 = [v11 content];
  v13 = [v12 categoryIdentifier];

  if (([v13 isEqualToString:@"MTAlarmCategory"] & 1) != 0
    || ([v13 isEqualToString:@"MTAlarmNoSnoozeCategory"] & 1) != 0
    || ([v13 isEqualToString:@"MTWakeUpAlarmNoSnoozeCategory"] & 1) != 0
    || ([v13 isEqualToString:@"AlarmSnoozeCountdown"] & 1) != 0
    || ([v13 isEqualToString:@"MTBedtimeAlarmCategory"] & 1) != 0
    || [v13 isEqualToString:@"MTWakeUpAlarmCategory"])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __114__MTUserNotificationActionDispatcher_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
    v17[3] = &unk_1E5915B68;
    v18 = v8;
    [(MTUserNotificationActionDispatcher *)self _handleAlarmNotificationResponse:v7 withCompletionHandler:v17];
    objc_super v14 = v18;
LABEL_10:

    goto LABEL_11;
  }
  if ([v13 isEqualToString:@"MTTimerCategory"])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __114__MTUserNotificationActionDispatcher_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2;
    v15[3] = &unk_1E5915B68;
    v16 = v8;
    [(MTUserNotificationActionDispatcher *)self _handleTimerNotificationResponse:v7 withCompletionHandler:v15];
    objc_super v14 = v16;
    goto LABEL_10;
  }
  kdebug_trace();
  if (v8) {
    v8[2](v8);
  }
LABEL_11:
}

uint64_t __114__MTUserNotificationActionDispatcher_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  kdebug_trace();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __114__MTUserNotificationActionDispatcher_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  kdebug_trace();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

+ (unint64_t)_alarmNotificationActionForUserNotificationAction:(id)a3 category:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"MTAlarmSnoozeAction"])
  {
    unint64_t v7 = 1;
    goto LABEL_14;
  }
  if (![v5 isEqualToString:*MEMORY[0x1E4F446F0]])
  {
    if ([v5 isEqualToString:@"MTAlarmGoToBedAction"])
    {
      unint64_t v7 = 3;
      goto LABEL_14;
    }
    if (([v5 isEqualToString:@"MTAlarmDismissAction"] & 1) == 0
      && ([v5 isEqualToString:*MEMORY[0x1E4F446E0]] & 1) == 0
      && ![v5 isEqualToString:*MEMORY[0x1E4F446D0]])
    {
      unint64_t v7 = 0;
      goto LABEL_14;
    }
LABEL_13:
    unint64_t v7 = 2;
    goto LABEL_14;
  }
  if ([v6 isEqualToString:@"MTAlarmNoSnoozeCategory"]) {
    goto LABEL_13;
  }
  if ([v6 isEqualToString:@"MTWakeUpAlarmNoSnoozeCategory"]) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = 1;
  }
LABEL_14:

  return v7;
}

- (void)_handleAlarmNotificationResponse:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = (void (**)(void))a4;
  id v8 = [v6 actionIdentifier];
  v9 = [v6 notification];
  v10 = [v9 request];
  uint64_t v11 = [v10 content];
  v12 = [v11 categoryIdentifier];

  v13 = MTLogForCategory(3);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543874;
    uint64_t v21 = self;
    __int16 v22 = 2114;
    v23 = v12;
    __int16 v24 = 2114;
    v25 = v8;
    _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ received response for category %{public}@ and action %{public}@", (uint8_t *)&v20, 0x20u);
  }

  uint64_t v14 = [(id)objc_opt_class() _alarmNotificationActionForUserNotificationAction:v8 category:v12];
  if (v14)
  {
    uint64_t v15 = v14;
    v16 = [v6 notification];
    v17 = [v16 request];
    v18 = [v17 identifier];
    [(MTUserNotificationActionDispatcher *)self handleAlarmNotificationIdentifier:v18 action:v15 category:v12 completionHandler:v7];
  }
  else
  {
    v19 = MTLogForCategory(3);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MTUserNotificationActionDispatcher _handleAlarmNotificationResponse:withCompletionHandler:]((uint64_t)v8, v19);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)handleAlarmNotificationIdentifier:(id)a3 action:(unint64_t)a4 category:(id)a5 completionHandler:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  v12 = [a3 mtStringByRemovingNotificationPrefixes];
  int v13 = [v10 isEqualToString:@"MTBedtimeAlarmCategory"];
  if ([v10 isEqualToString:@"MTWakeUpAlarmCategory"]) {
    int v14 = 1;
  }
  else {
    int v14 = [v10 isEqualToString:@"MTWakeUpAlarmNoSnoozeCategory"];
  }
  int v15 = [v10 isEqualToString:@"AlarmSnoozeCountdown"];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __106__MTUserNotificationActionDispatcher_handleAlarmNotificationIdentifier_action_category_completionHandler___block_invoke;
  v33[3] = &unk_1E59156E8;
  v33[4] = self;
  id v34 = v11;
  id v16 = v11;
  v17 = (void *)MEMORY[0x19F3A0FB0](v33);
  if (a4 == 3)
  {
    if ((v13 & 1) == 0) {
      NSLog(&cfstr_UnexpectedAler.isa);
    }
    v23 = MTLogForCategory(3);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      __int16 v37 = 2114;
      v38 = v12;
      _os_log_impl(&dword_19CC95000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ received go to bed action for bedtime notification %{public}@", buf, 0x16u);
    }

    __int16 v24 = [(MTUserNotificationActionDispatcher *)self alarmStorage];
    [v24 dismissAlarmWithIdentifier:v12 dismissAction:2 withCompletion:v17 source:0];

    v25 = [(MTUserNotificationActionDispatcher *)self metrics];
    __int16 v22 = v25;
    uint64_t v26 = 2;
    goto LABEL_36;
  }
  if (a4 == 2)
  {
LABEL_21:
    v27 = MTLogForCategory(3);
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v28)
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        __int16 v37 = 2114;
        v38 = v12;
        _os_log_impl(&dword_19CC95000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ received dismiss action for wakeup alarm %{public}@", buf, 0x16u);
      }

      v29 = [(MTUserNotificationActionDispatcher *)self alarmStorage];
      [v29 dismissAlarmWithIdentifier:v12 dismissAction:5 withCompletion:v17 source:0];

      v25 = [(MTUserNotificationActionDispatcher *)self metrics];
      __int16 v22 = v25;
      uint64_t v26 = 5;
    }
    else if (v13)
    {
      if (v28)
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        __int16 v37 = 2114;
        v38 = v12;
        _os_log_impl(&dword_19CC95000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ received dismiss action for bedtime notification %{public}@", buf, 0x16u);
      }

      v30 = [(MTUserNotificationActionDispatcher *)self alarmStorage];
      [v30 dismissAlarmWithIdentifier:v12 dismissAction:1 withCompletion:v17 source:0];

      v25 = [(MTUserNotificationActionDispatcher *)self metrics];
      __int16 v22 = v25;
      uint64_t v26 = 1;
    }
    else if (v15)
    {
      if (v28)
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        __int16 v37 = 2114;
        v38 = v12;
        _os_log_impl(&dword_19CC95000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ received dismiss action for snooze countdown notification %{public}@", buf, 0x16u);
      }

      v31 = [(MTUserNotificationActionDispatcher *)self alarmStorage];
      [v31 dismissAlarmWithIdentifier:v12 dismissAction:6 withCompletion:v17 source:0];

      v25 = [(MTUserNotificationActionDispatcher *)self metrics];
      __int16 v22 = v25;
      uint64_t v26 = 6;
    }
    else
    {
      if (v28)
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        __int16 v37 = 2114;
        v38 = v12;
        _os_log_impl(&dword_19CC95000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ received dismiss action for alarm %{public}@", buf, 0x16u);
      }

      v32 = [(MTUserNotificationActionDispatcher *)self alarmStorage];
      [v32 dismissAlarmWithIdentifier:v12 dismissAction:0 withCompletion:v17 source:0];

      v25 = [(MTUserNotificationActionDispatcher *)self metrics];
      __int16 v22 = v25;
      uint64_t v26 = 0;
    }
LABEL_36:
    [v25 logAlarmDismissAction:v26];
    goto LABEL_37;
  }
  if (a4 != 1)
  {
    NSLog(&cfstr_UnexpectedActi.isa, a4);
    goto LABEL_21;
  }
  v18 = MTLogForCategory(3);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v36 = self;
    __int16 v37 = 2114;
    v38 = v12;
    _os_log_impl(&dword_19CC95000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ received snooze action for %{public}@", buf, 0x16u);
  }

  uint64_t v19 = 2;
  if (!v14) {
    uint64_t v19 = 0;
  }
  if (v13) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = v19;
  }
  uint64_t v21 = [(MTUserNotificationActionDispatcher *)self alarmStorage];
  [v21 snoozeAlarmWithIdentifier:v12 snoozeAction:v20 withCompletion:v17 source:0];

  __int16 v22 = [(MTUserNotificationActionDispatcher *)self metrics];
  [v22 logAlarmSnoozeAction:v20];
LABEL_37:
}

uint64_t __106__MTUserNotificationActionDispatcher_handleAlarmNotificationIdentifier_action_category_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ calling completion", (uint8_t *)&v5, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (unint64_t)_timerNotificationActionForUserNotificationAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MTTimerRepeatAction"]) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = ([v3 isEqualToString:@"MTTimerDismissAction"] & 1) != 0
  }
      || ([v3 isEqualToString:*MEMORY[0x1E4F446E0]] & 1) != 0
      || ([v3 isEqualToString:*MEMORY[0x1E4F446D0]] & 1) != 0
      || [v3 isEqualToString:*MEMORY[0x1E4F446F0]];

  return v4;
}

- (void)_handleTimerNotificationResponse:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __93__MTUserNotificationActionDispatcher__handleTimerNotificationResponse_withCompletionHandler___block_invoke;
  uint64_t v26 = &unk_1E59156E8;
  v27 = self;
  id v8 = (void (**)(void))v7;
  id v28 = v8;
  v9 = (void *)MEMORY[0x19F3A0FB0](&v23);
  id v10 = objc_msgSend(v6, "actionIdentifier", v23, v24, v25, v26, v27);
  id v11 = MTLogForCategory(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v30 = self;
    __int16 v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ received response for action %{public}@", buf, 0x16u);
  }

  uint64_t v12 = [(id)objc_opt_class() _timerNotificationActionForUserNotificationAction:v10];
  if (v12)
  {
    uint64_t v13 = v12;
    int v14 = [v6 notification];
    int v15 = [v14 request];
    id v16 = [v15 identifier];

    if (v13 == 2)
    {
      uint64_t v21 = MTLogForCategory(4);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v30 = self;
        __int16 v31 = 2114;
        v32 = v16;
        _os_log_impl(&dword_19CC95000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ received repeat action for timer %{public}@", buf, 0x16u);
      }

      __int16 v22 = [(MTUserNotificationActionDispatcher *)self timerStorage];
      [v22 repeatTimerWithIdentifier:v16 withCompletion:v9 source:0];

      uint64_t v19 = [(MTUserNotificationActionDispatcher *)self metrics];
      [v19 logTimerRepeated];
    }
    else
    {
      if (v13 != 1)
      {
LABEL_16:

        goto LABEL_17;
      }
      v17 = MTLogForCategory(4);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v30 = self;
        __int16 v31 = 2114;
        v32 = v16;
        _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ received dismiss action for timer %{public}@", buf, 0x16u);
      }

      v18 = [(MTUserNotificationActionDispatcher *)self timerStorage];
      [v18 dismissTimerWithIdentifier:v16 withCompletion:v9 source:0];

      uint64_t v19 = [(MTUserNotificationActionDispatcher *)self metrics];
      [v19 logTimerDismissed];
    }

    goto LABEL_16;
  }
  uint64_t v20 = MTLogForCategory(4);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[MTUserNotificationActionDispatcher _handleTimerNotificationResponse:withCompletionHandler:]((uint64_t)v10, v20);
  }

  v8[2](v8);
LABEL_17:
}

uint64_t __93__MTUserNotificationActionDispatcher__handleTimerNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ calling completion", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (void)setAlarmStorage:(id)a3
{
}

- (MTTimerStorage)timerStorage
{
  return self->_timerStorage;
}

- (void)setTimerStorage:(id)a3
{
}

- (MTMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_timerStorage, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
}

- (void)_handleAlarmNotificationResponse:(uint64_t)a1 withCompletionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "Unexpected alarm notification action: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_handleTimerNotificationResponse:(uint64_t)a1 withCompletionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "Unexpected timer notification action: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end