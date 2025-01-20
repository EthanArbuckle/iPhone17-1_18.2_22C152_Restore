@interface _HDSPWakeDetectionDetectingState
- (BOOL)_isActivityDateInDetectionWindow:(id)a3 type:(unint64_t)a4;
- (BOOL)isDetectingState;
- (unint64_t)activeTypes;
- (void)didEnter;
- (void)didExit;
- (void)earlyWakeUpWasNotifiedRemotely;
- (void)wakeupEventDetected:(unint64_t)a3 date:(id)a4;
@end

@implementation _HDSPWakeDetectionDetectingState

- (void)didEnter
{
  id v3 = [(HKSPStateMachineState *)self stateMachine];
  objc_msgSend(v3, "startWakeDetection:", -[_HDSPWakeDetectionDetectingState activeTypes](self, "activeTypes"));
}

- (void)didExit
{
  id v3 = [(HKSPStateMachineState *)self stateMachine];
  v6 = [v3 currentContext];

  if ([v6 hasStateTransitionOrInitializing])
  {
    v4 = [v6 nextState];
    if (([v4 isDetectingState] & 1) == 0)
    {
      v5 = [(HKSPStateMachineState *)self stateMachine];
      [v5 stopWakeDetection];
    }
  }

  MEMORY[0x270F9A758]();
}

- (unint64_t)activeTypes
{
  return 0;
}

- (BOOL)isDetectingState
{
  return 1;
}

- (BOOL)_isActivityDateInDetectionWindow:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(HKSPStateMachineState *)self stateMachine];
  v8 = [v7 infoProvider];
  v9 = [v8 detectionWindowForType:a4];
  char v10 = objc_msgSend(v9, "hksp_containsDate:", v6);

  return v10;
}

- (void)wakeupEventDetected:(unint64_t)a3 date:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    id v9 = v8;
    char v10 = NSStringFromHDSPWakeDetectorTypes(a3);
    *(_DWORD *)buf = 138543874;
    v23 = v8;
    __int16 v24 = 2114;
    v25 = v10;
    __int16 v26 = 2114;
    id v27 = v6;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] wakeupEventDetected: %{public}@ - %{public}@", buf, 0x20u);
  }
  BOOL v11 = [(_HDSPWakeDetectionDetectingState *)self _isActivityDateInDetectionWindow:v6 type:a3];
  v12 = HKSPLogForCategory();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v14 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v23 = v14;
      id v15 = v14;
      _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake detection event found", buf, 0xCu);
    }
    v16 = [(HKSPStateMachineState *)self stateMachine];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __61___HDSPWakeDetectionDetectingState_wakeupEventDetected_date___block_invoke;
    v20[3] = &unk_2645D90C0;
    id v21 = v16;
    v12 = v16;
    v17 = +[HDSPWakeDetectionStateMachineContext contextWithType:a3];
    [v12 perform:v20 withContext:v17];
  }
  else if (v13)
  {
    v18 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v23 = v18;
    id v19 = v18;
    _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring wake up event because it's outside of detection window", buf, 0xCu);
  }
}

- (void)earlyWakeUpWasNotifiedRemotely
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = (id)objc_opt_class();
    id v4 = v11;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] earlyWakeUpWasNotifiedRemotely", buf, 0xCu);
  }
  v5 = [(HKSPStateMachineState *)self stateMachine];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66___HDSPWakeDetectionDetectingState_earlyWakeUpWasNotifiedRemotely__block_invoke;
  v8[3] = &unk_2645D90C0;
  id v9 = v5;
  id v6 = v5;
  v7 = +[HDSPWakeDetectionStateMachineContext contextWithType:0];
  [v6 perform:v8 withContext:v7];
}

@end