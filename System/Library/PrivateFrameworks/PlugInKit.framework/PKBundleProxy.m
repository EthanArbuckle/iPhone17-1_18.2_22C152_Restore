@interface PKBundleProxy
- (LSBundleProxy)lsObject;
- (NSDictionary)entitlements;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)localizedName;
- (NSURL)bundleURL;
- (NSURL)dataContainerURL;
- (PKBundleProxy)initWithLSBundleProxy:(id)a3;
@end

@implementation PKBundleProxy

- (PKBundleProxy)initWithLSBundleProxy:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKBundleProxy;
  v6 = [(PKBundleProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lsObject, a3);
  }

  return v7;
}

- (NSURL)bundleURL
{
  v2 = [(PKBundleProxy *)self lsObject];
  v3 = [v2 bundleURL];

  return (NSURL *)v3;
}

- (NSString)bundleIdentifier
{
  v2 = [(PKBundleProxy *)self lsObject];
  v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (NSString)localizedName
{
  v2 = [(PKBundleProxy *)self lsObject];
  v3 = [v2 localizedName];

  return (NSString *)v3;
}

- (NSDictionary)entitlements
{
  v2 = [(PKBundleProxy *)self lsObject];
  v3 = [v2 entitlements];

  return (NSDictionary *)v3;
}

- (NSURL)dataContainerURL
{
  v2 = [(PKBundleProxy *)self lsObject];
  v3 = [v2 dataContainerURL];

  return (NSURL *)v3;
}

- (NSString)bundleVersion
{
  v2 = [(PKBundleProxy *)self lsObject];
  v3 = [v2 bundleVersion];

  return (NSString *)v3;
}

- (LSBundleProxy)lsObject
{
  return self->_lsObject;
}

- (void).cxx_destruct
{
}

@end