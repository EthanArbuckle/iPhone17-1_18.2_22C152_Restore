@interface CastleIMAPAccount
+ (BOOL)isPredefinedAccountType;
+ (BOOL)primaryDeliveryAccountIsDynamic;
+ (BOOL)usernameIsEmailAddress;
+ (id)accountTypeIdentifier;
+ (id)displayedAccountTypeString;
+ (id)newChildAccountWithParentAccount:(id)a3 error:(id *)a4;
+ (void)initialize;
- (BOOL)allowsTrustPrompt;
- (BOOL)canAttemptPushRegistration;
- (BOOL)canReceiveNewMailNotifications;
- (BOOL)checkAndSetDefaultEmailAddress:(id)a3;
- (BOOL)derivesDeliveryAccountInfoFromMailAccount;
- (BOOL)isEnabledForDataclass:(id)a3;
- (BOOL)isEquivalentTo:(id)a3 hostname:(id)a4 username:(id)a5;
- (BOOL)shouldDisplayHostnameInErrorMessages;
- (BOOL)shouldFetchACEDBInfoForError:(id)a3;
- (BOOL)shouldFetchRemoteLinksWithDateReceived:(id)a3;
- (BOOL)shouldRegisterForPush;
- (BOOL)supportsArchiving;
- (BOOL)usesSSL;
- (CastleIMAPAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4;
- (NSString)authToken;
- (NSString)clientInfo;
- (NSString)personID;
- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3;
- (id)_fromEmailAddressesIncludingDisabled:(id)a1;
- (id)_mailPropertyFromAppleAccountForKey:(uint64_t)a1;
- (id)accountStore;
- (id)anisetteDataWithError:(id *)a3;
- (id)appleAccount;
- (id)appleID2AuthDataWithHeaders:(void *)a1;
- (id)authTokenWithError:(void *)a1;
- (id)checkAndSetLocalDefaultEmailAddress:(id)a1;
- (id)deliveryHostname;
- (id)displayName;
- (id)emailAddressStrings;
- (id)emailAddressesAndAliasesList;
- (id)firstEmailAddress;
- (id)fromEmailAddresses;
- (id)fromEmailAddressesIncludingDisabled;
- (id)hostname;
- (id)iconString;
- (id)makeAppleIDSession;
- (id)preferredAuthScheme;
- (id)statisticsKind;
- (id)username;
- (uint64_t)_emailAliasesAreStale;
- (uint64_t)_resetAppleAccount;
- (uint64_t)deliveryPortNumber;
- (uint64_t)deliveryUsesSSL;
- (unint64_t)credentialAccessibility;
- (unsigned)portNumber;
- (void)_updateEmailAddressAndAliases;
- (void)_updateEmailAddressAndAliasesWithResult:(void *)a1;
- (void)appleID2AuthWithCompletion:(id)a3;
- (void)dealloc;
- (void)handleAlertResponse:(id)a3;
- (void)handleOverQuotaResponse:(id)a3;
- (void)invalidateEmailAliases;
- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4;
- (void)pushUpdateForAliasData;
- (void)setEnabled:(BOOL)a3 forEmailAddress:(id)a4;
- (void)setLocallyEnabled:(void *)a3 forEmailAddress:;
- (void)setUsername:(id)a3;
- (void)startListeningForNotifications;
- (void)updateEmailAliasesIfNeeded;
@end

@implementation CastleIMAPAccount

+ (void)initialize
{
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E4F177F0];
}

+ (id)displayedAccountTypeString
{
  return @"iCloud";
}

+ (BOOL)isPredefinedAccountType
{
  return 1;
}

+ (BOOL)usernameIsEmailAddress
{
  return 1;
}

+ (BOOL)primaryDeliveryAccountIsDynamic
{
  return 1;
}

- (BOOL)shouldDisplayHostnameInErrorMessages
{
  return 0;
}

- (BOOL)shouldFetchRemoteLinksWithDateReceived:(id)a3
{
  id v4 = a3;
  if (+[MFMailMessageLibrary canUsePersistence]
    && [(IMAPAccount *)self supportsAppleRemoteLinks])
  {
    v5 = +[MFMailMessageLibrary defaultInstance];
    v6 = [v5 persistence];
    v7 = [v6 remoteContentManager];

    char v8 = [v7 shouldAddRemoteContentLinksForMessageWithDateReceived:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (CastleIMAPAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CastleIMAPAccount;
  char v8 = [(IMAPAccount *)&v25 initWithLibrary:v6 persistentAccount:v7];
  if (v8)
  {
    v9 = NSString;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [v9 stringWithFormat:@"%@-%p", v11, v8];

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F734E8]) initWithName:v12 andDelegate:0];
    appleAccountLock = v8->_appleAccountLock;
    v8->_appleAccountLock = (MFLock *)v13;

    id v15 = objc_alloc(MEMORY[0x1E4F60CB0]);
    v16 = [v7 parentAccount];
    uint64_t v17 = [v15 initWithAppleAccount:v16];
    aliasSupport = v8->_aliasSupport;
    v8->_aliasSupport = (EDiCloudAliasSupport *)v17;

    v19 = [MFCastleEmailAliasUpdater alloc];
    v20 = [(MFAccount *)v8 identifier];
    uint64_t v21 = [(MFCastleEmailAliasUpdater *)v19 initWithAccountID:v20 aliasSupport:v8->_aliasSupport];
    aliasUpdater = v8->_aliasUpdater;
    v8->_aliasUpdater = (MFCastleEmailAliasUpdater *)v21;

    v23 = v8;
  }

  return v8;
}

- (void)dealloc
{
  -[CastleIMAPAccount _resetAppleAccount]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)CastleIMAPAccount;
  [(IMAPAccount *)&v3 dealloc];
}

- (uint64_t)_resetAppleAccount
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 408) lock];
    if (*(void *)(v1 + 416))
    {
      v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
      objc_super v3 = -[CastleIMAPAccount accountStore](v1);
      [v2 removeObserver:v1 name:*MEMORY[0x1E4F17728] object:v3];

      id v4 = *(void **)(v1 + 416);
      *(void *)(v1 + 416) = 0;
    }
    v5 = *(void **)(v1 + 408);
    return [v5 unlock];
  }
  return result;
}

- (BOOL)isEquivalentTo:(id)a3 hostname:(id)a4 username:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([(MailAccount *)self isAccountClassEquivalentTo:v7]) {
    BOOL v9 = [(MailAccount *)self isUsernameEquivalentTo:v8];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)statisticsKind
{
  return (id)*MEMORY[0x1E4F73CE8];
}

- (BOOL)shouldRegisterForPush
{
  if ((*((unsigned char *)self + 432) & 1) == 0) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CastleIMAPAccount;
  return [(IMAPAccount *)&v3 shouldRegisterForPush];
}

- (BOOL)canAttemptPushRegistration
{
  v3.receiver = self;
  v3.super_class = (Class)CastleIMAPAccount;
  return [(IMAPAccount *)&v3 canAttemptPushRegistration];
}

- (BOOL)canReceiveNewMailNotifications
{
  v3.receiver = self;
  v3.super_class = (Class)CastleIMAPAccount;
  return [(IMAPAccount *)&v3 canReceiveNewMailNotifications];
}

- (void)startListeningForNotifications
{
  *((unsigned char *)self + 432) &= ~1u;
  id v3 = [(IMAPAccount *)self separatorChar];
  *((unsigned char *)self + 432) |= 1u;
  v4.receiver = self;
  v4.super_class = (Class)CastleIMAPAccount;
  [(IMAPAccount *)&v4 startListeningForNotifications];
}

- (id)appleAccount
{
  if (a1)
  {
    v2 = *(void **)(a1 + 408);
    if (!v2)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel_appleAccount, a1, @"CastleIMAPAccount.m", 229, @"Invalid parameter not satisfying: %@", @"nil != _appleAccountLock" object file lineNumber description];

      v2 = *(void **)(a1 + 408);
    }
    [v2 lock];
    id v3 = *(void **)(a1 + 416);
    if (!v3)
    {
      objc_super v4 = [(id)a1 persistentAccount];
      uint64_t v5 = [v4 parentAccount];
      id v6 = *(void **)(a1 + 416);
      *(void *)(a1 + 416) = v5;

      id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v8 = -[CastleIMAPAccount accountStore](a1);
      [v7 addObserver:a1 selector:sel__accountsChanged_ name:*MEMORY[0x1E4F17728] object:v8];

      id v3 = *(void **)(a1 + 416);
    }
    id v9 = v3;
    [*(id *)(a1 + 408) unlock];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)accountStore
{
  if (a1)
  {
    uint64_t v1 = +[MFAccountStore sharedAccountStore];
    v2 = [v1 persistentStore];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_mailPropertyFromAppleAccountForKey:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_super v4 = -[CastleIMAPAccount appleAccount](a1);
    uint64_t v5 = [v4 propertiesForDataclass:*MEMORY[0x1E4F17AD8]];
    id v6 = [v5 objectForKey:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)newChildAccountWithParentAccount:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = *MEMORY[0x1E4F17AD8];
    v35 = [v5 propertiesForDataclass:*MEMORY[0x1E4F17AD8]];
    v34 = [MEMORY[0x1E4F1CA60] dictionary];
    if (([v6 isProvisionedForDataclass:v7] & 1) == 0)
    {
      id v8 = +[MFError errorWithDomain:@"CastleIMAPErrorDomain" code:2 localizedDescription:0];
      if (v8) {
        goto LABEL_30;
      }
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v9 = [v6 childAccounts];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v37;
      uint64_t v12 = *MEMORY[0x1E4F177F0];
LABEL_6:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v36 + 1) + 8 * v13) accountType];
        id v15 = [v14 identifier];
        int v16 = [v15 isEqualToString:v12];

        if (v16) {
          break;
        }
        if (v10 == ++v13)
        {
          uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
          if (v10) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      id v8 = +[MFError errorWithDomain:@"CastleIMAPErrorDomain" code:1032 localizedDescription:0];

      if (v8) {
        goto LABEL_30;
      }
    }
    else
    {
LABEL_12:
    }
    v18 = [v35 objectForKey:@"Username"];
    if (v18)
    {
      [v34 setObject:v18 forKey:@"Username"];
    }
    else
    {
      id v8 = +[MFError errorWithDomain:@"CastleIMAPErrorDomain" code:3 localizedDescription:0];
      if (v8) {
        goto LABEL_30;
      }
    }
    v19 = [v6 username];
    v20 = [v19 emailAddressValue];
    uint64_t v21 = [v20 domain];

    v22 = [v35 objectForKey:@"dotMacMailSupported"];
    int v23 = [v22 BOOLValue];

    if (v19) {
      int v24 = v23;
    }
    else {
      int v24 = 0;
    }
    if (v24 == 1 && v21 && [&unk_1EFF4FF98 containsObject:v21])
    {
      id v25 = v19;
    }
    else
    {
      id v25 = [v35 objectForKey:@"EmailAddress"];
      if (!v25)
      {
        id v8 = +[MFError errorWithDomain:@"CastleIMAPErrorDomain" code:4 localizedDescription:0];
LABEL_29:

        if (!v8)
        {
          v27 = [v35 objectForKey:@"FullUserName"];
          if (v27) {
            goto LABEL_35;
          }
          id v28 = objc_alloc_init(MEMORY[0x1E4F28F30]);
          v29 = objc_msgSend(v6, "aa_firstName");
          [v28 setGivenName:v29];

          v30 = objc_msgSend(v6, "aa_lastName");
          [v28 setFamilyName:v30];

          v27 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v28 style:3 options:0];

          if (v27) {
LABEL_35:
          }
            [v34 setObject:v27 forKey:@"FullUserName"];

          uint64_t v17 = [(id)objc_opt_class() accountWithProperties:v34];
          v31 = [v17 defaultPath];
          [v17 setPath:v31];

          [v17 setUsesSSL:1];
          v32 = [v17 persistentAccount];
          [v32 setParentAccount:v6];
          [v32 setAuthenticationType:*MEMORY[0x1E4F17A58]];

          id v8 = 0;
          goto LABEL_37;
        }
LABEL_30:
        if (a4)
        {
          id v8 = v8;
          uint64_t v17 = 0;
          *a4 = v8;
        }
        else
        {
          uint64_t v17 = 0;
        }
LABEL_37:

        goto LABEL_38;
      }
    }
    id v40 = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    [v34 setValue:v26 forKey:@"EmailAddresses"];

    id v8 = 0;
    goto LABEL_29;
  }
  uint64_t v17 = 0;
LABEL_38:

  return v17;
}

- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CastleIMAPAccount;
  [(MailAccount *)&v8 persistentAccountDidChange:v6 previousAccount:v7];
  -[CastleIMAPAccount _resetAppleAccount]((uint64_t)self);
}

- (id)hostname
{
  return -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:]((uint64_t)self, @"imapHostname");
}

- (unsigned)portNumber
{
  v2 = -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:]((uint64_t)self, @"imapPort");
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (BOOL)usesSSL
{
  v2 = -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:]((uint64_t)self, @"imapRequiresSSL");
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)allowsTrustPrompt
{
  return 0;
}

- (void)setUsername:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() accountPropertiesValueForKey:@"Username" value:v4];
  v6.receiver = self;
  v6.super_class = (Class)CastleIMAPAccount;
  [(MailAccount *)&v6 setUsername:v5];
}

- (id)username
{
  char v3 = -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:]((uint64_t)self, @"Username");
  if (!v3)
  {
    id v4 = -[CastleIMAPAccount appleAccount]((uint64_t)self);

    if (v4)
    {
      char v3 = 0;
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)CastleIMAPAccount;
      char v3 = [(MFAccount *)&v6 username];
    }
  }
  return v3;
}

- (NSString)personID
{
  v2 = -[CastleIMAPAccount appleAccount]((uint64_t)self);
  char v3 = objc_msgSend(v2, "aa_personID");

  return (NSString *)v3;
}

- (id)makeAppleIDSession
{
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F4EF78]);
    char v3 = [a1 sourceApplicationBundleIdentifier];
    id v4 = (void *)[v2 initWithIdentifier:v3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)appleID2AuthDataWithHeaders:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  id v5 = 0;
  if (a1 && v3)
  {
    objc_super v6 = (void *)[v3 mutableCopy];
    id v7 = [a1 authToken];
    if (v7)
    {
      [v6 setObject:v7 forKeyedSubscript:@"token"];
      id v5 = v6;
      if (!v5)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v16 = 0;
      objc_super v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:10 error:&v16];
      id v9 = v16;
      uint64_t v10 = v9;
      if (v8)
      {

        uint64_t v11 = [a1 personID];
        uint64_t v12 = [v11 dataUsingEncoding:4];

        if (v12)
        {
          id v5 = (id)[v12 mutableCopy];
          char v15 = 0;
          [v5 appendBytes:&v15 length:1];
          [v5 appendData:v8];
        }
        else
        {
          id v5 = 0;
        }

        goto LABEL_14;
      }
      uint64_t v13 = MFLogGeneral();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CastleIMAPAccount appleID2AuthDataWithHeaders:]((uint64_t)v10, v13);
      }
    }
    id v5 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (void)appleID2AuthWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = -[CastleIMAPAccount makeAppleIDSession](self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CastleIMAPAccount_appleID2AuthWithCompletion___block_invoke;
  v7[3] = &unk_1E5D3B298;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 appleIDHeadersWithCompletion:v7];
}

void __48__CastleIMAPAccount_appleID2AuthWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    id v6 = -[CastleIMAPAccount appleID2AuthDataWithHeaders:](*(void **)(a1 + 32), v7);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (NSString)authToken
{
  return (NSString *)-[CastleIMAPAccount authTokenWithError:](self, 0);
}

- (id)authTokenWithError:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = -[CastleIMAPAccount appleAccount]((uint64_t)a1);
    id v13 = 0;
    id v5 = objc_msgSend(v4, "aa_authTokenWithError:", &v13);
    id v6 = v13;

    if (!v5 && v6)
    {
      id v7 = MFLogGeneral();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [a1 identifier];
        uint64_t v12 = objc_msgSend(v6, "ef_publicDescription");
        *(_DWORD *)buf = 138412802;
        id v15 = v10;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        __int16 v18 = 2114;
        v19 = v12;
        _os_log_error_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_ERROR, "%@ (%@) failed to get auth token: %{public}@", buf, 0x20u);
      }
      if (a2) {
        *a2 = v6;
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)anisetteDataWithError:(id *)a3
{
  if (self) {
    self = (CastleIMAPAccount *)self->_aliasSupport;
  }
  id v3 = [(CastleIMAPAccount *)self anisetteDataWithError:a3];
  return v3;
}

- (NSString)clientInfo
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4BFA0]);
  id v3 = [v2 clientInfoHeader];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (unint64_t)credentialAccessibility
{
  id v6 = 0;
  id v2 = -[CastleIMAPAccount authTokenWithError:](self, &v6);
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

- (id)preferredAuthScheme
{
  return (id)[MEMORY[0x1E4F607C8] schemeWithName:@"ATOKEN"];
}

- (id)firstEmailAddress
{
  id v3 = [(MailAccount *)self defaultEmailAddress];
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CastleIMAPAccount;
    id v3 = [(MailAccount *)&v5 firstEmailAddress];
  }
  return v3;
}

- (id)emailAddressStrings
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CastleIMAPAccount;
  id v3 = [(MailAccount *)&v8 emailAddressStrings];
  if (![v3 count])
  {
    uint64_t v4 = -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:]((uint64_t)self, @"EmailAddress");
    objc_super v5 = (void *)v4;
    if (v4)
    {
      v9[0] = v4;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

      id v3 = (void *)v6;
    }
  }
  return v3;
}

- (id)emailAddressesAndAliasesList
{
  id v2 = [(MailAccount *)self emailAddressesAndAliases];
  id v3 = [v2 allKeys];

  return v3;
}

- (id)fromEmailAddresses
{
  return -[CastleIMAPAccount _fromEmailAddressesIncludingDisabled:](self, 0);
}

- (id)_fromEmailAddressesIncludingDisabled:(id)a1
{
  id v2 = a1;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v20 = [a1 emailAddressesDictionary];
    v19 = [v2 receiveEmailAliasAddresses];
    id v2 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v4 = v20;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v26 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          if ((a2 & 1) == 0)
          {
            id v9 = [v4 valueForKey:*(void *)(*((void *)&v25 + 1) + 8 * i)];
            int v10 = [v9 BOOLValue];

            if (!v10) {
              continue;
            }
          }
          [v2 addObject:v8];
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v5);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v19;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * j);
          if ((a2 & 1) == 0)
          {
            __int16 v16 = [v11 valueForKey:*(void *)(*((void *)&v21 + 1) + 8 * j)];
            int v17 = [v16 BOOLValue];

            if (!v17) {
              continue;
            }
          }
          [v2 addObject:v15];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v12);
    }
  }
  return v2;
}

- (id)fromEmailAddressesIncludingDisabled
{
  return -[CastleIMAPAccount _fromEmailAddressesIncludingDisabled:](self, 1);
}

- (void)handleAlertResponse:(id)a3
{
  id v4 = a3;
  if ([@"Mailbox is over quota" isEqualToString:v4])
  {
    [(CastleIMAPAccount *)self handleOverQuotaResponse:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CastleIMAPAccount;
    [(IMAPAccount *)&v5 handleAlertResponse:v4];
  }
}

- (void)handleOverQuotaResponse:(id)a3
{
  id v3 = a3;
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CastleIMAPAccount handleOverQuotaResponse:]((uint64_t)v3, v4);
  }

  id v5 = objc_alloc(MEMORY[0x1E4F4BFD8]);
  uint64_t v6 = (void *)[v5 initForDataclass:*MEMORY[0x1E4F17AD8]];
  [v6 showWithHandler:0];
}

- (id)deliveryHostname
{
  if (a1)
  {
    a1 = -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:]((uint64_t)a1, @"smtpHostname");
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)deliveryPortNumber
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:](a1, @"smtpPort");
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (uint64_t)deliveryUsesSSL
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = -[CastleIMAPAccount _mailPropertyFromAppleAccountForKey:](a1, @"smtpRequiresSSL");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (BOOL)derivesDeliveryAccountInfoFromMailAccount
{
  return 1;
}

- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3
{
  deliveryAccount = self->_deliveryAccount;
  if (deliveryAccount) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    uint64_t v6 = objc_alloc_init(MFNewcastleSMTPAccount);
    id v7 = [(CastleIMAPAccount *)self displayName];
    [(MFAccount *)v6 setDisplayName:v7];

    uint64_t v8 = -[CastleIMAPAccount deliveryHostname](self);
    [(MFAccount *)v6 setHostname:v8];

    -[MFAccount setPortNumber:](v6, "setPortNumber:", -[CastleIMAPAccount deliveryPortNumber]((uint64_t)self));
    -[MFAccount setUsesSSL:](v6, "setUsesSSL:", -[CastleIMAPAccount deliveryUsesSSL]((uint64_t)self));
    id v9 = [MEMORY[0x1E4F607C8] schemeWithName:@"ATOKEN"];
    [(SMTPAccount *)v6 setPreferredAuthScheme:v9];

    [(MFNewcastleSMTPAccount *)v6 setCastleAccount:self];
    int v10 = self->_deliveryAccount;
    self->_deliveryAccount = &v6->super.super;

    deliveryAccount = self->_deliveryAccount;
  }
  return deliveryAccount;
}

- (id)checkAndSetLocalDefaultEmailAddress:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    v5.receiver = a1;
    v5.super_class = (Class)CastleIMAPAccount;
    a1 = objc_msgSendSuper2(&v5, sel_checkAndSetDefaultEmailAddress_, v3);
  }

  return a1;
}

- (BOOL)checkAndSetDefaultEmailAddress:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[CastleIMAPAccount checkAndSetLocalDefaultEmailAddress:](self, v4);
  uint64_t v6 = (NSString *)[v4 copy];
  updatedDefaultEmail = self->_updatedDefaultEmail;
  self->_updatedDefaultEmail = v6;

  return v5;
}

- (void)setLocallyEnabled:(void *)a3 forEmailAddress:
{
  id v11 = a3;
  if (a1)
  {
    unsigned __int8 v5 = [a1 emailAddressesDictionary];
    uint64_t v6 = (void *)[v5 mutableCopy];

    id v7 = [a1 receiveEmailAliasAddresses];
    uint64_t v8 = (void *)[v7 mutableCopy];

    id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
    int v10 = [v6 valueForKey:v11];
    if (v10)
    {
      [v6 setValue:v9 forKey:v11];
      [a1 setEmailAddresses:v6];
    }
    else
    {
      [v8 setValue:v9 forKey:v11];
      [a1 setReceiveEmailAliasAddresses:v8];
    }
  }
}

- (void)setEnabled:(BOOL)a3 forEmailAddress:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  -[CastleIMAPAccount setLocallyEnabled:forEmailAddress:](self, v4, v10);
  aliasChanges = self->_aliasChanges;
  if (!aliasChanges)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = self->_aliasChanges;
    self->_aliasChanges = v7;

    aliasChanges = self->_aliasChanges;
  }
  id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [(NSMutableDictionary *)aliasChanges setValue:v9 forKey:v10];
}

- (void)invalidateEmailAliases
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F60CB0] log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(MFAccount *)self identifier];
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clearing last update date for email aliases.", (uint8_t *)&v5, 0xCu);
  }
  [(MailAccount *)self setLastEmailAliasesSyncDate:0];
}

- (void)updateEmailAliasesIfNeeded
{
  if (-[CastleIMAPAccount _emailAliasesAreStale](self))
  {
    -[CastleIMAPAccount _updateEmailAddressAndAliases]((id *)&self->super.super.super.super.isa);
  }
}

- (uint64_t)_emailAliasesAreStale
{
  uint64_t v1 = (uint64_t)a1;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [a1 lastEmailAliasesSyncDate];
    if (v2)
    {
      id v3 = +[MFAppStateMonitor sharedInstance];
      int v4 = [v3 isVisible];

      [v2 timeIntervalSinceNow];
      double v6 = v5;
      double v7 = 3600.0;
      if (v4) {
        double v7 = 600.0;
      }
      if (v7 >= -v6)
      {
        id v11 = [MEMORY[0x1E4F60CB0] log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = [(id)v1 identifier];
          int v14 = 138543618;
          uint64_t v15 = v12;
          __int16 v16 = 2048;
          double v17 = v6 / -60.0;
          _os_log_impl(&dword_1A7EFF000, v11, OS_LOG_TYPE_INFO, "[%{public}@] Last update was %g minutes ago. Not requesting update.", (uint8_t *)&v14, 0x16u);
        }
        uint64_t v1 = 0;
        goto LABEL_14;
      }
      uint64_t v8 = [MEMORY[0x1E4F60CB0] log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(id)v1 identifier];
        int v14 = 138543618;
        uint64_t v15 = v9;
        __int16 v16 = 2048;
        double v17 = v6 / -60.0;
        _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Last update was %g minutes ago. Requesting update.", (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F60CB0] log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [(id)v1 identifier];
        int v14 = 138543362;
        uint64_t v15 = v10;
        _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] No last update date for email aliases. Requesting update.", (uint8_t *)&v14, 0xCu);
      }
    }

    id v11 = [MEMORY[0x1E4F1C9C8] date];
    [(id)v1 setLastEmailAliasesSyncDate:v11];
    uint64_t v1 = 1;
LABEL_14:
  }
  return v1;
}

- (void)_updateEmailAddressAndAliases
{
  if (a1)
  {
    id v2 = a1[60];
    id v3 = [a1 lastEmailAliasesSyncDate];
    int v4 = [a1 lastEmailAliasesSyncEntityTag];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__CastleIMAPAccount__updateEmailAddressAndAliases__block_invoke;
    v5[3] = &unk_1E5D3B2C0;
    v5[4] = a1;
    [v2 getEmailAddressAndAliasesWithLastSyncDate:v3 entityTag:v4 handler:v5];
  }
}

void __50__CastleIMAPAccount__updateEmailAddressAndAliases__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  -[CastleIMAPAccount _updateEmailAddressAndAliasesWithResult:](*(void **)(a1 + 32), v3);
  if ([v3 isSuccess])
  {
    int v4 = [MEMORY[0x1E4F60CB0] log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = [*(id *)(a1 + 32) identifier];
      int v10 = 138543362;
      id v11 = v5;
      _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed update.", (uint8_t *)&v10, 0xCu);
    }
    double v6 = [MEMORY[0x1E4F1C9C8] date];
    [*(id *)(a1 + 32) setLastEmailAliasesSyncDate:v6];

    if (([v3 notModified] & 1) == 0)
    {
      double v7 = [v3 entityTag];
      [*(id *)(a1 + 32) setLastEmailAliasesSyncEntityTag:v7];
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F60CB0] log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) identifier];
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update failed.", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) setLastEmailAliasesSyncDate:0];
  }
}

- (void)_updateEmailAddressAndAliasesWithResult:(void *)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = v3;
  if (!a1) {
    goto LABEL_33;
  }
  if ([v3 isSuccess] && (objc_msgSend(v4, "notModified") & 1) == 0)
  {
    uint64_t v5 = [v4 receiveEmailAliasAddresses];

    if (v5)
    {
      double v6 = [v4 receiveEmailAliasAddresses];
      LODWORD(v5) = [a1 checkAndSetReceiveEmailAliasAddresses:v6];
    }
    double v7 = [v4 emailAddresses];

    if (v7) {
      char v8 = v5;
    }
    else {
      char v8 = 1;
    }
    if (v7) {
      LODWORD(v5) = 1;
    }
    if ((v8 & 1) == 0)
    {
      id v9 = [v4 emailAddresses];
      LODWORD(v5) = [a1 checkAndSetEmailAddresses:v9];
    }
    int v10 = [v4 defaultEmailAddress];

    if (v10)
    {
      if ((v5 & 1) == 0)
      {
        id v11 = [v4 defaultEmailAddress];
        char v12 = [a1 checkAndSetDefaultEmailAddress:v11];

        if ((v12 & 1) == 0) {
          goto LABEL_28;
        }
      }
    }
    else
    {
      uint64_t v13 = [a1 defaultEmailAddress];
      if (!v13)
      {
        int v14 = [a1 fromEmailAddresses];
        uint64_t v15 = [v14 count];

        if (v15)
        {
          __int16 v16 = [a1 fromEmailAddresses];
          uint64_t v13 = [v16 objectAtIndex:0];
        }
        else
        {
          double v17 = [a1 emailAddressStrings];
          uint64_t v13 = [v17 objectAtIndexedSubscript:0];

          -[CastleIMAPAccount setLocallyEnabled:forEmailAddress:](a1, 1, v13);
        }
        if (v5)
        {

          goto LABEL_25;
        }
        LODWORD(v5) = -[CastleIMAPAccount checkAndSetLocalDefaultEmailAddress:](a1, v13);
      }

      if (!v5)
      {
LABEL_28:
        uint64_t v20 = [MEMORY[0x1E4F60CB0] log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          long long v21 = [a1 identifier];
          int v25 = 138543362;
          long long v26 = v21;
          _os_log_impl(&dword_1A7EFF000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Account is not changed. Not saving.", (uint8_t *)&v25, 0xCu);
        }
        goto LABEL_31;
      }
    }
LABEL_25:
    uint64_t v18 = [MEMORY[0x1E4F60CB0] log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [a1 identifier];
      int v25 = 138543362;
      long long v26 = v19;
      _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving account changes.", (uint8_t *)&v25, 0xCu);
    }
    [a1 savePersistentAccount];
  }
LABEL_31:
  if ([v4 accountNeedsToUpdateProperties])
  {
    long long v22 = -[CastleIMAPAccount appleAccount]((uint64_t)a1);
    long long v23 = [v22 accountStore];
    long long v24 = -[CastleIMAPAccount appleAccount]((uint64_t)a1);
    objc_msgSend(v23, "aa_updatePropertiesForAppleAccount:completion:", v24, &__block_literal_global_0);
  }
LABEL_33:
}

- (void)pushUpdateForAliasData
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F60CB0] log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(NSMutableDictionary *)self->_aliasChanges count];
    updatedDefaultEmail = self->_updatedDefaultEmail;
    v12[0] = 67109376;
    v12[1] = v4;
    __int16 v13 = 2048;
    int v14 = updatedDefaultEmail;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "-[CastleIMAPAccount pushUpdateForAliasData] %d %p", (uint8_t *)v12, 0x12u);
  }

  if (self->_aliasChanges || self->_updatedDefaultEmail)
  {
    aliasSupport = self->_aliasSupport;
    p_aliasChanges = &self->_aliasChanges;
    aliasChanges = self->_aliasChanges;
    p_updatedDefaultEmail = &self->_updatedDefaultEmail;
    [(EDiCloudAliasSupport *)aliasSupport pushUpdateForAliasDataWithEmailAddresses:aliasChanges defaultEmailAddress:*p_updatedDefaultEmail];
    int v10 = *p_aliasChanges;
    *p_aliasChanges = 0;

    id v11 = *p_updatedDefaultEmail;
    *p_updatedDefaultEmail = 0;
  }
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[CastleIMAPAccount appleAccount]((uint64_t)self);
  char v6 = [v5 isEnabledForDataclass:v4];

  return v6;
}

- (id)iconString
{
  return @"castleAccountIcon";
}

- (BOOL)supportsArchiving
{
  return 1;
}

- (id)displayName
{
  id v2 = -[CastleIMAPAccount appleAccount]((uint64_t)self);
  id v3 = [v2 accountDescription];

  return v3;
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliasUpdater, 0);
  objc_storeStrong((id *)&self->_aliasSupport, 0);
  objc_storeStrong((id *)&self->_aliasLookupURL, 0);
  objc_storeStrong((id *)&self->_aliasUpdateQueue, 0);
  objc_storeStrong((id *)&self->_updatedDefaultEmail, 0);
  objc_storeStrong((id *)&self->_aliasChanges, 0);
  objc_storeStrong((id *)&self->_deliveryAccount, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_appleAccountLock, 0);
}

- (void)appleID2AuthDataWithHeaders:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "CastleIMAPAccount: Failed to serialize AppleID data: %@", (uint8_t *)&v2, 0xCu);
}

- (void)handleOverQuotaResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Over quota error message: %@", (uint8_t *)&v2, 0xCu);
}

@end