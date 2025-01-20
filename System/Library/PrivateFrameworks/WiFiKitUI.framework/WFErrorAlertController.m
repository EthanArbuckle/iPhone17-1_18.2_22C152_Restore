@interface WFErrorAlertController
+ (id)errorAlertControllerWithContext:(id)a3;
- (BOOL)_canShowWhileLocked;
- (WFErrorProviderContext)context;
- (void)setContext:(id)a3;
@end

@implementation WFErrorAlertController

+ (id)errorAlertControllerWithContext:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4)
  {
    v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      v7 = [v3 error];
      *(_DWORD *)buf = 136315394;
      v33 = "+[WFErrorAlertController errorAlertControllerWithContext:]";
      __int16 v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_2257EC000, v6, v5, "%s: error %@", buf, 0x16u);
    }
  }

  v8 = [v3 error];
  if ([v8 code] == 19) {
    goto LABEL_11;
  }
  v9 = [v3 error];
  if ([v9 code] == 17)
  {
LABEL_10:

LABEL_11:
    char v11 = 1;
    v12 = &stru_26D8F6070;
LABEL_12:

    goto LABEL_13;
  }
  v10 = [v3 error];
  if ([v10 code] == 4)
  {

    goto LABEL_10;
  }
  v24 = [v3 error];
  BOOL v25 = [v24 code] == 16;

  if (!v25)
  {
    v8 = [v3 error];
    v12 = [v8 localizedDescription];
    char v11 = 0;
    goto LABEL_12;
  }
  char v11 = 1;
  v12 = &stru_26D8F6070;
LABEL_13:
  if (![(__CFString *)v12 length])
  {

    v12 = 0;
  }
  v13 = [v3 error];
  v14 = v13;
  if (v11) {
    [v13 localizedDescription];
  }
  else {
  v15 = [v13 localizedRecoverySuggestion];
  }

  v16 = +[WFErrorAlertController alertControllerWithTitle:v12 message:v15 preferredStyle:1];
  v17 = [v3 error];
  v18 = [v17 localizedRecoveryOptions];
  v19 = [v18 objectAtIndexedSubscript:0];

  [v16 setContext:v3];
  objc_initWeak((id *)buf, v3);
  v20 = (void *)MEMORY[0x263F82400];
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = __58__WFErrorAlertController_errorAlertControllerWithContext___block_invoke;
  v29 = &unk_264756190;
  v21 = v12;
  v30 = v21;
  objc_copyWeak(&v31, (id *)buf);
  v22 = [v20 actionWithTitle:v19 style:0 handler:&v26];
  objc_msgSend(v16, "addAction:", v22, v26, v27, v28, v29);

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);

  return v16;
}

void __58__WFErrorAlertController_errorAlertControllerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v2 && os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_2257EC000, v2, v3, "user dismissed alert %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cancel];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
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