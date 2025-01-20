@interface ACMTicketManager
- (__SecCertificate)defaultPublicKeyCertificateForRealm:(id)a3;
- (id)certificateLabelForRealm:(id)a3;
- (id)components;
- (id)decodedUserPreferences:(id)a3;
- (id)defaultPublicKeyVersionForRealm:(id)a3;
- (id)encodedUserPreferences:(id)a3;
- (id)preferences;
- (id)publicKeyVersionForRealm:(id)a3;
- (id)systemInfo;
- (id)userPreferencesForToken:(id)a3;
- (void)setPublickKeyVersion:(id)a3 label:(id)a4 forRealm:(id)a5;
- (void)setUserPreferences:(id)a3 forToken:(id)a4;
- (void)uninstallPublicKeyForRealm:(id)a3;
@end

@implementation ACMTicketManager

- (id)components
{
  return +[ACMAppleConnectImplComponents components];
}

- (id)preferences
{
  id v2 = [(ACMTicketManager *)self components];

  return (id)[v2 preferences];
}

- (id)systemInfo
{
  id v2 = [(ACMTicketManager *)self components];

  return (id)[v2 systemInfo];
}

- (id)defaultPublicKeyVersionForRealm:(id)a3
{
  return @"0.0";
}

- (__SecCertificate)defaultPublicKeyCertificateForRealm:(id)a3
{
  uint64_t v4 = [[objc_msgSend(-[ACMTicketManager preferences](self, "preferences"), "environmentPreferencesWithRealm:", a3) defaultPublicKeyString];

  return [(ACCTicketManager *)self certificateFromString:v4];
}

- (id)certificateLabelForRealm:(id)a3
{
  v3 = [objc_msgSend(-[ACMTicketManager components](self, "components"), "preferences") environmentPreferencesWithRealm:a3];

  return (id)[v3 publicKeyCertificateName];
}

- (id)publicKeyVersionForRealm:(id)a3
{
  if (-[ACCTicketManager certificateForRealm:](self, "certificateForRealm:")) {
    v5 = [[[objc_msgSend(-[ACMTicketManager components](self, "components"), "preferences") environmentPreferencesWithRealm:a3] publicKeyVersion];
  }
  else {
    v5 = 0;
  }
  if ([v5 length]) {
    return v5;
  }

  return [(ACMTicketManager *)self defaultPublicKeyVersionForRealm:a3];
}

- (void)setPublickKeyVersion:(id)a3 label:(id)a4 forRealm:(id)a5
{
  v7 = [objc_msgSend(-[ACMTicketManager components](self, "components"), "preferences") environmentPreferencesWithRealm:a5];
  [v7 setPublicKeyCertificateName:a4];

  [v7 setPublicKeyVersion:a3];
}

- (void)uninstallPublicKeyForRealm:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ACMTicketManager;
  -[ACCTicketManager uninstallPublicKeyForRealm:](&v6, sel_uninstallPublicKeyForRealm_);
  v5 = [objc_msgSend(-[ACMTicketManager components](self, "components"), "preferences") environmentPreferencesWithRealm:a3];
  [v5 setPublicKeyVersion:&stru_26F261788];
  [v5 setPublicKeyCertificateName:&stru_26F261788];
}

- (void)setUserPreferences:(id)a3 forToken:(id)a4
{
  id v5 = [(ACMTicketManager *)self encodedUserPreferences:a3];

  [a4 setUserPreferences:v5];
}

- (id)userPreferencesForToken:(id)a3
{
  uint64_t v4 = [a3 userPreferences];

  return [(ACMTicketManager *)self decodedUserPreferences:v4];
}

- (id)encodedUserPreferences:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:0];

  return (id)ACFEncodeBase64(v3);
}

- (id)decodedUserPreferences:(id)a3
{
  id result = (id)[a3 length];
  if (result)
  {
    id v5 = (void *)MEMORY[0x263F08AC0];
    id v6 = ACFDecodeBase64(a3);
    return (id)[v5 propertyListWithData:v6 options:0 format:0 error:0];
  }
  return result;
}

@end