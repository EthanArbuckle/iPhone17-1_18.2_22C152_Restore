@interface PKApplyProgramConsentViewController
- (PKApplyProgramConsentViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6;
- (void)_termsAccepted:(BOOL)a3 actionIdentifier:(id)a4;
- (void)dealloc;
- (void)explanationViewDidSelectBodyButton:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKApplyProgramConsentViewController

- (PKApplyProgramConsentViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6
{
  id v10 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKApplyProgramConsentViewController;
  v11 = [(PKApplyExplanationViewController *)&v19 initWithController:v10 setupDelegate:a4 context:a5 applyPage:a6];
  if (v11)
  {
    v12 = [v10 featureApplication];
    v13 = [v12 declineDetails];

    uint64_t v14 = [v13 pathTermsIdentifier];
    pathTermsIdentifier = v11->_pathTermsIdentifier;
    v11->_pathTermsIdentifier = (NSString *)v14;

    uint64_t v16 = [v13 pathIdentifier];
    pathIdentifier = v11->_pathIdentifier;
    v11->_pathIdentifier = (NSString *)v16;
  }
  return v11;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKApplyProgramConsentViewController;
  [(PKApplyExplanationViewController *)&v6 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = PKUIImageNamed(@"PTACAppleCardTitanium");
  [v3 setImage:v4];

  v5 = PKUIImageNamed(@"PTACTitle");
  [v3 setTitleImage:v5];

  [v3 setBodyButtonNumberOfLines:2];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKApplyProgramConsentViewController;
  [(PKApplyProgramConsentViewController *)&v6 viewWillDisappear:a3];
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
}

- (void)dealloc
{
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    v4 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PKApplyProgramConsentViewController;
  [(PKApplyProgramConsentViewController *)&v5 dealloc];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Program terms accepted", v7, 2u);
  }

  objc_super v5 = [(PKApplyExplanationViewController *)self currentPage];
  objc_super v6 = [v5 primaryActionIdentifier];
  [(PKApplyProgramConsentViewController *)self _termsAccepted:1 actionIdentifier:v6];
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Program terms declined", v7, 2u);
  }

  objc_super v5 = [(PKApplyExplanationViewController *)self currentPage];
  objc_super v6 = [v5 secondaryActionIdentifier];
  [(PKApplyProgramConsentViewController *)self _termsAccepted:0 actionIdentifier:v6];
}

- (void)explanationViewDidSelectBodyButton:(id)a3
{
  id v4 = a3;
  [(PKApplyExplanationViewController *)self showNavigationBarSpinner:1];
  objc_super v5 = [PKApplyTermsAndConditionsViewController alloc];
  objc_super v6 = [(PKApplyExplanationViewController *)self controller];
  v7 = [(PKApplyExplanationViewController *)self setupDelegate];
  v8 = [(PKApplyTermsAndConditionsViewController *)v5 initWithController:v6 setupDelegate:v7 context:[(PKExplanationViewController *)self context] termsIdentifier:self->_pathTermsIdentifier];

  [(PKApplyTermsAndConditionsViewController *)v8 setPreflightPDFTerms:1];
  [(PKFeatureTermsAndConditionsViewController *)v8 setUseModalPresentation:1];
  objc_initWeak(&location, self);
  v9 = [(PKApplyProgramConsentViewController *)self navigationController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__PKApplyProgramConsentViewController_explanationViewDidSelectBodyButton___block_invoke;
  v10[3] = &unk_1E59CB100;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v8, 1, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __74__PKApplyProgramConsentViewController_explanationViewDidSelectBodyButton___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained showNavigationBarSpinner:0];
    id WeakRetained = v2;
  }
}

- (void)_termsAccepted:(BOOL)a3 actionIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!self->_inUseAssertion)
  {
    v7 = (void *)MEMORY[0x1E4F1E5E8];
    v8 = PKPassKitCoreBundle();
    v9 = (CLInUseAssertion *)[v7 newAssertionForBundle:v8 withReason:@"Accepting program terms"];
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v9;
  }
  [(PKApplyExplanationViewController *)self showNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  id v11 = [(PKApplyExplanationViewController *)self controller];
  pathTermsIdentifier = self->_pathTermsIdentifier;
  pathIdentifier = self->_pathIdentifier;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__PKApplyProgramConsentViewController__termsAccepted_actionIdentifier___block_invoke;
  v14[3] = &unk_1E59CB9C8;
  objc_copyWeak(&v15, &location);
  [v11 termsAccepted:v4 termsIdentifier:pathTermsIdentifier secondaryIdentifier:pathIdentifier actionIdentifier:v6 completion:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __71__PKApplyProgramConsentViewController__termsAccepted_actionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleNextViewController:v8 displayableError:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathIdentifier, 0);
  objc_storeStrong((id *)&self->_pathTermsIdentifier, 0);

  objc_storeStrong((id *)&self->_inUseAssertion, 0);
}

@end