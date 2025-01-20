@interface TRISystemInfo
+ (BOOL)_hasAne;
+ (BOOL)_isAutomatedTestDevice;
+ (BOOL)_isDiagnosticsAndUsageEnabled;
+ (BOOL)_isSeedBuild;
+ (BOOL)_isVirtualMachine;
+ (BOOL)_sysIsEnrolledInBetaProgram;
+ (BOOL)supportsSecureCoding;
+ (id)_aneVersion;
+ (id)_carrierBundleIdentifier;
+ (id)_carrierCountryIsoCode;
+ (id)_iCloudIdentifier;
+ (id)_persistentSystemInfoPath;
+ (id)_siriUserActivitySegment;
+ (id)_sysEnabledInputModeIdentifiers;
+ (id)createSystemInfoWithFactorProvider:(id)a3;
+ (id)info;
+ (id)loadSystemInfo;
+ (id)systemInfoFromFile:(id)a3;
- (BOOL)hasAne;
- (BOOL)isAutomatedTestDevice;
- (BOOL)isDiagnosticsAndUsageEnabled;
- (BOOL)isEnrolledInBetaProgram;
- (BOOL)logUserKeyboardEnabledInputMode;
- (BOOL)logUserSettingsLanguageCode;
- (BOOL)logUserSettingsRegionCode;
- (BOOL)save;
- (BOOL)saveToFile:(id)a3;
- (NSArray)enabledInputModeIdentifiers;
- (NSDate)siriDeviceAggregationIdRotationDate;
- (NSString)aneVersion;
- (NSString)carrierBundleIdentifier;
- (NSString)carrierCountryIsoCode;
- (NSString)iCloudIdentifier;
- (NSString)siriUserActivitySegment;
- (TRISystemInfo)initWithCoder:(id)a3;
- (id)_getSiriDeviceAggregationIdRotationDate;
- (id)externalParamManager;
- (id)initFromSystemWithFactorProvider:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAneVersion:(id)a3;
- (void)setCarrierBundleIdentifier:(id)a3;
- (void)setCarrierCountryIsoCode:(id)a3;
- (void)setEnabledInputModeIdentifiers:(id)a3;
- (void)setHasAne:(BOOL)a3;
- (void)setICloudIdentifier:(id)a3;
- (void)setIsAutomatedTestDevice:(BOOL)a3;
- (void)setIsDiagnosticsAndUsageEnabled:(BOOL)a3;
- (void)setIsEnrolledInBetaProgram:(BOOL)a3;
- (void)setLogUserKeyboardEnabledInputMode:(BOOL)a3;
- (void)setLogUserSettingsLanguageCode:(BOOL)a3;
- (void)setLogUserSettingsRegionCode:(BOOL)a3;
- (void)setSiriDeviceAggregationIdRotationDate:(id)a3;
- (void)setSiriUserActivitySegment:(id)a3;
@end

@implementation TRISystemInfo

+ (id)_persistentSystemInfoPath
{
  v2 = +[TRIStandardPaths sharedSystemPaths];
  v3 = [v2 systemDataFile];

  return v3;
}

+ (id)info
{
  v3 = [a1 loadSystemInfo];
  if (!v3)
  {
    if (+[TRIProcessInfo hostingProcessIsTriald])
    {
      v3 = [a1 createSystemInfoWithFactorProvider:0];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

+ (id)loadSystemInfo
{
  v3 = [a1 _persistentSystemInfoPath];
  v4 = [a1 systemInfoFromFile:v3];

  return v4;
}

+ (id)systemInfoFromFile:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v11 = 0;
    v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3 options:2 error:&v11];
    v6 = v11;
    if (v5)
    {
      v10 = v6;
      v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v10];
      v8 = v6;
      v6 = v10;
    }
    else
    {
      v8 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v3;
        __int16 v14 = 2112;
        v15 = v6;
        _os_log_error_impl(&dword_19D909000, v8, OS_LOG_TYPE_ERROR, "failed to read system info from file %@: %@", buf, 0x16u);
      }
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)createSystemInfoWithFactorProvider:(id)a3
{
  id v3 = a3;
  id v4 = [[TRISystemInfo alloc] initFromSystemWithFactorProvider:v3];

  return v4;
}

- (id)initFromSystemWithFactorProvider:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)TRISystemInfo;
  id v3 = [(TRISystemInfo *)&v19 init];
  if (v3)
  {
    v3->_isEnrolledInBetaProgram = [(id)objc_opt_class() _sysIsEnrolledInBetaProgram];
    uint64_t v4 = [(id)objc_opt_class() _sysEnabledInputModeIdentifiers];
    enabledInputModeIdentifiers = v3->_enabledInputModeIdentifiers;
    v3->_enabledInputModeIdentifiers = (NSArray *)v4;

    uint64_t v6 = [(id)objc_opt_class() _carrierBundleIdentifier];
    carrierBundleIdentifier = v3->_carrierBundleIdentifier;
    v3->_carrierBundleIdentifier = (NSString *)v6;

    uint64_t v8 = [(id)objc_opt_class() _carrierCountryIsoCode];
    carrierCountryIsoCode = v3->_carrierCountryIsoCode;
    v3->_carrierCountryIsoCode = (NSString *)v8;

    uint64_t v10 = [(id)objc_opt_class() _iCloudIdentifier];
    iCloudIdentifier = v3->_iCloudIdentifier;
    v3->_iCloudIdentifier = (NSString *)v10;

    v3->_isDiagnosticsAndUsageEnabled = [(id)objc_opt_class() _isDiagnosticsAndUsageEnabled];
    v3->_hasAne = [(id)objc_opt_class() _hasAne];
    uint64_t v12 = [(id)objc_opt_class() _aneVersion];
    aneVersion = v3->_aneVersion;
    v3->_aneVersion = (NSString *)v12;

    v3->_isAutomatedTestDevice = [(id)objc_opt_class() _isAutomatedTestDevice];
    uint64_t v14 = [(id)objc_opt_class() _siriUserActivitySegment];
    siriUserActivitySegment = v3->_siriUserActivitySegment;
    v3->_siriUserActivitySegment = (NSString *)v14;

    uint64_t v16 = [(TRISystemInfo *)v3 _getSiriDeviceAggregationIdRotationDate];
    siriDeviceAggregationIdRotationDate = v3->_siriDeviceAggregationIdRotationDate;
    v3->_siriDeviceAggregationIdRotationDate = (NSDate *)v16;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRISystemInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)TRISystemInfo;
  v5 = [(TRISystemInfo *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isBetaUser"];
    v5->_isEnrolledInBetaProgram = [v6 BOOLValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrierBundleIdentifier"];
    carrierBundleIdentifier = v5->_carrierBundleIdentifier;
    v5->_carrierBundleIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrierCountryIsoCode"];
    carrierCountryIsoCode = v5->_carrierCountryIsoCode;
    v5->_carrierCountryIsoCode = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudIdentifier"];
    iCloudIdentifier = v5->_iCloudIdentifier;
    v5->_iCloudIdentifier = (NSString *)v11;

    v5->_isDiagnosticsAndUsageEnabled = [v4 decodeBoolForKey:@"isDiagnosticsAndUsageEnabled"];
    v5->_hasAne = [v4 decodeBoolForKey:@"hasAne"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aneVersion"];
    aneVersion = v5->_aneVersion;
    v5->_aneVersion = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"enabledInputModeIdentifiers"];
    enabledInputModeIdentifiers = v5->_enabledInputModeIdentifiers;
    v5->_enabledInputModeIdentifiers = (NSArray *)v18;

    int v20 = [v4 containsValueForKey:@"logUserSettingsRegionCode"];
    if (v20) {
      LOBYTE(v20) = [v4 decodeBoolForKey:@"logUserSettingsRegionCode"];
    }
    v5->_logUserSettingsRegionCode = v20;
    int v21 = [v4 containsValueForKey:@"logUserSettingsLanguageCode"];
    if (v21) {
      LOBYTE(v21) = [v4 decodeBoolForKey:@"logUserSettingsLanguageCode"];
    }
    v5->_logUserSettingsLanguageCode = v21;
    int v22 = [v4 containsValueForKey:@"logUserKeyboardEnabledInputMode"];
    if (v22) {
      LOBYTE(v22) = [v4 decodeBoolForKey:@"logUserKeyboardEnabledInputMode"];
    }
    v5->_logUserKeyboardEnabledInputMode = v22;
    if (!v5->_enabledInputModeIdentifiers)
    {
      v23 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19D909000, v23, OS_LOG_TYPE_ERROR, "initWithCoder: enabledInputModeIdentifiers is nil", buf, 2u);
      }

      v24 = v5->_enabledInputModeIdentifiers;
      v5->_enabledInputModeIdentifiers = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    v5->_isAutomatedTestDevice = [v4 decodeBoolForKey:@"isAutomatedTestDevice"];
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SiriUserActivitySegment"];
    siriUserActivitySegment = v5->_siriUserActivitySegment;
    v5->_siriUserActivitySegment = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"siriDeviceAggregationIdRotationDate"];
    siriDeviceAggregationIdRotationDate = v5->_siriDeviceAggregationIdRotationDate;
    v5->_siriDeviceAggregationIdRotationDate = (NSDate *)v27;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TRISystemInfo *)self enabledInputModeIdentifiers];

  if (!v5)
  {
    uint64_t v6 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_error_impl(&dword_19D909000, v6, OS_LOG_TYPE_ERROR, "encodeWithCoder: enabledInputModeIdentifiers is nil", v17, 2u);
    }
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[TRISystemInfo isEnrolledInBetaProgram](self, "isEnrolledInBetaProgram"));
  [v4 encodeObject:v7 forKey:@"isBetaUser"];

  uint64_t v8 = [(TRISystemInfo *)self carrierBundleIdentifier];
  [v4 encodeObject:v8 forKey:@"carrierBundleIdentifier"];

  uint64_t v9 = [(TRISystemInfo *)self carrierCountryIsoCode];
  [v4 encodeObject:v9 forKey:@"carrierCountryIsoCode"];

  objc_msgSend(v4, "encodeBool:forKey:", -[TRISystemInfo isDiagnosticsAndUsageEnabled](self, "isDiagnosticsAndUsageEnabled"), @"isDiagnosticsAndUsageEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[TRISystemInfo hasAne](self, "hasAne"), @"hasAne");
  uint64_t v10 = [(TRISystemInfo *)self aneVersion];
  [v4 encodeObject:v10 forKey:@"aneVersion"];

  uint64_t v11 = [(TRISystemInfo *)self enabledInputModeIdentifiers];
  uint64_t v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = MEMORY[0x1E4F1CBF0];
  }
  [v4 encodeObject:v13 forKey:@"enabledInputModeIdentifiers"];

  objc_msgSend(v4, "encodeBool:forKey:", -[TRISystemInfo logUserSettingsRegionCode](self, "logUserSettingsRegionCode"), @"logUserSettingsRegionCode");
  objc_msgSend(v4, "encodeBool:forKey:", -[TRISystemInfo logUserSettingsLanguageCode](self, "logUserSettingsLanguageCode"), @"logUserSettingsLanguageCode");
  objc_msgSend(v4, "encodeBool:forKey:", -[TRISystemInfo logUserKeyboardEnabledInputMode](self, "logUserKeyboardEnabledInputMode"), @"logUserKeyboardEnabledInputMode");
  objc_msgSend(v4, "encodeBool:forKey:", -[TRISystemInfo isAutomatedTestDevice](self, "isAutomatedTestDevice"), @"isAutomatedTestDevice");
  uint64_t v14 = [(TRISystemInfo *)self siriUserActivitySegment];
  [v4 encodeObject:v14 forKey:@"SiriUserActivitySegment"];

  v15 = [(TRISystemInfo *)self siriDeviceAggregationIdRotationDate];
  [v4 encodeObject:v15 forKey:@"siriDeviceAggregationIdRotationDate"];

  uint64_t v16 = [(TRISystemInfo *)self iCloudIdentifier];
  [v4 encodeObject:v16 forKey:@"cloudIdentifier"];
}

- (BOOL)save
{
  id v3 = [(id)objc_opt_class() _persistentSystemInfoPath];
  LOBYTE(self) = [(TRISystemInfo *)self saveToFile:v3];

  return (char)self;
}

- (BOOL)saveToFile:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v19 = 0;
  v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v19];
  id v6 = v19;
  if (!v5)
  {
    uint64_t v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      uint64_t v13 = "failed to encode system info -- %@";
      uint64_t v14 = v12;
      uint32_t v15 = 12;
      goto LABEL_8;
    }
LABEL_12:

    BOOL v10 = 0;
    goto LABEL_13;
  }
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v18 = v6;
  uint64_t v8 = [v7 triCreateDirectoryForPath:v4 isDirectory:0 error:&v18];
  id v9 = v18;

  if (!v8)
  {
    uint64_t v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v4;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "failed to create directory for path %@ -- %@", buf, 0x16u);
    }
    id v6 = v9;
    goto LABEL_12;
  }
  id v17 = v9;
  BOOL v10 = 1;
  char v11 = [v5 writeToFile:v4 options:1 error:&v17];
  id v6 = v17;

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v4;
      __int16 v22 = 2112;
      id v23 = v6;
      uint64_t v13 = "failed to write system info to path %@ -- %@";
      uint64_t v14 = v12;
      uint32_t v15 = 22;
LABEL_8:
      _os_log_error_impl(&dword_19D909000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:

  return v10;
}

- (id)externalParamManager
{
  if (qword_1EB3B77F8 != -1) {
    dispatch_once(&qword_1EB3B77F8, &__block_literal_global_10);
  }
  v2 = (void *)qword_1EB3B77F0;
  return v2;
}

void __37__TRISystemInfo_externalParamManager__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = objc_alloc_init(TRIExternalParameterManager);
  v2 = (void *)qword_1EB3B77F0;
  qword_1EB3B77F0 = (uint64_t)v1;
}

- (id)_getSiriDeviceAggregationIdRotationDate
{
  v2 = [(TRISystemInfo *)self externalParamManager];
  id v3 = [v2 siriDeviceAggregationIdRotationDate];

  return v3;
}

+ (BOOL)_isSeedBuild
{
  return 0;
}

+ (BOOL)_sysIsEnrolledInBetaProgram
{
  int v2 = [a1 _isSeedBuild];
  id v3 = TRILogCategory_ClientFramework();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      __int16 v9 = 0;
      v5 = "RC_SEED_BUILD is true. Considering device as enrolled in beta program";
      id v6 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_19D909000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    __int16 v8 = 0;
    v5 = "RC_SEED_BUILD is false. Not considering device as enrolled in beta program";
    id v6 = (uint8_t *)&v8;
    goto LABEL_6;
  }

  return v2;
}

+ (id)_sysEnabledInputModeIdentifiers
{
  BOOL v4 = (void *)MEMORY[0x19F3AD060]();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__TRISystemInfo__sysEnabledInputModeIdentifiers__block_invoke;
  v7[3] = &__block_descriptor_48_e5_v8__0l;
  v7[4] = a2;
  v7[5] = a1;
  if (qword_1EB3B7808 != -1) {
    dispatch_once(&qword_1EB3B7808, v7);
  }
  id v5 = (id)qword_1EB3B7800;
  return v5;
}

void __48__TRISystemInfo__sysEnabledInputModeIdentifiers__block_invoke(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x19F3AD060]();
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2050000000;
  id v3 = (void *)qword_1EB3B7830;
  uint64_t v21 = qword_1EB3B7830;
  if (!qword_1EB3B7830)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getTIInputModeControllerClass_block_invoke;
    v17[3] = &unk_1E596AD58;
    v17[4] = &v18;
    __getTIInputModeControllerClass_block_invoke((uint64_t)v17);
    id v3 = (void *)v19[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v18, 8);
  if (!v4)
  {
    char v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"TRISystemInfo.m" lineNumber:243 description:@"Unable to load soft-linked TIInputModeController class"];
  }
  id v5 = objc_opt_new();
  id v6 = [v5 enabledInputModeIdentifiers];
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __48__TRISystemInfo__sysEnabledInputModeIdentifiers__block_invoke_2;
  uint32_t v15 = &unk_1E596AD10;
  id v16 = v7;
  id v8 = v7;
  [v6 enumerateObjectsUsingBlock:&v12];
  uint64_t v9 = objc_msgSend(v8, "copy", v12, v13, v14, v15);

  BOOL v10 = (void *)qword_1EB3B7800;
  qword_1EB3B7800 = v9;
}

void __48__TRISystemInfo__sysEnabledInputModeIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F28FE8];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithString:v4];

  id v6 = objc_alloc_init(NSString);
  id v8 = v6;
  [v5 scanUpToString:@"@" intoString:&v8];
  id v7 = v8;

  [*(id *)(a1 + 32) addObject:v7];
}

+ (id)_carrierBundleIdentifier
{
  int v2 = +[TRICellularParameterManager sharedInstance];
  id v3 = [v2 carrierBundleIdentifier];

  return v3;
}

+ (id)_carrierCountryIsoCode
{
  int v2 = +[TRICellularParameterManager sharedInstance];
  id v3 = [v2 carrierCountryIsoCode];

  return v3;
}

+ (id)_iCloudIdentifier
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double Helper_x8__OBJC_CLASS___ACAccountStore = gotLoadHelper_x8__OBJC_CLASS___ACAccountStore(v2);
  id v5 = objc_msgSend(*(id *)(v4 + 2504), "defaultStore", Helper_x8__OBJC_CLASS___ACAccountStore);
  id v6 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_msgSend(v5, "aa_primaryAppleAccount");
    int v11 = 138412290;
    uint64_t v12 = v7;
    _os_log_impl(&dword_19D909000, v6, OS_LOG_TYPE_DEFAULT, "Updating iCloudID using Alt. DSID of account: %@", (uint8_t *)&v11, 0xCu);
  }
  id v8 = objc_msgSend(v5, "aa_primaryAppleAccount");
  uint64_t v9 = objc_msgSend(v8, "aa_altDSID");

  return v9;
}

+ (BOOL)_isDiagnosticsAndUsageEnabled
{
  double v2 = [MEMORY[0x1E4F83948] sharedInstance];
  char v3 = [v2 optInApple];

  return v3;
}

+ (BOOL)_hasAne
{
  double v2 = (void *)MEMORY[0x19F3AD060](a1, a2);
  if (qword_1EB3B7810 != -1) {
    dispatch_once(&qword_1EB3B7810, &__block_literal_global_100);
  }
  char v3 = _MergedGlobals_9;
  return v3;
}

void __24__TRISystemInfo__hasAne__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  id ANEDeviceInfoClass = get_ANEDeviceInfoClass();
  if (!ANEDeviceInfoClass)
  {
    double v2 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v3 = 0;
      _os_log_error_impl(&dword_19D909000, v2, OS_LOG_TYPE_ERROR, "Unable to load soft-linked _ANEDeviceInfo class", v3, 2u);
    }
  }
  _MergedGlobals_9 = [ANEDeviceInfoClass hasANE];
}

+ (id)_aneVersion
{
  double v2 = (void *)MEMORY[0x19F3AD060](a1, a2);
  if (qword_1EB3B7820 != -1) {
    dispatch_once(&qword_1EB3B7820, &__block_literal_global_102);
  }
  id v3 = (id)qword_1EB3B7818;
  return v3;
}

void __28__TRISystemInfo__aneVersion__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  id ANEDeviceInfoClass = get_ANEDeviceInfoClass();
  if (!ANEDeviceInfoClass)
  {
    double v2 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_19D909000, v2, OS_LOG_TYPE_ERROR, "Unable to load soft-linked _ANEDeviceInfo class", v5, 2u);
    }
  }
  uint64_t v3 = [ANEDeviceInfoClass aneSubType];
  uint64_t v4 = (void *)qword_1EB3B7818;
  qword_1EB3B7818 = v3;
}

+ (BOOL)_isAutomatedTestDevice
{
  uint64_t v3 = [MEMORY[0x1E4F83948] automatedDeviceGroup];
  if (v3) {
    char v4 = 1;
  }
  else {
    char v4 = [a1 _isVirtualMachine];
  }

  return v4;
}

+ (BOOL)_isVirtualMachine
{
  if (qword_1EB3B7828 != -1) {
    dispatch_once(&qword_1EB3B7828, &__block_literal_global_104);
  }
  return dword_1EB3B77EC != 0;
}

void __34__TRISystemInfo__isVirtualMachine__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x19F3AD060]();
  int v5 = 0;
  size_t v4 = 4;
  int v1 = sysctlbyname("kern.hv_vmm_present", &v5, &v4, 0, 0);
  if (v1)
  {
    int v2 = v1;
    uint64_t v3 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = v2;
      _os_log_error_impl(&dword_19D909000, v3, OS_LOG_TYPE_ERROR, "Unable to read 'kern.hv_vmm_present' code: %d", buf, 8u);
    }
  }
  dword_1EB3B77EC = v5 != 0;
}

+ (id)_siriUserActivitySegment
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.siri.userfeedbacklearning"];
  size_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 URLByAppendingPathComponent:@"Segment/SegmentStore.plist"];
    id v6 = [v5 path];
    if (v6)
    {
      if ([v2 fileExistsAtPath:v6])
      {
        int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v5];
        uint64_t v8 = v7;
        if (v7)
        {
          uint64_t v9 = [v7 objectForKeyedSubscript:@"activitySegment"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v9 = v9;
            BOOL v10 = (__CFString *)v9;
LABEL_20:

            goto LABEL_21;
          }
          uint64_t v14 = TRILogCategory_ClientFramework();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v16) = 0;
            _os_log_error_impl(&dword_19D909000, v14, OS_LOG_TYPE_ERROR, "Error: The activitySegment in the plist is not a string.", (uint8_t *)&v16, 2u);
          }
        }
        else
        {
          uint64_t v9 = TRILogCategory_ClientFramework();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            int v16 = 138412290;
            id v17 = (__CFString *)v5;
            _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "Error: Failed to read the plist dictionary from %@", (uint8_t *)&v16, 0xCu);
          }
        }
        BOOL v10 = @"unknown";
        goto LABEL_20;
      }
      uint64_t v8 = TRILogCategory_ClientFramework();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_13:
        BOOL v10 = @"unknown";
LABEL_21:

        goto LABEL_22;
      }
      LOWORD(v16) = 0;
      int v11 = "Error: SegmentStore.plist does not exist at the expected location.";
      uint64_t v12 = v8;
      uint32_t v13 = 2;
    }
    else
    {
      uint64_t v8 = TRILogCategory_ClientFramework();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      int v16 = 138412290;
      id v17 = @"group.com.apple.siri.userfeedbacklearning";
      int v11 = "Error: Failed to create the plist path for the app group identifier: %@";
      uint64_t v12 = v8;
      uint32_t v13 = 12;
    }
    _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v16, v13);
    goto LABEL_13;
  }
  int v5 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138412290;
    id v17 = @"group.com.apple.siri.userfeedbacklearning";
    _os_log_error_impl(&dword_19D909000, v5, OS_LOG_TYPE_ERROR, "Error: Failed to retrieve the container URL for the app group identifier: %@", (uint8_t *)&v16, 0xCu);
  }
  BOOL v10 = @"unknown";
LABEL_22:

  return v10;
}

- (BOOL)isEnrolledInBetaProgram
{
  return self->_isEnrolledInBetaProgram;
}

- (void)setIsEnrolledInBetaProgram:(BOOL)a3
{
  self->_isEnrolledInBetaProgram = a3;
}

- (NSArray)enabledInputModeIdentifiers
{
  return self->_enabledInputModeIdentifiers;
}

- (void)setEnabledInputModeIdentifiers:(id)a3
{
}

- (BOOL)logUserSettingsLanguageCode
{
  return self->_logUserSettingsLanguageCode;
}

- (void)setLogUserSettingsLanguageCode:(BOOL)a3
{
  self->_logUserSettingsLanguageCode = a3;
}

- (BOOL)logUserSettingsRegionCode
{
  return self->_logUserSettingsRegionCode;
}

- (void)setLogUserSettingsRegionCode:(BOOL)a3
{
  self->_logUserSettingsRegionCode = a3;
}

- (BOOL)logUserKeyboardEnabledInputMode
{
  return self->_logUserKeyboardEnabledInputMode;
}

- (void)setLogUserKeyboardEnabledInputMode:(BOOL)a3
{
  self->_logUserKeyboardEnabledInputMode = a3;
}

- (NSString)carrierBundleIdentifier
{
  return self->_carrierBundleIdentifier;
}

- (void)setCarrierBundleIdentifier:(id)a3
{
}

- (NSString)carrierCountryIsoCode
{
  return self->_carrierCountryIsoCode;
}

- (void)setCarrierCountryIsoCode:(id)a3
{
}

- (BOOL)isDiagnosticsAndUsageEnabled
{
  return self->_isDiagnosticsAndUsageEnabled;
}

- (void)setIsDiagnosticsAndUsageEnabled:(BOOL)a3
{
  self->_isDiagnosticsAndUsageEnabled = a3;
}

- (BOOL)hasAne
{
  return self->_hasAne;
}

- (void)setHasAne:(BOOL)a3
{
  self->_hasAne = a3;
}

- (NSString)aneVersion
{
  return self->_aneVersion;
}

- (void)setAneVersion:(id)a3
{
}

- (BOOL)isAutomatedTestDevice
{
  return self->_isAutomatedTestDevice;
}

- (void)setIsAutomatedTestDevice:(BOOL)a3
{
  self->_isAutomatedTestDevice = a3;
}

- (NSString)siriUserActivitySegment
{
  return self->_siriUserActivitySegment;
}

- (void)setSiriUserActivitySegment:(id)a3
{
}

- (NSDate)siriDeviceAggregationIdRotationDate
{
  return self->_siriDeviceAggregationIdRotationDate;
}

- (void)setSiriDeviceAggregationIdRotationDate:(id)a3
{
}

- (NSString)iCloudIdentifier
{
  return self->_iCloudIdentifier;
}

- (void)setICloudIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_siriDeviceAggregationIdRotationDate, 0);
  objc_storeStrong((id *)&self->_siriUserActivitySegment, 0);
  objc_storeStrong((id *)&self->_aneVersion, 0);
  objc_storeStrong((id *)&self->_carrierCountryIsoCode, 0);
  objc_storeStrong((id *)&self->_carrierBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_enabledInputModeIdentifiers, 0);
}

@end