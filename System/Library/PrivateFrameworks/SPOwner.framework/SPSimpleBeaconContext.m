@interface SPSimpleBeaconContext
+ (BOOL)supportsSecureCoding;
+ (id)defaultContext;
+ (id)deviceManagerContext;
+ (id)fmipItemContext;
+ (id)fmipItemContextForBeaconUUIDs:(id)a3;
- (BOOL)sendInitialBeacons;
- (NSArray)filterBeaconUUIDs;
- (NSString)bundleIdentifier;
- (SPSimpleBeaconContext)initWithCoder:(id)a3;
- (SPSimpleBeaconContext)initWithFetchProperties:(unint64_t)a3 filterBeaconUUIDs:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)fetchProperties;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setFetchProperties:(unint64_t)a3;
- (void)setFilterBeaconUUIDs:(id)a3;
- (void)setSendInitialBeacons:(BOOL)a3;
@end

@implementation SPSimpleBeaconContext

+ (id)defaultContext
{
  v2 = [SPSimpleBeaconContext alloc];
  v3 = [(SPSimpleBeaconContext *)v2 initWithFetchProperties:0 filterBeaconUUIDs:MEMORY[0x1E4F1CBF0]];

  return v3;
}

+ (id)deviceManagerContext
{
  v2 = [SPSimpleBeaconContext alloc];
  v3 = [(SPSimpleBeaconContext *)v2 initWithFetchProperties:511 filterBeaconUUIDs:MEMORY[0x1E4F1CBF0]];

  return v3;
}

+ (id)fmipItemContext
{
  v2 = [SPSimpleBeaconContext alloc];
  v3 = [(SPSimpleBeaconContext *)v2 initWithFetchProperties:512 filterBeaconUUIDs:MEMORY[0x1E4F1CBF0]];

  return v3;
}

+ (id)fmipItemContextForBeaconUUIDs:(id)a3
{
  id v3 = a3;
  v4 = [[SPSimpleBeaconContext alloc] initWithFetchProperties:512 filterBeaconUUIDs:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPSimpleBeaconContext)initWithFetchProperties:(unint64_t)a3 filterBeaconUUIDs:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SPSimpleBeaconContext;
  v8 = [(SPSimpleBeaconContext *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_fetchProperties = a3;
    v10 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v11 = [v10 bundleIdentifier];
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v11;

    v9->_sendInitialBeacons = 1;
    objc_storeStrong((id *)&v9->_filterBeaconUUIDs, a4);
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeDouble:@"fetchProperties" forKey:(double)self->_fetchProperties];
  [v5 encodeBool:self->_sendInitialBeacons forKey:@"sendInitialBeacons"];
  [v5 encodeObject:self->_filterBeaconUUIDs forKey:@"filterBeaconUUIDs"];
}

- (SPSimpleBeaconContext)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v5;

  [v4 decodeDoubleForKey:@"fetchProperties"];
  self->_fetchProperties = (unint64_t)v7;
  self->_sendInitialBeacons = [v4 decodeBoolForKey:@"sendInitialBeacons"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v10 = [v8 setWithArray:v9];
  uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"filterBeaconUUIDs"];

  filterBeaconUUIDs = self->_filterBeaconUUIDs;
  self->_filterBeaconUUIDs = v11;

  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  id v5 = [(SPSimpleBeaconContext *)self bundleIdentifier];
  [v4 setBundleIdentifier:v5];

  objc_msgSend(v4, "setFetchProperties:", -[SPSimpleBeaconContext fetchProperties](self, "fetchProperties"));
  objc_msgSend(v4, "setSendInitialBeacons:", -[SPSimpleBeaconContext sendInitialBeacons](self, "sendInitialBeacons"));
  v6 = [(SPSimpleBeaconContext *)self filterBeaconUUIDs];
  [v4 setFilterBeaconUUIDs:v6];

  return v4;
}

- (BOOL)sendInitialBeacons
{
  return self->_sendInitialBeacons;
}

- (void)setSendInitialBeacons:(BOOL)a3
{
  self->_sendInitialBeacons = a3;
}

- (NSArray)filterBeaconUUIDs
{
  return self->_filterBeaconUUIDs;
}

- (void)setFilterBeaconUUIDs:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (unint64_t)fetchProperties
{
  return self->_fetchProperties;
}

- (void)setFetchProperties:(unint64_t)a3
{
  self->_fetchProperties = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_filterBeaconUUIDs, 0);
}

@end