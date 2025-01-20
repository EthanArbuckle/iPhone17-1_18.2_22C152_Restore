@interface WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse
+ (BOOL)supportsSecureCoding;
- (LNDynamicOption)defaultOption;
- (WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse)initWithCoder:(id)a3;
- (WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse)initWithDefaultOption:(id)a3 error:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse

- (void).cxx_destruct
{
}

- (LNDynamicOption)defaultOption
{
  return self->_defaultOption;
}

- (WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse;
  v5 = [(WFRemoteWidgetConfigurationResponse *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultOption"];
    defaultOption = v5->_defaultOption;
    v5->_defaultOption = (LNDynamicOption *)v6;

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
  id v4 = [(WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse *)self defaultOption];
  v5 = [(WFRemoteWidgetConfigurationResponse *)self error];
  uint64_t v6 = [v3 stringWithFormat:@"defaultOption: %@, error: %@", v4, v5];

  return v6;
}

- (WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse)initWithDefaultOption:(id)a3 error:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFRemoteWidgetConfigurationDefaultLNOptionForParameterResponse;
  v8 = [(WFRemoteWidgetConfigurationResponse *)&v12 initWithError:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_defaultOption, a3);
    objc_super v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end