@interface SUCoreDevice
+ (id)sharedDevice;
- (BOOL)_hasSplatOnlyUpdateInstalled;
- (BOOL)_supportsAppleInternalVariant;
- (BOOL)_supportsCoreServices;
- (BOOL)_supportsFactoryVersion;
- (BOOL)_supportsMobileGestalt;
- (BOOL)_supportsPreservedFactoryVersion;
- (BOOL)_supportsRecoveryOS;
- (BOOL)_supportsRecoveryOSRestoreVersion;
- (BOOL)_supportsRecoveryOSSystemVersion;
- (BOOL)_supportsRestoreVersion;
- (BOOL)_supportsSFR;
- (BOOL)_supportsSFRRestoreVersion;
- (BOOL)_supportsSFRSystemVersion;
- (BOOL)_supportsSplat;
- (BOOL)_supportsSplatRestoreVersion;
- (BOOL)_supportsSplatSystemVersion;
- (BOOL)deviceSupportsAppleInternalVariant;
- (BOOL)deviceSupportsCoreServices;
- (BOOL)deviceSupportsFactoryVersion;
- (BOOL)deviceSupportsMobileGestalt;
- (BOOL)deviceSupportsMultiVolumeBoot;
- (BOOL)deviceSupportsPreservedFactoryVersion;
- (BOOL)deviceSupportsRecoveryOSRestoreVersion;
- (BOOL)deviceSupportsRecoveryOSSystemVersion;
- (BOOL)deviceSupportsRestoreVersion;
- (BOOL)deviceSupportsSFRRestoreVersion;
- (BOOL)deviceSupportsSFRSystemVersion;
- (BOOL)deviceSupportsSplatCryptex1RestoreVersion;
- (BOOL)deviceSupportsSplatCryptex1SystemVersion;
- (BOOL)deviceSupportsSplatRestoreVersion;
- (BOOL)deviceSupportsSplatRollbackRestoreVersion;
- (BOOL)deviceSupportsSplatRollbackSystemVersion;
- (BOOL)deviceSupportsSplatSystemVersion;
- (BOOL)hasBridgeOS;
- (BOOL)hasEligibleRollback;
- (BOOL)hasEmbeddedOS;
- (BOOL)hasRecoveryOS;
- (BOOL)hasSFR;
- (BOOL)hasSemiSplatActive;
- (BOOL)hasSplat;
- (BOOL)isBootedOSSecureInternal;
- (BOOL)isBridgeInternal;
- (BOOL)isCorrectlyFormattedBuildVersion:(id)a3;
- (BOOL)isCorrectlyFormattedProductVersion:(id)a3;
- (BOOL)isInternal;
- (BOOL)isMajorOSUpdate:(id)a3;
- (BOOL)isMinorOSUpdate:(id)a3;
- (BOOL)requiresDocAssetForUpdate;
- (NSDictionary)appleInternalVariantPlistContents;
- (NSDictionary)bridgeVersionPlistContents;
- (NSDictionary)factoryVersionPlistContents;
- (NSDictionary)preservedFactoryVersionPlistContents;
- (NSDictionary)recoveryOSRestoreVersionPlistContents;
- (NSDictionary)recoveryOSSystemVersionPlistContents;
- (NSDictionary)restoreVersionPlistContents;
- (NSDictionary)sfrRestoreVersionPlistContents;
- (NSDictionary)sfrSystemVersionPlistContents;
- (NSDictionary)splatCryptex1RestoreVersionPlistContents;
- (NSDictionary)splatCryptex1SystemVersionPlistContents;
- (NSDictionary)splatRestoreVersionPlistContents;
- (NSDictionary)splatRollbackRestoreVersionPlistContents;
- (NSDictionary)splatRollbackSystemVersionPlistContents;
- (NSDictionary)splatSystemVersionPlistContents;
- (NSDictionary)systemVersionPlistContents;
- (NSString)appleInternalVariantPlistPath;
- (NSString)bridgeBuildVersion;
- (NSString)bridgeRestoreVersion;
- (NSString)bridgeVersion;
- (NSString)bridgeVersionPlistPath;
- (NSString)buildVersion;
- (NSString)deviceBoardID;
- (NSString)deviceClass;
- (NSString)factoryRestoreVersion;
- (NSString)factoryVersionPlistPath;
- (NSString)hwModelString;
- (NSString)hwTarget;
- (NSString)marketingProductName;
- (NSString)preservedFactoryRestoreVersion;
- (NSString)preservedFactoryVersionPlistPath;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)recoveryOSBuildVersion;
- (NSString)recoveryOSProductVersion;
- (NSString)recoveryOSReleaseType;
- (NSString)recoveryOSRestoreVersion;
- (NSString)recoveryOSRestoreVersionPlistPath;
- (NSString)recoveryOSSystemVersionPlistPath;
- (NSString)releaseType;
- (NSString)restoreVersion;
- (NSString)restoreVersionPlistPath;
- (NSString)sfrBuildVersion;
- (NSString)sfrProductVersion;
- (NSString)sfrReleaseType;
- (NSString)sfrRestoreVersion;
- (NSString)sfrRestoreVersionPlistPath;
- (NSString)sfrSystemVersionPlistPath;
- (NSString)splatBuildVersion;
- (NSString)splatCryptex1BuildVersion;
- (NSString)splatCryptex1BuildVersionOverride;
- (NSString)splatCryptex1ProductVersion;
- (NSString)splatCryptex1ProductVersionExtra;
- (NSString)splatCryptex1ReleaseType;
- (NSString)splatCryptex1RestoreVersion;
- (NSString)splatCryptex1RestoreVersionPlistPath;
- (NSString)splatCryptex1SystemVersionPlistPath;
- (NSString)splatProductVersion;
- (NSString)splatProductVersionExtra;
- (NSString)splatReleaseType;
- (NSString)splatRestoreVersion;
- (NSString)splatRestoreVersionPlistPath;
- (NSString)splatRollbackBuildVersion;
- (NSString)splatRollbackProductVersion;
- (NSString)splatRollbackProductVersionExtra;
- (NSString)splatRollbackReleaseType;
- (NSString)splatRollbackRestoreVersion;
- (NSString)splatRollbackRestoreVersionPlistPath;
- (NSString)splatRollbackSystemVersionPlistPath;
- (NSString)splatSystemVersionPlistPath;
- (NSString)systemVersionPlistPath;
- (NSString)targetedSystemVolume;
- (__CFString)_gestaltKeyForQueryKey:(int64_t)a3;
- (id)_copyCoreServicesAppleInternalValue;
- (id)_copyCoreServicesValueForKey:(int64_t)a3;
- (id)_copyDeviceBoardID;
- (id)_copyFactoryVersionValueForKey:(int64_t)a3;
- (id)_copyGestaltValueForKey:(int64_t)a3;
- (id)_copyRecoveryOSRestoreVersionValueForKey:(int64_t)a3;
- (id)_copyRecoveryOSSystemVersionValueForKey:(int64_t)a3;
- (id)_copyRestoreVersionValueForKey:(int64_t)a3;
- (id)_copySFRRestoreVersionValueForKey:(int64_t)a3;
- (id)_copySFRSystemVersionValueForKey:(int64_t)a3;
- (id)_copySplatCryptex1RestoreVersionPath;
- (id)_copySplatCryptex1SystemVersionPath;
- (id)_copySplatCryptex1ValueForKey:(int64_t)a3;
- (id)_copySplatRollbackObjectsPath;
- (id)_copySplatRollbackRestoreVersionPath;
- (id)_copySplatRollbackSystemVersionPath;
- (id)_copySplatRollbackValueForKey:(int64_t)a3;
- (id)_copySplatValueForKey:(int64_t)a3;
- (id)_copyStringValueForKey:(int64_t)a3;
- (id)_copySysCtlValueForKey:(int64_t)a3;
- (id)_coreServicesKeyForQueryKey:(int64_t)a3;
- (id)_factoryVersionKeyForQueryKey:(int64_t)a3;
- (id)_factoryVersionPlistContentsForKey:(int64_t)a3;
- (id)_getMajorVersionFromBuildVersion:(id)a3;
- (id)_nameForQueryKey:(int64_t)a3;
- (id)_nameForQueryMethod:(int64_t)a3;
- (id)_restoreVersionKeyForQueryKey:(int64_t)a3;
- (id)_splatCryptex1VersionPlistContentsForKey:(int64_t)a3;
- (id)_splatRollbackVersionPlistContentsForKey:(int64_t)a3;
- (id)_splatVersionKeyForQueryKey:(int64_t)a3;
- (id)_splatVersionPlistContentsForKey:(int64_t)a3;
- (id)_sysCtlKeyForQueryKey:(int64_t)a3;
- (id)description;
- (id)getSystemRecoveryNSIHDirectory;
- (id)initTargetingSystemVolume:(id)a3;
- (id)summary;
- (int64_t)_queryMethodForKey:(int64_t)a3;
- (void)_copySplatCryptex1RestoreVersionPath;
- (void)_copySplatCryptex1SystemVersionPath;
- (void)_copySplatRollbackObjectsPath;
- (void)_initializeBridgeOSProperties;
- (void)_parseBridgeOSBuildInformationFromDevice:(id)a3;
- (void)_reloadPlistContentsForKey:(int64_t)a3;
- (void)adjustTargetingSystemVolume:(id)a3;
- (void)hasEligibleRollback;
- (void)reloadDevice;
- (void)setAppleInternalVariantPlistContents:(id)a3;
- (void)setAppleInternalVariantPlistPath:(id)a3;
- (void)setBridgeBuildVersion:(id)a3;
- (void)setBridgeRestoreVersion:(id)a3;
- (void)setBridgeVersion:(id)a3;
- (void)setBridgeVersionPlistContents:(id)a3;
- (void)setBridgeVersionPlistPath:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDeviceBoardID:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceSupportsAppleInternalVariant:(BOOL)a3;
- (void)setDeviceSupportsCoreServices:(BOOL)a3;
- (void)setDeviceSupportsFactoryVersion:(BOOL)a3;
- (void)setDeviceSupportsMobileGestalt:(BOOL)a3;
- (void)setDeviceSupportsMultiVolumeBoot:(BOOL)a3;
- (void)setDeviceSupportsPreservedFactoryVersion:(BOOL)a3;
- (void)setDeviceSupportsRecoveryOSRestoreVersion:(BOOL)a3;
- (void)setDeviceSupportsRecoveryOSSystemVersion:(BOOL)a3;
- (void)setDeviceSupportsRestoreVersion:(BOOL)a3;
- (void)setDeviceSupportsSFRRestoreVersion:(BOOL)a3;
- (void)setDeviceSupportsSFRSystemVersion:(BOOL)a3;
- (void)setDeviceSupportsSplatCryptex1RestoreVersion:(BOOL)a3;
- (void)setDeviceSupportsSplatCryptex1SystemVersion:(BOOL)a3;
- (void)setDeviceSupportsSplatRestoreVersion:(BOOL)a3;
- (void)setDeviceSupportsSplatRollbackRestoreVersion:(BOOL)a3;
- (void)setDeviceSupportsSplatRollbackSystemVersion:(BOOL)a3;
- (void)setDeviceSupportsSplatSystemVersion:(BOOL)a3;
- (void)setFactoryRestoreVersion:(id)a3;
- (void)setFactoryVersionPlistContents:(id)a3;
- (void)setFactoryVersionPlistPath:(id)a3;
- (void)setHasBridgeOS:(BOOL)a3;
- (void)setHasEmbeddedOS:(BOOL)a3;
- (void)setHasRecoveryOS:(BOOL)a3;
- (void)setHasSFR:(BOOL)a3;
- (void)setHasSplat:(BOOL)a3;
- (void)setHasSplatOnlyUpdateInstalled:(BOOL)a3;
- (void)setHwModelString:(id)a3;
- (void)setHwTarget:(id)a3;
- (void)setIsBootedOSSecureInternal:(BOOL)a3;
- (void)setIsBridgeInternal:(BOOL)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setMarketingProductName:(id)a3;
- (void)setPreservedFactoryRestoreVersion:(id)a3;
- (void)setPreservedFactoryVersionPlistContents:(id)a3;
- (void)setPreservedFactoryVersionPlistPath:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setRecoveryOSBuildVersion:(id)a3;
- (void)setRecoveryOSProductVersion:(id)a3;
- (void)setRecoveryOSReleaseType:(id)a3;
- (void)setRecoveryOSRestoreVersion:(id)a3;
- (void)setRecoveryOSRestoreVersionPlistContents:(id)a3;
- (void)setRecoveryOSRestoreVersionPlistPath:(id)a3;
- (void)setRecoveryOSSystemVersionPlistContents:(id)a3;
- (void)setRecoveryOSSystemVersionPlistPath:(id)a3;
- (void)setReleaseType:(id)a3;
- (void)setRestoreVersion:(id)a3;
- (void)setRestoreVersionPlistContents:(id)a3;
- (void)setRestoreVersionPlistPath:(id)a3;
- (void)setSfrBuildVersion:(id)a3;
- (void)setSfrProductVersion:(id)a3;
- (void)setSfrReleaseType:(id)a3;
- (void)setSfrRestoreVersion:(id)a3;
- (void)setSfrRestoreVersionPlistContents:(id)a3;
- (void)setSfrRestoreVersionPlistPath:(id)a3;
- (void)setSfrSystemVersionPlistContents:(id)a3;
- (void)setSfrSystemVersionPlistPath:(id)a3;
- (void)setSplatBuildVersion:(id)a3;
- (void)setSplatCryptex1BuildVersion:(id)a3;
- (void)setSplatCryptex1BuildVersionOverride:(id)a3;
- (void)setSplatCryptex1ProductVersion:(id)a3;
- (void)setSplatCryptex1ProductVersionExtra:(id)a3;
- (void)setSplatCryptex1ReleaseType:(id)a3;
- (void)setSplatCryptex1RestoreVersion:(id)a3;
- (void)setSplatCryptex1RestoreVersionPlistContents:(id)a3;
- (void)setSplatCryptex1RestoreVersionPlistPath:(id)a3;
- (void)setSplatCryptex1SystemVersionPlistContents:(id)a3;
- (void)setSplatCryptex1SystemVersionPlistPath:(id)a3;
- (void)setSplatProductVersion:(id)a3;
- (void)setSplatProductVersionExtra:(id)a3;
- (void)setSplatReleaseType:(id)a3;
- (void)setSplatRestoreVersion:(id)a3;
- (void)setSplatRestoreVersionPlistContents:(id)a3;
- (void)setSplatRestoreVersionPlistPath:(id)a3;
- (void)setSplatRollbackBuildVersion:(id)a3;
- (void)setSplatRollbackProductVersion:(id)a3;
- (void)setSplatRollbackProductVersionExtra:(id)a3;
- (void)setSplatRollbackReleaseType:(id)a3;
- (void)setSplatRollbackRestoreVersion:(id)a3;
- (void)setSplatRollbackRestoreVersionPlistContents:(id)a3;
- (void)setSplatRollbackRestoreVersionPlistPath:(id)a3;
- (void)setSplatRollbackSystemVersionPlistContents:(id)a3;
- (void)setSplatRollbackSystemVersionPlistPath:(id)a3;
- (void)setSplatSystemVersionPlistContents:(id)a3;
- (void)setSplatSystemVersionPlistPath:(id)a3;
- (void)setSystemVersionPlistContents:(id)a3;
- (void)setSystemVersionPlistPath:(id)a3;
- (void)setTargetedSystemVolume:(id)a3;
@end

@implementation SUCoreDevice

+ (id)sharedDevice
{
  if (sharedDevice_onceToken != -1) {
    dispatch_once(&sharedDevice_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedDevice___sharedDevice;
  return v2;
}

uint64_t __28__SUCoreDevice_sharedDevice__block_invoke()
{
  sharedDevice___sharedDevice = [[SUCoreDevice alloc] initTargetingSystemVolume:@"/"];
  return MEMORY[0x1F41817F8]();
}

- (id)initTargetingSystemVolume:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUCoreDevice;
  v5 = [(SUCoreDevice *)&v11 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_4;
  }
  if (v4)
  {
    [(SUCoreDevice *)v5 adjustTargetingSystemVolume:v4];
LABEL_4:
    v7 = v6;
    goto LABEL_8;
  }
  v8 = +[SUCoreLog sharedLogger];
  v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice initTargetingSystemVolume:]();
  }

  v7 = 0;
LABEL_8:

  return v7;
}

- (void)adjustTargetingSystemVolume:(id)a3
{
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(SUCoreDevice *)self setTargetedSystemVolume:v4];
    v5 = [v4 stringByAppendingPathComponent:@"/System/Library/CoreServices/"];
    v6 = [v5 stringByAppendingPathComponent:@"SystemVersion.plist"];
    [(SUCoreDevice *)self setSystemVersionPlistPath:v6];

    v7 = [v4 stringByAppendingPathComponent:@"/System/Library/CoreServices/"];
    v8 = [v7 stringByAppendingPathComponent:@"RestoreVersion.plist"];
    [(SUCoreDevice *)self setRestoreVersionPlistPath:v8];

    v9 = [v4 stringByAppendingPathComponent:@"/System/Library/CoreServices/"];
    v10 = [v9 stringByAppendingPathComponent:@"AppleInternalVariant.plist"];
    [(SUCoreDevice *)self setAppleInternalVariantPlistPath:v10];

    objc_super v11 = [@"/System/Volumes/iSCPreboot/SFR/current/" stringByAppendingPathComponent:@"SystemVersion.plist"];
    [(SUCoreDevice *)self setSfrSystemVersionPlistPath:v11];

    v12 = [@"/System/Volumes/iSCPreboot/SFR/current/" stringByAppendingPathComponent:@"RestoreVersion.plist"];
    [(SUCoreDevice *)self setSfrRestoreVersionPlistPath:v12];

    uint64_t v13 = [(SUCoreDevice *)self getSystemRecoveryNSIHDirectory];
    v14 = (void *)v13;
    v15 = @"/System/Volumes/iSCPreboot/SystemRecovery/current/";
    if (v13) {
      v15 = (__CFString *)v13;
    }
    v16 = v15;

    v17 = [v16 stringByAppendingPathComponent:@"SystemVersion.plist"];
    [(SUCoreDevice *)self setRecoveryOSSystemVersionPlistPath:v17];

    v18 = [v16 stringByAppendingPathComponent:@"RestoreVersion.plist"];
    [(SUCoreDevice *)self setRecoveryOSRestoreVersionPlistPath:v18];

    v19 = [@"/System/Volumes/Hardware/" stringByAppendingPathComponent:@"FactoryVersion.plist"];
    [(SUCoreDevice *)self setFactoryVersionPlistPath:v19];

    v20 = [@"/System/Volumes/Hardware/" stringByAppendingPathComponent:@"PreservedFactoryVersion.plist"];
    [(SUCoreDevice *)self setPreservedFactoryVersionPlistPath:v20];

    v21 = [v4 stringByAppendingPathComponent:@"/System/Cryptexes/OS/System/Library/CoreServices/"];
    v22 = [v21 stringByAppendingPathComponent:@"RestoreVersion.plist"];
    [(SUCoreDevice *)self setSplatRestoreVersionPlistPath:v22];

    v23 = [v4 stringByAppendingPathComponent:@"/System/Cryptexes/OS/System/Library/CoreServices/"];
    v24 = [v23 stringByAppendingPathComponent:@"SystemVersion.plist"];
    [(SUCoreDevice *)self setSplatSystemVersionPlistPath:v24];

    id v25 = [(SUCoreDevice *)self _copySplatRollbackRestoreVersionPath];
    [(SUCoreDevice *)self setSplatRollbackRestoreVersionPlistPath:v25];

    id v26 = [(SUCoreDevice *)self _copySplatRollbackSystemVersionPath];
    [(SUCoreDevice *)self setSplatRollbackSystemVersionPlistPath:v26];

    id v27 = [(SUCoreDevice *)self _copySplatCryptex1RestoreVersionPath];
    [(SUCoreDevice *)self setSplatCryptex1RestoreVersionPlistPath:v27];

    id v28 = [(SUCoreDevice *)self _copySplatCryptex1SystemVersionPath];
    [(SUCoreDevice *)self setSplatCryptex1SystemVersionPlistPath:v28];

    v29 = +[SUCoreLog sharedLogger];
    v30 = [v29 oslog];

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [(SUCoreDevice *)self systemVersionPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v31;
      _os_log_impl(&dword_1B4EC2000, v30, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using systemVersionPlistPath: %{public}@", buf, 0xCu);
    }
    v32 = +[SUCoreLog sharedLogger];
    v33 = [v32 oslog];

    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = [(SUCoreDevice *)self restoreVersionPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v34;
      _os_log_impl(&dword_1B4EC2000, v33, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using restoreVersionPlistPath: %{public}@", buf, 0xCu);
    }
    v35 = +[SUCoreLog sharedLogger];
    v36 = [v35 oslog];

    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = [(SUCoreDevice *)self appleInternalVariantPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v37;
      _os_log_impl(&dword_1B4EC2000, v36, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using appleInternalVariantPlistPath: %{public}@", buf, 0xCu);
    }
    v38 = +[SUCoreLog sharedLogger];
    v39 = [v38 oslog];

    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = [(SUCoreDevice *)self sfrSystemVersionPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v40;
      _os_log_impl(&dword_1B4EC2000, v39, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using sfrSystemVersionPlistPath: %{public}@", buf, 0xCu);
    }
    v41 = +[SUCoreLog sharedLogger];
    v42 = [v41 oslog];

    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = [(SUCoreDevice *)self sfrRestoreVersionPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v43;
      _os_log_impl(&dword_1B4EC2000, v42, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using sfrRestoreVersionPlistPath: %{public}@", buf, 0xCu);
    }
    v44 = +[SUCoreLog sharedLogger];
    v45 = [v44 oslog];

    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = [(SUCoreDevice *)self recoveryOSSystemVersionPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v46;
      _os_log_impl(&dword_1B4EC2000, v45, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using recoveryOSSystemVersionPlistPath: %{public}@", buf, 0xCu);
    }
    v47 = +[SUCoreLog sharedLogger];
    v48 = [v47 oslog];

    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = [(SUCoreDevice *)self recoveryOSRestoreVersionPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v49;
      _os_log_impl(&dword_1B4EC2000, v48, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using recoveryOSRestoreVersionPlistPath: %{public}@", buf, 0xCu);
    }
    v50 = +[SUCoreLog sharedLogger];
    v51 = [v50 oslog];

    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = [(SUCoreDevice *)self factoryVersionPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v52;
      _os_log_impl(&dword_1B4EC2000, v51, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using factoryVersionPlistPath: %{public}@", buf, 0xCu);
    }
    v53 = +[SUCoreLog sharedLogger];
    v54 = [v53 oslog];

    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = [(SUCoreDevice *)self preservedFactoryVersionPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v55;
      _os_log_impl(&dword_1B4EC2000, v54, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using preservedFactoryVersionPlistPath: %{public}@", buf, 0xCu);
    }
    v56 = +[SUCoreLog sharedLogger];
    v57 = [v56 oslog];

    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = [(SUCoreDevice *)self splatRestoreVersionPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v58;
      _os_log_impl(&dword_1B4EC2000, v57, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using splatRestoreVersionPlistPath: %{public}@", buf, 0xCu);
    }
    v59 = +[SUCoreLog sharedLogger];
    v60 = [v59 oslog];

    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v61 = [(SUCoreDevice *)self splatSystemVersionPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v61;
      _os_log_impl(&dword_1B4EC2000, v60, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using splatSystemVersionPlistPath: %{public}@", buf, 0xCu);
    }
    v62 = +[SUCoreLog sharedLogger];
    v63 = [v62 oslog];

    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      v64 = [(SUCoreDevice *)self splatRollbackRestoreVersionPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v64;
      _os_log_impl(&dword_1B4EC2000, v63, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using splatRollbackRestoreVersionPlistPath: %{public}@", buf, 0xCu);
    }
    v65 = +[SUCoreLog sharedLogger];
    v66 = [v65 oslog];

    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = [(SUCoreDevice *)self splatRollbackSystemVersionPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v67;
      _os_log_impl(&dword_1B4EC2000, v66, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using splatRollbackSystemVersionPlistPath: %{public}@", buf, 0xCu);
    }
    v68 = +[SUCoreLog sharedLogger];
    v69 = [v68 oslog];

    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = [(SUCoreDevice *)self splatCryptex1RestoreVersionPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v70;
      _os_log_impl(&dword_1B4EC2000, v69, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using splatCryptex1RestoreVersionPlistPath: %{public}@", buf, 0xCu);
    }
    v71 = +[SUCoreLog sharedLogger];
    v72 = [v71 oslog];

    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      v73 = [(SUCoreDevice *)self splatCryptex1SystemVersionPlistPath];
      *(_DWORD *)buf = 138543362;
      id v173 = v73;
      _os_log_impl(&dword_1B4EC2000, v72, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Using splatCryptex1SystemVersionPlistPath: %{public}@", buf, 0xCu);
    }
    [(SUCoreDevice *)self setDeviceSupportsMobileGestalt:[(SUCoreDevice *)self _supportsMobileGestalt]];
    [(SUCoreDevice *)self setDeviceSupportsCoreServices:[(SUCoreDevice *)self _supportsCoreServices]];
    [(SUCoreDevice *)self setDeviceSupportsAppleInternalVariant:[(SUCoreDevice *)self _supportsAppleInternalVariant]];
    [(SUCoreDevice *)self setDeviceSupportsRestoreVersion:[(SUCoreDevice *)self _supportsRestoreVersion]];
    [(SUCoreDevice *)self setDeviceSupportsSFRSystemVersion:[(SUCoreDevice *)self _supportsSFRSystemVersion]];
    [(SUCoreDevice *)self setDeviceSupportsSFRRestoreVersion:[(SUCoreDevice *)self _supportsSFRRestoreVersion]];
    [(SUCoreDevice *)self setDeviceSupportsRecoveryOSSystemVersion:[(SUCoreDevice *)self _supportsRecoveryOSSystemVersion]];
    [(SUCoreDevice *)self setDeviceSupportsRecoveryOSRestoreVersion:[(SUCoreDevice *)self _supportsRecoveryOSRestoreVersion]];
    [(SUCoreDevice *)self setDeviceSupportsFactoryVersion:[(SUCoreDevice *)self _supportsFactoryVersion]];
    [(SUCoreDevice *)self setDeviceSupportsPreservedFactoryVersion:[(SUCoreDevice *)self _supportsPreservedFactoryVersion]];
    [(SUCoreDevice *)self setDeviceSupportsSplatRestoreVersion:[(SUCoreDevice *)self _supportsSplatRestoreVersion]];
    [(SUCoreDevice *)self setDeviceSupportsSplatSystemVersion:[(SUCoreDevice *)self _supportsSplatSystemVersion]];
    [(SUCoreDevice *)self setDeviceSupportsMultiVolumeBoot:0];
    [(SUCoreDevice *)self setSystemVersionPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsCoreServices])
    {
      id v74 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v75 = [(SUCoreDevice *)self systemVersionPlistPath];
      v76 = (void *)[v74 initWithContentsOfFile:v75];
      [(SUCoreDevice *)self setSystemVersionPlistContents:v76];
    }
    [(SUCoreDevice *)self setRestoreVersionPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsRestoreVersion])
    {
      id v77 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v78 = [(SUCoreDevice *)self restoreVersionPlistPath];
      v79 = (void *)[v77 initWithContentsOfFile:v78];
      [(SUCoreDevice *)self setRestoreVersionPlistContents:v79];
    }
    [(SUCoreDevice *)self setSfrSystemVersionPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsSFRSystemVersion])
    {
      id v80 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v81 = [(SUCoreDevice *)self sfrSystemVersionPlistPath];
      v82 = (void *)[v80 initWithContentsOfFile:v81];
      [(SUCoreDevice *)self setSfrSystemVersionPlistContents:v82];
    }
    [(SUCoreDevice *)self setSfrRestoreVersionPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsSFRRestoreVersion])
    {
      id v83 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v84 = [(SUCoreDevice *)self sfrRestoreVersionPlistPath];
      v85 = (void *)[v83 initWithContentsOfFile:v84];
      [(SUCoreDevice *)self setSfrRestoreVersionPlistContents:v85];
    }
    [(SUCoreDevice *)self setRecoveryOSSystemVersionPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsRecoveryOSRestoreVersion])
    {
      id v86 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v87 = [(SUCoreDevice *)self recoveryOSSystemVersionPlistPath];
      v88 = (void *)[v86 initWithContentsOfFile:v87];
      [(SUCoreDevice *)self setRecoveryOSSystemVersionPlistContents:v88];
    }
    [(SUCoreDevice *)self setRecoveryOSRestoreVersionPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsRecoveryOSRestoreVersion])
    {
      id v89 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v90 = [(SUCoreDevice *)self recoveryOSRestoreVersionPlistPath];
      v91 = (void *)[v89 initWithContentsOfFile:v90];
      [(SUCoreDevice *)self setRecoveryOSRestoreVersionPlistContents:v91];
    }
    [(SUCoreDevice *)self setFactoryVersionPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsFactoryVersion])
    {
      id v92 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v93 = [(SUCoreDevice *)self factoryVersionPlistPath];
      v94 = (void *)[v92 initWithContentsOfFile:v93];
      [(SUCoreDevice *)self setFactoryVersionPlistContents:v94];
    }
    [(SUCoreDevice *)self setPreservedFactoryVersionPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsPreservedFactoryVersion])
    {
      id v95 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v96 = [(SUCoreDevice *)self preservedFactoryVersionPlistPath];
      v97 = (void *)[v95 initWithContentsOfFile:v96];
      [(SUCoreDevice *)self setPreservedFactoryVersionPlistContents:v97];
    }
    [(SUCoreDevice *)self setAppleInternalVariantPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsCoreServices])
    {
      id v98 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v99 = [(SUCoreDevice *)self appleInternalVariantPlistPath];
      v100 = (void *)[v98 initWithContentsOfFile:v99];
      [(SUCoreDevice *)self setAppleInternalVariantPlistContents:v100];
    }
    [(SUCoreDevice *)self setSplatRestoreVersionPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsSplatRestoreVersion])
    {
      id v101 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v102 = [(SUCoreDevice *)self splatRestoreVersionPlistPath];
      v103 = (void *)[v101 initWithContentsOfFile:v102];
      [(SUCoreDevice *)self setSplatRestoreVersionPlistContents:v103];
    }
    [(SUCoreDevice *)self setSplatSystemVersionPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsSplatSystemVersion])
    {
      id v104 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v105 = [(SUCoreDevice *)self splatSystemVersionPlistPath];
      v106 = (void *)[v104 initWithContentsOfFile:v105];
      [(SUCoreDevice *)self setSplatSystemVersionPlistContents:v106];
    }
    [(SUCoreDevice *)self setSplatRollbackRestoreVersionPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsSplatRollbackRestoreVersion])
    {
      id v107 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v108 = [(SUCoreDevice *)self splatRollbackRestoreVersionPlistPath];
      v109 = (void *)[v107 initWithContentsOfFile:v108];
      [(SUCoreDevice *)self setSplatRollbackRestoreVersionPlistContents:v109];
    }
    [(SUCoreDevice *)self setSplatRollbackSystemVersionPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsSplatRollbackSystemVersion])
    {
      id v110 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v111 = [(SUCoreDevice *)self splatRollbackSystemVersionPlistPath];
      v112 = (void *)[v110 initWithContentsOfFile:v111];
      [(SUCoreDevice *)self setSplatRollbackSystemVersionPlistContents:v112];
    }
    [(SUCoreDevice *)self setSplatCryptex1RestoreVersionPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsSplatCryptex1RestoreVersion])
    {
      id v113 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v114 = [(SUCoreDevice *)self splatCryptex1RestoreVersionPlistPath];
      v115 = (void *)[v113 initWithContentsOfFile:v114];
      [(SUCoreDevice *)self setSplatCryptex1RestoreVersionPlistContents:v115];
    }
    [(SUCoreDevice *)self setSplatCryptex1SystemVersionPlistContents:0];
    if ([(SUCoreDevice *)self deviceSupportsSplatCryptex1SystemVersion])
    {
      id v116 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v117 = [(SUCoreDevice *)self splatCryptex1SystemVersionPlistPath];
      v118 = (void *)[v116 initWithContentsOfFile:v117];
      [(SUCoreDevice *)self setSplatCryptex1SystemVersionPlistContents:v118];
    }
    id v119 = [(SUCoreDevice *)self _copyStringValueForKey:1];
    [(SUCoreDevice *)self setBuildVersion:v119];

    id v120 = [(SUCoreDevice *)self _copyStringValueForKey:2];
    [(SUCoreDevice *)self setProductVersion:v120];

    id v121 = [(SUCoreDevice *)self _copyStringValueForKey:3];
    [(SUCoreDevice *)self setHwModelString:v121];

    id v122 = [(SUCoreDevice *)self _copyStringValueForKey:5];
    [(SUCoreDevice *)self setDeviceClass:v122];

    id v123 = [(SUCoreDevice *)self _copyStringValueForKey:6];
    [(SUCoreDevice *)self setMarketingProductName:v123];

    id v124 = [(SUCoreDevice *)self _copyStringValueForKey:7];
    [(SUCoreDevice *)self setProductType:v124];

    id v125 = [(SUCoreDevice *)self _copyStringValueForKey:8];
    [(SUCoreDevice *)self setReleaseType:v125];

    id v126 = [(SUCoreDevice *)self _copyDeviceBoardID];
    [(SUCoreDevice *)self setDeviceBoardID:v126];

    id v127 = [(SUCoreDevice *)self _copyStringValueForKey:4];
    [(SUCoreDevice *)self setHwTarget:v127];

    [(SUCoreDevice *)self setRestoreVersion:0];
    if ([(SUCoreDevice *)self deviceSupportsRestoreVersion])
    {
      id v128 = [(SUCoreDevice *)self _copyStringValueForKey:9];
      id v129 = [(SUCoreDevice *)self _copyStringValueForKey:10];
      v130 = [NSString stringWithFormat:@"%@,%@", v128, v129];
      [(SUCoreDevice *)self setRestoreVersion:v130];
    }
    v131 = [(SUCoreDevice *)self releaseType];
    -[SUCoreDevice setIsInternal:](self, "setIsInternal:", [v131 isEqualToString:@"Internal"]);

    v132 = +[SUCore sharedCore];
    id v133 = [v132 commonDomain];
    [v133 UTF8String];
    [(SUCoreDevice *)self setIsBootedOSSecureInternal:os_variant_has_internal_content()];

    [(SUCoreDevice *)self setHasEmbeddedOS:0];
    [(SUCoreDevice *)self setHasBridgeOS:0];
    [(SUCoreDevice *)self setBridgeRestoreVersion:0];
    [(SUCoreDevice *)self setBridgeBuildVersion:0];
    [(SUCoreDevice *)self setIsBridgeInternal:0];
    [(SUCoreDevice *)self setHasSFR:[(SUCoreDevice *)self _supportsSFR]];
    [(SUCoreDevice *)self setSfrRestoreVersion:0];
    [(SUCoreDevice *)self setSfrBuildVersion:0];
    [(SUCoreDevice *)self setSfrProductVersion:0];
    [(SUCoreDevice *)self setSfrReleaseType:0];
    if ([(SUCoreDevice *)self hasSFR])
    {
      id v134 = [(SUCoreDevice *)self _copyStringValueForKey:14];
      id v135 = [(SUCoreDevice *)self _copyStringValueForKey:15];
      v136 = v135;
      if (v134 && v135)
      {
        v137 = [NSString stringWithFormat:@"%@,%@", v134, v135];
        [(SUCoreDevice *)self setSfrRestoreVersion:v137];
      }
      else
      {
        v139 = +[SUCoreLog sharedLogger];
        v137 = [v139 oslog];

        if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR)) {
          -[SUCoreDevice adjustTargetingSystemVolume:]();
        }
      }

      id v140 = [(SUCoreDevice *)self _copyStringValueForKey:11];
      [(SUCoreDevice *)self setSfrBuildVersion:v140];

      id v141 = [(SUCoreDevice *)self _copyStringValueForKey:12];
      [(SUCoreDevice *)self setSfrProductVersion:v141];

      id v142 = [(SUCoreDevice *)self _copyStringValueForKey:13];
      [(SUCoreDevice *)self setSfrReleaseType:v142];
    }
    [(SUCoreDevice *)self setHasRecoveryOS:[(SUCoreDevice *)self _supportsRecoveryOS]];
    [(SUCoreDevice *)self setRecoveryOSBuildVersion:0];
    [(SUCoreDevice *)self setRecoveryOSProductVersion:0];
    [(SUCoreDevice *)self setRecoveryOSRestoreVersion:0];
    [(SUCoreDevice *)self setRecoveryOSReleaseType:0];
    if ([(SUCoreDevice *)self hasRecoveryOS])
    {
      id v143 = [(SUCoreDevice *)self _copyStringValueForKey:19];
      id v144 = [(SUCoreDevice *)self _copyStringValueForKey:20];
      v145 = v144;
      if (v143 && v144)
      {
        v146 = [NSString stringWithFormat:@"%@,%@", v143, v144];
        [(SUCoreDevice *)self setRecoveryOSRestoreVersion:v146];
      }
      else
      {
        v147 = +[SUCoreLog sharedLogger];
        v146 = [v147 oslog];

        if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
          -[SUCoreDevice adjustTargetingSystemVolume:]();
        }
      }

      id v148 = [(SUCoreDevice *)self _copyStringValueForKey:16];
      [(SUCoreDevice *)self setRecoveryOSBuildVersion:v148];

      id v149 = [(SUCoreDevice *)self _copyStringValueForKey:17];
      [(SUCoreDevice *)self setRecoveryOSProductVersion:v149];

      id v150 = [(SUCoreDevice *)self _copyStringValueForKey:18];
      [(SUCoreDevice *)self setRecoveryOSReleaseType:v150];
    }
    [(SUCoreDevice *)self setFactoryRestoreVersion:0];
    if ([(SUCoreDevice *)self deviceSupportsFactoryVersion])
    {
      id v151 = [(SUCoreDevice *)self _copyStringValueForKey:21];
      [(SUCoreDevice *)self setFactoryRestoreVersion:v151];
    }
    [(SUCoreDevice *)self setPreservedFactoryRestoreVersion:0];
    if ([(SUCoreDevice *)self deviceSupportsPreservedFactoryVersion])
    {
      id v152 = [(SUCoreDevice *)self _copyStringValueForKey:22];
      [(SUCoreDevice *)self setPreservedFactoryRestoreVersion:v152];
    }
    [(SUCoreDevice *)self setHasSplat:[(SUCoreDevice *)self _supportsSplat]];
    [(SUCoreDevice *)self setSplatRestoreVersion:0];
    [(SUCoreDevice *)self setSplatProductVersion:0];
    [(SUCoreDevice *)self setSplatBuildVersion:0];
    [(SUCoreDevice *)self setSplatReleaseType:0];
    [(SUCoreDevice *)self setSplatProductVersionExtra:0];
    [(SUCoreDevice *)self setSplatRollbackRestoreVersion:0];
    [(SUCoreDevice *)self setSplatRollbackProductVersion:0];
    [(SUCoreDevice *)self setSplatRollbackBuildVersion:0];
    [(SUCoreDevice *)self setSplatRollbackReleaseType:0];
    [(SUCoreDevice *)self setSplatRollbackProductVersionExtra:0];
    [(SUCoreDevice *)self setSplatCryptex1RestoreVersion:0];
    [(SUCoreDevice *)self setSplatCryptex1ProductVersion:0];
    [(SUCoreDevice *)self setSplatCryptex1BuildVersion:0];
    [(SUCoreDevice *)self setSplatCryptex1BuildVersionOverride:0];
    [(SUCoreDevice *)self setSplatCryptex1ReleaseType:0];
    [(SUCoreDevice *)self setSplatCryptex1ProductVersionExtra:0];
    [(SUCoreDevice *)self setHasSplatOnlyUpdateInstalled:0];
    if ([(SUCoreDevice *)self hasSplat])
    {
      id v153 = [(SUCoreDevice *)self _copyStringValueForKey:23];
      [(SUCoreDevice *)self setSplatRestoreVersion:v153];

      id v154 = [(SUCoreDevice *)self _copyStringValueForKey:24];
      [(SUCoreDevice *)self setSplatProductVersion:v154];

      id v155 = [(SUCoreDevice *)self _copyStringValueForKey:25];
      [(SUCoreDevice *)self setSplatBuildVersion:v155];

      id v156 = [(SUCoreDevice *)self _copyStringValueForKey:26];
      [(SUCoreDevice *)self setSplatReleaseType:v156];

      id v157 = [(SUCoreDevice *)self _copyStringValueForKey:27];
      [(SUCoreDevice *)self setSplatProductVersionExtra:v157];

      id v158 = [(SUCoreDevice *)self _copyStringValueForKey:28];
      [(SUCoreDevice *)self setSplatRollbackRestoreVersion:v158];

      id v159 = [(SUCoreDevice *)self _copyStringValueForKey:29];
      [(SUCoreDevice *)self setSplatRollbackProductVersion:v159];

      id v160 = [(SUCoreDevice *)self _copyStringValueForKey:31];
      [(SUCoreDevice *)self setSplatRollbackBuildVersion:v160];

      id v161 = [(SUCoreDevice *)self _copyStringValueForKey:32];
      [(SUCoreDevice *)self setSplatRollbackReleaseType:v161];

      id v162 = [(SUCoreDevice *)self _copyStringValueForKey:30];
      [(SUCoreDevice *)self setSplatRollbackProductVersionExtra:v162];

      id v163 = [(SUCoreDevice *)self _copyStringValueForKey:33];
      [(SUCoreDevice *)self setSplatCryptex1RestoreVersion:v163];

      id v164 = [(SUCoreDevice *)self _copyStringValueForKey:34];
      [(SUCoreDevice *)self setSplatCryptex1ProductVersion:v164];

      id v165 = [(SUCoreDevice *)self _copyStringValueForKey:36];
      [(SUCoreDevice *)self setSplatCryptex1BuildVersion:v165];

      id v166 = [(SUCoreDevice *)self _copyStringValueForKey:37];
      [(SUCoreDevice *)self setSplatCryptex1BuildVersionOverride:v166];

      id v167 = [(SUCoreDevice *)self _copyStringValueForKey:38];
      [(SUCoreDevice *)self setSplatCryptex1ReleaseType:v167];

      id v168 = [(SUCoreDevice *)self _copyStringValueForKey:35];
      [(SUCoreDevice *)self setSplatCryptex1ProductVersionExtra:v168];

      [(SUCoreDevice *)self setHasSplatOnlyUpdateInstalled:[(SUCoreDevice *)self _hasSplatOnlyUpdateInstalled]];
    }
    [(SUCoreDevice *)self _adjustValuesForMacOS];
    v169 = +[SUCoreLog sharedLogger];
    v170 = [v169 oslog];

    if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
    {
      id v171 = [(SUCoreDevice *)self description];
      *(_DWORD *)buf = 138543362;
      id v173 = v171;
      _os_log_impl(&dword_1B4EC2000, v170, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Initialized new device: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v138 = +[SUCoreLog sharedLogger];
    v16 = [v138 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice adjustTargetingSystemVolume:]();
    }
  }
}

- (NSDictionary)splatRollbackRestoreVersionPlistContents
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [(SUCoreDevice *)v2 splatRollbackRestoreVersionPlistPath];
  uint64_t v5 = [v3 initWithContentsOfFile:v4];
  splatRollbackRestoreVersionPlistContents = v2->_splatRollbackRestoreVersionPlistContents;
  v2->_splatRollbackRestoreVersionPlistContents = (NSDictionary *)v5;

  objc_sync_exit(v2);
  v7 = v2->_splatRollbackRestoreVersionPlistContents;
  return v7;
}

- (NSDictionary)splatRollbackSystemVersionPlistContents
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [(SUCoreDevice *)v2 splatRollbackSystemVersionPlistPath];
  uint64_t v5 = [v3 initWithContentsOfFile:v4];
  splatRollbackSystemVersionPlistContents = v2->_splatRollbackSystemVersionPlistContents;
  v2->_splatRollbackSystemVersionPlistContents = (NSDictionary *)v5;

  objc_sync_exit(v2);
  v7 = v2->_splatRollbackSystemVersionPlistContents;
  return v7;
}

- (NSDictionary)splatCryptex1RestoreVersionPlistContents
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [(SUCoreDevice *)v2 splatCryptex1RestoreVersionPlistPath];
  uint64_t v5 = [v3 initWithContentsOfFile:v4];
  splatCryptex1RestoreVersionPlistContents = v2->_splatCryptex1RestoreVersionPlistContents;
  v2->_splatCryptex1RestoreVersionPlistContents = (NSDictionary *)v5;

  objc_sync_exit(v2);
  v7 = v2->_splatCryptex1RestoreVersionPlistContents;
  return v7;
}

- (NSDictionary)splatCryptex1SystemVersionPlistContents
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [(SUCoreDevice *)v2 splatCryptex1SystemVersionPlistPath];
  uint64_t v5 = [v3 initWithContentsOfFile:v4];
  splatCryptex1SystemVersionPlistContents = v2->_splatCryptex1SystemVersionPlistContents;
  v2->_splatCryptex1SystemVersionPlistContents = (NSDictionary *)v5;

  objc_sync_exit(v2);
  v7 = v2->_splatCryptex1SystemVersionPlistContents;
  return v7;
}

- (NSString)splatRestoreVersion
{
  v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:23];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:23];
  splatRestoreVersion = v2->_splatRestoreVersion;
  v2->_splatRestoreVersion = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatRestoreVersion;
  return v5;
}

- (NSString)splatProductVersion
{
  v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:24];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:24];
  splatProductVersion = v2->_splatProductVersion;
  v2->_splatProductVersion = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatProductVersion;
  return v5;
}

- (NSString)splatBuildVersion
{
  v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:25];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:25];
  splatBuildVersion = v2->_splatBuildVersion;
  v2->_splatBuildVersion = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatBuildVersion;
  return v5;
}

- (NSString)splatReleaseType
{
  v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:26];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:26];
  splatReleaseType = v2->_splatReleaseType;
  v2->_splatReleaseType = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatReleaseType;
  return v5;
}

- (NSString)splatProductVersionExtra
{
  v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:27];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:27];
  splatProductVersionExtra = v2->_splatProductVersionExtra;
  v2->_splatProductVersionExtra = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatProductVersionExtra;
  return v5;
}

- (void)reloadDevice
{
  id v3 = [(SUCoreDevice *)self targetedSystemVolume];
  [(SUCoreDevice *)self adjustTargetingSystemVolume:v3];
}

- (BOOL)isCorrectlyFormattedBuildVersion:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x1E4F28FD8];
  id v4 = a3;
  uint64_t v5 = [v3 regularExpressionWithPattern:@"^([0-9]+)[a-zA-Z]([0-9]+)[a-z]?$" options:0 error:0];
  v6 = objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  BOOL v7 = v6 != 0;
  return v7;
}

- (BOOL)isCorrectlyFormattedProductVersion:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x1E4F28FD8];
  id v4 = a3;
  uint64_t v5 = [v3 regularExpressionWithPattern:@"^([0-9]+).([0-9]+)(.[0-9]+)?$" options:0 error:0];
  v6 = objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  BOOL v7 = v6 != 0;
  return v7;
}

- (BOOL)isMinorOSUpdate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SUCoreDevice *)self buildVersion];
  v6 = [(SUCoreDevice *)self _getMajorVersionFromBuildVersion:v5];

  BOOL v7 = [(SUCoreDevice *)self _getMajorVersionFromBuildVersion:v4];

  v8 = +[SUCoreLog sharedLogger];
  v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v6 intValue];
    int v11 = [v7 intValue];
    int v12 = [v6 intValue];
    int v13 = [v7 intValue];
    v14 = @"NO";
    v18[0] = 67109634;
    v18[1] = v10;
    if (v12 == v13) {
      v14 = @"YES";
    }
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 2114;
    v22 = v14;
    _os_log_impl(&dword_1B4EC2000, v9, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Build version comparison found current version %d, build version %d, isMinorOSUpdate: %{public}@", (uint8_t *)v18, 0x18u);
  }

  BOOL v15 = 0;
  if (v6 && v7)
  {
    int v16 = [v6 intValue];
    BOOL v15 = v16 == [v7 intValue];
  }

  return v15;
}

- (BOOL)isMajorOSUpdate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SUCoreDevice *)self buildVersion];
  v6 = [(SUCoreDevice *)self _getMajorVersionFromBuildVersion:v5];

  BOOL v7 = [(SUCoreDevice *)self _getMajorVersionFromBuildVersion:v4];

  v8 = +[SUCoreLog sharedLogger];
  v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v6 intValue];
    int v11 = [v7 intValue];
    int v12 = [v6 intValue];
    int v13 = [v7 intValue];
    v14 = @"NO";
    v18[0] = 67109634;
    v18[1] = v10;
    if (v12 < v13) {
      v14 = @"YES";
    }
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 2114;
    v22 = v14;
    _os_log_impl(&dword_1B4EC2000, v9, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Build version comparison found current version %d, build version %d, isMajorOSUpdate: %{public}@", (uint8_t *)v18, 0x18u);
  }

  BOOL v15 = 0;
  if (v6 && v7)
  {
    int v16 = [v6 intValue];
    BOOL v15 = v16 < (int)[v7 intValue];
  }

  return v15;
}

- (id)_getMajorVersionFromBuildVersion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^([0-9]+).*" options:0 error:0];
    uint64_t v5 = -[NSObject firstMatchInString:options:range:](v4, "firstMatchInString:options:range:", v3, 0, 0, [v3 length]);
    v6 = v5;
    if (v5 && [v5 numberOfRanges])
    {
      uint64_t v7 = [v6 rangeAtIndex:1];
      v9 = objc_msgSend(v3, "substringWithRange:", v7, v8);
    }
    else
    {
      int v10 = +[SUCoreLog sharedLogger];
      int v11 = [v10 oslog];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDevice _getMajorVersionFromBuildVersion:]();
      }

      v9 = 0;
    }
  }
  else
  {
    int v12 = +[SUCoreLog sharedLogger];
    id v4 = [v12 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice _getMajorVersionFromBuildVersion:]();
    }
    v9 = 0;
  }

  return v9;
}

- (id)_copySplatCryptex1SystemVersionPath
{
  v2 = [MEMORY[0x1E4F73A20] sharedDataAccessor];
  id v9 = 0;
  id v3 = (void *)[v2 copyPathForPersistentData:115 error:&v9];
  id v4 = v9;

  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[SUCoreLog sharedLogger];
    uint64_t v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice _copySplatCryptex1SystemVersionPath]();
    }
  }
  return v3;
}

- (id)_copySplatCryptex1RestoreVersionPath
{
  v2 = [MEMORY[0x1E4F73A20] sharedDataAccessor];
  id v9 = 0;
  id v3 = (void *)[v2 copyPathForPersistentData:116 error:&v9];
  id v4 = v9;

  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[SUCoreLog sharedLogger];
    uint64_t v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice _copySplatCryptex1RestoreVersionPath]();
    }
  }
  return v3;
}

- (id)_copySplatRollbackObjectsPath
{
  v2 = [MEMORY[0x1E4F73A20] sharedDataAccessor];
  id v9 = 0;
  id v3 = (void *)[v2 copyPathForPersistentData:112 error:&v9];
  id v4 = v9;

  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[SUCoreLog sharedLogger];
    uint64_t v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice _copySplatRollbackObjectsPath]();
    }
  }
  return v3;
}

- (id)_copySplatRollbackSystemVersionPath
{
  id v2 = [(SUCoreDevice *)self _copySplatRollbackObjectsPath];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 stringByAppendingPathComponent:@"SystemVersion.plist"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_copySplatRollbackRestoreVersionPath
{
  id v2 = [(SUCoreDevice *)self _copySplatRollbackObjectsPath];
  if (v2) {
    id v3 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v2, @"RestoreVersion.plist"];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)hasSemiSplatActive
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (![(SUCoreDevice *)self hasSplat])
  {
    BOOL v20 = 0;
    __int16 v19 = @"Splat is not supported on this platform; semi-splat is not possible";
    goto LABEL_17;
  }
  uint64_t v3 = [(SUCoreDevice *)self splatRestoreVersion];
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = (void *)v3;
  uint64_t v5 = [(SUCoreDevice *)self splatCryptex1RestoreVersion];
  if (!v5)
  {

LABEL_9:
    uint64_t v21 = [(SUCoreDevice *)self splatRestoreVersion];
    if (!v21
      || (v22 = (void *)v21,
          [(SUCoreDevice *)self splatCryptex1RestoreVersion],
          uint64_t v23 = objc_claimAutoreleasedReturnValue(),
          v23,
          v22,
          !v23))
    {
      id v25 = [NSString alloc];
      v14 = [(SUCoreDevice *)self splatRestoreVersion];
      BOOL v15 = [(SUCoreDevice *)self splatCryptex1RestoreVersion];
      __int16 v19 = (__CFString *)[v25 initWithFormat:@"One of Splat RestoreVersion (%@) or Cryptex1 RestoreVersion (%@) are not present", v14, v15];
      goto LABEL_13;
    }
    id v24 = [NSString alloc];
    v14 = [(SUCoreDevice *)self splatRestoreVersion];
    BOOL v15 = [(SUCoreDevice *)self splatCryptex1RestoreVersion];
    __int16 v19 = (__CFString *)[v24 initWithFormat:@"Splat RestoreVersion (%@) and Cryptex1 RestoreVersion (%@) are not equal", v14, v15];
LABEL_15:
    BOOL v20 = 1;
    goto LABEL_16;
  }
  v6 = (void *)v5;
  uint64_t v7 = [(SUCoreDevice *)self splatRestoreVersion];
  uint64_t v8 = [(SUCoreDevice *)self splatCryptex1RestoreVersion];
  BOOL v9 = +[SUCore stringIsEqual:v7 to:v8];

  if (!v9) {
    goto LABEL_9;
  }
  int v10 = [(SUCoreDevice *)self splatProductVersionExtra];
  int v11 = [(SUCoreDevice *)self splatCryptex1ProductVersionExtra];
  BOOL v12 = +[SUCore stringIsEqual:v10 to:v11];

  id v13 = [NSString alloc];
  v14 = [(SUCoreDevice *)self splatRestoreVersion];
  BOOL v15 = [(SUCoreDevice *)self splatProductVersionExtra];
  int v16 = [(SUCoreDevice *)self splatCryptex1RestoreVersion];
  uint64_t v17 = [(SUCoreDevice *)self splatCryptex1ProductVersionExtra];
  v18 = (void *)v17;
  if (!v12)
  {
    __int16 v19 = (__CFString *)objc_msgSend(v13, "initWithFormat:", @"Splat ProductVersionExtra (%@; %@) and Cryptex1 ProductVersionExtra (%@; %@) are not equal",
                          v14,
                          v15,
                          v16,
                          v17);

    goto LABEL_15;
  }
  __int16 v19 = (__CFString *)objc_msgSend(v13, "initWithFormat:", @"Splat RestoreVersion (%@; %@) and Cryptex1 RestoreVersion (%@; %@) are equal",
                        v14,
                        v15,
                        v16,
                        v17);

LABEL_13:
  BOOL v20 = 0;
LABEL_16:

LABEL_17:
  id v26 = +[SUCoreLog sharedLogger];
  id v27 = [v26 oslog];

  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = @"NO";
    if (v20) {
      id v28 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    v31 = v28;
    __int16 v32 = 2114;
    v33 = v19;
    _os_log_impl(&dword_1B4EC2000, v27, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Semi-splat active: %{public}@ (%{public}@)", buf, 0x16u);
  }

  return v20;
}

- (BOOL)hasEligibleRollback
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [(SUCoreDevice *)self _copySplatRollbackObjectsPath];
  if (v2)
  {
    char v12 = 0;
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v4 = [v3 fileExistsAtPath:v2 isDirectory:&v12];
    if (v12) {
      LODWORD(v5) = v4;
    }
    else {
      LODWORD(v5) = 0;
    }

    v6 = +[SUCoreLog sharedLogger];
    uint64_t v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = @"NO";
      if (v5) {
        BOOL v9 = @"YES";
      }
      else {
        BOOL v9 = @"NO";
      }
      *(_DWORD *)buf = 138543874;
      id v14 = v2;
      __int16 v15 = 2114;
      if (v12) {
        uint64_t v8 = @"YES";
      }
      int v16 = v9;
      __int16 v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_1B4EC2000, v7, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] Checking if rollback objects are present in preboot at path: %{public}@, exists: %{public}@, isDir: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    int v10 = +[SUCoreLog sharedLogger];
    uint64_t v5 = [v10 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice hasEligibleRollback]();
    }

    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (NSString)splatRollbackRestoreVersion
{
  id v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:28];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:28];
  splatRollbackRestoreVersion = v2->_splatRollbackRestoreVersion;
  v2->_splatRollbackRestoreVersion = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatRollbackRestoreVersion;
  return v5;
}

- (NSString)splatRollbackProductVersion
{
  id v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:29];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:29];
  splatRollbackProductVersion = v2->_splatRollbackProductVersion;
  v2->_splatRollbackProductVersion = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatRollbackProductVersion;
  return v5;
}

- (NSString)splatRollbackProductVersionExtra
{
  id v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:30];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:30];
  splatRollbackProductVersionExtra = v2->_splatRollbackProductVersionExtra;
  v2->_splatRollbackProductVersionExtra = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatRollbackProductVersionExtra;
  return v5;
}

- (NSString)splatRollbackBuildVersion
{
  id v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:31];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:31];
  splatRollbackBuildVersion = v2->_splatRollbackBuildVersion;
  v2->_splatRollbackBuildVersion = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatRollbackBuildVersion;
  return v5;
}

- (NSString)splatRollbackReleaseType
{
  id v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:32];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:32];
  splatRollbackReleaseType = v2->_splatRollbackReleaseType;
  v2->_splatRollbackReleaseType = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatRollbackReleaseType;
  return v5;
}

- (NSString)splatCryptex1RestoreVersion
{
  id v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:33];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:33];
  splatCryptex1RestoreVersion = v2->_splatCryptex1RestoreVersion;
  v2->_splatCryptex1RestoreVersion = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatCryptex1RestoreVersion;
  return v5;
}

- (NSString)splatCryptex1ProductVersion
{
  id v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:34];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:34];
  splatCryptex1ProductVersion = v2->_splatCryptex1ProductVersion;
  v2->_splatCryptex1ProductVersion = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatCryptex1ProductVersion;
  return v5;
}

- (NSString)splatCryptex1ProductVersionExtra
{
  id v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:35];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:35];
  splatCryptex1ProductVersionExtra = v2->_splatCryptex1ProductVersionExtra;
  v2->_splatCryptex1ProductVersionExtra = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatCryptex1ProductVersionExtra;
  return v5;
}

- (NSString)splatCryptex1BuildVersion
{
  id v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:36];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:36];
  splatCryptex1BuildVersion = v2->_splatCryptex1BuildVersion;
  v2->_splatCryptex1BuildVersion = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatCryptex1BuildVersion;
  return v5;
}

- (NSString)splatCryptex1BuildVersionOverride
{
  id v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:37];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:37];
  splatCryptex1BuildVersionOverride = v2->_splatCryptex1BuildVersionOverride;
  v2->_splatCryptex1BuildVersionOverride = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatCryptex1BuildVersionOverride;
  return v5;
}

- (NSString)splatCryptex1ReleaseType
{
  id v2 = self;
  objc_sync_enter(v2);
  [(SUCoreDevice *)v2 _reloadPlistContentsForKey:38];
  uint64_t v3 = [(SUCoreDevice *)v2 _copyStringValueForKey:38];
  splatCryptex1ReleaseType = v2->_splatCryptex1ReleaseType;
  v2->_splatCryptex1ReleaseType = (NSString *)v3;

  objc_sync_exit(v2);
  uint64_t v5 = v2->_splatCryptex1ReleaseType;
  return v5;
}

- (BOOL)_supportsMobileGestalt
{
  return 1;
}

- (BOOL)_supportsCoreServices
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [(SUCoreDevice *)self systemVersionPlistPath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsAppleInternalVariant
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [(SUCoreDevice *)self appleInternalVariantPlistPath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsRestoreVersion
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [(SUCoreDevice *)self restoreVersionPlistPath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsSFRSystemVersion
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [(SUCoreDevice *)self sfrSystemVersionPlistPath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsSFRRestoreVersion
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [(SUCoreDevice *)self sfrRestoreVersionPlistPath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsSFR
{
  return 0;
}

- (BOOL)_supportsRecoveryOSSystemVersion
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [(SUCoreDevice *)self recoveryOSSystemVersionPlistPath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsRecoveryOSRestoreVersion
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [(SUCoreDevice *)self recoveryOSRestoreVersionPlistPath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsFactoryVersion
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [(SUCoreDevice *)self factoryVersionPlistPath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsPreservedFactoryVersion
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [(SUCoreDevice *)self preservedFactoryVersionPlistPath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsSplatRestoreVersion
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [(SUCoreDevice *)self splatRestoreVersionPlistPath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsSplatSystemVersion
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [(SUCoreDevice *)self splatSystemVersionPlistPath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)_supportsRecoveryOS
{
  return 0;
}

- (BOOL)_supportsSplat
{
  return 1;
}

- (BOOL)_hasSplatOnlyUpdateInstalled
{
  uint64_t v3 = [(SUCoreDevice *)self splatProductVersionExtra];

  if (v3) {
    return 1;
  }
  char v5 = [SUCoreRestoreVersion alloc];
  v6 = [(SUCoreDevice *)self restoreVersion];
  uint64_t v7 = [(SUCoreRestoreVersion *)v5 initWithRestoreVersion:v6];

  uint64_t v8 = [SUCoreRestoreVersion alloc];
  BOOL v9 = [(SUCoreDevice *)self splatRestoreVersion];
  int v10 = [(SUCoreRestoreVersion *)v8 initWithRestoreVersion:v9];

  BOOL v4 = [(SUCoreRestoreVersion *)v7 isComparable:v10]
    && [(SUCoreRestoreVersion *)v7 compare:v10] == -1;

  return v4;
}

- (BOOL)requiresDocAssetForUpdate
{
  id v2 = [(SUCoreDevice *)self deviceClass];
  char v3 = [v2 isEqualToString:@"AppleTV"];

  return v3 ^ 1;
}

- (id)_copyDeviceBoardID
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_initializeBridgeOSProperties
{
  if (MEMORY[0x1E4F95E28]) {
    BOOL v2 = MEMORY[0x1E4F95E30] == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2 || MEMORY[0x1E4F95E18] == 0 || MEMORY[0x1E4F95E40] == 0)
  {
    char v5 = +[SUCoreLog sharedLogger];
    uint64_t v7 = [v5 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4EC2000, v7, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] RemoteServiceDiscovery methods are not available on this platform (initializeBridgeOSProperties)", buf, 2u);
    }
  }
  else
  {
    uint64_t v7 = remote_device_copy_unique_of_type();
    if (*__error() == 35)
    {
      uint64_t v8 = remote_device_copy_unique_of_type();

      uint64_t v7 = v8;
    }
    if (v7)
    {
      BOOL v9 = +[SUCoreLog sharedLogger];
      int v10 = [v9 oslog];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v17 = 0;
        _os_log_impl(&dword_1B4EC2000, v10, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] RemoteServiceDiscovery indicates that this is a T2 bridgeOS device via REMOTE_DEVICE_TYPE_BRIDGE_COPROC (initializeBridgeOSProperties)", v17, 2u);
      }

      [(SUCoreDevice *)self setHasBridgeOS:1];
LABEL_26:
      [(SUCoreDevice *)self _parseBridgeOSBuildInformationFromDevice:v7];
      goto LABEL_27;
    }
    uint64_t v7 = remote_device_copy_unique_of_type();
    if (*__error() == 35)
    {
      uint64_t v11 = remote_device_copy_unique_of_type();

      uint64_t v7 = v11;
    }
    char v12 = +[SUCoreLog sharedLogger];
    id v13 = [v12 oslog];

    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v14)
      {
        *(_WORD *)int v16 = 0;
        _os_log_impl(&dword_1B4EC2000, v13, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] RemoteServiceDiscovery indicates that this is a T1 bridgeOS device via REMOTE_DEVICE_TYPE_EOS (initializeBridgeOSProperties)", v16, 2u);
      }

      [(SUCoreDevice *)self setHasEmbeddedOS:1];
      goto LABEL_26;
    }
    if (v14)
    {
      *(_WORD *)__int16 v15 = 0;
      _os_log_impl(&dword_1B4EC2000, v13, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] RemoteServiceDiscovery indicates that this is not a bridgeOS device (initializeBridgeOSProperties)", v15, 2u);
    }
    uint64_t v7 = v13;
  }
LABEL_27:
}

- (void)_parseBridgeOSBuildInformationFromDevice:(id)a3
{
  id v10 = a3;
  uint64_t v4 = remote_device_copy_bridge_version_string();
  if (v4)
  {
    char v5 = (void *)v4;
    v6 = (void *)[[NSString alloc] initWithUTF8String:v4];
    [(SUCoreDevice *)self setBridgeRestoreVersion:v6];

    free(v5);
  }
  uint64_t v7 = remote_device_copy_os_build();
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    BOOL v9 = (void *)[[NSString alloc] initWithUTF8String:v7];
    [(SUCoreDevice *)self setBridgeBuildVersion:v9];

    free(v8);
  }
  [(SUCoreDevice *)self setIsBridgeInternal:remote_device_copy_internal_build()];
}

- (id)getSystemRecoveryNSIHDirectory
{
  BOOL v2 = +[SUCoreLog sharedLogger];
  char v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_1B4EC2000, v3, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] SystemRecoveryNSIH: Device does not support variable boot policy", v5, 2u);
  }

  return 0;
}

- (void)_reloadPlistContentsForKey:(int64_t)a3
{
  switch(a3)
  {
    case 23:
      id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v13 = [(SUCoreDevice *)self splatRestoreVersionPlistPath];
      char v5 = (void *)[v10 initWithContentsOfFile:v13];
      [(SUCoreDevice *)self setSplatRestoreVersionPlistContents:v5];
      goto LABEL_11;
    case 24:
    case 25:
    case 26:
    case 27:
      id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v13 = [(SUCoreDevice *)self splatSystemVersionPlistPath];
      char v5 = (void *)[v6 initWithContentsOfFile:v13];
      [(SUCoreDevice *)self setSplatSystemVersionPlistContents:v5];
      goto LABEL_11;
    case 28:
      id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v13 = [(SUCoreDevice *)self splatRollbackRestoreVersionPlistPath];
      char v5 = (void *)[v11 initWithContentsOfFile:v13];
      [(SUCoreDevice *)self setSplatRollbackRestoreVersionPlistContents:v5];
      goto LABEL_11;
    case 29:
    case 30:
    case 31:
    case 32:
      id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v13 = [(SUCoreDevice *)self splatRollbackSystemVersionPlistPath];
      char v5 = (void *)[v7 initWithContentsOfFile:v13];
      [(SUCoreDevice *)self setSplatRollbackSystemVersionPlistContents:v5];
      goto LABEL_11;
    case 33:
      id v12 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v13 = [(SUCoreDevice *)self splatCryptex1RestoreVersionPlistPath];
      char v5 = (void *)[v12 initWithContentsOfFile:v13];
      [(SUCoreDevice *)self setSplatCryptex1RestoreVersionPlistContents:v5];
      goto LABEL_11;
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
      id v4 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v13 = [(SUCoreDevice *)self splatCryptex1SystemVersionPlistPath];
      char v5 = (void *)[v4 initWithContentsOfFile:v13];
      [(SUCoreDevice *)self setSplatCryptex1SystemVersionPlistContents:v5];
LABEL_11:

      break;
    default:
      uint64_t v8 = +[SUCoreLog sharedLogger];
      BOOL v9 = [v8 oslog];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDevice _reloadPlistContentsForKey:]();
      }

      break;
  }
}

- (id)_copyStringValueForKey:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t v5 = -[SUCoreDevice _queryMethodForKey:](self, "_queryMethodForKey:");
  switch(v5)
  {
    case 1:
      id result = [(SUCoreDevice *)self _copyGestaltValueForKey:a3];
      break;
    case 2:
      id result = [(SUCoreDevice *)self _copyCoreServicesValueForKey:a3];
      break;
    case 3:
      id result = [(SUCoreDevice *)self _copyCoreServicesAppleInternalValue];
      break;
    case 4:
      id result = [(SUCoreDevice *)self _copyRestoreVersionValueForKey:a3];
      break;
    case 5:
      id result = [(SUCoreDevice *)self _copySysCtlValueForKey:a3];
      break;
    case 6:
      id result = [(SUCoreDevice *)self _copySFRSystemVersionValueForKey:a3];
      break;
    case 7:
      id result = [(SUCoreDevice *)self _copySFRRestoreVersionValueForKey:a3];
      break;
    case 8:
      id result = [(SUCoreDevice *)self _copyRecoveryOSSystemVersionValueForKey:a3];
      break;
    case 9:
      id result = [(SUCoreDevice *)self _copyRecoveryOSRestoreVersionValueForKey:a3];
      break;
    case 10:
      id result = [(SUCoreDevice *)self _copyFactoryVersionValueForKey:a3];
      break;
    case 11:
      id result = [(SUCoreDevice *)self _copySplatValueForKey:a3];
      break;
    case 12:
      id result = [(SUCoreDevice *)self _copySplatRollbackValueForKey:a3];
      break;
    case 13:
      id result = [(SUCoreDevice *)self _copySplatCryptex1ValueForKey:a3];
      break;
    default:
      int64_t v7 = v5;
      uint64_t v8 = +[SUCoreLog sharedLogger];
      BOOL v9 = [v8 oslog];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [(SUCoreDevice *)self _nameForQueryMethod:v7];
        id v11 = [(SUCoreDevice *)self _nameForQueryKey:a3];
        int v12 = 138543618;
        id v13 = v10;
        __int16 v14 = 2114;
        __int16 v15 = v11;
        _os_log_error_impl(&dword_1B4EC2000, v9, OS_LOG_TYPE_ERROR, "[SUCoreDevice] Unsupported query method %{public}@ attempted for key %{public}@", (uint8_t *)&v12, 0x16u);
      }
      id result = 0;
      break;
  }
  return result;
}

- (int64_t)_queryMethodForKey:(int64_t)a3
{
  int64_t v3 = a3;
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
    case 2:
      if ([(SUCoreDevice *)self deviceSupportsMultiVolumeBoot]) {
        int64_t v3 = 2;
      }
      else {
        int64_t v3 = 1;
      }
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      int64_t v3 = 1;
      break;
    case 4:
      int64_t v3 = 5;
      break;
    case 8:
      if ([(SUCoreDevice *)self deviceSupportsMultiVolumeBoot]) {
        int64_t v3 = 3;
      }
      else {
        int64_t v3 = 1;
      }
      break;
    case 9:
    case 10:
      int64_t v3 = 4;
      break;
    case 11:
    case 12:
    case 13:
      int64_t v3 = 6;
      break;
    case 14:
    case 15:
      int64_t v3 = 7;
      break;
    case 16:
    case 17:
    case 18:
      int64_t v3 = 8;
      break;
    case 19:
    case 20:
      int64_t v3 = 9;
      break;
    case 21:
    case 22:
      int64_t v3 = 10;
      break;
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
      int64_t v3 = 11;
      break;
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
      int64_t v3 = 12;
      break;
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
      int64_t v3 = 13;
      break;
    default:
      id v4 = +[SUCoreLog sharedLogger];
      int64_t v5 = [v4 oslog];

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDevice _queryMethodForKey:]();
      }

      int64_t v3 = 0;
      break;
  }
  return v3;
}

- (id)_copyGestaltValueForKey:(int64_t)a3
{
  [(SUCoreDevice *)self _gestaltKeyForQueryKey:a3];
  return (id)MGCopyAnswer();
}

- (id)_copyCoreServicesValueForKey:(int64_t)a3
{
  id v4 = [(SUCoreDevice *)self _coreServicesKeyForQueryKey:a3];
  int64_t v5 = [(SUCoreDevice *)self systemVersionPlistContents];
  id v6 = [v5 safeStringForKey:v4];
  int64_t v7 = (void *)[v6 copy];

  return v7;
}

- (id)_copyRestoreVersionValueForKey:(int64_t)a3
{
  id v4 = [(SUCoreDevice *)self _restoreVersionKeyForQueryKey:a3];
  int64_t v5 = [(SUCoreDevice *)self restoreVersionPlistContents];
  id v6 = [v5 safeStringForKey:v4];
  int64_t v7 = (void *)[v6 copy];

  return v7;
}

- (id)_copyCoreServicesAppleInternalValue
{
  BOOL v2 = [(SUCoreDevice *)self appleInternalVariantPlistContents];
  uint64_t v3 = [v2 safeULLForKey:@"AppleInternal"];

  if (v3 != 1) {
    return 0;
  }
  id v4 = [NSString alloc];
  return (id)[v4 initWithString:@"Internal"];
}

- (id)_copySysCtlValueForKey:(int64_t)a3
{
  [(SUCoreDevice *)self _sysCtlKeyForQueryKey:a3];
  size_t v12 = 0;
  id v3 = objc_claimAutoreleasedReturnValue();
  if (sysctlbyname((const char *)[v3 UTF8String], 0, &v12, 0, 0)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v12 == 0;
  }
  if (v4)
  {
    int64_t v5 = +[SUCoreLog sharedLogger];
    id v6 = [v5 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice _copySysCtlValueForKey:]();
    }

    int64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = malloc_type_calloc(v12 + 1, 1uLL, 0x2685F0D0uLL);
    if (sysctlbyname((const char *)[v3 UTF8String], v8, &v12, 0, 0))
    {
      BOOL v9 = +[SUCoreLog sharedLogger];
      id v10 = [v9 oslog];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDevice _copySysCtlValueForKey:]();
      }

      int64_t v7 = 0;
    }
    else
    {
      int64_t v7 = [NSString stringWithUTF8String:v8];
    }
    free(v8);
  }

  return v7;
}

- (id)_copySFRSystemVersionValueForKey:(int64_t)a3
{
  BOOL v4 = [(SUCoreDevice *)self _coreServicesKeyForQueryKey:a3];
  int64_t v5 = [(SUCoreDevice *)self sfrSystemVersionPlistContents];
  id v6 = [v5 safeStringForKey:v4];
  int64_t v7 = (void *)[v6 copy];

  return v7;
}

- (id)_copySFRRestoreVersionValueForKey:(int64_t)a3
{
  BOOL v4 = [(SUCoreDevice *)self _restoreVersionKeyForQueryKey:a3];
  int64_t v5 = [(SUCoreDevice *)self sfrRestoreVersionPlistContents];
  id v6 = [v5 safeStringForKey:v4];
  int64_t v7 = (void *)[v6 copy];

  return v7;
}

- (id)_copyRecoveryOSSystemVersionValueForKey:(int64_t)a3
{
  BOOL v4 = [(SUCoreDevice *)self _coreServicesKeyForQueryKey:a3];
  int64_t v5 = [(SUCoreDevice *)self recoveryOSSystemVersionPlistContents];
  id v6 = [v5 safeStringForKey:v4];
  int64_t v7 = (void *)[v6 copy];

  return v7;
}

- (id)_copyFactoryVersionValueForKey:(int64_t)a3
{
  int64_t v5 = -[SUCoreDevice _factoryVersionKeyForQueryKey:](self, "_factoryVersionKeyForQueryKey:");
  id v6 = [(SUCoreDevice *)self _factoryVersionPlistContentsForKey:a3];
  int64_t v7 = [v6 safeStringForKey:v5];
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

- (id)_copyRecoveryOSRestoreVersionValueForKey:(int64_t)a3
{
  BOOL v4 = [(SUCoreDevice *)self _restoreVersionKeyForQueryKey:a3];
  int64_t v5 = [(SUCoreDevice *)self recoveryOSRestoreVersionPlistContents];
  id v6 = [v5 safeStringForKey:v4];
  int64_t v7 = (void *)[v6 copy];

  return v7;
}

- (id)_copySplatValueForKey:(int64_t)a3
{
  int64_t v5 = -[SUCoreDevice _splatVersionKeyForQueryKey:](self, "_splatVersionKeyForQueryKey:");
  id v6 = [(SUCoreDevice *)self _splatVersionPlistContentsForKey:a3];
  int64_t v7 = [v6 safeStringForKey:v5];
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

- (id)_copySplatRollbackValueForKey:(int64_t)a3
{
  int64_t v5 = -[SUCoreDevice _splatVersionKeyForQueryKey:](self, "_splatVersionKeyForQueryKey:");
  id v6 = [(SUCoreDevice *)self _splatRollbackVersionPlistContentsForKey:a3];
  int64_t v7 = [v6 safeStringForKey:v5];
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

- (id)_copySplatCryptex1ValueForKey:(int64_t)a3
{
  int64_t v5 = -[SUCoreDevice _splatVersionKeyForQueryKey:](self, "_splatVersionKeyForQueryKey:");
  id v6 = [(SUCoreDevice *)self _splatCryptex1VersionPlistContentsForKey:a3];
  int64_t v7 = [v6 safeStringForKey:v5];
  uint64_t v8 = (void *)[v7 copy];

  return v8;
}

- (__CFString)_gestaltKeyForQueryKey:(int64_t)a3
{
  int64_t v3 = a3 - 1;
  if (unint64_t)(a3 - 1) < 8 && ((0xF7u >> v3)) {
    return off_1E60B7028[v3];
  }
  BOOL v4 = +[SUCoreLog sharedLogger];
  int64_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice _gestaltKeyForQueryKey:]();
  }

  return 0;
}

- (id)_coreServicesKeyForQueryKey:(int64_t)a3
{
  int64_t v3 = a3 - 1;
  if (unint64_t)(a3 - 1) < 0x12 && ((0x39C03u >> v3)) {
    return off_1E60B7068[v3];
  }
  BOOL v4 = +[SUCoreLog sharedLogger];
  int64_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice _coreServicesKeyForQueryKey:]();
  }

  return 0;
}

- (id)_restoreVersionKeyForQueryKey:(int64_t)a3
{
  int64_t v3 = a3 - 9;
  if (unint64_t)(a3 - 9) < 0xC && ((0xC63u >> v3)) {
    return off_1E60B70F8[v3];
  }
  BOOL v4 = +[SUCoreLog sharedLogger];
  int64_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice _restoreVersionKeyForQueryKey:]();
  }

  return 0;
}

- (id)_factoryVersionKeyForQueryKey:(int64_t)a3
{
  if ((unint64_t)(a3 - 21) < 2) {
    return @"RestoreLongVersion";
  }
  BOOL v4 = +[SUCoreLog sharedLogger];
  int64_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice _factoryVersionKeyForQueryKey:]();
  }

  return 0;
}

- (id)_factoryVersionPlistContentsForKey:(int64_t)a3
{
  if (a3 == 22)
  {
    int64_t v3 = [(SUCoreDevice *)self preservedFactoryVersionPlistContents];
  }
  else if (a3 == 21)
  {
    int64_t v3 = [(SUCoreDevice *)self factoryVersionPlistContents];
  }
  else
  {
    BOOL v4 = +[SUCoreLog sharedLogger];
    int64_t v5 = [v4 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice _factoryVersionPlistContentsForKey:]();
    }

    int64_t v3 = 0;
  }
  return v3;
}

- (id)_sysCtlKeyForQueryKey:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      return @"hw.model";
    case 7:
      return @"hw.product";
    case 4:
      return @"hw.target";
  }
  BOOL v4 = +[SUCoreLog sharedLogger];
  int64_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice _sysCtlKeyForQueryKey:]();
  }

  return 0;
}

- (id)_splatVersionKeyForQueryKey:(int64_t)a3
{
  if ((unint64_t)(a3 - 23) < 0x10) {
    return off_1E60B7158[a3 - 23];
  }
  BOOL v4 = +[SUCoreLog sharedLogger];
  int64_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice _splatVersionKeyForQueryKey:]();
  }

  return 0;
}

- (id)_splatVersionPlistContentsForKey:(int64_t)a3
{
  if ((unint64_t)(a3 - 24) >= 4)
  {
    if (a3 == 23)
    {
      int64_t v3 = [(SUCoreDevice *)self splatRestoreVersionPlistContents];
    }
    else
    {
      BOOL v4 = +[SUCoreLog sharedLogger];
      int64_t v5 = [v4 oslog];

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDevice _splatVersionPlistContentsForKey:]();
      }

      int64_t v3 = 0;
    }
  }
  else
  {
    int64_t v3 = [(SUCoreDevice *)self splatSystemVersionPlistContents];
  }
  return v3;
}

- (id)_splatRollbackVersionPlistContentsForKey:(int64_t)a3
{
  if ((unint64_t)(a3 - 29) >= 4)
  {
    if (a3 == 28)
    {
      int64_t v3 = [(SUCoreDevice *)self splatRollbackRestoreVersionPlistContents];
    }
    else
    {
      BOOL v4 = +[SUCoreLog sharedLogger];
      int64_t v5 = [v4 oslog];

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDevice _splatRollbackVersionPlistContentsForKey:]();
      }

      int64_t v3 = 0;
    }
  }
  else
  {
    int64_t v3 = [(SUCoreDevice *)self splatRollbackSystemVersionPlistContents];
  }
  return v3;
}

- (id)_splatCryptex1VersionPlistContentsForKey:(int64_t)a3
{
  if ((unint64_t)(a3 - 34) >= 5)
  {
    if (a3 == 33)
    {
      int64_t v3 = [(SUCoreDevice *)self splatCryptex1RestoreVersionPlistContents];
    }
    else
    {
      int64_t v5 = +[SUCoreLog sharedLogger];
      id v6 = [v5 oslog];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SUCoreDevice _splatCryptex1VersionPlistContentsForKey:]();
      }

      int64_t v3 = 0;
    }
  }
  else
  {
    int64_t v3 = [(SUCoreDevice *)self splatCryptex1SystemVersionPlistContents];
  }
  return v3;
}

- (id)_nameForQueryMethod:(int64_t)a3
{
  if ((unint64_t)a3 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownQueryMethod(%ld)", a3);
    int64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int64_t v3 = off_1E60B71D8[a3];
  }
  return v3;
}

- (id)_nameForQueryKey:(int64_t)a3
{
  if ((unint64_t)a3 >= 0x27)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownQueryKey(%ld)", a3);
    int64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int64_t v3 = off_1E60B7248[a3];
  }
  return v3;
}

- (id)description
{
  id v60 = (id)NSString;
  v82 = [(SUCoreDevice *)self targetedSystemVolume];
  if ([(SUCoreDevice *)self deviceSupportsMobileGestalt]) {
    int64_t v3 = @"YES";
  }
  else {
    int64_t v3 = @"NO";
  }
  v59 = v3;
  if ([(SUCoreDevice *)self deviceSupportsCoreServices]) {
    BOOL v4 = @"YES";
  }
  else {
    BOOL v4 = @"NO";
  }
  v58 = v4;
  if ([(SUCoreDevice *)self deviceSupportsAppleInternalVariant]) {
    int64_t v5 = @"YES";
  }
  else {
    int64_t v5 = @"NO";
  }
  v57 = v5;
  if ([(SUCoreDevice *)self deviceSupportsRestoreVersion]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  v56 = v6;
  if ([(SUCoreDevice *)self deviceSupportsSFRSystemVersion]) {
    int64_t v7 = @"YES";
  }
  else {
    int64_t v7 = @"NO";
  }
  v55 = v7;
  if ([(SUCoreDevice *)self deviceSupportsSFRRestoreVersion]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  v54 = v8;
  if ([(SUCoreDevice *)self deviceSupportsMultiVolumeBoot]) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  v53 = v9;
  if ([(SUCoreDevice *)self deviceSupportsSplatRestoreVersion]) {
    id v10 = @"YES";
  }
  else {
    id v10 = @"NO";
  }
  v52 = v10;
  if ([(SUCoreDevice *)self deviceSupportsSplatSystemVersion]) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  v51 = v11;
  v81 = [(SUCoreDevice *)self buildVersion];
  id v80 = [(SUCoreDevice *)self productVersion];
  v78 = [(SUCoreDevice *)self hwModelString];
  v79 = [(SUCoreDevice *)self deviceClass];
  id v77 = [(SUCoreDevice *)self marketingProductName];
  v76 = [(SUCoreDevice *)self productType];
  id v74 = [(SUCoreDevice *)self releaseType];
  v75 = [(SUCoreDevice *)self deviceBoardID];
  v73 = [(SUCoreDevice *)self hwTarget];
  if ([(SUCoreDevice *)self isInternal]) {
    size_t v12 = @"YES";
  }
  else {
    size_t v12 = @"NO";
  }
  v50 = v12;
  if ([(SUCoreDevice *)self isBootedOSSecureInternal]) {
    id v13 = @"YES";
  }
  else {
    id v13 = @"NO";
  }
  v49 = v13;
  v72 = [(SUCoreDevice *)self restoreVersion];
  if ([(SUCoreDevice *)self hasEmbeddedOS]) {
    __int16 v14 = @"YES";
  }
  else {
    __int16 v14 = @"NO";
  }
  v48 = v14;
  if ([(SUCoreDevice *)self hasBridgeOS]) {
    __int16 v15 = @"YES";
  }
  else {
    __int16 v15 = @"NO";
  }
  v47 = v15;
  v71 = [(SUCoreDevice *)self bridgeBuildVersion];
  v70 = [(SUCoreDevice *)self bridgeRestoreVersion];
  if ([(SUCoreDevice *)self isBridgeInternal]) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  v45 = v16;
  if ([(SUCoreDevice *)self hasSFR]) {
    __int16 v17 = @"YES";
  }
  else {
    __int16 v17 = @"NO";
  }
  v46 = v17;
  v69 = [(SUCoreDevice *)self sfrProductVersion];
  v66 = [(SUCoreDevice *)self sfrBuildVersion];
  v68 = [(SUCoreDevice *)self sfrRestoreVersion];
  v67 = [(SUCoreDevice *)self sfrReleaseType];
  if ([(SUCoreDevice *)self hasRecoveryOS]) {
    v18 = @"YES";
  }
  else {
    v18 = @"NO";
  }
  v41 = v18;
  v63 = [(SUCoreDevice *)self recoveryOSProductVersion];
  v65 = [(SUCoreDevice *)self recoveryOSBuildVersion];
  v64 = [(SUCoreDevice *)self recoveryOSRestoreVersion];
  v44 = [(SUCoreDevice *)self recoveryOSReleaseType];
  v43 = [(SUCoreDevice *)self factoryRestoreVersion];
  v42 = [(SUCoreDevice *)self preservedFactoryRestoreVersion];
  if ([(SUCoreDevice *)self hasSplat]) {
    uint64_t v19 = @"YES";
  }
  else {
    uint64_t v19 = @"NO";
  }
  v36 = v19;
  if ([(SUCoreDevice *)self hasSplatOnlyUpdateInstalled]) {
    BOOL v20 = @"YES";
  }
  else {
    BOOL v20 = @"NO";
  }
  v33 = v20;
  v62 = [(SUCoreDevice *)self splatRestoreVersion];
  v40 = [(SUCoreDevice *)self splatProductVersion];
  v39 = [(SUCoreDevice *)self splatProductVersionExtra];
  v38 = [(SUCoreDevice *)self splatBuildVersion];
  v37 = [(SUCoreDevice *)self splatReleaseType];
  if ([(SUCoreDevice *)self hasEligibleRollback]) {
    uint64_t v21 = @"YES";
  }
  else {
    uint64_t v21 = @"NO";
  }
  v22 = [(SUCoreDevice *)self splatRollbackRestoreVersion];
  v35 = [(SUCoreDevice *)self splatRollbackProductVersion];
  uint64_t v34 = [(SUCoreDevice *)self splatRollbackProductVersionExtra];
  __int16 v32 = [(SUCoreDevice *)self splatRollbackBuildVersion];
  uint64_t v23 = [(SUCoreDevice *)self splatRollbackReleaseType];
  if ([(SUCoreDevice *)self hasSemiSplatActive]) {
    id v24 = @"YES";
  }
  else {
    id v24 = @"NO";
  }
  v31 = [(SUCoreDevice *)self splatCryptex1RestoreVersion];
  v30 = [(SUCoreDevice *)self splatCryptex1ProductVersion];
  v29 = [(SUCoreDevice *)self splatCryptex1ProductVersionExtra];
  id v28 = [(SUCoreDevice *)self splatCryptex1BuildVersion];
  id v27 = [(SUCoreDevice *)self splatCryptex1BuildVersionOverride];
  id v26 = [(SUCoreDevice *)self splatCryptex1ReleaseType];
  objc_msgSend(v60, "stringWithFormat:", @"\n[>>>\n               targetedSystemVolume: %@\n        deviceSupportsMobileGestalt: %@\n         deviceSupportsCoreServices: %@\n deviceSupportsAppleInternalVariant: %@\n       deviceSupportsRestoreVersion: %@\n     deviceSupportsSFRSystemVersion: %@\n    deviceSupportsSFRRestoreVersion: %@\n      deviceSupportsMultiVolumeBoot: %@\n  deviceSupportsSplatRestoreVersion: %@\n   deviceSupportsSplatSystemVersion: %@\n                       buildVersion: %@\n                     productVersion: %@\n                      hwModelString: %@\n                        deviceClass: %@\n               marketingProductName: %@\n                        productType: %@\n                        releaseType: %@\n                      deviceBoardID: %@\n                           hwTarget: %@\n                         isInternal: %@\n           isBootedOSSecureInternal: %@\n                     restoreVersion: %@\n                      hasEmbeddedOS: %@\n                        hasBridgeOS: %@\n                 bridgeBuildVersion: %@\n               bridgeRestoreVersion: %@\n                   isBridgeInternal: %@\n                             hasSFR: %@\n                  sfrProductVersion: %@\n                    sfrBuildVersion: %@\n                  sfrRestoreVersion: %@\n                     sfrReleaseType: %@\n                      hasRecoveryOS: %@\n           recoveryOSProductVersion: %@\n             recoveryOSBuildVersion: %@\n           recoveryOSRestoreVersion: %@\n              recoveryOSReleaseType: %@\n              factoryRestoreVersion: %@\n     preservedFactoryRestoreVersion: %@\n                           hasSplat: %@\n        hasSplatOnlyUpdateInstalled: %@\n                splatRestoreVersion: %@\n                splatProductVersion: %@\n           splatProductVersionExtra: %@\n                  splatBuildVersion: %@\n                   splatReleaseType: %@\n                hasEligibleRollback: %@\n        splatRollbackRestoreVersion: %@\n        splatRollbackProductVersion: %@\n   splatRollbackProductVersionExtra: %@\n          splatRollbackBuildVersion: %@\n           splatRollbackReleaseType: %@\n                 hasSemiSplatActive: %@\n        splatCryptex1RestoreVersion: %@\n        splatCryptex1ProductVersion: %@\n   splatCryptex1ProductVersionExtra: %@\n          splatCryptex1BuildVersion: %@\n  splatCryptex1BuildVersionOverride: %@\n           splatCryptex1ReleaseType: %@\n<<<]", v82, v59, v58, v57, v56, v55, v54, v53, v52, v51, v81, v80, v78, v79, v77, v76,
    v74,
    v75,
    v73,
    v50,
    v49,
    v72,
    v48,
    v47,
    v71,
    v70,
    v45,
    v46,
    v69,
    v66,
    v68,
    v67,
    v41,
    v63,
    v65,
    v64,
    v44,
    v43,
    v42,
    v36,
    v33,
    v62,
    v40,
    v39,
    v38,
    v37,
    v21,
    v22,
    v35,
    v34,
    v32,
    v23,
    v24,
    v31,
    v30,
    v29,
    v28,
    v27,
    v26);
  id v61 = (id)objc_claimAutoreleasedReturnValue();

  return v61;
}

- (id)summary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  BOOL v4 = [(SUCoreDevice *)self targetedSystemVolume];
  [v3 appendFormat:@"SystemVolume(TargetedSystemVolume:%@)", v4];

  BOOL v5 = [(SUCoreDevice *)self deviceSupportsRestoreVersion];
  id v6 = [(SUCoreDevice *)self buildVersion];
  uint64_t v7 = [(SUCoreDevice *)self productVersion];
  uint64_t v8 = (void *)v7;
  if (v5)
  {
    BOOL v9 = [(SUCoreDevice *)self restoreVersion];
    [v3 appendFormat:@" Build(BuildVersion:%@|ProductVersion:%@|RestoreVersion:%@)", v6, v8, v9];
  }
  else
  {
    [v3 appendFormat:@" Build(BuildVersion:%@|ProductVersion:%@)", v6, v7];
  }

  id v10 = [(SUCoreDevice *)self deviceClass];
  id v11 = [(SUCoreDevice *)self marketingProductName];
  size_t v12 = [(SUCoreDevice *)self productType];
  id v13 = [(SUCoreDevice *)self hwModelString];
  [v3 appendFormat:@" Device(DeviceClass:%@|MarketingProductName:%@|ProductType:%@|HWModelStr:%@)", v10, v11, v12, v13];

  __int16 v14 = [(SUCoreDevice *)self releaseType];
  if ([(SUCoreDevice *)self isInternal]) {
    __int16 v15 = @"YES";
  }
  else {
    __int16 v15 = @"NO";
  }
  if ([(SUCoreDevice *)self isBootedOSSecureInternal]) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  [v3 appendFormat:@" ReleaseType(ReleaseType:%@|Internal:%@|BootedOSSecureInternal:%@)", v14, v15, v16];

  if ([(SUCoreDevice *)self hasEmbeddedOS])
  {
    __int16 v17 = [(SUCoreDevice *)self bridgeBuildVersion];
    v18 = [(SUCoreDevice *)self bridgeRestoreVersion];
    if ([(SUCoreDevice *)self isBridgeInternal]) {
      uint64_t v19 = @"YES";
    }
    else {
      uint64_t v19 = @"NO";
    }
    [v3 appendFormat:@" EmbeddedOS(Build:%@|RestoreVersion:%@|Internal:%@)", v17, v18, v19];
  }
  if ([(SUCoreDevice *)self hasBridgeOS])
  {
    BOOL v20 = [(SUCoreDevice *)self bridgeBuildVersion];
    uint64_t v21 = [(SUCoreDevice *)self bridgeRestoreVersion];
    if ([(SUCoreDevice *)self isBridgeInternal]) {
      v22 = @"YES";
    }
    else {
      v22 = @"NO";
    }
    [v3 appendFormat:@" BridgeOS(Build:%@|RestoreVersion:%@|Internal:%@)", v20, v21, v22];
  }
  if ([(SUCoreDevice *)self hasSFR])
  {
    uint64_t v23 = [(SUCoreDevice *)self sfrBuildVersion];
    id v24 = [(SUCoreDevice *)self sfrProductVersion];
    id v25 = [(SUCoreDevice *)self sfrRestoreVersion];
    id v26 = [(SUCoreDevice *)self sfrReleaseType];
    [v3 appendFormat:@" SFR(Build:%@|ProductVersion:%@|RestoreVersion:%@|ReleaseType:%@)", v23, v24, v25, v26];
  }
  if ([(SUCoreDevice *)self hasRecoveryOS])
  {
    id v27 = [(SUCoreDevice *)self recoveryOSBuildVersion];
    id v28 = [(SUCoreDevice *)self recoveryOSProductVersion];
    v29 = [(SUCoreDevice *)self recoveryOSRestoreVersion];
    v30 = [(SUCoreDevice *)self recoveryOSReleaseType];
    [v3 appendFormat:@" RecoveryOS(Build:%@|ProductVersion:%@|RestoreVersion:%@|ReleaseType:%@)", v27, v28, v29, v30];
  }
  if ([(SUCoreDevice *)self deviceSupportsFactoryVersion]
    || [(SUCoreDevice *)self deviceSupportsPreservedFactoryVersion])
  {
    v31 = [(SUCoreDevice *)self factoryRestoreVersion];
    __int16 v32 = v31;
    if (v31)
    {
      id v33 = v31;
    }
    else
    {
      id v33 = [(SUCoreDevice *)self preservedFactoryRestoreVersion];
    }
    uint64_t v34 = v33;

    v35 = [(SUCoreDevice *)self preservedFactoryRestoreVersion];
    if (v35) {
      v36 = @"YES";
    }
    else {
      v36 = @"NO";
    }
    [v3 appendFormat:@" FactoryVersion(Version:%@|Preserved:%@)", v34, v36];
  }
  if ([(SUCoreDevice *)self hasSplat])
  {
    v37 = [(SUCoreDevice *)self splatRestoreVersion];
    v38 = [(SUCoreDevice *)self splatProductVersion];
    v39 = [(SUCoreDevice *)self splatProductVersionExtra];
    v40 = [(SUCoreDevice *)self splatBuildVersion];
    v41 = [(SUCoreDevice *)self splatReleaseType];
    if ([(SUCoreDevice *)self hasSplatOnlyUpdateInstalled]) {
      v42 = @"YES";
    }
    else {
      v42 = @"NO";
    }
    [v3 appendFormat:@" Splat(RestoreVersion:%@|ProductVersion:%@|ProductVersionExtra:%@|BuildVersion:%@|ReleaseType:%@|HasSplatOnlyUpdateInstalled:%@)", v37, v38, v39, v40, v41, v42];

    v43 = [(SUCoreDevice *)self splatRollbackRestoreVersion];
    v44 = [(SUCoreDevice *)self splatRollbackProductVersion];
    v45 = [(SUCoreDevice *)self splatRollbackProductVersionExtra];
    v46 = [(SUCoreDevice *)self splatRollbackBuildVersion];
    v47 = [(SUCoreDevice *)self splatRollbackReleaseType];
    if ([(SUCoreDevice *)self hasEligibleRollback]) {
      v48 = @"YES";
    }
    else {
      v48 = @"NO";
    }
    [v3 appendFormat:@" SplatRollback(RestoreVersion:%@|ProductVersion:%@|ProductVersionExtra:%@|BuildVersion:%@|ReleaseType:%@|HasEligibleRollback:%@)", v43, v44, v45, v46, v47, v48];

    v49 = [(SUCoreDevice *)self splatCryptex1RestoreVersion];
    v50 = [(SUCoreDevice *)self splatCryptex1ProductVersion];
    v51 = [(SUCoreDevice *)self splatCryptex1ProductVersionExtra];
    v52 = [(SUCoreDevice *)self splatCryptex1BuildVersion];
    v53 = [(SUCoreDevice *)self splatCryptex1BuildVersionOverride];
    v54 = [(SUCoreDevice *)self splatCryptex1ReleaseType];
    if ([(SUCoreDevice *)self hasSemiSplatActive]) {
      v55 = @"YES";
    }
    else {
      v55 = @"NO";
    }
    [v3 appendFormat:@" SplatCryptex1(RestoreVersion:%@|ProductVersion:%@|ProductVersionExtra:%@|BuildVersion:%@|BuildVersionOverride:%@|ReleaseType:%@|HasSemiSplatActive:%@)", v49, v50, v51, v52, v53, v54, v55];
  }
  v56 = [NSString stringWithString:v3];

  return v56;
}

- (NSString)targetedSystemVolume
{
  return self->_targetedSystemVolume;
}

- (void)setTargetedSystemVolume:(id)a3
{
}

- (NSString)systemVersionPlistPath
{
  return self->_systemVersionPlistPath;
}

- (void)setSystemVersionPlistPath:(id)a3
{
}

- (NSDictionary)systemVersionPlistContents
{
  return self->_systemVersionPlistContents;
}

- (void)setSystemVersionPlistContents:(id)a3
{
}

- (NSString)restoreVersionPlistPath
{
  return self->_restoreVersionPlistPath;
}

- (void)setRestoreVersionPlistPath:(id)a3
{
}

- (NSDictionary)restoreVersionPlistContents
{
  return self->_restoreVersionPlistContents;
}

- (void)setRestoreVersionPlistContents:(id)a3
{
}

- (NSString)appleInternalVariantPlistPath
{
  return self->_appleInternalVariantPlistPath;
}

- (void)setAppleInternalVariantPlistPath:(id)a3
{
}

- (NSDictionary)appleInternalVariantPlistContents
{
  return self->_appleInternalVariantPlistContents;
}

- (void)setAppleInternalVariantPlistContents:(id)a3
{
}

- (NSString)sfrSystemVersionPlistPath
{
  return self->_sfrSystemVersionPlistPath;
}

- (void)setSfrSystemVersionPlistPath:(id)a3
{
}

- (NSDictionary)sfrSystemVersionPlistContents
{
  return self->_sfrSystemVersionPlistContents;
}

- (void)setSfrSystemVersionPlistContents:(id)a3
{
}

- (NSString)sfrRestoreVersionPlistPath
{
  return self->_sfrRestoreVersionPlistPath;
}

- (void)setSfrRestoreVersionPlistPath:(id)a3
{
}

- (NSDictionary)sfrRestoreVersionPlistContents
{
  return self->_sfrRestoreVersionPlistContents;
}

- (void)setSfrRestoreVersionPlistContents:(id)a3
{
}

- (NSString)recoveryOSSystemVersionPlistPath
{
  return self->_recoveryOSSystemVersionPlistPath;
}

- (void)setRecoveryOSSystemVersionPlistPath:(id)a3
{
}

- (NSDictionary)recoveryOSSystemVersionPlistContents
{
  return self->_recoveryOSSystemVersionPlistContents;
}

- (void)setRecoveryOSSystemVersionPlistContents:(id)a3
{
}

- (NSString)recoveryOSRestoreVersionPlistPath
{
  return self->_recoveryOSRestoreVersionPlistPath;
}

- (void)setRecoveryOSRestoreVersionPlistPath:(id)a3
{
}

- (NSDictionary)recoveryOSRestoreVersionPlistContents
{
  return self->_recoveryOSRestoreVersionPlistContents;
}

- (void)setRecoveryOSRestoreVersionPlistContents:(id)a3
{
}

- (NSString)factoryVersionPlistPath
{
  return self->_factoryVersionPlistPath;
}

- (void)setFactoryVersionPlistPath:(id)a3
{
}

- (NSDictionary)factoryVersionPlistContents
{
  return self->_factoryVersionPlistContents;
}

- (void)setFactoryVersionPlistContents:(id)a3
{
}

- (NSString)preservedFactoryVersionPlistPath
{
  return self->_preservedFactoryVersionPlistPath;
}

- (void)setPreservedFactoryVersionPlistPath:(id)a3
{
}

- (NSDictionary)preservedFactoryVersionPlistContents
{
  return self->_preservedFactoryVersionPlistContents;
}

- (void)setPreservedFactoryVersionPlistContents:(id)a3
{
}

- (NSString)splatRestoreVersionPlistPath
{
  return self->_splatRestoreVersionPlistPath;
}

- (void)setSplatRestoreVersionPlistPath:(id)a3
{
}

- (NSDictionary)splatRestoreVersionPlistContents
{
  return self->_splatRestoreVersionPlistContents;
}

- (void)setSplatRestoreVersionPlistContents:(id)a3
{
}

- (NSString)splatSystemVersionPlistPath
{
  return self->_splatSystemVersionPlistPath;
}

- (void)setSplatSystemVersionPlistPath:(id)a3
{
}

- (NSDictionary)splatSystemVersionPlistContents
{
  return self->_splatSystemVersionPlistContents;
}

- (void)setSplatSystemVersionPlistContents:(id)a3
{
}

- (NSString)splatRollbackRestoreVersionPlistPath
{
  return self->_splatRollbackRestoreVersionPlistPath;
}

- (void)setSplatRollbackRestoreVersionPlistPath:(id)a3
{
}

- (void)setSplatRollbackRestoreVersionPlistContents:(id)a3
{
}

- (NSString)splatRollbackSystemVersionPlistPath
{
  return self->_splatRollbackSystemVersionPlistPath;
}

- (void)setSplatRollbackSystemVersionPlistPath:(id)a3
{
}

- (void)setSplatRollbackSystemVersionPlistContents:(id)a3
{
}

- (NSString)splatCryptex1RestoreVersionPlistPath
{
  return self->_splatCryptex1RestoreVersionPlistPath;
}

- (void)setSplatCryptex1RestoreVersionPlistPath:(id)a3
{
}

- (void)setSplatCryptex1RestoreVersionPlistContents:(id)a3
{
}

- (NSString)splatCryptex1SystemVersionPlistPath
{
  return self->_splatCryptex1SystemVersionPlistPath;
}

- (void)setSplatCryptex1SystemVersionPlistPath:(id)a3
{
}

- (void)setSplatCryptex1SystemVersionPlistContents:(id)a3
{
}

- (BOOL)deviceSupportsMobileGestalt
{
  return self->_deviceSupportsMobileGestalt;
}

- (void)setDeviceSupportsMobileGestalt:(BOOL)a3
{
  self->_deviceSupportsMobileGestalt = a3;
}

- (BOOL)deviceSupportsCoreServices
{
  return self->_deviceSupportsCoreServices;
}

- (void)setDeviceSupportsCoreServices:(BOOL)a3
{
  self->_deviceSupportsCoreServices = a3;
}

- (BOOL)deviceSupportsAppleInternalVariant
{
  return self->_deviceSupportsAppleInternalVariant;
}

- (void)setDeviceSupportsAppleInternalVariant:(BOOL)a3
{
  self->_deviceSupportsAppleInternalVariant = a3;
}

- (BOOL)deviceSupportsSFRSystemVersion
{
  return self->_deviceSupportsSFRSystemVersion;
}

- (void)setDeviceSupportsSFRSystemVersion:(BOOL)a3
{
  self->_deviceSupportsSFRSystemVersion = a3;
}

- (BOOL)deviceSupportsSFRRestoreVersion
{
  return self->_deviceSupportsSFRRestoreVersion;
}

- (void)setDeviceSupportsSFRRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsSFRRestoreVersion = a3;
}

- (BOOL)deviceSupportsRecoveryOSSystemVersion
{
  return self->_deviceSupportsRecoveryOSSystemVersion;
}

- (void)setDeviceSupportsRecoveryOSSystemVersion:(BOOL)a3
{
  self->_deviceSupportsRecoveryOSSystemVersion = a3;
}

- (BOOL)deviceSupportsRecoveryOSRestoreVersion
{
  return self->_deviceSupportsRecoveryOSRestoreVersion;
}

- (void)setDeviceSupportsRecoveryOSRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsRecoveryOSRestoreVersion = a3;
}

- (BOOL)deviceSupportsFactoryVersion
{
  return self->_deviceSupportsFactoryVersion;
}

- (void)setDeviceSupportsFactoryVersion:(BOOL)a3
{
  self->_deviceSupportsFactoryVersion = a3;
}

- (BOOL)deviceSupportsPreservedFactoryVersion
{
  return self->_deviceSupportsPreservedFactoryVersion;
}

- (void)setDeviceSupportsPreservedFactoryVersion:(BOOL)a3
{
  self->_deviceSupportsPreservedFactoryVersion = a3;
}

- (BOOL)deviceSupportsRestoreVersion
{
  return self->_deviceSupportsRestoreVersion;
}

- (void)setDeviceSupportsRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsRestoreVersion = a3;
}

- (BOOL)deviceSupportsMultiVolumeBoot
{
  return self->_deviceSupportsMultiVolumeBoot;
}

- (void)setDeviceSupportsMultiVolumeBoot:(BOOL)a3
{
  self->_deviceSupportsMultiVolumeBoot = a3;
}

- (BOOL)deviceSupportsSplatRestoreVersion
{
  return self->_deviceSupportsSplatRestoreVersion;
}

- (void)setDeviceSupportsSplatRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsSplatRestoreVersion = a3;
}

- (BOOL)deviceSupportsSplatSystemVersion
{
  return self->_deviceSupportsSplatSystemVersion;
}

- (void)setDeviceSupportsSplatSystemVersion:(BOOL)a3
{
  self->_deviceSupportsSplatSystemVersion = a3;
}

- (BOOL)deviceSupportsSplatRollbackRestoreVersion
{
  return self->_deviceSupportsSplatRollbackRestoreVersion;
}

- (void)setDeviceSupportsSplatRollbackRestoreVersion:(BOOL)a3
{
  self->_deviceSupportsSplatRollbackRestoreVersion = a3;
}

- (BOOL)deviceSupportsSplatRollbackSystemVersion
{
  return self->_deviceSupportsSplatRollbackSystemVersion;
}

- (void)setDeviceSupportsSplatRollbackSystemVersion:(BOOL)a3
{
  self->_deviceSupportsSplatRollbackSystemVersion = a3;
}

- (BOOL)deviceSupportsSplatCryptex1RestoreVersion
{
  return self->_deviceSupportsSplatCryptex1RestoreVersion;
}

- (void)setDeviceSupportsSplatCryptex1RestoreVersion:(BOOL)a3
{
  self->_deviceSupportsSplatCryptex1RestoreVersion = a3;
}

- (BOOL)deviceSupportsSplatCryptex1SystemVersion
{
  return self->_deviceSupportsSplatCryptex1SystemVersion;
}

- (void)setDeviceSupportsSplatCryptex1SystemVersion:(BOOL)a3
{
  self->_deviceSupportsSplatCryptex1SystemVersion = a3;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)hwModelString
{
  return self->_hwModelString;
}

- (void)setHwModelString:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)marketingProductName
{
  return self->_marketingProductName;
}

- (void)setMarketingProductName:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
}

- (NSString)deviceBoardID
{
  return self->_deviceBoardID;
}

- (void)setDeviceBoardID:(id)a3
{
}

- (NSString)hwTarget
{
  return self->_hwTarget;
}

- (void)setHwTarget:(id)a3
{
}

- (NSString)restoreVersion
{
  return self->_restoreVersion;
}

- (void)setRestoreVersion:(id)a3
{
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (BOOL)isBootedOSSecureInternal
{
  return self->_isBootedOSSecureInternal;
}

- (void)setIsBootedOSSecureInternal:(BOOL)a3
{
  self->_isBootedOSSecureInternal = a3;
}

- (BOOL)hasEmbeddedOS
{
  return self->_hasEmbeddedOS;
}

- (void)setHasEmbeddedOS:(BOOL)a3
{
  self->_hasEmbeddedOS = a3;
}

- (BOOL)hasBridgeOS
{
  return self->_hasBridgeOS;
}

- (void)setHasBridgeOS:(BOOL)a3
{
  self->_hasBridgeOS = a3;
}

- (NSString)bridgeBuildVersion
{
  return self->_bridgeBuildVersion;
}

- (void)setBridgeBuildVersion:(id)a3
{
}

- (NSString)bridgeRestoreVersion
{
  return self->_bridgeRestoreVersion;
}

- (void)setBridgeRestoreVersion:(id)a3
{
}

- (BOOL)isBridgeInternal
{
  return self->_isBridgeInternal;
}

- (void)setIsBridgeInternal:(BOOL)a3
{
  self->_isBridgeInternal = a3;
}

- (BOOL)hasSFR
{
  return self->_hasSFR;
}

- (void)setHasSFR:(BOOL)a3
{
  self->_hasSFR = a3;
}

- (NSString)sfrBuildVersion
{
  return self->_sfrBuildVersion;
}

- (void)setSfrBuildVersion:(id)a3
{
}

- (NSString)sfrProductVersion
{
  return self->_sfrProductVersion;
}

- (void)setSfrProductVersion:(id)a3
{
}

- (NSString)sfrRestoreVersion
{
  return self->_sfrRestoreVersion;
}

- (void)setSfrRestoreVersion:(id)a3
{
}

- (NSString)sfrReleaseType
{
  return self->_sfrReleaseType;
}

- (void)setSfrReleaseType:(id)a3
{
}

- (BOOL)hasRecoveryOS
{
  return self->_hasRecoveryOS;
}

- (void)setHasRecoveryOS:(BOOL)a3
{
  self->_hasRecoveryOS = a3;
}

- (NSString)recoveryOSBuildVersion
{
  return self->_recoveryOSBuildVersion;
}

- (void)setRecoveryOSBuildVersion:(id)a3
{
}

- (NSString)recoveryOSProductVersion
{
  return self->_recoveryOSProductVersion;
}

- (void)setRecoveryOSProductVersion:(id)a3
{
}

- (NSString)recoveryOSRestoreVersion
{
  return self->_recoveryOSRestoreVersion;
}

- (void)setRecoveryOSRestoreVersion:(id)a3
{
}

- (NSString)recoveryOSReleaseType
{
  return self->_recoveryOSReleaseType;
}

- (void)setRecoveryOSReleaseType:(id)a3
{
}

- (NSString)factoryRestoreVersion
{
  return self->_factoryRestoreVersion;
}

- (void)setFactoryRestoreVersion:(id)a3
{
}

- (NSString)preservedFactoryRestoreVersion
{
  return self->_preservedFactoryRestoreVersion;
}

- (void)setPreservedFactoryRestoreVersion:(id)a3
{
}

- (BOOL)hasSplat
{
  return self->_hasSplat;
}

- (void)setHasSplat:(BOOL)a3
{
  self->_hasSplat = a3;
}

- (void)setSplatRestoreVersion:(id)a3
{
}

- (void)setSplatProductVersion:(id)a3
{
}

- (void)setSplatProductVersionExtra:(id)a3
{
}

- (void)setSplatBuildVersion:(id)a3
{
}

- (void)setSplatReleaseType:(id)a3
{
}

- (void)setHasSplatOnlyUpdateInstalled:(BOOL)a3
{
  self->_hasSplatOnlyUpdateInstalled = a3;
}

- (void)setSplatRollbackRestoreVersion:(id)a3
{
}

- (void)setSplatRollbackProductVersion:(id)a3
{
}

- (void)setSplatRollbackProductVersionExtra:(id)a3
{
}

- (void)setSplatRollbackBuildVersion:(id)a3
{
}

- (void)setSplatRollbackReleaseType:(id)a3
{
}

- (void)setSplatCryptex1RestoreVersion:(id)a3
{
}

- (void)setSplatCryptex1ProductVersion:(id)a3
{
}

- (void)setSplatCryptex1ProductVersionExtra:(id)a3
{
}

- (void)setSplatCryptex1BuildVersion:(id)a3
{
}

- (void)setSplatCryptex1BuildVersionOverride:(id)a3
{
}

- (void)setSplatCryptex1ReleaseType:(id)a3
{
}

- (NSString)bridgeVersionPlistPath
{
  return self->_bridgeVersionPlistPath;
}

- (void)setBridgeVersionPlistPath:(id)a3
{
}

- (NSDictionary)bridgeVersionPlistContents
{
  return self->_bridgeVersionPlistContents;
}

- (void)setBridgeVersionPlistContents:(id)a3
{
}

- (NSString)bridgeVersion
{
  return self->_bridgeVersion;
}

- (void)setBridgeVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgeVersion, 0);
  objc_storeStrong((id *)&self->_bridgeVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_bridgeVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_splatCryptex1ReleaseType, 0);
  objc_storeStrong((id *)&self->_splatCryptex1BuildVersionOverride, 0);
  objc_storeStrong((id *)&self->_splatCryptex1BuildVersion, 0);
  objc_storeStrong((id *)&self->_splatCryptex1ProductVersionExtra, 0);
  objc_storeStrong((id *)&self->_splatCryptex1ProductVersion, 0);
  objc_storeStrong((id *)&self->_splatCryptex1RestoreVersion, 0);
  objc_storeStrong((id *)&self->_splatRollbackReleaseType, 0);
  objc_storeStrong((id *)&self->_splatRollbackBuildVersion, 0);
  objc_storeStrong((id *)&self->_splatRollbackProductVersionExtra, 0);
  objc_storeStrong((id *)&self->_splatRollbackProductVersion, 0);
  objc_storeStrong((id *)&self->_splatRollbackRestoreVersion, 0);
  objc_storeStrong((id *)&self->_splatReleaseType, 0);
  objc_storeStrong((id *)&self->_splatBuildVersion, 0);
  objc_storeStrong((id *)&self->_splatProductVersionExtra, 0);
  objc_storeStrong((id *)&self->_splatProductVersion, 0);
  objc_storeStrong((id *)&self->_splatRestoreVersion, 0);
  objc_storeStrong((id *)&self->_preservedFactoryRestoreVersion, 0);
  objc_storeStrong((id *)&self->_factoryRestoreVersion, 0);
  objc_storeStrong((id *)&self->_recoveryOSReleaseType, 0);
  objc_storeStrong((id *)&self->_recoveryOSRestoreVersion, 0);
  objc_storeStrong((id *)&self->_recoveryOSProductVersion, 0);
  objc_storeStrong((id *)&self->_recoveryOSBuildVersion, 0);
  objc_storeStrong((id *)&self->_sfrReleaseType, 0);
  objc_storeStrong((id *)&self->_sfrRestoreVersion, 0);
  objc_storeStrong((id *)&self->_sfrProductVersion, 0);
  objc_storeStrong((id *)&self->_sfrBuildVersion, 0);
  objc_storeStrong((id *)&self->_bridgeRestoreVersion, 0);
  objc_storeStrong((id *)&self->_bridgeBuildVersion, 0);
  objc_storeStrong((id *)&self->_restoreVersion, 0);
  objc_storeStrong((id *)&self->_hwTarget, 0);
  objc_storeStrong((id *)&self->_deviceBoardID, 0);
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_marketingProductName, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_hwModelString, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_splatCryptex1SystemVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_splatCryptex1SystemVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_splatCryptex1RestoreVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_splatCryptex1RestoreVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_splatRollbackSystemVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_splatRollbackSystemVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_splatRollbackRestoreVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_splatRollbackRestoreVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_splatSystemVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_splatSystemVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_splatRestoreVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_splatRestoreVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_preservedFactoryVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_preservedFactoryVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_factoryVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_factoryVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_recoveryOSRestoreVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_recoveryOSRestoreVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_recoveryOSSystemVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_recoveryOSSystemVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_sfrRestoreVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_sfrRestoreVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_sfrSystemVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_sfrSystemVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_appleInternalVariantPlistContents, 0);
  objc_storeStrong((id *)&self->_appleInternalVariantPlistPath, 0);
  objc_storeStrong((id *)&self->_restoreVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_restoreVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_systemVersionPlistContents, 0);
  objc_storeStrong((id *)&self->_systemVersionPlistPath, 0);
  objc_storeStrong((id *)&self->_targetedSystemVolume, 0);
}

- (void)initTargetingSystemVolume:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1B4EC2000, v0, v1, "[SUCoreDevice] No system volume provided, returning no initialized device", v2, v3, v4, v5, v6);
}

- (void)adjustTargetingSystemVolume:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1B4EC2000, v0, v1, "[SUCoreDevice] No system volume provided, returning", v2, v3, v4, v5, v6);
}

- (void)adjustTargetingSystemVolume:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_1B4EC2000, v0, v1, "[SUCoreDevice] Unable to determine RecoveryOS restore version (recoveryOSRestoreVersion=%{public}@, recoveryOSRestoreBuildGroup=%{public}@)");
}

- (void)adjustTargetingSystemVolume:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_1B4EC2000, v0, v1, "[SUCoreDevice] Unable to determine SFR restore version (sfrRestoreVersion=%{public}@, sfrRestoreBuildGroup=%{public}@)");
}

- (void)_getMajorVersionFromBuildVersion:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1B4EC2000, v0, v1, "[SUCoreDevice] Build version comparison was not provided a build version", v2, v3, v4, v5, v6);
}

- (void)_getMajorVersionFromBuildVersion:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1B4EC2000, v0, v1, "[SUCoreDevice] Build version comparison was unable to find a build regex match for %{public}@", v2);
}

- (void)_copySplatCryptex1SystemVersionPath
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1B4EC2000, v0, v1, "[SUCoreDevice] Failed to get path to cryptex1 SystemVersion: %{public}@", v2);
}

- (void)_copySplatCryptex1RestoreVersionPath
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1B4EC2000, v0, v1, "[SUCoreDevice] Failed to get path to cryptex1 RestoreVersion: %{public}@", v2);
}

- (void)_copySplatRollbackObjectsPath
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1B4EC2000, v0, v1, "[SUCoreDevice] Failed to get path to rollback objects: %{public}@", v2);
}

- (void)hasEligibleRollback
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1B4EC2000, v0, v1, "[SUCoreDevice] Failed to get path to rollback assets", v2, v3, v4, v5, v6);
}

- (void)_reloadPlistContentsForKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = objc_msgSend(v0, "_nameForQueryKey:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to reload plist contents", v4, v5, v6, v7, v8);
}

- (void)_queryMethodForKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = objc_msgSend(v0, "_nameForQueryKey:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@", v4, v5, v6, v7, v8);
}

- (void)_copySysCtlValueForKey:.cold.1()
{
  __error();
  id v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1B4EC2000, v1, v2, "[SUCoreDevice] sysctlbyname failed to set buffer for key %{public}@ with code %d (%s) buffer size %ld", v3, v4, v5, v6, v7);
}

- (void)_copySysCtlValueForKey:.cold.2()
{
  __error();
  id v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1B4EC2000, v1, v2, "[SUCoreDevice] sysctlbyname failed for key %{public}@ with code %d (%s) buffer size %ld", v3, v4, v5, v6, v7);
}

- (void)_gestaltKeyForQueryKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = objc_msgSend(v0, "_nameForQueryKey:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a gestalt key", v4, v5, v6, v7, v8);
}

- (void)_coreServicesKeyForQueryKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = objc_msgSend(v0, "_nameForQueryKey:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a core services key", v4, v5, v6, v7, v8);
}

- (void)_restoreVersionKeyForQueryKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = objc_msgSend(v0, "_nameForQueryKey:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a restore version key", v4, v5, v6, v7, v8);
}

- (void)_factoryVersionKeyForQueryKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = objc_msgSend(v0, "_nameForQueryKey:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a factory version key.", v4, v5, v6, v7, v8);
}

- (void)_factoryVersionPlistContentsForKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = objc_msgSend(v0, "_nameForQueryKey:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain factory version plist contents.", v4, v5, v6, v7, v8);
}

- (void)_sysCtlKeyForQueryKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = objc_msgSend(v0, "_nameForQueryKey:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a sysctl value", v4, v5, v6, v7, v8);
}

- (void)_splatVersionKeyForQueryKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = objc_msgSend(v0, "_nameForQueryKey:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a SplatVersion/SplatRollbackVersion/SplatCryptex1Version value", v4, v5, v6, v7, v8);
}

- (void)_splatVersionPlistContentsForKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = objc_msgSend(v0, "_nameForQueryKey:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a SplatVersion value", v4, v5, v6, v7, v8);
}

- (void)_splatRollbackVersionPlistContentsForKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = objc_msgSend(v0, "_nameForQueryKey:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a SplatRollback value", v4, v5, v6, v7, v8);
}

- (void)_splatCryptex1VersionPlistContentsForKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  uint64_t v1 = objc_msgSend(v0, "_nameForQueryKey:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreDevice] Unsupported query key %{public}@ to obtain a SplatCryptex1 value", v4, v5, v6, v7, v8);
}

@end