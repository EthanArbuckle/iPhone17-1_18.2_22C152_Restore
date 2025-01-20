@interface SUCorePolicyExtensionSplatUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)allowSameRestoreVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSplatPolicy;
- (NSString)installedBaseOSBuildVersion;
- (NSString)installedBaseOSProductVersion;
- (NSString)installedBaseOSReleaseType;
- (NSString)installedBaseOSRestoreVersion;
- (NSString)installedSplatBuildVersion;
- (NSString)installedSplatProductVersion;
- (NSString)installedSplatProductVersionExtra;
- (NSString)installedSplatReleaseType;
- (NSString)installedSplatRestoreVersion;
- (NSString)requestedSplatRestoreVersion;
- (SUCorePolicyExtensionSplatUpdate)init;
- (SUCorePolicyExtensionSplatUpdate)initWithCoder:(id)a3;
- (id)_stringRemovingParenthesis:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extensionName;
- (id)filterDocumentationAssetArray:(id)a3;
- (id)filterSoftwareUpdateAssetArray:(id)a3;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)extendMASoftwareUpdateCatalogDownloadOptions:(id)a3;
- (void)setAllowSameRestoreVersion:(BOOL)a3;
- (void)setInstalledBaseOSBuildVersion:(id)a3;
- (void)setInstalledBaseOSProductVersion:(id)a3;
- (void)setInstalledBaseOSReleaseType:(id)a3;
- (void)setInstalledBaseOSRestoreVersion:(id)a3;
- (void)setInstalledSplatBuildVersion:(id)a3;
- (void)setInstalledSplatProductVersion:(id)a3;
- (void)setInstalledSplatProductVersionExtra:(id)a3;
- (void)setInstalledSplatReleaseType:(id)a3;
- (void)setInstalledSplatRestoreVersion:(id)a3;
- (void)setRequestedSplatRestoreVersion:(id)a3;
@end

@implementation SUCorePolicyExtensionSplatUpdate

- (SUCorePolicyExtensionSplatUpdate)init
{
  v37.receiver = self;
  v37.super_class = (Class)SUCorePolicyExtensionSplatUpdate;
  v2 = [(SUCorePolicyExtension *)&v37 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v4 = [v3 splatCryptex1RestoreVersion];
    installedSplatRestoreVersion = v2->_installedSplatRestoreVersion;
    v2->_installedSplatRestoreVersion = (NSString *)v4;

    v6 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v7 = [v6 splatCryptex1ProductVersion];
    installedSplatProductVersion = v2->_installedSplatProductVersion;
    v2->_installedSplatProductVersion = (NSString *)v7;

    v9 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v10 = [v9 splatCryptex1ProductVersionExtra];
    installedSplatProductVersionExtra = v2->_installedSplatProductVersionExtra;
    v2->_installedSplatProductVersionExtra = (NSString *)v10;

    v12 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v13 = [v12 splatCryptex1BuildVersion];
    installedSplatBuildVersion = v2->_installedSplatBuildVersion;
    v2->_installedSplatBuildVersion = (NSString *)v13;

    v15 = [MEMORY[0x263F77DA0] sharedDevice];
    uint64_t v16 = [v15 splatCryptex1ReleaseType];
    installedSplatReleaseType = v2->_installedSplatReleaseType;
    v2->_installedSplatReleaseType = (NSString *)v16;

    v18 = [MEMORY[0x263F77DA0] sharedDevice];
    v19 = [v18 releaseType];
    if (v19)
    {
      v20 = v2->_installedSplatReleaseType;

      if (v20)
      {
LABEL_6:
        v23 = [MEMORY[0x263F77DA0] sharedDevice];
        uint64_t v24 = [v23 restoreVersion];
        installedBaseOSRestoreVersion = v2->_installedBaseOSRestoreVersion;
        v2->_installedBaseOSRestoreVersion = (NSString *)v24;

        v26 = [MEMORY[0x263F77DA0] sharedDevice];
        uint64_t v27 = [v26 productVersion];
        installedBaseOSProductVersion = v2->_installedBaseOSProductVersion;
        v2->_installedBaseOSProductVersion = (NSString *)v27;

        v29 = [MEMORY[0x263F77DA0] sharedDevice];
        uint64_t v30 = [v29 buildVersion];
        installedBaseOSBuildVersion = v2->_installedBaseOSBuildVersion;
        v2->_installedBaseOSBuildVersion = (NSString *)v30;

        v32 = [MEMORY[0x263F77DA0] sharedDevice];
        uint64_t v33 = [v32 releaseType];
        installedBaseOSReleaseType = v2->_installedBaseOSReleaseType;
        v2->_installedBaseOSReleaseType = (NSString *)v33;

        requestedSplatRestoreVersion = v2->_requestedSplatRestoreVersion;
        v2->_requestedSplatRestoreVersion = 0;

        v2->_allowSameRestoreVersion = 0;
        return v2;
      }
      v18 = [MEMORY[0x263F77DA0] sharedDevice];
      uint64_t v21 = [v18 releaseType];
      v22 = v2->_installedSplatReleaseType;
      v2->_installedSplatReleaseType = (NSString *)v21;
    }
    goto LABEL_6;
  }
  return v2;
}

- (id)_stringRemovingParenthesis:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", @"("), &stru_26C1810A0;
    v6 = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", @""), &stru_26C1810A0);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v85 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v86 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v100 objects:v117 count:16];
  id v87 = v5;
  v90 = self;
  if (!v6) {
    goto LABEL_46;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v101;
  uint64_t v91 = *(void *)v101;
  do
  {
    uint64_t v9 = 0;
    uint64_t v92 = v7;
    do
    {
      if (*(void *)v101 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v100 + 1) + 8 * v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [v10 attributes];
        v12 = [v11 safeStringForKey:@"ReleaseType"];

        uint64_t v13 = (void *)MEMORY[0x263F77D78];
        v14 = [MEMORY[0x263F77DA0] sharedDevice];
        v15 = [v14 releaseType];
        LOBYTE(v13) = [v13 stringIsEqual:v12 to:v15];

        if (v13)
        {
          uint64_t v16 = [v10 attributes];
          v17 = [v16 safeObjectForKey:@"Revoked" ofClass:objc_opt_class()];

          int v18 = [v17 BOOLValue];
          v19 = [v10 attributes];
          uint64_t v20 = [v19 safeStringForKey:@"RestoreVersion"];

          id v21 = objc_alloc(MEMORY[0x263F77E18]);
          v22 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatRestoreVersion];
          v23 = (void *)[v21 initWithRestoreVersion:v22];

          uint64_t v24 = (SUCorePolicyExtensionSplatUpdate *)v20;
          v25 = (__CFString *)[objc_alloc(MEMORY[0x263F77E18]) initWithRestoreVersion:v20];
          v93 = v23;
          if ([v23 isComparable:v25])
          {
            uint64_t v26 = [v23 compare:v25];
            uint64_t v27 = v26;
            if (!v18)
            {
              v88 = v24;
              v39 = [(SUCorePolicyExtensionSplatUpdate *)v90 installedSplatProductVersionExtra];
              uint64_t v40 = [(SUCorePolicyExtensionSplatUpdate *)v90 _stringRemovingParenthesis:v39];
              v41 = (void *)v40;
              v42 = &stru_26C1810A0;
              if (v40) {
                v42 = (__CFString *)v40;
              }
              v29 = v42;

              v43 = [v10 attributes];
              v44 = [v43 safeStringForKey:@"ProductVersionExtra"];
              uint64_t v45 = [(SUCorePolicyExtensionSplatUpdate *)v90 _stringRemovingParenthesis:v44];

              v89 = (void *)v45;
              if (v45) {
                uint64_t v46 = [v29 compare:v45 options:1];
              }
              else {
                uint64_t v46 = 0;
              }
              uint64_t v24 = v88;
              if (v27 == -1
                || !v27
                && ([(SUCorePolicyExtensionSplatUpdate *)v90 allowSameRestoreVersion]
                 || v46 == -1))
              {
                [v86 addObject:v10];
                int v48 = 1;
              }
              else
              {
                int v48 = 0;
              }
              v49 = [MEMORY[0x263F77DE8] sharedLogger];
              v50 = [v49 oslog];

              self = v90;
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                BOOL v51 = [(SUCorePolicyExtensionSplatUpdate *)v90 allowSameRestoreVersion];
                *(_DWORD *)buf = 138544642;
                v52 = @"YES";
                if (v51) {
                  v53 = @"YES";
                }
                else {
                  v53 = @"NO";
                }
                v106 = v88;
                if (!v48) {
                  v52 = @"NO";
                }
                __int16 v107 = 2114;
                v108 = (const char *)v12;
                __int16 v109 = 2114;
                v110 = (__CFString *)v29;
                __int16 v111 = 2114;
                v112 = v89;
                __int16 v113 = 2114;
                v114 = v53;
                __int16 v115 = 2114;
                v116 = v52;
                _os_log_impl(&dword_20C8EA000, v50, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering update asset by restore version, restoreVersion=%{public}@, releaseType=%{public}@ installedProductVersionExtra=%{public}@ targetProductVersionExtra=%{public}@ allowSameRestoreVersion=%{public}@ | keep=%{public}@", buf, 0x3Eu);
              }

              id v5 = v87;
              goto LABEL_42;
            }
            self = v90;
            if (v26)
            {
              v28 = [MEMORY[0x263F77DE8] sharedLogger];
              v29 = [v28 oslog];

              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v106 = v24;
                __int16 v107 = 2114;
                v108 = (const char *)v12;
                __int16 v109 = 2114;
                v110 = @"NO";
                uint64_t v30 = v29;
                v31 = "[POLICY] filtering revoked asset by restore version, restoreVersion=%{public}@, releaseType=%{publ"
                      "ic}@ | keep=%{public}@";
                goto LABEL_19;
              }
LABEL_42:
              uint64_t v7 = v92;

LABEL_43:
              uint64_t v8 = v91;
              goto LABEL_44;
            }
            [v85 addObject:v10];
            v47 = [MEMORY[0x263F77DE8] sharedLogger];
            v29 = [v47 oslog];

            if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_42;
            }
            *(_DWORD *)buf = 138543874;
            v106 = v24;
            __int16 v107 = 2114;
            v108 = (const char *)v12;
            __int16 v109 = 2114;
            v110 = @"YES";
            uint64_t v30 = v29;
            v31 = "[POLICY] filtering revoked asset by restore version, restoreVersion=%{public}@, releaseType=%{public}@"
                  " | keep=%{public}@";
          }
          else
          {
            v38 = [MEMORY[0x263F77DE8] sharedLogger];
            v29 = [v38 oslog];

            if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              self = v90;
              goto LABEL_42;
            }
            *(_DWORD *)buf = 138543874;
            self = v90;
            v106 = v90;
            __int16 v107 = 2114;
            v108 = (const char *)v93;
            __int16 v109 = 2114;
            v110 = v25;
            uint64_t v30 = v29;
            v31 = "%{public}@ Incomparable RestoreVersion. Skipping asset for installedSplatRestoreVersion=%{public}@ tar"
                  "getSplatRestoreVersion=%{public}@";
          }
LABEL_19:
          _os_log_impl(&dword_20C8EA000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 0x20u);
          goto LABEL_42;
        }
        v35 = [MEMORY[0x263F77DE8] sharedLogger];
        v17 = [v35 oslog];

        uint64_t v7 = v92;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v36 = [MEMORY[0x263F77DA0] sharedDevice];
          objc_super v37 = [v36 releaseType];
          *(_DWORD *)buf = 138543874;
          v106 = self;
          __int16 v107 = 2114;
          v108 = (const char *)v12;
          __int16 v109 = 2114;
          v110 = v37;
          _os_log_impl(&dword_20C8EA000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Incompatible asset ReleaseType: %{public}@ Device ReleaseType: %{public}@", buf, 0x20u);
        }
        goto LABEL_43;
      }
      v32 = [MEMORY[0x263F77DE8] sharedLogger];
      v12 = [v32 oslog];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v106 = self;
        __int16 v107 = 2112;
        v108 = v34;
        _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Unexpected type in MobileAsset asset array: %@", buf, 0x16u);
      }
LABEL_44:

      ++v9;
    }
    while (v7 != v9);
    uint64_t v7 = [v5 countByEnumeratingWithState:&v100 objects:v117 count:16];
  }
  while (v7);
LABEL_46:

  id v54 = objc_alloc(MEMORY[0x263F77D90]);
  v55 = (void *)[v54 initWithProjectName:*MEMORY[0x263F77EB8]];
  v56 = [v55 getStringConfigForKey:*MEMORY[0x263F77E80]];

  if (v56) {
    goto LABEL_57;
  }
  id v57 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v58 = v86;
  uint64_t v59 = [v58 countByEnumeratingWithState:&v96 objects:v104 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v60; ++i)
      {
        if (*(void *)v97 != v61) {
          objc_enumerationMutation(v58);
        }
        v63 = [*(id *)(*((void *)&v96 + 1) + 8 * i) attributes];
        v64 = [v63 safeStringForKey:@"ProductVersionExtra"];

        if (v64) {
          [v57 addObject:v64];
        }
      }
      uint64_t v60 = [v58 countByEnumeratingWithState:&v96 objects:v104 count:16];
    }
    while (v60);
  }

  v65 = [v57 sortedArrayUsingSelector:sel_compare_];
  v56 = [v65 lastObject];

  id v5 = v87;
  v66 = v90;
  if (v56)
  {
LABEL_57:
    v67 = [MEMORY[0x263F77DE8] sharedLogger];
    v68 = [v67 oslog];

    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v69 = [v86 count];
      *(_DWORD *)buf = 134218242;
      v106 = (SUCorePolicyExtensionSplatUpdate *)v69;
      __int16 v107 = 2114;
      v108 = v56;
      _os_log_impl(&dword_20C8EA000, v68, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu update assets before filtering for productVersionExtra=%{public}@", buf, 0x16u);
    }

    v70 = (void *)MEMORY[0x263F08A98];
    v94[0] = MEMORY[0x263EF8330];
    v94[1] = 3221225472;
    v94[2] = __67__SUCorePolicyExtensionSplatUpdate_filterSoftwareUpdateAssetArray___block_invoke;
    v94[3] = &unk_2640DC388;
    v56 = v56;
    v95 = v56;
    v71 = [v70 predicateWithBlock:v94];
    v72 = [v86 filteredArrayUsingPredicate:v71];

    id v58 = (id)[v72 mutableCopy];
    v73 = [MEMORY[0x263F77DE8] sharedLogger];
    v74 = [v73 oslog];

    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v75 = [v58 count];
      *(_DWORD *)buf = 134218242;
      v106 = (SUCorePolicyExtensionSplatUpdate *)v75;
      __int16 v107 = 2114;
      v108 = v56;
      _os_log_impl(&dword_20C8EA000, v74, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu update assets left after filtering for productVersionExtra=%{public}@", buf, 0x16u);
    }

    v66 = v90;
  }
  if (![v58 count])
  {
    uint64_t v79 = [v85 count];
    v80 = [MEMORY[0x263F77DE8] sharedLogger];
    v77 = [v80 oslog];

    BOOL v81 = os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT);
    if (v79)
    {
      if (v81)
      {
        *(_DWORD *)buf = 138543618;
        v106 = v90;
        __int16 v107 = 2082;
        v108 = "-[SUCorePolicyExtensionSplatUpdate filterSoftwareUpdateAssetArray:]";
        v82 = "%{public}@ %{public}s - Returning splat rollback";
LABEL_71:
        _os_log_impl(&dword_20C8EA000, v77, OS_LOG_TYPE_DEFAULT, v82, buf, 0x16u);
      }
    }
    else if (v81)
    {
      *(_DWORD *)buf = 138543618;
      v106 = v90;
      __int16 v107 = 2082;
      v108 = "-[SUCorePolicyExtensionSplatUpdate filterSoftwareUpdateAssetArray:]";
      v82 = "%{public}@ %{public}s - Returning empty asset set";
      goto LABEL_71;
    }
    v78 = v85;
    goto LABEL_73;
  }
  v76 = [MEMORY[0x263F77DE8] sharedLogger];
  v77 = [v76 oslog];

  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v106 = v66;
    __int16 v107 = 2082;
    v108 = "-[SUCorePolicyExtensionSplatUpdate filterSoftwareUpdateAssetArray:]";
    _os_log_impl(&dword_20C8EA000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s - Returning splat updates", buf, 0x16u);
  }
  v78 = v58;
LABEL_73:

  id v83 = v78;
  return v83;
}

uint64_t __67__SUCorePolicyExtensionSplatUpdate_filterSoftwareUpdateAssetArray___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F77D78];
  id v5 = [v3 attributes];
  uint64_t v6 = [v5 safeStringForKey:@"ProductVersionExtra"];
  uint64_t v7 = [v4 stringIsEqual:v6 to:*(void *)(a1 + 32)];

  uint64_t v8 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = [v3 attributes];
    uint64_t v12 = [v11 safeStringForKey:@"ProductVersionExtra"];
    uint64_t v13 = (void *)v12;
    v14 = @"NO";
    int v16 = 138543874;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    if (v7) {
      v14 = @"YES";
    }
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    id v21 = v14;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering update asset for productVersionExtra=%{public}@, assetProductVersionExtra=%{public}@ | keep=%{public}@", (uint8_t *)&v16, 0x20u);
  }
  return v7;
}

- (id)filterDocumentationAssetArray:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)extendMASoftwareUpdateCatalogDownloadOptions:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [MEMORY[0x263F77DA0] sharedDevice];
    int v6 = [v5 hasSplat];

    if (v6)
    {
      uint64_t v7 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSReleaseType];
      [v4 setPrerequisiteReleaseType:v7];

      uint64_t v8 = [v4 prerequisiteReleaseType];
      uint64_t v9 = [@"|" stringByAppendingFormat:@"releaseType:%@|", v8];

      objc_msgSend(v4, "setAllowSameVersion:", -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion"));
      int v10 = [v4 allowSameVersion];
      v11 = @"NO";
      if (v10) {
        v11 = @"YES";
      }
      uint64_t v12 = [v9 stringByAppendingFormat:@"allowSameVersion:%@|", v11];

      uint64_t v13 = [v4 additionalServerParams];
      v14 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSBuildVersion];
      [v13 setSafeObject:v14 forKey:@"Build"];

      v15 = [v4 additionalServerParams];
      int v16 = [v15 safeStringForKey:@"Build"];
      uint64_t v17 = [v12 stringByAppendingFormat:@"%@:%@|", @"Build", v16];

      __int16 v18 = [v4 additionalServerParams];
      uint64_t v19 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatProductVersionExtra];
      [v18 setSafeObject:v19 forKey:@"ProductVersionExtra"];

      __int16 v20 = [v4 additionalServerParams];
      id v21 = [v20 safeStringForKey:@"ProductVersionExtra"];
      uint64_t v22 = [v17 stringByAppendingFormat:@"%@:%@|", @"ProductVersionExtra", v21];

      v23 = [v4 additionalServerParams];
      uint64_t v24 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatRestoreVersion];
      [v23 setSafeObject:v24 forKey:@"InstalledSplatRestoreVersion"];

      v25 = [v4 additionalServerParams];
      uint64_t v26 = [v25 safeStringForKey:@"InstalledSplatRestoreVersion"];
      uint64_t v27 = [v22 stringByAppendingFormat:@"%@:%@|", @"InstalledSplatRestoreVersion", v26];

      v28 = [v4 additionalServerParams];
      v29 = [(SUCorePolicyExtensionSplatUpdate *)self requestedSplatRestoreVersion];
      [v28 setSafeObject:v29 forKey:@"RequestedRestoreVersion"];

      uint64_t v30 = [v4 additionalServerParams];
      v31 = [v30 safeStringForKey:@"RequestedRestoreVersion"];
      v32 = [v27 stringByAppendingFormat:@"%@:%@|", @"RequestedRestoreVersion", v31];

      uint64_t v33 = [v4 additionalServerParams];
      if ([(SUCorePolicyExtensionSplatUpdate *)self allowSameRestoreVersion]) {
        v34 = @"true";
      }
      else {
        v34 = @"false";
      }
      [v33 setSafeObject:v34 forKey:@"AllowSameRestoreVersion"];

      v35 = [v4 additionalServerParams];
      v36 = [v35 safeStringForKey:@"AllowSameRestoreVersion"];
      objc_super v37 = [v32 stringByAppendingFormat:@"%@:%@|", @"AllowSameRestoreVersion", v36];
    }
    else
    {
      v35 = [MEMORY[0x263F77DA8] sharedDiag];
      v36 = (void *)[[NSString alloc] initWithFormat:@"%@ without hasSplat = YES, yet calling extendMASoftwareUpdateCatalogDownloadOptions (no extended download options will be added)", self];
      [v35 trackAnomaly:@"[POLICY] DOWNLOAD_OPTIONS" forReason:v36 withResult:8102 withError:0];
      objc_super v37 = @"|";
    }

    uint64_t v40 = [MEMORY[0x263F77DE8] sharedLogger];
    v39 = [v40 oslog];

    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v42 = self;
      __int16 v43 = 2114;
      v44 = v37;
      _os_log_impl(&dword_20C8EA000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ downloading software update catalog with extended download options: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v38 = [MEMORY[0x263F77DE8] sharedLogger];
    v39 = [v38 oslog];

    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v39, OS_LOG_TYPE_DEFAULT, "Options class is not MAMsuDownloadOptions, so unable to set splat options.", buf, 2u);
    }
    objc_super v37 = @"|";
  }
}

- (BOOL)isSplatPolicy
{
  return 1;
}

- (SUCorePolicyExtensionSplatUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SUCorePolicyExtensionSplatUpdate;
  id v5 = [(SUCorePolicyExtension *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedSplatRestoreVersion"];
    installedSplatRestoreVersion = v5->_installedSplatRestoreVersion;
    v5->_installedSplatRestoreVersion = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedSplatBuildVersion"];
    installedSplatBuildVersion = v5->_installedSplatBuildVersion;
    v5->_installedSplatBuildVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedSplatProductVersion"];
    installedSplatProductVersion = v5->_installedSplatProductVersion;
    v5->_installedSplatProductVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedSplatProductVersionExtra"];
    installedSplatProductVersionExtra = v5->_installedSplatProductVersionExtra;
    v5->_installedSplatProductVersionExtra = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedSplatReleaseType"];
    installedSplatReleaseType = v5->_installedSplatReleaseType;
    v5->_installedSplatReleaseType = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedBaseOSRestoreVersion"];
    installedBaseOSRestoreVersion = v5->_installedBaseOSRestoreVersion;
    v5->_installedBaseOSRestoreVersion = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedBaseOSBuildVersion"];
    installedBaseOSBuildVersion = v5->_installedBaseOSBuildVersion;
    v5->_installedBaseOSBuildVersion = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedBaseOSProductVersion"];
    installedBaseOSProductVersion = v5->_installedBaseOSProductVersion;
    v5->_installedBaseOSProductVersion = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installedBaseOSReleaseType"];
    installedBaseOSReleaseType = v5->_installedBaseOSReleaseType;
    v5->_installedBaseOSReleaseType = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedSplatRestoreVersion"];
    requestedSplatRestoreVersion = v5->_requestedSplatRestoreVersion;
    v5->_requestedSplatRestoreVersion = (NSString *)v24;

    v5->_allowSameRestoreVersion = [v4 decodeBoolForKey:@"allowSameRestoreVersion"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  id v4 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatRestoreVersion];
  [v14 encodeObject:v4 forKey:@"installedSplatRestoreVersion"];

  id v5 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatBuildVersion];
  [v14 encodeObject:v5 forKey:@"installedSplatBuildVersion"];

  uint64_t v6 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatProductVersion];
  [v14 encodeObject:v6 forKey:@"installedSplatProductVersion"];

  uint64_t v7 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatProductVersionExtra];
  [v14 encodeObject:v7 forKey:@"installedSplatProductVersionExtra"];

  uint64_t v8 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatReleaseType];
  [v14 encodeObject:v8 forKey:@"installedSplatReleaseType"];

  uint64_t v9 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSRestoreVersion];
  [v14 encodeObject:v9 forKey:@"installedBaseOSRestoreVersion"];

  uint64_t v10 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSBuildVersion];
  [v14 encodeObject:v10 forKey:@"installedBaseOSBuildVersion"];

  v11 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSProductVersion];
  [v14 encodeObject:v11 forKey:@"installedBaseOSProductVersion"];

  uint64_t v12 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSReleaseType];
  [v14 encodeObject:v12 forKey:@"installedBaseOSReleaseType"];

  uint64_t v13 = [(SUCorePolicyExtensionSplatUpdate *)self requestedSplatRestoreVersion];
  [v14 encodeObject:v13 forKey:@"requestedSplatRestoreVersion"];

  objc_msgSend(v14, "encodeBool:forKey:", -[SUCorePolicyExtensionSplatUpdate allowSameRestoreVersion](self, "allowSameRestoreVersion"), @"allowSameRestoreVersion");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyExtensionSplatUpdate *)a3;
  if (v4 == self)
  {
    LOBYTE(v32) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = (void *)MEMORY[0x263F77D78];
      uint64_t v7 = [(SUCorePolicyExtensionSplatUpdate *)v5 installedSplatRestoreVersion];
      uint64_t v8 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatRestoreVersion];
      if ([v6 stringIsEqual:v7 to:v8])
      {
        uint64_t v9 = (void *)MEMORY[0x263F77D78];
        uint64_t v10 = [(SUCorePolicyExtensionSplatUpdate *)v5 installedSplatBuildVersion];
        v11 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatBuildVersion];
        if ([v9 stringIsEqual:v10 to:v11])
        {
          uint64_t v12 = (void *)MEMORY[0x263F77D78];
          uint64_t v13 = [(SUCorePolicyExtensionSplatUpdate *)v5 installedSplatProductVersion];
          uint64_t v51 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatProductVersion];
          v52 = v13;
          if (objc_msgSend(v12, "stringIsEqual:to:", v13))
          {
            id v14 = (void *)MEMORY[0x263F77D78];
            uint64_t v15 = [(SUCorePolicyExtensionSplatUpdate *)v5 installedSplatProductVersionExtra];
            v50 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatProductVersionExtra];
            if (objc_msgSend(v14, "stringIsEqual:to:", v15))
            {
              v47 = (void *)v15;
              uint64_t v16 = (void *)MEMORY[0x263F77D78];
              uint64_t v17 = [(SUCorePolicyExtensionSplatUpdate *)v5 installedSplatReleaseType];
              int v48 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatReleaseType];
              v49 = (void *)v17;
              if (objc_msgSend(v16, "stringIsEqual:to:", v17))
              {
                uint64_t v18 = (void *)MEMORY[0x263F77D78];
                uint64_t v19 = [(SUCorePolicyExtensionSplatUpdate *)v5 installedBaseOSRestoreVersion];
                uint64_t v45 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSRestoreVersion];
                uint64_t v46 = (void *)v19;
                if (objc_msgSend(v18, "stringIsEqual:to:", v19))
                {
                  __int16 v43 = (void *)MEMORY[0x263F77D78];
                  uint64_t v20 = [(SUCorePolicyExtensionSplatUpdate *)v5 installedBaseOSBuildVersion];
                  uint64_t v21 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSBuildVersion];
                  uint64_t v22 = v43;
                  v42 = (void *)v21;
                  v44 = (void *)v20;
                  if (objc_msgSend(v22, "stringIsEqual:to:", v20))
                  {
                    uint64_t v40 = (void *)MEMORY[0x263F77D78];
                    uint64_t v23 = [(SUCorePolicyExtensionSplatUpdate *)v5 installedBaseOSProductVersion];
                    uint64_t v24 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSProductVersion];
                    v25 = v40;
                    v39 = (void *)v24;
                    v41 = (void *)v23;
                    if (objc_msgSend(v25, "stringIsEqual:to:", v23))
                    {
                      uint64_t v26 = (void *)MEMORY[0x263F77D78];
                      uint64_t v27 = [(SUCorePolicyExtensionSplatUpdate *)v5 installedBaseOSReleaseType];
                      objc_super v37 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSReleaseType];
                      v38 = (void *)v27;
                      if (objc_msgSend(v26, "stringIsEqual:to:", v27))
                      {
                        v28 = v47;
                        v29 = (void *)MEMORY[0x263F77D78];
                        uint64_t v30 = [(SUCorePolicyExtensionSplatUpdate *)v5 requestedSplatRestoreVersion];
                        v35 = [(SUCorePolicyExtensionSplatUpdate *)self requestedSplatRestoreVersion];
                        v36 = (void *)v30;
                        if (objc_msgSend(v29, "stringIsEqual:to:", v30))
                        {
                          BOOL v31 = [(SUCorePolicyExtensionSplatUpdate *)v5 allowSameRestoreVersion];
                          int v32 = v31 ^ [(SUCorePolicyExtensionSplatUpdate *)self allowSameRestoreVersion] ^ 1;
                        }
                        else
                        {
                          LOBYTE(v32) = 0;
                        }
                        uint64_t v33 = (void *)v51;
                        uint64_t v13 = v52;
                      }
                      else
                      {
                        v28 = v47;
                        LOBYTE(v32) = 0;
                        uint64_t v33 = (void *)v51;
                        uint64_t v13 = v52;
                      }
                    }
                    else
                    {
                      v28 = v47;
                      LOBYTE(v32) = 0;
                      uint64_t v33 = (void *)v51;
                      uint64_t v13 = v52;
                    }
                  }
                  else
                  {
                    v28 = v47;
                    LOBYTE(v32) = 0;
                    uint64_t v33 = (void *)v51;
                    uint64_t v13 = v52;
                  }
                }
                else
                {
                  v28 = v47;
                  LOBYTE(v32) = 0;
                  uint64_t v33 = (void *)v51;
                  uint64_t v13 = v52;
                }
              }
              else
              {
                v28 = v47;
                LOBYTE(v32) = 0;
                uint64_t v33 = (void *)v51;
                uint64_t v13 = v52;
              }
            }
            else
            {
              v28 = (void *)v15;
              LOBYTE(v32) = 0;
              uint64_t v33 = (void *)v51;
              uint64_t v13 = v52;
            }
          }
          else
          {
            LOBYTE(v32) = 0;
            uint64_t v33 = (void *)v51;
          }
        }
        else
        {
          LOBYTE(v32) = 0;
        }
      }
      else
      {
        LOBYTE(v32) = 0;
      }
    }
    else
    {
      LOBYTE(v32) = 0;
    }
  }

  return v32;
}

- (id)extensionName
{
  return @"SUCorePolicyExtensionSplatUpdate";
}

- (id)summary
{
  id v3 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatRestoreVersion];

  if (v3)
  {
    id v4 = [NSString alloc];
    id v5 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatRestoreVersion];
    uint64_t v6 = (void *)[v4 initWithFormat:@"|installedSplatRestoreVersion=%@", v5];
    uint64_t v7 = [&stru_26C1810A0 stringByAppendingString:v6];
  }
  else
  {
    uint64_t v7 = &stru_26C1810A0;
  }
  uint64_t v8 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatProductVersion];

  if (v8)
  {
    id v9 = [NSString alloc];
    uint64_t v10 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatProductVersion];
    v11 = (void *)[v9 initWithFormat:@"|installedSplatProductVersion=%@", v10];
    uint64_t v12 = [(__CFString *)v7 stringByAppendingString:v11];

    uint64_t v7 = (__CFString *)v12;
  }
  uint64_t v13 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatProductVersionExtra];

  if (v13)
  {
    id v14 = [NSString alloc];
    uint64_t v15 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatProductVersionExtra];
    uint64_t v16 = (void *)[v14 initWithFormat:@"|installedSplatProductVersionExtra=%@", v15];
    uint64_t v17 = [(__CFString *)v7 stringByAppendingString:v16];

    uint64_t v7 = (__CFString *)v17;
  }
  uint64_t v18 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatReleaseType];

  if (v18)
  {
    id v19 = [NSString alloc];
    uint64_t v20 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatReleaseType];
    uint64_t v21 = (void *)[v19 initWithFormat:@"|installedSplatReleaseType=%@", v20];
    uint64_t v22 = [(__CFString *)v7 stringByAppendingString:v21];

    uint64_t v7 = (__CFString *)v22;
  }
  uint64_t v23 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatBuildVersion];

  if (v23)
  {
    id v24 = [NSString alloc];
    v25 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatBuildVersion];
    uint64_t v26 = (void *)[v24 initWithFormat:@"|installedSplatBuildVersion=%@", v25];
    uint64_t v27 = [(__CFString *)v7 stringByAppendingString:v26];

    uint64_t v7 = (__CFString *)v27;
  }
  v28 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSRestoreVersion];

  if (v28)
  {
    id v29 = [NSString alloc];
    uint64_t v30 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSRestoreVersion];
    BOOL v31 = (void *)[v29 initWithFormat:@"|installedBaseOSRestoreVersion=%@", v30];
    uint64_t v32 = [(__CFString *)v7 stringByAppendingString:v31];

    uint64_t v7 = (__CFString *)v32;
  }
  uint64_t v33 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSProductVersion];

  if (v33)
  {
    id v34 = [NSString alloc];
    v35 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSProductVersion];
    v36 = (void *)[v34 initWithFormat:@"|installedBaseOSProductVersion=%@", v35];
    uint64_t v37 = [(__CFString *)v7 stringByAppendingString:v36];

    uint64_t v7 = (__CFString *)v37;
  }
  v38 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSReleaseType];

  if (v38)
  {
    id v39 = [NSString alloc];
    uint64_t v40 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSReleaseType];
    v41 = (void *)[v39 initWithFormat:@"|installedBaseOSReleaseType=%@", v40];
    uint64_t v42 = [(__CFString *)v7 stringByAppendingString:v41];

    uint64_t v7 = (__CFString *)v42;
  }
  __int16 v43 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSBuildVersion];

  if (v43)
  {
    id v44 = [NSString alloc];
    uint64_t v45 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSBuildVersion];
    uint64_t v46 = (void *)[v44 initWithFormat:@"|installedBaseOSBuildVersion=%@", v45];
    uint64_t v47 = [(__CFString *)v7 stringByAppendingString:v46];

    uint64_t v7 = (__CFString *)v47;
  }
  int v48 = [(SUCorePolicyExtensionSplatUpdate *)self requestedSplatRestoreVersion];

  if (v48)
  {
    id v49 = [NSString alloc];
    v50 = [(SUCorePolicyExtensionSplatUpdate *)self requestedSplatRestoreVersion];
    uint64_t v51 = (void *)[v49 initWithFormat:@"|requestedSplatRestoreVersion=%@", v50];
    uint64_t v52 = [(__CFString *)v7 stringByAppendingString:v51];

    uint64_t v7 = (__CFString *)v52;
  }
  id v53 = [NSString alloc];
  BOOL v54 = [(SUCorePolicyExtensionSplatUpdate *)self allowSameRestoreVersion];
  v55 = @"NO";
  if (v54) {
    v55 = @"YES";
  }
  v56 = (void *)[v53 initWithFormat:@"|allowSameRestoreVersion=%@", v55];
  id v57 = [(__CFString *)v7 stringByAppendingString:v56];

  if (([v57 isEqualToString:&stru_26C1810A0] & 1) == 0)
  {
    uint64_t v58 = [v57 stringByAppendingString:@"|"];

    id v57 = (void *)v58;
  }

  return v57;
}

- (id)description
{
  id v17 = [NSString alloc];
  uint64_t v16 = [(SUCorePolicyExtensionSplatUpdate *)self extensionName];
  id v3 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatRestoreVersion];
  id v4 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatBuildVersion];
  id v5 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatProductVersion];
  uint64_t v15 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatProductVersionExtra];
  uint64_t v6 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatReleaseType];
  uint64_t v7 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSRestoreVersion];
  uint64_t v8 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSBuildVersion];
  id v9 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSProductVersion];
  uint64_t v10 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSReleaseType];
  v11 = [(SUCorePolicyExtensionSplatUpdate *)self requestedSplatRestoreVersion];
  BOOL v12 = [(SUCorePolicyExtensionSplatUpdate *)self allowSameRestoreVersion];
  uint64_t v13 = @"NO";
  if (v12) {
    uint64_t v13 = @"YES";
  }
  uint64_t v18 = (void *)[v17 initWithFormat:@"%@(installedSplatRestoreVersion:%@|installedSplatBuildVersion:%@|installedSplatProductVersion:%@|installedSplatProductVersionExtra:%@|installedSplatReleaseType:%@|installedBaseOSRestoreVersion:%@|installedBaseOSBuildVersion:%@|installedBaseOSProductVersion:%@|installedBaseOSReleaseType:%@|requestedSplatRestoreVersion:%@|allowSameRestoreVersion:%@)", v16, v3, v4, v5, v15, v6, v7, v8, v9, v10, v11, v13];

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SUCorePolicyExtensionSplatUpdate);
  id v5 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatRestoreVersion];
  [(SUCorePolicyExtensionSplatUpdate *)v4 setInstalledSplatRestoreVersion:v5];

  uint64_t v6 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatBuildVersion];
  [(SUCorePolicyExtensionSplatUpdate *)v4 setInstalledSplatBuildVersion:v6];

  uint64_t v7 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatProductVersion];
  [(SUCorePolicyExtensionSplatUpdate *)v4 setInstalledSplatProductVersion:v7];

  uint64_t v8 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatProductVersionExtra];
  [(SUCorePolicyExtensionSplatUpdate *)v4 setInstalledSplatProductVersionExtra:v8];

  id v9 = [(SUCorePolicyExtensionSplatUpdate *)self installedSplatReleaseType];
  [(SUCorePolicyExtensionSplatUpdate *)v4 setInstalledSplatReleaseType:v9];

  uint64_t v10 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSRestoreVersion];
  [(SUCorePolicyExtensionSplatUpdate *)v4 setInstalledBaseOSRestoreVersion:v10];

  v11 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSBuildVersion];
  [(SUCorePolicyExtensionSplatUpdate *)v4 setInstalledBaseOSBuildVersion:v11];

  BOOL v12 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSProductVersion];
  [(SUCorePolicyExtensionSplatUpdate *)v4 setInstalledBaseOSProductVersion:v12];

  uint64_t v13 = [(SUCorePolicyExtensionSplatUpdate *)self installedBaseOSReleaseType];
  [(SUCorePolicyExtensionSplatUpdate *)v4 setInstalledBaseOSReleaseType:v13];

  id v14 = [(SUCorePolicyExtensionSplatUpdate *)self requestedSplatRestoreVersion];
  [(SUCorePolicyExtensionSplatUpdate *)v4 setRequestedSplatRestoreVersion:v14];

  [(SUCorePolicyExtensionSplatUpdate *)v4 setAllowSameRestoreVersion:[(SUCorePolicyExtensionSplatUpdate *)self allowSameRestoreVersion]];
  return v4;
}

- (NSString)installedSplatRestoreVersion
{
  return self->_installedSplatRestoreVersion;
}

- (void)setInstalledSplatRestoreVersion:(id)a3
{
}

- (NSString)installedSplatBuildVersion
{
  return self->_installedSplatBuildVersion;
}

- (void)setInstalledSplatBuildVersion:(id)a3
{
}

- (NSString)installedSplatProductVersion
{
  return self->_installedSplatProductVersion;
}

- (void)setInstalledSplatProductVersion:(id)a3
{
}

- (NSString)installedSplatProductVersionExtra
{
  return self->_installedSplatProductVersionExtra;
}

- (void)setInstalledSplatProductVersionExtra:(id)a3
{
}

- (NSString)installedSplatReleaseType
{
  return self->_installedSplatReleaseType;
}

- (void)setInstalledSplatReleaseType:(id)a3
{
}

- (NSString)installedBaseOSRestoreVersion
{
  return self->_installedBaseOSRestoreVersion;
}

- (void)setInstalledBaseOSRestoreVersion:(id)a3
{
}

- (NSString)installedBaseOSBuildVersion
{
  return self->_installedBaseOSBuildVersion;
}

- (void)setInstalledBaseOSBuildVersion:(id)a3
{
}

- (NSString)installedBaseOSProductVersion
{
  return self->_installedBaseOSProductVersion;
}

- (void)setInstalledBaseOSProductVersion:(id)a3
{
}

- (NSString)installedBaseOSReleaseType
{
  return self->_installedBaseOSReleaseType;
}

- (void)setInstalledBaseOSReleaseType:(id)a3
{
}

- (NSString)requestedSplatRestoreVersion
{
  return self->_requestedSplatRestoreVersion;
}

- (void)setRequestedSplatRestoreVersion:(id)a3
{
}

- (BOOL)allowSameRestoreVersion
{
  return self->_allowSameRestoreVersion;
}

- (void)setAllowSameRestoreVersion:(BOOL)a3
{
  self->_allowSameRestoreVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedSplatRestoreVersion, 0);
  objc_storeStrong((id *)&self->_installedBaseOSReleaseType, 0);
  objc_storeStrong((id *)&self->_installedBaseOSProductVersion, 0);
  objc_storeStrong((id *)&self->_installedBaseOSBuildVersion, 0);
  objc_storeStrong((id *)&self->_installedBaseOSRestoreVersion, 0);
  objc_storeStrong((id *)&self->_installedSplatReleaseType, 0);
  objc_storeStrong((id *)&self->_installedSplatProductVersionExtra, 0);
  objc_storeStrong((id *)&self->_installedSplatProductVersion, 0);
  objc_storeStrong((id *)&self->_installedSplatBuildVersion, 0);

  objc_storeStrong((id *)&self->_installedSplatRestoreVersion, 0);
}

@end