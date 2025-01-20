@interface FCNewsPlusLabelConfigGroup
- (FCNewsPlusLabelConfig)configForPaidBundleViaOffer;
- (FCNewsPlusLabelConfig)configForSubscribers;
- (FCNewsPlusLabelConfig)configForTrialists;
- (FCNewsPlusLabelConfigGroup)initWithConfigDictionary:(id)a3;
@end

@implementation FCNewsPlusLabelConfigGroup

- (FCNewsPlusLabelConfigGroup)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCNewsPlusLabelConfigGroup;
  v5 = [(FCNewsPlusLabelConfigGroup *)&v19 init];
  if (v5)
  {
    v6 = [FCNewsPlusLabelConfig alloc];
    v7 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"configForTrialists", 0);
    uint64_t v8 = [(FCNewsPlusLabelConfig *)v6 initWithConfigDictionary:v7];
    configForTrialists = v5->_configForTrialists;
    v5->_configForTrialists = (FCNewsPlusLabelConfig *)v8;

    v10 = [FCNewsPlusLabelConfig alloc];
    v11 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"configForSubscribers", 0);
    uint64_t v12 = [(FCNewsPlusLabelConfig *)v10 initWithConfigDictionary:v11];
    configForSubscribers = v5->_configForSubscribers;
    v5->_configForSubscribers = (FCNewsPlusLabelConfig *)v12;

    v14 = [FCNewsPlusLabelConfig alloc];
    v15 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"configForPaidBundleViaOffer", 0);
    uint64_t v16 = [(FCNewsPlusLabelConfig *)v14 initWithConfigDictionary:v15];
    configForPaidBundleViaOffer = v5->_configForPaidBundleViaOffer;
    v5->_configForPaidBundleViaOffer = (FCNewsPlusLabelConfig *)v16;
  }
  return v5;
}

- (FCNewsPlusLabelConfig)configForTrialists
{
  return self->_configForTrialists;
}

- (FCNewsPlusLabelConfig)configForSubscribers
{
  return self->_configForSubscribers;
}

- (FCNewsPlusLabelConfig)configForPaidBundleViaOffer
{
  return self->_configForPaidBundleViaOffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configForPaidBundleViaOffer, 0);
  objc_storeStrong((id *)&self->_configForSubscribers, 0);
  objc_storeStrong((id *)&self->_configForTrialists, 0);
}

@end