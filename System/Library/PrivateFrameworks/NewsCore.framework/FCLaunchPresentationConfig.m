@interface FCLaunchPresentationConfig
- (FCLaunchPresentationConfig)initWithConfigDictionary:(id)a3;
- (NSArray)presentationOperations;
- (double)presentationRequirementTimeout;
- (int64_t)configVersion;
- (void)setConfigVersion:(int64_t)a3;
- (void)setPresentationOperations:(id)a3;
- (void)setPresentationRequirementTimeout:(double)a3;
@end

@implementation FCLaunchPresentationConfig

- (FCLaunchPresentationConfig)initWithConfigDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FCLaunchPresentationConfig;
  v5 = [(FCLaunchPresentationConfig *)&v23 init];
  if (v5)
  {
    v5->_configVersion = FCAppConfigurationIntegerValue(v4, @"configVersion", 0);
    v5->_presentationRequirementTimeout = FCAppConfigurationDoubleValue(v4, @"presentationRequirementTimeout", 5.0);
    v6 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"presentationOperations", 0);
    v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
          v14 = [FCPresentationOperation alloc];
          v15 = -[FCPresentationOperation initWithConfigDictionary:](v14, "initWithConfigDictionary:", v13, (void)v19);
          [v7 addObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];
    presentationOperations = v5->_presentationOperations;
    v5->_presentationOperations = (NSArray *)v16;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (int64_t)configVersion
{
  return self->_configVersion;
}

- (void)setConfigVersion:(int64_t)a3
{
  self->_configVersion = a3;
}

- (double)presentationRequirementTimeout
{
  return self->_presentationRequirementTimeout;
}

- (void)setPresentationRequirementTimeout:(double)a3
{
  self->_presentationRequirementTimeout = a3;
}

- (NSArray)presentationOperations
{
  return self->_presentationOperations;
}

- (void)setPresentationOperations:(id)a3
{
}

@end