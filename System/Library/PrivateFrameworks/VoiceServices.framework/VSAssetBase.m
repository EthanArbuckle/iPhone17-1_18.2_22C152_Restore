@interface VSAssetBase
+ (BOOL)supportsSecureCoding;
- (BOOL)isPurgeable;
- (NSNumber)compatibilityVersion;
- (NSNumber)contentVersion;
- (NSNumber)downloadSize;
- (NSString)bundleIdentifier;
- (NSString)masteredVersion;
- (VSAssetBase)initWithCoder:(id)a3;
- (int64_t)storage;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCompatibilityVersion:(id)a3;
- (void)setContentVersion:(id)a3;
- (void)setDownloadSize:(id)a3;
- (void)setIsPurgeable:(BOOL)a3;
- (void)setMasteredVersion:(id)a3;
- (void)setStorage:(int64_t)a3;
@end

@implementation VSAssetBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadSize, 0);
  objc_storeStrong((id *)&self->_masteredVersion, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)setStorage:(int64_t)a3
{
  self->_storage = a3;
}

- (void)setMasteredVersion:(id)a3
{
}

- (void)setDownloadSize:(id)a3
{
}

- (void)setContentVersion:(id)a3
{
}

- (void)setCompatibilityVersion:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)masteredVersion
{
  return self->_masteredVersion;
}

- (NSNumber)downloadSize
{
  return self->_downloadSize;
}

- (NSNumber)contentVersion
{
  return self->_contentVersion;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setIsPurgeable:(BOOL)a3
{
  self->_isPurgeable = a3;
}

- (int64_t)storage
{
  return self->_storage;
}

- (BOOL)isPurgeable
{
  return self->_isPurgeable;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (VSAssetBase)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VSAssetBase;
  v5 = [(VSAssetBase *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_compatibilityVersion"];
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contentVersion"];
    contentVersion = v5->_contentVersion;
    v5->_contentVersion = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_masteredVersion"];
    masteredVersion = v5->_masteredVersion;
    v5->_masteredVersion = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_downloadSize"];
    downloadSize = v5->_downloadSize;
    v5->_downloadSize = (NSNumber *)v14;

    v5->_isPurgeable = [v4 decodeBoolForKey:@"_isPurgeable"];
    v5->_storage = [v4 decodeIntegerForKey:@"_storage"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"_bundleIdentifier"];
  [v5 encodeObject:self->_compatibilityVersion forKey:@"_compatibilityVersion"];
  [v5 encodeObject:self->_contentVersion forKey:@"_contentVersion"];
  [v5 encodeObject:self->_masteredVersion forKey:@"_masteredVersion"];
  [v5 encodeObject:self->_downloadSize forKey:@"_downloadSize"];
  [v5 encodeBool:self->_isPurgeable forKey:@"_isPurgeable"];
  [v5 encodeInteger:self->_storage forKey:@"_storage"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end