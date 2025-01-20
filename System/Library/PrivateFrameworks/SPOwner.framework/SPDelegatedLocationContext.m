@interface SPDelegatedLocationContext
+ (BOOL)supportsSecureCoding;
- (BOOL)subscribe;
- (NSArray)uuids;
- (NSString)bundleIdentifier;
- (SPDelegatedLocationContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setSubscribe:(BOOL)a3;
- (void)setUuids:(id)a3;
@end

@implementation SPDelegatedLocationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(SPDelegatedLocationContext *)self uuids];
  [v6 encodeObject:v4 forKey:@"uuids"];

  v5 = [(SPDelegatedLocationContext *)self bundleIdentifier];
  [v6 encodeObject:v5 forKey:@"bundleIdentifier"];

  objc_msgSend(v6, "encodeBool:forKey:", -[SPDelegatedLocationContext subscribe](self, "subscribe"), @"subscribe");
}

- (SPDelegatedLocationContext)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"uuids"];
  [(SPDelegatedLocationContext *)self setUuids:v8];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  [(SPDelegatedLocationContext *)self setBundleIdentifier:v9];

  uint64_t v10 = [v5 decodeBoolForKey:@"subscribe"];
  [(SPDelegatedLocationContext *)self setSubscribe:v10];
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  id v5 = [(SPDelegatedLocationContext *)self uuids];
  [v4 setUuids:v5];

  id v6 = [(SPDelegatedLocationContext *)self bundleIdentifier];
  [v4 setBundleIdentifier:v6];

  objc_msgSend(v4, "setSubscribe:", -[SPDelegatedLocationContext subscribe](self, "subscribe"));
  return v4;
}

- (NSArray)uuids
{
  return self->_uuids;
}

- (void)setUuids:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)subscribe
{
  return self->_subscribe;
}

- (void)setSubscribe:(BOOL)a3
{
  self->_subscribe = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_uuids, 0);
}

@end