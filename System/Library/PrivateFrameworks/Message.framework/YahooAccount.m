@interface YahooAccount
+ (BOOL)deliveryAccountUsesSSL;
+ (BOOL)getConfigurationFromServerForEmail:(id)a3;
+ (BOOL)isPredefinedAccountType;
+ (BOOL)isSSLEditable;
+ (BOOL)primaryDeliveryAccountIsDynamic;
+ (BOOL)usernameIsEmailAddress;
+ (BOOL)usesSSL;
+ (id)accountTypeIdentifier;
+ (id)authSchemesForAccountClass;
+ (id)deliveryAccountHostname;
+ (id)displayedAccountTypeString;
+ (id)emailAddressHostPart;
+ (id)emailAddressWithUsername:(id)a3;
+ (id)hostname;
+ (unsigned)deliveryAccountPortNumber;
- (BOOL)derivesDeliveryAccountInfoFromMailAccount;
- (BOOL)shouldDisplayHostnameInErrorMessages;
- (BOOL)shouldFetchACEDBInfoForError:(id)a3;
- (BOOL)supportsFastRemoteBodySearch;
- (YahooAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4;
- (id)URLForMessage:(id)a3;
- (id)_defaultSpecialMailboxNameForType:(int64_t)a3;
- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3;
- (id)displayUsername;
- (id)emailAddressStrings;
- (id)hostname;
- (id)iconString;
- (id)preferredAuthScheme;
- (id)saveSentFolder;
- (id)statisticsKind;
- (id)transferDisabledMailboxUids;
- (unint64_t)credentialAccessibility;
- (unsigned)portNumber;
@end

@implementation YahooAccount

- (YahooAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)YahooAccount;
  v4 = [(IMAPAccount *)&v7 initWithLibrary:a3 persistentAccount:a4];
  if (v4)
  {
    if (RegisterYahooAuthSchemes_onceToken[0] != -1) {
      dispatch_once(RegisterYahooAuthSchemes_onceToken, &__block_literal_global_62);
    }
    v5 = v4;
  }

  return v4;
}

+ (id)authSchemesForAccountClass
{
  if (RegisterYahooAuthSchemes_onceToken[0] != -1) {
    dispatch_once(RegisterYahooAuthSchemes_onceToken, &__block_literal_global_62);
  }
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___YahooAccount;
  v3 = objc_msgSendSuper2(&v5, sel_authSchemesForAccountClass);
  return v3;
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E4F17878];
}

+ (id)emailAddressHostPart
{
  return @"yahoo.com";
}

+ (id)displayedAccountTypeString
{
  return @"Yahoo!\u200E";
}

+ (BOOL)isSSLEditable
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = [v3 valueForKey:@"YahooAllowSSL"];

  if (v4)
  {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___YahooAccount;
    unsigned __int8 v5 = objc_msgSendSuper2(&v8, sel_isSSLEditable);
  }
  BOOL v6 = v5;

  return v6;
}

+ (BOOL)usesSSL
{
  v2 = [a1 predefinedValueForKey:@"SSLEnabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (unsigned)portNumber
{
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = [v3 objectForKey:@"YahooIMAPPort"];

  if (v4)
  {
    unsigned int v5 = [v4 unsignedIntValue];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)YahooAccount;
    unsigned int v5 = [(MFAccount *)&v8 portNumber];
  }
  unsigned int v6 = v5;

  return v6;
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

- (id)statisticsKind
{
  return (id)*MEMORY[0x1E4F73D08];
}

- (BOOL)shouldDisplayHostnameInErrorMessages
{
  return 0;
}

- (id)preferredAuthScheme
{
  return (id)[MEMORY[0x1E4F607C8] schemeWithName:@"XOAUTH2"];
}

- (unint64_t)credentialAccessibility
{
  char v3 = [(MFAccount *)self oauth2Token];
  uint64_t v4 = [v3 length];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)YahooAccount;
  return [(MFAccount *)&v6 credentialAccessibility];
}

- (BOOL)supportsFastRemoteBodySearch
{
  return 1;
}

- (id)_defaultSpecialMailboxNameForType:(int64_t)a3
{
  int64_t v3 = a3 - 1;
  if (unint64_t)(a3 - 1) < 5 && ((0x1Du >> v3))
  {
    uint64_t v4 = off_1E5D40EE0[v3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)YahooAccount;
    -[MailAccount _defaultSpecialMailboxNameForType:](&v6, sel__defaultSpecialMailboxNameForType_);
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)emailAddressWithUsername:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && ([v3 isEqualToString:&stru_1EFF11268] & 1) == 0)
  {
    if ([v4 rangeOfString:@"@"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = [NSString stringWithFormat:@"%@@yahoo.com", v4];
    }
    else
    {
      id v6 = v4;
    }
    unsigned int v5 = v6;
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (id)emailAddressStrings
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_class();
  uint64_t v4 = [(MFAccount *)self username];
  unsigned int v5 = [v3 emailAddressWithUsername:v4];

  if (v5)
  {
    v8[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)transferDisabledMailboxUids
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(MailAccount *)self mailboxUidOfType:1 createIfNeeded:0];
  id v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)URLForMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 headersIfAvailable];
  unsigned int v5 = [v4 firstHeaderForKey:*MEMORY[0x1E4F73438]];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = [v3 mailbox];
  objc_super v7 = [v3 account];
  objc_super v8 = [v7 primaryMailboxUid];

  if (v6 == v8)
  {
    v10 = @"Inbox";
  }
  else
  {
    v9 = [v3 mailbox];
    v10 = [v9 name];

    if (!v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_7;
    }
  }
  v12 = NSString;
  v13 = objc_msgSend(MEMORY[0x1E4F1CB10], "ef_defaultAllowedCharacterSet");
  v14 = [(__CFString *)v10 stringByAddingPercentEncodingWithAllowedCharacters:v13];
  v15 = objc_msgSend(MEMORY[0x1E4F1CB10], "ef_defaultAllowedCharacterSet");
  v16 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v15];
  v11 = [v12 stringWithFormat:@"ymail://?fid=%@&mid=%@", v14, v16];

LABEL_7:
  return v11;
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

+ (BOOL)getConfigurationFromServerForEmail:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 rangeOfString:@"yahoo.co.jp" options:4] != 0x7FFFFFFFFFFFFFFFLL
    || [v3 rangeOfString:@"ybb.ne.jp" options:4] != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (id)iconString
{
  return @"yahooAccountIcon";
}

- (id)saveSentFolder
{
  id v3 = [(MailAccount *)self mailboxUidOfType:4 createIfNeeded:0];
  if (v3)
  {
    BOOL v4 = [(IMAPAccount *)self nameForMailboxUid:v3];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)derivesDeliveryAccountInfoFromMailAccount
{
  return 1;
}

+ (BOOL)primaryDeliveryAccountIsDynamic
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
    BOOL v4 = objc_alloc_init(MFYahooSMTPAccount);
    [(MFYahooSMTPAccount *)v4 setMailAccount:self];
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

+ (BOOL)usernameIsEmailAddress
{
  return 1;
}

- (id)displayUsername
{
  uint64_t v2 = [(MFAccount *)self username];
  [v2 rangeOfString:@"@"];
  if (!v3)
  {
    BOOL v4 = [(id)objc_opt_class() emailAddressHostPart];
    uint64_t v5 = [v2 stringByAppendingFormat:@"@%@", v4];

    uint64_t v2 = (void *)v5;
  }
  return v2;
}

@end