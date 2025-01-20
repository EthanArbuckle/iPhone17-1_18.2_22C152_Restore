@interface ACMMessage
- (BOOL)automaticallyCancelWhenSwitchingToBackground;
- (BOOL)canUseTouchID;
- (BOOL)cancelAllowed;
- (BOOL)disableSingleSignOn;
- (BOOL)doNotSaveHSASessionInKeychain;
- (BOOL)generatedWithTouchID;
- (BOOL)ignoreHSASessionInKeychain;
- (BOOL)isInApp2SVEnabledOption;
- (BOOL)lavaForceUseFailoverServerAddress;
- (BOOL)managerSignIn;
- (BOOL)useAlertView;
- (BOOL)userNameFieldEditable;
- (NSNumber)certificateDuration;
- (id)alertViewPrompt;
- (id)app2SVRequired;
- (id)appID;
- (id)appIDKey;
- (id)applicationName;
- (id)encryptedContent;
- (id)encryptedContentHMAC;
- (id)idleExpirationTimeout;
- (id)lavaFailoverAuthenticateAPIAddress;
- (id)lavaFailoverRetrieveSaltAPIAddress;
- (id)managerSignInPromptString;
- (id)personID;
- (id)principal;
- (id)publicKeyVersion;
- (id)rawResponseData;
- (id)realm;
- (id)serverResponseTimeout;
- (id)serviceHost;
- (id)serviceName;
- (id)serviceTicketString;
- (id)sessionToken;
- (id)shouldUseHSAToken;
- (id)user2SVEnrolled;
- (id)userInfo;
- (id)userName;
- (void)forwardInvocation:(id)a3;
- (void)setAlertViewPrompt:(id)a3;
- (void)setApp2SVRequired:(id)a3;
- (void)setAppID:(id)a3;
- (void)setAppIDKey:(id)a3;
- (void)setApplicationName:(id)a3;
- (void)setAutomaticallyCancelWhenSwitchingToBackground:(BOOL)a3;
- (void)setCanUseTouchID:(BOOL)a3;
- (void)setCancelAllowed:(BOOL)a3;
- (void)setCertificateDuration:(id)a3;
- (void)setDisableSingleSignOn:(BOOL)a3;
- (void)setDoNotSaveHSASessionInKeychain:(BOOL)a3;
- (void)setEncryptedContent:(id)a3;
- (void)setEncryptedContentHMAC:(id)a3;
- (void)setGeneratedWithTouchID:(BOOL)a3;
- (void)setIdleExpirationTimeout:(id)a3;
- (void)setIgnoreHSASessionInKeychain:(BOOL)a3;
- (void)setIsInApp2SVEnabledOption:(BOOL)a3;
- (void)setLavaFailoverAuthenticateAPIAddress:(id)a3;
- (void)setLavaFailoverRetrieveSaltAPIAddress:(id)a3;
- (void)setLavaForceUseFailoverServerAddress:(BOOL)a3;
- (void)setManagerSignIn:(BOOL)a3;
- (void)setManagerSignInPromptString:(id)a3;
- (void)setPersonID:(id)a3;
- (void)setPrincipal:(id)a3;
- (void)setPublicKeyVersion:(id)a3;
- (void)setRawResponseData:(id)a3;
- (void)setRealm:(id)a3;
- (void)setServerResponseTimeout:(id)a3;
- (void)setServiceHost:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setServiceTicketString:(id)a3;
- (void)setSessionToken:(id)a3;
- (void)setShouldUseHSAToken:(id)a3;
- (void)setUseAlertView:(BOOL)a3;
- (void)setUser2SVEnrolled:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserName:(id)a3;
- (void)setUserNameFieldEditable:(BOOL)a3;
@end

@implementation ACMMessage

- (void)forwardInvocation:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
    ACFLog(3, (uint64_t)"-[ACMMessage forwardInvocation:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMMessage.m", 41, 0, "Not implemented: %@", a3);
  }
  v5.receiver = self;
  v5.super_class = (Class)ACMMessage;
  [(ACMMessage *)&v5 forwardInvocation:a3];
}

- (id)realm
{
  return [(ACFMessage *)self objectForKey:@"ACCUserRealm"];
}

- (void)setRealm:(id)a3
{
}

- (id)userName
{
  return [(ACFMessage *)self objectForKey:@"ACCUserName"];
}

- (void)setUserName:(id)a3
{
}

- (id)principal
{
  id v3 = [(ACMMessage *)self userName];
  id v4 = [(ACMMessage *)self realm];

  return +[ACFPrincipal principalWithUserName:v3 realm:v4];
}

- (void)setPrincipal:(id)a3
{
  -[ACMMessage setUserName:](self, "setUserName:", [a3 userName]);
  uint64_t v5 = [a3 realm];

  [(ACMMessage *)self setRealm:v5];
}

- (id)appID
{
  return [(ACFMessage *)self objectForKey:@"ApplicationID"];
}

- (void)setAppID:(id)a3
{
}

- (id)appIDKey
{
  return [(ACFMessage *)self objectForKey:@"ApplicationIDKey"];
}

- (void)setAppIDKey:(id)a3
{
}

- (id)personID
{
  return [(ACFMessage *)self objectForKey:@"PersonID"];
}

- (void)setPersonID:(id)a3
{
}

- (id)serviceName
{
  return [(ACFMessage *)self objectForKey:@"ACCKerberosServiceIdKey"];
}

- (void)setServiceName:(id)a3
{
}

- (id)applicationName
{
  return [(ACFMessage *)self objectForKey:@"ACCClientApplicationName"];
}

- (void)setApplicationName:(id)a3
{
}

- (id)serviceHost
{
  return [(ACFMessage *)self objectForKey:@"ACCHostNameKey"];
}

- (void)setServiceHost:(id)a3
{
}

- (id)publicKeyVersion
{
  return [(ACFMessage *)self objectForKey:@"ACCPublicKeyVersion"];
}

- (void)setPublicKeyVersion:(id)a3
{
}

- (id)serverResponseTimeout
{
  return [(ACFMessage *)self objectForKey:@"ACCServerResponseTimeout"];
}

- (void)setServerResponseTimeout:(id)a3
{
}

- (id)encryptedContent
{
  return [(ACFMessage *)self objectForKey:@"ACCEncryptedContent"];
}

- (void)setEncryptedContent:(id)a3
{
}

- (id)encryptedContentHMAC
{
  return [(ACFMessage *)self objectForKey:@"ACCEncryptedContentHMAC"];
}

- (void)setEncryptedContentHMAC:(id)a3
{
}

- (id)serviceTicketString
{
  return [(ACFMessage *)self objectForKey:@"serviceTicketString"];
}

- (void)setServiceTicketString:(id)a3
{
}

- (id)sessionToken
{
  return [(ACFMessage *)self objectForKey:@"ACCDSSessionToken"];
}

- (void)setSessionToken:(id)a3
{
}

- (id)shouldUseHSAToken
{
  return [(ACFMessage *)self objectForKey:@"ACCShouldUseHSAToken"];
}

- (void)setShouldUseHSAToken:(id)a3
{
}

- (id)app2SVRequired
{
  return [(ACFMessage *)self objectForKey:@"ACCApp2SVRequired"];
}

- (void)setApp2SVRequired:(id)a3
{
}

- (id)user2SVEnrolled
{
  return [(ACFMessage *)self objectForKey:@"ACCUser2SVEnrolled"];
}

- (void)setUser2SVEnrolled:(id)a3
{
}

- (BOOL)isInApp2SVEnabledOption
{
  id v2 = [(ACFMessage *)self objectForKey:@"ACCIsInApp2SVEnabledOption"];

  return [v2 BOOLValue];
}

- (void)setIsInApp2SVEnabledOption:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(ACFMessage *)self setObject:v4 forKey:@"ACCIsInApp2SVEnabledOption"];
}

- (BOOL)ignoreHSASessionInKeychain
{
  id v2 = [(ACFMessage *)self objectForKey:@"ACCIgnoreHSASessionInKeychain"];

  return [v2 BOOLValue];
}

- (void)setIgnoreHSASessionInKeychain:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(ACFMessage *)self setObject:v4 forKey:@"ACCIgnoreHSASessionInKeychain"];
}

- (BOOL)doNotSaveHSASessionInKeychain
{
  id v2 = [(ACFMessage *)self objectForKey:@"ACCDoNotSaveHSASessionInKeychain"];

  return [v2 BOOLValue];
}

- (void)setDoNotSaveHSASessionInKeychain:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(ACFMessage *)self setObject:v4 forKey:@"ACCDoNotSaveHSASessionInKeychain"];
}

- (BOOL)managerSignIn
{
  id v2 = [(ACFMessage *)self objectForKey:@"managerSignIn"];

  return [v2 BOOLValue];
}

- (void)setManagerSignIn:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(ACFMessage *)self setObject:v4 forKey:@"managerSignIn"];
}

- (BOOL)cancelAllowed
{
  id v2 = [(ACFMessage *)self objectForKey:@"cancelAllowed"];

  return [v2 BOOLValue];
}

- (void)setCancelAllowed:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(ACFMessage *)self setObject:v4 forKey:@"cancelAllowed"];
}

- (BOOL)disableSingleSignOn
{
  id v2 = [(ACFMessage *)self objectForKey:@"disableSingleSignOn"];

  return [v2 BOOLValue];
}

- (void)setDisableSingleSignOn:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(ACFMessage *)self setObject:v4 forKey:@"disableSingleSignOn"];
}

- (id)idleExpirationTimeout
{
  return [(ACFMessage *)self objectForKey:@"idleExpirationTimeout"];
}

- (void)setIdleExpirationTimeout:(id)a3
{
}

- (id)managerSignInPromptString
{
  return [(ACFMessage *)self objectForKey:@"managerSignInPromptString"];
}

- (void)setManagerSignInPromptString:(id)a3
{
}

- (BOOL)lavaForceUseFailoverServerAddress
{
  id v2 = [(ACFMessage *)self objectForKey:@"lavaForceUseFailoverServerAddress"];

  return [v2 BOOLValue];
}

- (void)setLavaForceUseFailoverServerAddress:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(ACFMessage *)self setObject:v4 forKey:@"lavaForceUseFailoverServerAddress"];
}

- (id)lavaFailoverRetrieveSaltAPIAddress
{
  return [(ACFMessage *)self objectForKey:@"lavaFailoverRetrieveSaltAPIAddress"];
}

- (void)setLavaFailoverRetrieveSaltAPIAddress:(id)a3
{
}

- (id)lavaFailoverAuthenticateAPIAddress
{
  return [(ACFMessage *)self objectForKey:@"lavaFailoverAuthenticateAPIAddress"];
}

- (void)setLavaFailoverAuthenticateAPIAddress:(id)a3
{
}

- (id)rawResponseData
{
  return [(ACFMessage *)self objectForKey:@"rawResponseData"];
}

- (void)setRawResponseData:(id)a3
{
}

- (id)userInfo
{
  return [(ACFMessage *)self objectForKey:@"userInfo"];
}

- (void)setUserInfo:(id)a3
{
}

- (BOOL)useAlertView
{
  id v2 = [(ACFMessage *)self objectForKey:@"useAlertView"];

  return [v2 BOOLValue];
}

- (void)setUseAlertView:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(ACFMessage *)self setObject:v4 forKey:@"useAlertView"];
}

- (BOOL)userNameFieldEditable
{
  id v2 = [(ACFMessage *)self objectForKey:@"userNameFieldEditable"];

  return [v2 BOOLValue];
}

- (void)setUserNameFieldEditable:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(ACFMessage *)self setObject:v4 forKey:@"userNameFieldEditable"];
}

- (id)alertViewPrompt
{
  return [(ACFMessage *)self objectForKey:@"alertViewPrompt"];
}

- (void)setAlertViewPrompt:(id)a3
{
}

- (BOOL)automaticallyCancelWhenSwitchingToBackground
{
  id v2 = [(ACFMessage *)self objectForKey:@"automaticallyCancelWhenSwitchingToBackground"];

  return [v2 BOOLValue];
}

- (void)setAutomaticallyCancelWhenSwitchingToBackground:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(ACFMessage *)self setObject:v4 forKey:@"automaticallyCancelWhenSwitchingToBackground"];
}

- (BOOL)canUseTouchID
{
  id v2 = [(ACFMessage *)self objectForKey:@"canUseTouchID"];

  return [v2 BOOLValue];
}

- (void)setCanUseTouchID:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(ACFMessage *)self setObject:v4 forKey:@"canUseTouchID"];
}

- (BOOL)generatedWithTouchID
{
  id v2 = [(ACFMessage *)self objectForKey:@"generatedWithTouchID"];

  return [v2 BOOLValue];
}

- (void)setGeneratedWithTouchID:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(ACFMessage *)self setObject:v4 forKey:@"generatedWithTouchID"];
}

- (NSNumber)certificateDuration
{
  return (NSNumber *)[(ACFMessage *)self objectForKey:@"certificateDuration"];
}

- (void)setCertificateDuration:(id)a3
{
}

@end