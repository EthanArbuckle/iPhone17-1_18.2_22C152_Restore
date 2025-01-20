@interface RMModelConfigurationSchema
+ (NSDictionary)schemas;
+ (void)_loadDynamicSchemaFromDictionary:(id)a3 into:(id)a4 fileURL:(id)a5;
+ (void)_loadDynamicSchemaFromDirectory:(id)a3 into:(id)a4;
+ (void)_loadDynamicSchemaFromFile:(id)a3 into:(id)a4;
+ (void)loadDynamicSchemaFromDirectory:(id)a3;
+ (void)loadDynamicSchemaFromFiles:(id)a3;
- (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4;
- (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4 enrollmentType:(int64_t)a5;
- (NSArray)assetReferences;
- (NSDictionary)supportedOS;
- (NSNumber)version;
- (NSString)configurationType;
- (id)_parseAssetReferences:(id)a3;
- (id)initFromDictionary:(id)a3;
- (void)setAssetReferences:(id)a3;
- (void)setConfigurationType:(id)a3;
- (void)setSupportedOS:(id)a3;
@end

@implementation RMModelConfigurationSchema

+ (NSDictionary)schemas
{
  return (NSDictionary *)(id)_schemas;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RMModelConfigurationSchema;
  v5 = [(RMModelConfigurationSchema *)&v17 init];
  if (!v5) {
    goto LABEL_7;
  }
  v6 = [v4 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 intValue] != 1)
  {
LABEL_9:

    v15 = 0;
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v5->_version, v6);
  v7 = [v4 objectForKeyedSubscript:@"configuration-type"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_storeStrong((id *)&v5->_configurationType, v7),
        [v4 objectForKeyedSubscript:@"supported-os"],
        v8 = objc_claimAutoreleasedReturnValue(),
        +[RMModelSchemaParser loadSupportedOSFromDictionary:v8], v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue(), v8, !v9))
  {

    goto LABEL_9;
  }
  supportedOS = v5->_supportedOS;
  v5->_supportedOS = v9;
  v11 = v9;

  v12 = [v4 objectForKeyedSubscript:@"asset-references"];
  uint64_t v13 = [(RMModelConfigurationSchema *)v5 _parseAssetReferences:v12];
  assetReferences = v5->_assetReferences;
  v5->_assetReferences = (NSArray *)v13;

LABEL_7:
  v15 = v5;
LABEL_10:

  return v15;
}

- (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4
{
  v6 = [(RMModelConfigurationSchema *)self supportedOS];
  LOBYTE(a4) = +[RMModelPayloadUtilities isSupportedForPlatform:a3 scope:a4 supportedOS:v6];

  return a4;
}

- (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4 enrollmentType:(int64_t)a5
{
  v8 = [(RMModelConfigurationSchema *)self supportedOS];
  LOBYTE(a5) = +[RMModelPayloadUtilities isSupportedForPlatform:a3 scope:a4 enrollmentType:a5 supportedOS:v8];

  return a5;
}

+ (void)loadDynamicSchemaFromDirectory:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_opt_new();
  [a1 _loadDynamicSchemaFromDirectory:v4 into:v7];

  uint64_t v5 = [v7 copy];
  v6 = (void *)_schemas;
  _schemas = v5;
}

+ (void)loadDynamicSchemaFromFiles:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(a1, "_loadDynamicSchemaFromFile:into:", *(void *)(*((void *)&v13 + 1) + 8 * v10++), v5, (void)v13);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [v5 copy];
  v12 = (void *)_schemas;
  _schemas = v11;
}

+ (void)_loadDynamicSchemaFromDirectory:(id)a3 into:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v8 = v5;
  uint64_t v9 = [v5 path];
  uint64_t v10 = [v7 contentsOfDirectoryAtPath:v9 error:0];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_super v17 = [v16 pathExtension];
        int v18 = [v17 isEqualToString:@"json"];

        if (v18)
        {
          v19 = [v8 URLByAppendingPathComponent:v16];
          [a1 _loadDynamicSchemaFromFile:v19 into:v6];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }
}

+ (void)_loadDynamicSchemaFromFile:(id)a3 into:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v13 = 0;
  uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v6 options:0 error:&v13];
  id v9 = v13;
  if (v8)
  {
    id v12 = v9;
    uint64_t v10 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v12];
    id v11 = v12;

    [a1 _loadDynamicSchemaFromDictionary:v10 into:v7 fileURL:v6];
    id v9 = v11;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[RMModelConfigurationSchema _loadDynamicSchemaFromFile:into:]((uint64_t)v6, (uint64_t)v9);
  }
}

+ (void)_loadDynamicSchemaFromDictionary:(id)a3 into:(id)a4 fileURL:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[RMModelConfigurationSchema alloc] initFromDictionary:v9];

  if (v10)
  {
    id v11 = [v10 configurationType];
    id v12 = [v7 objectForKeyedSubscript:v11];

    if (v12)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[RMModelConfigurationSchema _loadDynamicSchemaFromDictionary:into:fileURL:](v10);
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v10 configurationType];
        int v15 = 138543362;
        long long v16 = v13;
        _os_log_impl(&dword_25AF84000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Loaded configuration schema: %{public}@", (uint8_t *)&v15, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        +[RMModelConfigurationSchema _loadDynamicSchemaFromDictionary:into:fileURL:](v10);
      }
      uint64_t v14 = [v10 configurationType];
      [v7 setObject:v10 forKeyedSubscript:v14];
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[RMModelConfigurationSchema _loadDynamicSchemaFromDictionary:into:fileURL:]((uint64_t)v8);
  }
}

- (id)_parseAssetReferences:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      id v16 = v3;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v11 = [v10 objectForKeyedSubscript:@"asset-types"];
          id v12 = [v10 objectForKeyedSubscript:@"key-path"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[RMModelConfigurationSchema _parseAssetReferences:]();
            }

            uint64_t v14 = (void *)MEMORY[0x263EFFA68];
            id v3 = v16;
            goto LABEL_18;
          }
          id v13 = [[RMModelConfigurationSchemaAssetReference alloc] initWithAssetTypes:v11 keyPath:v12];
          [v4 addObject:v13];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        id v3 = v16;
        if (v7) {
          continue;
        }
        break;
      }
    }

    uint64_t v14 = (void *)[v4 copy];
LABEL_18:
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RMModelConfigurationSchema _parseAssetReferences:]();
    }
    uint64_t v14 = (void *)MEMORY[0x263EFFA68];
  }

  return v14;
}

- (NSNumber)version
{
  return self->_version;
}

- (NSString)configurationType
{
  return self->_configurationType;
}

- (void)setConfigurationType:(id)a3
{
}

- (NSArray)assetReferences
{
  return self->_assetReferences;
}

- (void)setAssetReferences:(id)a3
{
}

- (NSDictionary)supportedOS
{
  return self->_supportedOS;
}

- (void)setSupportedOS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedOS, 0);
  objc_storeStrong((id *)&self->_assetReferences, 0);
  objc_storeStrong((id *)&self->_configurationType, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

+ (void)_loadDynamicSchemaFromFile:(uint64_t)a1 into:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_25AF84000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not read JSON data file: %{public}@ %{public}@", (uint8_t *)&v2, 0x16u);
}

+ (void)_loadDynamicSchemaFromDictionary:(uint64_t)a1 into:fileURL:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_25AF84000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not read schema from JSON data file: %{public}@", (uint8_t *)&v1, 0xCu);
}

+ (void)_loadDynamicSchemaFromDictionary:(void *)a1 into:fileURL:.cold.2(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = [a1 configurationType];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_25AF84000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Read schema for '%{public}@' from JSON data file: %{public}@", v2, 0x16u);
}

+ (void)_loadDynamicSchemaFromDictionary:(void *)a1 into:fileURL:.cold.3(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = [a1 configurationType];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_25AF84000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Ignoring duplicate schema for '%{public}@' from JSON data file: %{public}@", v2, 0x16u);
}

- (void)_parseAssetReferences:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_25AF84000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Invalid asset-references", v0, 2u);
}

- (void)_parseAssetReferences:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_25AF84000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Missing asset-references", v0, 2u);
}

@end