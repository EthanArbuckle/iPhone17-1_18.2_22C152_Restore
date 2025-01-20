@interface PKVirtualCardPrivacyExplanationViewController
- (PKVirtualCardPrivacyExplanationViewController)initWithContext:(int64_t)a3 referralSource:(unint64_t)a4 resultCallback:(id)a5;
- (id)resultCallback;
- (void)_beginReportingIfNecessary;
- (void)_endReportingIfNecessary;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)loadView;
- (void)setResultCallback:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKVirtualCardPrivacyExplanationViewController

- (PKVirtualCardPrivacyExplanationViewController)initWithContext:(int64_t)a3 referralSource:(unint64_t)a4 resultCallback:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKVirtualCardPrivacyExplanationViewController;
  v9 = [(PKExplanationViewController *)&v14 initWithContext:a3];
  v10 = v9;
  if (v9)
  {
    v9->_referralSource = a4;
    v11 = _Block_copy(v8);
    id resultCallback = v10->_resultCallback;
    v10->_id resultCallback = v11;
  }
  return v10;
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)PKVirtualCardPrivacyExplanationViewController;
  [(PKExplanationViewController *)&v11 loadView];
  v3 = [(PKExplanationViewController *)self explanationView];
  [v3 setShowPrivacyView:1];
  [v3 setDelegate:self];
  v4 = PKLocalizedVirtualCardString(&cfstr_VirtualCardPri.isa);
  [v3 setTitleText:v4];

  v5 = PKLocalizedVirtualCardString(&cfstr_VirtualCardPri_0.isa);
  [v3 setBodyText:v5];

  [v3 setTopMargin:80.0];
  v6 = PKUIImageNamed(@"WalletSafariHero");
  [v3 setImage:v6];

  [v3 setForceShowSetupLaterButton:1];
  v7 = [v3 dockView];
  id v8 = [v7 footerView];

  v9 = [v8 setupLaterButton];
  v10 = PKLocalizedVirtualCardString(&cfstr_VirtualCardSet_2.isa);
  [v9 setTitle:v10 forState:0];

  [v8 setManualEntryButton:0];
}

- (void)viewDidLoad
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKVirtualCardPrivacyExplanationViewController;
  [(PKExplanationViewController *)&v10 viewDidLoad];
  [(PKVirtualCardPrivacyExplanationViewController *)self setModalInPresentation:1];
  [(PKVirtualCardPrivacyExplanationViewController *)self _beginReportingIfNecessary];
  v3 = (void *)MEMORY[0x1E4F843E0];
  v13[0] = *MEMORY[0x1E4F87068];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v5 = *MEMORY[0x1E4F864A0];
  uint64_t v6 = *MEMORY[0x1E4F86730];
  v11[0] = *MEMORY[0x1E4F86308];
  v11[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86178];
  v12[0] = v5;
  v12[1] = v7;
  v11[2] = *MEMORY[0x1E4F86B38];
  id v8 = [MEMORY[0x1E4F843E0] virtualCardReferralSource:self->_referralSource];
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v3 subjects:v4 sendEvent:v9];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKVirtualCardPrivacyExplanationViewController;
  [(PKVirtualCardPrivacyExplanationViewController *)&v4 viewWillDisappear:a3];
  [(PKVirtualCardPrivacyExplanationViewController *)self _endReportingIfNecessary];
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3 = *MEMORY[0x1E4F87068];
  objc_super v4 = [MEMORY[0x1E4F843E0] reporterForSubject:*MEMORY[0x1E4F87068]];

  if (!v4)
  {
    self->_didBeginWalletProvisioningSubject = 1;
    uint64_t v5 = (void *)MEMORY[0x1E4F843E0];
    [v5 beginSubjectReporting:v3];
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginWalletProvisioningSubject)
  {
    self->_didBeginWalletProvisioningSubject = 0;
    [MEMORY[0x1E4F843E0] endSubjectReporting:*MEMORY[0x1E4F87068]];
  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = (void *)MEMORY[0x1E4F843E0];
  v13[0] = *MEMORY[0x1E4F87068];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v6 = *MEMORY[0x1E4F86380];
  uint64_t v7 = *MEMORY[0x1E4F86730];
  v11[0] = *MEMORY[0x1E4F86308];
  v11[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F86178];
  v12[0] = v6;
  v12[1] = v8;
  v11[2] = *MEMORY[0x1E4F86120];
  v12[2] = *MEMORY[0x1E4F861B8];
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v4 subjects:v5 sendEvent:v9];

  PKSetSafariCredentialImportConsented();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__PKVirtualCardPrivacyExplanationViewController_explanationViewDidSelectContinue___block_invoke;
  v10[3] = &unk_1E59CA7D0;
  v10[4] = self;
  [(PKVirtualCardPrivacyExplanationViewController *)self dismissViewControllerAnimated:1 completion:v10];
}

uint64_t __82__PKVirtualCardPrivacyExplanationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 1056);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = (void *)MEMORY[0x1E4F843E0];
  v13[0] = *MEMORY[0x1E4F87068];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v6 = *MEMORY[0x1E4F86380];
  uint64_t v7 = *MEMORY[0x1E4F86730];
  v11[0] = *MEMORY[0x1E4F86308];
  v11[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F86178];
  v12[0] = v6;
  v12[1] = v8;
  v11[2] = *MEMORY[0x1E4F86120];
  v12[2] = *MEMORY[0x1E4F86678];
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v4 subjects:v5 sendEvent:v9];

  PKSetSafariCredentialImportConsented();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PKVirtualCardPrivacyExplanationViewController_explanationViewDidSelectSetupLater___block_invoke;
  v10[3] = &unk_1E59CA7D0;
  v10[4] = self;
  [(PKVirtualCardPrivacyExplanationViewController *)self dismissViewControllerAnimated:1 completion:v10];
}

uint64_t __84__PKVirtualCardPrivacyExplanationViewController_explanationViewDidSelectSetupLater___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 1056);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (id)resultCallback
{
  return self->_resultCallback;
}

- (void)setResultCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end