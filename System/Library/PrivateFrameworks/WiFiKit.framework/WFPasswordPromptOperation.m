@interface WFPasswordPromptOperation
+ (id)passwordPromptOperationWithCredentialsContext:(id)a3;
- (NSString)password;
- (NSString)username;
- (WFCredentialsProviderContext)credentialsProviderContext;
- (__SecIdentity)TLSIdentity;
- (void)setCredentialsProviderContext:(id)a3;
- (void)setPassword:(id)a3;
@end

@implementation WFPasswordPromptOperation

+ (id)passwordPromptOperationWithCredentialsContext:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = WFLogForCategory(3uLL);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "+[WFPasswordPromptOperation passwordPromptOperationWithCredentialsContext:]";
    __int16 v36 = 2112;
    id v37 = v3;
    _os_log_impl(&dword_226071000, v4, v5, "%s: creating password prompt for context %@", buf, 0x16u);
  }

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v30 = [v7 localizedStringForKey:@"kWFLocPasswordAlertTitle" value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];
  v8 = NSString;
  v9 = [v3 network];
  v10 = [v9 ssid];
  v29 = objc_msgSend(v8, "stringWithFormat:", v30, v10);

  if (v29)
  {
    [v6 setObject:v29 forKey:*MEMORY[0x263EFFFC8]];
  }
  else
  {
    v11 = NSString;
    v12 = [v3 network];
    v13 = [v12 ssid];
    v14 = [v11 stringWithFormat:@"Enter the password for “%@”", v13];
    [v6 setObject:v14 forKey:*MEMORY[0x263EFFFC8]];
  }
  [v6 setObject:&unk_26D9E2170 forKey:*MEMORY[0x263F00028]];
  uint64_t v15 = [v7 localizedStringForKey:@"kWFLocPasswordAlertCancelButton" value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];
  v16 = (void *)v15;
  if (v15) {
    v17 = (__CFString *)v15;
  }
  else {
    v17 = @"Cancel";
  }
  [v6 setObject:v17 forKey:*MEMORY[0x263EFFFE8]];
  uint64_t v18 = [v7 localizedStringForKey:@"kWFLocPasswordAlertJoinButton" value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];
  v19 = (void *)v18;
  if (v18) {
    v20 = (__CFString *)v18;
  }
  else {
    v20 = @"Join";
  }
  [v6 setObject:v20 forKey:*MEMORY[0x263F00000]];
  [v6 setObject:MEMORY[0x263EFFA88] forKey:@"SBUserNotificationDismissOnLock"];
  [v6 setObject:&stru_26D9BFD58 forKey:@"SBUserNotificationAlertMessageDelimiterKey"];
  v21 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOptions:v6 timeout:0x10000 flags:0.0];
  [v21 setCredentialsProviderContext:v3];
  objc_initWeak(&location, v21);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __75__WFPasswordPromptOperation_passwordPromptOperationWithCredentialsContext___block_invoke;
  v31[3] = &unk_26478E3E8;
  objc_copyWeak(&v32, &location);
  [v21 setCompletionBlock:v31];
  v22 = WFLogForCategory(3uLL);
  os_log_type_t v23 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v22 && os_log_type_enabled(v22, v23))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "+[WFPasswordPromptOperation passwordPromptOperationWithCredentialsContext:]";
    __int16 v36 = 2112;
    id v37 = v21;
    _os_log_impl(&dword_226071000, v22, v23, "%s: password prompt %@", buf, 0x16u);
  }

  v24 = NSString;
  v25 = [v3 network];
  v26 = [v25 ssid];
  v27 = [v24 stringWithFormat:@"Password prompt for '%@'", v26];
  [v21 setName:v27];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v21;
}

void __75__WFPasswordPromptOperation_passwordPromptOperationWithCredentialsContext___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __75__WFPasswordPromptOperation_passwordPromptOperationWithCredentialsContext___block_invoke_2;
  v4[3] = &unk_26478E3C0;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  objc_copyWeak(&v6, v1);
  dispatch_async(MEMORY[0x263EF83A0], v4);
  objc_destroyWeak(&v6);
}

void __75__WFPasswordPromptOperation_passwordPromptOperationWithCredentialsContext___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) result];
  id v3 = WFLogForCategory(3uLL);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (v2 == 2)
  {
    if (v6)
    {
      v7 = v3;
      if (os_log_type_enabled(v7, v4))
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        int v22 = 136315394;
        os_log_type_t v23 = "+[WFPasswordPromptOperation passwordPromptOperationWithCredentialsContext:]_block_invoke_2";
        __int16 v24 = 2112;
        id v25 = WeakRetained;
        _os_log_impl(&dword_226071000, v7, v4, "%s: user entered password %@", (uint8_t *)&v22, 0x16u);
      }
    }

    uint64_t v9 = [*(id *)(a1 + 32) userResponse];
    if (!v9) {
      goto LABEL_20;
    }
    v10 = (void *)v9;
    v11 = [*(id *)(a1 + 32) userResponse];
    uint64_t v12 = *MEMORY[0x263F00030];
    v13 = [v11 objectForKey:*MEMORY[0x263F00030]];

    if (v13)
    {
      v14 = [*(id *)(a1 + 32) userResponse];
      uint64_t v15 = [v14 objectForKey:v12];
      [*(id *)(a1 + 32) setPassword:v15];
    }
    else
    {
LABEL_20:
      v14 = WFLogForCategory(3uLL);
      os_log_type_t v20 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v20))
      {
        v21 = *(void **)(a1 + 32);
        int v22 = 136315394;
        os_log_type_t v23 = "+[WFPasswordPromptOperation passwordPromptOperationWithCredentialsContext:]_block_invoke";
        __int16 v24 = 2112;
        id v25 = v21;
        _os_log_impl(&dword_226071000, v14, v20, "%s: nil user response from prompt %@", (uint8_t *)&v22, 0x16u);
      }
    }

    v19 = [*(id *)(a1 + 32) credentialsProviderContext];
    [v19 gatherCredentials:0];
  }
  else
  {
    if (v6)
    {
      v16 = v3;
      if (os_log_type_enabled(v16, v4))
      {
        v17 = *(void **)(a1 + 32);
        uint64_t v18 = [v17 credentialsProviderContext];
        int v22 = 136315650;
        os_log_type_t v23 = "+[WFPasswordPromptOperation passwordPromptOperationWithCredentialsContext:]_block_invoke";
        __int16 v24 = 2112;
        id v25 = v17;
        __int16 v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_226071000, v16, v4, "%s: user cancelled password prompt %@, cancelling context %@", (uint8_t *)&v22, 0x20u);
      }
    }

    [*(id *)(a1 + 32) setPassword:0];
    v19 = [*(id *)(a1 + 32) credentialsProviderContext];
    [v19 cancel];
  }
}

- (NSString)password
{
  return self->password;
}

- (void)setPassword:(id)a3
{
}

- (__SecIdentity)TLSIdentity
{
  return self->TLSIdentity;
}

- (NSString)username
{
  return self->username;
}

- (WFCredentialsProviderContext)credentialsProviderContext
{
  return self->_credentialsProviderContext;
}

- (void)setCredentialsProviderContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialsProviderContext, 0);
  objc_storeStrong((id *)&self->username, 0);
  objc_storeStrong((id *)&self->password, 0);
}

@end