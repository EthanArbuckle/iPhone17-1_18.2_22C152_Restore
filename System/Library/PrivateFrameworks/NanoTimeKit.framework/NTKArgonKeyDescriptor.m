@interface NTKArgonKeyDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)keyDescriptorFromBundle:(id)a3;
+ (id)unfilteredKeyDescriptorFromBundle:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)argon_JSONRepresentation;
- (NSString)description;
- (NSString)fileName;
- (NSString)key;
- (NTKArgonKeyDescriptor)initWithCoder:(id)a3;
- (NTKArgonKeyDescriptor)initWithKey:(id)a3 fileName:(id)a4;
- (id)argon_initWithJSONRepresentation:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKArgonKeyDescriptor

- (NTKArgonKeyDescriptor)initWithKey:(id)a3 fileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    v16.receiver = self;
    v16.super_class = (Class)NTKArgonKeyDescriptor;
    v8 = [(NTKArgonKeyDescriptor *)&v16 init];
    if (v8)
    {
      uint64_t v9 = [v6 copy];
      key = v8->_key;
      v8->_key = (NSString *)v9;

      uint64_t v11 = [v7 copy];
      fileName = v8->_fileName;
      v8->_fileName = (NSString *)v11;
    }
    self = v8;
    v13 = self;
  }
  else
  {
    v14 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[NTKArgonKeyDescriptor initWithKey:fileName:]();
    }

    v13 = 0;
  }

  return v13;
}

+ (id)keyDescriptorFromBundle:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 bundlePath],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 pathComponents],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 containsObject:@"AppleInternal"],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    uint64_t v9 = [a1 unfilteredKeyDescriptorFromBundle:v5];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)unfilteredKeyDescriptorFromBundle:(id)a3
{
  if (a3)
  {
    v3 = [a3 infoDictionary];
    id v4 = [v3 objectForKey:@"Argon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 objectForKey:@"FileName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = [v4 objectForKey:@"Key"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v7 = [[NTKArgonKeyDescriptor alloc] initWithKey:v6 fileName:v5];
        }
        else {
          id v7 = 0;
        }
      }
      else
      {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (unint64_t)hash
{
  v3 = [(NTKArgonKeyDescriptor *)self key];
  uint64_t v4 = [v3 hash];
  v5 = [(NTKArgonKeyDescriptor *)self fileName];
  unint64_t v6 = v4 ^ (4 * [v5 hash]);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(NTKArgonKeyDescriptor *)self key];
    unint64_t v6 = [v4 key];
    if (v5 == v6 || [v5 isEqual:v6])
    {
      id v7 = [(NTKArgonKeyDescriptor *)self fileName];
      char v8 = [v4 fileName];
      if (v7 == v8) {
        char v9 = 1;
      }
      else {
        char v9 = [v7 isEqual:v8];
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(NTKArgonKeyDescriptor *)self key];
  id v7 = [(NTKArgonKeyDescriptor *)self fileName];
  char v8 = [v3 stringWithFormat:@"<%@: %p, %@ | %@>", v5, self, v6, v7];

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NTKArgonKeyDescriptor *)self key];
  [v4 encodeObject:v5 forKey:@"key"];

  id v6 = [(NTKArgonKeyDescriptor *)self fileName];
  [v4 encodeObject:v6 forKey:@"fileName"];
}

- (NTKArgonKeyDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileName"];

  id v7 = [(NTKArgonKeyDescriptor *)self initWithKey:v5 fileName:v6];
  return v7;
}

- (NSDictionary)argon_JSONRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(NTKArgonKeyDescriptor *)self key];
  v5 = v4;
  if (v4)
  {
    id v6 = (void *)[v4 copy];
    [v3 setObject:v6 forKeyedSubscript:@"k"];
  }
  id v7 = [(NTKArgonKeyDescriptor *)self fileName];
  char v8 = v7;
  if (v7)
  {
    char v9 = (void *)[v7 copy];
    [v3 setObject:v9 forKeyedSubscript:@"n"];
  }
  v10 = (void *)[v3 copy];

  return (NSDictionary *)v10;
}

- (id)argon_initWithJSONRepresentation:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__NTKArgonKeyDescriptor_argon_initWithJSONRepresentation___block_invoke;
  aBlock[3] = &unk_1E62C4D18;
  id v13 = v4;
  id v5 = v4;
  id v6 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  id v7 = v6[2](v6, @"k");
  char v8 = v6[2](v6, @"n");
  if ([v7 length] && objc_msgSend(v8, "length"))
  {
    char v9 = [(NTKArgonKeyDescriptor *)self initWithKey:v7 fileName:v8];
  }
  else
  {
    v10 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[NTKArgonKeyDescriptor argon_initWithJSONRepresentation:]();
    }

    char v9 = 0;
  }

  return v9;
}

id __58__NTKArgonKeyDescriptor_argon_initWithJSONRepresentation___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)initWithKey:fileName:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_10(&dword_1BC5A9000, v0, v1, "Key descriptor values %@ / %@ invalid");
}

- (void)argon_initWithJSONRepresentation:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_10(&dword_1BC5A9000, v0, v1, "JSON init values %@ / %@ invalid");
}

@end