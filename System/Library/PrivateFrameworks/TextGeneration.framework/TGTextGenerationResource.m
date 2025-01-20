@interface TGTextGenerationResource
+ (id)createWithResourceDict:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)e5FunctionName;
- (NSURL)url;
- (TGTextGenerationResource)initWithType:(unint64_t)a3 url:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setE5FunctionName:(id)a3;
@end

@implementation TGTextGenerationResource

+ (id)createWithResourceDict:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"path"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v3 objectForKeyedSubscript:@"path"];

    if (v5)
    {
      v6 = [v3 objectForKeyedSubscript:@"type"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [v3 objectForKeyedSubscript:@"type"];

        if (v7)
        {
          unsigned int v8 = [v7 intValue];
          uint64_t v9 = (int)v8;
          if (v8 < 2)
          {
            v10 = [v3 objectForKeyedSubscript:@"e5FunctionName"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v11 = [v3 objectForKeyedSubscript:@"e5FunctionName"];
            }
            else
            {
              v11 = 0;
            }

            if (v9 != 1 || v11)
            {
              v16 = [TGMutableTextGenerationResource alloc];
              v17 = [NSURL fileURLWithPath:v5];
              v12 = [(TGTextGenerationResource *)v16 initWithType:v9 url:v17];

              [(TGTextGenerationResource *)v12 setE5FunctionName:v11];
            }
            else
            {
              v15 = _nlpDefaultLog();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
                +[TGTextGenerationResource createWithResourceDict:]();
              }

              v12 = 0;
            }

            goto LABEL_16;
          }
          v14 = _nlpDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            +[TGTextGenerationResource createWithResourceDict:v14];
          }

LABEL_15:
          v12 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
      }
      v7 = _nlpDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[TGTextGenerationResource createWithResourceDict:]();
      }
      goto LABEL_15;
    }
  }
  else
  {
  }
  v5 = _nlpDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[TGTextGenerationResource createWithResourceDict:]();
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (TGTextGenerationResource)initWithType:(unint64_t)a3 url:(id)a4
{
  v19[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TGTextGenerationResource;
  v7 = [(TGTextGenerationResource *)&v17 init];
  unsigned int v8 = v7;
  if (v7)
  {
    v7->_unint64_t type = a3;
    uint64_t v9 = [v6 copy];
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    v18[0] = @"type";
    unint64_t type = v8->_type;
    if (type == 1)
    {
      v12 = @"Foundation Language Model";
    }
    else if (type)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown resource type: %d", v8->_type);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = @"Sentence Piece Tokenizer";
    }
    v18[1] = @"url";
    v19[0] = v12;
    v19[1] = v8->_url;
    v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    uint64_t v14 = [v13 description];
    description = v8->_description;
    v8->_description = (NSString *)v14;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [TGTextGenerationResource alloc];
  unint64_t v5 = [(TGTextGenerationResource *)self type];
  id v6 = [(TGTextGenerationResource *)self url];
  v7 = [(TGTextGenerationResource *)v4 initWithType:v5 url:v6];

  unsigned int v8 = [(TGTextGenerationResource *)self e5FunctionName];
  [(TGTextGenerationResource *)v7 setE5FunctionName:v8];

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [TGMutableTextGenerationResource alloc];
  unint64_t v5 = [(TGTextGenerationResource *)self type];
  id v6 = [(TGTextGenerationResource *)self url];
  v7 = [(TGTextGenerationResource *)v4 initWithType:v5 url:v6];

  unsigned int v8 = [(TGTextGenerationResource *)self e5FunctionName];
  [(TGTextGenerationResource *)v7 setE5FunctionName:v8];

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TGTextGenerationResource *)self type];
  v4 = [(TGTextGenerationResource *)self url];
  uint64_t v5 = [v4 hash] ^ v3;

  id v6 = [(TGTextGenerationResource *)self e5FunctionName];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6 && (unint64_t v7 = -[TGTextGenerationResource type](self, "type"), v7 == [v6 type]))
  {
    unsigned int v8 = [(TGTextGenerationResource *)self url];
    uint64_t v9 = [v6 url];
    if ([v8 isEqual:v9])
    {
      v10 = [(TGTextGenerationResource *)self e5FunctionName];
      v11 = [v6 e5FunctionName];
      char v12 = TGTextGenerationEqualAllowingNil(v10, v11);
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)e5FunctionName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setE5FunctionName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_e5FunctionName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

+ (void)createWithResourceDict:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25EB62000, v0, v1, "Missing path key: %@ in config dictionary: %@", v2, v3, v4, v5, 2u);
}

+ (void)createWithResourceDict:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25EB62000, v0, v1, "Missing type key: %@ in config dictionary: %@", v2, v3, v4, v5, 2u);
}

+ (void)createWithResourceDict:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25EB62000, v0, v1, "Missing E5 function name key: %@ in configuration: %@ for foundation model", v2, v3, v4, v5, 2u);
}

+ (void)createWithResourceDict:(os_log_t)log .cold.4(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_25EB62000, log, OS_LOG_TYPE_ERROR, "Invalid type: %d for resource type in config dictionary: %@", (uint8_t *)v3, 0x12u);
}

@end