@interface INRulesetResponse
- (CERuleConfiguration)ruleConfiguration;
- (INRulesetResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
@end

@implementation INRulesetResponse

- (INRulesetResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INRulesetResponse;
  v7 = [(INRulesetResponse *)&v12 initWithHTTPResponse:v6 data:a4 bodyIsPlist:0];
  if (v7)
  {
    if ([v6 statusCode] == (id)200)
    {
      id v8 = objc_alloc((Class)CERuleConfiguration);
      v9 = (CERuleConfiguration *)[v8 initWithDictionary:*(void *)&v7->AAResponse_opaque[OBJC_IVAR___AAResponse__responseDictionary]];
      ruleConfiguration = v7->_ruleConfiguration;
      v7->_ruleConfiguration = v9;
    }
    else
    {
      ruleConfiguration = _INLogSystem();
      if (os_log_type_enabled(ruleConfiguration, OS_LOG_TYPE_ERROR)) {
        sub_1000262F8((uint64_t)v7, v6, ruleConfiguration);
      }
    }
  }
  return v7;
}

- (CERuleConfiguration)ruleConfiguration
{
  return self->_ruleConfiguration;
}

- (void).cxx_destruct
{
}

@end