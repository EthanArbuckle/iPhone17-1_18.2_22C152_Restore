@interface UIDevice
+ (BOOL)_hasHomeButton;
+ (BOOL)_isLowEnd;
+ (BOOL)_isWatch;
+ (BOOL)_isWatchCompanion;
+ (UIDevice)currentDevice;
+ (id)modelSpecificLocalizedStringKeyForKey:(id)a3;
+ (int64_t)currentDeviceOrientationAllowingAmbiguous:(BOOL)a3;
+ (void)invalidateSystemSoundEnablement;
+ (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (BOOL)_hasGraphicsQualityOverride;
- (BOOL)_hasTouchPad;
- (BOOL)_isHardwareKeyboardAvailable;
- (BOOL)_remoteHasMicrophoneCapability;
- (BOOL)_supportsDeepColor;
- (BOOL)_supportsForceTouch;
- (BOOL)_supportsPencil;
- (BOOL)_supportsPushToTalk;
- (BOOL)isBatteryMonitoringEnabled;
- (BOOL)isGeneratingDeviceOrientationNotifications;
- (BOOL)isMultitaskingSupported;
- (BOOL)isProximityMonitoringEnabled;
- (BOOL)proximityState;
- (NSString)buildVersion;
- (NSString)model;
- (NSString)name;
- (NSString)systemName;
- (NSString)systemVersion;
- (NSUUID)identifierForVendor;
- (UIDevice)init;
- (UIDeviceBatteryState)batteryState;
- (UIDeviceOrientation)orientation;
- (UIUserInterfaceIdiom)userInterfaceIdiom;
- (float)_backlightLevel;
- (float)_softwareDimmingAlpha;
- (float)batteryLevel;
- (id)_deviceInfoForKey:(__CFString *)a3;
- (id)_tapticEngine;
- (int64_t)_feedbackSupportLevel;
- (int64_t)_graphicsQuality;
- (int64_t)_nativeScreenGamut;
- (uint64_t)_peripheralFeedbackSupportLevel;
- (unint64_t)_remoteTouchSurfaceType;
- (void)_enableDeviceOrientationEvents:(BOOL)a3;
- (void)_hardwareKeyboardAvailabilityChanged;
- (void)_loadRemoteDeviceInfoIfNeeded;
- (void)_performShimmedRequestIfPossibleForDeviceOrientation:(int64_t)a3;
- (void)_playInputDeleteSound;
- (void)_playInputSelectSound;
- (void)_playSystemSound:(unsigned int)a3;
- (void)_registerForSystemSounds:(id)a3;
- (void)_setActiveUserInterfaceIdiom:(int64_t)a3;
- (void)_setBacklightLevel:(float)a3;
- (void)_setBatteryLevel:(float)a3;
- (void)_setBatteryState:(int64_t)a3;
- (void)_setExpectsFaceContactInLandscape:(BOOL)a3;
- (void)_setHasTouchPad:(BOOL)a3;
- (void)_setProximityState:(BOOL)a3;
- (void)_unregisterForSystemSounds:(id)a3;
- (void)_updateSystemSoundActiveStatus:(id)a3;
- (void)beginGeneratingDeviceOrientationNotifications;
- (void)dealloc;
- (void)endGeneratingDeviceOrientationNotifications;
- (void)playInputClick;
- (void)setBatteryMonitoringEnabled:(BOOL)batteryMonitoringEnabled;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setProximityMonitoringEnabled:(BOOL)proximityMonitoringEnabled;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation UIDevice

+ (BOOL)_isWatchCompanion
{
  if (qword_1EB260EF8 != -1) {
    dispatch_once(&qword_1EB260EF8, &__block_literal_global_43_2);
  }
  return byte_1EB260ED3;
}

+ (BOOL)_isWatch
{
  if (qword_1EB260EF0 != -1) {
    dispatch_once(&qword_1EB260EF0, &__block_literal_global_289);
  }
  return byte_1EB260ED2;
}

+ (UIDevice)currentDevice
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__UIDevice_currentDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB260F10 != -1) {
    dispatch_once(&qword_1EB260F10, block);
  }
  v2 = (void *)qword_1EB260F18;
  return (UIDevice *)v2;
}

- (UIUserInterfaceIdiom)userInterfaceIdiom
{
  if (initializeActiveUserInterfaceIdiom_once != -1) {
    dispatch_once(&initializeActiveUserInterfaceIdiom_once, &__block_literal_global_515_1);
  }
  return sActiveUserInterfaceIdiom;
}

+ (BOOL)_hasHomeButton
{
  if (qword_1EB260FD0 != -1) {
    dispatch_once(&qword_1EB260FD0, &__block_literal_global_356);
  }
  return byte_1EB260ED7;
}

- (BOOL)_supportsPencil
{
  v2 = (void *)MGCopyAnswer();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (int64_t)_feedbackSupportLevel
{
  if (qword_1EB25D7E8 != -1) {
    dispatch_once(&qword_1EB25D7E8, &__block_literal_global_234_0);
  }
  return qword_1EB25D7F0;
}

- (BOOL)_supportsForceTouch
{
  if (qword_1EB260FB8 != -1) {
    dispatch_once(&qword_1EB260FB8, &__block_literal_global_320);
  }
  return byte_1EB260ED4;
}

- (void)beginGeneratingDeviceOrientationNotifications
{
  int64_t numDeviceOrientationObservers = self->_numDeviceOrientationObservers;
  self->_int64_t numDeviceOrientationObservers = numDeviceOrientationObservers + 1;
  if (!numDeviceOrientationObservers)
  {
    [(UIDevice *)self _enableDeviceOrientationEvents:1];
    +[UIDevice currentDeviceOrientationAllowingAmbiguous:0];
  }
}

+ (int64_t)currentDeviceOrientationAllowingAmbiguous:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[UIDevice currentDevice];
  BOOL v5 = [v4 userInterfaceIdiom] != 6;

  v6 = [(id)UIApp _mainScene];
  v7 = [v6 settings];

  if (!v7
    || ![v7 isUISubclass]
    || (uint64_t v8 = [v7 deviceOrientation]) == 0 && !v3)
  {
    if (v3)
    {
      v9 = &_MergedGlobals_1097;
      v10 = &dword_1EB260EDC;
      if (!_MergedGlobals_1097)
      {
        v10 = &dword_1EB260EDC;
        v11 = "com.apple.backboardd.orientation";
        goto LABEL_10;
      }
    }
    else
    {
      v9 = &byte_1EB260ED1;
      v10 = &dword_1EB260EE0;
      if (!byte_1EB260ED1)
      {
        v10 = &dword_1EB260EE0;
        v11 = "com.apple.backboardd.unambiguousOrientation";
LABEL_10:
        BOOL v12 = notify_register_check(v11, v10) == 0;
        char *v9 = v12;
        if (!v12)
        {
          uint64_t v8 = v5;
          goto LABEL_12;
        }
      }
    }
    int v13 = *v10;
    uint64_t state64 = 0;
    notify_get_state(v13, &state64);
    uint64_t v8 = state64;
  }
LABEL_12:

  return v8;
}

- (void)_enableDeviceOrientationEvents:(BOOL)a3
{
  if (([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    v4 = [(id)UIApp _mainScene];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__UIDevice_Private___enableDeviceOrientationEvents___block_invoke;
    v5[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    BOOL v6 = a3;
    [v4 updateUIClientSettingsWithBlock:v5];
  }
}

- (BOOL)isGeneratingDeviceOrientationNotifications
{
  return self->_numDeviceOrientationObservers > 0;
}

- (void)endGeneratingDeviceOrientationNotifications
{
  int64_t numDeviceOrientationObservers = self->_numDeviceOrientationObservers;
  BOOL v3 = numDeviceOrientationObservers == 1;
  BOOL v4 = numDeviceOrientationObservers < 1;
  int64_t v5 = numDeviceOrientationObservers - 1;
  if (!v4)
  {
    self->_int64_t numDeviceOrientationObservers = v5;
    if (v3)
    {
      [(UIDevice *)self _enableDeviceOrientationEvents:0];
      *(_WORD *)&self->_deviceFlags &= 0xFFC7u;
    }
  }
}

- (void)_setProximityState:(BOOL)a3
{
  __int16 deviceFlags = (__int16)self->_deviceFlags;
  if (((((deviceFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v5 = 256;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->___int16 deviceFlags = deviceFlags & 0xFEFF | v5;
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"UIDeviceProximityStateDidChangeNotification" object:self userInfo:0];
  }
}

- (BOOL)_isHardwareKeyboardAvailable
{
  return (*(_WORD *)&self->_deviceFlags >> 11) & 1;
}

- (UIDeviceBatteryState)batteryState
{
  return (unint64_t)(*(_WORD *)&self->_deviceFlags >> 6);
}

void __20__UIDevice__isWatch__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  int v1 = [v0 intValue];
  if (v0) {
    CFRelease(v0);
  }
  if (v1 == 6)
  {
    byte_1EB260ED2 = 1;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
    v2 = [v4 infoDictionary];
    BOOL v3 = [v2 objectForKey:@"WKWatchKitApp"];
    byte_1EB260ED2 = [v3 BOOLValue];
  }
}

uint64_t __52__UIDevice_Private___enableDeviceOrientationEvents___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeviceOrientationEventsEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_unregisterForSystemSounds:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    CFArrayRef v4 = (const __CFArray *)qword_1EB260F20;
    if (qword_1EB260F20)
    {
      value = v3;
      v8.length = CFArrayGetCount((CFArrayRef)qword_1EB260F20);
      v8.location = 0;
      CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v8, value);
      id v3 = value;
      if (FirstIndexOfValue != -1)
      {
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_1EB260F20, FirstIndexOfValue);
        UpdateSystemSoundActiveStatus();
        id v3 = value;
      }
    }
  }
}

uint64_t __48__UIDevice_UIDevicePrivate___supportsForceTouch__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB260ED4 = result;
  return result;
}

- (int64_t)_graphicsQuality
{
  return 100;
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_numDeviceOrientationObservers >= 1)
  {
    int v4 = a3;
    if ((((unint64_t)*(_WORD *)&self->_deviceFlags >> 3) & 7) != a3)
    {
      BOOL v6 = a4;
      if (qword_1EB260FF8 != -1) {
        dispatch_once(&qword_1EB260FF8, &__block_literal_global_452_0);
      }
      v7 = qword_1EB260FF0;
      if (os_log_type_enabled((os_log_t)qword_1EB260FF0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67240192;
        int v13 = v4;
        _os_log_debug_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEBUG, "Setting device orientation to %{public}d and sending notification.", buf, 8u);
      }
      *(_WORD *)&self->___int16 deviceFlags = *(_WORD *)&self->_deviceFlags & 0xFFC7 | (8 * (v4 & 7));
      id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v9 = [NSNumber numberWithBool:v6];
      v10 = objc_msgSend(v8, "initWithObjectsAndKeys:", v9, @"UIDeviceOrientationRotateAnimatedUserInfoKey", 0);

      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 postNotificationName:@"UIDeviceOrientationDidChangeNotification" object:self userInfo:v10];
    }
  }
}

void __44__UIDevice_UIDeviceInternal___hasHomeButton__block_invoke()
{
  id v3 = +[_UIDeviceInitialDeviceConfigurationLoader sharedLoader];
  v0 = [v3 initialDeviceContext];
  int v1 = v0;
  if (!v0 || (uint64_t v2 = [v0 deviceInfoIntegerValueForKey:*MEMORY[0x1E4FB34E8]], v2 == -1)) {
    uint64_t v2 = (int)MGGetSInt32Answer();
  }
  byte_1EB260ED7 = v2 != 2;
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ForceHasNoHomeButton, @"ForceHasNoHomeButton") & 1) == 0&& byte_1EB25758C)
  {
    byte_1EB260ED7 = 0;
  }
}

- (UIDeviceOrientation)orientation
{
  if (self->_numDeviceOrientationObservers < 1) {
    return 0;
  }
  else {
    return ((unint64_t)*(_WORD *)&self->_deviceFlags >> 3) & 7;
  }
}

- (BOOL)_supportsDeepColor
{
  if (qword_1EB260FC0 != -1) {
    dispatch_once(&qword_1EB260FC0, &__block_literal_global_325_0);
  }
  return byte_1EB260ED5;
}

- (NSString)model
{
  uint64_t v2 = [(UIDevice *)self _deviceInfoForKey:@"DeviceName"];
  if ([(__CFString *)v2 isEqualToString:@"iPod"])
  {

    uint64_t v2 = @"iPod touch";
  }
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = @"Unknown";
  }
  int v4 = v3;

  return v4;
}

- (NSString)systemName
{
  if (!dyld_program_sdk_at_least()
    || ([(UIDevice *)self _deviceInfoForKey:@"j9Th5smJpdztHwc+i39zIg"],
        id v3 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        (int v4 = v3) == 0))
  {
    id v3 = [(UIDevice *)self _deviceInfoForKey:@"ProductName"];
    int v4 = v3;
    if (!v3) {
      id v3 = @"Unknown";
    }
  }
  __int16 v5 = v3;

  return (NSString *)v5;
}

- (NSString)buildVersion
{
  uint64_t v2 = [(UIDevice *)self _deviceInfoForKey:@"BuildVersion"];
  id v3 = v2;
  if (!v2) {
    uint64_t v2 = @"Unknown";
  }
  int v4 = v2;

  return v4;
}

- (NSString)systemVersion
{
  uint64_t v2 = [(UIDevice *)self _deviceInfoForKey:@"ProductVersion"];
  id v3 = v2;
  if (!v2) {
    uint64_t v2 = @"Unknown";
  }
  int v4 = v2;

  return v4;
}

- (id)_deviceInfoForKey:(__CFString *)a3
{
  id v3 = (void *)MGCopyAnswer();
  return v3;
}

void __25__UIDevice_currentDevice__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_1EB260F18;
  qword_1EB260F18 = (uint64_t)v1;
}

- (UIDevice)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIDevice;
  uint64_t v2 = [(UIDevice *)&v6 init];
  if (v2)
  {
    *(_WORD *)&v2->___int16 deviceFlags = *(_WORD *)&v2->_deviceFlags & 0xF7FF | ((GSEventIsHardwareKeyboardAttached() & 1) << 11);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    int v4 = [NSString stringWithUTF8String:*MEMORY[0x1E4F64CE0]];
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HardwareKeyboardAvailabilityChanged, v4, 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

void __29__UIDevice__isWatchCompanion__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 infoDictionary];
  objc_super v6 = [v1 objectForKey:@"NSExtension"];

  uint64_t v2 = v6;
  if (v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v2 = v6;
    if (isKindOfClass)
    {
      int v4 = [v6 objectForKey:@"NSExtensionPointIdentifier"];
      int v5 = [v4 isEqualToString:@"com.apple.watchkit"];

      uint64_t v2 = v6;
      if (v5) {
        byte_1EB260ED3 = 1;
      }
    }
  }
}

- (void)setBatteryMonitoringEnabled:(BOOL)batteryMonitoringEnabled
{
  BOOL v3 = batteryMonitoringEnabled;
  __int16 deviceFlags = (__int16)self->_deviceFlags;
  if ((((deviceFlags & 1) == 0) ^ batteryMonitoringEnabled))
  {
    int v5 = _batteryLog();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        v7 = "Battery monitoring already enabled, doing nothing";
LABEL_17:
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_INFO, v7, buf, 2u);
      }
    }
    else if (v6)
    {
      *(_WORD *)buf = 0;
      v7 = "Battery monitoring already disabled, doing nothing";
      goto LABEL_17;
    }
LABEL_18:

    return;
  }
  *(_WORD *)&self->___int16 deviceFlags = deviceFlags & 0xFFFE | batteryMonitoringEnabled;
  v9 = _batteryLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_INFO, "Battery monitoring enabled", buf, 2u);
    }

    if ([(id)UIApp _isSpringBoard])
    {
      *(_DWORD *)buf = 0;
      v11 = IONotificationPortCreate(*MEMORY[0x1E4F2EEF0]);
      qword_1EB261010 = (uint64_t)v11;
      if (v11)
      {
        CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(v11);
        if (RunLoopSource)
        {
          int v13 = RunLoopSource;
          Current = CFRunLoopGetCurrent();
          CFRunLoopAddSource(Current, v13, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
          v15 = (IONotificationPort *)qword_1EB261010;
          CFDictionaryRef v16 = IOServiceMatching("IOPMPowerSource");
          LODWORD(v15) = IOServiceAddMatchingNotification(v15, "IOServiceFirstMatch", v16, (IOServiceMatchingCallback)_MatchedBatteries, &qword_1EB261010, (io_iterator_t *)buf);
          v17 = _batteryLog();
          v18 = v17;
          if (v15)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v28 = 0;
              _os_log_error_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Failed to register for battery status changes: couldn't add matching notification", v28, 2u);
            }
          }
          else
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v28 = 0;
              _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_INFO, "Registered for battery status changes: added matching notification", v28, 2u);
            }

            _MatchedBatteries((IONotificationPort **)&qword_1EB261010, *(io_iterator_t *)buf);
          }
          IOObjectRelease(*(io_object_t *)buf);
          return;
        }
        IONotificationPortDestroy((IONotificationPortRef)qword_1EB261010);
        qword_1EB261010 = 0;
        int v5 = _batteryLog();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_18;
        }
        *(_WORD *)v28 = 0;
        v25 = "Failed to register for battery status changes: couldn't get run loop source";
      }
      else
      {
        int v5 = _batteryLog();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_18;
        }
        *(_WORD *)v28 = 0;
        v25 = "Failed to register for battery status changes: couldn't create notification port";
      }
      v26 = v28;
    }
    else
    {
      if (dword_1EB260EEC) {
        return;
      }
      if (!notify_register_dispatch("com.apple.system.powersources.timeremaining", &dword_1EB260EEC, MEMORY[0x1E4F14428], &__block_literal_global_496))
      {
        _3rdParty_batteryInformationChanged();
        return;
      }
      int v5 = _batteryLog();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_WORD *)buf = 0;
      v25 = "Could not register for battery change notification";
      v26 = buf;
    }
    _os_log_error_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, v25, v26, 2u);
    goto LABEL_18;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_INFO, "Battery monitoring disabled", buf, 2u);
  }

  if ([(id)UIApp _isSpringBoard])
  {
    v19 = _batteryLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_INFO, "Unregistering for battery status changes", buf, 2u);
    }

    if (dword_1EB260EE8)
    {
      v20 = _batteryLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEBUG, "Unregistering for battery status changes: releasing matching notification", buf, 2u);
      }

      IOObjectRelease(dword_1EB260EE8);
      dword_1EB260EE8 = 0;
    }
    if (qword_1EB261010)
    {
      CFRunLoopSourceRef v21 = IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_1EB261010);
      if (v21)
      {
        v22 = v21;
        v23 = CFRunLoopGetCurrent();
        CFRunLoopRemoveSource(v23, v22, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
        v24 = _batteryLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEBUG, "Unregistering for battery status changes: removed run loop source", buf, 2u);
        }
      }
      else
      {
        v24 = _batteryLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "Unregistering for battery status changes: no run loop source", buf, 2u);
        }
      }

      v27 = _batteryLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1853B0000, v27, OS_LOG_TYPE_DEBUG, "Unregistering for battery status changes: destroying notification port", buf, 2u);
      }

      IONotificationPortDestroy((IONotificationPortRef)qword_1EB261010);
      qword_1EB261010 = 0;
    }
  }
  else if (dword_1EB260EEC)
  {
    notify_cancel(dword_1EB260EEC);
    dword_1EB260EEC = 0;
  }
  *(_WORD *)&self->_deviceFlags &= 0xFF3Fu;
}

- (void)_setBatteryState:(int64_t)a3
{
  __int16 deviceFlags = (__int16)self->_deviceFlags;
  if (deviceFlags >> 6 != a3)
  {
    *(_WORD *)&self->___int16 deviceFlags = deviceFlags & 0xFF3F | ((a3 & 3) << 6);
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"UIDeviceBatteryStateDidChangeNotification" object:self userInfo:0];
  }
}

- (void)_setBatteryLevel:(float)a3
{
  float v3 = fminf(fmaxf(roundf(a3 * 100.0) / 100.0, 0.0), 1.0);
  if (v3 != self->_batteryLevel)
  {
    self->_batteryLevel = v3;
    if ((*(_WORD *)&self->_deviceFlags & 0xC0) != 0)
    {
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"UIDeviceBatteryLevelDidChangeNotification" object:self userInfo:0];
    }
  }
}

uint64_t __47__UIDevice_UIDevicePrivate___supportsDeepColor__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB260ED5 = result;
  return result;
}

uint64_t __59__UIDevice__UIFeedbackEngineSupport___feedbackSupportLevel__block_invoke()
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)qword_1EB25D828;
  uint64_t v8 = qword_1EB25D828;
  if (!qword_1EB25D828)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getCHHapticEngineClass_block_invoke_1;
    v4[3] = &unk_1E52D9900;
    v4[4] = &v5;
    __getCHHapticEngineClass_block_invoke_1((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  if (![v1 supports1stPartyHaptics]
    || (result = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_DisableLevel2Feedback, @"DisableLevel2Feedback"), uint64_t v3 = 2, (result & 1) == 0)&& byte_1EB2571A4)
  {
    uint64_t result = MGGetBoolAnswer();
    uint64_t v3 = result;
  }
  qword_1EB25D7F0 = v3;
  return result;
}

- (id)_tapticEngine
{
  objc_getAssociatedObject(self, &_UIDeviceTapticEngineAssocitatedObjectKey);
  uint64_t v3 = (_UITapticEngine *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if ([(UIDevice *)self _supportsForceTouch])
    {
      uint64_t v3 = objc_alloc_init(_UITapticEngine);
      objc_setAssociatedObject(self, &_UIDeviceTapticEngineAssocitatedObjectKey, v3, (void *)1);
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (uint64_t)_peripheralFeedbackSupportLevel
{
  if (result)
  {
    if (qword_1EB25D7F8 != -1) {
      dispatch_once(&qword_1EB25D7F8, &__block_literal_global_243);
    }
    return _MergedGlobals_19_2;
  }
  return result;
}

uint64_t __79__UIDevice__UIFeedbackEnginePeripheralSupport___peripheralFeedbackSupportLevel__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _MergedGlobals_19_2 = result;
  return result;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  int v4 = [NSString stringWithUTF8String:*MEMORY[0x1E4F64CE0]];
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);

  v5.receiver = self;
  v5.super_class = (Class)UIDevice;
  [(UIDevice *)&v5 dealloc];
}

- (NSString)name
{
  if (!UISelfTaskHasEntitlement(@"com.apple.developer.device-information.user-assigned-device-name")
    || ([(UIDevice *)self _deviceInfoForKey:@"UserAssignedDeviceName"],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v3 = [(UIDevice *)self model];
  }
  return (NSString *)v3;
}

- (NSUUID)identifierForVendor
{
  uint64_t v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v3 = [v2 deviceIdentifierForVendor];

  return (NSUUID *)v3;
}

- (void)setOrientation:(int64_t)a3
{
  objc_super v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Orientation", &setOrientation____s_category) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Setting UIDevice.orientation is not supported. Please use UIWindowScene.requestGeometryUpdate(_:)", v6, 2u);
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    a3 &= 0xFu;
    [(UIDevice *)self _performShimmedRequestIfPossibleForDeviceOrientation:a3];
  }
  [(UIDevice *)self setOrientation:a3 animated:1];
}

- (BOOL)isBatteryMonitoringEnabled
{
  return *(_WORD *)&self->_deviceFlags & 1;
}

- (float)batteryLevel
{
  if ((*(_WORD *)&self->_deviceFlags & 0xC0) != 0) {
    return self->_batteryLevel;
  }
  else {
    return -1.0;
  }
}

- (BOOL)isProximityMonitoringEnabled
{
  return (*(_WORD *)&self->_deviceFlags >> 1) & 1;
}

- (void)setProximityMonitoringEnabled:(BOOL)proximityMonitoringEnabled
{
  BOOL v3 = proximityMonitoringEnabled;
  if (MGGetBoolAnswer())
  {
    __int16 deviceFlags = (__int16)self->_deviceFlags;
    if (((deviceFlags & 2) == 0) == v3)
    {
      if (v3) {
        __int16 v6 = 2;
      }
      else {
        __int16 v6 = 0;
      }
      *(_WORD *)&self->___int16 deviceFlags = deviceFlags & 0xFFFD | v6;
      [(id)UIApp setProximityEventsEnabled:v3];
      uint64_t v7 = (void *)UIApp;
      uint64_t v8 = (*(_WORD *)&self->_deviceFlags >> 2) & 1;
      [v7 setExpectsFaceContact:v3 inLandscape:v8];
    }
  }
}

- (void)_setExpectsFaceContactInLandscape:(BOOL)a3
{
  BOOL v3 = a3;
  if (MGGetBoolAnswer())
  {
    __int16 deviceFlags = (__int16)self->_deviceFlags;
    if (((deviceFlags & 4) == 0) == v3)
    {
      __int16 v6 = v3 ? 4 : 0;
      *(_WORD *)&self->___int16 deviceFlags = deviceFlags & 0xFFFB | v6;
      if ((deviceFlags & 2) != 0)
      {
        uint64_t v7 = (void *)UIApp;
        [v7 setExpectsFaceContact:1 inLandscape:v3];
      }
    }
  }
}

- (BOOL)proximityState
{
  return HIBYTE(*(_WORD *)&self->_deviceFlags) & 1;
}

- (BOOL)isMultitaskingSupported
{
  return MGGetBoolAnswer();
}

- (void)_setActiveUserInterfaceIdiom:(int64_t)a3
{
  if (initializeActiveUserInterfaceIdiom_once != -1) {
    dispatch_once(&initializeActiveUserInterfaceIdiom_once, &__block_literal_global_515_1);
  }
  sActiveUserInterfaceIdiom = a3;
}

- (void)playInputClick
{
  if (pthread_main_np() == 1)
  {
    v9 = +[UIPeripheralHost sharedInstance];
    int v3 = [v9 keyClicksEnabled];
    int v4 = v9;
    if (v3)
    {
      objc_super v5 = +[UIKeyboardImpl activeInstance];
      __int16 v6 = v5;
      if (!v5 || ([v5 playInputClick] & 1) == 0) {
        [(UIDevice *)self _playSystemSound:1104];
      }

      int v4 = v9;
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    [v7 raise:v8 format:@"Call must be made on main thread"];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__UIDevice_playInputClick__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __26__UIDevice_playInputClick__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) playInputClick];
}

- (void)_setBacklightLevel:(float)a3
{
  int v4 = +[UIScreen mainScreen];
  objc_super v5 = +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__UIDevice__setBacklightLevel___block_invoke;
  v6[3] = &__block_descriptor_36_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  float v7 = a3;
  [v5 _updateUIClientSettingsWithBlock:v6];
}

uint64_t __31__UIDevice__setBacklightLevel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBrightnessLevel:*(float *)(a1 + 32)];
}

- (float)_backlightLevel
{
  MEMORY[0x1F410BDD0](self, a2);
  return result;
}

- (float)_softwareDimmingAlpha
{
  MEMORY[0x1F417CE10](@"SoftwareDimmingAlpha", a2, 0.0);
  return result;
}

+ (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)_KVOContext == a6)
  {
    if (pthread_main_np() == 1)
    {
      [a1 invalidateSystemSoundEnablement];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__UIDevice_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___UIDevice;
    objc_msgSendSuper2(&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __59__UIDevice_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateSystemSoundEnablement];
}

+ (void)invalidateSystemSoundEnablement
{
  __systemSoundEnabled = -1;
  if (qword_1EB260F20 && CFArrayGetCount((CFArrayRef)qword_1EB260F20) >= 1)
  {
    UpdateSystemSoundActiveStatus();
  }
}

- (void)_updateSystemSoundActiveStatus:(id)a3
{
  id v4 = a3;
  if (pthread_main_np())
  {
    UpdateSystemSoundActiveStatus();
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__UIDevice__updateSystemSoundActiveStatus___block_invoke;
    v5[3] = &unk_1E52D9F98;
    void v5[4] = self;
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __43__UIDevice__updateSystemSoundActiveStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSystemSoundActiveStatus:*(void *)(a1 + 40)];
}

- (void)_registerForSystemSounds:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    CFArrayRef v6 = (const __CFArray *)qword_1EB260F20;
    value = v4;
    if (qword_1EB260F20) {
      goto LABEL_4;
    }
    qword_1EB260F20 = (uint64_t)CFArrayCreateMutable(0, 0, 0);
    objc_super v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:self selector:sel__updateSystemSoundActiveStatus_ name:@"UIApplicationSuspendedNotification" object:0];
    [v7 addObserver:self selector:sel__updateSystemSoundActiveStatus_ name:@"UIApplicationSuspendedEventsOnlyNotification" object:0];

    objc_super v5 = value;
    CFArrayRef v6 = (const __CFArray *)qword_1EB260F20;
    if (qword_1EB260F20)
    {
LABEL_4:
      v11.length = CFArrayGetCount(v6);
      v11.location = 0;
      int v8 = CFArrayContainsValue(v6, v11, value);
      objc_super v5 = value;
      if (!v8)
      {
        CFArrayAppendValue((CFMutableArrayRef)qword_1EB260F20, value);
        UpdateSystemSoundActiveStatus();
        objc_super v5 = value;
      }
    }
  }
}

- (void)_playSystemSound:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (IsSystemSoundEnabled())
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2020000000;
    id v4 = (void (*)(uint64_t))getAudioServicesPlaySystemSoundSymbolLoc_ptr;
    CFRange v11 = getAudioServicesPlaySystemSoundSymbolLoc_ptr;
    if (!getAudioServicesPlaySystemSoundSymbolLoc_ptr)
    {
      objc_super v5 = AudioToolboxLibrary_1();
      v9[3] = (uint64_t)dlsym(v5, "AudioServicesPlaySystemSound");
      getAudioServicesPlaySystemSoundSymbolLoc_ptr = (_UNKNOWN *)v9[3];
      id v4 = (void (*)(uint64_t))v9[3];
    }
    _Block_object_dispose(&v8, 8);
    if (v4)
    {
      v4(v3);
    }
    else
    {
      CFArrayRef v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v7 = [NSString stringWithUTF8String:"void __AudioServicesPlaySystemSound(SystemSoundID)"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"UIDevice.m", 92, @"%s", dlerror());

      __break(1u);
    }
  }
}

- (void)_playInputSelectSound
{
}

- (void)_playInputDeleteSound
{
}

- (void)_hardwareKeyboardAvailabilityChanged
{
  int IsHardwareKeyboardAttached = GSEventIsHardwareKeyboardAttached();
  __int16 deviceFlags = (__int16)self->_deviceFlags;
  if ((IsHardwareKeyboardAttached != 0) == ((deviceFlags & 0x800) == 0))
  {
    *(_WORD *)&self->___int16 deviceFlags = deviceFlags & 0xF7FF | ((IsHardwareKeyboardAttached != 0) << 11);
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification" object:0];
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (pthread_main_np() == 1)
  {
    if ([v7 isEqualToString:@"orientation"])
    {
      uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Orientation", &setValue_forKey____s_category) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Setting UIDevice.orientation is not supported. Please use UIWindowScene.requestGeometryUpdate(_:)", buf, 2u);
      }
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        uint64_t v9 = objc_opt_class();
        id v10 = v6;
        if (v9)
        {
          if (objc_opt_isKindOfClass()) {
            CFRange v11 = v10;
          }
          else {
            CFRange v11 = 0;
          }
        }
        else
        {
          CFRange v11 = 0;
        }
        id v12 = v11;

        unsigned int v13 = [v12 unsignedIntValue];
        [(UIDevice *)self _performShimmedRequestIfPossibleForDeviceOrientation:v13];
      }
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)UIDevice;
      [(UIDevice *)&v14 setValue:v6 forKey:v7];
    }
  }
}

- (void)_performShimmedRequestIfPossibleForDeviceOrientation:(int64_t)a3
{
  int IsValid = BSInterfaceOrientationIsValid();
  if (a3 && IsValid)
  {
    id v6 = +[_UISceneLifecycleMultiplexer mostActiveSceneWithTest:&__block_literal_global_169_0];
    if (v6)
    {
      id v5 = objc_alloc_init(UIWindowSceneGeometryPreferencesIOS);
      [(UIWindowSceneGeometryPreferencesIOS *)v5 setInterfaceOrientations:1 << a3];
      [v6 requestGeometryUpdateWithPreferences:v5 errorHandler:0];
    }
  }
}

uint64_t __65__UIDevice__performShimmedRequestIfPossibleForDeviceOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 activationState])
  {
    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (id)modelSpecificLocalizedStringKeyForKey:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MGCopyAnswer();
  id v5 = [v4 uppercaseString];
  id v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

  if ([v6 hasSuffix:@"_SIMULATOR"])
  {
    uint64_t v7 = objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "rangeOfString:", @"_SIMULATOR"));

    id v6 = (void *)v7;
  }
  uint64_t v8 = [NSString stringWithFormat:@"%@_%@", v3, v6];

  return v8;
}

- (BOOL)_hasTouchPad
{
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_DeviceHasTouchPadOverride, @"DeviceHasTouchPadOverride") & 1) == 0&& byte_1EB257584)
  {
    goto LABEL_3;
  }
  $75260331BB9513C2BC2474BE765B5109 deviceFlags = self->_deviceFlags;
  if ((*(_WORD *)&deviceFlags & 0x200) != 0) {
    return (*(unsigned int *)&deviceFlags >> 10) & 1;
  }
  if (qword_1EB260F28 != -1) {
    dispatch_once(&qword_1EB260F28, &__block_literal_global_291);
  }
  if (dword_1EB260EE4)
  {
    uint64_t state64 = 0;
    notify_get_state(dword_1EB260EE4, &state64);
    LOBYTE(v3) = state64 != 0;
  }
  else
  {
LABEL_3:
    LOBYTE(v3) = 1;
  }
  return v3;
}

const char *__41__UIDevice_UIDevicePrivate___hasTouchPad__block_invoke()
{
  float result = (const char *)[ (id) *MEMORY[0x1E4F4F400] UTF8String];
  if (result)
  {
    return (const char *)notify_register_check(result, &dword_1EB260EE4);
  }
  return result;
}

- (void)_setHasTouchPad:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1536;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_$75260331BB9513C2BC2474BE765B5109 deviceFlags = *(_WORD *)&self->_deviceFlags & 0xFBFF | v3;
}

- (void)_loadRemoteDeviceInfoIfNeeded
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__UIDevice_UIDevicePrivate___loadRemoteDeviceInfoIfNeeded__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  if (_loadRemoteDeviceInfoIfNeeded_onceToken != -1) {
    dispatch_once(&_loadRemoteDeviceInfoIfNeeded_onceToken, block);
  }
}

void __58__UIDevice_UIDevicePrivate___loadRemoteDeviceInfoIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __58__UIDevice_UIDevicePrivate___loadRemoteDeviceInfoIfNeeded__block_invoke_2;
    handler[3] = &unk_1E52E5DD8;
    handler[4] = *(void *)(a1 + 32);
    uint32_t v2 = notify_register_dispatch("com.apple.TVPeripheralAgent.RemoteFlagsDidChange", &_loadRemoteDeviceInfoIfNeeded_remoteTypeToken, MEMORY[0x1E4F14428], handler);
    if (v2)
    {
      uint32_t v3 = v2;
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Device", &qword_1EB260F80);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        id v5 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v40) = v3;
          id v6 = "Error creating notification handler for remote type. status=%d";
LABEL_10:
          id v10 = v5;
          os_log_type_t v11 = OS_LOG_TYPE_ERROR;
          uint32_t v12 = 8;
LABEL_55:
          _os_log_impl(&dword_1853B0000, v10, v11, v6, buf, v12);
          return;
        }
      }
      return;
    }
    uint64_t state64 = 0;
    if (notify_get_state(_loadRemoteDeviceInfoIfNeeded_remoteTypeToken, &state64)) {
      return;
    }
    int v13 = state64;
    objc_super v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Device", &qword_1EB260F58) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = v13;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "Initial remote flags value: %i", buf, 8u);
    }
    uint64_t v15 = v13 & 1;
    if ((v13 & 2) != 0) {
      uint64_t v15 = 2;
    }
    *(void *)(*(void *)(a1 + 32) + 24) = v15;
    CFDictionaryRef v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Device", &qword_1EB260F60) + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 24);
      v18 = @"Unknown";
      if (v17 == 1) {
        v18 = @"Default";
      }
      if (v17 == 2) {
        v19 = @"Rotary";
      }
      else {
        v19 = v18;
      }
      v20 = v19;
      *(_DWORD *)buf = 138543362;
      v40 = v20;
      CFRunLoopSourceRef v21 = v16;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "Remote touch surface type has been initialized to: %{public}@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = (v13 & 8) != 0;
    v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("Device", &qword_1EB260F68) + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 32)) {
        v23 = @"YES";
      }
      else {
        v23 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v40 = v23;
      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_DEFAULT, "Remote microphone capability has been initialized to: %@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 33) = (v13 & 4) != 0;
    v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("Device", &qword_1EB260F70) + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 33)) {
        v25 = @"YES";
      }
      else {
        v25 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v40 = v25;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEFAULT, "Remote mute capability has been initialized to: %@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 34) = (v13 & 0x10) != 0;
    v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("Device", &qword_1EB260F78) + 8);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    if (*(unsigned char *)(*(void *)(a1 + 32) + 34)) {
      v27 = @"YES";
    }
    else {
      v27 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v40 = v27;
    id v6 = "Remote PushToTalk capability has been initialized to: %@";
LABEL_54:
    id v10 = v26;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 12;
    goto LABEL_55;
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __58__UIDevice_UIDevicePrivate___loadRemoteDeviceInfoIfNeeded__block_invoke_313;
  v36[3] = &unk_1E52E5DD8;
  v36[4] = *(void *)(a1 + 32);
  uint32_t v7 = notify_register_dispatch("com.apple.TVPeripheralAgent.RemoteTypeDidChange", &_loadRemoteDeviceInfoIfNeeded_remoteTypeToken, MEMORY[0x1E4F14428], v36);
  if (!v7)
  {
    uint64_t state64 = 0;
    if (notify_get_state(_loadRemoteDeviceInfoIfNeeded_remoteTypeToken, &state64)) {
      return;
    }
    if (state64 - 1 > 4) {
      uint64_t v28 = 0;
    }
    else {
      uint64_t v28 = qword_186B97BC8[state64 - 1];
    }
    *(void *)(*(void *)(a1 + 32) + 24) = v28;
    v29 = *(NSObject **)(__UILogGetCategoryCachedImpl("Device", &qword_1EB260FA0) + 8);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 24);
      v31 = @"Unknown";
      if (v30 == 1) {
        v31 = @"Default";
      }
      if (v30 == 2) {
        v32 = @"Rotary";
      }
      else {
        v32 = v31;
      }
      v33 = v32;
      *(_DWORD *)buf = 138543362;
      v40 = v33;
      v34 = v29;
      _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_DEFAULT, "Remote touch surface type has been initialized to: %{public}@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = state64 - 1 < 5;
    v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("Device", &qword_1EB260FA8) + 8);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    if (*(unsigned char *)(*(void *)(a1 + 32) + 32)) {
      v35 = @"YES";
    }
    else {
      v35 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v40 = v35;
    id v6 = "Remote microphone capability has been initialized to: %@";
    goto LABEL_54;
  }
  uint32_t v8 = v7;
  unint64_t v9 = __UILogGetCategoryCachedImpl("Device", &qword_1EB260FB0);
  if (*(unsigned char *)v9)
  {
    id v5 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = v8;
      id v6 = "Error creating notification handler for remote type. status=%d";
      goto LABEL_10;
    }
  }
}

void __58__UIDevice_UIDevicePrivate___loadRemoteDeviceInfoIfNeeded__block_invoke_2(uint64_t a1, int token)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(token, &state64);
  if (state)
  {
    uint32_t v4 = state;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Device", &qword_1EB260F30);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      id v6 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = v4;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Unable to get remote capabilities. status=%d", buf, 8u);
      }
    }
  }
  else
  {
    uint64_t v7 = state64;
    uint64_t v8 = 2;
    if ((state64 & 2) == 0) {
      uint64_t v8 = state64 & 1;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v8 != *(void *)(v9 + 24))
    {
      *(void *)(v9 + 24) = v8;
      id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Device", &qword_1EB260F38) + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 24);
        uint32_t v12 = @"Unknown";
        if (v11 == 1) {
          uint32_t v12 = @"Default";
        }
        if (v11 == 2) {
          int v13 = @"Rotary";
        }
        else {
          int v13 = v12;
        }
        objc_super v14 = v13;
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v14;
        uint64_t v15 = v10;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "Remote touch surface type has changed. Posting _UIDeviceRemoteTouchSurfaceTypeDidChangeNotification. remoteTouchSurfaceType=%{public}@", buf, 0xCu);
      }
      CFDictionaryRef v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 postNotificationName:@"_UIDeviceRemoteTouchSurfaceTypeDidChangeNotification" object:0];

      uint64_t v9 = *(void *)(a1 + 32);
    }
    if (((v7 >> 3) & 1) != *(unsigned char *)(v9 + 32))
    {
      *(unsigned char *)(v9 + 32) = (v7 & 8) != 0;
      uint64_t v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Device", &qword_1EB260F40) + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(*(void *)(a1 + 32) + 32)) {
          v18 = @"YES";
        }
        else {
          v18 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v18;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEFAULT, "Remote microphone capability has changed. Posting _UIDeviceRemoteHasMicrophoneDidChangeNotification. remoteHasMicrophone=%@", buf, 0xCu);
      }
      v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v19 postNotificationName:@"_UIDeviceRemoteHasMicrophoneDidChangeNotification" object:0];

      uint64_t v9 = *(void *)(a1 + 32);
    }
    if (((v7 >> 2) & 1) != *(unsigned char *)(v9 + 33))
    {
      *(unsigned char *)(v9 + 33) = (v7 & 4) != 0;
      v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Device", &qword_1EB260F48) + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(*(void *)(a1 + 32) + 33)) {
          CFRunLoopSourceRef v21 = @"YES";
        }
        else {
          CFRunLoopSourceRef v21 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v21;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "Remote mute capability has changed. Posting _UIDeviceRemoteHasMuteDidChangeNotification. remoteHasMute=%@", buf, 0xCu);
      }
      v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v22 postNotificationName:@"_UIDeviceRemoteHasMuteDidChangeNotification" object:0];

      uint64_t v9 = *(void *)(a1 + 32);
    }
    if (((v7 >> 4) & 1) != *(unsigned char *)(v9 + 34))
    {
      *(unsigned char *)(v9 + 34) = (v7 & 0x10) != 0;
      v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Device", &qword_1EB260F50) + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(*(void *)(a1 + 32) + 34)) {
          v24 = @"YES";
        }
        else {
          v24 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v24;
        _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEFAULT, "Remote PushToTalk capability has changed. Posting _UIDeviceRemoteSupportsPushToTalkDidChangeNotification. remoteSupportsPushToTalk=%@", buf, 0xCu);
      }
      v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v25 postNotificationName:@"_UIDeviceRemoteHasPushToTalkDidChangeNotification" object:0];
    }
  }
}

void __58__UIDevice_UIDevicePrivate___loadRemoteDeviceInfoIfNeeded__block_invoke_313(uint64_t a1, int token)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(token, &state64);
  if (state)
  {
    uint32_t v4 = state;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Device", &qword_1EB260F88);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      id v6 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v4;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Unable to get remote type. status=%d", buf, 8u);
      }
    }
  }
  else
  {
    uint64_t v7 = state64;
    if (state64 - 1 > 4) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = qword_186B97BC8[state64 - 1];
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v8 != *(void *)(v9 + 24))
    {
      *(void *)(v9 + 24) = v8;
      id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Device", &qword_1EB260F90) + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 24);
        uint32_t v12 = @"Unknown";
        if (v11 == 1) {
          uint32_t v12 = @"Default";
        }
        if (v11 == 2) {
          int v13 = @"Rotary";
        }
        else {
          int v13 = v12;
        }
        objc_super v14 = v13;
        *(_DWORD *)buf = 138543362;
        v23 = v14;
        uint64_t v15 = v10;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "Remote touch surface type has changed. Posting _UIDeviceRemoteTouchSurfaceTypeDidChangeNotification. remoteTouchSurfaceType=%{public}@", buf, 0xCu);
      }
      CFDictionaryRef v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 postNotificationName:@"_UIDeviceRemoteTouchSurfaceTypeDidChangeNotification" object:0];

      uint64_t v7 = state64;
      uint64_t v9 = *(void *)(a1 + 32);
    }
    int v17 = v7 - 1 < 5;
    if (*(unsigned __int8 *)(v9 + 32) != v17)
    {
      *(unsigned char *)(v9 + 32) = v17;
      v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Device", &qword_1EB260F98) + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(*(void *)(a1 + 32) + 32)) {
          v19 = @"YES";
        }
        else {
          v19 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v23 = v19;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEFAULT, "Remote microphone capability has changed. Posting _UIDeviceRemoteHasMicrophoneDidChangeNotification. remoteHasMicrophone=%@", buf, 0xCu);
      }
      v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v20 postNotificationName:@"_UIDeviceRemoteHasMicrophoneDidChangeNotification" object:0];
    }
  }
}

- (unint64_t)_remoteTouchSurfaceType
{
  return self->_remoteTouchSurfaceType;
}

- (BOOL)_remoteHasMicrophoneCapability
{
  return self->_remoteHasMicrophone;
}

- (BOOL)_hasGraphicsQualityOverride
{
  return 0;
}

+ (BOOL)_isLowEnd
{
  if (qword_1EB260FC8 != -1) {
    dispatch_once(&qword_1EB260FC8, &__block_literal_global_351_1);
  }
  return byte_1EB260ED6;
}

uint64_t __39__UIDevice_UIDeviceInternal___isLowEnd__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  byte_1EB260ED6 = result;
  return result;
}

- (int64_t)_nativeScreenGamut
{
  if (qword_1EB260FE0 != -1) {
    dispatch_once(&qword_1EB260FE0, &__block_literal_global_361);
  }
  return qword_1EB260FD8;
}

uint64_t __48__UIDevice_UIDeviceInternal___nativeScreenGamut__block_invoke()
{
  uint64_t result = CUIGetDeviceArtworkDisplayGamut();
  qword_1EB260FD8 = result;
  return result;
}

- (BOOL)_supportsPushToTalk
{
  return self->_remoteSupportsPushToTalk;
}

@end