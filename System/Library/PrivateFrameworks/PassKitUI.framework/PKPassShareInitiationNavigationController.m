@interface PKPassShareInitiationNavigationController
- (BOOL)interceptableActivityViewController:(id)a3 shouldInterceptActivitySelectionOfType:(id)a4;
- (BOOL)isFromPeopleScreen;
- (BOOL)shouldPromptUserToShare;
- (PKClientShareSecureElementPassViewControllerDelegate)shareDelegate;
- (PKPassShareInitiationNavigationController)initWithSharesController:(id)a3 environment:(unint64_t)a4;
- (id)_activityItemForActivationCode;
- (id)_placeholderActivityItem;
- (unint64_t)_transitionToNextStepIsMockTransition:(BOOL)a3;
- (void)_flowDidCancel;
- (void)_flowDidCancelWithError:(id)a3;
- (void)_flowDidFinishWithSuccess;
- (void)_revokeCreatedShareWithCompletion:(id)a3;
- (void)_sendOverLegacyCarKeyiMessage;
- (void)_sendOverSelectedChannel;
- (void)_sendOveriMessage;
- (void)_sendOveriMessageUsingComposeViewController;
- (void)_transitionToNextStep;
- (void)_transitionToStep:(unint64_t)a3;
- (void)_updateShareActivationOptions;
- (void)interceptableActivityViewController:(id)a3 didFinishWithShare:(BOOL)a4;
- (void)interceptableActivityViewController:(id)a3 didInterceptActivitySelectionOfType:(id)a4;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)passShareIntroductionExplanationViewControllerDidCancel:(id)a3;
- (void)passShareIntroductionExplanationViewControllerDidContinue:(id)a3;
- (void)setIsFromPeopleScreen:(BOOL)a3;
- (void)setShareDelegate:(id)a3;
- (void)setShouldPromptUserToShare:(BOOL)a3;
- (void)shareActivationOverviewViewControllerDidSelectShareCode:(id)a3;
- (void)shareActivityDidFinishWithShare:(BOOL)a3;
- (void)sharePreviewViewControllerDidCancel:(id)a3;
- (void)sharePreviewViewControllerDidContinue:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPassShareInitiationNavigationController

- (PKPassShareInitiationNavigationController)initWithSharesController:(id)a3 environment:(unint64_t)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PKPassShareInitiationNavigationController;
  v8 = [(PKNavigationController *)&v40 init];
  v9 = v8;
  if (v8)
  {
    p_sharesController = (id *)&v8->_sharesController;
    objc_storeStrong((id *)&v8->_sharesController, a3);
    [*p_sharesController prewarmCreateShare];
    v11 = [*p_sharesController pass];
    v12 = [[PKShareInitiationAnalyticsReporter alloc] initWithPass:v11];
    analyticsReporter = v9->_analyticsReporter;
    v9->_analyticsReporter = v12;

    v14 = [PKPassShareInitiationContext alloc];
    v15 = [*p_sharesController baseNewShareForPass];
    uint64_t v16 = [(PKPassShareInitiationContext *)v14 initWithFlow:0 share:v15];
    context = v9->_context;
    v9->_context = (PKPassShareInitiationContext *)v16;

    -[PKPassShareInitiationContext setAuthenticationType:](v9->_context, "setAuthenticationType:", [v11 isCarKeyPass]);
    [(PKPassShareInitiationContext *)v9->_context setEnvironment:a4];
    v18 = v9->_context;
    v19 = [*p_sharesController blockedSharingChannels];
    [(PKPassShareInitiationContext *)v18 setBlockedChannels:v19];

    v20 = v9->_context;
    v21 = [*p_sharesController allowedSharingChannels];
    [(PKPassShareInitiationContext *)v20 setAllowedChannels:v21];

    v22 = [(PKPassShareInitiationContext *)v9->_context allowedChannels];
    uint64_t v23 = *MEMORY[0x1E4F9F380];
    v41[0] = *MEMORY[0x1E4F9F380];
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    int v25 = PKEqualObjects();

    if (v25)
    {
      [(PKPassShareInitiationContext *)v9->_context setChannelBundleIdentifier:v23];
      [(PKPassShareInitiationContext *)v9->_context setFlow:6];
    }
    v26 = (void *)MEMORY[0x1E4F85030];
    v27 = [*p_sharesController pass];
    v28 = [v26 displayInformationForAccessPass:v27 webService:0];

    v29 = v9->_context;
    v30 = [v28 title];
    [(PKPassShareInitiationContext *)v29 setSharePreviewTitle:v30];

    v31 = v9->_context;
    v32 = [v28 subtitle];
    [(PKPassShareInitiationContext *)v31 setSharePreviewSubtitle:v32];

    v33 = v9->_context;
    v34 = [v28 imageURL];
    [(PKPassShareInitiationContext *)v33 setSharePreviewImageURL:v34];

    v35 = v9->_context;
    v36 = (void *)MEMORY[0x1E4FB1818];
    v37 = PKPassKitUIBundle();
    v38 = [v36 imageNamed:@"Generic-Shared-Key" inBundle:v37];
    [(PKPassShareInitiationContext *)v35 setSharePreviewFallbackImage:v38];
  }
  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKPassShareInitiationNavigationController;
  [(PKPassShareInitiationNavigationController *)&v9 viewWillAppear:a3];
  if (!self->_hasAppeared)
  {
    self->_hasAppeared = 1;
    if (([(PKSharedPassSharesController *)self->_sharesController isCrossPlatformSharingEnabled] & 1) == 0)
    {
      v4 = [(PKSharedPassSharesController *)self->_sharesController pass];
      int v5 = [v4 isCarKeyPass];

      if (!v5)
      {
        [(PKPassShareInitiationNavigationController *)self setNavigationBarHidden:1];
        id v7 = [MEMORY[0x1E4F28C58] pkSharingError:7];
        [(PKPassShareInitiationNavigationController *)self _flowDidCancelWithError:v7];

        return;
      }
      [(PKPassShareInitiationContext *)self->_context setFlow:5];
    }
    v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Starting share initiation flow", v8, 2u);
    }

    [(PKPassShareInitiationNavigationController *)self _transitionToNextStep];
  }
}

- (BOOL)shouldPromptUserToShare
{
  return [(PKPassShareInitiationContext *)self->_context flow] != 4;
}

- (void)setShouldPromptUserToShare:(BOOL)a3
{
  if (!a3)
  {
    if ([(PKPassShareInitiationContext *)self->_context flow] == 5)
    {
      v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "ShareInitiation: ignore setShouldPromptUserToShare because using legacy flow", v6, 2u);
      }
    }
    else
    {
      context = self->_context;
      [(PKPassShareInitiationContext *)context setFlow:4];
    }
  }
}

- (void)_transitionToNextStep
{
}

- (unint64_t)_transitionToNextStepIsMockTransition:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(PKPassShareInitiationContext *)self->_context flow];
  unint64_t v6 = v5;
  switch(self->_currentStep)
  {
    case 0uLL:
      if ([(PKPassShareInitiationContext *)self->_context environment] != 2)
      {
        BOOL v9 = 0;
        BOOL v8 = 0;
        BOOL v12 = v6 - 5 >= 2;
        goto LABEL_20;
      }
      BOOL v9 = 0;
      BOOL v8 = 0;
      unint64_t v7 = 1;
      if (!a3) {
        goto LABEL_24;
      }
      break;
    case 1uLL:
      BOOL v9 = 0;
      BOOL v8 = 0;
      BOOL v12 = v5 - 4 >= 3;
LABEL_20:
      if (v12) {
        unint64_t v7 = 2;
      }
      else {
        unint64_t v7 = 3;
      }
      if (!a3) {
        goto LABEL_24;
      }
      break;
    case 2uLL:
      BOOL v9 = 0;
      BOOL v8 = 0;
      unint64_t v7 = 3;
      if (!a3) {
        goto LABEL_24;
      }
      break;
    case 3uLL:
      BOOL v9 = 0;
      BOOL v8 = 0;
      unint64_t v7 = 4;
      if (!a3) {
        goto LABEL_24;
      }
      break;
    case 4uLL:
      v10 = [(PKPassShareInitiationContext *)self->_context composedShare];
      v11 = [v10 activationOptions];

      BOOL v9 = v11 == 0;
      if (v11) {
        unint64_t v7 = 5;
      }
      else {
        unint64_t v7 = 0;
      }
      BOOL v8 = v11 == 0;
      if (!a3) {
        goto LABEL_24;
      }
      break;
    case 5uLL:
    case 6uLL:
      unint64_t v7 = 0;
      if (!a3) {
        goto LABEL_25;
      }
      break;
    default:
      unint64_t v7 = 0;
      BOOL v8 = 0;
      BOOL v9 = 1;
      if (!a3)
      {
LABEL_24:
        if (v8)
        {
LABEL_25:
          [(PKPassShareInitiationNavigationController *)self _flowDidFinishWithSuccess];
        }
        else if (v9)
        {
          v13 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t currentStep = self->_currentStep;
            int v16 = 134217984;
            unint64_t v17 = currentStep;
            _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "ShareInitiation: WARNING: Unablet to determine next step from currentStep: %lu", (uint8_t *)&v16, 0xCu);
          }
        }
        else
        {
          [(PKPassShareInitiationNavigationController *)self _transitionToStep:v7];
        }
      }
      break;
  }
  return v7;
}

- (void)_transitionToStep:(unint64_t)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 6) {
      unint64_t v6 = @"unknown";
    }
    else {
      unint64_t v6 = off_1E59DDFB0[a3];
    }
    *(_DWORD *)buf = 138412290;
    v52 = v6;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Transitioning to step: %@", buf, 0xCu);
  }

  unint64_t currentStep = self->_currentStep;
  self->_unint64_t currentStep = a3;
  if (currentStep <= a3)
  {
    BOOL v8 = [(PKPassShareInitiationNavigationController *)self viewControllers];
    uint64_t v9 = [v8 count];

    switch(a3)
    {
      case 1uLL:
        v10 = [[PKPassShareIntroductionExplanationViewController alloc] initWithSharesController:self->_sharesController context:self->_context delegate:self];
        [(PKShareInitiationAnalyticsReporter *)self->_analyticsReporter sendEventForPage:0 specifics:0];
        int v11 = 1;
        goto LABEL_12;
      case 2uLL:
        BOOL v12 = [PKInterceptableActivityViewController alloc];
        v13 = [(PKPassShareInitiationNavigationController *)self _placeholderActivityItem];
        v50 = v13;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
        v15 = [(PKInterceptableActivityViewController *)v12 initWithItems:v14 peopleSuggestionBundleIds:&unk_1EF2BA230 delegate:self];
        activityViewController = self->_activityViewController;
        self->_activityViewController = v15;

        unint64_t v17 = self->_activityViewController;
        uint64_t v18 = [(PKPassShareInitiationContext *)self->_context blockedChannels];
        [(PKInterceptableActivityViewController *)v17 setExcludedActivityTypes:v18];

        v19 = self->_activityViewController;
        v20 = [(PKPassShareInitiationContext *)self->_context allowedChannels];
        [(PKInterceptableActivityViewController *)v19 setAllowedActivityTypes:v20];

        v10 = self->_activityViewController;
        if ([(PKPassShareInitiationContext *)self->_context environment] == 2)
        {
          v21 = (void **)MEMORY[0x1E4F86B60];
        }
        else if (self->_isFromPeopleScreen)
        {
          v21 = (void **)MEMORY[0x1E4F86B58];
        }
        else
        {
          v21 = (void **)MEMORY[0x1E4F86B50];
        }
        v33 = *v21;
        analyticsReporter = self->_analyticsReporter;
        uint64_t v48 = *MEMORY[0x1E4F86B38];
        v49 = v33;
        v35 = (void *)MEMORY[0x1E4F1C9E8];
        id v36 = v33;
        char v24 = 1;
        v37 = [v35 dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        [(PKShareInitiationAnalyticsReporter *)analyticsReporter sendEventForPage:1 specifics:v37];

        int v11 = 0;
        if (v10) {
          goto LABEL_26;
        }
        return;
      case 3uLL:
        [(PKPassShareInitiationNavigationController *)self _updateShareActivationOptions];
        v22 = [[PKPassSharePreviewViewController alloc] initWithSharesController:self->_sharesController context:self->_context delegate:self];
        previewViewController = self->_previewViewController;
        self->_previewViewController = v22;

        v10 = [[PKNavigationController alloc] initWithRootViewController:self->_previewViewController];
        [(PKShareInitiationAnalyticsReporter *)self->_analyticsReporter sendEventForPage:2 specifics:0];
        int v11 = 0;
LABEL_12:
        char v24 = 1;
        if (!v10) {
          return;
        }
        goto LABEL_26;
      case 4uLL:
        unint64_t v25 = [(PKPassShareInitiationContext *)self->_context flow];
        switch(v25)
        {
          case 6uLL:
            [(PKPassShareInitiationNavigationController *)self _sendOveriMessageUsingComposeViewController];
            break;
          case 5uLL:
            [(PKPassShareInitiationNavigationController *)self _sendOverLegacyCarKeyiMessage];
            break;
          case 1uLL:
            [(PKPassShareInitiationNavigationController *)self _sendOveriMessage];
            break;
          default:
            [(PKPassShareInitiationNavigationController *)self _sendOverSelectedChannel];
            break;
        }
        return;
      case 5uLL:
        v10 = [[PKPassShareActivationOverviewNavigationController alloc] initWithContext:self->_context delegate:self];
        char v24 = 0;
        int v11 = 1;
        if (!v10) {
          return;
        }
        goto LABEL_26;
      case 6uLL:
        v26 = [PKInterceptableActivityViewController alloc];
        v27 = [(PKPassShareInitiationNavigationController *)self _activityItemForActivationCode];
        v47 = v27;
        char v24 = 1;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
        v29 = [(PKInterceptableActivityViewController *)v26 initWithItems:v28 delegate:self];
        v30 = self->_activityViewController;
        self->_activityViewController = v29;

        v31 = self->_activityViewController;
        v32 = [(PKPassShareInitiationContext *)self->_context blockedChannels];
        [(PKInterceptableActivityViewController *)v31 setExcludedActivityTypes:v32];

        v10 = self->_activityViewController;
        int v11 = 0;
        if (!v10) {
          return;
        }
LABEL_26:
        if (v9)
        {
          v38 = [(UIViewController *)self pkui_frontMostViewController];
          if (v38 == self) {
            char v39 = 1;
          }
          else {
            char v39 = v24;
          }
          if ((v39 & 1) == 0)
          {
            [(PKPassShareInitiationNavigationController *)self dismissViewControllerAnimated:1 completion:0];
            objc_super v40 = (PKInterceptableActivityViewController *)v38;
            if (v38 != (PKPassShareInitiationNavigationController *)self->_activityViewController)
            {
              v41 = [(PKPassShareInitiationNavigationController *)v38 presentingViewController];
              v42 = self->_activityViewController;

              if (v41 != v42)
              {
LABEL_35:
                v43 = self;
                goto LABEL_40;
              }
              objc_super v40 = self->_activityViewController;
            }
            self->_activityViewController = 0;

            goto LABEL_35;
          }
        }
        else
        {
          if (v11)
          {
            v46 = v10;
            v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
            [(PKPassShareInitiationNavigationController *)self setViewControllers:v38];
            goto LABEL_41;
          }
          v38 = (PKPassShareInitiationNavigationController *)objc_alloc_init(MEMORY[0x1E4FB1EC0]);
          v45 = v38;
          v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
          [(PKPassShareInitiationNavigationController *)self setViewControllers:v44];
        }
        v43 = v38;
LABEL_40:
        [(PKPassShareInitiationNavigationController *)v43 presentViewController:v10 animated:1 completion:0];
LABEL_41:

        break;
      default:
        return;
    }
  }
}

- (void)_sendOverLegacyCarKeyiMessage
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Sending share over car key IDS imessage channel", buf, 2u);
  }

  sharesController = self->_sharesController;
  unint64_t v5 = [(PKPassShareInitiationContext *)self->_context composedShare];
  unint64_t v6 = [(PKSharedPassSharesController *)sharesController entitlementsForShare:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F84430]);
  BOOL v8 = [(PKSharedPassSharesController *)self->_sharesController pass];
  uint64_t v9 = [v8 paymentPass];
  v10 = (void *)[v7 initWithPaymentPass:v9 entitlements:v6];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__PKPassShareInitiationNavigationController__sendOverLegacyCarKeyiMessage__block_invoke;
  v11[3] = &unk_1E59DDEC8;
  v11[4] = self;
  +[PKSharingMessageExtensionMessageBuilder messageFromSharingRequest:v10 completionHandler:v11];
}

void __74__PKPassShareInitiationNavigationController__sendOverLegacyCarKeyiMessage__block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F350F8];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 1496);
  *(void *)(v6 + 1496) = v5;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1496), "setMessageComposeDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 1496) setMessage:v4];

  objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 presentViewController:*(void *)(*(void *)(a1 + 32) + 1496) animated:1 completion:0];
}

- (void)_sendOveriMessage
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Sending share over imessage extension", (uint8_t *)buf, 2u);
  }

  [(PKPassSharePreviewViewController *)self->_previewViewController setShowHeaderSpinner:1];
  id v4 = [(PKInterceptableActivityViewController *)self->_activityViewController view];
  [v4 setUserInteractionEnabled:0];

  id v5 = [(PKPassShareInitiationContext *)self->_context composedShare];
  uint64_t v6 = [(PKSharedPassSharesController *)self->_sharesController shareableEntitlements];
  [v5 updateDisplayableSharedEntitlementsFromDisplayableEntitlements:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F84840]);
  id v8 = [(PKPassShareInitiationContext *)self->_context composedShare];
  uint64_t v9 = [(PKSharedPassSharesController *)self->_sharesController pass];
  v10 = (void *)[v7 initWithShare:v8 pass:v9];

  objc_initWeak(buf, self);
  int v11 = [(PKSharingAnalyticsReporter *)self->_analyticsReporter sessionToken];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__PKPassShareInitiationNavigationController__sendOveriMessage__block_invoke;
  v12[3] = &unk_1E59DDEF0;
  objc_copyWeak(&v13, buf);
  +[PKSharingMessageExtensionMessageBuilder messageFromInvitation:v10 analyticsSessionToken:v11 completionHandler:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

void __62__PKPassShareInitiationNavigationController__sendOveriMessage__block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained _placeholderActivityItem];
    [v7 setValue:v3];
    id v8 = (void *)v6[191];
    v13[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v8 setItems:v9];

    v10 = (void *)v6[190];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__PKPassShareInitiationNavigationController__sendOveriMessage__block_invoke_2;
    v11[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v12, v4);
    [v10 dismissViewControllerAnimated:1 completion:v11];
    objc_destroyWeak(&v12);
  }
}

void __62__PKPassShareInitiationNavigationController__sendOveriMessage__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained[191] view];
    [v2 setUserInteractionEnabled:1];

    [v4[191] handleInterceptedShareActivity];
    id v3 = v4[190];
    v4[190] = 0;

    WeakRetained = v4;
  }
}

- (void)_sendOveriMessageUsingComposeViewController
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Sending share over imessage using imessage compose VC", (uint8_t *)buf, 2u);
  }

  [(PKPassSharePreviewViewController *)self->_previewViewController setShowHeaderSpinner:1];
  id v4 = [(PKPassShareInitiationContext *)self->_context composedShare];
  id v5 = [(PKSharedPassSharesController *)self->_sharesController shareableEntitlements];
  [v4 updateDisplayableSharedEntitlementsFromDisplayableEntitlements:v5];

  id v6 = objc_alloc(MEMORY[0x1E4F84840]);
  id v7 = [(PKPassShareInitiationContext *)self->_context composedShare];
  id v8 = [(PKSharedPassSharesController *)self->_sharesController pass];
  uint64_t v9 = (void *)[v6 initWithShare:v7 pass:v8];

  objc_initWeak(buf, self);
  v10 = [(PKSharingAnalyticsReporter *)self->_analyticsReporter sessionToken];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__PKPassShareInitiationNavigationController__sendOveriMessageUsingComposeViewController__block_invoke;
  v11[3] = &unk_1E59DDEF0;
  objc_copyWeak(&v12, buf);
  +[PKSharingMessageExtensionMessageBuilder messageFromInvitation:v9 analyticsSessionToken:v10 completionHandler:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);
}

void __88__PKPassShareInitiationNavigationController__sendOveriMessageUsingComposeViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F350F8]);
    id v6 = WeakRetained[187];
    WeakRetained[187] = v5;

    [WeakRetained[187] setMessageComposeDelegate:WeakRetained];
    [WeakRetained[187] setMessage:v3];
    id v7 = objc_msgSend(WeakRetained, "pkui_frontMostViewController");
    id v8 = WeakRetained[187];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __88__PKPassShareInitiationNavigationController__sendOveriMessageUsingComposeViewController__block_invoke_2;
    v9[3] = &unk_1E59CA7D0;
    v9[4] = WeakRetained;
    [v7 presentViewController:v8 animated:1 completion:v9];
  }
}

uint64_t __88__PKPassShareInitiationNavigationController__sendOveriMessageUsingComposeViewController__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1520) setShowHeaderSpinner:0];
}

- (void)_sendOverSelectedChannel
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Sending share over previously selected channel", buf, 2u);
  }

  id v4 = [(PKPassShareInitiationContext *)self->_context composedShare];
  id v5 = [(PKSharedPassSharesController *)self->_sharesController shareableEntitlements];
  [v4 updateDisplayableSharedEntitlementsFromDisplayableEntitlements:v5];

  id v6 = objc_alloc(MEMORY[0x1E4F84840]);
  id v7 = [(PKPassShareInitiationContext *)self->_context composedShare];
  id v8 = [(PKSharedPassSharesController *)self->_sharesController pass];
  uint64_t v9 = (void *)[v6 initWithShare:v7 pass:v8];

  objc_initWeak(location, self);
  *(void *)buf = 0;
  v33 = buf;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__56;
  id v36 = __Block_byref_object_dispose__56;
  id v37 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__56;
  v30[4] = __Block_byref_object_dispose__56;
  id v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__56;
  v28[4] = __Block_byref_object_dispose__56;
  id v29 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke;
  aBlock[3] = &unk_1E59DDF68;
  objc_copyWeak(&v27, location);
  id v10 = v9;
  id v23 = v10;
  char v24 = v30;
  unint64_t v25 = v28;
  v26 = buf;
  int v11 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_4;
  v20[3] = &unk_1E59DDF90;
  objc_copyWeak(&v21, location);
  v20[4] = buf;
  v20[5] = v30;
  v20[6] = v28;
  id v12 = _Block_copy(v20);
  unint64_t v13 = [(PKPassShareInitiationContext *)self->_context authenticationType];
  if (v13)
  {
    if (v13 == 1)
    {
      v14 = PKShareAuthorizationPaymentRequest((PKPartialShareInvitation *)v10);
      v15 = [(PKPassShareInitiationNavigationController *)self view];
      int v16 = [v15 window];
      unint64_t v17 = [v16 windowScene];
      uint64_t v18 = [v17 _sceneIdentifier];

      id v19 = (id)[MEMORY[0x1E4F85000] authorizeForRequest:v14 presentationSceneIdentifier:v18 authHandler:v11 completion:v12];
    }
  }
  else
  {
    [MEMORY[0x1E4F85000] authorizeDeviceOwnerWithAuthHandler:v11 completion:v12];
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v27);
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(location);
}

void __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_2;
  block[3] = &unk_1E59DDF40;
  objc_copyWeak(&v15, (id *)(a1 + 64));
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  long long v13 = *(_OWORD *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 56);
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v15);
}

void __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[189] sendAuthenticationEventForSuccess:1 specifics:0];
    [v3[190] setShowHeaderSpinner:1];
    id v4 = v3[185];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    long long v8 = *(_OWORD *)(a1 + 48);
    long long v11 = *(_OWORD *)(a1 + 64);
    v9[2] = __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_3;
    v9[3] = &unk_1E59DDF18;
    id v7 = (id)v8;
    long long v10 = v8;
    [v4 createShareWithPartialShare:v5 authorization:v6 completion:v9];
  }
}

void __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_3(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[5] + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v19 = v7;

  uint64_t v12 = *(void *)(a1[6] + 8);
  long long v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[7] + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
  id v17 = v9;

  if (v17) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = *(void *)(*(void *)(a1[5] + 8) + 40) != 0;
  }
  (*(void (**)(void, BOOL))(a1[4] + 16))(a1[4], v18);
}

void __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_4(uint64_t a1, char a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[190] setShowHeaderSpinner:0];
    uint64_t v6 = [v5[188] flow];
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v7 || (a2 & 1) != 0)
    {
      if (v6 == 4)
      {
        id v9 = objc_loadWeakRetained(v5 + 194);
        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        long long v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) activationOptions];
        uint64_t v12 = [v11 activationCode];
        [v9 didCreateShareURL:v10 activationCode:v12 error:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

        [v5 _flowDidFinishWithSuccess];
      }
      else if (v7)
      {
        objc_msgSend(v5, "_flowDidCancelWithError:");
      }
      else
      {
        if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
          objc_msgSend(v5[188], "setComposedShare:");
        }
        [v5[188] setDidCreateShare:1];
        long long v13 = [v5 _placeholderActivityItem];
        [v13 setValue:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
        id v14 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) absoluteString];
          int v16 = PKSharingLoggableMailboxAddress();
          *(_DWORD *)buf = 138543362;
          id v23 = v16;
          _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "ShareInitiation: using share url: %{public}@", buf, 0xCu);
        }
        id v17 = v5[191];
        id v21 = v13;
        BOOL v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
        [v17 setItems:v18];

        id v19 = v5[190];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_38;
        v20[3] = &unk_1E59CA7D0;
        v20[4] = v5;
        [v19 dismissViewControllerAnimated:1 completion:v20];
      }
    }
    else
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Auth canceled", buf, 2u);
      }

      [v5[189] sendAuthenticationEventForSuccess:0 specifics:0];
      [v5 _transitionToStep:3];
    }
  }
}

void __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_38(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1528) handleInterceptedShareActivity];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1520);
  *(void *)(v2 + 1520) = 0;
}

- (void)_flowDidCancelWithError:(id)a3
{
  analyticsReporter = self->_analyticsReporter;
  uint64_t v5 = (NSError *)a3;
  [(PKShareInitiationAnalyticsReporter *)analyticsReporter sendDoneEventWithDidShare:0 error:v5 specifics:0];
  uint64_t v6 = self->_analyticsReporter;
  self->_analyticsReporter = 0;

  uint64_t v7 = PKSharingDisplayableError(v5);

  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28C58] pkSharingError:7];
    id v9 = [(PKSharedPassSharesController *)self->_sharesController pass];
    uint64_t v7 = PKSharingDisplayableError(v8, v9);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PKPassShareInitiationNavigationController__flowDidCancelWithError___block_invoke;
  v12[3] = &unk_1E59CA7D0;
  void v12[4] = self;
  id v10 = PKAlertForDisplayableErrorWithHandlers(v7, 0, v12, 0);
  long long v11 = [(UIViewController *)self pkui_frontMostViewController];
  [v11 presentViewController:v10 animated:1 completion:0];
}

uint64_t __69__PKPassShareInitiationNavigationController__flowDidCancelWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flowDidCancel];
}

- (void)_flowDidCancel
{
  [(PKShareInitiationAnalyticsReporter *)self->_analyticsReporter sendDoneEventWithDidShare:0 error:0 specifics:0];
  analyticsReporter = self->_analyticsReporter;
  self->_analyticsReporter = 0;

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PKPassShareInitiationNavigationController__flowDidCancel__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  [(PKPassShareInitiationNavigationController *)self _revokeCreatedShareWithCompletion:v4];
}

void __59__PKPassShareInitiationNavigationController__flowDidCancel__block_invoke(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Flow did cancel", v8, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1552));
  id v4 = *(id **)(a1 + 32);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v4 + 194);
    [v5 didFinishShareWithDidUserShare:0 error:0];
  }
  else
  {
    uint64_t v6 = [v4 presentingViewController];
    uint64_t v7 = v6;
    if (!v6) {
      uint64_t v7 = *(void **)(a1 + 32);
    }
    id v5 = v7;

    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_flowDidFinishWithSuccess
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Flow did finish with success", v10, 2u);
  }

  [(PKShareInitiationAnalyticsReporter *)self->_analyticsReporter sendDoneEventWithDidShare:1 error:0 specifics:0];
  analyticsReporter = self->_analyticsReporter;
  self->_analyticsReporter = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_shareDelegate);
  if (WeakRetained)
  {
    uint64_t v6 = (PKPassShareInitiationNavigationController *)objc_loadWeakRetained((id *)&self->_shareDelegate);
    [(PKPassShareInitiationNavigationController *)v6 didFinishShareWithDidUserShare:1 error:0];
  }
  else
  {
    uint64_t v7 = [(PKPassShareInitiationNavigationController *)self presentingViewController];
    id v8 = (void *)v7;
    if (v7) {
      id v9 = (PKPassShareInitiationNavigationController *)v7;
    }
    else {
      id v9 = self;
    }
    uint64_t v6 = v9;

    [(PKPassShareInitiationNavigationController *)v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_revokeCreatedShareWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(PKPassShareInitiationContext *)self->_context didCreateShare])
  {
    sharesController = self->_sharesController;
    uint64_t v6 = [(PKPassShareInitiationContext *)self->_context composedShare];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__PKPassShareInitiationNavigationController__revokeCreatedShareWithCompletion___block_invoke;
    v7[3] = &unk_1E59CC620;
    id v8 = v4;
    [(PKSharedPassSharesController *)sharesController revokeShare:v6 shouldCascade:0 withCompletion:v7];

    [(PKPassShareInitiationContext *)self->_context setDidCreateShare:0];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

uint64_t __79__PKPassShareInitiationNavigationController__revokeCreatedShareWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateShareActivationOptions
{
  unint64_t v3 = [(PKPassShareInitiationContext *)self->_context flow];
  if (v3 == 5)
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Not setting activation options because legacy car key share", buf, 2u);
    }
  }
  else
  {
    unint64_t v5 = v3;
    uint64_t v6 = [(PKPassShareInitiationContext *)self->_context recipient];
    BOOL v9 = v5 == 1 || v6 != 0 || v5 == 6;

    sharesController = self->_sharesController;
    long long v11 = [(PKPassShareInitiationContext *)self->_context channelBundleIdentifier];
    id v16 = [(PKSharedPassSharesController *)sharesController shareInitiationActivationConfigurationForChannelBundleIdentifier:v11 isRecipientKnownContact:v9];

    uint64_t v12 = [(PKPassShareInitiationContext *)self->_context composedShare];
    long long v13 = [v16 defaultOptions];
    [v12 setActivationOptions:v13];

    context = self->_context;
    uint64_t v15 = [v16 availableOptions];
    [(PKPassShareInitiationContext *)context setAvailableActivationOptions:v15];

    -[PKPassShareInitiationContext setActivationOptionsUserEditable:](self->_context, "setActivationOptionsUserEditable:", [v16 allowUserEdit]);
  }
}

- (id)_placeholderActivityItem
{
  unint64_t v3 = [(PKPassShareInitiationContext *)self->_context sharePreviewTitle];
  id v4 = [(PKPassShareInitiationContext *)self->_context sharePreviewSubtitle];
  unint64_t v5 = [(PKPassShareInitiationContext *)self->_context sharePreviewImageURL];
  uint64_t v6 = [(PKPassShareInitiationContext *)self->_context sharePreviewFallbackImage];
  uint64_t v7 = +[PKActivityItemSource placeholderURLItemWithTitle:v3 subtitle:v4 iconURL:v5 iconPlaceholder:v6];

  return v7;
}

- (id)_activityItemForActivationCode
{
  unint64_t v3 = [(PKPassShareInitiationNavigationController *)self _placeholderActivityItem];
  id v4 = [(PKPassShareInitiationContext *)self->_context composedShare];
  unint64_t v5 = [v4 activationOptions];
  uint64_t v6 = [v5 activationCode];

  [v3 setValue:v6];

  return v3;
}

- (void)sharePreviewViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKPassShareInitiationContext *)self->_context flow];
  if (v5 <= 6)
  {
    if (((1 << v5) & 0x1B) != 0)
    {
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      BOOL v9 = __81__PKPassShareInitiationNavigationController_sharePreviewViewControllerDidCancel___block_invoke_2;
      id v10 = &unk_1E59CA7D0;
      long long v11 = self;
      uint64_t v6 = &v7;
    }
    else
    {
      if ([(PKPassShareInitiationContext *)self->_context environment] != 2)
      {
        [(PKPassShareInitiationNavigationController *)self _flowDidCancel];
        goto LABEL_8;
      }
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v14 = __81__PKPassShareInitiationNavigationController_sharePreviewViewControllerDidCancel___block_invoke;
      uint64_t v15 = &unk_1E59CA7D0;
      id v16 = self;
      uint64_t v6 = &v12;
    }
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
  }
LABEL_8:
}

uint64_t __81__PKPassShareInitiationNavigationController_sharePreviewViewControllerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionToStep:1];
}

uint64_t __81__PKPassShareInitiationNavigationController_sharePreviewViewControllerDidCancel___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionToStep:2];
}

- (void)sharePreviewViewControllerDidContinue:(id)a3
{
  id v21 = [(PKPassShareInitiationContext *)self->_context composedShare];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_alloc(MEMORY[0x1E4F84870]);
  uint64_t v6 = [v21 sharedEntitlements];
  uint64_t v7 = [(PKSharedPassSharesController *)self->_sharesController shareableEntitlements];
  uint64_t v8 = (void *)[v5 initWithSharedEntitlements:v6 availableEntitlements:v7 editable:1];

  if ([v8 canAllowResharing])
  {
    BOOL v9 = [v8 globalView];
    uint64_t v10 = [v9 shareability];

    uint64_t v11 = *MEMORY[0x1E4F86D10];
    uint64_t v12 = *MEMORY[0x1E4F86D08];
    if (v10) {
      uint64_t v13 = *MEMORY[0x1E4F86D10];
    }
    else {
      uint64_t v13 = *MEMORY[0x1E4F86D08];
    }
    [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F86C48]];
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F86D10];
    uint64_t v12 = *MEMORY[0x1E4F86D08];
  }
  id v14 = [v21 sharedEntitlements];
  uint64_t v15 = [(PKSharedPassSharesController *)self->_sharesController baseNewShareForPass];
  id v16 = [v15 sharedEntitlements];
  int v17 = PKEqualObjects();

  BOOL v18 = (void *)MEMORY[0x1E4F86C20];
  if (v17) {
    BOOL v18 = (void *)MEMORY[0x1E4F86C28];
  }
  [v4 setObject:*v18 forKeyedSubscript:*MEMORY[0x1E4F86C18]];
  id v19 = [v21 activationOptions];

  if (v19) {
    uint64_t v20 = v11;
  }
  else {
    uint64_t v20 = v12;
  }
  [v4 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F86C40]];

  [(PKShareInitiationAnalyticsReporter *)self->_analyticsReporter sendEventForPage:2 button:2 specifics:v4];
  [(PKPassShareInitiationNavigationController *)self _transitionToNextStep];
}

- (BOOL)interceptableActivityViewController:(id)a3 shouldInterceptActivitySelectionOfType:(id)a4
{
  return self->_currentStep == 2;
}

- (void)interceptableActivityViewController:(id)a3 didInterceptActivitySelectionOfType:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if PKEqualObjects() && (PKSharingUseIMessageExtension())
  {
    int v8 = 0;
    int v9 = 1;
    uint64_t v10 = (id *)MEMORY[0x1E4F86C68];
    uint64_t v11 = 1;
  }
  else if (PKEqualObjects())
  {
    int v9 = 0;
    int v8 = 1;
    uint64_t v10 = (id *)MEMORY[0x1E4F86C60];
    uint64_t v11 = 2;
  }
  else
  {
    int v12 = PKEqualObjects();
    int v8 = 0;
    int v9 = 0;
    uint64_t v10 = (id *)MEMORY[0x1E4F86C80];
    if (v12) {
      uint64_t v10 = (id *)MEMORY[0x1E4F86C78];
    }
    uint64_t v11 = 3;
  }
  id v13 = *v10;
  [(PKPassShareInitiationContext *)self->_context setFlow:v11];
  [(PKPassShareInitiationContext *)self->_context setChannelBundleIdentifier:v7];
  if (v8)
  {
    id v34 = 0;
    id v14 = [v6 selectedRecipientWithOutContactIdentifier:&v34];
    int v32 = v8;
    id v15 = v7;
    int v16 = v9;
    id v17 = v34;
    BOOL v18 = [MEMORY[0x1E4F845E8] defaultContactResolver];
    [v18 contactForIdentifier:v17];
    v20 = id v19 = v6;

    [(PKPassShareInitiationContext *)self->_context setRecipient:v20 fallbackNickname:v14];
    int v9 = v16;
    id v7 = v15;
    int v8 = v32;

    id v6 = v19;
  }
  uint64_t v21 = v8 | v9;
  sharesController = self->_sharesController;
  id v23 = [(PKPassShareInitiationContext *)self->_context channelBundleIdentifier];
  LODWORD(v21) = [(PKSharedPassSharesController *)sharesController isSharingChannelBlockedForChannel:v23 isRecipientKnownContact:v21];

  if (v21)
  {
    uint64_t v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Trying to share over blocked sharing channel", buf, 2u);
    }

    unint64_t v25 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_8.isa);
    v26 = PKLocalizedShareableCredentialString(&cfstr_ShareableMessa_9.isa);
    id v27 = PKDisplayableErrorCustom();

    if (v8)
    {
      [(PKPassShareInitiationNavigationController *)self _flowDidCancelWithError:v27];
    }
    else
    {
      id v30 = PKAlertForDisplayableErrorWithHandlers(v27, 0, 0, 0);
      id v31 = [(UIViewController *)self pkui_frontMostViewController];
      [v31 presentViewController:v30 animated:1 completion:0];
    }
  }
  else
  {
    analyticsReporter = self->_analyticsReporter;
    uint64_t v35 = *MEMORY[0x1E4F86C70];
    v36[0] = v13;
    id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    [(PKShareInitiationAnalyticsReporter *)analyticsReporter sendEventForPage:1 button:2 specifics:v29];

    [(PKPassShareInitiationNavigationController *)self _transitionToNextStep];
  }
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  [(PKPassShareInitiationNavigationController *)self shareActivityDidFinishWithShare:a4 == 1];
}

- (void)interceptableActivityViewController:(id)a3 didFinishWithShare:(BOOL)a4
{
}

- (void)shareActivityDidFinishWithShare:(BOOL)a3
{
  BOOL v3 = a3;
  v21[1] = *MEMORY[0x1E4F143B8];
  if (self->_currentStep == 2 && !a3) {
    [(PKShareInitiationAnalyticsReporter *)self->_analyticsReporter sendEventForPage:1 button:1 specifics:0];
  }
  if (v3)
  {
    unint64_t v5 = [(PKPassShareInitiationContext *)self->_context flow];
    BOOL v6 = v5 == 6 || v5 == 1;
    if (v6 && self->_currentStep == 4)
    {
      sharesController = self->_sharesController;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __77__PKPassShareInitiationNavigationController_shareActivityDidFinishWithShare___block_invoke;
      v20[3] = &unk_1E59CA7D0;
      v20[4] = self;
      [(PKSharedPassSharesController *)sharesController updateSharesWithCompletion:v20];
    }
    else
    {
      [(PKPassShareInitiationNavigationController *)self _transitionToNextStep];
    }
    return;
  }
  unint64_t currentStep = self->_currentStep;
  if (currentStep == 6)
  {
    int v9 = self;
    uint64_t v10 = 5;
    goto LABEL_21;
  }
  if (currentStep == 4)
  {
    activityViewController = self->_activityViewController;
    if (activityViewController)
    {
      int v12 = [(PKInterceptableActivityViewController *)activityViewController presentingViewController];

      if (!v12) {
        goto LABEL_27;
      }
      [(PKPassShareInitiationNavigationController *)self _revokeCreatedShareWithCompletion:0];
      id v13 = self->_activityViewController;
      id v14 = [(PKPassShareInitiationNavigationController *)self _placeholderActivityItem];
      v21[0] = v14;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [(PKInterceptableActivityViewController *)v13 setItems:v15];

      int v16 = self;
      uint64_t v17 = 2;
    }
    else
    {
      if (!self->_carKeyMessageComposer) {
        return;
      }
      [(PKPassShareInitiationNavigationController *)self _revokeCreatedShareWithCompletion:0];
      carKeyMessageComposer = self->_carKeyMessageComposer;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __77__PKPassShareInitiationNavigationController_shareActivityDidFinishWithShare___block_invoke_2;
      v19[3] = &unk_1E59CA7D0;
      v19[4] = self;
      [(MFMessageComposeViewController *)carKeyMessageComposer dismissViewControllerAnimated:1 completion:v19];
      int v16 = self;
      uint64_t v17 = 3;
    }
    [(PKPassShareInitiationNavigationController *)v16 _transitionToStep:v17];
    return;
  }
  if (currentStep != 2) {
    return;
  }
  if ([(PKPassShareInitiationContext *)self->_context environment] == 2)
  {
    int v9 = self;
    uint64_t v10 = 1;
LABEL_21:
    [(PKPassShareInitiationNavigationController *)v9 _transitionToStep:v10];
    return;
  }
LABEL_27:

  [(PKPassShareInitiationNavigationController *)self _flowDidCancel];
}

void __77__PKPassShareInitiationNavigationController_shareActivityDidFinishWithShare___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1480) mostRecentlyCreatedShare];
  BOOL v3 = *(id **)(a1 + 32);
  id v4 = (id)v2;
  if (v2)
  {
    [v3[188] setComposedShare:v2];
    [*(id *)(a1 + 32) _transitionToNextStep];
  }
  else
  {
    [v3 _flowDidCancel];
  }
}

void __77__PKPassShareInitiationNavigationController_shareActivityDidFinishWithShare___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 1496);
  *(void *)(v1 + 1496) = 0;
}

- (void)passShareIntroductionExplanationViewControllerDidContinue:(id)a3
{
  sharesController = self->_sharesController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __103__PKPassShareInitiationNavigationController_passShareIntroductionExplanationViewControllerDidContinue___block_invoke;
  v4[3] = &unk_1E59CD658;
  v4[4] = self;
  [(PKSharedPassSharesController *)sharesController canSendInvitationWithCompletion:v4];
}

void __103__PKPassShareInitiationNavigationController_passShareIntroductionExplanationViewControllerDidContinue___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __103__PKPassShareInitiationNavigationController_passShareIntroductionExplanationViewControllerDidContinue___block_invoke_2;
    v5[3] = &unk_1E59CA7D0;
    v5[4] = *(void *)(a1 + 32);
    id v3 = PKAlertForDisplayableErrorWithHandlers(a2, 0, v5, 0);
    [*(id *)(a1 + 32) presentViewController:v3 animated:1 completion:0];
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    [v4 _transitionToNextStep];
  }
}

uint64_t __103__PKPassShareInitiationNavigationController_passShareIntroductionExplanationViewControllerDidContinue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flowDidCancel];
}

- (void)passShareIntroductionExplanationViewControllerDidCancel:(id)a3
{
  [(PKShareInitiationAnalyticsReporter *)self->_analyticsReporter sendEventForPage:2 button:1 specifics:0];

  [(PKPassShareInitiationNavigationController *)self _flowDidCancel];
}

- (void)shareActivationOverviewViewControllerDidSelectShareCode:(id)a3
{
}

- (PKClientShareSecureElementPassViewControllerDelegate)shareDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shareDelegate);

  return (PKClientShareSecureElementPassViewControllerDelegate *)WeakRetained;
}

- (void)setShareDelegate:(id)a3
{
}

- (BOOL)isFromPeopleScreen
{
  return self->_isFromPeopleScreen;
}

- (void)setIsFromPeopleScreen:(BOOL)a3
{
  self->_isFromPeopleScreen = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shareDelegate);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_carKeyMessageComposer, 0);
  objc_storeStrong((id *)&self->_messageComposer, 0);

  objc_storeStrong((id *)&self->_sharesController, 0);
}

@end