@interface SBSUserNotificationTextFieldDefinition
+ (id)_definitionsFromSerializedDefinitions:(id)a3;
- (BOOL)_hasSetMaxLength;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSecure;
- (NSString)title;
- (NSString)value;
- (SBSUserNotificationTextFieldDefinition)init;
- (id)_initWithDictionary:(id)a3;
- (id)build;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardType;
- (unint64_t)hash;
- (unint64_t)maxLength;
- (void)_copyPropertiesToDefinition:(id)a3;
@end

@implementation SBSUserNotificationTextFieldDefinition

- (SBSUserNotificationTextFieldDefinition)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBSUserNotificationTextFieldDefinition;
  v2 = [(SBSUserNotificationTextFieldDefinition *)&v7 init];
  v3 = v2;
  if (v2)
  {
    title = v2->_title;
    v2->_title = 0;

    value = v3->_value;
    v3->_value = 0;

    *(_WORD *)&v3->_isSecure = 0;
    v3->_maxLength = -1;
    v3->_keyboardType = 0;
    v3->_autocorrectionType = 0;
    v3->_autocapitalizationType = 2;
  }
  return v3;
}

- (id)_initWithDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBSCFUserNotificationTextFieldDefinition.m", 54, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(SBSUserNotificationTextFieldDefinition *)self init];
    if (v6)
    {
      uint64_t v7 = [v5 bs_safeStringForKey:@"_SBSTFTitle"];
      title = v6->_title;
      v6->_title = (NSString *)v7;

      uint64_t v9 = [v5 bs_safeStringForKey:@"_SBSTFValue"];
      value = v6->_value;
      v6->_value = (NSString *)v9;

      v6->_isSecure = [v5 bs_BOOLForKey:@"_SBSTFIsSecure"];
      v11 = [v5 objectForKey:@"_SBSTFMaxLength"];

      if (v11)
      {
        v6->_hasSetMaxLength = 1;
        v12 = [v5 bs_safeNumberForKey:@"_SBSTFMaxLength"];
        v6->_maxLength = [v12 unsignedIntValue];
      }
      v13 = [v5 objectForKey:@"_SBSTFKeyboardType"];

      if (v13)
      {
        v14 = [v5 bs_safeNumberForKey:@"_SBSTFKeyboardType"];
        v6->_keyboardType = (int)[v14 intValue];
      }
      v15 = [v5 objectForKey:@"_SBSTFAutocorrectionType"];

      if (v15)
      {
        v16 = [v5 bs_safeNumberForKey:@"_SBSTFAutocorrectionType"];
        v6->_autocorrectionType = (int)[v16 intValue];
      }
      v17 = [v5 objectForKey:@"_SBSTFAutocapitalizationType"];

      if (v17)
      {
        v18 = [v5 bs_safeNumberForKey:@"_SBSTFAutocapitalizationType"];
        v6->_autocapitalizationType = (int)[v18 intValue];
      }
    }
    self = v6;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)_definitionsFromSerializedDefinitions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [SBSUserNotificationTextFieldDefinition alloc];
        id v12 = -[SBSUserNotificationTextFieldDefinition _initWithDictionary:](v11, "_initWithDictionary:", v10, (void)v14);
        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)build
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_title forKeyedSubscript:@"_SBSTFTitle"];
  value = self->_value;
  if (value) {
    [v3 setObject:value forKeyedSubscript:@"_SBSTFValue"];
  }
  id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSecure];
  [v3 setObject:v5 forKeyedSubscript:@"_SBSTFIsSecure"];

  if (self->_hasSetMaxLength)
  {
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_maxLength];
    [v3 setObject:v6 forKeyedSubscript:@"_SBSTFMaxLength"];
  }
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_keyboardType];
  [v3 setObject:v7 forKeyedSubscript:@"_SBSTFKeyboardType"];

  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_autocapitalizationType];
  [v3 setObject:v8 forKeyedSubscript:@"_SBSTFAutocapitalizationType"];

  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_autocorrectionType];
  [v3 setObject:v9 forKeyedSubscript:@"_SBSTFAutocorrectionType"];

  uint64_t v10 = (void *)[v3 copy];
  return v10;
}

- (unint64_t)hash
{
  BOOL isSecure = self->_isSecure;
  NSUInteger v4 = [(NSString *)self->_title hash] + 13 * isSecure;
  return v4
       + [(NSString *)self->_value hash]
       + self->_maxLength
       + self->_keyboardType
       + 17 * self->_autocapitalizationType
       + 19 * self->_autocorrectionType;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SBSUserNotificationTextFieldDefinition *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (BSEqualBools()
        && self->_maxLength == v5->_maxLength
        && self->_keyboardType == v5->_keyboardType
        && self->_autocapitalizationType == v5->_autocapitalizationType
        && self->_autocorrectionType == v5->_autocorrectionType)
      {
        uint64_t v6 = [(SBSUserNotificationTextFieldDefinition *)v5 title];
        if (BSEqualObjects())
        {
          uint64_t v7 = [(SBSUserNotificationTextFieldDefinition *)v5 value];
          char v8 = BSEqualObjects();
        }
        else
        {
          char v8 = 0;
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (void)_copyPropertiesToDefinition:(id)a3
{
  objc_storeStrong((id *)a3 + 1, self->_title);
  id v5 = (id *)a3;
  objc_storeStrong(v5 + 2, self->_value);
  *((unsigned char *)v5 + 24) = self->_isSecure;
  *((unsigned char *)v5 + 25) = self->_hasSetMaxLength;
  v5[4] = self->_maxLength;
  v5[5] = self->_keyboardType;
  v5[6] = self->_autocorrectionType;
  v5[7] = self->_autocapitalizationType;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = objc_alloc_init(SBSMutableUserNotificationTextFieldDefinition);
  [(SBSUserNotificationTextFieldDefinition *)self _copyPropertiesToDefinition:v4];
  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)isSecure
{
  return self->_isSecure;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (int64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (BOOL)_hasSetMaxLength
{
  return self->_hasSetMaxLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end