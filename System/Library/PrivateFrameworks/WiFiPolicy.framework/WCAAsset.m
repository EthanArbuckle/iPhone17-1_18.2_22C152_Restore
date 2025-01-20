@interface WCAAsset
+ (BOOL)supportsSecureCoding;
+ (WCAAsset)assetWithName:(id)a3 andExtension:(id)a4;
+ (id)beaconsDataAsset;
+ (id)wifiBehaviorPlistAsset;
- (BOOL)isEqual:(id)a3;
- (MAAsset)latestInstalledAsset;
- (MAAsset)latestNotInstalledAsset;
- (NSString)extension;
- (NSString)name;
- (WCAAsset)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)installedAssetVersion;
- (unint64_t)latestInstalledVersion;
- (unint64_t)latestNotInstalledVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setExtension:(id)a3;
- (void)setInstalledAssetVersion:(unint64_t)a3;
- (void)setLatestInstalledAsset:(id)a3;
- (void)setLatestInstalledVersion:(unint64_t)a3;
- (void)setLatestNotInstalledAsset:(id)a3;
- (void)setLatestNotInstalledVersion:(unint64_t)a3;
- (void)setName:(id)a3;
@end

@implementation WCAAsset

- (void)encodeWithCoder:(id)a3
{
  extension = self->_extension;
  id v5 = a3;
  [v5 encodeObject:extension forKey:@"_extension"];
  [v5 encodeObject:self->_name forKey:@"_name"];
}

+ (id)wifiBehaviorPlistAsset
{
  return +[WCAAsset assetWithName:@"com.apple.wifi.cloud-defaults" andExtension:@"plist"];
}

+ (WCAAsset)assetWithName:(id)a3 andExtension:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setName:v7];

  [v8 setExtension:v6];

  return (WCAAsset *)v8;
}

- (void)setName:(id)a3
{
}

- (void)setExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestNotInstalledAsset, 0);
  objc_storeStrong((id *)&self->_latestInstalledAsset, 0);
  objc_storeStrong((id *)&self->_extension, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)beaconsDataAsset
{
  return +[WCAAsset assetWithName:@"beaconData" andExtension:@"db"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ : %p ", v5, self];

  [v6 appendFormat:@"name: %@", self->_name];
  [v6 appendFormat:@", extension: %@", self->_extension];
  [v6 appendString:@">"];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(WCAAsset *)self name];
    id v7 = [v5 name];
    if ([v6 isEqualToString:v7])
    {
      id v8 = [(WCAAsset *)self extension];
      v9 = [v5 extension];
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

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WCAAsset)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WCAAsset;
  id v3 = a3;
  id v4 = [(WCAAsset *)&v10 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_extension", v10.receiver, v10.super_class);
  extension = v4->_extension;
  v4->_extension = (NSString *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];

  name = v4->_name;
  v4->_name = (NSString *)v7;

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)extension
{
  return self->_extension;
}

- (unint64_t)latestInstalledVersion
{
  return self->_latestInstalledVersion;
}

- (void)setLatestInstalledVersion:(unint64_t)a3
{
  self->_latestInstalledVersion = a3;
}

- (MAAsset)latestInstalledAsset
{
  return self->_latestInstalledAsset;
}

- (void)setLatestInstalledAsset:(id)a3
{
}

- (unint64_t)installedAssetVersion
{
  return self->_installedAssetVersion;
}

- (void)setInstalledAssetVersion:(unint64_t)a3
{
  self->_installedAssetVersion = a3;
}

- (unint64_t)latestNotInstalledVersion
{
  return self->_latestNotInstalledVersion;
}

- (void)setLatestNotInstalledVersion:(unint64_t)a3
{
  self->_latestNotInstalledVersion = a3;
}

- (MAAsset)latestNotInstalledAsset
{
  return self->_latestNotInstalledAsset;
}

- (void)setLatestNotInstalledAsset:(id)a3
{
}

@end