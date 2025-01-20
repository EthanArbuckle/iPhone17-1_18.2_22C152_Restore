@interface GmailAccount
+ (BOOL)deliveryAccountUsesSSL;
+ (BOOL)isPredefinedAccountType;
+ (BOOL)usernameIsEmailAddress;
+ (id)accountTypeIdentifier;
+ (id)authSchemesForAccountClass;
+ (id)deliveryAccountHostname;
+ (id)displayedAccountTypeString;
+ (id)emailAddressHostPart;
+ (id)hostname;
+ (id)imapNotEnabledPrefix;
+ (unsigned)deliveryAccountPortNumber;
- (BOOL)canMailboxBeRenamed:(id)a3;
- (BOOL)derivesDeliveryAccountInfoFromMailAccount;
- (BOOL)enableAccount;
- (BOOL)mustArchiveSentMessages;
- (BOOL)shouldArchiveByDefault;
- (BOOL)shouldEnableAfterError:(id)a3;
- (BOOL)shouldFetchACEDBInfoForError:(id)a3;
- (BOOL)supportsArchiving;
- (BOOL)supportsFastRemoteBodySearch;
- (BOOL)xListSupportedOnConnection:(id)a3;
- (GmailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4;
- (id)_URLFromUncleanString:(id)a3;
- (id)_childOfMailbox:(id)a3 withComponentName:(id)a4;
- (id)_consumeExistingPreAuthToken;
- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3;
- (id)_webLoginErrorWithURL:(id)a3;
- (id)accountStore;
- (id)allMailMailboxUid;
- (id)clientToken;
- (id)displayNameUsingSpecialNamesForMailboxUid:(id)a3;
- (id)emailAddressStrings;
- (id)errorForResponse:(id)a3;
- (id)hostname;
- (id)iconString;
- (id)persistentNameForMailbox:(id)a3;
- (id)preferredAuthScheme;
- (id)specialUseAttributeForType:(int64_t)a3;
- (id)specialUseAttributesForMailbox:(id)a3;
- (id)statisticsKind;
- (int)emptyFrequencyForMailboxType:(int64_t)a3;
- (int64_t)archiveDestinationForMailbox:(id)a3;
- (unint64_t)credentialAccessibility;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_deleteHook;
- (void)_removeCredential:(id)a3;
- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4;
- (void)setPassword:(id)a3;
@end

@implementation GmailAccount

- (GmailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GmailAccount;
  v4 = [(IMAPAccount *)&v7 initWithLibrary:a3 persistentAccount:a4];
  if (v4)
  {
    if (RegisterGmailAuthSchemes_onceToken != -1) {
      dispatch_once(&RegisterGmailAuthSchemes_onceToken, &__block_literal_global_5);
    }
    v5 = v4;
  }

  return v4;
}

+ (id)authSchemesForAccountClass
{
  if (RegisterGmailAuthSchemes_onceToken != -1) {
    dispatch_once(&RegisterGmailAuthSchemes_onceToken, &__block_literal_global_5);
  }
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___GmailAccount;
  v3 = objc_msgSendSuper2(&v5, sel_authSchemesForAccountClass);
  return v3;
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E4F177C0];
}

+ (id)emailAddressHostPart
{
  return @"gmail.com";
}

+ (id)displayedAccountTypeString
{
  return @"Gmail";
}

+ (id)hostname
{
  return (id)[a1 standardAccountClass:a1 valueForKey:@"Hostname"];
}

- (id)hostname
{
  v2 = objc_opt_class();
  return (id)[v2 hostname];
}

+ (BOOL)isPredefinedAccountType
{
  return 1;
}

+ (id)imapNotEnabledPrefix
{
  return @"Your account is not enabled for IMAP use.";
}

- (id)statisticsKind
{
  return (id)*MEMORY[0x1E4F73CD8];
}

- (id)preferredAuthScheme
{
  return (id)[MEMORY[0x1E4F607C8] schemeWithName:@"XOAUTH2"];
}

- (void)persistentAccountDidChange:(id)a3 previousAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)GmailAccount;
  [(MailAccount *)&v9 persistentAccountDidChange:v6 previousAccount:v7];
  [(GmailAccount *)self mf_lock];
  clientToken = self->_clientToken;
  self->_clientToken = 0;

  [(GmailAccount *)self mf_unlock];
}

- (void)_deleteHook
{
  id v2 = [(MFAccount *)self username];
  +[MFMessageKeychainManager removePasswordForServiceName:accountName:](MFMessageKeychainManager, "removePasswordForServiceName:accountName:", @"IDToken");
}

- (id)_consumeExistingPreAuthToken
{
  id v2 = [(MFAccount *)self username];
  id v6 = 0;
  v3 = +[MFMessageKeychainManager passwordForServiceName:@"IDToken" accountName:v2 synchronizable:0 error:&v6];
  id v4 = v6;
  +[MFMessageKeychainManager removePasswordForServiceName:@"IDToken" accountName:v2];

  return v3;
}

- (id)accountStore
{
  id v2 = +[MFAccountStore sharedAccountStore];
  v3 = [v2 persistentStore];

  return v3;
}

- (id)clientToken
{
  [(GmailAccount *)self mf_lock];
  if (!self->_clientToken)
  {
    v3 = [(GmailAccount *)self _consumeExistingPreAuthToken];
    if (!v3)
    {
      id v4 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v5 = [v4 UUIDString];

      v3 = (void *)v5;
    }
    id v6 = [(MFAccount *)self persistentAccount];
    id v7 = [(GmailAccount *)self accountStore];
    if (([v7 addClientToken:v3 forAccount:v6] & 1) == 0)
    {
      uint64_t v8 = [v7 clientTokenForAccount:v6];

      v3 = (void *)v8;
    }
    if (!v3)
    {
      objc_super v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_DEFAULT, "#Warning failed to get client token", v13, 2u);
      }
    }
    clientToken = self->_clientToken;
    self->_clientToken = (NSString *)v3;
  }
  [(GmailAccount *)self mf_unlock];
  v11 = self->_clientToken;
  return v11;
}

- (unint64_t)credentialAccessibility
{
  v3 = [(MFAccount *)self oauth2Token];
  uint64_t v4 = [v3 length];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)GmailAccount;
  return [(MFAccount *)&v6 credentialAccessibility];
}

- (BOOL)shouldArchiveByDefault
{
  return [(MFAccount *)self _BOOLForAccountInfoKey:@"ArchiveMessages" defaultValue:1];
}

- (BOOL)supportsArchiving
{
  return 1;
}

- (int64_t)archiveDestinationForMailbox:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GmailAccount;
  int64_t result = [(MailAccount *)&v4 archiveDestinationForMailbox:a3];
  if (result == 2) {
    return -500;
  }
  return result;
}

- (id)emailAddressStrings
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(MFAccount *)self username];
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (void)setPassword:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GmailAccount *)self _deliveryAccountCreateIfNeeded:0];
  objc_super v6 = v5;
  if (v5) {
    [v5 setPassword:v4];
  }
  v7.receiver = self;
  v7.super_class = (Class)GmailAccount;
  [(MFAccount *)&v7 setPassword:v4];
}

- (id)iconString
{
  return @"gmailAccountIcon";
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

- (BOOL)derivesDeliveryAccountInfoFromMailAccount
{
  return 1;
}

- (BOOL)supportsFastRemoteBodySearch
{
  return 1;
}

+ (id)deliveryAccountHostname
{
  return (id)[a1 standardAccountClass:a1 valueForKey:@"DeliveryHostname"];
}

+ (BOOL)deliveryAccountUsesSSL
{
  uint64_t v2 = [a1 standardAccountClass:a1 valueForKey:@"DeliverySSLEnabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (unsigned)deliveryAccountPortNumber
{
  uint64_t v2 = [a1 standardAccountClass:a1 valueForKey:@"DeliveryPortNumber"];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3
{
  if (a3)
  {
    id v4 = objc_alloc_init(MFGmailSMTPAccount);
    [(MFGmailSMTPAccount *)v4 setMailAccount:self];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (BOOL)usernameIsEmailAddress
{
  return 1;
}

- (BOOL)mustArchiveSentMessages
{
  return 0;
}

- (int)emptyFrequencyForMailboxType:(int64_t)a3
{
  if (a3 == 3) {
    return -1;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)GmailAccount;
  return -[MailAccount emptyFrequencyForMailboxType:](&v6, sel_emptyFrequencyForMailboxType_);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v13 = a4;
  uint64_t v7 = (void (**)(id, uint64_t, void))a5;
  if ([v13 previousFailureCount] > 2)
  {
    v7[2](v7, 2, 0);
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F18D88]);
    objc_super v9 = [(MFAccount *)self username];
    v10 = [(MFAccount *)self password];
    v11 = (void *)[v8 initWithUser:v9 password:v10 persistence:1];

    [(GmailAccount *)self mf_lock];
    objc_storeStrong((id *)&self->_credential, v11);
    [(GmailAccount *)self mf_unlock];
    v12 = [v13 sender];
    [v12 useCredential:v11 forAuthenticationChallenge:v13];

    ((void (**)(id, uint64_t, NSURLCredential *))v7)[2](v7, 0, self->_credential);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  id v8 = (void (**)(id, uint64_t))a6;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v9 statusCode] == 200)
  {
    [(GmailAccount *)self mf_lock];
    [(EFPromise *)self->_enablingPromise finishWithResult:MEMORY[0x1E4F1CC38]];
    [(GmailAccount *)self mf_unlock];
  }
  v8[2](v8, 1);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a5;
  [(GmailAccount *)self mf_lock];
  objc_super v6 = self->_enablingPromise;
  enablingPromise = self->_enablingPromise;
  self->_enablingPromise = 0;

  [(GmailAccount *)self mf_unlock];
  if (v8) {
    -[EFPromise finishWithError:](v6, "finishWithError:");
  }
  else {
    [(EFPromise *)v6 finishWithResult:MEMORY[0x1E4F1CC28]];
  }
}

- (id)_webLoginErrorWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MFLookupLocalizedString(@"VERIFICATION_REQUIRED_TITLE", @"Verification Required", @"Delayed");
  objc_super v6 = NSString;
  uint64_t v7 = MFLookupLocalizedString(@"WEBLOGIN_PROMPT_FORMAT", @"Log in to your %@ account", @"Delayed");
  id v8 = [(id)objc_opt_class() displayedAccountTypeString];
  id v9 = [(MailAccount *)self displayName];
  v10 = objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);

  v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v10, @"UserFriendlyErrorDescription", MEMORY[0x1E4F1CC38], @"MailErrorHandlerDoNotSanitize", 0);
  v12 = v11;
  if (v4) {
    [v11 setObject:v4 forKeyedSubscript:@"RequestedWebLoginURLKey"];
  }
  id v13 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1059 localizedDescription:v10 title:v5 userInfo:v12];

  return v13;
}

- (id)_URLFromUncleanString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 stringByRemovingPercentEncoding];
    if (v5)
    {
      objc_super v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "ef_gmailAuthAllowedCharacterSet");
      uint64_t v7 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v6];

      if (v7)
      {
        id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)errorForResponse:(id)a3
{
  id v4 = a3;
  if ([v4 responseCode] != 34) {
    goto LABEL_9;
  }
  uint64_t v5 = [v4 responseInfo];
  if ((unint64_t)[v5 count] <= 1)
  {

LABEL_9:
    v11.receiver = self;
    v11.super_class = (Class)GmailAccount;
    id v8 = [(IMAPAccount *)&v11 errorForResponse:v4];
    goto LABEL_10;
  }
  objc_super v6 = [v5 objectAtIndex:0];
  uint64_t v7 = [v5 objectAtIndex:1];
  if ([@"xwebalert" caseInsensitiveCompare:v6]
    && ([@"webalert" isEqualToString:v6] & 1) != 0)
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(GmailAccount *)self _URLFromUncleanString:v7];
    id v8 = [(GmailAccount *)self _webLoginErrorWithURL:v9];
  }
  if (!v8) {
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (void)_removeCredential:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  uint64_t v5 = [v4 allCredentials];
  [v5 allKeys];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_super v11 = objc_msgSend(v5, "objectForKey:", v10, (void)v13);
        v12 = [v11 allValues];
        if ([v12 containsObject:v3]) {
          [v4 removeCredential:v3 forProtectionSpace:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (BOOL)enableAccount
{
  [(GmailAccount *)self mf_lock];
  if (self->_enablingPromise) {
    return 0;
  }
  id v4 = (EFPromise *)objc_alloc_init(MEMORY[0x1E4F60E18]);
  enablingPromise = self->_enablingPromise;
  self->_enablingPromise = v4;

  id v6 = [(EFPromise *)self->_enablingPromise future];
  [(GmailAccount *)self mf_unlock];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v7 standardAccountClass:objc_opt_class() valueForKey:@"EnableSchema"];
  id v9 = objc_opt_class();
  v27 = [v9 standardAccountClass:objc_opt_class() valueForKey:@"EnableHost"];
  uint64_t v10 = objc_opt_class();
  v26 = [v10 standardAccountClass:objc_opt_class() valueForKey:@"EnablePath"];
  v29 = objc_msgSend([NSString alloc], "initWithFormat:", v26, @"apple");
  id v11 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v11 setScheme:v8];
  [v11 setHost:v27];
  [v11 setPath:v29];
  v28 = [v11 URL];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v28];
  [v12 setHTTPMethod:@"POST"];
  id v13 = [NSString alloc];
  long long v14 = EFProductName();
  long long v15 = EFSystemBuildVersion();
  long long v16 = (void *)[v13 initWithFormat:@"%@ (%@)", v14, v15];

  [v12 setValue:v16 forHTTPHeaderField:*MEMORY[0x1E4F60748]];
  [(GmailAccount *)self mf_lock];
  v17 = [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];
  uint64_t v18 = [(MFAccount *)self sourceApplicationBundleIdentifier];
  objc_msgSend(v17, "set_sourceApplicationBundleIdentifier:", v18);

  v19 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v17 delegate:self delegateQueue:0];
  v20 = [v19 dataTaskWithRequest:v12];
  [(GmailAccount *)self mf_unlock];
  if (v20)
  {
    v25 = v8;
    [v20 resume];
    v21 = [v6 resultWithTimeout:0 error:60.0];
    char v3 = [v21 BOOLValue];

    [(GmailAccount *)self mf_lock];
    [v19 invalidateAndCancel];

    v22 = self->_credential;
    credential = self->_credential;
    self->_credential = 0;

    [(GmailAccount *)self mf_unlock];
    [(GmailAccount *)self _removeCredential:v22];

    uint64_t v8 = v25;
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)shouldEnableAfterError:(id)a3
{
  char v3 = [a3 localizedDescription];
  char v4 = [v3 hasPrefix:@"Your account is not enabled for IMAP use."];

  return v4;
}

- (BOOL)xListSupportedOnConnection:(id)a3
{
  return [a3 supportsCapability:11];
}

- (id)allMailMailboxUid
{
  return [(MailAccount *)self mailboxUidOfType:2 createIfNeeded:0];
}

- (id)specialUseAttributeForType:(int64_t)a3
{
  if (a3 == 2)
  {
    char v3 = @"\\All";
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)GmailAccount;
    -[IMAPAccount specialUseAttributeForType:](&v5, sel_specialUseAttributeForType_);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)specialUseAttributesForMailbox:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GmailAccount;
  objc_super v5 = [(IMAPAccount *)&v11 specialUseAttributesForMailbox:v4];
  id v6 = [v4 extraAttributes];
  int v7 = [v6 containsObject:@"\\Important"];

  if (v7)
  {
    if (v5)
    {
      uint64_t v8 = (void *)[v5 mutableCopy];
      [v8 addObject:@"\\Important"];
      goto LABEL_7;
    }
    id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"\\Important"];
  }
  else
  {
    id v9 = v5;
  }
  uint64_t v8 = v9;
LABEL_7:

  return v8;
}

- (id)displayNameUsingSpecialNamesForMailboxUid:(id)a3
{
  id v4 = a3;
  if ([v4 mailboxType] == 2)
  {
    uint64_t v5 = MFLookupLocalizedString(@"GMAIL_ALL_MAIL_SPECIAL_MAILBOX_NAME", @"All Mail", @"Message");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GmailAccount;
    uint64_t v5 = [(MailAccount *)&v8 displayNameUsingSpecialNamesForMailboxUid:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

- (BOOL)canMailboxBeRenamed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GmailAccount *)self persistentNameForMailbox:v4];
  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GmailAccount;
    BOOL v6 = [(MailAccount *)&v8 canMailboxBeRenamed:v4];
  }

  return v6;
}

- (id)persistentNameForMailbox:(id)a3
{
  char v3 = [(GmailAccount *)self specialUseAttributesForMailbox:a3];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    if (v4 == 1)
    {
      uint64_t v5 = [v3 anyObject];
    }
    else
    {
      int v7 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"self" ascending:1];
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v7, 0);
      id v9 = [v3 sortedArrayUsingDescriptors:v8];
      uint64_t v5 = [v9 firstObject];
    }
    id v10 = v5;
    if ([v10 isEqualToString:@"\\All"])
    {
      BOOL v6 = @"\\AllMail";
    }
    else if ([v10 isEqualToString:@"\\Junk"])
    {
      BOOL v6 = @"\\Spam";
    }
    else if ([v10 isEqualToString:@"\\Flagged"])
    {
      BOOL v6 = @"\\Starred";
    }
    else
    {
      objc_super v11 = @"\\Drafts";
      if (([v10 isEqualToString:@"\\Drafts"] & 1) != 0
        || (objc_super v11 = @"\\Sent", ([v10 isEqualToString:@"\\Sent"] & 1) != 0)
        || (objc_super v11 = @"\\Trash", ([v10 isEqualToString:@"\\Trash"] & 1) != 0))
      {
        BOOL v6 = v11;
      }
      else
      {
        BOOL v6 = @"\\Important";
        if (![v10 isEqualToString:@"\\Important"]) {
          BOOL v6 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_childOfMailbox:(id)a3 withComponentName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GmailAccount;
  objc_super v8 = [(MailAccount *)&v14 _childOfMailbox:v6 withComponentName:v7];
  if (!v8)
  {
    id v9 = v7;
    if ([v9 isEqualToString:@"\\AllMail"])
    {
      id v10 = &IMAPMailboxSpecialUseAttributeAll;
    }
    else if ([v9 isEqualToString:@"\\Spam"])
    {
      id v10 = &IMAPMailboxSpecialUseAttributeJunk;
    }
    else
    {
      if (![v9 isEqualToString:@"\\Starred"])
      {
        objc_super v11 = @"\\Drafts";
        if (([v9 isEqualToString:@"\\Drafts"] & 1) == 0)
        {
          objc_super v11 = @"\\Sent";
          if (([v9 isEqualToString:@"\\Sent"] & 1) == 0)
          {
            objc_super v11 = @"\\Trash";
            if (([v9 isEqualToString:@"\\Trash"] & 1) == 0)
            {
              v12 = @"\\Important";
              if (![v9 isEqualToString:@"\\Important"]) {
                v12 = 0;
              }
              goto LABEL_10;
            }
          }
        }
LABEL_9:
        v12 = v11;
LABEL_10:

        if ([v9 isEqualToString:v12])
        {
          objc_super v8 = 0;
        }
        else
        {
          objc_super v8 = [v6 childWithExtraAttribute:v12];
        }

        goto LABEL_14;
      }
      id v10 = &IMAPMailboxSpecialUseAttributeFlagged;
    }
    objc_super v11 = *v10;
    goto LABEL_9;
  }
LABEL_14:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientToken, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_enablingPromise, 0);
}

@end