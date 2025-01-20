@interface MFAttachmentCapabilities
+ (BOOL)_isMailDropDevice;
+ (BOOL)mailDropAvailable;
+ (BOOL)mailDropAvailableForAccount:(id)a3;
+ (BOOL)mailDropConfigured;
+ (BOOL)placeholdersAvailable;
+ (double)mailDropExpiration;
+ (id)capabilitiesDictionary;
+ (id)mailDropPreferences;
+ (unint64_t)_mailDropLimit;
+ (unint64_t)currentDownloadLimit;
+ (unint64_t)currentMessageLimit;
+ (unint64_t)currentPlaceholderThreshold;
+ (unint64_t)currentUploadLimit;
+ (unint64_t)currentUploadLimitForAccount:(id)a3;
+ (unint64_t)mailDropThreshold;
@end

@implementation MFAttachmentCapabilities

+ (unint64_t)currentMessageLimit
{
  v3 = MFUserAgent();
  char v4 = [v3 isMobileMail];

  if (v4)
  {
    unint64_t v5 = 52428800;
  }
  else
  {
    v6 = [a1 capabilitiesDictionary];
    v7 = [v6 objectForKeyedSubscript:@"MFMailAttachmentMessageLimitKey"];
    unint64_t v5 = [v7 integerValue];
  }
  if ([a1 placeholdersAvailable]) {
    return v5;
  }
  else {
    return 15728640;
  }
}

+ (unint64_t)currentDownloadLimit
{
  v2 = +[MFNetworkController sharedInstance];
  int v3 = [v2 isFatPipe];

  if (v3) {
    return 0x40000000;
  }
  else {
    return 104857600;
  }
}

+ (unint64_t)currentUploadLimit
{
  int v3 = MFUserAgent();
  int v4 = [v3 isMobileMail];

  if (v4)
  {
    unint64_t v5 = +[MailAccount defaultMailAccountForDelivery];
    if (([a1 mailDropAvailableForAccount:v5] & 1) != 0
      || [a1 mailDropAvailable])
    {
      unint64_t v6 = [a1 _mailDropLimit];
    }
    else
    {
      unint64_t v6 = 104857600;
    }
    v8 = +[MFNetworkController sharedInstance];
    int v9 = [v8 isFatPipe];

    uint64_t v10 = 104857600;
    if (v6 < 0x6400000) {
      uint64_t v10 = v6;
    }
    if (!v9) {
      unint64_t v6 = v10;
    }
  }
  else
  {
    unint64_t v5 = [a1 capabilitiesDictionary];
    v7 = [v5 objectForKeyedSubscript:@"MFMailAttachmentUploadLimitKey"];
    unint64_t v6 = [v7 integerValue];
  }
  if ([a1 placeholdersAvailable]) {
    return v6;
  }
  else {
    return 104857600;
  }
}

+ (unint64_t)currentUploadLimitForAccount:(id)a3
{
  id v4 = a3;
  unint64_t v5 = MFUserAgent();
  int v6 = [v5 isMobileMail];

  if (v6 && [a1 mailDropAvailableForAccount:v4]) {
    unint64_t v7 = [a1 _mailDropLimit];
  }
  else {
    unint64_t v7 = 104857600;
  }
  v8 = +[MFNetworkController sharedInstance];
  int v9 = [v8 isFatPipe];

  int v10 = [a1 placeholdersAvailable];
  if (v7 >= 0x6400000) {
    uint64_t v11 = 104857600;
  }
  else {
    uint64_t v11 = v7;
  }
  if (v9) {
    uint64_t v11 = v7;
  }
  if (v10) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = 104857600;
  }

  return v12;
}

+ (BOOL)_isMailDropDevice
{
  v2 = MFUserAgent();
  char v3 = [v2 isMobileMail];

  return v3;
}

+ (unint64_t)mailDropThreshold
{
  char v3 = MFUserAgent();
  int v4 = [v3 isMobileMail];

  if (v4)
  {
    if ([a1 mailDropAvailable]) {
      unint64_t v5 = 20971520;
    }
    else {
      unint64_t v5 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    int v6 = [a1 capabilitiesDictionary];
    unint64_t v7 = [v6 objectForKeyedSubscript:@"MFMailAttachmentMailDropThresholdKey"];
    unint64_t v5 = [v7 integerValue];
  }
  if ([a1 placeholdersAvailable]) {
    return v5;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

+ (unint64_t)_mailDropLimit
{
  v2 = +[MFNetworkController sharedInstance];
  int v3 = [v2 isFatPipe];

  if (v3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 104857600;
  }
}

+ (BOOL)mailDropConfigured
{
  if (mailDropConfigured_onceToken != -1) {
    dispatch_once(&mailDropConfigured_onceToken, &__block_literal_global_23);
  }
  if (mailDropConfigured_mailDropConfiguredNeedsRefresh == 1) {
    return mailDropConfigured_mailDropConfigured != 0;
  }
  int v4 = MFUserAgent();
  if ([v4 isMobileMail])
  {
  }
  else
  {
    char v5 = MFHasAccountsEntitlement();

    if ((v5 & 1) == 0)
    {
      unint64_t v7 = [a1 capabilitiesDictionary];
      int v9 = [v7 objectForKeyedSubscript:@"MFMailAttachmentMailDropConfiguredKey"];
      char v10 = [v9 BOOLValue];
      goto LABEL_12;
    }
  }
  int v6 = +[MFAccountStore sharedAccountStore];
  unint64_t v7 = [v6 persistentStore];

  v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
  int v9 = v8;
  if (v8)
  {
    char v10 = [v8 isEnabledForDataclass:*MEMORY[0x1E4F17B38]];
LABEL_12:
    char v11 = v10;
    goto LABEL_13;
  }
  char v11 = 0;
LABEL_13:

  BOOL result = [a1 placeholdersAvailable] & v11;
  mailDropConfigured_mailDropConfigured = result;
  mailDropConfigured_mailDropConfiguredNeedsRefresh = 1;
  return result;
}

void __46__MFAttachmentCapabilities_mailDropConfigured__block_invoke()
{
  int out_token = -1431655766;
  v0 = (const char *)*MEMORY[0x1E4F77E40];
  v1 = dispatch_get_global_queue(0, 0);
  notify_register_dispatch(v0, &out_token, v1, &__block_literal_global_23_0);
}

void __46__MFAttachmentCapabilities_mailDropConfigured__block_invoke_2()
{
  mailDropConfigured_mailDropConfiguredNeedsRefresh = 0;
}

+ (BOOL)mailDropAvailableForAccount:(id)a3
{
  id v4 = a3;
  char v5 = MFUserAgent();
  int v6 = [v5 isMobileMail];

  if (v6 && [a1 _isMailDropDevice] && objc_msgSend(v4, "supportsMailDrop")) {
    char v7 = [a1 mailDropConfigured];
  }
  else {
    char v7 = 0;
  }
  char v8 = [a1 placeholdersAvailable] & v7;

  return v8;
}

+ (BOOL)mailDropAvailable
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v3 = MFUserAgent();
  int v4 = [v3 isMobileMail];

  if (v4)
  {
    if ([a1 _isMailDropDevice])
    {
      +[MailAccount activeAccounts];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v5);
            }
            if (objc_msgSend(a1, "mailDropAvailableForAccount:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
            {
              LOBYTE(v6) = 1;
              goto LABEL_15;
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    int v9 = [a1 capabilitiesDictionary];
    char v10 = [v9 objectForKeyedSubscript:@"MFMailAttachmentMailDropAvailableKey"];
    LODWORD(v6) = [v10 BOOLValue];
  }
  return objc_msgSend(a1, "placeholdersAvailable", (void)v12) & v6;
}

+ (double)mailDropExpiration
{
  v2 = MFUserAgent();
  int v3 = [v2 isMobileMail];

  if (!v3) {
    return 2592000.0;
  }
  int v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  int v5 = [v4 BOOLForKey:@"MailDropShortExp"];

  double result = 2592000.0;
  if (v5) {
    return 600.0;
  }
  return result;
}

+ (id)mailDropPreferences
{
  v2 = MFUserAgent();
  int v3 = [v2 isMobileMail];

  if (v3)
  {
    CFStringRef v4 = (const __CFString *)MFMobileMailPreferenceDomain();
    int v5 = (void *)CFPreferencesCopyAppValue(@"mailDrop", v4);
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

+ (unint64_t)currentPlaceholderThreshold
{
  int v3 = MFUserAgent();
  int v4 = [v3 isMobileMail];

  if (v4)
  {
    int v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    int v6 = [v5 BOOLForKey:@"AttachmentPlaceholderLowerLimit"];

    if (v6) {
      uint64_t v7 = 0x200000;
    }
    else {
      uint64_t v7 = 10485760;
    }
    if ([a1 placeholdersAvailable]) {
      unint64_t v8 = v7;
    }
    else {
      unint64_t v8 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    int v9 = [a1 capabilitiesDictionary];
    char v10 = [v9 objectForKeyedSubscript:@"MFMailAttachmentPlaceholderThresholdKey"];
    unint64_t v8 = [v10 integerValue];
  }
  if ([a1 placeholdersAvailable]) {
    return v8;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

+ (BOOL)placeholdersAvailable
{
  return 1;
}

+ (id)capabilitiesDictionary
{
  int v3 = MFUserAgent();
  int v4 = [v3 isMobileMail];

  if (v4)
  {
    int v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:6];
    int v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a1, "currentUploadLimit"));
    [v5 setObject:v6 forKey:@"MFMailAttachmentUploadLimitKey"];

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a1, "currentMessageLimit"));
    [v5 setObject:v7 forKey:@"MFMailAttachmentMessageLimitKey"];

    unint64_t v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a1, "mailDropThreshold"));
    [v5 setObject:v8 forKey:@"MFMailAttachmentMailDropThresholdKey"];

    int v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a1, "currentPlaceholderThreshold"));
    [v5 setObject:v9 forKey:@"MFMailAttachmentPlaceholderThresholdKey"];

    char v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "placeholdersAvailable"));
    [v5 setObject:v10 forKey:@"MFMailAttachmentPlaceholdersAvailableKey"];

    char v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "mailDropAvailable"));
    [v5 setObject:v11 forKey:@"MFMailAttachmentMailDropConfiguredKey"];

    long long v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a1, "mailDropConfigured"));
    [v5 setObject:v12 forKey:@"MFMailAttachmentMailDropConfiguredKey"];
  }
  else
  {
    int v5 = [MEMORY[0x1E4F73B40] attachmentCapabilities];
  }
  return v5;
}

@end