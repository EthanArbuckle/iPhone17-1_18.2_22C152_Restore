@interface FCUserEventHistoryPruningPolicies
+ (id)defaultPolicy;
- (FCUserEventHistoryPruningPolicies)initWithDictionary:(id)a3;
- (NSArray)policies;
- (id)description;
- (void)setPolicies:(id)a3;
@end

@implementation FCUserEventHistoryPruningPolicies

- (void).cxx_destruct
{
}

+ (id)defaultPolicy
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(FCUserEventHistoryPruningPolicies);
  v3 = [[FCUserEventHistoryPruningPolicy alloc] initWithType:1 value:5000000];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(FCUserEventHistoryPruningPolicies *)v2 setPolicies:v4];

  return v2;
}

- (FCUserEventHistoryPruningPolicies)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FCUserEventHistoryPruningPolicies;
  v5 = [(FCUserEventHistoryPruningPolicies *)&v16 init];
  if (!v5) {
    goto LABEL_12;
  }
  v6 = objc_opt_new();
  v7 = FCAppConfigurationNumberValue(v4, @"maxSizeOnDisk", 0);
  if (v7)
  {
    v8 = -[FCUserEventHistoryPruningPolicy initWithType:value:]([FCUserEventHistoryPruningPolicy alloc], "initWithType:value:", 1, [v7 unsignedIntegerValue]);
    [v6 addObject:v8];
  }
  v9 = FCAppConfigurationNumberValue(v4, @"maxSessionAge", 0);
  if (v9)
  {
    v10 = -[FCUserEventHistoryPruningPolicy initWithType:value:]([FCUserEventHistoryPruningPolicy alloc], "initWithType:value:", 3, [v9 unsignedIntegerValue]);
    [v6 addObject:v10];
  }
  v11 = FCAppConfigurationNumberValue(v4, @"maxSessionCount", 0);
  if (v11)
  {
    v12 = -[FCUserEventHistoryPruningPolicy initWithType:value:]([FCUserEventHistoryPruningPolicy alloc], "initWithType:value:", 2, [v11 unsignedIntegerValue]);
    [v6 addObject:v12];
  }
  uint64_t v13 = [v6 count];
  if (v13)
  {
    [(FCUserEventHistoryPruningPolicies *)v5 setPolicies:v6];
  }
  else
  {

    v5 = 0;
  }

  if (!v13)
  {
    v14 = 0;
  }
  else
  {
LABEL_12:
    v5 = v5;
    v14 = v5;
  }

  return v14;
}

- (void)setPolicies:(id)a3
{
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCUserEventHistoryPruningPolicies *)self policies];
  [v3 appendFormat:@"; policies: %@", v4];

  [v3 appendString:@">"];
  return v3;
}

- (NSArray)policies
{
  return self->_policies;
}

@end