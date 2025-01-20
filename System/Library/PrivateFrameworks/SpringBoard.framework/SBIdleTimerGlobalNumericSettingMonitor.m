@interface SBIdleTimerGlobalNumericSettingMonitor
@end

@implementation SBIdleTimerGlobalNumericSettingMonitor

void __59___SBIdleTimerGlobalNumericSettingMonitor__settingChanged___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _updateCache])
  {
    v2 = NSString;
    v3 = [*(id *)(a1 + 40) name];
    v4 = [*(id *)(a1 + 32) label];
    v5 = [v2 stringWithFormat:@"%@:%@", v3, v4];

    v6 = SBLogIdleTimer();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = [*(id *)(a1 + 32) formattedValue];
      *(_DWORD *)buf = 138412802;
      v12 = v8;
      __int16 v13 = 2114;
      v14 = v5;
      __int16 v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[%@ _settingChanged:] - reason: %{public}@, setting: %{public}@", buf, 0x20u);
    }
    v10 = [*(id *)(a1 + 32) delegate];
    [v10 idleTimerGlobalSettingMonitor:*(void *)(a1 + 32) changedForReason:v5];
  }
}

@end