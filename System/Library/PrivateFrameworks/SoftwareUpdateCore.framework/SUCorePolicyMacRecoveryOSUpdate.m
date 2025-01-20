@interface SUCorePolicyMacRecoveryOSUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)installedRecoveryOSBuildVersion;
- (NSString)installedRecoveryOSProductVersion;
- (NSString)installedRecoveryOSReleaseType;
- (NSString)installedRecoveryOSRestoreVersion;
- (NSString)installedSFRRestoreVersion;
- (SUCorePolicyMacRecoveryOSUpdate)initWithAssetType:(id)a3 targetRestoreVersion:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6;
- (SUCorePolicyMacRecoveryOSUpdate)initWithCoder:(id)a3;
- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4;
- (id)constructSoftwareUpdateMAAssetQuery;
- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5;
- (void)setInstalledRecoveryOSBuildVersion:(id)a3;
- (void)setInstalledRecoveryOSProductVersion:(id)a3;
- (void)setInstalledRecoveryOSReleaseType:(id)a3;
- (void)setInstalledRecoveryOSRestoreVersion:(id)a3;
- (void)setInstalledSFRRestoreVersion:(id)a3;
@end

@implementation SUCorePolicyMacRecoveryOSUpdate

- (SUCorePolicyMacRecoveryOSUpdate)initWithAssetType:(id)a3 targetRestoreVersion:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6
{
  id v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v11 = [(SUCorePolicy *)&v30 initWithSoftwareUpdateAssetType:a3 documentationAssetType:0 usingPolicies:a5 usingExtensions:a6];
  v12 = v11;
  if (v11)
  {
    v29.receiver = v11;
    v29.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
    [(SUCorePolicy *)&v29 setTargetRestoreVersion:v10];
    [(SUCorePolicy *)v12 setDisableSplatCombo:1];
    v13 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v14 = [v13 sfrRestoreVersion];
    installedSFRRestoreVersion = v12->_installedSFRRestoreVersion;
    v12->_installedSFRRestoreVersion = (NSString *)v14;

    v16 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v17 = [v16 recoveryOSBuildVersion];
    installedRecoveryOSBuildVersion = v12->_installedRecoveryOSBuildVersion;
    v12->_installedRecoveryOSBuildVersion = (NSString *)v17;

    v19 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v20 = [v19 recoveryOSProductVersion];
    installedRecoveryOSProductVersion = v12->_installedRecoveryOSProductVersion;
    v12->_installedRecoveryOSProductVersion = (NSString *)v20;

    v22 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v23 = [v22 recoveryOSRestoreVersion];
    installedRecoveryOSRestoreVersion = v12->_installedRecoveryOSRestoreVersion;
    v12->_installedRecoveryOSRestoreVersion = (NSString *)v23;

    v25 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v26 = [v25 recoveryOSReleaseType];
    installedRecoveryOSReleaseType = v12->_installedRecoveryOSReleaseType;
    v12->_installedRecoveryOSReleaseType = (NSString *)v26;
  }
  return v12;
}

- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263F77DE8] sharedLogger];
  v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(SUCorePolicyMacRecoveryOSUpdate *)self description];
    *(_DWORD *)buf = 138543362;
    id v88 = v8;
    _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "[POLICY] constructMASoftwareUpdateCatalogDownloadOptionsWithUUID for SUCorePolicyMacRecoveryOSUpdate: %{public}@", buf, 0xCu);
  }
  id v9 = objc_alloc_init(MEMORY[0x263F559C0]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v9 setAdditionalServerParams:v10];

  v85.receiver = self;
  v85.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v11 = [(SUCorePolicy *)&v85 softwareUpdateScanPolicy];
  objc_msgSend(v9, "setDiscretionary:", objc_msgSend(v11, "discretionary"));

  v84.receiver = self;
  v84.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v12 = [(SUCorePolicy *)&v84 softwareUpdateScanPolicy];
  objc_msgSend(v9, "setRequiresPowerPluggedIn:", objc_msgSend(v12, "requiresPowerPluggedIn"));

  v83.receiver = self;
  v83.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v13 = [(SUCorePolicy *)&v83 softwareUpdateScanPolicy];
  objc_msgSend(v9, "setLiveServerCatalogOnly:", objc_msgSend(v13, "liveServerCatalogOnly"));

  v67 = v5;
  [v9 setSessionId:v5];
  uint64_t v14 = [v9 additionalServerParams];
  v15 = [(SUCorePolicy *)self targetRestoreVersion];
  [v14 setSafeObject:v15 forKey:@"TargetRestoreVersion"];

  v16 = [v9 additionalServerParams];
  uint64_t v17 = [(SUCorePolicy *)self installedSFRVersion];
  [v16 setSafeObject:v17 forKey:@"InstalledSFRVersion"];

  v18 = [v9 additionalServerParams];
  v19 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedSFRRestoreVersion];
  [v18 setSafeObject:v19 forKey:@"InstalledSFRRestoreVersion"];

  uint64_t v20 = [v9 additionalServerParams];
  v21 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSRestoreVersion];
  [v20 setSafeObject:v21 forKey:@"InstalledRecoveryOSRestoreVersion"];

  v22 = [v9 additionalServerParams];
  uint64_t v23 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSBuildVersion];
  [v22 setSafeObject:v23 forKey:@"InstalledRecoveryOSVersion"];

  v24 = [v9 additionalServerParams];
  v25 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSReleaseType];
  [v24 setSafeObject:v25 forKey:@"ReleaseType"];

  uint64_t v26 = [v9 additionalServerParams];
  v82.receiver = self;
  v82.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v27 = [(SUCorePolicy *)&v82 productType];
  [v26 setSafeObject:v27 forKey:@"ProductType"];

  v28 = [v9 additionalServerParams];
  v81.receiver = self;
  v81.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  objc_super v29 = [(SUCorePolicy *)&v81 hwModelStr];
  [v28 setSafeObject:v29 forKey:@"HWModelStr"];

  objc_super v30 = [v9 additionalServerParams];
  v80.receiver = self;
  v80.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v31 = [(SUCorePolicy *)&v80 deviceClass];
  [v30 setSafeObject:v31 forKey:@"DeviceName"];

  v32 = [v9 additionalServerParams];
  v33 = NSNumber;
  v79.receiver = self;
  v79.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v34 = [(SUCorePolicy *)&v79 softwareUpdateScanPolicy];
  v35 = objc_msgSend(v33, "numberWithBool:", objc_msgSend(v34, "allowSameVersion"));
  [v32 setSafeObject:v35 forKey:@"AllowSameBuildVersion"];

  v36 = [v9 additionalServerParams];
  v37 = NSNumber;
  v78.receiver = self;
  v78.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v38 = [(SUCorePolicy *)&v78 softwareUpdateScanPolicy];
  v39 = objc_msgSend(v37, "numberWithBool:", objc_msgSend(v38, "allowSameVersion"));
  [v36 setSafeObject:v39 forKey:@"AllowSameRestoreVersion"];

  v77.receiver = self;
  v77.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v40 = [(SUCorePolicy *)&v77 prerequisiteBuildVersion];
  [v9 setPrerequisiteProductVersion:v40];

  v76.receiver = self;
  v76.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v41 = [(SUCorePolicy *)&v76 prerequisiteProductVersion];
  [v9 setPrerequisiteBuildVersion:v41];

  v42 = [(SUCorePolicy *)self downloadAuthorizationHeader];

  if (v42)
  {
    v75.receiver = self;
    v75.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
    v43 = [(SUCorePolicy *)&v75 downloadAuthorizationHeader];
    [v9 setDownloadAuthorizationHeader:v43];
  }
  v74.receiver = self;
  v74.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v44 = [(SUCorePolicy *)&v74 softwareUpdateScanPolicy];
  v45 = [v44 additionalServerParams];

  if (v45)
  {
    v46 = [v9 additionalServerParams];
    v73.receiver = self;
    v73.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
    v47 = [(SUCorePolicy *)&v73 softwareUpdateScanPolicy];
    v48 = [v47 additionalServerParams];
    [v46 addEntriesFromDictionary:v48];
  }
  v49 = [MEMORY[0x263F089D8] stringWithString:@"|"];
  v50 = [v9 sessionId];
  [v49 appendFormat:@"scanUUID:%@|", v50];

  v51 = [v9 additionalServerParams];
  [v49 appendFormat:@"additionalServerParams:%@|", v51];

  v52 = [MEMORY[0x263F77DE8] sharedLogger];
  v53 = [v52 oslog];

  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v88 = v49;
    _os_log_impl(&dword_20C8EA000, v53, OS_LOG_TYPE_DEFAULT, "[POLICY] MacRecoveryOSUpdate catalog download options summary: %{public}@", buf, 0xCu);
  }
  v66 = v49;

  v54 = [MEMORY[0x263F77DE8] sharedLogger];
  v55 = [v54 oslog];

  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v88 = v9;
    _os_log_impl(&dword_20C8EA000, v55, OS_LOG_TYPE_DEFAULT, "[POLICY] MacRecoveryOSUpdate catalog downloadOptions: %{public}@", buf, 0xCu);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v68.receiver = self;
  v68.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v56 = [(SUCorePolicy *)&v68 policyExtensions];
  uint64_t v57 = [v56 countByEnumeratingWithState:&v69 objects:v86 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v58; ++i)
      {
        if (*(void *)v70 != v59) {
          objc_enumerationMutation(v56);
        }
        v61 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        v62 = [MEMORY[0x263F77DE8] sharedLogger];
        v63 = [v62 oslog];

        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v64 = [v61 extensionName];
          *(_DWORD *)buf = 138543362;
          id v88 = v64;
          _os_log_impl(&dword_20C8EA000, v63, OS_LOG_TYPE_DEFAULT, "[POLICY] extending MacRecoveryOSUpdate catalog download options for extension %{public}@", buf, 0xCu);
        }
        [v61 extendMASoftwareUpdateCatalogDownloadOptions:v9];
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v69 objects:v86 count:16];
    }
    while (v58);
  }

  return v9;
}

- (id)constructSoftwareUpdateMAAssetQuery
{
  return [(SUCorePolicyMacRecoveryOSUpdate *)self constructSoftwareUpdateMAAssetQueryWithPurpose:0];
}

- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F089D8] stringWithString:@"|"];
  v6 = [MEMORY[0x263EFF9D0] null];
  id v7 = objc_alloc(MEMORY[0x263F55950]);
  v40.receiver = self;
  v40.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v8 = [(SUCorePolicy *)&v40 softwareUpdateAssetType];
  v35 = v4;
  id v9 = (void *)[v7 initWithType:v8 andPurpose:v4];

  id v10 = [(SUCorePolicy *)self hwModelStr];

  id v11 = objc_alloc(MEMORY[0x263EFF980]);
  v12 = v11;
  if (v10)
  {
    v13 = [(SUCorePolicy *)self hwModelStr];
    uint64_t v14 = objc_msgSend(v12, "initWithObjects:", v6, v13, 0);
    [v9 addKeyValueArray:@"SupportedDeviceModels" with:v14];
  }
  else
  {
    v13 = objc_msgSend(v11, "initWithObjects:", v6, 0);
    [v9 addKeyValueArray:@"SupportedDeviceModels" with:v13];
  }

  v15 = [(SUCorePolicy *)self hwModelStr];
  [v5 appendFormat:@"hwModelStr:%@|", v15];

  v16 = [(SUCorePolicy *)self productType];

  id v17 = objc_alloc(MEMORY[0x263EFF980]);
  v18 = v17;
  if (v16)
  {
    v19 = [(SUCorePolicy *)self productType];
    uint64_t v20 = objc_msgSend(v18, "initWithObjects:", v6, v19, 0);
    [v9 addKeyValueArray:@"SupportedDevices" with:v20];
  }
  else
  {
    v19 = objc_msgSend(v17, "initWithObjects:", v6, 0);
    [v9 addKeyValueArray:@"SupportedDevices" with:v19];
  }

  v21 = [(SUCorePolicy *)self productType];
  [v5 appendFormat:@"productType:%@|", v21];

  v22 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v23 = [v22 oslog];

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v5;
    _os_log_impl(&dword_20C8EA000, v23, OS_LOG_TYPE_DEFAULT, "[POLICY] querying MacRecoveryOSUpdate metadata: %{public}@", buf, 0xCu);
  }
  v34 = v5;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v24 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(v24);
        }
        objc_super v29 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        objc_super v30 = [MEMORY[0x263F77DE8] sharedLogger];
        v31 = [v30 oslog];

        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = [v29 extensionName];
          *(_DWORD *)buf = 138543362;
          v43 = v32;
          _os_log_impl(&dword_20C8EA000, v31, OS_LOG_TYPE_DEFAULT, "[POLICY] extending MacRecoveryOSUpdate query for extension %{public}@", buf, 0xCu);
        }
        [v29 extendSoftwareUpdateMAAssetQuery:v9];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v26);
  }

  return v9;
}

- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = v8;
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (!a3)
  {
    id v10 = [MEMORY[0x263F77DA8] sharedDiag];
    [v10 trackError:@"[POLICY] SELECT_UPDATE_ASSET" forReason:@"Select MacRecoveryOSUpdate called with unexpected nil primaryAsset param" withResult:8102 withError:0];
    goto LABEL_57;
  }
  id v10 = objc_msgSend(v8, "SUCoreBorder_results");
  uint64_t v11 = [v10 count];
  v12 = [MEMORY[0x263F77DE8] sharedLogger];
  v13 = [v12 oslog];

  os_log_t log = v13;
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 MacRecoveryOSUpdate query results (before filtering)", buf, 2u);
    }
    goto LABEL_56;
  }
  if (v14)
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v77 = [v10 count];
    _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu MacRecoveryOSUpdate query results (before filtering)", buf, 0xCu);
  }
  v60 = a3;
  v61 = a4;
  v62 = v9;

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  os_log_t log = [(SUCorePolicy *)self policyExtensions];
  uint64_t v15 = [log countByEnumeratingWithState:&v71 objects:v80 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v72;
    do
    {
      uint64_t v18 = 0;
      v19 = v10;
      do
      {
        if (*(void *)v72 != v17) {
          objc_enumerationMutation(log);
        }
        uint64_t v20 = *(void **)(*((void *)&v71 + 1) + 8 * v18);
        id v10 = [v20 filterSoftwareUpdateAssetArray:v19];

        v21 = [MEMORY[0x263F77DE8] sharedLogger];
        v22 = [v21 oslog];

        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = [v10 count];
          v24 = [v20 extensionName];
          *(_DWORD *)buf = 134218242;
          uint64_t v77 = v23;
          __int16 v78 = 2114;
          objc_super v79 = v24;
          _os_log_impl(&dword_20C8EA000, v22, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu MacRecoveryOSUpdate assets left after filtering from SUCorePolicyExtension %{public}@", buf, 0x16u);
        }
        if (![v10 count])
        {
          v48 = [MEMORY[0x263F77DE8] sharedLogger];
          v49 = [v48 oslog];

          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20C8EA000, v49, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 MacRecoveryOSUpdate assets found, stopping filtering early", buf, 2u);
          }

          id v9 = v62;
          goto LABEL_56;
        }
        ++v18;
        v19 = v10;
      }
      while (v16 != v18);
      uint64_t v16 = [log countByEnumeratingWithState:&v71 objects:v80 count:16];
    }
    while (v16);
  }

  uint64_t v25 = [v10 sortedArrayUsingComparator:&__block_literal_global_3];
  uint64_t v26 = [v25 lastObject];
  uint64_t v27 = [v26 attributes];
  v28 = [v27 safeStringForKey:@"RestoreVersion"];

  objc_super v29 = (void *)MEMORY[0x263F08A98];
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __98__SUCorePolicyMacRecoveryOSUpdate_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2;
  v69[3] = &unk_2640DC388;
  id v59 = v28;
  id v70 = v59;
  objc_super v30 = [v29 predicateWithBlock:v69];
  os_log_t log = v25;
  v31 = [v25 filteredArrayUsingPredicate:v30];

  v32 = [MEMORY[0x263F77DE8] sharedLogger];
  v33 = [v32 oslog];

  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = [v31 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v77 = v34;
    _os_log_impl(&dword_20C8EA000, v33, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for highest MacRecoveryOSUpdate assets in SUCorePolicyMacRecoveryOSUpdate", buf, 0xCu);
  }
  v63 = v10;

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v35 = v31;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (!v36)
  {
    long long v38 = 0;
    long long v39 = 0;
    goto LABEL_44;
  }
  uint64_t v37 = v36;
  long long v38 = 0;
  long long v39 = 0;
  uint64_t v40 = *(void *)v66;
  do
  {
    for (uint64_t i = 0; i != v37; ++i)
    {
      if (*(void *)v66 != v40) {
        objc_enumerationMutation(v35);
      }
      v42 = *(void **)(*((void *)&v65 + 1) + 8 * i);
      if (v38
        || ([*(id *)(*((void *)&v65 + 1) + 8 * i) attributes],
            v45 = objc_claimAutoreleasedReturnValue(),
            [v45 safeStringForKey:@"PrerequisiteBuild"],
            v46 = objc_claimAutoreleasedReturnValue(),
            v46,
            v45,
            !v46))
      {
        if (v39) {
          continue;
        }
        v43 = [v42 attributes];
        uint64_t v44 = [v43 safeStringForKey:@"PrerequisiteBuild"];

        if (v44)
        {
          long long v39 = 0;
          continue;
        }
        long long v39 = v42;
      }
      else
      {
        long long v38 = v42;
      }
      id v47 = v42;
    }
    uint64_t v37 = [v35 countByEnumeratingWithState:&v65 objects:v75 count:16];
  }
  while (v37);
LABEL_44:

  v50 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  int v51 = [v50 restrictToFull];

  if (v51)
  {
    id v52 = v39;
    id v53 = 0;
    id v9 = v62;
    id v10 = v63;
    v54 = v61;
    goto LABEL_53;
  }
  v55 = [(SUCorePolicy *)self softwareUpdateScanPolicy];
  int v56 = [v55 restrictToIncremental];

  id v9 = v62;
  id v10 = v63;
  v54 = v61;
  if (v56)
  {
    id v57 = v38;
    goto LABEL_51;
  }
  if (v38 || !v39)
  {
    id v52 = v38;
    id v53 = v39;
  }
  else
  {
    id v57 = v39;
LABEL_51:
    id v52 = v57;
    id v53 = 0;
  }
LABEL_53:
  id v58 = v52;
  id *v60 = v58;
  if (v54) {
    id *v54 = v53;
  }

LABEL_56:
LABEL_57:
}

uint64_t __98__SUCorePolicyMacRecoveryOSUpdate_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 attributes];
  v6 = [v5 safeStringForKey:@"RestoreVersion"];

  id v7 = [v4 attributes];

  id v8 = [v7 safeStringForKey:@"RestoreVersion"];

  id v9 = (void *)[objc_alloc(MEMORY[0x263F77E18]) initWithRestoreVersion:v6];
  id v10 = (void *)[objc_alloc(MEMORY[0x263F77E18]) initWithRestoreVersion:v8];
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

uint64_t __98__SUCorePolicyMacRecoveryOSUpdate_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [a2 attributes];
  id v4 = [v3 safeStringForKey:@"RestoreVersion"];

  uint64_t v5 = [MEMORY[0x263F77D78] stringIsEqual:*(void *)(a1 + 32) to:v4];
  v6 = [MEMORY[0x263F77DE8] sharedLogger];
  id v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = @"NO";
    int v11 = 138543874;
    if (v5) {
      id v9 = @"YES";
    }
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    BOOL v14 = v4;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering highest MacRecoveryOSUpdate restore version, highestRestoreVersion=%{public}@, assetRestoreVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v11, 0x20u);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyMacRecoveryOSUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  uint64_t v5 = [(SUCorePolicy *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstalledSFRRestoreVersion"];
    installedSFRRestoreVersion = v5->_installedSFRRestoreVersion;
    v5->_installedSFRRestoreVersion = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstalledRecoveryOSBuildVersion"];
    installedRecoveryOSBuildVersion = v5->_installedRecoveryOSBuildVersion;
    v5->_installedRecoveryOSBuildVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstalledRecoveryOSProductVersion"];
    installedRecoveryOSProductVersion = v5->_installedRecoveryOSProductVersion;
    v5->_installedRecoveryOSProductVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstalledRecoveryOSRestoreVersion"];
    installedRecoveryOSRestoreVersion = v5->_installedRecoveryOSRestoreVersion;
    v5->_installedRecoveryOSRestoreVersion = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstalledRecoveryOSReleaseType"];
    installedRecoveryOSReleaseType = v5->_installedRecoveryOSReleaseType;
    v5->_installedRecoveryOSReleaseType = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  id v4 = a3;
  [(SUCorePolicy *)&v10 encodeWithCoder:v4];
  uint64_t v5 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedSFRRestoreVersion];
  [v4 encodeObject:v5 forKey:@"InstalledSFRRestoreVersion"];

  uint64_t v6 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSBuildVersion];
  [v4 encodeObject:v6 forKey:@"InstalledRecoveryOSBuildVersion"];

  id v7 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSProductVersion];
  [v4 encodeObject:v7 forKey:@"InstalledRecoveryOSProductVersion"];

  uint64_t v8 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSRestoreVersion];
  [v4 encodeObject:v8 forKey:@"InstalledRecoveryOSRestoreVersion"];

  id v9 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSReleaseType];
  [v4 encodeObject:v9 forKey:@"InstalledRecoveryOSReleaseType"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyMacRecoveryOSUpdate *)a3;
  if (v4 == self)
  {
    char v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v27.receiver = self;
      v27.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
      if ([(SUCorePolicy *)&v27 isEqual:v5])
      {
        uint64_t v6 = (void *)MEMORY[0x263F77D78];
        id v7 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedSFRRestoreVersion];
        uint64_t v8 = [(SUCorePolicyMacRecoveryOSUpdate *)v5 installedSFRRestoreVersion];
        if ([v6 stringIsEqual:v7 to:v8])
        {
          id v9 = (void *)MEMORY[0x263F77D78];
          objc_super v10 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSBuildVersion];
          int v11 = [(SUCorePolicyMacRecoveryOSUpdate *)v5 installedRecoveryOSBuildVersion];
          if ([v9 stringIsEqual:v10 to:v11])
          {
            uint64_t v12 = (void *)MEMORY[0x263F77D78];
            __int16 v13 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSProductVersion];
            uint64_t v26 = [(SUCorePolicyMacRecoveryOSUpdate *)v5 installedRecoveryOSProductVersion];
            if (objc_msgSend(v12, "stringIsEqual:to:", v13))
            {
              uint64_t v25 = v13;
              uint64_t v14 = (void *)MEMORY[0x263F77D78];
              uint64_t v15 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSRestoreVersion];
              uint64_t v16 = [(SUCorePolicyMacRecoveryOSUpdate *)v5 installedRecoveryOSRestoreVersion];
              v24 = (void *)v15;
              uint64_t v17 = v15;
              uint64_t v18 = (void *)v16;
              if ([v14 stringIsEqual:v17 to:v16])
              {
                uint64_t v23 = (void *)MEMORY[0x263F77D78];
                v19 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSReleaseType];
                uint64_t v20 = [(SUCorePolicyMacRecoveryOSUpdate *)v5 installedRecoveryOSReleaseType];
                char v21 = [v23 stringIsEqual:v19 to:v20];
              }
              else
              {
                char v21 = 0;
              }

              __int16 v13 = v25;
            }
            else
            {
              char v21 = 0;
            }
          }
          else
          {
            char v21 = 0;
          }
        }
        else
        {
          char v21 = 0;
        }
      }
      else
      {
        char v21 = 0;
      }
    }
    else
    {
      char v21 = 0;
    }
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  id v5 = -[SUCorePolicy copyWithZone:](&v17, sel_copyWithZone_);
  uint64_t v6 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedSFRRestoreVersion];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setInstalledSFRRestoreVersion:v7];

  uint64_t v8 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSBuildVersion];
  id v9 = (void *)[v8 copyWithZone:a3];
  [v5 setInstalledRecoveryOSBuildVersion:v9];

  objc_super v10 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSProductVersion];
  int v11 = (void *)[v10 copyWithZone:a3];
  [v5 setInstalledRecoveryOSProductVersion:v11];

  uint64_t v12 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSRestoreVersion];
  __int16 v13 = (void *)[v12 copyWithZone:a3];
  [v5 setInstalledRecoveryOSRestoreVersion:v13];

  uint64_t v14 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSReleaseType];
  uint64_t v15 = (void *)[v14 copyWithZone:a3];
  [v5 setInstalledRecoveryOSReleaseType:v15];

  return v5;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  id v4 = [(SUCorePolicy *)&v12 description];
  id v5 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedSFRRestoreVersion];
  uint64_t v6 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSBuildVersion];
  id v7 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSProductVersion];
  uint64_t v8 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSRestoreVersion];
  id v9 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSReleaseType];
  objc_super v10 = [v3 stringWithFormat:@"SUCorePolicyMacRecoveryOSUpdate(super:%@|installedSFRRestoreVersion:%@|installedRecoveryOSBuildVersion:%@|installedRecoveryOSProductVersion:%@|installedRecoveryOSRestoreVersion:%@|installedRecoveryOSReleaseType:%@)", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)summary
{
  v21.receiver = self;
  v21.super_class = (Class)SUCorePolicyMacRecoveryOSUpdate;
  v3 = [(SUCorePolicy *)&v21 summary];
  id v4 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedSFRRestoreVersion];

  if (v4)
  {
    id v5 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedSFRRestoreVersion];
    uint64_t v6 = [v3 stringByAppendingFormat:@"installedSFRRestoreVersion:%@|", v5];

    v3 = (void *)v6;
  }
  id v7 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSBuildVersion];

  if (v7)
  {
    uint64_t v8 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSBuildVersion];
    uint64_t v9 = [v3 stringByAppendingFormat:@"installedRecoveryOSBuildVersion:%@|", v8];

    v3 = (void *)v9;
  }
  objc_super v10 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSProductVersion];

  if (v10)
  {
    int v11 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSProductVersion];
    uint64_t v12 = [v3 stringByAppendingFormat:@"installedRecoveryOSProductVersion:%@|", v11];

    v3 = (void *)v12;
  }
  __int16 v13 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSRestoreVersion];

  if (v13)
  {
    uint64_t v14 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSRestoreVersion];
    uint64_t v15 = [v3 stringByAppendingFormat:@"installedRecoveryOSRestoreVersion:%@|", v14];

    v3 = (void *)v15;
  }
  uint64_t v16 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSReleaseType];

  if (v16)
  {
    objc_super v17 = [(SUCorePolicyMacRecoveryOSUpdate *)self installedRecoveryOSReleaseType];
    uint64_t v18 = [v3 stringByAppendingFormat:@"installedRecoveryOSReleaseType:%@|", v17];

    v3 = (void *)v18;
  }
  if (([v3 isEqualToString:&stru_26C1810A0] & 1) == 0)
  {
    uint64_t v19 = [v3 stringByAppendingString:@"|"];

    v3 = (void *)v19;
  }

  return v3;
}

- (NSString)installedSFRRestoreVersion
{
  return self->_installedSFRRestoreVersion;
}

- (void)setInstalledSFRRestoreVersion:(id)a3
{
}

- (NSString)installedRecoveryOSBuildVersion
{
  return self->_installedRecoveryOSBuildVersion;
}

- (void)setInstalledRecoveryOSBuildVersion:(id)a3
{
}

- (NSString)installedRecoveryOSProductVersion
{
  return self->_installedRecoveryOSProductVersion;
}

- (void)setInstalledRecoveryOSProductVersion:(id)a3
{
}

- (NSString)installedRecoveryOSRestoreVersion
{
  return self->_installedRecoveryOSRestoreVersion;
}

- (void)setInstalledRecoveryOSRestoreVersion:(id)a3
{
}

- (NSString)installedRecoveryOSReleaseType
{
  return self->_installedRecoveryOSReleaseType;
}

- (void)setInstalledRecoveryOSReleaseType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedRecoveryOSReleaseType, 0);
  objc_storeStrong((id *)&self->_installedRecoveryOSRestoreVersion, 0);
  objc_storeStrong((id *)&self->_installedRecoveryOSProductVersion, 0);
  objc_storeStrong((id *)&self->_installedRecoveryOSBuildVersion, 0);

  objc_storeStrong((id *)&self->_installedSFRRestoreVersion, 0);
}

@end