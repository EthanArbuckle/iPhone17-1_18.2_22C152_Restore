@interface CLSSceneModel
+ (NSString)name;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3;
- (BOOL)nodeIsSupported:(id)a3;
- (BOOL)nodeRefIsSupported:(void *)a3;
- (CLSSceneModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (id)confidenceThresholdBySceneIdentifierForSceneNames:(id)a3 withThresholdType:(unint64_t)a4;
- (id)initForTesting;
- (id)modelInfo;
- (unint64_t)version;
@end

@implementation CLSSceneModel

- (unint64_t)version
{
  return self->_version;
}

- (id)confidenceThresholdBySceneIdentifierForSceneNames:(id)a3 withThresholdType:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = 0;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      v14 = v11;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        v11 = [*(id *)(*((void *)&v18 + 1) + 8 * v13) lowercaseString];

        [v7 addObject:v11];
        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
  v17.receiver = self;
  v17.super_class = (Class)CLSSceneModel;
  v15 = [(CLSTaxonomyBasedModel *)&v17 confidenceThresholdBySceneIdentifierForSceneNames:v7 withThresholdType:a4];

  return v15;
}

- (BOOL)nodeRefIsSupported:(void *)a3
{
  return PFSceneTaxonomyNodeNetworkId() == 1;
}

- (BOOL)nodeIsSupported:(id)a3
{
  return [a3 networkId] == 1;
}

- (id)modelInfo
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  return v2;
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return a3 >> 4 < 0x271 || (a3 & 0x80000000) != 0;
}

- (id)initForTesting
{
  return [(CLSSceneModel *)self initWithSceneAnalysisVersion:84];
}

- (CLSSceneModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)objc_opt_class() baseSceneAnalysisVersionWithSceneAnalysisVersion:a3];
  if (v5)
  {
    unint64_t v6 = v5;
    id v7 = [NSNumber numberWithUnsignedInteger:v5];
    id v8 = [v7 stringValue];

    id v16 = 0;
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F5DF68]) initWithIdentifier:v8 error:&v16];
    id v10 = v16;
    if (v9)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [v9 digest];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)long long v18 = v6;
        *(_WORD *)&v18[4] = 2112;
        *(void *)&v18[6] = v11;
        _os_log_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Setting up scene model version %d using scene taxonomy with digest '%@'", buf, 0x12u);
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)long long v18 = v8;
        *(_WORD *)&v18[8] = 2112;
        *(void *)&v18[10] = v10;
        _os_log_error_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error instantiating scene taxonomy for version %@, using latest: %@", buf, 0x16u);
      }
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F5DF68]) initWithLatestTaxonomy];
      if (!v9)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error instantiating latest scene taxonomy", buf, 2u);
        }
        uint64_t v12 = 0;
        goto LABEL_14;
      }
    }
    v15.receiver = self;
    v15.super_class = (Class)CLSSceneModel;
    uint64_t v13 = [(CLSTaxonomyBasedModel *)&v15 initWithSceneTaxonomy:v9];
    if (v13) {
      v13->_version = v6;
    }
    self = v13;

    uint64_t v12 = self;
LABEL_14:

    goto LABEL_15;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)long long v18 = v3;
    *(_WORD *)&v18[4] = 2112;
    *(void *)&v18[6] = objc_opt_class();
    _os_log_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
  }
  uint64_t v12 = 0;
LABEL_15:

  return v12;
}

+ (unint64_t)latestVersion
{
  return 84;
}

+ (NSString)name
{
  return (NSString *)@"Scene";
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3 = 33;
  if (a3 < 0x21) {
    unint64_t v3 = 0;
  }
  if (a3 >= 0x54) {
    return 84;
  }
  else {
    return v3;
  }
}

@end