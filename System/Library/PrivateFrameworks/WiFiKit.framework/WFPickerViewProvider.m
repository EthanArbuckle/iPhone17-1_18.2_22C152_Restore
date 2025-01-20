@interface WFPickerViewProvider
- (BOOL)_canHandleCredentialsContext:(id)a3;
- (BOOL)wantsModalPresentation;
- (UIViewController)rootViewController;
- (WFPickerViewProvider)initWithRootViewController:(id)a3;
- (WFPickerViewProviderDelegate)delegate;
- (id)_promptForEnterpriseJoin:(id)a3;
- (id)certificateViewControllerWithContext:(id)a3;
- (id)credentialsViewControllerWithContext:(id)a3;
- (id)networkDetailsViewControllerWithContext:(id)a3;
- (id)networkErrorViewControllerWithContext:(id)a3;
- (id)otherNetworkViewControllerWithContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRootViewController:(id)a3;
@end

@implementation WFPickerViewProvider

- (WFPickerViewProvider)initWithRootViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFPickerViewProvider;
  v6 = [(WFPickerViewProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rootViewController, a3);
  }

  return v7;
}

- (BOOL)_canHandleCredentialsContext:(id)a3
{
  return [a3 isEnterprise] ^ 1;
}

- (id)_promptForEnterpriseJoin:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[WFEnterpriseJoinPromptOperation enterpriseJoinPromptOperationWithDeviceCapability:WFCurrentDeviceCapability()];
  v6 = [v4 network];
  v7 = WFLogForCategory(3uLL);
  os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "-[WFPickerViewProvider _promptForEnterpriseJoin:]";
    __int16 v25 = 2112;
    v26 = v5;
    __int16 v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_226071000, v7, v8, "%s: prompt (%@) for enterprise join %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, v5);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__WFPickerViewProvider__promptForEnterpriseJoin___block_invoke;
  v15[3] = &unk_26478F9A0;
  objc_copyWeak(&v18, (id *)buf);
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  id v9 = v6;
  id v16 = v9;
  id v10 = v4;
  id v17 = v10;
  [v5 setCompletionBlock:v15];
  v11 = [MEMORY[0x263F08A48] mainQueue];
  [v11 addOperation:v5];

  v12 = v17;
  id v13 = v5;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v13;
}

void __49__WFPickerViewProvider__promptForEnterpriseJoin___block_invoke(id *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__WFPickerViewProvider__promptForEnterpriseJoin___block_invoke_2;
  block[3] = &unk_26478F9A0;
  objc_copyWeak(&v5, a1 + 6);
  objc_copyWeak(&v6, a1 + 7);
  objc_copyWeak(&v7, a1 + 8);
  id v3 = a1[4];
  id v4 = a1[5];
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

void __49__WFPickerViewProvider__promptForEnterpriseJoin___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained result];

  if (v4 == 2)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 56));
    id v6 = [v5 delegate];
    id v7 = objc_loadWeakRetained((id *)(a1 + 64));
    [v6 openSettingsForScanRecord:v7];

    os_log_type_t v8 = WFLogForCategory(3uLL);
    os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8)
    {
      os_log_type_t v8 = v8;
      if (os_log_type_enabled(v8, v9))
      {
        id v10 = objc_loadWeakRetained(v2);
        uint64_t v11 = *(void *)(a1 + 32);
        int v14 = 136315650;
        v15 = "-[WFPickerViewProvider _promptForEnterpriseJoin:]_block_invoke_2";
        __int16 v16 = 2112;
        id v17 = v10;
        __int16 v18 = 2112;
        uint64_t v19 = v11;
        v12 = "%s: user accepted join prompt (%@) for enterprise network %@";
LABEL_10:
        _os_log_impl(&dword_226071000, v8, v9, v12, (uint8_t *)&v14, 0x20u);

        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  else
  {
    [*(id *)(a1 + 40) cancel];
    os_log_type_t v8 = WFLogForCategory(3uLL);
    os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8)
    {
      os_log_type_t v8 = v8;
      if (os_log_type_enabled(v8, v9))
      {
        id v10 = objc_loadWeakRetained(v2);
        uint64_t v13 = *(void *)(a1 + 32);
        int v14 = 136315650;
        v15 = "-[WFPickerViewProvider _promptForEnterpriseJoin:]_block_invoke";
        __int16 v16 = 2112;
        id v17 = v10;
        __int16 v18 = 2112;
        uint64_t v19 = v13;
        v12 = "%s: user cancelled join prompt (%@) for enterprise network %@";
        goto LABEL_10;
      }
LABEL_11:
    }
  }
}

- (id)credentialsViewControllerWithContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WFPickerViewProvider *)self _canHandleCredentialsContext:v4])
  {
    id v5 = +[WFPasswordPromptOperation passwordPromptOperationWithCredentialsContext:v4];
    id v6 = WFLogForCategory(3uLL);
    os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      int v12 = 136315650;
      uint64_t v13 = "-[WFPickerViewProvider credentialsViewControllerWithContext:]";
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_226071000, v6, v7, "%s: can handle credentials context %@, using prompt %@", (uint8_t *)&v12, 0x20u);
    }

    os_log_type_t v8 = [MEMORY[0x263F08A48] mainQueue];
    [v8 addOperation:v5];
  }
  else
  {
    os_log_type_t v9 = WFLogForCategory(3uLL);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      int v12 = 136315394;
      uint64_t v13 = "-[WFPickerViewProvider credentialsViewControllerWithContext:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_226071000, v9, v10, "%s: unhandled credentials context %@, launching settings", (uint8_t *)&v12, 0x16u);
    }

    id v5 = [(WFPickerViewProvider *)self _promptForEnterpriseJoin:v4];
  }

  return v5;
}

- (id)certificateViewControllerWithContext:(id)a3
{
  return 0;
}

- (id)networkDetailsViewControllerWithContext:(id)a3
{
  return 0;
}

- (id)networkErrorViewControllerWithContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[WFErrorPromptOperation errorPromptOperationWithContext:v3];
  id v5 = WFLogForCategory(3uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  int v8 = !v7;
  if (v4)
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      int v12 = 136315650;
      uint64_t v13 = "-[WFPickerViewProvider networkErrorViewControllerWithContext:]";
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_226071000, v5, v6, "%s: error prompt %@ for context %@", (uint8_t *)&v12, 0x20u);
    }

    os_log_type_t v9 = [MEMORY[0x263F08A48] mainQueue];
    [v9 addOperation:v4];

    id v10 = v4;
  }
  else
  {
    if (v8 && os_log_type_enabled(v5, v6))
    {
      int v12 = 136315394;
      uint64_t v13 = "-[WFPickerViewProvider networkErrorViewControllerWithContext:]";
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_226071000, v5, v6, "%s: failed to create error alert for context %@", (uint8_t *)&v12, 0x16u);
    }
  }
  return v4;
}

- (id)otherNetworkViewControllerWithContext:(id)a3
{
  return 0;
}

- (BOOL)wantsModalPresentation
{
  return self->wantsModalPresentation;
}

- (WFPickerViewProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFPickerViewProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end