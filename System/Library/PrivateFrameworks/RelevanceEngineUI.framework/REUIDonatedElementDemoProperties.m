@interface REUIDonatedElementDemoProperties
+ (id)createWithIntent:(id)a3 bundleIdentifier:(id)a4 appName:(id)a5 appIcon:(id)a6;
- (id)appIcon;
- (id)appName;
- (id)bundleIdentifier;
- (id)intent;
@end

@implementation REUIDonatedElementDemoProperties

+ (id)createWithIntent:(id)a3 bundleIdentifier:(id)a4 appName:(id)a5 appIcon:(id)a6
{
  v9 = (INIntent *)a3;
  v10 = (NSString *)a4;
  v11 = (NSString *)a5;
  v12 = (UIImage *)a6;
  v13 = objc_alloc_init(REUIDonatedElementDemoProperties);
  demoIntent = v13->_demoIntent;
  v13->_demoIntent = v9;
  v15 = v9;

  demoBundleIdentifier = v13->_demoBundleIdentifier;
  v13->_demoBundleIdentifier = v10;
  v17 = v10;

  demoAppName = v13->_demoAppName;
  v13->_demoAppName = v11;
  v19 = v11;

  demoAppIcon = v13->_demoAppIcon;
  v13->_demoAppIcon = v12;

  return v13;
}

- (id)intent
{
  return self->_demoIntent;
}

- (id)bundleIdentifier
{
  return self->_demoBundleIdentifier;
}

- (id)appName
{
  return self->_demoAppName;
}

- (id)appIcon
{
  return self->_demoAppIcon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoAppIcon, 0);
  objc_storeStrong((id *)&self->_demoAppName, 0);
  objc_storeStrong((id *)&self->_demoIntent, 0);

  objc_storeStrong((id *)&self->_demoBundleIdentifier, 0);
}

@end