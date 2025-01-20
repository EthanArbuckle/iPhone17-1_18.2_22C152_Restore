@interface SCDAAssistantPreferences
+ (id)sharedPreferences;
+ (id)sharedPreferencesWithInstanceContext:(id)a3;
- (BOOL)disableMyriadBLEActivity;
- (BOOL)ignoreMyriadPlatformBias;
- (BOOL)myriadCoordinationEnabled;
- (BOOL)myriadCoordinationEnabledForAccessoryLogging;
- (BOOL)myriadDuckingEnabled;
- (BOOL)myriadServerHasProvisioned;
- (BOOL)myriadServerProvisioning;
- (BOOL)myriadShouldIgnoreAdjustedBoost;
- (SCDAAssistantPreferences)init;
- (SCDAAssistantPreferences)initWithInstanceContext:(id)a3;
- (double)myriadDeviceDelay;
- (double)myriadDeviceSlowdown;
- (double)myriadDeviceTrumpDelay;
- (double)myriadDeviceVTEndTimeDistanceThreshold;
- (double)myriadMaxNoOperationDelay;
- (double)myriadTestDeviceDelay;
- (float)myriadDeviceAdjust;
- (id)myriadDeviceGroup;
- (id)myriadLastWin;
- (id)myriadMonitorTimeOutInterval;
- (int)myriadConstantGoodness;
- (unsigned)myriadDeviceClass;
- (void)_preferencesDidChangeExternally;
- (void)setIgnoreMyriadAdjustedBoost:(BOOL)a3;
- (void)setIgnoreMyriadPlatformBias:(BOOL)a3;
- (void)setMyriadConstantGoodness:(int)a3;
- (void)setMyriadCoordinationEnabled:(BOOL)a3;
- (void)setMyriadDeviceAdjust:(float)a3;
- (void)setMyriadDeviceClass:(unsigned __int8)a3;
- (void)setMyriadDeviceDelay:(double)a3;
- (void)setMyriadDeviceGroup:(id)a3;
- (void)setMyriadDeviceSlowdown:(double)a3;
- (void)setMyriadDeviceTrumpDelay:(double)a3;
- (void)setMyriadDeviceVTEndTimeDistanceThreshold:(double)a3;
- (void)setMyriadDuckingEnabled:(BOOL)a3;
- (void)setMyriadLastWin;
- (void)setMyriadMaxNoOperationDelay:(double)a3;
- (void)setMyriadServerHasProvisioned:(BOOL)a3;
- (void)setMyriadServerProvisioning:(BOOL)a3;
- (void)setMyriadTestDeviceDelay:(double)a3;
@end

@implementation SCDAAssistantPreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_navTokenQueue, 0);
}

- (void)setMyriadMaxNoOperationDelay:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Myriad Max No Op Delay", @"com.apple.assistant", self->_instanceContext);
}

- (double)myriadMaxNoOperationDelay
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Myriad Max No Op Delay", @"com.apple.assistant", self->_instanceContext);
  double v3 = 0.005;
  if (objc_opt_respondsToSelector())
  {
    [v2 doubleValue];
    if (v4 != 0.0)
    {
      [v2 doubleValue];
      double v3 = v5;
    }
  }

  return v3;
}

- (id)myriadMonitorTimeOutInterval
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Myriad Monitor Timeout Interval", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)setIgnoreMyriadPlatformBias:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Myriad Ignore Platform Bias", @"com.apple.assistant", self->_instanceContext);
}

- (BOOL)ignoreMyriadPlatformBias
{
  if (SCDAIsInternalInstall_onceToken != -1) {
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1260);
  }
  if (!SCDAIsInternalInstall_isInternal) {
    return 0;
  }
  id v3 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Myriad Ignore Platform Bias", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setIgnoreMyriadAdjustedBoost:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Myriad Ignore Adjusted Boost", @"com.apple.assistant", self->_instanceContext);
}

- (BOOL)myriadShouldIgnoreAdjustedBoost
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Myriad Ignore Adjusted Boost", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)setMyriadDeviceVTEndTimeDistanceThreshold:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Myriad VTEndtimeDistanceThreshold", @"com.apple.assistant", self->_instanceContext);
}

- (double)myriadDeviceVTEndTimeDistanceThreshold
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Myriad VTEndtimeDistanceThreshold", @"com.apple.assistant", self->_instanceContext);
  double v3 = 0.5;
  if (objc_opt_respondsToSelector())
  {
    [v2 doubleValue];
    double v3 = v4;
  }

  return v3;
}

- (void)setMyriadLastWin
{
  id v3 = [MEMORY[0x263EFF910] date];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v3, @"Myriad Last Win", @"com.apple.assistant", self->_instanceContext);
}

- (id)myriadLastWin
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Myriad Last Win", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF910] distantPast];
  }
  double v4 = v3;

  return v4;
}

- (void)setMyriadDeviceTrumpDelay:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Myriad Device Trump Delay", @"com.apple.assistant", self->_instanceContext);
}

- (double)myriadDeviceTrumpDelay
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Myriad Device Trump Delay", @"com.apple.assistant", self->_instanceContext);
  id v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.75;
  }

  return v5;
}

- (void)setMyriadDeviceSlowdown:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Myriad Device Slowdown", @"com.apple.assistant", self->_instanceContext);
}

- (double)myriadDeviceSlowdown
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Myriad Device Slowdown", @"com.apple.assistant", self->_instanceContext);
  id v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setMyriadTestDeviceDelay:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Myriad Test Device Delay", @"com.apple.assistant", self->_instanceContext);
}

- (double)myriadTestDeviceDelay
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Myriad Test Device Delay", @"com.apple.assistant", self->_instanceContext);
  if (SCDAIsInternalInstall_onceToken != -1) {
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1260);
  }
  double v3 = 0.0;
  if (SCDAIsInternalInstall_isInternal) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v2 doubleValue];
    double v3 = v5;
  }

  return v3;
}

- (void)setMyriadDeviceDelay:(double)a3
{
  *(float *)&a3 = a3;
  id v4 = [NSNumber numberWithFloat:a3];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Myriad Device Delay", @"com.apple.assistant", self->_instanceContext);
}

- (double)myriadDeviceDelay
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Myriad Device Delay", @"com.apple.assistant", self->_instanceContext);
  double v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setMyriadDeviceAdjust:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Myriad Device Adjust", @"com.apple.assistant", self->_instanceContext);
}

- (float)myriadDeviceAdjust
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Myriad Device Adjust", @"com.apple.assistant", self->_instanceContext);
  double v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    float v5 = v4;
  }
  else
  {
    float v5 = 0.0;
  }

  return v5;
}

- (void)setMyriadConstantGoodness:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Myriad Constant Goodness", @"com.apple.assistant", self->_instanceContext);
}

- (int)myriadConstantGoodness
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Myriad Constant Goodness", @"com.apple.assistant", self->_instanceContext);
  double v3 = v2;
  if (v2) {
    int v4 = [v2 integerValue];
  }
  else {
    int v4 = -1;
  }

  return v4;
}

- (void)setMyriadDeviceClass:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithInt:a3];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Myriad Device Class", @"com.apple.assistant", self->_instanceContext);
}

- (unsigned)myriadDeviceClass
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Myriad Device Class", @"com.apple.assistant", self->_instanceContext);
  double v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 integerValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)setMyriadServerProvisioning:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Server Provisions Myriad", @"com.apple.assistant", self->_instanceContext);
}

- (BOOL)myriadServerProvisioning
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Server Provisions Myriad", @"com.apple.assistant", self->_instanceContext);
  double v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setMyriadServerHasProvisioned:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Server Has Provisioned Myriad", @"com.apple.assistant", self->_instanceContext);
}

- (BOOL)myriadServerHasProvisioned
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Server Has Provisioned Myriad", @"com.apple.assistant", self->_instanceContext);
  double v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setMyriadDeviceGroup:(id)a3
{
}

- (id)myriadDeviceGroup
{
  double v3 = [NSNumber numberWithInt:0];
  char v4 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Myriad Device Group", @"com.apple.assistant", self->_instanceContext);
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;

      double v3 = v5;
    }
  }

  return v3;
}

- (void)setMyriadDuckingEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Allow Myriad Ducking", @"com.apple.assistant", self->_instanceContext);
}

- (BOOL)myriadDuckingEnabled
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Allow Myriad Ducking", @"com.apple.assistant", self->_instanceContext);
  double v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)disableMyriadBLEActivity
{
  if (SCDAIsInternalInstall_onceToken != -1) {
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1260);
  }
  if (!SCDAIsInternalInstall_isInternal) {
    return 0;
  }
  double v3 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Disable Myriad BLE Activity", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setMyriadCoordinationEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, @"Allow Myriad Coordination", @"com.apple.assistant", self->_instanceContext);
}

- (BOOL)myriadCoordinationEnabledForAccessoryLogging
{
  v2 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Allow Myriad Coordination", @"com.apple.assistant", 0);
  char v3 = _SCDAAssistantPreferencesBoolFromValueWithDefault(v2, @"Allow Myriad Coordination", 1);

  return v3;
}

- (BOOL)myriadCoordinationEnabled
{
  if (SCDAIsInternalInstall_onceToken != -1) {
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1260);
  }
  if (!SCDAIsInternalInstall_isInternal) {
    return 1;
  }
  char v3 = _SCDAAssistantPreferencesValueForKeyWithContext(@"Allow Myriad Coordination", @"com.apple.assistant", self->_instanceContext);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)_preferencesDidChangeExternally
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    int v6 = 136315650;
    v7 = "-[SCDAAssistantPreferences _preferencesDidChangeExternally]";
    __int16 v8 = 2048;
    v9 = self;
    __int16 v10 = 2112;
    v11 = instanceContext;
    _os_log_debug_impl(&dword_25C707000, v3, OS_LOG_TYPE_DEBUG, "%s %p %@", (uint8_t *)&v6, 0x20u);
  }
  CFPreferencesAppSynchronize(@"com.apple.assistant.support");
  CFPreferencesAppSynchronize(@"com.apple.assistant.backedup");
  CFPreferencesAppSynchronize(@"com.apple.assistant");
  char v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"SCDAPreferencesDidChangeNotification" object:self];
}

- (SCDAAssistantPreferences)init
{
  return [(SCDAAssistantPreferences *)self initWithInstanceContext:0];
}

- (SCDAAssistantPreferences)initWithInstanceContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCDAAssistantPreferences;
  id v5 = [(SCDAAssistantPreferences *)&v15 init];
  if (v5)
  {
    if (SCDALogInitIfNeeded_once != -1) {
      dispatch_once(&SCDALogInitIfNeeded_once, &__block_literal_global_511);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_SCDAAssistantPreferencesDidChangeCallback, @"kSCDAPreferencesDidChangeDarwinNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("navTokenQueue", v7);
    navTokenQueue = v5->_navTokenQueue;
    v5->_navTokenQueue = (OS_dispatch_queue *)v8;

    if (v4)
    {
      __int16 v10 = (AFInstanceContext *)v4;
    }
    else
    {
      __int16 v10 = [MEMORY[0x263F28528] defaultContext];
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v10;

    uint64_t v12 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      v14 = v5->_instanceContext;
      *(_DWORD *)buf = 136315650;
      v17 = "-[SCDAAssistantPreferences initWithInstanceContext:]";
      __int16 v18 = 2048;
      v19 = v5;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_debug_impl(&dword_25C707000, v12, OS_LOG_TYPE_DEBUG, "%s %p %@", buf, 0x20u);
    }
  }

  return v5;
}

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1) {
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_746);
  }
  v2 = (void *)sharedPreferences_sSharedPreferences;
  return v2;
}

void __45__SCDAAssistantPreferences_sharedPreferences__block_invoke()
{
  id v2 = [MEMORY[0x263F28528] currentContext];
  uint64_t v0 = +[SCDAAssistantPreferences sharedPreferencesWithInstanceContext:v2];
  v1 = (void *)sharedPreferences_sSharedPreferences;
  sharedPreferences_sSharedPreferences = v0;
}

+ (id)sharedPreferencesWithInstanceContext:(id)a3
{
  id v3 = a3;
  id v4 = [[SCDAAssistantPreferences alloc] initWithInstanceContext:v3];

  return v4;
}

@end