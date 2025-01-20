@interface VUIFeatureFlag
- (BOOL)_enabledFromDefaults;
- (BOOL)enabled;
- (BOOL)isAvailableForOS;
- (BOOL)isEnabledByDefault;
- (NSString)defaultsDomain;
- (NSString)defaultsKey;
- (NSString)featureDescription;
- (NSString)featureName;
- (NSString)isEnabledByDefaultKey;
- (VUIFeatureFlag)initWithFeatureDict:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIsEnabledByDefaultKey:(id)a3;
@end

@implementation VUIFeatureFlag

- (VUIFeatureFlag)initWithFeatureDict:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VUIFeatureFlag;
  v5 = [(VUIFeatureFlag *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"defaultsKey"];
    defaultsKey = v5->_defaultsKey;
    v5->_defaultsKey = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:@"featureName"];
    featureName = v5->_featureName;
    v5->_featureName = (NSString *)v8;

    v10 = [v4 objectForKey:@"featureDescription"];
    v11 = v10;
    v12 = v10 ? v10 : &stru_1F3DEFD80;
    objc_storeStrong((id *)&v5->_featureDescription, v12);

    v13 = [v4 objectForKey:@"isEnabledByDefault"];
    v5->_isEnabledByDefault = [v13 BOOLValue];

    uint64_t v14 = [NSString stringWithFormat:@"%@_ebd", v5->_defaultsKey];
    isEnabledByDefaultKey = v5->_isEnabledByDefaultKey;
    v5->_isEnabledByDefaultKey = (NSString *)v14;

    v16 = [v4 objectForKey:@"isIOS"];
    v5->_isAvailableForOS = [v16 intValue] != 0;

    if (v5->_isAvailableForOS)
    {
      v17 = [v4 objectForKey:@"iOSDefaultsDomain"];
      v18 = v17;
      if (v17)
      {
        v19 = v17;
      }
      else
      {
        v19 = [v4 objectForKey:@"defaultsDomain"];
      }
      defaultsDomain = v5->_defaultsDomain;
      v5->_defaultsDomain = v19;

      if (!v5->_defaultsDomain)
      {
        v5->_defaultsDomain = (NSString *)@"com.apple.tv";
      }
    }
  }

  return v5;
}

- (BOOL)enabled
{
  if (self->_isAvailableForOS)
  {
    if (!self->_isEnabledByDefault) {
      goto LABEL_4;
    }
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v4 = [(VUIFeatureFlag *)self isEnabledByDefaultKey];
    v5 = [v3 objectForKey:v4];

    if (!v5)
    {
      v7 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v8 = [v7 bundleIdentifier];
      v9 = [(VUIFeatureFlag *)self defaultsDomain];
      int v10 = [v8 isEqualToString:v9];

      v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      if (v10)
      {
        v12 = [(VUIFeatureFlag *)self defaultsKey];
        [v11 removeObjectForKey:v12];
      }
      else
      {
        uint64_t v13 = [(VUIFeatureFlag *)self defaultsDomain];
        v12 = (void *)[v11 initWithSuiteName:v13];
        uint64_t v14 = [(VUIFeatureFlag *)self defaultsKey];
        [v12 removeObjectForKey:v14];

        v11 = (void *)v13;
      }

      self->_enabled = 1;
      v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v16 = [(VUIFeatureFlag *)self isEnabledByDefaultKey];
      [v15 setObject:MEMORY[0x1E4F1CC38] forKey:v16];

      return self->_enabled;
    }
    else
    {
LABEL_4:
      BOOL result = [(VUIFeatureFlag *)self _enabledFromDefaults];
      self->_enabled = result;
    }
  }
  else
  {
    BOOL result = 0;
    self->_enabled = 0;
  }
  return result;
}

- (BOOL)_enabledFromDefaults
{
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 bundleIdentifier];
  v5 = [(VUIFeatureFlag *)self defaultsDomain];
  int v6 = [v4 isEqualToString:v5];

  v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (v6)
  {
    uint64_t v8 = [(VUIFeatureFlag *)self defaultsKey];
    v9 = [v7 objectForKey:v8];

    if (v9)
    {
      int v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v11 = [(VUIFeatureFlag *)self defaultsKey];
      char v12 = [v10 BOOLForKey:v11];

      return v12;
    }
  }
  else
  {
    uint64_t v14 = [(VUIFeatureFlag *)self defaultsDomain];
    v15 = (void *)[v7 initWithSuiteName:v14];
    v16 = [(VUIFeatureFlag *)self defaultsKey];
    v17 = [v15 objectForKey:v16];

    if (v17)
    {
      v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v19 = [(VUIFeatureFlag *)self defaultsDomain];
      v20 = (void *)[v18 initWithSuiteName:v19];
      v21 = [(VUIFeatureFlag *)self defaultsKey];
      char v22 = [v20 BOOLForKey:v21];

      return v22;
    }
  }
  return self->_isEnabledByDefault;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  if (self->_isAvailableForOS)
  {
    BOOL v3 = a3;
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    int v6 = [v5 bundleIdentifier];
    v7 = [(VUIFeatureFlag *)self defaultsDomain];
    int v8 = [v6 isEqualToString:v7];

    id v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    if (v8)
    {
      v9 = [NSNumber numberWithBool:v3];
      int v10 = [(VUIFeatureFlag *)self defaultsKey];
      [v13 setObject:v9 forKey:v10];
    }
    else
    {
      uint64_t v11 = [(VUIFeatureFlag *)self defaultsDomain];
      v9 = (void *)[v13 initWithSuiteName:v11];
      int v10 = [NSNumber numberWithBool:v3];
      char v12 = [(VUIFeatureFlag *)self defaultsKey];
      [v9 setObject:v10 forKey:v12];

      id v13 = (id)v11;
    }
  }
}

- (NSString)featureName
{
  return self->_featureName;
}

- (NSString)featureDescription
{
  return self->_featureDescription;
}

- (NSString)defaultsKey
{
  return self->_defaultsKey;
}

- (BOOL)isAvailableForOS
{
  return self->_isAvailableForOS;
}

- (BOOL)isEnabledByDefault
{
  return self->_isEnabledByDefault;
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (NSString)isEnabledByDefaultKey
{
  return self->_isEnabledByDefaultKey;
}

- (void)setIsEnabledByDefaultKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isEnabledByDefaultKey, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_defaultsKey, 0);
  objc_storeStrong((id *)&self->_featureDescription, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end