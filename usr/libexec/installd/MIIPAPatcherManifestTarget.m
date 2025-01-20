@interface MIIPAPatcherManifestTarget
- (MIIPAPatcherManifestTarget)initWithCFBundleVersion:(id)a3 cfBundleShortVersion:(id)a4 bundleIdentifier:(id)a5 uiSupportedDevices:(id)a6 infoPlistHash:(id)a7 infoPlistHashAlgorithm:(id)a8;
- (NSArray)uiSupportedDevices;
- (NSString)bundleIdentifier;
- (NSString)cfBundleShortVersion;
- (NSString)cfBundleVersion;
- (NSString)infoPlistHash;
- (NSString)infoPlistHashAlgorithm;
- (id)plistRepresentation;
@end

@implementation MIIPAPatcherManifestTarget

- (MIIPAPatcherManifestTarget)initWithCFBundleVersion:(id)a3 cfBundleShortVersion:(id)a4 bundleIdentifier:(id)a5 uiSupportedDevices:(id)a6 infoPlistHash:(id)a7 infoPlistHashAlgorithm:(id)a8
{
  id v22 = a3;
  id v21 = a4;
  id v20 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)MIIPAPatcherManifestTarget;
  v18 = [(MIIPAPatcherManifestTarget *)&v23 init];
  if (v18)
  {
    if (qword_1000A5F78 != -1) {
      dispatch_once(&qword_1000A5F78, &stru_10008CE80);
    }
    objc_storeStrong((id *)&v18->_cfBundleVersion, a3);
    objc_storeStrong((id *)&v18->_cfBundleShortVersion, a4);
    objc_storeStrong((id *)&v18->_bundleIdentifier, a5);
    objc_storeStrong((id *)&v18->_uiSupportedDevices, a6);
    objc_storeStrong((id *)&v18->_infoPlistHash, a7);
    objc_storeStrong((id *)&v18->_infoPlistHashAlgorithm, a8);
  }

  return v18;
}

- (id)plistRepresentation
{
  v14[0] = kCFBundleVersionKey;
  v3 = [(MIIPAPatcherManifestTarget *)self cfBundleVersion];
  v15[0] = v3;
  v14[1] = _kCFBundleShortVersionStringKey;
  v4 = [(MIIPAPatcherManifestTarget *)self cfBundleShortVersion];
  v15[1] = v4;
  v14[2] = kCFBundleIdentifierKey;
  v5 = [(MIIPAPatcherManifestTarget *)self bundleIdentifier];
  v15[2] = v5;
  v14[3] = @"infoPlistHash";
  v6 = [(MIIPAPatcherManifestTarget *)self infoPlistHash];
  v15[3] = v6;
  v14[4] = @"infoPlistHashAlgorithm";
  v7 = [(MIIPAPatcherManifestTarget *)self infoPlistHashAlgorithm];
  v15[4] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];

  v9 = [(MIIPAPatcherManifestTarget *)self uiSupportedDevices];

  if (v9)
  {
    id v10 = [v8 mutableCopy];
    v11 = [(MIIPAPatcherManifestTarget *)self uiSupportedDevices];
    [v10 setObject:v11 forKeyedSubscript:@"UISupportedDevices"];

    id v12 = [v10 copy];
    v8 = v12;
  }

  return v8;
}

- (NSString)cfBundleVersion
{
  return self->_cfBundleVersion;
}

- (NSString)cfBundleShortVersion
{
  return self->_cfBundleShortVersion;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSArray)uiSupportedDevices
{
  return self->_uiSupportedDevices;
}

- (NSString)infoPlistHash
{
  return self->_infoPlistHash;
}

- (NSString)infoPlistHashAlgorithm
{
  return self->_infoPlistHashAlgorithm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoPlistHashAlgorithm, 0);
  objc_storeStrong((id *)&self->_infoPlistHash, 0);
  objc_storeStrong((id *)&self->_uiSupportedDevices, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cfBundleShortVersion, 0);

  objc_storeStrong((id *)&self->_cfBundleVersion, 0);
}

@end