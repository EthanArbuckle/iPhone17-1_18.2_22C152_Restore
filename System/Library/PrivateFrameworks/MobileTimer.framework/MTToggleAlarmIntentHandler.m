@interface MTToggleAlarmIntentHandler
- (BOOL)getEnableStateForAlarm:(id)a3;
- (id)_alarmUserActivityWithDisableIntent:(id)a3;
- (id)_alarmUserActivityWithEnableIntent:(id)a3;
- (id)updateEnableStateForAlarm:(id)a3 enabled:(BOOL)a4;
- (void)_toggleAlarm:(id)a3 alarmIDString:(id)a4 completion:(id)a5;
- (void)confirmDisableAlarm:(id)a3 completion:(id)a4;
- (void)confirmEnableAlarm:(id)a3 completion:(id)a4;
- (void)confirmToggleAlarm:(id)a3 completion:(id)a4;
- (void)handleDisableAlarm:(id)a3 completion:(id)a4;
- (void)handleEnableAlarm:(id)a3 completion:(id)a4;
- (void)handleToggleAlarm:(id)a3 completion:(id)a4;
- (void)provideAlarmOptionsForToggleAlarm:(id)a3 withCompletion:(id)a4;
- (void)resolveAlarmForToggleAlarm:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForToggleAlarm:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleAlarm:(id)a3 withCompletion:(id)a4;
@end

@implementation MTToggleAlarmIntentHandler

- (void)confirmEnableAlarm:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, id))a4;
  id v7 = a3;
  v8 = [MTEnableAlarmIntentResponse alloc];
  v9 = [(MTToggleAlarmIntentHandler *)self _alarmUserActivityWithEnableIntent:v7];

  v10 = [(MTEnableAlarmIntentResponse *)v8 initWithCode:1 userActivity:v9];
  v6[2](v6, v10);
}

- (void)confirmDisableAlarm:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, id))a4;
  id v7 = a3;
  v8 = [MTDisableAlarmIntentResponse alloc];
  v9 = [(MTToggleAlarmIntentHandler *)self _alarmUserActivityWithDisableIntent:v7];

  v10 = [(MTDisableAlarmIntentResponse *)v8 initWithCode:1 userActivity:v9];
  v6[2](v6, v10);
}

- (void)handleEnableAlarm:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = MTLogForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[MTToggleAlarmIntentHandler handleEnableAlarm:completion:]();
  }

  v9 = [v6 alarmID];
  v10 = [v9 identifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__MTToggleAlarmIntentHandler_handleEnableAlarm_completion___block_invoke;
  v12[3] = &unk_1E5914CF0;
  id v13 = v7;
  id v11 = v7;
  [(MTToggleAlarmIntentHandler *)self _toggleAlarm:MEMORY[0x1E4F1CC38] alarmIDString:v10 completion:v12];
}

void __59__MTToggleAlarmIntentHandler_handleEnableAlarm_completion___block_invoke(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 32))
  {
    v4 = [MTEnableAlarmIntentResponse alloc];
    if (a2) {
      uint64_t v5 = 4;
    }
    else {
      uint64_t v5 = 5;
    }
    id v6 = [(MTEnableAlarmIntentResponse *)v4 initWithCode:v5 userActivity:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)handleDisableAlarm:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = MTLogForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[MTToggleAlarmIntentHandler handleDisableAlarm:completion:]();
  }

  v9 = [v6 alarmID];
  v10 = [v9 identifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__MTToggleAlarmIntentHandler_handleDisableAlarm_completion___block_invoke;
  v12[3] = &unk_1E5914CF0;
  id v13 = v7;
  id v11 = v7;
  [(MTToggleAlarmIntentHandler *)self _toggleAlarm:MEMORY[0x1E4F1CC28] alarmIDString:v10 completion:v12];
}

void __60__MTToggleAlarmIntentHandler_handleDisableAlarm_completion___block_invoke(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 32))
  {
    v4 = [MTDisableAlarmIntentResponse alloc];
    if (a2) {
      uint64_t v5 = 4;
    }
    else {
      uint64_t v5 = 5;
    }
    id v6 = [(MTDisableAlarmIntentResponse *)v4 initWithCode:v5 userActivity:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)resolveAlarmForToggleAlarm:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 alarm];
  v9 = [v8 identifier];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    id v11 = [(MTAlarmIntentHandler *)self alarmManager];
    v12 = [v11 alarmsIncludingSleepAlarm:1];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__MTToggleAlarmIntentHandler_resolveAlarmForToggleAlarm_withCompletion___block_invoke;
    v19[3] = &unk_1E5914D18;
    id v13 = v7;
    id v20 = v13;
    id v14 = (id)[v12 addFailureBlock:v19];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__MTToggleAlarmIntentHandler_resolveAlarmForToggleAlarm_withCompletion___block_invoke_2;
    v16[3] = &unk_1E5914D68;
    id v17 = v6;
    id v18 = v13;
    id v15 = (id)[v12 addSuccessBlock:v16];
  }
  else
  {
    v12 = +[MTIntentAlarmResolutionResult needsValue];
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

void __72__MTToggleAlarmIntentHandler_resolveAlarmForToggleAlarm_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[MTIntentAlarmResolutionResult unsupported];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __72__MTToggleAlarmIntentHandler_resolveAlarmForToggleAlarm_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__MTToggleAlarmIntentHandler_resolveAlarmForToggleAlarm_withCompletion___block_invoke_3;
  v9[3] = &unk_1E5914D40;
  id v10 = *(id *)(a1 + 32);
  v4 = objc_msgSend(a2, "na_firstObjectPassingTest:", v9);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v4)
  {
    id v7 = [v4 intentAlarm];
    v8 = +[MTIntentAlarmResolutionResult successWithResolvedAlarm:v7];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);
  }
  else
  {
    id v7 = +[MTIntentAlarmResolutionResult needsValue];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

uint64_t __72__MTToggleAlarmIntentHandler_resolveAlarmForToggleAlarm_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 alarmIDString];
  v4 = [*(id *)(a1 + 32) alarm];
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (void)resolveStateForToggleAlarm:(id)a3 withCompletion:(id)a4
{
  v9 = (void (**)(id, void *))a4;
  id v5 = a3;
  if ([v5 state])
  {
    uint64_t v6 = [v5 state];

    id v7 = +[MTAlarmStateResolutionResult successWithResolvedAlarmState:v6];
    v9[2](v9, v7);
  }
  else
  {
    uint64_t v8 = [v5 operation];

    if (v8 == 1) {
      +[MTAlarmStateResolutionResult needsValue];
    }
    else {
    id v7 = +[MTAlarmStateResolutionResult notRequired];
    }
    v9[2](v9, v7);
  }
}

- (void)provideAlarmOptionsForToggleAlarm:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(MTAlarmIntentHandler *)self alarmManager];
  id v7 = [v6 alarmsIncludingSleepAlarm:1];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__MTToggleAlarmIntentHandler_provideAlarmOptionsForToggleAlarm_withCompletion___block_invoke;
  v14[3] = &unk_1E5914D18;
  id v8 = v5;
  id v15 = v8;
  id v9 = (id)[v7 addFailureBlock:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__MTToggleAlarmIntentHandler_provideAlarmOptionsForToggleAlarm_withCompletion___block_invoke_2;
  v12[3] = &unk_1E5914DB0;
  id v13 = v8;
  id v10 = v8;
  id v11 = (id)[v7 addSuccessBlock:v12];
}

uint64_t __79__MTToggleAlarmIntentHandler_provideAlarmOptionsForToggleAlarm_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__MTToggleAlarmIntentHandler_provideAlarmOptionsForToggleAlarm_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "na_map:", &__block_literal_global_1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__MTToggleAlarmIntentHandler_provideAlarmOptionsForToggleAlarm_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 intentAlarm];
}

- (void)confirmToggleAlarm:(id)a3 completion:(id)a4
{
  v4 = (void (**)(id, MTToggleAlarmIntentResponse *))a4;
  id v5 = [[MTToggleAlarmIntentResponse alloc] initWithCode:1 userActivity:0];
  v4[2](v4, v5);
}

- (void)handleToggleAlarm:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MTLogForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[MTToggleAlarmIntentHandler handleToggleAlarm:completion:]();
  }

  uint64_t v9 = [v6 operation];
  if (v9 == 1)
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v6, "state") == 1);
  }
  else
  {
    id v10 = 0;
  }
  id v11 = [v6 alarm];
  v12 = [v11 identifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__MTToggleAlarmIntentHandler_handleToggleAlarm_completion___block_invoke;
  v15[3] = &unk_1E5914DD8;
  id v16 = v6;
  id v17 = v7;
  id v13 = v6;
  id v14 = v7;
  [(MTToggleAlarmIntentHandler *)self _toggleAlarm:v10 alarmIDString:v12 completion:v15];

  if (v9 == 1) {
}
  }

void __59__MTToggleAlarmIntentHandler_handleToggleAlarm_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (*(void *)(a1 + 40))
  {
    id v6 = [MTToggleAlarmIntentResponse alloc];
    if (a2) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 5;
    }
    uint64_t v9 = [(MTToggleAlarmIntentResponse *)v6 initWithCode:v7 userActivity:0];
    [(MTToggleAlarmIntentResponse *)v9 setState:a3];
    id v8 = [*(id *)(a1 + 32) alarm];
    [(MTToggleAlarmIntentResponse *)v9 setAlarm:v8];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)resolveOperationForToggleAlarm:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v5 = (void (**)(id, void *))a4;
  if ([v7 operation]) {
    +[MTAlarmOperationResolutionResult successWithResolvedAlarmOperation:](MTAlarmOperationResolutionResult, "successWithResolvedAlarmOperation:", [v7 operation]);
  }
  else {
  id v6 = +[MTAlarmOperationResolutionResult needsValue];
  }
  v5[2](v5, v6);
}

- (void)_toggleAlarm:(id)a3 alarmIDString:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MTAlarmIntentHandler *)self alarmManager];
  v12 = [v11 alarmsIncludingSleepAlarm:1];

  objc_initWeak(&location, self);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke;
  v26[3] = &unk_1E5914E00;
  objc_copyWeak(&v30, &location);
  id v13 = v9;
  id v27 = v13;
  id v14 = v8;
  id v28 = v14;
  v29 = v31;
  id v15 = [v12 flatMap:v26];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_17;
  v23[3] = &unk_1E5914E28;
  id v16 = v10;
  id v24 = v16;
  v25 = v31;
  id v17 = (id)[v15 addSuccessBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_2;
  v20[3] = &unk_1E5914E50;
  id v18 = v16;
  id v21 = v18;
  v22 = v31;
  id v19 = (id)[v15 addFailureBlock:v20];

  objc_destroyWeak(&v30);
  _Block_object_dispose(v31, 8);
  objc_destroyWeak(&location);
}

id __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke(uint64_t a1, void *a2)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v29 = WeakRetained;
    __int16 v30 = 2114;
    *(void *)v31 = v3;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm fetch returned alarms: %{public}@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  if (!v6) {
    goto LABEL_9;
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_11;
  v26[3] = &unk_1E5914D40;
  id v27 = v6;
  id v7 = objc_msgSend(v3, "na_firstObjectPassingTest:", v26);

  if (!v7)
  {
LABEL_9:
    v12 = MTLogForCategory(3);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_cold_1((uint64_t)WeakRetained, v12);
    }

    id v13 = (void *)MEMORY[0x1E4F7A0D8];
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28588];
    v35[0] = @"Found no alarm to enable/disable";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    id v15 = [v14 errorWithDomain:@"com.apple.mobiletimer.alarmintent" code:0 userInfo:v7];
    id v16 = [v13 futureWithError:v15];
    goto LABEL_18;
  }
  int v8 = [WeakRetained getEnableStateForAlarm:v7];
  id v9 = *(void **)(a1 + 40);
  if (!v9) {
    goto LABEL_12;
  }
  if (v8 != [v9 BOOLValue])
  {
    id v10 = *(void **)(a1 + 40);
    if (v10)
    {
      uint64_t v11 = [v10 BOOLValue];
LABEL_13:
      id v17 = MTLogForCategory(3);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v29 = WeakRetained;
        __int16 v30 = 1024;
        *(_DWORD *)v31 = v11;
        *(_WORD *)&void v31[4] = 2114;
        *(void *)&v31[6] = v7;
        _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating enable state to %i for alarm: %{public}@", buf, 0x1Cu);
      }

      id v15 = [WeakRetained updateEnableStateForAlarm:v7 enabled:v11];
      int v18 = [WeakRetained getEnableStateForAlarm:v15];
      uint64_t v19 = 1;
      if (!v18) {
        uint64_t v19 = 2;
      }
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v19;
      id v20 = [WeakRetained alarmManager];
      id v16 = [v20 updateAlarm:v15];

LABEL_18:
      goto LABEL_19;
    }
LABEL_12:
    uint64_t v11 = v8 ^ 1u;
    goto LABEL_13;
  }
  v22 = MTLogForCategory(3);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    id v29 = WeakRetained;
    __int16 v30 = 2114;
    *(void *)v31 = v7;
    *(_WORD *)&v31[8] = 2114;
    *(void *)&v31[10] = v23;
    __int16 v32 = 1024;
    int v33 = v8;
    _os_log_impl(&dword_19CC95000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm being modified: %{public}@. Enabled state from intent: %{public}@, current alarm enable state: %i", buf, 0x26u);
  }

  uint64_t v24 = 1;
  if (!v8) {
    uint64_t v24 = 2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v24;
  v25 = MTLogForCategory(3);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v29 = WeakRetained;
    __int16 v30 = 2114;
    *(void *)v31 = v7;
    _os_log_impl(&dword_19CC95000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm state already matches intent state : %{public}@", buf, 0x16u);
  }

  id v16 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
LABEL_19:

  return v16;
}

uint64_t __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = [a2 alarmID];
  v4 = [v3 UUIDString];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

uint64_t __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (BOOL)getEnableStateForAlarm:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isSleepAlarm];
  int v5 = [v3 isEnabled];
  char v6 = v4 ^ 1;
  char v7 = (v4 ^ 1) & v5;
  if ((v6 & 1) == 0 && v5) {
    char v7 = [v3 sleepSchedule];
  }

  return v7;
}

- (id)updateEnableStateForAlarm:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  char v6 = (void *)[v5 mutableCopy];
  [v6 setEnabled:v4];
  int v7 = [v5 isSleepAlarm];

  if (v7) {
    [v6 setSleepSchedule:v4];
  }
  int v8 = (void *)[v6 copy];

  return v8;
}

- (id)_alarmUserActivityWithEnableIntent:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F29230];
  id v4 = a3;
  id v5 = [v3 mtUserActivityWithActivityType:@"com.apple.clock.alarm"];
  char v6 = objc_opt_class();
  int v7 = [v4 identifier];
  int v8 = [v4 alarmID];

  id v9 = [v8 identifier];
  id v10 = [v6 createUserInfoWithIntentName:v7 alarmIDString:v9 time:0 label:0];

  [v5 setUserInfo:v10];
  return v5;
}

- (id)_alarmUserActivityWithDisableIntent:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F29230];
  id v4 = a3;
  id v5 = [v3 mtUserActivityWithActivityType:@"com.apple.clock.alarm"];
  char v6 = objc_opt_class();
  int v7 = [v4 identifier];
  int v8 = [v4 alarmID];

  id v9 = [v8 identifier];
  id v10 = [v6 createUserInfoWithIntentName:v7 alarmIDString:v9 time:0 label:0];

  [v5 setUserInfo:v10];
  return v5;
}

- (void)handleEnableAlarm:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19CC95000, v0, v1, "%s intent:%@", v2, v3, v4, v5, 2u);
}

- (void)handleDisableAlarm:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19CC95000, v0, v1, "%s intent:%@", v2, v3, v4, v5, 2u);
}

- (void)handleToggleAlarm:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19CC95000, v0, v1, "%s intent:%@", v2, v3, v4, v5, 2u);
}

void __68__MTToggleAlarmIntentHandler__toggleAlarm_alarmIDString_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "%{public}@ found no alarm to enable", (uint8_t *)&v2, 0xCu);
}

@end