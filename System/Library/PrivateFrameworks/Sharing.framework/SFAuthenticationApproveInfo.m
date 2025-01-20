@interface SFAuthenticationApproveInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)biometricOnly;
- (NSString)appName;
- (NSString)bundleID;
- (NSString)idsDeviceID;
- (SFAuthenticationApproveInfo)initWithCoder:(id)a3;
- (SFAuthenticationApproveInfo)initWithType:(unint64_t)a3 idsDeviceID:(id)a4 appName:(id)a5 bundleID:(id)a6 biometricOnly:(BOOL)a7;
- (id)description;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFAuthenticationApproveInfo

- (SFAuthenticationApproveInfo)initWithType:(unint64_t)a3 idsDeviceID:(id)a4 appName:(id)a5 bundleID:(id)a6 biometricOnly:(BOOL)a7
{
  v12 = (NSString *)a4;
  v13 = (NSString *)a5;
  v14 = (NSString *)a6;
  v22.receiver = self;
  v22.super_class = (Class)SFAuthenticationApproveInfo;
  v15 = [(SFAuthenticationApproveInfo *)&v22 init];
  idsDeviceID = v15->_idsDeviceID;
  v15->_type = a3;
  v15->_idsDeviceID = v12;
  v17 = v12;

  appName = v15->_appName;
  v15->_appName = v13;
  v19 = v13;

  bundleID = v15->_bundleID;
  v15->_bundleID = v14;

  v15->_biometricOnly = a7;
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t type = self->_type;
  id v9 = v4;
  if (type)
  {
    [v4 encodeInteger:type forKey:@"AuthType"];
    id v4 = v9;
  }
  idsDeviceID = self->_idsDeviceID;
  if (idsDeviceID)
  {
    [v9 encodeObject:idsDeviceID forKey:@"idsDeviceID"];
    id v4 = v9;
  }
  appName = self->_appName;
  if (appName)
  {
    [v9 encodeObject:appName forKey:@"AppName"];
    id v4 = v9;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    [v9 encodeObject:bundleID forKey:@"BundleID"];
    id v4 = v9;
  }
  if (self->_biometricOnly)
  {
    [v9 encodeBool:1 forKey:@"BiometricOnly"];
    id v4 = v9;
  }
}

- (SFAuthenticationApproveInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFAuthenticationApproveInfo;
  v5 = [(SFAuthenticationApproveInfo *)&v13 init];
  if (v5)
  {
    v5->_unint64_t type = [v4 decodeIntegerForKey:@"AuthType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsDeviceID"];
    idsDeviceID = v5->_idsDeviceID;
    v5->_idsDeviceID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppName"];
    appName = v5->_appName;
    v5->_appName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    v5->_biometricOnly = [v4 decodeBoolForKey:@"BiometricOnly"];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = SFAuthenticationTypeToString(self->_type);
  v7 = (void *)v6;
  if (self->_biometricOnly) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  id v9 = [v3 stringWithFormat:@"<%@: type: %@, idsDeviceID: %@, appName: %@, bundleID: %@, biometricOnly: %@>", v5, v6, *(_OWORD *)&self->_idsDeviceID, self->_bundleID, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)idsDeviceID
{
  return self->_idsDeviceID;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (BOOL)biometricOnly
{
  return self->_biometricOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appName, 0);

  objc_storeStrong((id *)&self->_idsDeviceID, 0);
}

@end