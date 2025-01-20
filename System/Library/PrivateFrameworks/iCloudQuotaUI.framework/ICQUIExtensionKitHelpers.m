@interface ICQUIExtensionKitHelpers
+ (BOOL)isExtensionKitFlagEnabled;
+ (BOOL)isExtensionKitProcess;
+ (BOOL)isExtensionKitURL:(id)a3;
@end

@implementation ICQUIExtensionKitHelpers

+ (BOOL)isExtensionKitFlagEnabled
{
  return MEMORY[0x270ED8070]("iCloud", "ExtensionKitFlows");
}

+ (BOOL)isExtensionKitURL:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v18 = [objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v3 resolvingAgainstBaseURL:1];
    v4 = [v18 queryItems];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v10 = [v9 name];
          if ([v10 isEqualToString:@"useExtensionKit"])
          {
            v11 = [v9 value];
            int v12 = [v11 isEqualToString:@"false"];

            if (v12)
            {
              v15 = _ICQGetLogSystem();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v24 = v3;
                _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "Upsell URL ExtensionKit query param is set to false in URL: %@", buf, 0xCu);
              }

              BOOL v13 = 0;
              goto LABEL_22;
            }
          }
          else
          {
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v3;
      _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Upsell URL does not contain ExtensionKit query param, defaulting to new ExtensionKit flow. URL: %@", buf, 0xCu);
    }
    BOOL v13 = 1;
LABEL_22:
    v14 = v18;
  }
  else
  {
    v14 = _ICQGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[ICQUIExtensionKitHelpers isExtensionKitURL:](v14);
    }
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)isExtensionKitProcess
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.iCloudQuotaUI.RemoteiCloudQuotaUI"];

  return v4;
}

+ (void)isExtensionKitURL:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "+[ICQUIExtensionKitHelpers isExtensionKitURL:]";
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "nil URL was passed to %s", (uint8_t *)&v1, 0xCu);
}

@end