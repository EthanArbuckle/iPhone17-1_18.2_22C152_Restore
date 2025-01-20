@interface PASDeviceInfo
@end

@implementation PASDeviceInfo

uint64_t __28___PASDeviceInfo_deviceUUID__block_invoke()
{
  deviceUUID_deviceUUID = MGCopyAnswer();

  return MEMORY[0x1F41817F8]();
}

uint64_t __36___PASDeviceInfo_internalDeviceCode__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isInternalBuild];
  if (result)
  {
    internalDeviceCode_deviceCode = MGCopyAnswer();
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

void __45___PASDeviceInfo_shouldIncludePredictionLogs__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"EnablePredictionLogging"];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    shouldIncludePredictionLogs_isPredictionLoggingEnabled = [v4 BOOLForKey:@"EnablePredictionLogging"];
  }
  else
  {
    if ([*(id *)(a1 + 32) isBetaBuild]) {
      char v5 = 1;
    }
    else {
      char v5 = [*(id *)(a1 + 32) isInternalBuild];
    }
    shouldIncludePredictionLogs_isPredictionLoggingEnabled = v5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109376;
    v6[1] = shouldIncludePredictionLogs_isPredictionLoggingEnabled;
    __int16 v7 = 1024;
    BOOL v8 = v3 != 0;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Prediction Logging Enabled: %d (controlled by setting: %d)", (uint8_t *)v6, 0xEu);
  }
}

uint64_t __24___PASDeviceInfo_isiPad__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  isiPad_isiPad = result == 3;
  return result;
}

uint64_t __34___PASDeviceInfo_isAudioAccessory__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  isAudioAccessory_isAudioAccessory = result == 7;
  return result;
}

void __29___PASDeviceInfo_isBetaBuild__block_invoke()
{
  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    isBetaBuild_isBeta = CFEqual(v0, @"Beta") != 0;
    CFRelease(v1);
  }
}

uint64_t __33___PASDeviceInfo_isInternalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  isInternalBuild_isInternalBuild = result;
  return result;
}

void __35___PASDeviceInfo_isDemoModeEnabled__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  isDemoModeEnabled_isDemoModeEnabled = [v0 BOOLForKey:@"DemoMode"];
}

uint64_t __32___PASDeviceInfo_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = objc_alloc_init(_PASDeviceInfo);

  return MEMORY[0x1F41817F8]();
}

@end