@interface SUDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasValue:(id)a3;
- (BOOL)_isStreamingZipCapable;
- (BOOL)allowAutoDownloadOnBattery;
- (BOOL)appDemotionDisabled;
- (BOOL)autoDownloadAllowableForCellular;
- (BOOL)autoUpdateEnabled;
- (BOOL)cdLevel4Disabled;
- (BOOL)criticalOutOfBoxOnly;
- (BOOL)forcePasscodeRequired;
- (BOOL)granularlyRamped;
- (BOOL)hideInstallAlert;
- (BOOL)installTonightDisabled;
- (BOOL)isDownloadable;
- (BOOL)isDownloadableOverCellular;
- (BOOL)isEmergencyOrCritical;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRelevantToDeclaration:(id)a3;
- (BOOL)isSplatOnly;
- (BOOL)isSplombo;
- (BOOL)isValidDescriptor;
- (BOOL)mandatoryUpdateEligible;
- (BOOL)mandatoryUpdateOptional;
- (BOOL)mandatoryUpdateRestrictedToOutOfTheBox;
- (BOOL)promoteAlternateUpdate;
- (BOOL)rampEnabled;
- (BOOL)releasedBefore:(double)a3;
- (BOOL)siriVoiceDeletionDisabled;
- (NSData)rsepDigest;
- (NSData)rsepTBMDigest;
- (NSData)sepDigest;
- (NSData)sepTBMDigest;
- (NSDate)releaseDate;
- (NSDictionary)systemPartitionPadding;
- (NSString)assetID;
- (NSString)criticalDownloadPolicy;
- (NSString)humanReadableUpdateName;
- (NSString)mandatoryUpdateVersionMax;
- (NSString)mandatoryUpdateVersionMin;
- (NSString)prerequisiteBuild;
- (NSString)prerequisiteOS;
- (NSString)productBuildVersion;
- (NSString)productSystemName;
- (NSString)productVersion;
- (NSString)productVersionExtra;
- (NSString)publisher;
- (NSString)releaseType;
- (NSString)setupCritical;
- (NSString)splatComboBuildVersion;
- (SUDescriptor)init;
- (SUDescriptor)initWithCoder:(id)a3;
- (SUDocumentation)documentation;
- (id)_buildCompareKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)updateTypeName;
- (int)updateType;
- (unint64_t)_msuPrepareSize;
- (unint64_t)_unarchiveSize;
- (unint64_t)audienceType;
- (unint64_t)downloadSize;
- (unint64_t)hash;
- (unint64_t)installationSize;
- (unint64_t)mdmDelayInterval;
- (unint64_t)minimumSystemPartitionSize;
- (unint64_t)preferenceType;
- (unint64_t)preparationSize;
- (unint64_t)totalRequiredFreeSpace;
- (unint64_t)upgradeType;
- (unsigned)autoDownloadOnBatteryDelay;
- (unsigned)autoDownloadOnBatteryMinBattery;
- (void)_setDisableAppDemotion:(BOOL)a3;
- (void)_setDisableCDLevel4:(BOOL)a3;
- (void)_setDisableInstallTonight:(BOOL)a3;
- (void)_setDisableSiriVoiceDeletion:(BOOL)a3;
- (void)_setMsuPrepareSize:(unint64_t)a3;
- (void)_setStreamingZipCapable:(BOOL)a3;
- (void)_setUnarchiveSize:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowAutoDownloadOnBattery:(BOOL)a3;
- (void)setAssetID:(id)a3;
- (void)setAudienceType:(unint64_t)a3;
- (void)setAutoDownloadAllowableForCellular:(BOOL)a3;
- (void)setAutoDownloadOnBatteryDelay:(unsigned int)a3;
- (void)setAutoDownloadOnBatteryMinBattery:(unsigned int)a3;
- (void)setAutoUpdateEnabled:(BOOL)a3;
- (void)setCriticalDownloadPolicy:(id)a3;
- (void)setCriticalOutOfBoxOnly:(BOOL)a3;
- (void)setDocumentation:(id)a3;
- (void)setDownloadSize:(unint64_t)a3;
- (void)setDownloadable:(BOOL)a3;
- (void)setDownloadableOverCellular:(BOOL)a3;
- (void)setForcePasscodeRequired:(BOOL)a3;
- (void)setGranularlyRamped:(BOOL)a3;
- (void)setHideInstallAlert:(BOOL)a3;
- (void)setHumanReadableUpdateName:(id)a3;
- (void)setInstallationSize:(unint64_t)a3;
- (void)setIsSplatOnly:(BOOL)a3;
- (void)setIsSplombo:(BOOL)a3;
- (void)setMandatoryUpdateEligible:(BOOL)a3;
- (void)setMandatoryUpdateOptional:(BOOL)a3;
- (void)setMandatoryUpdateRestrictedToOutOfTheBox:(BOOL)a3;
- (void)setMandatoryUpdateVersionMax:(id)a3;
- (void)setMandatoryUpdateVersionMin:(id)a3;
- (void)setMdmDelayInterval:(unint64_t)a3;
- (void)setMinimumSystemPartitionSize:(unint64_t)a3;
- (void)setPreferenceType:(unint64_t)a3;
- (void)setPreparationSize:(unint64_t)a3;
- (void)setPrerequisiteBuild:(id)a3;
- (void)setPrerequisiteOS:(id)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setProductSystemName:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setProductVersionExtra:(id)a3;
- (void)setPromoteAlternateUpdate:(BOOL)a3;
- (void)setPublisher:(id)a3;
- (void)setRSEPDigest:(id)a3;
- (void)setRSEPTBMDigest:(id)a3;
- (void)setRampEnabled:(BOOL)a3;
- (void)setReleaseDate:(id)a3;
- (void)setReleaseType:(id)a3;
- (void)setSEPDigest:(id)a3;
- (void)setSEPTBMDigest:(id)a3;
- (void)setSetupCritical:(id)a3;
- (void)setSplatComboBuildVersion:(id)a3;
- (void)setSystemPartitionPadding:(id)a3;
- (void)setTotalRequiredFreeSpace:(unint64_t)a3;
- (void)setUpdateType:(int)a3;
- (void)setUpgradeType:(unint64_t)a3;
@end

@implementation SUDescriptor

- (BOOL)isRelevantToDeclaration:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 buildVersionString];

    if (v6)
    {
      v7 = [v5 buildVersionString];
      v8 = [(SUDescriptor *)self splatComboBuildVersion];
      if ([v7 isEqualToString:v8])
      {
        char v9 = 1;
      }
      else
      {
        v11 = [v5 buildVersionString];
        v12 = [(SUDescriptor *)self productBuildVersion];
        char v9 = [v11 isEqualToString:v12];
      }
      goto LABEL_9;
    }
    v10 = [v5 versionString];

    if (v10)
    {
      v7 = [v5 versionString];
      v8 = [(SUDescriptor *)self productVersion];
      char v9 = [v7 isEqualToString:v8];
LABEL_9:

      goto LABEL_10;
    }
  }
  char v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)releasedBefore:(double)a3
{
  id v4 = [(SUDescriptor *)self releaseDate];
  [v4 timeIntervalSinceNow];
  double v6 = -v5;

  return v6 >= a3;
}

- (SUDescriptor)init
{
  v14.receiver = self;
  v14.super_class = (Class)SUDescriptor;
  v2 = [(SUDescriptor *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_autoDownloadAllowableForCellular = 1;
    v2->_downloadableOverCellular = 1;
    v2->_downloadable = 1;
    *(_WORD *)&v2->_disableIntallTonight = 0;
    v2->_granularlyRamped = 0;
    setupCritical = v2->_setupCritical;
    v2->_setupCritical = 0;

    criticalDownloadPolicy = v3->_criticalDownloadPolicy;
    v3->_criticalDownloadPolicy = 0;

    *(_WORD *)&v3->_criticalOutOfBoxOnly = 1;
    prerequisiteBuild = v3->_prerequisiteBuild;
    v3->_prerequisiteBuild = 0;

    prerequisiteOS = v3->_prerequisiteOS;
    v3->_prerequisiteOS = 0;

    assetID = v3->_assetID;
    v3->_assetID = 0;

    v3->_hideInstallAlert = 0;
    v3->_preferenceType = 0;
    v3->_upgradeType = 0;
    v3->_audienceType = 0;
    *(_WORD *)&v3->_promoteAlternateUpdate = 0;
    humanReadableUpdateName = v3->_humanReadableUpdateName;
    v3->_humanReadableUpdateName = 0;

    v3->_mandatoryUpdateEligible = 0;
    mandatoryUpdateVersionMin = v3->_mandatoryUpdateVersionMin;
    v3->_mandatoryUpdateVersionMin = 0;

    mandatoryUpdateVersionMax = v3->_mandatoryUpdateVersionMax;
    v3->_mandatoryUpdateVersionMax = 0;

    v3->_allowAutoDownloadOnBattery = 0;
    *(void *)&v3->_autoDownloadOnBatteryDelay = 0x3E7000003E7;
    *(_DWORD *)&v3->_mandatoryUpdateOptional = 0;
    splatComboBuildVersion = v3->_splatComboBuildVersion;
    v3->_splatComboBuildVersion = 0;
  }
  return v3;
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
  if (self->_productSystemName) {
    return self->_productSystemName;
  }
  else {
    return (NSString *)@"iOS";
  }
}

- (id)updateTypeName
{
  uint64_t updateType = self->_updateType;
  if (updateType > 3) {
    return @"unknown";
  }
  else {
    return off_26447DD00[updateType];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUDescriptor)initWithCoder:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(SUDescriptor *)self init];
  if (v5)
  {
    double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publisher"];
    [(SUDescriptor *)v5 setPublisher:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productSystemName"];
    [(SUDescriptor *)v5 setProductSystemName:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productVersion"];
    [(SUDescriptor *)v5 setProductVersion:v8];

    char v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productVersionExtra"];
    [(SUDescriptor *)v5 setProductVersionExtra:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productBuildVersion"];
    [(SUDescriptor *)v5 setProductBuildVersion:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prerequisiteBuild"];
    [(SUDescriptor *)v5 setPrerequisiteBuild:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prerequisiteOS"];
    [(SUDescriptor *)v5 setPrerequisiteOS:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseType"];
    [(SUDescriptor *)v5 setReleaseType:v13];

    objc_super v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadSize"];
    -[SUDescriptor setDownloadSize:](v5, "setDownloadSize:", [v14 unsignedLongLongValue]);

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unarchiveSize"];
    -[SUDescriptor _setUnarchiveSize:](v5, "_setUnarchiveSize:", [v15 unsignedLongLongValue]);

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"msuPrepareSize"];
    -[SUDescriptor _setMsuPrepareSize:](v5, "_setMsuPrepareSize:", [v16 unsignedLongLongValue]);

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installationSize"];
    -[SUDescriptor setInstallationSize:](v5, "setInstallationSize:", [v17 unsignedLongLongValue]);

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumSystemPartitionsize"];
    -[SUDescriptor setMinimumSystemPartitionSize:](v5, "setMinimumSystemPartitionSize:", [v18 unsignedLongLongValue]);

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preparationSize"];
    -[SUDescriptor setPreparationSize:](v5, "setPreparationSize:", [v19 unsignedLongLongValue]);

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalRequiredFreeSpace"];
    -[SUDescriptor setTotalRequiredFreeSpace:](v5, "setTotalRequiredFreeSpace:", [v20 unsignedLongLongValue]);

    -[SUDescriptor setUpdateType:](v5, "setUpdateType:", [v4 decodeIntForKey:@"updateType"]);
    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentation"];
    [(SUDescriptor *)v5 setDocumentation:v21];

    -[SUDescriptor setAutoDownloadAllowableForCellular:](v5, "setAutoDownloadAllowableForCellular:", [v4 decodeBoolForKey:@"autoDownloadAllowableForCellular"]);
    -[SUDescriptor setDownloadableOverCellular:](v5, "setDownloadableOverCellular:", [v4 decodeBoolForKey:@"downloadableOverCellular"]);
    -[SUDescriptor setDownloadable:](v5, "setDownloadable:", [v4 decodeBoolForKey:@"downloadable"]);
    -[SUDescriptor _setStreamingZipCapable:](v5, "_setStreamingZipCapable:", [v4 decodeBoolForKey:@"streamingZipCapable"]);
    -[SUDescriptor _setDisableSiriVoiceDeletion:](v5, "_setDisableSiriVoiceDeletion:", [v4 decodeBoolForKey:@"disableSiriVoiceDeletion"]);
    -[SUDescriptor _setDisableCDLevel4:](v5, "_setDisableCDLevel4:", [v4 decodeBoolForKey:@"disableCDLevel4"]);
    -[SUDescriptor _setDisableAppDemotion:](v5, "_setDisableAppDemotion:", [v4 decodeBoolForKey:@"disableAppDemotion"]);
    -[SUDescriptor _setDisableInstallTonight:](v5, "_setDisableInstallTonight:", [v4 decodeBoolForKey:@"disableInstallTonight"]);
    -[SUDescriptor setRampEnabled:](v5, "setRampEnabled:", [v4 decodeBoolForKey:@"rampEnabled"]);
    -[SUDescriptor setGranularlyRamped:](v5, "setGranularlyRamped:", [v4 decodeBoolForKey:@"granularlyRamped"]);
    -[SUDescriptor setCriticalOutOfBoxOnly:](v5, "setCriticalOutOfBoxOnly:", [v4 decodeBoolForKey:@"criticalOutOfBoxOnly"]);
    -[SUDescriptor setAutoUpdateEnabled:](v5, "setAutoUpdateEnabled:", [v4 decodeBoolForKey:@"autoUpdateEnabled"]);
    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setupCritical"];
    [(SUDescriptor *)v5 setSetupCritical:v22];

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"criticalDownloadPolicy"];
    [(SUDescriptor *)v5 setCriticalDownloadPolicy:v23];

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SEPDigest"];
    [(SUDescriptor *)v5 setSEPDigest:v24];

    v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RSEPDigest"];
    [(SUDescriptor *)v5 setRSEPDigest:v25];

    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SEPTBMDigest"];
    [(SUDescriptor *)v5 setSEPTBMDigest:v26];

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RSEPTBMDigest"];
    [(SUDescriptor *)v5 setRSEPTBMDigest:v27];

    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseDate"];
    [(SUDescriptor *)v5 setReleaseDate:v28];

    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MDMDelayInterval"];
    -[SUDescriptor setMdmDelayInterval:](v5, "setMdmDelayInterval:", [v29 unsignedLongLongValue]);

    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetID"];
    [(SUDescriptor *)v5 setAssetID:v30];

    -[SUDescriptor setHideInstallAlert:](v5, "setHideInstallAlert:", [v4 decodeBoolForKey:@"hideInstallAlert"]);
    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audienceType"];
    -[SUDescriptor setAudienceType:](v5, "setAudienceType:", [v31 unsignedLongLongValue]);

    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferenceType"];
    -[SUDescriptor setPreferenceType:](v5, "setPreferenceType:", [v32 unsignedLongLongValue]);

    v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"upgradeType"];
    -[SUDescriptor setUpgradeType:](v5, "setUpgradeType:", [v33 unsignedLongLongValue]);

    -[SUDescriptor setPromoteAlternateUpdate:](v5, "setPromoteAlternateUpdate:", [v4 decodeBoolForKey:@"promoteAlternateUpdate"]);
    -[SUDescriptor setIsSplatOnly:](v5, "setIsSplatOnly:", [v4 decodeBoolForKey:@"isSplatOnly"]);
    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"humanReadableUpdateName"];
    [(SUDescriptor *)v5 setHumanReadableUpdateName:v34];

    -[SUDescriptor setMandatoryUpdateEligible:](v5, "setMandatoryUpdateEligible:", [v4 decodeBoolForKey:@"MandatoryUpdateEligible"]);
    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MandatoryUpdateVersionMin"];
    [(SUDescriptor *)v5 setMandatoryUpdateVersionMin:v35];

    v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MandatoryUpdateVersionMax"];
    [(SUDescriptor *)v5 setMandatoryUpdateVersionMax:v36];

    -[SUDescriptor setMandatoryUpdateOptional:](v5, "setMandatoryUpdateOptional:", [v4 decodeBoolForKey:@"MandatoryUpdateOptional"]);
    -[SUDescriptor setMandatoryUpdateRestrictedToOutOfTheBox:](v5, "setMandatoryUpdateRestrictedToOutOfTheBox:", [v4 decodeBoolForKey:@"MandatoryUpdateRestrictedToOutOfTheBox"]);
    -[SUDescriptor setForcePasscodeRequired:](v5, "setForcePasscodeRequired:", [v4 decodeBoolForKey:@"ForcePasscodeRequired"]);
    -[SUDescriptor setAllowAutoDownloadOnBattery:](v5, "setAllowAutoDownloadOnBattery:", [v4 decodeBoolForKey:@"AllowAutoDownloadOnBattery"]);
    v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AutoDownloadOnBatteryDelay"];
    -[SUDescriptor setAutoDownloadOnBatteryDelay:](v5, "setAutoDownloadOnBatteryDelay:", [v37 unsignedIntValue]);

    v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AutoDownloadOnBatteryMinBattery"];
    -[SUDescriptor setAutoDownloadOnBatteryMinBattery:](v5, "setAutoDownloadOnBatteryMinBattery:", [v38 unsignedIntValue]);

    -[SUDescriptor setIsSplombo:](v5, "setIsSplombo:", [v4 decodeBoolForKey:@"isSplombo"]);
    v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"splatComboBuildVersion"];
    [(SUDescriptor *)v5 setSplatComboBuildVersion:v39];

    v40 = (void *)MEMORY[0x263EFFA08];
    uint64_t v45 = objc_opt_class();
    uint64_t v46 = objc_opt_class();
    uint64_t v47 = objc_opt_class();
    v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:3];
    v42 = objc_msgSend(v40, "setWithArray:", v41, v45, v46);

    v43 = [v4 decodeObjectOfClasses:v42 forKey:@"systemPartitionPadding"];
    [(SUDescriptor *)v5 setSystemPartitionPadding:v43];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(SUDescriptor *)self publisher];
  [v4 encodeObject:v5 forKey:@"publisher"];

  double v6 = [(SUDescriptor *)self productSystemName];
  [v4 encodeObject:v6 forKey:@"productSystemName"];

  v7 = [(SUDescriptor *)self productVersion];
  [v4 encodeObject:v7 forKey:@"productVersion"];

  v8 = [(SUDescriptor *)self productVersionExtra];
  [v4 encodeObject:v8 forKey:@"productVersionExtra"];

  char v9 = [(SUDescriptor *)self productBuildVersion];
  [v4 encodeObject:v9 forKey:@"productBuildVersion"];

  v10 = [(SUDescriptor *)self prerequisiteBuild];
  [v4 encodeObject:v10 forKey:@"prerequisiteBuild"];

  v11 = [(SUDescriptor *)self prerequisiteOS];
  [v4 encodeObject:v11 forKey:@"prerequisiteOS"];

  v12 = [(SUDescriptor *)self releaseType];
  [v4 encodeObject:v12 forKey:@"releaseType"];

  v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor downloadSize](self, "downloadSize"));
  [v4 encodeObject:v13 forKey:@"downloadSize"];

  objc_super v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor _unarchiveSize](self, "_unarchiveSize"));
  [v4 encodeObject:v14 forKey:@"unarchiveSize"];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor _msuPrepareSize](self, "_msuPrepareSize"));
  [v4 encodeObject:v15 forKey:@"msuPrepareSize"];

  v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor installationSize](self, "installationSize"));
  [v4 encodeObject:v16 forKey:@"installationSize"];

  v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor minimumSystemPartitionSize](self, "minimumSystemPartitionSize"));
  [v4 encodeObject:v17 forKey:@"minimumSystemPartitionsize"];

  v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor preparationSize](self, "preparationSize"));
  [v4 encodeObject:v18 forKey:@"preparationSize"];

  v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor totalRequiredFreeSpace](self, "totalRequiredFreeSpace"));
  [v4 encodeObject:v19 forKey:@"totalRequiredFreeSpace"];

  objc_msgSend(v4, "encodeInt:forKey:", -[SUDescriptor updateType](self, "updateType"), @"updateType");
  v20 = [(SUDescriptor *)self documentation];
  [v4 encodeObject:v20 forKey:@"documentation"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor autoDownloadAllowableForCellular](self, "autoDownloadAllowableForCellular"), @"autoDownloadAllowableForCellular");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor isDownloadableOverCellular](self, "isDownloadableOverCellular"), @"downloadableOverCellular");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor isDownloadable](self, "isDownloadable"), @"downloadable");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor _isStreamingZipCapable](self, "_isStreamingZipCapable"), @"streamingZipCapable");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor siriVoiceDeletionDisabled](self, "siriVoiceDeletionDisabled"), @"disableSiriVoiceDeletion");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor cdLevel4Disabled](self, "cdLevel4Disabled"), @"disableCDLevel4");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor appDemotionDisabled](self, "appDemotionDisabled"), @"disableAppDemotion");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor installTonightDisabled](self, "installTonightDisabled"), @"disableInstallTonight");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor rampEnabled](self, "rampEnabled"), @"rampEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor granularlyRamped](self, "granularlyRamped"), @"granularlyRamped");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor criticalOutOfBoxOnly](self, "criticalOutOfBoxOnly"), @"criticalOutOfBoxOnly");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor autoUpdateEnabled](self, "autoUpdateEnabled"), @"autoUpdateEnabled");
  v21 = [(SUDescriptor *)self setupCritical];
  [v4 encodeObject:v21 forKey:@"setupCritical"];

  v22 = [(SUDescriptor *)self criticalDownloadPolicy];
  [v4 encodeObject:v22 forKey:@"criticalDownloadPolicy"];

  v23 = [(SUDescriptor *)self systemPartitionPadding];
  [v4 encodeObject:v23 forKey:@"systemPartitionPadding"];

  v24 = [(SUDescriptor *)self sepDigest];
  [v4 encodeObject:v24 forKey:@"SEPDigest"];

  v25 = [(SUDescriptor *)self rsepDigest];
  [v4 encodeObject:v25 forKey:@"RSEPDigest"];

  v26 = [(SUDescriptor *)self sepTBMDigest];
  [v4 encodeObject:v26 forKey:@"SEPTBMDigest"];

  v27 = [(SUDescriptor *)self rsepTBMDigest];
  [v4 encodeObject:v27 forKey:@"RSEPTBMDigest"];

  v28 = [(SUDescriptor *)self releaseDate];
  [v4 encodeObject:v28 forKey:@"releaseDate"];

  v29 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor mdmDelayInterval](self, "mdmDelayInterval"));
  [v4 encodeObject:v29 forKey:@"MDMDelayInterval"];

  v30 = [(SUDescriptor *)self assetID];
  [v4 encodeObject:v30 forKey:@"assetID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor hideInstallAlert](self, "hideInstallAlert"), @"hideInstallAlert");
  v31 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor audienceType](self, "audienceType"));
  [v4 encodeObject:v31 forKey:@"audienceType"];

  v32 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor preferenceType](self, "preferenceType"));
  [v4 encodeObject:v32 forKey:@"preferenceType"];

  v33 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor upgradeType](self, "upgradeType"));
  [v4 encodeObject:v33 forKey:@"upgradeType"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor promoteAlternateUpdate](self, "promoteAlternateUpdate"), @"promoteAlternateUpdate");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor isSplatOnly](self, "isSplatOnly"), @"isSplatOnly");
  v34 = [(SUDescriptor *)self humanReadableUpdateName];
  [v4 encodeObject:v34 forKey:@"humanReadableUpdateName"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor mandatoryUpdateEligible](self, "mandatoryUpdateEligible"), @"MandatoryUpdateEligible");
  v35 = [(SUDescriptor *)self mandatoryUpdateVersionMin];
  [v4 encodeObject:v35 forKey:@"MandatoryUpdateVersionMin"];

  v36 = [(SUDescriptor *)self mandatoryUpdateVersionMax];
  [v4 encodeObject:v36 forKey:@"MandatoryUpdateVersionMax"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor mandatoryUpdateOptional](self, "mandatoryUpdateOptional"), @"MandatoryUpdateOptional");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor mandatoryUpdateRestrictedToOutOfTheBox](self, "mandatoryUpdateRestrictedToOutOfTheBox"), @"MandatoryUpdateRestrictedToOutOfTheBox");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor forcePasscodeRequired](self, "forcePasscodeRequired"), @"ForcePasscodeRequired");
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor allowAutoDownloadOnBattery](self, "allowAutoDownloadOnBattery"), @"AllowAutoDownloadOnBattery");
  v37 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SUDescriptor autoDownloadOnBatteryDelay](self, "autoDownloadOnBatteryDelay"));
  [v4 encodeObject:v37 forKey:@"AutoDownloadOnBatteryDelay"];

  v38 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SUDescriptor autoDownloadOnBatteryMinBattery](self, "autoDownloadOnBatteryMinBattery"));
  [v4 encodeObject:v38 forKey:@"AutoDownloadOnBatteryMinBattery"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor isSplombo](self, "isSplombo"), @"isSplombo");
  id v39 = [(SUDescriptor *)self splatComboBuildVersion];
  [v4 encodeObject:v39 forKey:@"splatComboBuildVersion"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setPublisher:self->_publisher];
  [v4 setProductSystemName:self->_productSystemName];
  [v4 setProductVersion:self->_productVersion];
  [v4 setProductVersionExtra:self->_productVersionExtra];
  [v4 setProductBuildVersion:self->_productBuildVersion];
  [v4 setPrerequisiteBuild:self->_prerequisiteBuild];
  [v4 setPrerequisiteOS:self->_prerequisiteOS];
  [v4 setReleaseType:self->_releaseType];
  [v4 setDownloadSize:self->_downloadSize];
  [v4 _setUnarchiveSize:self->_unarchiveSize];
  [v4 _setMsuPrepareSize:self->_msuPrepareSize];
  [v4 setInstallationSize:self->_installationSize];
  [v4 setPreparationSize:self->_preparationSize];
  [v4 setTotalRequiredFreeSpace:self->_totalRequiredFreeSpace];
  [v4 setUpdateType:self->_updateType];
  double v5 = (void *)[(SUDocumentation *)self->_documentation copy];
  [v4 setDocumentation:v5];

  [v4 setAutoDownloadAllowableForCellular:self->_autoDownloadAllowableForCellular];
  [v4 setDownloadableOverCellular:self->_downloadableOverCellular];
  [v4 setDownloadable:self->_downloadable];
  [v4 _setStreamingZipCapable:self->_streamingZipCapable];
  [v4 _setDisableSiriVoiceDeletion:self->_disableSiriVoiceDeletion];
  [v4 _setDisableCDLevel4:self->_disableCDLevel4];
  [v4 _setDisableAppDemotion:self->_disableAppDemotion];
  [v4 _setDisableInstallTonight:self->_disableIntallTonight];
  [v4 setRampEnabled:self->_rampEnabled];
  [v4 setGranularlyRamped:self->_granularlyRamped];
  [v4 setSetupCritical:self->_setupCritical];
  [v4 setCriticalOutOfBoxOnly:self->_criticalOutOfBoxOnly];
  [v4 setAutoUpdateEnabled:self->_autoUpdateEnabled];
  [v4 setCriticalDownloadPolicy:self->_criticalDownloadPolicy];
  [v4 setMinimumSystemPartitionSize:self->_minimumSystemPartitionSize];
  double v6 = (void *)[(NSDictionary *)self->_systemPartitionPadding copy];
  [v4 setSystemPartitionPadding:v6];

  [v4 setSEPDigest:self->_sepDigest];
  [v4 setRSEPDigest:self->_rsepDigest];
  [v4 setSEPTBMDigest:self->_sepTBMDigest];
  [v4 setRSEPTBMDigest:self->_rsepTBMDigest];
  [v4 setReleaseDate:self->_releaseDate];
  [v4 setMdmDelayInterval:self->_mdmDelayInterval];
  [v4 setAssetID:self->_assetID];
  [v4 setHideInstallAlert:self->_hideInstallAlert];
  [v4 setAudienceType:self->_audienceType];
  [v4 setPreferenceType:self->_preferenceType];
  [v4 setUpgradeType:self->_upgradeType];
  [v4 setPromoteAlternateUpdate:self->_promoteAlternateUpdate];
  [v4 setIsSplatOnly:self->_isSplatOnly];
  [v4 setHumanReadableUpdateName:self->_humanReadableUpdateName];
  [v4 setMandatoryUpdateEligible:self->_mandatoryUpdateEligible];
  [v4 setMandatoryUpdateVersionMin:self->_mandatoryUpdateVersionMin];
  [v4 setMandatoryUpdateVersionMax:self->_mandatoryUpdateVersionMax];
  [v4 setMandatoryUpdateOptional:self->_mandatoryUpdateOptional];
  [v4 setMandatoryUpdateRestrictedToOutOfTheBox:self->_mandatoryUpdateRestrictedToOutOfTheBox];
  [v4 setForcePasscodeRequired:self->_forcePasscodeRequired];
  [v4 setAllowAutoDownloadOnBattery:self->_allowAutoDownloadOnBattery];
  [v4 setAutoDownloadOnBatteryDelay:self->_autoDownloadOnBatteryDelay];
  [v4 setAutoDownloadOnBatteryMinBattery:self->_autoDownloadOnBatteryMinBattery];
  [v4 setIsSplombo:self->_isSplombo];
  [v4 setSplatComboBuildVersion:self->_splatComboBuildVersion];
  return v4;
}

- (BOOL)rampEnabled
{
  v3 = +[SUPreferences sharedInstance];
  int v4 = [v3 overrideRamping];

  if (!v4) {
    return self->_rampEnabled;
  }
  SULogDebug(@"Default set to override ramping to YES", v5, v6, v7, v8, v9, v10, v11, v13);
  return 1;
}

- (BOOL)granularlyRamped
{
  v3 = +[SUPreferences sharedInstance];
  int v4 = [v3 overrideGranularRamping];

  if (!v4) {
    return self->_granularlyRamped;
  }
  SULogDebug(@"Default set to override granular ramping to YES", v5, v6, v7, v8, v9, v10, v11, v13);
  return 1;
}

- (NSString)splatComboBuildVersion
{
  if ([(SUDescriptor *)self isSplombo]
    && (+[SUPreferences sharedInstance],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 overrideSplatComboBuildVersion],
        int v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    SULogDebug(@"Default set to override splatComboBuildVersion", v5, v6, v7, v8, v9, v10, v11, v15);
    v12 = +[SUPreferences sharedInstance];
    uint64_t v13 = [v12 overrideSplatComboBuildVersion];
  }
  else
  {
    uint64_t v13 = self->_splatComboBuildVersion;
  }

  return v13;
}

- (BOOL)isValidDescriptor
{
  v3 = [(SUDescriptor *)self productVersion];
  if ([(SUDescriptor *)self _hasValue:v3])
  {
    int v4 = [(SUDescriptor *)self productBuildVersion];
    if ([(SUDescriptor *)self _hasValue:v4])
    {
      uint64_t v5 = [(SUDescriptor *)self productSystemName];
      if ([(SUDescriptor *)self _hasValue:v5]) {
        BOOL v6 = [(SUDescriptor *)self updateType] != 0;
      }
      else {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_hasValue:(id)a3
{
  if (a3) {
    return [a3 isEqual:&stru_26CE93248] ^ 1;
  }
  else {
    return 0;
  }
}

- (id)_buildCompareKey
{
  v3 = [(SUDescriptor *)self productVersion];
  int v4 = [(SUDescriptor *)self productVersionExtra];

  if (v4)
  {
    uint64_t v5 = [(SUDescriptor *)self productVersionExtra];
    uint64_t v6 = [v3 stringByAppendingString:v5];

    v3 = (void *)v6;
  }
  uint64_t v7 = NSString;
  uint64_t v8 = [(SUDescriptor *)self productBuildVersion];
  uint64_t v9 = [(SUDescriptor *)self updateType];
  BOOL v10 = [(SUDescriptor *)self isDownloadable];
  BOOL v11 = [(SUDescriptor *)self isSplombo];
  v12 = [(SUDescriptor *)self splatComboBuildVersion];
  uint64_t v13 = [v7 stringWithFormat:@"%@/%@/%u/%u/%u/%@", v3, v8, v9, v10, v11, v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (SUDescriptor *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    char v9 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(SUDescriptor *)self _buildCompareKey];
    uint64_t v8 = [(SUDescriptor *)v6 _buildCompareKey];

    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
LABEL_5:
    char v9 = 0;
  }
LABEL_7:

  return v9;
}

- (unint64_t)hash
{
  v2 = [(SUDescriptor *)self _buildCompareKey];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEmergencyOrCritical
{
  return [(SUDescriptor *)self updateType] == 3;
}

- (id)description
{
  v43 = NSString;
  v50 = [(SUDescriptor *)self publisher];
  v49 = [(SUDescriptor *)self humanReadableUpdateName];
  uint64_t v48 = [(SUDescriptor *)self productSystemName];
  uint64_t v3 = [(SUDescriptor *)self productVersion];
  uint64_t v4 = [(SUDescriptor *)self productVersionExtra];
  uint64_t v5 = [(SUDescriptor *)self productBuildVersion];
  uint64_t v6 = [(SUDescriptor *)self prerequisiteBuild];
  v70 = [(SUDescriptor *)self prerequisiteOS];
  v69 = [(SUDescriptor *)self releaseType];
  v68 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor downloadSize](self, "downloadSize"));
  v67 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor _unarchiveSize](self, "_unarchiveSize"));
  v66 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor _msuPrepareSize](self, "_msuPrepareSize"));
  v65 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor preparationSize](self, "preparationSize"));
  v64 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor installationSize](self, "installationSize"));
  v63 = SUStringFromUpdateType([(SUDescriptor *)self updateType]);
  if ([(SUDescriptor *)self isDownloadable]) {
    uint64_t v7 = @"Yes";
  }
  else {
    uint64_t v7 = @"No";
  }
  v42 = v7;
  if ([(SUDescriptor *)self isDownloadableOverCellular]) {
    uint64_t v8 = @"Yes";
  }
  else {
    uint64_t v8 = @"No";
  }
  v41 = v8;
  if ([(SUDescriptor *)self autoDownloadAllowableForCellular]) {
    char v9 = @"Yes";
  }
  else {
    char v9 = @"No";
  }
  v40 = v9;
  if ([(SUDescriptor *)self autoUpdateEnabled]) {
    BOOL v10 = @"Yes";
  }
  else {
    BOOL v10 = @"No";
  }
  id v39 = v10;
  BOOL streamingZipCapable = self->_streamingZipCapable;
  v62 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor totalRequiredFreeSpace](self, "totalRequiredFreeSpace"));
  v61 = [(SUDescriptor *)self documentation];
  BOOL v37 = [(SUDescriptor *)self siriVoiceDeletionDisabled];
  BOOL v36 = [(SUDescriptor *)self cdLevel4Disabled];
  BOOL v35 = [(SUDescriptor *)self appDemotionDisabled];
  BOOL v34 = [(SUDescriptor *)self installTonightDisabled];
  BOOL v33 = [(SUDescriptor *)self rampEnabled];
  BOOL v32 = [(SUDescriptor *)self granularlyRamped];
  v60 = [(SUDescriptor *)self setupCritical];
  BOOL v31 = [(SUDescriptor *)self criticalOutOfBoxOnly];
  v59 = [(SUDescriptor *)self criticalDownloadPolicy];
  v58 = [(SUDescriptor *)self releaseDate];
  v57 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUDescriptor mdmDelayInterval](self, "mdmDelayInterval"));
  v56 = [(SUDescriptor *)self assetID];
  BOOL v11 = @"YES";
  if ([(SUDescriptor *)self hideInstallAlert]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  v29 = v12;
  v55 = SUStringFromAudienceType([(SUDescriptor *)self audienceType]);
  v54 = SUStringFromPreferredUpdateType([(SUDescriptor *)self preferenceType]);
  v53 = SUStringFromVersionUpgradeType([(SUDescriptor *)self upgradeType]);
  if ([(SUDescriptor *)self promoteAlternateUpdate]) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  v28 = v13;
  if ([(SUDescriptor *)self isSplatOnly]) {
    objc_super v14 = @"YES";
  }
  else {
    objc_super v14 = @"NO";
  }
  v27 = v14;
  if ([(SUDescriptor *)self mandatoryUpdateEligible]) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  v26 = v15;
  v30 = [(SUDescriptor *)self mandatoryUpdateVersionMin];
  if (v30)
  {
    v52 = [(SUDescriptor *)self mandatoryUpdateVersionMin];
  }
  else
  {
    v52 = @"N/A";
  }
  v16 = [(SUDescriptor *)self mandatoryUpdateVersionMax];
  uint64_t v47 = (void *)v3;
  uint64_t v46 = (void *)v4;
  uint64_t v45 = (void *)v5;
  v44 = (void *)v6;
  if (v16)
  {
    v51 = [(SUDescriptor *)self mandatoryUpdateVersionMax];
  }
  else
  {
    v51 = @"N/A";
  }
  if ([(SUDescriptor *)self mandatoryUpdateOptional]) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  if ([(SUDescriptor *)self mandatoryUpdateRestrictedToOutOfTheBox]) {
    v18 = @"YES";
  }
  else {
    v18 = @"NO";
  }
  if ([(SUDescriptor *)self forcePasscodeRequired]) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  if ([(SUDescriptor *)self allowAutoDownloadOnBattery]) {
    v20 = @"YES";
  }
  else {
    v20 = @"NO";
  }
  uint64_t v21 = [(SUDescriptor *)self autoDownloadOnBatteryDelay];
  uint64_t v22 = [(SUDescriptor *)self autoDownloadOnBatteryMinBattery];
  if (![(SUDescriptor *)self isSplombo]) {
    BOOL v11 = @"NO";
  }
  v23 = [(SUDescriptor *)self splatComboBuildVersion];
  objc_msgSend(v43, "stringWithFormat:", @"\n            Publisher: %@\n            HumanReadableUpdateName: %@\n            ProductSystemName: %@\n            ProductVersion: %@\n            ProductVersionExtra: %@\n            ProductBuildVersion: %@\n            PrerequisiteBuild: %@\n            PrerequisiteOS: %@\n            ReleaseType: %@\n            DownloadSize: %@\n            UnarchiveSize: %@\n            MSUPrepareSize: %@\n            PreparationSize: %@\n            InstallationSize: %@\n            UpdateType: %@\n            Downloadable: %@\n            DownloadableOverCellular: %@\n            AutoDownloadableOverCellular: %@\n            AutoUpdateEnabled: %@\n            StreamingZipCapable: %d\n            TotalRequiredFreeSpace: %@\n            Documentation: %@\n            SiriVoiceDeletion: %d\n            CDLevel4Deletion: %d\n            appDemotionDisabled: %d\n            installTonightDisabled: %d\n            rampEnabled: %d\n            granularlyRamped: %d\n            setupCritical: %@\n            criticalOutOfBoxOnly: %d\n            criticalDownloadPolicy: %@\n            releaseDate: %@\n            mdmDelayInterval: %@\n            assetID: %@\n            hideInstallAlert %@\n            audienceType %@\n            preferenceType %@\n            upgradeType %@\n            promoteAlternateUpdate: %@\n            isSplatOnly: %@\n            mandatoryUpdateEligible: %@\n            mandatoryUpdateVersionMin: %@\n            mandatoryUpdateVersionMax: %@\n            mandatoryUpdateOptional: %@\n            mandatoryUpdateRestrictedToOutOfTheBox: %@\n            forcePasscodeRequired: %@\n            allowAutoDownloadOnBattery: %@\n            autoDownloadOnBatteryDelay: %u\n            autoDownloadOnBatteryMinbattery: %u%%\n            isSplombo: %@\n            splatComboBuildVersion: %@", v50, v49, v48, v47, v46, v45, v44, v70, v69, v68, v67, v66, v65, v64, v63, v42,
    v41,
    v40,
    v39,
    streamingZipCapable,
    v62,
    v61,
    v37,
    v36,
    v35,
    v34,
    v33,
    v32,
    v60,
    v31,
    v59,
    v58,
    v57,
    v56,
    v29,
    v55,
    v54,
    v53,
    v28,
    v27,
    v26,
    v52,
    v51,
    v17,
    v18,
    v19,
    v20,
    v21,
    v22,
    v11,
  v24 = v23);

  if (v16) {
  if (v30)
  }

  return v24;
}

- (void)setPublisher:(id)a3
{
}

- (void)setProductSystemName:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)productVersionExtra
{
  return self->_productVersionExtra;
}

- (void)setProductVersionExtra:(id)a3
{
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
}

- (NSString)prerequisiteBuild
{
  return self->_prerequisiteBuild;
}

- (void)setPrerequisiteBuild:(id)a3
{
}

- (NSString)prerequisiteOS
{
  return self->_prerequisiteOS;
}

- (void)setPrerequisiteOS:(id)a3
{
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (void)setDownloadSize:(unint64_t)a3
{
  self->_downloadSize = a3;
}

- (unint64_t)installationSize
{
  return self->_installationSize;
}

- (void)setInstallationSize:(unint64_t)a3
{
  self->_installationSize = a3;
}

- (unint64_t)_unarchiveSize
{
  return self->_unarchiveSize;
}

- (void)_setUnarchiveSize:(unint64_t)a3
{
  self->_unarchiveSize = a3;
}

- (unint64_t)minimumSystemPartitionSize
{
  return self->_minimumSystemPartitionSize;
}

- (void)setMinimumSystemPartitionSize:(unint64_t)a3
{
  self->_minimumSystemPartitionSize = a3;
}

- (unint64_t)_msuPrepareSize
{
  return self->_msuPrepareSize;
}

- (void)_setMsuPrepareSize:(unint64_t)a3
{
  self->_msuPrepareSize = a3;
}

- (unint64_t)preparationSize
{
  return self->_preparationSize;
}

- (void)setPreparationSize:(unint64_t)a3
{
  self->_preparationSize = a3;
}

- (unint64_t)totalRequiredFreeSpace
{
  return self->_totalRequiredFreeSpace;
}

- (void)setTotalRequiredFreeSpace:(unint64_t)a3
{
  self->_totalRequiredFreeSpace = a3;
}

- (int)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(int)a3
{
  self->_uint64_t updateType = a3;
}

- (SUDocumentation)documentation
{
  return self->_documentation;
}

- (void)setDocumentation:(id)a3
{
}

- (BOOL)autoDownloadAllowableForCellular
{
  return self->_autoDownloadAllowableForCellular;
}

- (void)setAutoDownloadAllowableForCellular:(BOOL)a3
{
  self->_autoDownloadAllowableForCellular = a3;
}

- (BOOL)isDownloadable
{
  return self->_downloadable;
}

- (void)setDownloadable:(BOOL)a3
{
  self->_downloadable = a3;
}

- (BOOL)isDownloadableOverCellular
{
  return self->_downloadableOverCellular;
}

- (void)setDownloadableOverCellular:(BOOL)a3
{
  self->_downloadableOverCellular = a3;
}

- (BOOL)_isStreamingZipCapable
{
  return self->_streamingZipCapable;
}

- (void)_setStreamingZipCapable:(BOOL)a3
{
  self->_BOOL streamingZipCapable = a3;
}

- (BOOL)siriVoiceDeletionDisabled
{
  return self->_disableSiriVoiceDeletion;
}

- (void)_setDisableSiriVoiceDeletion:(BOOL)a3
{
  self->_disableSiriVoiceDeletion = a3;
}

- (BOOL)cdLevel4Disabled
{
  return self->_disableCDLevel4;
}

- (void)_setDisableCDLevel4:(BOOL)a3
{
  self->_disableCDLevel4 = a3;
}

- (BOOL)appDemotionDisabled
{
  return self->_disableAppDemotion;
}

- (void)_setDisableAppDemotion:(BOOL)a3
{
  self->_disableAppDemotion = a3;
}

- (BOOL)installTonightDisabled
{
  return self->_disableIntallTonight;
}

- (void)_setDisableInstallTonight:(BOOL)a3
{
  self->_disableIntallTonight = a3;
}

- (void)setRampEnabled:(BOOL)a3
{
  self->_rampEnabled = a3;
}

- (void)setGranularlyRamped:(BOOL)a3
{
  self->_granularlyRamped = a3;
}

- (NSString)setupCritical
{
  return self->_setupCritical;
}

- (void)setSetupCritical:(id)a3
{
}

- (BOOL)criticalOutOfBoxOnly
{
  return self->_criticalOutOfBoxOnly;
}

- (void)setCriticalOutOfBoxOnly:(BOOL)a3
{
  self->_criticalOutOfBoxOnly = a3;
}

- (BOOL)autoUpdateEnabled
{
  return self->_autoUpdateEnabled;
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  self->_autoUpdateEnabled = a3;
}

- (NSString)criticalDownloadPolicy
{
  return self->_criticalDownloadPolicy;
}

- (void)setCriticalDownloadPolicy:(id)a3
{
}

- (NSDictionary)systemPartitionPadding
{
  return self->_systemPartitionPadding;
}

- (void)setSystemPartitionPadding:(id)a3
{
}

- (NSData)sepDigest
{
  return self->_sepDigest;
}

- (void)setSEPDigest:(id)a3
{
}

- (NSData)rsepDigest
{
  return self->_rsepDigest;
}

- (void)setRSEPDigest:(id)a3
{
}

- (NSData)sepTBMDigest
{
  return self->_sepTBMDigest;
}

- (void)setSEPTBMDigest:(id)a3
{
}

- (NSData)rsepTBMDigest
{
  return self->_rsepTBMDigest;
}

- (void)setRSEPTBMDigest:(id)a3
{
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
}

- (unint64_t)mdmDelayInterval
{
  return self->_mdmDelayInterval;
}

- (void)setMdmDelayInterval:(unint64_t)a3
{
  self->_mdmDelayInterval = a3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (BOOL)hideInstallAlert
{
  return self->_hideInstallAlert;
}

- (void)setHideInstallAlert:(BOOL)a3
{
  self->_hideInstallAlert = a3;
}

- (unint64_t)audienceType
{
  return self->_audienceType;
}

- (void)setAudienceType:(unint64_t)a3
{
  self->_audienceType = a3;
}

- (unint64_t)preferenceType
{
  return self->_preferenceType;
}

- (void)setPreferenceType:(unint64_t)a3
{
  self->_preferenceType = a3;
}

- (unint64_t)upgradeType
{
  return self->_upgradeType;
}

- (void)setUpgradeType:(unint64_t)a3
{
  self->_upgradeType = a3;
}

- (BOOL)promoteAlternateUpdate
{
  return self->_promoteAlternateUpdate;
}

- (void)setPromoteAlternateUpdate:(BOOL)a3
{
  self->_promoteAlternateUpdate = a3;
}

- (BOOL)isSplatOnly
{
  return self->_isSplatOnly;
}

- (void)setIsSplatOnly:(BOOL)a3
{
  self->_isSplatOnly = a3;
}

- (NSString)humanReadableUpdateName
{
  return self->_humanReadableUpdateName;
}

- (void)setHumanReadableUpdateName:(id)a3
{
}

- (BOOL)isSplombo
{
  return self->_isSplombo;
}

- (void)setIsSplombo:(BOOL)a3
{
  self->_isSplombo = a3;
}

- (void)setSplatComboBuildVersion:(id)a3
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

- (BOOL)forcePasscodeRequired
{
  return self->_forcePasscodeRequired;
}

- (void)setForcePasscodeRequired:(BOOL)a3
{
  self->_forcePasscodeRequired = a3;
}

- (BOOL)allowAutoDownloadOnBattery
{
  return self->_allowAutoDownloadOnBattery;
}

- (void)setAllowAutoDownloadOnBattery:(BOOL)a3
{
  self->_allowAutoDownloadOnBattery = a3;
}

- (unsigned)autoDownloadOnBatteryDelay
{
  return self->_autoDownloadOnBatteryDelay;
}

- (void)setAutoDownloadOnBatteryDelay:(unsigned int)a3
{
  self->_autoDownloadOnBatteryDelay = a3;
}

- (unsigned)autoDownloadOnBatteryMinBattery
{
  return self->_autoDownloadOnBatteryMinBattery;
}

- (void)setAutoDownloadOnBatteryMinBattery:(unsigned int)a3
{
  self->_autoDownloadOnBatteryMinBattery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criticalDownloadPolicy, 0);
  objc_storeStrong((id *)&self->_splatComboBuildVersion, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateVersionMax, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateVersionMin, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_rsepTBMDigest, 0);
  objc_storeStrong((id *)&self->_sepTBMDigest, 0);
  objc_storeStrong((id *)&self->_rsepDigest, 0);
  objc_storeStrong((id *)&self->_sepDigest, 0);
  objc_storeStrong((id *)&self->_systemPartitionPadding, 0);
  objc_storeStrong((id *)&self->_setupCritical, 0);
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_prerequisiteOS, 0);
  objc_storeStrong((id *)&self->_prerequisiteBuild, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersionExtra, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productSystemName, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
  objc_storeStrong((id *)&self->_publisher, 0);

  objc_storeStrong((id *)&self->_documentation, 0);
}

@end