@interface WFRemoteWidgetConfigurationResponse
+ (BOOL)supportsSecureCoding;
+ (id)fromSecureData:(id)a3;
- (NSError)error;
- (WFRemoteWidgetConfigurationResponse)initWithCoder:(id)a3;
- (WFRemoteWidgetConfigurationResponse)initWithError:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFRemoteWidgetConfigurationResponse

- (void).cxx_destruct
{
}

- (NSError)error
{
  return self->_error;
}

- (WFRemoteWidgetConfigurationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFRemoteWidgetConfigurationResponse *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v5 = [(WFRemoteWidgetConfigurationResponse *)v5 initWithError:v5->_error];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (WFRemoteWidgetConfigurationResponse)initWithError:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFRemoteWidgetConfigurationResponse;
  uint64_t v6 = [(WFRemoteWidgetConfigurationResponse *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)fromSecureData:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_super v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v11 = objc_msgSend(v4, "bs_secureDecodedFromData:withAdditionalClasses:", v3, v10);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end