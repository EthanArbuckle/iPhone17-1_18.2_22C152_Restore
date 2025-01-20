@interface SCUIMoreHelpWebResources
+ (id)defaultLanguageForCountryPairings;
+ (id)learnMoreAboutCommunicationSafetyURL;
+ (id)learnMoreAboutSensitiveContentWarningURL;
+ (id)validLanguageCountryPairings;
+ (id)waysToGetHelpURL;
+ (id)waysToGetHelpURLForInterventionType:(int64_t)a3;
@end

@implementation SCUIMoreHelpWebResources

+ (id)learnMoreAboutCommunicationSafetyURL
{
  return (id)[NSURL URLWithString:@"https://support.apple.com/kb/HT212850"];
}

+ (id)learnMoreAboutSensitiveContentWarningURL
{
  return (id)[NSURL URLWithString:@"https://support.apple.com/kb/HT213834"];
}

+ (id)waysToGetHelpURL
{
  uint64_t v2 = SCUICurrentInterventionType();

  return +[SCUIMoreHelpWebResources waysToGetHelpURLForInterventionType:v2];
}

+ (id)waysToGetHelpURLForInterventionType:(int64_t)a3
{
  v4 = +[SCUIMoreHelpWebResources validLanguageCountryPairings];
  v5 = +[SCUIMoreHelpWebResources defaultLanguageForCountryPairings];
  if ((unint64_t)a3 > 2) {
    v6 = 0;
  }
  else {
    v6 = off_2654AB448[a3];
  }
  v7 = [MEMORY[0x263F290F0] sharedInstance];
  v8 = [v7 primaryAuthKitAccount];
  if (v8)
  {
    v9 = [v7 appleIDCountryCodeForAccount:v8];
    v10 = [v9 lowercaseString];
  }
  else
  {
    v10 = 0;
  }
  v11 = [MEMORY[0x263EFF960] currentLocale];
  v12 = [v11 languageCode];
  v13 = [v12 lowercaseString];

  if (v10 && v13)
  {
    v14 = [v4 objectForKey:v10];
    v15 = v14;
    if (v14)
    {
      int v16 = [v14 containsObject:v13];
      v17 = NSString;
      if (v16)
      {
        v18 = [NSString stringWithFormat:@"%@-%@", v13, v10];
      }
      else
      {
        v19 = [v5 objectForKey:v10];
        v18 = [v17 stringWithFormat:@"%@-%@", v19, v10];
      }
      v6 = [(__CFString *)v6 stringByAppendingString:v18];
    }
  }
  v20 = [NSURL URLWithString:v6];

  return v20;
}

+ (id)validLanguageCountryPairings
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"br", 0);
  [v2 setValue:v3 forKey:@"br"];

  v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"en", @"fr", 0);
  [v2 setValue:v4 forKey:@"ca"];

  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"en", @"es", 0);
  [v2 setValue:v5 forKey:@"us"];

  v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"jp", 0);
  [v2 setValue:v6 forKey:@"jp"];

  v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"ko", 0);
  [v2 setValue:v7 forKey:@"kr"];

  v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"fr", @"nl", 0);
  [v2 setValue:v8 forKey:@"be"];

  v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"en", @"fr", 0);
  [v2 setValue:v9 forKey:@"fr"];

  v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"en", @"de", 0);
  [v2 setValue:v10 forKey:@"de"];

  v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"en", 0);
  [v2 setValue:v11 forKey:@"gb"];

  v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"it", 0);
  [v2 setValue:v12 forKey:@"it"];

  v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"nl", 0);
  [v2 setValue:v13 forKey:@"nl"];

  v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"es", 0);
  [v2 setValue:v14 forKey:@"es"];

  v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"sv", 0);
  [v2 setValue:v15 forKey:@"se"];

  int v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"en", 0);
  [v2 setValue:v16 forKey:@"au"];

  v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"en", 0);
  [v2 setValue:v17 forKey:@"nz"];

  return v2;
}

+ (id)defaultLanguageForCountryPairings
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v2 setValue:@"br" forKey:@"br"];
  [v2 setValue:@"en" forKey:@"ca"];
  [v2 setValue:@"en" forKey:@"us"];
  [v2 setValue:@"jp" forKey:@"jp"];
  [v2 setValue:@"ko" forKey:@"kr"];
  [v2 setValue:@"fr" forKey:@"be"];
  [v2 setValue:@"fr" forKey:@"fr"];
  [v2 setValue:@"de" forKey:@"de"];
  [v2 setValue:@"en" forKey:@"gb"];
  [v2 setValue:@"it" forKey:@"it"];
  [v2 setValue:@"nl" forKey:@"nl"];
  [v2 setValue:@"es" forKey:@"es"];
  [v2 setValue:@"sv" forKey:@"se"];
  [v2 setValue:@"en" forKey:@"au"];
  [v2 setValue:@"en" forKey:@"nz"];

  return v2;
}

@end