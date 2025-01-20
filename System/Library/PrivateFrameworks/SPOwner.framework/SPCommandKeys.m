@interface SPCommandKeys
+ (BOOL)supportsSecureCoding;
- (NSData)address;
- (NSData)commandKey;
- (NSData)connectionToken;
- (NSData)nearbyToken;
- (NSDateInterval)dateInterval;
- (NSString)description;
- (SPBeaconingKey)beaconingKey;
- (SPCommandKeys)initWithBeaconingKey:(id)a3 commandKey:(id)a4 connectionToken:(id)a5 nearbyToken:(id)a6;
- (SPCommandKeys)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBeaconingKey:(id)a3;
- (void)setCommandKey:(id)a3;
- (void)setConnectionToken:(id)a3;
- (void)setNearbyToken:(id)a3;
@end

@implementation SPCommandKeys

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPCommandKeys)initWithBeaconingKey:(id)a3 commandKey:(id)a4 connectionToken:(id)a5 nearbyToken:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SPCommandKeys;
  v15 = [(SPCommandKeys *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_beaconingKey, a3);
    objc_storeStrong((id *)&v16->_commandKey, a4);
    objc_storeStrong((id *)&v16->_connectionToken, a5);
    objc_storeStrong((id *)&v16->_nearbyToken, a6);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPCommandKeys alloc];
  v5 = [(SPCommandKeys *)self beaconingKey];
  v6 = [(SPCommandKeys *)self commandKey];
  v7 = [(SPCommandKeys *)self connectionToken];
  v8 = [(SPCommandKeys *)self nearbyToken];
  v9 = [(SPCommandKeys *)v4 initWithBeaconingKey:v5 commandKey:v6 connectionToken:v7 nearbyToken:v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  beaconingKey = self->_beaconingKey;
  id v5 = a3;
  [v5 encodeObject:beaconingKey forKey:@"beaconingKey"];
  [v5 encodeObject:self->_commandKey forKey:@"commandKey"];
  [v5 encodeObject:self->_connectionToken forKey:@"connectionToken"];
  [v5 encodeObject:self->_nearbyToken forKey:@"nearbyToken"];
}

- (SPCommandKeys)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beaconingKey"];
  beaconingKey = self->_beaconingKey;
  self->_beaconingKey = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"commandKey"];
  commandKey = self->_commandKey;
  self->_commandKey = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectionToken"];
  connectionToken = self->_connectionToken;
  self->_connectionToken = v9;

  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nearbyToken"];

  nearbyToken = self->_nearbyToken;
  self->_nearbyToken = v11;

  return self;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SPCommandKeys *)self beaconingKey];
  v6 = [(SPCommandKeys *)self commandKey];
  uint64_t v7 = [v6 length];
  v8 = [(SPCommandKeys *)self connectionToken];
  uint64_t v9 = [v8 length];
  v10 = [(SPCommandKeys *)self nearbyToken];
  id v11 = [v3 stringWithFormat:@"<%@: %p -- beaconingKey: %@ commandKey: %lu connectionToken: %lu nearbyToken: %lu>", v4, self, v5, v7, v9, objc_msgSend(v10, "length")];

  return (NSString *)v11;
}

- (NSData)address
{
  v2 = [(SPCommandKeys *)self beaconingKey];
  v3 = [v2 key];
  uint64_t v4 = objc_msgSend(v3, "subdataWithRange:", 0, 6);

  return (NSData *)v4;
}

- (NSDateInterval)dateInterval
{
  v2 = [(SPCommandKeys *)self beaconingKey];
  v3 = [v2 dateInterval];

  return (NSDateInterval *)v3;
}

- (SPBeaconingKey)beaconingKey
{
  return self->_beaconingKey;
}

- (void)setBeaconingKey:(id)a3
{
}

- (NSData)commandKey
{
  return self->_commandKey;
}

- (void)setCommandKey:(id)a3
{
}

- (NSData)connectionToken
{
  return self->_connectionToken;
}

- (void)setConnectionToken:(id)a3
{
}

- (NSData)nearbyToken
{
  return self->_nearbyToken;
}

- (void)setNearbyToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyToken, 0);
  objc_storeStrong((id *)&self->_connectionToken, 0);
  objc_storeStrong((id *)&self->_commandKey, 0);

  objc_storeStrong((id *)&self->_beaconingKey, 0);
}

@end