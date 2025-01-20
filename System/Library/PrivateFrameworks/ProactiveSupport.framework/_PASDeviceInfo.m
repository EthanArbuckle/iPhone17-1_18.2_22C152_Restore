@interface _PASDeviceInfo
+ (BOOL)isAudioAccessory;
+ (BOOL)isBetaBuild;
+ (BOOL)isDNUEnabled;
+ (BOOL)isDemoModeEnabled;
+ (BOOL)isFaceTimeSupported;
+ (BOOL)isInternalBuild;
+ (BOOL)isLowEndHardware;
+ (BOOL)isLowPowerModeEnabled;
+ (BOOL)isiPad;
+ (BOOL)shouldIncludePredictionLogs;
+ (id)deviceUUID;
+ (id)internalDeviceCode;
+ (id)sharedInstance;
- (_PASDeviceInfo)init;
- (void)dealloc;
@end

@implementation _PASDeviceInfo

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_6);
  }
  return isInternalBuild_isInternalBuild;
}

- (void)dealloc
{
  int lowPowerModeToken = self->_lowPowerModeToken;
  if (lowPowerModeToken) {
    notify_cancel(lowPowerModeToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)_PASDeviceInfo;
  [(_PASDeviceInfo *)&v4 dealloc];
}

- (_PASDeviceInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PASDeviceInfo;
  v2 = [(_PASDeviceInfo *)&v6 init];
  v3 = v2;
  if (v2
    && notify_register_check("com.apple.system.lowpowermode", &v2->_lowPowerModeToken)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed notify_register_check.", v5, 2u);
  }
  return v3;
}

+ (id)deviceUUID
{
  if (deviceUUID_onceToken != -1) {
    dispatch_once(&deviceUUID_onceToken, &__block_literal_global_33);
  }
  v2 = (void *)deviceUUID_deviceUUID;

  return v2;
}

+ (id)internalDeviceCode
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36___PASDeviceInfo_internalDeviceCode__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (internalDeviceCode_onceToken != -1) {
    dispatch_once(&internalDeviceCode_onceToken, block);
  }
  v2 = (void *)internalDeviceCode_deviceCode;

  return v2;
}

+ (BOOL)shouldIncludePredictionLogs
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___PASDeviceInfo_shouldIncludePredictionLogs__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shouldIncludePredictionLogs_onceToken != -1) {
    dispatch_once(&shouldIncludePredictionLogs_onceToken, block);
  }
  return shouldIncludePredictionLogs_isPredictionLoggingEnabled;
}

+ (BOOL)isDNUEnabled
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isDiagnosticSubmissionAllowed];

  return v3;
}

+ (BOOL)isFaceTimeSupported
{
  return MEMORY[0x1F417CE00](@"venice", a2);
}

+ (BOOL)isiPad
{
  if (isiPad_onceToken != -1) {
    dispatch_once(&isiPad_onceToken, &__block_literal_global_21);
  }
  return isiPad_isiPad;
}

+ (BOOL)isAudioAccessory
{
  if (isAudioAccessory_onceToken != -1) {
    dispatch_once(&isAudioAccessory_onceToken, &__block_literal_global_16);
  }
  return isAudioAccessory_isAudioAccessory;
}

+ (BOOL)isBetaBuild
{
  if (isBetaBuild_onceToken != -1) {
    dispatch_once(&isBetaBuild_onceToken, &__block_literal_global_8_1973);
  }
  return isBetaBuild_isBeta;
}

+ (BOOL)isDemoModeEnabled
{
  if (isDemoModeEnabled_onceToken != -1) {
    dispatch_once(&isDemoModeEnabled_onceToken, &__block_literal_global_2);
  }
  return isDemoModeEnabled_isDemoModeEnabled;
}

+ (BOOL)isLowPowerModeEnabled
{
  v2 = [a1 sharedInstance];
  uint32_t state = notify_get_state(v2[2], (uint64_t *)&isLowPowerModeEnabled_state);

  if (state && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed notify_get_state.", v5, 2u);
  }
  return isLowPowerModeEnabled_state == 1;
}

+ (BOOL)isLowEndHardware
{
  return 0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1985);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

@end