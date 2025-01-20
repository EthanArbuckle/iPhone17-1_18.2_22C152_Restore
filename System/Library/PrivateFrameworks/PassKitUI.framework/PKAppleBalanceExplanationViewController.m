@interface PKAppleBalanceExplanationViewController
- (PKAppleBalanceExplanationViewController)initWithSetupController:(id)a3;
- (PKAppleBalanceExplanationViewControllerDelegate)delegate;
- (id)_bodyText;
- (id)_primaryActionTitle;
- (id)_titleText;
- (void)_setShowSpinner:(BOOL)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKAppleBalanceExplanationViewController

- (PKAppleBalanceExplanationViewController)initWithSetupController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAppleBalanceExplanationViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v9, sel_initWithContext_, [v5 setupContext]);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_setupController, a3);
    [(PKExplanationViewController *)v7 setShowCancelButton:[(PKAppleBalanceSetupController *)v7->_setupController uiOnly]];
  }

  return v7;
}

- (void)viewDidLoad
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)PKAppleBalanceExplanationViewController;
  [(PKExplanationViewController *)&v28 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = objc_msgSend(MEMORY[0x1E4F83AD0], "pk_privacyLinkForContext:", 8);
  [v3 setShowPrivacyView:1];
  [(PKExplanationViewController *)self setPrivacyLinkController:v4];
  [v3 setDelegate:self];
  [v3 setBodyDataDetectorTypes:0];
  id v5 = [(PKAppleBalanceExplanationViewController *)self _titleText];
  [v3 setTitleText:v5];

  v6 = [(PKAppleBalanceExplanationViewController *)self _bodyText];
  [v3 setBodyText:v6];

  v7 = (void *)MEMORY[0x1E4F84780];
  v8 = PKPassKitUIBundle();
  objc_super v9 = [v7 URLForImageNamed:@"AppleBalance_Hero" inBundle:v8 scale:0];

  if (v9
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v9 path],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v10 fileExistsAtPath:v11],
        v11,
        v10,
        v12))
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F84AC0]);
    id v14 = objc_alloc(MEMORY[0x1E4F84AB8]);
    v15 = (void *)MEMORY[0x1E4F1C9B8];
    v16 = [v9 path];
    v17 = [v15 dataWithContentsOfFile:v16];
    v18 = (void *)[v14 initWithIdentifier:@"AppleBalance_Hero" imageData:v17 credentialType:135];

    if (v18)
    {
      v19 = [PKPaymentSetupHeroView alloc];
      int64_t v20 = [(PKAppleBalanceSetupController *)self->_setupController setupContext];
      v29[0] = v18;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      v22 = [(PKPaymentSetupHeroView *)v19 initWithContext:v20 heroImageController:v13 heroImages:v21];
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }
  [v3 setHeroView:v22];
  v23 = PKProvisioningSecondaryBackgroundColor();
  [v3 setTopBackgroundColor:v23];

  v24 = [v3 dockView];
  v25 = [(PKAppleBalanceExplanationViewController *)self _primaryActionTitle];
  v26 = [v24 primaryButton];
  [v26 setTitle:v25 forState:0];

  v27 = [v24 footerView];
  [v27 setManualEntryButton:0];
}

- (id)_titleText
{
  return (id)PKLocalizedFeatureString();
}

- (id)_bodyText
{
  v2 = [(PKAppleBalanceSetupController *)self->_setupController credential];
  v3 = [v2 product];

  v4 = [v3 longLocalizedDescription];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    PKLocalizedFeatureString();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_primaryActionTitle
{
  return (id)PKLocalizedFeatureString();
}

- (void)_setShowSpinner:(BOOL)a3
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PKAppleBalanceExplanationViewController__setShowSpinner___block_invoke;
  block[3] = &unk_1E59CB0B0;
  objc_copyWeak(&v5, &location);
  BOOL v6 = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __59__PKAppleBalanceExplanationViewController__setShowSpinner___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v3 = [WeakRetained explanationView];
    v4 = [v3 dockView];
    [v4 setButtonsEnabled:*(unsigned char *)(a1 + 40) == 0];

    [v5 showSpinner:*(unsigned __int8 *)(a1 + 40)];
    id WeakRetained = v5;
  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained appleBalanceExplanationViewControllerDidSelectContinue:self];
}

- (PKAppleBalanceExplanationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAppleBalanceExplanationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_setupController, 0);
}

@end