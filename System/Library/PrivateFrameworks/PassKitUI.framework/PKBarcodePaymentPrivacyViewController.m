@interface PKBarcodePaymentPrivacyViewController
- (BOOL)_canShowWhileLocked;
- (PKBarcodePaymentPrivacyViewController)initWithIssuerName:(id)a3 displayContext:(unint64_t)a4 paymentSetupContext:(int64_t)a5;
- (void)_dismiss;
- (void)viewDidLoad;
@end

@implementation PKBarcodePaymentPrivacyViewController

- (PKBarcodePaymentPrivacyViewController)initWithIssuerName:(id)a3 displayContext:(unint64_t)a4 paymentSetupContext:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKBarcodePaymentPrivacyViewController;
  v10 = [(PKExplanationViewController *)&v13 initWithContext:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_issuerName, a3);
    v11->_displayContext = a4;
  }

  return v11;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PKBarcodePaymentPrivacyViewController;
  [(PKExplanationViewController *)&v11 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = [v3 dockView];
  v5 = [v4 footerView];
  unint64_t displayContext = self->_displayContext;
  if (displayContext == 1)
  {
    v7 = [v4 primaryButton];
    v8 = PKLocalizedAquamanString(&cfstr_Done.isa);
    [v7 setTitle:v8 forState:0];

    goto LABEL_5;
  }
  if (!displayContext)
  {
    [(PKExplanationViewController *)self setShowDoneButton:1];
    [v4 setPrimaryButton:0];
LABEL_5:
    [v5 setManualEntryButton:0];
  }
  [(PKExplanationViewController *)self setShowCancelButton:0];
  id v9 = PKLocalizedAquamanString(&cfstr_BarcodePayment_7.isa, &stru_1EF1B4C70.isa, self->_issuerName);
  [v3 setTitleText:v9];

  v10 = PKLocalizedAquamanString(&cfstr_BarcodePayment_8.isa, &stru_1EF1B9A70.isa, self->_issuerName, self->_issuerName, self->_issuerName);
  [v3 setBodyText:v10];

  [v3 setShowPrivacyView:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_dismiss
{
  id v2 = [(PKBarcodePaymentPrivacyViewController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
}

@end