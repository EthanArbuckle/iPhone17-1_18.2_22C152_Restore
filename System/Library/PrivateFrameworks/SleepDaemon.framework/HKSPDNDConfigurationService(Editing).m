@interface HKSPDNDConfigurationService(Editing)
- (uint64_t)_actuallyUpdateModeConfiguration:()Editing state:error:;
- (uint64_t)_createSleepFocusModeInState:()Editing error:;
- (uint64_t)_updateSleepFocusModeWithState:()Editing error:;
- (uint64_t)configureSleepFocusModeWithState:()Editing error:;
- (uint64_t)createSleepFocusModeInState:()Editing error:;
- (uint64_t)removeSleepFocusMode:()Editing;
@end

@implementation HKSPDNDConfigurationService(Editing)

- (uint64_t)createSleepFocusModeInState:()Editing error:
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([a1 hasSleepFocusMode:a4])
  {
    v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      v10 = a1;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] already have a sleep focus mode", (uint8_t *)&v9, 0xCu);
    }

    return 1;
  }
  else
  {
    return [a1 _createSleepFocusModeInState:a3 error:a4];
  }
}

- (uint64_t)removeSleepFocusMode:()Editing
{
  v5 = [a1 modeConfigService];
  uint64_t v6 = [v5 removeModeConfigurationForModeIdentifier:*MEMORY[0x263F75CD0] error:a3];

  if (v6) {
    [a1 updateCachedUUID:0 state:0];
  }
  return v6;
}

- (uint64_t)configureSleepFocusModeWithState:()Editing error:
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([a1 hasSleepFocusMode:a4])
  {
    return [a1 _updateSleepFocusModeWithState:a3 error:a4];
  }
  else
  {
    v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      v10 = a1;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] we don't have a sleep focus mode", (uint8_t *)&v9, 0xCu);
    }

    return 0;
  }
}

- (uint64_t)_createSleepFocusModeInState:()Editing error:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromHKSPSleepFocusConfigurationState();
    int v15 = 138543618;
    v16 = a1;
    __int16 v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating default sleep focus mode (state: %{public}@)", (uint8_t *)&v15, 0x16u);
  }
  int v9 = [a1 modeConfigService];
  v10 = [v9 createDefaultSleepingModeConfigurationWithError:a4];

  if (v10)
  {
    uint64_t v11 = [a1 _actuallyUpdateModeConfiguration:v10 state:a3 error:a4];
  }
  else
  {
    v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = *a4;
      int v15 = 138543618;
      v16 = a1;
      __int16 v17 = 2114;
      v18 = v14;
      _os_log_error_impl(&dword_221A52000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create default sleep focus mode configuration with error: %{public}@", (uint8_t *)&v15, 0x16u);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (uint64_t)_updateSleepFocusModeWithState:()Editing error:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromHKSPSleepFocusConfigurationState();
    int v15 = 138543618;
    v16 = a1;
    __int16 v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating existing sleep focus mode (state: %{public}@)", (uint8_t *)&v15, 0x16u);
  }
  int v9 = [a1 modeConfigService];
  v10 = [v9 modeConfigurationForModeIdentifier:*MEMORY[0x263F75CD0] error:a4];

  if (v10)
  {
    uint64_t v11 = [a1 _actuallyUpdateModeConfiguration:v10 state:a3 error:a4];
  }
  else
  {
    v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = *a4;
      int v15 = 138543618;
      v16 = a1;
      __int16 v17 = 2114;
      v18 = v14;
      _os_log_error_impl(&dword_221A52000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] failed to fetch existing sleep focus mode configuration with error: %{public}@", (uint8_t *)&v15, 0x16u);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (uint64_t)_actuallyUpdateModeConfiguration:()Editing state:error:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v7 = objc_msgSend(a3, "hksp_configurationWithConfigurationState:", a4);
  v8 = [a1 modeConfigService];
  uint64_t v9 = [v8 setModeConfiguration:v7 error:a5];

  v10 = HKSPLogForCategory();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      v16 = a1;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully set sleep focus mode configuration", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v11 = [v7 mode];
    v12 = [v11 identifier];
    objc_msgSend(a1, "updateCachedUUID:state:", v12, objc_msgSend(v7, "hksp_configurationState"));
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *a5;
    int v15 = 138543618;
    v16 = a1;
    __int16 v17 = 2114;
    uint64_t v18 = v14;
    _os_log_error_impl(&dword_221A52000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] failed to set sleep focus mode configuration with error: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  return v9;
}

@end