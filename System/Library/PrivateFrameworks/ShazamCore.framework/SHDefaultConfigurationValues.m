@interface SHDefaultConfigurationValues
- (NSDictionary)defaultValues;
- (NSString)campaignGroup;
- (NSString)providerToken;
- (SHDefaultConfigurationValues)initWithConfiguration:(id)a3;
- (double)recordingIntermission;
- (int64_t)lookupBatchSize;
@end

@implementation SHDefaultConfigurationValues

- (SHDefaultConfigurationValues)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHDefaultConfigurationValues;
  v6 = [(SHDefaultConfigurationValues *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_defaultValues, a3);
  }

  return v7;
}

- (double)recordingIntermission
{
  v3 = [(SHDefaultConfigurationValues *)self defaultValues];
  v4 = [v3 objectForKeyedSubscript:@"recordingIntermission"];
  if (v4)
  {
    id v5 = [(SHDefaultConfigurationValues *)self defaultValues];
    v6 = [v5 objectForKeyedSubscript:@"recordingIntermission"];
    [v6 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 10.0;
  }

  return v8;
}

- (NSString)campaignGroup
{
  v3 = [(SHDefaultConfigurationValues *)self defaultValues];
  v4 = [v3 objectForKeyedSubscript:@"campaignGroup"];
  if (v4)
  {
    id v5 = [(SHDefaultConfigurationValues *)self defaultValues];
    v6 = [v5 objectForKeyedSubscript:@"campaignGroup"];
  }
  else
  {
    v6 = @"30201";
  }

  return (NSString *)v6;
}

- (int64_t)lookupBatchSize
{
  v2 = [(SHDefaultConfigurationValues *)self defaultValues];
  v3 = [v2 objectForKeyedSubscript:@"lookupBatchSize"];
  uint64_t v4 = [v3 integerValue];
  if (v4) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = 10;
  }

  return v5;
}

- (NSString)providerToken
{
  v2 = [(SHDefaultConfigurationValues *)self defaultValues];
  v3 = [v2 objectForKeyedSubscript:@"providerToken"];
  uint64_t v4 = v3;
  if (!v3) {
    v3 = @"2003";
  }
  int64_t v5 = v3;

  return v5;
}

- (NSDictionary)defaultValues
{
  return self->_defaultValues;
}

- (void).cxx_destruct
{
}

@end