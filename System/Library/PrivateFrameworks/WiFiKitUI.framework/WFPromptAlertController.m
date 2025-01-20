@interface WFPromptAlertController
+ (id)promptAlertControllerWithTitle:(id)a3 message:(id)a4 cancelTitle:(id)a5 successTitle:(id)a6 completionHandler:(id)a7;
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
@end

@implementation WFPromptAlertController

+ (id)promptAlertControllerWithTitle:(id)a3 message:(id)a4 cancelTitle:(id)a5 successTitle:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = v15;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  if (!v11)
  {
    v22 = WFLogForCategory(0);
    os_log_type_t v25 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v22 || !os_log_type_enabled(v22, v25)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v26 = "Missing alert title";
LABEL_30:
    _os_log_impl(&dword_2257EC000, v22, v25, v26, buf, 2u);
    goto LABEL_7;
  }
  if (!v12)
  {
    v22 = WFLogForCategory(0);
    os_log_type_t v25 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v22 || !os_log_type_enabled(v22, v25)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v26 = "Missing alert message";
    goto LABEL_30;
  }
  if (!v15)
  {
    v22 = WFLogForCategory(0);
    os_log_type_t v25 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v22 || !os_log_type_enabled(v22, v25)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v26 = "Missing completion handler";
    goto LABEL_30;
  }
  if (!v13)
  {
    v22 = WFLogForCategory(0);
    os_log_type_t v25 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v22 || !os_log_type_enabled(v22, v25)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v26 = "Missing alert cancelTitle";
    goto LABEL_30;
  }
  if (v14)
  {
    uint64_t v17 = +[WFPromptAlertController alertControllerWithTitle:v11 message:v12 preferredStyle:1];
    v18 = (void *)v31[5];
    v31[5] = v17;

    [(id)v31[5] setCompletionHandler:v16];
    v19 = (void *)v31[5];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __109__WFPromptAlertController_promptAlertControllerWithTitle_message_cancelTitle_successTitle_completionHandler___block_invoke;
    v28[3] = &unk_264756168;
    v28[4] = &v30;
    v20 = [MEMORY[0x263F82400] actionWithTitle:v13 style:1 handler:v28];
    [v19 addAction:v20];

    v21 = (void *)v31[5];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __109__WFPromptAlertController_promptAlertControllerWithTitle_message_cancelTitle_successTitle_completionHandler___block_invoke_2;
    v27[3] = &unk_264756168;
    v27[4] = &v30;
    v22 = [MEMORY[0x263F82400] actionWithTitle:v14 style:0 handler:v27];
    [v21 addAction:v22];
    goto LABEL_7;
  }
  v22 = WFLogForCategory(0);
  os_log_type_t v25 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v22 && os_log_type_enabled(v22, v25))
  {
    *(_WORD *)buf = 0;
    v26 = "Missing alert cancelTitle";
    goto LABEL_30;
  }
LABEL_7:

  id v23 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v23;
}

void __109__WFPromptAlertController_promptAlertControllerWithTitle_message_cancelTitle_successTitle_completionHandler___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) completionHandler];
  v1[2](v1, 0);
}

void __109__WFPromptAlertController_promptAlertControllerWithTitle_message_cancelTitle_successTitle_completionHandler___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) completionHandler];
  v1[2](v1, 1);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end