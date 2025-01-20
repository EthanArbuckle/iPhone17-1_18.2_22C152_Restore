@interface ACMExternalTicketManager
- (id)defaultPublicKeyVersionForRealm:(id)a3;
- (id)deviceIdentifier;
- (id)identifier;
- (id)preferences;
- (id)twoSVCreateDateForPrincipal:(id)a3;
- (id)twoSVPersonIDForPrincipal:(id)a3;
- (id)twoSVSecretForPrincipal:(id)a3;
- (unint64_t)clientID;
- (void)tokenDidReceive2SVSecret:(id)a3;
@end

@implementation ACMExternalTicketManager

- (id)preferences
{
  id v2 = +[ACMAppleConnectImplComponents components];

  return (id)[v2 preferences];
}

- (id)defaultPublicKeyVersionForRealm:(id)a3
{
  return @"0";
}

- (unint64_t)clientID
{
  return 2;
}

- (id)identifier
{
  return @"external";
}

- (id)twoSVPersonIDForPrincipal:(id)a3
{
  v3 = [[-[ACMExternalTicketManager preferences](self, "preferences") principalPreferencesWithPrincipal:a3];

  return (id)[v3 personID];
}

- (id)twoSVSecretForPrincipal:(id)a3
{
  v3 = [[-[ACMExternalTicketManager preferences](self, "preferences") principalPreferencesWithPrincipal:a3];

  return (id)[v3 clientSecret];
}

- (id)twoSVCreateDateForPrincipal:(id)a3
{
  v3 = [[-[ACMExternalTicketManager preferences](self, "preferences") principalPreferencesWithPrincipal:a3];

  return (id)[v3 clientSecretCreateDate];
}

- (id)deviceIdentifier
{
  id v2 = [[+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components") systemInfo];

  return (id)[v2 uniqueDeviceIdentifier];
}

- (void)tokenDidReceive2SVSecret:(id)a3
{
  v4 = [[-[ACMExternalTicketManager preferences](self, "preferences") principalPreferencesWithPrincipal:[a3 principal]];
  [v4 setClientSecret:[a3 clientSecret]];
  [v4 setClientSecretCreateDate:[a3 clientSecretCreationTimestamp]];
  uint64_t v5 = [a3 personID];

  [v4 setPersonID:v5];
}

@end