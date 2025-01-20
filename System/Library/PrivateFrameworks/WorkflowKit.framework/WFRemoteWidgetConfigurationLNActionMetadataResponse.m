@interface WFRemoteWidgetConfigurationLNActionMetadataResponse
+ (BOOL)supportsSecureCoding;
- (LNActionMetadata)metadata;
- (WFRemoteWidgetConfigurationLNActionMetadataResponse)initWithCoder:(id)a3;
- (WFRemoteWidgetConfigurationLNActionMetadataResponse)initWithMetadata:(id)a3 error:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFRemoteWidgetConfigurationLNActionMetadataResponse

- (void).cxx_destruct
{
}

- (LNActionMetadata)metadata
{
  return self->_metadata;
}

- (WFRemoteWidgetConfigurationLNActionMetadataResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFRemoteWidgetConfigurationLNActionMetadataResponse;
  v5 = [(WFRemoteWidgetConfigurationResponse *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (LNActionMetadata *)v6;

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
  id v4 = [(WFRemoteWidgetConfigurationLNActionMetadataResponse *)self metadata];
  v5 = [(WFRemoteWidgetConfigurationResponse *)self error];
  uint64_t v6 = [v3 stringWithFormat:@"metadata: %@, error: %@", v4, v5];

  return v6;
}

- (WFRemoteWidgetConfigurationLNActionMetadataResponse)initWithMetadata:(id)a3 error:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFRemoteWidgetConfigurationLNActionMetadataResponse;
  v8 = [(WFRemoteWidgetConfigurationResponse *)&v12 initWithError:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_metadata, a3);
    objc_super v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end