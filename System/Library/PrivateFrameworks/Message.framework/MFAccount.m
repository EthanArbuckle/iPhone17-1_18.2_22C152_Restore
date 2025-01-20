@interface MFAccount
+ (BOOL)_setBasicProperty:(id)a3 forKey:(id)a4 persistentAccount:(id)a5;
+ (BOOL)accountIsManaged:(id)a3;
+ (BOOL)accountIsPreventedFromSendingFromExternalProcesses:(id)a3;
+ (BOOL)accountIsRestrictedFromTransfersToOtherAccounts:(id)a3;
+ (BOOL)accountRestrictsRecentsSyncing:(id)a3;
+ (BOOL)accountSourceIsManaged:(id)a3;
+ (BOOL)isCommonPortNumber:(unsigned int)a3;
+ (BOOL)isPredefinedAccountType;
+ (BOOL)isSSLEditable;
+ (BOOL)shouldHealAccounts;
+ (BOOL)usesSSL;
+ (NSString)accountTypeString;
+ (id)_basicPropertyForKey:(id)a3 persistentAccount:(id)a4;
+ (id)_newPersistentAccount;
+ (id)accountPropertiesValueForKey:(id)a3 value:(id)a4;
+ (id)accountTypeIdentifier;
+ (id)accountWithPersistentAccount:(id)a3;
+ (id)accountWithProperties:(id)a3;
+ (id)authSchemesForAccountClass;
+ (id)excludedAccountPropertyKeys;
+ (id)existingAccountForUniqueID:(id)a3;
+ (id)hostname;
+ (id)newAccountWithDictionary:(id)a3;
+ (id)predefinedValueForKey:(id)a3;
+ (id)propertiesWhichRequireValidation;
+ (id)releaseAllConnectionsScheduler;
+ (id)saslProfileName;
+ (id)supportedDataclasses;
+ (unsigned)defaultPortNumber;
+ (unsigned)defaultSecurePortNumber;
+ (void)legacyKeychainProtocol;
+ (void)setShouldHealAccounts:(BOOL)a3;
- (ACAccount)parentAccount;
- (ACAccount)persistentAccount;
- (ACAccount)systemAccount;
- (BOOL)_BOOLForAccountInfoKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)_connectAndAuthenticate:(id)a3;
- (BOOL)_renewCredentialsWithOptions:(id)a3 completion:(id)a4;
- (BOOL)_shouldTryDirectSSLConnectionOnPort:(unsigned int)a3;
- (BOOL)allowsTrustPrompt;
- (BOOL)canAuthenticateWithCurrentCredentials;
- (BOOL)canGoOffline;
- (BOOL)connectionsAreConstrained;
- (BOOL)enableAccount;
- (BOOL)fetchTokensIfNecessary:(id *)a3;
- (BOOL)hasPasswordCredential;
- (BOOL)isActive;
- (BOOL)isEnabledForDataclass:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isManaged;
- (BOOL)isSyncingNotes;
- (BOOL)primaryiCloudAccount;
- (BOOL)promptUserForWebLoginWithURL:(id)a3 shouldConfirm:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)renewCredentialsWithOptions:(id)a3 completion:(id)a4;
- (BOOL)requiresAuthentication;
- (BOOL)shouldDisplayHostnameInErrorMessages;
- (BOOL)shouldEnableAfterError:(id)a3;
- (BOOL)shouldFetchACEDBInfoForError:(id)a3;
- (BOOL)supportsMailDrop;
- (BOOL)usesSSL;
- (Class)connectionClass;
- (ECAccount)baseAccount;
- (ECAuthenticationScheme)preferredAuthScheme;
- (EFLocked)currentConnections;
- (MFAccount)init;
- (MFAccount)initWithPersistentAccount:(id)a3;
- (MFAccount)initWithProperties:(id)a3;
- (NSArray)emailAddressStrings;
- (NSDictionary)properties;
- (NSString)altDSID;
- (NSString)description;
- (NSString)displayName;
- (NSString)domain;
- (NSString)ef_publicDescription;
- (NSString)hostname;
- (NSString)identifier;
- (NSString)managedTag;
- (NSString)oauth2Token;
- (NSString)parentAccountIdentifier;
- (NSString)password;
- (NSString)personaIdentifier;
- (NSString)sourceApplicationBundleIdentifier;
- (NSString)statisticsKind;
- (NSString)type;
- (NSString)uniqueID;
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
- (id)customDescriptionForError:(id)a3 authScheme:(id)a4 defaultDescription:(id)a5;
- (id)defaultConnectionSettings;
- (id)enabledDataclasses;
- (id)inaccessiblePasswordErrorWithTitle:(id)a3;
- (id)insecureConnectionSettings;
- (id)loginDisabledErrorWithTitle:(id)a3;
- (id)missingPasswordErrorWithTitle:(id)a3;
- (id)nameForMailboxUid:(id)a3;
- (id)secureConnectionSettings;
- (id)secureServiceName;
- (id)serviceName;
- (id)valueInAccountPropertiesForKey:(id)a3;
- (id)wrongPasswordOrUsernameErrorWithTitle:(id)a3;
- (unint64_t)credentialAccessibility;
- (unint64_t)hash;
- (unsigned)defaultPortNumber;
- (unsigned)defaultSecurePortNumber;
- (unsigned)portNumber;
- (void)_queueAccountInfoDidChange;
- (void)_setAccountProperties:(id)a3;
- (void)accountInfoDidChange;
- (void)applySettingsAsDefault:(id)a3;
- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4;
- (void)removeAccountPropertyForKey:(id)a3;
- (void)removePersistentAccount;
- (void)removeValueInAccountPropertiesForKey:(id)a3;
- (void)reportAuthenticationError:(id)a3 authScheme:(id)a4;
- (void)savePersistentAccount;
- (void)setAccountProperty:(id)a3 forKey:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setAllowsTrustPrompt:(BOOL)a3;
- (void)setClientCertificates:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDomain:(id)a3;
- (void)setHostname:(id)a3;
- (void)setInvalidCredentialsError;
- (void)setMissingPasswordError;
- (void)setOAuth2Token:(id)a3 refreshToken:(id)a4;
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

- (NSString)uniqueID
{
  uint64_t v3 = *MEMORY[0x1E4F17648];
  v4 = [(MFAccount *)self _objectForAccountInfoKey:*MEMORY[0x1E4F17648]];
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F29128] UUID];
    v4 = [v5 UUIDString];

    [(MFAccount *)self mf_lock];
    [(MFAccount *)self setAccountProperty:v4 forKey:v3];
    [(MFAccount *)self mf_unlock];
  }
  return (NSString *)v4;
}

- (id)_objectForAccountInfoKey:(id)a3
{
  id v4 = a3;
  [(MFAccount *)self mf_lock];
  v5 = [(MFAccount *)self accountPropertyForKey:v4];
  [(MFAccount *)self mf_unlock];

  return v5;
}

- (id)accountPropertyForKey:(id)a3
{
  id v4 = a3;
  v5 = [(MFAccount *)self persistentAccount];
  if (v5)
  {
    v6 = [(id)objc_opt_class() _basicPropertyForKey:v4 persistentAccount:v5];
    if (v6) {
      goto LABEL_6;
    }
    uint64_t v7 = [v5 accountPropertyForKey:v4];
  }
  else
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_unsavedAccountProperties objectForKey:v4];
  }
  v6 = (void *)v7;
LABEL_6:

  return v6;
}

- (ACAccount)persistentAccount
{
  p_persistentAccountLock = &self->_persistentAccountLock;
  os_unfair_lock_lock(&self->_persistentAccountLock);
  id v4 = self->_persistentAccount;
  os_unfair_lock_unlock(p_persistentAccountLock);
  return v4;
}

+ (id)_basicPropertyForKey:(id)a3 persistentAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  _MFLockGlobalLock();
  if (v6)
  {
    if ([v5 isEqualToString:*MEMORY[0x1E4F17648]])
    {
      uint64_t v7 = [v6 identifier];
LABEL_8:
      v8 = (void *)v7;
      goto LABEL_10;
    }
    if ([v5 isEqualToString:@"Username"])
    {
      uint64_t v7 = [v6 username];
      goto LABEL_8;
    }
    if ([v5 isEqualToString:@"DisplayName"])
    {
      uint64_t v7 = [v6 accountDescription];
      goto LABEL_8;
    }
  }
  v8 = 0;
LABEL_10:
  _MFUnlockGlobalLock();

  return v8;
}

- (NSString)identifier
{
  return (NSString *)[(MFAccount *)self accountPropertyForKey:*MEMORY[0x1E4F17648]];
}

- (BOOL)isSyncingNotes
{
  return [(MFAccount *)self isEnabledForDataclass:*MEMORY[0x1E4F17B00]];
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  id v4 = a3;
  id v5 = [(MFAccount *)self baseAccount];
  char v6 = [v5 isEnabledForDataclass:v4];

  return v6;
}

- (ECAccount)baseAccount
{
  return self->_baseAccount;
}

- (NSString)ef_publicDescription
{
  uint64_t v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];

  if (v4) {
    [(MFAccount *)self description];
  }
  else {
  id v5 = [(MFAccount *)self _privacySafeDescription];
  }
  return (NSString *)v5;
}

- (id)_privacySafeDescription
{
  [(MFAccount *)self mf_lock];
  cachedPrivacySafeDescription = self->_cachedPrivacySafeDescription;
  if (cachedPrivacySafeDescription)
  {
    int v4 = cachedPrivacySafeDescription;
  }
  else
  {
    id v5 = [(MFAccount *)self _objectForAccountInfoKey:*MEMORY[0x1E4F17648]];
    [NSString stringWithFormat:@"<%@ %p> ID=%@", objc_opt_class(), self, v5];
    int v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v5) {
      objc_storeStrong((id *)&self->_cachedPrivacySafeDescription, v4);
    }
  }
  [(MFAccount *)self mf_unlock];
  return v4;
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(MFAccount *)self persistentAccount];
  if (v7)
  {
    if (([(id)objc_opt_class() _setBasicProperty:v11 forKey:v6 persistentAccount:v7] & 1) == 0) {
      [v7 setAccountProperty:v11 forKey:v6];
    }
  }
  else
  {
    unsavedAccountProperties = self->_unsavedAccountProperties;
    if (!unsavedAccountProperties)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v10 = self->_unsavedAccountProperties;
      self->_unsavedAccountProperties = v9;

      unsavedAccountProperties = self->_unsavedAccountProperties;
    }
    [(NSMutableDictionary *)unsavedAccountProperties setValue:v11 forKey:v6];
  }
}

- (BOOL)isManaged
{
  return +[MFAccount accountIsManaged:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 uniqueID];
    id v6 = [(MFAccount *)self uniqueID];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)primaryiCloudAccount
{
  v2 = [(MFAccount *)self persistentAccount];
  uint64_t v3 = [v2 parentAccount];
  char v4 = objc_msgSend(v3, "aa_isAccountClass:", *MEMORY[0x1E4F4BF38]);

  return v4;
}

- (MFAccount)initWithPersistentAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = (id)[(id)objc_opt_class() _newPersistentAccount];
  }
  v14.receiver = self;
  v14.super_class = (Class)MFAccount;
  id v5 = [(MFAccount *)&v14 init];
  id v6 = v5;
  if (v5)
  {
    v5->_persistentAccountLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x1E4F607B8] accountWithSystemAccount:v4];
    baseAccount = v6->_baseAccount;
    v6->_baseAccount = (ECAccount *)v7;

    [(MFAccount *)v6 setPersistentAccount:v4];
    id v9 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v11 = [v9 initWithObject:v10];
    currentConnections = v6->_currentConnections;
    v6->_currentConnections = (EFLocked *)v11;

    v6->_allowsTrustPrompt = 1;
  }

  return v6;
}

- (void)setPersistentAccount:(id)a3
{
  id v6 = (ACAccount *)a3;
  if (v6 && self->_unsavedAccountProperties)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"Account.m" lineNumber:262 description:@"Cannot set persistent account on account with unsaved account properties"];
  }
  persistentAccount = self->_persistentAccount;
  if (persistentAccount != v6)
  {
    if (persistentAccount)
    {
      v8 = MFUserAgent();

      if (v8)
      {
        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        id v9 = [(id)objc_opt_class() releaseAllConnectionsScheduler];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __34__MFAccount_setPersistentAccount___block_invoke;
        v13[3] = &unk_1E5D3B0E0;
        objc_copyWeak(&v14, &location);
        [v9 performBlock:v13];

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
    os_unfair_lock_lock(&self->_persistentAccountLock);
    v10 = self->_persistentAccount;
    objc_storeStrong((id *)&self->_persistentAccount, a3);
    if (v6)
    {
      uint64_t v11 = [(MFAccount *)self baseAccount];
      [v11 setSystemAccount:v6];
    }
    os_unfair_lock_unlock(&self->_persistentAccountLock);
    [(MFAccount *)self persistentAccountDidChange:v6 previousAccount:v10];
  }
}

- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4
{
  id v4 = [(MFAccount *)self baseAccount];
  [v4 clearCache];
}

+ (id)releaseAllConnectionsScheduler
{
  if (releaseAllConnectionsScheduler_onceToken != -1) {
    dispatch_once(&releaseAllConnectionsScheduler_onceToken, &__block_literal_global_130);
  }
  v2 = (void *)releaseAllConnectionsScheduler_scheduler;
  return v2;
}

- (unint64_t)hash
{
  v2 = [(MFAccount *)self uniqueID];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (void)setShouldHealAccounts:(BOOL)a3
{
  sShouldHealAccount = a3;
}

- (NSString)personaIdentifier
{
  v2 = [(MFAccount *)self baseAccount];
  unint64_t v3 = [v2 personaIdentifier];

  return (NSString *)v3;
}

- (BOOL)_BOOLForAccountInfoKey:(id)a3 defaultValue:(BOOL)a4
{
  id v6 = a3;
  [(MFAccount *)self mf_lock];
  uint64_t v7 = [(MFAccount *)self accountPropertyForKey:v6];
  [(MFAccount *)self mf_unlock];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      a4 = [v7 BOOLValue];
    }
  }

  return a4;
}

- (NSString)hostname
{
  return (NSString *)[(MFAccount *)self _objectForAccountInfoKey:@"Hostname"];
}

- (NSString)username
{
  return (NSString *)[(MFAccount *)self _objectForAccountInfoKey:@"Username"];
}

void __34__MFAccount_setPersistentAccount___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained releaseAllConnections];
}

+ (BOOL)accountSourceIsManaged:(id)a3
{
  return [a3 MCIsManaged];
}

- (void)_queueAccountInfoDidChange
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_accountInfoDidChange object:0];
  [(MFAccount *)self performSelector:sel_accountInfoDidChange withObject:0 afterDelay:0.0];
}

- (NSString)parentAccountIdentifier
{
  p_persistentAccountLock = &self->_persistentAccountLock;
  os_unfair_lock_lock(&self->_persistentAccountLock);
  id v4 = [(MFAccount *)self baseAccount];
  id v5 = [v4 systemAccount];
  id v6 = [v5 parentAccountIdentifier];

  os_unfair_lock_unlock(p_persistentAccountLock);
  return (NSString *)v6;
}

+ (BOOL)accountIsManaged:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:*MEMORY[0x1E4F176D8]];
  if ([v4 length])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v3 accountPropertyForKey:@"mcProfileUUID"];
    if ([v6 length])
    {
      BOOL v5 = 1;
    }
    else
    {
      uint64_t v7 = [v3 accountPropertyForKey:@"ManagedTag"];
      BOOL v5 = [v7 length] != 0;
    }
  }

  return v5;
}

void __43__MFAccount_releaseAllConnectionsScheduler__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.Message.ReleaseAllConnections" qualityOfService:17];
  v1 = (void *)releaseAllConnectionsScheduler_scheduler;
  releaseAllConnectionsScheduler_scheduler = v0;
}

- (void)accountInfoDidChange
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v3 = [(MFAccount *)self properties];
  [v4 postNotificationName:@"AccountInfoDidChange" object:self userInfo:v3];
}

- (NSDictionary)properties
{
  id v3 = [(MFAccount *)self persistentAccount];
  if (v3)
  {
    id v4 = [(MFAccount *)self baseAccount];
    BOOL v5 = [v4 properties];
  }
  else
  {
    BOOL v5 = self->_unsavedAccountProperties;
  }

  return (NSDictionary *)v5;
}

+ (id)_newPersistentAccount
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [a1 accountTypeIdentifier];
  id v3 = +[MFAccountStore sharedAccountStore];
  id v4 = (void *)[v3 newPersistentAccountWithAccountTypeIdentifier:v2];
  [v3 supportedDataclassesWithAccountTypeIdentifier:v2];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    uint64_t v8 = *MEMORY[0x1E4F17B00];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v4, "setProvisioned:forDataclass:", 1, v10, (void)v12);
        objc_msgSend(v4, "setEnabled:forDataclass:", objc_msgSend(v10, "isEqualToString:", v8) ^ 1, v10);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [v4 setAuthenticated:1];
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConnections, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_baseAccount, 0);
  objc_storeStrong((id *)&self->emailAddressStrings, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_cachedPrivacySafeDescription, 0);
  objc_storeStrong((id *)&self->_unsavedAccountProperties, 0);
  objc_storeStrong((id *)&self->_persistentAccount, 0);
}

- (NSString)displayName
{
  id v3 = [(MFAccount *)self _objectForAccountInfoKey:@"DisplayName"];
  if (!v3)
  {
    id v4 = [(MFAccount *)self username];
    id v5 = [(MFAccount *)self hostname];
    uint64_t v6 = v5;
    if (!v5 || ([v5 isEqualToString:&stru_1EFF11268] & 1) != 0)
    {
      id v3 = 0;
LABEL_10:

      goto LABEL_11;
    }
    if (v4 && ([v4 isEqualToString:&stru_1EFF11268] & 1) == 0)
    {
      uint64_t v7 = NSString;
      uint64_t v8 = [(id)objc_opt_class() accountTypeString];
      id v3 = [v7 stringWithFormat:@"%@:%@@%@", v8, v4, v6];

      if (!v3) {
        goto LABEL_10;
      }
    }
    else
    {
      id v3 = v6;
    }
    [(MFAccount *)self mf_lock];
    [(MFAccount *)self setAccountProperty:v3 forKey:@"DisplayName"];
    [(MFAccount *)self mf_unlock];
    goto LABEL_10;
  }
LABEL_11:
  return (NSString *)v3;
}

+ (BOOL)shouldHealAccounts
{
  return sShouldHealAccount;
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 code];
  id v5 = [v3 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F28798]];

  unsigned int v7 = (0x4601u >> (v4 - 51)) & 1;
  if ((unint64_t)(v4 - 51) >= 0xF) {
    LOBYTE(v7) = 0;
  }
  if (v6) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = [v3 domain];
  int v10 = [v9 isEqualToString:@"MFMessageErrorDomain"];

  if (v10) {
    BOOL v8 = v4 == 1034;
  }
  uint64_t v11 = [v3 domain];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F18F50]];

  BOOL v13 = (unint64_t)(v4 - 1) < 2;
  if (!v12) {
    BOOL v13 = v8;
  }
  if (v13) {
    char v14 = [(id)objc_opt_class() shouldHealAccounts];
  }
  else {
    char v14 = 0;
  }

  return v14;
}

+ (id)newAccountWithDictionary:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)excludedAccountPropertyKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Password", @"OAuth2Token", @"OAuth2RefreshToken", 0);
}

+ (id)accountWithProperties:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperties:v3];

  return v4;
}

+ (id)authSchemesForAccountClass
{
  if (authSchemesForAccountClass_onceToken != -1) {
    dispatch_once(&authSchemesForAccountClass_onceToken, &__block_literal_global);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MFAccount_authSchemesForAccountClass__block_invoke_2;
  v5[3] = &__block_descriptor_40_e32_B16__0__ECAuthenticationScheme_8l;
  v5[4] = a1;
  id v3 = objc_msgSend((id)authSchemesForAccountClass_knownSchemes, "ef_filter:", v5);
  return v3;
}

void __39__MFAccount_authSchemesForAccountClass__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F607C8] knownSchemes];
  v1 = (void *)authSchemesForAccountClass_knownSchemes;
  authSchemesForAccountClass_knownSchemes = v0;
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
  id v4 = a3;
  id v5 = [(MFAccount *)self initWithPersistentAccount:0];
  if (v5)
  {
    int v6 = (void *)[v4 mutableCopy];
    unsigned int v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = (id)objc_opt_new();
    }
    id v9 = v8;

    int v10 = [(id)objc_opt_class() _accountClass];
    [v9 setObject:v10 forKey:@"Class"];

    v5->_allowsTrustPrompt = 1;
    [(MFAccount *)v5 _setAccountProperties:v9];
  }
  return v5;
}

+ (id)accountWithPersistentAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[MFAccountStore sharedAccountStore];
  id v5 = [v4 existingAccountWithPersistentAccount:v3];

  return v5;
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

- (NSString)altDSID
{
  return (NSString *)[(MFAccount *)self accountPropertyForKey:@"altDSID"];
}

- (ACAccount)parentAccount
{
  p_persistentAccountLock = &self->_persistentAccountLock;
  os_unfair_lock_lock(&self->_persistentAccountLock);
  id v4 = [(MFAccount *)self baseAccount];
  id v5 = [v4 systemAccount];
  int v6 = [v5 parentAccount];

  os_unfair_lock_unlock(p_persistentAccountLock);
  return (ACAccount *)v6;
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
  [(MFAccount *)self mf_lock];
  cachedDescription = self->_cachedDescription;
  if (cachedDescription)
  {
    id v4 = cachedDescription;
  }
  else
  {
    id v5 = [(MFAccount *)self _objectForAccountInfoKey:@"DisplayName"];
    int v6 = objc_msgSend(v5, "ef_sha256Digest");
    unsigned int v7 = objc_msgSend(v6, "ef_hexString");

    id v8 = [(MFAccount *)self _privacySafeDescription];
    [v8 stringByAppendingFormat:@" displayName=%@", v7];
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v5 && v7) {
      objc_storeStrong((id *)&self->_cachedDescription, v4);
    }
  }
  [(MFAccount *)self mf_unlock];
  return v4;
}

+ (id)propertiesWhichRequireValidation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Hostname", @"PortNumber", @"Username", @"Password", @"SSLEnabled", @"AuthenticationScheme", 0);
}

- (void)removeAccountPropertyForKey:(id)a3
{
  id v5 = a3;
  id v4 = [(MFAccount *)self persistentAccount];
  if (v4)
  {
    if (([(id)objc_opt_class() _setBasicProperty:0 forKey:v5 persistentAccount:v4] & 1) == 0) {
      [v4 setAccountProperty:0 forKey:v5];
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_unsavedAccountProperties removeObjectForKey:v5];
  }
}

+ (BOOL)_setBasicProperty:(id)a3 forKey:(id)a4 persistentAccount:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    _MFLockGlobalLock();
    if ([v8 isEqualToString:*MEMORY[0x1E4F17648]])
    {
      [v9 setIdentifier:v7];
    }
    else if ([v8 isEqualToString:@"Username"])
    {
      [v9 setUsername:v7];
    }
    else
    {
      if (![v8 isEqualToString:@"DisplayName"])
      {
        BOOL v10 = 0;
        goto LABEL_10;
      }
      [v9 setAccountDescription:v7];
    }
    BOOL v10 = 1;
LABEL_10:
    _MFUnlockGlobalLock();
    goto LABEL_11;
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

+ (NSString)accountTypeString
{
  return (NSString *)@"Account";
}

+ (void)legacyKeychainProtocol
{
  return (void *)*MEMORY[0x1E4F3B820];
}

- (void)_setAccountProperties:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  v16 = (void *)[v17 mutableCopy];
  id v4 = [v16 objectForKey:@"Password"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [NSString alloc];
    int v6 = [v16 objectForKey:@"Password"];
    v18 = (void *)[v5 initWithData:v6 encoding:1];
  }
  else
  {
    v18 = v4;
  }
  [v16 removeObjectForKey:@"Password"];
  id v7 = [v17 objectForKey:@"OAuth2Token"];
  id v8 = [v17 objectForKey:@"OAuth2RefreshToken"];
  [(MFAccount *)self mf_lock];
  if (v7) {
    [(MFAccount *)self setOAuth2Token:v7 refreshToken:v8];
  }
  [(MFAccount *)self uniqueID];

  id v9 = [(id)objc_opt_class() excludedAccountPropertyKeys];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v16;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (([v9 containsObject:v14] & 1) == 0)
        {
          long long v15 = [v10 objectForKey:v14];
          [(MFAccount *)self setAccountProperty:v15 forKey:v14];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  if (v18) {
    [(MFAccount *)self setPassword:v18];
  }
  [(MFAccount *)self mf_unlock];
}

+ (id)accountPropertiesValueForKey:(id)a3 value:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if ([v5 isEqual:@"EmailAddresses"])
  {
    id v7 = [MEMORY[0x1E4F73508] addressListFromEncodedString:v6];
  }
  return v7;
}

- (void)setValueInAccountProperties:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v6 isEqual:@"Password"]) {
    [(MFAccount *)self setPassword:v7];
  }
  else {
    [(MFAccount *)self setAccountProperty:v7 forKey:v6];
  }
  [(MFAccount *)self _queueAccountInfoDidChange];
}

- (void)removeValueInAccountPropertiesForKey:(id)a3
{
  id v4 = a3;
  [(MFAccount *)self mf_lock];
  [(MFAccount *)self removeAccountPropertyForKey:v4];
  [(MFAccount *)self mf_unlock];
}

- (id)valueInAccountPropertiesForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"SSLEnabled"])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MFAccount usesSSL](self, "usesSSL"));
    goto LABEL_10;
  }
  [(MFAccount *)self mf_lock];
  id v5 = [(MFAccount *)self accountPropertyForKey:v4];
  [(MFAccount *)self mf_unlock];
  if ([v4 isEqual:@"Password"])
  {
    uint64_t v6 = [(MFAccount *)self password];
    goto LABEL_5;
  }
  if ([v4 isEqual:@"EmailAddresses"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = [v5 allKeys];
      uint64_t v7 = [v9 componentsJoinedByString:@", "];

      id v5 = v9;
      goto LABEL_6;
    }
    uint64_t v6 = [v5 componentsJoinedByString:@", "];
LABEL_5:
    uint64_t v7 = v6;
LABEL_6:

    id v5 = (void *)v7;
  }
LABEL_10:

  return v5;
}

- (BOOL)isActive
{
  v2 = [(MFAccount *)self persistentAccount];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 isActive];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(MFAccount *)self persistentAccount];
  if (v6)
  {
    id v5 = [(MFAccount *)self persistentAccount];
    [v5 setActive:v3];
  }
}

- (BOOL)canGoOffline
{
  return 0;
}

- (void)setDisplayName:(id)a3
{
  id v6 = (__CFString *)a3;
  char v4 = [(MFAccount *)self displayName];
  if (v4 != v6)
  {
    id v5 = v4 ? v4 : &stru_1EFF11268;
    if (([(__CFString *)v6 isEqualToString:v5] & 1) == 0)
    {
      [(MFAccount *)self mf_lock];
      [(MFAccount *)self setAccountProperty:v6 forKey:@"DisplayName"];
      [(MFAccount *)self mf_unlock];
      [(MFAccount *)self _queueAccountInfoDidChange];
    }
  }
}

- (void)setUsername:(id)a3
{
  id v6 = (__CFString *)a3;
  char v4 = [(MFAccount *)self username];
  if (v4 != v6)
  {
    id v5 = v4 ? v4 : &stru_1EFF11268;
    if (([(__CFString *)v6 isEqualToString:v5] & 1) == 0)
    {
      [(MFAccount *)self mf_lock];
      if (v6 && [(__CFString *)v6 length]) {
        [(MFAccount *)self setAccountProperty:v6 forKey:@"Username"];
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"Username"];
      }
      [(MFAccount *)self mf_unlock];
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
  id v8 = (__CFString *)a3;
  char v4 = [(MFAccount *)self hostname];
  if ([(__CFString *)v8 length])
  {
    uint64_t v5 = [(__CFString *)v8 mf_stringWithNoExtraSpaces];

    id v6 = (__CFString *)v5;
  }
  else
  {
    id v6 = v8;
  }
  id v9 = v6;
  if (v4 != v6)
  {
    uint64_t v7 = v4 ? v4 : &stru_1EFF11268;
    if (([(__CFString *)v6 isEqualToString:v7] & 1) == 0)
    {
      [(MFAccount *)self mf_lock];
      if (v9 && [(__CFString *)v9 length]) {
        [(MFAccount *)self setAccountProperty:v9 forKey:@"Hostname"];
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"Hostname"];
      }
      [(MFAccount *)self mf_unlock];
      [(MFAccount *)self releaseAllConnections];
      [(MFAccount *)self _queueAccountInfoDidChange];
    }
  }
}

+ (BOOL)accountIsPreventedFromSendingFromExternalProcesses:(id)a3
{
  BOOL v3 = [a3 accountPropertyForKey:@"MFRestrictSendingFromExternalProcesses"];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)accountIsRestrictedFromTransfersToOtherAccounts:(id)a3
{
  BOOL v3 = [a3 accountPropertyForKey:@"MFRestrictMessageTransfersToOtherAccounts"];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)accountRestrictsRecentsSyncing:(id)a3
{
  BOOL v3 = [a3 accountPropertyForKey:@"Prevent Recents Syncing"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)managedTag
{
  return (NSString *)[(MFAccount *)self _objectForAccountInfoKey:@"ManagedTag"];
}

- (NSString)statisticsKind
{
  return 0;
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
  v2 = [(MFAccount *)self baseAccount];
  BOOL v3 = [v2 credential];

  return v3;
}

- (id)_credentialCreateIfNecessary:(BOOL)a3
{
  return [(MFAccount *)self _credentialCreateIfNecessary:a3 error:0];
}

- (id)_credentialCreateIfNecessary:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(MFAccount *)self persistentAccount];
  id v18 = 0;
  id v8 = [v7 credentialWithError:&v18];
  id v9 = v18;

  if (v9)
  {
    id v10 = MFAccountsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(v9, "ef_publicDescription");
      v16 = (void *)v15;
      id v17 = "NOT ";
      *(_DWORD *)buf = 138412802;
      long long v20 = self;
      if (v5) {
        id v17 = "";
      }
      __int16 v21 = 2080;
      long long v22 = v17;
      __int16 v23 = 2114;
      uint64_t v24 = v15;
      _os_log_error_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_ERROR, "Encountered error while fetching credential for %@ (will %screate new credential): %{public}@", buf, 0x20u);
    }
  }
  if (!v8 && v5)
  {
    uint64_t v11 = MFAccountsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(MFAccount *)self ef_publicDescription];
      *(_DWORD *)buf = 138543362;
      long long v20 = v12;
      _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_DEFAULT, "Creating new credential for account %{public}@", buf, 0xCu);
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F179C0]);
    [(MFAccount *)self mf_lock];
    BOOL v13 = [(MFAccount *)self persistentAccount];
    [v13 setCredential:v8];

    [(MFAccount *)self mf_unlock];
  }
  if (a4 && !v8) {
    *a4 = v9;
  }

  return v8;
}

- (void)setPassword:(id)a3
{
  id v6 = a3;
  char v4 = [(MFAccount *)self baseAccount];
  [v4 setPassword:v6];

  if (v6 && [v6 length])
  {
    BOOL v5 = [(MFAccount *)self persistentAccount];
    [v5 setAuthenticated:1];
  }
  else
  {
    [(MFAccount *)self mf_lock];
    [(MFAccount *)self removeAccountPropertyForKey:@"Password"];
    [(MFAccount *)self mf_unlock];
  }
  [(MFAccount *)self _queueAccountInfoDidChange];
}

- (id)_password
{
  v2 = [(MFAccount *)self baseAccount];
  BOOL v3 = [v2 password];

  return v3;
}

- (id)_passwordWithError:(id *)a3
{
  BOOL v3 = [(MFAccount *)self _credentialCreateIfNecessary:0 error:a3];
  char v4 = [v3 password];

  return v4;
}

- (NSString)password
{
  BOOL v3 = [(MFAccount *)self preferredAuthScheme];
  char v4 = v3;
  if (v3 && ([v3 requiresPassword] & 1) != 0)
  {
    BOOL v5 = [(MFAccount *)self _password];
  }
  else
  {
    BOOL v5 = &stru_1EFF11268;
  }

  return (NSString *)v5;
}

- (unint64_t)credentialAccessibility
{
  id v6 = 0;
  v2 = [(MFAccount *)self _passwordWithError:&v6];
  id v3 = v6;
  if ([v2 length])
  {
    unint64_t v4 = 0;
  }
  else if (objc_msgSend(v3, "mf_isInaccessibleAccountCredentialError"))
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

- (NSString)oauth2Token
{
  v2 = [(MFAccount *)self baseAccount];
  id v3 = [v2 oauthToken];

  return (NSString *)v3;
}

- (void)setOAuth2Token:(id)a3 refreshToken:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(MFAccount *)self baseAccount];
  [v7 setOAuth2Token:v8 refreshToken:v6];
}

- (NSString)sourceApplicationBundleIdentifier
{
  v2 = self->_sourceApplicationBundleIdentifier;
  if (!v2)
  {
    id v3 = MFUserAgent();
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = [v3 sourceApplicationBundleIdentifier];
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

- (BOOL)_renewCredentialsWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MFAccount *)self accountForRenewingCredentials];
  if (v8)
  {
    id v9 = +[MFAccountStore sharedAccountStore];
    id v10 = [v9 persistentStore];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__MFAccount__renewCredentialsWithOptions_completion___block_invoke;
    v12[3] = &unk_1E5D3B108;
    id v13 = v8;
    id v14 = v6;
    id v15 = v7;
    [v10 renewCredentialsForAccount:v13 options:v14 completion:v12];
  }
  return v8 != 0;
}

void __53__MFAccount__renewCredentialsWithOptions_completion___block_invoke(uint64_t a1, __CFString *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a3;
  id v6 = MFAccountsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @", error:";
    id v8 = &stru_1EFF11268;
    *(_DWORD *)buf = 134218498;
    v16 = a2;
    if (!v5) {
      id v7 = &stru_1EFF11268;
    }
    __int16 v17 = 2112;
    if (v5) {
      id v8 = v5;
    }
    id v18 = v7;
    __int16 v19 = 2112;
    long long v20 = v8;
    _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "Credential renewal result: %ld%@%@", buf, 0x20u);
  }

  if (a2)
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        a2 = v5;
      }
      else
      {
        uint64_t v13 = *MEMORY[0x1E4F28A50];
        id v14 = v5;
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
        a2 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1032 localizedDescription:0 title:0 userInfo:v11];
      }
    }
    else
    {
      id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F17A18]];
      a2 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1032 localizedDescription:v10 title:0 userInfo:0];
    }
    uint64_t v9 = 1;
  }
  else
  {
    [*(id *)(a1 + 32) refresh];
    uint64_t v9 = 0;
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, v9, a2);
  }
}

- (BOOL)renewCredentialsWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
  }
  else {
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  if (![(MFAccount *)self primaryiCloudAccount])
  {
    uint64_t v9 = *MEMORY[0x1E4F17A40];
    id v10 = [v8 objectForKey:*MEMORY[0x1E4F17A40]];

    if (!v10) {
      [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v9];
    }
    uint64_t v11 = *MEMORY[0x1E4F17A30];
    uint64_t v12 = [v8 objectForKey:*MEMORY[0x1E4F17A30]];

    if (!v12) {
      [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v11];
    }
  }
  uint64_t v13 = MFAccountsLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [(MFAccount *)self uniqueID];
    id v15 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F17A40]];
    v16 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F17A30]];
    int v19 = 138543874;
    long long v20 = v14;
    __int16 v21 = 2114;
    long long v22 = v15;
    __int16 v23 = 2114;
    uint64_t v24 = v16;
    _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "Renewing credential for account: %{public}@ with force:%{public}@ avoidUI:%{public}@", (uint8_t *)&v19, 0x20u);
  }
  BOOL v17 = [(MFAccount *)self _renewCredentialsWithOptions:v8 completion:v7];

  return v17;
}

- (BOOL)promptUserForWebLoginWithURL:(id)a3 shouldConfirm:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(MFAccount *)self accountForRenewingCredentials];
  if (v10)
  {
    uint64_t v11 = +[MFAccountStore sharedAccountStore];
    uint64_t v12 = [v11 persistentStore];
    persistentAccount = self->_persistentAccount;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__MFAccount_promptUserForWebLoginWithURL_shouldConfirm_completionHandler___block_invoke;
    v15[3] = &unk_1E5D3B130;
    id v16 = v9;
    [v12 openAuthenticationURL:v8 forAccount:persistentAccount shouldConfirm:v6 completion:v15];
  }
  return v10 != 0;
}

void __74__MFAccount_promptUserForWebLoginWithURL_shouldConfirm_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a3;
  BOOL v6 = MFAccountsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"failure";
    if (a2) {
      id v7 = @"success";
    }
    *(_DWORD *)buf = 138412802;
    id v15 = v7;
    if (v5) {
      id v8 = @", error:";
    }
    else {
      id v8 = &stru_1EFF11268;
    }
    __int16 v16 = 2112;
    BOOL v17 = v8;
    if (v5) {
      id v9 = v5;
    }
    else {
      id v9 = &stru_1EFF11268;
    }
    __int16 v18 = 2112;
    int v19 = v9;
    _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "Web login result: %@%@%@", buf, 0x20u);
  }

  if (a2)
  {
    id v10 = 0;
  }
  else if (v5)
  {
    uint64_t v12 = *MEMORY[0x1E4F28A50];
    uint64_t v13 = v5;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v10 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1032 localizedDescription:0 title:0 userInfo:v11];
  }
  else
  {
    id v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)fetchTokensIfNecessary:(id *)a3
{
  return 1;
}

- (ACAccount)systemAccount
{
  p_persistentAccountLock = &self->_persistentAccountLock;
  os_unfair_lock_lock(&self->_persistentAccountLock);
  unint64_t v4 = [(MFAccount *)self baseAccount];
  BOOL v5 = [v4 systemAccount];

  os_unfair_lock_unlock(p_persistentAccountLock);
  return (ACAccount *)v5;
}

- (BOOL)canAuthenticateWithCurrentCredentials
{
  v2 = [(MFAccount *)self authenticatedConnection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasPasswordCredential
{
  v2 = [(MFAccount *)self preferredAuthScheme];
  BOOL v3 = [v2 name];
  if ([v3 isEqualToString:*MEMORY[0x1E4F607A8]]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:&stru_1EFF11268];
  }

  return v4;
}

- (unsigned)portNumber
{
  BOOL v3 = [(MFAccount *)self _objectForAccountInfoKey:@"PortNumber"];
  unsigned int v4 = [v3 intValue];

  if (v4) {
    return v4;
  }
  if ([(MFAccount *)self usesSSL])
  {
    unsigned int v4 = [(MFAccount *)self defaultSecurePortNumber];
    if (v4) {
      return v4;
    }
  }
  return [(MFAccount *)self defaultPortNumber];
}

- (unsigned)defaultPortNumber
{
  v2 = objc_opt_class();
  return [v2 defaultPortNumber];
}

+ (unsigned)defaultPortNumber
{
  return 0;
}

- (unsigned)defaultSecurePortNumber
{
  v2 = objc_opt_class();
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
    [(MFAccount *)self mf_lock];
    if (v6 != a3)
    {
      id v7 = EFStringWithInt();
      [(MFAccount *)self setAccountProperty:v7 forKey:@"PortNumber"];

      goto LABEL_10;
    }
  }
  else
  {
    [(MFAccount *)self mf_lock];
  }
  [(MFAccount *)self removeAccountPropertyForKey:@"PortNumber"];
LABEL_10:
  [(MFAccount *)self mf_unlock];
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
    [(MFAccount *)self mf_lock];
    if (v3)
    {
      unsigned int v5 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
      [(MFAccount *)self setAccountProperty:v5 forKey:@"SSLEnabled"];
    }
    else
    {
      [(MFAccount *)self removeAccountPropertyForKey:@"SSLEnabled"];
    }
    [(MFAccount *)self mf_unlock];
    [(MFAccount *)self releaseAllConnections];
    [(MFAccount *)self _queueAccountInfoDidChange];
  }
}

+ (BOOL)isSSLEditable
{
  v2 = [a1 predefinedValueForKey:@"SSLEnabledIsEditable"];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)allowsTrustPrompt
{
  return self->_allowsTrustPrompt;
}

- (void)setAllowsTrustPrompt:(BOOL)a3
{
  self->_allowsTrustPrompt = a3;
}

- (void)setTryDirectSSL:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MFAccount *)self _shouldTryDirectSSLConnectionOnPort:[(MFAccount *)self portNumber]] != a3)
  {
    [(MFAccount *)self mf_lock];
    unsigned int v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [(MFAccount *)self setAccountProperty:v5 forKey:@"SSLIsDirect"];

    [(MFAccount *)self mf_unlock];
    [(MFAccount *)self releaseAllConnections];
    [(MFAccount *)self _queueAccountInfoDidChange];
  }
}

- (NSString)domain
{
  return (NSString *)[(MFAccount *)self _objectForAccountInfoKey:@"Domain"];
}

- (void)setDomain:(id)a3
{
  unsigned int v6 = (__CFString *)a3;
  char v4 = [(MFAccount *)self domain];
  if (v4 != v6)
  {
    unsigned int v5 = v4 ? v4 : &stru_1EFF11268;
    if (([(__CFString *)v6 isEqualToString:v5] & 1) == 0)
    {
      [(MFAccount *)self mf_lock];
      if (v6 && [(__CFString *)v6 length]) {
        [(MFAccount *)self setAccountProperty:v6 forKey:@"Domain"];
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"Domain"];
      }
      [(MFAccount *)self mf_unlock];
      [(MFAccount *)self releaseAllConnections];
      [(MFAccount *)self _queueAccountInfoDidChange];
    }
  }
}

- (id)clientCertificates
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MFAccount *)self _objectForAccountInfoKey:@"SSLClientIdentity"];
  if (v3)
  {
    char v4 = +[MFMessageKeychainManager copyIdentityForPersistentReference:v3 error:0];
    if (v4)
    {
LABEL_3:
      v8[0] = v4;
      unsigned int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      CFRelease(v4);
      goto LABEL_6;
    }
  }
  else
  {
    unsigned int v6 = [(MFAccount *)self hostname];
    char v4 = +[MFMessageKeychainManager copyClientSSLIdentityForHostName:v6 error:0];

    if (v4) {
      goto LABEL_3;
    }
  }
  unsigned int v5 = 0;
LABEL_6:

  return v5;
}

- (void)setClientCertificates:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    char v4 = (const void *)[v7 objectAtIndex:0];
    CFTypeID v5 = CFGetTypeID(v4);
    if (v5 == SecIdentityGetTypeID())
    {
      unsigned int v6 = +[MFMessageKeychainManager persistentReferenceForIdentity:v4 error:0];
      [(MFAccount *)self mf_lock];
      if (v6) {
        [(MFAccount *)self setAccountProperty:v6 forKey:@"SSLClientIdentity"];
      }
      else {
        [(MFAccount *)self removeAccountPropertyForKey:@"SSLClientIdentity"];
      }
      [(MFAccount *)self mf_unlock];
    }
  }
}

- (ECAuthenticationScheme)preferredAuthScheme
{
  BOOL v3 = [(MFAccount *)self _objectForAccountInfoKey:@"AuthenticationScheme"];
  if (![v3 length] && -[MFAccount requiresAuthentication](self, "requiresAuthentication"))
  {
    id v4 = (id)*MEMORY[0x1E4F607A8];

    BOOL v3 = v4;
  }
  CFTypeID v5 = [MEMORY[0x1E4F607C8] schemeWithName:v3];

  return (ECAuthenticationScheme *)v5;
}

- (void)setPreferredAuthScheme:(id)a3
{
  id v7 = a3;
  id v4 = [(MFAccount *)self preferredAuthScheme];

  CFTypeID v5 = v7;
  if (v4 != v7)
  {
    unsigned int v6 = [v7 name];
    [(MFAccount *)self mf_lock];
    if (v6) {
      [(MFAccount *)self setAccountProperty:v6 forKey:@"AuthenticationScheme"];
    }
    else {
      [(MFAccount *)self removeAccountPropertyForKey:@"AuthenticationScheme"];
    }
    [(MFAccount *)self mf_unlock];

    CFTypeID v5 = v7;
  }
}

+ (id)saslProfileName
{
  return 0;
}

- (id)_newConnection
{
  id v3 = objc_alloc_init([(MFAccount *)self connectionClass]);
  if (v3)
  {
    id v4 = [(MFAccount *)self currentConnections];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __27__MFAccount__newConnection__block_invoke;
    v6[3] = &unk_1E5D3B158;
    id v7 = v3;
    [v4 performWhileLocked:v6];
  }
  return v3;
}

uint64_t __27__MFAccount__newConnection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (Class)connectionClass
{
  v2 = [(MFAccount *)self preferredAuthScheme];
  id v3 = [v2 connectionClassForAccountClass:objc_opt_class()];

  return (Class)v3;
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

- (BOOL)connectionsAreConstrained
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy_;
  BOOL v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v3 = [(MFAccount *)self currentConnections];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__MFAccount_connectionsAreConstrained__block_invoke;
  v12[3] = &unk_1E5D3B180;
  void v12[4] = &v13;
  [v3 performWhileLocked:v12];

  id v4 = (void *)v14[5];
  if (!v4)
  {
    id v9 = [MEMORY[0x1E4F60DD0] external];
    char v10 = [v9 isConstrained];

    if (v10) {
      goto LABEL_3;
    }
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  if (![v4 isConstrained]) {
    goto LABEL_7;
  }
LABEL_3:
  CFTypeID v5 = MFAccountsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(MFAccount *)self ef_publicDescription];
    uint64_t v7 = v14[5];
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = v7;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Connections constrained for account %{public}@ with connection %@", buf, 0x16u);
  }
  BOOL v8 = 1;
LABEL_8:
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __38__MFAccount_connectionsAreConstrained__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "isValid", (void)v8))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)certUIService
{
}

- (id)defaultConnectionSettings
{
  id v3 = objc_alloc_init(MFConnectionSettings);
  [(MFConnectionSettings *)v3 setUsesSSL:[(MFAccount *)self usesSSL]];
  uint64_t v4 = [(MFAccount *)self hostname];
  [(MFConnectionSettings *)v3 setHostname:v4];

  [(MFConnectionSettings *)v3 setPortNumber:[(MFAccount *)self portNumber]];
  uint64_t v5 = [(MFAccount *)self certUIService];
  [(MFConnectionSettings *)v3 setCertUIService:v5];

  if ([(MFConnectionSettings *)v3 usesSSL])
  {
    unsigned int v6 = [(MFAccount *)self clientCertificates];
    [(MFConnectionSettings *)v3 setClientCertificates:v6];
  }
  if ([(MFConnectionSettings *)v3 usesSSL]) {
    BOOL v7 = [(MFAccount *)self _shouldTryDirectSSLConnectionOnPort:[(MFConnectionSettings *)v3 portNumber]];
  }
  else {
    BOOL v7 = 0;
  }
  [(MFConnectionSettings *)v3 setTryDirectSSL:v7];
  if ([(MFConnectionSettings *)v3 tryDirectSSL]) {
    [(MFAccount *)self secureServiceName];
  }
  else {
  long long v8 = [(MFAccount *)self serviceName];
  }
  [(MFConnectionSettings *)v3 setServiceName:v8];

  [(MFConnectionSettings *)v3 setConnectionServiceType:[(MFAccount *)self connectionServiceType]];
  [(MFConnectionSettings *)v3 setAllowsTrustPrompt:[(MFAccount *)self allowsTrustPrompt]];
  long long v9 = [(MFAccount *)self uniqueID];
  [(MFConnectionSettings *)v3 setAccountIdentifier:v9];

  long long v10 = [(MFAccount *)self networkAccountIdentifier];
  [(MFConnectionSettings *)v3 setNetworkAccountIdentifier:v10];

  long long v11 = [(MFAccount *)self sourceApplicationBundleIdentifier];
  if ([v11 length]) {
    [(MFConnectionSettings *)v3 setSourceApplicationBundleIdentifier:v11];
  }
  [(MFConnectionSettings *)v3 setIsNonAppInitiated:1];

  return v3;
}

- (void)applySettingsAsDefault:(id)a3
{
  id v4 = a3;
  -[MFAccount setUsesSSL:](self, "setUsesSSL:", [v4 usesSSL]);
  -[MFAccount setPortNumber:](self, "setPortNumber:", [v4 portNumber]);
  -[MFAccount setTryDirectSSL:](self, "setTryDirectSSL:", [v4 tryDirectSSL]);
}

- (id)alternateConnectionSettings
{
  return 0;
}

- (id)insecureConnectionSettings
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(MFAccount *)self defaultConnectionSettings];
  [v2 setUsesSSL:0];
  [v2 setTryDirectSSL:0];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)secureConnectionSettings
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MFAccount *)self defaultConnectionSettings];
  [v3 setUsesSSL:1];
  [v3 setTryDirectSSL:1];
  objc_msgSend(v3, "setPortNumber:", -[MFAccount defaultSecurePortNumber](self, "defaultSecurePortNumber"));
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (BOOL)_shouldTryDirectSSLConnectionOnPort:(unsigned int)a3
{
  char v4 = [(MFAccount *)self defaultSecurePortNumber] == a3;
  uint64_t v5 = [(MFAccount *)self _objectForAccountInfoKey:@"SSLIsDirect"];
  unsigned int v6 = v5;
  if (v5) {
    char v4 = [v5 BOOLValue];
  }

  return v4;
}

- (id)customDescriptionForError:(id)a3 authScheme:(id)a4 defaultDescription:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  long long v9 = v8;
  if ([(MFAccount *)self credentialAccessibility] == 1)
  {
    long long v9 = v8;
    if ([v7 code] == 1032)
    {
      long long v10 = NSString;
      long long v11 = MFLookupLocalizedString(@"NO_PASSWORD_PROVIDED_FOR_USER_FORMAT", @"No password provided for user “%@” on server “%@”.\n\nPlease go to Mail Account Settings and enter a password.", @"Message");
      uint64_t v12 = [(MFAccount *)self username];
      uint64_t v13 = [(MFAccount *)self hostname];
      long long v9 = objc_msgSend(v10, "stringWithFormat:", v11, v12, v13);
    }
  }

  return v9;
}

- (void)reportAuthenticationError:(id)a3 authScheme:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = +[MFActivityMonitor currentMonitor];
  id v8 = [v10 localizedDescription];
  long long v9 = [(MFAccount *)self customDescriptionForError:v10 authScheme:v6 defaultDescription:v8];

  [v10 setLocalizedDescription:v9];
  [v7 setError:v10];
}

- (BOOL)_connectAndAuthenticate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFAccount *)self preferredAuthScheme];
  id v6 = +[MFActivityMonitor currentMonitor];
  if (([v6 shouldCancel] & 1) != 0
    || ![v4 connectUsingFallbacksForAccount:self])
  {
    goto LABEL_6;
  }
  if (([v4 authenticateUsingAccount:self] & 1) == 0)
  {
    [v4 disconnect];
    id v8 = [v6 error];
    [(MFAccount *)self reportAuthenticationError:v8 authScheme:v5];

LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (id)nameForMailboxUid:(id)a3
{
  id v3 = [a3 name];
  return v3;
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
  id v4 = a3;
  uint64_t v5 = NSString;
  id v6 = MFLookupLocalizedString(@"NO_PASSWORD_PROVIDED_FOR_ACCOUNT_FORMAT", @"No password provided for “%@”.\n\nPlease go to Mail Account Settings and enter a password.", @"Message");
  BOOL v7 = [(MFAccount *)self displayName];
  id v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

  long long v9 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1055 localizedDescription:v8 title:v4 userInfo:0];

  return v9;
}

- (id)wrongPasswordOrUsernameErrorWithTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSString;
  id v6 = MFLookupLocalizedString(@"MF_WRONG_PASSWORD_OR_USERNAME_PROVIDED_FOR_ACCOUNT_FORMAT", @"Wrong username and/or password provided for “%@”.\n\nPlease go to Mail Account Settings and enter the correct username and password.", @"Message");
  BOOL v7 = [(MFAccount *)self displayName];
  id v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

  long long v9 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1056 localizedDescription:v8 title:v4 userInfo:0];

  return v9;
}

- (id)inaccessiblePasswordErrorWithTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSString;
  id v6 = MFLookupLocalizedString(@"PASSWORD_INACCESSIBLE_FOR_ACCOUNT_FORMAT", @"The password for “%@” cannot be used at this time.", @"Message");
  BOOL v7 = [(MFAccount *)self displayName];
  id v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

  long long v9 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1057 localizedDescription:v8 title:v4 userInfo:0];

  return v9;
}

- (id)loginDisabledErrorWithTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSString;
  id v6 = MFLookupLocalizedString(@"LOGIN_DISABLED_FOR_ACCOUNT_FORMAT", @"Logins are disabled for “%@”.", @"Message");
  BOOL v7 = [(MFAccount *)self displayName];
  id v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

  long long v9 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1060 localizedDescription:v8 title:v4 userInfo:0];

  return v9;
}

+ (id)supportedDataclasses
{
  id v3 = +[MFAccountStore sharedAccountStore];
  id v4 = [a1 accountTypeIdentifier];
  uint64_t v5 = [v3 supportedDataclassesWithAccountTypeIdentifier:v4];

  return v5;
}

- (id)enabledDataclasses
{
  v2 = [(MFAccount *)self baseAccount];
  id v3 = [v2 enabledDataclasses];

  return v3;
}

- (id)copyDiagnosticInformation
{
  return (id)[[NSString alloc] initWithFormat:@"  account : %@\n", self];
}

- (void)setMissingPasswordError
{
  id v3 = [(MFAccount *)self missingPasswordErrorWithTitle:0];
  v2 = +[MFActivityMonitor currentMonitor];
  [v2 setError:v3];
}

- (void)setInvalidCredentialsError
{
  id v3 = [(MFAccount *)self wrongPasswordOrUsernameErrorWithTitle:0];
  v2 = +[MFActivityMonitor currentMonitor];
  [v2 setError:v3];
}

- (NSArray)emailAddressStrings
{
  return self->emailAddressStrings;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
}

- (EFLocked)currentConnections
{
  return self->_currentConnections;
}

@end