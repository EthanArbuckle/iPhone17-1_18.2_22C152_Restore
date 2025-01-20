@interface CLSEntityNetModel
+ (NSString)name;
+ (id)_sceneTaxonomyIdentifierForBaseVersion:(unint64_t)a3;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3;
- (BOOL)nodeIsSupported:(id)a3;
- (BOOL)nodeRefIsSupported:(void *)a3;
- (CLSEntityNetModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (id)initForTesting;
- (id)modelInfo;
- (unint64_t)version;
@end

@implementation CLSEntityNetModel

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)nodeRefIsSupported:(void *)a3
{
  return 1;
}

- (BOOL)nodeIsSupported:(id)a3
{
  return 1;
}

- (id)modelInfo
{
  return (id)MEMORY[0x263EFFA68];
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7F000000) == 0;
}

- (id)initForTesting
{
  return [(CLSEntityNetModel *)self initWithSceneAnalysisVersion:99];
}

- (CLSEntityNetModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)objc_opt_class() baseSceneAnalysisVersionWithSceneAnalysisVersion:a3];
  if (v5)
  {
    unint64_t v6 = v5;
    v7 = [(id)objc_opt_class() _sceneTaxonomyIdentifierForBaseVersion:v5];
    if (v7)
    {
      id v15 = 0;
      v8 = (void *)[objc_alloc(MEMORY[0x263F5DF68]) initWithIdentifier:v7 error:&v15];
      id v9 = v15;
      if (v8)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          v10 = [v8 digest];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v17 = v6;
          *(_WORD *)&v17[4] = 2112;
          *(void *)&v17[6] = v10;
          _os_log_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Setting up EntityNet model version %d using scene taxonomy with digest '%@'", buf, 0x12u);
        }
        goto LABEL_14;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v17 = v7;
        *(_WORD *)&v17[8] = 2112;
        *(void *)&v17[10] = v9;
        _os_log_error_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error instantiating scene taxonomy for version %@, using latest: %@", buf, 0x16u);
      }
    }
    v8 = (void *)[objc_alloc(MEMORY[0x263F5DF68]) initWithLatestTaxonomy];
    if (!v8)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error instantiating latest scene taxonomy", buf, 2u);
      }
      v11 = 0;
      goto LABEL_20;
    }
LABEL_14:
    v14.receiver = self;
    v14.super_class = (Class)CLSEntityNetModel;
    v12 = [(CLSTaxonomyBasedModel *)&v14 initWithSceneTaxonomy:v8];
    if (v12) {
      v12->_version = v6;
    }
    self = v12;

    v11 = self;
LABEL_20:

    goto LABEL_21;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v17 = v3;
    *(_WORD *)&v17[4] = 2112;
    *(void *)&v17[6] = objc_opt_class();
    _os_log_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
  }
  v11 = 0;
LABEL_21:

  return v11;
}

+ (unint64_t)latestVersion
{
  return 99;
}

+ (NSString)name
{
  return (NSString *)@"EntityNet";
}

+ (id)_sceneTaxonomyIdentifierForBaseVersion:(unint64_t)a3
{
  int v3 = @"84";
  if (a3 != 96) {
    int v3 = 0;
  }
  if (a3 == 99) {
    return @"99";
  }
  else {
    return v3;
  }
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3 = 96;
  if (a3 < 0x60) {
    unint64_t v3 = 0;
  }
  if (a3 >= 0x63) {
    return 99;
  }
  else {
    return v3;
  }
}

@end