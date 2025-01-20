@interface UAFAssetSetConfiguration
+ (BOOL)isValid:(id)a3 error:(id *)a4;
+ (BOOL)isValid:(id)a3 fileURL:(id)a4 error:(id *)a5;
+ (id)fromContentsOfURL:(id)a3 applyFeatureFlags:(BOOL)a4 error:(id *)a5;
+ (id)fromContentsOfURL:(id)a3 error:(id *)a4;
+ (id)supportedFileVersions;
- (BOOL)disableAssetRemoval;
- (BOOL)enableExpensiveCellular;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTrialAvailable;
- (BOOL)isUsageLimitExceeded:(id)a3;
- (BOOL)subjectToAppleIntelligenceWaitlist;
- (NSArray)assets;
- (NSArray)usageLimits;
- (NSArray)usageTypes;
- (NSDictionary)usageValues;
- (NSString)autoAssetType;
- (NSString)metadataAsset;
- (NSString)name;
- (NSString)trialProject;
- (NSURL)originatingURL;
- (UAFAssetSetConfiguration)initWithDictionary:(id)a3;
- (UAFExperimentalAssetsConfiguration)experimentalAssets;
- (id)getAssets:(id)a3;
- (id)getAutoAssets:(id)a3;
- (id)getFilteredUsages:(id)a3;
- (id)getTrialAssets:(id)a3;
- (int)_usageCountForUsageType:(id)a3 usingUsages:(id)a4;
- (unint64_t)hash;
- (void)applyFeatureFlags;
- (void)setAssets:(id)a3;
- (void)setAutoAssetType:(id)a3;
- (void)setDisableAssetRemoval:(BOOL)a3;
- (void)setEnableExpensiveCellular:(BOOL)a3;
- (void)setExperimentalAssets:(id)a3;
- (void)setIsTrialAvailable:(BOOL)a3;
- (void)setMetadataAsset:(id)a3;
- (void)setName:(id)a3;
- (void)setOriginatingURL:(id)a3;
- (void)setSubjectToAppleIntelligenceWaitlist:(BOOL)a3;
- (void)setTrialProject:(id)a3;
- (void)setUsageLimits:(id)a3;
- (void)setUsageTypes:(id)a3;
- (void)setUsageValues:(id)a3;
@end

@implementation UAFAssetSetConfiguration

- (BOOL)isTrialAvailable
{
  return self->_isTrialAvailable;
}

- (NSString)name
{
  return self->_name;
}

- (id)getAssets:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v40 = a3;
  v4 = -[UAFAssetSetConfiguration getFilteredUsages:](self, "getFilteredUsages:");
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [(UAFAssetSetConfiguration *)self assets];
  uint64_t v5 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v42 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v44 != v42) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if (!v7) {
          v7 = objc_opt_new();
        }
        v10 = [v9 name];
        v11 = [v7 objectForKeyedSubscript:v10];

        if (!v11)
        {
          v12 = objc_opt_new();
          v13 = [v9 name];
          [v7 setObject:v12 forKeyedSubscript:v13];
        }
        v14 = [v9 getAutoAssetSpecifier:v4];
        if (v14)
        {
          v15 = [(UAFAssetSetConfiguration *)self autoAssetType];

          if (v15)
          {
            v16 = [(UAFAssetSetConfiguration *)self autoAssetType];
            v17 = [v9 name];
            v18 = [v7 objectForKeyedSubscript:v17];
            [v18 setObject:v16 forKeyedSubscript:@"AutoAssetType"];

            v19 = [v9 name];
            v20 = [v7 objectForKeyedSubscript:v19];
            [v20 setObject:v14 forKeyedSubscript:@"AssetSpecifier"];
          }
        }
        v21 = [(UAFAssetSetConfiguration *)self trialProject];

        if (v21)
        {
          v22 = [(UAFAssetSetConfiguration *)self trialProject];
          v23 = [v9 name];
          v24 = [v7 objectForKeyedSubscript:v23];
          [v24 setObject:v22 forKeyedSubscript:@"TrialProject"];
        }
        v25 = [v9 trialNamespace];

        if (v25)
        {
          v26 = [v9 trialNamespace];
          v27 = [v9 name];
          v28 = [v7 objectForKeyedSubscript:v27];
          [v28 setObject:v26 forKeyedSubscript:@"TrialNamespace"];
        }
        v29 = [v9 trialMAAssetType];

        if (v29)
        {
          v30 = [v9 trialMAAssetType];
          v31 = [v9 name];
          v32 = [v7 objectForKeyedSubscript:v31];
          [v32 setObject:v30 forKeyedSubscript:@"TrialMAAssetType"];
        }
        v33 = [v9 getTrialFactorName:v4];
        if (v33)
        {
          v34 = [v9 name];
          v35 = [v7 objectForKeyedSubscript:v34];
          [v35 setObject:v33 forKeyedSubscript:@"TrialFactor"];

          v36 = [v9 getTrialFactorFallbackName:v4];
          v37 = [v9 name];
          v38 = [v7 objectForKeyedSubscript:v37];
          [v38 setObject:v36 forKeyedSubscript:@"TrialFactorFallback"];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)trialProject
{
  return self->_trialProject;
}

- (NSString)autoAssetType
{
  return self->_autoAssetType;
}

- (id)getFilteredUsages:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && self->_usageValues)
  {
    id v17 = v4;
    id v6 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v7 = self->_usageValues;
    uint64_t v8 = [(NSDictionary *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v13 = [v6 objectForKeyedSubscript:v12];
          if (v13)
          {
            v14 = [(NSDictionary *)self->_usageValues objectForKeyedSubscript:v12];
            char v15 = [v14 containsObject:v13];

            if ((v15 & 1) == 0) {
              [v6 setObject:0 forKeyedSubscript:v12];
            }
          }
        }
        uint64_t v9 = [(NSDictionary *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    uint64_t v5 = v17;
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (NSArray)assets
{
  return self->_assets;
}

- (id)getAutoAssets:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(UAFAssetSetConfiguration *)self getAssets:v4];
  id v6 = v5;
  if (v5)
  {
    id v26 = v4;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v27 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v27) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v12 = [v6 objectForKeyedSubscript:v11];
          v13 = [v12 objectForKeyedSubscript:@"AutoAssetType"];

          if (v13)
          {
            if (!v9) {
              uint64_t v9 = objc_opt_new();
            }
            v14 = [v9 objectForKeyedSubscript:v11];

            if (!v14)
            {
              char v15 = objc_opt_new();
              [v9 setObject:v15 forKeyedSubscript:v11];
            }
            v16 = [v6 objectForKeyedSubscript:v11];
            id v17 = [v16 objectForKeyedSubscript:@"AutoAssetType"];
            long long v18 = [v9 objectForKeyedSubscript:v11];
            [v18 setObject:v17 forKeyedSubscript:@"AutoAssetType"];

            long long v19 = [v6 objectForKeyedSubscript:v11];
            long long v20 = [v19 objectForKeyedSubscript:@"AssetSpecifier"];

            if (v20)
            {
              long long v21 = [v6 objectForKeyedSubscript:v11];
              v22 = [v21 objectForKeyedSubscript:@"AssetSpecifier"];
              uint64_t v23 = [v9 objectForKeyedSubscript:v11];
              [v23 setObject:v22 forKeyedSubscript:@"AssetSpecifier"];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v24 = v9;
    id v4 = v26;
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (UAFAssetSetConfiguration)initWithDictionary:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)UAFAssetSetConfiguration;
  uint64_t v5 = [(UAFAssetSetConfiguration *)&v41 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"AssetSetName"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"UsageTypes"];
    usageTypes = v5->_usageTypes;
    v5->_usageTypes = (NSArray *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"UsageValues"];
    usageValues = v5->_usageValues;
    v5->_usageValues = (NSDictionary *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"TrialProject"];
    trialProject = v5->_trialProject;
    v5->_trialProject = (NSString *)v12;

    v5->_isTrialAvailable = v5->_trialProject != 0;
    uint64_t v14 = [v4 objectForKeyedSubscript:@"AutoAssetType"];
    autoAssetType = v5->_autoAssetType;
    v5->_autoAssetType = (NSString *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"MetadataAsset"];
    metadataAsset = v5->_metadataAsset;
    v5->_metadataAsset = (NSString *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"UsageLimits"];
    usageLimits = v5->_usageLimits;
    v5->_usageLimits = (NSArray *)v18;

    v36 = [v4 objectForKeyedSubscript:@"EnableCellular"];
    v5->_enableExpensiveCellular = [v36 BOOLValue];
    v35 = [v4 objectForKeyedSubscript:@"SubjectToAppleIntelligenceWaitlist"];
    v5->_subjectToAppleIntelligenceWaitlist = [v35 BOOLValue];
    long long v20 = [v4 objectForKeyedSubscript:@"DisableAssetRemoval"];
    v5->_disableAssetRemoval = [v20 BOOLValue];
    long long v21 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v22 = [v4 objectForKeyedSubscript:@"Assets"];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v38;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v38 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = [[UAFAssetConfiguration alloc] initWithDictionary:*(void *)(*((void *)&v37 + 1) + 8 * v26)];
          [v21 addObject:v27];

          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v24);
    }

    objc_storeStrong((id *)&v5->_assets, v21);
    long long v28 = [v4 objectForKeyedSubscript:@"ExperimentalAssets"];

    if (v28)
    {
      long long v29 = [UAFExperimentalAssetsConfiguration alloc];
      long long v30 = [v4 objectForKeyedSubscript:@"ExperimentalAssets"];
      uint64_t v31 = [(UAFExperimentalAssetsConfiguration *)v29 initWithDictionary:v30];
      experimentalAssets = v5->_experimentalAssets;
      v5->_experimentalAssets = (UAFExperimentalAssetsConfiguration *)v31;
    }
    uint64_t v33 = v5;
  }
  return v5;
}

+ (BOOL)isValid:(id)a3 fileURL:(id)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[UAFAssetSetConfiguration supportedFileVersions];
  BOOL v10 = +[UAFConfiguration isValid:v7 fileType:@"AssetSetConfiguration" fileVersions:v9 error:a5];

  if (!v10
    || !+[UAFConfiguration isValidValue:v7 key:@"AssetSetName" kind:objc_opt_class() required:1 error:a5])
  {
LABEL_15:
    BOOL v14 = 0;
    goto LABEL_16;
  }
  if (v8)
  {
    uint64_t v11 = +[UAFConfigurationManager getAssetNameFromPath:v8];
    uint64_t v12 = [v7 objectForKeyedSubscript:@"AssetSetName"];
    char v13 = [(__CFString *)v11 isEqualToString:v12];

    if ((v13 & 1) == 0)
    {
      uint64_t v16 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [v7 objectForKeyedSubscript:@"AssetSetName"];
        *(_DWORD *)buf = 136315650;
        v51 = "+[UAFAssetSetConfiguration isValid:fileURL:error:]";
        __int16 v52 = 2112;
        v53 = v17;
        __int16 v54 = 2112;
        v55 = v11;
        _os_log_impl(&dword_23797A000, v16, OS_LOG_TYPE_DEFAULT, "%s AssetSetName (\"%@\") must match filename (\"%@\")", buf, 0x20u);
      }
      goto LABEL_15;
    }
  }
  BOOL v14 = 0;
  if (!+[UAFConfiguration isValidValue:v7 key:@"UsageTypes" kind:objc_opt_class() required:0 error:a5])goto LABEL_16; {
  BOOL v14 = 0;
  }
  if (!+[UAFConfiguration isValidValue:v7 key:@"EnableCellular" kind:objc_opt_class() required:0 error:a5])goto LABEL_16; {
  BOOL v14 = 0;
  }
  if (!+[UAFConfiguration isValidValue:v7 key:@"SubjectToAppleIntelligenceWaitlist" kind:objc_opt_class() required:0 error:a5])goto LABEL_16; {
  BOOL v14 = 0;
  }
  if (!+[UAFConfiguration isValidValue:v7 key:@"UsageValues" kind:objc_opt_class() required:0 error:a5])goto LABEL_16; {
  char v15 = [v7 objectForKeyedSubscript:@"TrialProject"];
  }
  if (v15)
  {

    goto LABEL_18;
  }
  long long v19 = [v7 objectForKeyedSubscript:@"AutoAssetType"];

  if (!v19)
  {
    if (a5)
    {
      uint64_t v27 = (void *)MEMORY[0x263F087E8];
      if (*a5)
      {
        v48[0] = *MEMORY[0x263F08320];
        long long v28 = [NSString stringWithFormat:@"One of keys %@ and %@ must have a value", @"TrialProject", @"AutoAssetType"];
        v48[1] = *MEMORY[0x263F08608];
        v49[0] = v28;
        v49[1] = *a5;
        long long v29 = NSDictionary;
        long long v30 = (void **)v49;
        uint64_t v31 = v48;
        uint64_t v32 = 2;
      }
      else
      {
        uint64_t v46 = *MEMORY[0x263F08320];
        long long v28 = [NSString stringWithFormat:@"One of keys %@ and %@ must have a value", @"TrialProject", @"AutoAssetType"];
        v47 = v28;
        long long v29 = NSDictionary;
        long long v30 = &v47;
        uint64_t v31 = &v46;
        uint64_t v32 = 1;
      }
      uint64_t v33 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:v32];
      *a5 = [v27 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v33];
    }
    v34 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v51 = "+[UAFAssetSetConfiguration isValid:fileURL:error:]";
      __int16 v52 = 2112;
      v53 = @"TrialProject";
      __int16 v54 = 2112;
      v55 = @"AutoAssetType";
      _os_log_impl(&dword_23797A000, v34, OS_LOG_TYPE_DEFAULT, "%s One of keys %@ and %@ must have a value", buf, 0x20u);
    }

    goto LABEL_15;
  }
LABEL_18:
  BOOL v14 = 0;
  if (+[UAFConfiguration isValidValue:v7 key:@"TrialProject" kind:objc_opt_class() required:0 error:a5])
  {
    BOOL v14 = 0;
    if (+[UAFConfiguration isValidValue:v7 key:@"AutoAssetType" kind:objc_opt_class() required:0 error:a5])
    {
      BOOL v14 = 0;
      if (+[UAFConfiguration isValidValue:v7 key:@"MetadataAsset" kind:objc_opt_class() required:0 error:a5])
      {
        BOOL v14 = 0;
        if (+[UAFConfiguration isValidValue:v7 key:@"Assets" kind:objc_opt_class() required:0 error:a5])
        {
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id obj = [v7 objectForKeyedSubscript:@"Assets"];
          uint64_t v40 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (v40)
          {
            uint64_t v39 = *(void *)v42;
            while (2)
            {
              for (uint64_t i = 0; i != v40; ++i)
              {
                if (*(void *)v42 != v39) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v35 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    v36 = (__CFString *)objc_opt_class();
                    *(_DWORD *)buf = 136315394;
                    v51 = "+[UAFAssetSetConfiguration isValid:fileURL:error:]";
                    __int16 v52 = 2112;
                    v53 = v36;
                    long long v37 = v36;
                    _os_log_impl(&dword_23797A000, v35, OS_LOG_TYPE_DEFAULT, "%s Asset is not expected kind \"%@\"", buf, 0x16u);
                  }
LABEL_48:

                  goto LABEL_15;
                }
                v22 = [v7 objectForKeyedSubscript:@"UsageTypes"];
                BOOL v23 = +[UAFAssetConfiguration isValid:v21 validUsageTypes:v22 error:a5];

                if (!v23) {
                  goto LABEL_48;
                }
              }
              uint64_t v40 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
              if (v40) {
                continue;
              }
              break;
            }
          }

          BOOL v14 = 0;
          if (+[UAFConfiguration isValidValue:v7 key:@"DisableAssetRemoval" kind:objc_opt_class() required:0 error:a5])
          {
            BOOL v14 = 0;
            if (+[UAFConfiguration isValidValue:v7 key:@"AutoAssetType" kind:objc_opt_class() required:0 error:a5])
            {
              BOOL v14 = 0;
              if (+[UAFConfiguration isValidValue:v7 key:@"ExperimentalAssets" kind:objc_opt_class() required:0 error:a5])
              {
                uint64_t v24 = [v7 objectForKeyedSubscript:@"ExperimentalAssets"];

                if (!v24
                  || ([v7 objectForKeyedSubscript:@"ExperimentalAssets"],
                      uint64_t v25 = objc_claimAutoreleasedReturnValue(),
                      BOOL v26 = +[UAFExperimentalAssetsConfiguration isValid:v25 error:a5], v25, v26))
                {
                  BOOL v14 = 1;
                  goto LABEL_16;
                }
                goto LABEL_15;
              }
            }
          }
        }
      }
    }
  }
LABEL_16:

  return v14;
}

+ (id)supportedFileVersions
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"1.0.0";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (UAFExperimentalAssetsConfiguration)experimentalAssets
{
  return self->_experimentalAssets;
}

- (NSDictionary)usageValues
{
  return self->_usageValues;
}

- (NSString)metadataAsset
{
  return self->_metadataAsset;
}

- (id)getTrialAssets:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(UAFAssetSetConfiguration *)self getAssets:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v33 = v4;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v35 = [v5 countByEnumeratingWithState:&v36 objects:v40 count:16];
    id v7 = 0;
    if (v35)
    {
      uint64_t v34 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v37 != v34) {
            objc_enumerationMutation(v6);
          }
          uint64_t v9 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          BOOL v10 = [v6 objectForKeyedSubscript:v9];
          uint64_t v11 = [v10 objectForKeyedSubscript:@"TrialProject"];

          if (v11)
          {
            if (!v7) {
              id v7 = objc_opt_new();
            }
            uint64_t v12 = [v7 objectForKeyedSubscript:v9];

            if (!v12)
            {
              char v13 = objc_opt_new();
              [v7 setObject:v13 forKeyedSubscript:v9];
            }
            BOOL v14 = [v6 objectForKeyedSubscript:v9];
            char v15 = [v14 objectForKeyedSubscript:@"TrialProject"];
            uint64_t v16 = [v7 objectForKeyedSubscript:v9];
            [v16 setObject:v15 forKeyedSubscript:@"TrialProject"];

            id v17 = [v6 objectForKeyedSubscript:v9];
            uint64_t v18 = [v17 objectForKeyedSubscript:@"TrialNamespace"];
            long long v19 = [v7 objectForKeyedSubscript:v9];
            [v19 setObject:v18 forKeyedSubscript:@"TrialNamespace"];

            long long v20 = [v6 objectForKeyedSubscript:v9];
            uint64_t v21 = [v20 objectForKeyedSubscript:@"TrialMAAssetType"];
            v22 = [v7 objectForKeyedSubscript:v9];
            [v22 setObject:v21 forKeyedSubscript:@"TrialMAAssetType"];

            BOOL v23 = [v6 objectForKeyedSubscript:v9];
            uint64_t v24 = [v23 objectForKeyedSubscript:@"TrialFactor"];

            if (v24)
            {
              uint64_t v25 = [v6 objectForKeyedSubscript:v9];
              BOOL v26 = [v25 objectForKeyedSubscript:@"TrialFactor"];
              uint64_t v27 = [v7 objectForKeyedSubscript:v9];
              [v27 setObject:v26 forKeyedSubscript:@"TrialFactor"];

              long long v28 = [v6 objectForKeyedSubscript:v9];
              long long v29 = [v28 objectForKeyedSubscript:@"TrialFactorFallback"];
              long long v30 = [v7 objectForKeyedSubscript:v9];
              [v30 setObject:v29 forKeyedSubscript:@"TrialFactorFallback"];
            }
          }
        }
        uint64_t v35 = [v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v35);
    }
    id v31 = v7;
    id v4 = v33;
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

+ (id)fromContentsOfURL:(id)a3 applyFeatureFlags:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (a5) {
    *a5 = 0;
  }
  id v19 = 0;
  id v8 = [NSDictionary dictionaryWithContentsOfURL:v7 error:&v19];
  id v9 = v19;
  BOOL v10 = v9;
  if (a5) {
    *a5 = v9;
  }
  if (v8) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    uint64_t v12 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v21 = "+[UAFAssetSetConfiguration fromContentsOfURL:applyFeatureFlags:error:]";
      __int16 v22 = 2112;
      id v23 = v7;
      __int16 v24 = 2112;
      uint64_t v25 = v10;
      char v13 = "%s Failed to load UAFAssetSetConfiguration dictionary from \"%@\": %@";
      BOOL v14 = v12;
      uint32_t v15 = 32;
LABEL_21:
      _os_log_error_impl(&dword_23797A000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!+[UAFAssetSetConfiguration isValid:v8 fileURL:v7 error:a5])
  {
    uint64_t v12 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "+[UAFAssetSetConfiguration fromContentsOfURL:applyFeatureFlags:error:]";
      __int16 v22 = 2112;
      id v23 = v7;
      char v13 = "%s Failed to validate UAFAssetSetConfiguration dictionary from \"%@\"";
      BOOL v14 = v12;
      uint32_t v15 = 22;
      goto LABEL_21;
    }
LABEL_16:
    id v17 = 0;
    goto LABEL_17;
  }
  uint64_t v16 = [[UAFAssetSetConfiguration alloc] initWithDictionary:v8];
  id v17 = v16;
  if (v6) {
    [(UAFAssetSetConfiguration *)v16 applyFeatureFlags];
  }
  uint64_t v12 = [v7 URLByResolvingSymlinksInPath];
  [(UAFAssetSetConfiguration *)v17 setOriginatingURL:v12];
LABEL_17:

  return v17;
}

- (void)setOriginatingURL:(id)a3
{
}

- (void)applyFeatureFlags
{
  if (self->_isTrialAvailable)
  {
    if (!+[UAFConfiguration trialFeatureEnabled:self->_name]) {
      self->_isTrialAvailable = 0;
    }
    if (!+[UAFConfiguration autoAssetFeatureEnabled:self->_name])
    {
      autoAssetType = self->_autoAssetType;
      self->_autoAssetType = 0;
    }
  }
}

+ (BOOL)isValid:(id)a3 error:(id *)a4
{
  return +[UAFAssetSetConfiguration isValid:a3 fileURL:0 error:a4];
}

+ (id)fromContentsOfURL:(id)a3 error:(id *)a4
{
  return +[UAFAssetSetConfiguration fromContentsOfURL:a3 applyFeatureFlags:0 error:a4];
}

- (int)_usageCountForUsageType:(id)a3 usingUsages:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        char v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        BOOL v14 = objc_msgSend(v13, "objectForKeyedSubscript:", v5, (void)v18);

        if (v14)
        {
          uint32_t v15 = [v13 objectForKeyedSubscript:v5];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  int v16 = [v7 count];
  return v16;
}

- (BOOL)isUsageLimitExceeded:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = self->_usageLimits;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [v9 objectForKeyedSubscript:@"UsageType"];
        uint64_t v11 = [v9 objectForKeyedSubscript:@"MaxUsageValues"];
        int v12 = [v11 intValue];

        if ([(UAFAssetSetConfiguration *)self _usageCountForUsageType:v10 usingUsages:v4] > v12)
        {
          BOOL v14 = UAFGetLogCategory((void **)&UAFLogContextClient);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            name = self->_name;
            *(_DWORD *)buf = 136315906;
            uint64_t v23 = "-[UAFAssetSetConfiguration isUsageLimitExceeded:]";
            __int16 v24 = 2112;
            uint64_t v25 = name;
            __int16 v26 = 2112;
            uint64_t v27 = v10;
            __int16 v28 = 1024;
            int v29 = v12;
            _os_log_impl(&dword_23797A000, v14, OS_LOG_TYPE_DEFAULT, "%s Usage limit exceeded for asset set %@ of usage type %@ with limit of %d", buf, 0x26u);
          }

          BOOL v13 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v30 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UAFAssetSetConfiguration *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v4 == self)
    {
      char v8 = 1;
    }
    else
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(UAFAssetSetConfiguration *)self name];
      uint64_t v7 = [(UAFAssetSetConfiguration *)v5 name];

      char v8 = [v6 isEqual:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(UAFAssetSetConfiguration *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)setName:(id)a3
{
}

- (NSArray)usageTypes
{
  return self->_usageTypes;
}

- (void)setUsageTypes:(id)a3
{
}

- (void)setUsageValues:(id)a3
{
}

- (void)setTrialProject:(id)a3
{
}

- (void)setAutoAssetType:(id)a3
{
}

- (void)setMetadataAsset:(id)a3
{
}

- (NSArray)usageLimits
{
  return self->_usageLimits;
}

- (void)setUsageLimits:(id)a3
{
}

- (BOOL)disableAssetRemoval
{
  return self->_disableAssetRemoval;
}

- (void)setDisableAssetRemoval:(BOOL)a3
{
  self->_disableAssetRemoval = a3;
}

- (void)setAssets:(id)a3
{
}

- (void)setExperimentalAssets:(id)a3
{
}

- (void)setIsTrialAvailable:(BOOL)a3
{
  self->_isTrialAvailable = a3;
}

- (NSURL)originatingURL
{
  return self->_originatingURL;
}

- (BOOL)enableExpensiveCellular
{
  return self->_enableExpensiveCellular;
}

- (void)setEnableExpensiveCellular:(BOOL)a3
{
  self->_enableExpensiveCellular = a3;
}

- (BOOL)subjectToAppleIntelligenceWaitlist
{
  return self->_subjectToAppleIntelligenceWaitlist;
}

- (void)setSubjectToAppleIntelligenceWaitlist:(BOOL)a3
{
  self->_subjectToAppleIntelligenceWaitlist = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingURL, 0);
  objc_storeStrong((id *)&self->_experimentalAssets, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_usageLimits, 0);
  objc_storeStrong((id *)&self->_metadataAsset, 0);
  objc_storeStrong((id *)&self->_autoAssetType, 0);
  objc_storeStrong((id *)&self->_trialProject, 0);
  objc_storeStrong((id *)&self->_usageValues, 0);
  objc_storeStrong((id *)&self->_usageTypes, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end