@interface HotmailAccount
+ (BOOL)deliveryAccountUsesSSL;
+ (BOOL)isPredefinedAccountType;
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
- (HotmailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4;
- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3;
- (id)displayUsername;
- (id)emailAddressStrings;
- (id)hostname;
- (id)iconString;
- (id)preferredAuthScheme;
- (id)saveSentFolder;
- (id)statisticsKind;
- (unint64_t)credentialAccessibility;
- (unsigned)portNumber;
@end

@implementation HotmailAccount

- (HotmailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HotmailAccount;
  v4 = [(IMAPAccount *)&v7 initWithLibrary:a3 persistentAccount:a4];
  if (v4)
  {
    if (RegisterHotmailAuthSchemes_onceToken != -1) {
      dispatch_once(&RegisterHotmailAuthSchemes_onceToken, &__block_literal_global_6);
    }
    v5 = v4;
  }

  return v4;
}

+ (id)authSchemesForAccountClass
{
  if (RegisterHotmailAuthSchemes_onceToken != -1) {
    dispatch_once(&RegisterHotmailAuthSchemes_onceToken, &__block_literal_global_6);
  }
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HotmailAccount;
  v3 = objc_msgSendSuper2(&v5, sel_authSchemesForAccountClass);
  return v3;
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E4F177D0];
}

+ (id)emailAddressHostPart
{
  return @"office365.com";
}

+ (id)displayedAccountTypeString
{
  return @"Outlook";
}

+ (BOOL)usesSSL
{
  v2 = [a1 predefinedValueForKey:@"SSLEnabled"];
  char v3 = [v2 BOOLValue];

  return v3;
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

- (unsigned)portNumber
{
  v3.receiver = self;
  v3.super_class = (Class)HotmailAccount;
  return [(MFAccount *)&v3 defaultSecurePortNumber];
}

+ (BOOL)isPredefinedAccountType
{
  return 1;
}

- (id)statisticsKind
{
  return (id)*MEMORY[0x1E4F73CE0];
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
  objc_super v3 = [(MFAccount *)self oauth2Token];
  uint64_t v4 = [v3 length];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)HotmailAccount;
  return [(MFAccount *)&v6 credentialAccessibility];
}

+ (id)emailAddressWithUsername:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && ([v3 isEqualToString:&stru_1EFF11268] & 1) == 0)
  {
    if ([v4 rangeOfString:@"@"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = [NSString stringWithFormat:@"%@@outlook.com", v4];
    }
    else
    {
      id v6 = v4;
    }
    objc_super v5 = v6;
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (id)emailAddressStrings
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_class();
  uint64_t v4 = [(MFAccount *)self username];
  objc_super v5 = [v3 emailAddressWithUsername:v4];

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

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

- (id)iconString
{
  return @"outlookAccountIcon";
}

- (id)saveSentFolder
{
  id v3 = [(MailAccount *)self mailboxUidOfType:4 createIfNeeded:0];
  if (v3)
  {
    uint64_t v4 = [(IMAPAccount *)self nameForMailboxUid:v3];
  }
  else
  {
    uint64_t v4 = 0;
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
  v2 = [a1 standardAccountClass:a1 valueForKey:@"DeliverySSLEnabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (unsigned)deliveryAccountPortNumber
{
  v2 = [a1 standardAccountClass:a1 valueForKey:@"DeliveryPortNumber"];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = objc_alloc_init(MFHotmailSMTPAccount);
    [(MFHotmailSMTPAccount *)v4 setMailAccount:self];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

+ (BOOL)usernameIsEmailAddress
{
  return 1;
}

- (id)displayUsername
{
  v2 = [(MFAccount *)self username];
  [v2 rangeOfString:@"@"];
  if (!v3)
  {
    uint64_t v4 = [(id)objc_opt_class() emailAddressHostPart];
    uint64_t v5 = [v2 stringByAppendingFormat:@"@%@", v4];

    v2 = (void *)v5;
  }
  return v2;
}

@end