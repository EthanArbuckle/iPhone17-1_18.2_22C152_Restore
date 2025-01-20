@interface NSSUsageApp
+ (BOOL)supportsSecureCoding;
- (NSSUsageApp)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)name;
- (id)description;
- (unint64_t)dynamicSize;
- (unint64_t)sharedSize;
- (unint64_t)staticSize;
- (unint64_t)totalSize;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setDataSize:(unint64_t)a3;
- (void)setDynamicSize:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setStaticSize:(unint64_t)a3;
- (void)setTotalSize:(unint64_t)a3;
@end

@implementation NSSUsageApp

- (unint64_t)totalSize
{
  unint64_t staticSize = self->_staticSize;
  return [(NSSUsageApp *)self dataSize] + staticSize;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<NSSUsageApp: %p; name: \"%@\", bundleIdentifier: \"%@\", bundleVersion: \"%@\", staticSize: %llu, dynamicSize: %llu, sharedSize: %llu>",
               self,
               self->_name,
               self->_bundleIdentifier,
               self->_bundleVersion,
               self->_staticSize,
               self->_dynamicSize,
               self->_sharedSize);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeObject:self->_bundleVersion forKey:@"bundleVersion"];
  [v5 encodeInt64:self->_staticSize forKey:@"staticSize"];
  [v5 encodeInt64:self->_dynamicSize forKey:@"dynamicSize"];
  [v5 encodeInt64:self->_sharedSize forKey:@"sharedSize"];
}

- (NSSUsageApp)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSSUsageApp;
  id v5 = [(NSSUsageApp *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleVersion"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v10;

    v5->_unint64_t staticSize = [v4 decodeInt64ForKey:@"staticSize"];
    v5->_dynamicSize = [v4 decodeInt64ForKey:@"dynamicSize"];
    v5->_sharedSize = [v4 decodeInt64ForKey:@"sharedSize"];
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (unint64_t)staticSize
{
  return self->_staticSize;
}

- (void)setStaticSize:(unint64_t)a3
{
  self->_unint64_t staticSize = a3;
}

- (unint64_t)dynamicSize
{
  return self->_dynamicSize;
}

- (void)setDynamicSize:(unint64_t)a3
{
  self->_dynamicSize = a3;
}

- (unint64_t)sharedSize
{
  return self->_sharedSize;
}

- (void)setDataSize:(unint64_t)a3
{
  self->_dataSize = a3;
}

- (void)setTotalSize:(unint64_t)a3
{
  self->_totalSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end