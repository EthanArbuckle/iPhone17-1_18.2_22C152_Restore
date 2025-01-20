@interface PKAccountAutomaticPaymentsMinimumPaymentDisclosureViewController
- (PKAccountAutomaticPaymentsMinimumPaymentDisclosureViewController)initWithController:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKAccountAutomaticPaymentsMinimumPaymentDisclosureViewController

- (PKAccountAutomaticPaymentsMinimumPaymentDisclosureViewController)initWithController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountAutomaticPaymentsMinimumPaymentDisclosureViewController;
  v6 = [(PKExplanationViewController *)&v9 initWithContext:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    v7->_featureIdentifier = [v5 featureIdentifier];
  }

  return v7;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PKAccountAutomaticPaymentsMinimumPaymentDisclosureViewController;
  [(PKExplanationViewController *)&v10 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = PKLocalizedFeatureString();
  [v3 setTitleText:v4];

  id v5 = PKLocalizedFeatureString();
  [v3 setBodyText:v5];

  [v3 setDelegate:self];
  [v3 setShowPrivacyView:0];
  v6 = [v3 dockView];
  v7 = [v6 primaryButton];
  v8 = PKLocalizedFeatureString();
  [v7 setTitle:v8 forState:0];

  objc_msgSend(v7, "setContentEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
  objc_super v9 = [v7 titleLabel];
  [v9 setAdjustsFontSizeToFitWidth:1];

  [v7 sizeToFit];
  [(PKExplanationViewController *)self setShowCancelButton:0];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end