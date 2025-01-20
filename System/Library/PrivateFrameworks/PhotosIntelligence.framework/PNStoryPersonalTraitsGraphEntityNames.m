@interface PNStoryPersonalTraitsGraphEntityNames
+ (id)_loadPersonalTraitEntityConfiguration;
- (PNStoryPersonalTraitsGraphEntityNames)init;
- (id)dominantRequiredSceneNames;
- (id)meaningNames;
- (id)sceneNames;
- (int64_t)configurationVersion;
@end

@implementation PNStoryPersonalTraitsGraphEntityNames

- (void).cxx_destruct
{
}

- (id)meaningNames
{
  return [(NSDictionary *)self->_personalTraitEntityConfiguration objectForKeyedSubscript:@"meanings"];
}

- (id)dominantRequiredSceneNames
{
  v2 = [(NSDictionary *)self->_personalTraitEntityConfiguration objectForKeyedSubscript:@"scenes"];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__PNStoryPersonalTraitsGraphEntityNames_dominantRequiredSceneNames__block_invoke;
  v6[3] = &unk_26544F500;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

void __67__PNStoryPersonalTraitsGraphEntityNames_dominantRequiredSceneNames__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  v5 = [a3 objectForKeyedSubscript:@"isDominantRequired"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (id)sceneNames
{
  v2 = [(NSDictionary *)self->_personalTraitEntityConfiguration objectForKeyedSubscript:@"scenes"];
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [v2 allKeys];
  v5 = [v3 setWithArray:v4];

  return v5;
}

- (int64_t)configurationVersion
{
  v2 = [(NSDictionary *)self->_personalTraitEntityConfiguration objectForKeyedSubscript:@"version"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (PNStoryPersonalTraitsGraphEntityNames)init
{
  v6.receiver = self;
  v6.super_class = (Class)PNStoryPersonalTraitsGraphEntityNames;
  v2 = [(PNStoryPersonalTraitsGraphEntityNames *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() _loadPersonalTraitEntityConfiguration];
    personalTraitEntityConfiguration = v2->_personalTraitEntityConfiguration;
    v2->_personalTraitEntityConfiguration = (NSDictionary *)v3;
  }
  return v2;
}

+ (id)_loadPersonalTraitEntityConfiguration
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(PNStoryRemoteConfiguration);
  uint64_t v3 = +[PNStoryRemoteConfiguration personalTraitsEntityConfiguration];
  id v10 = 0;
  id v4 = [(PNStoryRemoteConfiguration *)v2 fileURLForFactorKey:v3 error:&v10];
  id v5 = v10;

  if (v4)
  {
    id v9 = v5;
    objc_super v6 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v4 error:&v9];
    id v7 = v9;

    if (!v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v12 = v4;
        __int16 v13 = 2112;
        id v14 = v7;
        _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[PNStoryPersonalTraitsGraphEntityNames] Couldn't load file (%@) from disk. error: %@", buf, 0x16u);
      }
      objc_super v6 = 0;
    }
    id v5 = v7;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[PNStoryPersonalTraitsGraphEntityNames] Couldn't load file from remote configuration. error: %@", buf, 0xCu);
    }
    objc_super v6 = 0;
  }

  return v6;
}

@end