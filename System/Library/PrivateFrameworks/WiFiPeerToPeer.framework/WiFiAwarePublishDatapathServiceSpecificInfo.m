@interface WiFiAwarePublishDatapathServiceSpecificInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)hostnameEquals:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)hostname;
- (WiFiAwarePublishDatapathServiceSpecificInfo)initWithCoder:(id)a3;
- (WiFiAwarePublishDatapathServiceSpecificInfo)initWithProtocolType:(int64_t)a3 servicePort:(unsigned __int16)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)protocolType;
- (unsigned)servicePort;
- (void)encodeWithCoder:(id)a3;
- (void)setHostname:(id)a3;
@end

@implementation WiFiAwarePublishDatapathServiceSpecificInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiAwarePublishDatapathServiceSpecificInfo protocolType](self, "protocolType"), @"WiFiAwarePublishDatapathServiceSpecificInfo.protocolType");
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[WiFiAwarePublishDatapathServiceSpecificInfo servicePort](self, "servicePort"));
  [v4 encodeObject:v5 forKey:@"WiFiAwarePublishDatapathServiceSpecificInfo.port"];

  id v6 = [(WiFiAwarePublishDatapathServiceSpecificInfo *)self hostname];
  [v4 encodeObject:v6 forKey:@"WiFiAwarePublishDatapathServiceSpecificInfo.hostname"];
}

- (WiFiAwarePublishDatapathServiceSpecificInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"WiFiAwarePublishDatapathServiceSpecificInfo.protocolType"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishDatapathServiceSpecificInfo.port"];
  uint64_t v7 = [v6 unsignedShortValue];

  v8 = [(WiFiAwarePublishDatapathServiceSpecificInfo *)self initWithProtocolType:v5 servicePort:v7];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishDatapathServiceSpecificInfo.hostname"];

  [(WiFiAwarePublishDatapathServiceSpecificInfo *)v8 setHostname:v9];
  return v8;
}

- (WiFiAwarePublishDatapathServiceSpecificInfo)initWithProtocolType:(int64_t)a3 servicePort:(unsigned __int16)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WiFiAwarePublishDatapathServiceSpecificInfo;
  result = [(WiFiAwarePublishDatapathServiceSpecificInfo *)&v7 init];
  if (result)
  {
    result->_protocolType = a3;
    result->_servicePort = a4;
  }
  return result;
}

- (BOOL)hostnameEquals:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WiFiAwarePublishDatapathServiceSpecificInfo *)self hostname];
  id v6 = [v4 hostname];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    objc_super v7 = [(WiFiAwarePublishDatapathServiceSpecificInfo *)self hostname];
    v8 = [v4 hostname];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiAwarePublishDatapathServiceSpecificInfo *)a3;
  if (self == v4)
  {
    uint64_t v5 = 0;
LABEL_8:
    BOOL v8 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v8 = 0;
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = v4;
  int64_t v6 = [(WiFiAwarePublishDatapathServiceSpecificInfo *)self protocolType];
  if (v6 == [(WiFiAwarePublishDatapathServiceSpecificInfo *)v5 protocolType])
  {
    int v7 = [(WiFiAwarePublishDatapathServiceSpecificInfo *)self servicePort];
    if (v7 == [(WiFiAwarePublishDatapathServiceSpecificInfo *)v5 servicePort])
    {
      if ([(WiFiAwarePublishDatapathServiceSpecificInfo *)self hostnameEquals:v5]) {
        goto LABEL_8;
      }
    }
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (id)description
{
  int64_t v3 = [(WiFiAwarePublishDatapathServiceSpecificInfo *)self protocolType];
  id v4 = "unrecognized";
  if (v3 == 1) {
    id v4 = "UDP";
  }
  if (v3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = "TCP";
  }
  int64_t v6 = NSString;
  unsigned int v7 = [(WiFiAwarePublishDatapathServiceSpecificInfo *)self servicePort];
  BOOL v8 = [(WiFiAwarePublishDatapathServiceSpecificInfo *)self hostname];
  char v9 = [v6 stringWithFormat:@"<WiFiAwarePublishDatapathServiceSpecificInfo: protocolType=%s, servicePort=%hu, hostname=%@>", v5, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[WiFiAwarePublishDatapathServiceSpecificInfo alloc] initWithProtocolType:[(WiFiAwarePublishDatapathServiceSpecificInfo *)self protocolType] servicePort:[(WiFiAwarePublishDatapathServiceSpecificInfo *)self servicePort]];
  uint64_t v5 = [(WiFiAwarePublishDatapathServiceSpecificInfo *)self hostname];
  [(WiFiAwarePublishDatapathServiceSpecificInfo *)v4 setHostname:v5];

  return v4;
}

- (int64_t)protocolType
{
  return self->_protocolType;
}

- (unsigned)servicePort
{
  return self->_servicePort;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
}

- (void).cxx_destruct
{
}

@end