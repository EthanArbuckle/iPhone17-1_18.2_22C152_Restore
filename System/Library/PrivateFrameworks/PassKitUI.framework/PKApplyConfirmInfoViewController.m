@interface PKApplyConfirmInfoViewController
- (PKApplyConfirmInfoViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6;
- (void)_continueAction;
- (void)didSelectActionItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKApplyConfirmInfoViewController

- (PKApplyConfirmInfoViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PKApplyConfirmInfoViewController;
  v12 = [(PKApplyCollectionViewController *)&v16 initWithController:v10 setupDelegate:a4 context:a5 applyPage:v11];
  if (v12)
  {
    v13 = [[PKApplyConfirmInfoSectionController alloc] initWithController:v10 applyPage:v11 delegate:v12];
    sectionController = v12->_sectionController;
    v12->_sectionController = v13;
  }
  return v12;
}

- (void)viewDidLoad
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)PKApplyConfirmInfoViewController;
  [(PKApplyCollectionViewController *)&v7 viewDidLoad];
  v8[0] = self->_sectionController;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v3 animated:0];

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__PKApplyConfirmInfoViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E59CCC50;
  objc_copyWeak(&v5, &location);
  [(PKApplyCollectionViewController *)self setPrimaryButtonAction:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __47__PKApplyConfirmInfoViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _continueAction];
  }

  return 0;
}

- (void)didSelectActionItem:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 contextPrimaryActionIdentifier];
  if (v5)
  {
    v6 = [(PKApplyCollectionViewController *)self controller];
    objc_super v7 = [(PKApplyCollectionViewController *)self page];
    v8 = [(PKApplyCollectionViewController *)self pageTag];
    uint64_t v9 = *MEMORY[0x1E4F86468];
    uint64_t v10 = *MEMORY[0x1E4F86BB0];
    v19[0] = *MEMORY[0x1E4F86308];
    v19[1] = v10;
    v20[0] = v9;
    v20[1] = v5;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    [v6 reportAnalyticsDictionaryForPage:v7 pageTag:v8 additionalValues:v11];

    [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:1];
    objc_initWeak(&location, self);
    v12 = [(PKApplyCollectionViewController *)self controller];
    v13 = [(PKApplyCollectionViewController *)self currentPage];
    v14 = [v13 footerContent];
    v15 = [v14 termsIdentifiers];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__PKApplyConfirmInfoViewController_didSelectActionItem___block_invoke;
    v16[3] = &unk_1E59CB9C8;
    objc_copyWeak(&v17, &location);
    [v12 submitActionIdentifier:v5 termsIdentifiers:v15 odiAttributesDictionary:0 completion:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __56__PKApplyConfirmInfoViewController_didSelectActionItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleNextViewController:v8 displayableError:v5];
  }
}

- (void)_continueAction
{
  v3 = [(PKApplyCollectionViewController *)self currentPage];
  id v4 = [v3 loadingPageContent];
  if (!v4)
  {
    id v5 = [(PKApplyCollectionViewController *)self controller];
    if (![v5 featureIdentifier])
    {
      v6 = [(PKApplyCollectionViewController *)self controller];
      objc_super v7 = [v6 featureApplication];
      [v7 feature];
    }
    id v8 = [(PKApplyCollectionViewController *)self controller];
    uint64_t v9 = [v8 preferredLanguage];

    id v4 = objc_alloc_init(MEMORY[0x1E4F846A8]);
    uint64_t v10 = PKLocalizedApplyFeatureString();
    [v4 setTitle:v10];

    id v11 = PKLocalizedApplyFeatureString();
    [v4 setSubtitle:v11];
  }
  v12 = [v4 identifier];

  if (!v12) {
    [v4 setIdentifier:@"ApplyConfirmInfoVerifying"];
  }
  v27 = [PKApplyVerifyingViewController alloc];
  v13 = [(PKApplyCollectionViewController *)self controller];
  v14 = [(PKApplyCollectionViewController *)self setupDelegate];
  id v15 = v4;
  int64_t v16 = [(PKPaymentSetupOptionsViewController *)self context];
  id v17 = [v3 primaryActionIdentifier];
  v18 = [v3 footerContent];
  v19 = [v18 termsIdentifiers];
  v26 = v3;
  v20 = [v3 actionContent];
  v21 = [v20 odiAttributesDictionary];
  int64_t v22 = v16;
  v23 = v15;
  v24 = [(PKApplyVerifyingViewController *)v27 initWithController:v13 setupDelegate:v14 context:v22 applyPage:v15 actionIdentifierToSubmit:v17 termsIdentifiersToSubmit:v19 odiAttributesDictionaryToSubmit:v21];

  [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  v25 = [(PKApplyConfirmInfoViewController *)self navigationController];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __51__PKApplyConfirmInfoViewController__continueAction__block_invoke;
  v28[3] = &unk_1E59CB100;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v25, "pk_presentPaymentSetupViewController:animated:completion:", v24, 1, v28);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __51__PKApplyConfirmInfoViewController__continueAction__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setShowNavigationBarSpinner:0];
    id WeakRetained = v4;
    if ((a2 & 1) == 0)
    {
      [v4 terminateSetupFlow];
      id WeakRetained = v4;
    }
  }
}

- (void).cxx_destruct
{
}

@end