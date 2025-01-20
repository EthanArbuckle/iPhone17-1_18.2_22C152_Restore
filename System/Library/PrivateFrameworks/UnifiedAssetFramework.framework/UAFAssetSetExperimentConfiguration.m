@interface UAFAssetSetExperimentConfiguration
+ (BOOL)isValid:(id)a3 error:(id *)a4;
+ (id)fromContentsOfURL:(id)a3 error:(id *)a4;
+ (id)supportedFileVersions;
- (NSDictionary)assetSpecifiers;
- (UAFAssetSetExperimentConfiguration)initWithDictionary:(id)a3;
- (void)setAssetSpecifiers:(id)a3;
@end

@implementation UAFAssetSetExperimentConfiguration

+ (id)supportedFileVersions
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"1.0.0";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)isValid:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[UAFAssetSetExperimentConfiguration supportedFileVersions];
  BOOL v7 = +[UAFConfiguration isValid:v5 fileType:@"AssetSetExperiment" fileVersions:v6 error:a4];

  if (v7
    && +[UAFConfiguration isValidValue:v5 key:@"AutoAssetSpecifiers" kind:objc_opt_class() required:1 error:a4])
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 1;
    v8 = [v5 objectForKeyedSubscript:@"AutoAssetSpecifiers"];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __52__UAFAssetSetExperimentConfiguration_isValid_error___block_invoke;
    v11[3] = &unk_264CEB758;
    v11[4] = &v12;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];

    BOOL v9 = *((unsigned char *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __52__UAFAssetSetExperimentConfiguration_isValid_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
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
  v8 = v7;
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
    if (+[UAFAssetSetExperimentConfiguration isValid:v6 error:a4])
    {
      uint64_t v14 = [[UAFAssetSetExperimentConfiguration alloc] initWithDictionary:v6];
      goto LABEL_15;
    }
    v10 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[UAFAssetSetExperimentConfiguration fromContentsOfURL:error:]";
      __int16 v19 = 2112;
      id v20 = v5;
      v11 = "%s Failed to validate UAFAssetSetExperimentConfiguration dictionary from \"%@\"";
      uint64_t v12 = v10;
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
      v18 = "+[UAFAssetSetExperimentConfiguration fromContentsOfURL:error:]";
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      v22 = v8;
      v11 = "%s Failed to load UAFAssetSetExperimentConfiguration dictionary from \"%@\": %@";
      uint64_t v12 = v10;
      uint32_t v13 = 32;
LABEL_19:
      _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    }
  }

  uint64_t v14 = 0;
LABEL_15:

  return v14;
}

- (UAFAssetSetExperimentConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UAFAssetSetExperimentConfiguration;
  id v5 = [(UAFAssetSetExperimentConfiguration *)&v15 init];
  if (v5)
  {
    v6 = objc_opt_new();
    id v7 = [v4 objectForKeyedSubscript:@"AutoAssetSpecifiers"];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__UAFAssetSetExperimentConfiguration_initWithDictionary___block_invoke;
    v13[3] = &unk_264CEB780;
    id v14 = v6;
    id v8 = v6;
    [v7 enumerateKeysAndObjectsUsingBlock:v13];

    uint64_t v9 = [v8 copy];
    assetSpecifiers = v5->_assetSpecifiers;
    v5->_assetSpecifiers = (NSDictionary *)v9;

    v11 = v5;
  }

  return v5;
}

void __57__UAFAssetSetExperimentConfiguration_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = v5;
      [v7 setObject:v8 forKey:v6];
    }
  }
  else
  {
    id v6 = 0;
  }
}

- (NSDictionary)assetSpecifiers
{
  return self->_assetSpecifiers;
}

- (void)setAssetSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end