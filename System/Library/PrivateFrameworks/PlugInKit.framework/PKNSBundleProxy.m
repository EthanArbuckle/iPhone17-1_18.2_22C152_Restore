@interface PKNSBundleProxy
- (BOOL)loadAndReturnError:(id *)a3;
- (Class)principalClass;
- (NSBundle)_underlyingNSBundle;
- (NSDictionary)infoDictionary;
- (NSDictionary)localizedInfoDictionary;
- (NSString)bundleIdentifier;
- (NSURL)builtInPlugInsURL;
- (NSURL)bundleURL;
- (PKNSBundleProxy)initWithNSBundle:(id)a3;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5;
@end

@implementation PKNSBundleProxy

- (PKNSBundleProxy)initWithNSBundle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKNSBundleProxy;
  v6 = [(PKNSBundleProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__underlyingNSBundle, a3);
  }

  return v7;
}

- (NSURL)bundleURL
{
  v2 = [(PKNSBundleProxy *)self _underlyingNSBundle];
  v3 = [v2 bundleURL];

  return (NSURL *)v3;
}

- (NSString)bundleIdentifier
{
  v2 = [(PKNSBundleProxy *)self _underlyingNSBundle];
  v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (NSURL)builtInPlugInsURL
{
  v2 = [(PKNSBundleProxy *)self _underlyingNSBundle];
  v3 = [v2 builtInPlugInsURL];

  return (NSURL *)v3;
}

- (NSDictionary)infoDictionary
{
  v2 = [(PKNSBundleProxy *)self _underlyingNSBundle];
  v3 = [v2 infoDictionary];

  return (NSDictionary *)v3;
}

- (NSDictionary)localizedInfoDictionary
{
  v2 = [(PKNSBundleProxy *)self _underlyingNSBundle];
  v3 = [v2 localizedInfoDictionary];

  return (NSDictionary *)v3;
}

- (Class)principalClass
{
  v2 = [(PKNSBundleProxy *)self _underlyingNSBundle];
  v3 = [v2 principalClass];

  return (Class)v3;
}

- (BOOL)loadAndReturnError:(id *)a3
{
  v4 = [(PKNSBundleProxy *)self _underlyingNSBundle];
  LOBYTE(a3) = [v4 loadAndReturnError:a3];

  return (char)a3;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PKNSBundleProxy *)self _underlyingNSBundle];
  v12 = [v11 localizedStringForKey:v10 value:v9 table:v8];

  return v12;
}

- (NSBundle)_underlyingNSBundle
{
  return (NSBundle *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end