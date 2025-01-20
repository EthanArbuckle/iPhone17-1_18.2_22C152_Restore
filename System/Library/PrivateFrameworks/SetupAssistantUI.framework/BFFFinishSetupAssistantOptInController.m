@interface BFFFinishSetupAssistantOptInController
+ (id)finishSetupAssistantOptInController;
- (BFFFinishSetupAssistantOptInController)init;
- (BYFlowSkipController)flowSkipController;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (id)completion;
- (id)viewControllerWithCompletion:(id)a3;
- (void)continueSetup;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setFlowSkipController:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)showLearnMore;
- (void)skipSetup;
@end

@implementation BFFFinishSetupAssistantOptInController

+ (id)finishSetupAssistantOptInController
{
  v2 = objc_alloc_init(BFFFinishSetupAssistantOptInController);
  return v2;
}

- (BFFFinishSetupAssistantOptInController)init
{
  v3.receiver = self;
  v3.super_class = (Class)BFFFinishSetupAssistantOptInController;
  return [(BFFFinishSetupAssistantOptInController *)&v3 init];
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(25, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __86__BFFFinishSetupAssistantOptInController_performExtendedInitializationWithCompletion___block_invoke;
  v7[3] = &unk_26454AC80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __86__BFFFinishSetupAssistantOptInController_performExtendedInitializationWithCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = BYAssistantScreenShouldRunForPHSUpgrade();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    objc_super v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)viewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  [(BFFFinishSetupAssistantOptInController *)self setCompletion:v4];
  if (!self->_enrollmentController)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v5 = (void *)getVTUIEnrollTrainingViewControllerClass_softClass;
    uint64_t v15 = getVTUIEnrollTrainingViewControllerClass_softClass;
    if (!getVTUIEnrollTrainingViewControllerClass_softClass)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __getVTUIEnrollTrainingViewControllerClass_block_invoke;
      v11[3] = &unk_26454AB18;
      v11[4] = &v12;
      __getVTUIEnrollTrainingViewControllerClass_block_invoke((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v12, 8);
    v7 = (VTUIEnrollTrainingViewController *)[[v6 alloc] init:1];
    enrollmentController = self->_enrollmentController;
    self->_enrollmentController = v7;

    [(VTUIEnrollTrainingViewController *)self->_enrollmentController setDelegate:self];
  }
  objc_storeStrong((id *)&self->_selfReference, self);
  v9 = self->_enrollmentController;

  return v9;
}

- (void)continueSetup
{
  v16[1] = *MEMORY[0x263EF8340];
  objc_super v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_21FF9E000, v3, OS_LOG_TYPE_DEFAULT, "Siri setup success", v15, 2u);
  }

  id v4 = [(BFFFinishSetupAssistantOptInController *)self flowSkipController];
  uint64_t v5 = *MEMORY[0x263F67FA0];
  [v4 didCompleteFlow:*MEMORY[0x263F67FA0]];

  id v6 = (const void *)*MEMORY[0x263EFFB40];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263F67FC0];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v9 = (const __CFString *)*MEMORY[0x263EFFE68];
  CFPreferencesSetValue((CFStringRef)*MEMORY[0x263F67F78], (CFPropertyListRef)*MEMORY[0x263EFFB40], (CFStringRef)*MEMORY[0x263F67FC0], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  if (self->_willOfferVoiceTrigger) {
    CFPreferencesSetValue((CFStringRef)*MEMORY[0x263F67F70], v6, v7, v8, v9);
  }
  v10 = [(BFFFinishSetupAssistantOptInController *)self paneFeatureAnalyticsManager];
  [v10 recordActionWithValue:MEMORY[0x263EFFA88] forFeature:7];

  completion = (void (**)(id, void, void *))self->_completion;
  if (completion)
  {
    v16[0] = v5;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    completion[2](completion, 0, v12);

    id v13 = self->_completion;
    self->_completion = 0;
  }
  selfReference = self->_selfReference;
  self->_selfReference = 0;
}

- (void)skipSetup
{
  v18[1] = *MEMORY[0x263EF8340];
  objc_super v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_21FF9E000, v3, OS_LOG_TYPE_DEFAULT, "User chose to skip Siri setup", v17, 2u);
  }

  id v4 = [(BFFFinishSetupAssistantOptInController *)self flowSkipController];
  uint64_t v5 = *MEMORY[0x263F67FA0];
  [v4 didCompleteFlow:*MEMORY[0x263F67FA0]];

  id v6 = (const void *)*MEMORY[0x263EFFB40];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x263F67FC0];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v9 = (const __CFString *)*MEMORY[0x263EFFE68];
  CFPreferencesSetValue((CFStringRef)*MEMORY[0x263F67F78], (CFPropertyListRef)*MEMORY[0x263EFFB40], (CFStringRef)*MEMORY[0x263F67FC0], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  CFPreferencesSetValue((CFStringRef)*MEMORY[0x263F67F70], v6, v7, v8, v9);
  v10 = [(BFFFinishSetupAssistantOptInController *)self paneFeatureAnalyticsManager];
  [v10 recordActionWithValue:MEMORY[0x263EFFA80] forFeature:7];

  completion = (void (**)(id, uint64_t, void *))self->_completion;
  if (completion)
  {
    v18[0] = v5;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    completion[2](completion, 1, v12);

    id v13 = self->_completion;
    self->_completion = 0;
  }
  selfReference = self->_selfReference;
  self->_selfReference = 0;

  uint64_t v15 = [getAFPreferencesClass() sharedPreferences];
  [v15 setDictationIsEnabled:0];

  v16 = [getAFPreferencesClass() sharedPreferences];
  [v16 synchronize];
}

- (void)showLearnMore
{
  uint64_t v7 = 0;
  CFStringRef v8 = &v7;
  uint64_t v9 = 0x2050000000;
  objc_super v3 = (void *)getOBPrivacyPresenterClass_softClass;
  uint64_t v10 = getOBPrivacyPresenterClass_softClass;
  if (!getOBPrivacyPresenterClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getOBPrivacyPresenterClass_block_invoke;
    v6[3] = &unk_26454AB18;
    v6[4] = &v7;
    __getOBPrivacyPresenterClass_block_invoke((uint64_t)v6);
    objc_super v3 = (void *)v8[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);
  uint64_t v5 = [v4 presenterForPrivacySplashWithIdentifier:*MEMORY[0x263F67FB8]];
  [v5 setPresentingViewController:self->_enrollmentController];
  [v5 present];
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
  objc_storeStrong((id *)&self->_enrollmentController, 0);
  objc_storeStrong((id *)&self->_selfReference, 0);
}

@end