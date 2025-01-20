@interface VUIActionLocationPrompt
+ (id)_actionWithDictionary:(id)a3 appContext:(id)a4;
- (BOOL)forcesSystemPrompt;
- (BOOL)geoLocationEnforced;
- (NSDictionary)dialogMetrics;
- (NSString)settingsPromptButtonTitle;
- (NSString)settingsPromptCancelTitle;
- (NSString)settingsPromptMessage;
- (NSString)settingsPromptTitle;
- (NSURL)settingsURL;
- (UIResponder)targetResponder;
- (VUIAction)failureAction;
- (VUIAction)successAction;
- (VUIActionLocationPrompt)initWithContextData:(id)a3 appContext:(id)a4;
- (id)completionHandler;
- (void)_continueWithSuccess:(BOOL)a3 targetResponder:(id)a4 completion:(id)a5;
- (void)_locationAuthorizationStatusDidChange:(id)a3;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setDialogMetrics:(id)a3;
- (void)setFailureAction:(id)a3;
- (void)setForcesSystemPrompt:(BOOL)a3;
- (void)setGeoLocationEnforced:(BOOL)a3;
- (void)setSettingsPromptButtonTitle:(id)a3;
- (void)setSettingsPromptCancelTitle:(id)a3;
- (void)setSettingsPromptMessage:(id)a3;
- (void)setSettingsPromptTitle:(id)a3;
- (void)setSettingsURL:(id)a3;
- (void)setSuccessAction:(id)a3;
- (void)setTargetResponder:(id)a3;
@end

@implementation VUIActionLocationPrompt

- (VUIActionLocationPrompt)initWithContextData:(id)a3 appContext:(id)a4
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)VUIActionLocationPrompt;
  v8 = [(VUIActionLocationPrompt *)&v39 init];
  if (v8)
  {
    v8->_geoLocationEnforced = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", @"geoLocationEnforced", 0);
    char v9 = [MEMORY[0x1E4FB3C90] isMac];
    char v10 = 0;
    if ((v9 & 1) == 0) {
      char v10 = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", @"forcesSystemPrompt", 1);
    }
    v8->_forcesSystemPrompt = v10;
    v11 = objc_opt_class();
    v12 = objc_msgSend(v6, "vui_dictionaryForKey:", @"success");
    uint64_t v13 = [v11 _actionWithDictionary:v12 appContext:v7];
    successAction = v8->_successAction;
    v8->_successAction = (VUIAction *)v13;

    v15 = objc_opt_class();
    v16 = objc_msgSend(v6, "vui_dictionaryForKey:", @"failure");
    uint64_t v17 = [v15 _actionWithDictionary:v16 appContext:v7];
    failureAction = v8->_failureAction;
    v8->_failureAction = (VUIAction *)v17;

    uint64_t v19 = objc_msgSend(v6, "vui_stringForKey:", @"settingsPromptTitle");
    settingsPromptTitle = v8->_settingsPromptTitle;
    v8->_settingsPromptTitle = (NSString *)v19;

    uint64_t v21 = objc_msgSend(v6, "vui_stringForKey:", @"settingsPromptMessage");
    settingsPromptMessage = v8->_settingsPromptMessage;
    v8->_settingsPromptMessage = (NSString *)v21;

    uint64_t v23 = objc_msgSend(v6, "vui_stringForKey:", @"settingsPromptButtonTitle");
    settingsPromptButtonTitle = v8->_settingsPromptButtonTitle;
    v8->_settingsPromptButtonTitle = (NSString *)v23;

    v25 = objc_msgSend(v6, "vui_stringForKey:", @"settingsPromptCancelTitle");
    v26 = v25;
    if (!v25)
    {
      v16 = +[VUILocalizationManager sharedInstance];
      v26 = [v16 localizedStringForKey:@"CANCEL"];
    }
    objc_storeStrong((id *)&v8->_settingsPromptCancelTitle, v26);
    if (!v25)
    {
    }
    v27 = objc_msgSend(v6, "vui_stringForKey:", @"settingsPromptUrl");
    uint64_t v28 = [MEMORY[0x1E4F1CB10] URLWithString:v27];
    settingsURL = v8->_settingsURL;
    v8->_settingsURL = (NSURL *)v28;

    v30 = (void *)MEMORY[0x1E4F1CA60];
    v42[0] = @"dialogId";
    v42[1] = @"dialogType";
    v43[0] = @"locationAuthorization";
    v43[1] = @"locationAuthorization";
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
    v32 = [v30 dictionaryWithDictionary:v31];

    uint64_t v33 = objc_msgSend(v6, "vui_dictionaryForKey:", @"metrics");
    v34 = (void *)v33;
    if (v33)
    {
      v40 = @"details";
      uint64_t v41 = v33;
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      [v32 addEntriesFromDictionary:v35];
    }
    uint64_t v36 = [v32 copy];
    dialogMetrics = v8->_dialogMetrics;
    v8->_dialogMetrics = (NSDictionary *)v36;
  }
  return v8;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4FB50C8] defaultLocationManager];
  objc_initWeak(&location, self);
  char v9 = (void *)MEMORY[0x1E4FB50C8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__VUIActionLocationPrompt_performWithTargetResponder_completionHandler___block_invoke;
  v13[3] = &unk_1E6DF8C58;
  id v10 = v8;
  id v14 = v10;
  objc_copyWeak(&v17, &location);
  id v11 = v7;
  id v16 = v11;
  id v12 = v6;
  id v15 = v12;
  [v9 locationServicesEnabled:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __72__VUIActionLocationPrompt_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1, char a2)
{
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__VUIActionLocationPrompt_performWithTargetResponder_completionHandler___block_invoke_2;
  v5[3] = &unk_1E6DF8C30;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  char v9 = a2;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v4 fetchAuthorizationStatus:v5];

  objc_destroyWeak(&v8);
}

void __72__VUIActionLocationPrompt_performWithTargetResponder_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = objc_loadWeakRetained(&_pendingInstance);
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:v5];

    [v5 setTargetResponder:0];
    [v5 setCompletionHandler:0];
  }
  if (![WeakRetained geoLocationEnforced])
  {
    if (a2 == -1) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_8;
  }
  if (a2 == -1)
  {
LABEL_19:
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:WeakRetained selector:sel__locationAuthorizationStatusDidChange_ name:*MEMORY[0x1E4FB5248] object:0];

    [WeakRetained setTargetResponder:*(void *)(a1 + 32)];
    [WeakRetained setCompletionHandler:*(void *)(a1 + 40)];
    objc_storeWeak(&_pendingInstance, WeakRetained);
    uint64_t v28 = [MEMORY[0x1E4FB50C8] defaultLocationManager];
    objc_msgSend(v28, "requestAuthorizationWithForcedPrompt:", objc_msgSend(WeakRetained, "geoLocationEnforced"));

    v29 = +[VUIMetricsController sharedInstance];
    v30 = [WeakRetained dialogMetrics];
    [v29 recordDialog:v30];

    goto LABEL_29;
  }
  if (a2 || ([WeakRetained forcesSystemPrompt] & 1) != 0)
  {
LABEL_16:
    if (![WeakRetained geoLocationEnforced]
      || (int v26 = [WeakRetained forcesSystemPrompt], a2)
      || !v26)
    {
      if (!*(void *)(a1 + 40)) {
        goto LABEL_29;
      }
      if (_os_feature_enabled_impl())
      {
        [WeakRetained _continueWithSuccess:a2 == 1 targetResponder:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
        goto LABEL_29;
      }
      v31 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_28:
      v31();
      goto LABEL_29;
    }
    goto LABEL_19;
  }
LABEL_8:
  uint64_t v7 = [WeakRetained settingsURL];
  if (!v7)
  {
LABEL_26:
    uint64_t v32 = *(void *)(a1 + 40);
    if (!v32) {
      goto LABEL_29;
    }
    v31 = *(void (**)(void))(v32 + 16);
    goto LABEL_28;
  }
  id v8 = (void *)v7;
  uint64_t v9 = [WeakRetained settingsPromptTitle];
  if (!v9)
  {
LABEL_25:

    goto LABEL_26;
  }
  id v10 = (void *)v9;
  uint64_t v11 = [WeakRetained settingsPromptMessage];
  if (!v11)
  {

    goto LABEL_25;
  }
  id v12 = (void *)v11;
  uint64_t v13 = [WeakRetained settingsPromptButtonTitle];

  if (!v13) {
    goto LABEL_26;
  }
  id v14 = [WeakRetained settingsPromptTitle];
  id v15 = [WeakRetained settingsPromptMessage];
  id v16 = +[VUIAlertController vui_alertControllerWithTitle:v14 message:v15 preferredStyle:1];

  id v17 = [WeakRetained settingsPromptButtonTitle];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __72__VUIActionLocationPrompt_performWithTargetResponder_completionHandler___block_invoke_3;
  v33[3] = &unk_1E6DF8C08;
  v33[4] = WeakRetained;
  v18 = +[VUIAlertAction vui_actionWithTitle:v17 style:0 handler:v33];

  uint64_t v19 = [WeakRetained settingsPromptCancelTitle];
  v20 = +[VUIAlertAction vui_actionWithTitle:v19 style:1 handler:0];

  objc_msgSend(v16, "vui_addAction:", v18);
  objc_msgSend(v16, "vui_addAction:", v20);
  uint64_t v21 = +[VUIInterfaceFactory sharedInstance];
  v22 = [v21 controllerPresenter];

  objc_msgSend(v16, "vui_presentAlertFromPresentingController:animated:completion:", v22, 1, 0);
  uint64_t v23 = +[VUIMetricsController sharedInstance];
  v24 = [WeakRetained dialogMetrics];
  [v23 recordDialog:v24];

  uint64_t v25 = *(void *)(a1 + 40);
  if (v25) {
    (*(void (**)(uint64_t, void))(v25 + 16))(v25, 0);
  }

LABEL_29:
}

void __72__VUIActionLocationPrompt_performWithTargetResponder_completionHandler___block_invoke_3(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v2 = [*(id *)(a1 + 32) settingsURL];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (void)_continueWithSuccess:(BOOL)a3 targetResponder:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v13 = a4;
  id v8 = (void (**)(id, BOOL))a5;
  if (v8)
  {
    if (v6)
    {
      uint64_t v9 = [(VUIActionLocationPrompt *)self successAction];

      if (v9)
      {
        uint64_t v10 = [(VUIActionLocationPrompt *)self successAction];
LABEL_7:
        id v12 = (void *)v10;
        +[VUIApplicationRouter invokeAction:v10 targetResponder:v13 completion:v8];

        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v11 = [(VUIActionLocationPrompt *)self failureAction];

      if (v11)
      {
        uint64_t v10 = [(VUIActionLocationPrompt *)self failureAction];
        goto LABEL_7;
      }
    }
    v8[2](v8, v6);
  }
LABEL_9:
}

- (void)_locationAuthorizationStatusDidChange:(id)a3
{
  id v11 = a3;
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  if (self->_completionHandler)
  {
    if (_os_feature_enabled_impl())
    {
      id v5 = [v11 userInfo];
      BOOL v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB5258]];
      int v7 = [v6 intValue];

      id v8 = [(VUIActionLocationPrompt *)self targetResponder];
      [(VUIActionLocationPrompt *)self _continueWithSuccess:v7 == 1 targetResponder:v8 completion:self->_completionHandler];
    }
    else
    {
      completionHandler = (void (**)(id, BOOL))self->_completionHandler;
      if (!completionHandler) {
        goto LABEL_7;
      }
      completionHandler[2](completionHandler, !self->_geoLocationEnforced);
    }
    id v10 = self->_completionHandler;
    self->_completionHandler = 0;
  }
LABEL_7:
}

+ (id)_actionWithDictionary:(id)a3 appContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 count])
  {
    id v8 = 0;
    goto LABEL_7;
  }
  int v7 = objc_msgSend(v5, "vui_stringForKey:", @"controllerRef");
  if (v7)
  {

LABEL_6:
    id v10 = +[VUIDocumentDataSource documentDataSourceWithDictionary:v5];
    id v8 = [[VUIActionNavigate alloc] initWithDocument:v10 appContext:v6];

    goto LABEL_7;
  }
  uint64_t v9 = objc_msgSend(v5, "vui_stringForKey:", @"documentRef");

  if (v9) {
    goto LABEL_6;
  }
  id v8 = +[VUIAction actionWithDictionary:v5 appContext:v6];
LABEL_7:

  return v8;
}

- (UIResponder)targetResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetResponder);
  return (UIResponder *)WeakRetained;
}

- (void)setTargetResponder:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)geoLocationEnforced
{
  return self->_geoLocationEnforced;
}

- (void)setGeoLocationEnforced:(BOOL)a3
{
  self->_geoLocationEnforced = a3;
}

- (BOOL)forcesSystemPrompt
{
  return self->_forcesSystemPrompt;
}

- (void)setForcesSystemPrompt:(BOOL)a3
{
  self->_forcesSystemPrompt = a3;
}

- (VUIAction)successAction
{
  return self->_successAction;
}

- (void)setSuccessAction:(id)a3
{
}

- (VUIAction)failureAction
{
  return self->_failureAction;
}

- (void)setFailureAction:(id)a3
{
}

- (NSDictionary)dialogMetrics
{
  return self->_dialogMetrics;
}

- (void)setDialogMetrics:(id)a3
{
}

- (NSString)settingsPromptTitle
{
  return self->_settingsPromptTitle;
}

- (void)setSettingsPromptTitle:(id)a3
{
}

- (NSString)settingsPromptMessage
{
  return self->_settingsPromptMessage;
}

- (void)setSettingsPromptMessage:(id)a3
{
}

- (NSString)settingsPromptButtonTitle
{
  return self->_settingsPromptButtonTitle;
}

- (void)setSettingsPromptButtonTitle:(id)a3
{
}

- (NSString)settingsPromptCancelTitle
{
  return self->_settingsPromptCancelTitle;
}

- (void)setSettingsPromptCancelTitle:(id)a3
{
}

- (NSURL)settingsURL
{
  return self->_settingsURL;
}

- (void)setSettingsURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsURL, 0);
  objc_storeStrong((id *)&self->_settingsPromptCancelTitle, 0);
  objc_storeStrong((id *)&self->_settingsPromptButtonTitle, 0);
  objc_storeStrong((id *)&self->_settingsPromptMessage, 0);
  objc_storeStrong((id *)&self->_settingsPromptTitle, 0);
  objc_storeStrong((id *)&self->_dialogMetrics, 0);
  objc_storeStrong((id *)&self->_failureAction, 0);
  objc_storeStrong((id *)&self->_successAction, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_targetResponder);
}

@end