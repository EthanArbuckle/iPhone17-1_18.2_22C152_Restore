@interface PKCarKeyInvitationViewController
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (PKCarKeyInvitationViewController)initWithContext:(int64_t)a3 invitation:(id)a4 delegate:(id)a5;
- (id)_bodyText;
- (id)_localizedIssuerName;
- (id)_titleText;
- (int64_t)accessType;
- (void)activationCodeDidChangeToCode:(id)a3;
- (void)continueButtonPressed;
- (void)continueLaterButtonPressed;
- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4;
- (void)resetState;
- (void)showWithProvisioningError:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKCarKeyInvitationViewController

- (PKCarKeyInvitationViewController)initWithContext:(int64_t)a3 invitation:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v11 = [(PKPassShareRedemptionViewController *)self init];
  v12 = v11;
  if (v11)
  {
    v11->_setupContext = a3;
    objc_storeStrong((id *)&v11->_invitation, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    [(PKPassShareRedemptionViewController *)v12 setAnalyticsEnabled:1];
    v13 = [(PKPassShareRedemptionViewController *)v12 analyticsReporter];
    [v13 setAccessPassType:4];
  }
  return v12;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)PKCarKeyInvitationViewController;
  [(PKPassShareRedemptionViewController *)&v24 viewDidLoad];
  v3 = [(PKCarKeyInvitationViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:0];

  v4 = [(PKPassShareRedemptionViewController *)self cardHeaderView];
  v5 = (void *)MEMORY[0x1E4FB1818];
  v6 = PKPassKitUIBundle();
  v7 = [v5 imageNamed:@"SubcredentialInvitation" inBundle:v6];

  v8 = [(PKSharingCarKeyInvitation *)self->_invitation displayInformation];
  id v9 = [v8 imageURL];

  if (v9)
  {
    [v4 showLoadingContent];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __47__PKCarKeyInvitationViewController_viewDidLoad__block_invoke;
    v21 = &unk_1E59CC3C8;
    id v22 = v4;
    id v23 = v7;
    PKCommonCachedImageFromURL(v9, &v18);
  }
  else
  {
    [v4 setCardImage:v7];
  }
  id v10 = [(PKCarKeyInvitationViewController *)self _titleText];
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v10];

  v11 = [(PKCarKeyInvitationViewController *)self _bodyText];
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v11];

  v12 = PKLocalizedCredentialString(&cfstr_AddCarKey.isa);
  [(PKPassShareRedemptionViewController *)self setContinueButtonText:v12];

  v13 = PKLocalizedCredentialString(&cfstr_NotNow.isa);
  [(PKPassShareRedemptionViewController *)self setContinueLaterText:v13];

  v14 = [(PKSharingCarKeyInvitation *)self->_invitation proprietaryData];
  v15 = [v14 displayableSharedEntitlements];
  [(PKPassShareRedemptionViewController *)self setDisplayableSharedEntitlements:v15];

  v16 = [(PKSharingCarKeyInvitation *)self->_invitation activationOptions];
  [(PKPassShareRedemptionViewController *)self setActivationOptions:v16];

  v17 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 8);
  [(PKPaymentSetupOptionsViewController *)self setPrivacyLink:v17];
  [(PKPassShareRedemptionViewController *)self showStartingUI];
}

uint64_t __47__PKCarKeyInvitationViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  if (!a3) {
    a3 = *(void *)(a1 + 40);
  }
  [v4 setCardImage:a3];
  v5 = *(void **)(a1 + 32);

  return [v5 hideLoadingContent];
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)resetState
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Reseting state of accept invitaiton view controller", v4, 2u);
  }

  [(PKPassShareRedemptionViewController *)self showStartingUI];
}

- (int64_t)accessType
{
  return 4;
}

- (id)_titleText
{
  if (self->_isShareActivation)
  {
    v2 = PKLocalizedShareableCredentialString(&cfstr_ShareActivatio_1.isa);
  }
  else
  {
    uint64_t v3 = [(PKSharingCarKeyInvitation *)self->_invitation vehicleIssuer];
    v4 = (void *)v3;
    if (v3) {
      PKLocalizedCredentialString(&cfstr_InvitationTitl_0.isa, &stru_1EF1B4C70.isa, v3);
    }
    else {
    v2 = PKLocalizedCredentialString(&cfstr_InvitationTitl.isa);
    }
  }

  return v2;
}

- (id)_bodyText
{
  if (self->_isShareActivation)
  {
    v2 = PKLocalizedShareableCredentialString(&cfstr_ShareActivatio_2.isa);
  }
  else
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F84428]) initWithCrossPlatformInvitation:self->_invitation];
    [v3 entitlement];
    unint64_t v4 = PKAppletSubcredentialEntitlementTypeFromValue();
    if (v4 > 6) {
      v5 = 0;
    }
    else {
      v5 = off_1E59D6F68[v4];
    }
    v2 = PKLocalizedCredentialString(&v5->isa);
  }

  return v2;
}

- (id)_localizedIssuerName
{
  v2 = [(PKSharingCarKeyInvitation *)self->_invitation vehicleIssuer];
  uint64_t v3 = [MEMORY[0x1E4F84D50] sharedService];
  unint64_t v4 = [v3 supportedRegionFeatureOfType:2 didFailOSVersionRequirements:0];
  v5 = [v4 localizedNameForIssuerWithIdentifier:v2];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    PKLocalizedCredentialString(&cfstr_GenericPartner.isa);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)continueButtonPressed
{
  v4.receiver = self;
  v4.super_class = (Class)PKCarKeyInvitationViewController;
  [(PKPassShareRedemptionViewController *)&v4 continueButtonPressed];
  [(PKPassShareRedemptionViewController *)self showLoadingUI];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained carKeyInvitationViewControllerDidRequestStart:self];
}

- (void)continueLaterButtonPressed
{
  v4.receiver = self;
  v4.super_class = (Class)PKCarKeyInvitationViewController;
  [(PKPassShareRedemptionViewController *)&v4 continueLaterButtonPressed];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained carKeyInvitationViewControllerDidCancel:self];
}

- (void)activationCodeDidChangeToCode:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained carKeyInvitationViewController:self didEnterActivationCode:v5];
}

- (void)showWithProvisioningError:(id)a3
{
  id v4 = a3;
  if (([v4 hasLocalizedTitleAndMessage] & 1) == 0)
  {
    id v5 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);
    [v4 setLocalizedTitle:v5];

    v6 = [(PKCarKeyInvitationViewController *)self _localizedIssuerName];
    id v7 = PKLocalizedCredentialString(&cfstr_CarkeyFailedAd.isa, &stru_1EF1B4C70.isa, v6);
    [v4 setLocalizedMessage:v7];
  }
  v8 = (void *)MEMORY[0x1E4FB1418];
  v11[4] = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__PKCarKeyInvitationViewController_showWithProvisioningError___block_invoke_2;
  v12[3] = &unk_1E59CA870;
  v12[4] = self;
  id v13 = v4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__PKCarKeyInvitationViewController_showWithProvisioningError___block_invoke_3;
  v11[3] = &unk_1E59CA7D0;
  id v9 = v4;
  id v10 = [v8 alertForErrorWithError:v9 acknowledgeButtonText:0 exitButtonText:0 onAcknowledge:&__block_literal_global_122 onExit:v12 onTryAgain:v11];
  [(PKCarKeyInvitationViewController *)self presentViewController:v10 animated:1 completion:0];
}

void __62__PKCarKeyInvitationViewController_showWithProvisioningError___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) analyticsReporter];
  uint64_t v3 = [*(id *)(a1 + 40) underlyingError];
  id v4 = v3;
  if (!v3) {
    id v4 = *(void **)(a1 + 40);
  }
  uint64_t v7 = *MEMORY[0x1E4F86F40];
  v8[0] = *MEMORY[0x1E4F86440];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v2 sendEventForPage:2 error:v4 specifics:v5];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1376));
  [WeakRetained carKeyInvitationViewControllerDidCancel:*(void *)(a1 + 32)];
}

uint64_t __62__PKCarKeyInvitationViewController_showWithProvisioningError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) continueButtonPressed];
}

- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4
{
  if (a4)
  {
    [(PKPassShareRedemptionViewController *)self showLoadingUI];
  }
  else if (a3 == 8)
  {
    [(PKPassShareRedemptionViewController *)self showSuccessUI];
  }
  else
  {
    [(PKPassShareRedemptionViewController *)self showStartingUI];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_invitation, 0);
}

@end