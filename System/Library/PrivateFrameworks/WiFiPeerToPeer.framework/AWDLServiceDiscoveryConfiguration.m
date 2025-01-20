@interface AWDLServiceDiscoveryConfiguration
+ (BOOL)supportsSecureCoding;
- (AWDLServiceDiscoveryConfiguration)initWithCoder:(id)a3;
- (AWDLServiceDiscoveryConfiguration)initWithKey:(id)a3;
- (AWDLServiceDiscoveryConfiguration)initWithKey:(id)a3 value:(id)a4 resolve:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResolve;
- (NSData)serviceKey;
- (NSData)serviceValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AWDLServiceDiscoveryConfiguration

- (AWDLServiceDiscoveryConfiguration)initWithKey:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AWDLServiceDiscoveryConfiguration;
  v5 = [(AWDLServiceDiscoveryConfiguration *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serviceKey = v5->_serviceKey;
    v5->_serviceKey = (NSData *)v6;

    serviceValue = v5->_serviceValue;
    v5->_serviceValue = 0;

    v5->_isResolve = 0;
  }

  return v5;
}

- (AWDLServiceDiscoveryConfiguration)initWithKey:(id)a3 value:(id)a4 resolve:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AWDLServiceDiscoveryConfiguration;
  objc_super v10 = [(AWDLServiceDiscoveryConfiguration *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    serviceKey = v10->_serviceKey;
    v10->_serviceKey = (NSData *)v11;

    uint64_t v13 = [v9 copy];
    serviceValue = v10->_serviceValue;
    v10->_serviceValue = (NSData *)v13;

    v10->_isResolve = a5;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AWDLServiceDiscoveryConfiguration *)self serviceKey];
  [v4 encodeObject:v5 forKey:@"AWDLServiceDiscoveryConfiguration.serviceKey"];

  uint64_t v6 = [(AWDLServiceDiscoveryConfiguration *)self serviceValue];
  [v4 encodeObject:v6 forKey:@"AWDLServiceDiscoveryConfiguration.serviceValue"];

  objc_msgSend(NSNumber, "numberWithBool:", -[AWDLServiceDiscoveryConfiguration isResolve](self, "isResolve"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"AWDLServiceDiscoveryConfiguration.resolve"];
}

- (AWDLServiceDiscoveryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AWDLServiceDiscoveryConfiguration.serviceKey"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AWDLServiceDiscoveryConfiguration.serviceValue"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AWDLServiceDiscoveryConfiguration.resolve"];

  uint64_t v8 = [v7 BOOLValue];
  id v9 = [(AWDLServiceDiscoveryConfiguration *)self initWithKey:v5 value:v6 resolve:v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (AWDLServiceDiscoveryConfiguration *)a3;
  if (self != v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v13 = 0;
      id v7 = 0;
      goto LABEL_15;
    }
    id v7 = v6;
    uint64_t v8 = [(AWDLServiceDiscoveryConfiguration *)self serviceKey];
    id v9 = [(AWDLServiceDiscoveryConfiguration *)v7 serviceKey];
    if (([v8 isEqualToData:v9] & 1) == 0)
    {

LABEL_14:
      BOOL v13 = 0;
      goto LABEL_15;
    }
    objc_super v10 = [(AWDLServiceDiscoveryConfiguration *)self serviceValue];
    uint64_t v11 = [(AWDLServiceDiscoveryConfiguration *)v7 serviceValue];
    if (v10 == v11
      || ([(AWDLServiceDiscoveryConfiguration *)self serviceValue],
          v3 = objc_claimAutoreleasedReturnValue(),
          [(AWDLServiceDiscoveryConfiguration *)v7 serviceValue],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      BOOL v14 = [(AWDLServiceDiscoveryConfiguration *)self isResolve];
      char v12 = v14 ^ [(AWDLServiceDiscoveryConfiguration *)v7 isResolve];
      if (v10 == v11) {
        goto LABEL_13;
      }
    }
    else
    {
      char v12 = 1;
    }

LABEL_13:
    if (v12) {
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  id v7 = 0;
LABEL_8:
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [AWDLServiceDiscoveryConfiguration alloc];
  v5 = [(AWDLServiceDiscoveryConfiguration *)self serviceKey];
  uint64_t v6 = [(AWDLServiceDiscoveryConfiguration *)self serviceValue];
  id v7 = [(AWDLServiceDiscoveryConfiguration *)v4 initWithKey:v5 value:v6 resolve:[(AWDLServiceDiscoveryConfiguration *)self isResolve]];

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(AWDLServiceDiscoveryConfiguration *)self serviceValue];
  if (v4)
  {
    BOOL v5 = [(AWDLServiceDiscoveryConfiguration *)self isResolve];
    uint64_t v6 = "Advertise";
    if (v5) {
      uint64_t v6 = "Resolve";
    }
  }
  else
  {
    uint64_t v6 = "Browse";
  }
  id v7 = objc_msgSend(v3, "stringWithFormat:", @"<AWDLServiceDiscoveryConfiguration %s>", v6);

  return v7;
}

- (NSData)serviceKey
{
  return self->_serviceKey;
}

- (NSData)serviceValue
{
  return self->_serviceValue;
}

- (BOOL)isResolve
{
  return self->_isResolve;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceValue, 0);

  objc_storeStrong((id *)&self->_serviceKey, 0);
}

@end