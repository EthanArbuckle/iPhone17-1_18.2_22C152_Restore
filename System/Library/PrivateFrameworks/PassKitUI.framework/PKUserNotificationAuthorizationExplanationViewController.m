@interface PKUserNotificationAuthorizationExplanationViewController
- (BOOL)isPresentingNotificationAuthorizationPrompt;
- (PKUserNotificationAuthorizationExplanationViewController)initWithController:(id)a3 contentType:(unint64_t)a4 context:(int64_t)a5 dataProvider:(id)a6;
- (PKUserNotificationAuthorizationExplanationViewController)initWithController:(id)a3 context:(int64_t)a4 dataProvider:(id)a5;
- (id)_analyticsPartialEventDictionaryWithButtonTag:(id)a3 pageTag:(id)a4;
- (id)nextStepHandler;
- (unint64_t)_preflightStatus;
- (void)_beginReportingIfNecessary;
- (void)_endReportingIfNecessary;
- (void)_loadContentFromMobileAssets;
- (void)_reportContinueButtonTapped;
- (void)_reportNotNowButtonTapped;
- (void)_reportNotificationAuthorizationButtonTapped:(BOOL)a3;
- (void)_reportNotificationPromptDidAppear;
- (void)_reportViewDidAppear;
- (void)_setPreflightStatus:(unint64_t)a3;
- (void)dealloc;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)loadView;
- (void)preflightWithCompletion:(id)a3;
- (void)setNextStepHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PKUserNotificationAuthorizationExplanationViewController

- (PKUserNotificationAuthorizationExplanationViewController)initWithController:(id)a3 context:(int64_t)a4 dataProvider:(id)a5
{
  return [(PKUserNotificationAuthorizationExplanationViewController *)self initWithController:a3 contentType:0 context:a4 dataProvider:a5];
}

- (PKUserNotificationAuthorizationExplanationViewController)initWithController:(id)a3 contentType:(unint64_t)a4 context:(int64_t)a5 dataProvider:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKUserNotificationAuthorizationExplanationViewController;
  v13 = [(PKExplanationViewController *)&v21 initWithContext:a5];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_controller, a3);
    objc_storeStrong((id *)&v14->_dataProvider, a6);
    v14->_contentTypeToDisplay = a4;
    if (a4 <= 6) {
      v15 = (NSString *)**((id **)&unk_1E59D7790 + a4);
    }
    productType = v14->_productType;
    v14->_productType = v15;

    v14->_didBeginWalletSettingsSubject = 0;
    v14->_isPresentingNotificationAuthorizationPrompt = 0;
    v14->_contentLock._os_unfair_lock_opaque = 0;
    v14->_statusLock._os_unfair_lock_opaque = 0;
    switch(a5)
    {
      case 0:
        v17 = (id *)MEMORY[0x1E4F866A8];
        goto LABEL_10;
      case 4:
        v17 = (id *)MEMORY[0x1E4F86698];
        goto LABEL_10;
      case 3:
        v17 = (id *)MEMORY[0x1E4F866A0];
LABEL_10:
        v18 = (NSString *)*v17;
        referralSource = v14->_referralSource;
        v14->_referralSource = v18;

        break;
    }
  }

  return v14;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKUserNotificationAuthorizationExplanationViewController;
  [(PKUserNotificationAuthorizationExplanationViewController *)&v4 viewDidAppear:a3];
  [(PKUserNotificationAuthorizationExplanationViewController *)self _beginReportingIfNecessary];
  [(PKUserNotificationAuthorizationExplanationViewController *)self _reportViewDidAppear];
}

- (void)loadView
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)PKUserNotificationAuthorizationExplanationViewController;
  [(PKExplanationViewController *)&v23 loadView];
  if (![(PKUserNotificationAuthorizationExplanationViewController *)self _preflightStatus])
  {
    v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[PKUserNotificationAuthorizationExplanationViewController loadView]";
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Warning - %s loading view before preflight is called. Preflighting now, may cause hang if MobileAssets is slow to respond", buf, 0xCu);
    }

    [(PKUserNotificationAuthorizationExplanationViewController *)self _loadContentFromMobileAssets];
  }
  os_unfair_lock_lock(&self->_contentLock);
  title = self->_title;
  body = self->_body;
  continueString = self->_continueString;
  cgExplanationImage = self->_cgExplanationImage;
  v8 = self->_notNowString;
  v9 = continueString;
  v22 = body;
  v10 = title;
  os_unfair_lock_unlock(&self->_contentLock);
  [(PKExplanationViewController *)self setShowCancelButton:0];
  id v11 = [(PKExplanationViewController *)self explanationView];
  [v11 setTitleText:v10];
  [v11 setBodyText:v22];
  [v11 setShowPrivacyView:0];
  id v12 = PKProvisioningSecondaryBackgroundColor();
  [v11 setTopBackgroundColor:v12];

  [v11 setImageIgnoresTopSafeArea:1];
  [v11 setForceShowSetupLaterButton:1];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:cgExplanationImage];
  [v11 setImage:v13];
  v14 = [v11 imageView];
  [v14 setContentMode:1];

  v15 = [(PKUserNotificationAuthorizationExplanationViewController *)self view];
  [v15 bounds];
  CGFloat v16 = CGRectGetHeight(v27) * 0.5;

  [v11 setMaxImageHeight:v16];
  v17 = [v11 dockView];
  v18 = [v17 primaryButton];
  v19 = v9;
  [v18 setTitle:v9 forState:0];

  v20 = [v17 footerView];
  [v20 setForceShowSetupLaterButton:1];
  [v20 setManualEntryButton:0];
  objc_super v21 = [v20 setupLaterButton];
  [v21 setTitle:v8 forState:0];

  [(PKUserNotificationAuthorizationController *)self->_controller setPresentedNotificationAuthorizationPromptShown];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKUserNotificationAuthorizationExplanationViewController;
  [(PKUserNotificationAuthorizationExplanationViewController *)&v6 viewDidDisappear:a3];
  nextStepHandler = (void (**)(void))self->_nextStepHandler;
  if (nextStepHandler)
  {
    nextStepHandler[2]();
    id v5 = self->_nextStepHandler;
    self->_nextStepHandler = 0;
  }
}

- (void)dealloc
{
  [(PKUserNotificationAuthorizationExplanationViewController *)self _endReportingIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)PKUserNotificationAuthorizationExplanationViewController;
  [(PKUserNotificationAuthorizationExplanationViewController *)&v3 dealloc];
}

- (void)preflightWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, BOOL))a3;
  unint64_t v5 = [(PKUserNotificationAuthorizationExplanationViewController *)self _preflightStatus];
  if (v5)
  {
    if (v4) {
      v4[2](v4, v5 == 1);
    }
  }
  else
  {
    [(PKUserNotificationAuthorizationExplanationViewController *)self _setPreflightStatus:2];
    objc_super v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__PKUserNotificationAuthorizationExplanationViewController_preflightWithCompletion___block_invoke;
    v7[3] = &unk_1E59CAD18;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);
  }
}

void __84__PKUserNotificationAuthorizationExplanationViewController_preflightWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadContentFromMobileAssets];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__PKUserNotificationAuthorizationExplanationViewController_preflightWithCompletion___block_invoke_2;
  v3[3] = &unk_1E59CAD18;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __84__PKUserNotificationAuthorizationExplanationViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setPreflightStatus:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    objc_super v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_loadContentFromMobileAssets
{
  id v25 = +[PKMANotificationAuthorizationAssetManager sharedInstance];
  os_unfair_lock_lock(&self->_contentLock);
  objc_super v3 = [v25 notificationAuthorizationString:@"NOTIFICATIONS_CONTINUE"];
  continueString = self->_continueString;
  self->_continueString = v3;

  unint64_t v5 = [v25 notificationAuthorizationString:@"NOTIFICATIONS_NOT_NOW"];
  notNowString = self->_notNowString;
  self->_notNowString = v5;

  switch(self->_contentTypeToDisplay)
  {
    case 0uLL:
      v7 = [v25 notificationAuthorizationString:@"NOTIFICATIONS_TITLE_GENERIC"];
      title = self->_title;
      self->_title = v7;

      v9 = @"NOTIFICATIONS_BODY_GENERIC";
      goto LABEL_8;
    case 1uLL:
      v10 = [v25 notificationAuthorizationString:@"NOTIFICATIONS_TITLE_APPLE_CARD"];
      id v11 = self->_title;
      self->_title = v10;

      v9 = @"NOTIFICATIONS_BODY_APPLE_CARD";
      goto LABEL_8;
    case 2uLL:
      id v12 = [v25 notificationAuthorizationString:@"NOTIFICATIONS_TITLE_TRANSIT"];
      v13 = self->_title;
      self->_title = v12;

      v9 = @"NOTIFICATIONS_BODY_TRANSIT";
      goto LABEL_8;
    case 3uLL:
      v14 = [v25 notificationAuthorizationString:@"NOTIFICATIONS_TITLE_IDENTITY"];
      v15 = self->_title;
      self->_title = v14;

      v9 = @"NOTIFICATIONS_BODY_IDENTITY";
      goto LABEL_8;
    case 4uLL:
      CGFloat v16 = [v25 notificationAuthorizationString:@"NOTIFICATIONS_TITLE_PAYMENT_PASS"];
      v17 = self->_title;
      self->_title = v16;

      v9 = @"NOTIFICATIONS_BODY_PAYMENT_PASS";
      goto LABEL_8;
    case 5uLL:
      v18 = [v25 notificationAuthorizationString:@"NOTIFICATIONS_TITLE_BOARDING_PASS"];
      v19 = self->_title;
      self->_title = v18;

      v9 = @"NOTIFICATIONS_BODY_BOARDING_PASS";
LABEL_8:
      v20 = [v25 notificationAuthorizationString:v9];
      goto LABEL_9;
    case 6uLL:
      PKLocalizedCocoonString(&cfstr_EnrollInNotifi.isa);
      objc_super v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      v24 = self->_title;
      self->_title = v23;

      PKLocalizedCocoonString(&cfstr_EnrollInNotifi_0.isa);
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      body = self->_body;
      self->_body = v20;

      break;
    default:
      break;
  }
  v22 = [MEMORY[0x1E4F1CA20] currentLocale];
  self->_cgExplanationImage = (CGImage *)[v25 notificationAuthorizationImageForLocale:v22];

  os_unfair_lock_unlock(&self->_contentLock);
}

- (unint64_t)_preflightStatus
{
  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  unint64_t preflightStatus = self->_preflightStatus;
  os_unfair_lock_unlock(p_statusLock);
  return preflightStatus;
}

- (void)_setPreflightStatus:(unint64_t)a3
{
  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  self->_unint64_t preflightStatus = a3;

  os_unfair_lock_unlock(p_statusLock);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  [(PKUserNotificationAuthorizationExplanationViewController *)self _reportContinueButtonTapped];
  [(PKUserNotificationAuthorizationExplanationViewController *)self _reportNotificationPromptDidAppear];
  self->_isPresentingNotificationAuthorizationPrompt = 1;
  controller = self->_controller;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__PKUserNotificationAuthorizationExplanationViewController_explanationViewDidSelectContinue___block_invoke;
  v5[3] = &unk_1E59CDF18;
  v5[4] = self;
  [(PKUserNotificationAuthorizationController *)controller requestNotificationAuthorizationWithCompletion:v5];
}

void __93__PKUserNotificationAuthorizationExplanationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __93__PKUserNotificationAuthorizationExplanationViewController_explanationViewDidSelectContinue___block_invoke_2;
  v2[3] = &unk_1E59CDA78;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __93__PKUserNotificationAuthorizationExplanationViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __93__PKUserNotificationAuthorizationExplanationViewController_explanationViewDidSelectContinue___block_invoke_3;
  v3[3] = &unk_1E59CDA78;
  v3[4] = v1;
  char v4 = *(unsigned char *)(a1 + 40);
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __93__PKUserNotificationAuthorizationExplanationViewController_explanationViewDidSelectContinue___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _reportNotificationAuthorizationButtonTapped:*(unsigned __int8 *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 1144) = 0;
  return result;
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  [(PKUserNotificationAuthorizationExplanationViewController *)self _reportNotNowButtonTapped];

  [(PKUserNotificationAuthorizationExplanationViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_beginReportingIfNecessary
{
  if (!self->_didBeginWalletSettingsSubject && self->_referralSource == (NSString *)*MEMORY[0x1E4F86698])
  {
    self->_didBeginWalletSettingsSubject = 1;
    [MEMORY[0x1E4F843E0] beginSubjectReporting:*MEMORY[0x1E4F87058]];
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_referralSource == (NSString *)*MEMORY[0x1E4F86698]) {
    [MEMORY[0x1E4F843E0] endSubjectReporting:*MEMORY[0x1E4F87058]];
  }
}

- (void)_reportViewDidAppear
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v6 setObject:*MEMORY[0x1E4F864A0] forKey:*MEMORY[0x1E4F86308]];
  [v6 setObject:*MEMORY[0x1E4F866B0] forKey:*MEMORY[0x1E4F86730]];
  [v6 safelySetObject:self->_productType forKey:*MEMORY[0x1E4F867D0]];
  [v6 safelySetObject:self->_referralSource forKey:*MEMORY[0x1E4F86B38]];
  char v3 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v4 = *MEMORY[0x1E4F87058];
  unint64_t v5 = (void *)[v6 copy];
  [v3 subject:v4 sendEvent:v5];
}

- (void)_reportNotificationPromptDidAppear
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v3 = *MEMORY[0x1E4F87058];
  uint64_t v4 = *MEMORY[0x1E4F86730];
  v7[0] = *MEMORY[0x1E4F86308];
  v7[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F86688];
  v8[0] = *MEMORY[0x1E4F864A0];
  v8[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 subject:v3 sendEvent:v6];
}

- (void)_reportContinueButtonTapped
{
  id v2 = [(PKUserNotificationAuthorizationExplanationViewController *)self _analyticsPartialEventDictionaryWithButtonTag:*MEMORY[0x1E4F861B8] pageTag:*MEMORY[0x1E4F866B0]];
  [MEMORY[0x1E4F843E0] subject:*MEMORY[0x1E4F87058] sendEvent:v2];
}

- (void)_reportNotNowButtonTapped
{
  id v2 = [(PKUserNotificationAuthorizationExplanationViewController *)self _analyticsPartialEventDictionaryWithButtonTag:*MEMORY[0x1E4F86680] pageTag:*MEMORY[0x1E4F866B0]];
  [MEMORY[0x1E4F843E0] subject:*MEMORY[0x1E4F87058] sendEvent:v2];
}

- (void)_reportNotificationAuthorizationButtonTapped:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F86068];
  if (!a3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F862A8];
  }
  id v4 = [(PKUserNotificationAuthorizationExplanationViewController *)self _analyticsPartialEventDictionaryWithButtonTag:*v3 pageTag:*MEMORY[0x1E4F86688]];
  [MEMORY[0x1E4F843E0] subject:*MEMORY[0x1E4F87058] sendEvent:v4];
}

- (id)_analyticsPartialEventDictionaryWithButtonTag:(id)a3 pageTag:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setObject:*MEMORY[0x1E4F86380] forKeyedSubscript:*MEMORY[0x1E4F86308]];
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F86120]];

  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F86730]];
  v9 = (void *)[v8 copy];

  return v9;
}

- (id)nextStepHandler
{
  return self->_nextStepHandler;
}

- (void)setNextStepHandler:(id)a3
{
}

- (BOOL)isPresentingNotificationAuthorizationPrompt
{
  return self->_isPresentingNotificationAuthorizationPrompt;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nextStepHandler, 0);
  objc_storeStrong((id *)&self->_notNowString, 0);
  objc_storeStrong((id *)&self->_continueString, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_referralSource, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end