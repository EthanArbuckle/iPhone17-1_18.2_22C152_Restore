@interface ATXCustomIntentDescription
+ (BOOL)supportsSecureCoding;
- (ATXCustomIntentDescription)initWithCoder:(id)a3;
- (ATXCustomIntentDescription)initWithTypeName:(id)a3 parameters:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)parameters;
- (NSString)typeName;
- (id)createIntent;
- (id)description;
- (unint64_t)hash;
- (void)createIntent;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXCustomIntentDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXCustomIntentDescription)initWithTypeName:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXCustomIntentDescription;
  v8 = [(ATXCustomIntentDescription *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    typeName = v8->_typeName;
    v8->_typeName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    parameters = v8->_parameters;
    v8->_parameters = (NSDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

- (ATXCustomIntentDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typeName"];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1B3E6F520]();
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"parameters"];

    self = [(ATXCustomIntentDescription *)self initWithTypeName:v5 parameters:v13];
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  typeName = self->_typeName;
  id v5 = a3;
  [v5 encodeObject:typeName forKey:@"typeName"];
  [v5 encodeObject:self->_parameters forKey:@"parameters"];
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"Intent Type: %@ Parameters: %@", self->_typeName, self->_parameters];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXCustomIntentDescription *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      typeName = self->_typeName;
      id v7 = v5->_typeName;
      if (typeName == v7)
      {
      }
      else
      {
        uint64_t v8 = v7;
        uint64_t v9 = typeName;
        char v10 = [(NSString *)v9 isEqual:v8];

        if ((v10 & 1) == 0)
        {
          char v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      v12 = self->_parameters;
      v13 = v12;
      if (v12 == v5->_parameters) {
        char v11 = 1;
      }
      else {
        char v11 = -[NSDictionary isEqual:](v12, "isEqual:");
      }

      goto LABEL_13;
    }
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_typeName hash];
  return [(NSDictionary *)self->_parameters hash] - v3 + 32 * v3;
}

- (id)createIntent
{
  v17[1] = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = (void *)MEMORY[0x1B3E6F520](self, a2);
  id v4 = [(id)*MEMORY[0x1E4F30890] stringByAppendingString:self->_typeName];
  id v5 = (void *)MEMORY[0x1E4F28D90];
  parameters = self->_parameters;
  v16 = @"parameters";
  v17[0] = parameters;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v15 = 0;
  uint64_t v8 = [v5 dataWithJSONObject:v7 options:1 error:&v15];
  id v9 = v15;

  if (v8)
  {
    char v10 = objc_msgSend(MEMORY[0x1E4F304D0], "atx_createIntentWithIntentType:intentData:", v4, v8);
    char v11 = v10;
    if (v10)
    {
      char v11 = v10;
      v12 = v11;
    }
    else
    {
      v13 = __atxlog_handle_default();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(ATXCustomIntentDescription *)(uint64_t)v4 createIntent];
      }

      v12 = 0;
    }
  }
  else
  {
    char v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(ATXCustomIntentDescription *)(uint64_t)v4 createIntent];
    }
    v12 = 0;
  }

  return v12;
}

- (NSString)typeName
{
  return self->_typeName;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
}

- (void)createIntent
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_ERROR, "Could not make intent of type: %@", (uint8_t *)&v2, 0xCu);
}

@end