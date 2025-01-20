@interface WFRemoteWidgetConfigurationDefaultValueForParameterResponse
+ (BOOL)supportsSecureCoding;
- (NSSecureCoding)defaultValue;
- (WFRemoteWidgetConfigurationDefaultValueForParameterResponse)initWithCoder:(id)a3;
- (WFRemoteWidgetConfigurationDefaultValueForParameterResponse)initWithDefaultValue:(id)a3 error:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFRemoteWidgetConfigurationDefaultValueForParameterResponse

- (void).cxx_destruct
{
}

- (NSSecureCoding)defaultValue
{
  return self->_defaultValue;
}

- (WFRemoteWidgetConfigurationDefaultValueForParameterResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFRemoteWidgetConfigurationDefaultValueForParameterResponse;
  v5 = [(WFRemoteWidgetConfigurationResponse *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"defaultValue"];
    defaultValue = v5->_defaultValue;
    v5->_defaultValue = (NSSecureCoding *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  id v4 = [(WFRemoteWidgetConfigurationDefaultValueForParameterResponse *)self defaultValue];
  v5 = [(WFRemoteWidgetConfigurationResponse *)self error];
  uint64_t v6 = [v3 stringWithFormat:@"defaultValue: %@, error: %@", v4, v5];

  return v6;
}

- (WFRemoteWidgetConfigurationDefaultValueForParameterResponse)initWithDefaultValue:(id)a3 error:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFRemoteWidgetConfigurationDefaultValueForParameterResponse;
  v8 = [(WFRemoteWidgetConfigurationResponse *)&v12 initWithError:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_defaultValue, a3);
    objc_super v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end