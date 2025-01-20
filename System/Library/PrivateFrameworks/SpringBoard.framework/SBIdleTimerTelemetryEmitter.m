@interface SBIdleTimerTelemetryEmitter
- (void)_emitPowerLogEventWithPPSTelemetryIdentifier:(PPSTelemetryIdentifier *)a3 dictionary:(id)a4;
- (void)logTelemetryForUpdatedIdleTimerState:(BOOL)a3 disablingClientBundleIdentifier:(id)a4 autoLockTimeoutDuration:(id)a5;
@end

@implementation SBIdleTimerTelemetryEmitter

- (void)logTelemetryForUpdatedIdleTimerState:(BOOL)a3 disablingClientBundleIdentifier:(id)a4 autoLockTimeoutDuration:(id)a5
{
  BOOL v6 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v8 = (__CFString *)a4;
  id v9 = a5;
  if (logTelemetryForUpdatedIdleTimerState_disablingClientBundleIdentifier_autoLockTimeoutDuration__onceToken != -1) {
    dispatch_once(&logTelemetryForUpdatedIdleTimerState_disablingClientBundleIdentifier_autoLockTimeoutDuration__onceToken, &__block_literal_global_147);
  }
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  v11 = [NSNumber numberWithBool:v6];
  [v10 setObject:v11 forKeyedSubscript:@"idleTimerDisabled"];

  if (v8) {
    v12 = v8;
  }
  else {
    v12 = &stru_1F3084718;
  }
  [v10 setObject:v12 forKeyedSubscript:@"bundleID"];
  v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "intValue"));
  [v10 setObject:v13 forKeyedSubscript:@"autoLockTimeoutDuration"];

  v14 = SBLogIdleTimer();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    int v17 = 138543618;
    v18 = v16;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updated idle timer state telemetry: %{public}@", (uint8_t *)&v17, 0x16u);
  }
  [(SBIdleTimerTelemetryEmitter *)self _emitPowerLogEventWithPPSTelemetryIdentifier:logTelemetryForUpdatedIdleTimerState_disablingClientBundleIdentifier_autoLockTimeoutDuration__identifier dictionary:v10];
}

uint64_t __124__SBIdleTimerTelemetryEmitter_logTelemetryForUpdatedIdleTimerState_disablingClientBundleIdentifier_autoLockTimeoutDuration___block_invoke()
{
  uint64_t result = PPSCreateTelemetryIdentifier();
  logTelemetryForUpdatedIdleTimerState_disablingClientBundleIdentifier_autoLockTimeoutDuration__identifier = result;
  return result;
}

- (void)_emitPowerLogEventWithPPSTelemetryIdentifier:(PPSTelemetryIdentifier *)a3 dictionary:(id)a4
{
}

@end