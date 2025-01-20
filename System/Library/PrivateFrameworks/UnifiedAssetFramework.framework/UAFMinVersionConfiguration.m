@interface UAFMinVersionConfiguration
+ (BOOL)isValid:(id)a3 error:(id *)a4;
+ (id)fromContentsOfURL:(id)a3 error:(id *)a4;
+ (id)supportedFileVersions;
- (NSDictionary)minVersions;
- (NSString)assetSetName;
- (UAFMinVersionConfiguration)initWithDictionary:(id)a3;
- (void)setAssetSetName:(id)a3;
- (void)setMinVersions:(id)a3;
@end

@implementation UAFMinVersionConfiguration

+ (id)supportedFileVersions
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"1.0.0";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)isValid:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = +[UAFMinVersionConfiguration supportedFileVersions];
  BOOL v7 = +[UAFConfiguration isValid:v5 fileType:@"MinVersion" fileVersions:v6 error:a4];

  if (v7
    && +[UAFConfiguration isValidValue:v5 key:@"AssetSetName" kind:objc_opt_class() required:1 error:a4])
  {
    BOOL v8 = 0;
    if (+[UAFConfiguration isValidValue:v5 key:@"Assets" kind:objc_opt_class() required:0 error:a4])
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id obj = [v5 objectForKeyedSubscript:@"Assets"];
      uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v55 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v40;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v40 != v11) {
              objc_enumerationMutation(obj);
            }
            v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a4)
              {
                v17 = (void *)MEMORY[0x263F087E8];
                if (*a4)
                {
                  v53[0] = *MEMORY[0x263F08320];
                  v18 = [NSString stringWithFormat:@"Asset is not expected kind \"%@\"", objc_opt_class()];
                  v53[1] = *MEMORY[0x263F08608];
                  v54[0] = v18;
                  v54[1] = *a4;
                  v19 = NSDictionary;
                  v20 = (void **)v54;
                  v21 = v53;
                  uint64_t v22 = 2;
                }
                else
                {
                  uint64_t v51 = *MEMORY[0x263F08320];
                  v18 = [NSString stringWithFormat:@"Asset is not expected kind \"%@\"", objc_opt_class()];
                  v52 = v18;
                  v19 = NSDictionary;
                  v20 = &v52;
                  v21 = &v51;
                  uint64_t v22 = 1;
                }
                v31 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:v22];
                *a4 = [v17 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v31];
              }
              v32 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v33 = objc_opt_class();
                *(_DWORD *)buf = 136315394;
                v48 = "+[UAFMinVersionConfiguration isValid:error:]";
                __int16 v49 = 2112;
                id v50 = v33;
                id v34 = v33;
                v35 = "%s Asset is not expected kind \"%@\"";
                goto LABEL_33;
              }
LABEL_34:

LABEL_35:
              BOOL v8 = 0;
              goto LABEL_36;
            }
            if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v13, @"AssetName", objc_opt_class(), 1, a4)|| !+[UAFConfiguration isValidValue:v13 key:@"MinVersion" kind:objc_opt_class() required:1 error:a4])
            {
              goto LABEL_35;
            }
            v14 = [v13 objectForKeyedSubscript:@"MinVersion"];
            v15 = +[UAFPlatform versionComponentsFromString:v14];

            if (!v15)
            {
              if (a4)
              {
                v23 = (void *)MEMORY[0x263F087E8];
                if (*a4)
                {
                  v45[0] = *MEMORY[0x263F08320];
                  v24 = NSString;
                  v25 = [v13 objectForKeyedSubscript:@"MinVersion"];
                  v26 = [v24 stringWithFormat:@"MinVersion \"%@\" is not a valid version", v25];
                  v45[1] = *MEMORY[0x263F08608];
                  v46[0] = v26;
                  v46[1] = *a4;
                  v27 = NSDictionary;
                  v28 = (void **)v46;
                  v29 = v45;
                  uint64_t v30 = 2;
                }
                else
                {
                  uint64_t v43 = *MEMORY[0x263F08320];
                  v36 = NSString;
                  v25 = [v13 objectForKeyedSubscript:@"MinVersion"];
                  v26 = [v36 stringWithFormat:@"MinVersion \"%@\" is not a valid version", v25];
                  v44 = v26;
                  v27 = NSDictionary;
                  v28 = &v44;
                  v29 = &v43;
                  uint64_t v30 = 1;
                }
                v37 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:v30];
                *a4 = [v23 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v37];
              }
              v32 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                id v34 = [v13 objectForKeyedSubscript:@"MinVersion"];
                *(_DWORD *)buf = 136315394;
                v48 = "+[UAFMinVersionConfiguration isValid:error:]";
                __int16 v49 = 2112;
                id v50 = v34;
                v35 = "%s MinVersion \"%@\" is not a valid version";
LABEL_33:
                _os_log_impl(&dword_23797A000, v32, OS_LOG_TYPE_DEFAULT, v35, buf, 0x16u);
              }
              goto LABEL_34;
            }
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v55 count:16];
          BOOL v8 = 1;
          if (v10) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v8 = 1;
      }
LABEL_36:
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)fromContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v16 = 0;
  v6 = [NSDictionary dictionaryWithContentsOfURL:v5 error:&v16];
  id v7 = v16;
  BOOL v8 = v7;
  if (a4) {
    *a4 = v7;
  }
  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    if (+[UAFMinVersionConfiguration isValid:v6 error:a4])
    {
      v14 = [[UAFMinVersionConfiguration alloc] initWithDictionary:v6];
      goto LABEL_15;
    }
    uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[UAFMinVersionConfiguration fromContentsOfURL:error:]";
      __int16 v19 = 2112;
      id v20 = v5;
      uint64_t v11 = "%s Failed to validate UAFMinVersionConfiguration dictionary from \"%@\"";
      v12 = v10;
      uint32_t v13 = 22;
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "+[UAFMinVersionConfiguration fromContentsOfURL:error:]";
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      uint64_t v22 = v8;
      uint64_t v11 = "%s Failed to load UAFMinVersionConfiguration dictionary from \"%@\": %@";
      v12 = v10;
      uint32_t v13 = 32;
LABEL_19:
      _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    }
  }

  v14 = 0;
LABEL_15:

  return v14;
}

- (UAFMinVersionConfiguration)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UAFMinVersionConfiguration;
  id v5 = [(UAFMinVersionConfiguration *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"AssetSetName"];
    assetSetName = v5->_assetSetName;
    v5->_assetSetName = (NSString *)v6;

    BOOL v8 = (NSDictionary *)objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v4;
    BOOL v9 = [v4 objectForKeyedSubscript:@"Assets"];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v15 = [v14 objectForKeyedSubscript:@"MinVersion"];
          id v16 = [v14 objectForKeyedSubscript:@"AssetName"];
          [(NSDictionary *)v8 setObject:v15 forKeyedSubscript:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v11);
    }

    minVersions = v5->_minVersions;
    v5->_minVersions = v8;

    v18 = v5;
    id v4 = v20;
  }

  return v5;
}

- (NSString)assetSetName
{
  return self->_assetSetName;
}

- (void)setAssetSetName:(id)a3
{
}

- (NSDictionary)minVersions
{
  return self->_minVersions;
}

- (void)setMinVersions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minVersions, 0);

  objc_storeStrong((id *)&self->_assetSetName, 0);
}

@end