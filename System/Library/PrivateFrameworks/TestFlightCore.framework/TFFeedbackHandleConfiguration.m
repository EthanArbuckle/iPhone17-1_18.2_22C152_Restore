@interface TFFeedbackHandleConfiguration
+ (id)configurationFromUserInfo:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)incidentId;
- (TFFeedbackHandleConfiguration)initWithBundleIdentifier:(id)a3;
- (TFFeedbackHandleConfiguration)initWithBundleURL:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodedAsUserInfo;
- (void)setIncidentId:(id)a3;
@end

@implementation TFFeedbackHandleConfiguration

- (TFFeedbackHandleConfiguration)initWithBundleURL:(id)a3
{
  v4 = +[TFBundle bundleIdentifierForBundleURL:a3];
  v5 = (void *)[v4 copy];

  v6 = [(TFFeedbackHandleConfiguration *)self initWithBundleIdentifier:v5];
  return v6;
}

- (TFFeedbackHandleConfiguration)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TFFeedbackHandleConfiguration;
  v5 = [(TFFeedbackHandleConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)encodedAsUserInfo
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  id v4 = [(TFFeedbackHandleConfiguration *)self bundleIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"CONFIG_BUNDLE_ID"];

  v5 = [(TFFeedbackHandleConfiguration *)self incidentId];

  if (v5)
  {
    uint64_t v6 = [(TFFeedbackHandleConfiguration *)self incidentId];
    [v3 setObject:v6 forKeyedSubscript:@"CONFIG_INCIDENT_ID"];
  }

  return v3;
}

+ (id)configurationFromUserInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"CONFIG_BUNDLE_ID"];
  if (v4)
  {
    v5 = [[TFFeedbackHandleConfiguration alloc] initWithBundleIdentifier:v4];
    uint64_t v6 = [v3 objectForKeyedSubscript:@"CONFIG_INCIDENT_ID"];
    if (v6) {
      [(TFFeedbackHandleConfiguration *)v5 setIncidentId:v6];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [TFFeedbackHandleConfiguration alloc];
  v5 = [(TFFeedbackHandleConfiguration *)self bundleIdentifier];
  uint64_t v6 = [(TFFeedbackHandleConfiguration *)v4 initWithBundleIdentifier:v5];

  v7 = [(TFFeedbackHandleConfiguration *)self incidentId];
  [(TFFeedbackHandleConfiguration *)v6 setIncidentId:v7];

  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)incidentId
{
  return self->_incidentId;
}

- (void)setIncidentId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentId, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end