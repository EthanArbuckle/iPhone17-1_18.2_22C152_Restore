@interface PKIssuerBindingViewController
- (PKIssuerBindingViewController)initWithIssuerData:(id)a3 signature:(id)a4 referralSource:(unint64_t)a5;
- (PKIssuerBindingViewControllerDelegate)delegate;
- (id)_alertViewControllerForError:(id)a3;
- (void)_cancel;
- (void)_confirmSecurityCapabilitiesWithCompletion:(id)a3;
- (void)_enableControls;
- (void)_presentFailureWithError:(id)a3;
- (void)_sendAnalyticsDidTapButton:(id)a3;
- (void)_sendAnalyticsViewVisibilityUpdateWithType:(id)a3;
- (void)_sendAuthenticationEvent;
- (void)_sendInternalErrorEventWithError:(id)a3;
- (void)explanationViewControllerDidSelectCancel:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKIssuerBindingViewController

- (PKIssuerBindingViewController)initWithIssuerData:(id)a3 signature:(id)a4 referralSource:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PKIssuerBindingViewController;
  v11 = [(PKExplanationViewController *)&v28 init];
  if (!v11)
  {
LABEL_10:
    v23 = v11;
    goto LABEL_11;
  }
  if (PKValidateIssuerBindingData())
  {
    id v27 = 0;
    v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:0 error:&v27];
    id v13 = v27;
    id v14 = objc_alloc(MEMORY[0x1E4F84728]);
    v15 = [v12 objectForKey:@"fidoProfile"];
    v16 = (void *)[v14 initWithDictionary:v15];

    uint64_t v17 = [v16 relyingPartyIdentifier];
    relyingPartyIdentifier = v11->_relyingPartyIdentifier;
    v11->_relyingPartyIdentifier = (NSString *)v17;

    v11->_source = a5;
    uint64_t v19 = [v12 PKStringForKey:@"displayableName"];
    issuerName = v11->_issuerName;
    v11->_issuerName = (NSString *)v19;

    int v21 = PKHasVerifiedPrimaryAppleAccount();
    if (v21)
    {
      v22 = PKPrimaryAppleAccountFormattedUsername();
    }
    else
    {
      v22 = 0;
    }
    objc_storeStrong((id *)&v11->_accountName, v22);
    if (v21) {

    }
    uint64_t v24 = [MEMORY[0x1E4F84898] sharedInstance];
    passLibrary = v11->_passLibrary;
    v11->_passLibrary = (PKPassLibrary *)v24;

    [(PKPassLibrary *)v11->_passLibrary addDelegate:v11];
    objc_storeStrong((id *)&v11->_issuerData, a3);
    [(PKExplanationViewController *)v11 setExplanationViewControllerDelegate:v11];

    goto LABEL_10;
  }
  v23 = 0;
LABEL_11:

  return v23;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKIssuerBindingViewController;
  [(PKIssuerBindingViewController *)&v4 viewDidAppear:a3];
  [(PKIssuerBindingViewController *)self _sendAnalyticsViewVisibilityUpdateWithType:*MEMORY[0x1E4F864A0]];
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PKIssuerBindingViewController;
  [(PKExplanationViewController *)&v16 viewDidLoad];
  [(PKExplanationViewController *)self setShowDoneButton:0];
  [(PKExplanationViewController *)self setShowCancelButton:1];
  v3 = [(PKExplanationViewController *)self explanationView];
  [v3 setDelegate:self];
  [v3 setShowPrivacyView:0];
  [v3 setBodyDataDetectorTypes:0];
  objc_super v4 = PKLocalizedString(&cfstr_Wallet_0.isa);
  [v3 setTitleText:v4];

  v5 = (void *)MEMORY[0x1E4FB1818];
  v6 = PKPassKitUIBundle();
  v7 = [v5 imageNamed:@"WalletIconClassic" inBundle:v6 withConfiguration:0];

  [v3 setImage:v7];
  int IsAvailable = PKPearlIsAvailable();
  accountName = self->_accountName;
  if (!IsAvailable)
  {
    if (accountName)
    {
      issuerName = self->_issuerName;
      v15 = self->_accountName;
      id v10 = @"ISSUER_DATA_GENERATION_BODY_TEXT_TOUCH_ID";
      goto LABEL_6;
    }
    id v14 = self->_issuerName;
    v11 = @"ISSUER_DATA_GENERATION_BODY_TEXT_TOUCH_ID_MISSING_ACCOUNT";
LABEL_9:
    PKLocalizedPaymentString(&v11->isa, &stru_1EF1B4C70.isa, v14);
    goto LABEL_10;
  }
  if (!accountName)
  {
    id v14 = self->_issuerName;
    v11 = @"ISSUER_DATA_GENERATION_BODY_TEXT_FACE_ID_MISSING_ACCOUNT";
    goto LABEL_9;
  }
  issuerName = self->_issuerName;
  v15 = self->_accountName;
  id v10 = @"ISSUER_DATA_GENERATION_BODY_TEXT_FACE_ID";
LABEL_6:
  PKLocalizedPaymentString(&v10->isa, &stru_1EF1B5770.isa, issuerName, v15);
  v12 = LABEL_10:;
  [v3 setBodyText:v12];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKIssuerBindingViewController;
  [(PKIssuerBindingViewController *)&v4 viewDidDisappear:a3];
  [(PKIssuerBindingViewController *)self _sendAnalyticsViewVisibilityUpdateWithType:*MEMORY[0x1E4F864A8]];
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  [(PKIssuerBindingViewController *)self _sendAnalyticsDidTapButton:*MEMORY[0x1E4F86148]];

  [(PKIssuerBindingViewController *)self _cancel];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = a3;
  [(PKIssuerBindingViewController *)self _sendAnalyticsDidTapButton:*MEMORY[0x1E4F861B8]];
  [(PKExplanationViewController *)self showNavigationBarSpinner:1];
  v5 = [(PKExplanationViewController *)self explanationView];
  v6 = [v5 dockView];
  [v6 setButtonsEnabled:0];

  if (!self->_accountName)
  {
    [(PKIssuerBindingViewController *)self _enableControls];
    v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87458] code:1 userInfo:0];
    [(PKIssuerBindingViewController *)self _presentFailureWithError:v7];
  }
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke;
  v8[3] = &unk_1E59CBA18;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  [(PKIssuerBindingViewController *)self _confirmSecurityCapabilitiesWithCompletion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v8 = (void *)*((void *)WeakRetained + 133);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 1072);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_2;
      v13[3] = &unk_1E59D3F78;
      v13[4] = v7;
      [v8 requestIssuerBoundPassesWithBindingWithData:v9 automaticallyProvision:0 withCompletion:v13];
    }
    else if (v5)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_4;
      block[3] = &unk_1E59CA870;
      block[4] = WeakRetained;
      id v12 = v5;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_5;
      v10[3] = &unk_1E59CA7D0;
      v10[4] = WeakRetained;
      dispatch_async(MEMORY[0x1E4F14428], v10);
    }
  }
}

void __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_3;
  block[3] = &unk_1E59CA8E8;
  block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _enableControls];
  if (*(void *)(a1 + 40) && !*(void *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1088));
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1088));
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1088));
        [v8 issuerBindingViewController:*(void *)(a1 + 32) didFinishWithPassesData:*(void *)(a1 + 40)];
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) _enableControls];
    [*(id *)(a1 + 32) _sendInternalErrorEventWithError:*(void *)(a1 + 48)];
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 48);
    [v2 _presentFailureWithError:v3];
  }
}

uint64_t __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _enableControls];
  [*(id *)(a1 + 32) _sendInternalErrorEventWithError:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _presentFailureWithError:v3];
}

uint64_t __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableControls];
}

- (void)_enableControls
{
  [(PKExplanationViewController *)self showNavigationBarSpinner:0];
  id v4 = [(PKExplanationViewController *)self explanationView];
  uint64_t v3 = [v4 dockView];
  [v3 setButtonsEnabled:1];
}

- (void)_confirmSecurityCapabilitiesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[PKSecurityCapabilitiesController alloc] initWithRequirements:24 context:0];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__PKIssuerBindingViewController__confirmSecurityCapabilitiesWithCompletion___block_invoke;
  v7[3] = &unk_1E59DE6C8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(PKSecurityCapabilitiesController *)v5 presentSecurityRepairFlowWithPresentingViewController:self completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __76__PKIssuerBindingViewController__confirmSecurityCapabilitiesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__PKIssuerBindingViewController__confirmSecurityCapabilitiesWithCompletion___block_invoke_2;
  v7[3] = &unk_1E59CBAB8;
  objc_copyWeak(v10, (id *)(a1 + 40));
  v10[1] = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(v10);
}

void __76__PKIssuerBindingViewController__confirmSecurityCapabilitiesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = PKSecurityCapabilitiesErrorToString(*(void *)(a1 + 56));
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Finished presenting security repair flow with upgrade error %@, error %@", (uint8_t *)&v8, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6 == 3)
    {
      char v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else if (v6)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Issuer Binding VC - Aborting binding because user failed to upgrade to HSA2", (uint8_t *)&v8, 2u);
      }

      char v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      char v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v7();
  }
}

- (void)_cancel
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (uint64_t v5 = WeakRetained,
        id v6 = objc_loadWeakRetained((id *)p_delegate),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 issuerBindingViewControllerDidCancel:self];
  }
  else
  {
    [(PKIssuerBindingViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_presentFailureWithError:(id)a3
{
  id v4 = [(PKIssuerBindingViewController *)self _alertViewControllerForError:a3];
  [(PKIssuerBindingViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (id)_alertViewControllerForError:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v6 = [v4 code] == 1;
  char v7 = PKLocalizedPaymentString(&cfstr_IssuerDataGene.isa);
  if (v6)
  {
    id v8 = PKLocalizedPaymentString(&cfstr_IssuerDataGene_5.isa);
    id v9 = (void *)MEMORY[0x1E4FB1410];
    __int16 v10 = PKLocalizedPaymentString(&cfstr_IssuerDataGene_6.isa);
    uint64_t v11 = [v9 actionWithTitle:v10 style:0 handler:&__block_literal_global_214];
    [v5 addObject:v11];

    objc_initWeak(&location, self);
    uint64_t v12 = (void *)MEMORY[0x1E4FB1410];
    id v13 = PKLocalizedString(&cfstr_Cancel.isa);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __62__PKIssuerBindingViewController__alertViewControllerForError___block_invoke_2;
    v29[3] = &unk_1E59CCFF0;
    objc_copyWeak(&v30, &location);
    id v14 = [v12 actionWithTitle:v13 style:1 handler:v29];
    [v5 addObject:v14];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = PKLocalizedPaymentString(&cfstr_IssuerDataGene_0.isa);
    v15 = (void *)MEMORY[0x1E4FB1410];
    objc_super v16 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    uint64_t v17 = [v15 actionWithTitle:v16 style:0 handler:0];
    [v5 addObject:v17];
  }
  v18 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:v8 preferredStyle:1];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v19 = v5;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(v18, "addAction:", *(void *)(*((void *)&v25 + 1) + 8 * i), (void)v25);
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v20);
  }

  if ([v19 count])
  {
    v23 = [v19 objectAtIndexedSubscript:0];
    [v18 setPreferredAction:v23];
  }

  return v18;
}

void __62__PKIssuerBindingViewController__alertViewControllerForError___block_invoke()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

void __62__PKIssuerBindingViewController__alertViewControllerForError___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cancel];
    id WeakRetained = v2;
  }
}

- (void)_sendAnalyticsViewVisibilityUpdateWithType:(id)a3
{
  v15[4] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F87050];
  id v6 = a3;
  [v4 reporterForSubject:v5];

  char v7 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v8 = *MEMORY[0x1E4F86730];
  v14[0] = *MEMORY[0x1E4F86308];
  v14[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F86740];
  v15[0] = v6;
  v15[1] = v9;
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  if (!relyingPartyIdentifier) {
    relyingPartyIdentifier = (NSString *)*MEMORY[0x1E4F86D78];
  }
  v15[2] = relyingPartyIdentifier;
  uint64_t v11 = *MEMORY[0x1E4F86B38];
  v14[2] = *MEMORY[0x1E4F86DA8];
  v14[3] = v11;
  uint64_t v12 = AnalyticsVASReferralSource();
  v15[3] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  [v7 subject:v5 sendEvent:v13];
}

- (void)_sendAnalyticsDidTapButton:(id)a3
{
  v15[4] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F87050];
  id v6 = a3;
  [v4 reporterForSubject:v5];

  char v7 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v8 = *MEMORY[0x1E4F86380];
  uint64_t v9 = *MEMORY[0x1E4F86730];
  v14[0] = *MEMORY[0x1E4F86308];
  v14[1] = v9;
  uint64_t v10 = *MEMORY[0x1E4F86740];
  v15[0] = v8;
  v15[1] = v10;
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  if (!relyingPartyIdentifier) {
    relyingPartyIdentifier = (NSString *)*MEMORY[0x1E4F86D78];
  }
  uint64_t v12 = *MEMORY[0x1E4F86120];
  v14[2] = *MEMORY[0x1E4F86DA8];
  v14[3] = v12;
  v15[2] = relyingPartyIdentifier;
  v15[3] = v6;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  [v7 subject:v5 sendEvent:v13];
}

- (void)_sendInternalErrorEventWithError:(id)a3
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F87050];
  id v6 = a3;
  [v4 reporterForSubject:v5];

  char v7 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v8 = *MEMORY[0x1E4F86730];
  v14[0] = *MEMORY[0x1E4F86098];
  uint64_t v9 = *MEMORY[0x1E4F862F8];
  v13[0] = v8;
  v13[1] = v9;
  uint64_t v10 = AnalyticsVASErrorTypeForError();

  v13[2] = *MEMORY[0x1E4F86DA8];
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  if (!relyingPartyIdentifier) {
    relyingPartyIdentifier = (NSString *)*MEMORY[0x1E4F86D78];
  }
  v14[1] = v10;
  v14[2] = relyingPartyIdentifier;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  [v7 subject:v5 sendEvent:v12];
}

- (void)_sendAuthenticationEvent
{
  v11[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F87050];
  [MEMORY[0x1E4F843E0] reporterForSubject:*MEMORY[0x1E4F87050]];

  id v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F863F0];
  uint64_t v6 = *MEMORY[0x1E4F86730];
  v10[0] = *MEMORY[0x1E4F86308];
  v10[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86098];
  v11[0] = v5;
  v11[1] = v7;
  id v10[2] = *MEMORY[0x1E4F86DA8];
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  if (!relyingPartyIdentifier) {
    relyingPartyIdentifier = (NSString *)*MEMORY[0x1E4F86D78];
  }
  v11[2] = relyingPartyIdentifier;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  [v4 subject:v3 sendEvent:v9];
}

- (PKIssuerBindingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKIssuerBindingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_issuerData, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_accountName, 0);

  objc_storeStrong((id *)&self->_issuerName, 0);
}

@end