@interface SFClientGetDeviceAssetsResults
+ (BOOL)supportsSecureCoding;
- (NSString)assetBundlePath;
- (SFClientGetDeviceAssetsResults)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetBundlePath:(id)a3;
@end

@implementation SFClientGetDeviceAssetsResults

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFClientGetDeviceAssetsResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFClientGetDeviceAssetsResults;
  v5 = [(SFClientGetDeviceAssetsResults *)&v9 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  assetBundlePath = self->_assetBundlePath;
  if (assetBundlePath) {
    [a3 encodeObject:assetBundlePath forKey:@"abp"];
  }
}

- (NSString)assetBundlePath
{
  return self->_assetBundlePath;
}

- (void)setAssetBundlePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end