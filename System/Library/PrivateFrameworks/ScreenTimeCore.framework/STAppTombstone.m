@interface STAppTombstone
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAppTombstone:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)uniqueIdentifier;
- (STAppTombstone)initWithBundleIdentifier:(id)a3 uniqueIdentifier:(id)a4;
- (STAppTombstone)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STAppTombstone

- (STAppTombstone)initWithBundleIdentifier:(id)a3 uniqueIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)STAppTombstone;
  id v5 = a4;
  id v6 = a3;
  v7 = [(STAppTombstone *)&v13 init];
  v8 = (NSString *)objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  bundleIdentifier = v7->_bundleIdentifier;
  v7->_bundleIdentifier = v8;

  v10 = (NSString *)[v5 copy];
  uniqueIdentifier = v7->_uniqueIdentifier;
  v7->_uniqueIdentifier = v10;

  return v7;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STAppTombstone *)self bundleIdentifier];
  id v5 = [(STAppTombstone *)self uniqueIdentifier];
  id v6 = +[NSString stringWithFormat:@"<%@ { BundleID: %@, UniqueIdentifier: %@ }>", v3, v4, v5];

  return v6;
}

- (STAppTombstone)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];

  v7 = [(STAppTombstone *)self initWithBundleIdentifier:v5 uniqueIdentifier:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STAppTombstone *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  id v6 = [(STAppTombstone *)self uniqueIdentifier];
  [v4 encodeObject:v6 forKey:@"uniqueIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  bundleIdentifier = self->_bundleIdentifier;
  uniqueIdentifier = self->_uniqueIdentifier;
  return [v4 initWithBundleIdentifier:bundleIdentifier uniqueIdentifier:uniqueIdentifier];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STAppTombstone *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STAppTombstone *)self isEqualToAppTombstone:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToAppTombstone:(id)a3
{
  id v4 = (STAppTombstone *)a3;
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    BOOL v5 = [(STAppTombstone *)self bundleIdentifier];
    id v6 = [(STAppTombstone *)v4 bundleIdentifier];
    if ([v5 isEqualToString:v6])
    {
      v7 = [(STAppTombstone *)self uniqueIdentifier];
      v8 = [(STAppTombstone *)v4 uniqueIdentifier];
      unsigned __int8 v9 = [v7 isEqualToString:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(STAppTombstone *)self uniqueIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end