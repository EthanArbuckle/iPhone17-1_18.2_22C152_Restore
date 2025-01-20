@interface TUUserConfiguration
+ (id)registeredDefaults;
+ (id)userDefaults;
- (BOOL)isBrandedCallingEnabled:(id)a3;
- (BOOL)isBusinessConnectCallingEnabled;
- (BOOL)isCallScreeningEnabled;
- (BOOL)isSilenceJunkCallingEnabled;
- (BOOL)isSilenceUnknownCallersEnabledForFaceTime;
- (BOOL)isSilenceUnknownCallersEnabledForPhone;
- (CoreTelephonyClient)coreTelephonyClient;
- (TUUserConfiguration)init;
- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBrandedCallingEnabled:(BOOL)a3 subscription:(id)a4;
- (void)setBusinessConnectCallingEnabled:(BOOL)a3;
- (void)setCallScreeningEnabled:(BOOL)a3;
- (void)setSilenceJunkCallingEnabled:(BOOL)a3;
- (void)setSilenceUnknownCallersEnabledForFaceTime:(BOOL)a3;
- (void)setSilenceUnknownCallersEnabledForPhone:(BOOL)a3;
- (void)setValueInUserDefaults:(id)a3 forKey:(id)a4;
- (void)synchronize;
@end

@implementation TUUserConfiguration

+ (id)registeredDefaults
{
  if (registeredDefaults_onceToken != -1) {
    dispatch_once(&registeredDefaults_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)registeredDefaults_sRegisteredDefaults;

  return v2;
}

void __41__TUUserConfiguration_registeredDefaults__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"announceCalls";
  v2[1] = @"simulateFatalPersistentStoreError";
  v3[0] = &unk_1EED24258;
  v3[1] = MEMORY[0x1E4F1CC28];
  v2[2] = @"simulateInternationalCall";
  v3[2] = MEMORY[0x1E4F1CC28];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)registeredDefaults_sRegisteredDefaults;
  registeredDefaults_sRegisteredDefaults = v0;
}

+ (id)userDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__TUUserConfiguration_userDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userDefaults_onceToken != -1) {
    dispatch_once(&userDefaults_onceToken, block);
  }
  v2 = (void *)userDefaults_sUserDefaults;

  return v2;
}

void __35__TUUserConfiguration_userDefaults__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  int v4 = [v3 isEqualToString:@"com.apple.TelephonyUtilities"];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.TelephonyUtilities"];
  }
  v6 = (void *)userDefaults_sUserDefaults;
  userDefaults_sUserDefaults = v5;

  v7 = (void *)userDefaults_sUserDefaults;
  id v8 = [*(id *)(a1 + 32) registeredDefaults];
  [v7 registerDefaults:v8];
}

- (TUUserConfiguration)init
{
  v3 = [(id)objc_opt_class() userDefaults];
  v10.receiver = self;
  v10.super_class = (Class)TUUserConfiguration;
  int v4 = [(TUConfiguration *)&v10 initWithDataSource:v3];
  if (v4)
  {
    [v3 addObserver:v4 forKeyPath:@"announceCalls" options:0 context:&TUUserConfigurationKeyValueObserverContext];
    [v3 addObserver:v4 forKeyPath:@"conversationLinkBaseURL" options:0 context:&TUUserConfigurationKeyValueObserverContext];
    [v3 addObserver:v4 forKeyPath:@"simulateFatalPersistentStoreError" options:0 context:&TUUserConfigurationKeyValueObserverContext];
    [v3 addObserver:v4 forKeyPath:@"simulateInternationalCall" options:0 context:&TUUserConfigurationKeyValueObserverContext];
    uint64_t v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create("TUConfigurationProviderQueue", v5);
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v6];
    coreTelephonyClient = v4->_coreTelephonyClient;
    v4->_coreTelephonyClient = (CoreTelephonyClient *)v7;
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(TUConfiguration *)self dataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 removeObserver:self forKeyPath:@"announceCalls" context:&TUUserConfigurationKeyValueObserverContext];
    [v3 removeObserver:self forKeyPath:@"conversationLinkBaseURL" context:&TUUserConfigurationKeyValueObserverContext];
    [v3 removeObserver:self forKeyPath:@"simulateFatalPersistentStoreError" context:&TUUserConfigurationKeyValueObserverContext];
    [v3 removeObserver:self forKeyPath:@"simulateInternationalCall" context:&TUUserConfigurationKeyValueObserverContext];
  }

  v4.receiver = self;
  v4.super_class = (Class)TUUserConfiguration;
  [(TUUserConfiguration *)&v4 dealloc];
}

- (void)synchronize
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"announceCalls"];
  v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = @"com.apple.TelephonyUtilities";
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Synchronizing user configuration for %@ to Apple Watch", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  objc_super v4 = (void *)getNPSManagerClass_softClass;
  uint64_t v10 = getNPSManagerClass_softClass;
  if (!getNPSManagerClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v12 = __getNPSManagerClass_block_invoke;
    v13 = &unk_1E58E5F90;
    v14 = &v7;
    __getNPSManagerClass_block_invoke((uint64_t)&buf);
    objc_super v4 = (void *)v8[3];
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v7, 8);
  id v6 = objc_alloc_init(v5);
  objc_msgSend(v6, "synchronizeUserDefaultsDomain:keys:", @"com.apple.TelephonyUtilities", v2, v7);
}

- (id)getBooleanFromUserDefaults:(id)a3 default:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUConfiguration *)self dataSource];
  uint64_t v9 = [v8 objectForKey:v7];

  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v6;
  }
  id v11 = v10;

  return v11;
}

- (void)setValueInUserDefaults:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUConfiguration *)self dataSource];
  [v8 setObject:v7 forKey:v6];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = TUDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Received a key-value observing notification for key path (%@) object (%@).", buf, 0x16u);
  }

  if (a6 == &TUUserConfigurationKeyValueObserverContext)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (([v9 isEqualToString:@"announceCalls"] & 1) != 0
       || ([v9 isEqualToString:@"conversationLinkBaseURL"] & 1) != 0
       || ([v9 isEqualToString:@"simulateFatalPersistentStoreError"] & 1) != 0
       || [v9 isEqualToString:@"simulateInternationalCall"]))
    {
      v12 = [(TUConfiguration *)self delegateController];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __70__TUUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v13[3] = &unk_1E58E7590;
      v13[4] = self;
      [v12 enumerateDelegatesUsingBlock:v13];
    }
  }
}

void __70__TUUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 conformsToProtocol:&unk_1EED61A88])
  {
    id v7 = v5;
    if (objc_opt_respondsToSelector())
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __70__TUUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v10[3] = &unk_1E58E5C08;
      id v8 = v7;
      uint64_t v9 = *(void *)(a1 + 32);
      id v11 = v8;
      uint64_t v12 = v9;
      dispatch_async(v6, v10);
    }
  }
}

uint64_t __70__TUUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) propertiesDidChangeForConfiguration:*(void *)(a1 + 40)];
}

- (BOOL)isCallScreeningEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = (id)objc_opt_class();
    id v4 = v9;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "%@ isCallScreeningEnabled called", (uint8_t *)&v8, 0xCu);
  }
  id v5 = [(TUUserConfiguration *)self getBooleanFromUserDefaults:@"CallScreeningDisabled" default:&unk_1EED24270];
  char v6 = [v5 BOOLValue];

  return v6 ^ 1;
}

- (void)setCallScreeningEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 1024;
    BOOL v11 = v3;
    id v6 = v9;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "%@ setCallScreeningEnabled called %d", (uint8_t *)&v8, 0x12u);
  }
  id v7 = [NSNumber numberWithInt:!v3];
  [(TUUserConfiguration *)self setValueInUserDefaults:v7 forKey:@"CallScreeningDisabled"];

  [(TUUserConfiguration *)self synchronize];
}

- (BOOL)isSilenceUnknownCallersEnabledForFaceTime
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = (id)objc_opt_class();
    id v4 = v10;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "%@ isSilenceUnknownCallersEnabledForFaceTime called", (uint8_t *)&v9, 0xCu);
  }
  id v5 = [NSNumber numberWithBool:TUSilenceUnknownFaceTimeCallersDefaultValue()];
  id v6 = [(TUUserConfiguration *)self getBooleanFromUserDefaults:@"silenceUnknownFaceTimeCallers" default:v5];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (BOOL)isSilenceUnknownCallersEnabledForPhone
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = (id)objc_opt_class();
    id v4 = v9;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "%@ isSilenceUnknownCallersEnabledForPhone called", (uint8_t *)&v8, 0xCu);
  }
  id v5 = [(TUUserConfiguration *)self getBooleanFromUserDefaults:@"allowContactsOnly" default:&unk_1EED24270];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setSilenceUnknownCallersEnabledForFaceTime:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = (id)objc_opt_class();
    id v6 = v9;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "%@ setSilenceUnknownCallersEnabledForFaceTime called", (uint8_t *)&v8, 0xCu);
  }
  char v7 = [NSNumber numberWithBool:v3];
  [(TUUserConfiguration *)self setValueInUserDefaults:v7 forKey:@"silenceUnknownFaceTimeCallers"];
}

- (void)setSilenceUnknownCallersEnabledForPhone:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = (id)objc_opt_class();
    id v6 = v9;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "%@ setSilenceUnknownCallersEnabledForPhone called", (uint8_t *)&v8, 0xCu);
  }
  char v7 = [NSNumber numberWithBool:v3];
  [(TUUserConfiguration *)self setValueInUserDefaults:v7 forKey:@"allowContactsOnly"];
}

- (BOOL)isBrandedCallingEnabled:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v15 = 0;
  coreTelephonyClient = self->_coreTelephonyClient;
  uint64_t v6 = *MEMORY[0x1E4F23B70];
  id v14 = 0;
  char v7 = [(CoreTelephonyClient *)coreTelephonyClient context:v4 getCapability:v6 status:&v15 with:&v14];
  id v8 = v14;
  id v9 = TUDefaultLog();
  uint64_t v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[TUUserConfiguration isBrandedCallingEnabled:]((uint64_t)v4, v10);
    }

    BOOL v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = @"On";
      if (!v15) {
        uint64_t v12 = @"Off";
      }
      *(_DWORD *)long long buf = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Fetched state of branded calling for context: %@, state: %@", buf, 0x16u);
    }

    BOOL v11 = v15 != 0;
  }

  return v11;
}

- (void)setBrandedCallingEnabled:(BOOL)a3 subscription:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v7 = [(CoreTelephonyClient *)self->_coreTelephonyClient context:v6 setCapability:*MEMORY[0x1E4F23B70] enabled:v4 with:0];
  id v8 = TUDefaultLog();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[TUUserConfiguration setBrandedCallingEnabled:subscription:]((uint64_t)v6, v9);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = @"Off";
    if (v4) {
      uint64_t v10 = @"On";
    }
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Set state of branded calling for context: %@, state: %@", (uint8_t *)&v11, 0x16u);
  }
}

- (BOOL)isSilenceJunkCallingEnabled
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v10 = 138412290;
    *(void *)&void v10[4] = objc_opt_class();
    id v4 = *(id *)&v10[4];
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "%@ getSilenceJunkCallingEnabled called", v10, 0xCu);
  }
  uint64_t v5 = +[TUCall acceptableJunkConfidence];
  id v6 = [(TUConfiguration *)self dataSource];
  char v7 = [v6 objectForKey:@"maxJunkLevel"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = [v7 integerValue];
  }
  BOOL v8 = +[TUCall isJunkConfidenceLevelJunk:](TUCall, "isJunkConfidenceLevelJunk:", v5, *(_OWORD *)v10);

  return !v8;
}

- (void)setSilenceJunkCallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v9 = 138412546;
    *(void *)&v9[4] = objc_opt_class();
    *(_WORD *)&v9[12] = 1024;
    *(_DWORD *)&v9[14] = v3;
    id v6 = *(id *)&v9[4];
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "%@ setSilenceJunkCallingEnabled called %d", v9, 0x12u);
  }
  int64_t v7 = +[TUCall maxJunkConfidence];
  if (v3) {
    int64_t v7 = +[TUCall acceptableJunkConfidence];
  }
  BOOL v8 = objc_msgSend(NSNumber, "numberWithInteger:", v7, *(_OWORD *)v9, *(void *)&v9[16], v10);
  [(TUUserConfiguration *)self setValueInUserDefaults:v8 forKey:@"maxJunkLevel"];
}

- (BOOL)isBusinessConnectCallingEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = (id)objc_opt_class();
    id v4 = v9;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "%@ getBusinessConnectCallingEnabled called", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v5 = [(TUUserConfiguration *)self getBooleanFromUserDefaults:@"BusinessConnectCallingDisabled" default:&unk_1EED24270];
  char v6 = [v5 BOOLValue];

  return v6 ^ 1;
}

- (void)setBusinessConnectCallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 1024;
    BOOL v11 = v3;
    id v6 = v9;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "%@ setBusinessConnectCallingEnabled called %d", (uint8_t *)&v8, 0x12u);
  }
  int64_t v7 = [NSNumber numberWithInt:!v3];
  [(TUUserConfiguration *)self setValueInUserDefaults:v7 forKey:@"BusinessConnectCallingDisabled"];
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void).cxx_destruct
{
}

- (void)isBrandedCallingEnabled:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch state of branded calling for context: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setBrandedCallingEnabled:(uint64_t)a1 subscription:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Failed to set state of branded calling for context: %@", (uint8_t *)&v2, 0xCu);
}

@end