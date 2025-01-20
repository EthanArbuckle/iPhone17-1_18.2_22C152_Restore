@interface TGTextGenerationDecodingPolicy
+ (id)defaultDecodingPolicy;
- (BOOL)isEqual:(id)a3;
- (TGTextGenerationDecodingPolicy)initWithType:(unint64_t)a3;
- (id)description;
- (unint64_t)type;
@end

@implementation TGTextGenerationDecodingPolicy

+ (id)defaultDecodingPolicy
{
  v2 = [[TGTextGenerationDecodingPolicy alloc] initWithType:0];
  return v2;
}

- (TGTextGenerationDecodingPolicy)initWithType:(unint64_t)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)TGTextGenerationDecodingPolicy;
  v4 = [(TGTextGenerationDecodingPolicy *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v12 = @"type";
    if (a3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown decoding policy type: %d", a3);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = @"Greedy";
    }
    v13[0] = v6;
    v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v8 = [v7 description];
    description = v5->_description;
    v5->_description = (NSString *)v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    id v7 = v4;
    unint64_t v8 = [(TGTextGenerationDecodingPolicy *)self type];
    uint64_t v9 = [v7 type];

    BOOL v6 = v8 == v9;
  }

  return v6;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end