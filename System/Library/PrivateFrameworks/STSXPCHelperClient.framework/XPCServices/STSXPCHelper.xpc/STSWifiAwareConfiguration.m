@interface STSWifiAwareConfiguration
+ (BOOL)supportsSecureCoding;
- (STSWifiAwareConfiguration)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSWifiAwareConfiguration

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (self)
  {
    [v5 encodeBool:self->_publisher forKey:@"publisher"];
    [v5 encodeObject:self->_serviceName forKey:@"serviceName"];
    [v5 encodeObject:self->_securityInfo forKey:@"securityInfo"];
    [v5 encodeObject:self->_channelInfo forKey:@"channelInfo"];
    [v5 encodeObject:self->_peerDHInfo forKey:@"peerDHInfo"];
    [v5 encodeObject:self->_transportKey forKey:@"transportKey"];
    [v5 encodeObject:self->_serviceSpecificInfo forKey:@"serviceSpecificInfo"];
    [v5 encodeObject:self->_portNumber forKey:@"portNumber"];
    [v5 encodeDouble:@"connectionTimeout" forKey:self->_connectionTimeout];
    double sessionTimeout = self->_sessionTimeout;
  }
  else
  {
    [v5 encodeBool:0 forKey:@"publisher"];
    [v5 encodeObject:0 forKey:@"serviceName"];
    [v5 encodeObject:0 forKey:@"securityInfo"];
    [v5 encodeObject:0 forKey:@"channelInfo"];
    [v5 encodeObject:0 forKey:@"peerDHInfo"];
    [v5 encodeObject:0 forKey:@"transportKey"];
    [v5 encodeObject:0 forKey:@"serviceSpecificInfo"];
    [v5 encodeObject:0 forKey:@"portNumber"];
    [v5 encodeDouble:@"connectionTimeout" forKey:0.0];
    double sessionTimeout = 0.0;
  }
  [v5 encodeDouble:@"sessionTimeout" forKey:sessionTimeout];
}

- (STSWifiAwareConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)STSWifiAwareConfiguration;
  id v5 = [(STSWifiAwareConfiguration *)&v23 init];
  if (v5)
  {
    v5->_publisher = [v4 decodeBoolForKey:@"publisher"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceName"];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"securityInfo"];
    securityInfo = v5->_securityInfo;
    v5->_securityInfo = (STSCHWiFiAwareSecurityInfo *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"channelInfo"];
    channelInfo = v5->_channelInfo;
    v5->_channelInfo = (STSCHWiFiAwareDiscoveryChannelInfo *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transportKey"];
    transportKey = v5->_transportKey;
    v5->_transportKey = (ISOKey *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerDHInfo"];
    peerDHInfo = v5->_peerDHInfo;
    v5->_peerDHInfo = (STSDiffieHellmanParameter *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceSpecificInfo"];
    serviceSpecificInfo = v5->_serviceSpecificInfo;
    v5->_serviceSpecificInfo = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"portNumber"];
    portNumber = v5->_portNumber;
    v5->_portNumber = (NSNumber *)v18;

    [v4 decodeDoubleForKey:@"connectionTimeout"];
    v5->_connectionTimeout = v20;
    [v4 decodeDoubleForKey:@"sessionTimeout"];
    v5->_double sessionTimeout = v21;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  if (self)
  {
    BOOL publisher = self->_publisher;
    id v4 = self->_serviceName;
    id v5 = self->_portNumber;
    uint64_t v6 = self->_serviceSpecificInfo;
    v7 = self->_channelInfo;
    double connectionTimeout = self->_connectionTimeout;
    double sessionTimeout = self->_sessionTimeout;
  }
  else
  {
    uint64_t v6 = 0;
    id v4 = 0;
    BOOL publisher = 0;
    id v5 = 0;
    v7 = 0;
    double connectionTimeout = 0.0;
    double sessionTimeout = 0.0;
  }
  uint64_t v10 = +[NSString stringWithFormat:@"{ publisher=%d,\r\n serviceName=%@,\r\n port=%@,\r\n serviceSpecificInfo=%@,\r\n channelInfo=%@, \r\nconnectionTimeout=%f,\r\nsessionTimeout=%f }", publisher, v4, v5, v6, v7, *(void *)&connectionTimeout, *(void *)&sessionTimeout];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portNumber, 0);
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_peerDHInfo, 0);
  objc_storeStrong((id *)&self->_transportKey, 0);
  objc_storeStrong((id *)&self->_channelInfo, 0);
  objc_storeStrong((id *)&self->_securityInfo, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end