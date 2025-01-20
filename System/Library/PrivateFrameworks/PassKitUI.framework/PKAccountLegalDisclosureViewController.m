@interface PKAccountLegalDisclosureViewController
- (PKAccountLegalDisclosureViewController)initWithFeature:(unint64_t)a3;
- (PKAccountLegalDisclosureViewController)initWithFeature:(unint64_t)a3 associatedAccountFeature:(unint64_t)a4;
- (void)explanationViewDidUpdateLayout:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKAccountLegalDisclosureViewController

- (PKAccountLegalDisclosureViewController)initWithFeature:(unint64_t)a3 associatedAccountFeature:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKAccountLegalDisclosureViewController;
  result = [(PKExplanationViewController *)&v7 init];
  if (result)
  {
    result->_feature = a3;
    result->_associatedAccountFeature = a4;
  }
  return result;
}

- (PKAccountLegalDisclosureViewController)initWithFeature:(unint64_t)a3
{
  return [(PKAccountLegalDisclosureViewController *)self initWithFeature:a3 associatedAccountFeature:0];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKAccountLegalDisclosureViewController;
  [(PKExplanationViewController *)&v8 viewDidLoad];
  v3 = [(PKAccountLegalDisclosureViewController *)self navigationItem];
  v4 = PKDynamicLocalizedFeatureString();
  [v3 setTitle:v4];

  v5 = [(PKExplanationViewController *)self explanationView];
  v6 = PKDynamicLocalizedFeatureString();
  [v5 setBodyText:v6];

  [v5 setBodyTextAlignment:4];
  [v5 setHideTitleText:1];
  [v5 setShowPrivacyView:0];
  [(PKExplanationViewController *)self setShowDoneButton:1];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  objc_super v7 = [v5 dockView];
  [v7 setPrimaryButton:0];
}

- (void)explanationViewDidUpdateLayout:(id)a3
{
  id v5 = [a3 scrollView];
  v4 = [(PKAccountLegalDisclosureViewController *)self navigationItem];
  objc_msgSend(v5, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

@end