@interface TPSInstalledAppInfo
- (NSString)bundleID;
- (NSString)maxVersion;
- (NSString)minVersion;
- (TPSInstalledAppInfo)initWithDictionary:(id)a3;
- (id)debugDescription;
- (void)setBundleID:(id)a3;
- (void)setMaxVersion:(id)a3;
- (void)setMinVersion:(id)a3;
@end

@implementation TPSInstalledAppInfo

- (TPSInstalledAppInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TPSInstalledAppInfo;
  v5 = [(TPSInstalledAppInfo *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 TPSSafeStringForKey:@"bundleId"];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1F4017D10;
    }
    objc_storeStrong((id *)&v5->_bundleID, v8);

    uint64_t v9 = [v4 TPSSafeStringForKey:@"minVersion"];
    minVersion = v5->_minVersion;
    v5->_minVersion = (NSString *)v9;

    uint64_t v11 = [v4 TPSSafeStringForKey:@"maxVersion"];
    maxVersion = v5->_maxVersion;
    v5->_maxVersion = (NSString *)v11;
  }
  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v10.receiver = self;
  v10.super_class = (Class)TPSInstalledAppInfo;
  id v4 = [(TPSSerializableObject *)&v10 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(TPSInstalledAppInfo *)self bundleID];
  [v5 appendFormat:@"%@ = %@", @"bundleID", v6];

  v7 = [(TPSInstalledAppInfo *)self minVersion];
  [v5 appendFormat:@"; %@ = %@", @"minVersion", v7];

  v8 = [(TPSInstalledAppInfo *)self maxVersion];
  [v5 appendFormat:@"; %@ = %@", @"maxVersion", v8];

  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)minVersion
{
  return self->_minVersion;
}

- (void)setMinVersion:(id)a3
{
}

- (NSString)maxVersion
{
  return self->_maxVersion;
}

- (void)setMaxVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxVersion, 0);
  objc_storeStrong((id *)&self->_minVersion, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end