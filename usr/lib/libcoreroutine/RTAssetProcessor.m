@interface RTAssetProcessor
- (BOOL)_deviceSeed:(id)a3 belongsToGroupId:(id)a4 seedId:(id)a5 modValue:(id)a6 low:(id)a7 high:(id)a8;
- (BOOL)processAssetsAtPath:(id)a3 intoPath:(id)a4 outError:(id *)a5;
- (RTAssetProcessor)init;
- (RTAssetProcessor)initWithDefaultsManager:(id)a3;
- (RTDefaultsManager)defaultsManager;
- (id)_objectForKey:(id)a3 expectedClass:(Class)a4 inDictionary:(id)a5;
- (void)setDefaultsManager:(id)a3;
@end

@implementation RTAssetProcessor

- (RTAssetProcessor)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_);
}

- (RTAssetProcessor)initWithDefaultsManager:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTAssetProcessor;
    v6 = [(RTAssetProcessor *)&v11 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_defaultsManager, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTAssetProcessor initWithDefaultsManager:]";
      __int16 v14 = 1024;
      int v15 = 39;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)processAssetsAtPath:(id)a3 intoPath:(id)a4 outError:(id *)a5
{
  v86[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      if ([v10 fileExistsAtPath:v7])
      {
        objc_super v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v12 = [v11 isReadableFileAtPath:v7];

        if (v12)
        {
          v13 = [(RTAssetProcessor *)self defaultsManager];
          __int16 v14 = [v13 objectForKey:@"RTDefaultsABTestDeviceSeed"];

          v53 = v9;
          if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            int v15 = self;
          }
          else
          {
            v27 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "Generating new device seed.", buf, 2u);
            }

            v28 = [MEMORY[0x1E4F29128] UUID];
            uint64_t v29 = [v28 UUIDString];

            int v15 = self;
            v30 = [(RTAssetProcessor *)self defaultsManager];
            [v30 setObject:v29 forKey:@"RTDefaultsABTestDeviceSeed"];

            __int16 v14 = (void *)v29;
          }
          id v55 = v7;
          v31 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v7, v53];
          v32 = [(RTAssetProcessor *)v15 _objectForKey:@"ABTestOverrides" expectedClass:objc_opt_class() inDictionary:v31];
          v33 = objc_opt_new();
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          obuint64_t j = v32;
          uint64_t v61 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
          if (v61)
          {
            uint64_t v60 = *(void *)v72;
            v56 = v33;
            v57 = v14;
            do
            {
              for (uint64_t i = 0; i != v61; ++i)
              {
                if (*(void *)v72 != v60) {
                  objc_enumerationMutation(obj);
                }
                v35 = *(const char **)(*((void *)&v71 + 1) + 8 * i);
                uint64_t v36 = [(RTAssetProcessor *)v15 _objectForKey:@"SeedId" expectedClass:objc_opt_class() inDictionary:v35];
                v66 = [(RTAssetProcessor *)v15 _objectForKey:@"GroupId" expectedClass:objc_opt_class() inDictionary:v35];
                v65 = [(RTAssetProcessor *)v15 _objectForKey:@"ModValue" expectedClass:objc_opt_class() inDictionary:v35];
                v64 = [(RTAssetProcessor *)v15 _objectForKey:@"Low" expectedClass:objc_opt_class() inDictionary:v35];
                v63 = [(RTAssetProcessor *)v15 _objectForKey:@"High" expectedClass:objc_opt_class() inDictionary:v35];
                v37 = [(RTAssetProcessor *)v15 _objectForKey:@"ExpirationDate" expectedClass:objc_opt_class() inDictionary:v35];
                uint64_t v38 = [(RTAssetProcessor *)v15 _objectForKey:@"Overrides" expectedClass:objc_opt_class() inDictionary:v35];
                v39 = (void *)v38;
                v62 = (void *)v36;
                if (!v36 || !v66 || !v65 || !v64 || !v63 || !v37 || !v38)
                {
                  v52 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v79 = v35;
                    _os_log_error_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_ERROR, "Invalid group definition, skipping group, %@", buf, 0xCu);
                  }
                  v43 = v62;
                  goto LABEL_54;
                }
                v40 = [MEMORY[0x1E4F1C9C8] date];
                uint64_t v41 = [v37 compare:v40];

                BOOL v42 = v41 == -1;
                v43 = v62;
                if (!v42
                  && [(RTAssetProcessor *)v15 _deviceSeed:v14 belongsToGroupId:v66 seedId:v62 modValue:v65 low:v64 high:v63])
                {
                  v44 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v79 = (const char *)v62;
                    __int16 v80 = 2112;
                    v81 = v66;
                    _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_INFO, "Device belongs to seedId, %@, groupId, %@", buf, 0x16u);
                  }

                  long long v69 = 0u;
                  long long v70 = 0u;
                  long long v67 = 0u;
                  long long v68 = 0u;
                  id v45 = v39;
                  uint64_t v46 = [v45 countByEnumeratingWithState:&v67 objects:v77 count:16];
                  if (v46)
                  {
                    uint64_t v47 = v46;
                    uint64_t v48 = *(void *)v68;
                    do
                    {
                      for (uint64_t j = 0; j != v47; ++j)
                      {
                        if (*(void *)v68 != v48) {
                          objc_enumerationMutation(v45);
                        }
                        uint64_t v50 = *(void *)(*((void *)&v67 + 1) + 8 * j);
                        v51 = [v45 objectForKeyedSubscript:v50];
                        [v31 setObject:v51 forKeyedSubscript:v50];
                      }
                      uint64_t v47 = [v45 countByEnumeratingWithState:&v67 objects:v77 count:16];
                    }
                    while (v47);
                  }

                  v75[0] = @"RTDefaultsABTestSeedId";
                  v75[1] = @"RTDefaultsABTestGroupId";
                  v43 = v62;
                  v76[0] = v62;
                  v76[1] = v66;
                  v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];
                  v33 = v56;
                  [v56 addObject:v52];
                  __int16 v14 = v57;
                  int v15 = self;
LABEL_54:
                }
              }
              uint64_t v61 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
            }
            while (v61);
          }

          [v31 setObject:0 forKeyedSubscript:@"ABTestOverrides"];
          if ([v33 count]) {
            [v31 setObject:v33 forKeyedSubscript:@"RTDefaultsABTestActiveGroups"];
          }
          v9 = v54;
          char v25 = [v31 writeToFile:v54 atomically:1];

          id v7 = v55;
          goto LABEL_21;
        }
      }
      else
      {
      }
      if (a5)
      {
        v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v24 = *MEMORY[0x1E4F5CFE8];
        uint64_t v83 = *MEMORY[0x1E4F28568];
        v84 = @"unable to read input asset file.";
        __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        v20 = v23;
        uint64_t v21 = v24;
        uint64_t v22 = 0;
        goto LABEL_20;
      }
LABEL_22:
      char v25 = 0;
      goto LABEL_23;
    }
    goto LABEL_13;
  }
  uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v79 = "-[RTAssetProcessor processAssetsAtPath:intoPath:outError:]";
    __int16 v80 = 1024;
    LODWORD(v81) = 55;
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: assetPath (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_13:
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v79 = "-[RTAssetProcessor processAssetsAtPath:intoPath:outError:]";
      __int16 v80 = 1024;
      LODWORD(v81) = 56;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsPath (in %s:%d)", buf, 0x12u);
    }

    if (!a5) {
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  if (!a5) {
    goto LABEL_22;
  }
LABEL_16:
  v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v19 = *MEMORY[0x1E4F5CFE8];
  uint64_t v85 = *MEMORY[0x1E4F28568];
  v86[0] = @"requires assetPath and defaultsPath.";
  __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:&v85 count:1];
  v20 = v18;
  uint64_t v21 = v19;
  uint64_t v22 = 7;
LABEL_20:
  [v20 errorWithDomain:v21 code:v22 userInfo:v14];
  char v25 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_23:
  return v25;
}

- (id)_objectForKey:(id)a3 expectedClass:(Class)a4 inDictionary:(id)a5
{
  id v5 = [a5 objectForKeyedSubscript:a3];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_deviceSeed:(id)a3 belongsToGroupId:(id)a4 seedId:(id)a5 modValue:(id)a6 low:(id)a7 high:(id)a8
{
  id v12 = a8;
  v13 = NSString;
  id v14 = a7;
  id v15 = a6;
  uint64_t v16 = [v13 stringWithFormat:@"%@%@", a3, a5];
  unint64_t v17 = [v16 hash];

  unint64_t v18 = [v15 unsignedIntegerValue];
  unint64_t v19 = v17 % v18;
  unint64_t v20 = [v14 unsignedIntegerValue];

  BOOL v21 = v20 <= v19 && v19 < [v12 unsignedIntegerValue];
  return v21;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end