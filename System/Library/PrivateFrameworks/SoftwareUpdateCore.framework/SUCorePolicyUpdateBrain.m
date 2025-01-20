@interface SUCorePolicyUpdateBrain
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)compatibilityVersion;
- (SUCorePolicyUpdateBrain)initWithCoder:(id)a3;
- (SUCorePolicyUpdateBrain)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingExtensions:(id)a5;
- (SUCorePolicyUpdateBrain)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6;
- (id)constructSoftwareUpdateMAAssetQuery;
- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5;
- (void)setCompatibilityVersion:(id)a3;
@end

@implementation SUCorePolicyUpdateBrain

- (SUCorePolicyUpdateBrain)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)SUCorePolicyUpdateBrain;
  v6 = [(SUCorePolicy *)&v10 initWithSoftwareUpdateAssetType:a3 documentationAssetType:a4 usingPolicies:a5 usingExtensions:a6];
  v7 = v6;
  if (v6)
  {
    compatibilityVersion = v6->_compatibilityVersion;
    v6->_compatibilityVersion = 0;
  }
  return v7;
}

- (SUCorePolicyUpdateBrain)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingExtensions:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyUpdateBrain;
  v5 = [(SUCorePolicy *)&v9 initWithSoftwareUpdateAssetType:a3 documentationAssetType:a4 usingExtensions:a5];
  v6 = v5;
  if (v5)
  {
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = 0;
  }
  return v6;
}

- (id)constructSoftwareUpdateMAAssetQuery
{
  return [(SUCorePolicyUpdateBrain *)self constructSoftwareUpdateMAAssetQueryWithPurpose:0];
}

- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F77DE8];
  id v5 = a3;
  v6 = [v4 sharedLogger];
  v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = self;
    _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] constructSoftwareUpdateMAAssetQuery for policy: %@", buf, 0xCu);
  }

  v16.receiver = self;
  v16.super_class = (Class)SUCorePolicyUpdateBrain;
  v8 = [(SUCorePolicy *)&v16 constructSoftwareUpdateMAAssetQueryWithPurpose:v5];

  objc_super v9 = [(SUCorePolicyUpdateBrain *)self compatibilityVersion];

  if (v9)
  {
    objc_super v10 = [(SUCorePolicyUpdateBrain *)self compatibilityVersion];
    v11 = [v10 stringValue];
    [v8 addKeyValuePair:@"_CompatibilityVersion" with:v11];
  }
  v12 = [MEMORY[0x263F77DE8] sharedLogger];
  v13 = [v12 oslog];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(SUCorePolicyUpdateBrain *)self compatibilityVersion];
    *(_DWORD *)buf = 138543362;
    v18 = v14;
    _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] querying SU metadata: compatibilityVersion=%{public}@", buf, 0xCu);
  }

  return v8;
}

- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v7 = a5;
  v8 = [MEMORY[0x263F77DE8] sharedLogger];
  objc_super v9 = [v8 oslog];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = self;
    _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] selectSoftwareUpdatePrimaryAsset:secondaryAsset:fromAssetQuery for policy: %@", buf, 0xCu);
  }

  if (a3)
  {
    objc_super v10 = objc_msgSend(v7, "SUCoreBorder_results");
    uint64_t v11 = [v10 count];
    v12 = [MEMORY[0x263F77DE8] sharedLogger];
    v13 = [v12 oslog];

    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        uint64_t v15 = [v10 count];
        *(_DWORD *)buf = 134217984;
        v52 = (SUCorePolicyUpdateBrain *)v15;
        _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] %lu SU query results (before filtering)", buf, 0xCu);
      }
      v45 = a3;
      id v46 = v7;

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      v13 = [(SUCorePolicy *)self policyExtensions];
      uint64_t v16 = [v13 countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v48;
        while (2)
        {
          uint64_t v19 = 0;
          v20 = v10;
          do
          {
            if (*(void *)v48 != v18) {
              objc_enumerationMutation(v13);
            }
            v21 = *(void **)(*((void *)&v47 + 1) + 8 * v19);
            objc_super v10 = [v21 filterSoftwareUpdateAssetArray:v20];

            v22 = [MEMORY[0x263F77DE8] sharedLogger];
            v23 = [v22 oslog];

            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v24 = [v10 count];
              v25 = [v21 extensionName];
              *(_DWORD *)buf = 134218242;
              v52 = (SUCorePolicyUpdateBrain *)v24;
              __int16 v53 = 2114;
              v54 = v25;
              _os_log_impl(&dword_20C8EA000, v23, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] %lu assets left after filtering from SUCorePolicyExtension %{public}@", buf, 0x16u);
            }
            if (![v10 count])
            {
              v43 = [MEMORY[0x263F77DE8] sharedLogger];
              v44 = [v43 oslog];

              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_20C8EA000, v44, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] 0 assets found, stopping filtering early", buf, 2u);
              }

              id v7 = v46;
              goto LABEL_39;
            }
            ++v19;
            v20 = v10;
          }
          while (v17 != v19);
          uint64_t v17 = [v13 countByEnumeratingWithState:&v47 objects:v55 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      v26 = [MEMORY[0x263F77DE8] sharedLogger];
      v27 = [v26 oslog];

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = [v10 count];
        *(_DWORD *)buf = 134217984;
        v52 = (SUCorePolicyUpdateBrain *)v28;
        _os_log_impl(&dword_20C8EA000, v27, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] %lu SU query results (before sorting on mastered version)", buf, 0xCu);
      }

      v13 = [v10 sortedArrayUsingComparator:&__block_literal_global_1];
      v29 = [v13 lastObject];
      v30 = [v29 attributes];
      v31 = [v30 safeStringForKey:@"_MasteredVersion"];

      v32 = [MEMORY[0x263F77DE8] sharedLogger];
      v33 = [v32 oslog];

      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v31;
        _os_log_impl(&dword_20C8EA000, v33, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] found highestMasteredVersion = %{public}@", buf, 0xCu);
      }

      uint64_t v34 = [v13 count];
      v35 = [MEMORY[0x263F77DE8] sharedLogger];
      v36 = [v35 oslog];

      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        id v7 = v46;
        if (v37)
        {
          uint64_t v38 = [v13 count];
          *(_DWORD *)buf = 134217984;
          v52 = (SUCorePolicyUpdateBrain *)v38;
          _os_log_impl(&dword_20C8EA000, v36, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] %ld assets found", buf, 0xCu);
        }

        if ((unint64_t)[v13 count] >= 2)
        {
          v39 = [MEMORY[0x263F77DA8] sharedDiag];
          v40 = objc_msgSend([NSString alloc], "initWithFormat:", @"selectSoftwareUpdatePrimaryAsset found %lu assets when 1 was expected", -[NSObject count](v13, "count"));
          [v39 trackAnomaly:@"[POLICY_UPDATE_BRAIN] SELECT_UPDATE_ASSET" forReason:v40 withResult:8409 withError:0];

          v41 = [MEMORY[0x263F77DE8] sharedLogger];
          v42 = [v41 oslog];

          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v52 = v31;
            _os_log_impl(&dword_20C8EA000, v42, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] taking the last asset in the asset array, which is the highest mastered version (%{public}@)", buf, 0xCu);
          }
        }
        id *v45 = [v13 lastObject];
      }
      else
      {
        id v7 = v46;
        if (v37)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20C8EA000, v36, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] 0 assets found", buf, 2u);
        }
      }
    }
    else if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] 0 SU query results (before filtering)", buf, 2u);
    }
LABEL_39:
  }
  else
  {
    objc_super v10 = [MEMORY[0x263F77DA8] sharedDiag];
    [v10 trackError:@"[POLICY_UPDATE_BRAIN] SELECT_UPDATE_ASSET" forReason:@"selectSoftwareUpdatePrimaryAsset called with unexpected nil primaryAsset param" withResult:8102 withError:0];
  }
}

uint64_t __90__SUCorePolicyUpdateBrain_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 attributes];
  v6 = [v5 safeStringForKey:@"_MasteredVersion"];
  id v7 = [v4 attributes];

  v8 = [v7 safeStringForKey:@"_MasteredVersion"];
  uint64_t v9 = [v6 compare:v8 options:64];

  return v9;
}

- (SUCorePolicyUpdateBrain)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyUpdateBrain;
  id v5 = [(SUCorePolicy *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_CompatibilityVersion"];
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = (NSNumber *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUCorePolicyUpdateBrain;
  id v4 = a3;
  [(SUCorePolicy *)&v6 encodeWithCoder:v4];
  id v5 = [(SUCorePolicyUpdateBrain *)self compatibilityVersion];
  [v4 encodeObject:v5 forKey:@"_CompatibilityVersion"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyUpdateBrain *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v11.receiver = self;
      v11.super_class = (Class)SUCorePolicyUpdateBrain;
      if ([(SUCorePolicy *)&v11 isEqual:v5])
      {
        objc_super v6 = (void *)MEMORY[0x263F77D78];
        id v7 = [(SUCorePolicyUpdateBrain *)self compatibilityVersion];
        v8 = [(SUCorePolicyUpdateBrain *)v5 compatibilityVersion];
        char v9 = [v6 numberIsEqual:v7 to:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyUpdateBrain;
  id v5 = -[SUCorePolicy copyWithZone:](&v9, sel_copyWithZone_);
  objc_super v6 = [(SUCorePolicyUpdateBrain *)self compatibilityVersion];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setCompatibilityVersion:v7];

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SUCorePolicyUpdateBrain *)self compatibilityVersion];
  v8.receiver = self;
  v8.super_class = (Class)SUCorePolicyUpdateBrain;
  id v5 = [(SUCorePolicy *)&v8 description];
  objc_super v6 = [v3 stringWithFormat:@"SUCorePolicyUpdateBrain(compatibilityVersion:%@|super:%@)", v4, v5];

  return v6;
}

- (id)summary
{
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyUpdateBrain;
  v3 = [(SUCorePolicy *)&v9 summary];
  id v4 = [(SUCorePolicyUpdateBrain *)self compatibilityVersion];

  if (v4)
  {
    id v5 = [(SUCorePolicyUpdateBrain *)self compatibilityVersion];
    uint64_t v6 = [v3 stringByAppendingFormat:@"|compatibilityVersion=%@", v5];

    v3 = (void *)v6;
  }
  if (([v3 isEqualToString:&stru_26C1810A0] & 1) == 0)
  {
    uint64_t v7 = [v3 stringByAppendingString:@"|"];

    v3 = (void *)v7;
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

- (void).cxx_destruct
{
}

@end