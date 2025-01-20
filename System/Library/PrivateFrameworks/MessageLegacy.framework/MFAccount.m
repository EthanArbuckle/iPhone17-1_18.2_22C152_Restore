@interface MFAccount
+ (BOOL)_setBasicProperty:(id)a3 forKey:(id)a4 persistentAccount:(id)a5;
+ (BOOL)isCommonPortNumber:(unsigned int)a3;
+ (BOOL)isPredefinedAccountType;
+ (BOOL)isSSLEditable;
+ (BOOL)shouldHealAccounts;
+ (BOOL)usesSSL;
+ (id)_basicPropertyForKey:(id)a3 persistentAccount:(id)a4;
+ (id)_newPersistentAccount;
+ (id)accountPropertiesValueForKey:(id)a3 value:(id)a4;
+ (id)accountTypeIdentifier;
+ (id)accountTypeString;
+ (id)accountWithPersistentAccount:(id)a3;
+ (id)accountWithProperties:(id)a3;
+ (id)authSchemesForAccountClass;
+ (id)excludedAccountPropertyKeys;
+ (id)existingAccountForUniqueID:(id)a3;
+ (id)hostname;
+ (id)newAccountWithDictionary:(id)a3;
+ (id)predefinedValueForKey:(id)a3;
+ (id)propertiesWhichRequireValidation;
+ (id)saslProfileName;
+ (id)supportedDataclasses;
+ (unsigned)defaultPortNumber;
+ (unsigned)defaultSecurePortNumber;
+ (void)legacyKeychainProtocol;
+ (void)setShouldHealAccounts:(BOOL)a3;
- (ACAccount)parentAccount;
- (ACAccount)persistentAccount;
- (BOOL)_BOOLForAccountInfoKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)_connectAndAuthenticate:(id)a3;
- (BOOL)_renewCredentialsWithOptions:(id)a3 completion:(id)a4;
- (BOOL)_shouldTryDirectSSLConnectionOnPort:(unsigned int)a3;
- (BOOL)allowsTrustPrompt;
- (BOOL)canGoOffline;
- (BOOL)enableAccount;
- (BOOL)fetchTokensIfNecessary:(id *)a3;
- (BOOL)isActive;
- (BOOL)isEnabledForDataclass:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isManaged;
- (BOOL)isSyncingNotes;
- (BOOL)promptUserForPasswordWithTitle:(id)a3 message:(id)a4 completionHandler:(id)a5;
- (BOOL)promptUserForWebLoginWithURL:(id)a3 shouldConfirm:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)renewCredentialsWithOptions:(id)a3 completion:(id)a4;
- (BOOL)requiresAuthentication;
- (BOOL)setCredentialItem:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setOAuth2Token:(id)a3 refreshToken:(id)a4 error:(id *)a5;
- (BOOL)shouldDisplayHostnameInErrorMessages;
- (BOOL)shouldEnableAfterError:(id)a3;
- (BOOL)shouldFetchACEDBInfoForError:(id)a3;
- (BOOL)supportsMailDrop;
- (BOOL)usesSSL;
- (Class)connectionClass;
- (MFAccount)init;
- (MFAccount)initWithPersistentAccount:(id)a3;
- (MFAccount)initWithProperties:(id)a3;
- (NSDictionary)properties;
- (NSString)description;
- (NSString)displayName;
- (NSString)ef_publicDescription;
- (NSString)hostname;
- (NSString)identifier;
- (NSString)managedTag;
- (NSString)parentAccountIdentifier;
- (NSString)sourceApplicationBundleIdentifier;
- (NSString)type;
- (NSString)uniqueId;
- (NSString)username;
- (__CFString)connectionServiceType;
- (id)_credential;
- (id)_credentialCreateIfNecessary:(BOOL)a3;
- (id)_credentialCreateIfNecessary:(BOOL)a3 error:(id *)a4;
- (id)_newConnection;
- (id)_objectForAccountInfoKey:(id)a3;
- (id)_password;
- (id)_passwordWithError:(id *)a3;
- (id)_privacySafeDescription;
- (id)accountClass;
- (id)accountPropertyForKey:(id)a3;
- (id)alternateConnectionSettings;
- (id)authenticatedConnection;
- (id)certUIService;
- (id)clientCertificates;
- (id)copyDiagnosticInformation;
- (id)credentialItemForKey:(id)a3;
- (id)credentialItemForKey:(id)a3 error:(id *)a4;
- (id)customDescriptionForError:(id)a3 authScheme:(id)a4 defaultDescription:(id)a5;
- (id)defaultConnectionSettings;
- (id)domain;
- (id)enabledDataclasses;
- (id)inaccessiblePasswordErrorWithTitle:(id)a3;
- (id)insecureConnectionSettings;
- (id)loginDisabledErrorWithTitle:(id)a3;
- (id)missingPasswordErrorWithTitle:(id)a3;
- (id)nameForMailboxUid:(id)a3;
- (id)oauth2Token;
- (id)password;
- (id)preferredAuthScheme;
- (id)secureConnectionSettings;
- (id)secureServiceName;
- (id)serviceName;
- (id)valueInAccountPropertiesForKey:(id)a3;
- (unint64_t)credentialAccessibility;
- (unint64_t)hash;
- (unsigned)defaultPortNumber;
- (unsigned)defaultSecurePortNumber;
- (unsigned)portNumber;
- (void)_queueAccountInfoDidChange;
- (void)_setAccountProperties:(id)a3;
- (void)accountInfoDidChange;
- (void)applySettingsAsDefault:(id)a3;
- (void)dealloc;
- (void)removeAccountPropertyForKey:(id)a3;
- (void)removePersistentAccount;
- (void)removeValueInAccountPropertiesForKey:(id)a3;
- (void)reportAuthenticationError:(id)a3 authScheme:(id)a4;
- (void)savePersistentAccount;
- (void)setAccountProperty:(id)a3 forKey:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setClientCertificates:(id)a3;
- (void)setCredentialItem:(id)a3 forKey:(id)a4;
- (void)setDisplayName:(id)a3;
- (void)setDomain:(id)a3;
- (void)setHostname:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPersistentAccount:(id)a3;
- (void)setPortNumber:(unsigned int)a3;
- (void)setPreferredAuthScheme:(id)a3;
- (void)setSourceApplicationBundleIdentifier:(id)a3;
- (void)setTryDirectSSL:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)setUsesSSL:(BOOL)a3;
- (void)setValueInAccountProperties:(id)a3 forKey:(id)a4;
@end

@implementation MFAccount

- (NSString)username
{
  return (NSString *)[(MFAccount *)self _objectForAccountInfoKey:@"Username"];
}

- (NSString)hostname
{
  return (NSString *)[(MFAccount *)self _objectForAccountInfoKey:@"Hostname"];
}

- (id)_objectForAccountInfoKey:(id)a3
{
  _MFLockGlobalLock();
  id v5 = [(MFAccount *)self accountPropertyForKey:a3];
  _MFUnlockGlobalLock();
  return v5;
}

- (id)accountPropertyForKey:(id)a3
{
  id v5 = [(MFAccount *)self persistentAccount];
  if (v5)
  {
    v6 = v5;
    id result = (id)[(id)objc_opt_class() _basicPropertyForKey:a3 persistentAccount:v5];
    if (!result)
    {
      return (id)[(ACAccount *)v6 accountPropertyForKey:a3];
    }
  }
  else
  {
    unsavedAccountProperties = self->_unsavedAccountProperties;
    return (id)[(NSMutableDictionary *)unsavedAccountProperties objectForKey:a3];
  }
  return result;
}

- (ACAccount)persistentAccount
{
  p_persistentAccountLock = &self->_persistentAccountLock;
  os_unfair_lock_lock(&self->_persistentAccountLock);
  v4 = self->_persistentAccount;
  os_unfair_lock_unlock(p_persistentAccountLock);
  return v4;
}

+ (id)_basicPropertyForKey:(id)a3 persistentAccount:(id)a4
{
  if (!a4) {
    return 0;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F17648]])
  {
    return (id)[a4 identifier];
  }
  if ([a3 isEqualToString:@"Username"])
  {
    return (id)[a4 username];
  }
  if (![a3 isEqualToString:@"DisplayName"]) {
    return 0;
  }
  return (id)[a4 accountDescription];
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  v7 = [(MFAccount *)self persistentAccount];
  if (v7)
  {
    v8 = v7;
    if (([(id)objc_opt_class() _setBasicProperty:a3 forKey:a4 persistentAccount:v7] & 1) == 0)
    {
      [(ACAccount *)v8 setAccountProperty:a3 forKey:a4];
    }
  }
  else
  {
    unsavedAccountProperties = self->_unsavedAccountProperties;
    if (!unsavedAccountProperties)
    {
      unsavedAccountProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_unsavedAccountProperties = unsavedAccountProperties;
    }
    [(NSMutableDictionary *)unsavedAccountProperties setValue:a3 forKey:a4];
  }
}

- (NSString)ef_publicDescription
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F60D58], "currentDevice"), "isInternal"))
  {
    return [(MFAccount *)self description];
  }
  else
  {
    return (NSString *)[(MFAccount *)self _privacySafeDescription];
  }
}

- (id)_privacySafeDescription
{
  id v3 = [(MFAccount *)self _objectForAccountInfoKey:*MEMORY[0x1E4F17648]];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = [(MFAccount *)self isActive];
  v7 = "not ";
  if (v6) {
    v7 = "";
  }
  return (id)[v4 stringWithFormat:@"<%@ %p> ID=%@ active=%sactive", v5, self, v3, v7];
}

- (NSString)identifier
{
  return (NSString *)[(MFAccount *)self accountPropertyForKey:*MEMORY[0x1E4F17648]];
}

- (MFAccount)initWithPersistentAccount:(id)a3
{
  id v3 = a3;
  if (!a3) {
    id v3 = (id)[(id)objc_opt_class() _newPersistentAccount];
  }
  v8.receiver = self;
  v8.super_class = (Class)MFAccount;
  uint64_t v5 = [(MFAccount *)&v8 init];
  BOOL v6 = v5;
  if (v5)
  {
    v5->_persistentAccountLock._os_unfair_lock_opaque = 0;
    [(MFAccount *)v5 setPersistentAccount:v3];
  }
  return v6;
}

+ (id)_newPersistentAccount
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 accountTypeIdentifier];
  id v3 = +[MFAccountStore sharedAccountStore];
  v4 = (void *)[v3 newPersistentAccountWithAccountTypeIdentifier:v2];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend(v3, "supportedDataclassesWithAccountTypeIdentifier:", v2, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    uint64_t v9 = *MEMORY[0x1E4F17B00];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v4 setProvisioned:1 forDataclass:v11];
        objc_msgSend(v4, "setEnabled:forDataclass:", objc_msgSend(v11, "isEqualToString:", v9) ^ 1, v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  [v4 setAuthenticated:1];
  return v4;
}

- (void)setPersistentAccount:(id)a3
{
  if (a3 && self->_unsavedAccountProperties) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"Account.m", 255, @"Cannot set persistent account on account with unsaved account properties");
  }
  if (self->_persistentAccount != a3)
  {
    [(MFAccount *)self releaseAllConnections];
    os_unfair_lock_lock(&self->_persistentAccountLock);
    uint64_t v5 = self->_persistentAccount;
    self->_persistentAccount = (ACAccount *)a3;
    os_unfair_lock_unlock(&self->_persistentAccountLock);
    [(MFAccount *)self persistentAccountDidChange:a3 previousAccount:v5];
  }
}

- (BOOL)_BOOLForAccountInfoKey:(id)a3 defaultValue:(BOOL)a4
{
  _MFLockGlobalLock();
  id v7 = [(MFAccount *)self accountPropertyForKey:a3];
  _MFUnlockGlobalLock();
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      a4 = [v7 BOOLValue];
    }
  }
  return a4;
}

+ (void)setShouldHealAccounts:(BOOL)a3
{
  _shouldHealAccount = a3;
}

+ (BOOL)shouldHealAccounts
{
  return _shouldHealAccount;
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  uint64_t v4 = [a3 code];
  uint64_t v5 = (void *)[a3 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F28798]];
  unsigned int v7 = (0x4601u >> (v4 - 51)) & 1;
  if ((unint64_t)(v4 - 51) > 0xE) {
    unsigned int v7 = 0;
  }
  if (v6) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", @"MFMessageErrorDomain")) {
    BOOL v8 = v4 == 1034;
  }
  uint64_t v9 = (void *)[a3 domain];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F18F50]];
  BOOL v11 = (unint64_t)(v4 - 1) < 2;
  if (!v10) {
    BOOL v11 = v8;
  }
  if (!v11) {
    return 0;
  }
  v12 = objc_opt_class();
  return [v12 shouldHealAccounts];
}

+ (id)newAccountWithDictionary:(id)a3
{
  id v3 = (void *)[a1 accountWithProperties:a3];
  return v3;
}

+ (id)excludedAccountPropertyKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Password", @"OAuth2Token", @"OAuth2RefreshToken", 0);
}

+ (id)accountWithProperties:(id)a3
{
  id v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperties:a3];
  return v3;
}

+ (id)authSchemesForAccountClass
{
  if (authSchemesForAccountClass_onceToken != -1) {
    dispatch_once(&authSchemesForAccountClass_onceToken, &__block_literal_global_0);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__MFAccount_authSchemesForAccountClass__block_invoke_2;
  v4[3] = &unk_1E6866418;
  v4[4] = a1;
  return (id)objc_msgSend((id)authSchemesForAccountClass_knownSchemes, "ef_filter:", v4);
}

id __39__MFAccount_authSchemesForAccountClass__block_invoke()
{
  id result = +[MFAuthScheme knownSchemes];
  authSchemesForAccountClass_knownSchemes = (uint64_t)result;
  return result;
}

uint64_t __39__MFAccount_authSchemesForAccountClass__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 canAuthenticateAccountClass:*(void *)(a1 + 32) connection:0];
}

- (MFAccount)init
{
  return [(MFAccount *)self initWithProperties:0];
}

- (MFAccount)initWithProperties:(id)a3
{
  uint64_t v4 = [(MFAccount *)self initWithPersistentAccount:0];
  if (v4)
  {
    uint64_t v5 = (void *)[a3 mutableCopy];
    if (!v5) {
      uint64_t v5 = objc_opt_new();
    }
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend((id)objc_opt_class(), "_accountClass"), @"Class");
    [(MFAccount *)v4 _setAccountProperties:v5];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFAccount;
  [(MFAccount *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = (void *)[a3 uniqueId];
  int v6 = [(MFAccount *)self uniqueId];
  return [v5 isEqualToString:v6];
}

- (unint64_t)hash
{
  uint64_t v2 = [(MFAccount *)self uniqueId];
  return [(NSString *)v2 hash];
}

+ (id)accountWithPersistentAccount:(id)a3
{
  id v4 = +[MFAccountStore sharedAccountStore];
  return (id)[v4 existingAccountWithPersistentAccount:a3];
}

+ (id)accountTypeIdentifier
{
  return 0;
}

- (void)savePersistentAccount
{
  id v3 = +[MFAccountStore sharedAccountStore];
  [v3 savePersistentAccountWithAccount:self];
}

- (void)removePersistentAccount
{
  id v3 = +[MFAccountStore sharedAccountStore];
  [v3 removePersistentAccountWithAccount:self];
}

- (ACAccount)parentAccount
{
  uint64_t v2 = [(MFAccount *)self persistentAccount];
  return (ACAccount *)[(ACAccount *)v2 parentAccount];
}

- (NSString)parentAccountIdentifier
{
  uint64_t v2 = [(MFAccount *)self persistentAccount];
  return (NSString *)[(ACAccount *)v2 parentAccountIdentifier];
}

- (NSString)type
{
  return (NSString *)[(MFAccount *)self accountPropertyForKey:@"Type"];
}

- (id)accountClass
{
  return [(MFAccount *)self accountPropertyForKey:@"Class"];
}

+ (id)existingAccountForUniqueID:(id)a3
{
  return 0;
}

+ (BOOL)isPredefinedAccountType
{
  return 0;
}

+ (id)predefinedValueForKey:(id)a3
{
  return 0;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(-[MFAccount _privacySafeDescription](self, "_privacySafeDescription"), "stringByAppendingFormat:", @" displayName=%@", objc_msgSend((id)objc_msgSend(-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", @"DisplayName"), "ef_sha256Digest"), "ef_hexString"));
}

- (NSDictionary)properties
{
  id v3 = [(MFAccount *)self persistentAccount];
  if (!v3) {
    return &self->_unsavedAccountProperties->super;
  }
  return (NSDictionary *)[(ACAccount *)v3 accountProperties];
}

+ (id)propertiesWhichRequireValidation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Hostname", @"PortNumber", @"Username", @"Password", @"SSLEnabled", @"AuthenticationScheme", 0);
}

- (void)removeAccountPropertyForKey:(id)a3
{
  uint64_t v5 = [(MFAccount *)self persistentAccount];
  if (v5)
  {
    int v6 = v5;
    if (([(id)objc_opt_class() _setBasicProperty:0 forKey:a3 persistentAccount:v5] & 1) == 0)
    {
      [(ACAccount *)v6 setAccountProperty:0 forKey:a3];
    }
  }
  else
  {
    unsavedAccountProperties = self->_unsavedAccountProperties;
    [(NSMutableDictionary *)unsavedAccountProperties removeObjectForKey:a3];
  }
}

+ (BOOL)_setBasicProperty:(id)a3 forKey:(id)a4 persistentAccount:(id)a5
{
  if (a5)
  {
    if ([a4 isEqualToString:*MEMORY[0x1E4F17648]])
    {
      [a5 setIdentifier:a3];
LABEL_9:
      LOBYTE(v8) = 1;
      return v8;
    }
    if ([a4 isEqualToString:@"Username"])
    {
      [a5 setUsername:a3];
      goto LABEL_9;
    }
    int v8 = [a4 isEqualToString:@"DisplayName"];
    if (v8)
    {
      [a5 setAccountDescription:a3];
      goto LABEL_9;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

+ (id)accountTypeString
{
  return @"Account";
}

+ (void)legacyKeychainProtocol
{
  return (void *)*MEMORY[0x1E4F3B820];
}

- (void)_queueAccountInfoDidChange
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_accountInfoDidChange object:0];
  [(MFAccount *)self performSelector:sel_accountInfoDidChange withObject:0 afterDelay:0.0];
}

- (void)_setAccountProperties:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  _MFLockGlobalLock();
  uint64_t v5 = (void *)[a3 mutableCopy];
  int v6 = (void *)[v5 objectForKey:@"Password"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v6 = objc_msgSend([NSString alloc], "initWithData:encoding:", objc_msgSend(v5, "objectForKey:", @"Password"), 1);
  }
  else {
    id v7 = v6;
  }
  [v5 removeObjectForKey:@"Password"];
  _MFUnlockGlobalLock();
  uint64_t v8 = [a3 objectForKey:@"OAuth2Token"];
  uint64_t v9 = [a3 objectForKey:@"OAuth2RefreshToken"];
  if (v8) {
    [(MFAccount *)self setOAuth2Token:v8 refreshToken:v9 error:0];
  }
  [(MFAccount *)self uniqueId];
  int v10 = (void *)[(id)objc_opt_class() excludedAccountPropertyKeys];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v5);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (([v10 containsObject:v15] & 1) == 0) {
          -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", [v5 objectForKey:v15], v15);
        }
      }
      uint64_t v12 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
  if (v6)
  {
    [(MFAccount *)self setPassword:v6];
  }
}

+ (id)accountPropertiesValueForKey:(id)a3 value:(id)a4
{
  if (![a3 isEqual:@"EmailAddresses"]) {
    return a4;
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F73508];
  return (id)[v5 addressListFromEncodedString:a4];
}

- (void)setValueInAccountProperties:(id)a3 forKey:(id)a4
{
  if ([a4 isEqual:@"Password"]) {
    [(MFAccount *)self setPassword:a3];
  }
  else {
    [(MFAccount *)self setAccountProperty:a3 forKey:a4];
  }
  [(MFAccount *)self _queueAccountInfoDidChange];
}

- (void)removeValueInAccountPropertiesForKey:(id)a3
{
  _MFLockGlobalLock();
  [(MFAccount *)self removeAccountPropertyForKey:a3];
  _MFUnlockGlobalLock();
}

- (id)valueInAccountPropertiesForKey:(id)a3
{
  if ([a3 isEqual:@"SSLEnabled"])
  {
    uint64_t v5 = NSNumber;
    BOOL v6 = [(MFAccount *)self usesSSL];
    return (id)[v5 numberWithBool:v6];
  }
  else
  {
    _MFLockGlobalLock();
    id v8 = [(MFAccount *)self accountPropertyForKey:a3];
    _MFUnlockGlobalLock();
    if ([a3 isEqual:@"Password"])
    {
      return [(MFAccount *)self password];
    }
    else if ([a3 isEqual:@"EmailAddresses"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = (void *)[v8 allKeys];
      }
      return (id)[v9 componentsJoinedByString:@", "];
    }
    else
    {
      return v8;
    }
  }
}

- (BOOL)isActive
{
  uint64_t v2 = [(MFAccount *)self persistentAccount];
  if (!v2) {
    return 1;
  }
  return [(ACAccount *)v2 isActive];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MFAccount *)self persistentAccount])
  {
    uint64_t v5 = [(MFAccount *)self persistentAccount];
    [(ACAccount *)v5 setActive:v3];
  }
}

- (BOOL)canGoOffline
{
  return 0;
}

- (NSString)displayName
{
  BOOL v3 = [(MFAccount *)self _objectForAccountInfoKey:@"DisplayName"];
  if (!v3)
  {
    uint64_t v5 = [(MFAccount *)self username];
    BOOL v6 = [(MFAccount *)self hostname];
    BOOL v3 = v6;
    if (v6)
    {
      if ([(NSString *)v6 isEqualToString:&stru_1F265CF90])
      {
        return 0;
      }
      else if (!v5 {
             || [(NSString *)v5 isEqualToString:&stru_1F265CF90]
      }
             || (BOOL v3 = (NSString *)[NSString stringWithFormat:@"%@:%@@%@", objc_msgSend((id)objc_opt_class(), "accountTypeString"), v5, v3]) != 0)
      {
        _MFLockGlobalLock();
        [(MFAccount *)self setAccountProperty:v3 forKey:@"DisplayName"];
        _MFUnlockGlobalLock();
      }
    }
  }
  return v3;
}

- (void)setDisplayName:(id)a3
{
  uint64_t v5 = [(MFAccount *)self displayName];
  if (v5 != a3)
  {
    BOOL v6 = v5 ? v5 : &stru_1F265CF90;
    if (([a3 isEqualToString:v6] & 1) == 0)
    {
      _MFLockGlobalLock();
      [(MFAccount *)self setAccountProperty:a3 forKey:@"DisplayName"];
      _MFUnlockGlobalLock();
      [(MFAccount *)self _queueAccountInfoDidChange];
    }
  }
}

- (void)setUsername:(id)a3
{
  uint64_t v5 = [(MFAccount *)self username];
  if (v5 != a3)
  {
    BOOL v6 = v5 ? v5 : &stru_1F265CF90;
    if (([a3 isEqualToString:v6] & 1) == 0)
    {
      _MFLockGlobalLock();
      if (a3 && [a3 length]) {
        [(MFAccount *)self setAccountProperty:a3 forKey:@"Username"];
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"Username"];
      }
      _MFUnlockGlobalLock();
      [(MFAccount *)self releaseAllConnections];
      [(MFAccount *)self _queueAccountInfoDidChange];
    }
  }
}

+ (id)hostname
{
  return 0;
}

- (void)setHostname:(id)a3
{
  uint64_t v5 = [(MFAccount *)self hostname];
  if ([a3 length]) {
    a3 = (id)objc_msgSend(a3, "mf_stringWithNoExtraSpaces");
  }
  if (v5 != a3)
  {
    BOOL v6 = v5 ? v5 : &stru_1F265CF90;
    if (([a3 isEqualToString:v6] & 1) == 0)
    {
      _MFLockGlobalLock();
      if (a3 && [a3 length]) {
        [(MFAccount *)self setAccountProperty:a3 forKey:@"Hostname"];
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"Hostname"];
      }
      _MFUnlockGlobalLock();
      [(MFAccount *)self releaseAllConnections];
      [(MFAccount *)self _queueAccountInfoDidChange];
    }
  }
}

- (BOOL)isManaged
{
  return objc_msgSend(-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", @"mcProfileUUID"), "length") != 0;
}

- (BOOL)supportsMailDrop
{
  if (![(MFAccount *)self isManaged]) {
    return 1;
  }
  return [(MFAccount *)self _BOOLForAccountInfoKey:@"MFAccountSupportsMailDrop" defaultValue:0];
}

- (id)_credential
{
  return [(MFAccount *)self _credentialCreateIfNecessary:0];
}

- (id)_credentialCreateIfNecessary:(BOOL)a3
{
  return [(MFAccount *)self _credentialCreateIfNecessary:a3 error:0];
}

- (id)_credentialCreateIfNecessary:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v14 = 0;
  id v7 = (id)[(ACAccount *)[(MFAccount *)self persistentAccount] credentialWithError:&v14];
  if (v14 && (id v8 = MFLogGeneral(), os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)))
  {
    if (v5) {
      uint64_t v12 = "";
    }
    else {
      uint64_t v12 = "NOT ";
    }
    uint64_t v13 = objc_msgSend(v14, "ef_publicDescription");
    *(_DWORD *)buf = 138412802;
    long long v16 = self;
    __int16 v17 = 2080;
    long long v18 = v12;
    __int16 v19 = 2114;
    uint64_t v20 = v13;
    _os_log_error_impl(&dword_1CFCFE000, v8, OS_LOG_TYPE_ERROR, "Encountered error while fetching credential for %@ (will %screate new credential): %{public}@", buf, 0x20u);
    if (v7) {
      goto LABEL_8;
    }
  }
  else if (v7)
  {
    goto LABEL_8;
  }
  if (v5)
  {
    uint64_t v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = [(MFAccount *)self ef_publicDescription];
      *(_DWORD *)buf = 138543362;
      long long v16 = (MFAccount *)v10;
      _os_log_impl(&dword_1CFCFE000, v9, OS_LOG_TYPE_INFO, "Creating new credential for account %{public}@", buf, 0xCu);
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F179C0]);
    _MFLockGlobalLock();
    [(ACAccount *)[(MFAccount *)self persistentAccount] setCredential:v7];
    _MFUnlockGlobalLock();
  }
LABEL_8:
  if (a4 && !v7) {
    *a4 = v14;
  }
  return v7;
}

- (void)setPassword:(id)a3
{
  BOOL v5 = [(MFAccount *)self _password];
  if (v5 != a3)
  {
    BOOL v6 = v5 ? v5 : &stru_1F265CF90;
    if (([a3 isEqualToString:v6] & 1) == 0)
    {
      id v7 = [(MFAccount *)self _credentialCreateIfNecessary:1];
      id v8 = v7;
      if (a3)
      {
        uint64_t v9 = [a3 length];
        if (v9) {
          id v10 = a3;
        }
        else {
          id v10 = 0;
        }
        [v8 setPassword:v10];
        if (v9)
        {
          [(ACAccount *)[(MFAccount *)self persistentAccount] setAuthenticated:1];
LABEL_15:
          [(MFAccount *)self _queueAccountInfoDidChange];
          return;
        }
      }
      else
      {
        [v7 setPassword:0];
      }
      _MFLockGlobalLock();
      [(MFAccount *)self removeAccountPropertyForKey:@"Password"];
      _MFUnlockGlobalLock();
      goto LABEL_15;
    }
  }
}

- (id)_password
{
  return [(MFAccount *)self _passwordWithError:0];
}

- (id)_passwordWithError:(id *)a3
{
  id v3 = [(MFAccount *)self _credentialCreateIfNecessary:0 error:a3];
  return (id)[v3 password];
}

- (id)password
{
  id v3 = [(MFAccount *)self preferredAuthScheme];
  if (!v3 || ![v3 requiresPassword]) {
    return &stru_1F265CF90;
  }
  return [(MFAccount *)self _password];
}

- (unint64_t)credentialAccessibility
{
  id v4 = 0;
  uint64_t v2 = objc_msgSend(-[MFAccount _passwordWithError:](self, "_passwordWithError:", &v4), "length");
  unint64_t result = 0;
  if (!v2)
  {
    if (objc_msgSend(v4, "mf_isInaccessibleAccountCredentialError")) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (id)credentialItemForKey:(id)a3
{
  return [(MFAccount *)self credentialItemForKey:a3 error:0];
}

- (id)credentialItemForKey:(id)a3 error:(id *)a4
{
  id v5 = [(MFAccount *)self _credentialCreateIfNecessary:0 error:a4];
  return (id)[v5 credentialItemForKey:a3];
}

- (void)setCredentialItem:(id)a3 forKey:(id)a4
{
}

- (BOOL)setCredentialItem:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7 = [(MFAccount *)self _credentialCreateIfNecessary:1 error:a5];
  [v7 setCredentialItem:a3 forKey:a4];
  return v7 != 0;
}

- (id)oauth2Token
{
  id v2 = [(MFAccount *)self _credentialCreateIfNecessary:0 error:0];
  return (id)[v2 oauthToken];
}

- (BOOL)setOAuth2Token:(id)a3 refreshToken:(id)a4 error:(id *)a5
{
  id v7 = [(MFAccount *)self _credentialCreateIfNecessary:1 error:a5];
  [v7 setOauthToken:a3];
  [v7 setOauthRefreshToken:a4];
  return v7 != 0;
}

- (BOOL)_renewCredentialsWithOptions:(id)a3 completion:(id)a4
{
  BOOL v6 = [(MFAccount *)self accountForRenewingCredentials];
  if (v6)
  {
    id v7 = objc_msgSend(+[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore"), "persistentStore");
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__MFAccount__renewCredentialsWithOptions_completion___block_invoke;
    v9[3] = &unk_1E6866440;
    v9[4] = a4;
    [v7 renewCredentialsForAccount:v6 options:a3 completion:v9];
  }
  return v6 != 0;
}

uint64_t __53__MFAccount__renewCredentialsWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, MFError *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = @", error:";
    id v8 = &stru_1F265CF90;
    *(_DWORD *)buf = 134218498;
    uint64_t v13 = a2;
    if (!a3) {
      id v7 = &stru_1F265CF90;
    }
    __int16 v14 = 2112;
    if (a3) {
      id v8 = (__CFString *)a3;
    }
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    _os_log_impl(&dword_1CFCFE000, v6, OS_LOG_TYPE_INFO, "Credential renewal result: %ld%@%@", buf, 0x20u);
  }
  if (a2)
  {
    if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v10 = *MEMORY[0x1E4F28A50];
      uint64_t v11 = a3;
      a2 = 1;
      a3 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", @"MFMessageErrorDomain", 1032, 0, 0, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1]);
    }
    else
    {
      a2 = 1;
    }
  }
  else
  {
    a3 = 0;
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, MFError *))(result + 16))(result, a2, a3);
  }
  return result;
}

- (BOOL)renewCredentialsWithOptions:(id)a3 completion:(id)a4
{
  if (a3) {
    BOOL v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
  }
  else {
    BOOL v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  }
  id v7 = v6;
  uint64_t v8 = MEMORY[0x1E4F1CC38];
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F17A40]];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F17A30]];
  return [(MFAccount *)self _renewCredentialsWithOptions:v7 completion:a4];
}

- (BOOL)promptUserForPasswordWithTitle:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F17A40]];
  if (a4) {
    [v8 setObject:a4 forKeyedSubscript:*MEMORY[0x1E4F17A18]];
  }
  return [(MFAccount *)self _renewCredentialsWithOptions:v8 completion:a5];
}

- (BOOL)promptUserForWebLoginWithURL:(id)a3 shouldConfirm:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v9 = [(MFAccount *)self accountForRenewingCredentials];
  if (v9)
  {
    uint64_t v10 = objc_msgSend(+[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore"), "persistentStore");
    persistentAccount = self->_persistentAccount;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__MFAccount_promptUserForWebLoginWithURL_shouldConfirm_completionHandler___block_invoke;
    v13[3] = &unk_1E6866468;
    v13[4] = a5;
    [v10 openAuthenticationURL:a3 forAccount:persistentAccount shouldConfirm:v6 completion:v13];
  }
  return v9 != 0;
}

uint64_t __74__MFAccount_promptUserForWebLoginWithURL_shouldConfirm_completionHandler___block_invoke(uint64_t a1, int a2, __CFString *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = @"failure";
    if (a2) {
      id v7 = @"success";
    }
    *(_DWORD *)buf = 138412802;
    __int16 v14 = v7;
    if (a3) {
      uint64_t v8 = @", error:";
    }
    else {
      uint64_t v8 = &stru_1F265CF90;
    }
    __int16 v15 = 2112;
    __int16 v16 = v8;
    if (a3) {
      uint64_t v9 = a3;
    }
    else {
      uint64_t v9 = &stru_1F265CF90;
    }
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1CFCFE000, v6, OS_LOG_TYPE_INFO, "Web login result: %@%@%@", buf, 0x20u);
  }
  if ((a2 & 1) == 0 && a3)
  {
    uint64_t v11 = *MEMORY[0x1E4F28A50];
    uint64_t v12 = a3;
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", @"MFMessageErrorDomain", 1032, 0, 0, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)managedTag
{
  return (NSString *)[(MFAccount *)self _objectForAccountInfoKey:@"ManagedTag"];
}

- (BOOL)fetchTokensIfNecessary:(id *)a3
{
  return 1;
}

- (unsigned)portNumber
{
  unsigned int result = objc_msgSend(-[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", @"PortNumber"), "intValue");
  if (!result
    && (![(MFAccount *)self usesSSL]
     || (unsigned int result = [(MFAccount *)self defaultSecurePortNumber]) == 0))
  {
    return [(MFAccount *)self defaultPortNumber];
  }
  return result;
}

- (unsigned)defaultPortNumber
{
  id v2 = objc_opt_class();
  return [v2 defaultPortNumber];
}

+ (unsigned)defaultPortNumber
{
  return 0;
}

- (unsigned)defaultSecurePortNumber
{
  id v2 = objc_opt_class();
  return [v2 defaultSecurePortNumber];
}

+ (unsigned)defaultSecurePortNumber
{
  return 0;
}

- (void)setPortNumber:(unsigned int)a3
{
  if ([(MFAccount *)self portNumber] == a3) {
    return;
  }
  if (a3)
  {
    if ([(MFAccount *)self usesSSL]) {
      unsigned int v5 = [(MFAccount *)self defaultSecurePortNumber];
    }
    else {
      unsigned int v5 = [(MFAccount *)self defaultPortNumber];
    }
    unsigned int v6 = v5;
    _MFLockGlobalLock();
    if (v6 != a3)
    {
      [(MFAccount *)self setAccountProperty:EFStringWithInt() forKey:@"PortNumber"];
      goto LABEL_10;
    }
  }
  else
  {
    _MFLockGlobalLock();
  }
  [(MFAccount *)self removeAccountPropertyForKey:@"PortNumber"];
LABEL_10:
  _MFUnlockGlobalLock();
  [(MFAccount *)self releaseAllConnections];
  [(MFAccount *)self _queueAccountInfoDidChange];
}

+ (BOOL)isCommonPortNumber:(unsigned int)a3
{
  return [a1 defaultPortNumber] == a3
      || [a1 defaultSecurePortNumber] == a3;
}

- (id)serviceName
{
  return 0;
}

- (id)secureServiceName
{
  return 0;
}

- (__CFString)connectionServiceType
{
  return 0;
}

- (BOOL)usesSSL
{
  uint64_t v3 = [(id)objc_opt_class() usesSSL];
  return [(MFAccount *)self _BOOLForAccountInfoKey:@"SSLEnabled" defaultValue:v3];
}

+ (BOOL)usesSSL
{
  return 0;
}

- (void)setUsesSSL:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MFAccount *)self usesSSL] != a3)
  {
    _MFLockGlobalLock();
    if (v3) {
      -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", [NSNumber numberWithBool:1], @"SSLEnabled");
    }
    else {
      [(MFAccount *)self removeAccountPropertyForKey:@"SSLEnabled"];
    }
    _MFUnlockGlobalLock();
    [(MFAccount *)self releaseAllConnections];
    [(MFAccount *)self _queueAccountInfoDidChange];
  }
}

+ (BOOL)isSSLEditable
{
  id v2 = (void *)[a1 predefinedValueForKey:@"SSLEnabledIsEditable"];
  if (!v2) {
    return 1;
  }
  return [v2 BOOLValue];
}

- (BOOL)allowsTrustPrompt
{
  return 1;
}

- (void)setTryDirectSSL:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MFAccount *)self _shouldTryDirectSSLConnectionOnPort:[(MFAccount *)self portNumber]] != a3)
  {
    _MFLockGlobalLock();
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", [NSNumber numberWithBool:v3], @"SSLIsDirect");
    _MFUnlockGlobalLock();
    [(MFAccount *)self releaseAllConnections];
    [(MFAccount *)self _queueAccountInfoDidChange];
  }
}

- (id)domain
{
  return [(MFAccount *)self _objectForAccountInfoKey:@"Domain"];
}

- (void)setDomain:(id)a3
{
  unsigned int v5 = [(MFAccount *)self domain];
  if (v5 != a3)
  {
    unsigned int v6 = v5 ? v5 : &stru_1F265CF90;
    if (([a3 isEqualToString:v6] & 1) == 0)
    {
      _MFLockGlobalLock();
      if (a3 && [a3 length]) {
        [(MFAccount *)self setAccountProperty:a3 forKey:@"Domain"];
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"Domain"];
      }
      _MFUnlockGlobalLock();
      [(MFAccount *)self releaseAllConnections];
      [(MFAccount *)self _queueAccountInfoDidChange];
    }
  }
}

- (id)clientCertificates
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MFAccount *)self _objectForAccountInfoKey:@"SSLClientIdentity"];
  if (v3) {
    id v4 = +[MFMessageKeychainManager copyIdentityForPersistentReference:v3 error:0];
  }
  else {
    id v4 = +[MFMessageKeychainManager copyClientSSLIdentityForHostName:[(MFAccount *)self hostname] error:0];
  }
  unsigned int v5 = v4;
  if (!v4) {
    return 0;
  }
  v8[0] = v4;
  unsigned int v6 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  CFRelease(v5);
  return v6;
}

- (void)setClientCertificates:(id)a3
{
  if ([a3 count])
  {
    unsigned int v5 = (const void *)[a3 objectAtIndex:0];
    CFTypeID v6 = CFGetTypeID(v5);
    if (v6 == SecIdentityGetTypeID())
    {
      id v7 = +[MFMessageKeychainManager persistentReferenceForIdentity:v5 error:0];
      _MFLockGlobalLock();
      if (v7) {
        [(MFAccount *)self setAccountProperty:v7 forKey:@"SSLClientIdentity"];
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"SSLClientIdentity"];
      }
      _MFUnlockGlobalLock();
    }
  }
}

- (void)accountInfoDidChange
{
  id v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [(MFAccount *)self properties];
  [v3 postNotificationName:@"AccountInfoDidChange" object:self userInfo:v4];
}

- (id)preferredAuthScheme
{
  id v3 = [(MFAccount *)self _objectForAccountInfoKey:@"AuthenticationScheme"];
  if ([@"PLAIN" isEqualToString:v3]) {
    id v4 = &stru_1F265CF90;
  }
  else {
    id v4 = v3;
  }
  if (!v4)
  {
    if ([(MFAccount *)self requiresAuthentication]) {
      id v4 = &stru_1F265CF90;
    }
    else {
      id v4 = 0;
    }
  }
  return +[MFAuthScheme schemeWithName:v4];
}

- (void)setPreferredAuthScheme:(id)a3
{
  if ([(MFAccount *)self preferredAuthScheme] != a3)
  {
    uint64_t v5 = [a3 name];
    _MFLockGlobalLock();
    if (v5) {
      [(MFAccount *)self setAccountProperty:v5 forKey:@"AuthenticationScheme"];
    }
    else {
      [(MFAccount *)self removeAccountPropertyForKey:@"AuthenticationScheme"];
    }
    _MFUnlockGlobalLock();
  }
}

+ (id)saslProfileName
{
  return 0;
}

- (id)_newConnection
{
  id v2 = [(MFAccount *)self connectionClass];
  return objc_alloc_init(v2);
}

- (Class)connectionClass
{
  id v2 = [(MFAccount *)self preferredAuthScheme];
  uint64_t v3 = objc_opt_class();
  return (Class)[v2 connectionClassForAccountClass:v3];
}

- (BOOL)requiresAuthentication
{
  return 0;
}

- (id)authenticatedConnection
{
  id v3 = [(MFAccount *)self _newConnection];
  if (v3 && ![(MFAccount *)self _connectAndAuthenticate:v3])
  {

    id v3 = 0;
  }
  return v3;
}

- (id)certUIService
{
}

- (id)defaultConnectionSettings
{
  id v3 = objc_alloc_init(MFConnectionSettings);
  [(MFConnectionSettings *)v3 setUsesSSL:[(MFAccount *)self usesSSL]];
  [(MFConnectionSettings *)v3 setHostname:[(MFAccount *)self hostname]];
  [(MFConnectionSettings *)v3 setPortNumber:[(MFAccount *)self portNumber]];
  [(MFConnectionSettings *)v3 setCertUIService:[(MFAccount *)self certUIService]];
  if ([(MFConnectionSettings *)v3 usesSSL]) {
    [(MFConnectionSettings *)v3 setClientCertificates:[(MFAccount *)self clientCertificates]];
  }
  if ([(MFConnectionSettings *)v3 usesSSL]) {
    BOOL v4 = [(MFAccount *)self _shouldTryDirectSSLConnectionOnPort:[(MFConnectionSettings *)v3 portNumber]];
  }
  else {
    BOOL v4 = 0;
  }
  [(MFConnectionSettings *)v3 setTryDirectSSL:v4];
  if ([(MFConnectionSettings *)v3 tryDirectSSL]) {
    id v5 = [(MFAccount *)self secureServiceName];
  }
  else {
    id v5 = [(MFAccount *)self serviceName];
  }
  [(MFConnectionSettings *)v3 setServiceName:v5];
  [(MFConnectionSettings *)v3 setConnectionServiceType:[(MFAccount *)self connectionServiceType]];
  [(MFConnectionSettings *)v3 setAllowsTrustPrompt:[(MFAccount *)self allowsTrustPrompt]];
  [(MFConnectionSettings *)v3 setAccountIdentifier:[(MFAccount *)self uniqueId]];
  [(MFConnectionSettings *)v3 setNetworkAccountIdentifier:[(MFAccount *)self networkAccountIdentifier]];
  CFTypeID v6 = [(MFAccount *)self sourceApplicationBundleIdentifier];
  if ([(NSString *)v6 length]) {
    [(MFConnectionSettings *)v3 setSourceApplicationBundleIdentifier:v6];
  }
  return v3;
}

- (void)applySettingsAsDefault:(id)a3
{
  -[MFAccount setUsesSSL:](self, "setUsesSSL:", [a3 usesSSL]);
  -[MFAccount setPortNumber:](self, "setPortNumber:", [a3 portNumber]);
  uint64_t v5 = [a3 tryDirectSSL];
  [(MFAccount *)self setTryDirectSSL:v5];
}

- (id)alternateConnectionSettings
{
  return 0;
}

- (id)insecureConnectionSettings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(MFAccount *)self defaultConnectionSettings];
  [v2 setUsesSSL:0];
  [v2 setTryDirectSSL:0];
  v4[0] = v2;
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
}

- (id)secureConnectionSettings
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MFAccount *)self defaultConnectionSettings];
  [v3 setUsesSSL:1];
  [v3 setTryDirectSSL:1];
  objc_msgSend(v3, "setPortNumber:", -[MFAccount defaultSecurePortNumber](self, "defaultSecurePortNumber"));
  v5[0] = v3;
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
}

- (BOOL)_shouldTryDirectSSLConnectionOnPort:(unsigned int)a3
{
  unsigned int v5 = [(MFAccount *)self defaultSecurePortNumber];
  id v6 = [(MFAccount *)self _objectForAccountInfoKey:@"SSLIsDirect"];
  if (v6)
  {
    LOBYTE(v7) = [v6 BOOLValue];
  }
  else
  {
    return v5 == a3;
  }
  return v7;
}

- (id)customDescriptionForError:(id)a3 authScheme:(id)a4 defaultDescription:(id)a5
{
  if ([(MFAccount *)self credentialAccessibility] == 1
    && [a3 code] == 1032)
  {
    return (id)[NSString stringWithFormat:MFLookupLocalizedString(@"NO_PASSWORD_PROVIDED_FOR_USER_FORMAT", @"No password provided for user “%@” on server “%@”.\n\nPlease go to Mail Account Settings and enter a password.", 0), -[MFAccount username](self, "username"), -[MFAccount hostname](self, "hostname")];
  }
  else
  {
    return a5;
  }
}

- (void)reportAuthenticationError:(id)a3 authScheme:(id)a4
{
  id v7 = +[MFActivityMonitor currentMonitor];
  objc_msgSend(a3, "setLocalizedDescription:", -[MFAccount customDescriptionForError:authScheme:defaultDescription:](self, "customDescriptionForError:authScheme:defaultDescription:", a3, a4, objc_msgSend(a3, "localizedDescription")));
  [v7 setError:a3];
}

- (BOOL)_connectAndAuthenticate:(id)a3
{
  id v5 = [(MFAccount *)self preferredAuthScheme];
  id v6 = +[MFActivityMonitor currentMonitor];
  if ([v6 shouldCancel]) {
    goto LABEL_6;
  }
  int v7 = [a3 connectUsingFallbacksForAccount:self];
  if (v7)
  {
    if ([a3 authenticateUsingAccount:self])
    {
      LOBYTE(v7) = 1;
      return v7;
    }
    [a3 disconnect];
    -[MFAccount reportAuthenticationError:authScheme:](self, "reportAuthenticationError:authScheme:", [v6 error], v5);
LABEL_6:
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (NSString)uniqueId
{
  uint64_t v3 = *MEMORY[0x1E4F17648];
  BOOL v4 = [(MFAccount *)self _objectForAccountInfoKey:*MEMORY[0x1E4F17648]];
  if (!v4)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFUUIDRef v6 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    if (v6)
    {
      CFUUIDRef v7 = v6;
      uint64_t v8 = (__CFString *)CFUUIDCreateString(v5, v6);
      CFRelease(v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
    BOOL v4 = v8;
    _MFLockGlobalLock();
    [(MFAccount *)self setAccountProperty:v4 forKey:v3];
    _MFUnlockGlobalLock();
  }
  return &v4->isa;
}

- (id)nameForMailboxUid:(id)a3
{
  return (id)[a3 name];
}

- (BOOL)shouldEnableAfterError:(id)a3
{
  return 0;
}

- (BOOL)enableAccount
{
  return 0;
}

- (BOOL)shouldDisplayHostnameInErrorMessages
{
  return 1;
}

- (id)missingPasswordErrorWithTitle:(id)a3
{
  uint64_t v4 = [NSString stringWithFormat:MFLookupLocalizedString(@"NO_PASSWORD_PROVIDED_FOR_ACCOUNT_FORMAT", @"No password provided for “%@”.\n\nPlease go to Mail Account Settings and enter a password.", 0), -[MFAccount displayName](self, "displayName")];
  return +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1055 localizedDescription:v4 title:a3 userInfo:0];
}

- (id)inaccessiblePasswordErrorWithTitle:(id)a3
{
  uint64_t v4 = [NSString stringWithFormat:MFLookupLocalizedString(@"PASSWORD_INACCESSIBLE_FOR_ACCOUNT_FORMAT", @"The password for “%@” cannot be used at this time.", 0), -[MFAccount displayName](self, "displayName")];
  return +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1056 localizedDescription:v4 title:a3 userInfo:0];
}

- (id)loginDisabledErrorWithTitle:(id)a3
{
  uint64_t v4 = [NSString stringWithFormat:MFLookupLocalizedString(@"LOGIN_DISABLED_FOR_ACCOUNT_FORMAT", @"Logins are disabled for “%@”.", 0), -[MFAccount displayName](self, "displayName")];
  return +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1059 localizedDescription:v4 title:a3 userInfo:0];
}

+ (id)supportedDataclasses
{
  id v3 = +[MFAccountStore sharedAccountStore];
  uint64_t v4 = [a1 accountTypeIdentifier];
  return (id)[v3 supportedDataclassesWithAccountTypeIdentifier:v4];
}

- (id)enabledDataclasses
{
  id v2 = (void *)[(ACAccount *)[(MFAccount *)self persistentAccount] enabledDataclasses];
  return (id)[v2 allObjects];
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  uint64_t v4 = [(MFAccount *)self persistentAccount];
  return [(ACAccount *)v4 isEnabledForDataclass:a3];
}

- (BOOL)isSyncingNotes
{
  return [(MFAccount *)self isEnabledForDataclass:*MEMORY[0x1E4F17B00]];
}

- (id)copyDiagnosticInformation
{
  return (id)[[NSString alloc] initWithFormat:@"  account : %@\n", self];
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
}

@end