@interface TLCapabilitiesManager
+ (TLCapabilitiesManager)sharedCapabilitiesManager;
- (BOOL)_hasTelephonyCapability;
- (BOOL)hasCellularTelephonyCapability;
- (BOOL)hasSynchronizedEmbeddedVibrationsCapability;
- (BOOL)hasSynchronizedVibrationsCapability;
- (BOOL)hasVibratorCapability;
- (BOOL)isAlertToneStoreAvailable;
- (BOOL)isHomePod;
- (BOOL)isInternalInstall;
- (BOOL)isRingtoneStoreAvailable;
- (BOOL)supportsNanoEncore;
- (BOOL)wantsModernDefaultRingtone;
- (NSString)deviceCodeName;
- (NSString)simplifiedDeviceCodeName;
- (TLCapabilitiesManager)init;
- (void)_checkRingtoneStoreAvailability;
- (void)_updateRingtoneStoreAvailabilityWithAvailableKinds:(id)a3 error:(id)a4;
- (void)dealloc;
@end

@implementation TLCapabilitiesManager

+ (TLCapabilitiesManager)sharedCapabilitiesManager
{
  if (sharedCapabilitiesManager__TLCapabilitiesManagerOnceToken != -1) {
    dispatch_once(&sharedCapabilitiesManager__TLCapabilitiesManagerOnceToken, &__block_literal_global_9);
  }
  v2 = (void *)sharedCapabilitiesManager__TLCapabilitiesSharedManager;

  return (TLCapabilitiesManager *)v2;
}

uint64_t __50__TLCapabilitiesManager_sharedCapabilitiesManager__block_invoke()
{
  sharedCapabilitiesManager__TLCapabilitiesSharedManager = objc_alloc_init(TLCapabilitiesManager);

  return MEMORY[0x1F41817F8]();
}

- (TLCapabilitiesManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)TLCapabilitiesManager;
  v2 = [(TLCapabilitiesManager *)&v8 init];
  v3 = (TLCapabilitiesManager *)v2;
  if (v2)
  {
    *(_WORD *)(v2 + 9) = 0;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v5 = getSSDeviceAvailableItemKindsChangedNotification();
    [v4 addObserver:v3 selector:sel__handleStoreAvailableItemKindsChangedNotification_ name:v5 object:0];

    [(TLCapabilitiesManager *)v3 _checkRingtoneStoreAvailability];
    deviceCodeNameSimplicationMapping = v3->_deviceCodeNameSimplicationMapping;
    v3->_deviceCodeNameSimplicationMapping = (NSDictionary *)MEMORY[0x1E4F1CC08];

    v3->_isInternalInstall = MGGetBoolAnswer();
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = getSSDeviceAvailableItemKindsChangedNotification();
  [v3 removeObserver:self name:v4 object:0];

  v5.receiver = self;
  v5.super_class = (Class)TLCapabilitiesManager;
  [(TLCapabilitiesManager *)&v5 dealloc];
}

- (BOOL)_hasTelephonyCapability
{
  return MGGetBoolAnswer();
}

- (void)_checkRingtoneStoreAvailability
{
  if ([(TLCapabilitiesManager *)self _hasTelephonyCapability])
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2050000000;
    v3 = (void *)getSSDeviceClass_softClass;
    uint64_t v11 = getSSDeviceClass_softClass;
    if (!getSSDeviceClass_softClass)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __getSSDeviceClass_block_invoke;
      v7[3] = &unk_1E6C210C8;
      v7[4] = &v8;
      __getSSDeviceClass_block_invoke((uint64_t)v7);
      v3 = (void *)v9[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v8, 8);
    objc_super v5 = [v4 currentDevice];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__TLCapabilitiesManager__checkRingtoneStoreAvailability__block_invoke;
    v6[3] = &unk_1E6C21C78;
    v6[4] = self;
    [v5 getAvailableItemKindsWithBlock:v6];
  }
}

uint64_t __56__TLCapabilitiesManager__checkRingtoneStoreAvailability__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateRingtoneStoreAvailabilityWithAvailableKinds:a2 error:a3];
}

- (void)_updateRingtoneStoreAvailabilityWithAvailableKinds:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v8 = (void *)getSSItemKindRingtoneSymbolLoc_ptr_0;
    uint64_t v16 = getSSItemKindRingtoneSymbolLoc_ptr_0;
    if (!getSSItemKindRingtoneSymbolLoc_ptr_0)
    {
      v9 = (void *)StoreServicesLibrary_0();
      v14[3] = (uint64_t)dlsym(v9, "SSItemKindRingtone");
      getSSItemKindRingtoneSymbolLoc_ptr_0 = v14[3];
      uint64_t v8 = (void *)v14[3];
    }
    _Block_object_dispose(&v13, 8);
    if (v8)
    {
      self->_isRingtoneStoreAvailable = [v6 containsObject:*v8];
      uint64_t v13 = 0;
      v14 = &v13;
      uint64_t v15 = 0x2020000000;
      uint64_t v10 = (void *)getSSItemKindToneSymbolLoc_ptr_0;
      uint64_t v16 = getSSItemKindToneSymbolLoc_ptr_0;
      if (!getSSItemKindToneSymbolLoc_ptr_0)
      {
        uint64_t v11 = (void *)StoreServicesLibrary_0();
        v14[3] = (uint64_t)dlsym(v11, "SSItemKindTone");
        getSSItemKindToneSymbolLoc_ptr_0 = v14[3];
        uint64_t v10 = (void *)v14[3];
      }
      _Block_object_dispose(&v13, 8);
      if (v10)
      {
        self->_isAlertToneStoreAvailable = [v6 containsObject:*v10];
        goto LABEL_10;
      }
    }
    else
    {
      __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    }
    v12 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v13, 8);
    _Unwind_Resume(v12);
  }
  *(_WORD *)&self->_isRingtoneStoreAvailable = 0;
LABEL_10:
}

- (BOOL)isRingtoneStoreAvailable
{
  return self->_isRingtoneStoreAvailable;
}

- (BOOL)isAlertToneStoreAvailable
{
  return self->_isAlertToneStoreAvailable;
}

- (BOOL)wantsModernDefaultRingtone
{
  if (MGGetBoolAnswer()) {
    return 1;
  }

  return _os_feature_enabled_impl();
}

- (BOOL)supportsNanoEncore
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [getNRPairedDeviceRegistryClass() activePairedDeviceSelectorBlock];
  v3 = [getNRPairedDeviceRegistryClass() sharedInstance];
  id v4 = [v3 getAllDevicesWithArchivedAltAccountDevicesMatching:v2];

  objc_super v5 = [v4 firstObject];
  if (v5)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    id v6 = (void *)getNRDevicePropertyNameSymbolLoc_ptr;
    uint64_t v23 = getNRDevicePropertyNameSymbolLoc_ptr;
    if (!getNRDevicePropertyNameSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v25 = __getNRDevicePropertyNameSymbolLoc_block_invoke;
      v26 = &unk_1E6C210C8;
      v27 = &v20;
      id v7 = (void *)NanoRegistryLibrary();
      uint64_t v8 = dlsym(v7, "NRDevicePropertyName");
      *(void *)(v27[1] + 24) = v8;
      getNRDevicePropertyNameSymbolLoc_ptr = *(void *)(v27[1] + 24);
      id v6 = (void *)v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v6)
    {
      __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
      __break(1u);
    }
    v9 = [v5 valueForProperty:*v6];
    uint64_t v10 = NSString;
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    uint64_t v13 = [v10 stringWithFormat:@"<%@: %p name = \"%@\">", v12, v5, v9];;
  }
  else
  {
    uint64_t v13 = 0;
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9B2FB519-D14B-49AB-BB91-67A6BF4E2B9A"];
  int v15 = [v5 supportsCapability:v14];

  uint64_t v16 = TLLogToneManagement();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v13;
      v18 = "Active paired watch %{public}@ supports NanoEncore.";
LABEL_12:
      _os_log_impl(&dword_1DB936000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&buf, 0xCu);
    }
  }
  else if (v17)
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v13;
    v18 = "Active paired watch %{public}@ does NOT support NanoEncore.";
    goto LABEL_12;
  }

  return v15;
}

- (BOOL)hasVibratorCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)hasSynchronizedVibrationsCapability
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(TLCapabilitiesManager *)self hasVibratorCapability])
  {
    int v3 = MGGetBoolAnswer();
    id v4 = TLLogVibrationManagement();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543618;
      id v7 = self;
      __int16 v8 = 1024;
      int v9 = v3;
      _os_log_impl(&dword_1DB936000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: -hasSynchronizedVibrationsCapability. MobileGestalt returned %{BOOL}u for the deviceSupportsHaptics capability.", (uint8_t *)&v6, 0x12u);
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)hasSynchronizedEmbeddedVibrationsCapability
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(TLCapabilitiesManager *)self hasVibratorCapability]) {
    return 0;
  }
  int v3 = MGGetBoolAnswer();
  int v4 = MGGetBoolAnswer();
  char v5 = v3 & v4;
  int v6 = TLLogVibrationManagement();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138544130;
    int v9 = self;
    __int16 v10 = 1024;
    int v11 = v3;
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 1024;
    int v15 = v3 & v4;
    _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -hasSynchronizedVibrationsCapability. MobileGestalt returned %{BOOL}u for the deviceSupportsHaptics capability, and %{BOOL}u for the deviceSupportsClosedLoopHaptics capability; hasSynchronizedEmbeddedVibrationsCapabi"
      "lity = %{BOOL}u.",
      (uint8_t *)&v8,
      0x1Eu);
  }

  return v5;
}

- (BOOL)hasCellularTelephonyCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (NSString)deviceCodeName
{
  v2 = (void *)MGCopyAnswer();
  if (v2)
  {
    int v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFStringGetTypeID())
    {
      id v5 = v3;
      if ([v5 hasSuffix:@"AP"])
      {
        uint64_t v6 = [v5 substringToIndex:objc_msgSend(v5, "length") - objc_msgSend(@"AP", "length")];

        id v5 = (id)v6;
      }
      id v7 = (void *)[v5 copy];
    }
    else
    {
      id v7 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    id v7 = 0;
  }

  return (NSString *)v7;
}

- (NSString)simplifiedDeviceCodeName
{
  int v3 = [(TLCapabilitiesManager *)self deviceCodeName];
  if (v3)
  {
    id v4 = [(NSDictionary *)self->_deviceCodeNameSimplicationMapping objectForKey:v3];
    if (!v4) {
      id v4 = v3;
    }
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)isHomePod
{
  return MGGetSInt32Answer() == 7;
}

- (void).cxx_destruct
{
}

@end