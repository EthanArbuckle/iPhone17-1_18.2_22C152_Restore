@interface _NIWiFiRangingTestConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NIDiscoveryToken)peerDiscoveryToken;
- (NSArray)monitoredRegions;
- (NSDictionary)parameters;
- (_NIWiFiRangingTestConfiguration)initWithCoder:(id)a3;
- (_NIWiFiRangingTestConfiguration)initWithDiscoveryToken:(id)a3 wifiRangingParameters:(id)a4 regions:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMonitoredRegions:(id)a3;
@end

@implementation _NIWiFiRangingTestConfiguration

- (_NIWiFiRangingTestConfiguration)initWithDiscoveryToken:(id)a3 wifiRangingParameters:(id)a4 regions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_NIWiFiRangingTestConfiguration;
  v12 = [(NIConfiguration *)&v15 initInternal];
  v13 = (_NIWiFiRangingTestConfiguration *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 4, a3);
    objc_storeStrong((id *)&v13->_parameters, a4);
    objc_storeStrong((id *)&v13->_monitoredRegions, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_NIWiFiRangingTestConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v13, "copyWithZone:");
  id v6 = [(NIDiscoveryToken *)self->_peerDiscoveryToken copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  if (self->_parameters)
  {
    v8 = [+[NSDictionary allocWithZone:a3] initWithDictionary:self->_parameters copyItems:1];
    id v9 = (void *)v5[5];
    v5[5] = v8;
  }
  if (self->_monitoredRegions)
  {
    id v10 = [+[NSArray allocWithZone:a3] initWithArray:self->_monitoredRegions copyItems:1];
    id v11 = (void *)v5[6];
    v5[6] = v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_NIWiFiRangingTestConfiguration;
  [(NIConfiguration *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_peerDiscoveryToken forKey:@"peerDiscoveryToken"];
  [v4 encodeObject:self->_parameters forKey:@"parameters"];
  [v4 encodeObject:self->_monitoredRegions forKey:@"monitoredRegions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NIWiFiRangingTestConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  id v9 = +[NSArray arrayWithObjects:v19 count:2];
  id v10 = +[NSSet setWithArray:v9];
  id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"monitoredRegions"];

  v18.receiver = self;
  v18.super_class = (Class)_NIWiFiRangingTestConfiguration;
  v12 = [(NIConfiguration *)&v18 initWithCoder:v4];
  if (v12)
  {
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerDiscoveryToken"];
    peerDiscoveryToken = v12->_peerDiscoveryToken;
    v12->_peerDiscoveryToken = (NIDiscoveryToken *)v13;

    uint64_t v15 = [v4 decodeDictionaryWithKeysOfClasses:v5 objectsOfClasses:v8 forKey:@"parameters"];
    parameters = v12->_parameters;
    v12->_parameters = (NSDictionary *)v15;

    objc_storeStrong((id *)&v12->_monitoredRegions, v11);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = (_NIWiFiRangingTestConfiguration *)v4;
    uint64_t v6 = v5;
    if (v5 == self)
    {
      unsigned __int8 v13 = 1;
    }
    else
    {
      parameters = self->_parameters;
      v8 = [(_NIWiFiRangingTestConfiguration *)v5 parameters];
      if ([(NSDictionary *)parameters isEqual:v8])
      {
        peerDiscoveryToken = self->_peerDiscoveryToken;
        id v10 = [(_NIWiFiRangingTestConfiguration *)v6 peerDiscoveryToken];
        if ([(NIDiscoveryToken *)peerDiscoveryToken isEqual:v10])
        {
          monitoredRegions = self->_monitoredRegions;
          v12 = [(_NIWiFiRangingTestConfiguration *)v6 monitoredRegions];
          unsigned __int8 v13 = [(NSArray *)monitoredRegions isEqual:v12];
        }
        else
        {
          unsigned __int8 v13 = 0;
        }
      }
      else
      {
        unsigned __int8 v13 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NIDiscoveryToken *)self->_peerDiscoveryToken hash];
  return (unint64_t)[(NSDictionary *)self->_parameters hash] ^ v3;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v6 = [(_NIWiFiRangingTestConfiguration *)self descriptionInternal];
  id v7 = [v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithString:&stru_100869B68];
  peerDiscoveryToken = self->_peerDiscoveryToken;
  if (peerDiscoveryToken)
  {
    objc_super v5 = [(NIDiscoveryToken *)peerDiscoveryToken descriptionInternal];
    [v3 appendFormat:@"Peer Token: %@", v5];
  }
  else
  {
    [v3 appendString:@"Peer Token: null"];
  }
  [v3 appendFormat:@", WiFi Ranging Parameters: %@", self->_parameters];
  [v3 appendFormat:@", Regions: %@", self->_monitoredRegions];

  return v3;
}

- (NIDiscoveryToken)peerDiscoveryToken
{
  return self->_peerDiscoveryToken;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSArray)monitoredRegions
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMonitoredRegions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredRegions, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_peerDiscoveryToken, 0);
}

@end