@interface UAFAssetSetMetadata
+ (BOOL)isValid:(id)a3 error:(id *)a4;
+ (id)OSVersion;
+ (id)fromAssetDir:(id)a3 error:(id *)a4;
+ (id)fromContentsOfURL:(id)a3 error:(id *)a4;
+ (id)supportedFileVersions;
- (BOOL)OSSupported;
- (NSString)maxOSVersion;
- (NSString)minOSVersion;
- (UAFAssetSetMetadata)initWithDictionary:(id)a3;
- (void)setMaxOSVersion:(id)a3;
- (void)setMinOSVersion:(id)a3;
@end

@implementation UAFAssetSetMetadata

- (BOOL)OSSupported
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!self->_minOSVersion && !self->_maxOSVersion) {
    return 1;
  }
  v3 = +[UAFAssetSetMetadata OSVersion];
  v4 = +[UAFPlatform versionComponentsFromString:v3];

  if (!v4)
  {
    v9 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = +[UAFAssetSetMetadata OSVersion];
      int v12 = 136315394;
      v13 = "-[UAFAssetSetMetadata OSSupported]";
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_error_impl(&dword_23797A000, v9, OS_LOG_TYPE_ERROR, "%s Current OS Version \"%@\" is not a valid version", (uint8_t *)&v12, 0x16u);
    }
    return 1;
  }
  if (self->_minOSVersion)
  {
    v5 = +[UAFAssetSetMetadata OSVersion];
    int64_t v6 = +[UAFPlatform compareVersion:v5 with:self->_minOSVersion];

    if (v6 == -1) {
      return 0;
    }
  }
  if (!self->_maxOSVersion) {
    return 1;
  }
  v7 = +[UAFAssetSetMetadata OSVersion];
  BOOL v8 = +[UAFPlatform compareVersion:v7 with:self->_maxOSVersion] != 1;

  return v8;
}

+ (id)OSVersion
{
  if (qword_26AF0B990 != -1) {
    dispatch_once(&qword_26AF0B990, &__block_literal_global_3);
  }
  v2 = (void *)_MergedGlobals_1;

  return v2;
}

+ (BOOL)isValid:(id)a3 error:(id *)a4
{
  v53[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  int64_t v6 = +[UAFAssetSetMetadata supportedFileVersions];
  BOOL v7 = +[UAFConfiguration isValid:v5 fileType:@"AssetSetMetadata" fileVersions:v6 error:a4];

  if (!v7) {
    goto LABEL_25;
  }
  BOOL v8 = 0;
  if (+[UAFConfiguration isValidValue:v5 key:@"MinOSVersion" kind:objc_opt_class() required:0 error:a4])
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:@"MinOSVersion"];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = [v5 objectForKeyedSubscript:@"MinOSVersion"];
      int v12 = +[UAFPlatform versionComponentsFromString:v11];

      if (!v12)
      {
        if (a4)
        {
          v17 = (void *)MEMORY[0x263F087E8];
          if (*a4)
          {
            v52[0] = *MEMORY[0x263F08320];
            v18 = NSString;
            v19 = [v5 objectForKeyedSubscript:@"MinOSVersion"];
            v20 = [v18 stringWithFormat:@"MinOSVersion \"%@\" is not a valid version", v19];
            v52[1] = *MEMORY[0x263F08608];
            id v21 = *a4;
            v53[0] = v20;
            v53[1] = v21;
            v22 = NSDictionary;
            v23 = (void **)v53;
            v24 = v52;
            uint64_t v25 = 2;
          }
          else
          {
            uint64_t v50 = *MEMORY[0x263F08320];
            v34 = NSString;
            v19 = [v5 objectForKeyedSubscript:@"MinOSVersion"];
            v20 = [v34 stringWithFormat:@"MinOSVersion \"%@\" is not a valid version", v19];
            v51 = v20;
            v22 = NSDictionary;
            v23 = &v51;
            v24 = &v50;
            uint64_t v25 = 1;
          }
          v35 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:v25];
          *a4 = [v17 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v35];
        }
        v36 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        v37 = [v5 objectForKeyedSubscript:@"MinOSVersion"];
        *(_DWORD *)buf = 136315394;
        v47 = "+[UAFAssetSetMetadata isValid:error:]";
        __int16 v48 = 2112;
        v49 = v37;
        v38 = "%s MinOSVersion \"%@\" is not a valid version";
LABEL_23:
        _os_log_impl(&dword_23797A000, v36, OS_LOG_TYPE_DEFAULT, v38, buf, 0x16u);

LABEL_24:
LABEL_25:
        BOOL v8 = 0;
        goto LABEL_26;
      }
    }
    BOOL v8 = 0;
    if (+[UAFConfiguration isValidValue:v5 key:@"MaxOSVersion" kind:objc_opt_class() required:0 error:a4])
    {
      uint64_t v13 = [v5 objectForKeyedSubscript:@"MaxOSVersion"];
      if (!v13) {
        goto LABEL_8;
      }
      __int16 v14 = (void *)v13;
      v15 = [v5 objectForKeyedSubscript:@"MaxOSVersion"];
      uint64_t v16 = +[UAFPlatform versionComponentsFromString:v15];

      if (v16)
      {
LABEL_8:
        BOOL v8 = 1;
        goto LABEL_26;
      }
      if (a4)
      {
        v26 = (void *)MEMORY[0x263F087E8];
        if (*a4)
        {
          v44[0] = *MEMORY[0x263F08320];
          v27 = NSString;
          v28 = [v5 objectForKeyedSubscript:@"MaxOSVersion"];
          v29 = [v27 stringWithFormat:@"MaxOSVersion \"%@\" is not a valid version", v28];
          v44[1] = *MEMORY[0x263F08608];
          v45[0] = v29;
          v45[1] = *a4;
          v30 = NSDictionary;
          v31 = (void **)v45;
          v32 = v44;
          uint64_t v33 = 2;
        }
        else
        {
          uint64_t v42 = *MEMORY[0x263F08320];
          v39 = NSString;
          v28 = [v5 objectForKeyedSubscript:@"MaxOSVersion"];
          v29 = [v39 stringWithFormat:@"MaxOSVersion \"%@\" is not a valid version", v28];
          v43 = v29;
          v30 = NSDictionary;
          v31 = &v43;
          v32 = &v42;
          uint64_t v33 = 1;
        }
        v40 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:v33];
        *a4 = [v26 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v40];
      }
      v36 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      v37 = [v5 objectForKeyedSubscript:@"MaxOSVersion"];
      *(_DWORD *)buf = 136315394;
      v47 = "+[UAFAssetSetMetadata isValid:error:]";
      __int16 v48 = 2112;
      v49 = v37;
      v38 = "%s MaxOSVersion \"%@\" is not a valid version";
      goto LABEL_23;
    }
  }
LABEL_26:

  return v8;
}

+ (id)supportedFileVersions
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"1.0.0";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)fromAssetDir:(id)a3 error:(id *)a4
{
  id v5 = [a3 URLByAppendingPathComponent:@"metadata.plist"];
  int64_t v6 = +[UAFAssetSetMetadata fromContentsOfURL:v5 error:a4];

  return v6;
}

+ (id)fromContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v16 = 0;
  int64_t v6 = [NSDictionary dictionaryWithContentsOfURL:v5 error:&v16];
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
    if (+[UAFAssetSetMetadata isValid:v6 error:a4])
    {
      __int16 v14 = [[UAFAssetSetMetadata alloc] initWithDictionary:v6];
      goto LABEL_15;
    }
    v10 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[UAFAssetSetMetadata fromContentsOfURL:error:]";
      __int16 v19 = 2112;
      id v20 = v5;
      v11 = "%s Failed to validate UAFAssetSetMetadata dictionary from \"%@\"";
      int v12 = v10;
      uint32_t v13 = 22;
      goto LABEL_19;
    }
  }
  else
  {
    v10 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "+[UAFAssetSetMetadata fromContentsOfURL:error:]";
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      v22 = v8;
      v11 = "%s Failed to load UAFAssetSetMetadata dictionary from \"%@\": %@";
      int v12 = v10;
      uint32_t v13 = 32;
LABEL_19:
      _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    }
  }

  __int16 v14 = 0;
LABEL_15:

  return v14;
}

- (UAFAssetSetMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UAFAssetSetMetadata;
  id v5 = [(UAFAssetSetMetadata *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"MinOSVersion"];
    minOSVersion = v5->_minOSVersion;
    v5->_minOSVersion = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"MaxOSVersion"];
    maxOSVersion = v5->_maxOSVersion;
    v5->_maxOSVersion = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

void __32__UAFAssetSetMetadata_OSVersion__block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v0 = _CFCopySystemVersionDictionaryValue();
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v0;

  if (!_MergedGlobals_1)
  {
    uint64_t v2 = MGCopyAnswer();
    v3 = (void *)_MergedGlobals_1;
    _MergedGlobals_1 = v2;
  }
  id v4 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = "+[UAFAssetSetMetadata OSVersion]_block_invoke";
    __int16 v7 = 2114;
    uint64_t v8 = _MergedGlobals_1;
    _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s OS version for the metadata asset: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxOSVersion, 0);

  objc_storeStrong((id *)&self->_minOSVersion, 0);
}

- (NSString)minOSVersion
{
  return self->_minOSVersion;
}

- (void)setMinOSVersion:(id)a3
{
}

- (NSString)maxOSVersion
{
  return self->_maxOSVersion;
}

- (void)setMaxOSVersion:(id)a3
{
}

@end