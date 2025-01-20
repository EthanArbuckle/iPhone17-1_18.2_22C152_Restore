@interface BFFFinishSetupAppleIDController
+ (id)finishSetupAppleIDController;
- (BYFlowSkipController)flowSkipController;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (id)completion;
- (id)viewControllerWithCompletion:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setFlowSkipController:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4;
- (void)signInControllerDidCancel:(id)a3;
@end

@implementation BFFFinishSetupAppleIDController

+ (id)finishSetupAppleIDController
{
  v2 = objc_alloc_init(BFFFinishSetupAppleIDController);
  return v2;
}

- (id)viewControllerWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(BFFFinishSetupAppleIDController *)self setCompletion:a3];
  v4 = (AAUISignInController *)objc_alloc_init(MEMORY[0x263F25D40]);
  signInController = self->_signInController;
  self->_signInController = v4;

  v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_signInController;
    int v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_21FF9E000, v6, OS_LOG_TYPE_DEFAULT, "created signInController %@", (uint8_t *)&v12, 0xCu);
  }

  [(AAUISignInController *)self->_signInController setDelegate:self];
  objc_storeStrong((id *)&self->_selfReference, self);
  id v8 = (id)[(AAUISignInController *)self->_signInController view];
  v9 = [(AAUISignInController *)self->_signInController viewControllers];
  v10 = [v9 firstObject];

  return v10;
}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v7 = [a4 objectForKeyedSubscript:*MEMORY[0x263F26D28]];
  int v8 = [v7 success];
  v9 = _BYLoggingFacility();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FF9E000, v10, OS_LOG_TYPE_DEFAULT, "Sign-in succeeded!", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = _BYIsInternalInstall();
    uint64_t v20 = [v7 error];
    v21 = (void *)v20;
    if (v19)
    {
      int v22 = 0;
      v23 = (void *)v20;
    }
    else if (v20)
    {
      v24 = NSString;
      uint64_t v19 = [v7 error];
      v4 = [(id)v19 domain];
      v5 = [v7 error];
      v23 = [v24 stringWithFormat:@"<Error domain: %@, code %ld>", v4, objc_msgSend(v5, "code")];
      int v22 = 1;
    }
    else
    {
      int v22 = 0;
      v23 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v27 = v23;
    _os_log_error_impl(&dword_21FF9E000, v10, OS_LOG_TYPE_ERROR, "Sign-in failed: %{public}@", buf, 0xCu);
    if (v22)
    {
    }
  }

  v11 = [(BFFFinishSetupAppleIDController *)self flowSkipController];
  uint64_t v12 = *MEMORY[0x263F67F80];
  [v11 didCompleteFlow:*MEMORY[0x263F67F80]];

  CFPreferencesSetValue(@"AppleIDPB10Presented", (CFPropertyListRef)*MEMORY[0x263EFFB40], (CFStringRef)*MEMORY[0x263F67FC0], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  v13 = [(BFFFinishSetupAppleIDController *)self paneFeatureAnalyticsManager];
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "success"));
  [v13 recordActionWithValue:v14 forFeature:14];

  completion = (void (**)(id, void, void *))self->_completion;
  if (completion)
  {
    uint64_t v25 = v12;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    completion[2](completion, 0, v16);

    id v17 = self->_completion;
    self->_completion = 0;
  }
  selfReference = self->_selfReference;
  self->_selfReference = 0;
}

- (void)signInControllerDidCancel:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    signInController = self->_signInController;
    *(_DWORD *)buf = 138412290;
    v15 = signInController;
    _os_log_impl(&dword_21FF9E000, v4, OS_LOG_TYPE_DEFAULT, "signInControllerDidCancel: %@", buf, 0xCu);
  }

  v6 = [(BFFFinishSetupAppleIDController *)self flowSkipController];
  uint64_t v7 = *MEMORY[0x263F67F80];
  [v6 didCompleteFlow:*MEMORY[0x263F67F80]];

  CFPreferencesSetValue(@"AppleIDPB10Presented", (CFPropertyListRef)*MEMORY[0x263EFFB40], (CFStringRef)*MEMORY[0x263F67FC0], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  int v8 = [(BFFFinishSetupAppleIDController *)self paneFeatureAnalyticsManager];
  [v8 recordActionWithValue:MEMORY[0x263EFFA80] forFeature:14];

  completion = (void (**)(id, uint64_t, void *))self->_completion;
  if (completion)
  {
    uint64_t v13 = v7;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    completion[2](completion, 2, v10);

    id v11 = self->_completion;
    self->_completion = 0;
  }
  selfReference = self->_selfReference;
  self->_selfReference = 0;
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_flowSkipController, 0);
  objc_storeStrong((id *)&self->_signInController, 0);
  objc_storeStrong((id *)&self->_selfReference, 0);
}

@end