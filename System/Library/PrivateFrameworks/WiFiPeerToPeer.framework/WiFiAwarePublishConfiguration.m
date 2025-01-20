@interface WiFiAwarePublishConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)datapathConfigurationEqual:(id)a3;
- (BOOL)fastDiscoveryConfigurationEqual:(id)a3;
- (BOOL)furtherServiceDiscoveryRequired;
- (BOOL)internetSharingConfigurationEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)jumboServiceDiscoveryMessages;
- (BOOL)multicastAddressConfigurationEqual:(id)a3;
- (BOOL)serviceSpecificInfoEqual:(id)a3;
- (NSString)serviceName;
- (WiFiAwareFastDiscoveryConfiguration)fastDiscoveryConfiguration;
- (WiFiAwareInternetSharingConfiguration)internetSharingConfiguration;
- (WiFiAwarePublishConfiguration)initWithCoder:(id)a3;
- (WiFiAwarePublishConfiguration)initWithServiceName:(id)a3;
- (WiFiAwarePublishDatapathConfiguration)datapathConfiguration;
- (WiFiAwarePublishServiceSpecificInfo)serviceSpecificInfo;
- (WiFiMACAddress)multicastAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)authenticationType;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationType:(int64_t)a3;
- (void)setDatapathConfiguration:(id)a3;
- (void)setFastDiscoveryConfiguration:(id)a3;
- (void)setFurtherServiceDiscoveryRequired:(BOOL)a3;
- (void)setInternetSharingConfiguration:(id)a3;
- (void)setJumboServiceDiscoveryMessages:(BOOL)a3;
- (void)setMulticastAddress:(id)a3;
- (void)setServiceSpecificInfo:(id)a3;
@end

@implementation WiFiAwarePublishConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwarePublishConfiguration *)self serviceName];
  [v4 encodeObject:v5 forKey:@"WiFiAwarePublishConfiguration.serviceName"];

  v6 = [(WiFiAwarePublishConfiguration *)self serviceSpecificInfo];
  [v4 encodeObject:v6 forKey:@"WiFiAwarePublishConfiguration.serviceSpecificInfo"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiAwarePublishConfiguration furtherServiceDiscoveryRequired](self, "furtherServiceDiscoveryRequired"), @"WiFiAwarePublishConfiguration.furtherServiceDiscoveryRequired");
  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiAwarePublishConfiguration jumboServiceDiscoveryMessages](self, "jumboServiceDiscoveryMessages"), @"WiFiAwarePublishConfiguration.jumboServiceDiscoveryMessages");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiAwarePublishConfiguration authenticationType](self, "authenticationType"), @"WiFiAwarePublishConfiguration.authenticationType");
  v7 = [(WiFiAwarePublishConfiguration *)self datapathConfiguration];
  [v4 encodeObject:v7 forKey:@"WiFiAwarePublishConfiguration.datapathConfiguration"];

  v8 = [(WiFiAwarePublishConfiguration *)self fastDiscoveryConfiguration];
  [v4 encodeObject:v8 forKey:@"WiFiAwarePublishConfiguration.fastDiscoveryConfiguration"];

  v9 = [(WiFiAwarePublishConfiguration *)self internetSharingConfiguration];
  [v4 encodeObject:v9 forKey:@"WiFiAwarePublishConfiguration.internetSharingConfiguration"];

  id v10 = [(WiFiAwarePublishConfiguration *)self multicastAddress];
  [v4 encodeObject:v10 forKey:@"WiFiAwarePublishConfiguration.multicastAddress"];
}

- (WiFiAwarePublishConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishConfiguration.serviceName"];
  v6 = [(WiFiAwarePublishConfiguration *)self initWithServiceName:v5];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishConfiguration.serviceSpecificInfo"];
  [(WiFiAwarePublishConfiguration *)v6 setServiceSpecificInfo:v7];

  -[WiFiAwarePublishConfiguration setFurtherServiceDiscoveryRequired:](v6, "setFurtherServiceDiscoveryRequired:", [v4 decodeBoolForKey:@"WiFiAwarePublishConfiguration.furtherServiceDiscoveryRequired"]);
  -[WiFiAwarePublishConfiguration setJumboServiceDiscoveryMessages:](v6, "setJumboServiceDiscoveryMessages:", [v4 decodeBoolForKey:@"WiFiAwarePublishConfiguration.jumboServiceDiscoveryMessages"]);
  -[WiFiAwarePublishConfiguration setAuthenticationType:](v6, "setAuthenticationType:", [v4 decodeIntegerForKey:@"WiFiAwarePublishConfiguration.authenticationType"]);
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishConfiguration.datapathConfiguration"];
  [(WiFiAwarePublishConfiguration *)v6 setDatapathConfiguration:v8];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishConfiguration.fastDiscoveryConfiguration"];
  [(WiFiAwarePublishConfiguration *)v6 setFastDiscoveryConfiguration:v9];

  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishConfiguration.internetSharingConfiguration"];
  [(WiFiAwarePublishConfiguration *)v6 setInternetSharingConfiguration:v10];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishConfiguration.multicastAddress"];

  [(WiFiAwarePublishConfiguration *)v6 setMulticastAddress:v11];
  return v6;
}

- (WiFiAwarePublishConfiguration)initWithServiceName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WiFiAwarePublishConfiguration;
  v5 = [(WiFiAwarePublishConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    v5->_authenticationType = 1;
  }

  return v5;
}

- (BOOL)serviceSpecificInfoEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwarePublishConfiguration *)self serviceSpecificInfo];
  uint64_t v6 = [v4 serviceSpecificInfo];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(WiFiAwarePublishConfiguration *)self serviceSpecificInfo];
    v8 = [v4 serviceSpecificInfo];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)datapathConfigurationEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwarePublishConfiguration *)self datapathConfiguration];
  uint64_t v6 = [v4 datapathConfiguration];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(WiFiAwarePublishConfiguration *)self datapathConfiguration];
    v8 = [v4 datapathConfiguration];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)fastDiscoveryConfigurationEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwarePublishConfiguration *)self fastDiscoveryConfiguration];
  uint64_t v6 = [v4 fastDiscoveryConfiguration];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(WiFiAwarePublishConfiguration *)self fastDiscoveryConfiguration];
    v8 = [v4 fastDiscoveryConfiguration];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)internetSharingConfigurationEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwarePublishConfiguration *)self internetSharingConfiguration];
  uint64_t v6 = [v4 internetSharingConfiguration];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(WiFiAwarePublishConfiguration *)self internetSharingConfiguration];
    v8 = [v4 internetSharingConfiguration];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)multicastAddressConfigurationEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwarePublishConfiguration *)self multicastAddress];
  uint64_t v6 = [v4 multicastAddress];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(WiFiAwarePublishConfiguration *)self multicastAddress];
    v8 = [v4 multicastAddress];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiAwarePublishConfiguration *)a3;
  if (self == v4)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v12 = 0;
      v5 = 0;
      goto LABEL_18;
    }
    v5 = v4;
    uint64_t v6 = [(WiFiAwarePublishConfiguration *)self serviceName];
    v7 = [(WiFiAwarePublishConfiguration *)v5 serviceName];
    if (![v6 isEqualToString:v7]
      || ![(WiFiAwarePublishConfiguration *)self serviceSpecificInfoEqual:v5]
      || (BOOL v8 = [(WiFiAwarePublishConfiguration *)self furtherServiceDiscoveryRequired],
          v8 != [(WiFiAwarePublishConfiguration *)v5 furtherServiceDiscoveryRequired])
      || (BOOL v9 = [(WiFiAwarePublishConfiguration *)self jumboServiceDiscoveryMessages],
          v9 != [(WiFiAwarePublishConfiguration *)v5 jumboServiceDiscoveryMessages])
      || (int64_t v10 = [(WiFiAwarePublishConfiguration *)self authenticationType],
          v10 != [(WiFiAwarePublishConfiguration *)v5 authenticationType])
      || ![(WiFiAwarePublishConfiguration *)self datapathConfigurationEqual:v5]
      || ![(WiFiAwarePublishConfiguration *)self fastDiscoveryConfigurationEqual:v5]|| ![(WiFiAwarePublishConfiguration *)self internetSharingConfigurationEqual:v5])
    {

LABEL_17:
      BOOL v12 = 0;
      goto LABEL_18;
    }
    BOOL v11 = [(WiFiAwarePublishConfiguration *)self multicastAddressConfigurationEqual:v5];

    if (!v11) {
      goto LABEL_17;
    }
  }
  BOOL v12 = 1;
LABEL_18:

  return v12;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(WiFiAwarePublishConfiguration *)self serviceName];
  v5 = [(WiFiAwarePublishConfiguration *)self serviceSpecificInfo];
  if ([(WiFiAwarePublishConfiguration *)self furtherServiceDiscoveryRequired]) {
    uint64_t v6 = "YES";
  }
  else {
    uint64_t v6 = "NO";
  }
  if ([(WiFiAwarePublishConfiguration *)self jumboServiceDiscoveryMessages]) {
    v7 = "YES";
  }
  else {
    v7 = "NO";
  }
  BOOL v8 = [(WiFiAwarePublishConfiguration *)self datapathConfiguration];
  BOOL v9 = [(WiFiAwarePublishConfiguration *)self fastDiscoveryConfiguration];
  int64_t v10 = [(WiFiAwarePublishConfiguration *)self internetSharingConfiguration];
  BOOL v11 = [v3 stringWithFormat:@"<WiFiAwarePublishConfiguration: serviceName=%@, serviceSpecificInfo=%@, furtherServiceDiscoveryRequired=%s, jumboMessages=%s, dataConfig=%@, fastDiscovery=%@, internetSharing=%@>", v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [WiFiAwarePublishConfiguration alloc];
  v5 = [(WiFiAwarePublishConfiguration *)self serviceName];
  uint64_t v6 = [(WiFiAwarePublishConfiguration *)v4 initWithServiceName:v5];

  v7 = [(WiFiAwarePublishConfiguration *)self serviceSpecificInfo];
  BOOL v8 = (void *)[v7 copy];
  [(WiFiAwarePublishConfiguration *)v6 setServiceSpecificInfo:v8];

  [(WiFiAwarePublishConfiguration *)v6 setFurtherServiceDiscoveryRequired:[(WiFiAwarePublishConfiguration *)self furtherServiceDiscoveryRequired]];
  [(WiFiAwarePublishConfiguration *)v6 setJumboServiceDiscoveryMessages:[(WiFiAwarePublishConfiguration *)self jumboServiceDiscoveryMessages]];
  BOOL v9 = [(WiFiAwarePublishConfiguration *)self datapathConfiguration];
  int64_t v10 = (void *)[v9 copy];
  [(WiFiAwarePublishConfiguration *)v6 setDatapathConfiguration:v10];

  [(WiFiAwarePublishConfiguration *)v6 setAuthenticationType:[(WiFiAwarePublishConfiguration *)self authenticationType]];
  BOOL v11 = [(WiFiAwarePublishConfiguration *)self fastDiscoveryConfiguration];
  BOOL v12 = (void *)[v11 copy];
  [(WiFiAwarePublishConfiguration *)v6 setFastDiscoveryConfiguration:v12];

  v13 = [(WiFiAwarePublishConfiguration *)self internetSharingConfiguration];
  v14 = (void *)[v13 copy];
  [(WiFiAwarePublishConfiguration *)v6 setInternetSharingConfiguration:v14];

  v15 = [(WiFiAwarePublishConfiguration *)self multicastAddress];
  v16 = (void *)[v15 copy];
  [(WiFiAwarePublishConfiguration *)v6 setMulticastAddress:v16];

  return v6;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (WiFiAwarePublishServiceSpecificInfo)serviceSpecificInfo
{
  return self->_serviceSpecificInfo;
}

- (void)setServiceSpecificInfo:(id)a3
{
}

- (BOOL)furtherServiceDiscoveryRequired
{
  return self->_furtherServiceDiscoveryRequired;
}

- (void)setFurtherServiceDiscoveryRequired:(BOOL)a3
{
  self->_furtherServiceDiscoveryRequired = a3;
}

- (BOOL)jumboServiceDiscoveryMessages
{
  return self->_jumboServiceDiscoveryMessages;
}

- (void)setJumboServiceDiscoveryMessages:(BOOL)a3
{
  self->_jumboServiceDiscoveryMessages = a3;
}

- (WiFiMACAddress)multicastAddress
{
  return self->_multicastAddress;
}

- (void)setMulticastAddress:(id)a3
{
}

- (int64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(int64_t)a3
{
  self->_authenticationType = a3;
}

- (WiFiAwarePublishDatapathConfiguration)datapathConfiguration
{
  return self->_datapathConfiguration;
}

- (void)setDatapathConfiguration:(id)a3
{
}

- (WiFiAwareFastDiscoveryConfiguration)fastDiscoveryConfiguration
{
  return self->_fastDiscoveryConfiguration;
}

- (void)setFastDiscoveryConfiguration:(id)a3
{
}

- (WiFiAwareInternetSharingConfiguration)internetSharingConfiguration
{
  return self->_internetSharingConfiguration;
}

- (void)setInternetSharingConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internetSharingConfiguration, 0);
  objc_storeStrong((id *)&self->_fastDiscoveryConfiguration, 0);
  objc_storeStrong((id *)&self->_datapathConfiguration, 0);
  objc_storeStrong((id *)&self->_multicastAddress, 0);
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end