@interface InstalledApp
- (InstalledApp)initWithBundleIdentifier:(id)a3 supportedMediaCategories:(id)a4 supportedIntents:(id)a5 appName:(id)a6;
- (NSArray)supportedIntents;
- (NSArray)supportedMediaCategories;
- (NSString)appName;
- (NSString)bundleIdentifier;
- (id)description;
- (void)setAppName:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setSupportedIntents:(id)a3;
- (void)setSupportedMediaCategories:(id)a3;
@end

@implementation InstalledApp

- (InstalledApp)initWithBundleIdentifier:(id)a3 supportedMediaCategories:(id)a4 supportedIntents:(id)a5 appName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)InstalledApp;
  v15 = [(InstalledApp *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v16->_supportedMediaCategories, a4);
    objc_storeStrong((id *)&v16->_supportedIntents, a5);
    objc_storeStrong((id *)&v16->_appName, a6);
  }

  return v16;
}

- (id)description
{
  v2 = NSString;
  v3 = [(InstalledApp *)self bundleIdentifier];
  v4 = [v2 stringWithFormat:@"InstalledApp { bundleIdentifier: %@ }", v3];

  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSArray)supportedMediaCategories
{
  return self->_supportedMediaCategories;
}

- (void)setSupportedMediaCategories:(id)a3
{
}

- (NSArray)supportedIntents
{
  return self->_supportedIntents;
}

- (void)setSupportedIntents:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_supportedIntents, 0);
  objc_storeStrong((id *)&self->_supportedMediaCategories, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end