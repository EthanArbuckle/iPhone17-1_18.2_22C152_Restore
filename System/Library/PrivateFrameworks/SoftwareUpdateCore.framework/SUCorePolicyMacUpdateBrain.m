@interface SUCorePolicyMacUpdateBrain
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)compatibilityVersion;
- (NSString)majorTargetBuildVersion;
- (NSString)minorTargetBuildVersion;
- (SUCorePolicyMacUpdateBrain)initWithAssetType:(id)a3 majorTargetBuild:(id)a4 minorTargetBuild:(id)a5 usingPolicies:(int64_t)a6 usingExtensions:(id)a7;
- (SUCorePolicyMacUpdateBrain)initWithCoder:(id)a3;
- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4;
- (id)constructSoftwareUpdateMAAssetQuery;
- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)selectSoftwareUpdateMajorPrimaryAsset:(id *)a3 majorSecondaryAsset:(id *)a4 minorPrimaryAsset:(id *)a5 minorSecondaryAsset:(id *)a6 fromAssetQuery:(id)a7;
- (void)setCompatibilityVersion:(id)a3;
- (void)setMajorTargetBuildVersion:(id)a3;
- (void)setMinorTargetBuildVersion:(id)a3;
@end

@implementation SUCorePolicyMacUpdateBrain

- (SUCorePolicyMacUpdateBrain)initWithAssetType:(id)a3 majorTargetBuild:(id)a4 minorTargetBuild:(id)a5 usingPolicies:(int64_t)a6 usingExtensions:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v15 = [(SUCorePolicy *)&v19 initWithSoftwareUpdateAssetType:a3 documentationAssetType:0 usingPolicies:a6 usingExtensions:a7];
  if (v15)
  {
    uint64_t v16 = [NSNumber numberWithInt:20];
    compatibilityVersion = v15->_compatibilityVersion;
    v15->_compatibilityVersion = (NSNumber *)v16;

    objc_storeStrong((id *)&v15->_majorTargetBuildVersion, a4);
    objc_storeStrong((id *)&v15->_minorTargetBuildVersion, a5);
  }

  return v15;
}

- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v53 = a3;
  v5 = [MEMORY[0x263F77DE8] sharedLogger];
  v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(SUCorePolicyMacUpdateBrain *)self description];
    *(_DWORD *)buf = 138543362;
    id v71 = v7;
    _os_log_impl(&dword_20C8EA000, v6, OS_LOG_TYPE_DEFAULT, "[POLICY] constructMASoftwareUpdateCatalogDownloadOptionsWithUUID for MacUpdateBrainPolicy: %{public}@", buf, 0xCu);
  }
  v68.receiver = self;
  v68.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v8 = [(SUCorePolicy *)&v68 softwareUpdateScanPolicy];
  v9 = [v8 additionalServerParams];
  id v10 = (id)[v9 mutableCopy];

  if (!v10) {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v12 = [(SUCorePolicyMacUpdateBrain *)self majorTargetBuildVersion];

  if (v12)
  {
    id v13 = [(SUCorePolicyMacUpdateBrain *)self majorTargetBuildVersion];
    [v11 addObject:v13];
  }
  id v14 = [(SUCorePolicyMacUpdateBrain *)self minorTargetBuildVersion];

  if (v14)
  {
    v15 = [(SUCorePolicyMacUpdateBrain *)self minorTargetBuildVersion];
    [v11 addObject:v15];
  }
  v52 = v11;
  [v10 setSafeObject:v11 forKey:@"TargetBuildVersionArray"];
  v67.receiver = self;
  v67.super_class = (Class)SUCorePolicyMacUpdateBrain;
  uint64_t v16 = [(SUCorePolicy *)&v67 productType];
  [v10 setSafeObject:v16 forKey:@"ProductType"];

  v66.receiver = self;
  v66.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v17 = [(SUCorePolicy *)&v66 hwModelStr];
  [v10 setSafeObject:v17 forKey:@"HWModelStr"];

  v65.receiver = self;
  v65.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v18 = [(SUCorePolicy *)&v65 deviceClass];
  [v10 setSafeObject:v18 forKey:@"DeviceName"];

  v64.receiver = self;
  v64.super_class = (Class)SUCorePolicyMacUpdateBrain;
  objc_super v19 = [(SUCorePolicy *)&v64 prerequisiteBuildVersion];
  [v10 setSafeObject:v19 forKey:@"BuildVersion"];

  v20 = [(SUCorePolicyMacUpdateBrain *)self compatibilityVersion];
  [v10 setSafeObject:v20 forKey:@"CompatibilityVersion"];

  id v21 = objc_alloc_init(MEMORY[0x263F559C0]);
  [v21 setDiscretionary:0];
  [v21 setSessionId:v53];
  [v21 setAdditionalServerParams:v10];
  v22 = [(SUCorePolicy *)self downloadAuthorizationHeader];

  if (v22)
  {
    v63.receiver = self;
    v63.super_class = (Class)SUCorePolicyMacUpdateBrain;
    v23 = [(SUCorePolicy *)&v63 downloadAuthorizationHeader];
    [v21 setDownloadAuthorizationHeader:v23];
  }
  v24 = [MEMORY[0x263F089D8] stringWithString:@"|"];
  v25 = [v21 sessionId];
  [v24 appendFormat:@"scanUUID:%@|", v25];

  v26 = [(SUCorePolicyMacUpdateBrain *)self compatibilityVersion];
  [v24 appendFormat:@"CompatibilityVersion:%@|", v26];

  v27 = [v11 componentsJoinedByString:@","];
  [v24 appendFormat:@"TargetBuildVersionArray:%@|", v27];

  v62.receiver = self;
  v62.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v28 = [(SUCorePolicy *)&v62 productType];

  if (v28)
  {
    v29 = [(SUCorePolicy *)self productType];
    [v24 appendFormat:@"ProductType:%@|", v29];
  }
  v61.receiver = self;
  v61.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v30 = [(SUCorePolicy *)&v61 hwModelStr];

  if (v30)
  {
    v31 = [(SUCorePolicy *)self hwModelStr];
    [v24 appendFormat:@"HWModelStr:%@|", v31];
  }
  v60.receiver = self;
  v60.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v32 = [(SUCorePolicy *)&v60 deviceClass];

  if (v32)
  {
    v33 = [(SUCorePolicy *)self deviceClass];
    [v24 appendFormat:@"DeviceClass:%@|", v33];
  }
  v59.receiver = self;
  v59.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v34 = [(SUCorePolicy *)&v59 prerequisiteBuildVersion];

  if (v34)
  {
    v35 = [(SUCorePolicy *)self prerequisiteBuildVersion];
    [v24 appendFormat:@"BuildVersion:%@|", v35];
  }
  v51 = v10;
  v36 = [MEMORY[0x263F77DE8] sharedLogger];
  v37 = [v36 oslog];

  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v71 = v24;
    _os_log_impl(&dword_20C8EA000, v37, OS_LOG_TYPE_DEFAULT, "[POLICY] MacUpdateBrain catalog download options summary: %{public}@", buf, 0xCu);
  }
  v50 = v24;

  v38 = [MEMORY[0x263F77DE8] sharedLogger];
  v39 = [v38 oslog];

  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v71 = v21;
    _os_log_impl(&dword_20C8EA000, v39, OS_LOG_TYPE_DEFAULT, "[POLICY] MacUpdateBrain catalog downloadOptions: %{public}@", buf, 0xCu);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v54.receiver = self;
  v54.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v40 = [(SUCorePolicy *)&v54 policyExtensions];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v55 objects:v69 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v56 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        v46 = [MEMORY[0x263F77DE8] sharedLogger];
        v47 = [v46 oslog];

        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = [v45 extensionName];
          *(_DWORD *)buf = 138543362;
          id v71 = v48;
          _os_log_impl(&dword_20C8EA000, v47, OS_LOG_TYPE_DEFAULT, "[POLICY] extending MacUpdateBrain catalog download options for extension %{public}@", buf, 0xCu);
        }
        [v45 extendMASoftwareUpdateCatalogDownloadOptions:v21];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v55 objects:v69 count:16];
    }
    while (v42);
  }

  return v21;
}

- (id)constructSoftwareUpdateMAAssetQuery
{
  return [(SUCorePolicyMacUpdateBrain *)self constructSoftwareUpdateMAAssetQueryWithPurpose:0];
}

- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F089D8] stringWithString:@"|"];
  v6 = [MEMORY[0x263EFF9D0] null];
  id v7 = objc_alloc(MEMORY[0x263F55950]);
  v55.receiver = self;
  v55.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v8 = [(SUCorePolicy *)&v55 softwareUpdateAssetType];
  v46 = v4;
  v9 = (void *)[v7 initWithType:v8 andPurpose:v4];

  id v10 = NSString;
  id v11 = [(SUCorePolicyMacUpdateBrain *)self compatibilityVersion];
  uint64_t v12 = objc_msgSend(v10, "stringWithFormat:", @"%d", objc_msgSend(v11, "intValue"));

  [v9 addKeyValuePair:@"_CompatibilityVersion" with:v12];
  v44 = (void *)v12;
  [v5 appendFormat:@"CompatibilityVersion:%@", v12];
  v54.receiver = self;
  v54.super_class = (Class)SUCorePolicyMacUpdateBrain;
  id v13 = [(SUCorePolicy *)&v54 hwModelStr];

  id v14 = objc_alloc(MEMORY[0x263EFF980]);
  v15 = v14;
  if (v13)
  {
    v53.receiver = self;
    v53.super_class = (Class)SUCorePolicyMacUpdateBrain;
    uint64_t v16 = [(SUCorePolicy *)&v53 hwModelStr];
    v17 = objc_msgSend(v15, "initWithObjects:", v6, v16, 0);
    [v9 addKeyValueArray:@"SupportedDeviceModels" with:v17];
  }
  else
  {
    uint64_t v16 = objc_msgSend(v14, "initWithObjects:", v6, 0);
    [v9 addKeyValueArray:@"SupportedDeviceModels" with:v16];
  }

  v18 = [(SUCorePolicy *)self hwModelStr];
  [v5 appendFormat:@"hwModelStr:%@|", v18];

  v52.receiver = self;
  v52.super_class = (Class)SUCorePolicyMacUpdateBrain;
  objc_super v19 = [(SUCorePolicy *)&v52 productType];

  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x263EFF980]);
    v51.receiver = self;
    v51.super_class = (Class)SUCorePolicyMacUpdateBrain;
    id v21 = [(SUCorePolicy *)&v51 productType];
    v22 = objc_msgSend(v20, "initWithObjects:", v6, v21, 0);
    [v9 addKeyValueArray:@"SupportedDevices" with:v22];
  }
  v23 = [(SUCorePolicy *)self productType];
  [v5 appendFormat:@"productType:%@|", v23];

  id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
  v25 = [(SUCorePolicyMacUpdateBrain *)self majorTargetBuildVersion];

  if (v25)
  {
    v26 = [(SUCorePolicyMacUpdateBrain *)self majorTargetBuildVersion];
    [v24 addObject:v26];
  }
  v27 = [(SUCorePolicyMacUpdateBrain *)self minorTargetBuildVersion];

  if (v27)
  {
    v28 = [(SUCorePolicyMacUpdateBrain *)self minorTargetBuildVersion];
    [v24 addObject:v28];
  }
  [v24 addObject:v6];
  v29 = v9;
  [v9 addKeyValueArray:@"Build" with:v24];
  uint64_t v43 = v24;
  v30 = [v24 componentsJoinedByString:@","];
  [v5 appendFormat:@"Builds:%@|", v30];

  v31 = [MEMORY[0x263F77DE8] sharedLogger];
  v32 = [v31 oslog];

  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v58 = v5;
    _os_log_impl(&dword_20C8EA000, v32, OS_LOG_TYPE_DEFAULT, "[POLICY] querying MacUpdateBrain metadata: %{public}@", buf, 0xCu);
  }
  v45 = v5;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v33 = [(SUCorePolicy *)self policyExtensions];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v39 = [MEMORY[0x263F77DE8] sharedLogger];
        v40 = [v39 oslog];

        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v41 = [v38 extensionName];
          *(_DWORD *)buf = 138543362;
          long long v58 = v41;
          _os_log_impl(&dword_20C8EA000, v40, OS_LOG_TYPE_DEFAULT, "[POLICY] extending query for extension %{public}@", buf, 0xCu);
        }
        [v38 extendSoftwareUpdateMAAssetQuery:v29];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v35);
  }

  return v29;
}

- (void)selectSoftwareUpdateMajorPrimaryAsset:(id *)a3 majorSecondaryAsset:(id *)a4 minorPrimaryAsset:(id *)a5 minorSecondaryAsset:(id *)a6 fromAssetQuery:(id)a7
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v12 = a7;
  id v13 = [MEMORY[0x263F77DE8] sharedLogger];
  id v14 = [v13 oslog];

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    objc_super v64 = self;
    _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "[POLICY] Select major/minor MacUpdateBrain for policy: %{public}@", buf, 0xCu);
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
  v15 = [(SUCorePolicyMacUpdateBrain *)self majorTargetBuildVersion];

  if (a3 || !v15)
  {
    objc_super v19 = [(SUCorePolicyMacUpdateBrain *)self minorTargetBuildVersion];

    if (!a5 && v19)
    {
      uint64_t v16 = [MEMORY[0x263F77DA8] sharedDiag];
      v17 = v16;
      v18 = @"Select major/minor MacUpdateBrain called with unexpected nil minorPrimaryAsset param";
      goto LABEL_17;
    }
    v17 = objc_msgSend(v12, "SUCoreBorder_results");
    uint64_t v20 = [v17 count];
    id v21 = [MEMORY[0x263F77DE8] sharedLogger];
    v22 = [v21 oslog];

    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (!v20)
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20C8EA000, v22, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 MacUpdateBrain query results (before filtering)", buf, 2u);
      }
      goto LABEL_57;
    }
    if (v23)
    {
      uint64_t v24 = [v17 count];
      *(_DWORD *)buf = 134217984;
      objc_super v64 = (SUCorePolicyMacUpdateBrain *)v24;
      _os_log_impl(&dword_20C8EA000, v22, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu MacUpdateBrain query results (before filtering)", buf, 0xCu);
    }
    objc_super v54 = a5;
    id v56 = v12;

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v22 = [(SUCorePolicy *)self policyExtensions];
    uint64_t v25 = [v22 countByEnumeratingWithState:&v59 objects:v67 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v60;
      while (2)
      {
        uint64_t v28 = 0;
        v29 = v17;
        do
        {
          if (*(void *)v60 != v27) {
            objc_enumerationMutation(v22);
          }
          v30 = *(void **)(*((void *)&v59 + 1) + 8 * v28);
          v17 = objc_msgSend(v30, "filterSoftwareUpdateAssetArray:", v29, v54);

          v31 = [MEMORY[0x263F77DE8] sharedLogger];
          v32 = [v31 oslog];

          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = [v17 count];
            uint64_t v34 = [v30 extensionName];
            *(_DWORD *)buf = 134218242;
            objc_super v64 = (SUCorePolicyMacUpdateBrain *)v33;
            __int16 v65 = 2114;
            objc_super v66 = v34;
            _os_log_impl(&dword_20C8EA000, v32, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering from SUCorePolicyExtension %{public}@", buf, 0x16u);
          }
          if (![v17 count])
          {
            uint64_t v43 = [MEMORY[0x263F77DE8] sharedLogger];
            v44 = [v43 oslog];

            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20C8EA000, v44, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 assets found, stopping filtering early", buf, 2u);
            }

            id v12 = v56;
            goto LABEL_57;
          }
          ++v28;
          v29 = v17;
        }
        while (v26 != v28);
        uint64_t v26 = [v22 countByEnumeratingWithState:&v59 objects:v67 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    uint64_t v35 = [(SUCorePolicyMacUpdateBrain *)self majorTargetBuildVersion];

    if (v35)
    {
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __141__SUCorePolicyMacUpdateBrain_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke;
      v58[3] = &unk_2640DC388;
      v58[4] = self;
      uint64_t v36 = [MEMORY[0x263F08A98] predicateWithBlock:v58];
      v37 = [v17 filteredArrayUsingPredicate:v36];

      v38 = [MEMORY[0x263F77DE8] sharedLogger];
      v39 = [v38 oslog];

      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = [v37 count];
        *(_DWORD *)buf = 134217984;
        objc_super v64 = (SUCorePolicyMacUpdateBrain *)v40;
        _os_log_impl(&dword_20C8EA000, v39, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for major assets in SUCorePolicyMacUpdateBrain", buf, 0xCu);
      }

      if ((unint64_t)[v37 count] >= 2)
      {
        uint64_t v41 = [MEMORY[0x263F77DE8] sharedLogger];
        uint64_t v42 = [v41 oslog];

        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          -[SUCorePolicyMacUpdateBrain selectSoftwareUpdateMajorPrimaryAsset:majorSecondaryAsset:minorPrimaryAsset:minorSecondaryAsset:fromAssetQuery:](v42);
        }
      }
      v22 = objc_msgSend(v37, "firstObject", v54);
    }
    else
    {
      v22 = 0;
    }
    v45 = [(SUCorePolicyMacUpdateBrain *)self minorTargetBuildVersion];

    if (v45)
    {
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __141__SUCorePolicyMacUpdateBrain_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_365;
      v57[3] = &unk_2640DC388;
      v57[4] = self;
      v46 = [MEMORY[0x263F08A98] predicateWithBlock:v57];
      long long v47 = [v17 filteredArrayUsingPredicate:v46];

      long long v48 = [MEMORY[0x263F77DE8] sharedLogger];
      long long v49 = [v48 oslog];

      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v50 = [v47 count];
        *(_DWORD *)buf = 134217984;
        objc_super v64 = (SUCorePolicyMacUpdateBrain *)v50;
        _os_log_impl(&dword_20C8EA000, v49, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for minor assets in SUCorePolicyMacUpdateBrain", buf, 0xCu);
      }

      objc_super v51 = v55;
      id v12 = v56;
      if ((unint64_t)[v47 count] >= 2)
      {
        objc_super v52 = [MEMORY[0x263F77DE8] sharedLogger];
        objc_super v53 = [v52 oslog];

        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          -[SUCorePolicyMacUpdateBrain selectSoftwareUpdateMajorPrimaryAsset:majorSecondaryAsset:minorPrimaryAsset:minorSecondaryAsset:fromAssetQuery:](v53);
        }
      }
      v45 = [v47 firstObject];

      if (!a3) {
        goto LABEL_54;
      }
    }
    else
    {
      objc_super v51 = v55;
      id v12 = v56;
      if (!a3) {
        goto LABEL_54;
      }
    }
    *a3 = v22;
LABEL_54:
    if (v51) {
      void *v51 = v45;
    }

LABEL_57:
    goto LABEL_58;
  }
  uint64_t v16 = [MEMORY[0x263F77DA8] sharedDiag];
  v17 = v16;
  v18 = @"Select major/minor MacUpdateBrain called with unexpected nil majorPrimaryAsset param";
LABEL_17:
  [v16 trackError:@"[POLICY] SELECT_UPDATE_ASSET" forReason:v18 withResult:8102 withError:0];
LABEL_58:
}

uint64_t __141__SUCorePolicyMacUpdateBrain_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [a2 attributes];
  id v4 = [v3 safeStringForKey:@"Build"];

  v5 = (void *)MEMORY[0x263F77D78];
  v6 = [*(id *)(a1 + 32) majorTargetBuildVersion];
  uint64_t v7 = [v5 stringIsEqual:v4 to:v6];

  v8 = [MEMORY[0x263F77DE8] sharedLogger];
  v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [*(id *)(a1 + 32) majorTargetBuildVersion];
    id v11 = (void *)v10;
    id v12 = @"NO";
    int v14 = 138543874;
    v15 = v4;
    __int16 v16 = 2114;
    if (v7) {
      id v12 = @"YES";
    }
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    objc_super v19 = v12;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering for major assets: assetBuildVersion=%{public}@ majorTargetBuildVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v14, 0x20u);
  }
  return v7;
}

uint64_t __141__SUCorePolicyMacUpdateBrain_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_365(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [a2 attributes];
  id v4 = [v3 safeStringForKey:@"Build"];

  v5 = (void *)MEMORY[0x263F77D78];
  v6 = [*(id *)(a1 + 32) minorTargetBuildVersion];
  uint64_t v7 = [v5 stringIsEqual:v4 to:v6];

  v8 = [MEMORY[0x263F77DE8] sharedLogger];
  v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [*(id *)(a1 + 32) minorTargetBuildVersion];
    id v11 = (void *)v10;
    id v12 = @"NO";
    int v14 = 138543874;
    v15 = v4;
    __int16 v16 = 2114;
    if (v7) {
      id v12 = @"YES";
    }
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    objc_super v19 = v12;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering for minor assets: assetBuildVersion=%{public}@ minorTargetBuildVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v14, 0x20u);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyMacUpdateBrain)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v5 = [(SUCorePolicy *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CompatibilityVersion"];
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MajorTargetBuildVersion"];
    majorTargetBuildVersion = v5->_majorTargetBuildVersion;
    v5->_majorTargetBuildVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MinorTargetBuildVersion"];
    minorTargetBuildVersion = v5->_minorTargetBuildVersion;
    v5->_minorTargetBuildVersion = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUCorePolicyMacUpdateBrain;
  id v4 = a3;
  [(SUCorePolicy *)&v8 encodeWithCoder:v4];
  v5 = [(SUCorePolicyMacUpdateBrain *)self compatibilityVersion];
  [v4 encodeObject:v5 forKey:@"CompatibilityVersion"];

  uint64_t v6 = [(SUCorePolicyMacUpdateBrain *)self majorTargetBuildVersion];
  [v4 encodeObject:v6 forKey:@"MajorTargetBuildVersion"];

  uint64_t v7 = [(SUCorePolicyMacUpdateBrain *)self minorTargetBuildVersion];
  [v4 encodeObject:v7 forKey:@"MinorTargetBuildVersion"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyMacUpdateBrain *)a3;
  if (v4 == self)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v17.receiver = self;
      v17.super_class = (Class)SUCorePolicyMacUpdateBrain;
      if ([(SUCorePolicy *)&v17 isEqual:v5])
      {
        uint64_t v6 = (void *)MEMORY[0x263F77D78];
        uint64_t v7 = [(SUCorePolicyMacUpdateBrain *)self compatibilityVersion];
        objc_super v8 = [(SUCorePolicyMacUpdateBrain *)v5 compatibilityVersion];
        if ([v6 numberIsEqual:v7 to:v8])
        {
          v9 = (void *)MEMORY[0x263F77D78];
          uint64_t v10 = [(SUCorePolicyMacUpdateBrain *)self majorTargetBuildVersion];
          id v11 = [(SUCorePolicyMacUpdateBrain *)v5 majorTargetBuildVersion];
          if ([v9 stringIsEqual:v10 to:v11])
          {
            id v12 = (void *)MEMORY[0x263F77D78];
            objc_super v13 = [(SUCorePolicyMacUpdateBrain *)self minorTargetBuildVersion];
            int v14 = [(SUCorePolicyMacUpdateBrain *)v5 minorTargetBuildVersion];
            char v15 = [v12 stringIsEqual:v13 to:v14];
          }
          else
          {
            char v15 = 0;
          }
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SUCorePolicyMacUpdateBrain;
  id v4 = [(SUCorePolicy *)&v12 copyWithZone:a3];
  v5 = [(SUCorePolicyMacUpdateBrain *)self compatibilityVersion];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setCompatibilityVersion:v6];

  uint64_t v7 = [(SUCorePolicyMacUpdateBrain *)self majorTargetBuildVersion];
  objc_super v8 = (void *)[v7 copy];
  [v4 setMajorTargetBuildVersion:v8];

  v9 = [(SUCorePolicyMacUpdateBrain *)self minorTargetBuildVersion];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setMinorTargetBuildVersion:v10];

  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SUCorePolicyMacUpdateBrain *)self compatibilityVersion];
  v5 = [(SUCorePolicyMacUpdateBrain *)self majorTargetBuildVersion];
  uint64_t v6 = [(SUCorePolicyMacUpdateBrain *)self minorTargetBuildVersion];
  v10.receiver = self;
  v10.super_class = (Class)SUCorePolicyMacUpdateBrain;
  uint64_t v7 = [(SUCorePolicy *)&v10 description];
  objc_super v8 = [v3 stringWithFormat:@"SUCorePolicyMacUpdateBrain(compatibilityVersion:%@|majorTargetBuildVersion:%@|minorTargetBuildVersion:%@|super:%@)", v4, v5, v6, v7];

  return v8;
}

- (id)summary
{
  v15.receiver = self;
  v15.super_class = (Class)SUCorePolicyMacUpdateBrain;
  v3 = [(SUCorePolicy *)&v15 summary];
  id v4 = [(SUCorePolicyMacUpdateBrain *)self compatibilityVersion];

  if (v4)
  {
    v5 = [(SUCorePolicyMacUpdateBrain *)self compatibilityVersion];
    uint64_t v6 = [v3 stringByAppendingFormat:@"|compatibilityVersion=%@", v5];

    v3 = (void *)v6;
  }
  uint64_t v7 = [(SUCorePolicyMacUpdateBrain *)self majorTargetBuildVersion];

  if (v7)
  {
    objc_super v8 = [(SUCorePolicyMacUpdateBrain *)self majorTargetBuildVersion];
    uint64_t v9 = [v3 stringByAppendingFormat:@"|majorTargetBuildVersion=%@", v8];

    v3 = (void *)v9;
  }
  objc_super v10 = [(SUCorePolicyMacUpdateBrain *)self minorTargetBuildVersion];

  if (v10)
  {
    id v11 = [(SUCorePolicyMacUpdateBrain *)self minorTargetBuildVersion];
    uint64_t v12 = [v3 stringByAppendingFormat:@"|minorTargetBuildVersion=%@", v11];

    v3 = (void *)v12;
  }
  if (([v3 isEqualToString:&stru_26C1810A0] & 1) == 0)
  {
    uint64_t v13 = [v3 stringByAppendingString:@"|"];

    v3 = (void *)v13;
  }

  return v3;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
}

- (NSString)majorTargetBuildVersion
{
  return self->_majorTargetBuildVersion;
}

- (void)setMajorTargetBuildVersion:(id)a3
{
}

- (NSString)minorTargetBuildVersion
{
  return self->_minorTargetBuildVersion;
}

- (void)setMinorTargetBuildVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minorTargetBuildVersion, 0);
  objc_storeStrong((id *)&self->_majorTargetBuildVersion, 0);

  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
}

- (void)selectSoftwareUpdateMajorPrimaryAsset:(os_log_t)log majorSecondaryAsset:minorPrimaryAsset:minorSecondaryAsset:fromAssetQuery:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20C8EA000, log, OS_LOG_TYPE_ERROR, "[POLICY] Found more than one minor MacUpdateBrain asset in filtered results; selecting the first asset in array",
    v1,
    2u);
}

- (void)selectSoftwareUpdateMajorPrimaryAsset:(os_log_t)log majorSecondaryAsset:minorPrimaryAsset:minorSecondaryAsset:fromAssetQuery:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20C8EA000, log, OS_LOG_TYPE_ERROR, "[POLICY] Found more than one major MacUpdateBrain asset in filtered results; selecting the first asset in array",
    v1,
    2u);
}

@end