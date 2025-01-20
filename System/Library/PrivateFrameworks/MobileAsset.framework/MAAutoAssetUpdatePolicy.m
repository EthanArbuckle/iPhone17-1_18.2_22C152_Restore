@interface MAAutoAssetUpdatePolicy
+ (BOOL)supportsSecureCoding;
+ (id)activityIntervalString:(int64_t)a3;
- (BOOL)allowAutoCheckForNewerOverExpensive;
- (BOOL)allowAutoCheckForNewerWhenBatteryLow;
- (BOOL)allowAutoCheckForNewerWhenCPUHigh;
- (BOOL)allowAutoDownloadWhenBatteryLow;
- (BOOL)allowAutoDownloadWhenCPUHigh;
- (BOOL)allowInterestAcrossTermination;
- (BOOL)allowLockAcrossOTAUpdate;
- (BOOL)allowLockAcrossReboot;
- (BOOL)allowLockAcrossTermination;
- (BOOL)allowLockOfRevokedContent;
- (BOOL)allowLockWhenFilesystemSpaceCritical;
- (BOOL)blockAutoCheckForNewerOverCellular;
- (BOOL)blockAutoDownloadOverCellular;
- (BOOL)blockIfBeforeFirstUnlock;
- (BOOL)blockUserInitiatedDownloadOverCellular;
- (BOOL)blockUserInitiatedDownloadOverExpensive;
- (BOOL)blockUserInitiatedDownloadWhenBatteryLow;
- (BOOL)blockUserInitiatedDownloadWhenCPUHigh;
- (BOOL)checkForNewerAsUserInitiated;
- (BOOL)checkForNewerWithoutRampEnabled;
- (BOOL)downloadWithoutPreferenceForWiFi;
- (BOOL)newerFoundAutoDownloadPostponed;
- (BOOL)revokeIgnoredForLockedContent;
- (BOOL)revokeIgnoredForUnlockedPurge;
- (BOOL)revokeTriggersLockedPurge;
- (MAAutoAssetUpdatePolicy)initWithCoder:(id)a3;
- (NSArray)categoryList;
- (NSDictionary)additionalUpdatePolicyControl;
- (NSString)assetType;
- (NSString)updatePolicyName;
- (NSUUID)assetAudienceUUID;
- (id)initUpdatePolicy:(id)a3 forAssetType:(id)a4;
- (id)limitByNetworkType;
- (id)limitCellularByFeeAgreement;
- (id)limitCellularByRestrictedTimePeriods;
- (id)limitWiFiByRestrictedTimePeriods;
- (id)newSummaryDictionary;
- (id)summary;
- (int64_t)checkForNewerIntervalSecs;
- (int64_t)checkForNewerTimeoutSecs;
- (int64_t)defaultPreventGarbageCollectionSecs;
- (int64_t)defaultUnlockAfterUsageSecs;
- (int64_t)maximumPreventGarbageCollectionSecs;
- (int64_t)maximumUnlockAfterUsageSecs;
- (int64_t)newerFoundAutoDownloadJitterSecs;
- (int64_t)newerFoundAutoDownloadTimeoutSecs;
- (int64_t)newerFoundUserInitiatedDownloadTimeoutSecs;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalUpdatePolicyControl:(id)a3;
- (void)setAllowAutoCheckForNewerOverExpensive:(BOOL)a3;
- (void)setAllowAutoCheckForNewerWhenBatteryLow:(BOOL)a3;
- (void)setAllowAutoCheckForNewerWhenCPUHigh:(BOOL)a3;
- (void)setAllowAutoDownloadWhenBatteryLow:(BOOL)a3;
- (void)setAllowAutoDownloadWhenCPUHigh:(BOOL)a3;
- (void)setAllowInterestAcrossTermination:(BOOL)a3;
- (void)setAllowLockAcrossOTAUpdate:(BOOL)a3;
- (void)setAllowLockAcrossReboot:(BOOL)a3;
- (void)setAllowLockAcrossTermination:(BOOL)a3;
- (void)setAllowLockOfRevokedContent:(BOOL)a3;
- (void)setAllowLockWhenFilesystemSpaceCritical:(BOOL)a3;
- (void)setAssetAudienceUUID:(id)a3;
- (void)setBlockAutoCheckForNewerOverCellular:(BOOL)a3;
- (void)setBlockAutoDownloadOverCellular:(BOOL)a3;
- (void)setBlockIfBeforeFirstUnlock:(BOOL)a3;
- (void)setBlockUserInitiatedDownloadOverCellular:(BOOL)a3;
- (void)setBlockUserInitiatedDownloadOverExpensive:(BOOL)a3;
- (void)setBlockUserInitiatedDownloadWhenBatteryLow:(BOOL)a3;
- (void)setBlockUserInitiatedDownloadWhenCPUHigh:(BOOL)a3;
- (void)setCheckForNewerAsUserInitiated:(BOOL)a3;
- (void)setCheckForNewerIntervalSecs:(int64_t)a3;
- (void)setCheckForNewerTimeoutSecs:(int64_t)a3;
- (void)setCheckForNewerWithoutRampEnabled:(BOOL)a3;
- (void)setDefaultPreventGarbageCollectionSecs:(int64_t)a3;
- (void)setDefaultUnlockAfterUsageSecs:(int64_t)a3;
- (void)setDownloadWithoutPreferenceForWiFi:(BOOL)a3;
- (void)setLimitByNetworkType:(id)a3;
- (void)setLimitCellularByFeeAgreement:(id)a3;
- (void)setLimitCellularByRestrictedTimePeriods:(id)a3;
- (void)setLimitWiFiByRestrictedTimePeriods:(id)a3;
- (void)setMaximumPreventGarbageCollectionSecs:(int64_t)a3;
- (void)setMaximumUnlockAfterUsageSecs:(int64_t)a3;
- (void)setNewerFoundAutoDownloadJitterSecs:(int64_t)a3;
- (void)setNewerFoundAutoDownloadPostponed:(BOOL)a3;
- (void)setNewerFoundAutoDownloadTimeoutSecs:(int64_t)a3;
- (void)setNewerFoundUserInitiatedDownloadTimeoutSecs:(int64_t)a3;
- (void)setRevokeIgnoredForLockedContent:(BOOL)a3;
- (void)setRevokeIgnoredForUnlockedPurge:(BOOL)a3;
- (void)setRevokeTriggersLockedPurge:(BOOL)a3;
@end

@implementation MAAutoAssetUpdatePolicy

- (id)initUpdatePolicy:(id)a3 forAssetType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MAAutoAssetUpdatePolicy;
  v9 = [(MAAutoAssetUpdatePolicy *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_updatePolicyName, a3);
    objc_storeStrong((id *)&v10->_assetType, a4);
    categoryList = v10->_categoryList;
    v10->_categoryList = 0;

    *(_WORD *)&v10->_checkForNewerAsUserInitiated = 0;
    v10->_newerFoundAutoDownloadPostponed = 0;
    *(_OWORD *)&v10->_checkForNewerIntervalSecs = xmmword_1B27E34F0;
    *(_OWORD *)&v10->_newerFoundAutoDownloadJitterSecs = xmmword_1B27E3500;
    *(void *)&v10->_revokeIgnoredForUnlockedPurge = 0;
    v10->_allowLockWhenFilesystemSpaceCritical = 0;
    *(_OWORD *)&v10->_newerFoundUserInitiatedDownloadTimeoutSecs = xmmword_1B27E3510;
    *(_OWORD *)&v10->_maximumUnlockAfterUsageSecs = xmmword_1B27E3510;
    additionalUpdatePolicyControl = v10->_additionalUpdatePolicyControl;
    v10->_maximumPreventGarbageCollectionSecs = 900;
    v10->_additionalUpdatePolicyControl = 0;

    *(void *)&v10->_blockIfBeforeFirstUnlock = 0;
    *(void *)&v10->_allowAutoCheckForNewerWhenBatteryLow = 0;
    id limitCellularByRestrictedTimePeriods = v10->_limitCellularByRestrictedTimePeriods;
    v10->_id limitCellularByRestrictedTimePeriods = 0;

    id limitWiFiByRestrictedTimePeriods = v10->_limitWiFiByRestrictedTimePeriods;
    v10->_id limitWiFiByRestrictedTimePeriods = 0;

    id limitCellularByFeeAgreement = v10->_limitCellularByFeeAgreement;
    v10->_id limitCellularByFeeAgreement = 0;

    id limitByNetworkType = v10->_limitByNetworkType;
    v10->_id limitByNetworkType = 0;

    assetAudienceUUID = v10->_assetAudienceUUID;
    v10->_assetAudienceUUID = 0;
  }
  return v10;
}

- (MAAutoAssetUpdatePolicy)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MAAutoAssetUpdatePolicy;
  v5 = [(MAAutoAssetUpdatePolicy *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updatePolicyName"];
    updatePolicyName = v5->_updatePolicyName;
    v5->_updatePolicyName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetType"];
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v12 = (void *)[v10 initWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"categoryList"];
    categoryList = v5->_categoryList;
    v5->_categoryList = (NSArray *)v13;

    v5->_checkForNewerIntervalSecs = [v4 decodeIntegerForKey:@"checkForNewerIntervalSecs"];
    v5->_checkForNewerTimeoutSecs = [v4 decodeIntegerForKey:@"checkForNewerTimeoutSecs"];
    v5->_checkForNewerAsUserInitiated = [v4 decodeBoolForKey:@"checkForNewerAsUserInitiated"];
    v5->_checkForNewerWithoutRampEnabled = [v4 decodeBoolForKey:@"checkForNewerWithoutRampEnabled"];
    v5->_newerFoundAutoDownloadPostponed = [v4 decodeBoolForKey:@"newerFoundAutoDownloadPostponed"];
    v5->_newerFoundAutoDownloadJitterSecs = [v4 decodeIntegerForKey:@"newerFoundAutoDownloadJitterSecs"];
    v5->_newerFoundAutoDownloadTimeoutSecs = [v4 decodeIntegerForKey:@"newerFoundAutoDownloadTimeoutSecs"];
    v5->_newerFoundUserInitiatedDownloadTimeoutSecs = [v4 decodeIntegerForKey:@"newerFoundUserInitiatedDownloadTimeoutSecs"];
    v5->_revokeIgnoredForUnlockedPurge = [v4 decodeBoolForKey:@"revokeIgnoredForUnlockedPurge"];
    v5->_revokeIgnoredForLockedContent = [v4 decodeBoolForKey:@"revokeIgnoredForLockedContent"];
    v5->_revokeTriggersLockedPurge = [v4 decodeBoolForKey:@"revokeTriggersLockedPurge"];
    v5->_allowInterestAcrossTermination = [v4 decodeBoolForKey:@"allowInterestAcrossTermination"];
    v5->_allowLockAcrossTermination = [v4 decodeBoolForKey:@"allowLockAcrossTermination"];
    v5->_allowLockAcrossReboot = [v4 decodeBoolForKey:@"allowLockAcrossReboot"];
    v5->_allowLockAcrossOTAUpdate = [v4 decodeBoolForKey:@"allowLockAcrossOTAUpdate"];
    v5->_allowLockOfRevokedContent = [v4 decodeBoolForKey:@"allowLockOfRevokedContent"];
    v5->_allowLockWhenFilesystemSpaceCritical = [v4 decodeBoolForKey:@"allowLockWhenFilesystemSpaceCritical"];
    v5->_defaultUnlockAfterUsageSecs = [v4 decodeIntegerForKey:@"defaultUnlockAfterUsageSecs"];
    v5->_maximumUnlockAfterUsageSecs = [v4 decodeIntegerForKey:@"maximumUnlockAfterUsageSecs"];
    v5->_defaultPreventGarbageCollectionSecs = [v4 decodeIntegerForKey:@"defaultPreventGarbageCollectionSecs"];
    v5->_maximumPreventGarbageCollectionSecs = [v4 decodeIntegerForKey:@"maximumPreventGarbageCollectionSecs"];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    v24[4] = objc_opt_class();
    v24[5] = objc_opt_class();
    v24[6] = objc_opt_class();
    v24[7] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:8];
    v17 = [v15 setWithArray:v16];

    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"additionalUpdatePolicyControl"];
    additionalUpdatePolicyControl = v5->_additionalUpdatePolicyControl;
    v5->_additionalUpdatePolicyControl = (NSDictionary *)v18;

    v5->_allowAutoCheckForNewerWhenBatteryLow = [v4 decodeBoolForKey:@"allowAutoCheckForNewerWhenBatteryLow"];
    v5->_allowAutoCheckForNewerWhenCPUHigh = [v4 decodeBoolForKey:@"allowAutoCheckForNewerWhenCPUHigh"];
    v5->_allowAutoCheckForNewerOverExpensive = [v4 decodeBoolForKey:@"allowAutoCheckForNewerOverExpensive"];
    v5->_allowAutoDownloadWhenBatteryLow = [v4 decodeBoolForKey:@"allowAutoDownloadWhenBatteryLow"];
    v5->_allowAutoDownloadWhenCPUHigh = [v4 decodeBoolForKey:@"allowAutoDownloadWhenCPUHigh"];
    v5->_blockIfBeforeFirstUnlock = [v4 decodeBoolForKey:@"blockIfBeforeFirstUnlock"];
    v5->_blockAutoCheckForNewerOverCellular = [v4 decodeBoolForKey:@"blockAutoCheckForNewerOverCellular"];
    v5->_blockAutoDownloadOverCellular = [v4 decodeBoolForKey:@"blockAutoDownloadOverCellular"];
    v5->_blockUserInitiatedDownloadOverCellular = [v4 decodeBoolForKey:@"blockUserInitiatedDownloadOverCellular"];
    v5->_blockUserInitiatedDownloadWhenBatteryLow = [v4 decodeBoolForKey:@"blockUserInitiatedDownloadWhenBatteryLow"];
    v5->_blockUserInitiatedDownloadWhenCPUHigh = [v4 decodeBoolForKey:@"blockUserInitiatedDownloadWhenCPUHigh"];
    v5->_blockUserInitiatedDownloadOverExpensive = [v4 decodeBoolForKey:@"blockUserInitiatedDownloadOverExpensive"];
    v5->_downloadWithoutPreferenceForWiFi = [v4 decodeBoolForKey:@"downloadWithoutPreferenceForWiFi"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetAudienceUUID"];
    assetAudienceUUID = v5->_assetAudienceUUID;
    v5->_assetAudienceUUID = (NSUUID *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MAAutoAssetUpdatePolicy *)self updatePolicyName];
  [v4 encodeObject:v5 forKey:@"updatePolicyName"];

  uint64_t v6 = [(MAAutoAssetUpdatePolicy *)self assetType];
  [v4 encodeObject:v6 forKey:@"assetType"];

  id v7 = [(MAAutoAssetUpdatePolicy *)self categoryList];
  [v4 encodeObject:v7 forKey:@"categoryList"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy checkForNewerIntervalSecs](self, "checkForNewerIntervalSecs"), @"checkForNewerIntervalSecs");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy checkForNewerTimeoutSecs](self, "checkForNewerTimeoutSecs"), @"checkForNewerTimeoutSecs");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy checkForNewerAsUserInitiated](self, "checkForNewerAsUserInitiated"), @"checkForNewerAsUserInitiated");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy checkForNewerWithoutRampEnabled](self, "checkForNewerWithoutRampEnabled"), @"checkForNewerWithoutRampEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy newerFoundAutoDownloadPostponed](self, "newerFoundAutoDownloadPostponed"), @"newerFoundAutoDownloadPostponed");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy newerFoundAutoDownloadJitterSecs](self, "newerFoundAutoDownloadJitterSecs"), @"newerFoundAutoDownloadJitterSecs");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy newerFoundAutoDownloadTimeoutSecs](self, "newerFoundAutoDownloadTimeoutSecs"), @"newerFoundAutoDownloadTimeoutSecs");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy newerFoundUserInitiatedDownloadTimeoutSecs](self, "newerFoundUserInitiatedDownloadTimeoutSecs"), @"newerFoundUserInitiatedDownloadTimeoutSecs");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy revokeIgnoredForUnlockedPurge](self, "revokeIgnoredForUnlockedPurge"), @"revokeIgnoredForUnlockedPurge");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy revokeIgnoredForLockedContent](self, "revokeIgnoredForLockedContent"), @"revokeIgnoredForLockedContent");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy revokeTriggersLockedPurge](self, "revokeTriggersLockedPurge"), @"revokeTriggersLockedPurge");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowInterestAcrossTermination](self, "allowInterestAcrossTermination"), @"allowInterestAcrossTermination");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowLockAcrossTermination](self, "allowLockAcrossTermination"), @"allowLockAcrossTermination");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowLockAcrossReboot](self, "allowLockAcrossReboot"), @"allowLockAcrossReboot");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowLockAcrossOTAUpdate](self, "allowLockAcrossOTAUpdate"), @"allowLockAcrossOTAUpdate");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowLockOfRevokedContent](self, "allowLockOfRevokedContent"), @"allowLockOfRevokedContent");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowLockWhenFilesystemSpaceCritical](self, "allowLockWhenFilesystemSpaceCritical"), @"allowLockWhenFilesystemSpaceCritical");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy defaultUnlockAfterUsageSecs](self, "defaultUnlockAfterUsageSecs"), @"defaultUnlockAfterUsageSecs");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy maximumUnlockAfterUsageSecs](self, "maximumUnlockAfterUsageSecs"), @"maximumUnlockAfterUsageSecs");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy defaultPreventGarbageCollectionSecs](self, "defaultPreventGarbageCollectionSecs"), @"defaultPreventGarbageCollectionSecs");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy maximumPreventGarbageCollectionSecs](self, "maximumPreventGarbageCollectionSecs"), @"maximumPreventGarbageCollectionSecs");
  uint64_t v8 = [(MAAutoAssetUpdatePolicy *)self additionalUpdatePolicyControl];
  [v4 encodeObject:v8 forKey:@"additionalUpdatePolicyControl"];

  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowAutoCheckForNewerWhenBatteryLow](self, "allowAutoCheckForNewerWhenBatteryLow"), @"allowAutoCheckForNewerWhenBatteryLow");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowAutoCheckForNewerWhenCPUHigh](self, "allowAutoCheckForNewerWhenCPUHigh"), @"allowAutoCheckForNewerWhenCPUHigh");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowAutoCheckForNewerOverExpensive](self, "allowAutoCheckForNewerOverExpensive"), @"allowAutoCheckForNewerOverExpensive");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowAutoDownloadWhenBatteryLow](self, "allowAutoDownloadWhenBatteryLow"), @"allowAutoDownloadWhenBatteryLow");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowAutoDownloadWhenCPUHigh](self, "allowAutoDownloadWhenCPUHigh"), @"allowAutoDownloadWhenCPUHigh");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy blockIfBeforeFirstUnlock](self, "blockIfBeforeFirstUnlock"), @"blockIfBeforeFirstUnlock");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy blockAutoCheckForNewerOverCellular](self, "blockAutoCheckForNewerOverCellular"), @"blockAutoCheckForNewerOverCellular");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy blockAutoDownloadOverCellular](self, "blockAutoDownloadOverCellular"), @"blockAutoDownloadOverCellular");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy blockUserInitiatedDownloadOverCellular](self, "blockUserInitiatedDownloadOverCellular"), @"blockUserInitiatedDownloadOverCellular");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy blockUserInitiatedDownloadWhenBatteryLow](self, "blockUserInitiatedDownloadWhenBatteryLow"), @"blockUserInitiatedDownloadWhenBatteryLow");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy blockUserInitiatedDownloadWhenCPUHigh](self, "blockUserInitiatedDownloadWhenCPUHigh"), @"blockUserInitiatedDownloadWhenCPUHigh");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy blockUserInitiatedDownloadOverExpensive](self, "blockUserInitiatedDownloadOverExpensive"), @"blockUserInitiatedDownloadOverExpensive");
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy downloadWithoutPreferenceForWiFi](self, "downloadWithoutPreferenceForWiFi"), @"downloadWithoutPreferenceForWiFi");
  id v9 = [(MAAutoAssetUpdatePolicy *)self assetAudienceUUID];
  [v4 encodeObject:v9 forKey:@"assetAudienceUUID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = NSString;
  id v4 = [(MAAutoAssetUpdatePolicy *)self updatePolicyName];
  v5 = [(MAAutoAssetUpdatePolicy *)self assetType];
  if (v5)
  {
    uint64_t v6 = [(MAAutoAssetUpdatePolicy *)self assetType];
  }
  else
  {
    uint64_t v6 = @"ALL-ASSET-TYPES";
  }
  id v7 = +[MAAutoAssetUpdatePolicy activityIntervalString:[(MAAutoAssetUpdatePolicy *)self checkForNewerIntervalSecs]];
  uint64_t v8 = +[MAAutoAssetUpdatePolicy activityIntervalString:[(MAAutoAssetUpdatePolicy *)self newerFoundAutoDownloadJitterSecs]];
  BOOL v9 = [(MAAutoAssetUpdatePolicy *)self blockIfBeforeFirstUnlock];
  id v10 = @"N";
  if (v9) {
    id v10 = @"Y";
  }
  v11 = [v3 stringWithFormat:@"[%@(%@)|checkForNewerInterval:%@,newerFoundAutoDownloadJitter:%@,blockIfBeforeFirstUnlock:%@]", v4, v6, v7, v8, v10];

  if (v5) {
  return v11;
  }
}

- (id)newSummaryDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(MAAutoAssetUpdatePolicy *)self updatePolicyName];
  [v3 setSafeObject:v4 forKey:@"updatePolicyName"];

  v5 = [(MAAutoAssetUpdatePolicy *)self assetType];
  if (v5)
  {
    uint64_t v6 = [(MAAutoAssetUpdatePolicy *)self assetType];
    [v3 setSafeObject:v6 forKey:@"assetType"];
  }
  else
  {
    [v3 setSafeObject:@"ALL-ASSET-TYPES" forKey:@"assetType"];
  }

  id v7 = +[MAAutoAssetUpdatePolicy activityIntervalString:[(MAAutoAssetUpdatePolicy *)self checkForNewerIntervalSecs]];
  [v3 setSafeObject:v7 forKey:@"checkForNewerIntervalSecs"];

  uint64_t v8 = +[MAAutoAssetUpdatePolicy activityIntervalString:[(MAAutoAssetUpdatePolicy *)self newerFoundAutoDownloadJitterSecs]];
  [v3 setSafeObject:v8 forKey:@"newerFoundAutoDownloadJitterSecs"];

  if ([(MAAutoAssetUpdatePolicy *)self blockIfBeforeFirstUnlock]) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  [v3 setSafeObject:v9 forKey:@"blockIfBeforeFirstUnlock"];
  return v3;
}

+ (id)activityIntervalString:(int64_t)a3
{
  if (a3 < 1)
  {
    id v7 = @"DISABLED";
  }
  else
  {
    uint64_t v4 = (uint64_t)(a3 % 0x15180uLL) % 3600;
    uint64_t v5 = v4 / 60;
    uint64_t v6 = v4 % 60;
    if ((unint64_t)a3 >> 7 >= 0x2A3)
    {
      if ((unint64_t)(a3 - 86400) >= 0x15180) {
        BOOL v9 = @"s";
      }
      else {
        BOOL v9 = &stru_1F0A75970;
      }
      [NSString stringWithFormat:@"%ld day%@ %02ld:%02ld:%02ld", a3 / 0x15180uLL, v9, (uint64_t)(a3 % 0x15180uLL) / 3600, v5, v6];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%02ld:%02ld:%02ld", (uint64_t)(a3 % 0x15180uLL) / 3600, v5, v6, v10, v11);
    }
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (NSString)updatePolicyName
{
  return self->_updatePolicyName;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSArray)categoryList
{
  return self->_categoryList;
}

- (int64_t)checkForNewerIntervalSecs
{
  return self->_checkForNewerIntervalSecs;
}

- (void)setCheckForNewerIntervalSecs:(int64_t)a3
{
  self->_checkForNewerIntervalSecs = a3;
}

- (int64_t)checkForNewerTimeoutSecs
{
  return self->_checkForNewerTimeoutSecs;
}

- (void)setCheckForNewerTimeoutSecs:(int64_t)a3
{
  self->_checkForNewerTimeoutSecs = a3;
}

- (BOOL)checkForNewerAsUserInitiated
{
  return self->_checkForNewerAsUserInitiated;
}

- (void)setCheckForNewerAsUserInitiated:(BOOL)a3
{
  self->_checkForNewerAsUserInitiated = a3;
}

- (BOOL)checkForNewerWithoutRampEnabled
{
  return self->_checkForNewerWithoutRampEnabled;
}

- (void)setCheckForNewerWithoutRampEnabled:(BOOL)a3
{
  self->_checkForNewerWithoutRampEnabled = a3;
}

- (BOOL)newerFoundAutoDownloadPostponed
{
  return self->_newerFoundAutoDownloadPostponed;
}

- (void)setNewerFoundAutoDownloadPostponed:(BOOL)a3
{
  self->_newerFoundAutoDownloadPostponed = a3;
}

- (int64_t)newerFoundAutoDownloadJitterSecs
{
  return self->_newerFoundAutoDownloadJitterSecs;
}

- (void)setNewerFoundAutoDownloadJitterSecs:(int64_t)a3
{
  self->_newerFoundAutoDownloadJitterSecs = a3;
}

- (int64_t)newerFoundAutoDownloadTimeoutSecs
{
  return self->_newerFoundAutoDownloadTimeoutSecs;
}

- (void)setNewerFoundAutoDownloadTimeoutSecs:(int64_t)a3
{
  self->_newerFoundAutoDownloadTimeoutSecs = a3;
}

- (int64_t)newerFoundUserInitiatedDownloadTimeoutSecs
{
  return self->_newerFoundUserInitiatedDownloadTimeoutSecs;
}

- (void)setNewerFoundUserInitiatedDownloadTimeoutSecs:(int64_t)a3
{
  self->_newerFoundUserInitiatedDownloadTimeoutSecs = a3;
}

- (BOOL)revokeIgnoredForUnlockedPurge
{
  return self->_revokeIgnoredForUnlockedPurge;
}

- (void)setRevokeIgnoredForUnlockedPurge:(BOOL)a3
{
  self->_revokeIgnoredForUnlockedPurge = a3;
}

- (BOOL)revokeIgnoredForLockedContent
{
  return self->_revokeIgnoredForLockedContent;
}

- (void)setRevokeIgnoredForLockedContent:(BOOL)a3
{
  self->_revokeIgnoredForLockedContent = a3;
}

- (BOOL)revokeTriggersLockedPurge
{
  return self->_revokeTriggersLockedPurge;
}

- (void)setRevokeTriggersLockedPurge:(BOOL)a3
{
  self->_revokeTriggersLockedPurge = a3;
}

- (BOOL)allowInterestAcrossTermination
{
  return self->_allowInterestAcrossTermination;
}

- (void)setAllowInterestAcrossTermination:(BOOL)a3
{
  self->_allowInterestAcrossTermination = a3;
}

- (BOOL)allowLockAcrossTermination
{
  return self->_allowLockAcrossTermination;
}

- (void)setAllowLockAcrossTermination:(BOOL)a3
{
  self->_allowLockAcrossTermination = a3;
}

- (BOOL)allowLockAcrossReboot
{
  return self->_allowLockAcrossReboot;
}

- (void)setAllowLockAcrossReboot:(BOOL)a3
{
  self->_allowLockAcrossReboot = a3;
}

- (BOOL)allowLockAcrossOTAUpdate
{
  return self->_allowLockAcrossOTAUpdate;
}

- (void)setAllowLockAcrossOTAUpdate:(BOOL)a3
{
  self->_allowLockAcrossOTAUpdate = a3;
}

- (BOOL)allowLockOfRevokedContent
{
  return self->_allowLockOfRevokedContent;
}

- (void)setAllowLockOfRevokedContent:(BOOL)a3
{
  self->_allowLockOfRevokedContent = a3;
}

- (BOOL)allowLockWhenFilesystemSpaceCritical
{
  return self->_allowLockWhenFilesystemSpaceCritical;
}

- (void)setAllowLockWhenFilesystemSpaceCritical:(BOOL)a3
{
  self->_allowLockWhenFilesystemSpaceCritical = a3;
}

- (int64_t)defaultUnlockAfterUsageSecs
{
  return self->_defaultUnlockAfterUsageSecs;
}

- (void)setDefaultUnlockAfterUsageSecs:(int64_t)a3
{
  self->_defaultUnlockAfterUsageSecs = a3;
}

- (int64_t)maximumUnlockAfterUsageSecs
{
  return self->_maximumUnlockAfterUsageSecs;
}

- (void)setMaximumUnlockAfterUsageSecs:(int64_t)a3
{
  self->_maximumUnlockAfterUsageSecs = a3;
}

- (int64_t)defaultPreventGarbageCollectionSecs
{
  return self->_defaultPreventGarbageCollectionSecs;
}

- (void)setDefaultPreventGarbageCollectionSecs:(int64_t)a3
{
  self->_defaultPreventGarbageCollectionSecs = a3;
}

- (int64_t)maximumPreventGarbageCollectionSecs
{
  return self->_maximumPreventGarbageCollectionSecs;
}

- (void)setMaximumPreventGarbageCollectionSecs:(int64_t)a3
{
  self->_maximumPreventGarbageCollectionSecs = a3;
}

- (NSDictionary)additionalUpdatePolicyControl
{
  return self->_additionalUpdatePolicyControl;
}

- (void)setAdditionalUpdatePolicyControl:(id)a3
{
}

- (BOOL)allowAutoCheckForNewerWhenBatteryLow
{
  return self->_allowAutoCheckForNewerWhenBatteryLow;
}

- (void)setAllowAutoCheckForNewerWhenBatteryLow:(BOOL)a3
{
  self->_allowAutoCheckForNewerWhenBatteryLow = a3;
}

- (BOOL)allowAutoCheckForNewerWhenCPUHigh
{
  return self->_allowAutoCheckForNewerWhenCPUHigh;
}

- (void)setAllowAutoCheckForNewerWhenCPUHigh:(BOOL)a3
{
  self->_allowAutoCheckForNewerWhenCPUHigh = a3;
}

- (BOOL)allowAutoCheckForNewerOverExpensive
{
  return self->_allowAutoCheckForNewerOverExpensive;
}

- (void)setAllowAutoCheckForNewerOverExpensive:(BOOL)a3
{
  self->_allowAutoCheckForNewerOverExpensive = a3;
}

- (BOOL)allowAutoDownloadWhenBatteryLow
{
  return self->_allowAutoDownloadWhenBatteryLow;
}

- (void)setAllowAutoDownloadWhenBatteryLow:(BOOL)a3
{
  self->_allowAutoDownloadWhenBatteryLow = a3;
}

- (BOOL)allowAutoDownloadWhenCPUHigh
{
  return self->_allowAutoDownloadWhenCPUHigh;
}

- (void)setAllowAutoDownloadWhenCPUHigh:(BOOL)a3
{
  self->_allowAutoDownloadWhenCPUHigh = a3;
}

- (BOOL)blockIfBeforeFirstUnlock
{
  return self->_blockIfBeforeFirstUnlock;
}

- (void)setBlockIfBeforeFirstUnlock:(BOOL)a3
{
  self->_blockIfBeforeFirstUnlock = a3;
}

- (BOOL)blockAutoCheckForNewerOverCellular
{
  return self->_blockAutoCheckForNewerOverCellular;
}

- (void)setBlockAutoCheckForNewerOverCellular:(BOOL)a3
{
  self->_blockAutoCheckForNewerOverCellular = a3;
}

- (BOOL)blockAutoDownloadOverCellular
{
  return self->_blockAutoDownloadOverCellular;
}

- (void)setBlockAutoDownloadOverCellular:(BOOL)a3
{
  self->_blockAutoDownloadOverCellular = a3;
}

- (BOOL)blockUserInitiatedDownloadOverCellular
{
  return self->_blockUserInitiatedDownloadOverCellular;
}

- (void)setBlockUserInitiatedDownloadOverCellular:(BOOL)a3
{
  self->_blockUserInitiatedDownloadOverCellular = a3;
}

- (BOOL)blockUserInitiatedDownloadWhenBatteryLow
{
  return self->_blockUserInitiatedDownloadWhenBatteryLow;
}

- (void)setBlockUserInitiatedDownloadWhenBatteryLow:(BOOL)a3
{
  self->_blockUserInitiatedDownloadWhenBatteryLow = a3;
}

- (BOOL)blockUserInitiatedDownloadWhenCPUHigh
{
  return self->_blockUserInitiatedDownloadWhenCPUHigh;
}

- (void)setBlockUserInitiatedDownloadWhenCPUHigh:(BOOL)a3
{
  self->_blockUserInitiatedDownloadWhenCPUHigh = a3;
}

- (BOOL)blockUserInitiatedDownloadOverExpensive
{
  return self->_blockUserInitiatedDownloadOverExpensive;
}

- (void)setBlockUserInitiatedDownloadOverExpensive:(BOOL)a3
{
  self->_blockUserInitiatedDownloadOverExpensive = a3;
}

- (BOOL)downloadWithoutPreferenceForWiFi
{
  return self->_downloadWithoutPreferenceForWiFi;
}

- (void)setDownloadWithoutPreferenceForWiFi:(BOOL)a3
{
  self->_downloadWithoutPreferenceForWiFi = a3;
}

- (id)limitCellularByRestrictedTimePeriods
{
  return self->_limitCellularByRestrictedTimePeriods;
}

- (void)setLimitCellularByRestrictedTimePeriods:(id)a3
{
}

- (id)limitWiFiByRestrictedTimePeriods
{
  return self->_limitWiFiByRestrictedTimePeriods;
}

- (void)setLimitWiFiByRestrictedTimePeriods:(id)a3
{
}

- (id)limitCellularByFeeAgreement
{
  return self->_limitCellularByFeeAgreement;
}

- (void)setLimitCellularByFeeAgreement:(id)a3
{
}

- (id)limitByNetworkType
{
  return self->_limitByNetworkType;
}

- (void)setLimitByNetworkType:(id)a3
{
}

- (NSUUID)assetAudienceUUID
{
  return self->_assetAudienceUUID;
}

- (void)setAssetAudienceUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetAudienceUUID, 0);
  objc_storeStrong(&self->_limitByNetworkType, 0);
  objc_storeStrong(&self->_limitCellularByFeeAgreement, 0);
  objc_storeStrong(&self->_limitWiFiByRestrictedTimePeriods, 0);
  objc_storeStrong(&self->_limitCellularByRestrictedTimePeriods, 0);
  objc_storeStrong((id *)&self->_additionalUpdatePolicyControl, 0);
  objc_storeStrong((id *)&self->_categoryList, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_updatePolicyName, 0);
}

@end