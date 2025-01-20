@interface SUControllerConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)_loadBooleanFromDefaults:(id)a3 usingDefault:(BOOL)a4 isStoredInverted:(BOOL)a5;
- (BOOL)_runningOnAppleTV;
- (BOOL)_storeBooleanToDefaults:(id)a3 toValue:(BOOL)a4 isStoredInverted:(BOOL)a5;
- (BOOL)allowSameVersionUpdates;
- (BOOL)autoAcceptTermsAndConditions;
- (BOOL)downloadDocAsset;
- (BOOL)expiredSpecifiedAsExpired;
- (BOOL)hideIndicationMayReboot;
- (BOOL)ignoreRamping;
- (BOOL)installWindowAsDeltas;
- (BOOL)internalDefaultsAsExternal;
- (BOOL)isEqual:(id)a3;
- (BOOL)performAutoDownloadAndPrepare;
- (BOOL)performAutoInstall;
- (BOOL)performAutoScan;
- (BOOL)requirePrepareSize;
- (BOOL)restrictToFullReplacement;
- (BOOL)supervisedMDM;
- (BOOL)useSUCore;
- (BOOL)useSpecifiedInstallWindow;
- (BOOL)vpnOnDemandAsInternal;
- (NSString)asReleaseType;
- (NSString)installPhaseOSBackgroundImagePath;
- (NSString)prerequisiteBuildVersion;
- (NSString)prerequisiteProductVersion;
- (NSString)requestedPMV;
- (NSString)simulatorCommandsFile;
- (NSString)updateMetricContext;
- (SUControllerConfig)init;
- (SUControllerConfig)initWithCoder:(id)a3;
- (id)_copyStringFromDefaults:(id)a3 usingDefault:(id)a4;
- (id)_storeStringToDefaults:(id)a3 toValue:(id)a4;
- (id)changeSummary:(int64_t)a3;
- (id)copy;
- (id)description;
- (id)initFromDefaults:(int64_t)a3;
- (id)summary;
- (int64_t)_decodeInteger:(id)a3 forKey:(id)a4 withLimit:(int64_t)a5;
- (int64_t)_limitedInteger:(id)a3 checkingValue:(int64_t)a4 forKey:(id)a5 withLimit:(int64_t)a6;
- (int64_t)_loadBooleanFromDefaults:(id)a3 releaseType:(int64_t)a4 externalDefault:(BOOL)a5 internalDefault:(BOOL)a6 isStoredInverted:(BOOL)a7;
- (int64_t)_loadIntegerFromDefaults:(id)a3 releaseType:(int64_t)a4 externalDefault:(int64_t)a5 internalDefault:(int64_t)a6 withLimit:(int64_t)a7;
- (int64_t)_loadIntegerFromDefaults:(id)a3 usingDefault:(int64_t)a4 withLimit:(int64_t)a5;
- (int64_t)_storeIntegerToDefaults:(id)a3 toValue:(int64_t)a4;
- (int64_t)autoActivityCheckPeriod;
- (int64_t)autoInstallForceMaxWait;
- (int64_t)autoInstallWindowBeginHour;
- (int64_t)autoInstallWindowBeginMinute;
- (int64_t)autoInstallWindowEndHour;
- (int64_t)autoInstallWindowEndMinute;
- (int64_t)delayPeriod;
- (int64_t)preservePreparedMaxAttempts;
- (void)encodeWithCoder:(id)a3;
- (void)modify:(id)a3 usingMask:(int64_t)a4;
- (void)setAllowSameVersionUpdates:(BOOL)a3;
- (void)setAsReleaseType:(id)a3;
- (void)setAutoAcceptTermsAndConditions:(BOOL)a3;
- (void)setAutoActivityCheckPeriod:(int64_t)a3;
- (void)setAutoInstallForceMaxWait:(int64_t)a3;
- (void)setAutoInstallWindowBeginHour:(int64_t)a3;
- (void)setAutoInstallWindowBeginMinute:(int64_t)a3;
- (void)setAutoInstallWindowEndHour:(int64_t)a3;
- (void)setAutoInstallWindowEndMinute:(int64_t)a3;
- (void)setDelayPeriod:(int64_t)a3;
- (void)setDownloadDocAsset:(BOOL)a3;
- (void)setExpiredSpecifiedAsExpired:(BOOL)a3;
- (void)setHideIndicationMayReboot:(BOOL)a3;
- (void)setIgnoreRamping:(BOOL)a3;
- (void)setInstallPhaseOSBackgroundImagePath:(id)a3;
- (void)setInstallWindowAsDeltas:(BOOL)a3;
- (void)setInternalDefaultsAsExternal:(BOOL)a3;
- (void)setPerformAutoDownloadAndPrepare:(BOOL)a3;
- (void)setPerformAutoInstall:(BOOL)a3;
- (void)setPerformAutoScan:(BOOL)a3;
- (void)setPrerequisiteBuildVersion:(id)a3;
- (void)setPrerequisiteProductVersion:(id)a3;
- (void)setPreservePreparedMaxAttempts:(int64_t)a3;
- (void)setRequestedPMV:(id)a3;
- (void)setRequirePrepareSize:(BOOL)a3;
- (void)setRestrictToFullReplacement:(BOOL)a3;
- (void)setSimulatorCommandsFile:(id)a3;
- (void)setSupervisedMDM:(BOOL)a3;
- (void)setUpdateMetricContext:(id)a3;
- (void)setUseSUCore:(BOOL)a3;
- (void)setUseSpecifiedInstallWindow:(BOOL)a3;
- (void)setVpnOnDemandAsInternal:(BOOL)a3;
@end

@implementation SUControllerConfig

- (SUControllerConfig)init
{
  v12.receiver = self;
  v12.super_class = (Class)SUControllerConfig;
  v2 = [(SUControllerConfig *)&v12 init];
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)&v2->_useSUCore = 16842753;
    v2->_performAutoInstall = 0;
    v2->_autoAcceptTermsAndConditions = updateRequiresDocAsset() ^ 1;
    *(_OWORD *)&v3->_autoActivityCheckPeriod = xmmword_25E02BD10;
    *(_OWORD *)&v3->_autoInstallWindowBeginHour = xmmword_25E02BD20;
    *(_OWORD *)&v3->_autoInstallWindowEndHour = xmmword_25E02BD30;
    *(_WORD *)&v3->_downloadDocAsset = 0;
    v3->_supervisedMDM = 0;
    requestedPMV = v3->_requestedPMV;
    v3->_requestedPMV = 0;

    v3->_delayPeriod = 0;
    installPhaseOSBackgroundImagePath = v3->_installPhaseOSBackgroundImagePath;
    v3->_installPhaseOSBackgroundImagePath = 0;

    *(void *)&v3->_restrictToFullReplacement = 0;
    updateMetricContext = v3->_updateMetricContext;
    v3->_updateMetricContext = 0;

    prerequisiteBuildVersion = v3->_prerequisiteBuildVersion;
    v3->_prerequisiteBuildVersion = 0;

    prerequisiteProductVersion = v3->_prerequisiteProductVersion;
    v3->_prerequisiteProductVersion = 0;

    asReleaseType = v3->_asReleaseType;
    v3->_asReleaseType = 0;

    simulatorCommandsFile = v3->_simulatorCommandsFile;
    v3->_simulatorCommandsFile = 0;
  }
  return v3;
}

- (id)initFromDefaults:(int64_t)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SUControllerConfig;
  v4 = [(SUControllerConfig *)&v21 init];
  v5 = v4;
  if (v4)
  {
    v4->_internalDefaultsAsExternal = [(SUControllerConfig *)v4 _loadBooleanFromDefaults:@"SUInternalDefaultsAsExternal" usingDefault:0 isStoredInverted:0];
    v5->_useSUCore = 1;
    v5->_vpnOnDemandAsInternal = [(SUControllerConfig *)v5 _loadBooleanFromDefaults:@"SUVPNOnDemandAsInternal" usingDefault:0 isStoredInverted:0];
    *(_WORD *)&v5->_performAutoScan = 257;
    v5->_performAutoInstall = [(SUControllerConfig *)v5 _loadBooleanFromDefaults:@"SUDisableAutoInstall" usingDefault:0 isStoredInverted:1];
    v5->_autoAcceptTermsAndConditions = [(SUControllerConfig *)v5 _loadBooleanFromDefaults:@"SUAutoAcceptTermsAndConditions" usingDefault:updateRequiresDocAsset() ^ 1 isStoredInverted:0];
    v5->_autoActivityCheckPeriod = [(SUControllerConfig *)v5 _loadIntegerFromDefaults:@"SUAutoActivityCheckPeriod" releaseType:a3 externalDefault:10080 internalDefault:240 withLimit:44640];
    v5->_autoInstallForceMaxWait = [(SUControllerConfig *)v5 _loadIntegerFromDefaults:@"SUAutoInstallForceMaxWait" usingDefault:20 withLimit:1440];
    v5->_autoInstallWindowBeginHour = [(SUControllerConfig *)v5 _loadIntegerFromDefaults:@"SUAutoInstallWindowBeginHour" usingDefault:2 withLimit:23];
    v5->_autoInstallWindowBeginMinute = [(SUControllerConfig *)v5 _loadIntegerFromDefaults:@"SUAutoInstallWindowBeginMinute" usingDefault:0 withLimit:59];
    v5->_autoInstallWindowEndHour = [(SUControllerConfig *)v5 _loadIntegerFromDefaults:@"SUAutoInstallWindowEndHour" usingDefault:4 withLimit:23];
    v5->_autoInstallWindowEndMinute = [(SUControllerConfig *)v5 _loadIntegerFromDefaults:@"SUAutoInstallWindowEndMinute" usingDefault:0 withLimit:59];
    v5->_downloadDocAsset = [(SUControllerConfig *)v5 _loadBooleanFromDefaults:@"SUDownloadDocAsset" usingDefault:0 isStoredInverted:0];
    v5->_ignoreRamping = [(SUControllerConfig *)v5 _loadBooleanFromDefaults:@"SUIgnoreRamping" usingDefault:0 isStoredInverted:0];
    v5->_supervisedMDM = [(SUControllerConfig *)v5 _loadBooleanFromDefaults:@"supervisedMDM" usingDefault:0 isStoredInverted:0];
    uint64_t v6 = [(SUControllerConfig *)v5 _copyStringFromDefaults:@"requestedPMV" usingDefault:0];
    requestedPMV = v5->_requestedPMV;
    v5->_requestedPMV = (NSString *)v6;

    v5->_delayPeriod = [(SUControllerConfig *)v5 _loadIntegerFromDefaults:@"delayPeriod" usingDefault:0 withLimit:90];
    uint64_t v8 = [(SUControllerConfig *)v5 _copyStringFromDefaults:@"installPhaseOSBackgroundImagePath" usingDefault:0];
    installPhaseOSBackgroundImagePath = v5->_installPhaseOSBackgroundImagePath;
    v5->_installPhaseOSBackgroundImagePath = (NSString *)v8;

    v5->_restrictToFullReplacement = [(SUControllerConfig *)v5 _loadBooleanFromDefaults:@"SURestrictToFullReplacement" usingDefault:0 isStoredInverted:0];
    v5->_allowSameVersionUpdates = [(SUControllerConfig *)v5 _loadBooleanFromDefaults:@"SUAllowSameVersionUpdates" usingDefault:0 isStoredInverted:0];
    uint64_t v10 = [(SUControllerConfig *)v5 _copyStringFromDefaults:@"SUUpdateMetricContext" usingDefault:0];
    updateMetricContext = v5->_updateMetricContext;
    v5->_updateMetricContext = (NSString *)v10;

    uint64_t v12 = [(SUControllerConfig *)v5 _copyStringFromDefaults:@"SUPrerequisiteBuildVersion" usingDefault:0];
    prerequisiteBuildVersion = v5->_prerequisiteBuildVersion;
    v5->_prerequisiteBuildVersion = (NSString *)v12;

    uint64_t v14 = [(SUControllerConfig *)v5 _copyStringFromDefaults:@"SUPrerequisiteProductVersion" usingDefault:0];
    prerequisiteProductVersion = v5->_prerequisiteProductVersion;
    v5->_prerequisiteProductVersion = (NSString *)v14;

    uint64_t v16 = [(SUControllerConfig *)v5 _copyStringFromDefaults:@"SUAsReleaseType" usingDefault:0];
    asReleaseType = v5->_asReleaseType;
    v5->_asReleaseType = (NSString *)v16;

    uint64_t v18 = [(SUControllerConfig *)v5 _copyStringFromDefaults:@"SUSimulatorCommandsFile" usingDefault:0];
    simulatorCommandsFile = v5->_simulatorCommandsFile;
    v5->_simulatorCommandsFile = (NSString *)v18;

    v5->_useSpecifiedInstallWindow = [(SUControllerConfig *)v5 _loadBooleanFromDefaults:@"SUUseSpecifiedInstallWindow" usingDefault:0 isStoredInverted:0];
    v5->_expiredSpecifiedAsExpired = [(SUControllerConfig *)v5 _loadBooleanFromDefaults:@"SUExpiredSpecifiedAsExpired" usingDefault:0 isStoredInverted:0];
    v5->_hideIndicationMayReboot = [(SUControllerConfig *)v5 _loadBooleanFromDefaults:@"SUHideIndicationMayReboot" usingDefault:0 isStoredInverted:0];
    v5->_requirePrepareSize = [(SUControllerConfig *)v5 _loadBooleanFromDefaults:@"SURequirePrepareSize" usingDefault:0 isStoredInverted:0];
    v5->_installWindowAsDeltas = [(SUControllerConfig *)v5 _loadBooleanFromDefaults:@"SUInstallWindowAsDeltas" usingDefault:0 isStoredInverted:0];
  }
  return v5;
}

- (SUControllerConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SUControllerConfig;
  v5 = [(SUControllerConfig *)&v23 init];
  uint64_t v6 = v5;
  if (v5)
  {
    char v7 = 1;
    v5->_useSUCore = 1;
    v5->_vpnOnDemandAsInternal = [v4 decodeBoolForKey:@"vpnOnDemandAsInternal"];
    if ([(SUControllerConfig *)v6 _runningOnAppleTV]) {
      char v7 = [v4 decodeBoolForKey:@"performAutoScan"];
    }
    v6->_performAutoScan = v7;
    v6->_performAutoDownloadAndPrepare = [v4 decodeBoolForKey:@"performAutoDownloadAndPrepare"];
    v6->_performAutoInstall = [v4 decodeBoolForKey:@"performAutoInstall"];
    v6->_autoAcceptTermsAndConditions = [v4 decodeBoolForKey:@"autoAcceptTermsAndConditions"];
    v6->_autoActivityCheckPeriod = [(SUControllerConfig *)v6 _decodeInteger:v4 forKey:@"autoActivityCheckPeriod" withLimit:44640];
    v6->_autoInstallForceMaxWait = [(SUControllerConfig *)v6 _decodeInteger:v4 forKey:@"autoInstallForceMaxWait" withLimit:1440];
    v6->_autoInstallWindowBeginHour = [(SUControllerConfig *)v6 _decodeInteger:v4 forKey:@"autoInstallWindowBeginHour" withLimit:23];
    v6->_autoInstallWindowBeginMinute = [(SUControllerConfig *)v6 _decodeInteger:v4 forKey:@"autoInstallWindowBeginMinute" withLimit:59];
    v6->_autoInstallWindowEndHour = [(SUControllerConfig *)v6 _decodeInteger:v4 forKey:@"autoInstallWindowEndHour" withLimit:23];
    v6->_autoInstallWindowEndMinute = [(SUControllerConfig *)v6 _decodeInteger:v4 forKey:@"autoInstallWindowEndMinute" withLimit:59];
    v6->_downloadDocAsset = [v4 decodeBoolForKey:@"downloadDocAsset"];
    v6->_ignoreRamping = [v4 decodeBoolForKey:@"ignoreRamping"];
    v6->_supervisedMDM = [v4 decodeBoolForKey:@"supervisedMDM"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedPMV"];
    requestedPMV = v6->_requestedPMV;
    v6->_requestedPMV = (NSString *)v8;

    v6->_delayPeriod = [(SUControllerConfig *)v6 _decodeInteger:v4 forKey:@"delayPeriod" withLimit:90];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installPhaseOSBackgroundImagePath"];
    installPhaseOSBackgroundImagePath = v6->_installPhaseOSBackgroundImagePath;
    v6->_installPhaseOSBackgroundImagePath = (NSString *)v10;

    v6->_restrictToFullReplacement = [v4 decodeBoolForKey:@"restrictToFullReplacement"];
    v6->_allowSameVersionUpdates = [v4 decodeBoolForKey:@"allowSameVersionUpdates"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateMetricContext"];
    updateMetricContext = v6->_updateMetricContext;
    v6->_updateMetricContext = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prerequisiteBuildVersion"];
    prerequisiteBuildVersion = v6->_prerequisiteBuildVersion;
    v6->_prerequisiteBuildVersion = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prerequisiteProductVersion"];
    prerequisiteProductVersion = v6->_prerequisiteProductVersion;
    v6->_prerequisiteProductVersion = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asReleaseType"];
    asReleaseType = v6->_asReleaseType;
    v6->_asReleaseType = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"simulatorCommandsFile"];
    simulatorCommandsFile = v6->_simulatorCommandsFile;
    v6->_simulatorCommandsFile = (NSString *)v20;

    v6->_useSpecifiedInstallWindow = [v4 decodeBoolForKey:@"useSpecifiedInstallWindow"];
    v6->_expiredSpecifiedAsExpired = [v4 decodeBoolForKey:@"expiredSpecifiedAsExpired"];
    v6->_hideIndicationMayReboot = [v4 decodeBoolForKey:@"hideIndicationMayReboot"];
    v6->_internalDefaultsAsExternal = [v4 decodeBoolForKey:@"internalDefaultsAsExternal"];
    v6->_requirePrepareSize = [v4 decodeBoolForKey:@"requirePrepareSize"];
    v6->_installWindowAsDeltas = [v4 decodeBoolForKey:@"installWindowAsDeltas"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig useSUCore](self, "useSUCore"), @"useSUCore");
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig vpnOnDemandAsInternal](self, "vpnOnDemandAsInternal"), @"vpnOnDemandAsInternal");
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig performAutoScan](self, "performAutoScan"), @"performAutoScan");
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig performAutoDownloadAndPrepare](self, "performAutoDownloadAndPrepare"), @"performAutoDownloadAndPrepare");
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig performAutoInstall](self, "performAutoInstall"), @"performAutoInstall");
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig autoAcceptTermsAndConditions](self, "autoAcceptTermsAndConditions"), @"autoAcceptTermsAndConditions");
  objc_msgSend(v11, "encodeInteger:forKey:", -[SUControllerConfig autoActivityCheckPeriod](self, "autoActivityCheckPeriod"), @"autoActivityCheckPeriod");
  objc_msgSend(v11, "encodeInteger:forKey:", -[SUControllerConfig autoInstallForceMaxWait](self, "autoInstallForceMaxWait"), @"autoInstallForceMaxWait");
  objc_msgSend(v11, "encodeInteger:forKey:", -[SUControllerConfig autoInstallWindowBeginHour](self, "autoInstallWindowBeginHour"), @"autoInstallWindowBeginHour");
  objc_msgSend(v11, "encodeInteger:forKey:", -[SUControllerConfig autoInstallWindowBeginMinute](self, "autoInstallWindowBeginMinute"), @"autoInstallWindowBeginMinute");
  objc_msgSend(v11, "encodeInteger:forKey:", -[SUControllerConfig autoInstallWindowEndHour](self, "autoInstallWindowEndHour"), @"autoInstallWindowEndHour");
  objc_msgSend(v11, "encodeInteger:forKey:", -[SUControllerConfig autoInstallWindowEndMinute](self, "autoInstallWindowEndMinute"), @"autoInstallWindowEndMinute");
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig downloadDocAsset](self, "downloadDocAsset"), @"downloadDocAsset");
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig ignoreRamping](self, "ignoreRamping"), @"ignoreRamping");
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig supervisedMDM](self, "supervisedMDM"), @"supervisedMDM");
  id v4 = [(SUControllerConfig *)self requestedPMV];
  [v11 encodeObject:v4 forKey:@"requestedPMV"];

  objc_msgSend(v11, "encodeInteger:forKey:", -[SUControllerConfig delayPeriod](self, "delayPeriod"), @"delayPeriod");
  v5 = [(SUControllerConfig *)self installPhaseOSBackgroundImagePath];
  [v11 encodeObject:v5 forKey:@"installPhaseOSBackgroundImagePath"];

  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig restrictToFullReplacement](self, "restrictToFullReplacement"), @"restrictToFullReplacement");
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig allowSameVersionUpdates](self, "allowSameVersionUpdates"), @"allowSameVersionUpdates");
  uint64_t v6 = [(SUControllerConfig *)self updateMetricContext];
  [v11 encodeObject:v6 forKey:@"updateMetricContext"];

  char v7 = [(SUControllerConfig *)self prerequisiteBuildVersion];
  [v11 encodeObject:v7 forKey:@"prerequisiteBuildVersion"];

  uint64_t v8 = [(SUControllerConfig *)self prerequisiteProductVersion];
  [v11 encodeObject:v8 forKey:@"prerequisiteProductVersion"];

  v9 = [(SUControllerConfig *)self asReleaseType];
  [v11 encodeObject:v9 forKey:@"asReleaseType"];

  uint64_t v10 = [(SUControllerConfig *)self simulatorCommandsFile];
  [v11 encodeObject:v10 forKey:@"simulatorCommandsFile"];

  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig useSpecifiedInstallWindow](self, "useSpecifiedInstallWindow"), @"useSpecifiedInstallWindow");
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig expiredSpecifiedAsExpired](self, "expiredSpecifiedAsExpired"), @"expiredSpecifiedAsExpired");
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig hideIndicationMayReboot](self, "hideIndicationMayReboot"), @"hideIndicationMayReboot");
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig internalDefaultsAsExternal](self, "internalDefaultsAsExternal"), @"internalDefaultsAsExternal");
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig requirePrepareSize](self, "requirePrepareSize"), @"requirePrepareSize");
  objc_msgSend(v11, "encodeBool:forKey:", -[SUControllerConfig installWindowAsDeltas](self, "installWindowAsDeltas"), @"installWindowAsDeltas");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return v3;
}

- (void)modify:(id)a3 usingMask:(int64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  char v7 = v6;
  v35 = v6;
  if ((v4 & 0x10000) != 0)
  {
    char v8 = [v6 useSUCore];
    char v7 = v35;
    if ((v8 & 1) == 0)
    {
      v9 = [MEMORY[0x263F77DA8] sharedDiag];
      id v10 = [NSString alloc];
      int v11 = [v35 useSUCore];
      uint64_t v12 = @"NO";
      if (v11) {
        uint64_t v12 = @"YES";
      }
      v13 = (void *)[v10 initWithFormat:@"attempt to set %@ to %@ (only supported value is %@ [as of 4.2.1])", @"useSUCore", v12, @"YES"];
      [v9 trackAnomaly:@"[CONFIG]" forReason:v13 withResult:8102 withError:0];

      char v7 = v35;
    }
  }
  if ((v4 & 0x8000000) != 0)
  {
    -[SUControllerConfig setVpnOnDemandAsInternal:](self, "setVpnOnDemandAsInternal:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"SUVPNOnDemandAsInternal", [v7 vpnOnDemandAsInternal], 0));
    char v7 = v35;
  }
  if (v4)
  {
    BOOL v14 = [(SUControllerConfig *)self _runningOnAppleTV];
    uint64_t v15 = [v35 performAutoScan];
    if (v14)
    {
      [(SUControllerConfig *)self setPerformAutoScan:[(SUControllerConfig *)self _storeBooleanToDefaults:@"SUDisableAutoScan" toValue:v15 isStoredInverted:1]];
    }
    else
    {
      char v7 = v35;
      if (v15) {
        goto LABEL_16;
      }
      uint64_t v16 = [MEMORY[0x263F77DA8] sharedDiag];
      id v17 = [NSString alloc];
      int v18 = [v35 performAutoScan];
      v19 = @"NO";
      if (v18) {
        v19 = @"YES";
      }
      uint64_t v20 = (void *)[v17 initWithFormat:@"attempt to set %@ to %@ (only supported value is %@ [as of 4.2.1])", @"performAutoScan", v19, @"YES"];
      [v16 trackAnomaly:@"[CONFIG]" forReason:v20 withResult:8102 withError:0];
    }
    char v7 = v35;
  }
LABEL_16:
  if ((v4 & 2) != 0)
  {
    -[SUControllerConfig setPerformAutoDownloadAndPrepare:](self, "setPerformAutoDownloadAndPrepare:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"SUDisableAutoDownloadAndPrepare", [v7 performAutoDownloadAndPrepare], 1));
    char v7 = v35;
    if ((v4 & 4) == 0)
    {
LABEL_18:
      if ((v4 & 8) == 0) {
        goto LABEL_19;
      }
      goto LABEL_50;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_18;
  }
  -[SUControllerConfig setPerformAutoInstall:](self, "setPerformAutoInstall:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"SUDisableAutoInstall", [v7 performAutoInstall], 1));
  char v7 = v35;
  if ((v4 & 8) == 0)
  {
LABEL_19:
    if ((v4 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  -[SUControllerConfig setAutoAcceptTermsAndConditions:](self, "setAutoAcceptTermsAndConditions:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"SUAutoAcceptTermsAndConditions", [v7 autoAcceptTermsAndConditions], 0));
  char v7 = v35;
  if ((v4 & 0x10) == 0)
  {
LABEL_20:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  -[SUControllerConfig setAutoActivityCheckPeriod:](self, "setAutoActivityCheckPeriod:", -[SUControllerConfig _storeIntegerToDefaults:toValue:](self, "_storeIntegerToDefaults:toValue:", @"SUAutoActivityCheckPeriod", [v7 autoActivityCheckPeriod]));
  char v7 = v35;
  if ((v4 & 0x2000) == 0)
  {
LABEL_21:
    if ((v4 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  -[SUControllerConfig setAutoInstallForceMaxWait:](self, "setAutoInstallForceMaxWait:", -[SUControllerConfig _storeIntegerToDefaults:toValue:](self, "_storeIntegerToDefaults:toValue:", @"SUAutoInstallForceMaxWait", [v7 autoInstallForceMaxWait]));
  char v7 = v35;
  if ((v4 & 0x80) == 0)
  {
LABEL_22:
    if ((v4 & 0x100) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  -[SUControllerConfig setAutoInstallWindowBeginHour:](self, "setAutoInstallWindowBeginHour:", -[SUControllerConfig _storeIntegerToDefaults:toValue:](self, "_storeIntegerToDefaults:toValue:", @"SUAutoInstallWindowBeginHour", [v7 autoInstallWindowBeginHour]));
  char v7 = v35;
  if ((v4 & 0x100) == 0)
  {
LABEL_23:
    if ((v4 & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  -[SUControllerConfig setAutoInstallWindowBeginMinute:](self, "setAutoInstallWindowBeginMinute:", -[SUControllerConfig _storeIntegerToDefaults:toValue:](self, "_storeIntegerToDefaults:toValue:", @"SUAutoInstallWindowBeginMinute", [v7 autoInstallWindowBeginMinute]));
  char v7 = v35;
  if ((v4 & 0x200) == 0)
  {
LABEL_24:
    if ((v4 & 0x400) == 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  -[SUControllerConfig setAutoInstallWindowEndHour:](self, "setAutoInstallWindowEndHour:", -[SUControllerConfig _storeIntegerToDefaults:toValue:](self, "_storeIntegerToDefaults:toValue:", @"SUAutoInstallWindowEndHour", [v7 autoInstallWindowEndHour]));
  char v7 = v35;
  if ((v4 & 0x400) == 0)
  {
LABEL_25:
    if ((v4 & 0x400000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  -[SUControllerConfig setAutoInstallWindowEndMinute:](self, "setAutoInstallWindowEndMinute:", -[SUControllerConfig _storeIntegerToDefaults:toValue:](self, "_storeIntegerToDefaults:toValue:", @"SUAutoInstallWindowEndMinute", [v7 autoInstallWindowEndMinute]));
  char v7 = v35;
  if ((v4 & 0x400000) == 0)
  {
LABEL_26:
    if ((v4 & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  -[SUControllerConfig setDownloadDocAsset:](self, "setDownloadDocAsset:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"SUDownloadDocAsset", [v7 downloadDocAsset], 0));
  char v7 = v35;
  if ((v4 & 0x800000) == 0)
  {
LABEL_27:
    if ((v4 & 0x10000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  -[SUControllerConfig setIgnoreRamping:](self, "setIgnoreRamping:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"SUIgnoreRamping", [v7 ignoreRamping], 0));
  char v7 = v35;
  if ((v4 & 0x10000000) == 0)
  {
LABEL_28:
    if ((v4 & 0x20000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_60;
  }
LABEL_59:
  -[SUControllerConfig setSupervisedMDM:](self, "setSupervisedMDM:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"supervisedMDM", [v7 supervisedMDM], 0));
  char v7 = v35;
  if ((v4 & 0x20000000) == 0)
  {
LABEL_29:
    if ((v4 & 0x40000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_61;
  }
LABEL_60:
  objc_super v21 = [v7 requestedPMV];
  v22 = [(SUControllerConfig *)self _storeStringToDefaults:@"requestedPMV" toValue:v21];
  [(SUControllerConfig *)self setRequestedPMV:v22];

  char v7 = v35;
  if ((v4 & 0x40000000) == 0)
  {
LABEL_30:
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_62;
  }
LABEL_61:
  -[SUControllerConfig setDelayPeriod:](self, "setDelayPeriod:", -[SUControllerConfig _storeIntegerToDefaults:toValue:](self, "_storeIntegerToDefaults:toValue:", @"delayPeriod", [v7 delayPeriod]));
  char v7 = v35;
  if ((v4 & 0x80000000) == 0)
  {
LABEL_31:
    if ((v4 & 0x20) == 0) {
      goto LABEL_32;
    }
    goto LABEL_63;
  }
LABEL_62:
  objc_super v23 = [v7 installPhaseOSBackgroundImagePath];
  v24 = [(SUControllerConfig *)self _storeStringToDefaults:@"installPhaseOSBackgroundImagePath" toValue:v23];
  [(SUControllerConfig *)self setInstallPhaseOSBackgroundImagePath:v24];

  char v7 = v35;
  if ((v4 & 0x20) == 0)
  {
LABEL_32:
    if ((v4 & 0x40) == 0) {
      goto LABEL_33;
    }
    goto LABEL_64;
  }
LABEL_63:
  -[SUControllerConfig setRestrictToFullReplacement:](self, "setRestrictToFullReplacement:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"SURestrictToFullReplacement", [v7 restrictToFullReplacement], 0));
  char v7 = v35;
  if ((v4 & 0x40) == 0)
  {
LABEL_33:
    if ((v4 & 0x4000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_65;
  }
LABEL_64:
  -[SUControllerConfig setAllowSameVersionUpdates:](self, "setAllowSameVersionUpdates:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"SUAllowSameVersionUpdates", [v7 allowSameVersionUpdates], 0));
  char v7 = v35;
  if ((v4 & 0x4000000) == 0)
  {
LABEL_34:
    if ((v4 & 0x20000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_66;
  }
LABEL_65:
  v25 = [v7 updateMetricContext];
  v26 = [(SUControllerConfig *)self _storeStringToDefaults:@"SUUpdateMetricContext" toValue:v25];
  [(SUControllerConfig *)self setUpdateMetricContext:v26];

  char v7 = v35;
  if ((v4 & 0x20000) == 0)
  {
LABEL_35:
    if ((v4 & 0x40000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_67;
  }
LABEL_66:
  v27 = [v7 prerequisiteBuildVersion];
  v28 = [(SUControllerConfig *)self _storeStringToDefaults:@"SUPrerequisiteBuildVersion" toValue:v27];
  [(SUControllerConfig *)self setPrerequisiteBuildVersion:v28];

  char v7 = v35;
  if ((v4 & 0x40000) == 0)
  {
LABEL_36:
    if ((v4 & 0x80000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_68;
  }
LABEL_67:
  v29 = [v7 prerequisiteProductVersion];
  v30 = [(SUControllerConfig *)self _storeStringToDefaults:@"SUPrerequisiteProductVersion" toValue:v29];
  [(SUControllerConfig *)self setPrerequisiteProductVersion:v30];

  char v7 = v35;
  if ((v4 & 0x80000) == 0)
  {
LABEL_37:
    if ((v4 & 0x200000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_69;
  }
LABEL_68:
  v31 = [v7 asReleaseType];
  v32 = [(SUControllerConfig *)self _storeStringToDefaults:@"SUAsReleaseType" toValue:v31];
  [(SUControllerConfig *)self setAsReleaseType:v32];

  char v7 = v35;
  if ((v4 & 0x200000) == 0)
  {
LABEL_38:
    if ((v4 & 0x800) == 0) {
      goto LABEL_39;
    }
    goto LABEL_70;
  }
LABEL_69:
  v33 = [v7 simulatorCommandsFile];
  v34 = [(SUControllerConfig *)self _storeStringToDefaults:@"SUSimulatorCommandsFile" toValue:v33];
  [(SUControllerConfig *)self setSimulatorCommandsFile:v34];

  char v7 = v35;
  if ((v4 & 0x800) == 0)
  {
LABEL_39:
    if ((v4 & 0x100000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_71;
  }
LABEL_70:
  -[SUControllerConfig setUseSpecifiedInstallWindow:](self, "setUseSpecifiedInstallWindow:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"SUUseSpecifiedInstallWindow", [v7 useSpecifiedInstallWindow], 0));
  char v7 = v35;
  if ((v4 & 0x100000) == 0)
  {
LABEL_40:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_72;
  }
LABEL_71:
  -[SUControllerConfig setExpiredSpecifiedAsExpired:](self, "setExpiredSpecifiedAsExpired:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"SUExpiredSpecifiedAsExpired", [v7 expiredSpecifiedAsExpired], 0));
  char v7 = v35;
  if ((v4 & 0x1000) == 0)
  {
LABEL_41:
    if ((v4 & 0x2000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_73;
  }
LABEL_72:
  -[SUControllerConfig setHideIndicationMayReboot:](self, "setHideIndicationMayReboot:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"SUHideIndicationMayReboot", [v7 hideIndicationMayReboot], 0));
  char v7 = v35;
  if ((v4 & 0x2000000) == 0)
  {
LABEL_42:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_74;
  }
LABEL_73:
  -[SUControllerConfig setInternalDefaultsAsExternal:](self, "setInternalDefaultsAsExternal:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"SUInternalDefaultsAsExternal", [v7 internalDefaultsAsExternal], 0));
  char v7 = v35;
  if ((v4 & 0x4000) == 0)
  {
LABEL_43:
    if ((v4 & 0x8000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_74:
  -[SUControllerConfig setRequirePrepareSize:](self, "setRequirePrepareSize:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"SURequirePrepareSize", [v7 requirePrepareSize], 0));
  char v7 = v35;
  if ((v4 & 0x8000) != 0) {
LABEL_44:
  }
    -[SUControllerConfig setInstallWindowAsDeltas:](self, "setInstallWindowAsDeltas:", -[SUControllerConfig _storeBooleanToDefaults:toValue:isStoredInverted:](self, "_storeBooleanToDefaults:toValue:isStoredInverted:", @"SUInstallWindowAsDeltas", [v7 installWindowAsDeltas], 0));
LABEL_45:

  MEMORY[0x270F9A758]();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = [(SUControllerConfig *)self useSUCore];
  if (v5 != [v4 useSUCore]) {
    goto LABEL_16;
  }
  int v6 = [(SUControllerConfig *)self vpnOnDemandAsInternal];
  if (v6 != [v4 vpnOnDemandAsInternal]) {
    goto LABEL_16;
  }
  int v7 = [(SUControllerConfig *)self performAutoScan];
  if (v7 != [v4 performAutoScan]) {
    goto LABEL_16;
  }
  int v8 = [(SUControllerConfig *)self performAutoDownloadAndPrepare];
  if (v8 != [v4 performAutoDownloadAndPrepare]) {
    goto LABEL_16;
  }
  int v9 = [(SUControllerConfig *)self performAutoInstall];
  if (v9 != [v4 performAutoInstall]) {
    goto LABEL_16;
  }
  int v10 = [(SUControllerConfig *)self autoAcceptTermsAndConditions];
  if (v10 != [v4 autoAcceptTermsAndConditions]) {
    goto LABEL_16;
  }
  int64_t v11 = [(SUControllerConfig *)self autoActivityCheckPeriod];
  if (v11 != [v4 autoActivityCheckPeriod]) {
    goto LABEL_16;
  }
  int64_t v12 = [(SUControllerConfig *)self autoInstallForceMaxWait];
  if (v12 != [v4 autoInstallForceMaxWait]) {
    goto LABEL_16;
  }
  int64_t v13 = [(SUControllerConfig *)self autoInstallWindowBeginHour];
  if (v13 == [v4 autoInstallWindowBeginHour]
    && (int64_t v14 = [(SUControllerConfig *)self autoInstallWindowBeginMinute],
        v14 == [v4 autoInstallWindowBeginMinute])
    && (int64_t v15 = [(SUControllerConfig *)self autoInstallWindowEndHour],
        v15 == [v4 autoInstallWindowEndHour])
    && (int64_t v16 = [(SUControllerConfig *)self autoInstallWindowEndMinute],
        v16 == [v4 autoInstallWindowEndMinute])
    && (int v17 = [(SUControllerConfig *)self downloadDocAsset],
        v17 == [v4 downloadDocAsset])
    && (int v18 = [(SUControllerConfig *)self ignoreRamping],
        v18 == [v4 ignoreRamping])
    && (int v19 = [(SUControllerConfig *)self supervisedMDM],
        v19 == [v4 supervisedMDM]))
  {
    v22 = [(SUControllerConfig *)self requestedPMV];
    objc_super v23 = [v4 requestedPMV];
    if (doStringsMatch(v22, v23)
      && (int64_t v24 = -[SUControllerConfig delayPeriod](self, "delayPeriod"), v24 == [v4 delayPeriod]))
    {
      v25 = [(SUControllerConfig *)self installPhaseOSBackgroundImagePath];
      v26 = [v4 installPhaseOSBackgroundImagePath];
      if (!doStringsMatch(v25, v26)) {
        goto LABEL_29;
      }
      int v27 = [(SUControllerConfig *)self restrictToFullReplacement];
      if (v27 != [v4 restrictToFullReplacement]) {
        goto LABEL_29;
      }
      int v28 = [(SUControllerConfig *)self allowSameVersionUpdates];
      if (v28 == [v4 allowSameVersionUpdates]
        && (int v29 = [(SUControllerConfig *)self useSpecifiedInstallWindow],
            v29 == [v4 useSpecifiedInstallWindow])
        && (int v30 = [(SUControllerConfig *)self expiredSpecifiedAsExpired],
            v30 == [v4 expiredSpecifiedAsExpired])
        && (int v31 = [(SUControllerConfig *)self hideIndicationMayReboot],
            v31 == [v4 hideIndicationMayReboot])
        && (int v32 = [(SUControllerConfig *)self internalDefaultsAsExternal],
            v32 == [v4 internalDefaultsAsExternal])
        && (int v33 = [(SUControllerConfig *)self requirePrepareSize],
            v33 == [v4 requirePrepareSize])
        && (int v34 = [(SUControllerConfig *)self installWindowAsDeltas],
            v34 == [v4 installWindowAsDeltas]))
      {
        v35 = [(SUControllerConfig *)self updateMetricContext];
        v36 = [v4 updateMetricContext];
        if (doStringsMatch(v35, v36))
        {
          v37 = [(SUControllerConfig *)self prerequisiteBuildVersion];
          v38 = [v4 prerequisiteBuildVersion];
          v47 = v37;
          if (doStringsMatch(v37, v38))
          {
            v39 = [(SUControllerConfig *)self prerequisiteProductVersion];
            v45 = [v4 prerequisiteProductVersion];
            v46 = v39;
            if (doStringsMatch(v39, v45))
            {
              v40 = [(SUControllerConfig *)self asReleaseType];
              v43 = [v4 asReleaseType];
              v44 = v40;
              if (doStringsMatch(v40, v43))
              {
                v42 = [(SUControllerConfig *)self simulatorCommandsFile];
                v41 = [v4 simulatorCommandsFile];
                char v20 = doStringsMatch(v42, v41);
              }
              else
              {
                char v20 = 0;
              }
            }
            else
            {
              char v20 = 0;
            }
          }
          else
          {
            char v20 = 0;
          }
        }
        else
        {
          char v20 = 0;
        }
      }
      else
      {
LABEL_29:
        char v20 = 0;
      }
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
LABEL_16:
    char v20 = 0;
  }

  return v20;
}

- (id)description
{
  v61 = NSString;
  if ([(SUControllerConfig *)self useSUCore]) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  v59 = v3;
  if ([(SUControllerConfig *)self vpnOnDemandAsInternal]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v58 = v4;
  if ([(SUControllerConfig *)self performAutoScan]) {
    int v5 = @"YES";
  }
  else {
    int v5 = @"NO";
  }
  v56 = v5;
  if ([(SUControllerConfig *)self performAutoDownloadAndPrepare]) {
    int v6 = @"YES";
  }
  else {
    int v6 = @"NO";
  }
  v55 = v6;
  if ([(SUControllerConfig *)self performAutoInstall]) {
    int v7 = @"YES";
  }
  else {
    int v7 = @"NO";
  }
  v54 = v7;
  if ([(SUControllerConfig *)self autoAcceptTermsAndConditions]) {
    int v8 = @"YES";
  }
  else {
    int v8 = @"NO";
  }
  v52 = v8;
  int64_t v51 = [(SUControllerConfig *)self autoActivityCheckPeriod];
  int64_t v49 = [(SUControllerConfig *)self autoInstallForceMaxWait];
  int64_t v48 = [(SUControllerConfig *)self autoInstallWindowBeginHour];
  int64_t v47 = [(SUControllerConfig *)self autoInstallWindowBeginMinute];
  int64_t v46 = [(SUControllerConfig *)self autoInstallWindowEndHour];
  int64_t v45 = [(SUControllerConfig *)self autoInstallWindowEndMinute];
  if ([(SUControllerConfig *)self downloadDocAsset]) {
    int v9 = @"YES";
  }
  else {
    int v9 = @"NO";
  }
  v43 = v9;
  if ([(SUControllerConfig *)self ignoreRamping]) {
    int v10 = @"YES";
  }
  else {
    int v10 = @"NO";
  }
  v42 = v10;
  if ([(SUControllerConfig *)self supervisedMDM]) {
    int64_t v11 = @"YES";
  }
  else {
    int64_t v11 = @"NO";
  }
  v40 = v11;
  uint64_t v12 = [(SUControllerConfig *)self requestedPMV];
  if (v12)
  {
    int64_t v13 = [(SUControllerConfig *)self requestedPMV];
  }
  else
  {
    int64_t v13 = @"(default)";
  }
  int64_t v38 = [(SUControllerConfig *)self delayPeriod];
  uint64_t v14 = [(SUControllerConfig *)self installPhaseOSBackgroundImagePath];
  if (v14)
  {
    v50 = [(SUControllerConfig *)self installPhaseOSBackgroundImagePath];
  }
  else
  {
    v50 = @"(default)";
  }
  if ([(SUControllerConfig *)self restrictToFullReplacement]) {
    int64_t v15 = @"YES";
  }
  else {
    int64_t v15 = @"NO";
  }
  v35 = v15;
  if ([(SUControllerConfig *)self allowSameVersionUpdates]) {
    int64_t v16 = @"YES";
  }
  else {
    int64_t v16 = @"NO";
  }
  int v33 = v16;
  uint64_t v17 = [(SUControllerConfig *)self updateMetricContext];
  if (v17)
  {
    v41 = [(SUControllerConfig *)self updateMetricContext];
  }
  else
  {
    v41 = @"(default)";
  }
  uint64_t v18 = [(SUControllerConfig *)self prerequisiteBuildVersion];
  if (v18)
  {
    int v19 = [(SUControllerConfig *)self prerequisiteBuildVersion];
  }
  else
  {
    int v19 = @"(default)";
  }
  v36 = [(SUControllerConfig *)self prerequisiteProductVersion];
  v60 = (void *)v12;
  if (v36)
  {
    char v20 = [(SUControllerConfig *)self prerequisiteProductVersion];
  }
  else
  {
    char v20 = @"(default)";
  }
  objc_super v21 = [(SUControllerConfig *)self asReleaseType];
  v53 = (void *)v14;
  if (v21)
  {
    v62 = [(SUControllerConfig *)self asReleaseType];
  }
  else
  {
    v62 = @"(default)";
  }
  v44 = (void *)v17;
  v22 = [(SUControllerConfig *)self simulatorCommandsFile];
  v57 = v13;
  v39 = (void *)v18;
  v37 = v19;
  int v34 = v20;
  if (v22)
  {
    objc_super v23 = [(SUControllerConfig *)self simulatorCommandsFile];
  }
  else
  {
    objc_super v23 = @"(default)";
  }
  if ([(SUControllerConfig *)self useSpecifiedInstallWindow]) {
    int64_t v24 = @"YES";
  }
  else {
    int64_t v24 = @"NO";
  }
  int v32 = v24;
  if ([(SUControllerConfig *)self expiredSpecifiedAsExpired]) {
    v25 = @"YES";
  }
  else {
    v25 = @"NO";
  }
  if ([(SUControllerConfig *)self hideIndicationMayReboot]) {
    v26 = @"YES";
  }
  else {
    v26 = @"NO";
  }
  if ([(SUControllerConfig *)self internalDefaultsAsExternal]) {
    int v27 = @"YES";
  }
  else {
    int v27 = @"NO";
  }
  if ([(SUControllerConfig *)self requirePrepareSize]) {
    int v28 = @"YES";
  }
  else {
    int v28 = @"NO";
  }
  if ([(SUControllerConfig *)self installWindowAsDeltas]) {
    int v29 = @"YES";
  }
  else {
    int v29 = @"NO";
  }
  objc_msgSend(v61, "stringWithFormat:", @"\nuseSUCore: %@\nVPNOnDemandAsInternal: %@\nPerformAutoScan: %@\nPerformAutoDownloadAndPrepare: %@\nPerformAutoInstall: %@\nAutoAcceptTermsAndConditions: %@\nAutoActivityCheckPeriod: %d minutes\nAutoInstallForceMaxWait: %d minutes\nAutoInstallWindowBegin: %02d:%02d\nAutoInstallWindowEnd: %02d:%02d\nDownloadDocAsset: %@\nIgnoreRamping: %@\nSupervisedMDM: %@\nRequestedPMV: %@\nDelayPeriod: %d days\nInstallPhaseOSBackgroundImagePath: %@\nRestrictToFullReplacement: %@\nAllowSameVersionUpdates: %@\nUpdateMetricContext: %@\nPrerequisiteBuildVersion: %@\nPrerequisiteProductVersion: %@\nAsReleaseType: %@\nsimulatorCommandsFile: %@\nuseSpecifiedInstallWindow: %@\nexpiredSpecifiedAsExpired: %@\nHideIndicationMayReboot: %@\nInternalDefaultsAsExternal: %@\nRequirePrepareSize: %@\nInstallWindowAsDeltas: %@", v59, v58, v56, v55, v54, v52, v51, v49, v48, v47, v46, v45, v43, v42, v40, v57,
    v38,
    v50,
    v35,
    v33,
    v41,
    v37,
    v34,
    v62,
    v23,
    v32,
    v25,
    v26,
    v27,
    v28,
  int v30 = v29);
  if (v22) {

  }
  if (v21) {
  if (v36)
  }

  if (v39) {
  if (v44)
  }

  if (v53) {
  if (v60)
  }

  return v30;
}

- (id)summary
{
  v61 = NSString;
  if ([(SUControllerConfig *)self useSUCore]) {
    v3 = @"Y";
  }
  else {
    v3 = @"N";
  }
  v59 = v3;
  if ([(SUControllerConfig *)self vpnOnDemandAsInternal]) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  v58 = v4;
  if ([(SUControllerConfig *)self performAutoScan]) {
    int v5 = @"Y";
  }
  else {
    int v5 = @"N";
  }
  v56 = v5;
  if ([(SUControllerConfig *)self performAutoDownloadAndPrepare]) {
    int v6 = @"Y";
  }
  else {
    int v6 = @"N";
  }
  v55 = v6;
  if ([(SUControllerConfig *)self performAutoInstall]) {
    int v7 = @"Y";
  }
  else {
    int v7 = @"N";
  }
  v54 = v7;
  if ([(SUControllerConfig *)self autoAcceptTermsAndConditions]) {
    int v8 = @"Y";
  }
  else {
    int v8 = @"N";
  }
  v52 = v8;
  int64_t v51 = [(SUControllerConfig *)self autoActivityCheckPeriod];
  int64_t v49 = [(SUControllerConfig *)self autoInstallForceMaxWait];
  int64_t v48 = [(SUControllerConfig *)self autoInstallWindowBeginHour];
  int64_t v47 = [(SUControllerConfig *)self autoInstallWindowBeginMinute];
  int64_t v46 = [(SUControllerConfig *)self autoInstallWindowEndHour];
  int64_t v45 = [(SUControllerConfig *)self autoInstallWindowEndMinute];
  if ([(SUControllerConfig *)self downloadDocAsset]) {
    int v9 = @"Y";
  }
  else {
    int v9 = @"N";
  }
  v43 = v9;
  if ([(SUControllerConfig *)self ignoreRamping]) {
    int v10 = @"Y";
  }
  else {
    int v10 = @"N";
  }
  v42 = v10;
  if ([(SUControllerConfig *)self supervisedMDM]) {
    int64_t v11 = @"Y";
  }
  else {
    int64_t v11 = @"N";
  }
  v40 = v11;
  uint64_t v12 = [(SUControllerConfig *)self requestedPMV];
  if (v12)
  {
    int64_t v13 = [(SUControllerConfig *)self requestedPMV];
  }
  else
  {
    int64_t v13 = @"!";
  }
  int64_t v38 = [(SUControllerConfig *)self delayPeriod];
  uint64_t v14 = [(SUControllerConfig *)self installPhaseOSBackgroundImagePath];
  if (v14)
  {
    v50 = [(SUControllerConfig *)self installPhaseOSBackgroundImagePath];
  }
  else
  {
    v50 = @"!";
  }
  if ([(SUControllerConfig *)self restrictToFullReplacement]) {
    int64_t v15 = @"Y";
  }
  else {
    int64_t v15 = @"N";
  }
  v35 = v15;
  if ([(SUControllerConfig *)self allowSameVersionUpdates]) {
    int64_t v16 = @"Y";
  }
  else {
    int64_t v16 = @"N";
  }
  int v33 = v16;
  uint64_t v17 = [(SUControllerConfig *)self updateMetricContext];
  if (v17)
  {
    v41 = [(SUControllerConfig *)self updateMetricContext];
  }
  else
  {
    v41 = @"!";
  }
  uint64_t v18 = [(SUControllerConfig *)self prerequisiteBuildVersion];
  if (v18)
  {
    int v19 = [(SUControllerConfig *)self prerequisiteBuildVersion];
  }
  else
  {
    int v19 = @"!";
  }
  v36 = [(SUControllerConfig *)self prerequisiteProductVersion];
  v60 = (void *)v12;
  if (v36)
  {
    char v20 = [(SUControllerConfig *)self prerequisiteProductVersion];
  }
  else
  {
    char v20 = @"!";
  }
  objc_super v21 = [(SUControllerConfig *)self asReleaseType];
  v53 = (void *)v14;
  if (v21)
  {
    v62 = [(SUControllerConfig *)self asReleaseType];
  }
  else
  {
    v62 = @"!";
  }
  v44 = (void *)v17;
  v22 = [(SUControllerConfig *)self simulatorCommandsFile];
  v57 = v13;
  v39 = (void *)v18;
  v37 = v19;
  int v34 = v20;
  if (v22)
  {
    objc_super v23 = [(SUControllerConfig *)self simulatorCommandsFile];
  }
  else
  {
    objc_super v23 = @"!";
  }
  if ([(SUControllerConfig *)self useSpecifiedInstallWindow]) {
    int64_t v24 = @"Y";
  }
  else {
    int64_t v24 = @"N";
  }
  int v32 = v24;
  if ([(SUControllerConfig *)self expiredSpecifiedAsExpired]) {
    v25 = @"Y";
  }
  else {
    v25 = @"N";
  }
  if ([(SUControllerConfig *)self hideIndicationMayReboot]) {
    v26 = @"Y";
  }
  else {
    v26 = @"N";
  }
  if ([(SUControllerConfig *)self internalDefaultsAsExternal]) {
    int v27 = @"Y";
  }
  else {
    int v27 = @"N";
  }
  if ([(SUControllerConfig *)self requirePrepareSize]) {
    int v28 = @"Y";
  }
  else {
    int v28 = @"N";
  }
  if ([(SUControllerConfig *)self installWindowAsDeltas]) {
    int v29 = @"Y";
  }
  else {
    int v29 = @"N";
  }
  objc_msgSend(v61, "stringWithFormat:", @"useSUCore:%@,vpnAsInternal:%@,autoScan:%@,autoDownload:%@,autoInstall:%@,autoAccept:%@,activityPeriod:%d,forceMaxWait:%d,windowBegin:%02d:%02d,windowEnd:%02d:%02d,downloadDoc:%@,ignoreRamp:%@,supervisedMDM:%@,requestedPMV:%@,delayPeriod:%d,installPhaseBGImgPath:%@,restrictToFull:%@,allowSame:%@,context:%@,asBuild:%@,asProduct:%@,asRelease:%@,simFile:%@,useInstallWindow:%@,expiredAsExpired:%@,hideMayReboot:%@,asExternal:%@,requirePrepSize:%@,windowDeltas:%@", v59, v58, v56, v55, v54, v52, v51, v49, v48, v47, v46, v45, v43, v42, v40, v57,
    v38,
    v50,
    v35,
    v33,
    v41,
    v37,
    v34,
    v62,
    v23,
    v32,
    v25,
    v26,
    v27,
    v28,
  int v30 = v29);
  if (v22) {

  }
  if (v21) {
  if (v36)
  }

  if (v39) {
  if (v44)
  }

  if (v53) {
  if (v60)
  }

  return v30;
}

- (id)changeSummary:(int64_t)a3
{
  int v3 = a3;
  if ((a3 & 0x8000000) != 0)
  {
    id v6 = [NSString alloc];
    if ([(SUControllerConfig *)self vpnOnDemandAsInternal]) {
      int v7 = @"Y";
    }
    else {
      int v7 = @"N";
    }
    int v8 = (void *)[v6 initWithFormat:@"|vpnAsInternal:%@", v7];
    int v5 = [&stru_270AE53E8 stringByAppendingString:v8];

    if ((v3 & 1) == 0) {
      goto LABEL_13;
    }
  }
  else
  {
    int v5 = &stru_270AE53E8;
    if ((a3 & 1) == 0) {
      goto LABEL_13;
    }
  }
  if ([(SUControllerConfig *)self _runningOnAppleTV])
  {
    id v9 = [NSString alloc];
    if ([(SUControllerConfig *)self performAutoScan]) {
      int v10 = @"Y";
    }
    else {
      int v10 = @"N";
    }
    int64_t v11 = (void *)[v9 initWithFormat:@"|autoScan:%@", v10];
    uint64_t v12 = [(__CFString *)v5 stringByAppendingString:v11];

    int v5 = (__CFString *)v12;
  }
LABEL_13:
  if ((v3 & 2) != 0)
  {
    id v26 = [NSString alloc];
    if ([(SUControllerConfig *)self performAutoDownloadAndPrepare]) {
      int v27 = @"Y";
    }
    else {
      int v27 = @"N";
    }
    int v28 = (void *)[v26 initWithFormat:@"|autoDownload:%@", v27];
    uint64_t v29 = [(__CFString *)v5 stringByAppendingString:v28];

    int v5 = (__CFString *)v29;
    if ((v3 & 4) == 0)
    {
LABEL_15:
      if ((v3 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_57;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_15;
  }
  id v30 = [NSString alloc];
  if ([(SUControllerConfig *)self performAutoInstall]) {
    int v31 = @"Y";
  }
  else {
    int v31 = @"N";
  }
  int v32 = (void *)[v30 initWithFormat:@"|autoInstall:%@", v31];
  uint64_t v33 = [(__CFString *)v5 stringByAppendingString:v32];

  int v5 = (__CFString *)v33;
  if ((v3 & 8) == 0)
  {
LABEL_16:
    if ((v3 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_61;
  }
LABEL_57:
  id v34 = [NSString alloc];
  if ([(SUControllerConfig *)self autoAcceptTermsAndConditions]) {
    v35 = @"Y";
  }
  else {
    v35 = @"N";
  }
  v36 = (void *)[v34 initWithFormat:@"|autoAccept:%@", v35];
  uint64_t v37 = [(__CFString *)v5 stringByAppendingString:v36];

  int v5 = (__CFString *)v37;
  if ((v3 & 0x10) == 0)
  {
LABEL_17:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_61:
  int64_t v38 = objc_msgSend([NSString alloc], "initWithFormat:", @"|activityPeriod:%d", -[SUControllerConfig autoActivityCheckPeriod](self, "autoActivityCheckPeriod"));
  uint64_t v39 = [(__CFString *)v5 stringByAppendingString:v38];

  int v5 = (__CFString *)v39;
  if ((v3 & 0x2000) != 0)
  {
LABEL_18:
    int64_t v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"|forceMaxWait:%d", -[SUControllerConfig autoInstallForceMaxWait](self, "autoInstallForceMaxWait"));
    uint64_t v14 = [(__CFString *)v5 stringByAppendingString:v13];

    int v5 = (__CFString *)v14;
  }
LABEL_19:
  if ((v3 & 0x180) != 0)
  {
    int64_t v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"|windowBegin:%02d:%02d", -[SUControllerConfig autoInstallWindowBeginHour](self, "autoInstallWindowBeginHour"), -[SUControllerConfig autoInstallWindowBeginMinute](self, "autoInstallWindowBeginMinute"));
    uint64_t v16 = [(__CFString *)v5 stringByAppendingString:v15];

    int v5 = (__CFString *)v16;
  }
  if ((v3 & 0x600) != 0)
  {
    uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"|windowEnd:%02d:%02d", -[SUControllerConfig autoInstallWindowEndHour](self, "autoInstallWindowEndHour"), -[SUControllerConfig autoInstallWindowEndMinute](self, "autoInstallWindowEndMinute"));
    uint64_t v18 = [(__CFString *)v5 stringByAppendingString:v17];

    int v5 = (__CFString *)v18;
  }
  if ((v3 & 0x400000) != 0)
  {
    id v40 = [NSString alloc];
    if ([(SUControllerConfig *)self downloadDocAsset]) {
      v41 = @"Y";
    }
    else {
      v41 = @"N";
    }
    v42 = (void *)[v40 initWithFormat:@"|downloadDoc:%@", v41];
    uint64_t v43 = [(__CFString *)v5 stringByAppendingString:v42];

    int v5 = (__CFString *)v43;
    if ((v3 & 0x800000) == 0)
    {
LABEL_25:
      if ((v3 & 0x10000000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_71;
    }
  }
  else if ((v3 & 0x800000) == 0)
  {
    goto LABEL_25;
  }
  id v44 = [NSString alloc];
  if ([(SUControllerConfig *)self ignoreRamping]) {
    int64_t v45 = @"Y";
  }
  else {
    int64_t v45 = @"N";
  }
  int64_t v46 = (void *)[v44 initWithFormat:@"|ignoreRamping:%@", v45];
  uint64_t v47 = [(__CFString *)v5 stringByAppendingString:v46];

  int v5 = (__CFString *)v47;
  if ((v3 & 0x10000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x20000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_75;
  }
LABEL_71:
  id v48 = [NSString alloc];
  if ([(SUControllerConfig *)self supervisedMDM]) {
    int64_t v49 = @"Y";
  }
  else {
    int64_t v49 = @"N";
  }
  v50 = (void *)[v48 initWithFormat:@"|supervisedMDM:%@", v49];
  uint64_t v51 = [(__CFString *)v5 stringByAppendingString:v50];

  int v5 = (__CFString *)v51;
  if ((v3 & 0x20000000) == 0)
  {
LABEL_27:
    if ((v3 & 0x40000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_81;
  }
LABEL_75:
  id v52 = [NSString alloc];
  v53 = [(SUControllerConfig *)self requestedPMV];
  if (v53)
  {
    v54 = [(SUControllerConfig *)self requestedPMV];
  }
  else
  {
    v54 = @"!";
  }
  v55 = (void *)[v52 initWithFormat:@"|requestedPMV:%@", v54];
  uint64_t v56 = [(__CFString *)v5 stringByAppendingString:v55];

  if (v53) {
  int v5 = (__CFString *)v56;
  }
  if ((v3 & 0x40000000) == 0)
  {
LABEL_28:
    if ((v3 & 0x80000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_82;
  }
LABEL_81:
  v57 = objc_msgSend([NSString alloc], "initWithFormat:", @"|delayPeriod:%d", -[SUControllerConfig delayPeriod](self, "delayPeriod"));
  uint64_t v58 = [(__CFString *)v5 stringByAppendingString:v57];

  int v5 = (__CFString *)v58;
  if ((v3 & 0x80000000) == 0)
  {
LABEL_29:
    if ((v3 & 0x20) == 0) {
      goto LABEL_30;
    }
    goto LABEL_88;
  }
LABEL_82:
  id v59 = [NSString alloc];
  v60 = [(SUControllerConfig *)self installPhaseOSBackgroundImagePath];
  if (v60)
  {
    v61 = [(SUControllerConfig *)self installPhaseOSBackgroundImagePath];
  }
  else
  {
    v61 = @"!";
  }
  v62 = (void *)[v59 initWithFormat:@"|installPhaseOSBgImgPath:%@", v61];
  uint64_t v63 = [(__CFString *)v5 stringByAppendingString:v62];

  if (v60) {
  int v5 = (__CFString *)v63;
  }
  if ((v3 & 0x20) == 0)
  {
LABEL_30:
    if ((v3 & 0x40) == 0) {
      goto LABEL_31;
    }
    goto LABEL_92;
  }
LABEL_88:
  id v64 = [NSString alloc];
  if ([(SUControllerConfig *)self restrictToFullReplacement]) {
    v65 = @"Y";
  }
  else {
    v65 = @"N";
  }
  v66 = (void *)[v64 initWithFormat:@"|restrictToFull:%@", v65];
  uint64_t v67 = [(__CFString *)v5 stringByAppendingString:v66];

  int v5 = (__CFString *)v67;
  if ((v3 & 0x40) == 0)
  {
LABEL_31:
    if ((v3 & 0x4000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_96;
  }
LABEL_92:
  id v68 = [NSString alloc];
  if ([(SUControllerConfig *)self allowSameVersionUpdates]) {
    v69 = @"Y";
  }
  else {
    v69 = @"N";
  }
  v70 = (void *)[v68 initWithFormat:@"|allowSame:%@", v69];
  uint64_t v71 = [(__CFString *)v5 stringByAppendingString:v70];

  int v5 = (__CFString *)v71;
  if ((v3 & 0x4000000) == 0)
  {
LABEL_32:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_102;
  }
LABEL_96:
  id v72 = [NSString alloc];
  v73 = [(SUControllerConfig *)self updateMetricContext];
  if (v73)
  {
    v74 = [(SUControllerConfig *)self updateMetricContext];
  }
  else
  {
    v74 = @"!";
  }
  v75 = (void *)[v72 initWithFormat:@"|context:%@", v74];
  uint64_t v76 = [(__CFString *)v5 stringByAppendingString:v75];

  if (v73) {
  int v5 = (__CFString *)v76;
  }
  if ((v3 & 0x20000) == 0)
  {
LABEL_33:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_108;
  }
LABEL_102:
  id v77 = [NSString alloc];
  v78 = [(SUControllerConfig *)self prerequisiteBuildVersion];
  if (v78)
  {
    v79 = [(SUControllerConfig *)self prerequisiteBuildVersion];
  }
  else
  {
    v79 = @"!";
  }
  v80 = (void *)[v77 initWithFormat:@"|asBuild:%@", v79];
  uint64_t v81 = [(__CFString *)v5 stringByAppendingString:v80];

  if (v78) {
  int v5 = (__CFString *)v81;
  }
  if ((v3 & 0x40000) == 0)
  {
LABEL_34:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_114;
  }
LABEL_108:
  id v82 = [NSString alloc];
  v83 = [(SUControllerConfig *)self prerequisiteProductVersion];
  if (v83)
  {
    v84 = [(SUControllerConfig *)self prerequisiteProductVersion];
  }
  else
  {
    v84 = @"!";
  }
  v85 = (void *)[v82 initWithFormat:@"|asProduct:%@", v84];
  uint64_t v86 = [(__CFString *)v5 stringByAppendingString:v85];

  if (v83) {
  int v5 = (__CFString *)v86;
  }
  if ((v3 & 0x80000) == 0)
  {
LABEL_35:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_120;
  }
LABEL_114:
  id v87 = [NSString alloc];
  v88 = [(SUControllerConfig *)self asReleaseType];
  if (v88)
  {
    v89 = [(SUControllerConfig *)self asReleaseType];
  }
  else
  {
    v89 = @"!";
  }
  v90 = (void *)[v87 initWithFormat:@"|asRelease:%@", v89];
  uint64_t v91 = [(__CFString *)v5 stringByAppendingString:v90];

  if (v88) {
  int v5 = (__CFString *)v91;
  }
  if ((v3 & 0x200000) == 0)
  {
LABEL_36:
    if ((v3 & 0x800) == 0) {
      goto LABEL_37;
    }
    goto LABEL_126;
  }
LABEL_120:
  id v92 = [NSString alloc];
  v93 = [(SUControllerConfig *)self simulatorCommandsFile];
  if (v93)
  {
    v94 = [(SUControllerConfig *)self simulatorCommandsFile];
  }
  else
  {
    v94 = @"!";
  }
  v95 = (void *)[v92 initWithFormat:@"|simFile:%@", v94];
  uint64_t v96 = [(__CFString *)v5 stringByAppendingString:v95];

  if (v93) {
  int v5 = (__CFString *)v96;
  }
  if ((v3 & 0x800) == 0)
  {
LABEL_37:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_130;
  }
LABEL_126:
  id v97 = [NSString alloc];
  if ([(SUControllerConfig *)self useSpecifiedInstallWindow]) {
    v98 = @"Y";
  }
  else {
    v98 = @"N";
  }
  v99 = (void *)[v97 initWithFormat:@"|useInstallWindow:%@", v98];
  uint64_t v100 = [(__CFString *)v5 stringByAppendingString:v99];

  int v5 = (__CFString *)v100;
  if ((v3 & 0x100000) == 0)
  {
LABEL_38:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_134;
  }
LABEL_130:
  id v101 = [NSString alloc];
  if ([(SUControllerConfig *)self expiredSpecifiedAsExpired]) {
    v102 = @"Y";
  }
  else {
    v102 = @"N";
  }
  v103 = (void *)[v101 initWithFormat:@"|expiredAsExpired:%@", v102];
  uint64_t v104 = [(__CFString *)v5 stringByAppendingString:v103];

  int v5 = (__CFString *)v104;
  if ((v3 & 0x1000) == 0)
  {
LABEL_39:
    if ((v3 & 0x2000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_138;
  }
LABEL_134:
  id v105 = [NSString alloc];
  if ([(SUControllerConfig *)self hideIndicationMayReboot]) {
    v106 = @"Y";
  }
  else {
    v106 = @"N";
  }
  v107 = (void *)[v105 initWithFormat:@"|hideMayReboot:%@", v106];
  uint64_t v108 = [(__CFString *)v5 stringByAppendingString:v107];

  int v5 = (__CFString *)v108;
  if ((v3 & 0x2000000) == 0)
  {
LABEL_40:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_41;
    }
LABEL_142:
    id v113 = [NSString alloc];
    if ([(SUControllerConfig *)self requirePrepareSize]) {
      v114 = @"Y";
    }
    else {
      v114 = @"N";
    }
    v115 = (void *)[v113 initWithFormat:@"|requirePrepSize:%@", v114];
    uint64_t v116 = [(__CFString *)v5 stringByAppendingString:v115];

    int v5 = (__CFString *)v116;
    if ((v3 & 0x8000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_42;
  }
LABEL_138:
  id v109 = [NSString alloc];
  if ([(SUControllerConfig *)self internalDefaultsAsExternal]) {
    v110 = @"Y";
  }
  else {
    v110 = @"N";
  }
  v111 = (void *)[v109 initWithFormat:@"|asExternal:%@", v110];
  uint64_t v112 = [(__CFString *)v5 stringByAppendingString:v111];

  int v5 = (__CFString *)v112;
  if ((v3 & 0x4000) != 0) {
    goto LABEL_142;
  }
LABEL_41:
  if ((v3 & 0x8000) != 0)
  {
LABEL_42:
    id v19 = [NSString alloc];
    if ([(SUControllerConfig *)self installWindowAsDeltas]) {
      char v20 = @"Y";
    }
    else {
      char v20 = @"N";
    }
    objc_super v21 = (void *)[v19 initWithFormat:@"|windowDeltas:%@", v20];
    uint64_t v22 = [(__CFString *)v5 stringByAppendingString:v21];

    int v5 = (__CFString *)v22;
  }
LABEL_46:
  if (([(__CFString *)v5 isEqualToString:&stru_270AE53E8] & 1) == 0)
  {
    uint64_t v23 = [(__CFString *)v5 stringByAppendingString:@"|"];

    int v5 = (__CFString *)v23;
  }
  int64_t v24 = v5;

  return v24;
}

- (BOOL)_loadBooleanFromDefaults:(id)a3 usingDefault:(BOOL)a4 isStoredInverted:(BOOL)a5
{
  BOOL v5 = a5;
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)a3, @"com.apple.SUController", &keyExistsAndHasValidFormat);
  BOOL v8 = AppBooleanValue != 0;
  if (v5) {
    BOOL v8 = AppBooleanValue == 0;
  }
  if (keyExistsAndHasValidFormat) {
    return v8;
  }
  else {
    return a4;
  }
}

- (int64_t)_loadBooleanFromDefaults:(id)a3 releaseType:(int64_t)a4 externalDefault:(BOOL)a5 internalDefault:(BOOL)a6 isStoredInverted:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)a3, @"com.apple.SUController", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    BOOL v13 = AppBooleanValue != 0;
    if (v7) {
      return AppBooleanValue == 0;
    }
  }
  else if (self->_internalDefaultsAsExternal || (unint64_t)(a4 - 1) >= 2)
  {
    return v9;
  }
  else
  {
    return v8;
  }
  return v13;
}

- (int64_t)_loadIntegerFromDefaults:(id)a3 usingDefault:(int64_t)a4 withLimit:(int64_t)a5
{
  BOOL v8 = (__CFString *)a3;
  BOOL v9 = (void *)CFPreferencesCopyAppValue(v8, @"com.apple.SUController");
  int v10 = v9;
  if (v9) {
    a4 = -[SUControllerConfig _limitedInteger:checkingValue:forKey:withLimit:](self, "_limitedInteger:checkingValue:forKey:withLimit:", @"load", (int)[v9 intValue], v8, a5);
  }

  return a4;
}

- (int64_t)_loadIntegerFromDefaults:(id)a3 releaseType:(int64_t)a4 externalDefault:(int64_t)a5 internalDefault:(int64_t)a6 withLimit:(int64_t)a7
{
  uint64_t v12 = (__CFString *)a3;
  BOOL v13 = (void *)CFPreferencesCopyAppValue(v12, @"com.apple.SUController");
  uint64_t v14 = v13;
  if (v13)
  {
    int64_t v15 = -[SUControllerConfig _limitedInteger:checkingValue:forKey:withLimit:](self, "_limitedInteger:checkingValue:forKey:withLimit:", @"load", (int)[v13 intValue], v12, a7);
  }
  else if (self->_internalDefaultsAsExternal || (unint64_t)(a4 - 1) >= 2)
  {
    int64_t v15 = a5;
  }
  else
  {
    int64_t v15 = a6;
  }

  return v15;
}

- (id)_copyStringFromDefaults:(id)a3 usingDefault:(id)a4
{
  id v5 = a4;
  CFPropertyListRef v6 = CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.SUController");
  BOOL v7 = (void *)v6;
  if (v5 && !v6) {
    BOOL v7 = (void *)[v5 copy];
  }

  return v7;
}

- (BOOL)_storeBooleanToDefaults:(id)a3 toValue:(BOOL)a4 isStoredInverted:(BOOL)a5
{
  if (a4 != a5) {
    CFPropertyListRef v6 = @"true";
  }
  else {
    CFPropertyListRef v6 = @"false";
  }
  CFPreferencesSetAppValue((CFStringRef)a3, v6, @"com.apple.SUController");
  return a4;
}

- (int64_t)_storeIntegerToDefaults:(id)a3 toValue:(int64_t)a4
{
  id v5 = (__CFString *)a3;
  CFPropertyListRef v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a4);
  if (v6) {
    CFPreferencesSetAppValue(v5, v6, @"com.apple.SUController");
  }

  return a4;
}

- (id)_storeStringToDefaults:(id)a3 toValue:(id)a4
{
  id v5 = a4;
  CFPreferencesSetAppValue((CFStringRef)a3, v5, @"com.apple.SUController");

  return v5;
}

- (int64_t)_decodeInteger:(id)a3 forKey:(id)a4 withLimit:(int64_t)a5
{
  id v8 = a4;
  int64_t v9 = -[SUControllerConfig _limitedInteger:checkingValue:forKey:withLimit:](self, "_limitedInteger:checkingValue:forKey:withLimit:", @"decode", [a3 decodeIntegerForKey:v8], v8, a5);

  return v9;
}

- (int64_t)_limitedInteger:(id)a3 checkingValue:(int64_t)a4 forKey:(id)a5 withLimit:(int64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  if (a4 < 0)
  {
    int64_t v11 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"attempt to %@ %@ to negative value(%ld) - using value of 0", v9, v10, a4];
    [v11 trackAnomaly:@"[CONFIG]" forReason:v12 withResult:8102 withError:0];
    a6 = 0;
    goto LABEL_6;
  }
  if (a6 && a4 > a6)
  {
    int64_t v11 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"attempt to %@ %@ to over-limit value(%ld) - using value of %ld", v9, v10, a4, a6];
    [v11 trackAnomaly:@"[CONFIG]" forReason:v12 withResult:8102 withError:0];
LABEL_6:

    a4 = a6;
  }

  return a4;
}

- (BOOL)_runningOnAppleTV
{
  v2 = [MEMORY[0x263F77DA0] sharedDevice];
  int v3 = [v2 deviceClass];
  char v4 = [v3 isEqualToString:@"AppleTV"];

  return v4;
}

- (BOOL)useSUCore
{
  return self->_useSUCore;
}

- (void)setUseSUCore:(BOOL)a3
{
  self->_useSUCore = a3;
}

- (int64_t)preservePreparedMaxAttempts
{
  return self->_preservePreparedMaxAttempts;
}

- (void)setPreservePreparedMaxAttempts:(int64_t)a3
{
  self->_preservePreparedMaxAttempts = a3;
}

- (BOOL)vpnOnDemandAsInternal
{
  return self->_vpnOnDemandAsInternal;
}

- (void)setVpnOnDemandAsInternal:(BOOL)a3
{
  self->_vpnOnDemandAsInternal = a3;
}

- (BOOL)performAutoScan
{
  return self->_performAutoScan;
}

- (void)setPerformAutoScan:(BOOL)a3
{
  self->_performAutoScan = a3;
}

- (BOOL)performAutoDownloadAndPrepare
{
  return self->_performAutoDownloadAndPrepare;
}

- (void)setPerformAutoDownloadAndPrepare:(BOOL)a3
{
  self->_performAutoDownloadAndPrepare = a3;
}

- (BOOL)performAutoInstall
{
  return self->_performAutoInstall;
}

- (void)setPerformAutoInstall:(BOOL)a3
{
  self->_performAutoInstall = a3;
}

- (BOOL)autoAcceptTermsAndConditions
{
  return self->_autoAcceptTermsAndConditions;
}

- (void)setAutoAcceptTermsAndConditions:(BOOL)a3
{
  self->_autoAcceptTermsAndConditions = a3;
}

- (int64_t)autoActivityCheckPeriod
{
  return self->_autoActivityCheckPeriod;
}

- (void)setAutoActivityCheckPeriod:(int64_t)a3
{
  self->_autoActivityCheckPeriod = a3;
}

- (int64_t)autoInstallForceMaxWait
{
  return self->_autoInstallForceMaxWait;
}

- (void)setAutoInstallForceMaxWait:(int64_t)a3
{
  self->_autoInstallForceMaxWait = a3;
}

- (int64_t)autoInstallWindowBeginHour
{
  return self->_autoInstallWindowBeginHour;
}

- (void)setAutoInstallWindowBeginHour:(int64_t)a3
{
  self->_autoInstallWindowBeginHour = a3;
}

- (int64_t)autoInstallWindowBeginMinute
{
  return self->_autoInstallWindowBeginMinute;
}

- (void)setAutoInstallWindowBeginMinute:(int64_t)a3
{
  self->_autoInstallWindowBeginMinute = a3;
}

- (int64_t)autoInstallWindowEndHour
{
  return self->_autoInstallWindowEndHour;
}

- (void)setAutoInstallWindowEndHour:(int64_t)a3
{
  self->_autoInstallWindowEndHour = a3;
}

- (int64_t)autoInstallWindowEndMinute
{
  return self->_autoInstallWindowEndMinute;
}

- (void)setAutoInstallWindowEndMinute:(int64_t)a3
{
  self->_autoInstallWindowEndMinute = a3;
}

- (BOOL)downloadDocAsset
{
  return self->_downloadDocAsset;
}

- (void)setDownloadDocAsset:(BOOL)a3
{
  self->_downloadDocAsset = a3;
}

- (BOOL)ignoreRamping
{
  return self->_ignoreRamping;
}

- (void)setIgnoreRamping:(BOOL)a3
{
  self->_ignoreRamping = a3;
}

- (NSString)installPhaseOSBackgroundImagePath
{
  return self->_installPhaseOSBackgroundImagePath;
}

- (void)setInstallPhaseOSBackgroundImagePath:(id)a3
{
}

- (BOOL)supervisedMDM
{
  return self->_supervisedMDM;
}

- (void)setSupervisedMDM:(BOOL)a3
{
  self->_supervisedMDM = a3;
}

- (NSString)requestedPMV
{
  return self->_requestedPMV;
}

- (void)setRequestedPMV:(id)a3
{
}

- (int64_t)delayPeriod
{
  return self->_delayPeriod;
}

- (void)setDelayPeriod:(int64_t)a3
{
  self->_delayPeriod = a3;
}

- (BOOL)restrictToFullReplacement
{
  return self->_restrictToFullReplacement;
}

- (void)setRestrictToFullReplacement:(BOOL)a3
{
  self->_restrictToFullReplacement = a3;
}

- (BOOL)allowSameVersionUpdates
{
  return self->_allowSameVersionUpdates;
}

- (void)setAllowSameVersionUpdates:(BOOL)a3
{
  self->_allowSameVersionUpdates = a3;
}

- (BOOL)useSpecifiedInstallWindow
{
  return self->_useSpecifiedInstallWindow;
}

- (void)setUseSpecifiedInstallWindow:(BOOL)a3
{
  self->_useSpecifiedInstallWindow = a3;
}

- (BOOL)expiredSpecifiedAsExpired
{
  return self->_expiredSpecifiedAsExpired;
}

- (void)setExpiredSpecifiedAsExpired:(BOOL)a3
{
  self->_expiredSpecifiedAsExpired = a3;
}

- (BOOL)hideIndicationMayReboot
{
  return self->_hideIndicationMayReboot;
}

- (void)setHideIndicationMayReboot:(BOOL)a3
{
  self->_hideIndicationMayReboot = a3;
}

- (BOOL)internalDefaultsAsExternal
{
  return self->_internalDefaultsAsExternal;
}

- (void)setInternalDefaultsAsExternal:(BOOL)a3
{
  self->_internalDefaultsAsExternal = a3;
}

- (BOOL)requirePrepareSize
{
  return self->_requirePrepareSize;
}

- (void)setRequirePrepareSize:(BOOL)a3
{
  self->_requirePrepareSize = a3;
}

- (BOOL)installWindowAsDeltas
{
  return self->_installWindowAsDeltas;
}

- (void)setInstallWindowAsDeltas:(BOOL)a3
{
  self->_installWindowAsDeltas = a3;
}

- (NSString)updateMetricContext
{
  return self->_updateMetricContext;
}

- (void)setUpdateMetricContext:(id)a3
{
}

- (NSString)prerequisiteBuildVersion
{
  return self->_prerequisiteBuildVersion;
}

- (void)setPrerequisiteBuildVersion:(id)a3
{
}

- (NSString)prerequisiteProductVersion
{
  return self->_prerequisiteProductVersion;
}

- (void)setPrerequisiteProductVersion:(id)a3
{
}

- (NSString)asReleaseType
{
  return self->_asReleaseType;
}

- (void)setAsReleaseType:(id)a3
{
}

- (NSString)simulatorCommandsFile
{
  return self->_simulatorCommandsFile;
}

- (void)setSimulatorCommandsFile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatorCommandsFile, 0);
  objc_storeStrong((id *)&self->_asReleaseType, 0);
  objc_storeStrong((id *)&self->_prerequisiteProductVersion, 0);
  objc_storeStrong((id *)&self->_prerequisiteBuildVersion, 0);
  objc_storeStrong((id *)&self->_updateMetricContext, 0);
  objc_storeStrong((id *)&self->_requestedPMV, 0);

  objc_storeStrong((id *)&self->_installPhaseOSBackgroundImagePath, 0);
}

@end