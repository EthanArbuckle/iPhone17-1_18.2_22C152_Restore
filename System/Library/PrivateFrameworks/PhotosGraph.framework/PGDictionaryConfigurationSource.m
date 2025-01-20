@interface PGDictionaryConfigurationSource
- (NSDictionary)configurationData;
- (PGDictionaryConfigurationSource)initWithDictionary:(id)a3;
- (id)objectForKey:(id)a3;
- (void)setConfigurationData:(id)a3;
@end

@implementation PGDictionaryConfigurationSource

- (void).cxx_destruct
{
}

- (void)setConfigurationData:(id)a3
{
}

- (NSDictionary)configurationData
{
  return self->_configurationData;
}

- (id)objectForKey:(id)a3
{
  return [(NSDictionary *)self->_configurationData objectForKeyedSubscript:a3];
}

- (PGDictionaryConfigurationSource)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGDictionaryConfigurationSource;
  v6 = [(PGDictionaryConfigurationSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configurationData, a3);
  }

  return v7;
}

@end