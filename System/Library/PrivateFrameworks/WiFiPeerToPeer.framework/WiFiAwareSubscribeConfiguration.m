@interface WiFiAwareSubscribeConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)fastDiscoveryConfigEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)multicastAddressConfigurationEqual:(id)a3;
- (BOOL)serviceSpecificInfoEqual:(id)a3;
- (NSData)serviceSpecificInfo;
- (NSString)serviceName;
- (WiFiAwareFastDiscoveryConfiguration)fastDiscoveryConfiguration;
- (WiFiAwareSubscribeConfiguration)initWithCoder:(id)a3;
- (WiFiAwareSubscribeConfiguration)initWithServiceName:(id)a3;
- (WiFiAwareSubscribeConfiguration)initWithServiceName:(id)a3 serviceSpecificInfo:(id)a4;
- (WiFiMACAddress)multicastAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)authenticationType;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationType:(int64_t)a3;
- (void)setFastDiscoveryConfiguration:(id)a3;
- (void)setMulticastAddress:(id)a3;
- (void)setServiceSpecificInfo:(id)a3;
@end

@implementation WiFiAwareSubscribeConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareSubscribeConfiguration *)self serviceName];
  [v4 encodeObject:v5 forKey:@"WiFiAwareSubscribeConfiguration.serviceName"];

  v6 = [(WiFiAwareSubscribeConfiguration *)self serviceSpecificInfo];
  [v4 encodeObject:v6 forKey:@"WiFiAwareSubscribeConfiguration.serviceSpecificInfo"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiAwareSubscribeConfiguration authenticationType](self, "authenticationType"), @"WiFiAwareSubscribeConfiguration.authenticationType");
  v7 = [(WiFiAwareSubscribeConfiguration *)self fastDiscoveryConfiguration];
  [v4 encodeObject:v7 forKey:@"WiFiAwareSubscribeConfiguration.fastDiscoveryConfiguration"];

  id v8 = [(WiFiAwareSubscribeConfiguration *)self multicastAddress];
  [v4 encodeObject:v8 forKey:@"WiFiAwareSubscribeConfiguration.multicastAddress"];
}

- (WiFiAwareSubscribeConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareSubscribeConfiguration.serviceName"];
  v6 = [(WiFiAwareSubscribeConfiguration *)self initWithServiceName:v5];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareSubscribeConfiguration.serviceSpecificInfo"];
  [(WiFiAwareSubscribeConfiguration *)v6 setServiceSpecificInfo:v7];

  -[WiFiAwareSubscribeConfiguration setAuthenticationType:](v6, "setAuthenticationType:", [v4 decodeIntegerForKey:@"WiFiAwareSubscribeConfiguration.authenticationType"]);
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareSubscribeConfiguration.fastDiscoveryConfiguration"];
  [(WiFiAwareSubscribeConfiguration *)v6 setFastDiscoveryConfiguration:v8];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareSubscribeConfiguration.multicastAddress"];

  [(WiFiAwareSubscribeConfiguration *)v6 setMulticastAddress:v9];
  return v6;
}

- (WiFiAwareSubscribeConfiguration)initWithServiceName:(id)a3 serviceSpecificInfo:(id)a4
{
  id v6 = a4;
  v7 = [(WiFiAwareSubscribeConfiguration *)self initWithServiceName:a3];
  [(WiFiAwareSubscribeConfiguration *)v7 setServiceSpecificInfo:v6];

  return v7;
}

- (WiFiAwareSubscribeConfiguration)initWithServiceName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WiFiAwareSubscribeConfiguration;
  v5 = [(WiFiAwareSubscribeConfiguration *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    serviceSpecificInfo = v5->_serviceSpecificInfo;
    v5->_serviceSpecificInfo = 0;

    v5->_authenticationType = 1;
  }

  return v5;
}

- (BOOL)serviceSpecificInfoEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareSubscribeConfiguration *)self serviceSpecificInfo];
  uint64_t v6 = [v4 serviceSpecificInfo];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(WiFiAwareSubscribeConfiguration *)self serviceSpecificInfo];
    id v8 = [v4 serviceSpecificInfo];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)fastDiscoveryConfigEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareSubscribeConfiguration *)self fastDiscoveryConfiguration];
  uint64_t v6 = [v4 fastDiscoveryConfiguration];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(WiFiAwareSubscribeConfiguration *)self fastDiscoveryConfiguration];
    id v8 = [v4 fastDiscoveryConfiguration];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)multicastAddressConfigurationEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareSubscribeConfiguration *)self multicastAddress];
  uint64_t v6 = [v4 multicastAddress];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(WiFiAwareSubscribeConfiguration *)self multicastAddress];
    id v8 = [v4 multicastAddress];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiAwareSubscribeConfiguration *)a3;
  if (self == v4)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v10 = 0;
      v5 = 0;
      goto LABEL_14;
    }
    v5 = v4;
    uint64_t v6 = [(WiFiAwareSubscribeConfiguration *)self serviceName];
    v7 = [(WiFiAwareSubscribeConfiguration *)v5 serviceName];
    if (![v6 isEqualToString:v7]
      || ![(WiFiAwareSubscribeConfiguration *)self serviceSpecificInfoEqual:v5]
      || (int64_t v8 = [(WiFiAwareSubscribeConfiguration *)self authenticationType],
          v8 != [(WiFiAwareSubscribeConfiguration *)v5 authenticationType])
      || ![(WiFiAwareSubscribeConfiguration *)self fastDiscoveryConfigEqual:v5])
    {

LABEL_13:
      BOOL v10 = 0;
      goto LABEL_14;
    }
    BOOL v9 = [(WiFiAwareSubscribeConfiguration *)self multicastAddressConfigurationEqual:v5];

    if (!v9) {
      goto LABEL_13;
    }
  }
  BOOL v10 = 1;
LABEL_14:

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(WiFiAwareSubscribeConfiguration *)self serviceName];
  v5 = [(WiFiAwareSubscribeConfiguration *)self serviceSpecificInfo];
  uint64_t v6 = [(WiFiAwareSubscribeConfiguration *)self fastDiscoveryConfiguration];
  v7 = [v3 stringWithFormat:@"<WiFiAwareSubscribeConfiguration: name=%@, serviceSpecificInfo=%@, fastDiscoveryConfiguration=%@>", v4, v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [WiFiAwareSubscribeConfiguration alloc];
  v5 = [(WiFiAwareSubscribeConfiguration *)self serviceName];
  uint64_t v6 = [(WiFiAwareSubscribeConfiguration *)v4 initWithServiceName:v5];

  v7 = [(WiFiAwareSubscribeConfiguration *)self serviceSpecificInfo];
  [(WiFiAwareSubscribeConfiguration *)v6 setServiceSpecificInfo:v7];

  [(WiFiAwareSubscribeConfiguration *)v6 setAuthenticationType:[(WiFiAwareSubscribeConfiguration *)self authenticationType]];
  int64_t v8 = [(WiFiAwareSubscribeConfiguration *)self fastDiscoveryConfiguration];
  [(WiFiAwareSubscribeConfiguration *)v6 setFastDiscoveryConfiguration:v8];

  BOOL v9 = [(WiFiAwareSubscribeConfiguration *)self multicastAddress];
  [(WiFiAwareSubscribeConfiguration *)v6 setMulticastAddress:v9];

  return v6;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSData)serviceSpecificInfo
{
  return self->_serviceSpecificInfo;
}

- (void)setServiceSpecificInfo:(id)a3
{
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

- (WiFiAwareFastDiscoveryConfiguration)fastDiscoveryConfiguration
{
  return self->_fastDiscoveryConfiguration;
}

- (void)setFastDiscoveryConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastDiscoveryConfiguration, 0);
  objc_storeStrong((id *)&self->_multicastAddress, 0);
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end