@interface WiFiAwarePublishDatapathConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)securityConfigurationEqual:(id)a3;
- (BOOL)serviceSpecificInfoEqual:(id)a3;
- (WiFiAwarePublishDatapathConfiguration)initWithCoder:(id)a3;
- (WiFiAwarePublishDatapathConfiguration)initWithServiceType:(int64_t)a3 securityConfiguration:(id)a4;
- (WiFiAwarePublishDatapathSecurityConfiguration)securityConfiguration;
- (WiFiAwarePublishDatapathServiceSpecificInfo)serviceSpecificInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)serviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setServiceSpecificInfo:(id)a3;
@end

@implementation WiFiAwarePublishDatapathConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiAwarePublishDatapathConfiguration serviceType](self, "serviceType"), @"WiFiAwarePublishDatapathConfiguration.serviceType");
  v5 = [(WiFiAwarePublishDatapathConfiguration *)self securityConfiguration];
  [v4 encodeObject:v5 forKey:@"WiFiAwarePublishDatapathConfiguration.securityConfiguration"];

  id v6 = [(WiFiAwarePublishDatapathConfiguration *)self serviceSpecificInfo];
  [v4 encodeObject:v6 forKey:@"WiFiAwarePublishDatapathConfiguration.serviceSpecificInfo"];
}

- (WiFiAwarePublishDatapathConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"WiFiAwarePublishDatapathConfiguration.serviceType"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishDatapathConfiguration.securityConfiguration"];
  v7 = [(WiFiAwarePublishDatapathConfiguration *)self initWithServiceType:v5 securityConfiguration:v6];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishDatapathConfiguration.serviceSpecificInfo"];

  [(WiFiAwarePublishDatapathConfiguration *)v7 setServiceSpecificInfo:v8];
  return v7;
}

- (WiFiAwarePublishDatapathConfiguration)initWithServiceType:(int64_t)a3 securityConfiguration:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WiFiAwarePublishDatapathConfiguration;
  v8 = [(WiFiAwarePublishDatapathConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_serviceType = a3;
    objc_storeStrong((id *)&v8->_securityConfiguration, a4);
  }

  return v9;
}

- (BOOL)securityConfigurationEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WiFiAwarePublishDatapathConfiguration *)self securityConfiguration];
  id v6 = [v4 securityConfiguration];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    id v7 = [(WiFiAwarePublishDatapathConfiguration *)self securityConfiguration];
    v8 = [v4 securityConfiguration];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)serviceSpecificInfoEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WiFiAwarePublishDatapathConfiguration *)self serviceSpecificInfo];
  id v6 = [v4 serviceSpecificInfo];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    id v7 = [(WiFiAwarePublishDatapathConfiguration *)self serviceSpecificInfo];
    v8 = [v4 serviceSpecificInfo];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiAwarePublishDatapathConfiguration *)a3;
  if (self == v4)
  {
    uint64_t v5 = 0;
LABEL_8:
    BOOL v7 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v7 = 0;
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = v4;
  int64_t v6 = [(WiFiAwarePublishDatapathConfiguration *)self serviceType];
  if (v6 == [(WiFiAwarePublishDatapathConfiguration *)v5 serviceType]
    && [(WiFiAwarePublishDatapathConfiguration *)self securityConfigurationEqual:v5]
    && [(WiFiAwarePublishDatapathConfiguration *)self serviceSpecificInfoEqual:v5])
  {
    goto LABEL_8;
  }
  BOOL v7 = 0;
LABEL_10:

  return v7;
}

- (id)description
{
  unint64_t v3 = [(WiFiAwarePublishDatapathConfiguration *)self serviceType];
  if (v3 > 2) {
    id v4 = "unrecognized";
  }
  else {
    id v4 = off_1E633F0B8[v3];
  }
  uint64_t v5 = NSString;
  int64_t v6 = [(WiFiAwarePublishDatapathConfiguration *)self securityConfiguration];
  BOOL v7 = [(WiFiAwarePublishDatapathConfiguration *)self serviceSpecificInfo];
  v8 = [v5 stringWithFormat:@"<WiFiAwarePublishDatapathConfiguration: serviceType=%s, securityConfig=%@, serviceSpecificInfo=%@>", v4, v6, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [WiFiAwarePublishDatapathConfiguration alloc];
  int64_t v5 = [(WiFiAwarePublishDatapathConfiguration *)self serviceType];
  int64_t v6 = [(WiFiAwarePublishDatapathConfiguration *)self securityConfiguration];
  BOOL v7 = [(WiFiAwarePublishDatapathConfiguration *)v4 initWithServiceType:v5 securityConfiguration:v6];

  v8 = [(WiFiAwarePublishDatapathConfiguration *)self serviceSpecificInfo];
  [(WiFiAwarePublishDatapathConfiguration *)v7 setServiceSpecificInfo:v8];

  return v7;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (WiFiAwarePublishDatapathSecurityConfiguration)securityConfiguration
{
  return self->_securityConfiguration;
}

- (WiFiAwarePublishDatapathServiceSpecificInfo)serviceSpecificInfo
{
  return self->_serviceSpecificInfo;
}

- (void)setServiceSpecificInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_securityConfiguration, 0);
}

@end