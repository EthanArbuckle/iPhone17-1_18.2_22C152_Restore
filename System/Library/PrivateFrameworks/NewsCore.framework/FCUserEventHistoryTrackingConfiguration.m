@interface FCUserEventHistoryTrackingConfiguration
- (FCUserEventHistoryPruningPolicies)pruningPolicies;
- (FCUserEventHistoryTrackingConfiguration)init;
- (FCUserEventHistoryTrackingConfiguration)initWithDictionary:(id)a3;
- (id)description;
- (void)setPruningPolicies:(id)a3;
@end

@implementation FCUserEventHistoryTrackingConfiguration

- (FCUserEventHistoryTrackingConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCUserEventHistoryTrackingConfiguration;
  v5 = [(FCUserEventHistoryTrackingConfiguration *)&v10 init];
  if (v5)
  {
    v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"pruningPolicies", 0);
    v7 = [[FCUserEventHistoryPruningPolicies alloc] initWithDictionary:v6];
    if (v7)
    {
      [(FCUserEventHistoryTrackingConfiguration *)v5 setPruningPolicies:v7];
    }
    else
    {
      v8 = +[FCUserEventHistoryPruningPolicies defaultPolicy];
      [(FCUserEventHistoryTrackingConfiguration *)v5 setPruningPolicies:v8];
    }
  }

  return v5;
}

- (void)setPruningPolicies:(id)a3
{
}

- (void).cxx_destruct
{
}

- (FCUserEventHistoryPruningPolicies)pruningPolicies
{
  return self->_pruningPolicies;
}

- (FCUserEventHistoryTrackingConfiguration)init
{
  return [(FCUserEventHistoryTrackingConfiguration *)self initWithDictionary:0];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCUserEventHistoryTrackingConfiguration *)self pruningPolicies];
  [v3 appendFormat:@"; pruningPolicies: %@", v4];

  [v3 appendString:@">"];
  return v3;
}

@end