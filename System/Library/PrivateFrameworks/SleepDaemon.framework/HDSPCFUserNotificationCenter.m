@interface HDSPCFUserNotificationCenter
- (HDSPCFUserNotificationCenter)initWithEnvironment:(id)a3;
- (HDSPEnvironment)environment;
- (HKSPMutexProvider)mutexProvider;
- (NSMutableDictionary)notifications;
- (NSString)sourceIdentifier;
- (id)_confirmTextForForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4;
- (id)_ignoreTextForForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4;
- (id)_wakeDetectionAlertBodyForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4;
- (id)_wakeDetectionAlertTitleForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4;
- (void)_publishNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButtonTitle:(id)a6 otherButtonTitle:(id)a7 bypassDND:(BOOL)a8 aboveLockScreen:(BOOL)a9 actionHandler:(id)a10;
- (void)_publishWakeDetectionNotificationForUserInfo:(id)a3;
- (void)_withLock:(id)a3;
- (void)handleResponse:(unint64_t)a3 forUserNotification:(id)a4;
- (void)publishNotificationForEvent:(id)a3;
- (void)tearDownNotificationForEventIdentifier:(id)a3;
- (void)tearDownNotifications;
@end

@implementation HDSPCFUserNotificationCenter

- (HDSPCFUserNotificationCenter)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDSPCFUserNotificationCenter;
  v5 = [(HDSPCFUserNotificationCenter *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = [v4 mutexGenerator];
    uint64_t v8 = v7[2]();
    mutexProvider = v6->_mutexProvider;
    v6->_mutexProvider = (HKSPMutexProvider *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    notifications = v6->_notifications;
    v6->_notifications = v10;

    v12 = v6;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
}

- (void)publishNotificationForEvent:(id)a3
{
  id v8 = a3;
  id v4 = [v8 identifier];
  if ([v4 isEqualToString:*MEMORY[0x263F75C38]])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    v6 = [WeakRetained behavior];
    char v7 = [v6 isAppleWatch];

    if (v7) {
      goto LABEL_5;
    }
    id v4 = [v8 context];
    [(HDSPCFUserNotificationCenter *)self _publishWakeDetectionNotificationForUserInfo:v4];
  }

LABEL_5:
}

- (void)_publishWakeDetectionNotificationForUserInfo:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = (id)objc_opt_class();
    id v5 = v28;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] publishWakeDetectionNotification", buf, 0xCu);
  }
  v6 = [v24 objectForKeyedSubscript:*MEMORY[0x263F75D20]];
  uint64_t v7 = [v6 BOOLValue];

  id v8 = [v24 objectForKeyedSubscript:*MEMORY[0x263F75D28]];
  uint64_t v9 = [v8 BOOLValue];

  if (v9)
  {
    v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v28 = v11;
      id v12 = v11;
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode is on", buf, 0xCu);
    }
  }
  if (v7)
  {
    v13 = HKSPLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v14 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v28 = v14;
      id v15 = v14;
      _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] alarm is enabled", buf, 0xCu);
    }
  }
  v16 = [(HDSPCFUserNotificationCenter *)self _wakeDetectionAlertTitleForAlarmEnabled:v7 sleepModeOn:v9];
  v17 = [(HDSPCFUserNotificationCenter *)self _wakeDetectionAlertBodyForAlarmEnabled:v7 sleepModeOn:v9];
  v18 = [(HDSPCFUserNotificationCenter *)self _confirmTextForForAlarmEnabled:v7 sleepModeOn:v9];
  v19 = [(HDSPCFUserNotificationCenter *)self _ignoreTextForForAlarmEnabled:v7 sleepModeOn:v9];
  objc_initWeak((id *)buf, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v21 = [WeakRetained behavior];
  char v22 = [v21 isAppleWatch];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __77__HDSPCFUserNotificationCenter__publishWakeDetectionNotificationForUserInfo___block_invoke;
  v25[3] = &unk_2645D9EB8;
  objc_copyWeak(&v26, (id *)buf);
  LOBYTE(v23) = v22 ^ 1;
  [(HDSPCFUserNotificationCenter *)self _publishNotificationWithIdentifier:*MEMORY[0x263F75C38] title:v16 message:v17 defaultButtonTitle:v18 otherButtonTitle:v19 bypassDND:1 aboveLockScreen:v23 actionHandler:v25];

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

void __77__HDSPCFUserNotificationCenter__publishWakeDetectionNotificationForUserInfo___block_invoke(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(WeakRetained + 1);
  id v5 = HKSPLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138543362;
      id v12 = (id)objc_opt_class();
      id v7 = v12;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] confirming the awake notification", buf, 0xCu);
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __77__HDSPCFUserNotificationCenter__publishWakeDetectionNotificationForUserInfo___block_invoke_280;
    v9[3] = &unk_2645D90C0;
    v10 = v4;
    [v10 perform:v9 withSource:WeakRetained];
    id v5 = v10;
  }
  else if (v6)
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v8 = v12;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] dismissing the awake notification", buf, 0xCu);
  }
}

void __77__HDSPCFUserNotificationCenter__publishWakeDetectionNotificationForUserInfo___block_invoke_280(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) actionManager];
  [v1 confirmWakeUp:1];
}

- (id)_wakeDetectionAlertTitleForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4
{
  id v4 = @"EARLY_WAKEUP_TITLE_NONE";
  if (a3) {
    id v4 = @"EARLY_WAKEUP_TITLE_ALARM";
  }
  id v5 = @"EARLY_WAKEUP_TITLE_ALARM_AND_SLEEP_FOCUS";
  if (!a3) {
    id v5 = @"EARLY_WAKEUP_TITLE_SLEEP_FOCUS";
  }
  if (a4) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = v4;
  }
  id v7 = HDSPLocalizedString(v6);

  return v7;
}

- (id)_wakeDetectionAlertBodyForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4
{
  id v4 = @"EARLY_WAKEUP_BODY_NONE";
  if (a3) {
    id v4 = @"EARLY_WAKEUP_BODY_ALARM";
  }
  id v5 = @"EARLY_WAKEUP_BODY_ALARM_AND_SLEEP_FOCUS";
  if (!a3) {
    id v5 = @"EARLY_WAKEUP_BODY_SLEEP_FOCUS";
  }
  if (a4) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = v4;
  }
  id v7 = HDSPLocalizedString(v6);

  return v7;
}

- (id)_confirmTextForForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4
{
  if (a3 || a4) {
    id v4 = @"EARLY_DISMISS_TURN_OFF";
  }
  else {
    id v4 = @"EARLY_DISMISS_YES";
  }
  id v5 = HDSPLocalizedString(v4);

  return v5;
}

- (id)_ignoreTextForForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4
{
  if (a3 || a4) {
    id v4 = @"EARLY_DISMISS_LEAVE_ON";
  }
  else {
    id v4 = @"EARLY_DISMISS_NO";
  }
  id v5 = HDSPLocalizedString(v4);

  return v5;
}

- (void)_publishNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButtonTitle:(id)a6 otherButtonTitle:(id)a7 bypassDND:(BOOL)a8 aboveLockScreen:(BOOL)a9 actionHandler:(id)a10
{
  BOOL v10 = a8;
  v61[10] = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v51 = a10;
  uint64_t v21 = *MEMORY[0x263EFFFD8];
  v60[0] = *MEMORY[0x263EFFFC8];
  v60[1] = v21;
  v61[0] = v17;
  v61[1] = v18;
  uint64_t v22 = *MEMORY[0x263EFFFE8];
  v60[2] = *MEMORY[0x263F00000];
  v60[3] = v22;
  v61[2] = v19;
  v61[3] = v20;
  v60[4] = *MEMORY[0x263EFFFE0];
  uint64_t v23 = [NSNumber numberWithBool:a9];
  v61[4] = v23;
  v60[5] = *MEMORY[0x263F79658];
  id v24 = [NSNumber numberWithBool:v10];
  uint64_t v25 = *MEMORY[0x263F79678];
  v61[5] = v24;
  v61[6] = &unk_26D40F0E0;
  uint64_t v26 = *MEMORY[0x263F79670];
  v60[6] = v25;
  v60[7] = v26;
  uint64_t v27 = *MEMORY[0x263F79640];
  v61[7] = *MEMORY[0x263F7FCF8];
  v61[8] = MEMORY[0x263EFFA88];
  uint64_t v28 = *MEMORY[0x263F79618];
  v60[8] = v27;
  v60[9] = v28;
  v61[9] = MEMORY[0x263EFFA88];
  CFDictionaryRef v29 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:10];

  v30 = HKSPLogForCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v57 = (id)objc_opt_class();
    __int16 v58 = 2114;
    CFDictionaryRef v59 = v29;
    id v31 = v57;
    _os_log_impl(&dword_221A52000, v30, OS_LOG_TYPE_INFO, "[%{public}@] publishing notification with properties %{public}@", buf, 0x16u);
  }
  SInt32 error = 0;
  CFUserNotificationRef v32 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v29);
  if (v32)
  {
    CFUserNotificationRef v33 = v32;
    SInt32 v34 = error;
    v35 = HKSPLogForCategory();
    v36 = v35;
    if (v34)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v37 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v57 = v37;
        __int16 v58 = 1024;
        LODWORD(v59) = error;
        id v38 = v37;
        _os_log_error_impl(&dword_221A52000, v36, OS_LOG_TYPE_ERROR, "[%{public}@] failed to post CFUserNotification (%d)", buf, 0x12u);
      }
    }
    else
    {
      id v49 = v17;
      v50 = v16;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v40 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v57 = v40;
        __int16 v58 = 2114;
        CFDictionaryRef v59 = (const __CFDictionary *)v16;
        id v41 = v40;
        _os_log_impl(&dword_221A52000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] posting CFUserNotification for %{public}@", buf, 0x16u);

        id v16 = v50;
      }

      CFRetain(v33);
      v42 = +[HDSPCFUserNotification userNotificationWithIdentifier:v16 notification:v33 actionHandler:v51];
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __157__HDSPCFUserNotificationCenter__publishNotificationWithIdentifier_title_message_defaultButtonTitle_otherButtonTitle_bypassDND_aboveLockScreen_actionHandler___block_invoke;
      v52[3] = &unk_2645D9EE0;
      v52[4] = self;
      id v43 = v50;
      id v53 = v43;
      id v54 = v42;
      v36 = v42;
      [(HDSPCFUserNotificationCenter *)self _withLock:v52];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
      v45 = [WeakRetained assertionManager];
      [v45 takeAssertionWithIdentifier:v43 type:1 timeout:1800.0];

      id v16 = v50;
      v46 = +[HDSPCFUserNotificationCenterManager sharedManager];
      [v46 postNotification:v36 fromCenter:self];

      id v17 = v49;
    }

    CFRelease(v33);
  }
  else
  {
    v39 = HKSPLogForCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v47 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v57 = v47;
      __int16 v58 = 1024;
      LODWORD(v59) = error;
      id v48 = v47;
      _os_log_error_impl(&dword_221A52000, v39, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create CFUserNotification (%d)", buf, 0x12u);
    }
  }
}

uint64_t __157__HDSPCFUserNotificationCenter__publishNotificationWithIdentifier_title_message_defaultButtonTitle_otherButtonTitle_bypassDND_aboveLockScreen_actionHandler___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (void)handleResponse:(unint64_t)a3 forUserNotification:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    BOOL v10 = [v6 identifier];
    *(_DWORD *)buf = 138543618;
    id v20 = v8;
    __int16 v21 = 2114;
    uint64_t v22 = v10;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] calling handler for %{public}@", buf, 0x16u);
  }
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __67__HDSPCFUserNotificationCenter_handleResponse_forUserNotification___block_invoke;
  id v16 = &unk_2645D9288;
  id v17 = self;
  id v18 = v6;
  id v11 = v6;
  [(HDSPCFUserNotificationCenter *)self _withLock:&v13];
  objc_msgSend(v11, "actionHandler", v13, v14, v15, v16, v17);
  id v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, BOOL))v12)[2](v12, a3 == 0);
}

void __67__HDSPCFUserNotificationCenter_handleResponse_forUserNotification___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(a1 + 32) + 24);
  id v2 = [*(id *)(a1 + 40) identifier];
  [v1 removeObjectForKey:v2];
}

- (void)tearDownNotificationForEventIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__7;
  id v19 = __Block_byref_object_dispose__7;
  id v20 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__HDSPCFUserNotificationCenter_tearDownNotificationForEventIdentifier___block_invoke;
  v12[3] = &unk_2645D9F08;
  uint64_t v14 = &v15;
  v12[4] = self;
  id v5 = v4;
  id v13 = v5;
  [(HDSPCFUserNotificationCenter *)self _withLock:v12];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v7 = [WeakRetained assertionManager];
  [v7 releaseAssertionWithIdentifier:v5];

  if (v16[5])
  {
    id v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v9;
      __int16 v23 = 2114;
      id v24 = v5;
      id v10 = v9;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] cancelling CFUserNotification for %{public}@", buf, 0x16u);
    }
    id v11 = +[HDSPCFUserNotificationCenterManager sharedManager];
    [v11 cancelNotification:v16[5] fromCenter:self];
  }
  _Block_object_dispose(&v15, 8);
}

uint64_t __71__HDSPCFUserNotificationCenter_tearDownNotificationForEventIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 24);

  return [v6 removeObjectForKey:v5];
}

- (void)tearDownNotifications
{
}

- (NSString)sourceIdentifier
{
  uint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (NSMutableDictionary)notifications
{
  return self->_notifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end