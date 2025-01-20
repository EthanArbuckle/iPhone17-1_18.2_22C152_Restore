@interface PORegistrationContext
- (BOOL)authorizationProvided;
- (BOOL)deviceKeysShouldChange;
- (BOOL)isNewPasswordUser;
- (BOOL)isNewSmartCarddUser;
- (BOOL)isRepair;
- (BOOL)isRetry;
- (BOOL)isUserNotification;
- (BOOL)migratingDeviceKeys;
- (BOOL)newUserBindingComplete;
- (BOOL)resetKeys;
- (BOOL)useSharedDeviceKeys;
- (BOOL)userIsPlatformSSOUser;
- (BOOL)userNotified;
- (BOOL)userSEPKeyInvalid;
- (LAContext)credentialContext;
- (NSData)smartCardHash;
- (NSNumber)encryptionAlgorithm;
- (NSNumber)signingAlgorithm;
- (NSNumber)userSigningAlgorithm;
- (NSString)containerAppBundleIdentifier;
- (NSString)extensionIdentifier;
- (NSString)loginUserName;
- (NSString)registrationToken;
- (NSString)smartCardTokenId;
- (NSString)userName;
- (POExtension)ssoExtension;
- (POProfile)profile;
- (PORegistrationContext)init;
- (POUIRegistrationWindow)registrationUI;
- (int)authMethod;
- (int)failureCount;
- (int64_t)options;
- (int64_t)protocolVersion;
- (int64_t)state;
- (void)setAuthMethod:(int)a3;
- (void)setAuthorizationProvided:(BOOL)a3;
- (void)setContainerAppBundleIdentifier:(id)a3;
- (void)setCredentialContext:(id)a3;
- (void)setDeviceKeysShouldChange:(BOOL)a3;
- (void)setEncryptionAlgorithm:(id)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setFailureCount:(int)a3;
- (void)setLoginUserName:(id)a3;
- (void)setMigratingDeviceKeys:(BOOL)a3;
- (void)setNewPasswordUser:(BOOL)a3;
- (void)setNewSmartCardUser:(BOOL)a3;
- (void)setNewUserBindingComplete:(BOOL)a3;
- (void)setOptions:(int64_t)a3;
- (void)setProfile:(id)a3;
- (void)setProtocolVersion:(int64_t)a3;
- (void)setRegistrationToken:(id)a3;
- (void)setRegistrationUI:(id)a3;
- (void)setRepair:(BOOL)a3;
- (void)setResetKeys:(BOOL)a3;
- (void)setRetry:(BOOL)a3;
- (void)setSigningAlgorithm:(id)a3;
- (void)setSmartCardHash:(id)a3;
- (void)setSmartCardTokenId:(id)a3;
- (void)setSsoExtension:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setUseSharedDeviceKeys:(BOOL)a3;
- (void)setUserIsPlatformSSOUser:(BOOL)a3;
- (void)setUserName:(id)a3;
- (void)setUserNotified:(BOOL)a3;
- (void)setUserSEPKeyInvalid:(BOOL)a3;
- (void)setUserSigningAlgorithm:(id)a3;
@end

@implementation PORegistrationContext

- (PORegistrationContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)PORegistrationContext;
  v2 = [(PORegistrationContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_repair = 0;
    v2->_resetKeys = 0;
    v2->_state = 0;
    v2->_failureCount = 0;
    v2->_authMethod = 1000;
    v2->_migratingDeviceKeys = 0;
    v4 = (void *)*MEMORY[0x263F5E698];
    objc_storeStrong((id *)&v2->_signingAlgorithm, (id)*MEMORY[0x263F5E698]);
    objc_storeStrong((id *)&v3->_encryptionAlgorithm, (id)*MEMORY[0x263F5E678]);
    objc_storeStrong((id *)&v3->_userSigningAlgorithm, v4);
  }
  return v3;
}

- (BOOL)isUserNotification
{
  return [(PORegistrationContext *)self state] == 6
      || [(PORegistrationContext *)self state] == 7
      || [(PORegistrationContext *)self state] == 8;
}

- (BOOL)isRepair
{
  return self->_repair;
}

- (void)setRepair:(BOOL)a3
{
  self->_repair = a3;
}

- (BOOL)isNewPasswordUser
{
  return self->_newPasswordUser;
}

- (void)setNewPasswordUser:(BOOL)a3
{
  self->_newPasswordUser = a3;
}

- (BOOL)isNewSmartCarddUser
{
  return self->_newSmartCardUser;
}

- (void)setNewSmartCardUser:(BOOL)a3
{
  self->_newSmartCardUser = a3;
}

- (BOOL)newUserBindingComplete
{
  return self->_newUserBindingComplete;
}

- (void)setNewUserBindingComplete:(BOOL)a3
{
  self->_newUserBindingComplete = a3;
}

- (BOOL)userNotified
{
  return self->_userNotified;
}

- (void)setUserNotified:(BOOL)a3
{
  self->_userNotified = a3;
}

- (BOOL)resetKeys
{
  return self->_resetKeys;
}

- (void)setResetKeys:(BOOL)a3
{
  self->_resetKeys = a3;
}

- (BOOL)isRetry
{
  return self->_retry;
}

- (void)setRetry:(BOOL)a3
{
  self->_retry = a3;
}

- (int)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(int)a3
{
  self->_failureCount = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int)authMethod
{
  return self->_authMethod;
}

- (void)setAuthMethod:(int)a3
{
  self->_authMethod = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (NSString)extensionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExtensionIdentifier:(id)a3
{
}

- (NSString)containerAppBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setContainerAppBundleIdentifier:(id)a3
{
}

- (NSString)registrationToken
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRegistrationToken:(id)a3
{
}

- (BOOL)useSharedDeviceKeys
{
  return self->_useSharedDeviceKeys;
}

- (void)setUseSharedDeviceKeys:(BOOL)a3
{
  self->_useSharedDeviceKeys = a3;
}

- (BOOL)deviceKeysShouldChange
{
  return self->_deviceKeysShouldChange;
}

- (void)setDeviceKeysShouldChange:(BOOL)a3
{
  self->_deviceKeysShouldChange = a3;
}

- (BOOL)migratingDeviceKeys
{
  return self->_migratingDeviceKeys;
}

- (void)setMigratingDeviceKeys:(BOOL)a3
{
  self->_migratingDeviceKeys = a3;
}

- (BOOL)userSEPKeyInvalid
{
  return self->_userSEPKeyInvalid;
}

- (void)setUserSEPKeyInvalid:(BOOL)a3
{
  self->_userSEPKeyInvalid = a3;
}

- (NSNumber)signingAlgorithm
{
  return self->_signingAlgorithm;
}

- (void)setSigningAlgorithm:(id)a3
{
}

- (NSNumber)userSigningAlgorithm
{
  return self->_userSigningAlgorithm;
}

- (void)setUserSigningAlgorithm:(id)a3
{
}

- (NSNumber)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (void)setEncryptionAlgorithm:(id)a3
{
}

- (NSString)loginUserName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLoginUserName:(id)a3
{
}

- (NSString)userName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUserName:(id)a3
{
}

- (LAContext)credentialContext
{
  return (LAContext *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCredentialContext:(id)a3
{
}

- (BOOL)authorizationProvided
{
  return self->_authorizationProvided;
}

- (void)setAuthorizationProvided:(BOOL)a3
{
  self->_authorizationProvided = a3;
}

- (NSString)smartCardTokenId
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSmartCardTokenId:(id)a3
{
}

- (NSData)smartCardHash
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSmartCardHash:(id)a3
{
}

- (POExtension)ssoExtension
{
  return (POExtension *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSsoExtension:(id)a3
{
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

- (POProfile)profile
{
  return (POProfile *)objc_getProperty(self, a2, 152, 1);
}

- (void)setProfile:(id)a3
{
}

- (POUIRegistrationWindow)registrationUI
{
  return (POUIRegistrationWindow *)objc_getProperty(self, a2, 160, 1);
}

- (void)setRegistrationUI:(id)a3
{
}

- (BOOL)userIsPlatformSSOUser
{
  return self->_userIsPlatformSSOUser;
}

- (void)setUserIsPlatformSSOUser:(BOOL)a3
{
  self->_userIsPlatformSSOUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationUI, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_ssoExtension, 0);
  objc_storeStrong((id *)&self->_smartCardHash, 0);
  objc_storeStrong((id *)&self->_smartCardTokenId, 0);
  objc_storeStrong((id *)&self->_credentialContext, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_loginUserName, 0);
  objc_storeStrong((id *)&self->_encryptionAlgorithm, 0);
  objc_storeStrong((id *)&self->_userSigningAlgorithm, 0);
  objc_storeStrong((id *)&self->_signingAlgorithm, 0);
  objc_storeStrong((id *)&self->_registrationToken, 0);
  objc_storeStrong((id *)&self->_containerAppBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

@end