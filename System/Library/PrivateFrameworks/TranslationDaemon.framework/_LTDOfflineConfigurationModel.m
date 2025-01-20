@interface _LTDOfflineConfigurationModel
+ (BOOL)isPassthroughLocalePairIdentifier:(id)a3;
+ (id)passthroughConfiguration;
- (BOOL)hasCapabilityIdentifiers;
- (NSArray)languageIdentifiers;
- (NSArray)languagePairs;
- (NSArray)pairAssetList;
- (NSDictionary)languagePairConfigs;
- (NSDictionary)root;
- (NSString)pairAssetConfigFile;
- (_LTDOfflineConfigurationModel)initWithDictionary:(id)a3;
- (id)_offlinePairConfigurationWithIdentifier:(id)a3 capability:(int64_t)a4;
- (id)debugDescription;
- (id)offlinePairConfigurationWithIdentifier:(id)a3;
- (int64_t)pairAssetRequiredANECapability;
@end

@implementation _LTDOfflineConfigurationModel

- (_LTDOfflineConfigurationModel)initWithDictionary:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_LTDOfflineConfigurationModel;
  v6 = [(_LTDOfflineConfigurationModel *)&v29 init];
  v7 = v6;
  if (v6)
  {
    p_root = (id *)&v6->_root;
    objc_storeStrong((id *)&v6->_root, a3);
    v9 = [(NSDictionary *)v7->_root objectForKeyedSubscript:@"LanguagePairs"];
    uint64_t v10 = objc_opt_class();
    v11 = v9;
    if (!v11
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (char v12 = [(NSDictionary *)v11 lt_ensureTypesForKeys:v10 values:0],
          v13 = v11,
          (v12 & 1) == 0))
    {

      v13 = 0;
    }

    languagePairConfigs = v7->_languagePairConfigs;
    v7->_languagePairConfigs = v13;

    v15 = [(NSDictionary *)v7->_languagePairConfigs allValues];
    v16 = [v15 firstObject];
    objc_opt_class();
    v7->_hasCapabilityIdentifiers = objc_opt_isKindOfClass() & 1;

    if (!v7->_languagePairConfigs)
    {
      v17 = [*p_root objectForKeyedSubscript:@"config"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = [(NSDictionary *)v7->_root objectForKeyedSubscript:@"config"];
        pairAssetConfigFile = v7->_pairAssetConfigFile;
        v7->_pairAssetConfigFile = (NSString *)v18;
      }
      else
      {
        pairAssetConfigFile = v7->_pairAssetConfigFile;
        v7->_pairAssetConfigFile = 0;
      }

      v20 = [*p_root objectForKeyedSubscript:@"asset_list"];
      if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (objc_msgSend(v20, "lt_ensureElementType:", objc_opt_class())) {
          v21 = v20;
        }
        else {
          v21 = 0;
        }
      }
      else
      {

        v20 = 0;
        v21 = 0;
      }
      v22 = v21;

      pairAssetList = v7->_pairAssetList;
      v7->_pairAssetList = v22;

      v24 = [(NSDictionary *)v7->_root objectForKeyedSubscript:@"RequiredCapabilityIdentifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [*p_root objectForKeyedSubscript:@"RequiredCapabilityIdentifier"];
      }
      else
      {
        v25 = objc_opt_new();
      }
      v26 = v25;
      v7->_pairAssetRequiredANECapability = [v25 integerValue];
    }
    v27 = v7;
  }

  return v7;
}

+ (id)passthroughConfiguration
{
  v7[3] = *MEMORY[0x263EF8340];
  v2 = [_LTDOfflineConfigurationModel alloc];
  v6[0] = @"config";
  v6[1] = @"asset_list";
  v7[0] = &stru_270C008E8;
  v7[1] = MEMORY[0x263EFFA68];
  v6[2] = @"RequiredCapabilityIdentifier";
  v7[2] = &unk_270C33838;
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
  v4 = [(_LTDOfflineConfigurationModel *)v2 initWithDictionary:v3];

  return v4;
}

+ (BOOL)isPassthroughLocalePairIdentifier:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  if (v4 >= 9)
  {
    unint64_t v5 = v4 >> 1;
    if ([v3 characterAtIndex:v4 >> 1] == 45)
    {
      uint64_t v6 = 0;
      char v7 = 0;
      while (1)
      {
        int v8 = [v3 characterAtIndex:v6];
        if (v8 != [v3 characterAtIndex:v5 + v6 + 1]) {
          break;
        }
        v7 |= v8 == 95;
        if (v5 == ++v6) {
          goto LABEL_8;
        }
      }
    }
  }
  char v7 = 0;
LABEL_8:

  return v7 & 1;
}

- (NSArray)languagePairs
{
  return [(NSDictionary *)self->_languagePairConfigs allKeys];
}

- (NSArray)languageIdentifiers
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [(_LTDOfflineConfigurationModel *)self languagePairs];
  id v3 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v2, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v19;
    *(void *)&long long v6 = 138543362;
    long long v17 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "componentsSeparatedByString:", @"-", v17, (void)v18);
        if ((unint64_t)[v11 count] > 1)
        {
          v13 = [v11 objectAtIndexedSubscript:0];
          [v3 addObject:v13];
          v14 = [v11 objectAtIndexedSubscript:1];
          [v3 addObject:v14];
        }
        else
        {
          char v12 = _LTOSLogAssets();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v23 = v10;
            _os_log_error_impl(&dword_2600DC000, v12, OS_LOG_TYPE_ERROR, "Offline configuration locale pair with nil source and/or target: %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v7);
  }

  v15 = [v3 allObjects];

  return (NSArray *)v15;
}

- (id)offlinePairConfigurationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_LTDOfflineConfigurationModel *)self _offlinePairConfigurationWithIdentifier:v4 capability:+[_LTDANEService capability]];

  return v5;
}

- (id)_offlinePairConfigurationWithIdentifier:(id)a3 capability:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(id)objc_opt_class() isPassthroughLocalePairIdentifier:v6])
  {
    uint64_t v7 = [(id)objc_opt_class() passthroughConfiguration];
  }
  else
  {
    BOOL hasCapabilityIdentifiers = self->_hasCapabilityIdentifiers;
    v9 = [(NSDictionary *)self->_languagePairConfigs objectForKeyedSubscript:v6];
    if (hasCapabilityIdentifiers)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [(NSDictionary *)self->_languagePairConfigs objectForKeyedSubscript:v6];
      }
      else
      {
        uint64_t v10 = objc_opt_new();
      }
      char v12 = (void *)v10;

      v13 = [v12 firstObject];
      unint64_t v14 = 0x263EFF000uLL;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = [v12 firstObject];
      }
      else
      {
        uint64_t v15 = objc_opt_new();
      }
      v16 = (void *)v15;

      if ([v12 count])
      {
        unint64_t v17 = 0;
        while (1)
        {
          long long v18 = [v12 objectAtIndexedSubscript:v17];
          long long v19 = [v18 objectForKeyedSubscript:@"RequiredCapabilityIdentifier"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v12 objectAtIndexedSubscript:v17];
            int64_t v20 = a4;
            v22 = unint64_t v21 = v14;
            v23 = [v22 objectForKeyedSubscript:@"RequiredCapabilityIdentifier"];

            unint64_t v14 = v21;
            a4 = v20;
          }
          else
          {
            v23 = objc_opt_new();
          }

          if ([v23 integerValue] > a4) {
            break;
          }
          v24 = [v12 objectAtIndexedSubscript:v17];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v25 = [v12 objectAtIndexedSubscript:v17];
          }
          else
          {
            uint64_t v25 = objc_opt_new();
          }
          v26 = (void *)v25;

          ++v17;
          v16 = v26;
          if (v17 >= [v12 count])
          {
            v16 = v26;
            goto LABEL_26;
          }
        }
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [(NSDictionary *)self->_languagePairConfigs objectForKeyedSubscript:v6];
      }
      else
      {
        uint64_t v11 = objc_opt_new();
      }
      v16 = (void *)v11;
      char v12 = v9;
    }
LABEL_26:

    if ([v16 count])
    {
      uint64_t v7 = [[_LTDOfflineConfigurationModel alloc] initWithDictionary:v16];
    }
    else
    {
      v27 = _LTOSLogAssets();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v30 = v6;
        _os_log_impl(&dword_2600DC000, v27, OS_LOG_TYPE_INFO, "No offline configuration available for language identifier: %{public}@", buf, 0xCu);
      }

      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (id)debugDescription
{
  return (id)[(NSDictionary *)self->_root debugDescription];
}

- (NSString)pairAssetConfigFile
{
  return self->_pairAssetConfigFile;
}

- (NSArray)pairAssetList
{
  return self->_pairAssetList;
}

- (NSDictionary)root
{
  return self->_root;
}

- (NSDictionary)languagePairConfigs
{
  return self->_languagePairConfigs;
}

- (BOOL)hasCapabilityIdentifiers
{
  return self->_hasCapabilityIdentifiers;
}

- (int64_t)pairAssetRequiredANECapability
{
  return self->_pairAssetRequiredANECapability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languagePairConfigs, 0);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_pairAssetList, 0);
  objc_storeStrong((id *)&self->_pairAssetConfigFile, 0);
}

@end