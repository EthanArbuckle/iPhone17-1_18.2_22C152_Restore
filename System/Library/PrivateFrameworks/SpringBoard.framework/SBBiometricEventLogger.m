@interface SBBiometricEventLogger
+ (id)sharedInstance;
+ (void)logClass:(unsigned __int8)a3 code:(unsigned int)a4;
+ (void)logEvent:(unsigned int)a3;
- (BOOL)_shouldSyslogTimestamps;
- (BOOL)fingerOnWithScreenOn;
- (SBBiometricEventLogger)init;
- (unint64_t)_machTimeInMilliseconds;
- (unint64_t)fingerOnTime;
- (unint64_t)keybagUnlockTime;
- (void)_authRequestCompleted:(id)a3;
- (void)_backlightLevelChanged:(id)a3;
- (void)_biometricAuthenticationFailed;
- (void)_clearEverything;
- (void)_coversheetSwipedForDismissal:(id)a3;
- (void)_fingerOn:(id)a3;
- (void)_keybagBioUnlock:(id)a3;
- (void)_passcodeAuthenticationSucceeded;
- (void)_passcodePromptCancelled:(id)a3;
- (void)_passcodeViewTransitionedToPasscode:(id)a3;
- (void)_prearmMatch:(id)a3;
- (void)_resetPasscodeStateMachine;
- (void)_screenTurnedOn:(id)a3;
- (void)_systemDidWakeFromSleep:(id)a3;
- (void)_tryAgain:(id)a3;
- (void)_unlockAnimationWillStart:(id)a3;
- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4;
- (void)setFingerOnTime:(unint64_t)a3;
- (void)setFingerOnWithScreenOn:(BOOL)a3;
- (void)setKeybagUnlockTime:(unint64_t)a3;
- (void)timestampEvent:(unint64_t)a3;
@end

@implementation SBBiometricEventLogger

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_42 != -1) {
    dispatch_once(&sharedInstance_onceToken_42, &__block_literal_global_283);
  }
  v2 = (void *)sharedInstance___sharedInstance_22;
  return v2;
}

void __40__SBBiometricEventLogger_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBBiometricEventLogger);
  v1 = (void *)sharedInstance___sharedInstance_22;
  sharedInstance___sharedInstance_22 = (uint64_t)v0;
}

+ (void)logEvent:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (__loadBiometricKitIfNecessary_onceToken != -1) {
    dispatch_once(&__loadBiometricKitIfNecessary_onceToken, &__block_literal_global_154);
  }
  v4 = (void (*)(uint64_t))BKLogEventFn;
  if (__loadBiometricKitIfNecessary_biometricKit) {
    BOOL v5 = BKLogEventFn == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    v4(v3);
  }
}

+ (void)logClass:(unsigned __int8)a3 code:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  if (__loadBiometricKitIfNecessary_onceToken != -1) {
    dispatch_once(&__loadBiometricKitIfNecessary_onceToken, &__block_literal_global_154);
  }
  v6 = (void (*)(uint64_t, uint64_t))BKLogCodeFn;
  if (__loadBiometricKitIfNecessary_biometricKit) {
    BOOL v7 = BKLogCodeFn == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v6(v5, v4);
  }
}

- (SBBiometricEventLogger)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBBiometricEventLogger;
  v2 = [(SBBiometricEventLogger *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__screenTurnedOn_ name:*MEMORY[0x1E4FA7A00] object:0];
    [v3 addObserver:v2 selector:sel__backlightLevelChanged_ name:*MEMORY[0x1E4FA7A18] object:0];
    [v3 addObserver:v2 selector:sel__fingerOn_ name:@"SBBiometricEventTimestampNotificationFingerOn" object:0];
    [v3 addObserver:v2 selector:sel__tryAgain_ name:@"SBBiometricEventTimestampNotificationTryAgain" object:0];
    [v3 addObserver:v2 selector:sel__keybagBioUnlock_ name:@"SBBiometricEventTimestampNotificationKeybagUnlock" object:0];
    [v3 addObserver:v2 selector:sel__unlockAnimationWillStart_ name:@"SBCoverSheetWillAnimateDeactivation" object:0];
    [v3 addObserver:v2 selector:sel__prearmMatch_ name:@"SBBiometricEventTimestampNotificationPrearmMatch" object:0];
    [v3 addObserver:v2 selector:sel__authRequestCompleted_ name:*MEMORY[0x1E4FA6128] object:0];
    [v3 addObserver:v2 selector:sel__systemDidWakeFromSleep_ name:@"SBWorkspaceDidWakeFromSleepNotification" object:0];
    [v3 addObserver:v2 selector:sel__passcodePromptCancelled_ name:@"SBBiometricEventTimestampNotificationPasscodeCancelled" object:0];
    [v3 addObserver:v2 selector:sel__coversheetSwipedForDismissal_ name:@"SBBiometricEventTimestampNotificationCoversheetSwipedForDismissal" object:0];
    [v3 addObserver:v2 selector:sel__passcodeViewTransitionedToPasscode_ name:*MEMORY[0x1E4FA7EB8] object:0];
    uint64_t v4 = [MEMORY[0x1E4FA7C68] sharedInstance];
    biometricResource = v2->_biometricResource;
    v2->_biometricResource = (SBUIBiometricResource *)v4;

    [(SBUIBiometricResource *)v2->_biometricResource addObserver:v2];
    if (__loadBiometricKitIfNecessary_onceToken != -1) {
      dispatch_once(&__loadBiometricKitIfNecessary_onceToken, &__block_literal_global_154);
    }
    if (__loadBiometricKitIfNecessary_biometricKit)
    {
      uint64_t v6 = [NSClassFromString(&cfstr_Biometrickit.isa) manager];
      biometricKit = v2->_biometricKit;
      v2->_biometricKit = (BiometricKit *)v6;
    }
  }
  return v2;
}

- (void)_clearEverything
{
  [(SBBiometricEventLogger *)self setFingerOnTime:0];
  [(SBBiometricEventLogger *)self setKeybagUnlockTime:0];
  [(SBBiometricEventLogger *)self setFingerOnWithScreenOn:0];
}

- (void)_screenTurnedOn:(id)a3
{
}

- (void)_backlightLevelChanged:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4FA7A20]];
  [v5 floatValue];

  self->_isScreenOn = BSFloatGreaterThanFloat();
  [(SBBiometricEventLogger *)self _resetPasscodeStateMachine];
}

- (void)_fingerOn:(id)a3
{
  [(SBBiometricEventLogger *)self setFingerOnTime:mach_absolute_time()];
  [(SBBiometricEventLogger *)self setFingerOnWithScreenOn:self->_isScreenOn];
  [(SBBiometricEventLogger *)self timestampEvent:1];
  biometricKit = self->_biometricKit;
  [(BiometricKit *)biometricKit timestampEvent:0];
}

- (void)_tryAgain:(id)a3
{
  [(SBBiometricEventLogger *)self timestampEvent:2];
  biometricKit = self->_biometricKit;
  [(BiometricKit *)biometricKit timestampEvent:1];
}

- (void)_keybagBioUnlock:(id)a3
{
  [(SBBiometricEventLogger *)self setKeybagUnlockTime:mach_absolute_time()];
  if ([(SBBiometricEventLogger *)self fingerOnTime]) {
    ADClientAddValueForScalarKey();
  }
  [(SBBiometricEventLogger *)self timestampEvent:3];
  [(BiometricKit *)self->_biometricKit timestampEvent:2];
  [(SBBiometricEventLogger *)self _biometricAuthenticationSucceeded];
}

- (void)_unlockAnimationWillStart:(id)a3
{
  if ([(SBBiometricEventLogger *)self fingerOnTime]
    && [(SBBiometricEventLogger *)self keybagUnlockTime])
  {
    [(SBBiometricEventLogger *)self timestampEvent:4];
    [(BiometricKit *)self->_biometricKit timestampEvent:3];
  }
  [(SBBiometricEventLogger *)self _clearEverything];
}

- (void)_prearmMatch:(id)a3
{
  [(SBBiometricEventLogger *)self timestampEvent:5];
  biometricKit = self->_biometricKit;
  [(BiometricKit *)biometricKit timestampEvent:4];
}

- (void)_authRequestCompleted:(id)a3
{
  id v11 = [a3 userInfo];
  uint64_t v4 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4FA6120]];
  uint64_t v5 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4FA6130]];
  uint64_t v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && [v4 integerValue] == 1)
  {
    int v8 = [v6 isEqualToString:*MEMORY[0x1E4FA6138]];
    objc_super v9 = objc_opt_class();
    uint64_t v10 = v8 ? 458752 : 458754;
    [v9 logEvent:v10];
    if (v8) {
      [(SBBiometricEventLogger *)self _passcodeAuthenticationSucceeded];
    }
  }
}

- (void)_systemDidWakeFromSleep:(id)a3
{
  uint64_t v3 = objc_opt_class();
  [v3 logEvent:0x10000];
}

- (void)_passcodePromptCancelled:(id)a3
{
  uint64_t v3 = objc_opt_class();
  [v3 logEvent:458753];
}

- (void)_coversheetSwipedForDismissal:(id)a3
{
  uint64_t v3 = objc_opt_class();
  [v3 logEvent:131077];
}

- (void)_passcodeViewTransitionedToPasscode:(id)a3
{
  uint64_t v3 = 393217;
  id v5 = [a3 userInfo];
  uint64_t v4 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA7EC8]];
  if ([v4 isEqualToString:*MEMORY[0x1E4FA7ED8]])
  {
    uint64_t v3 = 393219;
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4FA7EE0]])
  {
    uint64_t v3 = 393221;
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4FA7ED0]])
  {
    uint64_t v3 = 393220;
  }
  else if (![v4 isEqualToString:*MEMORY[0x1E4FA7EC0]])
  {
    goto LABEL_9;
  }
  [(id)objc_opt_class() logEvent:v3];
LABEL_9:
}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  [(id)objc_opt_class() logClass:7 code:a4];
  if (a4 - 9 > 2)
  {
    if (a4 - 25 <= 1)
    {
      uint64_t v6 = objc_opt_class();
      [v6 logEvent:393218];
    }
  }
  else
  {
    [(SBBiometricEventLogger *)self _biometricAuthenticationFailed];
  }
}

- (void)_passcodeAuthenticationSucceeded
{
  if (self->_passcodeSuccessAfterBioFailureTriggerArmed) {
    ADClientAddValueForScalarKey();
  }
  [(SBBiometricEventLogger *)self _resetPasscodeStateMachine];
}

- (void)_biometricAuthenticationFailed
{
  self->_passcodeSuccessAfterBioFailureTriggerArmed = 1;
}

- (void)_resetPasscodeStateMachine
{
  self->_passcodeSuccessAfterBioFailureTriggerArmed = 0;
}

- (BOOL)_shouldSyslogTimestamps
{
  if (_shouldSyslogTimestamps_onceToken != -1) {
    dispatch_once(&_shouldSyslogTimestamps_onceToken, &__block_literal_global_56_0);
  }
  return _shouldSyslogTimestamps_shouldLogTimestamps;
}

void __49__SBBiometricEventLogger__shouldSyslogTimestamps__block_invoke()
{
  id v1 = +[SBDefaults localDefaults];
  v0 = [v1 biometricAuthenticationDefaults];
  _shouldSyslogTimestamps_shouldLogTimestamps = [v0 isLogTimestampsEnabled];
}

- (void)timestampEvent:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 <= 6 && ((0x4Fu >> a3) & 1) != 0) {
    kdebug_trace();
  }
  if ([(SBBiometricEventLogger *)self _shouldSyslogTimestamps])
  {
    mach_absolute_time();
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v6 = v5;
    BOOL v7 = SBLogBiometricResource();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if (a3 - 1 > 5) {
        int v8 = "ScreenWillTurnOn";
      }
      else {
        int v8 = off_1E6B088F8[a3 - 1];
      }
      BSAbsoluteTimeFromMachTime();
      int v10 = 134218498;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v9;
      _os_log_debug_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEBUG, "%f MesaPerf %s (mach: %f)", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (unint64_t)_machTimeInMilliseconds
{
  if (_machTimeInMilliseconds_onceToken != -1) {
    dispatch_once(&_machTimeInMilliseconds_onceToken, &__block_literal_global_60_2);
  }
  uint64_t v2 = mach_absolute_time();
  LODWORD(v3) = _machTimeInMilliseconds_timebaseInfo;
  LODWORD(v4) = unk_1EA8BFDF0;
  return (unint64_t)((double)v2 * (double)v3 / (double)v4 * 0.000001);
}

uint64_t __49__SBBiometricEventLogger__machTimeInMilliseconds__block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_machTimeInMilliseconds_timebaseInfo);
}

- (unint64_t)keybagUnlockTime
{
  return self->_keybagUnlockTime;
}

- (void)setKeybagUnlockTime:(unint64_t)a3
{
  self->_keybagUnlockTime = a3;
}

- (unint64_t)fingerOnTime
{
  return self->_fingerOnTime;
}

- (void)setFingerOnTime:(unint64_t)a3
{
  self->_fingerOnTime = a3;
}

- (BOOL)fingerOnWithScreenOn
{
  return self->_fingerOnWithScreenOn;
}

- (void)setFingerOnWithScreenOn:(BOOL)a3
{
  self->_fingerOnWithScreenOn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_biometricKit, 0);
}

@end