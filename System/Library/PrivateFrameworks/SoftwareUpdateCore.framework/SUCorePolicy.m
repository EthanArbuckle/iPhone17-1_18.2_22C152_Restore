@interface SUCorePolicy
+ (BOOL)getAllowSameProductVersionPredicateResultWithAssetOSVersion:(id)a3 assetBuildVersion:(id)a4 prerequisiteProductVersion:(id)a5 prerequisiteBuildVersion:(id)a6;
+ (BOOL)getNoAllowSameProductVersionPredicateResultWithAssetOSVersion:(id)a3 assetBuildVersion:(id)a4 prerequisiteProductVersion:(id)a5 prerequisiteBuildVersion:(id)a6;
+ (BOOL)supportsSecureCoding;
+ (id)_cleanProductVersion:(id)a3;
- (BOOL)allowSameVersion;
- (BOOL)allowsCellular;
- (BOOL)background;
- (BOOL)bridgeOSIgnoreMinimumVersionCheck;
- (BOOL)checkAvailableSpace;
- (BOOL)disableAlternateUpdate;
- (BOOL)disableSplatCombo;
- (BOOL)enableBridgeOSInstall;
- (BOOL)enableEmbeddedOSInstall;
- (BOOL)enableOSPersonalization;
- (BOOL)enablePreSUStaging;
- (BOOL)enablePreSUStagingForOptionalAssets;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternal;
- (BOOL)isRequestedPMVSupervisedPolicy;
- (BOOL)isSplatPolicy;
- (BOOL)isSupervisedPolicy;
- (BOOL)performPreflightEncryptedCheck;
- (BOOL)performPreflightSnapshotCheck;
- (BOOL)restrictToFull;
- (BOOL)skipVolumeSealing;
- (BOOL)userInitiated;
- (NSArray)policyExtensions;
- (NSData)localAuthenticationContext;
- (NSData)ssoToken;
- (NSDictionary)defaultDescriptorValues;
- (NSDictionary)updateMetricEventFields;
- (NSNumber)localAuthenticationUserID;
- (NSNumber)proxyPortNumber;
- (NSString)alternateAssetAudienceUUID;
- (NSString)assetAudienceUUID;
- (NSString)bridgeOSDownloadDirectory;
- (NSString)deviceClass;
- (NSString)documentationAssetType;
- (NSString)downloadAuthorizationHeader;
- (NSString)hwModelStr;
- (NSString)installedSFRVersion;
- (NSString)mdmBootstrapToken;
- (NSString)personalizationServerURL;
- (NSString)personalizedManifestRootsPath;
- (NSString)prerequisiteBuildVersion;
- (NSString)prerequisiteProductVersion;
- (NSString)prerequisiteRestoreVersion;
- (NSString)productType;
- (NSString)proxyHostName;
- (NSString)releaseType;
- (NSString)softwareUpdateAssetType;
- (NSString)targetRestoreVersion;
- (NSString)targetVolumeUUID;
- (NSString)updateBrainLocationOverride;
- (NSString)updateMetricContext;
- (NSString)updateVolumePath;
- (NSString)userAgentString;
- (SUCorePolicy)initWithCoder:(id)a3;
- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 updateBrainAssetType:(id)a5 usingExtensions:(id)a6;
- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingExtensions:(id)a5;
- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6;
- (SUCorePolicyApply)applyPolicy;
- (SUCorePolicyDocumentationDownload)documentationDownloadPolicy;
- (SUCorePolicyDocumentationScan)documentationScanPolicy;
- (SUCorePolicyLoadBrain)loadBrainPolicy;
- (SUCorePolicyPreflightDownloadSU)downloadPreflightPolicy;
- (SUCorePolicyPreflightFDRRecovery)fdrRecoveryPreflightPolicy;
- (SUCorePolicyPreflightPersonalize)personalizePreflightPolicy;
- (SUCorePolicyPreflightPrerequisiteCheck)prerequisiteCheckPreflightPolicy;
- (SUCorePolicyPreflightWakeup)wakeupPreflightPolicy;
- (SUCorePolicyPrepare)preparePolicy;
- (SUCorePolicyResume)resumePolicy;
- (SUCorePolicyRollback)rollbackPolicy;
- (SUCorePolicySoftwareUpdateDownload)softwareUpdateDownloadPolicy;
- (SUCorePolicySoftwareUpdateScan)softwareUpdateScanPolicy;
- (SUCorePolicySuspend)suspendPolicy;
- (id)_copyGestaltValueForKey:(__CFString *)a3;
- (id)assetTypeSummary;
- (id)constructDocumentationMAAssetQueryWithDocID:(id)a3 purpose:(id)a4;
- (id)constructMADocumentationAssetDownloadOptionsWithUUID:(id)a3;
- (id)constructMADocumentationCatalogDownloadOptionsWithUUID:(id)a3 usingDescriptor:(id)a4;
- (id)constructMASoftwareUpdateAssetDownloadOptionsWithUUID:(id)a3;
- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4;
- (id)constructSoftwareUpdateMAAssetQuery;
- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mdmPathName;
- (id)requestedProductMarketingVersion;
- (id)setUpdateMetricEventFieldsFromDictionary:(id)a3;
- (id)stringForQoS:(int)a3;
- (id)summary;
- (int)cacheDeleteUrgency;
- (int)qualityOfService;
- (int64_t)delayPeriodDays;
- (int64_t)specifiedUsedPolicies;
- (void)encodeWithCoder:(id)a3;
- (void)selectDocumentationAsset:(id *)a3 fromAssetQuery:(id)a4;
- (void)selectSoftwareUpdateMajorPrimaryAsset:(id *)a3 majorSecondaryAsset:(id *)a4 minorPrimaryAsset:(id *)a5 minorSecondaryAsset:(id *)a6 fromAssetQuery:(id)a7;
- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5;
- (void)setAllowSameVersion:(BOOL)a3;
- (void)setAllowsCellular:(BOOL)a3;
- (void)setAlternateAssetAudienceUUID:(id)a3;
- (void)setApplyPolicy:(id)a3;
- (void)setAssetAudienceUUID:(id)a3;
- (void)setBackground:(BOOL)a3;
- (void)setBridgeOSDownloadDirectory:(id)a3;
- (void)setBridgeOSIgnoreMinimumVersionCheck:(BOOL)a3;
- (void)setCacheDeleteUrgency:(int)a3;
- (void)setCheckAvailableSpace:(BOOL)a3;
- (void)setDefaultDescriptorValues:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDisableAlternateUpdate:(BOOL)a3;
- (void)setDisableSplatCombo:(BOOL)a3;
- (void)setDocumentationAssetType:(id)a3;
- (void)setDocumentationDownloadPolicy:(id)a3;
- (void)setDocumentationScanPolicy:(id)a3;
- (void)setDownloadAuthorizationHeader:(id)a3;
- (void)setDownloadPreflightPolicy:(id)a3;
- (void)setEnableBridgeOSInstall:(BOOL)a3;
- (void)setEnableEmbeddedOSInstall:(BOOL)a3;
- (void)setEnableOSPersonalization:(BOOL)a3;
- (void)setEnablePreSUStaging:(BOOL)a3;
- (void)setEnablePreSUStagingForOptionalAssets:(BOOL)a3;
- (void)setFdrRecoveryPreflightPolicy:(id)a3;
- (void)setHwModelStr:(id)a3;
- (void)setInstalledSFRVersion:(id)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setLoadBrainPolicy:(id)a3;
- (void)setLocalAuthenticationContext:(id)a3;
- (void)setLocalAuthenticationUserID:(id)a3;
- (void)setMdmBootstrapToken:(id)a3;
- (void)setPerformPreflightEncryptedCheck:(BOOL)a3;
- (void)setPerformPreflightSnapshotCheck:(BOOL)a3;
- (void)setPersonalizationServerURL:(id)a3;
- (void)setPersonalizePreflightPolicy:(id)a3;
- (void)setPersonalizedManifestRootsPath:(id)a3;
- (void)setPolicyExtensions:(id)a3;
- (void)setPreparePolicy:(id)a3;
- (void)setPrerequisiteBuildVersion:(id)a3;
- (void)setPrerequisiteCheckPreflightPolicy:(id)a3;
- (void)setPrerequisiteProductVersion:(id)a3;
- (void)setPrerequisiteRestoreVersion:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProxyHostName:(id)a3;
- (void)setProxyPortNumber:(id)a3;
- (void)setQualityOfService:(int)a3;
- (void)setReleaseType:(id)a3;
- (void)setRestrictToFull:(BOOL)a3;
- (void)setResumePolicy:(id)a3;
- (void)setRollbackPolicy:(id)a3;
- (void)setSkipVolumeSealing:(BOOL)a3;
- (void)setSoftwareUpdateAssetType:(id)a3;
- (void)setSoftwareUpdateDownloadPolicy:(id)a3;
- (void)setSoftwareUpdateScanPolicy:(id)a3;
- (void)setSpecifiedUsedPolicies:(int64_t)a3;
- (void)setSsoToken:(id)a3;
- (void)setSuspendPolicy:(id)a3;
- (void)setTargetRestoreVersion:(id)a3;
- (void)setTargetVolumeUUID:(id)a3;
- (void)setUpdateBrainLocationOverride:(id)a3;
- (void)setUpdateMetricContext:(id)a3;
- (void)setUpdateMetricEventFields:(id)a3;
- (void)setUpdateVolumePath:(id)a3;
- (void)setUserAgentString:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
- (void)setWakeupPreflightPolicy:(id)a3;
- (void)updateApplyOptionsWithExtensions:(id)a3;
- (void)updateRollbackOptionsWithExtensions:(id)a3;
@end

@implementation SUCorePolicy

- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v112.receiver = self;
  v112.super_class = (Class)SUCorePolicy;
  v13 = [(SUCorePolicy *)&v112 init];
  if (v13)
  {
    v14 = [MEMORY[0x263F77DE8] sharedLogger];
    v15 = [v14 oslog];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [MEMORY[0x263F77DA0] sharedDevice];
      v17 = [v16 summary];
      *(_DWORD *)buf = 138543362;
      v115 = v17;
      _os_log_impl(&dword_20C8EA000, v15, OS_LOG_TYPE_DEFAULT, "[POLICY] Using SUCoreDevice for policy: %{public}@", buf, 0xCu);
    }
    id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
    *((void *)v13 + 5) = a5;
    v19 = objc_alloc_init(SUCorePolicySoftwareUpdateScan);
    v20 = (void *)*((void *)v13 + 6);
    *((void *)v13 + 6) = v19;

    v21 = objc_alloc_init(SUCorePolicyDocumentationScan);
    v22 = (void *)*((void *)v13 + 7);
    *((void *)v13 + 7) = v21;

    v23 = objc_alloc_init(SUCorePolicyDocumentationDownload);
    v24 = (void *)*((void *)v13 + 8);
    *((void *)v13 + 8) = v23;

    v25 = -[SUCorePolicyLoadBrain initWithSkipPhaseSet:]([SUCorePolicyLoadBrain alloc], "initWithSkipPhaseSet:", ([v13 specifiedUsedPolicies] & 1) == 0);
    v26 = (void *)*((void *)v13 + 9);
    *((void *)v13 + 9) = v25;

    v27 = -[SUCorePolicyPreflightDownloadSU initWithSkipPhaseSet:]([SUCorePolicyPreflightDownloadSU alloc], "initWithSkipPhaseSet:", ([v13 specifiedUsedPolicies] & 2) == 0);
    v28 = (void *)*((void *)v13 + 10);
    *((void *)v13 + 10) = v27;

    v29 = -[SUCorePolicySoftwareUpdateDownload initWithSkipPhaseSet:]([SUCorePolicySoftwareUpdateDownload alloc], "initWithSkipPhaseSet:", ([v13 specifiedUsedPolicies] & 4) == 0);
    v30 = (void *)*((void *)v13 + 11);
    *((void *)v13 + 11) = v29;

    v31 = -[SUCorePolicyPrepare initWithSkipPhaseSet:]([SUCorePolicyPrepare alloc], "initWithSkipPhaseSet:", ([v13 specifiedUsedPolicies] & 8) == 0);
    v32 = (void *)*((void *)v13 + 12);
    *((void *)v13 + 12) = v31;

    v33 = -[SUCorePolicySuspend initWithSkipPhaseSet:]([SUCorePolicySuspend alloc], "initWithSkipPhaseSet:", ([v13 specifiedUsedPolicies] & 0x10) == 0);
    v34 = (void *)*((void *)v13 + 13);
    *((void *)v13 + 13) = v33;

    v35 = -[SUCorePolicyResume initWithSkipPhaseSet:]([SUCorePolicyResume alloc], "initWithSkipPhaseSet:", ([v13 specifiedUsedPolicies] & 0x20) == 0);
    v36 = (void *)*((void *)v13 + 14);
    *((void *)v13 + 14) = v35;

    v37 = -[SUCorePolicyApply initWithSkipPhaseSet:]([SUCorePolicyApply alloc], "initWithSkipPhaseSet:", ([v13 specifiedUsedPolicies] & 0x40) == 0);
    v38 = (void *)*((void *)v13 + 15);
    *((void *)v13 + 15) = v37;

    v39 = objc_alloc_init(SUCorePolicyPreflightWakeup);
    v40 = (void *)*((void *)v13 + 17);
    *((void *)v13 + 17) = v39;

    v41 = objc_alloc_init(SUCorePolicyPreflightPrerequisiteCheck);
    v42 = (void *)*((void *)v13 + 18);
    *((void *)v13 + 18) = v41;

    v43 = objc_alloc_init(SUCorePolicyPreflightPersonalize);
    v44 = (void *)*((void *)v13 + 19);
    *((void *)v13 + 19) = v43;

    v45 = objc_alloc_init(SUCorePolicyPreflightFDRRecovery);
    v46 = (void *)*((void *)v13 + 20);
    *((void *)v13 + 20) = v45;

    v47 = objc_alloc_init(SUCorePolicyRollback);
    v48 = (void *)*((void *)v13 + 16);
    *((void *)v13 + 16) = v47;

    if (v10)
    {
      uint64_t v49 = [[NSString alloc] initWithString:v10];
      v50 = (void *)*((void *)v13 + 21);
      *((void *)v13 + 21) = v49;
    }
    else
    {
      v50 = (void *)*((void *)v13 + 21);
      *((void *)v13 + 21) = 0;
    }

    if (v11)
    {
      uint64_t v51 = [[NSString alloc] initWithString:v11];
      v52 = (void *)*((void *)v13 + 22);
      *((void *)v13 + 22) = v51;
    }
    else
    {
      v52 = (void *)*((void *)v13 + 22);
      *((void *)v13 + 22) = 0;
    }

    v53 = (void *)*((void *)v13 + 23);
    *((void *)v13 + 23) = 0;

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v107 = v12;
    id v54 = v12;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v108 objects:v113 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v109;
      do
      {
        uint64_t v58 = 0;
        do
        {
          if (*(void *)v109 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = (void *)[*(id *)(*((void *)&v108 + 1) + 8 * v58) copyWithZone:0];
          [v18 addObject:v59];

          ++v58;
        }
        while (v56 != v58);
        uint64_t v56 = [v54 countByEnumeratingWithState:&v108 objects:v113 count:16];
      }
      while (v56);
    }

    uint64_t v60 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v18];
    v61 = (void *)*((void *)v13 + 51);
    *((void *)v13 + 51) = v60;

    v62 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v63 = [v62 buildVersion];
    v64 = (void *)*((void *)v13 + 24);
    *((void *)v13 + 24) = v63;

    v65 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v66 = [v65 productVersion];
    v67 = (void *)*((void *)v13 + 25);
    *((void *)v13 + 25) = v66;

    v68 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v69 = [v68 restoreVersion];
    v70 = (void *)*((void *)v13 + 26);
    *((void *)v13 + 26) = v69;

    v71 = (void *)*((void *)v13 + 27);
    *((void *)v13 + 27) = 0;

    v72 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v73 = [v72 sfrBuildVersion];
    v74 = (void *)*((void *)v13 + 28);
    *((void *)v13 + 28) = v73;

    v75 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v76 = [v75 deviceClass];
    v77 = (void *)*((void *)v13 + 29);
    *((void *)v13 + 29) = v76;

    v78 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v79 = [v78 hwModelString];
    v80 = (void *)*((void *)v13 + 30);
    *((void *)v13 + 30) = v79;

    v81 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v82 = [v81 productType];
    v83 = (void *)*((void *)v13 + 31);
    *((void *)v13 + 31) = v82;

    v84 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v85 = [v84 releaseType];
    v86 = (void *)*((void *)v13 + 32);
    *((void *)v13 + 32) = v85;

    v87 = [MEMORY[0x263F77DA0] sharedDevice];
    v13[12] = [v87 isInternal];

    *((_DWORD *)v13 + 2) = 0;
    v13[13] = 1;
    *((_DWORD *)v13 + 7) = -1;
    v88 = (void *)*((void *)v13 + 33);
    *((void *)v13 + 33) = 0;

    *((_WORD *)v13 + 7) = 0;
    v89 = (void *)*((void *)v13 + 34);
    *((void *)v13 + 34) = 0;

    v90 = (void *)*((void *)v13 + 35);
    *((void *)v13 + 35) = 0;

    v91 = (void *)*((void *)v13 + 36);
    *((void *)v13 + 36) = 0;

    v92 = (void *)*((void *)v13 + 37);
    *((void *)v13 + 37) = 0;

    v93 = (void *)*((void *)v13 + 38);
    *((void *)v13 + 38) = 0;

    v94 = (void *)*((void *)v13 + 39);
    *((void *)v13 + 39) = 0;

    v95 = (void *)*((void *)v13 + 40);
    *((void *)v13 + 40) = 0;

    v96 = (void *)*((void *)v13 + 41);
    *((void *)v13 + 41) = 0;

    v97 = (void *)*((void *)v13 + 42);
    *((void *)v13 + 42) = 0;

    v98 = (void *)*((void *)v13 + 43);
    *((void *)v13 + 43) = 0;

    *((_WORD *)v13 + 8) = 256;
    v99 = (void *)*((void *)v13 + 44);
    *((void *)v13 + 44) = 0;

    v100 = (void *)*((void *)v13 + 45);
    *((void *)v13 + 45) = 0;

    v101 = (void *)*((void *)v13 + 46);
    *((void *)v13 + 46) = 0;

    v13[20] = 0;
    v102 = (void *)*((void *)v13 + 47);
    *((void *)v13 + 47) = 0;

    *((_DWORD *)v13 + 8) = 0;
    *(_DWORD *)(v13 + 21) = 0;
    v13[25] = 0;
    v103 = (void *)*((void *)v13 + 48);
    *((void *)v13 + 48) = 0;

    v104 = (void *)*((void *)v13 + 49);
    *((void *)v13 + 49) = 0;

    v105 = (void *)*((void *)v13 + 50);
    *((void *)v13 + 50) = 0;

    *((_WORD *)v13 + 9) = 0;
    id v12 = v107;
  }

  return (SUCorePolicy *)v13;
}

- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingExtensions:(id)a5
{
  return [(SUCorePolicy *)self initWithSoftwareUpdateAssetType:a3 documentationAssetType:a4 usingPolicies:127 usingExtensions:a5];
}

- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 updateBrainAssetType:(id)a5 usingExtensions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (objc_class *)NSString;
  id v14 = a5;
  v15 = (void *)[[v13 alloc] initWithFormat:@"this method has been deprecated (and was called with updateBrainAssetType=%@): initWithSoftwareUpdateAssetType:documentationAssetType:updateBrainAssetType:usingExtensions", v14];

  v16 = [MEMORY[0x263F77DA8] sharedDiag];
  v17 = v16;
  if (v14)
  {
    [v16 trackFault:@"[POLICY] INIT" forReason:v15 withResult:8123 withError:0];

    id v18 = 0;
  }
  else
  {
    [v16 trackAnomaly:@"[POLICY] INIT" forReason:v15 withResult:8123 withError:0];

    self = [(SUCorePolicy *)self initWithSoftwareUpdateAssetType:v10 documentationAssetType:v11 usingExtensions:v12];
    id v18 = self;
  }

  return v18;
}

- (void)setRestrictToFull:(BOOL)a3
{
  BOOL v3 = a3;
  self->_restrictToFull = a3;
  id v4 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  [v4 setRestrictToFull:v3];
}

- (BOOL)restrictToFull
{
  v2 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  char v3 = [v2 restrictToFull];

  return v3;
}

- (void)setAllowSameVersion:(BOOL)a3
{
  BOOL v3 = a3;
  self->_allowSameVersion = a3;
  id v4 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  [v4 setAllowSameVersion:v3];
}

- (BOOL)allowSameVersion
{
  v2 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  char v3 = [v2 allowSameVersion];

  return v3;
}

- (void)setBackground:(BOOL)a3
{
  BOOL v3 = a3;
  self->_background = a3;
  v5 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  [v5 setDiscretionary:v3];

  v6 = [(SUCorePolicy *)self documentationScanPolicy];
  [v6 setDiscretionary:v3];

  v7 = [(SUCorePolicy *)self documentationDownloadPolicy];
  [v7 setDiscretionary:v3];

  v8 = [(SUCorePolicy *)self loadBrainPolicy];
  [v8 setDiscretionary:v3];

  v9 = [(SUCorePolicy *)self downloadPreflightPolicy];
  [v9 setDiscretionary:v3];

  id v10 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
  [v10 setDiscretionary:v3];
}

- (void)setAllowsCellular:(BOOL)a3
{
  BOOL v3 = a3;
  self->_allowsCellular = a3;
  v5 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  [v5 setAllowsCellular:v3];

  v6 = [(SUCorePolicy *)self documentationScanPolicy];
  [v6 setAllowsCellular:v3];

  v7 = [(SUCorePolicy *)self documentationDownloadPolicy];
  [v7 setAllowsCellular:v3];

  v8 = [(SUCorePolicy *)self loadBrainPolicy];
  [v8 setAllowsCellular:v3];

  v9 = [(SUCorePolicy *)self downloadPreflightPolicy];
  [v9 setAllowsCellular:v3];

  id v10 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
  [v10 setAllowsCellular:v3];
}

- (id)constructSoftwareUpdateMAAssetQuery
{
  return [(SUCorePolicy *)self constructSoftwareUpdateMAAssetQueryWithPurpose:0];
}

- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F77DE8] sharedLogger];
  v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v85 = self;
    _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "[POLICY] constructSoftwareUpdateMAAssetQuery for policy: %@", buf, 0xCu);
  }

  v7 = [(SUCorePolicy *)self softwareUpdateAssetType];

  if (!v7)
  {
    v38 = [MEMORY[0x263F77DA8] sharedDiag];
    [v38 trackAnomaly:@"[POLICY] CONSTRUCT_SU_QUERY", @"softwareUpdateAssetType was unexpectedly nil, client is required to init with softwareUpdateAssetType", 8118, 0 forReason withResult withError];
    goto LABEL_32;
  }
  id v8 = objc_alloc(MEMORY[0x263F55950]);
  v9 = [(SUCorePolicy *)self softwareUpdateAssetType];
  v7 = (void *)[v8 initWithType:v9 andPurpose:v4];

  uint64_t v10 = [MEMORY[0x263EFF9D0] null];
  id v11 = [@"|" stringByAppendingFormat:@"purpose:%@|", v4];
  id v12 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  unint64_t v13 = 0x263F08000uLL;
  if (([v12 restrictToFull] & 1) != 0
    || ([(SUCorePolicy *)self prerequisiteProductVersion],
        (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
  }
  else
  {
    v15 = (void *)v14;
    v16 = [(SUCorePolicy *)self prerequisiteBuildVersion];

    if (v16)
    {
      v17 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
      int v18 = [v17 restrictToIncremental];

      v19 = (void *)MEMORY[0x263EFF980];
      uint64_t v20 = [(SUCorePolicy *)self prerequisiteBuildVersion];
      v21 = (void *)v20;
      if (v18)
      {
        v22 = objc_msgSend(v19, "arrayWithObjects:", v20, 0);
        [v7 addKeyValueArray:@"PrerequisiteBuild" with:v22];

        v23 = (void *)MEMORY[0x263EFF980];
        v24 = [(SUCorePolicy *)self prerequisiteProductVersion];
        v25 = objc_msgSend(v23, "arrayWithObjects:", v24, 0);
        [v7 addKeyValueArray:@"PrerequisiteOSVersion" with:v25];

        id v26 = [NSString alloc];
        uint64_t v27 = [(SUCorePolicy *)self prerequisiteBuildVersion];
        v28 = [(SUCorePolicy *)self prerequisiteProductVersion];
        uint64_t v29 = [v26 initWithFormat:@"prerequisite:(incr)%@:%@|", v27, v28];
      }
      else
      {
        v70 = objc_msgSend(v19, "arrayWithObjects:", v10, v20, 0);
        [v7 addKeyValueArray:@"PrerequisiteBuild" with:v70];

        v71 = (void *)MEMORY[0x263EFF980];
        v72 = [(SUCorePolicy *)self prerequisiteProductVersion];
        uint64_t v73 = objc_msgSend(v71, "arrayWithObjects:", v10, v72, 0);
        [v7 addKeyValueArray:@"PrerequisiteOSVersion" with:v73];

        id v74 = [NSString alloc];
        uint64_t v27 = [(SUCorePolicy *)self prerequisiteBuildVersion];
        v28 = [(SUCorePolicy *)self prerequisiteProductVersion];
        uint64_t v29 = [v74 initWithFormat:@"prerequisite:%@:%@|", v27, v28];
      }
      v75 = (void *)v29;
      v32 = [v11 stringByAppendingString:v29];

      unint64_t v13 = 0x263F08000;
      id v11 = (void *)v27;
      goto LABEL_11;
    }
  }
  v30 = [MEMORY[0x263EFF980] arrayWithObject:v10];
  [v7 addKeyValueArray:@"PrerequisiteBuild" with:v30];

  v31 = [MEMORY[0x263EFF980] arrayWithObject:v10];
  [v7 addKeyValueArray:@"PrerequisiteOSVersion" with:v31];

  v32 = [v11 stringByAppendingString:@"prerequisite:(full)|"];
LABEL_11:

  v33 = [(SUCorePolicy *)self hwModelStr];

  id v34 = objc_alloc(MEMORY[0x263EFF980]);
  v35 = v34;
  if (v33)
  {
    v36 = [(SUCorePolicy *)self hwModelStr];
    v37 = objc_msgSend(v35, "initWithObjects:", v10, v36, 0);
    [v7 addKeyValueArray:@"SupportedDeviceModels" with:v37];
  }
  else
  {
    v36 = objc_msgSend(v34, "initWithObjects:", v10, 0);
    [v7 addKeyValueArray:@"SupportedDeviceModels" with:v36];
  }

  id v39 = objc_alloc(*(Class *)(v13 + 2880));
  v40 = [(SUCorePolicy *)self hwModelStr];
  v41 = (void *)[v39 initWithFormat:@"hwModelStr:%@|", v40];
  v42 = [v32 stringByAppendingString:v41];

  v43 = [(SUCorePolicy *)self productType];

  if (v43)
  {
    id v44 = objc_alloc(MEMORY[0x263EFF980]);
    v45 = [(SUCorePolicy *)self productType];
    v46 = objc_msgSend(v44, "initWithObjects:", v10, v45, 0);
    [v7 addKeyValueArray:@"SupportedDevices" with:v46];
  }
  id v47 = objc_alloc(*(Class *)(v13 + 2880));
  v48 = [(SUCorePolicy *)self productType];
  uint64_t v49 = (void *)[v47 initWithFormat:@"productType:%@|", v48];
  v50 = [v42 stringByAppendingString:v49];

  uint64_t v51 = [(SUCorePolicy *)self releaseType];

  id v78 = v4;
  if (v51)
  {
    v52 = [(SUCorePolicy *)self releaseType];
    [v7 addKeyValuePair:@"ReleaseType" with:v52];

    id v53 = objc_alloc(*(Class *)(v13 + 2880));
    uint64_t v54 = [(SUCorePolicy *)self releaseType];
    uint64_t v55 = (void *)[v53 initWithFormat:@"releaseType:%@|", v54];
    uint64_t v56 = [v50 stringByAppendingString:v55];

    v50 = (void *)v54;
  }
  else
  {
    uint64_t v57 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v10, 0);
    [v7 addKeyValueArray:@"ReleaseType" with:v57];

    uint64_t v56 = [v50 stringByAppendingString:@"releaseType:customer|"];
  }
  v77 = (void *)v10;

  uint64_t v58 = [MEMORY[0x263F77DE8] sharedLogger];
  v59 = [v58 oslog];

  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v85 = (SUCorePolicy *)v56;
    _os_log_impl(&dword_20C8EA000, v59, OS_LOG_TYPE_DEFAULT, "[POLICY] querying SU metadata: %{public}@", buf, 0xCu);
  }
  uint64_t v76 = (void *)v56;

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v60 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v61 = [v60 countByEnumeratingWithState:&v79 objects:v83 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v62; ++i)
      {
        if (*(void *)v80 != v63) {
          objc_enumerationMutation(v60);
        }
        v65 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        uint64_t v66 = [MEMORY[0x263F77DE8] sharedLogger];
        v67 = [v66 oslog];

        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          v68 = [v65 extensionName];
          *(_DWORD *)buf = 138543362;
          uint64_t v85 = v68;
          _os_log_impl(&dword_20C8EA000, v67, OS_LOG_TYPE_DEFAULT, "[POLICY] extending query for extension %{public}@", buf, 0xCu);
        }
        [v65 extendSoftwareUpdateMAAssetQuery:v7];
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v79 objects:v83 count:16];
    }
    while (v62);
  }

  v38 = v77;
  id v4 = v78;
LABEL_32:

  return v7;
}

- (id)constructDocumentationMAAssetQueryWithDocID:(id)a3 purpose:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F77DE8] sharedLogger];
  v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = self;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] constructDocumentationMAAssetQueryWithDocID for policy: %{public}@", buf, 0xCu);
  }

  uint64_t v10 = [(SUCorePolicy *)self documentationAssetType];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F55950]);
    id v12 = [(SUCorePolicy *)self documentationAssetType];
    uint64_t v10 = (void *)[v11 initWithType:v12 andPurpose:v7];

    [v10 addKeyValuePair:@"SUDocumentationID" with:v6];
    unint64_t v13 = [(SUCorePolicy *)self deviceClass];
    [v10 addKeyValuePair:@"Device" with:v13];

    id v33 = v6;
    uint64_t v14 = [@"|" stringByAppendingFormat:@"documentationID:%@|", v6];
    v15 = [(SUCorePolicy *)self deviceClass];
    v16 = [v14 stringByAppendingFormat:@"deviceClass:%@|", v15];

    id v32 = v7;
    uint64_t v17 = [v16 stringByAppendingFormat:@"purpose:%@|", v7];

    int v18 = [MEMORY[0x263F77DE8] sharedLogger];
    v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = (SUCorePolicy *)v17;
      _os_log_impl(&dword_20C8EA000, v19, OS_LOG_TYPE_DEFAULT, "[POLICY] documentation asset query options: %{public}@", buf, 0xCu);
    }
    v31 = (void *)v17;

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v20 = [(SUCorePolicy *)self policyExtensions];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v26 = [MEMORY[0x263F77DE8] sharedLogger];
          uint64_t v27 = [v26 oslog];

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [v25 extensionName];
            *(_DWORD *)buf = 138543362;
            v40 = v28;
            _os_log_impl(&dword_20C8EA000, v27, OS_LOG_TYPE_DEFAULT, "[POLICY] extending documentation options for extension %{public}@", buf, 0xCu);
          }
          [v25 extendDocumentationMAAssetQuery:v10];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v22);
    }

    id v7 = v32;
    id v6 = v33;
    uint64_t v29 = v31;
  }
  else
  {
    uint64_t v29 = [MEMORY[0x263F77DA8] sharedDiag];
    [v29 trackAnomaly:@"[POLICY] CONSTRUCT_DOC_QUERY", @"documentationAssetType was unexpectedly nil, client is required to init with documentationAssetType", 8118, 0 forReason withResult withError];
  }

  return v10;
}

- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5
{
  uint64_t v138 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v9 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v10 = [v9 oslog];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v134 = self;
    _os_log_impl(&dword_20C8EA000, v10, OS_LOG_TYPE_DEFAULT, "[POLICY] selectSoftwareUpdatePrimaryAsset:secondaryAsset:fromAssetQuery for policy: %@", buf, 0xCu);
  }

  if (!a3)
  {
    uint64_t v14 = [MEMORY[0x263F77DA8] sharedDiag];
    v15 = v14;
    v16 = @"selectSoftwareUpdatePrimaryAsset called with unexpected nil primaryAsset param";
LABEL_13:
    [v14 trackError:@"[POLICY] SELECT_UPDATE_ASSET" forReason:v16 withResult:8102 withError:0];
    goto LABEL_93;
  }
  if (!a4)
  {
    uint64_t v14 = [MEMORY[0x263F77DA8] sharedDiag];
    v15 = v14;
    v16 = @"selectSoftwareUpdatePrimaryAsset called with unexpected nil secondaryAsset param";
    goto LABEL_13;
  }
  id v11 = [(SUCorePolicy *)self prerequisiteProductVersion];
  if (!v11)
  {
    uint64_t v17 = [(SUCorePolicy *)self prerequisiteBuildVersion];
    if (v17)
    {

LABEL_16:
      v15 = [MEMORY[0x263F77DA8] sharedDiag];
      id v18 = [NSString alloc];
      v19 = [(SUCorePolicy *)self prerequisiteProductVersion];
      uint64_t v20 = [(SUCorePolicy *)self prerequisiteBuildVersion];
      uint64_t v21 = (void *)[v18 initWithFormat:@"selectSoftwareUpdatePrimaryAsset called with unexpected nil/non-nil values for prerequisiteProductVersion (%@) and prerequisiteBuildVersion (%@)", v19, v20];
      [v15 trackError:@"[POLICY] SELECT_UPDATE_ASSET" forReason:v21 withResult:8116 withError:0];

      goto LABEL_93;
    }
  }
  id v12 = [(SUCorePolicy *)self prerequisiteProductVersion];
  if (v12)
  {
    unint64_t v13 = [(SUCorePolicy *)self prerequisiteBuildVersion];

    if (v11) {
    if (!v13)
    }
      goto LABEL_16;
  }
  else
  {

    if (v11) {
  }
    }
  v15 = objc_msgSend(v8, "SUCoreBorder_results");
  uint64_t v22 = [v15 count];
  uint64_t v23 = [MEMORY[0x263F77DE8] sharedLogger];
  v24 = [v23 oslog];

  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (!v22)
  {
    if (v25)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v24, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 SU query results (before filtering)", buf, 2u);
    }
    goto LABEL_92;
  }
  id v116 = v8;
  if (v25)
  {
    uint64_t v26 = [v15 count];
    *(_DWORD *)buf = 134217984;
    v134 = (SUCorePolicy *)v26;
    _os_log_impl(&dword_20C8EA000, v24, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu SU query results (before filtering)", buf, 0xCu);
  }
  v114 = a3;
  v115 = a4;

  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  v24 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v27 = [v24 countByEnumeratingWithState:&v128 objects:v137 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v129;
    do
    {
      uint64_t v30 = 0;
      v31 = v15;
      do
      {
        if (*(void *)v129 != v29) {
          objc_enumerationMutation(v24);
        }
        id v32 = *(void **)(*((void *)&v128 + 1) + 8 * v30);
        v15 = [v32 filterSoftwareUpdateAssetArray:v31];

        id v33 = [MEMORY[0x263F77DE8] sharedLogger];
        long long v34 = [v33 oslog];

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v35 = [v15 count];
          long long v36 = [v32 extensionName];
          *(_DWORD *)buf = 134218242;
          v134 = (SUCorePolicy *)v35;
          __int16 v135 = 2114;
          v136 = v36;
          _os_log_impl(&dword_20C8EA000, v34, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering from SUCorePolicyExtension %{public}@", buf, 0x16u);
        }
        if (![v15 count])
        {
          uint64_t v41 = [MEMORY[0x263F77DE8] sharedLogger];
          v42 = [v41 oslog];

          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20C8EA000, v42, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 assets found, stopping filtering early", buf, 2u);
          }

          id v8 = v116;
          goto LABEL_92;
        }
        ++v30;
        v31 = v15;
      }
      while (v28 != v30);
      uint64_t v28 = [v24 countByEnumeratingWithState:&v128 objects:v137 count:16];
    }
    while (v28);
  }

  uint64_t v37 = [(SUCorePolicy *)self prerequisiteProductVersion];
  if (!v37
    || (v38 = (void *)v37,
        [(SUCorePolicy *)self prerequisiteBuildVersion],
        id v39 = objc_claimAutoreleasedReturnValue(),
        v39,
        v38,
        !v39))
  {
    id v43 = v15;
    id v44 = [MEMORY[0x263F77DE8] sharedLogger];
    v45 = [v44 oslog];

    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v45, OS_LOG_TYPE_DEFAULT, "[POLICY] not filtering for productVersion or buildVersion in SUCorePolicy", buf, 2u);
    }
    uint64_t v110 = 0;
    goto LABEL_49;
  }
  v40 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  if ([v40 allowSameVersion])
  {

LABEL_45:
    id v47 = (void *)MEMORY[0x263F08A98];
    v127[0] = MEMORY[0x263EF8330];
    v127[1] = 3221225472;
    v127[2] = __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke;
    v127[3] = &unk_2640DC388;
    v127[4] = self;
    v48 = v127;
    goto LABEL_47;
  }
  BOOL v46 = [(SUCorePolicy *)self isSplatPolicy];

  if (v46) {
    goto LABEL_45;
  }
  id v47 = (void *)MEMORY[0x263F08A98];
  v126[0] = MEMORY[0x263EF8330];
  v126[1] = 3221225472;
  v126[2] = __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_594;
  v126[3] = &unk_2640DC388;
  v126[4] = self;
  v48 = v126;
LABEL_47:
  uint64_t v110 = [v47 predicateWithBlock:v48];
  objc_msgSend(v15, "filteredArrayUsingPredicate:");
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v49 = [MEMORY[0x263F77DE8] sharedLogger];
  v45 = [v49 oslog];

  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v50 = [v43 count];
    *(_DWORD *)buf = 134217984;
    v134 = (SUCorePolicy *)v50;
    _os_log_impl(&dword_20C8EA000, v45, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for productVersion in SUCorePolicy", buf, 0xCu);
  }
LABEL_49:

  id v111 = v43;
  uint64_t v51 = [v43 sortedArrayUsingComparator:&__block_literal_global_9];
  v52 = [v51 lastObject];
  id v53 = [v52 attributes];
  uint64_t v54 = [v53 safeStringForKey:@"OSVersion"];
  uint64_t v55 = +[SUCorePolicy _cleanProductVersion:v54];

  uint64_t v56 = (void *)MEMORY[0x263F08A98];
  v124[0] = MEMORY[0x263EF8330];
  uint64_t v57 = v51;
  v124[1] = 3221225472;
  v124[2] = __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2;
  v124[3] = &unk_2640DC388;
  id v58 = v55;
  id v125 = v58;
  v59 = [v56 predicateWithBlock:v124];
  uint64_t v60 = [v51 filteredArrayUsingPredicate:v59];

  uint64_t v61 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v62 = [v61 oslog];

  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v63 = [v60 count];
    *(_DWORD *)buf = 134217984;
    v134 = (SUCorePolicy *)v63;
    _os_log_impl(&dword_20C8EA000, v62, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for highestProductVersionAssets in SUCorePolicy", buf, 0xCu);
  }

  v113 = v60;
  if (![v60 count])
  {
    v94 = [MEMORY[0x263F77DE8] sharedLogger];
    v95 = [v94 oslog];

    objc_super v112 = v95;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v95, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 assets found", buf, 2u);
    }
    v24 = 0;
    id v96 = 0;
    v97 = 0;
    v98 = 0;
    id v8 = v116;
    v100 = (void *)v110;
    v99 = v111;
    goto LABEL_91;
  }
  v64 = [v60 sortedArrayUsingComparator:&__block_literal_global_600];
  v65 = [v64 lastObject];
  uint64_t v66 = [v65 attributes];
  v67 = [v66 objectForKeyedSubscript:@"Build"];

  v68 = (void *)MEMORY[0x263F08A98];
  v122[0] = MEMORY[0x263EF8330];
  v122[1] = 3221225472;
  v122[2] = __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2_601;
  v122[3] = &unk_2640DC388;
  id v69 = v67;
  id v123 = v69;
  v70 = [v68 predicateWithBlock:v122];
  v71 = [v64 filteredArrayUsingPredicate:v70];

  v72 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v73 = [v72 oslog];

  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v74 = [v71 count];
    *(_DWORD *)buf = 134217984;
    v134 = (SUCorePolicy *)v74;
    _os_log_impl(&dword_20C8EA000, v73, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for highestBuildVersionAssets in SUCorePolicy", buf, 0xCu);
  }

  id v108 = v69;
  long long v109 = v64;
  objc_super v112 = v71;
  if (![v71 count])
  {
    v101 = [MEMORY[0x263F77DE8] sharedLogger];
    v102 = [v101 oslog];

    id v8 = v116;
    v100 = (void *)v110;
    v99 = v111;
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v102, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 assets found", buf, 2u);
    }

    v24 = 0;
    id v96 = 0;
    goto LABEL_90;
  }
  v106 = v57;
  id v107 = v58;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  v75 = v71;
  uint64_t v76 = [v75 countByEnumeratingWithState:&v118 objects:v132 count:16];
  v117 = v75;
  if (!v76)
  {

    v92 = v114;
    v93 = v115;
LABEL_83:
    v103 = [MEMORY[0x263F77DE8] sharedLogger];
    v104 = [v103 oslog];

    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v104, OS_LOG_TYPE_DEFAULT, "[POLICY] query to locate update asset did not find pure partial or full; selecting first with highest build",
        buf,
        2u);
    }

    id v78 = [v117 firstObject];
    goto LABEL_88;
  }
  uint64_t v77 = v76;
  v105 = v15;
  id v78 = 0;
  id v79 = 0;
  uint64_t v80 = *(void *)v119;
  do
  {
    for (uint64_t i = 0; i != v77; ++i)
    {
      if (*(void *)v119 != v80) {
        objc_enumerationMutation(v75);
      }
      long long v82 = *(void **)(*((void *)&v118 + 1) + 8 * i);
      if (!v78)
      {
        uint64_t v85 = [*(id *)(*((void *)&v118 + 1) + 8 * i) attributes];
        uint64_t v86 = [v85 objectForKeyedSubscript:@"PrerequisiteBuild"];
        if (v86)
        {
          v87 = (void *)v86;
          v88 = [v82 attributes];
          v89 = [v88 objectForKeyedSubscript:@"PrerequisiteOSVersion"];

          v75 = v117;
          if (v89)
          {
            id v78 = v82;
            continue;
          }
        }
        else
        {
        }
      }
      if (!v79)
      {
        v83 = [v82 attributes];
        v84 = [v83 objectForKeyedSubscript:@"PrerequisiteBuild"];
        if (v84)
        {

          id v79 = 0;
        }
        else
        {
          v90 = [v82 attributes];
          v91 = [v90 objectForKeyedSubscript:@"PrerequisiteOSVersion"];

          if (v91) {
            id v79 = 0;
          }
          else {
            id v79 = v82;
          }
          v75 = v117;
        }
      }
    }
    uint64_t v77 = [v75 countByEnumeratingWithState:&v118 objects:v132 count:16];
  }
  while (v77);

  if (v78)
  {
    v15 = v105;
    uint64_t v57 = v106;
    v92 = v114;
    v93 = v115;
    goto LABEL_89;
  }
  v15 = v105;
  uint64_t v57 = v106;
  v92 = v114;
  v93 = v115;
  if (!v79) {
    goto LABEL_83;
  }
  id v78 = v79;
LABEL_88:
  id v79 = 0;
LABEL_89:
  v24 = v78;
  void *v92 = v24;
  id v96 = v79;
  id *v93 = v96;
  id v8 = v116;
  v100 = (void *)v110;
  v99 = v111;
  id v58 = v107;
LABEL_90:

  v98 = v108;
  v97 = v109;
LABEL_91:

LABEL_92:
LABEL_93:
}

BOOL __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 attributes];
  v5 = [v4 safeStringForKey:@"Build"];

  id v6 = [v3 attributes];

  id v7 = [v6 safeStringForKey:@"OSVersion"];
  id v8 = +[SUCoreDescriptor cleanProductVersion:v7];

  v9 = [*(id *)(a1 + 32) prerequisiteProductVersion];
  uint64_t v10 = [*(id *)(a1 + 32) prerequisiteBuildVersion];
  BOOL v11 = +[SUCorePolicy getAllowSameProductVersionPredicateResultWithAssetOSVersion:v8 assetBuildVersion:v5 prerequisiteProductVersion:v9 prerequisiteBuildVersion:v10];

  id v12 = [MEMORY[0x263F77DE8] sharedLogger];
  unint64_t v13 = [v12 oslog];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [*(id *)(a1 + 32) prerequisiteBuildVersion];
    uint64_t v15 = [*(id *)(a1 + 32) prerequisiteProductVersion];
    v16 = (void *)v15;
    int v19 = 138544386;
    uint64_t v17 = @"NO";
    uint64_t v20 = v5;
    if (v11) {
      uint64_t v17 = @"YES";
    }
    __int16 v21 = 2114;
    uint64_t v22 = v8;
    __int16 v23 = 2114;
    v24 = v14;
    __int16 v25 = 2114;
    uint64_t v26 = v15;
    __int16 v27 = 2114;
    uint64_t v28 = v17;
    _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering by product version (allow same), assetBuildVersion=%{public}@, assetOSVersion=%{public}@, prerequisiteBuildVersion=%{public}@, prerequisiteProductVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v19, 0x34u);
  }
  return v11;
}

BOOL __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_594(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 attributes];
  v5 = [v4 safeStringForKey:@"Build"];

  id v6 = [v3 attributes];

  id v7 = [v6 safeStringForKey:@"OSVersion"];
  id v8 = +[SUCoreDescriptor cleanProductVersion:v7];

  v9 = [*(id *)(a1 + 32) prerequisiteProductVersion];
  uint64_t v10 = [*(id *)(a1 + 32) prerequisiteBuildVersion];
  BOOL v11 = +[SUCorePolicy getNoAllowSameProductVersionPredicateResultWithAssetOSVersion:v8 assetBuildVersion:v5 prerequisiteProductVersion:v9 prerequisiteBuildVersion:v10];

  id v12 = [MEMORY[0x263F77DE8] sharedLogger];
  unint64_t v13 = [v12 oslog];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [*(id *)(a1 + 32) prerequisiteBuildVersion];
    uint64_t v15 = [*(id *)(a1 + 32) prerequisiteProductVersion];
    v16 = (void *)v15;
    int v19 = 138544386;
    uint64_t v17 = @"NO";
    uint64_t v20 = v5;
    if (v11) {
      uint64_t v17 = @"YES";
    }
    __int16 v21 = 2114;
    uint64_t v22 = v8;
    __int16 v23 = 2114;
    v24 = v14;
    __int16 v25 = 2114;
    uint64_t v26 = v15;
    __int16 v27 = 2114;
    uint64_t v28 = v17;
    _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering by product version, assetBuildVersion=%{public}@, assetOSVersion=%{public}@, prerequisiteBuildVersion=%{public}@, prerequisiteProductVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v19, 0x34u);
  }
  return v11;
}

uint64_t __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_595(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 attributes];
  id v6 = [v5 safeStringForKey:@"OSVersion"];
  id v7 = +[SUCorePolicy _cleanProductVersion:v6];

  id v8 = [v4 attributes];

  v9 = [v8 safeStringForKey:@"OSVersion"];
  uint64_t v10 = +[SUCorePolicy _cleanProductVersion:v9];

  uint64_t v11 = [v7 compare:v10 options:64];
  return v11;
}

uint64_t __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [a2 attributes];
  id v4 = [v3 safeStringForKey:@"OSVersion"];
  v5 = +[SUCorePolicy _cleanProductVersion:v4];

  uint64_t v6 = [MEMORY[0x263F77D78] stringIsEqual:v5 to:*(void *)(a1 + 32)];
  id v7 = [MEMORY[0x263F77DE8] sharedLogger];
  id v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = @"NO";
    int v12 = 138543874;
    if (v6) {
      uint64_t v10 = @"YES";
    }
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering highest product version, highestProductVersion=%{public}@, assetProductVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v12, 0x20u);
  }

  return v6;
}

uint64_t __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_598(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 attributes];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"Build"];

  id v7 = [v4 attributes];

  id v8 = [v7 objectForKeyedSubscript:@"Build"];

  uint64_t v9 = [v6 compare:v8 options:64];
  if (!v9) {
    uint64_t v9 = [v6 compare:v8];
  }

  return v9;
}

uint64_t __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2_601(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F77D78];
  v5 = [v3 attributes];
  uint64_t v6 = [v5 safeStringForKey:@"Build"];
  uint64_t v7 = [v4 stringIsEqual:v6 to:*(void *)(a1 + 32)];

  id v8 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [v3 attributes];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"Build"];
    uint64_t v13 = (void *)v12;
    __int16 v14 = @"NO";
    int v16 = 138543874;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    if (v7) {
      __int16 v14 = @"YES";
    }
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    __int16 v21 = v14;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering highest build version, highestBuildVersion=%{public}@, assetBuildVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v16, 0x20u);
  }
  return v7;
}

+ (BOOL)getAllowSameProductVersionPredicateResultWithAssetOSVersion:(id)a3 assetBuildVersion:(id)a4 prerequisiteProductVersion:(id)a5 prerequisiteBuildVersion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 compare:v11 options:64] == 1)
  {
    BOOL v13 = 1;
  }
  else if ([v9 compare:v11 options:64])
  {
    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = [v10 compare:v12 options:64] != -1;
  }

  return v13;
}

+ (BOOL)getNoAllowSameProductVersionPredicateResultWithAssetOSVersion:(id)a3 assetBuildVersion:(id)a4 prerequisiteProductVersion:(id)a5 prerequisiteBuildVersion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 compare:v11 options:64] == 1)
  {
    BOOL v13 = 1;
  }
  else if ([v9 compare:v11 options:64])
  {
    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = [v10 compare:v12 options:64] == 1;
  }

  return v13;
}

- (void)selectSoftwareUpdateMajorPrimaryAsset:(id *)a3 majorSecondaryAsset:(id *)a4 minorPrimaryAsset:(id *)a5 minorSecondaryAsset:(id *)a6 fromAssetQuery:(id)a7
{
  uint64_t v182 = *MEMORY[0x263EF8340];
  id v12 = a7;
  BOOL v13 = [MEMORY[0x263F77DE8] sharedLogger];
  __int16 v14 = [v13 oslog];

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v178 = self;
    _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "[POLICY] Select major/minor software update for policy: %@", buf, 0xCu);
  }

  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (!a3)
  {
    __int16 v18 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v19 = v18;
    __int16 v20 = @"Select major/minor software update called with unexpected nil majorPrimaryAsset param";
LABEL_25:
    [v18 trackError:@"[POLICY] SELECT_UPDATE_ASSET" forReason:v20 withResult:8102 withError:0];
    goto LABEL_26;
  }
  if (!a4)
  {
    __int16 v18 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v19 = v18;
    __int16 v20 = @"Select major/minor software update called with unexpected nil majorSecondaryAsset param";
    goto LABEL_25;
  }
  if (!a5)
  {
    __int16 v18 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v19 = v18;
    __int16 v20 = @"Select major/minor software update called with unexpected nil minorPrimaryAsset param";
    goto LABEL_25;
  }
  if (!a6)
  {
    __int16 v18 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v19 = v18;
    __int16 v20 = @"Select major/minor software update called with unexpected nil minorSecondaryAsset param";
    goto LABEL_25;
  }
  uint64_t v15 = [(SUCorePolicy *)self prerequisiteProductVersion];
  if (!v15)
  {
    __int16 v21 = [(SUCorePolicy *)self prerequisiteBuildVersion];
    if (v21)
    {

LABEL_29:
      uint64_t v19 = [MEMORY[0x263F77DA8] sharedDiag];
      id v22 = [NSString alloc];
      __int16 v23 = [(SUCorePolicy *)self prerequisiteProductVersion];
      v24 = [(SUCorePolicy *)self prerequisiteBuildVersion];
      __int16 v25 = (void *)[v22 initWithFormat:@"Select major/minor software update called with unexpected nil/non-nil values for prerequisiteProductVersion (%@) and prerequisiteBuildVersion (%@)", v23, v24];
      [v19 trackError:@"[POLICY] SELECT_UPDATE_ASSET" forReason:v25 withResult:8116 withError:0];

      goto LABEL_26;
    }
  }
  v151 = a3;
  int v16 = [(SUCorePolicy *)self prerequisiteProductVersion];
  if (v16)
  {
    uint64_t v17 = [(SUCorePolicy *)self prerequisiteBuildVersion];

    if (v15) {
    if (!v17)
    }
      goto LABEL_29;
  }
  else
  {

    if (v15) {
  }
    }
  id v26 = objc_alloc(MEMORY[0x263F77E18]);
  __int16 v27 = [(SUCorePolicy *)self prerequisiteRestoreVersion];
  uint64_t v19 = (void *)[v26 initWithRestoreVersion:v27];

  uint64_t v28 = [(SUCorePolicy *)self prerequisiteRestoreVersion];

  if (!v28 || !v19)
  {
    v45 = [MEMORY[0x263F77DA8] sharedDiag];
    [v45 trackError:@"[POLICY] SELECT_UPDATE_ASSET" forReason:@"Select major/minor software update called with unexpected nil prerequisiteRestoreVersion property or inability to parse version string" withResult:8116 withError:0];
    goto LABEL_129;
  }
  v149 = self;
  v152 = objc_msgSend(v12, "SUCoreBorder_results");
  uint64_t v29 = [v152 count];
  uint64_t v30 = [MEMORY[0x263F77DE8] sharedLogger];
  v31 = [v30 oslog];

  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
  if (!v29)
  {
    if (v32)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v31, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 SU query results (before filtering)", buf, 2u);
    }
    goto LABEL_128;
  }
  if (v32)
  {
    uint64_t v33 = [v152 count];
    *(_DWORD *)buf = 134217984;
    v178 = (SUCorePolicy *)v33;
    _os_log_impl(&dword_20C8EA000, v31, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu SU query results (before filtering)", buf, 0xCu);
  }
  v144 = a4;
  v145 = a5;
  v146 = a6;
  id v147 = v12;
  v148 = v19;

  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  v31 = [(SUCorePolicy *)v149 policyExtensions];
  uint64_t v34 = [v31 countByEnumeratingWithState:&v171 objects:v181 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v172;
    uint64_t v37 = v152;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v172 != v36) {
          objc_enumerationMutation(v31);
        }
        id v39 = *(void **)(*((void *)&v171 + 1) + 8 * i);
        v40 = [v39 filterSoftwareUpdateAssetArray:v37];

        uint64_t v41 = [MEMORY[0x263F77DE8] sharedLogger];
        v42 = [v41 oslog];

        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = [v40 count];
          id v44 = [v39 extensionName];
          *(_DWORD *)buf = 134218242;
          v178 = (SUCorePolicy *)v43;
          __int16 v179 = 2114;
          v180 = v44;
          _os_log_impl(&dword_20C8EA000, v42, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering from SUCorePolicyExtension %{public}@", buf, 0x16u);
        }
        if (![v40 count])
        {
          v152 = v40;
          BOOL v46 = [MEMORY[0x263F77DE8] sharedLogger];
          id v47 = [v46 oslog];

          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20C8EA000, v47, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 assets found, stopping filtering early", buf, 2u);
          }

          goto LABEL_127;
        }
        uint64_t v37 = v40;
      }
      uint64_t v35 = [v31 countByEnumeratingWithState:&v171 objects:v181 count:16];
      uint64_t v37 = v40;
    }
    while (v35);
  }
  else
  {
    uint64_t v37 = v152;
  }
  v152 = v37;

  v48 = v149;
  uint64_t v49 = [(SUCorePolicy *)v149 softwareUpdateScanPolicy];
  int v50 = [v49 shouldScanForMinorUpdates];

  if (!v50)
  {
    id v70 = 0;
    id v143 = 0;
    uint64_t v85 = v148;
    goto LABEL_90;
  }
  uint64_t v51 = (void *)MEMORY[0x263F08A98];
  v168[0] = MEMORY[0x263EF8330];
  v168[1] = 3221225472;
  v168[2] = __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke;
  v168[3] = &unk_2640DDF60;
  id v169 = v148;
  v170 = v149;
  v52 = [v51 predicateWithBlock:v168];
  id v53 = [v37 filteredArrayUsingPredicate:v52];

  uint64_t v54 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v55 = [v54 oslog];

  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v56 = [v53 count];
    *(_DWORD *)buf = 134217984;
    v178 = (SUCorePolicy *)v56;
    _os_log_impl(&dword_20C8EA000, v55, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for minor assets in SUCorePolicy", buf, 0xCu);
  }

  uint64_t v57 = [v53 sortedArrayUsingComparator:&__block_literal_global_623];
  id v58 = [v57 lastObject];
  v59 = [v58 attributes];
  uint64_t v60 = [v59 safeStringForKey:@"RestoreVersion"];

  uint64_t v61 = (void *)MEMORY[0x263F08A98];
  v166[0] = MEMORY[0x263EF8330];
  v166[1] = 3221225472;
  v166[2] = __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_2;
  v166[3] = &unk_2640DC388;
  id v142 = v60;
  id v167 = v142;
  uint64_t v62 = [v61 predicateWithBlock:v166];
  uint64_t v63 = [v57 filteredArrayUsingPredicate:v62];

  v64 = [MEMORY[0x263F77DE8] sharedLogger];
  v65 = [v64 oslog];

  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v66 = [v63 count];
    *(_DWORD *)buf = 134217984;
    v178 = (SUCorePolicy *)v66;
    _os_log_impl(&dword_20C8EA000, v65, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for highest minor assets in SUCorePolicy", buf, 0xCu);
  }

  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  id v67 = v63;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v162 objects:v176 count:16];
  v153 = v67;
  if (!v68)
  {

    uint64_t v85 = v148;
    uint64_t v86 = v142;
LABEL_83:
    v87 = [MEMORY[0x263F77DE8] sharedLogger];
    v88 = [v87 oslog];

    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v88, OS_LOG_TYPE_DEFAULT, "[POLICY] query to locate minor update asset did not find pure partial or full; selecting first with highest build",
        buf,
        2u);
    }

    v89 = v153;
    id v70 = [v153 firstObject];
    id v71 = 0;
    goto LABEL_89;
  }
  uint64_t v69 = v68;
  uint64_t v138 = v57;
  v140 = v53;
  id v70 = 0;
  id v71 = 0;
  uint64_t v72 = *(void *)v163;
  do
  {
    uint64_t v73 = 0;
    do
    {
      if (*(void *)v163 != v72) {
        objc_enumerationMutation(v67);
      }
      uint64_t v74 = *(void **)(*((void *)&v162 + 1) + 8 * v73);
      if (!v70)
      {
        uint64_t v77 = [*(id *)(*((void *)&v162 + 1) + 8 * v73) attributes];
        uint64_t v78 = [v77 safeStringForKey:@"PrerequisiteBuild"];
        if (v78)
        {
          id v79 = (void *)v78;
          uint64_t v80 = [v74 attributes];
          long long v81 = [v80 safeStringForKey:@"PrerequisiteOSVersion"];

          id v70 = 0;
          id v67 = v153;

          if (v81)
          {
            id v70 = v74;
            goto LABEL_75;
          }
        }
        else
        {
        }
      }
      if (v71) {
        goto LABEL_75;
      }
      v75 = [v74 attributes];
      uint64_t v76 = [v75 safeStringForKey:@"PrerequisiteBuild"];
      if (v76)
      {

LABEL_74:
        id v71 = 0;
        goto LABEL_75;
      }
      long long v82 = [v74 attributes];
      v83 = [v82 safeStringForKey:@"PrerequisiteOSVersion"];

      if (v83) {
        goto LABEL_74;
      }
      id v71 = v74;
LABEL_75:
      ++v73;
    }
    while (v69 != v73);
    uint64_t v84 = [v67 countByEnumeratingWithState:&v162 objects:v176 count:16];
    uint64_t v69 = v84;
  }
  while (v84);

  v48 = v149;
  uint64_t v57 = v138;
  id v53 = v140;
  if (v70)
  {
    uint64_t v85 = v148;
    uint64_t v86 = v142;
    goto LABEL_88;
  }
  uint64_t v85 = v148;
  uint64_t v86 = v142;
  if (!v71) {
    goto LABEL_83;
  }
  id v70 = v71;
  id v71 = 0;
LABEL_88:
  v89 = v153;
LABEL_89:
  id v143 = v71;

LABEL_90:
  v90 = [(SUCorePolicy *)v48 softwareUpdateScanPolicy];
  int v91 = [v90 shouldScanForMajorUpdates];

  id v150 = v70;
  if (!v91)
  {
    v127 = [MEMORY[0x263F77DE8] sharedLogger];
    long long v128 = [v127 oslog];

    if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
    {
      long long v129 = [(SUCorePolicy *)v48 softwareUpdateScanPolicy];
      +[SUCorePolicySoftwareUpdateScan nameForScanUpdateType:](SUCorePolicySoftwareUpdateScan, "nameForScanUpdateType:", [v129 scanUpdateType]);
      long long v130 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v178 = v130;
      _os_log_impl(&dword_20C8EA000, v128, OS_LOG_TYPE_DEFAULT, "[POLICY] not scanning for major software update assets as scan update type is %{public}@", buf, 0xCu);
    }
    id v111 = 0;
    id v112 = 0;
    long long v131 = v151;
    goto LABEL_126;
  }
  v92 = (void *)MEMORY[0x263F08A98];
  v160[0] = MEMORY[0x263EF8330];
  v160[1] = 3221225472;
  v160[2] = __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_624;
  v160[3] = &unk_2640DC388;
  v161 = v85;
  v93 = [v92 predicateWithBlock:v160];
  v94 = [v152 filteredArrayUsingPredicate:v93];

  v95 = [MEMORY[0x263F77DE8] sharedLogger];
  id v96 = [v95 oslog];

  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v97 = [v94 count];
    *(_DWORD *)buf = 134217984;
    v178 = (SUCorePolicy *)v97;
    _os_log_impl(&dword_20C8EA000, v96, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for major assets in SUCorePolicy", buf, 0xCu);
  }

  v139 = v94;
  v98 = [v94 sortedArrayUsingComparator:&__block_literal_global_627];
  v99 = [v98 lastObject];
  v100 = [v99 attributes];
  v101 = [v100 safeStringForKey:@"RestoreVersion"];

  v102 = (void *)MEMORY[0x263F08A98];
  v158[0] = MEMORY[0x263EF8330];
  v158[1] = 3221225472;
  v158[2] = __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_2_628;
  v158[3] = &unk_2640DC388;
  id v141 = v101;
  id v159 = v141;
  v103 = [v102 predicateWithBlock:v158];
  v137 = v98;
  v104 = [v98 filteredArrayUsingPredicate:v103];

  v105 = [MEMORY[0x263F77DE8] sharedLogger];
  v106 = [v105 oslog];

  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v107 = [v104 count];
    *(_DWORD *)buf = 134217984;
    v178 = (SUCorePolicy *)v107;
    _os_log_impl(&dword_20C8EA000, v106, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for highest major assets in SUCorePolicy", buf, 0xCu);
  }

  long long v156 = 0u;
  long long v157 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  id v108 = v104;
  uint64_t v109 = [v108 countByEnumeratingWithState:&v154 objects:v175 count:16];
  if (!v109)
  {

    goto LABEL_121;
  }
  uint64_t v110 = v109;
  id v111 = 0;
  id v112 = 0;
  uint64_t v113 = *(void *)v155;
  while (2)
  {
    uint64_t v114 = 0;
    while (2)
    {
      if (*(void *)v155 != v113) {
        objc_enumerationMutation(v108);
      }
      v115 = *(void **)(*((void *)&v154 + 1) + 8 * v114);
      if (v111)
      {
LABEL_101:
        if (!v112)
        {
          id v116 = [v115 attributes];
          v117 = [v116 safeStringForKey:@"PrerequisiteBuild"];
          if (v117)
          {

            goto LABEL_109;
          }
          v124 = [v115 attributes];
          id v125 = [v124 safeStringForKey:@"PrerequisiteOSVersion"];

          if (v125) {
LABEL_109:
          }
            id v112 = 0;
          else {
            id v112 = v115;
          }
        }
      }
      else
      {
        long long v118 = [*(id *)(*((void *)&v154 + 1) + 8 * v114) attributes];
        uint64_t v119 = [v118 safeStringForKey:@"PrerequisiteBuild"];
        if (!v119)
        {

          goto LABEL_101;
        }
        long long v120 = (void *)v119;
        [v115 attributes];
        v122 = id v121 = v108;
        id v123 = [v122 safeStringForKey:@"PrerequisiteOSVersion"];

        id v108 = v121;
        id v111 = 0;

        if (!v123) {
          goto LABEL_101;
        }
        id v111 = v115;
      }
      if (v110 != ++v114) {
        continue;
      }
      break;
    }
    uint64_t v126 = [v108 countByEnumeratingWithState:&v154 objects:v175 count:16];
    uint64_t v110 = v126;
    if (v126) {
      continue;
    }
    break;
  }

  if (!v111)
  {
    if (v112)
    {
      id v111 = v112;
      goto LABEL_124;
    }
LABEL_121:
    v132 = [MEMORY[0x263F77DE8] sharedLogger];
    v133 = [v132 oslog];

    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v133, OS_LOG_TYPE_DEFAULT, "[POLICY] query to locate major update asset did not find pure partial or full; selecting first with highest build",
        buf,
        2u);
    }

    id v111 = [v108 firstObject];
LABEL_124:
    id v112 = 0;
  }
  long long v131 = v151;

  long long v128 = v161;
LABEL_126:

  id v134 = v111;
  *long long v131 = v134;
  id v135 = v112;
  id *v144 = v135;
  v31 = v150;
  id *v145 = v31;
  id v136 = v143;
  id *v146 = v136;

LABEL_127:
  id v12 = v147;
  uint64_t v19 = v148;
LABEL_128:

  v45 = v152;
LABEL_129:

LABEL_26:
}

BOOL __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [a2 attributes];
  id v4 = [v3 safeStringForKey:@"RestoreVersion"];

  v5 = (void *)[objc_alloc(MEMORY[0x263F77E18]) initWithRestoreVersion:v4];
  if ([*(id *)(a1 + 32) isComparable:v5]
    && (uint64_t v6 = [*(id *)(a1 + 32) majorVersion], v6 == objc_msgSend(v5, "majorVersion")))
  {
    uint64_t v7 = [*(id *)(a1 + 32) compare:v5];
    id v8 = [*(id *)(a1 + 40) softwareUpdateScanPolicy];
    int v9 = [v8 allowSameVersion];

    if (v9) {
      BOOL v10 = (unint64_t)(v7 + 1) < 2;
    }
    else {
      BOOL v10 = v7 == -1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  id v11 = [MEMORY[0x263F77DE8] sharedLogger];
  id v12 = [v11 oslog];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v13 = [*(id *)(a1 + 40) softwareUpdateScanPolicy];
    if ([v13 allowSameVersion]) {
      __int16 v14 = @"YES";
    }
    else {
      __int16 v14 = @"NO";
    }
    uint64_t v15 = [*(id *)(a1 + 32) summary];
    uint64_t v16 = [v5 summary];
    uint64_t v17 = (void *)v16;
    int v20 = 138544130;
    if (v10) {
      __int16 v18 = @"YES";
    }
    else {
      __int16 v18 = @"NO";
    }
    __int16 v21 = v14;
    __int16 v22 = 2114;
    __int16 v23 = v15;
    __int16 v24 = 2114;
    uint64_t v25 = v16;
    __int16 v26 = 2114;
    __int16 v27 = v18;
    _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering for minor assets only: allowSame:%{public}@ currentRestoreVersion=%{public}@ assetRestoreVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v20, 0x2Au);
  }
  return v10;
}

uint64_t __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_621(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 attributes];
  uint64_t v6 = [v5 safeStringForKey:@"RestoreVersion"];

  uint64_t v7 = [v4 attributes];

  id v8 = [v7 safeStringForKey:@"RestoreVersion"];

  int v9 = (void *)[objc_alloc(MEMORY[0x263F77E18]) initWithRestoreVersion:v6];
  BOOL v10 = (void *)[objc_alloc(MEMORY[0x263F77E18]) initWithRestoreVersion:v8];
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

uint64_t __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [a2 attributes];
  id v4 = [v3 safeStringForKey:@"RestoreVersion"];

  uint64_t v5 = [MEMORY[0x263F77D78] stringIsEqual:*(void *)(a1 + 32) to:v4];
  uint64_t v6 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = @"NO";
    int v11 = 138543874;
    if (v5) {
      int v9 = @"YES";
    }
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    __int16 v14 = v4;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering highest minor restore version, highestMinorRestoreVersion=%{public}@, assetRestoreVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v11, 0x20u);
  }

  return v5;
}

BOOL __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_624(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [a2 attributes];
  id v4 = [v3 safeStringForKey:@"RestoreVersion"];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F77E18]) initWithRestoreVersion:v4];
  if ([*(id *)(a1 + 32) isComparable:v5])
  {
    uint64_t v6 = [*(id *)(a1 + 32) majorVersion];
    BOOL v7 = v6 < [v5 majorVersion];
  }
  else
  {
    BOOL v7 = 0;
  }
  uint64_t v8 = [MEMORY[0x263F77DE8] sharedLogger];
  int v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = [*(id *)(a1 + 32) summary];
    uint64_t v11 = [v5 summary];
    uint64_t v12 = (void *)v11;
    __int16 v13 = @"NO";
    int v15 = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    if (v7) {
      __int16 v13 = @"YES";
    }
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    int v20 = v13;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering for major assets only, currentRestoreVersion=%{public}@, assetRestoreVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v15, 0x20u);
  }
  return v7;
}

uint64_t __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_625(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 attributes];
  uint64_t v6 = [v5 safeStringForKey:@"RestoreVersion"];

  BOOL v7 = [v4 attributes];

  uint64_t v8 = [v7 safeStringForKey:@"RestoreVersion"];

  int v9 = (void *)[objc_alloc(MEMORY[0x263F77E18]) initWithRestoreVersion:v6];
  BOOL v10 = (void *)[objc_alloc(MEMORY[0x263F77E18]) initWithRestoreVersion:v8];
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

uint64_t __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_2_628(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [a2 attributes];
  id v4 = [v3 safeStringForKey:@"RestoreVersion"];

  uint64_t v5 = [MEMORY[0x263F77D78] stringIsEqual:*(void *)(a1 + 32) to:v4];
  uint64_t v6 = [MEMORY[0x263F77DE8] sharedLogger];
  BOOL v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = @"NO";
    int v11 = 138543874;
    if (v5) {
      int v9 = @"YES";
    }
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    __int16 v14 = v4;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering highest major restore version, highestMajorRestoreVersion=%{public}@, assetRestoreVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v11, 0x20u);
  }

  return v5;
}

- (void)selectDocumentationAsset:(id *)a3 fromAssetQuery:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = self;
    _os_log_impl(&dword_20C8EA000, v8, OS_LOG_TYPE_DEFAULT, "[POLICY] selectDocumentationAsset:fromAssetQuery for policy: %@", buf, 0xCu);
  }

  if (!a3)
  {
    int v9 = [MEMORY[0x263F77DA8] sharedDiag];
    [v9 trackError:@"[POLICY] SELECT_DOC_ASSET" forReason:@"selectDocumentationAsset called with unexpected nil docAsset param" withResult:8102 withError:0];
    goto LABEL_27;
  }
  int v9 = objc_msgSend(v6, "SUCoreBorder_results");
  if (![v9 count])
  {
    uint64_t v25 = [MEMORY[0x263F77DE8] sharedLogger];
    __int16 v26 = [v25 oslog];

    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
LABEL_26:

      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    __int16 v27 = "[POLICY] 0 doc query results (before filtering)";
LABEL_25:
    _os_log_impl(&dword_20C8EA000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
    goto LABEL_26;
  }
  uint64_t v30 = a3;
  id v31 = v6;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v29 = self;
  BOOL v10 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    while (2)
    {
      uint64_t v14 = 0;
      __int16 v15 = v9;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * v14);
        int v9 = [v16 filterDocumentationAssetArray:v15];

        uint64_t v17 = [MEMORY[0x263F77DE8] sharedLogger];
        uint64_t v18 = [v17 oslog];

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [v9 count];
          int v20 = [v16 extensionName];
          *(_DWORD *)buf = 134218242;
          uint64_t v37 = (SUCorePolicy *)v19;
          __int16 v38 = 2114;
          id v39 = v20;
          _os_log_impl(&dword_20C8EA000, v18, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu doc assets left after filtering from SUCorePolicyExtension %{public}@", buf, 0x16u);
        }
        if (![v9 count])
        {
          __int16 v23 = [MEMORY[0x263F77DE8] sharedLogger];
          __int16 v24 = [v23 oslog];

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20C8EA000, v24, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 doc assets found, stopping filtering early", buf, 2u);
          }

          id v6 = v31;
          goto LABEL_27;
        }
        ++v14;
        __int16 v15 = v9;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if ((unint64_t)[v9 count] >= 2)
  {
    uint64_t v21 = [MEMORY[0x263F77DA8] sharedDiag];
    __int16 v22 = (void *)[[NSString alloc] initWithFormat:@"%@ doc query with %lu results when only 1 expected", v29, objc_msgSend(v9, "count")];
    [v21 trackAnomaly:@"[POLICY] SELECT_DOC_ASSET" forReason:v22 withResult:8116 withError:0];
  }
  id v6 = v31;
  if (![v9 count])
  {
    uint64_t v28 = [MEMORY[0x263F77DE8] sharedLogger];
    __int16 v26 = [v28 oslog];

    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    __int16 v27 = "[POLICY] 0 doc assets found";
    goto LABEL_25;
  }
  id *v30 = [v9 objectAtIndexedSubscript:0];
LABEL_27:
}

- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4
{
  uint64_t v194 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F77DE8] sharedLogger];
  int v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v191 = self;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] constructMASoftwareUpdateCatalogDownloadOptionsWithUUID for policy: %@", buf, 0xCu);
  }

  id v10 = objc_alloc_init(MEMORY[0x263F559C0]);
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v18 = (void *)[[NSString alloc] initWithFormat:@"%@ unable to create software update catalog download options", self];
    [v11 trackError:@"SU_CATALOG_DOWNLOAD_OPTIONS" forReason:v18 withResult:8100 withError:0];
LABEL_38:

    long long v82 = @"|";
    v83 = v11;
    uint64_t v11 = 0;
    goto LABEL_84;
  }
  uint64_t v11 = v10;
  uint64_t v12 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  uint64_t v13 = [v12 additionalServerParams];

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v15 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
    uint64_t v16 = [v15 additionalServerParams];
    uint64_t v17 = (void *)[v14 initWithDictionary:v16];
    [v11 setAdditionalServerParams:v17];
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v11 setAdditionalServerParams:v15];
  }

  uint64_t v19 = [v11 additionalServerParams];

  if (!v19)
  {
    uint64_t v18 = [MEMORY[0x263F77DA8] sharedDiag];
    long long v81 = (void *)[[NSString alloc] initWithFormat:@"%@ unable to create software update catalog download options additional server params", self];
    [v18 trackError:@"SU_CATALOG_DOWNLOAD_OPTIONS" forReason:v81 withResult:8100 withError:0];

    goto LABEL_38;
  }
  int v20 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  __int16 v21 = [v20 specifiedFields];

  if ((v21 & 0x100) != 0)
  {
    __int16 v22 = [v11 additionalServerParams];
    __int16 v23 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
    __int16 v24 = [v23 sessionId];
    [v22 setSafeObject:v24 forKey:@"SessionId"];
  }
  uint64_t v25 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  __int16 v26 = [v25 specifiedFields];

  if ((v26 & 0x200) != 0)
  {
    __int16 v27 = [v11 additionalServerParams];
    uint64_t v28 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
    uint64_t v29 = [v28 rampingScanType];
    [v27 setSafeObject:v29 forKey:@"DeviceCheck"];
  }
  [v11 setSessionId:v6];
  id v30 = [NSString alloc];
  id v31 = [v11 sessionId];
  uint64_t v32 = [v30 initWithFormat:@"scanUUID:%@|", v31];
  long long v33 = [@"|" stringByAppendingString:v32];

  long long v34 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  objc_msgSend(v11, "setDiscretionary:", objc_msgSend(v34, "discretionary"));

  long long v35 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  LOWORD(v32) = [v35 specifiedFields];

  if ((v32 & 0x1000) != 0)
  {
    uint64_t v36 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
    objc_msgSend(v11, "setDisableUI:", objc_msgSend(v36, "disableUI"));
  }
  uint64_t v37 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  char v38 = [v37 specifiedFields];

  if ((v38 & 2) != 0)
  {
    id v39 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
    objc_msgSend(v11, "setAllowsCellularAccess:", objc_msgSend(v39, "allowsCellular"));
  }
  v40 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  char v41 = [v40 specifiedFields];

  if ((v41 & 8) != 0)
  {
    v42 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
    objc_msgSend(v11, "setRequiresPowerPluggedIn:", objc_msgSend(v42, "requiresPowerPluggedIn"));
  }
  uint64_t v43 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  char v44 = [v43 specifiedFields];

  if ((v44 & 0x40) != 0)
  {
    v45 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
    objc_msgSend(v11, "setAllowSameVersion:", objc_msgSend(v45, "allowSameVersion"));
  }
  id v184 = v6;
  BOOL v46 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  __int16 v47 = [v46 specifiedFields];

  if ((v47 & 0x800) != 0)
  {
    v48 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
    objc_msgSend(v11, "setLiveServerCatalogOnly:", objc_msgSend(v48, "liveServerCatalogOnly"));
  }
  uint64_t v49 = [(SUCorePolicy *)self prerequisiteProductVersion];
  [v11 setPrerequisiteProductVersion:v49];

  int v50 = [(SUCorePolicy *)self prerequisiteBuildVersion];
  [v11 setPrerequisiteBuildVersion:v50];

  uint64_t v51 = [(SUCorePolicy *)self releaseType];
  [v11 setPrerequisiteReleaseType:v51];

  v52 = [v11 additionalServerParams];
  id v53 = [(SUCorePolicy *)self prerequisiteRestoreVersion];
  [v52 setSafeObject:v53 forKey:@"RestoreVersion"];

  uint64_t v54 = [v11 additionalServerParams];
  uint64_t v55 = [(SUCorePolicy *)self targetRestoreVersion];
  [v54 setSafeObject:v55 forKey:@"TargetRestoreVersion"];

  uint64_t v56 = [v11 additionalServerParams];
  uint64_t v57 = [(SUCorePolicy *)self installedSFRVersion];
  [v56 setSafeObject:v57 forKey:@"InstalledSFRVersion"];

  id v58 = [v11 additionalServerParams];
  v59 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  if ([v59 allowSameVersion]) {
    uint64_t v60 = @"true";
  }
  else {
    uint64_t v60 = @"false";
  }
  [v58 setSafeObject:v60 forKey:@"AllowSameBuildVersion"];

  uint64_t v61 = [v11 additionalServerParams];
  uint64_t v62 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  if ([v62 allowSameVersion]) {
    uint64_t v63 = @"true";
  }
  else {
    uint64_t v63 = @"false";
  }
  [v61 setSafeObject:v63 forKey:@"AllowSameRestoreVersion"];

  v64 = [v11 additionalServerParams];
  v65 = [(SUCorePolicy *)self productType];
  [v64 setSafeObject:v65 forKey:@"ProductType"];

  uint64_t v66 = [v11 additionalServerParams];
  id v67 = [(SUCorePolicy *)self hwModelStr];
  [v66 setSafeObject:v67 forKey:@"HWModelStr"];

  uint64_t v68 = [v11 additionalServerParams];
  uint64_t v69 = [(SUCorePolicy *)self deviceClass];
  [v68 setSafeObject:v69 forKey:@"DeviceName"];

  id v70 = [v11 additionalServerParams];
  uint64_t v71 = [(SUCorePolicy *)self prerequisiteBuildVersion];
  [v70 setSafeObject:v71 forKey:@"BuildVersion"];

  uint64_t v72 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  LOBYTE(v71) = [v72 specifiedFields];

  if ((v71 & 0x80) != 0)
  {
    v75 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
    objc_msgSend(v11, "setTimeoutIntervalForResource:", (int)-[NSObject downloadTimeoutSecs](v75, "downloadTimeoutSecs"));
  }
  else
  {
    if ([(SUCorePolicy *)self isInternal]) {
      uint64_t v73 = 60;
    }
    else {
      uint64_t v73 = 30;
    }
    [v11 setTimeoutIntervalForResource:v73];
    uint64_t v74 = [MEMORY[0x263F77DE8] sharedLogger];
    v75 = [v74 oslog];

    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v76 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
      int v77 = [v76 downloadTimeoutSecs];
      uint64_t v78 = [v11 timeoutIntervalForResource];
      BOOL v79 = [(SUCorePolicy *)self isInternal];
      *(_DWORD *)buf = 67109634;
      uint64_t v80 = @"YES";
      if (!v79) {
        uint64_t v80 = @"NO";
      }
      *(_DWORD *)v191 = v77;
      *(_WORD *)&v191[4] = 2048;
      *(void *)&v191[6] = v78;
      __int16 v192 = 2114;
      v193 = v80;
      _os_log_impl(&dword_20C8EA000, v75, OS_LOG_TYPE_DEFAULT, "[POLICY] downloadTimeoutSecs is %d, setting timeoutIntervalForResource to %ld (isInternal=%{public}@)", buf, 0x1Cu);
    }
  }

  uint64_t v84 = [(SUCorePolicy *)self downloadAuthorizationHeader];

  if (v84)
  {
    uint64_t v85 = [(SUCorePolicy *)self downloadAuthorizationHeader];
    [v11 setDownloadAuthorizationHeader:v85];
  }
  if (v7)
  {
    uint64_t v86 = (void *)[v7 copy];
    [v11 setLiveAssetAudienceUUID:v86];

    v87 = (void *)[v7 copy];
    [v11 setPurpose:v87];

    v88 = [v11 liveAssetAudienceUUID];
    v89 = [v33 stringByAppendingFormat:@"assetAudience(param):%@|", v88];

    v90 = [v11 purpose];
    [v89 stringByAppendingFormat:@"purpose(param):%@|", v90];
    long long v33 = LABEL_46:;

    goto LABEL_47;
  }
  int v91 = [(SUCorePolicy *)self assetAudienceUUID];

  if (v91)
  {
    v92 = [(SUCorePolicy *)self assetAudienceUUID];
    v93 = (void *)[v92 copy];
    [v11 setLiveAssetAudienceUUID:v93];

    v94 = [(SUCorePolicy *)self assetAudienceUUID];
    v95 = (void *)[v94 copy];
    [v11 setPurpose:v95];

    id v96 = [v11 liveAssetAudienceUUID];
    v89 = [v33 stringByAppendingFormat:@"assetAudience(self):%@|", v96];

    v90 = [v11 purpose];
    [v89 stringByAppendingFormat:@"purpose(self):%@|", v90];
    goto LABEL_46;
  }
LABEL_47:
  id v183 = v7;
  id v97 = [NSString alloc];
  if ([v11 discretionary]) {
    v98 = @"YES";
  }
  else {
    v98 = @"NO";
  }
  v99 = (void *)[v97 initWithFormat:@"discretionary:%@|", v98];
  v100 = [v33 stringByAppendingString:v99];

  id v101 = [NSString alloc];
  if ([v11 allowsCellularAccess]) {
    v102 = @"YES";
  }
  else {
    v102 = @"NO";
  }
  v103 = (void *)[v101 initWithFormat:@"allowsCellular:%@|", v102];
  v104 = [v100 stringByAppendingString:v103];

  id v105 = [NSString alloc];
  if ([v11 requiresPowerPluggedIn]) {
    v106 = @"YES";
  }
  else {
    v106 = @"NO";
  }
  uint64_t v107 = (void *)[v105 initWithFormat:@"requiresPowerPluggedIn:%@|", v106];
  id v108 = [v104 stringByAppendingString:v107];

  id v109 = [NSString alloc];
  if ([v11 allowSameVersion]) {
    uint64_t v110 = @"YES";
  }
  else {
    uint64_t v110 = @"NO";
  }
  id v111 = (void *)[v109 initWithFormat:@"allowSameVersion:%@|", v110];
  id v112 = [v108 stringByAppendingString:v111];

  id v113 = [NSString alloc];
  uint64_t v114 = [v11 prerequisiteProductVersion];
  v115 = (void *)[v113 initWithFormat:@"prerequisiteProductVersion:%@|", v114];
  id v116 = [v112 stringByAppendingString:v115];

  id v117 = [NSString alloc];
  long long v118 = [v11 prerequisiteBuildVersion];
  uint64_t v119 = (void *)[v117 initWithFormat:@"prerequisiteBuildVersion:%@|", v118];
  long long v120 = [v116 stringByAppendingString:v119];

  id v121 = [NSString alloc];
  v122 = [(SUCorePolicy *)self prerequisiteRestoreVersion];
  id v123 = (void *)[v121 initWithFormat:@"prerequisiteRestoreVersion:%@|", v122];
  v124 = [v120 stringByAppendingString:v123];

  id v125 = [NSString alloc];
  uint64_t v126 = [(SUCorePolicy *)self targetRestoreVersion];
  v127 = (void *)[v125 initWithFormat:@"targetRestoreVersion:%@|", v126];
  long long v128 = [v124 stringByAppendingString:v127];

  id v129 = [NSString alloc];
  long long v130 = [(SUCorePolicy *)self installedSFRVersion];
  long long v131 = (void *)[v129 initWithFormat:@"installedSFRVersion:%@|", v130];
  v132 = [v128 stringByAppendingString:v131];

  id v133 = [NSString alloc];
  id v134 = [v11 prerequisiteReleaseType];
  id v135 = (void *)[v133 initWithFormat:@"prerequisiteReleaseType:%@|", v134];
  id v136 = [v132 stringByAppendingString:v135];

  id v137 = [NSString alloc];
  uint64_t v138 = [(SUCorePolicy *)self productType];
  v139 = (void *)[v137 initWithFormat:@"productType:%@|", v138];
  v140 = [v136 stringByAppendingString:v139];

  id v141 = [NSString alloc];
  id v142 = [(SUCorePolicy *)self hwModelStr];
  id v143 = (void *)[v141 initWithFormat:@"hwModelStr:%@|", v142];
  v144 = [v140 stringByAppendingString:v143];

  id v145 = [NSString alloc];
  v146 = [(SUCorePolicy *)self deviceClass];
  id v147 = (void *)[v145 initWithFormat:@"deviceClass:%@|", v146];
  v148 = [v144 stringByAppendingString:v147];

  id v149 = [NSString alloc];
  id v150 = [(SUCorePolicy *)self prerequisiteBuildVersion];
  v151 = (void *)[v149 initWithFormat:@"buildVersion:%@|", v150];
  v152 = [v148 stringByAppendingString:v151];

  v153 = objc_msgSend([NSString alloc], "initWithFormat:", @"timeout:%ld|", objc_msgSend(v11, "timeoutIntervalForResource"));
  long long v154 = [v152 stringByAppendingString:v153];

  id v155 = [NSString alloc];
  long long v156 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  __int16 v157 = [v156 specifiedFields];
  if ((v157 & 0x100) != 0)
  {
    v152 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
    v158 = [v152 sessionId];
  }
  else
  {
    v158 = @"nil";
  }
  id v159 = (void *)[v155 initWithFormat:@"sessionId:%@|", v158];
  v160 = [v154 stringByAppendingString:v159];

  if ((v157 & 0x100) != 0)
  {
  }
  id v161 = [NSString alloc];
  long long v162 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  __int16 v163 = [v162 specifiedFields];
  if ((v163 & 0x200) != 0)
  {
    v152 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
    long long v164 = [v152 rampingScanType];
  }
  else
  {
    long long v164 = @"nil";
  }
  long long v165 = (void *)[v161 initWithFormat:@"rampingScanType:%@|", v164];
  v166 = [v160 stringByAppendingString:v165];

  if ((v163 & 0x200) != 0)
  {
  }
  id v167 = [NSString alloc];
  int v168 = [v11 liveServerCatalogOnly];
  id v169 = @"NO";
  if (v168) {
    id v169 = @"YES";
  }
  v170 = (void *)[v167 initWithFormat:@"liveServerCatalogOnly:%@|", v169];
  long long v82 = [v166 stringByAppendingString:v170];

  long long v171 = [MEMORY[0x263F77DE8] sharedLogger];
  long long v172 = [v171 oslog];

  if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v191 = v82;
    _os_log_impl(&dword_20C8EA000, v172, OS_LOG_TYPE_DEFAULT, "[POLICY] software update catalog download options: %{public}@", buf, 0xCu);
  }

  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  v83 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v173 = [v83 countByEnumeratingWithState:&v185 objects:v189 count:16];
  if (v173)
  {
    uint64_t v174 = v173;
    uint64_t v182 = v82;
    uint64_t v175 = *(void *)v186;
    do
    {
      for (uint64_t i = 0; i != v174; ++i)
      {
        if (*(void *)v186 != v175) {
          objc_enumerationMutation(v83);
        }
        v177 = *(void **)(*((void *)&v185 + 1) + 8 * i);
        v178 = [MEMORY[0x263F77DE8] sharedLogger];
        __int16 v179 = [v178 oslog];

        if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
        {
          v180 = [v177 extensionName];
          *(_DWORD *)buf = 138543362;
          *(void *)v191 = v180;
          _os_log_impl(&dword_20C8EA000, v179, OS_LOG_TYPE_DEFAULT, "[POLICY] extending software update catalog download options for extension %{public}@", buf, 0xCu);
        }
        [v177 extendMASoftwareUpdateCatalogDownloadOptions:v11];
      }
      uint64_t v174 = [v83 countByEnumeratingWithState:&v185 objects:v189 count:16];
    }
    while (v174);
    id v7 = v183;
    id v6 = v184;
    long long v82 = v182;
  }
  else
  {
    id v7 = v183;
    id v6 = v184;
  }
LABEL_84:

  return v11;
}

- (id)constructMADocumentationCatalogDownloadOptionsWithUUID:(id)a3 usingDescriptor:(id)a4
{
  uint64_t v144 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F77DE8] sharedLogger];
  int v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)id v141 = self;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] constructMADocumentationCatalogDownloadOptionsWithUUID for policy: %{public}@", buf, 0xCu);
  }

  id v10 = objc_alloc_init(MEMORY[0x263F559C0]);
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v18 = (void *)[[NSString alloc] initWithFormat:@"%@ unable to create documentation catalog download options", self];
    [v11 trackError:@"DOC_CATALOG_DOWNLOAD_OPTIONS" forReason:v18 withResult:8100 withError:0];
LABEL_40:

    v103 = @"|";
    v104 = v11;
    uint64_t v11 = 0;
    goto LABEL_59;
  }
  uint64_t v11 = v10;
  uint64_t v12 = [(SUCorePolicy *)self documentationScanPolicy];
  uint64_t v13 = [v12 additionalServerParams];

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v15 = [(SUCorePolicy *)self documentationScanPolicy];
    uint64_t v16 = [v15 additionalServerParams];
    uint64_t v17 = (void *)[v14 initWithDictionary:v16];
    [v11 setAdditionalServerParams:v17];
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v11 setAdditionalServerParams:v15];
  }

  uint64_t v19 = [v11 additionalServerParams];

  if (!v19)
  {
    uint64_t v18 = [MEMORY[0x263F77DA8] sharedDiag];
    v102 = (void *)[[NSString alloc] initWithFormat:@"%@ unable to create documentation catalog download options additional server params", self];
    [v18 trackError:@"DOC_CATALOG_DOWNLOAD_OPTIONS" forReason:v102 withResult:8100 withError:0];

    goto LABEL_40;
  }
  [v11 setSessionId:v6];
  int v20 = [(SUCorePolicy *)self documentationScanPolicy];
  objc_msgSend(v11, "setDiscretionary:", objc_msgSend(v20, "discretionary"));

  __int16 v21 = [(SUCorePolicy *)self documentationScanPolicy];
  char v22 = [v21 specifiedFields];

  if ((v22 & 0x40) != 0)
  {
    __int16 v23 = [(SUCorePolicy *)self documentationScanPolicy];
    objc_msgSend(v11, "setDisableUI:", objc_msgSend(v23, "disableUI"));
  }
  __int16 v24 = [(SUCorePolicy *)self documentationScanPolicy];
  char v25 = [v24 specifiedFields];

  if ((v25 & 2) != 0)
  {
    __int16 v26 = [(SUCorePolicy *)self documentationScanPolicy];
    objc_msgSend(v11, "setAllowsCellularAccess:", objc_msgSend(v26, "allowsCellular"));
  }
  __int16 v27 = [(SUCorePolicy *)self documentationScanPolicy];
  char v28 = [v27 specifiedFields];

  if ((v28 & 8) != 0)
  {
    uint64_t v29 = [(SUCorePolicy *)self documentationScanPolicy];
    objc_msgSend(v11, "setRequiresPowerPluggedIn:", objc_msgSend(v29, "requiresPowerPluggedIn"));
  }
  id v30 = [(SUCorePolicy *)self documentationScanPolicy];
  char v31 = [v30 specifiedFields];

  if ((v31 & 0x20) != 0)
  {
    uint64_t v32 = [(SUCorePolicy *)self documentationScanPolicy];
    objc_msgSend(v11, "setLiveServerCatalogOnly:", objc_msgSend(v32, "liveServerCatalogOnly"));
  }
  id v134 = v6;
  long long v33 = [(SUCorePolicy *)self downloadAuthorizationHeader];

  if (v33)
  {
    long long v34 = [(SUCorePolicy *)self downloadAuthorizationHeader];
    [v11 setDownloadAuthorizationHeader:v34];
  }
  long long v35 = [v11 additionalServerParams];
  uint64_t v36 = [(SUCorePolicy *)self productType];
  [v35 setSafeObject:v36 forKey:@"ProductType"];

  uint64_t v37 = [v11 additionalServerParams];
  char v38 = [(SUCorePolicy *)self hwModelStr];
  [v37 setSafeObject:v38 forKey:@"HWModelStr"];

  id v39 = [v11 additionalServerParams];
  v40 = [(SUCorePolicy *)self deviceClass];
  [v39 setSafeObject:v40 forKey:@"DeviceName"];

  char v41 = [v11 additionalServerParams];
  v42 = [(SUCorePolicy *)self prerequisiteBuildVersion];
  [v41 setSafeObject:v42 forKey:@"BuildVersion"];

  id v43 = [NSString alloc];
  char v44 = [v11 sessionId];
  v45 = (void *)[v43 initWithFormat:@"scanUUID:%@|", v44];
  BOOL v46 = [@"|" stringByAppendingString:v45];

  id v47 = [NSString alloc];
  if ([v11 discretionary]) {
    v48 = @"YES";
  }
  else {
    v48 = @"NO";
  }
  uint64_t v49 = (void *)[v47 initWithFormat:@"discretionary:%@|", v48];
  int v50 = [v46 stringByAppendingString:v49];

  id v51 = [NSString alloc];
  if ([v11 allowsCellularAccess]) {
    v52 = @"YES";
  }
  else {
    v52 = @"NO";
  }
  id v53 = (void *)[v51 initWithFormat:@"allowsCellular:%@|", v52];
  uint64_t v54 = [v50 stringByAppendingString:v53];

  id v55 = [NSString alloc];
  if ([v11 requiresPowerPluggedIn]) {
    uint64_t v56 = @"YES";
  }
  else {
    uint64_t v56 = @"NO";
  }
  uint64_t v57 = (void *)[v55 initWithFormat:@"requiresPowerPluggedIn:%@|", v56];
  id v58 = [v54 stringByAppendingString:v57];

  id v59 = [NSString alloc];
  if ([v11 liveServerCatalogOnly]) {
    uint64_t v60 = @"YES";
  }
  else {
    uint64_t v60 = @"NO";
  }
  uint64_t v61 = (void *)[v59 initWithFormat:@"liveServerCatalogOnly:%@|", v60];
  uint64_t v62 = [v58 stringByAppendingString:v61];

  id v63 = [NSString alloc];
  v64 = [(SUCorePolicy *)self productType];
  v65 = (void *)[v63 initWithFormat:@"productType:%@|", v64];
  uint64_t v66 = [v62 stringByAppendingString:v65];

  id v67 = [NSString alloc];
  uint64_t v68 = [(SUCorePolicy *)self hwModelStr];
  uint64_t v69 = (void *)[v67 initWithFormat:@"hwModelStr:%@|", v68];
  id v70 = [v66 stringByAppendingString:v69];

  id v71 = [NSString alloc];
  uint64_t v72 = [(SUCorePolicy *)self deviceClass];
  uint64_t v73 = (void *)[v71 initWithFormat:@"deviceClass:%@|", v72];
  uint64_t v74 = [v70 stringByAppendingString:v73];

  id v75 = [NSString alloc];
  uint64_t v76 = [(SUCorePolicy *)self prerequisiteBuildVersion];
  int v77 = (void *)[v75 initWithFormat:@"buildVersion:%@|", v76];
  uint64_t v78 = [v74 stringByAppendingString:v77];

  BOOL v79 = [v11 additionalServerParams];
  uint64_t v80 = [v7 documentationID];
  [v79 setSafeObject:v80 forKey:@"SUDocumentationID"];

  long long v81 = [v11 additionalServerParams];
  long long v82 = [(SUCorePolicy *)self deviceClass];
  [v81 setSafeObject:v82 forKey:@"DeviceName"];

  id v83 = [NSString alloc];
  uint64_t v84 = [v11 additionalServerParams];
  uint64_t v85 = [v84 safeStringForKey:@"SUDocumentationID"];
  uint64_t v86 = (void *)[v83 initWithFormat:@"documentationID:%@", v85];
  v87 = [v78 stringByAppendingString:v86];

  id v88 = [NSString alloc];
  uint64_t v89 = [v11 additionalServerParams];
  v90 = [(id)v89 safeStringForKey:@"DeviceName"];
  int v91 = (void *)[v88 initWithFormat:@"deviceClass:%@", v90];
  v92 = [v87 stringByAppendingString:v91];

  v93 = [(SUCorePolicy *)self documentationScanPolicy];
  LOBYTE(v89) = [v93 specifiedFields];

  if ((v89 & 0x10) != 0)
  {
    id v96 = [(SUCorePolicy *)self documentationScanPolicy];
    objc_msgSend(v11, "setTimeoutIntervalForResource:", (int)-[NSObject downloadTimeoutSecs](v96, "downloadTimeoutSecs"));
  }
  else
  {
    if ([(SUCorePolicy *)self isInternal]) {
      uint64_t v94 = 60;
    }
    else {
      uint64_t v94 = 30;
    }
    [v11 setTimeoutIntervalForResource:v94];
    v95 = [MEMORY[0x263F77DE8] sharedLogger];
    id v96 = [v95 oslog];

    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      id v97 = [(SUCorePolicy *)self documentationScanPolicy];
      int v98 = [v97 downloadTimeoutSecs];
      uint64_t v99 = [v11 timeoutIntervalForResource];
      BOOL v100 = [(SUCorePolicy *)self isInternal];
      *(_DWORD *)buf = 67109634;
      id v101 = @"NO";
      if (v100) {
        id v101 = @"YES";
      }
      *(_DWORD *)id v141 = v98;
      *(_WORD *)&v141[4] = 2048;
      *(void *)&v141[6] = v99;
      __int16 v142 = 2114;
      id v143 = v101;
      _os_log_impl(&dword_20C8EA000, v96, OS_LOG_TYPE_DEFAULT, "[POLICY] downloadTimeoutSecs is %d, setting timeoutIntervalForResource to %ld (isInternal=%{public}@)", buf, 0x1Cu);
    }
  }

  id v105 = objc_msgSend([NSString alloc], "initWithFormat:", @"timeout:%ld|", objc_msgSend(v11, "timeoutIntervalForResource"));
  v103 = [v92 stringByAppendingString:v105];

  v106 = [v7 assetAudienceUUID];

  if (v106)
  {
    uint64_t v107 = [v7 assetAudienceUUID];
    id v108 = (void *)[v107 copy];
    [v11 setLiveAssetAudienceUUID:v108];

    id v109 = [v7 assetAudienceUUID];
    uint64_t v110 = (void *)[v109 copy];
    [v11 setPurpose:v110];

    id v111 = [v11 liveAssetAudienceUUID];
    id v112 = [(__CFString *)v103 stringByAppendingFormat:@"liveAssetAudienceUUID(param):%@", v111];

    id v113 = [v11 purpose];
    [v112 stringByAppendingFormat:@"purpose(param):%@", v113];
LABEL_46:
    v103 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_47;
  }
  uint64_t v114 = [(SUCorePolicy *)self assetAudienceUUID];

  if (v114)
  {
    v115 = [(SUCorePolicy *)self assetAudienceUUID];
    id v116 = (void *)[v115 copy];
    [v11 setLiveAssetAudienceUUID:v116];

    id v117 = [(SUCorePolicy *)self assetAudienceUUID];
    long long v118 = (void *)[v117 copy];
    [v11 setPurpose:v118];

    uint64_t v119 = [v11 liveAssetAudienceUUID];
    id v112 = [(__CFString *)v103 stringByAppendingFormat:@"liveAssetAudienceUUID(self):%@", v119];

    id v113 = [v11 purpose];
    [v112 stringByAppendingFormat:@"purpose(self):%@", v113];
    goto LABEL_46;
  }
LABEL_47:
  long long v120 = [MEMORY[0x263F77DE8] sharedLogger];
  id v121 = [v120 oslog];

  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)id v141 = v103;
    _os_log_impl(&dword_20C8EA000, v121, OS_LOG_TYPE_DEFAULT, "[POLICY] documentation catalog download options: %{public}@", buf, 0xCu);
  }

  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  v104 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v122 = [v104 countByEnumeratingWithState:&v135 objects:v139 count:16];
  if (v122)
  {
    uint64_t v123 = v122;
    id v133 = v103;
    v124 = v11;
    id v125 = v7;
    uint64_t v126 = *(void *)v136;
    do
    {
      for (uint64_t i = 0; i != v123; ++i)
      {
        if (*(void *)v136 != v126) {
          objc_enumerationMutation(v104);
        }
        long long v128 = *(void **)(*((void *)&v135 + 1) + 8 * i);
        id v129 = [MEMORY[0x263F77DE8] sharedLogger];
        long long v130 = [v129 oslog];

        if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
        {
          long long v131 = [v128 extensionName];
          *(_DWORD *)buf = 138543362;
          *(void *)id v141 = v131;
          _os_log_impl(&dword_20C8EA000, v130, OS_LOG_TYPE_DEFAULT, "[POLICY] extending documentation catalog download options for extension %{public}@", buf, 0xCu);
        }
        [v128 extendMADocumentationCatalogDownloadOptions:v124 descriptor:v125];
      }
      uint64_t v123 = [v104 countByEnumeratingWithState:&v135 objects:v139 count:16];
    }
    while (v123);
    v103 = v133;
    id v6 = v134;
    id v7 = v125;
    uint64_t v11 = v124;
  }
LABEL_59:

  return v11;
}

- (id)constructMASoftwareUpdateAssetDownloadOptionsWithUUID:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F77DE8] sharedLogger];
  id v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v73 = self;
    _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "[POLICY] constructMASoftwareUpdateAssetDownloadOptionsWithUUID for policy: %@", buf, 0xCu);
  }

  id v7 = objc_alloc_init(MEMORY[0x263F559C0]);
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v49 = (void *)[[NSString alloc] initWithFormat:@"%@ unable to create software update asset download options", self];
    [v8 trackError:@"SU_ASSET_DOWNLOAD_OPTIONS" forReason:v49 withResult:8100 withError:0];
LABEL_31:

    v48 = @"|";
    id v51 = v8;
    uint64_t v8 = 0;
    goto LABEL_45;
  }
  uint64_t v8 = v7;
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v8 setAdditionalServerParams:v9];

  id v10 = [v8 additionalServerParams];

  if (!v10)
  {
    uint64_t v49 = [MEMORY[0x263F77DA8] sharedDiag];
    int v50 = (void *)[[NSString alloc] initWithFormat:@"%@ unable to create software update asset download options additional server params", self];
    [v49 trackError:@"SU_ASSET_DOWNLOAD_OPTIONS" forReason:v50 withResult:8100 withError:0];

    goto LABEL_31;
  }
  [v8 setSessionId:v4];
  uint64_t v11 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
  objc_msgSend(v8, "setDiscretionary:", objc_msgSend(v11, "discretionary"));

  uint64_t v12 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
  char v13 = [v12 specifiedFields];

  if (v13 < 0)
  {
    id v14 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
    objc_msgSend(v8, "setDisableUI:", objc_msgSend(v14, "disableUI"));
  }
  id v15 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
  char v16 = [v15 specifiedFields];

  if ((v16 & 2) != 0)
  {
    uint64_t v17 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
    objc_msgSend(v8, "setAllowsCellularAccess:", objc_msgSend(v17, "allowsCellular"));
  }
  uint64_t v18 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
  char v19 = [v18 specifiedFields];

  if ((v19 & 0x10) != 0)
  {
    int v20 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
    objc_msgSend(v8, "setRequiresPowerPluggedIn:", objc_msgSend(v20, "requiresPowerPluggedIn"));
  }
  __int16 v21 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
  char v22 = [v21 specifiedFields];

  if ((v22 & 0x40) != 0)
  {
    __int16 v23 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
    objc_msgSend(v8, "setAllowsExpensiveAccess:", objc_msgSend(v23, "requiresInexpensiveAccess") ^ 1);
  }
  __int16 v24 = [(SUCorePolicy *)self downloadAuthorizationHeader];

  if (v24)
  {
    char v25 = [(SUCorePolicy *)self downloadAuthorizationHeader];
    [v8 setDownloadAuthorizationHeader:v25];
  }
  id v26 = [NSString alloc];
  __int16 v27 = [v8 sessionId];
  char v28 = (void *)[v26 initWithFormat:@"scanUUID:%@|", v27];
  uint64_t v29 = [@"|" stringByAppendingString:v28];

  id v30 = [NSString alloc];
  if ([v8 discretionary]) {
    char v31 = @"YES";
  }
  else {
    char v31 = @"NO";
  }
  uint64_t v32 = (void *)[v30 initWithFormat:@"discretionary:%@|", v31];
  long long v33 = [v29 stringByAppendingString:v32];

  id v34 = [NSString alloc];
  if ([v8 allowsCellularAccess]) {
    long long v35 = @"YES";
  }
  else {
    long long v35 = @"NO";
  }
  uint64_t v36 = (void *)[v34 initWithFormat:@"allowsCellular:%@|", v35];
  uint64_t v37 = [v33 stringByAppendingString:v36];

  id v38 = [NSString alloc];
  if ([v8 requiresPowerPluggedIn]) {
    id v39 = @"YES";
  }
  else {
    id v39 = @"NO";
  }
  v40 = (void *)[v38 initWithFormat:@"requiresPowerPluggedIn:%@|", v39];
  char v41 = [v37 stringByAppendingString:v40];

  id v42 = [NSString alloc];
  if ([v8 allowsExpensiveAccess]) {
    id v43 = @"YES";
  }
  else {
    id v43 = @"NO";
  }
  char v44 = (void *)[v42 initWithFormat:@"allowsExpensiveAccess:%@|", v43];
  v45 = [v41 stringByAppendingString:v44];

  BOOL v46 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
  char v47 = [v46 specifiedFields];

  id v66 = v4;
  if ((v47 & 0x20) != 0)
  {
    v52 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
    objc_msgSend(v8, "setTimeoutIntervalForResource:", (int)objc_msgSend(v52, "downloadTimeoutSecs"));

    uint64_t v53 = objc_msgSend([NSString alloc], "initWithFormat:", @"timeout:%ld|", objc_msgSend(v8, "timeoutIntervalForResource"));
    v48 = [v45 stringByAppendingString:v53];

    v45 = (void *)v53;
  }
  else
  {
    v48 = [v45 stringByAppendingString:@"timeout:MobileAsset|"];
  }

  uint64_t v54 = [MEMORY[0x263F77DE8] sharedLogger];
  id v55 = [v54 oslog];

  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v73 = (SUCorePolicy *)v48;
    _os_log_impl(&dword_20C8EA000, v55, OS_LOG_TYPE_DEFAULT, "[POLICY] software update asset download options: %{public}@", buf, 0xCu);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v51 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v56 = [v51 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    v65 = v48;
    uint64_t v58 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v68 != v58) {
          objc_enumerationMutation(v51);
        }
        uint64_t v60 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        uint64_t v61 = [MEMORY[0x263F77DE8] sharedLogger];
        uint64_t v62 = [v61 oslog];

        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          id v63 = [v60 extensionName];
          *(_DWORD *)buf = 138543362;
          uint64_t v73 = v63;
          _os_log_impl(&dword_20C8EA000, v62, OS_LOG_TYPE_DEFAULT, "[POLICY] extending software update asset download options for extension %{public}@", buf, 0xCu);
        }
        [v60 extendMASoftwareUpdateAssetDownloadOptions:v8];
      }
      uint64_t v57 = [v51 countByEnumeratingWithState:&v67 objects:v71 count:16];
    }
    while (v57);
    v48 = v65;
    id v4 = v66;
  }
LABEL_45:

  return v8;
}

- (id)constructMADocumentationAssetDownloadOptionsWithUUID:(id)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F77DE8] sharedLogger];
  id v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v71 = self;
    _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "[POLICY] constructMADocumentationAssetDownloadOptionsWithUUID for policy: %@", buf, 0xCu);
  }

  id v7 = objc_alloc_init(MEMORY[0x263F559C0]);
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v60 = (void *)[[NSString alloc] initWithFormat:@"%@ unable to create documentation asset download options", self];
    [v8 trackError:@"DOC_ASSET_DOWNLOAD_OPTIONS" forReason:v60 withResult:8100 withError:0];
LABEL_41:

    v48 = @"|";
    id v51 = v8;
    uint64_t v8 = 0;
    goto LABEL_42;
  }
  uint64_t v8 = v7;
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v8 setAdditionalServerParams:v9];

  id v10 = [v8 additionalServerParams];

  if (!v10)
  {
    uint64_t v60 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v61 = (void *)[[NSString alloc] initWithFormat:@"%@ unable to create documentation asset download options additional server params", self];
    [v60 trackError:@"DOC_ASSET_DOWNLOAD_OPTIONS" forReason:v61 withResult:8100 withError:0];

    goto LABEL_41;
  }
  [v8 setSessionId:v4];
  uint64_t v11 = [(SUCorePolicy *)self documentationDownloadPolicy];
  objc_msgSend(v8, "setDiscretionary:", objc_msgSend(v11, "discretionary"));

  uint64_t v12 = [(SUCorePolicy *)self documentationDownloadPolicy];
  char v13 = [v12 specifiedFields];

  if ((v13 & 0x40) != 0)
  {
    id v14 = [(SUCorePolicy *)self documentationDownloadPolicy];
    objc_msgSend(v8, "setDisableUI:", objc_msgSend(v14, "disableUI"));
  }
  id v15 = [(SUCorePolicy *)self documentationDownloadPolicy];
  char v16 = [v15 specifiedFields];

  if ((v16 & 2) != 0)
  {
    uint64_t v17 = [(SUCorePolicy *)self documentationDownloadPolicy];
    objc_msgSend(v8, "setAllowsCellularAccess:", objc_msgSend(v17, "allowsCellular"));
  }
  uint64_t v18 = [(SUCorePolicy *)self documentationDownloadPolicy];
  char v19 = [v18 specifiedFields];

  if ((v19 & 8) != 0)
  {
    int v20 = [(SUCorePolicy *)self documentationDownloadPolicy];
    objc_msgSend(v8, "setRequiresPowerPluggedIn:", objc_msgSend(v20, "requiresPowerPluggedIn"));
  }
  __int16 v21 = [(SUCorePolicy *)self documentationDownloadPolicy];
  char v22 = [v21 specifiedFields];

  if ((v22 & 0x20) != 0)
  {
    __int16 v23 = [(SUCorePolicy *)self documentationDownloadPolicy];
    objc_msgSend(v8, "setAllowsExpensiveAccess:", objc_msgSend(v23, "requiresInexpensiveAccess") ^ 1);
  }
  __int16 v24 = [(SUCorePolicy *)self documentationDownloadPolicy];
  objc_msgSend(v8, "setTimeoutIntervalForResource:", (int)objc_msgSend(v24, "downloadTimeoutSecs"));

  char v25 = [(SUCorePolicy *)self downloadAuthorizationHeader];

  if (v25)
  {
    id v26 = [(SUCorePolicy *)self downloadAuthorizationHeader];
    [v8 setDownloadAuthorizationHeader:v26];
  }
  id v27 = [NSString alloc];
  char v28 = [v8 sessionId];
  uint64_t v29 = (void *)[v27 initWithFormat:@"scanUUID:%@|", v28];
  id v30 = [@"|" stringByAppendingString:v29];

  id v31 = [NSString alloc];
  if ([v8 discretionary]) {
    uint64_t v32 = @"YES";
  }
  else {
    uint64_t v32 = @"NO";
  }
  long long v33 = (void *)[v31 initWithFormat:@"discretionary:%@|", v32];
  id v34 = [v30 stringByAppendingString:v33];

  id v35 = [NSString alloc];
  if ([v8 allowsCellularAccess]) {
    uint64_t v36 = @"YES";
  }
  else {
    uint64_t v36 = @"NO";
  }
  uint64_t v37 = (void *)[v35 initWithFormat:@"allowsCellular:%@|", v36];
  id v38 = [v34 stringByAppendingString:v37];

  id v39 = [NSString alloc];
  if ([v8 requiresPowerPluggedIn]) {
    v40 = @"YES";
  }
  else {
    v40 = @"NO";
  }
  char v41 = (void *)[v39 initWithFormat:@"requiresPowerPluggedIn:%@|", v40];
  id v42 = [v38 stringByAppendingString:v41];

  id v43 = [NSString alloc];
  if ([v8 allowsExpensiveAccess]) {
    char v44 = @"YES";
  }
  else {
    char v44 = @"NO";
  }
  v45 = (void *)[v43 initWithFormat:@"allowsExpensiveAccess:%@|", v44];
  BOOL v46 = [v42 stringByAppendingString:v45];

  char v47 = objc_msgSend([NSString alloc], "initWithFormat:", @"timeout:%ld|", objc_msgSend(v8, "timeoutIntervalForResource"));
  v48 = [v46 stringByAppendingString:v47];

  uint64_t v49 = [MEMORY[0x263F77DE8] sharedLogger];
  int v50 = [v49 oslog];

  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v71 = (SUCorePolicy *)v48;
    _os_log_impl(&dword_20C8EA000, v50, OS_LOG_TYPE_DEFAULT, "[POLICY] documentation asset download options: %{public}@", buf, 0xCu);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v51 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v52 = [v51 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    id v63 = v48;
    id v64 = v4;
    uint64_t v54 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v66 != v54) {
          objc_enumerationMutation(v51);
        }
        uint64_t v56 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v57 = [MEMORY[0x263F77DE8] sharedLogger];
        uint64_t v58 = [v57 oslog];

        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          id v59 = [v56 extensionName];
          *(_DWORD *)buf = 138543362;
          id v71 = v59;
          _os_log_impl(&dword_20C8EA000, v58, OS_LOG_TYPE_DEFAULT, "[POLICY] extending documentation asset download options for extension %{public}@", buf, 0xCu);
        }
        [v56 extendMADocumentationAssetDownloadOptions:v8];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v53);
    v48 = v63;
    id v4 = v64;
  }
LABEL_42:

  return v8;
}

- (id)setUpdateMetricEventFieldsFromDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(SUCorePolicy *)self setUpdateMetricEventFields:0];
  if (v4)
  {
    id v19 = v4;
    uint64_t v18 = self;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v12 = [v6 objectForKeyedSubscript:v11];
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [v5 setSafeObject:v12 forKey:v11];
          }
          else
          {
            char v13 = (void *)[[NSString alloc] initWithFormat:@"SET_UPDATE_METRIC_EVENT_FIELDS failed due to invalid parameter (non-NSString value in dictionary for key %@)", v11];
            id v14 = [MEMORY[0x263F77D78] sharedCore];
            id v15 = [v14 buildError:8102 underlying:0 description:v13];

            char v16 = [MEMORY[0x263F77DA8] sharedDiag];
            [v16 trackAnomaly:@"SET_UPDATE_METRIC_EVENT_FIELDS" forReason:v13 withResult:8102 withError:v15];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    [(SUCorePolicy *)v18 setUpdateMetricEventFields:v5];
    id v4 = v19;
  }

  return 0;
}

- (void)updateApplyOptionsWithExtensions:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F77DE8] sharedLogger];
  id v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v22 = self;
    _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "[POLICY] updateApplyOptionsWithExtensions for policy: %{public}@", buf, 0xCu);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          char v13 = [MEMORY[0x263F77DE8] sharedLogger];
          id v14 = [v13 oslog];

          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [v12 extensionName];
            *(_DWORD *)buf = 138543362;
            long long v22 = v15;
            _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "[POLICY] extending query for extension %{public}@", buf, 0xCu);
          }
          [v12 extendMSUApplyOptions:v4];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)updateRollbackOptionsWithExtensions:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F77DE8] sharedLogger];
  id v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v22 = self;
    _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "[POLICY] updateRollbackOptionsWithExtensions for policy: %{public}@", buf, 0xCu);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          char v13 = [MEMORY[0x263F77DE8] sharedLogger];
          id v14 = [v13 oslog];

          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [v12 extensionName];
            *(_DWORD *)buf = 138543362;
            long long v22 = v15;
            _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "[POLICY] extending rollback options for extension %{public}@", buf, 0xCu);
          }
          [v12 extendMSURollbackOptions:v4];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (BOOL)isSplatPolicy
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          v5 |= [v8 isSplatPolicy];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)isSupervisedPolicy
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          v5 |= [v8 isSupervisedPolicy];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)isRequestedPMVSupervisedPolicy
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          v5 |= [v8 isRequestedPMVSupervisedPolicy];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (id)requestedProductMarketingVersion
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v9 = [v8 requestedProductMarketingVersion];

          int v5 = (void *)v9;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int64_t)delayPeriodDays
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          int64_t v5 = [v8 delayPeriodDays];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)mdmPathName
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v9 = [v8 mdmPathName];

          int64_t v5 = (void *)v9;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (SUCorePolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v108.receiver = self;
  v108.super_class = (Class)SUCorePolicy;
  int64_t v5 = [(SUCorePolicy *)&v108 init];
  if (v5)
  {
    v5->_specifiedUsedPolicies = [v4 decodeInt64ForKey:@"SpecifiedPolicies"];
    v5->_restrictToFull = [v4 decodeBoolForKey:@"RestrictToFull"];
    v5->_allowSameVersion = [v4 decodeBoolForKey:@"AllowSameVersion"];
    v5->_background = [v4 decodeBoolForKey:@"Background"];
    v5->_allowsCellular = [v4 decodeBoolForKey:@"AllowsCellular"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UpdateScanPolicy"];
    softwareUpdateScanPolicy = v5->_softwareUpdateScanPolicy;
    v5->_softwareUpdateScanPolicy = (SUCorePolicySoftwareUpdateScan *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationScanPolicy"];
    documentationScanPolicy = v5->_documentationScanPolicy;
    v5->_documentationScanPolicy = (SUCorePolicyDocumentationScan *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationDownloadPolicy"];
    documentationDownloadPolicy = v5->_documentationDownloadPolicy;
    v5->_documentationDownloadPolicy = (SUCorePolicyDocumentationDownload *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LoadBrainUpdatePolicy"];
    loadBrainPolicy = v5->_loadBrainPolicy;
    v5->_loadBrainPolicy = (SUCorePolicyLoadBrain *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreflightDownloadPolicy"];
    downloadPreflightPolicy = v5->_downloadPreflightPolicy;
    v5->_downloadPreflightPolicy = (SUCorePolicyPreflightDownloadSU *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreflightWakeupPolicy"];
    wakeupPreflightPolicy = v5->_wakeupPreflightPolicy;
    v5->_wakeupPreflightPolicy = (SUCorePolicyPreflightWakeup *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreflightPrerequisiteCheckPolicy"];
    prerequisiteCheckPreflightPolicy = v5->_prerequisiteCheckPreflightPolicy;
    v5->_prerequisiteCheckPreflightPolicy = (SUCorePolicyPreflightPrerequisiteCheck *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreflightPersonalizePolicy"];
    personalizePreflightPolicy = v5->_personalizePreflightPolicy;
    v5->_personalizePreflightPolicy = (SUCorePolicyPreflightPersonalize *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreflightFDRRecoveryPolicy"];
    fdrRecoveryPreflightPolicy = v5->_fdrRecoveryPreflightPolicy;
    v5->_fdrRecoveryPreflightPolicy = (SUCorePolicyPreflightFDRRecovery *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DownloadSoftwareUpdatePolicy"];
    softwareUpdateDownloadPolicy = v5->_softwareUpdateDownloadPolicy;
    v5->_softwareUpdateDownloadPolicy = (SUCorePolicySoftwareUpdateDownload *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrepareUpdatePolicy"];
    preparePolicy = v5->_preparePolicy;
    v5->_preparePolicy = (SUCorePolicyPrepare *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SuspendUpdatePolicy"];
    suspendPolicy = v5->_suspendPolicy;
    v5->_suspendPolicy = (SUCorePolicySuspend *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ResumeUpdatePolicy"];
    resumePolicy = v5->_resumePolicy;
    v5->_resumePolicy = (SUCorePolicyResume *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ApplyUpdatePolicy"];
    applyPolicy = v5->_applyPolicy;
    v5->_applyPolicy = (SUCorePolicyApply *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RollbackUpdatePolicy"];
    rollbackPolicy = v5->_rollbackPolicy;
    v5->_rollbackPolicy = (SUCorePolicyRollback *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SoftwareUpdateAssetType"];
    softwareUpdateAssetType = v5->_softwareUpdateAssetType;
    v5->_softwareUpdateAssetType = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DocumentationAssetType"];
    documentationAssetType = v5->_documentationAssetType;
    v5->_documentationAssetType = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TargetVolumeUUID"];
    targetVolumeUUID = v5->_targetVolumeUUID;
    v5->_targetVolumeUUID = (NSString *)v40;

    id v42 = (void *)MEMORY[0x263EFFA08];
    uint64_t v43 = objc_opt_class();
    char v44 = objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"PolicyExtensions"];
    policyExtensions = v5->_policyExtensions;
    v5->_policyExtensions = (NSArray *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteBuildVersion"];
    prerequisiteBuildVersion = v5->_prerequisiteBuildVersion;
    v5->_prerequisiteBuildVersion = (NSString *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteProductVersion"];
    prerequisiteProductVersion = v5->_prerequisiteProductVersion;
    v5->_prerequisiteProductVersion = (NSString *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteRestoreVersion"];
    prerequisiteRestoreVersion = v5->_prerequisiteRestoreVersion;
    v5->_prerequisiteRestoreVersion = (NSString *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TargetRestoreVersion"];
    targetRestoreVersion = v5->_targetRestoreVersion;
    v5->_targetRestoreVersion = (NSString *)v53;

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstalledSFRVersion"];
    installedSFRVersion = v5->_installedSFRVersion;
    v5->_installedSFRVersion = (NSString *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceClass"];
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = (NSString *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HWModelStr"];
    hwModelStr = v5->_hwModelStr;
    v5->_hwModelStr = (NSString *)v59;

    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductType"];
    productType = v5->_productType;
    v5->_productType = (NSString *)v61;

    uint64_t v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReleaseType"];
    releaseType = v5->_releaseType;
    v5->_releaseType = (NSString *)v63;

    v5->_isInternal = [v4 decodeBoolForKey:@"IsInternal"];
    v5->_checkAvailableSpace = [v4 decodeBoolForKey:@"CheckAvailableSpace"];
    v5->_cacheDeleteUrgency = [v4 decodeIntForKey:@"CacheDeleteUrgency"];
    uint64_t v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserAgentString"];
    userAgentString = v5->_userAgentString;
    v5->_userAgentString = (NSString *)v65;

    v5->_performPreflightEncryptedCheck = [v4 decodeBoolForKey:@"PerformPreflightEncryptedCheck"];
    v5->_performPreflightSnapshotCheck = [v4 decodeBoolForKey:@"PerformPreflightSnapshotCheck"];
    uint64_t v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UpdateVolumePath"];
    updateVolumePath = v5->_updateVolumePath;
    v5->_updateVolumePath = (NSString *)v67;

    uint64_t v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSOToken"];
    ssoToken = v5->_ssoToken;
    v5->_ssoToken = (NSData *)v69;

    uint64_t v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PersonalizedManifestRootsPath"];
    personalizedManifestRootsPath = v5->_personalizedManifestRootsPath;
    v5->_personalizedManifestRootsPath = (NSString *)v71;

    uint64_t v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocalAuthenticationContext"];
    localAuthenticationContext = v5->_localAuthenticationContext;
    v5->_localAuthenticationContext = (NSData *)v73;

    uint64_t v75 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocalAuthenticationUserID"];
    localAuthenticationUserID = v5->_localAuthenticationUserID;
    v5->_localAuthenticationUserID = (NSNumber *)v75;

    uint64_t v77 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MDMBootstrapToken"];
    mdmBootstrapToken = v5->_mdmBootstrapToken;
    v5->_mdmBootstrapToken = (NSString *)v77;

    uint64_t v79 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DownloadAuthorizationHeader"];
    downloadAuthorizationHeader = v5->_downloadAuthorizationHeader;
    v5->_downloadAuthorizationHeader = (NSString *)v79;

    uint64_t v81 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UpdateBrainLocationOverride"];
    updateBrainLocationOverride = v5->_updateBrainLocationOverride;
    v5->_updateBrainLocationOverride = (NSString *)v81;

    uint64_t v83 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AssetAudienceUUID"];
    assetAudienceUUID = v5->_assetAudienceUUID;
    v5->_assetAudienceUUID = (NSString *)v83;

    uint64_t v85 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AlternateAssetAudienceUUID"];
    alternateAssetAudienceUUID = v5->_alternateAssetAudienceUUID;
    v5->_alternateAssetAudienceUUID = (NSString *)v85;

    v5->_disableAlternateUpdate = [v4 decodeBoolForKey:@"DisableAlternateUpdate"];
    v5->_disableSplatCombo = [v4 decodeBoolForKey:@"DisableSplombo"];
    uint64_t v87 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PersonalizationServerURL"];
    personalizationServerURL = v5->_personalizationServerURL;
    v5->_personalizationServerURL = (NSString *)v87;

    uint64_t v89 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxyHostName"];
    proxyHostName = v5->_proxyHostName;
    v5->_proxyHostName = (NSString *)v89;

    uint64_t v91 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxyPortNumber"];
    proxyPortNumber = v5->_proxyPortNumber;
    v5->_proxyPortNumber = (NSNumber *)v91;

    v5->_bridgeOSIgnoreMinimumVersionCheck = [v4 decodeBoolForKey:@"BridgeOSIgnoreMinimumVersionCheck"];
    uint64_t v93 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BridgeOSDownloadDirectory"];
    bridgeOSDownloadDirectory = v5->_bridgeOSDownloadDirectory;
    v5->_bridgeOSDownloadDirectory = (NSString *)v93;

    v5->_enableEmbeddedOSInstall = [v4 decodeBoolForKey:@"EnableEmbeddedOSInstall"];
    v5->_enableBridgeOSInstall = [v4 decodeBoolForKey:@"EnableBridgeOSInstall"];
    v5->_enableOSPersonalization = [v4 decodeBoolForKey:@"EnableOSPersonalization"];
    v5->_userInitiated = [v4 decodeBoolForKey:@"UserInitiated"];
    v5->_skipVolumeSealing = [v4 decodeBoolForKey:@"SkipVolumeSealing"];
    v5->_qualityOfService = [v4 decodeIntForKey:@"QualityOfService"];
    id v95 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v96 = objc_opt_class();
    id v97 = objc_msgSend(v95, "initWithObjects:", v96, objc_opt_class(), 0);
    uint64_t v98 = [v4 decodeObjectOfClasses:v97 forKey:@"UpdateMetricEventFields"];
    updateMetricEventFields = v5->_updateMetricEventFields;
    v5->_updateMetricEventFields = (NSDictionary *)v98;

    uint64_t v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UpdateMetricContext"];
    updateMetricContext = v5->_updateMetricContext;
    v5->_updateMetricContext = (NSString *)v100;

    id v102 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v103 = objc_opt_class();
    v104 = objc_msgSend(v102, "initWithObjects:", v103, objc_opt_class(), 0);
    uint64_t v105 = [v4 decodeObjectOfClasses:v104 forKey:@"DefaultDescriptorValues"];
    defaultDescriptorValues = v5->_defaultDescriptorValues;
    v5->_defaultDescriptorValues = (NSDictionary *)v105;

    v5->_enablePreSUStaging = [v4 decodeBoolForKey:@"EnablePSUSAssets"];
    v5->_enablePreSUStagingForOptionalAssets = [v4 decodeBoolForKey:@"EnablePSUSForOptionalAssets"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v50 = a3;
  objc_msgSend(v50, "encodeInt64:forKey:", -[SUCorePolicy specifiedUsedPolicies](self, "specifiedUsedPolicies"), @"SpecifiedPolicies");
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy restrictToFull](self, "restrictToFull"), @"RestrictToFull");
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy allowSameVersion](self, "allowSameVersion"), @"AllowSameVersion");
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy background](self, "background"), @"Background");
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy allowsCellular](self, "allowsCellular"), @"AllowsCellular");
  id v4 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  [v50 encodeObject:v4 forKey:@"UpdateScanPolicy"];

  int64_t v5 = [(SUCorePolicy *)self documentationScanPolicy];
  [v50 encodeObject:v5 forKey:@"DocumentationScanPolicy"];

  uint64_t v6 = [(SUCorePolicy *)self documentationDownloadPolicy];
  [v50 encodeObject:v6 forKey:@"DocumentationDownloadPolicy"];

  uint64_t v7 = [(SUCorePolicy *)self loadBrainPolicy];
  [v50 encodeObject:v7 forKey:@"LoadBrainUpdatePolicy"];

  uint64_t v8 = [(SUCorePolicy *)self downloadPreflightPolicy];
  [v50 encodeObject:v8 forKey:@"PreflightDownloadPolicy"];

  uint64_t v9 = [(SUCorePolicy *)self wakeupPreflightPolicy];
  [v50 encodeObject:v9 forKey:@"PreflightWakeupPolicy"];

  uint64_t v10 = [(SUCorePolicy *)self prerequisiteCheckPreflightPolicy];
  [v50 encodeObject:v10 forKey:@"PreflightPrerequisiteCheckPolicy"];

  long long v11 = [(SUCorePolicy *)self personalizePreflightPolicy];
  [v50 encodeObject:v11 forKey:@"PreflightPersonalizePolicy"];

  uint64_t v12 = [(SUCorePolicy *)self fdrRecoveryPreflightPolicy];
  [v50 encodeObject:v12 forKey:@"PreflightFDRRecoveryPolicy"];

  long long v13 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
  [v50 encodeObject:v13 forKey:@"DownloadSoftwareUpdatePolicy"];

  uint64_t v14 = [(SUCorePolicy *)self preparePolicy];
  [v50 encodeObject:v14 forKey:@"PrepareUpdatePolicy"];

  uint64_t v15 = [(SUCorePolicy *)self suspendPolicy];
  [v50 encodeObject:v15 forKey:@"SuspendUpdatePolicy"];

  uint64_t v16 = [(SUCorePolicy *)self resumePolicy];
  [v50 encodeObject:v16 forKey:@"ResumeUpdatePolicy"];

  long long v17 = [(SUCorePolicy *)self applyPolicy];
  [v50 encodeObject:v17 forKey:@"ApplyUpdatePolicy"];

  uint64_t v18 = [(SUCorePolicy *)self rollbackPolicy];
  [v50 encodeObject:v18 forKey:@"RollbackUpdatePolicy"];

  long long v19 = [(SUCorePolicy *)self softwareUpdateAssetType];
  [v50 encodeObject:v19 forKey:@"SoftwareUpdateAssetType"];

  uint64_t v20 = [(SUCorePolicy *)self documentationAssetType];
  [v50 encodeObject:v20 forKey:@"DocumentationAssetType"];

  long long v21 = [(SUCorePolicy *)self targetVolumeUUID];
  [v50 encodeObject:v21 forKey:@"TargetVolumeUUID"];

  uint64_t v22 = [(SUCorePolicy *)self policyExtensions];
  [v50 encodeObject:v22 forKey:@"PolicyExtensions"];

  uint64_t v23 = [(SUCorePolicy *)self prerequisiteBuildVersion];
  [v50 encodeObject:v23 forKey:@"PrerequisiteBuildVersion"];

  uint64_t v24 = [(SUCorePolicy *)self prerequisiteProductVersion];
  [v50 encodeObject:v24 forKey:@"PrerequisiteProductVersion"];

  uint64_t v25 = [(SUCorePolicy *)self prerequisiteRestoreVersion];
  [v50 encodeObject:v25 forKey:@"PrerequisiteRestoreVersion"];

  uint64_t v26 = [(SUCorePolicy *)self targetRestoreVersion];
  [v50 encodeObject:v26 forKey:@"TargetRestoreVersion"];

  id v27 = [(SUCorePolicy *)self installedSFRVersion];
  [v50 encodeObject:v27 forKey:@"InstalledSFRVersion"];

  uint64_t v28 = [(SUCorePolicy *)self deviceClass];
  [v50 encodeObject:v28 forKey:@"DeviceClass"];

  uint64_t v29 = [(SUCorePolicy *)self hwModelStr];
  [v50 encodeObject:v29 forKey:@"HWModelStr"];

  uint64_t v30 = [(SUCorePolicy *)self productType];
  [v50 encodeObject:v30 forKey:@"ProductType"];

  id v31 = [(SUCorePolicy *)self releaseType];
  [v50 encodeObject:v31 forKey:@"ReleaseType"];

  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy isInternal](self, "isInternal"), @"IsInternal");
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy checkAvailableSpace](self, "checkAvailableSpace"), @"CheckAvailableSpace");
  objc_msgSend(v50, "encodeInt:forKey:", -[SUCorePolicy cacheDeleteUrgency](self, "cacheDeleteUrgency"), @"CacheDeleteUrgency");
  uint64_t v32 = [(SUCorePolicy *)self userAgentString];
  [v50 encodeObject:v32 forKey:@"UserAgentString"];

  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy performPreflightEncryptedCheck](self, "performPreflightEncryptedCheck"), @"PerformPreflightEncryptedCheck");
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy performPreflightSnapshotCheck](self, "performPreflightSnapshotCheck"), @"PerformPreflightSnapshotCheck");
  long long v33 = [(SUCorePolicy *)self updateVolumePath];
  [v50 encodeObject:v33 forKey:@"UpdateVolumePath"];

  uint64_t v34 = [(SUCorePolicy *)self ssoToken];
  [v50 encodeObject:v34 forKey:@"SSOToken"];

  id v35 = [(SUCorePolicy *)self personalizedManifestRootsPath];
  [v50 encodeObject:v35 forKey:@"PersonalizedManifestRootsPath"];

  uint64_t v36 = [(SUCorePolicy *)self localAuthenticationContext];
  [v50 encodeObject:v36 forKey:@"LocalAuthenticationContext"];

  uint64_t v37 = [(SUCorePolicy *)self localAuthenticationUserID];
  [v50 encodeObject:v37 forKey:@"LocalAuthenticationUserID"];

  uint64_t v38 = [(SUCorePolicy *)self mdmBootstrapToken];
  [v50 encodeObject:v38 forKey:@"MDMBootstrapToken"];

  id v39 = [(SUCorePolicy *)self downloadAuthorizationHeader];
  [v50 encodeObject:v39 forKey:@"DownloadAuthorizationHeader"];

  uint64_t v40 = [(SUCorePolicy *)self updateBrainLocationOverride];
  [v50 encodeObject:v40 forKey:@"UpdateBrainLocationOverride"];

  char v41 = [(SUCorePolicy *)self assetAudienceUUID];
  [v50 encodeObject:v41 forKey:@"AssetAudienceUUID"];

  id v42 = [(SUCorePolicy *)self alternateAssetAudienceUUID];
  [v50 encodeObject:v42 forKey:@"AlternateAssetAudienceUUID"];

  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy disableAlternateUpdate](self, "disableAlternateUpdate"), @"DisableAlternateUpdate");
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy disableSplatCombo](self, "disableSplatCombo"), @"DisableSplombo");
  uint64_t v43 = [(SUCorePolicy *)self personalizationServerURL];
  [v50 encodeObject:v43 forKey:@"PersonalizationServerURL"];

  char v44 = [(SUCorePolicy *)self proxyHostName];
  [v50 encodeObject:v44 forKey:@"ProxyHostName"];

  uint64_t v45 = [(SUCorePolicy *)self proxyPortNumber];
  [v50 encodeObject:v45 forKey:@"ProxyPortNumber"];

  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy bridgeOSIgnoreMinimumVersionCheck](self, "bridgeOSIgnoreMinimumVersionCheck"), @"BridgeOSIgnoreMinimumVersionCheck");
  BOOL v46 = [(SUCorePolicy *)self bridgeOSDownloadDirectory];
  [v50 encodeObject:v46 forKey:@"BridgeOSDownloadDirectory"];

  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy enableEmbeddedOSInstall](self, "enableEmbeddedOSInstall"), @"EnableEmbeddedOSInstall");
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy enableBridgeOSInstall](self, "enableBridgeOSInstall"), @"EnableBridgeOSInstall");
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy enableOSPersonalization](self, "enableOSPersonalization"), @"EnableOSPersonalization");
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy userInitiated](self, "userInitiated"), @"UserInitiated");
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy skipVolumeSealing](self, "skipVolumeSealing"), @"SkipVolumeSealing");
  objc_msgSend(v50, "encodeInt:forKey:", -[SUCorePolicy qualityOfService](self, "qualityOfService"), @"QualityOfService");
  uint64_t v47 = [(SUCorePolicy *)self updateMetricEventFields];
  [v50 encodeObject:v47 forKey:@"UpdateMetricEventFields"];

  v48 = [(SUCorePolicy *)self updateMetricContext];
  [v50 encodeObject:v48 forKey:@"UpdateMetricContext"];

  uint64_t v49 = [(SUCorePolicy *)self defaultDescriptorValues];
  [v50 encodeObject:v49 forKey:@"DefaultDescriptorValues"];

  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy enablePreSUStaging](self, "enablePreSUStaging"), @"EnablePSUSAssets");
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets"), @"EnablePSUSForOptionalAssets");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicy *)a3;
  if (v4 == self)
  {
    char v57 = 1;
    goto LABEL_136;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v57 = 0;
    goto LABEL_136;
  }
  int64_t v5 = v4;
  int64_t v6 = [(SUCorePolicy *)self specifiedUsedPolicies];
  uint64_t v234 = [(SUCorePolicy *)v5 specifiedUsedPolicies];
  int64_t v235 = v6;
  if (v6 != v234
    || ([(SUCorePolicy *)self softwareUpdateScanPolicy],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [(SUCorePolicy *)v5 softwareUpdateScanPolicy],
        v220 = v8,
        v219 = objc_claimAutoreleasedReturnValue(),
        !objc_msgSend(v8, "isEqual:")))
  {
    int v58 = 0;
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v232 = 0;
    memset(v233, 0, sizeof(v233));
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    goto LABEL_41;
  }
  uint64_t v9 = [(SUCorePolicy *)self documentationScanPolicy];
  [(SUCorePolicy *)v5 documentationScanPolicy];
  v215 = v216 = v9;
  if (!objc_msgSend(v9, "isEqual:"))
  {
    int v58 = 0;
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    memset(v233, 0, 24);
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(_DWORD *)&v233[24] = 1;
    goto LABEL_41;
  }
  uint64_t v10 = [(SUCorePolicy *)self documentationDownloadPolicy];
  [(SUCorePolicy *)v5 documentationDownloadPolicy];
  v213 = v214 = v10;
  if (!objc_msgSend(v10, "isEqual:"))
  {
    int v58 = 0;
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v232 = 0;
    memset(v233, 0, 20);
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    goto LABEL_41;
  }
  long long v11 = [(SUCorePolicy *)self loadBrainPolicy];
  [(SUCorePolicy *)v5 loadBrainPolicy];
  v211 = v212 = v11;
  if (!objc_msgSend(v11, "isEqual:"))
  {
    *(void *)&v233[8] = 0;
    int v58 = 0;
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    *(void *)v233 = 0;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    goto LABEL_41;
  }
  uint64_t v12 = [(SUCorePolicy *)self downloadPreflightPolicy];
  [(SUCorePolicy *)v5 downloadPreflightPolicy];
  v209 = v210 = v12;
  if (!objc_msgSend(v12, "isEqual:"))
  {
    *(void *)&v233[4] = 0;
    int v58 = 0;
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    int v232 = 0;
    *(_DWORD *)v233 = 0;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_DWORD *)&v233[12] = 1;
    goto LABEL_41;
  }
  long long v13 = [(SUCorePolicy *)self wakeupPreflightPolicy];
  [(SUCorePolicy *)v5 wakeupPreflightPolicy];
  v207 = v208 = v13;
  if (!objc_msgSend(v13, "isEqual:"))
  {
    int v58 = 0;
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    *(void *)v233 = 0;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    goto LABEL_41;
  }
  uint64_t v14 = [(SUCorePolicy *)self prerequisiteCheckPreflightPolicy];
  [(SUCorePolicy *)v5 prerequisiteCheckPreflightPolicy];
  v205 = v206 = v14;
  if (!objc_msgSend(v14, "isEqual:"))
  {
    int v59 = 0;
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    *(void *)v233 = 0;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    goto LABEL_41;
  }
  uint64_t v15 = [(SUCorePolicy *)self personalizePreflightPolicy];
  [(SUCorePolicy *)v5 personalizePreflightPolicy];
  v203 = v204 = v15;
  if (!objc_msgSend(v15, "isEqual:"))
  {
    int v60 = 0;
    int v61 = 0;
    int v62 = 0;
    *(void *)v233 = 0;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    goto LABEL_41;
  }
  uint64_t v16 = [(SUCorePolicy *)self fdrRecoveryPreflightPolicy];
  [(SUCorePolicy *)v5 fdrRecoveryPreflightPolicy];
  v201 = v202 = v16;
  if (!objc_msgSend(v16, "isEqual:"))
  {
    int v61 = 0;
    int v62 = 0;
    *(void *)v233 = 0;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    goto LABEL_41;
  }
  long long v17 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
  [(SUCorePolicy *)v5 softwareUpdateDownloadPolicy];
  v199 = v200 = v17;
  if (!objc_msgSend(v17, "isEqual:"))
  {
    int v62 = 0;
    *(void *)v233 = 0;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    goto LABEL_41;
  }
  uint64_t v18 = [(SUCorePolicy *)self preparePolicy];
  [(SUCorePolicy *)v5 preparePolicy];
  v197 = v198 = v18;
  if (!objc_msgSend(v18, "isEqual:"))
  {
    *(void *)v233 = 0;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v232 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    goto LABEL_41;
  }
  long long v19 = [(SUCorePolicy *)self suspendPolicy];
  [(SUCorePolicy *)v5 suspendPolicy];
  v195 = v196 = v19;
  if (!objc_msgSend(v19, "isEqual:"))
  {
    int v232 = 0;
    *(void *)v233 = 0x100000000;
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    goto LABEL_41;
  }
  uint64_t v20 = [(SUCorePolicy *)self resumePolicy];
  v217 = v5;
  [(SUCorePolicy *)v5 resumePolicy];
  v193 = uint64_t v194 = v20;
  if (!objc_msgSend(v20, "isEqual:"))
  {
    int v230 = 0;
    int v231 = 0;
    int v229 = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    goto LABEL_162;
  }
  long long v21 = [(SUCorePolicy *)self applyPolicy];
  [(SUCorePolicy *)v5 applyPolicy];
  v191 = __int16 v192 = v21;
  if (!objc_msgSend(v21, "isEqual:"))
  {
    int v229 = 0;
    int v230 = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v231 = 1;
    goto LABEL_162;
  }
  uint64_t v22 = [(SUCorePolicy *)self rollbackPolicy];
  v189 = [(SUCorePolicy *)v5 rollbackPolicy];
  v190 = v22;
  if (!objc_msgSend(v22, "isEqual:"))
  {
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, sizeof(v227));
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    goto LABEL_162;
  }
  uint64_t v23 = (void *)MEMORY[0x263F77D78];
  uint64_t v24 = [(SUCorePolicy *)v5 softwareUpdateAssetType];
  long long v187 = [(SUCorePolicy *)self softwareUpdateAssetType];
  long long v188 = (void *)v24;
  if (!objc_msgSend(v23, "stringIsEqual:to:", v24))
  {
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    memset(v227, 0, 20);
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    HIDWORD(v227[2]) = 1;
    goto LABEL_162;
  }
  uint64_t v25 = (void *)MEMORY[0x263F77D78];
  uint64_t v26 = [(SUCorePolicy *)v5 documentationAssetType];
  long long v185 = [(SUCorePolicy *)self documentationAssetType];
  long long v186 = (void *)v26;
  if (!objc_msgSend(v25, "stringIsEqual:to:", v26))
  {
    v227[1] = 0;
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    v227[0] = 0;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    goto LABEL_162;
  }
  id v27 = (void *)MEMORY[0x263F77D78];
  uint64_t v28 = [(SUCorePolicy *)v5 targetVolumeUUID];
  id v183 = [(SUCorePolicy *)self targetVolumeUUID];
  id v184 = (void *)v28;
  if (!objc_msgSend(v27, "stringIsEqual:to:", v28))
  {
    uint64_t v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    goto LABEL_162;
  }
  uint64_t v29 = (void *)MEMORY[0x263F77D78];
  uint64_t v30 = [(SUCorePolicy *)v5 prerequisiteBuildVersion];
  v181 = [(SUCorePolicy *)self prerequisiteBuildVersion];
  uint64_t v182 = (void *)v30;
  if (!objc_msgSend(v29, "stringIsEqual:to:", v30))
  {
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    uint64_t v223 = 0x100000000;
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    goto LABEL_162;
  }
  id v31 = (void *)MEMORY[0x263F77D78];
  uint64_t v32 = [(SUCorePolicy *)v5 prerequisiteProductVersion];
  __int16 v179 = [(SUCorePolicy *)self prerequisiteProductVersion];
  v180 = (void *)v32;
  if (!objc_msgSend(v31, "stringIsEqual:to:", v32))
  {
    *(void *)v222 = 0;
    memset(v221, 0, sizeof(v221));
    uint64_t v223 = 0x100000000;
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    goto LABEL_162;
  }
  long long v33 = (void *)MEMORY[0x263F77D78];
  uint64_t v34 = [(SUCorePolicy *)v5 prerequisiteRestoreVersion];
  v177 = [(SUCorePolicy *)self prerequisiteRestoreVersion];
  v178 = (void *)v34;
  if (!objc_msgSend(v33, "stringIsEqual:to:", v34))
  {
    memset(v221, 0, sizeof(v221));
    *(void *)v222 = 0x100000000;
    uint64_t v223 = 0x100000000;
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    goto LABEL_162;
  }
  id v35 = (void *)MEMORY[0x263F77D78];
  uint64_t v36 = [(SUCorePolicy *)v5 targetRestoreVersion];
  uint64_t v175 = [(SUCorePolicy *)self targetRestoreVersion];
  v176 = (void *)v36;
  if (!objc_msgSend(v35, "stringIsEqual:to:", v36))
  {
    memset(v221, 0, 20);
    *(void *)v222 = 0x100000000;
    uint64_t v223 = 0x100000000;
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    HIDWORD(v221[2]) = 1;
    goto LABEL_162;
  }
  uint64_t v37 = (void *)MEMORY[0x263F77D78];
  uint64_t v38 = [(SUCorePolicy *)v5 installedSFRVersion];
  uint64_t v173 = [(SUCorePolicy *)self installedSFRVersion];
  uint64_t v174 = (void *)v38;
  if (!objc_msgSend(v37, "stringIsEqual:to:", v38))
  {
    v221[0] = 0;
    v221[1] = 0;
    *(void *)v222 = 0x100000000;
    uint64_t v223 = 0x100000000;
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    goto LABEL_162;
  }
  id v39 = (void *)MEMORY[0x263F77D78];
  uint64_t v40 = [(SUCorePolicy *)v5 deviceClass];
  long long v171 = [(SUCorePolicy *)self deviceClass];
  long long v172 = (void *)v40;
  if (!objc_msgSend(v39, "stringIsEqual:to:", v40))
  {
    *(void *)((char *)v221 + 4) = 0;
    LODWORD(v221[0]) = 0;
    *(void *)v222 = 0x100000000;
    uint64_t v223 = 0x100000000;
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    HIDWORD(v221[1]) = 1;
    goto LABEL_162;
  }
  char v41 = (void *)MEMORY[0x263F77D78];
  uint64_t v42 = [(SUCorePolicy *)v5 hwModelStr];
  id v169 = [(SUCorePolicy *)self hwModelStr];
  v170 = (void *)v42;
  if (!objc_msgSend(v41, "stringIsEqual:to:", v42))
  {
    v221[0] = 0;
    *(void *)v222 = 0x100000000;
    uint64_t v223 = 0x100000000;
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    goto LABEL_162;
  }
  uint64_t v43 = (void *)MEMORY[0x263F77D78];
  uint64_t v44 = [(SUCorePolicy *)v5 productType];
  id v167 = [(SUCorePolicy *)self productType];
  int v168 = (void *)v44;
  if (!objc_msgSend(v43, "stringIsEqual:to:", v44))
  {
    v221[0] = 0x100000000;
    *(void *)v222 = 0x100000000;
    uint64_t v223 = 0x100000000;
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    goto LABEL_162;
  }
  uint64_t v45 = (void *)MEMORY[0x263F77D78];
  uint64_t v46 = [(SUCorePolicy *)v5 releaseType];
  long long v165 = [(SUCorePolicy *)self releaseType];
  v166 = (void *)v46;
  if (!objc_msgSend(v45, "stringIsEqual:to:", v46)
    || (BOOL v47 = [(SUCorePolicy *)v217 isInternal], v47 != [(SUCorePolicy *)self isInternal])
    || (BOOL v48 = [(SUCorePolicy *)v217 checkAvailableSpace],
        v48 != [(SUCorePolicy *)self checkAvailableSpace])
    || (BOOL v49 = [(SUCorePolicy *)v217 restrictToFull],
        v49 != [(SUCorePolicy *)self restrictToFull])
    || (BOOL v50 = [(SUCorePolicy *)v217 allowSameVersion],
        v50 != [(SUCorePolicy *)self allowSameVersion])
    || (BOOL v51 = [(SUCorePolicy *)v217 background], v51 != [(SUCorePolicy *)self background])
    || (BOOL v52 = [(SUCorePolicy *)v217 allowsCellular],
        v52 != [(SUCorePolicy *)self allowsCellular]))
  {
    *(void *)v222 = 0x100000000;
    uint64_t v223 = 0x100000000;
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
LABEL_162:
    int64_t v5 = v217;
    goto LABEL_41;
  }
  uint64_t v75 = (void *)MEMORY[0x263F77D78];
  uint64_t v76 = [(SUCorePolicy *)v217 userAgentString];
  __int16 v163 = [(SUCorePolicy *)self userAgentString];
  long long v164 = (void *)v76;
  if (!objc_msgSend(v75, "stringIsEqual:to:", v76)
    || (BOOL v77 = [(SUCorePolicy *)v217 performPreflightEncryptedCheck],
        v77 != [(SUCorePolicy *)self performPreflightEncryptedCheck])
    || (BOOL v78 = [(SUCorePolicy *)v217 performPreflightSnapshotCheck],
        v78 != [(SUCorePolicy *)self performPreflightSnapshotCheck]))
  {
    uint64_t v223 = 0x100000000;
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    goto LABEL_162;
  }
  uint64_t v79 = (void *)MEMORY[0x263F77D78];
  uint64_t v80 = [(SUCorePolicy *)v217 ssoToken];
  id v161 = [(SUCorePolicy *)self ssoToken];
  long long v162 = (void *)v80;
  if (!objc_msgSend(v79, "dataIsEqual:to:", v80)
    || (int v81 = [(SUCorePolicy *)v217 cacheDeleteUrgency],
        v81 != [(SUCorePolicy *)self cacheDeleteUrgency]))
  {
    uint64_t v226 = 0;
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    uint64_t v223 = 0x100000001;
    goto LABEL_162;
  }
  long long v82 = (void *)MEMORY[0x263F77D78];
  uint64_t v83 = [(SUCorePolicy *)v217 updateVolumePath];
  id v159 = [(SUCorePolicy *)self updateVolumePath];
  v160 = (void *)v83;
  if (!objc_msgSend(v82, "stringIsEqual:to:", v83))
  {
    uint64_t v225 = 0;
    uint64_t v224 = 0;
    uint64_t v226 = 0x100000000;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    goto LABEL_162;
  }
  uint64_t v84 = (void *)MEMORY[0x263F77D78];
  uint64_t v85 = [(SUCorePolicy *)v217 personalizedManifestRootsPath];
  __int16 v157 = [(SUCorePolicy *)self personalizedManifestRootsPath];
  v158 = (void *)v85;
  if (!objc_msgSend(v84, "stringIsEqual:to:", v85))
  {
    uint64_t v224 = 0;
    uint64_t v225 = 0x100000000;
    uint64_t v226 = 0x100000000;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    goto LABEL_162;
  }
  uint64_t v86 = (void *)MEMORY[0x263F77D78];
  uint64_t v87 = [(SUCorePolicy *)v217 localAuthenticationContext];
  id v155 = [(SUCorePolicy *)self localAuthenticationContext];
  long long v156 = (void *)v87;
  if (!objc_msgSend(v86, "dataIsEqual:to:", v87))
  {
    uint64_t v224 = 0x100000000;
    uint64_t v225 = 0x100000000;
    uint64_t v226 = 0x100000000;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    goto LABEL_162;
  }
  id v88 = (void *)MEMORY[0x263F77D78];
  uint64_t v89 = [(SUCorePolicy *)v217 localAuthenticationUserID];
  v153 = [(SUCorePolicy *)self localAuthenticationUserID];
  long long v154 = (void *)v89;
  if (!objc_msgSend(v88, "numberIsEqual:to:", v89))
  {
    uint64_t v225 = 0x100000000;
    uint64_t v226 = 0x100000000;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    uint64_t v224 = 0x100000001;
    goto LABEL_162;
  }
  v90 = (void *)MEMORY[0x263F77D78];
  uint64_t v91 = [(SUCorePolicy *)v217 mdmBootstrapToken];
  v151 = [(SUCorePolicy *)self mdmBootstrapToken];
  v152 = (void *)v91;
  if (!objc_msgSend(v90, "stringIsEqual:to:", v91))
  {
    uint64_t v226 = 0x100000000;
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    uint64_t v224 = 0x100000001;
    uint64_t v225 = 0x100000001;
    goto LABEL_162;
  }
  v92 = (void *)MEMORY[0x263F77D78];
  uint64_t v93 = [(SUCorePolicy *)v217 downloadAuthorizationHeader];
  id v149 = [(SUCorePolicy *)self downloadAuthorizationHeader];
  id v150 = (void *)v93;
  if (!objc_msgSend(v92, "stringIsEqual:to:", v93))
  {
    v227[0] = 0;
    v227[1] = 0x100000000;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    uint64_t v225 = 0x100000001;
    uint64_t v224 = 0x100000001;
    uint64_t v226 = 0x100000001;
    goto LABEL_162;
  }
  uint64_t v94 = (void *)MEMORY[0x263F77D78];
  uint64_t v95 = [(SUCorePolicy *)v217 updateBrainLocationOverride];
  id v147 = [(SUCorePolicy *)self updateBrainLocationOverride];
  v148 = (void *)v95;
  if (!objc_msgSend(v94, "stringIsEqual:to:", v95))
  {
    *(void *)((char *)v227 + 4) = 0;
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    HIDWORD(v227[1]) = 1;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    uint64_t v226 = 0x100000001;
    uint64_t v225 = 0x100000001;
    uint64_t v224 = 0x100000001;
    LODWORD(v227[0]) = 1;
    goto LABEL_162;
  }
  uint64_t v96 = (void *)MEMORY[0x263F77D78];
  uint64_t v97 = [(SUCorePolicy *)v217 assetAudienceUUID];
  id v145 = [(SUCorePolicy *)self assetAudienceUUID];
  v146 = (void *)v97;
  if (!objc_msgSend(v96, "stringIsEqual:to:", v97))
  {
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    uint64_t v226 = 0x100000001;
    uint64_t v225 = 0x100000001;
    uint64_t v224 = 0x100000001;
    v227[0] = 1;
    v227[1] = 0x100000001;
    goto LABEL_162;
  }
  uint64_t v98 = (void *)MEMORY[0x263F77D78];
  uint64_t v99 = [(SUCorePolicy *)v217 alternateAssetAudienceUUID];
  id v143 = [(SUCorePolicy *)self alternateAssetAudienceUUID];
  uint64_t v144 = (void *)v99;
  if (!objc_msgSend(v98, "stringIsEqual:to:", v99)
    || (BOOL v100 = [(SUCorePolicy *)v217 disableAlternateUpdate],
        v100 != [(SUCorePolicy *)self disableAlternateUpdate])
    || (BOOL v101 = [(SUCorePolicy *)v217 disableSplatCombo],
        v101 != [(SUCorePolicy *)self disableSplatCombo]))
  {
    uint64_t v228 = 0;
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    uint64_t v226 = 0x100000001;
    uint64_t v225 = 0x100000001;
    uint64_t v224 = 0x100000001;
    v227[0] = 0x100000001;
    goto LABEL_162;
  }
  id v102 = (void *)MEMORY[0x263F77D78];
  uint64_t v103 = [(SUCorePolicy *)v217 personalizationServerURL];
  id v141 = [(SUCorePolicy *)self personalizationServerURL];
  __int16 v142 = (void *)v103;
  if (!objc_msgSend(v102, "stringIsEqual:to:", v103))
  {
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    uint64_t v226 = 0x100000001;
    uint64_t v225 = 0x100000001;
    uint64_t v224 = 0x100000001;
    v227[0] = 0x100000001;
    uint64_t v228 = 1;
    goto LABEL_162;
  }
  v104 = (void *)MEMORY[0x263F77D78];
  uint64_t v105 = [(SUCorePolicy *)v217 proxyHostName];
  v139 = [(SUCorePolicy *)self proxyHostName];
  v140 = (void *)v105;
  if (!objc_msgSend(v104, "stringIsEqual:to:", v105))
  {
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v230 = 0;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    uint64_t v226 = 0x100000001;
    uint64_t v225 = 0x100000001;
    uint64_t v224 = 0x100000001;
    v227[0] = 0x100000001;
    uint64_t v228 = 0x100000001;
    goto LABEL_162;
  }
  v106 = (void *)MEMORY[0x263F77D78];
  uint64_t v107 = [(SUCorePolicy *)v217 proxyPortNumber];
  long long v137 = [(SUCorePolicy *)self proxyPortNumber];
  long long v138 = (void *)v107;
  if (!objc_msgSend(v106, "numberIsEqual:to:", v107)
    || (BOOL v108 = [(SUCorePolicy *)v217 bridgeOSIgnoreMinimumVersionCheck],
        v108 != [(SUCorePolicy *)self bridgeOSIgnoreMinimumVersionCheck]))
  {
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    int v232 = 0;
    *(void *)v233 = 0x100000001;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    uint64_t v226 = 0x100000001;
    uint64_t v225 = 0x100000001;
    uint64_t v224 = 0x100000001;
    v227[0] = 0x100000001;
    uint64_t v228 = 0x100000001;
    int v230 = 1;
    goto LABEL_162;
  }
  id v109 = (void *)MEMORY[0x263F77D78];
  uint64_t v110 = [(SUCorePolicy *)v217 bridgeOSDownloadDirectory];
  long long v135 = [(SUCorePolicy *)self bridgeOSDownloadDirectory];
  long long v136 = (void *)v110;
  if (!objc_msgSend(v109, "stringIsEqual:to:", v110)
    || (BOOL v111 = [(SUCorePolicy *)v217 enableEmbeddedOSInstall],
        v111 != [(SUCorePolicy *)self enableEmbeddedOSInstall])
    || (BOOL v112 = [(SUCorePolicy *)v217 enableBridgeOSInstall],
        v112 != [(SUCorePolicy *)self enableBridgeOSInstall])
    || (BOOL v113 = [(SUCorePolicy *)v217 enableOSPersonalization],
        v113 != [(SUCorePolicy *)self enableOSPersonalization])
    || (BOOL v114 = [(SUCorePolicy *)v217 userInitiated],
        v114 != [(SUCorePolicy *)self userInitiated])
    || (BOOL v115 = [(SUCorePolicy *)v217 skipVolumeSealing],
        v115 != [(SUCorePolicy *)self skipVolumeSealing])
    || (int v116 = [(SUCorePolicy *)v217 qualityOfService],
        v116 != [(SUCorePolicy *)self qualityOfService]))
  {
    int v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    *(void *)v233 = 0x100000001;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    uint64_t v226 = 0x100000001;
    uint64_t v225 = 0x100000001;
    uint64_t v224 = 0x100000001;
    v227[0] = 0x100000001;
    uint64_t v228 = 0x100000001;
    int v230 = 1;
    int v232 = 1;
    goto LABEL_162;
  }
  id v117 = (void *)MEMORY[0x263F77D78];
  uint64_t v118 = [(SUCorePolicy *)v217 updateMetricEventFields];
  id v133 = [(SUCorePolicy *)self updateMetricEventFields];
  id v134 = (void *)v118;
  if (!objc_msgSend(v117, "dictionaryIsEqual:to:", v118))
  {
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    *(void *)v233 = 0x100000001;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    uint64_t v226 = 0x100000001;
    uint64_t v225 = 0x100000001;
    uint64_t v224 = 0x100000001;
    v227[0] = 0x100000001;
    uint64_t v228 = 0x100000001;
    int v230 = 1;
    int v232 = 1;
    int v53 = 1;
    goto LABEL_162;
  }
  uint64_t v119 = (void *)MEMORY[0x263F77D78];
  uint64_t v120 = [(SUCorePolicy *)v217 updateMetricContext];
  long long v131 = [(SUCorePolicy *)self updateMetricContext];
  v132 = (void *)v120;
  if (!objc_msgSend(v119, "stringIsEqual:to:", v120))
  {
    int v55 = 0;
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    *(void *)v233 = 0x100000001;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    uint64_t v226 = 0x100000001;
    uint64_t v225 = 0x100000001;
    uint64_t v224 = 0x100000001;
    v227[0] = 0x100000001;
    uint64_t v228 = 0x100000001;
    int v230 = 1;
    int v232 = 1;
    int v53 = 1;
    int v54 = 1;
    goto LABEL_162;
  }
  id v121 = (void *)MEMORY[0x263F77D78];
  uint64_t v122 = [(SUCorePolicy *)v217 defaultDescriptorValues];
  id v129 = [(SUCorePolicy *)self defaultDescriptorValues];
  long long v130 = (void *)v122;
  if (!objc_msgSend(v121, "dictionaryIsEqual:to:", v122)
    || (BOOL v123 = [(SUCorePolicy *)v217 enablePreSUStaging],
        v123 != [(SUCorePolicy *)self enablePreSUStaging])
    || (BOOL v124 = [(SUCorePolicy *)v217 enablePreSUStagingForOptionalAssets],
        v124 != [(SUCorePolicy *)self enablePreSUStagingForOptionalAssets]))
  {
    int v56 = 0;
    char v57 = 0;
    *(void *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(void *)&v233[8] = 0x100000001;
    int v58 = 1;
    int v59 = 1;
    int v60 = 1;
    int v61 = 1;
    int v62 = 1;
    *(void *)v233 = 0x100000001;
    int v231 = 1;
    int v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    uint64_t v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(void *)v222 = 0x100000001;
    uint64_t v226 = 0x100000001;
    uint64_t v225 = 0x100000001;
    uint64_t v224 = 0x100000001;
    v227[0] = 0x100000001;
    uint64_t v228 = 0x100000001;
    int v230 = 1;
    int v232 = 1;
    int v53 = 1;
    int v54 = 1;
    int v55 = 1;
    goto LABEL_162;
  }
  id v125 = (void *)MEMORY[0x263F77D78];
  uint64_t v126 = [(SUCorePolicy *)self policyExtensions];
  int64_t v5 = v217;
  uint64_t v127 = [(SUCorePolicy *)v217 policyExtensions];
  long long v128 = (void *)v126;
  char v57 = [v125 arrayIsEqual:v126 to:v127];
  uint64_t v7 = (void *)v127;
  int v56 = 1;
  *(void *)&v233[20] = 0x100000001;
  *(_DWORD *)&v233[16] = 1;
  *(void *)&v233[8] = 0x100000001;
  int v58 = 1;
  int v59 = 1;
  int v60 = 1;
  int v61 = 1;
  int v62 = 1;
  *(void *)v233 = 0x100000001;
  int v231 = 1;
  int v229 = 1;
  v227[2] = 0x100000001;
  v227[1] = 0x100000001;
  uint64_t v223 = 0x100000001;
  *(_DWORD *)&v222[8] = 1;
  v221[2] = 0x100000001;
  v221[1] = 0x100000001;
  v221[0] = 0x100000001;
  *(void *)v222 = 0x100000001;
  uint64_t v226 = 0x100000001;
  uint64_t v225 = 0x100000001;
  uint64_t v224 = 0x100000001;
  v227[0] = 0x100000001;
  uint64_t v228 = 0x100000001;
  int v230 = 1;
  int v232 = 1;
  int v53 = 1;
  int v54 = 1;
  int v55 = 1;
LABEL_41:
  if (v56)
  {
    v218 = v4;
    int v63 = v62;
    int v64 = v61;
    char v65 = v57;
    int v66 = v60;
    int v67 = v59;
    long long v68 = v5;
    int v69 = v53;
    int v70 = v58;
    int v71 = v54;
    int v72 = v55;

    int v73 = v72;
    int v54 = v71;
    int v58 = v70;
    int v53 = v69;
    int64_t v5 = v68;
    int v59 = v67;
    int v60 = v66;
    char v57 = v65;
    int v61 = v64;
    int v62 = v63;
    id v4 = v218;
    if (!v73) {
      goto LABEL_43;
    }
  }
  else if (!v55)
  {
LABEL_43:
    if (v54) {
      goto LABEL_44;
    }
LABEL_48:
    if (!v53) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }

  if (!v54) {
    goto LABEL_48;
  }
LABEL_44:

  if (v53)
  {
LABEL_49:
  }
LABEL_50:
  if (v232)
  {
  }
  if (v230)
  {
  }
  if (HIDWORD(v228))
  {
  }
  if (v228)
  {
  }
  if (HIDWORD(v227[0]))
  {
  }
  if (LODWORD(v227[1]))
  {
  }
  if (LODWORD(v227[0]))
  {
  }
  if (v226)
  {
  }
  if (v225)
  {
  }
  if (v224)
  {
  }
  if (HIDWORD(v224))
  {
  }
  if (HIDWORD(v225))
  {
  }
  if (HIDWORD(v226))
  {
  }
  if (v223)
  {
  }
  if (*(_DWORD *)v222)
  {
  }
  if (LODWORD(v221[0]))
  {
  }
  if (HIDWORD(v221[0]))
  {
  }
  if (LODWORD(v221[1]))
  {
  }
  if (HIDWORD(v221[1]))
  {
  }
  if (LODWORD(v221[2]))
  {
  }
  if (HIDWORD(v221[2]))
  {
  }
  if (*(_DWORD *)&v222[4])
  {
  }
  if (*(_DWORD *)&v222[8])
  {
  }
  if (HIDWORD(v223))
  {
  }
  if (HIDWORD(v227[1]))
  {
  }
  if (LODWORD(v227[2]))
  {
  }
  if (HIDWORD(v227[2]))
  {
  }
  if (v229)
  {
  }
  if (v231)
  {
  }
  if (*(_DWORD *)v233)
  {
  }
  if (*(_DWORD *)&v233[4])
  {

    if (!v62) {
      goto LABEL_112;
    }
  }
  else if (!v62)
  {
LABEL_112:
    if (v61) {
      goto LABEL_113;
    }
    goto LABEL_119;
  }

  if (v61)
  {
LABEL_113:

    if (!v60) {
      goto LABEL_114;
    }
    goto LABEL_120;
  }
LABEL_119:
  if (!v60)
  {
LABEL_114:
    if (v59) {
      goto LABEL_115;
    }
    goto LABEL_121;
  }
LABEL_120:

  if (v59)
  {
LABEL_115:

    if (!v58) {
      goto LABEL_123;
    }
    goto LABEL_122;
  }
LABEL_121:
  if (v58)
  {
LABEL_122:
  }
LABEL_123:
  if (*(_DWORD *)&v233[8])
  {
  }
  if (*(_DWORD *)&v233[12])
  {
  }
  if (*(_DWORD *)&v233[16])
  {
  }
  if (*(_DWORD *)&v233[20])
  {
  }
  if (*(_DWORD *)&v233[24])
  {
  }
  if (v235 == v234)
  {
  }
LABEL_136:

  return v57;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v6 = [(SUCorePolicy *)self softwareUpdateAssetType];
  uint64_t v7 = [(SUCorePolicy *)self documentationAssetType];
  int64_t v8 = [(SUCorePolicy *)self specifiedUsedPolicies];
  uint64_t v9 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v10 = (void *)[v5 initWithSoftwareUpdateAssetType:v6 documentationAssetType:v7 usingPolicies:v8 usingExtensions:v9];

  long long v11 = [v10 softwareUpdateScanPolicy];
  uint64_t v12 = [v11 specifiedFields];

  long long v13 = [v10 documentationScanPolicy];
  uint64_t v14 = [v13 specifiedFields];

  uint64_t v15 = [v10 documentationDownloadPolicy];
  uint64_t v16 = [v15 specifiedFields];

  long long v17 = [v10 loadBrainPolicy];
  uint64_t v18 = [v17 specifiedFields];

  long long v19 = [v10 downloadPreflightPolicy];
  uint64_t v20 = [v19 specifiedFields];

  long long v21 = [v10 softwareUpdateDownloadPolicy];
  uint64_t v22 = [v21 specifiedFields];

  objc_msgSend(v10, "setRestrictToFull:", -[SUCorePolicy restrictToFull](self, "restrictToFull"));
  objc_msgSend(v10, "setAllowSameVersion:", -[SUCorePolicy allowSameVersion](self, "allowSameVersion"));
  objc_msgSend(v10, "setBackground:", -[SUCorePolicy background](self, "background"));
  objc_msgSend(v10, "setAllowsCellular:", -[SUCorePolicy allowsCellular](self, "allowsCellular"));
  uint64_t v23 = [v10 softwareUpdateScanPolicy];
  [v23 setSpecifiedFields:v12];

  uint64_t v24 = [v10 documentationScanPolicy];
  [v24 setSpecifiedFields:v14];

  uint64_t v25 = [v10 documentationDownloadPolicy];
  [v25 setSpecifiedFields:v16];

  uint64_t v26 = [v10 loadBrainPolicy];
  [v26 setSpecifiedFields:v18];

  id v27 = [v10 downloadPreflightPolicy];
  [v27 setSpecifiedFields:v20];

  uint64_t v28 = [v10 softwareUpdateDownloadPolicy];
  [v28 setSpecifiedFields:v22];

  uint64_t v29 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  uint64_t v30 = (void *)[v29 copyWithZone:a3];
  [v10 setSoftwareUpdateScanPolicy:v30];

  id v31 = [(SUCorePolicy *)self documentationScanPolicy];
  uint64_t v32 = (void *)[v31 copyWithZone:a3];
  [v10 setDocumentationScanPolicy:v32];

  long long v33 = [(SUCorePolicy *)self documentationDownloadPolicy];
  uint64_t v34 = (void *)[v33 copyWithZone:a3];
  [v10 setDocumentationDownloadPolicy:v34];

  id v35 = [(SUCorePolicy *)self loadBrainPolicy];
  uint64_t v36 = (void *)[v35 copyWithZone:a3];
  [v10 setLoadBrainPolicy:v36];

  uint64_t v37 = [(SUCorePolicy *)self downloadPreflightPolicy];
  uint64_t v38 = (void *)[v37 copyWithZone:a3];
  [v10 setDownloadPreflightPolicy:v38];

  id v39 = [(SUCorePolicy *)self wakeupPreflightPolicy];
  uint64_t v40 = (void *)[v39 copyWithZone:a3];
  [v10 setWakeupPreflightPolicy:v40];

  char v41 = [(SUCorePolicy *)self prerequisiteCheckPreflightPolicy];
  uint64_t v42 = (void *)[v41 copyWithZone:a3];
  [v10 setPrerequisiteCheckPreflightPolicy:v42];

  uint64_t v43 = [(SUCorePolicy *)self personalizePreflightPolicy];
  uint64_t v44 = (void *)[v43 copyWithZone:a3];
  [v10 setPersonalizePreflightPolicy:v44];

  uint64_t v45 = [(SUCorePolicy *)self fdrRecoveryPreflightPolicy];
  uint64_t v46 = (void *)[v45 copyWithZone:a3];
  [v10 setFdrRecoveryPreflightPolicy:v46];

  BOOL v47 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
  BOOL v48 = (void *)[v47 copyWithZone:a3];
  [v10 setSoftwareUpdateDownloadPolicy:v48];

  BOOL v49 = [(SUCorePolicy *)self preparePolicy];
  BOOL v50 = (void *)[v49 copyWithZone:a3];
  [v10 setPreparePolicy:v50];

  BOOL v51 = [(SUCorePolicy *)self suspendPolicy];
  BOOL v52 = (void *)[v51 copyWithZone:a3];
  [v10 setSuspendPolicy:v52];

  int v53 = [(SUCorePolicy *)self resumePolicy];
  int v54 = (void *)[v53 copyWithZone:a3];
  [v10 setResumePolicy:v54];

  int v55 = [(SUCorePolicy *)self applyPolicy];
  int v56 = (void *)[v55 copyWithZone:a3];
  [v10 setApplyPolicy:v56];

  char v57 = [(SUCorePolicy *)self rollbackPolicy];
  int v58 = (void *)[v57 copyWithZone:a3];
  [v10 setRollbackPolicy:v58];

  int v59 = [(SUCorePolicy *)self prerequisiteBuildVersion];
  int v60 = (void *)[v59 copyWithZone:a3];
  [v10 setPrerequisiteBuildVersion:v60];

  int v61 = [(SUCorePolicy *)self prerequisiteProductVersion];
  int v62 = (void *)[v61 copyWithZone:a3];
  [v10 setPrerequisiteProductVersion:v62];

  int v63 = [(SUCorePolicy *)self prerequisiteRestoreVersion];
  int v64 = (void *)[v63 copyWithZone:a3];
  [v10 setPrerequisiteRestoreVersion:v64];

  char v65 = [(SUCorePolicy *)self targetRestoreVersion];
  int v66 = (void *)[v65 copyWithZone:a3];
  [v10 setTargetRestoreVersion:v66];

  int v67 = [(SUCorePolicy *)self installedSFRVersion];
  long long v68 = (void *)[v67 copyWithZone:a3];
  [v10 setInstalledSFRVersion:v68];

  int v69 = [(SUCorePolicy *)self targetVolumeUUID];
  int v70 = (void *)[v69 copyWithZone:a3];
  [v10 setTargetVolumeUUID:v70];

  int v71 = [(SUCorePolicy *)self deviceClass];
  int v72 = (void *)[v71 copyWithZone:a3];
  [v10 setDeviceClass:v72];

  int v73 = [(SUCorePolicy *)self hwModelStr];
  uint64_t v74 = (void *)[v73 copyWithZone:a3];
  [v10 setHwModelStr:v74];

  uint64_t v75 = [(SUCorePolicy *)self productType];
  uint64_t v76 = (void *)[v75 copyWithZone:a3];
  [v10 setProductType:v76];

  BOOL v77 = [(SUCorePolicy *)self releaseType];
  BOOL v78 = (void *)[v77 copyWithZone:a3];
  [v10 setReleaseType:v78];

  objc_msgSend(v10, "setIsInternal:", -[SUCorePolicy isInternal](self, "isInternal"));
  objc_msgSend(v10, "setCheckAvailableSpace:", -[SUCorePolicy checkAvailableSpace](self, "checkAvailableSpace"));
  objc_msgSend(v10, "setCacheDeleteUrgency:", -[SUCorePolicy cacheDeleteUrgency](self, "cacheDeleteUrgency"));
  uint64_t v79 = [(SUCorePolicy *)self userAgentString];
  uint64_t v80 = (void *)[v79 copyWithZone:a3];
  [v10 setUserAgentString:v80];

  objc_msgSend(v10, "setPerformPreflightEncryptedCheck:", -[SUCorePolicy performPreflightEncryptedCheck](self, "performPreflightEncryptedCheck"));
  objc_msgSend(v10, "setPerformPreflightSnapshotCheck:", -[SUCorePolicy performPreflightSnapshotCheck](self, "performPreflightSnapshotCheck"));
  int v81 = [(SUCorePolicy *)self updateVolumePath];
  long long v82 = (void *)[v81 copyWithZone:a3];
  [v10 setUpdateVolumePath:v82];

  uint64_t v83 = [(SUCorePolicy *)self ssoToken];
  uint64_t v84 = (void *)[v83 copyWithZone:a3];
  [v10 setSsoToken:v84];

  uint64_t v85 = [(SUCorePolicy *)self personalizedManifestRootsPath];
  uint64_t v86 = (void *)[v85 copyWithZone:a3];
  [v10 setPersonalizedManifestRootsPath:v86];

  uint64_t v87 = [(SUCorePolicy *)self localAuthenticationContext];
  id v88 = (void *)[v87 copyWithZone:a3];
  [v10 setLocalAuthenticationContext:v88];

  uint64_t v89 = [(SUCorePolicy *)self localAuthenticationUserID];
  v90 = (void *)[v89 copyWithZone:a3];
  [v10 setLocalAuthenticationUserID:v90];

  uint64_t v91 = [(SUCorePolicy *)self mdmBootstrapToken];
  v92 = (void *)[v91 copyWithZone:a3];
  [v10 setMdmBootstrapToken:v92];

  uint64_t v93 = [(SUCorePolicy *)self downloadAuthorizationHeader];
  uint64_t v94 = (void *)[v93 copyWithZone:a3];
  [v10 setDownloadAuthorizationHeader:v94];

  uint64_t v95 = [(SUCorePolicy *)self updateBrainLocationOverride];
  uint64_t v96 = (void *)[v95 copyWithZone:a3];
  [v10 setUpdateBrainLocationOverride:v96];

  uint64_t v97 = [(SUCorePolicy *)self assetAudienceUUID];
  uint64_t v98 = (void *)[v97 copyWithZone:a3];
  [v10 setAssetAudienceUUID:v98];

  uint64_t v99 = [(SUCorePolicy *)self alternateAssetAudienceUUID];
  BOOL v100 = (void *)[v99 copyWithZone:a3];
  [v10 setAlternateAssetAudienceUUID:v100];

  objc_msgSend(v10, "setDisableAlternateUpdate:", -[SUCorePolicy disableAlternateUpdate](self, "disableAlternateUpdate"));
  objc_msgSend(v10, "setDisableSplatCombo:", -[SUCorePolicy disableSplatCombo](self, "disableSplatCombo"));
  BOOL v101 = [(SUCorePolicy *)self personalizationServerURL];
  id v102 = (void *)[v101 copyWithZone:a3];
  [v10 setPersonalizationServerURL:v102];

  uint64_t v103 = [(SUCorePolicy *)self proxyHostName];
  v104 = (void *)[v103 copyWithZone:a3];
  [v10 setProxyHostName:v104];

  uint64_t v105 = [(SUCorePolicy *)self proxyPortNumber];
  v106 = (void *)[v105 copyWithZone:a3];
  [v10 setProxyPortNumber:v106];

  objc_msgSend(v10, "setBridgeOSIgnoreMinimumVersionCheck:", -[SUCorePolicy bridgeOSIgnoreMinimumVersionCheck](self, "bridgeOSIgnoreMinimumVersionCheck"));
  uint64_t v107 = [(SUCorePolicy *)self bridgeOSDownloadDirectory];
  BOOL v108 = (void *)[v107 copyWithZone:a3];
  [v10 setBridgeOSDownloadDirectory:v108];

  objc_msgSend(v10, "setEnableEmbeddedOSInstall:", -[SUCorePolicy enableEmbeddedOSInstall](self, "enableEmbeddedOSInstall"));
  objc_msgSend(v10, "setEnableBridgeOSInstall:", -[SUCorePolicy enableBridgeOSInstall](self, "enableBridgeOSInstall"));
  objc_msgSend(v10, "setEnableOSPersonalization:", -[SUCorePolicy enableOSPersonalization](self, "enableOSPersonalization"));
  objc_msgSend(v10, "setUserInitiated:", -[SUCorePolicy userInitiated](self, "userInitiated"));
  objc_msgSend(v10, "setSkipVolumeSealing:", -[SUCorePolicy skipVolumeSealing](self, "skipVolumeSealing"));
  objc_msgSend(v10, "setQualityOfService:", -[SUCorePolicy qualityOfService](self, "qualityOfService"));
  id v109 = [(SUCorePolicy *)self updateMetricEventFields];
  uint64_t v110 = (void *)[v109 copyWithZone:a3];
  [v10 setUpdateMetricEventFields:v110];

  BOOL v111 = [(SUCorePolicy *)self updateMetricContext];
  BOOL v112 = (void *)[v111 copyWithZone:a3];
  [v10 setUpdateMetricContext:v112];

  BOOL v113 = [(SUCorePolicy *)self defaultDescriptorValues];
  BOOL v114 = (void *)[v113 copyWithZone:a3];
  [v10 setDefaultDescriptorValues:v114];

  objc_msgSend(v10, "setEnablePreSUStaging:", -[SUCorePolicy enablePreSUStaging](self, "enablePreSUStaging"));
  objc_msgSend(v10, "setEnablePreSUStagingForOptionalAssets:", -[SUCorePolicy enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets"));
  return v10;
}

- (id)description
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v4 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v103 objects:v107 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v104 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v103 + 1) + 8 * i);
        uint64_t v10 = [v9 extensionName];
        [v3 appendFormat:@"\n\t%@:%@", v10, v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v103 objects:v107 count:16];
    }
    while (v6);
  }

  id v11 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v12 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  [v11 appendFormat:@"    %@\n", v12];

  long long v13 = [(SUCorePolicy *)self documentationScanPolicy];
  [v11 appendFormat:@"    %@\n", v13];

  uint64_t v14 = [(SUCorePolicy *)self documentationDownloadPolicy];
  [v11 appendFormat:@"    %@\n", v14];

  uint64_t v15 = [(SUCorePolicy *)self loadBrainPolicy];
  [v11 appendFormat:@"    %@\n", v15];

  uint64_t v16 = [(SUCorePolicy *)self downloadPreflightPolicy];
  [v11 appendFormat:@"    %@\n", v16];

  long long v17 = [(SUCorePolicy *)self wakeupPreflightPolicy];
  [v11 appendFormat:@"    %@\n", v17];

  uint64_t v18 = [(SUCorePolicy *)self prerequisiteCheckPreflightPolicy];
  [v11 appendFormat:@"    %@\n", v18];

  long long v19 = [(SUCorePolicy *)self personalizePreflightPolicy];
  [v11 appendFormat:@"    %@\n", v19];

  uint64_t v20 = [(SUCorePolicy *)self fdrRecoveryPreflightPolicy];
  [v11 appendFormat:@"    %@\n", v20];

  long long v21 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
  [v11 appendFormat:@"    %@\n", v21];

  uint64_t v22 = [(SUCorePolicy *)self preparePolicy];
  [v11 appendFormat:@"    %@\n", v22];

  uint64_t v23 = [(SUCorePolicy *)self suspendPolicy];
  [v11 appendFormat:@"    %@\n", v23];

  uint64_t v24 = [(SUCorePolicy *)self resumePolicy];
  [v11 appendFormat:@"    %@\n", v24];

  uint64_t v25 = [(SUCorePolicy *)self applyPolicy];
  uint64_t v91 = v11;
  [v11 appendFormat:@"    %@\n", v25];

  uint64_t v26 = [(SUCorePolicy *)self rollbackPolicy];
  [v11 appendFormat:@"    %@\n", v26];

  id v81 = [NSString alloc];
  int64_t v80 = [(SUCorePolicy *)self specifiedUsedPolicies];
  id v102 = [(SUCorePolicy *)self softwareUpdateAssetType];
  BOOL v101 = [(SUCorePolicy *)self documentationAssetType];
  BOOL v100 = [(SUCorePolicy *)self prerequisiteBuildVersion];
  uint64_t v99 = [(SUCorePolicy *)self prerequisiteProductVersion];
  uint64_t v98 = [(SUCorePolicy *)self prerequisiteRestoreVersion];
  uint64_t v97 = [(SUCorePolicy *)self targetRestoreVersion];
  uint64_t v96 = [(SUCorePolicy *)self installedSFRVersion];
  uint64_t v95 = [(SUCorePolicy *)self deviceClass];
  uint64_t v94 = [(SUCorePolicy *)self hwModelStr];
  uint64_t v93 = [(SUCorePolicy *)self productType];
  v92 = [(SUCorePolicy *)self releaseType];
  if ([(SUCorePolicy *)self isInternal]) {
    id v27 = @"YES";
  }
  else {
    id v27 = @"NO";
  }
  uint64_t v79 = v27;
  if ([(SUCorePolicy *)self restrictToFull]) {
    uint64_t v28 = @"YES";
  }
  else {
    uint64_t v28 = @"NO";
  }
  BOOL v78 = v28;
  if ([(SUCorePolicy *)self allowSameVersion]) {
    uint64_t v29 = @"YES";
  }
  else {
    uint64_t v29 = @"NO";
  }
  BOOL v77 = v29;
  if ([(SUCorePolicy *)self background]) {
    uint64_t v30 = @"YES";
  }
  else {
    uint64_t v30 = @"NO";
  }
  uint64_t v76 = v30;
  if ([(SUCorePolicy *)self allowsCellular]) {
    id v31 = @"YES";
  }
  else {
    id v31 = @"NO";
  }
  uint64_t v75 = v31;
  if ([(SUCorePolicy *)self checkAvailableSpace]) {
    uint64_t v32 = @"YES";
  }
  else {
    uint64_t v32 = @"NO";
  }
  int v73 = v32;
  uint64_t v89 = +[SUCoreSpace cacheDeleteUrgencyName:[(SUCorePolicy *)self cacheDeleteUrgency]];
  v90 = [(SUCorePolicy *)self userAgentString];
  if ([(SUCorePolicy *)self userInitiated]) {
    long long v33 = @"YES";
  }
  else {
    long long v33 = @"NO";
  }
  int v72 = v33;
  if ([(SUCorePolicy *)self skipVolumeSealing]) {
    uint64_t v34 = @"YES";
  }
  else {
    uint64_t v34 = @"NO";
  }
  int v71 = v34;
  uint64_t v87 = [(SUCorePolicy *)self stringForQoS:[(SUCorePolicy *)self qualityOfService]];
  id v88 = [(SUCorePolicy *)self targetVolumeUUID];
  uint64_t v84 = [(SUCorePolicy *)self updateVolumePath];
  if ([(SUCorePolicy *)self performPreflightEncryptedCheck]) {
    id v35 = @"YES";
  }
  else {
    id v35 = @"NO";
  }
  long long v68 = v35;
  if ([(SUCorePolicy *)self performPreflightSnapshotCheck]) {
    uint64_t v36 = @"YES";
  }
  else {
    uint64_t v36 = @"NO";
  }
  int v66 = v36;
  uint64_t v86 = [(SUCorePolicy *)self updateBrainLocationOverride];
  uint64_t v74 = [(SUCorePolicy *)self ssoToken];
  if (v74) {
    uint64_t v37 = @"present";
  }
  else {
    uint64_t v37 = @"none";
  }
  int v63 = v37;
  uint64_t v85 = [(SUCorePolicy *)self personalizedManifestRootsPath];
  uint64_t v83 = [(SUCorePolicy *)self personalizationServerURL];
  char v65 = [(SUCorePolicy *)self proxyHostName];
  int v64 = [(SUCorePolicy *)self proxyPortNumber];
  int v70 = [(SUCorePolicy *)self localAuthenticationContext];
  if (v70) {
    uint64_t v38 = @"present";
  }
  else {
    uint64_t v38 = @"none";
  }
  int v69 = [(SUCorePolicy *)self downloadAuthorizationHeader];
  if (v69) {
    id v39 = @"present";
  }
  else {
    id v39 = @"none";
  }
  int v61 = v39;
  int v62 = [(SUCorePolicy *)self localAuthenticationUserID];
  int v67 = [(SUCorePolicy *)self mdmBootstrapToken];
  if (v67) {
    uint64_t v40 = @"present";
  }
  else {
    uint64_t v40 = @"none";
  }
  int v59 = v40;
  if ([(SUCorePolicy *)self bridgeOSIgnoreMinimumVersionCheck]) {
    char v41 = @"YES";
  }
  else {
    char v41 = @"NO";
  }
  int v58 = v41;
  int v60 = [(SUCorePolicy *)self bridgeOSDownloadDirectory];
  if ([(SUCorePolicy *)self enableEmbeddedOSInstall]) {
    uint64_t v42 = @"YES";
  }
  else {
    uint64_t v42 = @"NO";
  }
  int v55 = v42;
  if ([(SUCorePolicy *)self enableBridgeOSInstall]) {
    uint64_t v43 = @"YES";
  }
  else {
    uint64_t v43 = @"NO";
  }
  int v53 = v43;
  if ([(SUCorePolicy *)self enableOSPersonalization]) {
    uint64_t v44 = @"YES";
  }
  else {
    uint64_t v44 = @"NO";
  }
  BOOL v52 = v44;
  uint64_t v45 = [(SUCorePolicy *)self updateMetricEventFields];
  char v57 = [(SUCorePolicy *)self updateMetricContext];
  int v56 = [(SUCorePolicy *)self defaultDescriptorValues];
  int v54 = [(SUCorePolicy *)self assetAudienceUUID];
  uint64_t v46 = [(SUCorePolicy *)self alternateAssetAudienceUUID];
  if ([(SUCorePolicy *)self disableAlternateUpdate]) {
    BOOL v47 = @"YES";
  }
  else {
    BOOL v47 = @"NO";
  }
  if ([(SUCorePolicy *)self disableSplatCombo]) {
    BOOL v48 = @"YES";
  }
  else {
    BOOL v48 = @"NO";
  }
  if ([(SUCorePolicy *)self enablePreSUStaging]) {
    BOOL v49 = @"YES";
  }
  else {
    BOOL v49 = @"NO";
  }
  if ([(SUCorePolicy *)self enablePreSUStagingForOptionalAssets]) {
    BOOL v50 = @"YES";
  }
  else {
    BOOL v50 = @"NO";
  }
  id v82 = (id)objc_msgSend(v81, "initWithFormat:", CFSTR("\n[>>>\n    SubPolicies(specifiedUsedPolicies:0x%llX)\n%@    AssetTypes(softwareUpdateAssetType:%@|documentationAssetType:%@)\n    Versions(prerequisiteBuildVersion:%@|prerequisiteProductVersion:%@|prerequisiteRestoreVersion:%@|targetRestoreVersion:%@|installedSFRVersion:%@)\n    Device(deviceClass:%@|hwModelStr:%@|productType:%@|releaseType:%@|isInternal:%@)\n    Config(restrictToFull:%@|allowSameVersion:%@|background:%@|allowsCellular:%@|checkAvailableSpace:%@|cacheDeleteUrgency:%@|userAgentString:%@|userInitiated:%@|skipVolumeSealing:%@|qualityOfService:%@)\n    Target(targetVolumeUUID:%@|updateVolumePath:%@)\n    Preflight(performPreflightEncryptedCheck:%@|performPreflightSnapshotCheck:%@|updateBrainLocationOverride:%@)\n    Personalization(SSOToken:%@|personalizedManifestRootsPath:%@|personalizationServerURL:%@|proxyHostName:%@|proxyPortNumber:%@)\n    Authentication(localAuthenticationContext:%@|downloadAuthorizationHeader:%@|localAuthenticationUserID:%@|mdmBootstrapToken:%@)\n    BridgeOS(bridgeOSIgnoreMinimumVersionCheck:%@|bridgeOSDownloadDirectory:%@|enableEmbeddedOSInstall:%@|enableBridgeOSInstall:%@|enableOSPersonalization:%@)\n    Metrics(updateMetricEventFields:%@|updateMetricContext:%@\n    Defaults(defaultDescriptorValues:%@|assetAudienceUUID:%@|alternateAssetAudienceUUID:%@|disableAlternateUpdate:%@|disableSplombo:%@)\n    PSUS(enable:%@|enableForOptionalAssets:%@)\n    Extensions(%@)\n<<<]"), v80, v91, v102, v101, v100, v99, v98, v97, v96, v95, v94, v93, v92, v79, v78, v77,
              v76,
              v75,
              v73,
              v89,
              v90,
              v72,
              v71,
              v87,
              v88,
              v84,
              v68,
              v66,
              v86,
              v63,
              v85,
              v83,
              v65,
              v64,
              v38,
              v61,
              v62,
              v59,
              v58,
              v60,
              v55,
              v53,
              v52,
              v45,
              v57,
              v56,
              v54,
              v46,
              v47,
              v48,
              v49,
              v50,
              v3);

  return v82;
}

- (id)summary
{
  id v3 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(SUCorePolicy *)self policyExtensions];
    objc_msgSend(&stru_26C1810A0, "stringByAppendingFormat:", @"|extensions(%lu)", objc_msgSend(v5, "count"));
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = &stru_26C1810A0;
  }
  if ([(SUCorePolicy *)self specifiedUsedPolicies] != 127)
  {
    uint64_t v7 = [(__CFString *)v6 stringByAppendingFormat:@"|SubPolCfg=%llX", [(SUCorePolicy *)self specifiedUsedPolicies]];

    uint64_t v6 = (__CFString *)v7;
  }
  int64_t v8 = [(SUCorePolicy *)self softwareUpdateScanPolicy];

  if (v8)
  {
    uint64_t v9 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
    uint64_t v10 = [v9 summary];
    uint64_t v11 = [(__CFString *)v6 stringByAppendingFormat:@"|UpdateScan=%@", v10];

    uint64_t v6 = (__CFString *)v11;
  }
  uint64_t v12 = [(SUCorePolicy *)self documentationScanPolicy];

  if (v12)
  {
    long long v13 = [(SUCorePolicy *)self documentationScanPolicy];
    uint64_t v14 = [v13 summary];
    uint64_t v15 = [(__CFString *)v6 stringByAppendingFormat:@"|DocScan=%@", v14];

    uint64_t v6 = (__CFString *)v15;
  }
  uint64_t v16 = [(SUCorePolicy *)self documentationDownloadPolicy];

  if (v16)
  {
    long long v17 = [(SUCorePolicy *)self documentationDownloadPolicy];
    uint64_t v18 = [v17 summary];
    uint64_t v19 = [(__CFString *)v6 stringByAppendingFormat:@"|DocDownload=%@", v18];

    uint64_t v6 = (__CFString *)v19;
  }
  uint64_t v20 = [(SUCorePolicy *)self loadBrainPolicy];

  if (v20)
  {
    long long v21 = [(SUCorePolicy *)self loadBrainPolicy];
    uint64_t v22 = [v21 summary];
    uint64_t v23 = [(__CFString *)v6 stringByAppendingFormat:@"|LoadBrainUpdate=%@", v22];

    uint64_t v6 = (__CFString *)v23;
  }
  uint64_t v24 = [(SUCorePolicy *)self downloadPreflightPolicy];

  if (v24)
  {
    uint64_t v25 = [(SUCorePolicy *)self downloadPreflightPolicy];
    uint64_t v26 = [v25 summary];
    uint64_t v27 = [(__CFString *)v6 stringByAppendingFormat:@"|PreflightDownload=%@", v26];

    uint64_t v6 = (__CFString *)v27;
  }
  uint64_t v28 = [(SUCorePolicy *)self wakeupPreflightPolicy];

  if (v28)
  {
    uint64_t v29 = [(SUCorePolicy *)self wakeupPreflightPolicy];
    uint64_t v30 = [v29 summary];
    uint64_t v31 = [(__CFString *)v6 stringByAppendingFormat:@"|PreflightWakeup=%@", v30];

    uint64_t v6 = (__CFString *)v31;
  }
  uint64_t v32 = [(SUCorePolicy *)self prerequisiteCheckPreflightPolicy];

  if (v32)
  {
    long long v33 = [(SUCorePolicy *)self prerequisiteCheckPreflightPolicy];
    uint64_t v34 = [v33 summary];
    uint64_t v35 = [(__CFString *)v6 stringByAppendingFormat:@"|PreflightPrerequisiteCheck=%@", v34];

    uint64_t v6 = (__CFString *)v35;
  }
  uint64_t v36 = [(SUCorePolicy *)self personalizePreflightPolicy];

  if (v36)
  {
    uint64_t v37 = [(SUCorePolicy *)self personalizePreflightPolicy];
    uint64_t v38 = [v37 summary];
    uint64_t v39 = [(__CFString *)v6 stringByAppendingFormat:@"|PreflightPersonalize=%@", v38];

    uint64_t v6 = (__CFString *)v39;
  }
  uint64_t v40 = [(SUCorePolicy *)self fdrRecoveryPreflightPolicy];

  if (v40)
  {
    char v41 = [(SUCorePolicy *)self fdrRecoveryPreflightPolicy];
    uint64_t v42 = [v41 summary];
    uint64_t v43 = [(__CFString *)v6 stringByAppendingFormat:@"|PreflightFDRRecovery=%@", v42];

    uint64_t v6 = (__CFString *)v43;
  }
  uint64_t v44 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];

  if (v44)
  {
    uint64_t v45 = [(SUCorePolicy *)self softwareUpdateDownloadPolicy];
    uint64_t v46 = [v45 summary];
    uint64_t v47 = [(__CFString *)v6 stringByAppendingFormat:@"|DownloadSU=%@", v46];

    uint64_t v6 = (__CFString *)v47;
  }
  BOOL v48 = [(SUCorePolicy *)self preparePolicy];

  if (v48)
  {
    BOOL v49 = [(SUCorePolicy *)self preparePolicy];
    BOOL v50 = [v49 summary];
    uint64_t v51 = [(__CFString *)v6 stringByAppendingFormat:@"|PrepareUpdate=%@", v50];

    uint64_t v6 = (__CFString *)v51;
  }
  BOOL v52 = [(SUCorePolicy *)self suspendPolicy];

  if (v52)
  {
    int v53 = [(SUCorePolicy *)self suspendPolicy];
    int v54 = [v53 summary];
    uint64_t v55 = [(__CFString *)v6 stringByAppendingFormat:@"|SuspendUpdate=%@", v54];

    uint64_t v6 = (__CFString *)v55;
  }
  int v56 = [(SUCorePolicy *)self resumePolicy];

  if (v56)
  {
    char v57 = [(SUCorePolicy *)self resumePolicy];
    int v58 = [v57 summary];
    uint64_t v59 = [(__CFString *)v6 stringByAppendingFormat:@"|ResumeUpdate=%@", v58];

    uint64_t v6 = (__CFString *)v59;
  }
  int v60 = [(SUCorePolicy *)self applyPolicy];

  if (v60)
  {
    int v61 = [(SUCorePolicy *)self applyPolicy];
    int v62 = [v61 summary];
    uint64_t v63 = [(__CFString *)v6 stringByAppendingFormat:@"|ApplyUpdate=%@", v62];

    uint64_t v6 = (__CFString *)v63;
  }
  int v64 = [(SUCorePolicy *)self rollbackPolicy];

  if (v64)
  {
    char v65 = [(SUCorePolicy *)self rollbackPolicy];
    int v66 = [v65 summary];
    uint64_t v67 = [(__CFString *)v6 stringByAppendingFormat:@"|rollbackUpdate=%@", v66];

    uint64_t v6 = (__CFString *)v67;
  }
  long long v68 = [(SUCorePolicy *)self targetVolumeUUID];

  if (v68)
  {
    int v69 = [(SUCorePolicy *)self targetVolumeUUID];
    uint64_t v70 = [(__CFString *)v6 stringByAppendingFormat:@"|targetVolumeUUID=%@", v69];

    uint64_t v6 = (__CFString *)v70;
  }
  int v71 = [(SUCorePolicy *)self deviceClass];

  if (v71)
  {
    int v72 = [(SUCorePolicy *)self deviceClass];
    uint64_t v73 = [(__CFString *)v6 stringByAppendingFormat:@"|deviceClass=%@", v72];

    uint64_t v6 = (__CFString *)v73;
  }
  uint64_t v74 = [(SUCorePolicy *)self hwModelStr];

  if (v74)
  {
    uint64_t v75 = [(SUCorePolicy *)self hwModelStr];
    uint64_t v76 = [(__CFString *)v6 stringByAppendingFormat:@"|hwModelStr=%@", v75];

    uint64_t v6 = (__CFString *)v76;
  }
  BOOL v77 = [(SUCorePolicy *)self productType];

  if (v77)
  {
    BOOL v78 = [(SUCorePolicy *)self productType];
    uint64_t v79 = [(__CFString *)v6 stringByAppendingFormat:@"|productType=%@", v78];

    uint64_t v6 = (__CFString *)v79;
  }
  int64_t v80 = [(SUCorePolicy *)self releaseType];

  if (v80)
  {
    uint64_t v81 = [(SUCorePolicy *)self releaseType];
    id v82 = [(__CFString *)v6 stringByAppendingFormat:@"|releaseType=%@", v81];

    uint64_t v6 = (__CFString *)v81;
  }
  else
  {
    id v82 = [(__CFString *)v6 stringByAppendingString:@"|releaseType=customer"];
  }

  if (![(SUCorePolicy *)self checkAvailableSpace])
  {
    uint64_t v83 = [v82 stringByAppendingString:@"|!checkSpace"];

    id v82 = (void *)v83;
  }
  if ([(SUCorePolicy *)self cacheDeleteUrgency] != -1)
  {
    uint64_t v84 = +[SUCoreSpace cacheDeleteUrgencyName:[(SUCorePolicy *)self cacheDeleteUrgency]];
    uint64_t v85 = [v82 stringByAppendingFormat:@"|deleteUrgency=%@", v84];

    id v82 = (void *)v85;
  }
  uint64_t v86 = [(SUCorePolicy *)self userAgentString];

  if (v86)
  {
    uint64_t v87 = [(SUCorePolicy *)self userAgentString];
    uint64_t v88 = [v82 stringByAppendingFormat:@"|userAgentString=%@", v87];

    id v82 = (void *)v88;
  }
  if ([(SUCorePolicy *)self performPreflightEncryptedCheck])
  {
    uint64_t v89 = [v82 stringByAppendingString:@"|performPreflightEncryptedCheck=YES"];

    id v82 = (void *)v89;
  }
  if ([(SUCorePolicy *)self performPreflightSnapshotCheck])
  {
    uint64_t v90 = [v82 stringByAppendingString:@"|performPreflightSnapshotCheck=YES"];

    id v82 = (void *)v90;
  }
  uint64_t v91 = [(SUCorePolicy *)self updateVolumePath];

  if (v91)
  {
    v92 = [(SUCorePolicy *)self updateVolumePath];
    uint64_t v93 = [v82 stringByAppendingFormat:@"|updateVolumePath=%@", v92];

    id v82 = (void *)v93;
  }
  uint64_t v94 = [(SUCorePolicy *)self ssoToken];
  if (v94) {
    uint64_t v95 = @"|withSSO";
  }
  else {
    uint64_t v95 = @"|noSSO";
  }
  uint64_t v96 = [v82 stringByAppendingString:v95];

  uint64_t v97 = [(SUCorePolicy *)self personalizationServerURL];

  if (v97)
  {
    uint64_t v98 = [(SUCorePolicy *)self personalizationServerURL];
    uint64_t v99 = [v96 stringByAppendingFormat:@"|personalizationServerURL=%@", v98];

    uint64_t v96 = (void *)v99;
  }
  BOOL v100 = [(SUCorePolicy *)self proxyHostName];

  if (v100)
  {
    BOOL v101 = [(SUCorePolicy *)self proxyHostName];
    uint64_t v102 = [v96 stringByAppendingFormat:@"|proxyHostName=%@", v101];

    uint64_t v96 = (void *)v102;
  }
  long long v103 = [(SUCorePolicy *)self proxyPortNumber];

  if (v103)
  {
    long long v104 = [(SUCorePolicy *)self proxyPortNumber];
    uint64_t v105 = [v96 stringByAppendingFormat:@"|proxyPortNumber=%@", v104];

    uint64_t v96 = (void *)v105;
  }
  long long v106 = [(SUCorePolicy *)self updateMetricEventFields];
  if (v106) {
    uint64_t v107 = @"|withUpdateMetricEventFields";
  }
  else {
    uint64_t v107 = @"|noUpdateMetricEventFields";
  }
  uint64_t v108 = [v96 stringByAppendingString:v107];

  id v109 = [(SUCorePolicy *)self updateMetricContext];

  if (v109)
  {
    uint64_t v110 = [(SUCorePolicy *)self updateMetricContext];
    uint64_t v111 = [v108 stringByAppendingFormat:@"|updateMetricContext=%@", v110];

    uint64_t v108 = (void *)v111;
  }
  BOOL v112 = [(SUCorePolicy *)self assetAudienceUUID];

  if (v112)
  {
    BOOL v113 = [(SUCorePolicy *)self assetAudienceUUID];
    uint64_t v114 = [v108 stringByAppendingFormat:@"|assetAudienceUUID=%@", v113];

    uint64_t v108 = (void *)v114;
  }
  BOOL v115 = [(SUCorePolicy *)self alternateAssetAudienceUUID];

  if (v115)
  {
    int v116 = [(SUCorePolicy *)self alternateAssetAudienceUUID];
    uint64_t v117 = [v108 stringByAppendingFormat:@"|alternateAssetAudienceUUID=%@", v116];

    uint64_t v108 = (void *)v117;
  }
  if ([(SUCorePolicy *)self disableAlternateUpdate])
  {
    uint64_t v118 = [v108 stringByAppendingString:@"|disableAlternateUpdate=YES"];

    uint64_t v108 = (void *)v118;
  }
  if ([(SUCorePolicy *)self disableSplatCombo])
  {
    uint64_t v119 = [v108 stringByAppendingString:@"|disableSplombo=YES"];

    uint64_t v108 = (void *)v119;
  }
  if ([(SUCorePolicy *)self enablePreSUStaging])
  {
    uint64_t v120 = [v108 stringByAppendingString:@"|enablePSUS=YES"];

    uint64_t v108 = (void *)v120;
  }
  if ([(SUCorePolicy *)self enablePreSUStagingForOptionalAssets])
  {
    uint64_t v121 = [v108 stringByAppendingString:@"|enablePSUSForOptionalAssets=YES"];

    uint64_t v108 = (void *)v121;
  }
  if (([v108 isEqualToString:&stru_26C1810A0] & 1) == 0)
  {
    uint64_t v122 = [v108 stringByAppendingString:@"|"];

    uint64_t v108 = (void *)v122;
  }
  id v123 = v108;

  return v123;
}

- (id)assetTypeSummary
{
  id v3 = NSString;
  uint64_t v4 = [(SUCorePolicy *)self softwareUpdateAssetType];
  uint64_t v5 = [(SUCorePolicy *)self documentationAssetType];
  uint64_t v6 = [v3 stringWithFormat:@"|su=%@|doc=%@|", v4, v5];

  return v6;
}

- (id)stringForQoS:(int)a3
{
  if ((a3 - 1) > 4) {
    return @"MSUQualityOfServiceUnspecified";
  }
  else {
    return off_2640DDF80[a3 - 1];
  }
}

- (id)_copyGestaltValueForKey:(__CFString *)a3
{
  return (id)MGCopyAnswer();
}

+ (id)_cleanProductVersion:(id)a3
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

- (BOOL)background
{
  return self->_background;
}

- (BOOL)allowsCellular
{
  return self->_allowsCellular;
}

- (int64_t)specifiedUsedPolicies
{
  return self->_specifiedUsedPolicies;
}

- (void)setSpecifiedUsedPolicies:(int64_t)a3
{
  self->_specifiedUsedPolicies = a3;
}

- (SUCorePolicySoftwareUpdateScan)softwareUpdateScanPolicy
{
  return self->_softwareUpdateScanPolicy;
}

- (void)setSoftwareUpdateScanPolicy:(id)a3
{
}

- (SUCorePolicyDocumentationScan)documentationScanPolicy
{
  return self->_documentationScanPolicy;
}

- (void)setDocumentationScanPolicy:(id)a3
{
}

- (SUCorePolicyDocumentationDownload)documentationDownloadPolicy
{
  return self->_documentationDownloadPolicy;
}

- (void)setDocumentationDownloadPolicy:(id)a3
{
}

- (SUCorePolicyLoadBrain)loadBrainPolicy
{
  return self->_loadBrainPolicy;
}

- (void)setLoadBrainPolicy:(id)a3
{
}

- (SUCorePolicyPreflightDownloadSU)downloadPreflightPolicy
{
  return self->_downloadPreflightPolicy;
}

- (void)setDownloadPreflightPolicy:(id)a3
{
}

- (SUCorePolicySoftwareUpdateDownload)softwareUpdateDownloadPolicy
{
  return self->_softwareUpdateDownloadPolicy;
}

- (void)setSoftwareUpdateDownloadPolicy:(id)a3
{
}

- (SUCorePolicyPrepare)preparePolicy
{
  return self->_preparePolicy;
}

- (void)setPreparePolicy:(id)a3
{
}

- (SUCorePolicySuspend)suspendPolicy
{
  return self->_suspendPolicy;
}

- (void)setSuspendPolicy:(id)a3
{
}

- (SUCorePolicyResume)resumePolicy
{
  return self->_resumePolicy;
}

- (void)setResumePolicy:(id)a3
{
}

- (SUCorePolicyApply)applyPolicy
{
  return self->_applyPolicy;
}

- (void)setApplyPolicy:(id)a3
{
}

- (SUCorePolicyRollback)rollbackPolicy
{
  return self->_rollbackPolicy;
}

- (void)setRollbackPolicy:(id)a3
{
}

- (SUCorePolicyPreflightWakeup)wakeupPreflightPolicy
{
  return self->_wakeupPreflightPolicy;
}

- (void)setWakeupPreflightPolicy:(id)a3
{
}

- (SUCorePolicyPreflightPrerequisiteCheck)prerequisiteCheckPreflightPolicy
{
  return self->_prerequisiteCheckPreflightPolicy;
}

- (void)setPrerequisiteCheckPreflightPolicy:(id)a3
{
}

- (SUCorePolicyPreflightPersonalize)personalizePreflightPolicy
{
  return self->_personalizePreflightPolicy;
}

- (void)setPersonalizePreflightPolicy:(id)a3
{
}

- (SUCorePolicyPreflightFDRRecovery)fdrRecoveryPreflightPolicy
{
  return self->_fdrRecoveryPreflightPolicy;
}

- (void)setFdrRecoveryPreflightPolicy:(id)a3
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

- (NSString)targetVolumeUUID
{
  return self->_targetVolumeUUID;
}

- (void)setTargetVolumeUUID:(id)a3
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

- (NSString)prerequisiteRestoreVersion
{
  return self->_prerequisiteRestoreVersion;
}

- (void)setPrerequisiteRestoreVersion:(id)a3
{
}

- (NSString)targetRestoreVersion
{
  return self->_targetRestoreVersion;
}

- (void)setTargetRestoreVersion:(id)a3
{
}

- (NSString)installedSFRVersion
{
  return self->_installedSFRVersion;
}

- (void)setInstalledSFRVersion:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)hwModelStr
{
  return self->_hwModelStr;
}

- (void)setHwModelStr:(id)a3
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

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (BOOL)checkAvailableSpace
{
  return self->_checkAvailableSpace;
}

- (void)setCheckAvailableSpace:(BOOL)a3
{
  self->_checkAvailableSpace = a3;
}

- (NSString)userAgentString
{
  return self->_userAgentString;
}

- (void)setUserAgentString:(id)a3
{
}

- (BOOL)performPreflightEncryptedCheck
{
  return self->_performPreflightEncryptedCheck;
}

- (void)setPerformPreflightEncryptedCheck:(BOOL)a3
{
  self->_performPreflightEncryptedCheck = a3;
}

- (BOOL)performPreflightSnapshotCheck
{
  return self->_performPreflightSnapshotCheck;
}

- (void)setPerformPreflightSnapshotCheck:(BOOL)a3
{
  self->_performPreflightSnapshotCheck = a3;
}

- (NSString)updateVolumePath
{
  return self->_updateVolumePath;
}

- (void)setUpdateVolumePath:(id)a3
{
}

- (NSData)ssoToken
{
  return self->_ssoToken;
}

- (void)setSsoToken:(id)a3
{
}

- (int)cacheDeleteUrgency
{
  return self->_cacheDeleteUrgency;
}

- (void)setCacheDeleteUrgency:(int)a3
{
  self->_cacheDeleteUrgency = a3;
}

- (NSString)personalizedManifestRootsPath
{
  return self->_personalizedManifestRootsPath;
}

- (void)setPersonalizedManifestRootsPath:(id)a3
{
}

- (NSData)localAuthenticationContext
{
  return self->_localAuthenticationContext;
}

- (void)setLocalAuthenticationContext:(id)a3
{
}

- (NSNumber)localAuthenticationUserID
{
  return self->_localAuthenticationUserID;
}

- (void)setLocalAuthenticationUserID:(id)a3
{
}

- (NSString)mdmBootstrapToken
{
  return self->_mdmBootstrapToken;
}

- (void)setMdmBootstrapToken:(id)a3
{
}

- (NSString)downloadAuthorizationHeader
{
  return self->_downloadAuthorizationHeader;
}

- (void)setDownloadAuthorizationHeader:(id)a3
{
}

- (NSString)updateBrainLocationOverride
{
  return self->_updateBrainLocationOverride;
}

- (void)setUpdateBrainLocationOverride:(id)a3
{
}

- (NSString)assetAudienceUUID
{
  return self->_assetAudienceUUID;
}

- (void)setAssetAudienceUUID:(id)a3
{
}

- (NSString)alternateAssetAudienceUUID
{
  return self->_alternateAssetAudienceUUID;
}

- (void)setAlternateAssetAudienceUUID:(id)a3
{
}

- (BOOL)disableAlternateUpdate
{
  return self->_disableAlternateUpdate;
}

- (void)setDisableAlternateUpdate:(BOOL)a3
{
  self->_disableAlternateUpdate = a3;
}

- (BOOL)disableSplatCombo
{
  return self->_disableSplatCombo;
}

- (void)setDisableSplatCombo:(BOOL)a3
{
  self->_disableSplatCombo = a3;
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

- (NSString)personalizationServerURL
{
  return self->_personalizationServerURL;
}

- (void)setPersonalizationServerURL:(id)a3
{
}

- (NSString)proxyHostName
{
  return self->_proxyHostName;
}

- (void)setProxyHostName:(id)a3
{
}

- (NSNumber)proxyPortNumber
{
  return self->_proxyPortNumber;
}

- (void)setProxyPortNumber:(id)a3
{
}

- (BOOL)bridgeOSIgnoreMinimumVersionCheck
{
  return self->_bridgeOSIgnoreMinimumVersionCheck;
}

- (void)setBridgeOSIgnoreMinimumVersionCheck:(BOOL)a3
{
  self->_bridgeOSIgnoreMinimumVersionCheck = a3;
}

- (NSString)bridgeOSDownloadDirectory
{
  return self->_bridgeOSDownloadDirectory;
}

- (void)setBridgeOSDownloadDirectory:(id)a3
{
}

- (BOOL)enableEmbeddedOSInstall
{
  return self->_enableEmbeddedOSInstall;
}

- (void)setEnableEmbeddedOSInstall:(BOOL)a3
{
  self->_enableEmbeddedOSInstall = a3;
}

- (BOOL)enableBridgeOSInstall
{
  return self->_enableBridgeOSInstall;
}

- (void)setEnableBridgeOSInstall:(BOOL)a3
{
  self->_enableBridgeOSInstall = a3;
}

- (BOOL)enableOSPersonalization
{
  return self->_enableOSPersonalization;
}

- (void)setEnableOSPersonalization:(BOOL)a3
{
  self->_enableOSPersonalization = a3;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)skipVolumeSealing
{
  return self->_skipVolumeSealing;
}

- (void)setSkipVolumeSealing:(BOOL)a3
{
  self->_skipVolumeSealing = a3;
}

- (int)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int)a3
{
  self->_qualityOfService = a3;
}

- (NSDictionary)updateMetricEventFields
{
  return self->_updateMetricEventFields;
}

- (void)setUpdateMetricEventFields:(id)a3
{
}

- (NSString)updateMetricContext
{
  return self->_updateMetricContext;
}

- (void)setUpdateMetricContext:(id)a3
{
}

- (NSDictionary)defaultDescriptorValues
{
  return self->_defaultDescriptorValues;
}

- (void)setDefaultDescriptorValues:(id)a3
{
}

- (NSArray)policyExtensions
{
  return self->_policyExtensions;
}

- (void)setPolicyExtensions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyExtensions, 0);
  objc_storeStrong((id *)&self->_defaultDescriptorValues, 0);
  objc_storeStrong((id *)&self->_updateMetricContext, 0);
  objc_storeStrong((id *)&self->_updateMetricEventFields, 0);
  objc_storeStrong((id *)&self->_bridgeOSDownloadDirectory, 0);
  objc_storeStrong((id *)&self->_proxyPortNumber, 0);
  objc_storeStrong((id *)&self->_proxyHostName, 0);
  objc_storeStrong((id *)&self->_personalizationServerURL, 0);
  objc_storeStrong((id *)&self->_alternateAssetAudienceUUID, 0);
  objc_storeStrong((id *)&self->_assetAudienceUUID, 0);
  objc_storeStrong((id *)&self->_updateBrainLocationOverride, 0);
  objc_storeStrong((id *)&self->_downloadAuthorizationHeader, 0);
  objc_storeStrong((id *)&self->_mdmBootstrapToken, 0);
  objc_storeStrong((id *)&self->_localAuthenticationUserID, 0);
  objc_storeStrong((id *)&self->_localAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_personalizedManifestRootsPath, 0);
  objc_storeStrong((id *)&self->_ssoToken, 0);
  objc_storeStrong((id *)&self->_updateVolumePath, 0);
  objc_storeStrong((id *)&self->_userAgentString, 0);
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_hwModelStr, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_installedSFRVersion, 0);
  objc_storeStrong((id *)&self->_targetRestoreVersion, 0);
  objc_storeStrong((id *)&self->_prerequisiteRestoreVersion, 0);
  objc_storeStrong((id *)&self->_prerequisiteProductVersion, 0);
  objc_storeStrong((id *)&self->_prerequisiteBuildVersion, 0);
  objc_storeStrong((id *)&self->_targetVolumeUUID, 0);
  objc_storeStrong((id *)&self->_documentationAssetType, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAssetType, 0);
  objc_storeStrong((id *)&self->_fdrRecoveryPreflightPolicy, 0);
  objc_storeStrong((id *)&self->_personalizePreflightPolicy, 0);
  objc_storeStrong((id *)&self->_prerequisiteCheckPreflightPolicy, 0);
  objc_storeStrong((id *)&self->_wakeupPreflightPolicy, 0);
  objc_storeStrong((id *)&self->_rollbackPolicy, 0);
  objc_storeStrong((id *)&self->_applyPolicy, 0);
  objc_storeStrong((id *)&self->_resumePolicy, 0);
  objc_storeStrong((id *)&self->_suspendPolicy, 0);
  objc_storeStrong((id *)&self->_preparePolicy, 0);
  objc_storeStrong((id *)&self->_softwareUpdateDownloadPolicy, 0);
  objc_storeStrong((id *)&self->_downloadPreflightPolicy, 0);
  objc_storeStrong((id *)&self->_loadBrainPolicy, 0);
  objc_storeStrong((id *)&self->_documentationDownloadPolicy, 0);
  objc_storeStrong((id *)&self->_documentationScanPolicy, 0);

  objc_storeStrong((id *)&self->_softwareUpdateScanPolicy, 0);
}

@end