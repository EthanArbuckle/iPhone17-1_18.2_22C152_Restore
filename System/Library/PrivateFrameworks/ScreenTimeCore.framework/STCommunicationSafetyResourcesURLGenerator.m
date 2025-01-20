@interface STCommunicationSafetyResourcesURLGenerator
+ (id)communicationSafetySupportedCountryLanguagePairs;
+ (id)resourcesURL;
+ (id)resourcesURLForCountryCode:(id)a3 languageCode:(id)a4;
+ (void)resourcesURL;
@end

@implementation STCommunicationSafetyResourcesURLGenerator

+ (id)communicationSafetySupportedCountryLanguagePairs
{
  if (communicationSafetySupportedCountryLanguagePairs_onceToken != -1) {
    dispatch_once(&communicationSafetySupportedCountryLanguagePairs_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)communicationSafetySupportedCountryLanguagePairs_communicationSafetySupportedCountryLanguagePairs;
  return v2;
}

void __94__STCommunicationSafetyResourcesURLGenerator_communicationSafetySupportedCountryLanguagePairs__block_invoke()
{
  v0 = (void *)communicationSafetySupportedCountryLanguagePairs_communicationSafetySupportedCountryLanguagePairs;
  communicationSafetySupportedCountryLanguagePairs_communicationSafetySupportedCountryLanguagePairs = (uint64_t)&unk_1F349EEF0;
}

+ (id)resourcesURL
{
  v2 = [MEMORY[0x1E4F4EF40] sharedInstance];
  v3 = [v2 primaryAuthKitAccount];
  if (v3)
  {
    v4 = [v2 appleIDCountryCodeForAccount:v3];
    if (v4) {
      goto LABEL_8;
    }
    v5 = +[STLog communicationSafety];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[STCommunicationSafetyResourcesURLGenerator resourcesURL](v5);
    }
  }
  else
  {
    v5 = +[STLog communicationSafety];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[STCommunicationSafetyResourcesURLGenerator resourcesURL](v5);
    }
  }

  v4 = 0;
LABEL_8:
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = [v6 languageCode];

  v8 = [(id)objc_opt_class() resourcesURLForCountryCode:v4 languageCode:v7];

  return v8;
}

+ (id)resourcesURLForCountryCode:(id)a3 languageCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = [(id)objc_opt_class() communicationSafetySupportedCountryLanguagePairs];
    v8 = [v7 objectForKey:v5];

    if (v8)
    {
      int v9 = [v8 containsObject:v6];
      v10 = NSString;
      if (v9)
      {
        v11 = [v5 lowercaseString];
        v12 = [v10 stringWithFormat:@"%@-%@", v6, v11];
      }
      else
      {
        v11 = [v8 firstObject];
        v14 = [v5 lowercaseString];
        v12 = [v10 stringWithFormat:@"%@-%@", v11, v14];
      }
      v13 = [@"https://www.apple.com/go/child-safety/rp/" stringByAppendingString:v12];
    }
    else
    {
      v13 = @"https://www.apple.com/go/child-safety/rp/";
    }
  }
  else
  {
    v13 = @"https://www.apple.com/go/child-safety/rp/";
  }
  v15 = [MEMORY[0x1E4F1CB10] URLWithString:v13];

  return v15;
}

+ (void)resourcesURL
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "Unable to fetch country code to generate Communication Safety resources URL.", v1, 2u);
}

@end