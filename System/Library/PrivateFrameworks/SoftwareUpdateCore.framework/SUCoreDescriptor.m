@interface SUCoreDescriptor
+ (BOOL)isEmergencyUpdate:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)cleanProductVersion:(id)a3;
+ (id)nameForDescriptorAudienceType:(int64_t)a3;
+ (id)nameForDescriptorPreferredUpdateType:(int64_t)a3;
+ (id)nameForDescriptorType:(int64_t)a3;
- (BOOL)allowAutoDownloadOnBattery;
- (BOOL)autoDownloadAllowableOverCellular;
- (BOOL)autoUpdateEnabled;
- (BOOL)containsSFRContent;
- (BOOL)criticalCellularOverride;
- (BOOL)criticalOutOfBoxOnly;
- (BOOL)criticalUpdate;
- (BOOL)disableAppDemotion;
- (BOOL)disableCDLevel4;
- (BOOL)disableInstallTonight;
- (BOOL)disableRecoveryOSUpdates;
- (BOOL)disableRosettaUpdates;
- (BOOL)disableSiriVoiceDeletion;
- (BOOL)disableSplatCombo;
- (BOOL)downloadAllowableOverCellular;
- (BOOL)downloadable;
- (BOOL)enableAlternateAssetAudience;
- (BOOL)enablePreSUStaging;
- (BOOL)enablePreSUStagingForOptionalAssets;
- (BOOL)forcePasscodeRequired;
- (BOOL)fullReplacement;
- (BOOL)granularlyRamped;
- (BOOL)isEqual:(id)a3;
- (BOOL)mandatoryUpdateEligible;
- (BOOL)mandatoryUpdateOptional;
- (BOOL)mandatoryUpdateRestrictedToOutOfTheBox;
- (BOOL)notificationEnabled;
- (BOOL)notifyAfter;
- (BOOL)oneShotBuddyDisabled;
- (BOOL)promoteAlternateUpdate;
- (BOOL)rampEnabled;
- (BOOL)recommendedUpdateApplicable;
- (BOOL)recommendedUpdateEnabled;
- (BOOL)requireInstallAssistantUpdate;
- (BOOL)requiresDocumentationReload;
- (BOOL)requiresSoftwareUpdateAssetReload;
- (BOOL)revoked;
- (BOOL)semiSplatEnabled;
- (BOOL)semiSplatRestartNow;
- (BOOL)splatOnly;
- (BOOL)streamingZipCapable;
- (MAAbsoluteAssetId)documentationAssetAbsoluteID;
- (MAAbsoluteAssetId)softwareUpdateAssetAbsoluteID;
- (MAAsset)documentationAsset;
- (MAAsset)softwareUpdateAsset;
- (NSArray)oneShotBuddyDisabledBuilds;
- (NSArray)semiSplatMustQuitApps;
- (NSArray)supportedDevices;
- (NSData)measurement;
- (NSData)rsepDigest;
- (NSData)rsepTBMDigests;
- (NSData)sepDigest;
- (NSData)sepTBMDigests;
- (NSDate)releaseDate;
- (NSDictionary)bundleAttributes;
- (NSDictionary)systemPartitionPadding;
- (NSNumber)recommendedUpdateNotificationFrequencyDays;
- (NSString)alternateAssetAudienceUUID;
- (NSString)assetAudienceUUID;
- (NSString)assetID;
- (NSString)documentationAssetPurpose;
- (NSString)documentationAssetType;
- (NSString)documentationID;
- (NSString)humanReadableMoreInfoLink;
- (NSString)humanReadableUpdateName;
- (NSString)humanReadableUpdateTitle;
- (NSString)humanReadableUpdateVersion;
- (NSString)lastEmergencyBuild;
- (NSString)lastEmergencyOSVersion;
- (NSString)mandatoryUpdateBodyString;
- (NSString)mandatoryUpdateVersionMax;
- (NSString)mandatoryUpdateVersionMin;
- (NSString)measurementAlgorithm;
- (NSString)minimumBridgeVersion;
- (NSString)notificationBodyString;
- (NSString)notificationTitleString;
- (NSString)prerequisiteBuild;
- (NSString)prerequisiteOSVersion;
- (NSString)productBuildVersion;
- (NSString)productSystemName;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)productVersionExtra;
- (NSString)publisher;
- (NSString)rawProductVersion;
- (NSString)recommendedUpdateAlertBodyString;
- (NSString)recommendedUpdateMaxOSVersion;
- (NSString)recommendedUpdateMinOSVersion;
- (NSString)recommendedUpdateTitleString;
- (NSString)releaseType;
- (NSString)restoreVersion;
- (NSString)setupCritical;
- (NSString)softwareUpdateAssetPurpose;
- (NSString)softwareUpdateAssetType;
- (NSString)softwareUpdateURL;
- (NSString)targetUpdateBridgeVersion;
- (NSString)targetUpdateSFRVersion;
- (NSString)trainName;
- (NSString)uniqueBuildID;
- (NSString)updateBrainPath;
- (NSString)updateBundlePath;
- (SUCoreDescriptor)associatedSplatDescriptor;
- (SUCoreDescriptor)initWithCoder:(id)a3;
- (SUCoreDescriptor)initWithSUAsset:(id)a3 releaseDate:(id)a4 defaultValues:(id)a5;
- (SUCoreDescriptor)initWithSUAsset:(id)a3 releaseDate:(id)a4 prepareSize:(id)a5 applySize:(id)a6 defaultValues:(id)a7;
- (SUCoreDescriptor)initWithUpdateBrainPath:(id)a3 updateBundlePath:(id)a4 bundleAttributes:(id)a5;
- (SUCoreDescriptor)initWithUpdateBrainPath:(id)a3 updateBundlePath:(id)a4 bundleAttributes:(id)a5 descriptorType:(int64_t)a6;
- (SUCoreDocumentation)documentation;
- (SUCoreMAIdentifier)documentationAssetIdentifier;
- (SUCoreMAIdentifier)softwareUpdateAssetIdentifier;
- (id)criticalOverrideCellularPolicy;
- (id)description;
- (id)initSemiSplatDescriptor;
- (id)overview;
- (id)overviewWithMaxValueLength:(unint64_t)a3 providingSubstitutionMap:(id)a4;
- (id)summary;
- (id)updateTypeName;
- (int64_t)descriptorAudienceType;
- (int64_t)descriptorType;
- (int64_t)hideInstallAlert;
- (int64_t)preferredUpdateType;
- (int64_t)updateType;
- (unint64_t)autoDownloadOnBatteryDelay;
- (unint64_t)autoDownloadOnBatteryMinBattery;
- (unint64_t)autoInstallDelay;
- (unint64_t)downloadSize;
- (unint64_t)installAlertInterval;
- (unint64_t)installationSize;
- (unint64_t)mdmDelayInterval;
- (unint64_t)minimumSystemPartitionSize;
- (unint64_t)msuPrepareSize;
- (unint64_t)preSUStagingOptionalSize;
- (unint64_t)preSUStagingRequiredSize;
- (unint64_t)preparationSize;
- (unint64_t)refreshInstallationSize;
- (unint64_t)refreshPrepareSize;
- (unint64_t)refreshTotalRequiredFreeSpace;
- (unint64_t)suDownloadSize;
- (unint64_t)totalRequiredFreeSpace;
- (unint64_t)unarchivedSize;
- (void)assignDescriptorAudienceType:(int64_t)a3 descriptorPreferredUpdateType:(int64_t)a4 assetAudienceUUID:(id)a5;
- (void)assignDocumentationFromAsset:(id)a3;
- (void)assignDocumentationFromAsset:(id)a3 extendingBundleProperties:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowAutoDownloadOnBattery:(BOOL)a3;
- (void)setAlternateAssetAudienceUUID:(id)a3;
- (void)setAssetAudienceUUID:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setAssociatedSplatDescriptor:(id)a3;
- (void)setAutoDownloadAllowableOverCellular:(BOOL)a3;
- (void)setAutoDownloadOnBatteryDelay:(unint64_t)a3;
- (void)setAutoDownloadOnBatteryMinBattery:(unint64_t)a3;
- (void)setAutoInstallDelay:(unint64_t)a3;
- (void)setAutoUpdateEnabled:(BOOL)a3;
- (void)setBundleAttributes:(id)a3;
- (void)setContainsSFRContent:(BOOL)a3;
- (void)setCriticalCellularOverride:(BOOL)a3;
- (void)setCriticalOutOfBoxOnly:(BOOL)a3;
- (void)setCriticalUpdate:(BOOL)a3;
- (void)setDescriptorAudienceType:(int64_t)a3;
- (void)setDescriptorType:(int64_t)a3;
- (void)setDisableAppDemotion:(BOOL)a3;
- (void)setDisableCDLevel4:(BOOL)a3;
- (void)setDisableInstallTonight:(BOOL)a3;
- (void)setDisableRosettaUpdates:(BOOL)a3;
- (void)setDisableSiriVoiceDeletion:(BOOL)a3;
- (void)setDisableSplatCombo:(BOOL)a3;
- (void)setDocumentation:(id)a3;
- (void)setDocumentationAsset:(id)a3;
- (void)setDocumentationAssetAbsoluteID:(id)a3;
- (void)setDocumentationAssetIdentifier:(id)a3;
- (void)setDocumentationAssetPurpose:(id)a3;
- (void)setDocumentationAssetType:(id)a3;
- (void)setDocumentationID:(id)a3;
- (void)setDownloadAllowableOverCellular:(BOOL)a3;
- (void)setDownloadable:(BOOL)a3;
- (void)setEnableAlternateAssetAudience:(BOOL)a3;
- (void)setEnablePreSUStaging:(BOOL)a3;
- (void)setEnablePreSUStagingForOptionalAssets:(BOOL)a3;
- (void)setForcePasscodeRequired:(BOOL)a3;
- (void)setGranularlyRamped:(BOOL)a3;
- (void)setHideInstallAlert:(int64_t)a3;
- (void)setInstallAlertInterval:(unint64_t)a3;
- (void)setInstallationSize:(unint64_t)a3;
- (void)setLastEmergencyBuild:(id)a3;
- (void)setLastEmergencyOSVersion:(id)a3;
- (void)setMandatoryUpdateEligible:(BOOL)a3;
- (void)setMandatoryUpdateOptional:(BOOL)a3;
- (void)setMandatoryUpdateRestrictedToOutOfTheBox:(BOOL)a3;
- (void)setMandatoryUpdateVersionMax:(id)a3;
- (void)setMandatoryUpdateVersionMin:(id)a3;
- (void)setMdmDelayInterval:(unint64_t)a3;
- (void)setMeasurement:(id)a3;
- (void)setMeasurementAlgorithm:(id)a3;
- (void)setMinimumBridgeVersion:(id)a3;
- (void)setMinimumSystemPartitionSize:(unint64_t)a3;
- (void)setMsuPrepareSize:(unint64_t)a3;
- (void)setNotifyAfter:(BOOL)a3;
- (void)setPreSUStagingOptionalSize:(unint64_t)a3;
- (void)setPreSUStagingRequiredSize:(unint64_t)a3;
- (void)setPreferredUpdateType:(int64_t)a3;
- (void)setPrerequisiteBuild:(id)a3;
- (void)setPrerequisiteOSVersion:(id)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setProductSystemName:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setProductVersionExtra:(id)a3;
- (void)setPromoteAlternateUpdate:(BOOL)a3;
- (void)setPublisher:(id)a3;
- (void)setRampEnabled:(BOOL)a3;
- (void)setRawProductVersion:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setReleaseType:(id)a3;
- (void)setRestoreVersion:(id)a3;
- (void)setRsepDigest:(id)a3;
- (void)setRsepTBMDigests:(id)a3;
- (void)setSepDigest:(id)a3;
- (void)setSepTBMDigests:(id)a3;
- (void)setSetupCritical:(id)a3;
- (void)setSoftwareUpdateAsset:(id)a3;
- (void)setSoftwareUpdateAssetAbsoluteID:(id)a3;
- (void)setSoftwareUpdateAssetIdentifier:(id)a3;
- (void)setSoftwareUpdateAssetPurpose:(id)a3;
- (void)setSoftwareUpdateAssetType:(id)a3;
- (void)setSoftwareUpdateURL:(id)a3;
- (void)setStreamingZipCapable:(BOOL)a3;
- (void)setSuDownloadSize:(unint64_t)a3;
- (void)setSupportedDevices:(id)a3;
- (void)setSystemPartitionPadding:(id)a3;
- (void)setTargetUpdateBridgeVersion:(id)a3;
- (void)setTargetUpdateSFRVersion:(id)a3;
- (void)setTrainName:(id)a3;
- (void)setUnarchivedSize:(unint64_t)a3;
- (void)setUniqueBuildID:(id)a3;
- (void)setUpdateBrainPath:(id)a3;
- (void)setUpdateBundlePath:(id)a3;
- (void)setUpdateType:(int64_t)a3;
- (void)transferNonAssetPropertiesFromDescriptor:(id)a3;
@end

@implementation SUCoreDescriptor

- (SUCoreDescriptor)initWithSUAsset:(id)a3 releaseDate:(id)a4 defaultValues:(id)a5
{
  return [(SUCoreDescriptor *)self initWithSUAsset:a3 releaseDate:a4 prepareSize:0 applySize:0 defaultValues:a5];
}

- (SUCoreDescriptor)initWithSUAsset:(id)a3 releaseDate:(id)a4 prepareSize:(id)a5 applySize:(id)a6 defaultValues:(id)a7
{
  uint64_t v154 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    v18 = objc_msgSend(v13, "SUCoreBorder_attributes");
    v19 = v18;
    if (v18)
    {
      if ([v18 count])
      {
        v151.receiver = self;
        v151.super_class = (Class)SUCoreDescriptor;
        v20 = [(SUCoreDescriptor *)&v151 init];
        v21 = v20;
        if (!v20)
        {
LABEL_51:
          self = v21;
          v64 = self;
          goto LABEL_52;
        }
        v149 = v16;
        v150 = v15;
        v20->_descriptorType = 1;
        v22 = [v13 assetType];
        int v23 = [v22 isEqualToString:@"com.apple.MobileAsset.SFRSoftwareUpdate"];

        if (v23) {
          v21->_descriptorType = 3;
        }
        v21->_descriptorAudienceType = 0;
        v21->_preferredUpdateType = 0;
        uint64_t v24 = [v13 assetId];
        assetID = v21->_assetID;
        v21->_assetID = (NSString *)v24;

        objc_storeStrong((id *)&v21->_bundleAttributes, v19);
        uint64_t v26 = [v13 assetType];
        softwareUpdateAssetType = v21->_softwareUpdateAssetType;
        v21->_softwareUpdateAssetType = (NSString *)v26;

        documentationAssetType = v21->_documentationAssetType;
        v21->_documentationAssetType = 0;

        uint64_t v29 = [v13 absoluteAssetId];
        softwareUpdateAssetAbsoluteID = v21->_softwareUpdateAssetAbsoluteID;
        v21->_softwareUpdateAssetAbsoluteID = (MAAbsoluteAssetId *)v29;

        uint64_t v31 = [v13 purpose];
        softwareUpdateAssetPurpose = v21->_softwareUpdateAssetPurpose;
        v21->_softwareUpdateAssetPurpose = (NSString *)v31;

        documentationAssetAbsoluteID = v21->_documentationAssetAbsoluteID;
        v21->_documentationAssetAbsoluteID = 0;

        documentationAssetPurpose = v21->_documentationAssetPurpose;
        v21->_documentationAssetPurpose = 0;

        uint64_t v35 = [v19 safeStringForKey:@"UniqueBuildID"];
        uniqueBuildID = v21->_uniqueBuildID;
        v21->_uniqueBuildID = (NSString *)v35;

        uint64_t v37 = [v19 safeStringForKey:@"OSVersion"];
        rawProductVersion = v21->_rawProductVersion;
        v21->_rawProductVersion = (NSString *)v37;

        uint64_t v39 = +[SUCoreDescriptor cleanProductVersion:v21->_rawProductVersion];
        productVersion = v21->_productVersion;
        v21->_productVersion = (NSString *)v39;

        uint64_t v41 = [v19 safeStringForKey:@"Build"];
        productBuildVersion = v21->_productBuildVersion;
        v21->_productBuildVersion = (NSString *)v41;

        uint64_t v43 = [v19 safeStringForKey:@"ProductVersionExtra"];
        productVersionExtra = v21->_productVersionExtra;
        v21->_productVersionExtra = (NSString *)v43;

        uint64_t v45 = [v19 safeStringForKey:@"SUProductSystemName"];
        productSystemName = v21->_productSystemName;
        v21->_productSystemName = (NSString *)v45;

        uint64_t v47 = [v19 safeStringForKey:@"ReleaseType"];
        releaseType = v21->_releaseType;
        v21->_releaseType = (NSString *)v47;

        uint64_t v49 = [v19 safeStringForKey:@"SUPublisher"];
        publisher = v21->_publisher;
        v21->_publisher = (NSString *)v49;

        uint64_t v51 = [v19 safeStringForKey:@"RestoreVersion"];
        restoreVersion = v21->_restoreVersion;
        v21->_restoreVersion = (NSString *)v51;

        uint64_t v53 = [v19 safeStringForKey:@"TargetBridgeUpdateVersion"];
        targetUpdateBridgeVersion = v21->_targetUpdateBridgeVersion;
        v21->_targetUpdateBridgeVersion = (NSString *)v53;

        uint64_t v55 = [v19 safeStringForKey:@"TargetSFRUpdateVersion"];
        targetUpdateSFRVersion = v21->_targetUpdateSFRVersion;
        v21->_targetUpdateSFRVersion = (NSString *)v55;

        uint64_t v57 = [v19 safeStringForKey:@"TrainName"];
        trainName = v21->_trainName;
        v21->_trainName = (NSString *)v57;

        p_releaseDate = (id *)&v21->_releaseDate;
        releaseDate = v21->_releaseDate;
        v21->_releaseDate = 0;

        if (v14)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v61 = v14;
            id v62 = *p_releaseDate;
            id *p_releaseDate = v61;
LABEL_19:

            goto LABEL_20;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v62 = objc_alloc_init(MEMORY[0x263F08790]);
            [v62 setDateFormat:@"yyyy-MM-dd"];
            v147 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
            objc_msgSend(v62, "setLocale:");
            v68 = [v62 dateFromString:v14];
            if (v68)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_storeStrong((id *)&v21->_releaseDate, v68);
              }
            }

            goto LABEL_19;
          }
        }
LABEL_20:
        uint64_t v69 = [v19 safeStringForKey:@"PrerequisiteBuild"];
        prerequisiteBuild = v21->_prerequisiteBuild;
        v21->_prerequisiteBuild = (NSString *)v69;

        uint64_t v71 = [v19 safeStringForKey:@"PrerequisiteOSVersion"];
        prerequisiteOSVersion = v21->_prerequisiteOSVersion;
        v21->_prerequisiteOSVersion = (NSString *)v71;

        uint64_t v73 = [v19 safeObjectForKey:@"SupportedDevices" ofClass:objc_opt_class()];
        supportedDevices = v21->_supportedDevices;
        v21->_supportedDevices = (NSArray *)v73;

        v21->_suDownloadSize = objc_msgSend(v19, "safeULLForKey:defaultValue:", *MEMORY[0x263F55888], objc_msgSend(v17, "safeULLForKey:", *MEMORY[0x263F55888]));
        v21->_unarchivedSize = objc_msgSend(v19, "safeULLForKey:defaultValue:", *MEMORY[0x263F558A0], objc_msgSend(v17, "safeULLForKey:", *MEMORY[0x263F558A0]));
        v21->_minimumSystemPartitionSize = objc_msgSend(v19, "safeULLForKey:defaultValue:", @"ActualMinimumSystemPartition", objc_msgSend(v17, "safeULLForKey:", @"ActualMinimumSystemPartition")) << 20;
        v21->_streamingZipCapable = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", *MEMORY[0x263F55890], objc_msgSend(v17, "safeBooleanForKey:", *MEMORY[0x263F55890]));
        uint64_t v75 = [v19 safeDictionaryForKey:@"SystemPartitionPadding" fromBase:@"updateAsset attributes" withKeyDescription:@"system partition padding"];
        systemPartitionPadding = v21->_systemPartitionPadding;
        v21->_systemPartitionPadding = (NSDictionary *)v75;

        v21->_preSUStagingRequiredSize = 0;
        v21->_preSUStagingOptionalSize = 0;
        v21->_autoDownloadAllowableOverCellular = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"AutomaticDownloadOver3G", objc_msgSend(v17, "safeBooleanForKey:", @"AutomaticDownloadOver3G"));
        v21->_downloadAllowableOverCellular = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"AllowableOverCellular", objc_msgSend(v17, "safeBooleanForKey:", @"AllowableOverCellular"));
        v21->_downloadable = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"AllowableOTA", objc_msgSend(v17, "safeBooleanForKey:", @"AllowableOTA"));
        v21->_disableSiriVoiceDeletion = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"SUDisableSiriVoiceDeletion", objc_msgSend(v17, "safeBooleanForKey:", @"SUDisableSiriVoiceDeletion"));
        v21->_disableCDLevel4 = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"SUDisableCDLevel4", objc_msgSend(v17, "safeBooleanForKey:", @"SUDisableCDLevel4"));
        v21->_disableAppDemotion = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"SUDisableAppDemotion", objc_msgSend(v17, "safeBooleanForKey:", @"SUDisableAppDemotion"));
        v21->_disableInstallTonight = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"SUInstallTonightEnabled", objc_msgSend(v17, "safeBooleanForKey:", @"SUInstallTonightEnabled")) ^ 1;
        v21->_forcePasscodeRequired = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"ForcePasscodeRequired", objc_msgSend(v17, "safeBooleanForKey:", @"ForcePasscodeRequired"));
        v21->_rampEnabled = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"Ramp", objc_msgSend(v17, "safeBooleanForKey:", @"Ramp"));
        v21->_granularlyRamped = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"GranularlyRamped", objc_msgSend(v17, "safeBooleanForKey:", @"GranularlyRamped"));
        v21->_mdmDelayInterval = objc_msgSend(v19, "safeULLForKey:defaultValue:", @"MDMDelayInterval", objc_msgSend(v17, "safeULLForKey:", @"MDMDelayInterval"));
        v21->_autoUpdateEnabled = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"AutoUpdate", objc_msgSend(v17, "safeBooleanForKey:", @"AutoUpdate"));
        v21->_hideInstallAlert = objc_msgSend(v19, "safeTriStateForKey:defaultValue:", @"__HideInstallAlert", objc_msgSend(v17, "safeTriStateForKey:", @"__HideInstallAlert"));
        v21->_containsSFRContent = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"ContainsSFRContent", objc_msgSend(v17, "safeBooleanForKey:", @"ContainsSFRContent"));
        v21->_installAlertInterval = objc_msgSend(v19, "safeULLForKey:defaultValue:", @"InstallAlertInterval", objc_msgSend(v17, "safeULLForKey:", @"InstallAlertInterval"));
        v21->_allowAutoDownloadOnBattery = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"AllowAutoDownloadOnBattery", objc_msgSend(v17, "safeBooleanForKey:", @"AllowAutoDownloadOnBattery"));
        v21->_autoDownloadOnBatteryDelay = objc_msgSend(v19, "safeULLForKey:defaultValue:", @"AllowAutoDownloadOnBatteryDelay", objc_msgSend(v17, "safeULLForKey:", @"AllowAutoDownloadOnBatteryDelay"));
        v21->_autoDownloadOnBatteryMinBattery = objc_msgSend(v19, "safeULLForKey:defaultValue:", @"AutoDownloadOnBatteryMinBattery", objc_msgSend(v17, "safeULLForKey:", @"AutoDownloadOnBatteryMinBattery"));
        uint64_t v77 = [v19 safeStringForKey:@"SetupCritical"];
        setupCritical = v21->_setupCritical;
        v21->_setupCritical = (NSString *)v77;

        v21->_criticalCellularOverride = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"SetupCriticalCellularOverride", objc_msgSend(v17, "safeBooleanForKey:", @"SetupCriticalCellularOverride"));
        v21->_criticalOutOfBoxOnly = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"SetupCriticalUpdateOutOfBoxOnly", objc_msgSend(v17, "safeBooleanForKey:", @"SetupCriticalUpdateOutOfBoxOnly"));
        uint64_t v79 = [v19 safeStringForKey:@"LastEmergencyBuild"];
        lastEmergencyBuild = v21->_lastEmergencyBuild;
        v21->_lastEmergencyBuild = (NSString *)v79;

        uint64_t v81 = [v19 safeStringForKey:@"LastEmergencyOSVersion"];
        lastEmergencyOSVersion = v21->_lastEmergencyOSVersion;
        v21->_lastEmergencyOSVersion = (NSString *)v81;

        v83 = [v19 safeObjectForKey:@"MacBuddyEligibleUpdate" ofClass:objc_opt_class()];
        v148 = v83;
        if (v83)
        {
          v84 = v83;
          v21->_mandatoryUpdateEligible = 1;
          uint64_t v85 = [v83 safeStringForKey:@"VersionMin"];
          mandatoryUpdateVersionMin = v21->_mandatoryUpdateVersionMin;
          v21->_mandatoryUpdateVersionMin = (NSString *)v85;

          uint64_t v87 = [v84 safeStringForKey:@"VersionMax"];
          mandatoryUpdateVersionMax = v21->_mandatoryUpdateVersionMax;
          v21->_mandatoryUpdateVersionMax = (NSString *)v87;

          v21->_mandatoryUpdateOptional = [v84 safeBooleanForKey:@"Optional"];
          char v89 = [v84 safeBooleanForKey:@"RestrictedToOutOfTheBox"];
        }
        else
        {
          v21->_mandatoryUpdateEligible = 0;
          v90 = v21->_mandatoryUpdateVersionMin;
          v21->_mandatoryUpdateVersionMin = 0;

          v91 = v21->_mandatoryUpdateVersionMax;
          v21->_mandatoryUpdateVersionMax = 0;

          char v89 = 0;
          v21->_mandatoryUpdateOptional = 0;
        }
        v21->_mandatoryUpdateRestrictedToOutOfTheBox = v89;
        v21->_oneShotBuddyDisabled = [v19 safeBooleanForKey:@"DisableOneShotBuddy"];
        uint64_t v92 = [v19 safeObjectForKey:@"DisableOneShotBuddyBuilds" ofClass:objc_opt_class()];
        oneShotBuddyDisabledBuilds = v21->_oneShotBuddyDisabledBuilds;
        v21->_oneShotBuddyDisabledBuilds = (NSArray *)v92;

        v21->_criticalUpdate = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"CriticalUpdate", objc_msgSend(v17, "safeBooleanForKey:", @"CriticalUpdate"));
        uint64_t v94 = [v19 safeStringForKey:@"ProductType"];
        productType = v21->_productType;
        v21->_productType = (NSString *)v94;

        v21->_autoInstallDelay = objc_msgSend(v19, "safeULLForKey:defaultValue:", @"AutoInstallDelay", objc_msgSend(v17, "safeULLForKey:", @"AutoInstallDelay"));
        v21->_notifyAfter = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"NotifyAfter", objc_msgSend(v17, "safeBooleanForKey:", @"NotifyAfter"));
        uint64_t v96 = [v19 safeStringForKey:@"TargetUpdateBridgeVersion"];
        minimumBridgeVersion = v21->_minimumBridgeVersion;
        v21->_minimumBridgeVersion = (NSString *)v96;

        v21->_disableRosettaUpdates = [v19 safeBooleanForKey:@"DisableRosettaUpdates"];
        v21->_disableRecoveryOSUpdates = [v19 safeBooleanForKey:@"DisableRecoveryOSUpdates"];
        v21->_requireInstallAssistantUpdate = [v19 safeBooleanForKey:@"RequireInstallAssistantUpdate"];
        uint64_t v98 = [v19 safeDataForKey:@"SEPDigest"];
        sepDigest = v21->_sepDigest;
        v21->_sepDigest = (NSData *)v98;

        uint64_t v100 = [v19 safeDataForKey:@"SEPTBMDigests"];
        sepTBMDigests = v21->_sepTBMDigests;
        v21->_sepTBMDigests = (NSData *)v100;

        uint64_t v102 = [v19 safeDataForKey:@"RSEPDigest"];
        rsepDigest = v21->_rsepDigest;
        v21->_rsepDigest = (NSData *)v102;

        uint64_t v104 = [v19 safeDataForKey:@"RSEPTBMDigests"];
        rsepTBMDigests = v21->_rsepTBMDigests;
        v21->_rsepTBMDigests = (NSData *)v104;

        uint64_t v106 = [v19 safeStringForKey:@"SUDocumentationID"];
        documentationID = v21->_documentationID;
        v21->_documentationID = (NSString *)v106;

        softwareUpdateURL = v21->_softwareUpdateURL;
        v21->_softwareUpdateURL = 0;

        uint64_t v109 = [v19 safeStringForKey:@"__BaseURL"];
        if (v109)
        {
          v110 = (void *)v109;
          v111 = [v19 safeStringForKey:@"__RelativePath"];

          if (v111)
          {
            id v112 = [NSString alloc];
            v113 = [v19 safeStringForKey:@"__BaseURL"];
            v114 = [v19 safeStringForKey:@"__RelativePath"];
            uint64_t v115 = [v112 initWithFormat:@"%@%@", v113, v114];
            v116 = v21->_softwareUpdateURL;
            v21->_softwareUpdateURL = (NSString *)v115;
          }
        }
        uint64_t v117 = [v19 safeDataForKey:@"_Measurement"];
        measurement = v21->_measurement;
        v21->_measurement = (NSData *)v117;

        uint64_t v119 = [v19 safeStringForKey:@"_MeasurementAlgorithm"];
        measurementAlgorithm = v21->_measurementAlgorithm;
        v21->_measurementAlgorithm = (NSString *)v119;

        if (v150)
        {
          v121 = [MEMORY[0x263F77DE8] sharedLogger];
          v122 = [v121 oslog];

          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v153 = v150;
            _os_log_impl(&dword_20C8EA000, v122, OS_LOG_TYPE_DEFAULT, "Override descriptor attribute msuPrepareSize with %{public}@", buf, 0xCu);
          }

          v123 = 0;
          v21->_msuPrepareSize = [v150 longLongValue];
        }
        else
        {
          v123 = SUCoreBorder_MSUAssetCalculatePrepareSize(v19);
          v21->_msuPrepareSize = 0;
          if (v123)
          {
            v124 = [MEMORY[0x263F77DA8] sharedDiag];
            [v124 trackAnomaly:@"[DESCRIPTOR]" forReason:@"unable to determine prepare size for installation" withResult:8100 withError:v123];
          }
        }
        if (v149)
        {
          v125 = [MEMORY[0x263F77DE8] sharedLogger];
          v126 = [v125 oslog];

          id v16 = v149;
          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v153 = v149;
            _os_log_impl(&dword_20C8EA000, v126, OS_LOG_TYPE_DEFAULT, "Override descriptor attribute installationSize with %{public}@", buf, 0xCu);
          }

          v21->_installationSize = [v149 longLongValue];
        }
        else
        {
          v127 = SUCoreBorder_MSUAssetCalculateApplySize(v19);

          v21->_installationSize = 0;
          if (v127)
          {
            v128 = [MEMORY[0x263F77DA8] sharedDiag];
            [v128 trackAnomaly:@"[DESCRIPTOR]" forReason:@"unable to determine apply size for installation" withResult:8100 withError:v127];
          }
          id v16 = 0;
        }
        id v15 = v150;
        if (+[SUCoreDescriptor isEmergencyUpdate:v19])
        {
          uint64_t v129 = 3;
        }
        else if (v21->_prerequisiteBuild || v21->_prerequisiteOSVersion)
        {
          uint64_t v129 = 1;
        }
        else
        {
          uint64_t v129 = 2;
        }
        v21->_updateType = v129;
        objc_storeStrong((id *)&v21->_softwareUpdateAsset, a3);
        documentationAsset = v21->_documentationAsset;
        v21->_documentationAsset = 0;

        documentation = v21->_documentation;
        v21->_documentation = 0;

        uint64_t v132 = [objc_alloc(MEMORY[0x263F77DF0]) initWithProductVersion:v21->_productVersion productBuildVersion:v21->_productBuildVersion releaseType:v21->_releaseType measurement:v21->_measurement measurementAlgorithm:v21->_measurementAlgorithm];
        softwareUpdateAssetIdentifier = v21->_softwareUpdateAssetIdentifier;
        v21->_softwareUpdateAssetIdentifier = (SUCoreMAIdentifier *)v132;

        documentationAssetIdentifier = v21->_documentationAssetIdentifier;
        v21->_documentationAssetIdentifier = 0;

        v21->_promoteAlternateUpdate = [v19 safeBooleanForKey:@"PromoteAlternateUpdate"];
        v21->_enableAlternateAssetAudience = [v19 safeBooleanForKey:@"EnableAlternateAssetAudience"];
        uint64_t v135 = [v19 safeStringForKey:@"AlternateAssetAudienceUUID"];
        alternateAssetAudienceUUID = v21->_alternateAssetAudienceUUID;
        v21->_alternateAssetAudienceUUID = (NSString *)v135;

        assetAudienceUUID = v21->_assetAudienceUUID;
        v21->_assetAudienceUUID = 0;

        updateBrainPath = v21->_updateBrainPath;
        v21->_updateBrainPath = 0;

        updateBundlePath = v21->_updateBundlePath;
        v21->_updateBundlePath = 0;

        v21->_splatOnly = [v19 safeBooleanForKey:@"SplatOnly"];
        v21->_semiSplatEnabled = [v19 safeBooleanForKey:@"SemiSplatEnabled"];
        uint64_t v140 = [v19 safeObjectForKey:@"SemiSplatMustQuitApps" ofClass:objc_opt_class()];
        semiSplatMustQuitApps = v21->_semiSplatMustQuitApps;
        v21->_semiSplatMustQuitApps = (NSArray *)v140;

        v21->_revoked = [v19 safeBooleanForKey:@"Revoked"];
        v21->_semiSplatRestartNow = 0;
        associatedSplatDescriptor = v21->_associatedSplatDescriptor;
        v21->_associatedSplatDescriptor = 0;

        v21->_disableSplatCombo = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"DisableSplombo", objc_msgSend(v17, "safeBooleanForKey:defaultValue:", @"DisableSplombo", 0));
        char v143 = objc_msgSend(v19, "safeBooleanForKey:defaultValue:", @"DisablePreSoftwareUpdateAssetStaging", objc_msgSend(v17, "safeBooleanForKey:defaultValue:", @"DisablePreSoftwareUpdateAssetStaging", 0));
        v21->_enablePreSUStaging = v143 ^ 1;
        if (v143)
        {
          v21->_enablePreSUStagingForOptionalAssets = 0;
        }
        else
        {
          if (v17)
          {
            uint64_t v144 = [v17 safeBooleanForKey:@"EnablePSUSForOptionalAssets" defaultValue:1];
            v145 = v19;
          }
          else
          {
            v145 = v19;
            uint64_t v144 = 1;
          }
          v21->_enablePreSUStagingForOptionalAssets = [v145 safeBooleanForKey:@"EnablePSUSForOptionalAssets" defaultValue:v144];
        }

        goto LABEL_51;
      }
      v65 = [MEMORY[0x263F77DA8] sharedDiag];
      v66 = v65;
      v67 = @"unable to create SU descriptor: update asset without attributes";
    }
    else
    {
      v65 = [MEMORY[0x263F77DA8] sharedDiag];
      v66 = v65;
      v67 = @"unable to create SU descriptor: unable to create attributes dictionary";
    }
    [v65 trackError:@"[DESCRIPTOR]" forReason:v67 withResult:8100 withError:0];

    v64 = 0;
LABEL_52:

    goto LABEL_53;
  }
  v63 = [MEMORY[0x263F77DA8] sharedDiag];
  [v63 trackError:@"[DESCRIPTOR]" forReason:@"unable to create SU descriptor: nil update asset" withResult:8100 withError:0];

  v64 = 0;
LABEL_53:

  return v64;
}

- (SUCoreDescriptor)initWithUpdateBrainPath:(id)a3 updateBundlePath:(id)a4 bundleAttributes:(id)a5
{
  return [(SUCoreDescriptor *)self initWithUpdateBrainPath:a3 updateBundlePath:a4 bundleAttributes:a5 descriptorType:2];
}

- (SUCoreDescriptor)initWithUpdateBrainPath:(id)a3 updateBundlePath:(id)a4 bundleAttributes:(id)a5 descriptorType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = v13;
  if (!v11)
  {
    v88 = [MEMORY[0x263F77DA8] sharedDiag];
    char v89 = v88;
    v90 = @"no update brain path was provided on descriptor initialization";
LABEL_14:
    [v88 trackError:@"[DESCRIPTOR]" forReason:v90 withResult:8100 withError:0];

    uint64_t v87 = 0;
    goto LABEL_15;
  }
  if (!v12)
  {
    v88 = [MEMORY[0x263F77DA8] sharedDiag];
    char v89 = v88;
    v90 = @"no update bundle path was provided on descriptor initialization";
    goto LABEL_14;
  }
  if (!v13)
  {
    v88 = [MEMORY[0x263F77DA8] sharedDiag];
    char v89 = v88;
    v90 = @"no update bundle attributes were provided on descriptor initialization";
    goto LABEL_14;
  }
  v92.receiver = self;
  v92.super_class = (Class)SUCoreDescriptor;
  id v15 = [(SUCoreDescriptor *)&v92 init];
  id v16 = v15;
  if (v15)
  {
    v15->_descriptorAudienceType = 0;
    v15->_preferredUpdateType = 0;
    v15->_descriptorType = a6;
    objc_storeStrong((id *)&v15->_updateBrainPath, a3);
    objc_storeStrong((id *)&v16->_updateBundlePath, a4);
    objc_storeStrong((id *)&v16->_bundleAttributes, a5);
    assetID = v16->_assetID;
    v16->_assetID = 0;

    uint64_t v18 = [v14 safeStringForKey:@"UniqueBuildID"];
    uniqueBuildID = v16->_uniqueBuildID;
    v16->_uniqueBuildID = (NSString *)v18;

    releaseDate = v16->_releaseDate;
    v16->_releaseDate = 0;

    uint64_t v21 = [v14 safeStringForKey:@"OSVersion"];
    rawProductVersion = v16->_rawProductVersion;
    v16->_rawProductVersion = (NSString *)v21;

    int v23 = v16->_rawProductVersion;
    if (!v23)
    {
      uint64_t v24 = [v14 safeStringForKey:@"ProductVersion"];
      v25 = v16->_rawProductVersion;
      v16->_rawProductVersion = (NSString *)v24;

      int v23 = v16->_rawProductVersion;
    }
    uint64_t v26 = +[SUCoreDescriptor cleanProductVersion:v23];
    productVersion = v16->_productVersion;
    v16->_productVersion = (NSString *)v26;

    uint64_t v28 = [v14 safeStringForKey:@"Build"];
    productBuildVersion = v16->_productBuildVersion;
    v16->_productBuildVersion = (NSString *)v28;

    if (!v16->_productBuildVersion)
    {
      uint64_t v30 = [v14 safeStringForKey:@"TargetUpdate"];
      uint64_t v31 = v16->_productBuildVersion;
      v16->_productBuildVersion = (NSString *)v30;
    }
    uint64_t v32 = [v14 safeStringForKey:@"ProductVersionExtra"];
    productVersionExtra = v16->_productVersionExtra;
    v16->_productVersionExtra = (NSString *)v32;

    uint64_t v34 = [v14 safeStringForKey:@"SUProductSystemName"];
    productSystemName = v16->_productSystemName;
    v16->_productSystemName = (NSString *)v34;

    uint64_t v36 = [v14 safeStringForKey:@"ReleaseType"];
    releaseType = v16->_releaseType;
    v16->_releaseType = (NSString *)v36;

    uint64_t v38 = [v14 safeStringForKey:@"SUPublisher"];
    publisher = v16->_publisher;
    v16->_publisher = (NSString *)v38;

    uint64_t v40 = [v14 safeStringForKey:@"RestoreVersion"];
    restoreVersion = v16->_restoreVersion;
    v16->_restoreVersion = (NSString *)v40;

    uint64_t v42 = [v14 safeStringForKey:@"TargetBridgeUpdateVersion"];
    targetUpdateBridgeVersion = v16->_targetUpdateBridgeVersion;
    v16->_targetUpdateBridgeVersion = (NSString *)v42;

    uint64_t v44 = [v14 safeStringForKey:@"TargetSFRUpdateVersion"];
    targetUpdateSFRVersion = v16->_targetUpdateSFRVersion;
    v16->_targetUpdateSFRVersion = (NSString *)v44;

    uint64_t v46 = [v14 safeStringForKey:@"TrainName"];
    trainName = v16->_trainName;
    v16->_trainName = (NSString *)v46;

    uint64_t v48 = [v14 safeStringForKey:@"PrerequisiteBuild"];
    prerequisiteBuild = v16->_prerequisiteBuild;
    v16->_prerequisiteBuild = (NSString *)v48;

    uint64_t v50 = [v14 safeStringForKey:@"PrerequisiteOSVersion"];
    prerequisiteOSVersion = v16->_prerequisiteOSVersion;
    v16->_prerequisiteOSVersion = (NSString *)v50;

    uint64_t v52 = [v14 safeObjectForKey:@"SupportedDevices" ofClass:objc_opt_class()];
    supportedDevices = v16->_supportedDevices;
    v16->_supportedDevices = (NSArray *)v52;

    v16->_suDownloadSize = 0;
    v16->_unarchivedSize = 0;
    systemPartitionPadding = v16->_systemPartitionPadding;
    v16->_minimumSystemPartitionSize = 0;
    v16->_systemPartitionPadding = 0;
    v16->_streamingZipCapable = 0;

    *(_WORD *)&v16->_disableCDLevel4 = 0;
    *(_DWORD *)&v16->_autoDownloadAllowableOverCellular = 0;
    v16->_preSUStagingRequiredSize = 0;
    v16->_preSUStagingOptionalSize = 0;
    v16->_disableInstallTonight = 1;
    *(_DWORD *)&v16->_forcePasscodeRequired = 0;
    *(_OWORD *)&v16->_mdmDelayInterval = xmmword_20C9906E0;
    v16->_containsSFRContent = [v14 safeBooleanForKey:@"ContainsSFRContent"];
    v16->_allowAutoDownloadOnBattery = 0;
    *(_OWORD *)&v16->_installAlertInterval = xmmword_20C9906F0;
    setupCritical = v16->_setupCritical;
    v16->_autoDownloadOnBatteryMinBattery = 80;
    v16->_setupCritical = 0;

    *(_WORD *)&v16->_criticalCellularOverride = 0;
    lastEmergencyBuild = v16->_lastEmergencyBuild;
    v16->_lastEmergencyBuild = 0;

    lastEmergencyOSVersion = v16->_lastEmergencyOSVersion;
    v16->_lastEmergencyOSVersion = 0;

    v16->_mandatoryUpdateEligible = 0;
    mandatoryUpdateVersionMin = v16->_mandatoryUpdateVersionMin;
    v16->_mandatoryUpdateVersionMin = 0;

    mandatoryUpdateVersionMax = v16->_mandatoryUpdateVersionMax;
    v16->_mandatoryUpdateVersionMax = 0;

    *(_WORD *)&v16->_mandatoryUpdateOptional = 0;
    v16->_oneShotBuddyDisabled = 0;
    oneShotBuddyDisabledBuilds = v16->_oneShotBuddyDisabledBuilds;
    v16->_oneShotBuddyDisabledBuilds = 0;

    v16->_criticalUpdate = 0;
    productType = v16->_productType;
    v16->_productType = 0;

    minimumBridgeVersion = v16->_minimumBridgeVersion;
    v16->_autoInstallDelay = 0;
    v16->_minimumBridgeVersion = 0;
    v16->_notifyAfter = 0;

    *(_WORD *)&v16->_disableRosettaUpdates = 0;
    v16->_requireInstallAssistantUpdate = 0;
    sepDigest = v16->_sepDigest;
    v16->_sepDigest = 0;

    sepTBMDigests = v16->_sepTBMDigests;
    v16->_sepTBMDigests = 0;

    rsepDigest = v16->_rsepDigest;
    v16->_rsepDigest = 0;

    rsepTBMDigests = v16->_rsepTBMDigests;
    v16->_rsepTBMDigests = 0;

    documentationID = v16->_documentationID;
    v16->_documentationID = 0;

    softwareUpdateURL = v16->_softwareUpdateURL;
    v16->_softwareUpdateURL = 0;

    measurement = v16->_measurement;
    v16->_measurement = 0;

    measurementAlgorithm = v16->_measurementAlgorithm;
    v16->_measurementAlgorithm = 0;

    v16->_updateType = 0;
    v16->_msuPrepareSize = 0;
    v16->_installationSize = 0;
    softwareUpdateAsset = v16->_softwareUpdateAsset;
    v16->_softwareUpdateAsset = 0;

    softwareUpdateAssetType = v16->_softwareUpdateAssetType;
    v16->_softwareUpdateAssetType = 0;

    softwareUpdateAssetAbsoluteID = v16->_softwareUpdateAssetAbsoluteID;
    v16->_softwareUpdateAssetAbsoluteID = 0;

    softwareUpdateAssetPurpose = v16->_softwareUpdateAssetPurpose;
    v16->_softwareUpdateAssetPurpose = 0;

    documentationAsset = v16->_documentationAsset;
    v16->_documentationAsset = 0;

    documentationAssetType = v16->_documentationAssetType;
    v16->_documentationAssetType = 0;

    documentationAssetAbsoluteID = v16->_documentationAssetAbsoluteID;
    v16->_documentationAssetAbsoluteID = 0;

    documentationAssetPurpose = v16->_documentationAssetPurpose;
    v16->_documentationAssetPurpose = 0;

    documentation = v16->_documentation;
    v16->_documentation = 0;

    softwareUpdateAssetIdentifier = v16->_softwareUpdateAssetIdentifier;
    v16->_softwareUpdateAssetIdentifier = 0;

    documentationAssetIdentifier = v16->_documentationAssetIdentifier;
    v16->_documentationAssetIdentifier = 0;

    *(_WORD *)&v16->_promoteAlternateUpdate = 0;
    alternateAssetAudienceUUID = v16->_alternateAssetAudienceUUID;
    v16->_alternateAssetAudienceUUID = 0;

    assetAudienceUUID = v16->_assetAudienceUUID;
    v16->_assetAudienceUUID = 0;

    v16->_splatOnly = [v14 safeBooleanForKey:@"SplatOnly"];
    v16->_semiSplatEnabled = [v14 safeBooleanForKey:@"SemiSplatEnabled"];
    uint64_t v84 = [v14 safeObjectForKey:@"SemiSplatMustQuitApps" ofClass:objc_opt_class()];
    semiSplatMustQuitApps = v16->_semiSplatMustQuitApps;
    v16->_semiSplatMustQuitApps = (NSArray *)v84;

    v16->_revoked = [v14 safeBooleanForKey:@"Revoked"];
    v16->_semiSplatRestartNow = 0;
    associatedSplatDescriptor = v16->_associatedSplatDescriptor;
    v16->_associatedSplatDescriptor = 0;

    *(_WORD *)&v16->_disableSplatCombo = 0;
    v16->_enablePreSUStagingForOptionalAssets = 0;
  }
  self = v16;
  uint64_t v87 = self;
LABEL_15:

  return v87;
}

- (id)initSemiSplatDescriptor
{
  v76.receiver = self;
  v76.super_class = (Class)SUCoreDescriptor;
  v2 = [(SUCoreDescriptor *)&v76 init];
  v3 = v2;
  if (v2)
  {
    v2->_descriptorAudienceType = 0;
    v2->_preferredUpdateType = 0;
    v2->_descriptorType = 6;
    updateBrainPath = v2->_updateBrainPath;
    v2->_updateBrainPath = 0;

    updateBundlePath = v3->_updateBundlePath;
    v3->_updateBundlePath = 0;

    bundleAttributes = v3->_bundleAttributes;
    v3->_bundleAttributes = 0;

    assetID = v3->_assetID;
    v3->_assetID = 0;

    uniqueBuildID = v3->_uniqueBuildID;
    v3->_uniqueBuildID = 0;

    releaseDate = v3->_releaseDate;
    v3->_releaseDate = 0;

    publisher = v3->_publisher;
    v3->_publisher = 0;

    id v11 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v12 = [v11 splatCryptex1ProductVersion];
    rawProductVersion = v3->_rawProductVersion;
    v3->_rawProductVersion = (NSString *)v12;

    id v14 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v15 = [v14 splatCryptex1ProductVersion];
    productVersion = v3->_productVersion;
    v3->_productVersion = (NSString *)v15;

    id v17 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v18 = [v17 splatCryptex1BuildVersionOverride];
    v19 = v18;
    if (v18)
    {
      v20 = v18;
      productBuildVersion = v3->_productBuildVersion;
      v3->_productBuildVersion = v20;
    }
    else
    {
      productBuildVersion = [MEMORY[0x263F77DA0] sharedDevice];
      uint64_t v22 = [productBuildVersion splatCryptex1BuildVersion];
      int v23 = v3->_productBuildVersion;
      v3->_productBuildVersion = (NSString *)v22;
    }
    uint64_t v24 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v25 = [v24 splatCryptex1ProductVersionExtra];
    productVersionExtra = v3->_productVersionExtra;
    v3->_productVersionExtra = (NSString *)v25;

    productSystemName = v3->_productSystemName;
    v3->_productSystemName = (NSString *)@"Security Response";

    uint64_t v28 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v29 = [v28 splatCryptex1ReleaseType];
    releaseType = v3->_releaseType;
    v3->_releaseType = (NSString *)v29;

    uint64_t v31 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v32 = [v31 splatCryptex1RestoreVersion];
    restoreVersion = v3->_restoreVersion;
    v3->_restoreVersion = (NSString *)v32;

    targetUpdateBridgeVersion = v3->_targetUpdateBridgeVersion;
    v3->_targetUpdateBridgeVersion = 0;

    targetUpdateSFRVersion = v3->_targetUpdateSFRVersion;
    v3->_targetUpdateSFRVersion = 0;

    trainName = v3->_trainName;
    v3->_trainName = 0;

    prerequisiteBuild = v3->_prerequisiteBuild;
    v3->_prerequisiteBuild = 0;

    prerequisiteOSVersion = v3->_prerequisiteOSVersion;
    v3->_prerequisiteOSVersion = 0;

    supportedDevices = v3->_supportedDevices;
    v3->_supportedDevices = 0;

    v3->_suDownloadSize = 0;
    v3->_unarchivedSize = 0;
    systemPartitionPadding = v3->_systemPartitionPadding;
    v3->_minimumSystemPartitionSize = 0;
    v3->_systemPartitionPadding = 0;
    v3->_streamingZipCapable = 0;

    *(_DWORD *)&v3->_forcePasscodeRequired = 0;
    *(void *)&v3->_autoDownloadAllowableOverCellular = 0;
    v3->_preSUStagingRequiredSize = 0;
    v3->_preSUStagingOptionalSize = 0;
    *(_WORD *)&v3->_containsSFRContent = 0;
    *(_OWORD *)&v3->_mdmDelayInterval = xmmword_20C9906E0;
    *(_OWORD *)&v3->_installAlertInterval = xmmword_20C9906F0;
    setupCritical = v3->_setupCritical;
    v3->_autoDownloadOnBatteryMinBattery = 80;
    v3->_setupCritical = 0;

    *(_WORD *)&v3->_criticalCellularOverride = 0;
    lastEmergencyBuild = v3->_lastEmergencyBuild;
    v3->_lastEmergencyBuild = 0;

    lastEmergencyOSVersion = v3->_lastEmergencyOSVersion;
    v3->_lastEmergencyOSVersion = 0;

    v3->_mandatoryUpdateEligible = 0;
    mandatoryUpdateVersionMin = v3->_mandatoryUpdateVersionMin;
    v3->_mandatoryUpdateVersionMin = 0;

    mandatoryUpdateVersionMax = v3->_mandatoryUpdateVersionMax;
    v3->_mandatoryUpdateVersionMax = 0;

    *(_WORD *)&v3->_mandatoryUpdateOptional = 0;
    v3->_oneShotBuddyDisabled = 0;
    oneShotBuddyDisabledBuilds = v3->_oneShotBuddyDisabledBuilds;
    v3->_oneShotBuddyDisabledBuilds = 0;

    v3->_criticalUpdate = 0;
    productType = v3->_productType;
    v3->_productType = 0;

    minimumBridgeVersion = v3->_minimumBridgeVersion;
    v3->_autoInstallDelay = 0;
    v3->_minimumBridgeVersion = 0;
    v3->_notifyAfter = 0;

    *(_WORD *)&v3->_disableRosettaUpdates = 0;
    v3->_requireInstallAssistantUpdate = 0;
    sepDigest = v3->_sepDigest;
    v3->_sepDigest = 0;

    sepTBMDigests = v3->_sepTBMDigests;
    v3->_sepTBMDigests = 0;

    rsepDigest = v3->_rsepDigest;
    v3->_rsepDigest = 0;

    rsepTBMDigests = v3->_rsepTBMDigests;
    v3->_rsepTBMDigests = 0;

    documentationID = v3->_documentationID;
    v3->_documentationID = 0;

    softwareUpdateURL = v3->_softwareUpdateURL;
    v3->_softwareUpdateURL = 0;

    measurement = v3->_measurement;
    v3->_measurement = 0;

    measurementAlgorithm = v3->_measurementAlgorithm;
    v3->_measurementAlgorithm = 0;

    v3->_updateType = 0;
    v3->_msuPrepareSize = 0;
    v3->_installationSize = 0;
    softwareUpdateAsset = v3->_softwareUpdateAsset;
    v3->_softwareUpdateAsset = 0;

    softwareUpdateAssetType = v3->_softwareUpdateAssetType;
    v3->_softwareUpdateAssetType = 0;

    softwareUpdateAssetAbsoluteID = v3->_softwareUpdateAssetAbsoluteID;
    v3->_softwareUpdateAssetAbsoluteID = 0;

    softwareUpdateAssetPurpose = v3->_softwareUpdateAssetPurpose;
    v3->_softwareUpdateAssetPurpose = 0;

    documentationAsset = v3->_documentationAsset;
    v3->_documentationAsset = 0;

    documentationAssetType = v3->_documentationAssetType;
    v3->_documentationAssetType = 0;

    documentationAssetAbsoluteID = v3->_documentationAssetAbsoluteID;
    v3->_documentationAssetAbsoluteID = 0;

    documentationAssetPurpose = v3->_documentationAssetPurpose;
    v3->_documentationAssetPurpose = 0;

    documentation = v3->_documentation;
    v3->_documentation = 0;

    softwareUpdateAssetIdentifier = v3->_softwareUpdateAssetIdentifier;
    v3->_softwareUpdateAssetIdentifier = 0;

    documentationAssetIdentifier = v3->_documentationAssetIdentifier;
    v3->_documentationAssetIdentifier = 0;

    *(_WORD *)&v3->_promoteAlternateUpdate = 0;
    alternateAssetAudienceUUID = v3->_alternateAssetAudienceUUID;
    v3->_alternateAssetAudienceUUID = 0;

    assetAudienceUUID = v3->_assetAudienceUUID;
    v3->_assetAudienceUUID = 0;

    *(_WORD *)&v3->_splatOnly = 257;
    semiSplatMustQuitApps = v3->_semiSplatMustQuitApps;
    v3->_semiSplatMustQuitApps = (NSArray *)&unk_26C19D370;

    *(_WORD *)&v3->_revoked = 256;
    associatedSplatDescriptor = v3->_associatedSplatDescriptor;
    v3->_associatedSplatDescriptor = 0;

    *(_WORD *)&v3->_disableSplatCombo = 0;
    v3->_enablePreSUStagingForOptionalAssets = 0;
    v72 = +[SUCoreDocumentationDataManager sharedManager];
    uint64_t v73 = [v72 getDocumentationForInstalledUpdateType:1 withError:0];
    v74 = v3->_documentation;
    v3->_documentation = (SUCoreDocumentation *)v73;
  }
  return v3;
}

- (void)assignDocumentationFromAsset:(id)a3
{
}

- (void)assignDocumentationFromAsset:(id)a3 extendingBundleProperties:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(SUCoreDescriptor *)self setDocumentationAsset:v6];
  v7 = [v6 assetType];
  [(SUCoreDescriptor *)self setDocumentationAssetType:v7];

  v8 = [v6 absoluteAssetId];
  [(SUCoreDescriptor *)self setDocumentationAssetAbsoluteID:v8];

  v9 = [v6 purpose];
  [(SUCoreDescriptor *)self setDocumentationAssetPurpose:v9];

  v10 = [[SUCoreDocumentation alloc] initWithDocumentationAsset:v6];
  [(SUCoreDescriptor *)self setDocumentation:v10];

  id v11 = objc_alloc(MEMORY[0x263F77DF0]);
  uint64_t v12 = [(SUCoreDescriptor *)self documentation];
  id v13 = [v12 serverAssetMeasurement];
  id v14 = [(SUCoreDescriptor *)self documentation];
  uint64_t v15 = [v14 serverAssetAlgorithm];
  id v16 = (void *)[v11 initWithProductVersion:0 productBuildVersion:0 releaseType:0 measurement:v13 measurementAlgorithm:v15];
  [(SUCoreDescriptor *)self setDocumentationAssetIdentifier:v16];

  if (v4)
  {
    id v18 = [(SUCoreDescriptor *)self documentation];
    id v17 = (id)[v18 extendDocumentationProperties];
  }
}

- (void)assignDescriptorAudienceType:(int64_t)a3 descriptorPreferredUpdateType:(int64_t)a4 assetAudienceUUID:(id)a5
{
  id v9 = a5;
  [(SUCoreDescriptor *)self setDescriptorAudienceType:a3];
  [(SUCoreDescriptor *)self setPreferredUpdateType:a4];
  v8 = v9;
  if (v9)
  {
    [(SUCoreDescriptor *)self setAssetAudienceUUID:v9];
    v8 = v9;
  }
}

- (NSString)humanReadableUpdateName
{
  v3 = [(SUCoreDescriptor *)self documentation];
  BOOL v4 = [v3 humanReadableUpdateName];

  if (!v4)
  {
    uint64_t v10 = [(SUCoreDescriptor *)self productSystemName];
    if (!v10
      || (id v11 = (void *)v10,
          [(SUCoreDescriptor *)self productVersion],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          !v12))
    {
      BOOL v4 = @"Software Update";
      goto LABEL_12;
    }
    BOOL v13 = [(SUCoreDescriptor *)self splatOnly];
    id v14 = [NSString alloc];
    v7 = [(SUCoreDescriptor *)self productSystemName];
    uint64_t v15 = [(SUCoreDescriptor *)self productVersion];
    v8 = (void *)v15;
    if (v13)
    {
      id v16 = [(SUCoreDescriptor *)self productVersionExtra];
      BOOL v4 = (__CFString *)[v14 initWithFormat:@"%@ Security Response %@ %@", v7, v8, v16];
    }
    else
    {
      BOOL v4 = (__CFString *)[v14 initWithFormat:@"%@ %@", v7, v15];
    }
    goto LABEL_11;
  }
  if ([(SUCoreDescriptor *)self splatOnly])
  {
    v5 = [(SUCoreDescriptor *)self productVersion];

    if (v5)
    {
      id v6 = [NSString alloc];
      v7 = [(SUCoreDescriptor *)self productVersion];
      v8 = [(SUCoreDescriptor *)self productVersionExtra];
      uint64_t v9 = [v6 initWithFormat:@"%@ %@ %@", v4, v7, v8];

      BOOL v4 = (__CFString *)v9;
LABEL_11:
    }
  }
LABEL_12:
  id v17 = [(SUCoreDescriptor *)self associatedSplatDescriptor];

  if (v17)
  {
    id v18 = [NSString alloc];
    v19 = [(SUCoreDescriptor *)self associatedSplatDescriptor];
    v20 = [v19 productVersionExtra];
    uint64_t v21 = [v18 initWithFormat:@"%@ %@", v4, v20];

    BOOL v4 = (__CFString *)v21;
  }
  uint64_t v22 = [MEMORY[0x263F77DA0] sharedDevice];
  if ([v22 isBootedOSSecureInternal])
  {
    uint64_t v23 = [(SUCoreDescriptor *)self productBuildVersion];
    if (v23)
    {
      uint64_t v24 = (void *)v23;
      id v25 = objc_alloc(MEMORY[0x263F77D90]);
      uint64_t v26 = (void *)[v25 initWithProjectName:*MEMORY[0x263F77EB8]];
      char v27 = [v26 getBoolConfigForKey:*MEMORY[0x263F77E68]];

      if (v27) {
        goto LABEL_19;
      }
      id v28 = [NSString alloc];
      uint64_t v22 = [(SUCoreDescriptor *)self productBuildVersion];
      uint64_t v29 = [v28 initWithFormat:@"%@ (%@)", v4, v22];

      BOOL v4 = (__CFString *)v29;
    }
  }

LABEL_19:

  return (NSString *)v4;
}

- (NSString)humanReadableUpdateTitle
{
  v2 = [(SUCoreDescriptor *)self documentation];
  v3 = [v2 humanReadableUpdateTitle];

  return (NSString *)v3;
}

- (NSString)humanReadableUpdateVersion
{
  v3 = [(SUCoreDescriptor *)self documentation];
  BOOL v4 = [v3 humanReadableUpdateVersion];

  if ([(SUCoreDescriptor *)self splatOnly])
  {
    uint64_t v5 = [(SUCoreDescriptor *)self productVersion];
    if (v5)
    {
      id v6 = (void *)v5;
      v7 = [(SUCoreDescriptor *)self productVersionExtra];

      if (v7)
      {
        id v8 = [NSString alloc];
        uint64_t v9 = [(SUCoreDescriptor *)self productVersion];
        uint64_t v10 = [(SUCoreDescriptor *)self productVersionExtra];
        uint64_t v11 = [v8 initWithFormat:@"%@ %@", v9, v10];

        BOOL v4 = (void *)v11;
      }
    }
  }
  uint64_t v12 = [MEMORY[0x263F77DA0] sharedDevice];
  if ([v12 isBootedOSSecureInternal]) {
    BOOL v13 = v4 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    uint64_t v14 = [(SUCoreDescriptor *)self productBuildVersion];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      id v16 = objc_alloc(MEMORY[0x263F77D90]);
      id v17 = (void *)[v16 initWithProjectName:*MEMORY[0x263F77EB8]];
      char v18 = [v17 getBoolConfigForKey:*MEMORY[0x263F77E68]];

      if (v18) {
        goto LABEL_13;
      }
      id v19 = [NSString alloc];
      uint64_t v12 = [(SUCoreDescriptor *)self productBuildVersion];
      uint64_t v20 = [v19 initWithFormat:@"%@ (%@)", v4, v12];

      BOOL v4 = (void *)v20;
    }
  }

LABEL_13:

  return (NSString *)v4;
}

- (NSString)humanReadableMoreInfoLink
{
  v2 = [(SUCoreDescriptor *)self documentation];
  v3 = [v2 humanReadableMoreInfoLink];

  return (NSString *)v3;
}

- (BOOL)notificationEnabled
{
  v2 = [(SUCoreDescriptor *)self documentation];
  char v3 = [v2 notificationEnabled];

  return v3;
}

- (NSString)notificationTitleString
{
  v2 = [(SUCoreDescriptor *)self documentation];
  char v3 = [v2 notificationTitleString];

  return (NSString *)v3;
}

- (NSString)notificationBodyString
{
  v2 = [(SUCoreDescriptor *)self documentation];
  char v3 = [v2 notificationBodyString];

  return (NSString *)v3;
}

- (BOOL)recommendedUpdateEnabled
{
  v2 = [(SUCoreDescriptor *)self documentation];
  char v3 = [v2 recommendedUpdateEnabled];

  return v3;
}

- (BOOL)recommendedUpdateApplicable
{
  v2 = [(SUCoreDescriptor *)self documentation];
  char v3 = [v2 recommendedUpdateApplicable];

  return v3;
}

- (NSNumber)recommendedUpdateNotificationFrequencyDays
{
  v2 = [(SUCoreDescriptor *)self documentation];
  char v3 = [v2 recommendedUpdateNotificationFrequencyDays];

  return (NSNumber *)v3;
}

- (NSString)recommendedUpdateMinOSVersion
{
  v2 = [(SUCoreDescriptor *)self documentation];
  char v3 = [v2 recommendedUpdateMinOSVersion];

  return (NSString *)v3;
}

- (NSString)recommendedUpdateMaxOSVersion
{
  v2 = [(SUCoreDescriptor *)self documentation];
  char v3 = [v2 recommendedUpdateMaxOSVersion];

  return (NSString *)v3;
}

- (NSString)recommendedUpdateTitleString
{
  v2 = [(SUCoreDescriptor *)self documentation];
  char v3 = [v2 recommendedUpdateTitleString];

  return (NSString *)v3;
}

- (NSString)recommendedUpdateAlertBodyString
{
  v2 = [(SUCoreDescriptor *)self documentation];
  char v3 = [v2 recommendedUpdateAlertBodyString];

  return (NSString *)v3;
}

- (NSString)mandatoryUpdateBodyString
{
  v2 = [(SUCoreDescriptor *)self documentation];
  char v3 = [v2 mandatoryUpdateBodyString];

  return (NSString *)v3;
}

- (NSString)publisher
{
  if (self->_publisher) {
    return self->_publisher;
  }
  else {
    return (NSString *)@"Apple, Inc.";
  }
}

- (NSString)productSystemName
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  productSystemName = self->_productSystemName;
  if (productSystemName)
  {
    char v3 = productSystemName;
  }
  else
  {
    BOOL v4 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v5 = [v4 marketingProductName];

    id v6 = [MEMORY[0x263F77DE8] sharedLogger];
    v7 = [v6 oslog];

    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        int v11 = 138543362;
        uint64_t v12 = v5;
        _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "Falling back to marketingProductName:%{public}@", (uint8_t *)&v11, 0xCu);
      }

      char v3 = [NSString stringWithString:v5];
    }
    else
    {
      if (v8)
      {
        int v11 = 138543362;
        uint64_t v12 = @"OS";
        _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "Falling back to kSUProductSystemNameDefault:%{public}@", (uint8_t *)&v11, 0xCu);
      }

      uint64_t v9 = [MEMORY[0x263F77DA8] sharedDiag];
      [v9 trackAnomaly:@"SUCoreDescriptor" forReason:@"Falling back to kSUProductSystemNameDefault due to no SUCoreDevice marketingProductName" withResult:8116 withError:0];

      char v3 = @"OS";
    }
  }

  return (NSString *)v3;
}

- (BOOL)fullReplacement
{
  char v3 = [(SUCoreDescriptor *)self prerequisiteBuild];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [(SUCoreDescriptor *)self prerequisiteOSVersion];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (unint64_t)unarchivedSize
{
  unint64_t unarchivedSize = self->_unarchivedSize;
  BOOL v4 = [(SUCoreDescriptor *)self associatedSplatDescriptor];

  if (v4)
  {
    uint64_t v5 = [(SUCoreDescriptor *)self associatedSplatDescriptor];
    unarchivedSize += [v5 unarchivedSize];
  }
  return unarchivedSize;
}

- (unint64_t)installationSize
{
  unint64_t installationSize = self->_installationSize;
  char v3 = [(SUCoreDescriptor *)self associatedSplatDescriptor];

  if (v3) {
    return installationSize + 32000000;
  }
  else {
    return installationSize;
  }
}

- (unint64_t)preparationSize
{
  unint64_t v3 = [(SUCoreDescriptor *)self unarchivedSize];
  return [(SUCoreDescriptor *)self msuPrepareSize] + v3;
}

- (unint64_t)refreshPrepareSize
{
  unint64_t v3 = [(SUCoreDescriptor *)self bundleAttributes];
  BOOL v4 = SUCoreBorder_MSUAssetCalculatePrepareSize(v3);

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F77DA8] sharedDiag];
    [v5 trackAnomaly:@"[DESCRIPTOR]", @"unable to determine refreshed prepare size, using preexisting value", 8100, v4 forReason withResult withError];
  }
  else
  {
    self->_msuPrepareSize = 0;
  }
  unint64_t v6 = [(SUCoreDescriptor *)self msuPrepareSize];

  return v6;
}

- (unint64_t)refreshInstallationSize
{
  unint64_t v3 = [(SUCoreDescriptor *)self bundleAttributes];
  BOOL v4 = SUCoreBorder_MSUAssetCalculateApplySize(v3);

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F77DA8] sharedDiag];
    [v5 trackAnomaly:@"[DESCRIPTOR]", @"unable to determine refreshed apply size for installation, using preexisting value", 8100, v4 forReason withResult withError];
  }
  else
  {
    self->_unint64_t installationSize = 0;
  }
  unint64_t v6 = [(SUCoreDescriptor *)self installationSize];

  return v6;
}

- (unint64_t)refreshTotalRequiredFreeSpace
{
  [(SUCoreDescriptor *)self refreshPrepareSize];
  [(SUCoreDescriptor *)self refreshInstallationSize];

  return [(SUCoreDescriptor *)self totalRequiredFreeSpace];
}

- (unint64_t)totalRequiredFreeSpace
{
  unint64_t v3 = [(SUCoreDescriptor *)self preparationSize];
  unint64_t v4 = [(SUCoreDescriptor *)self installationSize] + v3;
  if (![(SUCoreDescriptor *)self streamingZipCapable]) {
    v4 += [(SUCoreDescriptor *)self suDownloadSize];
  }
  uint64_t v5 = [(SUCoreDescriptor *)self associatedSplatDescriptor];
  if (v5)
  {
    unint64_t v6 = (void *)v5;
    v7 = [(SUCoreDescriptor *)self associatedSplatDescriptor];
    char v8 = [v7 streamingZipCapable];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [(SUCoreDescriptor *)self associatedSplatDescriptor];
      v4 += [v9 suDownloadSize];
    }
  }
  if ([(SUCoreDescriptor *)self enablePreSUStaging]) {
    v4 += [(SUCoreDescriptor *)self preSUStagingRequiredSize];
  }
  return v4;
}

- (unint64_t)downloadSize
{
  unint64_t v3 = [(SUCoreDescriptor *)self suDownloadSize];
  unint64_t v4 = [(SUCoreDescriptor *)self associatedSplatDescriptor];

  if (v4)
  {
    uint64_t v5 = [(SUCoreDescriptor *)self associatedSplatDescriptor];
    v3 += [v5 suDownloadSize];
  }
  if ([(SUCoreDescriptor *)self enablePreSUStaging]) {
    v3 += [(SUCoreDescriptor *)self preSUStagingRequiredSize];
  }
  return v3;
}

- (id)criticalOverrideCellularPolicy
{
  if ([(SUCoreDescriptor *)self criticalCellularOverride]) {
    v2 = @"WifiAndCellular";
  }
  else {
    v2 = @"WifiOnly";
  }

  return v2;
}

- (id)updateTypeName
{
  unint64_t v2 = [(SUCoreDescriptor *)self updateType];
  if (v2 > 5) {
    return @"unknown";
  }
  else {
    return off_2640DD670[v2];
  }
}

+ (BOOL)isEmergencyUpdate:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    unint64_t v4 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v5 = [v4 buildVersion];

    if (!v5)
    {
      id v17 = [MEMORY[0x263F77DE8] sharedLogger];
      v7 = [v17 oslog];

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "isEmergencyUpdate returns NO because currentBuild is nil", (uint8_t *)&v26, 2u);
      }
      BOOL v15 = 0;
      goto LABEL_34;
    }
    unint64_t v6 = [MEMORY[0x263F77DA0] sharedDevice];
    v7 = [v6 productVersion];

    if (!v7)
    {
      char v18 = [MEMORY[0x263F77DE8] sharedLogger];
      char v8 = [v18 oslog];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "isEmergencyUpdate returns NO because currentOSVersion is nil", (uint8_t *)&v26, 2u);
      }
      BOOL v15 = 0;
      goto LABEL_33;
    }
    char v8 = [v3 safeObjectForKey:@"LastEmergencyBuild" ofClass:objc_opt_class()];
    uint64_t v9 = [v3 safeObjectForKey:@"LastEmergencyOSVersion" ofClass:objc_opt_class()];
    uint64_t v10 = v9;
    if (v8 && v9)
    {
      if ([v9 compare:v7 options:64] == -1)
      {
        uint64_t v24 = [MEMORY[0x263F77DE8] sharedLogger];
        uint64_t v13 = [v24 oslog];

        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138543618;
          char v27 = v10;
          __int16 v28 = 2114;
          uint64_t v29 = v7;
          uint64_t v21 = "isEmergencyUpdate returns NO because lastEmergencyOSVersion:%{public}@ is less than currentOSVersion:%{public}@";
LABEL_29:
          uint64_t v22 = v13;
          uint32_t v23 = 22;
LABEL_30:
          _os_log_impl(&dword_20C8EA000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v26, v23);
        }
      }
      else
      {
        uint64_t v11 = [v8 compare:v5 options:64];
        uint64_t v12 = [MEMORY[0x263F77DE8] sharedLogger];
        uint64_t v13 = [v12 oslog];

        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v11 != -1)
        {
          if (v14)
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "isEmergencyUpdate: YES", (uint8_t *)&v26, 2u);
          }
          BOOL v15 = 1;
          goto LABEL_32;
        }
        if (v14)
        {
          int v26 = 138543618;
          char v27 = v8;
          __int16 v28 = 2114;
          uint64_t v29 = v5;
          uint64_t v21 = "isEmergencyUpdate returns NO because lastEmergencyBuild:%{public}@ is less than currentBuild:%{public}@";
          goto LABEL_29;
        }
      }
    }
    else
    {
      id v19 = [MEMORY[0x263F77DE8] sharedLogger];
      uint64_t v13 = [v19 oslog];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (v8) {
          uint64_t v20 = @"LastEmergencyOSVersion";
        }
        else {
          uint64_t v20 = @"LastEmergencyBuild";
        }
        int v26 = 138543362;
        char v27 = v20;
        uint64_t v21 = "isEmergencyUpdate returns NO because asset attributes does no contain %{public}@";
        uint64_t v22 = v13;
        uint32_t v23 = 12;
        goto LABEL_30;
      }
    }
    BOOL v15 = 0;
LABEL_32:

LABEL_33:
LABEL_34:

    goto LABEL_35;
  }
  id v16 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v5 = [v16 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_20C8EA000, v5, OS_LOG_TYPE_DEFAULT, "isEmergencyUpdate returns NO because assetAttributes is nil", (uint8_t *)&v26, 2u);
  }
  BOOL v15 = 0;
LABEL_35:

  return v15;
}

+ (id)nameForDescriptorType:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return @"Unknown";
  }
  else {
    return off_2640DD6A0[a3];
  }
}

+ (id)nameForDescriptorAudienceType:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"AudienceTypeUnknown";
  }
  else {
    return off_2640DD6D8[a3];
  }
}

+ (id)nameForDescriptorPreferredUpdateType:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"PreferredUpdateTypeUnknown";
  }
  else {
    return off_2640DD6F0[a3];
  }
}

+ (id)cleanProductVersion:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] >= 4
    && objc_msgSend(v3, "rangeOfString:options:range:", @"9.9.", 0, 0, 4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 4, &stru_26C1810A0);

    id v3 = (id)v4;
  }

  return v3;
}

- (BOOL)requiresSoftwareUpdateAssetReload
{
  id v3 = [(SUCoreDescriptor *)self softwareUpdateAssetAbsoluteID];
  if (v3)
  {
    uint64_t v4 = [(SUCoreDescriptor *)self softwareUpdateAsset];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)requiresDocumentationReload
{
  id v3 = [(SUCoreDescriptor *)self documentationAssetAbsoluteID];
  if (v3)
  {
    uint64_t v4 = [(SUCoreDescriptor *)self documentationAsset];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)transferNonAssetPropertiesFromDescriptor:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F77DE8];
  id v5 = a3;
  unint64_t v6 = [v4 sharedLogger];
  v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v15 = 0;
    _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "Transferring non-asset attribute properties from other descriptor", v15, 2u);
  }

  -[SUCoreDescriptor setDescriptorAudienceType:](self, "setDescriptorAudienceType:", [v5 descriptorAudienceType]);
  -[SUCoreDescriptor setPreferredUpdateType:](self, "setPreferredUpdateType:", [v5 preferredUpdateType]);
  char v8 = [v5 assetAudienceUUID];
  [(SUCoreDescriptor *)self setAssetAudienceUUID:v8];

  -[SUCoreDescriptor setPreSUStagingRequiredSize:](self, "setPreSUStagingRequiredSize:", [v5 preSUStagingRequiredSize]);
  -[SUCoreDescriptor setPreSUStagingOptionalSize:](self, "setPreSUStagingOptionalSize:", [v5 preSUStagingOptionalSize]);
  uint64_t v9 = [v5 documentation];
  [(SUCoreDescriptor *)self setDocumentation:v9];

  uint64_t v10 = [v5 documentationAsset];
  [(SUCoreDescriptor *)self setDocumentationAsset:v10];

  uint64_t v11 = [v5 documentationAssetType];
  [(SUCoreDescriptor *)self setDocumentationAssetType:v11];

  uint64_t v12 = [v5 documentationAssetIdentifier];
  [(SUCoreDescriptor *)self setDocumentationAssetIdentifier:v12];

  uint64_t v13 = [v5 documentationAssetAbsoluteID];
  [(SUCoreDescriptor *)self setDocumentationAssetAbsoluteID:v13];

  BOOL v14 = [v5 documentationAssetPurpose];

  [(SUCoreDescriptor *)self setDocumentationAssetPurpose:v14];
}

- (SUCoreDescriptor)initWithCoder:(id)a3
{
  v141[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v140.receiver = self;
  v140.super_class = (Class)SUCoreDescriptor;
  id v5 = [(SUCoreDescriptor *)&v140 init];
  if (v5)
  {
    v5->_descriptorType = (int)[v4 decodeIntForKey:@"DescriptorType"];
    v5->_descriptorAudienceType = (int)[v4 decodeIntForKey:@"DescriptorAudienceType"];
    v5->_preferredUpdateType = (int)[v4 decodeIntForKey:@"PreferredUpdateType"];
    v5->_updateType = (int)[v4 decodeIntForKey:@"UpdateType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AssetID"];
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SoftwareUpdateAssetType"];
    softwareUpdateAssetType = v5->_softwareUpdateAssetType;
    v5->_softwareUpdateAssetType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationAssetType"];
    documentationAssetType = v5->_documentationAssetType;
    v5->_documentationAssetType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SoftwareUpdateAssetAbsoluteID"];
    softwareUpdateAssetAbsoluteID = v5->_softwareUpdateAssetAbsoluteID;
    v5->_softwareUpdateAssetAbsoluteID = (MAAbsoluteAssetId *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationAssetAbsoluteID"];
    documentationAssetAbsoluteID = v5->_documentationAssetAbsoluteID;
    v5->_documentationAssetAbsoluteID = (MAAbsoluteAssetId *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SoftwareUpdateAssetPurpose"];
    softwareUpdateAssetPurpose = v5->_softwareUpdateAssetPurpose;
    v5->_softwareUpdateAssetPurpose = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationAssetPurpose"];
    documentationAssetPurpose = v5->_documentationAssetPurpose;
    v5->_documentationAssetPurpose = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UniqueBuildID"];
    uniqueBuildID = v5->_uniqueBuildID;
    v5->_uniqueBuildID = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductVersion"];
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductBuildVersion"];
    productBuildVersion = v5->_productBuildVersion;
    v5->_productBuildVersion = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductVersionExtra"];
    productVersionExtra = v5->_productVersionExtra;
    v5->_productVersionExtra = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductSystemName"];
    productSystemName = v5->_productSystemName;
    v5->_productSystemName = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseType"];
    releaseType = v5->_releaseType;
    v5->_releaseType = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Publisher"];
    publisher = v5->_publisher;
    v5->_publisher = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseDate"];
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RestoreVersion"];
    restoreVersion = v5->_restoreVersion;
    v5->_restoreVersion = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TargetUpdateBridgeVersion"];
    targetUpdateBridgeVersion = v5->_targetUpdateBridgeVersion;
    v5->_targetUpdateBridgeVersion = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TargetUpdateSFRVersion"];
    targetUpdateSFRVersion = v5->_targetUpdateSFRVersion;
    v5->_targetUpdateSFRVersion = (NSString *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TrainName"];
    trainName = v5->_trainName;
    v5->_trainName = (NSString *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteBuild"];
    prerequisiteBuild = v5->_prerequisiteBuild;
    v5->_prerequisiteBuild = (NSString *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteOSVersion"];
    prerequisiteOSVersion = v5->_prerequisiteOSVersion;
    v5->_prerequisiteOSVersion = (NSString *)v46;

    uint64_t v48 = (void *)MEMORY[0x263EFFA08];
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    uint64_t v51 = [v4 decodeObjectOfClasses:v50 forKey:@"SupportedDevices"];
    supportedDevices = v5->_supportedDevices;
    v5->_supportedDevices = (NSArray *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUDownloadSize"];
    v5->_suDownloadSize = [v53 unsignedLongLongValue];

    v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UnarchiveSize"];
    v5->_unint64_t unarchivedSize = [v54 unsignedLongLongValue];

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSUPrepareSize"];
    v5->_msuPrepareSize = [v55 unsignedLongLongValue];

    v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstallationSize"];
    v5->_unint64_t installationSize = [v56 unsignedLongLongValue];

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MinimumSystemPartitionSize"];
    v5->_minimumSystemPartitionSize = [v57 unsignedLongLongValue];

    v5->_streamingZipCapable = [v4 decodeBoolForKey:@"StreamingZipCapable"];
    v58 = (void *)MEMORY[0x263EFFA08];
    v141[0] = objc_opt_class();
    v141[1] = objc_opt_class();
    v141[2] = objc_opt_class();
    v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v141 count:3];
    v139 = [v58 setWithArray:v59];

    uint64_t v60 = [v4 decodeObjectOfClasses:v139 forKey:@"SystemPartitionPadding"];
    systemPartitionPadding = v5->_systemPartitionPadding;
    v5->_systemPartitionPadding = (NSDictionary *)v60;

    id v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PSUSRequiredSize"];
    v5->_preSUStagingRequiredSize = [v62 unsignedLongLongValue];

    v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PSUSOptionalSize"];
    v5->_preSUStagingOptionalSize = [v63 unsignedLongLongValue];

    v5->_autoDownloadAllowableOverCellular = [v4 decodeBoolForKey:@"AutoDownloadAllowableOverCellular"];
    v5->_downloadAllowableOverCellular = [v4 decodeBoolForKey:@"DownloadAllowableOverCellular"];
    v5->_downloadable = [v4 decodeBoolForKey:@"Downloadable"];
    v5->_disableSiriVoiceDeletion = [v4 decodeBoolForKey:@"DisableSiriVoiceDeletion"];
    v5->_disableCDLevel4 = [v4 decodeBoolForKey:@"DisableCDLevel4"];
    v5->_disableAppDemotion = [v4 decodeBoolForKey:@"DisableAppDemotion"];
    v5->_disableInstallTonight = [v4 decodeBoolForKey:@"DisableInstallTonight"];
    v5->_forcePasscodeRequired = [v4 decodeBoolForKey:@"ForcePasscodeRequired"];
    v5->_rampEnabled = [v4 decodeBoolForKey:@"RampEnabled"];
    v5->_granularlyRamped = [v4 decodeBoolForKey:@"GranularlyRamped"];
    v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MDMDelayInterval"];
    v5->_mdmDelayInterval = [v64 unsignedLongLongValue];

    v5->_autoUpdateEnabled = [v4 decodeBoolForKey:@"AutoUpdateEnabled"];
    v5->_hideInstallAlert = [v4 decodeIntegerForKey:@"HideInstallAlert"];
    v5->_containsSFRContent = [v4 decodeBoolForKey:@"ContainsSFRContent"];
    v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstallAlertInterval"];
    v5->_installAlertInterval = [v65 unsignedLongLongValue];

    v5->_allowAutoDownloadOnBattery = [v4 decodeBoolForKey:@"AllowAutoDownloadOnBattery"];
    v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AutoDownloadOnBatteryDelay"];
    v5->_autoDownloadOnBatteryDelay = [v66 unsignedLongLongValue];

    v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AutoDownloadOnBatteryMinBattery"];
    v5->_autoDownloadOnBatteryMinBattery = [v67 unsignedLongLongValue];

    uint64_t v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SetupCritical"];
    setupCritical = v5->_setupCritical;
    v5->_setupCritical = (NSString *)v68;

    v5->_criticalCellularOverride = [v4 decodeBoolForKey:@"CriticalCellularOverride"];
    v5->_criticalOutOfBoxOnly = [v4 decodeBoolForKey:@"CriticalOutOfBoxOnly"];
    uint64_t v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastEmergencyBuild"];
    lastEmergencyBuild = v5->_lastEmergencyBuild;
    v5->_lastEmergencyBuild = (NSString *)v70;

    uint64_t v72 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastEmergencyOSVersion"];
    lastEmergencyOSVersion = v5->_lastEmergencyOSVersion;
    v5->_lastEmergencyOSVersion = (NSString *)v72;

    v5->_mandatoryUpdateEligible = [v4 decodeBoolForKey:@"MandatoryUpdateEligible"];
    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MandatoryUpdateVersionMin"];
    mandatoryUpdateVersionMin = v5->_mandatoryUpdateVersionMin;
    v5->_mandatoryUpdateVersionMin = (NSString *)v74;

    uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MandatoryUpdateVersionMax"];
    mandatoryUpdateVersionMax = v5->_mandatoryUpdateVersionMax;
    v5->_mandatoryUpdateVersionMax = (NSString *)v76;

    v5->_mandatoryUpdateOptional = [v4 decodeBoolForKey:@"MandatoryUpdateOptional"];
    v5->_mandatoryUpdateRestrictedToOutOfTheBox = [v4 decodeBoolForKey:@"MandatoryUpdateRestrictedToOutOfTheBox"];
    v5->_oneShotBuddyDisabled = [v4 decodeBoolForKey:@"OneShotBuddyDisabled"];
    v78 = (void *)MEMORY[0x263EFFA08];
    uint64_t v79 = objc_opt_class();
    v80 = objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
    uint64_t v81 = [v4 decodeObjectOfClasses:v80 forKey:@"OneShotBuddyDisabledBuilds"];
    oneShotBuddyDisabledBuilds = v5->_oneShotBuddyDisabledBuilds;
    v5->_oneShotBuddyDisabledBuilds = (NSArray *)v81;

    v5->_criticalUpdate = [v4 decodeBoolForKey:@"CriticalUpdate"];
    uint64_t v83 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductType"];
    productType = v5->_productType;
    v5->_productType = (NSString *)v83;

    uint64_t v85 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AutoInstallDelay"];
    v5->_autoInstallDelay = [v85 unsignedLongLongValue];

    v5->_notifyAfter = [v4 decodeBoolForKey:@"NotifyAfter"];
    uint64_t v86 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MinimumBridgeVersion"];
    minimumBridgeVersion = v5->_minimumBridgeVersion;
    v5->_minimumBridgeVersion = (NSString *)v86;

    v5->_disableRosettaUpdates = [v4 decodeBoolForKey:@"DisableRosettaUpdates"];
    v5->_disableRecoveryOSUpdates = [v4 decodeBoolForKey:@"DisableRecoveryOSUpdates"];
    v5->_requireInstallAssistantUpdate = [v4 decodeBoolForKey:@"RequireInstallAssistantUpdate"];
    uint64_t v88 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SEPDigest"];
    sepDigest = v5->_sepDigest;
    v5->_sepDigest = (NSData *)v88;

    uint64_t v90 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SEPTBMDigests"];
    sepTBMDigests = v5->_sepTBMDigests;
    v5->_sepTBMDigests = (NSData *)v90;

    uint64_t v92 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RSEPDigest"];
    rsepDigest = v5->_rsepDigest;
    v5->_rsepDigest = (NSData *)v92;

    uint64_t v94 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RSEPTBMDigests"];
    rsepTBMDigests = v5->_rsepTBMDigests;
    v5->_rsepTBMDigests = (NSData *)v94;

    uint64_t v96 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationID"];
    documentationID = v5->_documentationID;
    v5->_documentationID = (NSString *)v96;

    uint64_t v98 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Documentation"];
    documentation = v5->_documentation;
    v5->_documentation = (SUCoreDocumentation *)v98;

    uint64_t v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SoftwareUpdateURL"];
    softwareUpdateURL = v5->_softwareUpdateURL;
    v5->_softwareUpdateURL = (NSString *)v100;

    uint64_t v102 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Measurement"];
    measurement = v5->_measurement;
    v5->_measurement = (NSData *)v102;

    uint64_t v104 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MeasurementAlgorithm"];
    measurementAlgorithm = v5->_measurementAlgorithm;
    v5->_measurementAlgorithm = (NSString *)v104;

    uint64_t v106 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SoftwareUpdateAssetIdentifier"];
    softwareUpdateAssetIdentifier = v5->_softwareUpdateAssetIdentifier;
    v5->_softwareUpdateAssetIdentifier = (SUCoreMAIdentifier *)v106;

    uint64_t v108 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationAssetIdentifier"];
    documentationAssetIdentifier = v5->_documentationAssetIdentifier;
    v5->_documentationAssetIdentifier = (SUCoreMAIdentifier *)v108;

    v5->_promoteAlternateUpdate = [v4 decodeBoolForKey:@"PromoteAlternateUpdate"];
    v5->_enableAlternateAssetAudience = [v4 decodeBoolForKey:@"EnableAlternateAssetAudienceUUID"];
    uint64_t v110 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AlternateAssetAudienceUUID"];
    alternateAssetAudienceUUID = v5->_alternateAssetAudienceUUID;
    v5->_alternateAssetAudienceUUID = (NSString *)v110;

    uint64_t v112 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AssetAudienceUUID"];
    assetAudienceUUID = v5->_assetAudienceUUID;
    v5->_assetAudienceUUID = (NSString *)v112;

    uint64_t v114 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UpdateBrainPath"];
    updateBrainPath = v5->_updateBrainPath;
    v5->_updateBrainPath = (NSString *)v114;

    uint64_t v116 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UpdateBundlePath"];
    updateBundlePath = v5->_updateBundlePath;
    v5->_updateBundlePath = (NSString *)v116;

    v5->_splatOnly = [v4 decodeBoolForKey:@"SplatOnly"];
    v5->_semiSplatEnabled = [v4 decodeBoolForKey:@"SemiSplatEnabled"];
    v118 = (void *)MEMORY[0x263EFFA08];
    uint64_t v119 = objc_opt_class();
    v120 = objc_msgSend(v118, "setWithObjects:", v119, objc_opt_class(), 0);
    uint64_t v121 = [v4 decodeObjectOfClasses:v120 forKey:@"SemiSplatMustQuitApps"];
    semiSplatMustQuitApps = v5->_semiSplatMustQuitApps;
    v5->_semiSplatMustQuitApps = (NSArray *)v121;

    v5->_revoked = [v4 decodeBoolForKey:@"Revoked"];
    v5->_semiSplatRestartNow = [v4 decodeBoolForKey:@"SemiSplatRestartNow"];
    v5->_disableSplatCombo = [v4 decodeBoolForKey:@"DisableSplombo"];
    uint64_t v123 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AssociatedSplatDescriptor"];
    associatedSplatDescriptor = v5->_associatedSplatDescriptor;
    v5->_associatedSplatDescriptor = (SUCoreDescriptor *)v123;

    v125 = (void *)MEMORY[0x263EFFA08];
    uint64_t v126 = objc_opt_class();
    uint64_t v127 = objc_opt_class();
    uint64_t v128 = objc_opt_class();
    uint64_t v129 = objc_opt_class();
    uint64_t v130 = objc_opt_class();
    uint64_t v131 = objc_opt_class();
    uint64_t v132 = objc_opt_class();
    v133 = objc_msgSend(v125, "setWithObjects:", v126, v127, v128, v129, v130, v131, v132, objc_opt_class(), 0);
    uint64_t v134 = [v4 decodeObjectOfClasses:v133 forKey:@"BundleAttributes"];
    bundleAttributes = v5->_bundleAttributes;
    v5->_bundleAttributes = (NSDictionary *)v134;

    softwareUpdateAsset = v5->_softwareUpdateAsset;
    v5->_softwareUpdateAsset = 0;

    documentationAsset = v5->_documentationAsset;
    v5->_documentationAsset = 0;

    v5->_enablePreSUStaging = [v4 decodeBoolForKey:@"EnablePSUS"];
    v5->_enablePreSUStagingForOptionalAssets = [v4 decodeBoolForKey:@"EnablePSUSForOptionalAssets"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v65 = a3;
  objc_msgSend(v65, "encodeInt:forKey:", -[SUCoreDescriptor descriptorType](self, "descriptorType"), @"DescriptorType");
  objc_msgSend(v65, "encodeInt:forKey:", -[SUCoreDescriptor descriptorAudienceType](self, "descriptorAudienceType"), @"DescriptorAudienceType");
  objc_msgSend(v65, "encodeInt:forKey:", -[SUCoreDescriptor preferredUpdateType](self, "preferredUpdateType"), @"PreferredUpdateType");
  objc_msgSend(v65, "encodeInt:forKey:", -[SUCoreDescriptor updateType](self, "updateType"), @"UpdateType");
  id v4 = [(SUCoreDescriptor *)self assetID];
  [v65 encodeObject:v4 forKey:@"AssetID"];

  id v5 = [(SUCoreDescriptor *)self softwareUpdateAssetType];
  [v65 encodeObject:v5 forKey:@"SoftwareUpdateAssetType"];

  uint64_t v6 = [(SUCoreDescriptor *)self documentationAssetType];
  [v65 encodeObject:v6 forKey:@"DocumentationAssetType"];

  v7 = [(SUCoreDescriptor *)self softwareUpdateAssetAbsoluteID];
  [v65 encodeObject:v7 forKey:@"SoftwareUpdateAssetAbsoluteID"];

  uint64_t v8 = [(SUCoreDescriptor *)self documentationAssetAbsoluteID];
  [v65 encodeObject:v8 forKey:@"DocumentationAssetAbsoluteID"];

  uint64_t v9 = [(SUCoreDescriptor *)self softwareUpdateAssetPurpose];
  [v65 encodeObject:v9 forKey:@"SoftwareUpdateAssetPurpose"];

  uint64_t v10 = [(SUCoreDescriptor *)self documentationAssetPurpose];
  [v65 encodeObject:v10 forKey:@"DocumentationAssetPurpose"];

  uint64_t v11 = [(SUCoreDescriptor *)self uniqueBuildID];
  [v65 encodeObject:v11 forKey:@"UniqueBuildID"];

  uint64_t v12 = [(SUCoreDescriptor *)self productVersion];
  [v65 encodeObject:v12 forKey:@"ProductVersion"];

  uint64_t v13 = [(SUCoreDescriptor *)self productBuildVersion];
  [v65 encodeObject:v13 forKey:@"ProductBuildVersion"];

  uint64_t v14 = [(SUCoreDescriptor *)self productVersionExtra];
  [v65 encodeObject:v14 forKey:@"ProductVersionExtra"];

  BOOL v15 = [(SUCoreDescriptor *)self productSystemName];
  [v65 encodeObject:v15 forKey:@"ProductSystemName"];

  uint64_t v16 = [(SUCoreDescriptor *)self releaseType];
  [v65 encodeObject:v16 forKey:@"ReleaseType"];

  id v17 = [(SUCoreDescriptor *)self publisher];
  [v65 encodeObject:v17 forKey:@"Publisher"];

  uint64_t v18 = [(SUCoreDescriptor *)self releaseDate];
  [v65 encodeObject:v18 forKey:@"ReleaseDate"];

  id v19 = [(SUCoreDescriptor *)self restoreVersion];
  [v65 encodeObject:v19 forKey:@"RestoreVersion"];

  uint64_t v20 = [(SUCoreDescriptor *)self targetUpdateBridgeVersion];
  [v65 encodeObject:v20 forKey:@"TargetUpdateBridgeVersion"];

  uint64_t v21 = [(SUCoreDescriptor *)self targetUpdateSFRVersion];
  [v65 encodeObject:v21 forKey:@"TargetUpdateSFRVersion"];

  uint64_t v22 = [(SUCoreDescriptor *)self trainName];
  [v65 encodeObject:v22 forKey:@"TrainName"];

  uint32_t v23 = [(SUCoreDescriptor *)self prerequisiteBuild];
  [v65 encodeObject:v23 forKey:@"PrerequisiteBuild"];

  uint64_t v24 = [(SUCoreDescriptor *)self prerequisiteOSVersion];
  [v65 encodeObject:v24 forKey:@"PrerequisiteOSVersion"];

  id v25 = [(SUCoreDescriptor *)self supportedDevices];
  [v65 encodeObject:v25 forKey:@"SupportedDevices"];

  uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUCoreDescriptor suDownloadSize](self, "suDownloadSize"));
  [v65 encodeObject:v26 forKey:@"SUDownloadSize"];

  char v27 = [NSNumber numberWithUnsignedLongLong:self->_unarchivedSize];
  [v65 encodeObject:v27 forKey:@"UnarchiveSize"];

  uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUCoreDescriptor msuPrepareSize](self, "msuPrepareSize"));
  [v65 encodeObject:v28 forKey:@"MSUPrepareSize"];

  uint64_t v29 = [NSNumber numberWithUnsignedLongLong:self->_installationSize];
  [v65 encodeObject:v29 forKey:@"InstallationSize"];

  uint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUCoreDescriptor minimumSystemPartitionSize](self, "minimumSystemPartitionSize"));
  [v65 encodeObject:v30 forKey:@"MinimumSystemPartitionSize"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor streamingZipCapable](self, "streamingZipCapable"), @"StreamingZipCapable");
  uint64_t v31 = [(SUCoreDescriptor *)self systemPartitionPadding];
  [v65 encodeObject:v31 forKey:@"SystemPartitionPadding"];

  uint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUCoreDescriptor preSUStagingRequiredSize](self, "preSUStagingRequiredSize"));
  [v65 encodeObject:v32 forKey:@"PSUSRequiredSize"];

  v33 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUCoreDescriptor preSUStagingOptionalSize](self, "preSUStagingOptionalSize"));
  [v65 encodeObject:v33 forKey:@"PSUSOptionalSize"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor autoDownloadAllowableOverCellular](self, "autoDownloadAllowableOverCellular"), @"AutoDownloadAllowableOverCellular");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor downloadAllowableOverCellular](self, "downloadAllowableOverCellular"), @"DownloadAllowableOverCellular");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor downloadable](self, "downloadable"), @"Downloadable");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor disableSiriVoiceDeletion](self, "disableSiriVoiceDeletion"), @"DisableSiriVoiceDeletion");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor disableCDLevel4](self, "disableCDLevel4"), @"DisableCDLevel4");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor disableAppDemotion](self, "disableAppDemotion"), @"DisableAppDemotion");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor disableInstallTonight](self, "disableInstallTonight"), @"DisableInstallTonight");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor forcePasscodeRequired](self, "forcePasscodeRequired"), @"ForcePasscodeRequired");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor rampEnabled](self, "rampEnabled"), @"RampEnabled");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor granularlyRamped](self, "granularlyRamped"), @"GranularlyRamped");
  uint64_t v34 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUCoreDescriptor mdmDelayInterval](self, "mdmDelayInterval"));
  [v65 encodeObject:v34 forKey:@"MDMDelayInterval"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor autoUpdateEnabled](self, "autoUpdateEnabled"), @"AutoUpdateEnabled");
  objc_msgSend(v65, "encodeInteger:forKey:", -[SUCoreDescriptor hideInstallAlert](self, "hideInstallAlert"), @"HideInstallAlert");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor containsSFRContent](self, "containsSFRContent"), @"ContainsSFRContent");
  uint64_t v35 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUCoreDescriptor installAlertInterval](self, "installAlertInterval"));
  [v65 encodeObject:v35 forKey:@"InstallAlertInterval"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor allowAutoDownloadOnBattery](self, "allowAutoDownloadOnBattery"), @"AllowAutoDownloadOnBattery");
  uint64_t v36 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUCoreDescriptor autoDownloadOnBatteryDelay](self, "autoDownloadOnBatteryDelay"));
  [v65 encodeObject:v36 forKey:@"AutoDownloadOnBatteryDelay"];

  uint64_t v37 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUCoreDescriptor autoDownloadOnBatteryMinBattery](self, "autoDownloadOnBatteryMinBattery"));
  [v65 encodeObject:v37 forKey:@"AutoDownloadOnBatteryMinBattery"];

  uint64_t v38 = [(SUCoreDescriptor *)self setupCritical];
  [v65 encodeObject:v38 forKey:@"SetupCritical"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor criticalCellularOverride](self, "criticalCellularOverride"), @"CriticalCellularOverride");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor criticalOutOfBoxOnly](self, "criticalOutOfBoxOnly"), @"CriticalOutOfBoxOnly");
  uint64_t v39 = [(SUCoreDescriptor *)self lastEmergencyBuild];
  [v65 encodeObject:v39 forKey:@"LastEmergencyBuild"];

  uint64_t v40 = [(SUCoreDescriptor *)self lastEmergencyOSVersion];
  [v65 encodeObject:v40 forKey:@"LastEmergencyOSVersion"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor mandatoryUpdateEligible](self, "mandatoryUpdateEligible"), @"MandatoryUpdateEligible");
  uint64_t v41 = [(SUCoreDescriptor *)self mandatoryUpdateVersionMin];
  [v65 encodeObject:v41 forKey:@"MandatoryUpdateVersionMin"];

  uint64_t v42 = [(SUCoreDescriptor *)self mandatoryUpdateVersionMax];
  [v65 encodeObject:v42 forKey:@"MandatoryUpdateVersionMax"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor mandatoryUpdateOptional](self, "mandatoryUpdateOptional"), @"MandatoryUpdateOptional");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor mandatoryUpdateRestrictedToOutOfTheBox](self, "mandatoryUpdateRestrictedToOutOfTheBox"), @"MandatoryUpdateRestrictedToOutOfTheBox");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor oneShotBuddyDisabled](self, "oneShotBuddyDisabled"), @"OneShotBuddyDisabled");
  uint64_t v43 = [(SUCoreDescriptor *)self oneShotBuddyDisabledBuilds];
  [v65 encodeObject:v43 forKey:@"OneShotBuddyDisabledBuilds"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor criticalUpdate](self, "criticalUpdate"), @"CriticalUpdate");
  uint64_t v44 = [(SUCoreDescriptor *)self productType];
  [v65 encodeObject:v44 forKey:@"ProductType"];

  uint64_t v45 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUCoreDescriptor autoInstallDelay](self, "autoInstallDelay"));
  [v65 encodeObject:v45 forKey:@"AutoInstallDelay"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor notifyAfter](self, "notifyAfter"), @"NotifyAfter");
  uint64_t v46 = [(SUCoreDescriptor *)self minimumBridgeVersion];
  [v65 encodeObject:v46 forKey:@"MinimumBridgeVersion"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor disableRosettaUpdates](self, "disableRosettaUpdates"), @"DisableRosettaUpdates");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor disableRecoveryOSUpdates](self, "disableRecoveryOSUpdates"), @"DisableRecoveryOSUpdates");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor requireInstallAssistantUpdate](self, "requireInstallAssistantUpdate"), @"RequireInstallAssistantUpdate");
  uint64_t v47 = [(SUCoreDescriptor *)self sepDigest];
  [v65 encodeObject:v47 forKey:@"SEPDigest"];

  uint64_t v48 = [(SUCoreDescriptor *)self sepTBMDigests];
  [v65 encodeObject:v48 forKey:@"SEPTBMDigests"];

  uint64_t v49 = [(SUCoreDescriptor *)self rsepDigest];
  [v65 encodeObject:v49 forKey:@"RSEPDigest"];

  uint64_t v50 = [(SUCoreDescriptor *)self rsepTBMDigests];
  [v65 encodeObject:v50 forKey:@"RSEPTBMDigests"];

  uint64_t v51 = [(SUCoreDescriptor *)self documentationID];
  [v65 encodeObject:v51 forKey:@"DocumentationID"];

  uint64_t v52 = [(SUCoreDescriptor *)self documentation];
  [v65 encodeObject:v52 forKey:@"Documentation"];

  uint64_t v53 = [(SUCoreDescriptor *)self softwareUpdateURL];
  [v65 encodeObject:v53 forKey:@"SoftwareUpdateURL"];

  v54 = [(SUCoreDescriptor *)self measurement];
  [v65 encodeObject:v54 forKey:@"Measurement"];

  uint64_t v55 = [(SUCoreDescriptor *)self measurementAlgorithm];
  [v65 encodeObject:v55 forKey:@"MeasurementAlgorithm"];

  v56 = [(SUCoreDescriptor *)self softwareUpdateAssetIdentifier];
  [v65 encodeObject:v56 forKey:@"SoftwareUpdateAssetIdentifier"];

  uint64_t v57 = [(SUCoreDescriptor *)self documentationAssetIdentifier];
  [v65 encodeObject:v57 forKey:@"DocumentationAssetIdentifier"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor promoteAlternateUpdate](self, "promoteAlternateUpdate"), @"PromoteAlternateUpdate");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor enableAlternateAssetAudience](self, "enableAlternateAssetAudience"), @"EnableAlternateAssetAudienceUUID");
  v58 = [(SUCoreDescriptor *)self alternateAssetAudienceUUID];
  [v65 encodeObject:v58 forKey:@"AlternateAssetAudienceUUID"];

  v59 = [(SUCoreDescriptor *)self assetAudienceUUID];
  [v65 encodeObject:v59 forKey:@"AssetAudienceUUID"];

  uint64_t v60 = [(SUCoreDescriptor *)self updateBrainPath];
  [v65 encodeObject:v60 forKey:@"UpdateBrainPath"];

  id v61 = [(SUCoreDescriptor *)self updateBundlePath];
  [v65 encodeObject:v61 forKey:@"UpdateBundlePath"];

  id v62 = [(SUCoreDescriptor *)self bundleAttributes];
  [v65 encodeObject:v62 forKey:@"BundleAttributes"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor splatOnly](self, "splatOnly"), @"SplatOnly");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor semiSplatEnabled](self, "semiSplatEnabled"), @"SemiSplatEnabled");
  v63 = [(SUCoreDescriptor *)self semiSplatMustQuitApps];
  [v65 encodeObject:v63 forKey:@"SemiSplatMustQuitApps"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor revoked](self, "revoked"), @"Revoked");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor semiSplatRestartNow](self, "semiSplatRestartNow"), @"SemiSplatRestartNow");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor disableSplatCombo](self, "disableSplatCombo"), @"DisableSplombo");
  v64 = [(SUCoreDescriptor *)self associatedSplatDescriptor];
  [v65 encodeObject:v64 forKey:@"AssociatedSplatDescriptor"];

  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor enablePreSUStaging](self, "enablePreSUStaging"), @"EnablePSUS");
  objc_msgSend(v65, "encodeBool:forKey:", -[SUCoreDescriptor enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets"), @"EnablePSUSForOptionalAssets");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCoreDescriptor *)a3;
  if (v4 == self)
  {
    char v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int64_t v6 = [(SUCoreDescriptor *)self descriptorType];
      if (v6 == [(SUCoreDescriptor *)v5 descriptorType])
      {
        unint64_t v7 = [(SUCoreDescriptor *)self preSUStagingRequiredSize];
        if (v7 == [(SUCoreDescriptor *)v5 preSUStagingRequiredSize])
        {
          unint64_t v8 = [(SUCoreDescriptor *)self preSUStagingOptionalSize];
          if (v8 == [(SUCoreDescriptor *)v5 preSUStagingOptionalSize])
          {
            uint64_t v9 = [(SUCoreDescriptor *)self associatedSplatDescriptor];

            if (v9)
            {
              uint64_t v10 = [(SUCoreDescriptor *)self associatedSplatDescriptor];
              uint64_t v11 = [(SUCoreDescriptor *)v5 associatedSplatDescriptor];
              char v12 = [v10 isEqual:v11];

              if (v12)
              {
LABEL_8:
                if ([(SUCoreDescriptor *)self descriptorType] == 2
                  || [(SUCoreDescriptor *)self descriptorType] == 4)
                {
                  uint64_t v13 = (void *)MEMORY[0x263F77D78];
                  uint64_t v14 = [(SUCoreDescriptor *)self updateBrainPath];
                  BOOL v15 = [(SUCoreDescriptor *)v5 updateBrainPath];
                  if ([v13 stringIsEqual:v14 to:v15])
                  {
                    uint64_t v16 = (void *)MEMORY[0x263F77D78];
                    id v17 = [(SUCoreDescriptor *)self updateBundlePath];
                    uint64_t v18 = [(SUCoreDescriptor *)v5 updateBundlePath];
                    char v19 = [v16 stringIsEqual:v17 to:v18];

LABEL_29:
                    goto LABEL_16;
                  }
                }
                else
                {
                  uint64_t v22 = objc_msgSend(NSNumber, "numberWithInteger:", -[SUCoreDescriptor descriptorType](self, "descriptorType"));
                  int v23 = [&unk_26C19D388 containsObject:v22];

                  if (v23)
                  {
                    uint64_t v24 = (void *)MEMORY[0x263F77D78];
                    uint64_t v14 = [(SUCoreDescriptor *)self productVersion];
                    BOOL v15 = [(SUCoreDescriptor *)v5 productVersion];
                    if ([v24 stringIsEqual:v14 to:v15])
                    {
                      id v25 = (void *)MEMORY[0x263F77D78];
                      uint64_t v26 = [(SUCoreDescriptor *)self productBuildVersion];
                      char v27 = [(SUCoreDescriptor *)v5 productBuildVersion];
                      if ([v25 stringIsEqual:v26 to:v27])
                      {
                        uint64_t v28 = (void *)MEMORY[0x263F77D78];
                        uint64_t v29 = [(SUCoreDescriptor *)self productVersionExtra];
                        uint64_t v60 = [(SUCoreDescriptor *)v5 productVersionExtra];
                        id v61 = v29;
                        if (objc_msgSend(v28, "stringIsEqual:to:", v29))
                        {
                          uint64_t v30 = (void *)MEMORY[0x263F77D78];
                          uint64_t v31 = [(SUCoreDescriptor *)self releaseType];
                          uint64_t v32 = [(SUCoreDescriptor *)v5 releaseType];
                          v33 = v30;
                          uint64_t v34 = (void *)v32;
                          v59 = (void *)v31;
                          if ([v33 stringIsEqual:v31 to:v32])
                          {
                            v58 = v34;
                            uint64_t v35 = (void *)MEMORY[0x263F77D78];
                            uint64_t v36 = [(SUCoreDescriptor *)self restoreVersion];
                            uint64_t v37 = [(SUCoreDescriptor *)v5 restoreVersion];
                            uint64_t v38 = v35;
                            uint64_t v39 = (void *)v36;
                            uint64_t v57 = (void *)v37;
                            if (objc_msgSend(v38, "stringIsEqual:to:", v36))
                            {
                              v56 = (void *)v36;
                              uint64_t v40 = (void *)MEMORY[0x263F77D78];
                              uint64_t v41 = [(SUCoreDescriptor *)self targetUpdateBridgeVersion];
                              [(SUCoreDescriptor *)v5 targetUpdateBridgeVersion];
                              uint64_t v55 = v54 = (void *)v41;
                              if (objc_msgSend(v40, "stringIsEqual:to:", v41))
                              {
                                uint64_t v42 = (void *)MEMORY[0x263F77D78];
                                uint64_t v43 = [(SUCoreDescriptor *)self targetUpdateSFRVersion];
                                uint64_t v44 = [(SUCoreDescriptor *)v5 targetUpdateSFRVersion];
                                uint64_t v53 = (void *)v43;
                                uint64_t v45 = v43;
                                uint64_t v46 = (void *)v44;
                                if (objc_msgSend(v42, "stringIsEqual:to:", v45))
                                {
                                  uint64_t v52 = (void *)MEMORY[0x263F77D78];
                                  uint64_t v47 = [(SUCoreDescriptor *)self trainName];
                                  uint64_t v48 = [(SUCoreDescriptor *)v5 trainName];
                                  char v19 = [v52 stringIsEqual:v47 to:v48];
                                }
                                else
                                {
                                  char v19 = 0;
                                }
                              }
                              else
                              {
                                char v19 = 0;
                              }

                              uint64_t v51 = (void *)v60;
                              uint64_t v29 = v61;
                              uint64_t v39 = v56;
                            }
                            else
                            {
                              char v19 = 0;
                              uint64_t v51 = (void *)v60;
                              uint64_t v29 = v61;
                            }

                            uint64_t v34 = v58;
                          }
                          else
                          {
                            char v19 = 0;
                            uint64_t v51 = (void *)v60;
                            uint64_t v29 = v61;
                          }
                        }
                        else
                        {
                          char v19 = 0;
                          uint64_t v51 = (void *)v60;
                        }
                      }
                      else
                      {
                        char v19 = 0;
                      }

                      goto LABEL_29;
                    }
                  }
                  else
                  {
                    id v49 = [NSString alloc];
                    uint64_t v50 = +[SUCoreDescriptor nameForDescriptorType:[(SUCoreDescriptor *)self descriptorType]];
                    uint64_t v14 = (void *)[v49 initWithFormat:@"Unexpected descriptor type %@", v50];

                    BOOL v15 = [MEMORY[0x263F77DA8] sharedDiag];
                    [v15 trackAnomaly:@"DescriptorIsEqual" forReason:v14 withResult:8116 withError:0];
                  }
                }
                char v19 = 0;
                goto LABEL_29;
              }
            }
            else
            {
              uint64_t v20 = [(SUCoreDescriptor *)v5 associatedSplatDescriptor];

              if (!v20) {
                goto LABEL_8;
              }
            }
          }
        }
      }
      char v19 = 0;
LABEL_16:

      goto LABEL_17;
    }
    char v19 = 0;
  }
LABEL_17:

  return v19;
}

- (id)description
{
  if ([(SUCoreDescriptor *)self descriptorType] == 2
    || [(SUCoreDescriptor *)self descriptorType] == 4)
  {
    id v3 = [NSString alloc];
    id v4 = +[SUCoreDescriptor nameForDescriptorType:[(SUCoreDescriptor *)self descriptorType]];
    id v5 = [(SUCoreDescriptor *)self updateBrainPath];
    int64_t v6 = [(SUCoreDescriptor *)self updateBundlePath];
    unint64_t v7 = [(SUCoreDescriptor *)self bundleAttributes];
    unint64_t v8 = (void *)[v3 initWithFormat:@"\n[>>>\n    descriptorType: %@\n   updateBrainPath: %@\n  updateBundlePath: %@\n  bundleAttributes: %@\n<<<]", v4, v5, v6, v7];
  }
  else
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[SUCoreDescriptor descriptorType](self, "descriptorType"));
    int v11 = [&unk_26C19D3A0 containsObject:v10];

    id v12 = [NSString alloc];
    uint64_t v13 = +[SUCoreDescriptor nameForDescriptorType:[(SUCoreDescriptor *)self descriptorType]];
    uint64_t v14 = (void *)v13;
    if (v11)
    {
      uint64_t v104 = +[SUCoreDescriptor nameForDescriptorAudienceType:[(SUCoreDescriptor *)self descriptorAudienceType]];
      v103 = +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:[(SUCoreDescriptor *)self preferredUpdateType]];
      uint64_t v102 = [(SUCoreDescriptor *)self humanReadableUpdateName];
      v101 = [(SUCoreDescriptor *)self humanReadableUpdateTitle];
      uint64_t v100 = [(SUCoreDescriptor *)self humanReadableUpdateVersion];
      v99 = [(SUCoreDescriptor *)self humanReadableMoreInfoLink];
      v59 = v12;
      if ([(SUCoreDescriptor *)self notificationEnabled]) {
        BOOL v15 = @"YES";
      }
      else {
        BOOL v15 = @"NO";
      }
      v58 = v15;
      uint64_t v98 = [(SUCoreDescriptor *)self notificationTitleString];
      v97 = [(SUCoreDescriptor *)self notificationBodyString];
      if ([(SUCoreDescriptor *)self recommendedUpdateEnabled]) {
        uint64_t v16 = @"YES";
      }
      else {
        uint64_t v16 = @"NO";
      }
      uint64_t v57 = v16;
      if ([(SUCoreDescriptor *)self recommendedUpdateApplicable]) {
        id v17 = @"YES";
      }
      else {
        id v17 = @"NO";
      }
      v56 = v17;
      uint64_t v96 = [(SUCoreDescriptor *)self recommendedUpdateNotificationFrequencyDays];
      v95 = [(SUCoreDescriptor *)self recommendedUpdateMinOSVersion];
      uint64_t v94 = [(SUCoreDescriptor *)self recommendedUpdateMaxOSVersion];
      v93 = [(SUCoreDescriptor *)self recommendedUpdateTitleString];
      uint64_t v92 = [(SUCoreDescriptor *)self recommendedUpdateAlertBodyString];
      v91 = [(SUCoreDescriptor *)self mandatoryUpdateBodyString];
      uint64_t v90 = [(SUCoreDescriptor *)self updateTypeName];
      char v89 = [(SUCoreDescriptor *)self assetID];
      uint64_t v88 = [(SUCoreDescriptor *)self softwareUpdateAssetType];
      uint64_t v87 = [(SUCoreDescriptor *)self documentationAssetType];
      uint64_t v86 = [(SUCoreDescriptor *)self softwareUpdateAssetAbsoluteID];
      uint64_t v85 = [(SUCoreDescriptor *)self documentationAssetAbsoluteID];
      uint64_t v84 = [(SUCoreDescriptor *)self softwareUpdateAssetPurpose];
      uint64_t v83 = [(SUCoreDescriptor *)self documentationAssetPurpose];
      if ([(SUCoreDescriptor *)self promoteAlternateUpdate]) {
        uint64_t v18 = @"YES";
      }
      else {
        uint64_t v18 = @"NO";
      }
      uint64_t v55 = v18;
      if ([(SUCoreDescriptor *)self enableAlternateAssetAudience]) {
        char v19 = @"YES";
      }
      else {
        char v19 = @"NO";
      }
      v54 = v19;
      v82 = [(SUCoreDescriptor *)self alternateAssetAudienceUUID];
      uint64_t v81 = [(SUCoreDescriptor *)self assetAudienceUUID];
      v80 = [(SUCoreDescriptor *)self uniqueBuildID];
      uint64_t v79 = [(SUCoreDescriptor *)self trainName];
      v78 = [(SUCoreDescriptor *)self productVersion];
      uint64_t v77 = [(SUCoreDescriptor *)self productBuildVersion];
      uint64_t v76 = [(SUCoreDescriptor *)self productVersionExtra];
      uint64_t v75 = [(SUCoreDescriptor *)self productSystemName];
      uint64_t v74 = [(SUCoreDescriptor *)self releaseType];
      uint64_t v73 = [(SUCoreDescriptor *)self publisher];
      uint64_t v72 = [(SUCoreDescriptor *)self restoreVersion];
      uint64_t v53 = [(SUCoreDescriptor *)self targetUpdateBridgeVersion];
      uint64_t v52 = [(SUCoreDescriptor *)self targetUpdateSFRVersion];
      uint64_t v51 = [(SUCoreDescriptor *)self releaseDate];
      uint64_t v50 = [(SUCoreDescriptor *)self prerequisiteBuild];
      id v49 = [(SUCoreDescriptor *)self prerequisiteOSVersion];
      uint64_t v48 = [(SUCoreDescriptor *)self supportedDevices];
      if ([(SUCoreDescriptor *)self fullReplacement]) {
        uint64_t v20 = @"YES";
      }
      else {
        uint64_t v20 = @"NO";
      }
      uint64_t v47 = v20;
      unint64_t v46 = [(SUCoreDescriptor *)self downloadSize];
      unint64_t v45 = [(SUCoreDescriptor *)self unarchivedSize];
      unint64_t v44 = [(SUCoreDescriptor *)self msuPrepareSize];
      unint64_t v43 = [(SUCoreDescriptor *)self preparationSize];
      unint64_t v42 = [(SUCoreDescriptor *)self installationSize];
      unint64_t v41 = [(SUCoreDescriptor *)self minimumSystemPartitionSize];
      unint64_t v40 = [(SUCoreDescriptor *)self totalRequiredFreeSpace];
      if ([(SUCoreDescriptor *)self streamingZipCapable]) {
        uint64_t v21 = @"YES";
      }
      else {
        uint64_t v21 = @"NO";
      }
      uint64_t v39 = v21;
      uint64_t v38 = [(SUCoreDescriptor *)self systemPartitionPadding];
      unint64_t v37 = [(SUCoreDescriptor *)self preSUStagingRequiredSize];
      unint64_t v36 = [(SUCoreDescriptor *)self preSUStagingOptionalSize];
      unint64_t v35 = [(SUCoreDescriptor *)self suDownloadSize];
      if ([(SUCoreDescriptor *)self enablePreSUStaging]) {
        uint64_t v22 = @"YES";
      }
      else {
        uint64_t v22 = @"NO";
      }
      uint64_t v34 = v22;
      if ([(SUCoreDescriptor *)self enablePreSUStagingForOptionalAssets]) {
        int v23 = @"YES";
      }
      else {
        int v23 = @"NO";
      }
      v33 = v23;
      [(SUCoreDescriptor *)self autoDownloadAllowableOverCellular];
      [(SUCoreDescriptor *)self downloadAllowableOverCellular];
      [(SUCoreDescriptor *)self downloadable];
      [(SUCoreDescriptor *)self disableSiriVoiceDeletion];
      [(SUCoreDescriptor *)self disableCDLevel4];
      [(SUCoreDescriptor *)self disableAppDemotion];
      [(SUCoreDescriptor *)self disableInstallTonight];
      [(SUCoreDescriptor *)self forcePasscodeRequired];
      [(SUCoreDescriptor *)self rampEnabled];
      [(SUCoreDescriptor *)self granularlyRamped];
      [(SUCoreDescriptor *)self mdmDelayInterval];
      [(SUCoreDescriptor *)self autoUpdateEnabled];
      uint64_t v71 = objc_msgSend(MEMORY[0x263F77D78], "stringFromTriState:", -[SUCoreDescriptor hideInstallAlert](self, "hideInstallAlert"));
      [(SUCoreDescriptor *)self containsSFRContent];
      [(SUCoreDescriptor *)self installAlertInterval];
      [(SUCoreDescriptor *)self allowAutoDownloadOnBattery];
      [(SUCoreDescriptor *)self autoDownloadOnBatteryDelay];
      [(SUCoreDescriptor *)self autoDownloadOnBatteryMinBattery];
      [(SUCoreDescriptor *)self disableSplatCombo];
      uint64_t v70 = [(SUCoreDescriptor *)self setupCritical];
      [(SUCoreDescriptor *)self criticalCellularOverride];
      [(SUCoreDescriptor *)self criticalOutOfBoxOnly];
      uint64_t v69 = [(SUCoreDescriptor *)self lastEmergencyBuild];
      uint64_t v68 = [(SUCoreDescriptor *)self lastEmergencyOSVersion];
      [(SUCoreDescriptor *)self mandatoryUpdateEligible];
      v67 = [(SUCoreDescriptor *)self mandatoryUpdateVersionMin];
      v66 = [(SUCoreDescriptor *)self mandatoryUpdateVersionMax];
      [(SUCoreDescriptor *)self mandatoryUpdateOptional];
      [(SUCoreDescriptor *)self mandatoryUpdateRestrictedToOutOfTheBox];
      [(SUCoreDescriptor *)self oneShotBuddyDisabled];
      id v65 = [(SUCoreDescriptor *)self oneShotBuddyDisabledBuilds];
      [(SUCoreDescriptor *)self criticalUpdate];
      v64 = [(SUCoreDescriptor *)self productType];
      [(SUCoreDescriptor *)self autoInstallDelay];
      [(SUCoreDescriptor *)self notifyAfter];
      v63 = [(SUCoreDescriptor *)self minimumBridgeVersion];
      [(SUCoreDescriptor *)self disableRosettaUpdates];
      [(SUCoreDescriptor *)self disableRecoveryOSUpdates];
      [(SUCoreDescriptor *)self requireInstallAssistantUpdate];
      uint64_t v32 = [(SUCoreDescriptor *)self sepDigest];
      uint64_t v31 = [(SUCoreDescriptor *)self sepTBMDigests];
      uint64_t v30 = [(SUCoreDescriptor *)self rsepDigest];
      uint64_t v29 = [(SUCoreDescriptor *)self rsepTBMDigests];
      id v62 = [(SUCoreDescriptor *)self documentationID];
      id v61 = [(SUCoreDescriptor *)self documentation];
      uint64_t v60 = [(SUCoreDescriptor *)self softwareUpdateURL];
      uint64_t v24 = [(SUCoreDescriptor *)self measurement];
      id v25 = [(SUCoreDescriptor *)self measurementAlgorithm];
      uint64_t v26 = [(SUCoreDescriptor *)self bundleAttributes];
      [(SUCoreDescriptor *)self splatOnly];
      [(SUCoreDescriptor *)self semiSplatEnabled];
      char v27 = [(SUCoreDescriptor *)self semiSplatMustQuitApps];
      [(SUCoreDescriptor *)self revoked];
      [(SUCoreDescriptor *)self semiSplatRestartNow];
      uint64_t v28 = [(SUCoreDescriptor *)self associatedSplatDescriptor];
      unint64_t v8 = objc_msgSend(v59, "initWithFormat:", &cfstr_Descriptortype_1, v14, v104, v103, v102, v101, v100, v99, v58, v98, v97, v57, v56, v96, v95, v94, v93,
                     v92,
                     v91,
                     v90,
                     v89,
                     v88,
                     v87,
                     v86,
                     v85,
                     v84,
                     v83,
                     v55,
                     v54,
                     v82,
                     v81,
                     v80,
                     v79,
                     v78,
                     v77,
                     v76,
                     v75,
                     v74,
                     v73,
                     v72,
                     v53,
                     v52,
                     v51,
                     v50,
                     v49,
                     v48,
                     v47,
                     v46,
                     v45,
                     v44,
                     v43,
                     v42,
                     v41,
                     v40,
                     v39,
                     v38,
                     v37,
                     v36,
                     v35,
                     v34,
                     v33);

      id v4 = v14;
    }
    else
    {
      unint64_t v8 = (void *)[v12 initWithFormat:@"Unexpected descriptor type %@", v13];

      id v4 = [MEMORY[0x263F77DA8] sharedDiag];
      [v4 trackAnomaly:@"DescriptorDescription" forReason:v8 withResult:8116 withError:0];
    }
  }

  return v8;
}

- (id)overview
{
  return [(SUCoreDescriptor *)self overviewWithMaxValueLength:0 providingSubstitutionMap:0];
}

- (id)overviewWithMaxValueLength:(unint64_t)a3 providingSubstitutionMap:(id)a4
{
  id v6 = a4;
  if ([(SUCoreDescriptor *)self descriptorType] == 2
    || [(SUCoreDescriptor *)self descriptorType] == 4)
  {
    id v7 = [NSString alloc];
    unint64_t v8 = +[SUCoreDescriptor nameForDescriptorType:[(SUCoreDescriptor *)self descriptorType]];
    uint64_t v9 = (void *)MEMORY[0x263F77D78];
    uint64_t v10 = [(SUCoreDescriptor *)self updateBrainPath];
    int v11 = [v9 limitString:v10 toMaxLength:a3 providingSubstitutionMap:v6];
    id v12 = (void *)MEMORY[0x263F77D78];
    uint64_t v13 = [(SUCoreDescriptor *)self updateBundlePath];
    uint64_t v14 = [v12 limitString:v13 toMaxLength:a3 providingSubstitutionMap:v6];
    BOOL v15 = (void *)[v7 initWithFormat:@"\n[>>>\n    descriptorType: %@\n   updateBrainPath: %@\n  updateBundlePath: %@\n<<<]", v8, v11, v14];
  }
  else
  {
    id v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[SUCoreDescriptor descriptorType](self, "descriptorType"));
    int v18 = [&unk_26C19D3B8 containsObject:v17];

    id v19 = [NSString alloc];
    uint64_t v20 = +[SUCoreDescriptor nameForDescriptorType:[(SUCoreDescriptor *)self descriptorType]];
    unint64_t v8 = (void *)v20;
    if (v18)
    {
      uint64_t v112 = +[SUCoreDescriptor nameForDescriptorAudienceType:[(SUCoreDescriptor *)self descriptorAudienceType]];
      v111 = +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:[(SUCoreDescriptor *)self preferredUpdateType]];
      uint64_t v21 = (void *)MEMORY[0x263F77D78];
      v95 = [(SUCoreDescriptor *)self humanReadableUpdateName];
      uint64_t v110 = [v21 limitString:v95 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v22 = (void *)MEMORY[0x263F77D78];
      uint64_t v94 = [(SUCoreDescriptor *)self humanReadableUpdateTitle];
      uint64_t v109 = [v22 limitString:v94 toMaxLength:a3 providingSubstitutionMap:v6];
      int v23 = (void *)MEMORY[0x263F77D78];
      v93 = [(SUCoreDescriptor *)self humanReadableUpdateVersion];
      uint64_t v108 = [v23 limitString:v93 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v24 = (void *)MEMORY[0x263F77D78];
      uint64_t v92 = [(SUCoreDescriptor *)self humanReadableMoreInfoLink];
      v107 = [v24 limitString:v92 toMaxLength:a3 providingSubstitutionMap:v6];
      id v25 = (void *)MEMORY[0x263F77D78];
      v91 = [(SUCoreDescriptor *)self updateTypeName];
      uint64_t v106 = [v25 limitString:v91 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v26 = (void *)MEMORY[0x263F77D78];
      uint64_t v90 = [(SUCoreDescriptor *)self productVersion];
      v105 = [v26 limitString:v90 toMaxLength:a3 providingSubstitutionMap:v6];
      char v27 = (void *)MEMORY[0x263F77D78];
      char v89 = [(SUCoreDescriptor *)self productBuildVersion];
      uint64_t v104 = [v27 limitString:v89 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v28 = (void *)MEMORY[0x263F77D78];
      uint64_t v88 = [(SUCoreDescriptor *)self restoreVersion];
      v103 = [v28 limitString:v88 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v29 = (void *)MEMORY[0x263F77D78];
      uint64_t v87 = [(SUCoreDescriptor *)self targetUpdateBridgeVersion];
      uint64_t v102 = [v29 limitString:v87 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v30 = (void *)MEMORY[0x263F77D78];
      uint64_t v86 = [(SUCoreDescriptor *)self targetUpdateSFRVersion];
      v101 = [v30 limitString:v86 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v31 = (void *)MEMORY[0x263F77D78];
      uint64_t v85 = [(SUCoreDescriptor *)self releaseType];
      uint64_t v100 = [v31 limitString:v85 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v32 = (void *)MEMORY[0x263F77D78];
      uint64_t v84 = [(SUCoreDescriptor *)self releaseDate];
      uint64_t v83 = [v84 description];
      v99 = [v32 limitString:v83 toMaxLength:a3 providingSubstitutionMap:v6];
      v33 = (void *)MEMORY[0x263F77D78];
      v82 = [(SUCoreDescriptor *)self prerequisiteBuild];
      uint64_t v98 = [v33 limitString:v82 toMaxLength:a3 providingSubstitutionMap:v6];
      uint64_t v34 = (void *)MEMORY[0x263F77D78];
      uint64_t v81 = [(SUCoreDescriptor *)self prerequisiteOSVersion];
      v97 = [v34 limitString:v81 toMaxLength:a3 providingSubstitutionMap:v6];
      unint64_t v80 = [(SUCoreDescriptor *)self downloadSize];
      unint64_t v79 = [(SUCoreDescriptor *)self preSUStagingRequiredSize];
      unint64_t v78 = [(SUCoreDescriptor *)self preSUStagingOptionalSize];
      unint64_t v77 = [(SUCoreDescriptor *)self suDownloadSize];
      unint64_t v76 = [(SUCoreDescriptor *)self unarchivedSize];
      unint64_t v75 = [(SUCoreDescriptor *)self preparationSize];
      unint64_t v73 = [(SUCoreDescriptor *)self installationSize];
      unint64_t v72 = [(SUCoreDescriptor *)self totalRequiredFreeSpace];
      unint64_t v35 = @"YES";
      if ([(SUCoreDescriptor *)self rampEnabled]) {
        unint64_t v36 = @"YES";
      }
      else {
        unint64_t v36 = @"NO";
      }
      uint64_t v71 = v36;
      if ([(SUCoreDescriptor *)self granularlyRamped]) {
        unint64_t v37 = @"YES";
      }
      else {
        unint64_t v37 = @"NO";
      }
      uint64_t v69 = v37;
      unint64_t v68 = [(SUCoreDescriptor *)self mdmDelayInterval];
      if ([(SUCoreDescriptor *)self autoUpdateEnabled]) {
        uint64_t v38 = @"YES";
      }
      else {
        uint64_t v38 = @"NO";
      }
      v67 = v38;
      uint64_t v96 = objc_msgSend(MEMORY[0x263F77D78], "stringFromTriState:", -[SUCoreDescriptor hideInstallAlert](self, "hideInstallAlert"));
      if ([(SUCoreDescriptor *)self containsSFRContent]) {
        uint64_t v39 = @"YES";
      }
      else {
        uint64_t v39 = @"NO";
      }
      id v65 = v39;
      unint64_t v63 = [(SUCoreDescriptor *)self installAlertInterval];
      if ([(SUCoreDescriptor *)self allowAutoDownloadOnBattery]) {
        unint64_t v40 = @"YES";
      }
      else {
        unint64_t v40 = @"NO";
      }
      id v61 = v40;
      if ([(SUCoreDescriptor *)self disableSplatCombo]) {
        unint64_t v41 = @"YES";
      }
      else {
        unint64_t v41 = @"NO";
      }
      v59 = v41;
      unint64_t v42 = (void *)MEMORY[0x263F77D78];
      uint64_t v74 = [(SUCoreDescriptor *)self setupCritical];
      uint64_t v60 = [v42 limitString:v74 toMaxLength:a3 providingSubstitutionMap:v6];
      unint64_t v43 = (void *)MEMORY[0x263F77D78];
      uint64_t v70 = [(SUCoreDescriptor *)self documentationID];
      v58 = [v43 limitString:v70 toMaxLength:a3 providingSubstitutionMap:v6];
      unint64_t v44 = (void *)MEMORY[0x263F77D78];
      v66 = [(SUCoreDescriptor *)self softwareUpdateURL];
      v56 = [v44 limitString:v66 toMaxLength:a3 providingSubstitutionMap:v6];
      unint64_t v45 = (void *)MEMORY[0x263F77D78];
      v64 = [(SUCoreDescriptor *)self measurement];
      id v62 = [v64 description];
      uint64_t v55 = [v45 limitString:v62 toMaxLength:a3 providingSubstitutionMap:v6];
      unint64_t v46 = (void *)MEMORY[0x263F77D78];
      uint64_t v57 = [(SUCoreDescriptor *)self measurementAlgorithm];
      uint64_t v52 = [v46 limitString:v57 toMaxLength:a3 providingSubstitutionMap:v6];
      if ([(SUCoreDescriptor *)self splatOnly]) {
        uint64_t v47 = @"YES";
      }
      else {
        uint64_t v47 = @"NO";
      }
      uint64_t v53 = v19;
      if ([(SUCoreDescriptor *)self semiSplatEnabled]) {
        uint64_t v48 = @"YES";
      }
      else {
        uint64_t v48 = @"NO";
      }
      if (![(SUCoreDescriptor *)self revoked]) {
        unint64_t v35 = @"NO";
      }
      id v49 = (void *)MEMORY[0x263F77D78];
      v54 = [(SUCoreDescriptor *)self associatedSplatDescriptor];
      uint64_t v50 = [v54 humanReadableUpdateName];
      uint64_t v51 = [v49 limitString:v50 toMaxLength:a3 providingSubstitutionMap:v6];
      BOOL v15 = objc_msgSend(v53, "initWithFormat:", @"\n[>>>\n             descriptorType: %@\n     descriptorAudienceType: %@\n        preferredUpdateType: %@\n    humanReadableUpdateName: %@\n   humanReadableUpdateTitle: %@\n humanReadableUpdateVersion: %@\n  humanReadableMoreInfoLink: %@\n                 updateType: %@\n             productVersion: %@\n        productBuildVersion: %@\n             restoreVersion: %@\n  targetUpdateBridgeVersion: %@\n     targetUpdateSFRVersion: %@\n                releaseType: %@\n                releaseDate: %@\n          prerequisiteBuild: %@\n      prerequisiteOSVersion: %@\n               downloadSize: %llu\n     psusRequiredAssetsSize: %llu\n     psusOptionalAssetsSize: %llu\n             suDownloadSize: %llu\n             unarchivedSize: %llu\n            preparationSize: %llu\n           installationSize: %llu\n     totalRequiredFreeSpace: %llu\n                rampEnabled: %@\n           granularlyRamped: %@\n           mdmDelayInterval: %llu\n          autoUpdateEnabled: %@\n           hideInstallAlert: %@\n         containsSFRContent: %@\n       installAlertInterval: %llu\n allowAutoDownloadOnBattery: %@\n             disableSplombo: %@\n              setupCritical: %@\n            documentationID: %@\n          softwareUpdateURL: %@\n                measurement: %@\n       measurementAlgorithm: %@\n                  splatOnly: %@\n           semiSplatEnabled: %@\n                    revoked: %@\n  associatedSplatDescriptor: %@\n<<<]", v8, v112, v111, v110, v109, v108, v107, v106, v105, v104, v103, v102, v101, v100, v99, v98,
                      v97,
                      v80,
                      v79,
                      v78,
                      v77,
                      v76,
                      v75,
                      v73,
                      v72,
                      v71,
                      v69,
                      v68,
                      v67,
                      v96,
                      v65,
                      v63,
                      v61,
                      v59,
                      v60,
                      v58,
                      v56,
                      v55,
                      v52,
                      v47,
                      v48,
                      v35,
                      v51);
    }
    else
    {
      BOOL v15 = (void *)[v19 initWithFormat:@"Unexpected descriptor type %@", v20];

      unint64_t v8 = [MEMORY[0x263F77DA8] sharedDiag];
      [v8 trackAnomaly:@"DescriptorOverview" forReason:v15 withResult:8116 withError:0];
    }
  }

  return v15;
}

- (id)summary
{
  id v3 = [(SUCoreDescriptor *)self softwareUpdateAssetType];
  if ([v3 isEqualToString:@"com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain"])
  {

LABEL_4:
    id v6 = [NSString alloc];
    id v7 = [(SUCoreDescriptor *)self productBuildVersion];
    unint64_t v8 = (void *)[v6 initWithFormat:@"%@", v7];
    goto LABEL_11;
  }
  id v4 = [(SUCoreDescriptor *)self softwareUpdateAssetType];
  int v5 = [v4 isEqualToString:@"com.apple.MobileAsset.MobileSoftwareUpdate.MacUpdateBrain"];

  if (v5) {
    goto LABEL_4;
  }
  uint64_t v9 = [(SUCoreDescriptor *)self associatedSplatDescriptor];

  id v10 = [NSString alloc];
  id v7 = [(SUCoreDescriptor *)self humanReadableUpdateName];
  int v11 = [(SUCoreDescriptor *)self productBuildVersion];
  uint64_t v12 = [(SUCoreDescriptor *)self releaseType];
  uint64_t v13 = (void *)v12;
  uint64_t v14 = @"Customer";
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  if (v9) {
    uint64_t v15 = [v10 initWithFormat:@"%@ %@ (SplatCombo) (%@)", v7, v11, v14];
  }
  else {
    uint64_t v15 = [v10 initWithFormat:@"%@ %@ (%@)", v7, v11, v14];
  }
  unint64_t v8 = (void *)v15;

LABEL_11:

  return v8;
}

- (void)setPublisher:(id)a3
{
}

- (void)setProductSystemName:(id)a3
{
}

- (int64_t)descriptorType
{
  return self->_descriptorType;
}

- (void)setDescriptorType:(int64_t)a3
{
  self->_descriptorType = a3;
}

- (int64_t)descriptorAudienceType
{
  return self->_descriptorAudienceType;
}

- (void)setDescriptorAudienceType:(int64_t)a3
{
  self->_descriptorAudienceType = a3;
}

- (int64_t)preferredUpdateType
{
  return self->_preferredUpdateType;
}

- (void)setPreferredUpdateType:(int64_t)a3
{
  self->_preferredUpdateType = a3;
}

- (int64_t)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(int64_t)a3
{
  self->_updateType = a3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (NSString)uniqueBuildID
{
  return self->_uniqueBuildID;
}

- (void)setUniqueBuildID:(id)a3
{
}

- (NSString)softwareUpdateAssetType
{
  return self->_softwareUpdateAssetType;
}

- (void)setSoftwareUpdateAssetType:(id)a3
{
}

- (NSString)documentationAssetType
{
  return self->_documentationAssetType;
}

- (void)setDocumentationAssetType:(id)a3
{
}

- (MAAbsoluteAssetId)softwareUpdateAssetAbsoluteID
{
  return self->_softwareUpdateAssetAbsoluteID;
}

- (void)setSoftwareUpdateAssetAbsoluteID:(id)a3
{
}

- (MAAbsoluteAssetId)documentationAssetAbsoluteID
{
  return self->_documentationAssetAbsoluteID;
}

- (void)setDocumentationAssetAbsoluteID:(id)a3
{
}

- (NSString)softwareUpdateAssetPurpose
{
  return self->_softwareUpdateAssetPurpose;
}

- (void)setSoftwareUpdateAssetPurpose:(id)a3
{
}

- (NSString)documentationAssetPurpose
{
  return self->_documentationAssetPurpose;
}

- (void)setDocumentationAssetPurpose:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
}

- (NSString)productVersionExtra
{
  return self->_productVersionExtra;
}

- (void)setProductVersionExtra:(id)a3
{
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (NSString)restoreVersion
{
  return self->_restoreVersion;
}

- (void)setRestoreVersion:(id)a3
{
}

- (NSString)targetUpdateBridgeVersion
{
  return self->_targetUpdateBridgeVersion;
}

- (void)setTargetUpdateBridgeVersion:(id)a3
{
}

- (NSString)targetUpdateSFRVersion
{
  return self->_targetUpdateSFRVersion;
}

- (void)setTargetUpdateSFRVersion:(id)a3
{
}

- (NSString)trainName
{
  return self->_trainName;
}

- (void)setTrainName:(id)a3
{
}

- (NSString)prerequisiteBuild
{
  return self->_prerequisiteBuild;
}

- (void)setPrerequisiteBuild:(id)a3
{
}

- (NSString)prerequisiteOSVersion
{
  return self->_prerequisiteOSVersion;
}

- (void)setPrerequisiteOSVersion:(id)a3
{
}

- (NSArray)supportedDevices
{
  return self->_supportedDevices;
}

- (void)setSupportedDevices:(id)a3
{
}

- (void)setUnarchivedSize:(unint64_t)a3
{
  self->_unint64_t unarchivedSize = a3;
}

- (unint64_t)msuPrepareSize
{
  return self->_msuPrepareSize;
}

- (void)setMsuPrepareSize:(unint64_t)a3
{
  self->_msuPrepareSize = a3;
}

- (void)setInstallationSize:(unint64_t)a3
{
  self->_unint64_t installationSize = a3;
}

- (unint64_t)minimumSystemPartitionSize
{
  return self->_minimumSystemPartitionSize;
}

- (void)setMinimumSystemPartitionSize:(unint64_t)a3
{
  self->_minimumSystemPartitionSize = a3;
}

- (BOOL)streamingZipCapable
{
  return self->_streamingZipCapable;
}

- (void)setStreamingZipCapable:(BOOL)a3
{
  self->_streamingZipCapable = a3;
}

- (NSDictionary)systemPartitionPadding
{
  return self->_systemPartitionPadding;
}

- (void)setSystemPartitionPadding:(id)a3
{
}

- (unint64_t)preSUStagingRequiredSize
{
  return self->_preSUStagingRequiredSize;
}

- (void)setPreSUStagingRequiredSize:(unint64_t)a3
{
  self->_preSUStagingRequiredSize = a3;
}

- (unint64_t)preSUStagingOptionalSize
{
  return self->_preSUStagingOptionalSize;
}

- (void)setPreSUStagingOptionalSize:(unint64_t)a3
{
  self->_preSUStagingOptionalSize = a3;
}

- (unint64_t)suDownloadSize
{
  return self->_suDownloadSize;
}

- (void)setSuDownloadSize:(unint64_t)a3
{
  self->_suDownloadSize = a3;
}

- (BOOL)autoDownloadAllowableOverCellular
{
  return self->_autoDownloadAllowableOverCellular;
}

- (void)setAutoDownloadAllowableOverCellular:(BOOL)a3
{
  self->_autoDownloadAllowableOverCellular = a3;
}

- (BOOL)downloadAllowableOverCellular
{
  return self->_downloadAllowableOverCellular;
}

- (void)setDownloadAllowableOverCellular:(BOOL)a3
{
  self->_downloadAllowableOverCellular = a3;
}

- (BOOL)downloadable
{
  return self->_downloadable;
}

- (void)setDownloadable:(BOOL)a3
{
  self->_downloadable = a3;
}

- (BOOL)disableSiriVoiceDeletion
{
  return self->_disableSiriVoiceDeletion;
}

- (void)setDisableSiriVoiceDeletion:(BOOL)a3
{
  self->_disableSiriVoiceDeletion = a3;
}

- (BOOL)disableCDLevel4
{
  return self->_disableCDLevel4;
}

- (void)setDisableCDLevel4:(BOOL)a3
{
  self->_disableCDLevel4 = a3;
}

- (BOOL)disableAppDemotion
{
  return self->_disableAppDemotion;
}

- (void)setDisableAppDemotion:(BOOL)a3
{
  self->_disableAppDemotion = a3;
}

- (BOOL)disableInstallTonight
{
  return self->_disableInstallTonight;
}

- (void)setDisableInstallTonight:(BOOL)a3
{
  self->_disableInstallTonight = a3;
}

- (BOOL)forcePasscodeRequired
{
  return self->_forcePasscodeRequired;
}

- (void)setForcePasscodeRequired:(BOOL)a3
{
  self->_forcePasscodeRequired = a3;
}

- (BOOL)rampEnabled
{
  return self->_rampEnabled;
}

- (void)setRampEnabled:(BOOL)a3
{
  self->_rampEnabled = a3;
}

- (BOOL)granularlyRamped
{
  return self->_granularlyRamped;
}

- (void)setGranularlyRamped:(BOOL)a3
{
  self->_granularlyRamped = a3;
}

- (unint64_t)mdmDelayInterval
{
  return self->_mdmDelayInterval;
}

- (void)setMdmDelayInterval:(unint64_t)a3
{
  self->_mdmDelayInterval = a3;
}

- (BOOL)autoUpdateEnabled
{
  return self->_autoUpdateEnabled;
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  self->_autoUpdateEnabled = a3;
}

- (int64_t)hideInstallAlert
{
  return self->_hideInstallAlert;
}

- (void)setHideInstallAlert:(int64_t)a3
{
  self->_hideInstallAlert = a3;
}

- (BOOL)containsSFRContent
{
  return self->_containsSFRContent;
}

- (void)setContainsSFRContent:(BOOL)a3
{
  self->_containsSFRContent = a3;
}

- (unint64_t)installAlertInterval
{
  return self->_installAlertInterval;
}

- (void)setInstallAlertInterval:(unint64_t)a3
{
  self->_installAlertInterval = a3;
}

- (BOOL)allowAutoDownloadOnBattery
{
  return self->_allowAutoDownloadOnBattery;
}

- (void)setAllowAutoDownloadOnBattery:(BOOL)a3
{
  self->_allowAutoDownloadOnBattery = a3;
}

- (unint64_t)autoDownloadOnBatteryDelay
{
  return self->_autoDownloadOnBatteryDelay;
}

- (void)setAutoDownloadOnBatteryDelay:(unint64_t)a3
{
  self->_autoDownloadOnBatteryDelay = a3;
}

- (unint64_t)autoDownloadOnBatteryMinBattery
{
  return self->_autoDownloadOnBatteryMinBattery;
}

- (void)setAutoDownloadOnBatteryMinBattery:(unint64_t)a3
{
  self->_autoDownloadOnBatteryMinBattery = a3;
}

- (NSString)setupCritical
{
  return self->_setupCritical;
}

- (void)setSetupCritical:(id)a3
{
}

- (BOOL)criticalCellularOverride
{
  return self->_criticalCellularOverride;
}

- (void)setCriticalCellularOverride:(BOOL)a3
{
  self->_criticalCellularOverride = a3;
}

- (BOOL)criticalOutOfBoxOnly
{
  return self->_criticalOutOfBoxOnly;
}

- (void)setCriticalOutOfBoxOnly:(BOOL)a3
{
  self->_criticalOutOfBoxOnly = a3;
}

- (NSString)lastEmergencyBuild
{
  return self->_lastEmergencyBuild;
}

- (void)setLastEmergencyBuild:(id)a3
{
}

- (NSString)lastEmergencyOSVersion
{
  return self->_lastEmergencyOSVersion;
}

- (void)setLastEmergencyOSVersion:(id)a3
{
}

- (BOOL)mandatoryUpdateEligible
{
  return self->_mandatoryUpdateEligible;
}

- (void)setMandatoryUpdateEligible:(BOOL)a3
{
  self->_mandatoryUpdateEligible = a3;
}

- (NSString)mandatoryUpdateVersionMin
{
  return self->_mandatoryUpdateVersionMin;
}

- (void)setMandatoryUpdateVersionMin:(id)a3
{
}

- (NSString)mandatoryUpdateVersionMax
{
  return self->_mandatoryUpdateVersionMax;
}

- (void)setMandatoryUpdateVersionMax:(id)a3
{
}

- (BOOL)mandatoryUpdateOptional
{
  return self->_mandatoryUpdateOptional;
}

- (void)setMandatoryUpdateOptional:(BOOL)a3
{
  self->_mandatoryUpdateOptional = a3;
}

- (BOOL)mandatoryUpdateRestrictedToOutOfTheBox
{
  return self->_mandatoryUpdateRestrictedToOutOfTheBox;
}

- (void)setMandatoryUpdateRestrictedToOutOfTheBox:(BOOL)a3
{
  self->_mandatoryUpdateRestrictedToOutOfTheBox = a3;
}

- (BOOL)oneShotBuddyDisabled
{
  return self->_oneShotBuddyDisabled;
}

- (NSArray)oneShotBuddyDisabledBuilds
{
  return self->_oneShotBuddyDisabledBuilds;
}

- (BOOL)criticalUpdate
{
  return self->_criticalUpdate;
}

- (void)setCriticalUpdate:(BOOL)a3
{
  self->_criticalUpdate = a3;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (unint64_t)autoInstallDelay
{
  return self->_autoInstallDelay;
}

- (void)setAutoInstallDelay:(unint64_t)a3
{
  self->_autoInstallDelay = a3;
}

- (BOOL)notifyAfter
{
  return self->_notifyAfter;
}

- (void)setNotifyAfter:(BOOL)a3
{
  self->_notifyAfter = a3;
}

- (NSString)minimumBridgeVersion
{
  return self->_minimumBridgeVersion;
}

- (void)setMinimumBridgeVersion:(id)a3
{
}

- (BOOL)disableRosettaUpdates
{
  return self->_disableRosettaUpdates;
}

- (void)setDisableRosettaUpdates:(BOOL)a3
{
  self->_disableRosettaUpdates = a3;
}

- (BOOL)disableRecoveryOSUpdates
{
  return self->_disableRecoveryOSUpdates;
}

- (BOOL)requireInstallAssistantUpdate
{
  return self->_requireInstallAssistantUpdate;
}

- (NSData)sepDigest
{
  return self->_sepDigest;
}

- (void)setSepDigest:(id)a3
{
}

- (NSData)sepTBMDigests
{
  return self->_sepTBMDigests;
}

- (void)setSepTBMDigests:(id)a3
{
}

- (NSData)rsepDigest
{
  return self->_rsepDigest;
}

- (void)setRsepDigest:(id)a3
{
}

- (NSData)rsepTBMDigests
{
  return self->_rsepTBMDigests;
}

- (void)setRsepTBMDigests:(id)a3
{
}

- (NSString)documentationID
{
  return self->_documentationID;
}

- (void)setDocumentationID:(id)a3
{
}

- (SUCoreDocumentation)documentation
{
  return (SUCoreDocumentation *)objc_getProperty(self, a2, 472, 1);
}

- (void)setDocumentation:(id)a3
{
}

- (NSString)softwareUpdateURL
{
  return self->_softwareUpdateURL;
}

- (void)setSoftwareUpdateURL:(id)a3
{
}

- (NSData)measurement
{
  return self->_measurement;
}

- (void)setMeasurement:(id)a3
{
}

- (NSString)measurementAlgorithm
{
  return self->_measurementAlgorithm;
}

- (void)setMeasurementAlgorithm:(id)a3
{
}

- (SUCoreMAIdentifier)softwareUpdateAssetIdentifier
{
  return self->_softwareUpdateAssetIdentifier;
}

- (void)setSoftwareUpdateAssetIdentifier:(id)a3
{
}

- (SUCoreMAIdentifier)documentationAssetIdentifier
{
  return self->_documentationAssetIdentifier;
}

- (void)setDocumentationAssetIdentifier:(id)a3
{
}

- (BOOL)promoteAlternateUpdate
{
  return self->_promoteAlternateUpdate;
}

- (void)setPromoteAlternateUpdate:(BOOL)a3
{
  self->_promoteAlternateUpdate = a3;
}

- (BOOL)enableAlternateAssetAudience
{
  return self->_enableAlternateAssetAudience;
}

- (void)setEnableAlternateAssetAudience:(BOOL)a3
{
  self->_enableAlternateAssetAudience = a3;
}

- (NSString)alternateAssetAudienceUUID
{
  return self->_alternateAssetAudienceUUID;
}

- (void)setAlternateAssetAudienceUUID:(id)a3
{
}

- (NSString)assetAudienceUUID
{
  return self->_assetAudienceUUID;
}

- (void)setAssetAudienceUUID:(id)a3
{
}

- (NSString)updateBrainPath
{
  return self->_updateBrainPath;
}

- (void)setUpdateBrainPath:(id)a3
{
}

- (NSString)updateBundlePath
{
  return self->_updateBundlePath;
}

- (void)setUpdateBundlePath:(id)a3
{
}

- (NSDictionary)bundleAttributes
{
  return self->_bundleAttributes;
}

- (void)setBundleAttributes:(id)a3
{
}

- (BOOL)splatOnly
{
  return self->_splatOnly;
}

- (BOOL)semiSplatEnabled
{
  return self->_semiSplatEnabled;
}

- (NSArray)semiSplatMustQuitApps
{
  return self->_semiSplatMustQuitApps;
}

- (BOOL)revoked
{
  return self->_revoked;
}

- (BOOL)semiSplatRestartNow
{
  return self->_semiSplatRestartNow;
}

- (BOOL)disableSplatCombo
{
  return self->_disableSplatCombo;
}

- (void)setDisableSplatCombo:(BOOL)a3
{
  self->_disableSplatCombo = a3;
}

- (SUCoreDescriptor)associatedSplatDescriptor
{
  return self->_associatedSplatDescriptor;
}

- (void)setAssociatedSplatDescriptor:(id)a3
{
}

- (BOOL)enablePreSUStaging
{
  return self->_enablePreSUStaging;
}

- (void)setEnablePreSUStaging:(BOOL)a3
{
  self->_enablePreSUStaging = a3;
}

- (BOOL)enablePreSUStagingForOptionalAssets
{
  return self->_enablePreSUStagingForOptionalAssets;
}

- (void)setEnablePreSUStagingForOptionalAssets:(BOOL)a3
{
  self->_enablePreSUStagingForOptionalAssets = a3;
}

- (NSString)rawProductVersion
{
  return self->_rawProductVersion;
}

- (void)setRawProductVersion:(id)a3
{
}

- (MAAsset)softwareUpdateAsset
{
  return self->_softwareUpdateAsset;
}

- (void)setSoftwareUpdateAsset:(id)a3
{
}

- (MAAsset)documentationAsset
{
  return self->_documentationAsset;
}

- (void)setDocumentationAsset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentationAsset, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAsset, 0);
  objc_storeStrong((id *)&self->_rawProductVersion, 0);
  objc_storeStrong((id *)&self->_associatedSplatDescriptor, 0);
  objc_storeStrong((id *)&self->_semiSplatMustQuitApps, 0);
  objc_storeStrong((id *)&self->_bundleAttributes, 0);
  objc_storeStrong((id *)&self->_updateBundlePath, 0);
  objc_storeStrong((id *)&self->_updateBrainPath, 0);
  objc_storeStrong((id *)&self->_assetAudienceUUID, 0);
  objc_storeStrong((id *)&self->_alternateAssetAudienceUUID, 0);
  objc_storeStrong((id *)&self->_documentationAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_measurementAlgorithm, 0);
  objc_storeStrong((id *)&self->_measurement, 0);
  objc_storeStrong((id *)&self->_softwareUpdateURL, 0);
  objc_storeStrong((id *)&self->_documentation, 0);
  objc_storeStrong((id *)&self->_documentationID, 0);
  objc_storeStrong((id *)&self->_rsepTBMDigests, 0);
  objc_storeStrong((id *)&self->_rsepDigest, 0);
  objc_storeStrong((id *)&self->_sepTBMDigests, 0);
  objc_storeStrong((id *)&self->_sepDigest, 0);
  objc_storeStrong((id *)&self->_minimumBridgeVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_oneShotBuddyDisabledBuilds, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateVersionMax, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateVersionMin, 0);
  objc_storeStrong((id *)&self->_lastEmergencyOSVersion, 0);
  objc_storeStrong((id *)&self->_lastEmergencyBuild, 0);
  objc_storeStrong((id *)&self->_setupCritical, 0);
  objc_storeStrong((id *)&self->_systemPartitionPadding, 0);
  objc_storeStrong((id *)&self->_supportedDevices, 0);
  objc_storeStrong((id *)&self->_prerequisiteOSVersion, 0);
  objc_storeStrong((id *)&self->_prerequisiteBuild, 0);
  objc_storeStrong((id *)&self->_trainName, 0);
  objc_storeStrong((id *)&self->_targetUpdateSFRVersion, 0);
  objc_storeStrong((id *)&self->_targetUpdateBridgeVersion, 0);
  objc_storeStrong((id *)&self->_restoreVersion, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_productVersionExtra, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_documentationAssetPurpose, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAssetPurpose, 0);
  objc_storeStrong((id *)&self->_documentationAssetAbsoluteID, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAssetAbsoluteID, 0);
  objc_storeStrong((id *)&self->_documentationAssetType, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAssetType, 0);
  objc_storeStrong((id *)&self->_uniqueBuildID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_productSystemName, 0);

  objc_storeStrong((id *)&self->_publisher, 0);
}

@end