@interface SPCBPeripheralManagerSessionKey
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleId;
- (NSUUID)userIdentifier;
- (SPCBPeripheralManagerSessionKey)initWithCoder:(id)a3;
- (SPCBPeripheralManagerSessionKey)initWithUserIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPCBPeripheralManagerSessionKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPCBPeripheralManagerSessionKey)initWithUserIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SPCBPeripheralManagerSessionKey;
  v8 = [(SPCBPeripheralManagerSessionKey *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    userIdentifier = v8->_userIdentifier;
    v8->_userIdentifier = (NSUUID *)v9;

    uint64_t v11 = [v7 copy];
    bundleId = v8->_bundleId;
    v8->_bundleId = (NSString *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SPCBPeripheralManagerSessionKey *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(SPCBPeripheralManagerSessionKey *)self userIdentifier];
      id v7 = [(SPCBPeripheralManagerSessionKey *)v5 userIdentifier];
      if ([v6 isEqual:v7])
      {
        v8 = [(SPCBPeripheralManagerSessionKey *)self bundleId];
        uint64_t v9 = [(SPCBPeripheralManagerSessionKey *)v5 bundleId];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(SPCBPeripheralManagerSessionKey *)self userIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(SPCBPeripheralManagerSessionKey *)self bundleId];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(SPCBPeripheralManagerSessionKey *)self userIdentifier];
  v5 = [(SPCBPeripheralManagerSessionKey *)self bundleId];
  unint64_t v6 = [v3 stringWithFormat:@"<%@:%@>", v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [SPCBPeripheralManagerSessionKey alloc];
  userIdentifier = self->_userIdentifier;
  bundleId = self->_bundleId;

  return [(SPCBPeripheralManagerSessionKey *)v4 initWithUserIdentifier:userIdentifier bundleIdentifier:bundleId];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SPCBPeripheralManagerSessionKey *)self userIdentifier];
  [v4 encodeObject:v5 forKey:@"userIdentifier"];

  id v6 = [(SPCBPeripheralManagerSessionKey *)self bundleId];
  [v4 encodeObject:v6 forKey:@"bundleId"];
}

- (SPCBPeripheralManagerSessionKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userIdentifier"];
  userIdentifier = self->_userIdentifier;
  self->_userIdentifier = v5;

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];

  bundleId = self->_bundleId;
  self->_bundleId = v7;

  return self;
}

- (NSUUID)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);

  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end