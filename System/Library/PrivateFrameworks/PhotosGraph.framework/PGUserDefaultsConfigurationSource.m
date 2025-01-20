@interface PGUserDefaultsConfigurationSource
- (NSUserDefaults)userDefaults;
- (PGUserDefaultsConfigurationSource)initWithUserDefaults:(id)a3;
- (id)objectForKey:(id)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation PGUserDefaultsConfigurationSource

- (void).cxx_destruct
{
}

- (void)setUserDefaults:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (id)objectForKey:(id)a3
{
  return [(NSUserDefaults *)self->_userDefaults objectForKey:a3];
}

- (PGUserDefaultsConfigurationSource)initWithUserDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGUserDefaultsConfigurationSource;
  v6 = [(PGUserDefaultsConfigurationSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
  }

  return v7;
}

@end