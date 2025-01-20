@interface UAFPrestageConfiguration
+ (BOOL)isValid:(id)a3 error:(id *)a4;
+ (BOOL)predicateMatch:(id)a3;
+ (id)fromContentsOfURL:(id)a3 error:(id *)a4;
+ (id)supportedFileVersions;
- (NSArray)usages;
- (NSString)name;
- (UAFPrestageConfiguration)initWithDictionary:(id)a3;
- (id)mergeAssetSetUsages:(id)a3;
- (id)usages:(id)a3;
- (void)setName:(id)a3;
- (void)setUsages:(id)a3;
@end

@implementation UAFPrestageConfiguration

+ (id)supportedFileVersions
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"1.0.0";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)isValid:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = +[UAFPrestageConfiguration supportedFileVersions];
  BOOL v7 = +[UAFConfiguration isValid:v5 fileType:@"PrestageConfiguration" fileVersions:v6 error:a4];

  if (!v7
    || !+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v5, @"AssetSetName", objc_opt_class(), 1, a4)|| !+[UAFConfiguration isValidValue:v5 key:@"ValidConfigs" kind:objc_opt_class() required:1 error:a4])
  {
    BOOL v21 = 0;
    goto LABEL_28;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v8 = [v5 objectForKeyedSubscript:@"ValidConfigs"];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (!v9)
  {
    BOOL v21 = 1;
    goto LABEL_34;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v39;
  v32 = v8;
  uint64_t v29 = *(void *)v39;
  while (2)
  {
    uint64_t v12 = 0;
    uint64_t v30 = v10;
    do
    {
      if (*(void *)v39 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v31 = v12;
      v13 = *(void **)(*((void *)&v38 + 1) + 8 * v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v26 = objc_opt_class();
          *(_DWORD *)buf = 136315394;
          v44 = "+[UAFPrestageConfiguration isValid:error:]";
          __int16 v45 = 2112;
          v46 = v26;
          id v27 = v26;
          _os_log_impl(&dword_23797A000, v14, OS_LOG_TYPE_DEFAULT, "%s ValidConfig is not expected kind \"%@\"", buf, 0x16u);
        }
        goto LABEL_32;
      }
      v14 = v13;
      if (!+[UAFConfiguration isValidValue:v14 key:@"TargetingType" kind:objc_opt_class() required:1 error:a4])goto LABEL_32; {
      v15 = [v14 objectForKeyedSubscript:@"TargetingType"];
      }
      if (![v15 isEqualToString:@"PrestagePredicate"])
      {
        if ([v15 isEqualToString:@"AllDevices"]) {
          goto LABEL_15;
        }
        v28 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "+[UAFPrestageConfiguration isValid:error:]";
          __int16 v45 = 2114;
          v46 = v15;
          _os_log_impl(&dword_23797A000, v28, OS_LOG_TYPE_DEFAULT, "%s Unknown targeting type: %{public}@", buf, 0x16u);
        }

LABEL_40:
LABEL_32:

        BOOL v21 = 0;
        goto LABEL_34;
      }
      if (!+[UAFConfiguration isValidValue:v14 key:@"TargetingPredicate" kind:objc_opt_class() required:1 error:a4])goto LABEL_40; {
LABEL_15:
      }
      if (!+[UAFConfiguration isValidValue:v14 key:@"Usages" kind:objc_opt_class() required:1 error:a4])goto LABEL_40; {
      v33 = v15;
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v16 = [v14 objectForKeyedSubscript:@"Usages"];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(v16);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v23 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                v24 = objc_opt_class();
                *(_DWORD *)buf = 136315394;
                v44 = "+[UAFPrestageConfiguration isValid:error:]";
                __int16 v45 = 2112;
                v46 = v24;
                id v25 = v24;
                _os_log_impl(&dword_23797A000, v23, OS_LOG_TYPE_DEFAULT, "%s Usage is not expected kind \"%@\"", buf, 0x16u);
              }
              v8 = v32;
              goto LABEL_32;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      v8 = v32;
      uint64_t v12 = v31 + 1;
      uint64_t v11 = v29;
    }
    while (v31 + 1 != v30);
    uint64_t v10 = [v32 countByEnumeratingWithState:&v38 objects:v47 count:16];
    BOOL v21 = 1;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_34:

LABEL_28:
  return v21;
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
    if (+[UAFPrestageConfiguration isValid:v6 error:a4])
    {
      v14 = [[UAFPrestageConfiguration alloc] initWithDictionary:v6];
      goto LABEL_15;
    }
    uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "+[UAFPrestageConfiguration fromContentsOfURL:error:]";
      __int16 v19 = 2112;
      id v20 = v5;
      uint64_t v11 = "%s Failed to validate UAFAssetSetConfiguration dictionary from \"%@\"";
      uint64_t v12 = v10;
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
      uint64_t v18 = "+[UAFPrestageConfiguration fromContentsOfURL:error:]";
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      v22 = v8;
      uint64_t v11 = "%s Failed to load UAFAssetSetConfiguration dictionary from \"%@\": %@";
      uint64_t v12 = v10;
      uint32_t v13 = 32;
LABEL_19:
      _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    }
  }

  v14 = 0;
LABEL_15:

  return v14;
}

+ (BOOL)predicateMatch:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [&unk_26EAA10E0 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(&unk_26EAA10E0);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = +[UAFCommonUtilities mobileGestaltQuery:v10];
        [v5 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v7 = [&unk_26EAA10E0 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v7);
  }
  [v4 addEntriesFromDictionary:v5];
  uint64_t v12 = +[UAFCommonUtilities systemLanguage];
  [v4 setObject:v12 forKeyedSubscript:@"SystemLanguage"];

  uint32_t v13 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "+[UAFPrestageConfiguration predicateMatch:]";
    __int16 v23 = 2114;
    id v24 = v3;
    _os_log_impl(&dword_23797A000, v13, OS_LOG_TYPE_DEFAULT, "%s Evaluating predicate string: '%{public}@'", buf, 0x16u);
  }

  v14 = [MEMORY[0x263F08A98] predicateWithFormat:v3];
  char v15 = [v14 evaluateWithObject:v4];

  return v15;
}

- (UAFPrestageConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UAFPrestageConfiguration;
  id v5 = [(UAFPrestageConfiguration *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"AssetSetName"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"ValidConfigs"];
    uint64_t v9 = [(UAFPrestageConfiguration *)v5 usages:v8];
    usages = v5->_usages;
    v5->_usages = (NSArray *)v9;

    uint64_t v11 = v5;
  }

  return v5;
}

- (id)usages:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v3)
  {
    id v5 = 0;
    goto LABEL_21;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v19 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      uint64_t v9 = [v8 objectForKeyedSubscript:@"TargetingType"];
      int v10 = [v9 isEqualToString:@"AllDevices"];

      if (v10)
      {
        if (!v5)
        {
          id v5 = [MEMORY[0x263EFF980] array];
        }
        uint64_t v11 = [v8 objectForKeyedSubscript:@"Usages"];
        uint64_t v12 = [v5 arrayByAddingObjectsFromArray:v11];
        goto LABEL_10;
      }
      objc_super v13 = [v8 objectForKeyedSubscript:@"TargetingType"];
      int v14 = [v13 isEqualToString:@"PrestagePredicate"];

      if (v14)
      {
        uint64_t v11 = [v8 objectForKeyedSubscript:@"TargetingPredicate"];
        if (+[UAFPrestageConfiguration predicateMatch:v11])
        {
          if (!v5)
          {
            id v5 = [MEMORY[0x263EFF980] array];
          }
          uint64_t v15 = [v8 objectForKeyedSubscript:@"Usages"];
          uint64_t v12 = [v5 arrayByAddingObjectsFromArray:v15];

          id v5 = (void *)v15;
LABEL_10:

          id v5 = (void *)v12;
        }

        continue;
      }
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v4);
LABEL_21:

  return v5;
}

- (id)mergeAssetSetUsages:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_usages count])
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
    uint64_t v6 = [MEMORY[0x263EFF9C0] set];
    uint64_t v7 = [v5 objectForKeyedSubscript:self->_name];
    [v6 addObjectsFromArray:v7];

    [v6 addObjectsFromArray:self->_usages];
    uint64_t v8 = [v6 allObjects];
    [v5 setObject:v8 forKeyedSubscript:self->_name];
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)usages
{
  return self->_usages;
}

- (void)setUsages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usages, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end