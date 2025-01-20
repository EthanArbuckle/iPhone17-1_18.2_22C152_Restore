@interface SCMLAnalysisConfiguration
- (SCMLAnalysisConfiguration)init;
- (SCMLAnalysisConfiguration)initWithOptions:(id)a3;
- (int64_t)deviceType;
@end

@implementation SCMLAnalysisConfiguration

- (SCMLAnalysisConfiguration)init
{
  return 0;
}

- (SCMLAnalysisConfiguration)initWithOptions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCMLAnalysisConfiguration;
  v5 = [(SCMLAnalysisConfiguration *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_deviceType = 0;
    v7 = [v4 objectForKeyedSubscript:@"SCMLAnalysisConfigurationDeviceType"];

    if (v7)
    {
      v8 = [v4 objectForKeyedSubscript:@"SCMLAnalysisConfigurationDeviceType"];
      v6->_deviceType = [v8 unsignedIntValue];
    }
  }

  return v6;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

@end