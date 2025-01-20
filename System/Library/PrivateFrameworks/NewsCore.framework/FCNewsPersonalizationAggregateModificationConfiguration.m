@interface FCNewsPersonalizationAggregateModificationConfiguration
- (FCNewsPersonalizationAggregateModificationConfiguration)initWithDictionary:(id)a3;
- (FCNewsPersonalizationAggregateModificationData)aggregateModificationData;
- (FCNewsPersonalizationAggregateModificationData)baselineModificationData;
- (id)description;
- (void)setAggregateModificationData:(id)a3;
- (void)setBaselineModificationData:(id)a3;
@end

@implementation FCNewsPersonalizationAggregateModificationConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateModificationData, 0);
  objc_storeStrong((id *)&self->_baselineModificationData, 0);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FCNewsPersonalizationAggregateModificationConfiguration;
  v5 = [(FCNewsPersonalizationAggregateModificationConfiguration *)&v17 init];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"baselineModificationData", 0);
  v7 = [[FCNewsPersonalizationAggregateModificationData alloc] initWithDictionary:v6];
  if (!v7)
  {
LABEL_7:

    v15 = 0;
    goto LABEL_8;
  }
  v8 = v7;
  v9 = v7;
  v10 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"aggregateModificationData", 0);
  v11 = [[FCNewsPersonalizationAggregateModificationData alloc] initWithDictionary:v10];
  v12 = v11;
  if (!v11)
  {

    goto LABEL_7;
  }
  v13 = v11;
  objc_storeStrong((id *)&v5->_baselineModificationData, v8);
  aggregateModificationData = v5->_aggregateModificationData;
  v5->_aggregateModificationData = v13;

LABEL_5:
  v15 = v5;
LABEL_8:

  return v15;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsPersonalizationAggregateModificationConfiguration *)self baselineModificationData];
  [v3 appendFormat:@"; baselineModificationData: %@", v4];

  v5 = [(FCNewsPersonalizationAggregateModificationConfiguration *)self aggregateModificationData];
  [v3 appendFormat:@"; aggregateModificationData: %@", v5];

  [v3 appendString:@">"];
  return v3;
}

- (FCNewsPersonalizationAggregateModificationData)baselineModificationData
{
  return self->_baselineModificationData;
}

- (void)setBaselineModificationData:(id)a3
{
}

- (FCNewsPersonalizationAggregateModificationData)aggregateModificationData
{
  return self->_aggregateModificationData;
}

- (void)setAggregateModificationData:(id)a3
{
}

@end