@interface PKPaymentSetupGetAppViewController
- (PKPaymentSetupGetAppViewController)initWithPaymentProduct:(id)a3 setupContext:(int64_t)a4;
- (PKPaymentSetupGetAppViewController)initWithPaymentProduct:(id)a3 setupContext:(int64_t)a4 linkedApplication:(id)a5;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (void)_updateAppStoreViewRequest;
- (void)linkedApplicationDidChangeState:(id)a3;
- (void)lockupViewDidBeginRequest:(id)a3;
- (void)lockupViewDidInvalidateIntrinsicContentSize:(id)a3;
- (void)setReporter:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPaymentSetupGetAppViewController

- (PKPaymentSetupGetAppViewController)initWithPaymentProduct:(id)a3 setupContext:(int64_t)a4
{
  id v6 = a3;
  v7 = [PKLinkedApplication alloc];
  v8 = [v6 associatedStoreIdentifiers];
  v9 = [v6 appLaunchURL];
  v10 = [(PKLinkedApplication *)v7 initWithStoreIDs:v8 defaultLaunchURL:v9];

  v11 = [(PKPaymentSetupGetAppViewController *)self initWithPaymentProduct:v6 setupContext:a4 linkedApplication:v10];
  return v11;
}

- (PKPaymentSetupGetAppViewController)initWithPaymentProduct:(id)a3 setupContext:(int64_t)a4 linkedApplication:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentSetupGetAppViewController;
  v11 = [(PKExplanationViewController *)&v16 initWithContext:a4];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_product, a3);
    objc_storeStrong((id *)&v12->_linkedApplication, a5);
    [(PKLinkedApplication *)v12->_linkedApplication addObserver:v12];
    id v13 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v13 configureWithTransparentBackground];
    v14 = [(PKPaymentSetupGetAppViewController *)v12 navigationItem];
    [v14 setStandardAppearance:v13];
  }
  return v12;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupGetAppViewController;
  [(PKExplanationViewController *)&v15 viewDidLoad];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = [(PKPaymentSetupProduct *)self->_product partnerName];
  [v3 setShowPrivacyView:0];
  v5 = [v3 dockView];
  [v5 setPrimaryButton:0];

  id v6 = PKLocalizedAquamanString(&cfstr_BarcodePayment_5.isa, &stru_1EF1B4C70.isa, v4);
  [v3 setTitleText:v6];

  v7 = PKLocalizedAquamanString(&cfstr_BarcodePayment_6.isa, &stru_1EF1B4C70.isa, v4);
  [v3 setBodyText:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F4BB08]);
  id v9 = [v8 layer];
  [v9 setCornerRadius:16.0];

  objc_msgSend(v8, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  id v10 = PKProvisioningSecondaryBackgroundColor();
  [v8 setBackgroundColor:v10];

  [v8 setSize:*MEMORY[0x1E4F4BA90]];
  [v8 setDelegate:self];
  appStoreView = self->_appStoreView;
  self->_appStoreView = (ASCLockupView *)v8;
  id v12 = v8;

  [(PKPaymentSetupGetAppViewController *)self _updateAppStoreViewRequest];
  [v3 setBodyView:v12];

  [v3 setBodyViewPadding:32.0];
  id v13 = [(PKPaymentSetupGetAppViewController *)self view];
  v14 = PKProvisioningBackgroundColor();
  [v13 setBackgroundColor:v14];

  PKPaymentSetupApplyContextAppearance([(PKExplanationViewController *)self context], v13);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupGetAppViewController;
  [(PKPaymentSetupGetAppViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupGetAppViewController;
  [(PKPaymentSetupGetAppViewController *)&v5 traitCollectionDidChange:a3];
  objc_super v4 = [(PKPaymentSetupGetAppViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)lockupViewDidBeginRequest:(id)a3
{
}

- (void)lockupViewDidInvalidateIntrinsicContentSize:(id)a3
{
  id v3 = [(PKExplanationViewController *)self explanationView];
  [v3 setNeedsLayout];
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentSetupGetAppViewController_linkedApplicationDidChangeState___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __70__PKPaymentSetupGetAppViewController_linkedApplicationDidChangeState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAppStoreViewRequest];
}

- (void)_updateAppStoreViewRequest
{
  int64_t v3 = [(PKLinkedApplication *)self->_linkedApplication state];
  if (v3 != 2)
  {
    if (v3 != 1)
    {
      if (!v3)
      {
        linkedApplication = self->_linkedApplication;
        [(PKLinkedApplication *)linkedApplication reloadApplicationStateIfNecessary];
      }
      return;
    }
    objc_super v5 = [(PKLinkedApplication *)self->_linkedApplication storeIdentifier];
    if (!v5) {
      return;
    }
LABEL_8:
    appStoreView = self->_appStoreView;
    v7 = _PKCreateASCLookupRequestForStoreID(v5, 0);
    [(ASCLockupView *)appStoreView setRequest:v7];

    return;
  }
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupGetAppViewController received payment setup product with invalid linked application", v10, 2u);
  }

  id v9 = [(PKPaymentSetupProduct *)self->_product associatedStoreIdentifiers];
  objc_super v5 = [v9 firstObject];

  if (v5) {
    goto LABEL_8;
  }
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_appStoreView, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);

  objc_storeStrong((id *)&self->_product, 0);
}

@end