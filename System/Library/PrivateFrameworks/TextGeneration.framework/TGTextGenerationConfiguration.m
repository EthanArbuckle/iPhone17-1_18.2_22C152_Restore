@interface TGTextGenerationConfiguration
+ (NSUUID)defaultConfigurationUUID;
+ (id)createWithUUID:(id)a3;
+ (id)defaultConfiguration;
+ (void)defaultConfiguration;
- (BOOL)isEqual:(id)a3;
- (NSSet)resources;
- (NSUUID)uuid;
- (TGITextGenerationInferenceModelConfiguration)modelConfiguration;
- (TGTextGenerationConfiguration)initWithUUID:(id)a3 resources:(id)a4 decodingPolicy:(id)a5;
- (TGTextGenerationDecodingPolicy)decodingPolicy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setDecodingPolicy:(id)a3;
@end

@implementation TGTextGenerationConfiguration

+ (NSUUID)defaultConfigurationUUID
{
  if (+[TGTextGenerationConfiguration defaultConfigurationUUID]::onceToken != -1) {
    dispatch_once(&+[TGTextGenerationConfiguration defaultConfigurationUUID]::onceToken, &__block_literal_global_1);
  }
  v2 = (void *)+[TGTextGenerationConfiguration defaultConfigurationUUID]::uuid;
  return (NSUUID *)v2;
}

uint64_t __57__TGTextGenerationConfiguration_defaultConfigurationUUID__block_invoke()
{
  +[TGTextGenerationConfiguration defaultConfigurationUUID]::uuid = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"45B6920D-B93B-4A91-815B-874312410EFB"];
  return MEMORY[0x270F9A758]();
}

+ (id)defaultConfiguration
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v50 = [MEMORY[0x263EFF9C0] set];
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 URLForResource:@"Configuration" withExtension:@"plist"];
  if (v3)
  {
    v4 = [NSDictionary dictionaryWithContentsOfURL:v3];
    if (v4)
    {
      v49 = +[TGTextGenerationConfiguration defaultConfigurationUUID];
      v5 = [v49 UUIDString];
      uint64_t v6 = [v4 objectForKey:v5];

      v46 = (void *)v6;
      if (v49)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v7 = (void *)v6;
        }
        else {
          v7 = 0;
        }
        v8 = v7;
        v47 = v8;
        if (v8)
        {
          v9 = [v8 objectForKeyedSubscript:@"resources", v6];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v10 = [v47 objectForKeyedSubscript:@"resources"];
          }
          else
          {
            v10 = 0;
          }

          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          obj = v10;
          uint64_t v27 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
          if (v27)
          {
            uint64_t v28 = *(void *)v52;
LABEL_25:
            uint64_t v29 = 0;
            while (1)
            {
              if (*(void *)v52 != v28) {
                objc_enumerationMutation(obj);
              }
              uint64_t v30 = *(void *)(*((void *)&v51 + 1) + 8 * v29);
              objc_opt_class();
              v31 = (objc_opt_isKindOfClass() & 1) != 0 ? (void *)v30 : 0;
              v32 = v31;
              if (!v32) {
                break;
              }
              v33 = v32;
              v34 = +[TGTextGenerationResource createWithResourceDict:v32];
              if (!v34)
              {
                v38 = _nlpDefaultLog();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                  +[TGTextGenerationConfiguration defaultConfiguration];
                }

LABEL_41:
                v17 = 0;
                v36 = obj;
                goto LABEL_42;
              }
              [v50 addObject:v34];

              if (v27 == ++v29)
              {
                uint64_t v27 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
                if (v27) {
                  goto LABEL_25;
                }
                goto LABEL_35;
              }
            }
            v33 = _nlpDefaultLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              uint64_t v37 = objc_opt_class();
              +[TGTextGenerationConfiguration defaultConfiguration];
            }
            goto LABEL_41;
          }
LABEL_35:

          v35 = [TGTextGenerationConfiguration alloc];
          v36 = +[TGTextGenerationConfiguration defaultConfigurationUUID];
          v33 = +[TGTextGenerationDecodingPolicy defaultDecodingPolicy];
          v17 = [(TGTextGenerationConfiguration *)v35 initWithUUID:v36 resources:v50 decodingPolicy:v33];
LABEL_42:
        }
        else
        {
          obj = _nlpDefaultLog();
          if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
          {
            uint64_t v26 = objc_opt_class();
            +[TGTextGenerationConfiguration defaultConfiguration];
          }
          v17 = 0;
        }
      }
      else
      {
        v25 = _nlpDefaultLog();
        v47 = v25;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          +[TGTextGenerationConfiguration defaultConfiguration];
        }
        v17 = 0;
      }
    }
    else
    {
      v18 = _nlpDefaultLog();
      v49 = v18;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[TGTextGenerationConfiguration defaultConfiguration];
      }
      v17 = 0;
    }
  }
  else
  {
    v4 = _nlpDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[TGTextGenerationConfiguration defaultConfiguration];
    }
    v17 = 0;
  }

  return v17;
}

+ (id)createWithUUID:(id)a3
{
  return 0;
}

- (TGTextGenerationConfiguration)initWithUUID:(id)a3 resources:(id)a4 decodingPolicy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TGTextGenerationConfiguration;
  uint64_t v11 = [(TGTextGenerationConfiguration *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    resources = v11->_resources;
    v11->_resources = (NSSet *)v14;

    uint64_t v16 = [v10 copy];
    decodingPolicy = v11->_decodingPolicy;
    v11->_decodingPolicy = (TGTextGenerationDecodingPolicy *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [TGTextGenerationConfiguration alloc];
  v5 = [(TGTextGenerationConfiguration *)self uuid];
  uint64_t v6 = [(TGTextGenerationConfiguration *)self resources];
  v7 = [(TGTextGenerationConfiguration *)self decodingPolicy];
  id v8 = [(TGTextGenerationConfiguration *)v4 initWithUUID:v5 resources:v6 decodingPolicy:v7];

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [TGMutableTextGenerationConfiguration alloc];
  v5 = [(TGTextGenerationConfiguration *)self uuid];
  uint64_t v6 = [(TGTextGenerationConfiguration *)self resources];
  v7 = [(TGTextGenerationConfiguration *)self decodingPolicy];
  id v8 = [(TGTextGenerationConfiguration *)v4 initWithUUID:v5 resources:v6 decodingPolicy:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(TGTextGenerationConfiguration *)self uuid];
    id v8 = [v6 uuid];
    if ([v7 isEqual:v8])
    {
      id v9 = [(TGTextGenerationConfiguration *)self resources];
      id v10 = [v6 resources];
      if ([v9 isEqualToSet:v10])
      {
        uint64_t v11 = [(TGTextGenerationConfiguration *)self decodingPolicy];
        uint64_t v12 = [v6 decodingPolicy];
        char v13 = [v11 isEqual:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(TGTextGenerationConfiguration *)self uuid];
  [v3 hash];

  id v4 = [(TGTextGenerationConfiguration *)self resources];
  [v4 hash];

  v5 = [(TGTextGenerationConfiguration *)self decodingPolicy];
  unint64_t v6 = [v5 hash];

  return v6;
}

- (id)description
{
  v10[3] = *MEMORY[0x263EF8340];
  v9[0] = @"uuid";
  v3 = [(TGTextGenerationConfiguration *)self uuid];
  v10[0] = v3;
  v9[1] = @"resources";
  id v4 = [(TGTextGenerationConfiguration *)self resources];
  v10[1] = v4;
  v9[2] = @"decodingPolicy";
  v5 = [(TGTextGenerationConfiguration *)self decodingPolicy];
  v10[2] = v5;
  unint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  v7 = [v6 description];

  return v7;
}

- (TGITextGenerationInferenceModelConfiguration)modelConfiguration
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *((void *)&retstr[1].var0.var0.var0.var0.var1 + 2) = 0;
  *(_OWORD *)&retstr->var0.var0.var1.var0[1] = 0u;
  *(_OWORD *)retstr[1].var0.var0.var0.var0.var0.var0 = 0u;
  *(_OWORD *)retstr->var0.var0.var0.var0.var0.var0 = 0u;
  *((_OWORD *)&retstr->var0.var0.var0.var0.var1 + 1) = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = objc_msgSend(v1, "resources", 0);
  unint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v16;
    for (uint64_t i = *(void *)v16; ; uint64_t i = *(void *)v16)
    {
      if (i != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v15 + 1) + 8 * v5);
      if ([v8 type] == 1)
      {
        id v9 = [v8 url];
        id v10 = [v9 path];
        std::string::__assign_external((std::string *)retstr, (const std::string::value_type *)[v10 UTF8String]);

        id v11 = [v8 e5FunctionName];
        std::string::__assign_external((std::string *)&retstr[1], (const std::string::value_type *)[v11 UTF8String]);
      }
      if (![v8 type])
      {
        uint64_t v12 = [v8 url];
        id v13 = [v12 path];
        std::string::__assign_external((std::string *)&retstr->var0.var0.var1, (const std::string::value_type *)[v13 UTF8String]);
      }
      if (++v5 >= v4)
      {
        unint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (!v4) {
          break;
        }
        uint64_t v5 = 0;
      }
    }
  }

  return result;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (TGTextGenerationDecodingPolicy)decodingPolicy
{
  return (TGTextGenerationDecodingPolicy *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDecodingPolicy:(id)a3
{
}

- (NSSet)resources
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_decodingPolicy, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (void)defaultConfiguration
{
}

@end