@interface RMModelStatusSchema
+ (NSDictionary)schemas;
+ (void)_loadDynamicSchemaFromDictionary:(id)a3 into:(id)a4 fileURL:(id)a5;
+ (void)_loadDynamicSchemaFromDirectory:(id)a3 into:(id)a4;
+ (void)_loadDynamicSchemaFromFile:(id)a3 into:(id)a4;
+ (void)loadDynamicSchemaFromDirectory:(id)a3;
+ (void)loadDynamicSchemaFromFiles:(id)a3;
- (BOOL)isArrayValue;
- (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4;
- (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4 enrollmentType:(int64_t)a5;
- (NSDictionary)supportedOS;
- (NSNumber)version;
- (NSString)statusType;
- (id)initFromDictionary:(id)a3;
- (void)setIsArrayValue:(BOOL)a3;
- (void)setStatusType:(id)a3;
- (void)setSupportedOS:(id)a3;
@end

@implementation RMModelStatusSchema

+ (NSDictionary)schemas
{
  return (NSDictionary *)(id)_schemas_0;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RMModelStatusSchema;
  v5 = [(RMModelStatusSchema *)&v14 init];
  if (!v5)
  {
LABEL_15:
    v12 = v5;
    goto LABEL_16;
  }
  v6 = [v4 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 intValue] != 1) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v5->_version, v6);
  v7 = [v4 objectForKeyedSubscript:@"status-type"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_9:
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v5->_statusType, v7);
  v8 = [v4 objectForKeyedSubscript:@"array-value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5->_isArrayValue = [v8 BOOLValue];
    v9 = [v4 objectForKeyedSubscript:@"supported-os"];
    v10 = +[RMModelSchemaParser loadSupportedOSFromDictionary:v9];

    if (v10)
    {
      objc_storeStrong((id *)&v5->_supportedOS, v10);
      int v11 = 0;
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 1;
  }

  if (!v11) {
    goto LABEL_15;
  }
LABEL_10:
  v12 = 0;
LABEL_16:

  return v12;
}

- (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4
{
  v6 = [(RMModelStatusSchema *)self supportedOS];
  LOBYTE(a4) = +[RMModelPayloadUtilities isSupportedForPlatform:a3 scope:a4 supportedOS:v6];

  return a4;
}

- (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4 enrollmentType:(int64_t)a5
{
  v8 = [(RMModelStatusSchema *)self supportedOS];
  LOBYTE(a5) = +[RMModelPayloadUtilities isSupportedForPlatform:a3 scope:a4 enrollmentType:a5 supportedOS:v8];

  return a5;
}

+ (void)loadDynamicSchemaFromDirectory:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_opt_new();
  [a1 _loadDynamicSchemaFromDirectory:v4 into:v7];

  uint64_t v5 = [v7 copy];
  v6 = (void *)_schemas_0;
  _schemas_0 = v5;
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
  v12 = (void *)_schemas_0;
  _schemas_0 = v11;
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
        v17 = [v16 pathExtension];
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
  id v10 = [[RMModelStatusSchema alloc] initFromDictionary:v9];

  if (v10)
  {
    id v11 = [v10 statusType];
    id v12 = [v7 objectForKeyedSubscript:v11];

    if (v12)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[RMModelStatusSchema _loadDynamicSchemaFromDictionary:into:fileURL:](v10);
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v10 statusType];
        int v15 = 138543362;
        long long v16 = v13;
        _os_log_impl(&dword_25AF84000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Loaded status item schema: %{public}@", (uint8_t *)&v15, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        +[RMModelStatusSchema _loadDynamicSchemaFromDictionary:into:fileURL:](v10);
      }
      uint64_t v14 = [v10 statusType];
      [v7 setObject:v10 forKeyedSubscript:v14];
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[RMModelConfigurationSchema _loadDynamicSchemaFromDictionary:into:fileURL:]((uint64_t)v8);
  }
}

- (NSNumber)version
{
  return self->_version;
}

- (NSString)statusType
{
  return self->_statusType;
}

- (void)setStatusType:(id)a3
{
}

- (BOOL)isArrayValue
{
  return self->_isArrayValue;
}

- (void)setIsArrayValue:(BOOL)a3
{
  self->_isArrayValue = a3;
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
  objc_storeStrong((id *)&self->_statusType, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

+ (void)_loadDynamicSchemaFromDictionary:(void *)a1 into:fileURL:.cold.2(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v1 = [a1 statusType];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_25AF84000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Read schema for '%{public}@' from JSON data file: %{public}@", v2, 0x16u);
}

+ (void)_loadDynamicSchemaFromDictionary:(void *)a1 into:fileURL:.cold.3(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v1 = [a1 statusType];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_25AF84000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Ignoring duplicate schema for '%{public}@' from JSON data file: %{public}@", v2, 0x16u);
}

@end