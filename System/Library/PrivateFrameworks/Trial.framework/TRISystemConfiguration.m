@interface TRISystemConfiguration
+ (id)_sharedSystemInfo;
+ (id)sharedInstance;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)marketingOSVersion;
- (BOOL)_updateSystemInfo:(id)a3;
- (BOOL)deleteDeviceIdentifier;
- (BOOL)deleteDeviceIdentifierWithPath:(id)a3;
- (BOOL)hasAne;
- (BOOL)isAutomatedTestDevice;
- (BOOL)isBetaBuild;
- (BOOL)isBetaUserWithIsStale:(BOOL *)a3;
- (BOOL)isDiagnosticsAndUsageEnabled;
- (BOOL)isInternalBuild;
- (BOOL)resetDeviceIdentifier;
- (BOOL)setDeviceIdentifier:(id)a3;
- (BOOL)setDeviceIdentifier:(id)a3 path:(id)a4;
- (TRISystemConfiguration)initWithPaths:(id)a3;
- (id)_dispatchQueueForCarrierInfoGathering;
- (id)_systemInfoWithIsStale:(BOOL *)a3;
- (id)_trialVersion;
- (id)aneVersion;
- (id)carrierBundleIdentifier;
- (id)carrierCountryIsoCode;
- (id)createDeviceIdentifierWithPath:(id)a3;
- (id)createPersistentDeviceIdentifier;
- (id)deviceClass;
- (id)deviceId;
- (id)deviceInfoForQuestion:(id)a3;
- (id)deviceModelCode;
- (id)enabledInputModeIdentifiers;
- (id)iCloudId;
- (id)osBuild;
- (id)osType;
- (id)readDeviceIdentifierWithPath:(id)a3;
- (id)reloadDeviceId;
- (id)reloadSystemInfo;
- (id)siriDeviceAggregationIdRotationDate;
- (id)siriUserActivitySegment;
- (id)storedDeviceIdentifier;
- (id)systemInfo;
- (id)trialVersionTag;
- (id)userSettingsBCP47DeviceLocale;
- (id)userSettingsLanguageCode;
- (id)userSettingsRegionCode;
- (int)populationType;
- (unint64_t)trialVersionMajor;
- (unint64_t)trialVersionMinor;
@end

@implementation TRISystemConfiguration

- (TRISystemConfiguration)initWithPaths:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRISystemConfiguration;
  v5 = [(TRISystemConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 deviceIdentifierFile];
    persistentDeviceIdentifierPath = v5->_persistentDeviceIdentifierPath;
    v5->_persistentDeviceIdentifierPath = (NSString *)v6;
  }
  return v5;
}

+ (id)sharedInstance
{
  if (qword_1EB3B7920 != -1) {
    dispatch_once(&qword_1EB3B7920, &__block_literal_global_22);
  }
  v2 = (void *)_MergedGlobals_18;
  return v2;
}

void __40__TRISystemConfiguration_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = [TRISystemConfiguration alloc];
  v2 = +[TRIStandardPaths sharedSystemPaths];
  uint64_t v3 = [(TRISystemConfiguration *)v1 initWithPaths:v2];
  id v4 = (void *)_MergedGlobals_18;
  _MergedGlobals_18 = v3;
}

+ (id)_sharedSystemInfo
{
  if (qword_1EB3B7930 != -1) {
    dispatch_once(&qword_1EB3B7930, &__block_literal_global_29);
  }
  v2 = (void *)qword_1EB3B7928;
  return v2;
}

void __43__TRISystemConfiguration__sharedSystemInfo__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  uint64_t v1 = objc_opt_new();
  *(unsigned char *)(v1 + 8) = 1;
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;

  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v1];
  id v4 = (void *)qword_1EB3B7928;
  qword_1EB3B7928 = v3;
}

- (int)populationType
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = +[TRICKServerEnvironmentReader currentPopulation];
  if (v3)
  {
    int v4 = v3;
    v5 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_impl(&dword_19D909000, v5, OS_LOG_TYPE_DEFAULT, "Using population override: %d", (uint8_t *)v7, 8u);
    }
  }
  else if ([(TRISystemConfiguration *)self isInternalBuild])
  {
    return 3;
  }
  else if ([(TRISystemConfiguration *)self isBetaUserWithIsStale:0])
  {
    return 4;
  }
  else
  {
    return 5;
  }
  return v4;
}

- (id)systemInfo
{
  return [(TRISystemConfiguration *)self _systemInfoWithIsStale:0];
}

- (id)_systemInfoWithIsStale:(BOOL *)a3
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11;
  v12 = __Block_byref_object_dispose__11;
  id v13 = 0;
  int v4 = [(id)objc_opt_class() _sharedSystemInfo];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __49__TRISystemConfiguration__systemInfoWithIsStale___block_invoke;
  v7[3] = &unk_1E596B588;
  v7[4] = &v8;
  v7[5] = a3;
  [v4 runWithLockAcquired:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __49__TRISystemConfiguration__systemInfoWithIsStale___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7 = v3;
  if (!*((void *)v3 + 2))
  {
    uint64_t v4 = +[TRISystemInfo info];
    id v5 = (void *)v7[2];
    _DWORD v7[2] = v4;

    id v3 = v7;
  }
  uint64_t v6 = *(unsigned char **)(a1 + 40);
  if (v6) {
    *uint64_t v6 = *((unsigned char *)v3 + 8);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *((id *)v3 + 2));
}

- (BOOL)_updateSystemInfo:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v4 = [(id)objc_opt_class() _sharedSystemInfo];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __44__TRISystemConfiguration__updateSystemInfo___block_invoke;
  v7[3] = &unk_1E596B5B0;
  id v5 = v3;
  id v8 = v5;
  objc_super v9 = &v10;
  [v4 runWithLockAcquired:v7];

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

void __44__TRISystemConfiguration__updateSystemInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 8) = 0;
  objc_storeStrong((id *)(a2 + 16), *(id *)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (id)reloadSystemInfo
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  objc_super v9 = __Block_byref_object_copy__11;
  uint64_t v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  v2 = [(id)objc_opt_class() _sharedSystemInfo];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__TRISystemConfiguration_reloadSystemInfo__block_invoke;
  v5[3] = &unk_1E596B5D8;
  v5[4] = &v6;
  [v2 runWithLockAcquired:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__TRISystemConfiguration_reloadSystemInfo__block_invoke(uint64_t a1, unsigned char *a2)
{
  a2[8] = 0;
  id v5 = a2;
  uint64_t v3 = +[TRISystemInfo info];
  id v4 = v5[2];
  v5[2] = (id)v3;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5[2]);
}

- (id)trialVersionTag
{
  return @"TrialXP-429.0.3.2";
}

- (id)_trialVersion
{
  v2 = [(TRISystemConfiguration *)self trialVersionTag];
  uint64_t v3 = +[TRIVersion parseVersionFromString:v2 withPrefix:@"TrialXP-"];

  return v3;
}

- (unint64_t)trialVersionMajor
{
  v2 = [(TRISystemConfiguration *)self _trialVersion];
  uint64_t v3 = [v2 majorVersion];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)trialVersionMinor
{
  v2 = [(TRISystemConfiguration *)self _trialVersion];
  uint64_t v3 = [v2 minorVersion];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)isBetaUserWithIsStale:(BOOL *)a3
{
  if ([(TRISystemConfiguration *)self isInternalBuild])
  {
    char v5 = 0;
    if (a3) {
      *a3 = 0;
    }
  }
  else
  {
    uint64_t v6 = [(TRISystemConfiguration *)self _systemInfoWithIsStale:a3];
    v7 = v6;
    if (!a3 || v6)
    {
      if (v6) {
        char v5 = [v6 isEnrolledInBetaProgram];
      }
      else {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
      *a3 = 1;
    }
  }
  return v5;
}

- (BOOL)isInternalBuild
{
  return [MEMORY[0x1E4F93B08] isInternalBuild];
}

- (BOOL)isBetaBuild
{
  return [MEMORY[0x1E4F93B08] isBetaBuild];
}

- (id)readDeviceIdentifierWithPath:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  uint64_t v3 = [NSString stringWithContentsOfFile:a3 encoding:4 error:&v8];
  id v4 = v8;
  if (!v3)
  {
    char v5 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = [v4 description];
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v7;
      _os_log_error_impl(&dword_19D909000, v5, OS_LOG_TYPE_ERROR, "Persistent identifier file read error: %@", buf, 0xCu);
    }
  }

  return v3;
}

- (BOOL)resetDeviceIdentifier
{
  if (![(TRISystemConfiguration *)self deleteDeviceIdentifier]) {
    return 0;
  }
  uint64_t v3 = [(TRISystemConfiguration *)self createPersistentDeviceIdentifier];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)deleteDeviceIdentifier
{
  return [(TRISystemConfiguration *)self deleteDeviceIdentifierWithPath:self->_persistentDeviceIdentifierPath];
}

- (BOOL)deleteDeviceIdentifierWithPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (![v4 fileExistsAtPath:v3]
    || ((v13 = 0, v5 = [v4 removeItemAtPath:v3 error:&v13], id v6 = v13, v5)
      ? (BOOL v7 = v6 == 0)
      : (BOOL v7 = 0),
        v7))
  {
    BOOL v10 = 1;
  }
  else
  {
    id v8 = v6;
    objc_super v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v8 description];
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "Error deleting persistent identifier file: %@", buf, 0xCu);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)setDeviceIdentifier:(id)a3
{
  return [(TRISystemConfiguration *)self setDeviceIdentifier:a3 path:self->_persistentDeviceIdentifierPath];
}

- (BOOL)setDeviceIdentifier:(id)a3 path:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = 0;
  id v9 = (id)[v8 triCreateDirectoryForPath:v7 isDirectory:0 error:&v20];
  BOOL v10 = (TRISystemConfiguration *)v20;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(TRISystemConfiguration *)v11 description];
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      v14 = "Error creating persistent identifier folder: %@";
LABEL_10:
      _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
    }
  }
  else
  {
    id v19 = 0;
    [v6 writeToFile:v7 atomically:1 encoding:4 error:&v19];
    v15 = (TRISystemConfiguration *)v19;
    if (!v15)
    {
      uint64_t v11 = self;
      objc_sync_enter(v11);
      cachedDeviceIdentifier = v11->_cachedDeviceIdentifier;
      v11->_cachedDeviceIdentifier = 0;

      objc_sync_exit(v11);
      BOOL v16 = 1;
      goto LABEL_7;
    }
    uint64_t v11 = v15;
    uint64_t v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(TRISystemConfiguration *)v11 description];
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      v14 = "Error writing persistent identifier: %@";
      goto LABEL_10;
    }
  }

  BOOL v16 = 0;
LABEL_7:

  return v16;
}

- (id)createDeviceIdentifierWithPath:(id)a3
{
  id v4 = a3;
  id v5 = [(TRISystemConfiguration *)self readDeviceIdentifierWithPath:v4];
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F29128] UUID];
    id v7 = [v6 UUIDString];

    if ([(TRISystemConfiguration *)self setDeviceIdentifier:v7 path:v4]) {
      id v5 = v7;
    }
    else {
      id v5 = 0;
    }
  }
  return v5;
}

- (id)storedDeviceIdentifier
{
  return [(TRISystemConfiguration *)self readDeviceIdentifierWithPath:self->_persistentDeviceIdentifierPath];
}

- (id)createPersistentDeviceIdentifier
{
  return [(TRISystemConfiguration *)self createDeviceIdentifierWithPath:self->_persistentDeviceIdentifierPath];
}

- (id)deviceInfoForQuestion:(id)a3
{
  id v3 = (__CFString *)MGCopyAnswer();
  id v4 = v3;
  if (!v3) {
    id v3 = @"unknown";
  }
  id v5 = v3;

  return v5;
}

- (id)reloadDeviceId
{
  v2 = self;
  objc_sync_enter(v2);
  cachedDeviceIdentifier = v2->_cachedDeviceIdentifier;
  v2->_cachedDeviceIdentifier = 0;

  objc_sync_exit(v2);
  return [(TRISystemConfiguration *)v2 deviceId];
}

- (id)deviceId
{
  v2 = self;
  objc_sync_enter(v2);
  cachedDeviceIdentifier = v2->_cachedDeviceIdentifier;
  if (!cachedDeviceIdentifier)
  {
    uint64_t v4 = [(TRISystemConfiguration *)v2 storedDeviceIdentifier];
    id v5 = v2->_cachedDeviceIdentifier;
    v2->_cachedDeviceIdentifier = (NSString *)v4;

    cachedDeviceIdentifier = v2->_cachedDeviceIdentifier;
  }
  id v6 = cachedDeviceIdentifier;
  objc_sync_exit(v2);

  return v6;
}

- (id)iCloudId
{
  v2 = [(TRISystemConfiguration *)self systemInfo];
  id v3 = [v2 iCloudIdentifier];
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = &stru_1EEFB6D68;
  }
  id v5 = v3;

  return v5;
}

- (id)deviceClass
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__TRISystemConfiguration_deviceClass__block_invoke;
  block[3] = &unk_1E596A0B0;
  block[4] = self;
  if (qword_1EB3B7940 != -1) {
    dispatch_once(&qword_1EB3B7940, block);
  }
  return (id)qword_1EB3B7938;
}

uint64_t __37__TRISystemConfiguration_deviceClass__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) deviceInfoForQuestion:@"DeviceClass"];
  uint64_t v2 = qword_1EB3B7938;
  qword_1EB3B7938 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (id)deviceModelCode
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__TRISystemConfiguration_deviceModelCode__block_invoke;
  block[3] = &unk_1E596A0B0;
  block[4] = self;
  if (qword_1EB3B7950 != -1) {
    dispatch_once(&qword_1EB3B7950, block);
  }
  return (id)qword_1EB3B7948;
}

uint64_t __41__TRISystemConfiguration_deviceModelCode__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) deviceInfoForQuestion:@"ProductType"];
  uint64_t v2 = qword_1EB3B7948;
  qword_1EB3B7948 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (id)osType
{
  return @"iOS";
}

- (id)osBuild
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__TRISystemConfiguration_osBuild__block_invoke;
  block[3] = &unk_1E596A0B0;
  block[4] = self;
  if (qword_1EB3B7960 != -1) {
    dispatch_once(&qword_1EB3B7960, block);
  }
  return (id)qword_1EB3B7958;
}

uint64_t __33__TRISystemConfiguration_osBuild__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) deviceInfoForQuestion:@"BuildVersion"];
  uint64_t v2 = qword_1EB3B7958;
  qword_1EB3B7958 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (id)userSettingsLanguageCode
{
  uint64_t v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v3 = [v2 languageCode];

  return v3;
}

- (id)userSettingsRegionCode
{
  uint64_t v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v3 = [v2 countryCode];

  return v3;
}

- (id)userSettingsBCP47DeviceLocale
{
  uint64_t v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v3 = [v2 languageCode];

  uint64_t v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v5 = [v4 countryCode];

  id v6 = &stru_1EEFB6D68;
  if (v5) {
    id v6 = v5;
  }
  id v7 = [NSString stringWithFormat:@"%@-%@", v3, v6];

  return v7;
}

- (id)_dispatchQueueForCarrierInfoGathering
{
  if (qword_1EB3B7970 != -1) {
    dispatch_once(&qword_1EB3B7970, &__block_literal_global_66);
  }
  uint64_t v2 = (void *)qword_1EB3B7968;
  return v2;
}

void __63__TRISystemConfiguration__dispatchQueueForCarrierInfoGathering__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.trial.system-config.carrier" qosClass:17];
  uint64_t v2 = (void *)qword_1EB3B7968;
  qword_1EB3B7968 = v1;
}

- (id)carrierBundleIdentifier
{
  uint64_t v2 = [(TRISystemConfiguration *)self systemInfo];
  id v3 = [v2 carrierBundleIdentifier];
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = &stru_1EEFB6D68;
  }
  id v5 = v3;

  return v5;
}

- (id)carrierCountryIsoCode
{
  uint64_t v2 = [(TRISystemConfiguration *)self systemInfo];
  id v3 = [v2 carrierCountryIsoCode];
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = &stru_1EEFB6D68;
  }
  id v5 = v3;

  return v5;
}

- (BOOL)isDiagnosticsAndUsageEnabled
{
  uint64_t v2 = [(TRISystemConfiguration *)self systemInfo];
  char v3 = [v2 isDiagnosticsAndUsageEnabled];

  return v3;
}

- (BOOL)hasAne
{
  uint64_t v2 = [(TRISystemConfiguration *)self systemInfo];
  char v3 = [v2 hasAne];

  return v3;
}

- (id)aneVersion
{
  uint64_t v2 = [(TRISystemConfiguration *)self systemInfo];
  char v3 = [v2 aneVersion];

  return v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)marketingOSVersion
{
  uint64_t v4 = [MEMORY[0x1E4F28F80] processInfo];
  if (v4)
  {
    id v6 = v4;
    [v4 operatingSystemVersion];
    uint64_t v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

- (id)enabledInputModeIdentifiers
{
  uint64_t v2 = [(TRISystemConfiguration *)self systemInfo];
  char v3 = [v2 enabledInputModeIdentifiers];
  uint64_t v4 = v3;
  if (!v3) {
    char v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (BOOL)isAutomatedTestDevice
{
  uint64_t v2 = [(TRISystemConfiguration *)self systemInfo];
  char v3 = [v2 isAutomatedTestDevice];

  return v3;
}

- (id)siriUserActivitySegment
{
  uint64_t v2 = [(TRISystemConfiguration *)self systemInfo];
  char v3 = [v2 siriUserActivitySegment];
  uint64_t v4 = v3;
  if (!v3) {
    char v3 = @"unknown";
  }
  id v5 = v3;

  return v5;
}

- (id)siriDeviceAggregationIdRotationDate
{
  uint64_t v2 = [(TRISystemConfiguration *)self systemInfo];
  char v3 = [v2 siriDeviceAggregationIdRotationDate];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentDeviceIdentifierPath, 0);
}

@end