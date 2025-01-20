@interface WFErrorPromptOperation
+ (id)errorPromptOperationWithContext:(id)a3;
- (WFErrorProviderContext)context;
- (void)setContext:(id)a3;
@end

@implementation WFErrorPromptOperation

+ (id)errorPromptOperationWithContext:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = WFLogForCategory(3uLL);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      v7 = [v3 error];
      *(_DWORD *)buf = 136315650;
      v28 = "+[WFErrorPromptOperation errorPromptOperationWithContext:]";
      __int16 v29 = 2112;
      id v30 = v3;
      __int16 v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_226071000, v6, v5, "%s: creating error prompt for context %@ (error %@)", buf, 0x20u);
    }
  }

  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v9 = [v3 error];
  v10 = [v9 localizedDescription];

  if ([v10 length])
  {
    [v8 setObject:v10 forKey:*MEMORY[0x263EFFFC8]];
    v11 = WFLogForCategory(3uLL);
    os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "+[WFErrorPromptOperation errorPromptOperationWithContext:]";
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl(&dword_226071000, v11, v12, "%s: prompt title %@", buf, 0x16u);
    }
  }
  v13 = [v3 error];
  v14 = [v13 localizedRecoverySuggestion];

  if (v14)
  {
    [v8 setObject:v14 forKey:*MEMORY[0x263EFFFD8]];
    v15 = WFLogForCategory(3uLL);
    os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "+[WFErrorPromptOperation errorPromptOperationWithContext:]";
      __int16 v29 = 2112;
      id v30 = v14;
      _os_log_impl(&dword_226071000, v15, v16, "%s: prompt message %@", buf, 0x16u);
    }
  }
  v17 = [v3 error];
  v18 = [v17 localizedRecoveryOptions];
  v19 = [v18 objectAtIndexedSubscript:0];

  [v8 setObject:v19 forKey:*MEMORY[0x263F00000]];
  [v8 setObject:MEMORY[0x263EFFA88] forKey:@"SBUserNotificationDismissOnLock"];
  [v8 setObject:&stru_26D9BFD58 forKey:@"SBUserNotificationAlertMessageDelimiterKey"];
  v20 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOptions:v8 timeout:0 flags:0.0];
  [v20 setContext:v3];
  objc_initWeak(&location, v20);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __58__WFErrorPromptOperation_errorPromptOperationWithContext___block_invoke;
  v24[3] = &unk_26478E3E8;
  objc_copyWeak(&v25, &location);
  [v20 setCompletionBlock:v24];
  v21 = WFLogForCategory(3uLL);
  os_log_type_t v22 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v21 && os_log_type_enabled(v21, v22))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "+[WFErrorPromptOperation errorPromptOperationWithContext:]";
    __int16 v29 = 2112;
    id v30 = v20;
    _os_log_impl(&dword_226071000, v21, v22, "%s: password prompt %@", buf, 0x16u);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v20;
}

void __58__WFErrorPromptOperation_errorPromptOperationWithContext___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__WFErrorPromptOperation_errorPromptOperationWithContext___block_invoke_2;
  block[3] = &unk_26478E3E8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __58__WFErrorPromptOperation_errorPromptOperationWithContext___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = WFLogForCategory(3uLL);
  os_log_type_t v3 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v2)
  {
    v4 = v2;
    if (os_log_type_enabled(v4, v3))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      int v8 = 136315394;
      v9 = "+[WFErrorPromptOperation errorPromptOperationWithContext:]_block_invoke_2";
      __int16 v10 = 2112;
      id v11 = WeakRetained;
      _os_log_impl(&dword_226071000, v4, v3, "%s: user dismissed alert %@", (uint8_t *)&v8, 0x16u);
    }
  }

  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = [v6 context];
  [v7 cancel];
}

- (WFErrorProviderContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end