@interface FCStatelessPersonalizationConfiguration
- (FCStatelessPersonalizationConfiguration)initWithDictionary:(id)a3;
- (FCStatelessPersonalizationEnablementRequirements)enablementRequirements;
- (id)description;
- (void)setEnablementRequirements:(id)a3;
@end

@implementation FCStatelessPersonalizationConfiguration

- (FCStatelessPersonalizationConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCStatelessPersonalizationConfiguration;
  v5 = [(FCStatelessPersonalizationConfiguration *)&v10 init];
  if (v5)
  {
    v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"enablementRequirements", 0);
    v7 = [[FCStatelessPersonalizationEnablementRequirements alloc] initWithDictionary:v6];
    enablementRequirements = v5->_enablementRequirements;
    v5->_enablementRequirements = v7;
  }
  return v5;
}

- (FCStatelessPersonalizationEnablementRequirements)enablementRequirements
{
  return self->_enablementRequirements;
}

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCStatelessPersonalizationConfiguration *)self enablementRequirements];
  [v3 appendFormat:@"; enablementRequirements: %@", v4];

  [v3 appendString:@">"];
  return v3;
}

- (void)setEnablementRequirements:(id)a3
{
}

@end