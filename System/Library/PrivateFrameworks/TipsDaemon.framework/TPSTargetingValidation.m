@interface TPSTargetingValidation
- (BOOL)BOOLValue;
- (BOOL)ignoreCache;
- (NSDictionary)targetContext;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (TPSTargetingValidation)initWithTargetContext:(id)a3;
- (id)arrayValue;
- (id)key;
- (id)stringValue;
- (id)value;
- (int64_t)integerValue;
- (int64_t)joinType;
- (unint64_t)unsignedIntegerValue;
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIgnoreCache:(BOOL)a3;
- (void)setJoinType:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setTargetContext:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSTargetingValidation

- (void)setTargetContext:(id)a3
{
}

- (void)setJoinType:(int64_t)a3
{
  self->_joinType = a3;
}

- (BOOL)BOOLValue
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(TPSTargetingValidation *)self targetContext];
  uint64_t v4 = [v3 count];

  if (v4 != 1) {
    return 0;
  }
  v5 = [(TPSTargetingValidation *)self targetContext];
  v6 = [v5 allValues];
  v7 = [v6 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = [v7 BOOLValue];
  }
  else
  {
    v9 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [(TPSTargetingValidation *)self name];
      v11 = objc_opt_class();
      id v12 = v11;
      int v15 = 138413058;
      v16 = v10;
      __int16 v17 = 2112;
      v18 = v7;
      __int16 v19 = 2112;
      v20 = v11;
      __int16 v21 = 2112;
      id v22 = (id)objc_opt_class();
      id v13 = v22;
      _os_log_impl(&dword_1E4492000, v9, OS_LOG_TYPE_INFO, "[%@] Unexpected value: %@ with class: %@. Expected type: %@.", (uint8_t *)&v15, 0x2Au);
    }
    char v8 = 0;
  }

  return v8;
}

- (id)value
{
  v3 = [(TPSTargetingValidation *)self targetContext];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    v5 = [(TPSTargetingValidation *)self targetContext];
    v6 = [v5 allValues];
    v7 = [v6 firstObject];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDictionary)targetContext
{
  return self->_targetContext;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContext, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)name
{
  name = self->_name;
  if (name)
  {
    v3 = name;
  }
  else
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (TPSTargetingValidation)initWithTargetContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSTargetingValidation;
  v6 = [(TPSTargetingValidation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_targetContext, a3);
  }

  return v7;
}

- (unint64_t)unsignedIntegerValue
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(TPSTargetingValidation *)self targetContext];
  uint64_t v4 = [v3 count];

  if (v4 != 1) {
    return 0;
  }
  id v5 = [(TPSTargetingValidation *)self targetContext];
  v6 = [v5 allValues];
  v7 = [v6 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v8 = [v7 unsignedIntegerValue];
  }
  else
  {
    objc_super v9 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [(TPSTargetingValidation *)self name];
      v11 = objc_opt_class();
      id v12 = v11;
      int v15 = 138413058;
      v16 = v10;
      __int16 v17 = 2112;
      v18 = v7;
      __int16 v19 = 2112;
      v20 = v11;
      __int16 v21 = 2112;
      id v22 = (id)objc_opt_class();
      id v13 = v22;
      _os_log_impl(&dword_1E4492000, v9, OS_LOG_TYPE_INFO, "[%@] Unexpected value: %@ with class: %@. Expected type: %@.", (uint8_t *)&v15, 0x2Au);
    }
    unint64_t v8 = 0;
  }

  return v8;
}

- (id)key
{
  v3 = [(TPSTargetingValidation *)self targetContext];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    id v5 = [(TPSTargetingValidation *)self targetContext];
    v6 = [v5 allKeys];
    v7 = [v6 firstObject];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)integerValue
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(TPSTargetingValidation *)self targetContext];
  uint64_t v4 = [v3 count];

  if (v4 != 1) {
    return 0;
  }
  id v5 = [(TPSTargetingValidation *)self targetContext];
  v6 = [v5 allValues];
  v7 = [v6 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v8 = (int)[v7 intValue];
  }
  else
  {
    objc_super v9 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [(TPSTargetingValidation *)self name];
      v11 = objc_opt_class();
      id v12 = v11;
      int v15 = 138413058;
      v16 = v10;
      __int16 v17 = 2112;
      v18 = v7;
      __int16 v19 = 2112;
      v20 = v11;
      __int16 v21 = 2112;
      id v22 = (id)objc_opt_class();
      id v13 = v22;
      _os_log_impl(&dword_1E4492000, v9, OS_LOG_TYPE_INFO, "[%@] Unexpected value: %@ with class: %@. Expected type: %@.", (uint8_t *)&v15, 0x2Au);
    }
    int64_t v8 = 0;
  }

  return v8;
}

- (id)stringValue
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(TPSTargetingValidation *)self targetContext];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    id v5 = [(TPSTargetingValidation *)self targetContext];
    v6 = [v5 allValues];
    v7 = [v6 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v8 = [v7 stringValue];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4FAF480] targeting];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = [(TPSTargetingValidation *)self name];
        v11 = objc_opt_class();
        id v12 = v11;
        int v15 = 138413058;
        v16 = v10;
        __int16 v17 = 2112;
        v18 = v7;
        __int16 v19 = 2112;
        v20 = v11;
        __int16 v21 = 2112;
        id v22 = (id)objc_opt_class();
        id v13 = v22;
        _os_log_impl(&dword_1E4492000, v9, OS_LOG_TYPE_INFO, "[%@] Unexpected value: %@ with class: %@. Expected type: %@.", (uint8_t *)&v15, 0x2Au);
      }
      int64_t v8 = 0;
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (id)arrayValue
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [(TPSTargetingValidation *)self targetContext];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    id v5 = [(TPSTargetingValidation *)self targetContext];
    v6 = [v5 allValues];
    v7 = [v6 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
    }
    else
    {
      v11[0] = v7;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    }
    objc_super v9 = v8;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (void)validateWithCompletion:(id)a3
{
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA98];
  id v5 = a3;
  id v6 = [v4 null];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = [(TPSTargetingValidation *)self name];
  id v5 = [(TPSTargetingValidation *)self targetContext];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; targetContext = %@; ignoreCache: %d>",
    v4,
    self,
    v5,
  id v6 = [(TPSTargetingValidation *)self ignoreCache]);

  return (NSString *)v6;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (int64_t)joinType
{
  return self->_joinType;
}

- (BOOL)ignoreCache
{
  return self->_ignoreCache;
}

- (void)setIgnoreCache:(BOOL)a3
{
  self->_ignoreCache = a3;
}

@end