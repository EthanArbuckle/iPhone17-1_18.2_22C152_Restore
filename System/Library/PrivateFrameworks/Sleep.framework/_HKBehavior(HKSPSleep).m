@interface _HKBehavior(HKSPSleep)
- (BOOL)hksp_activePairedDeviceHasHomeButton;
- (BOOL)hksp_hasActivePairedDevice;
- (BOOL)hksp_supportsDailyAnalytics;
- (BOOL)hksp_supportsGoodMorningAlerts;
- (BOOL)hksp_supportsSleepAlarms;
- (BOOL)hksp_supportsSleepLockScreen;
- (BOOL)hksp_supportsSleepTracking;
- (BOOL)hksp_supportsUserNotificationCenter;
- (BOOL)hksp_supportsWakeDetection;
- (id)hksp_activePairedDeviceProductType;
- (uint64_t)_hksp_activePairedDeviceSupportsCapability:()HKSPSleep;
- (uint64_t)_hksp_supportsSleep_checkTinker:()HKSPSleep;
- (uint64_t)hksp_activePairedDeviceSupportsFocusMode;
- (uint64_t)hksp_activePairedDeviceSupportsSleep;
- (uint64_t)hksp_activePairedDeviceSupportsSleepLauncherComplication;
- (uint64_t)hksp_activePairedDeviceSupportsSleepStages;
- (uint64_t)hksp_demoMode;
- (uint64_t)hksp_device;
- (uint64_t)hksp_supportsAlwaysOnTracking;
- (uint64_t)hksp_supportsCFUserNotifications;
- (uint64_t)hksp_supportsLegacySleepAlarms;
- (uint64_t)hksp_supportsSleep;
- (uint64_t)hksp_supportsSleepDaemon;
- (uint64_t)hksp_supportsSleepWidget;
- (uint64_t)hksp_supportsWakeUpResults;
- (uint64_t)hksp_useDemoSleepData;
- (void)hksp_activePairedDeviceHasSleepAppInstalledWithCompletion:()HKSPSleep;
@end

@implementation _HKBehavior(HKSPSleep)

- (uint64_t)_hksp_supportsSleep_checkTinker:()HKSPSleep
{
  uint64_t v5 = objc_msgSend(a1, "hksp_device") - 1;
  uint64_t result = 1;
  switch(v5)
  {
    case 0:
    case 2:
      return result;
    case 1:
      if (a3)
      {
        if (![a1 tinkerModeEnabled]) {
          return 1;
        }
        v7 = HKSPLogForCategory(0);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v16 = 0;
          v8 = "sleep not available for tinker";
          v9 = (uint8_t *)&v16;
          goto LABEL_14;
        }
        goto LABEL_15;
      }
      return result;
    case 3:
      v10 = [a1 features];
      char v11 = [v10 sleepOnIpad];

      if (v11) {
        return 1;
      }
      v7 = HKSPLogForCategory(0);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      __int16 v15 = 0;
      v8 = "sleep not available for iPad";
      v9 = (uint8_t *)&v15;
      goto LABEL_14;
    case 4:
      v12 = [a1 features];
      char v13 = [v12 sleepOnMac];

      if (v13) {
        return 1;
      }
      v7 = HKSPLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        v8 = "sleep not available for Mac";
        v9 = (uint8_t *)&v14;
LABEL_14:
        _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
LABEL_15:

      return 0;
    case 5:
      return 0;
    default:
      return 0;
  }
}

- (uint64_t)hksp_device
{
  if ([a1 isAppleWatch]) {
    return 2;
  }
  if ([a1 isiPad]) {
    return 4;
  }
  v3 = [a1 currentDeviceClass];
  if ([v3 isEqualToString:@"iPhone"])
  {
    uint64_t v2 = 1;
  }
  else if ([v3 isEqualToString:@"RealityDevice"])
  {
    uint64_t v2 = 6;
  }
  else if ([v3 isEqualToString:@"iPod"])
  {
    uint64_t v2 = 3;
  }
  else if ([v3 isEqualToString:@"Mac"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 1000;
  }

  return v2;
}

- (uint64_t)hksp_supportsSleepDaemon
{
  return objc_msgSend(a1, "_hksp_supportsSleep_checkTinker:", 0);
}

- (uint64_t)hksp_supportsSleep
{
  return objc_msgSend(a1, "_hksp_supportsSleep_checkTinker:", 1);
}

- (BOOL)hksp_supportsSleepLockScreen
{
  return ((objc_msgSend(a1, "hksp_device") - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (uint64_t)hksp_supportsSleepWidget
{
  uint64_t result = objc_msgSend(a1, "hksp_supportsHealthData");
  if (result)
  {
    uint64_t v3 = objc_msgSend(a1, "hksp_device");
    if ((unint64_t)(v3 - 1) >= 3)
    {
      if (v3 == 4)
      {
        v4 = [a1 features];
        uint64_t v5 = [v4 sleepOnIpad];

        return v5;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)hksp_supportsWakeUpResults
{
  uint64_t result = objc_msgSend(a1, "hksp_supportsHealthData");
  if (result) {
    return ((objc_msgSend(a1, "hksp_device") - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  return result;
}

- (BOOL)hksp_supportsSleepTracking
{
  return (unint64_t)(objc_msgSend(a1, "hksp_device") - 1) < 3;
}

- (uint64_t)hksp_supportsAlwaysOnTracking
{
  if (objc_msgSend(a1, "hksp_device") != 2) {
    return 0;
  }
  uint64_t v2 = [a1 features];
  uint64_t v3 = [v2 lavender];

  return v3;
}

- (BOOL)hksp_supportsGoodMorningAlerts
{
  return (unint64_t)(objc_msgSend(a1, "hksp_device") - 1) < 3;
}

- (BOOL)hksp_supportsWakeDetection
{
  return (unint64_t)(objc_msgSend(a1, "hksp_device") - 1) < 3;
}

- (BOOL)hksp_supportsUserNotificationCenter
{
  return (unint64_t)(objc_msgSend(a1, "hksp_device") - 1) < 3;
}

- (uint64_t)hksp_supportsCFUserNotifications
{
  unint64_t v1 = objc_msgSend(a1, "hksp_device");
  return (v1 < 5) & (0x1Au >> v1);
}

- (BOOL)hksp_supportsSleepAlarms
{
  return (unint64_t)(objc_msgSend(a1, "hksp_device") - 1) < 3;
}

- (uint64_t)hksp_supportsLegacySleepAlarms
{
  uint64_t result = objc_msgSend(a1, "hksp_supportsSleepAlarms");
  if (result) {
    return ((objc_msgSend(a1, "hksp_device") - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  return result;
}

- (BOOL)hksp_supportsDailyAnalytics
{
  return ((objc_msgSend(a1, "hksp_device") - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (uint64_t)hksp_useDemoSleepData
{
  if ([a1 isRunningStoreDemoMode])
  {
    unint64_t v1 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      uint64_t v2 = "running in demo mode";
      uint64_t v3 = (uint8_t *)&v11;
LABEL_7:
      _os_log_impl(&dword_1A7E74000, v1, OS_LOG_TYPE_DEFAULT, v2, v3, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "hksp_internalUserDefaults");
  int v5 = objc_msgSend(v4, "hksp_useDemoSleepData");

  v6 = HKSPLogForCategory(0);
  unint64_t v1 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v2 = "use demo data default set";
      uint64_t v3 = buf;
      goto LABEL_7;
    }
LABEL_8:
    uint64_t v7 = 1;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A7E74000, v1, OS_LOG_TYPE_INFO, "using live data", v9, 2u);
  }
  uint64_t v7 = 0;
LABEL_12:

  return v7;
}

- (BOOL)hksp_hasActivePairedDevice
{
  v0 = [MEMORY[0x1E4F79EF0] sharedInstance];
  unint64_t v1 = [v0 getActivePairedDevice];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)hksp_activePairedDeviceSupportsSleep
{
  BOOL v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C0F3C2C3-0CDE-4DF9-A95A-789AC9A0348B"];
  uint64_t v3 = objc_msgSend(a1, "_hksp_activePairedDeviceSupportsCapability:", v2);

  return v3;
}

- (uint64_t)hksp_activePairedDeviceSupportsSleepStages
{
  BOOL v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A70EA46D-407A-4723-A8EF-CFF5DFB423B4"];
  uint64_t v3 = objc_msgSend(a1, "_hksp_activePairedDeviceSupportsCapability:", v2);

  return v3;
}

- (uint64_t)hksp_activePairedDeviceSupportsFocusMode
{
  BOOL v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"FFDA9C57-8508-4B50-B6D8-EEE862251FC0"];
  uint64_t v3 = objc_msgSend(a1, "_hksp_activePairedDeviceSupportsCapability:", v2);

  return v3;
}

- (uint64_t)hksp_activePairedDeviceSupportsSleepLauncherComplication
{
  BOOL v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"E49AA0D4-4AA5-47C3-9272-4644AF0E6FA9"];
  uint64_t v3 = objc_msgSend(a1, "_hksp_activePairedDeviceSupportsCapability:", v2);

  return v3;
}

- (uint64_t)_hksp_activePairedDeviceSupportsCapability:()HKSPSleep
{
  uint64_t v3 = (void *)MEMORY[0x1E4F79EF0];
  id v4 = a3;
  int v5 = [v3 sharedInstance];
  v6 = [v5 getActivePairedDevice];
  uint64_t v7 = [v6 supportsCapability:v4];

  return v7;
}

- (BOOL)hksp_activePairedDeviceHasHomeButton
{
  v0 = [MEMORY[0x1E4F79EF0] sharedInstance];
  unint64_t v1 = [v0 getActivePairedDevice];
  BOOL v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 valueForProperty:*MEMORY[0x1E4F79D88]];
    uint64_t v4 = [v3 integerValue];

    BOOL v5 = v4 != 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)hksp_activePairedDeviceProductType
{
  v0 = [MEMORY[0x1E4F79EF0] sharedInstance];
  unint64_t v1 = [v0 getActivePairedDevice];

  BOOL v2 = [v1 valueForProperty:*MEMORY[0x1E4F79E18]];

  return v2;
}

- (void)hksp_activePairedDeviceHasSleepAppInstalledWithCompletion:()HKSPSleep
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F79EF0] sharedInstance];
  BOOL v5 = [v4 getActivePairedDevice];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __84___HKBehavior_HKSPSleep__hksp_activePairedDeviceHasSleepAppInstalledWithCompletion___block_invoke;
    v8[3] = &unk_1E5D32990;
    id v9 = v3;
    [v6 applicationIsInstalledOnPairedDevice:v5 withBundleID:@"com.apple.NanoSleep.watchkitapp" completion:v8];
  }
  else
  {
    uint64_t v7 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "no active paired device", buf, 2u);
    }

    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
  }
}

- (uint64_t)hksp_demoMode
{
  if ([a1 isRunningStoreDemoMode]) {
    return 1;
  }
  return [a1 runningInStoreDemoModeF201];
}

@end