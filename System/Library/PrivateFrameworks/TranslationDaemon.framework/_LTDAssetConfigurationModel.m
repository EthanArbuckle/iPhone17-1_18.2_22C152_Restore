@interface _LTDAssetConfigurationModel
- (NSArray)assetDirectoryNames;
- (NSArray)speechEndpointAssetTypes;
- (NSArray)speechTranslationAssetTypes;
- (NSDictionary)root;
- (NSString)config;
- (_LTDAssetConfigurationModel)initWithDictionary:(id)a3;
- (id)currentAssetDirectoryName;
- (id)currentEndpointAssetType;
- (id)currentSpeechTranslationAssetType;
- (id)debugDescription;
- (void)currentSpeechTranslationAssetType;
- (void)setRoot:(id)a3;
@end

@implementation _LTDAssetConfigurationModel

- (_LTDAssetConfigurationModel)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_LTDAssetConfigurationModel;
  v5 = [(_LTDAssetConfigurationModel *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"ManagedAssetTypes"];
    root = v5->_root;
    v5->_root = (NSDictionary *)v6;

    v8 = [(NSDictionary *)v5->_root objectForKeyedSubscript:@"SpeechTranslation"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int v9 = objc_msgSend(v8, "lt_ensureElementType:", objc_opt_class());
      v10 = (void *)MEMORY[0x263EFFA68];
      if (v9) {
        v10 = v8;
      }
    }
    else
    {

      v8 = 0;
      v10 = (void *)MEMORY[0x263EFFA68];
    }
    v11 = v10;

    speechTranslationAssetTypes = v5->_speechTranslationAssetTypes;
    v5->_speechTranslationAssetTypes = v11;

    v13 = [(NSDictionary *)v5->_root objectForKeyedSubscript:@"SpeechEndpoint"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int v14 = objc_msgSend(v13, "lt_ensureElementType:", objc_opt_class());
      v15 = (void *)MEMORY[0x263EFFA68];
      if (v14) {
        v15 = v13;
      }
    }
    else
    {

      v13 = 0;
      v15 = (void *)MEMORY[0x263EFFA68];
    }
    v16 = v15;

    speechEndpointAssetTypes = v5->_speechEndpointAssetTypes;
    v5->_speechEndpointAssetTypes = v16;

    v18 = [(NSDictionary *)v5->_root objectForKeyedSubscript:@"AssetDirectory"];
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int v19 = objc_msgSend(v18, "lt_ensureElementType:", objc_opt_class());
      v20 = (void *)MEMORY[0x263EFFA68];
      if (v19) {
        v20 = v18;
      }
    }
    else
    {

      v18 = 0;
      v20 = (void *)MEMORY[0x263EFFA68];
    }
    v21 = v20;

    assetDirectoryNames = v5->_assetDirectoryNames;
    v5->_assetDirectoryNames = v21;

    v23 = v5;
  }

  return v5;
}

- (id)currentSpeechTranslationAssetType
{
  uint64_t v3 = _LTPreferencesOverrideDefaultCatalog();
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(_LTDAssetConfigurationModel *)(uint64_t)v4 currentSpeechTranslationAssetType];
    }
  }
  else
  {
    uint64_t v6 = [(_LTDAssetConfigurationModel *)self speechTranslationAssetTypes];
    id v4 = [v6 lastObject];

    v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(_LTDAssetConfigurationModel *)(uint64_t)v4 currentSpeechTranslationAssetType];
    }
  }
  id v8 = v4;

  return v8;
}

- (id)currentEndpointAssetType
{
  v2 = [(_LTDAssetConfigurationModel *)self speechEndpointAssetTypes];
  uint64_t v3 = [v2 lastObject];

  return v3;
}

- (id)currentAssetDirectoryName
{
  v2 = [(_LTDAssetConfigurationModel *)self assetDirectoryNames];
  uint64_t v3 = [v2 lastObject];

  return v3;
}

- (id)debugDescription
{
  return (id)[(NSDictionary *)self->_root debugDescription];
}

- (NSString)config
{
  return self->_config;
}

- (NSArray)speechTranslationAssetTypes
{
  return self->_speechTranslationAssetTypes;
}

- (NSArray)speechEndpointAssetTypes
{
  return self->_speechEndpointAssetTypes;
}

- (NSArray)assetDirectoryNames
{
  return self->_assetDirectoryNames;
}

- (NSDictionary)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_assetDirectoryNames, 0);
  objc_storeStrong((id *)&self->_speechEndpointAssetTypes, 0);
  objc_storeStrong((id *)&self->_speechTranslationAssetTypes, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)currentSpeechTranslationAssetType
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2600DC000, a2, OS_LOG_TYPE_DEBUG, "Current translation asset catalog is %{public}@ from OverrideDefaultCatalog", (uint8_t *)&v2, 0xCu);
}

@end