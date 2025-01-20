@interface WBSTranslationConsentAlertHelper
- (WBSTranslationConsentAlertHelperDelegate)delegate;
- (id)consentAlertForType:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)_callCompletionHandlerIfNeededWithConsent:(BOOL)a3;
- (void)_enableTranslation:(id)a3;
- (void)_notNow:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WBSTranslationConsentAlertHelper

- (id)consentAlertForType:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  objc_initWeak(location, self);
  v7 = (void *)MEMORY[0x1AD115160](v6);
  id consentCompletionHandler = self->_consentCompletionHandler;
  self->_id consentCompletionHandler = v7;

  v9 = (void *)MEMORY[0x1E4F42728];
  v10 = WBSTranslationAlertTitleStringForType((void *)a3);
  v11 = WBSTranslationDetailStringForType((void *)a3);
  v12 = [v9 alertControllerWithTitle:v10 message:v11 imageNamed:@"alert-translation" preferredStyle:1];

  v13 = @"ReportTranslationProblemAlert";
  if (!a3) {
    v13 = @"EnableTranslationAlert";
  }
  v14 = v13;
  v15 = [v12 view];
  [v15 setAccessibilityIdentifier:v14];

  v16 = (void *)MEMORY[0x1E4F42720];
  v17 = WBSTranslationAlertAllowButtonTitleForType((void *)a3);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __78__WBSTranslationConsentAlertHelper_consentAlertForType_withCompletionHandler___block_invoke;
  v29[3] = &unk_1E5E456E8;
  v29[4] = self;
  v18 = [v16 actionWithTitle:v17 style:0 handler:v29];

  v19 = (void *)MEMORY[0x1E4F42720];
  v20 = _WBSLocalizedString();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __78__WBSTranslationConsentAlertHelper_consentAlertForType_withCompletionHandler___block_invoke_2;
  v27[3] = &unk_1E5E45710;
  objc_copyWeak(v28, location);
  v28[1] = (id)a3;
  v21 = [v19 actionWithTitle:v20 style:0 handler:v27];

  v22 = (void *)MEMORY[0x1E4F42720];
  v23 = WBSTranslationAlertDeclineButtonTitleForType((void *)a3);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __78__WBSTranslationConsentAlertHelper_consentAlertForType_withCompletionHandler___block_invoke_3;
  v26[3] = &unk_1E5E456E8;
  v26[4] = self;
  v24 = [v22 actionWithTitle:v23 style:1 handler:v26];

  [v12 addAction:v18];
  [v12 addAction:v21];
  [v12 addAction:v24];
  objc_storeWeak((id *)&self->_currentlyPresentedViewController, v12);

  objc_destroyWeak(v28);
  objc_destroyWeak(location);

  return v12;
}

uint64_t __78__WBSTranslationConsentAlertHelper_consentAlertForType_withCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callCompletionHandlerIfNeededWithConsent:1];
}

void __78__WBSTranslationConsentAlertHelper_consentAlertForType_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v18 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 3);
    if (objc_opt_respondsToSelector())
    {
      v4 = [v3 translationConsentAlertHelperViewControllerToPresentDetailsFrom:v18];
      id v5 = objc_alloc(MEMORY[0x1E4F83AE8]);
      id v6 = WBSTranslationLearnMoreTitleForType(*(void **)(a1 + 40));
      v7 = (void *)[v5 initWithTitle:v6];

      v8 = [v7 headerView];
      LODWORD(v9) = 1036831949;
      [v8 setTitleHyphenationFactor:v9];

      v10 = [v7 presentationController];
      [v10 setDelegate:v18];

      v11 = WBSTranslationLearnMoreBodyTextForType(*(void **)(a1 + 40));
      [v7 addSectionWithHeader:0 content:v11];

      v12 = [MEMORY[0x1E4F83A80] boldButton];
      v13 = WBSTranslationAlertAllowButtonTitleForType(*(void **)(a1 + 40));
      [v12 setTitle:v13 forState:0];

      [v12 addTarget:v18 action:sel__enableTranslation_ forControlEvents:64];
      v14 = [v7 buttonTray];
      [v14 addButton:v12];

      v15 = [MEMORY[0x1E4F83AB8] linkButton];
      v16 = WBSTranslationAlertDeclineButtonTitleForType(*(void **)(a1 + 40));
      [v15 setTitle:v16 forState:0];

      [v15 addTarget:v18 action:sel__notNow_ forControlEvents:64];
      v17 = [v7 buttonTray];
      [v17 addButton:v15];

      objc_storeWeak(v18 + 1, v7);
      [v4 presentViewController:v7 animated:1 completion:0];
    }
    else
    {
      [v18 _callCompletionHandlerIfNeededWithConsent:0];
    }

    WeakRetained = v18;
  }
}

uint64_t __78__WBSTranslationConsentAlertHelper_consentAlertForType_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callCompletionHandlerIfNeededWithConsent:0];
}

- (void)_callCompletionHandlerIfNeededWithConsent:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentlyPresentedViewController);
  [WeakRetained dismissViewControllerAnimated:1 completion:0];

  id consentCompletionHandler = (void (**)(id, BOOL))self->_consentCompletionHandler;
  if (consentCompletionHandler)
  {
    consentCompletionHandler[2](consentCompletionHandler, v3);
    id v7 = self->_consentCompletionHandler;
    self->_id consentCompletionHandler = 0;
  }
}

- (void)_enableTranslation:(id)a3
{
}

- (void)_notNow:(id)a3
{
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (WBSTranslationConsentAlertHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSTranslationConsentAlertHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_consentCompletionHandler, 0);
  objc_destroyWeak((id *)&self->_currentlyPresentedViewController);
}

@end