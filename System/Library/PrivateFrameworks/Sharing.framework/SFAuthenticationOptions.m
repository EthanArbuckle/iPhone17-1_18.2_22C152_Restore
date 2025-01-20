@interface SFAuthenticationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)biometricOnly;
- (NSData)acmContext;
- (NSData)authorizationToken;
- (NSString)appName;
- (NSString)bundleID;
- (NSString)idsDeviceID;
- (SFAuthenticationOptions)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAcmContext:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAuthorizationToken:(id)a3;
- (void)setBiometricOnly:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setIdsDeviceID:(id)a3;
@end

@implementation SFAuthenticationOptions

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  authorizationToken = self->_authorizationToken;
  id v10 = v4;
  if (authorizationToken)
  {
    [v4 encodeObject:authorizationToken forKey:@"AuthToken"];
    id v4 = v10;
  }
  acmContext = self->_acmContext;
  if (acmContext)
  {
    [v10 encodeObject:acmContext forKey:@"ACMContext"];
    id v4 = v10;
  }
  appName = self->_appName;
  if (appName)
  {
    [v10 encodeObject:appName forKey:@"AppName"];
    id v4 = v10;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    [v10 encodeObject:bundleID forKey:@"BundleID"];
    id v4 = v10;
  }
  if (self->_biometricOnly)
  {
    [v10 encodeBool:1 forKey:@"BiometricOnly"];
    id v4 = v10;
  }
  idsDeviceID = self->_idsDeviceID;
  if (idsDeviceID)
  {
    [v10 encodeObject:idsDeviceID forKey:@"idsDeviceID"];
    id v4 = v10;
  }
}

- (SFAuthenticationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SFAuthenticationOptions;
  v5 = [(SFAuthenticationOptions *)&v19 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AuthToken"];
    uint64_t v7 = [v6 copy];
    authorizationToken = v5->_authorizationToken;
    v5->_authorizationToken = (NSData *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ACMContext"];
    uint64_t v10 = [v9 copy];
    acmContext = v5->_acmContext;
    v5->_acmContext = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppName"];
    appName = v5->_appName;
    v5->_appName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v14;

    v5->_biometricOnly = [v4 decodeBoolForKey:@"BiometricOnly"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsDeviceID"];
    idsDeviceID = v5->_idsDeviceID;
    v5->_idsDeviceID = (NSString *)v16;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(SFAuthenticationOptions *)self authorizationToken];
  uint64_t v7 = [(SFAuthenticationOptions *)self acmContext];
  v8 = [(SFAuthenticationOptions *)self idsDeviceID];
  v9 = [v3 stringWithFormat:@"<%@: authToken: %@, acmContext: %@, IDSDeviceID: %@>", v5, v6, v7, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)acmContext
{
  return self->_acmContext;
}

- (void)setAcmContext:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (BOOL)biometricOnly
{
  return self->_biometricOnly;
}

- (void)setBiometricOnly:(BOOL)a3
{
  self->_biometricOnly = a3;
}

- (NSData)authorizationToken
{
  return self->_authorizationToken;
}

- (void)setAuthorizationToken:(id)a3
{
}

- (NSString)idsDeviceID
{
  return self->_idsDeviceID;
}

- (void)setIdsDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDeviceID, 0);
  objc_storeStrong((id *)&self->_authorizationToken, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_acmContext, 0);
}

@end