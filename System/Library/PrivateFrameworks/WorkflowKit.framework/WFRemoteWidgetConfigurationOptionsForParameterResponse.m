@interface WFRemoteWidgetConfigurationOptionsForParameterResponse
+ (BOOL)supportsSecureCoding;
- (INObjectCollection)options;
- (WFRemoteWidgetConfigurationOptionsForParameterResponse)initWithCoder:(id)a3;
- (WFRemoteWidgetConfigurationOptionsForParameterResponse)initWithOptions:(id)a3 error:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFRemoteWidgetConfigurationOptionsForParameterResponse

- (void).cxx_destruct
{
}

- (INObjectCollection)options
{
  return self->_options;
}

- (WFRemoteWidgetConfigurationOptionsForParameterResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFRemoteWidgetConfigurationOptionsForParameterResponse;
  v5 = [(WFRemoteWidgetConfigurationResponse *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
    options = v5->_options;
    v5->_options = (INObjectCollection *)v6;

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
  id v4 = [(WFRemoteWidgetConfigurationOptionsForParameterResponse *)self options];
  v5 = [v4 allItems];
  uint64_t v6 = [v5 count];
  v7 = [(WFRemoteWidgetConfigurationOptionsForParameterResponse *)self options];
  v8 = [v7 allItems];
  v9 = [(WFRemoteWidgetConfigurationResponse *)self error];
  objc_super v10 = [v3 stringWithFormat:@"options count: %ld, items: %@, error: %@", v6, v8, v9];

  return v10;
}

- (WFRemoteWidgetConfigurationOptionsForParameterResponse)initWithOptions:(id)a3 error:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFRemoteWidgetConfigurationOptionsForParameterResponse;
  v8 = [(WFRemoteWidgetConfigurationResponse *)&v12 initWithError:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_options, a3);
    objc_super v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end