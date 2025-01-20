@interface PKPayLaterFundingSourceViewController
- (PKPayLaterFundingSourceViewController)initWithSetupFlowController:(id)a3;
- (id)_subtitle;
- (id)_title;
- (void)_updateEnabledButtons;
- (void)didSelectFundingSource:(id)a3;
- (void)didUpdateAutoPayment:(BOOL)a3;
- (void)nextButtonTapped;
- (void)reloadFundingSources;
- (void)setShowNavigationBarSpinner:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPayLaterFundingSourceViewController

- (PKPayLaterFundingSourceViewController)initWithSetupFlowController:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterFundingSourceViewController;
  v5 = [(PKPayLaterSetupViewController *)&v20 initWithSetupFlowController:v4 dynamicContentPageType:5];
  if (v5)
  {
    v6 = [v4 financingController];
    v19 = [v6 payLaterAccount];
    v18 = [v6 peerPaymentAccount];
    v7 = [v6 selectedFundingSource];
    v8 = [v4 selectedFinancingOption];
    v9 = [v6 availableFundingSourcesForFinancingOption:v8];
    v10 = v9;
    if (!v7)
    {
      objc_msgSend(v9, "pk_firstObjectPassingTest:", &__block_literal_global_234);
      v7 = (PKPayLaterPaymentSource *)objc_claimAutoreleasedReturnValue();
    }
    v5->_autoPayment = 1;
    selectedFundingSource = v5->_selectedFundingSource;
    v5->_selectedFundingSource = v7;
    v12 = v7;

    v13 = [PKPayLaterFundingSourceSectionController alloc];
    v14 = [(PKPayLaterSetupViewController *)v5 dynamicContentPage];
    uint64_t v15 = [(PKPayLaterFundingSourceSectionController *)v13 initWithPayLaterAccount:v19 dynamicContentPage:v14 peerPaymentAccount:v18 selectedFundingSource:v12 autoPayment:v5->_autoPayment availableFundingSources:v10 setupController:v4 delegate:v5];
    sectionController = v5->_sectionController;
    v5->_sectionController = (PKPayLaterFundingSourceSectionController *)v15;

    [(PKPayLaterSectionController *)v5->_sectionController setDynamicCollectionDelegate:v5];
    [(PKDynamicCollectionViewController *)v5 setUseItemIdentityWhenUpdating:1];
  }
  return v5;
}

BOOL __69__PKPayLaterFundingSourceViewController_initWithSetupFlowController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 priority] == 1000;
}

- (void)viewDidLoad
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterFundingSourceViewController;
  [(PKPayLaterSetupViewController *)&v6 viewDidLoad];
  v3 = [(PKPayLaterFundingSourceViewController *)self _title];
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v3];

  id v4 = [(PKPayLaterFundingSourceViewController *)self _subtitle];
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v4];

  [(PKPaymentSetupOptionsViewController *)self setShowSearchBar:0];
  v7[0] = self->_sectionController;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v5 animated:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterFundingSourceViewController;
  [(PKPayLaterSetupViewController *)&v4 viewWillAppear:a3];
  [(PKPayLaterFundingSourceViewController *)self _updateEnabledButtons];
}

- (void)didSelectFundingSource:(id)a3
{
  objc_storeStrong((id *)&self->_selectedFundingSource, a3);

  [(PKPayLaterFundingSourceViewController *)self _updateEnabledButtons];
}

- (void)didUpdateAutoPayment:(BOOL)a3
{
  self->_autoPayment = a3;
}

- (void)reloadFundingSources
{
  v3 = [(PKPayLaterSetupViewController *)self setupController];
  id v7 = [v3 financingController];

  [v7 refreshAvailableFundingSources];
  objc_super v4 = [(PKPayLaterSetupViewController *)self setupController];
  v5 = [v4 selectedFinancingOption];

  objc_super v6 = [v7 availableFundingSourcesForFinancingOption:v5];
  [(PKPayLaterFundingSourceSectionController *)self->_sectionController setAvailableFundingSources:v6];
  [(PKDynamicCollectionViewController *)self reloadDataAnimated:1];
}

- (void)nextButtonTapped
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterFundingSourceViewController;
  [(PKPayLaterSetupViewController *)&v11 nextButtonTapped];
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(PKPayLaterPaymentSource *)self->_selectedFundingSource name];
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Selected funding source %@ for the financing option", buf, 0xCu);
  }
  v5 = [(PKPayLaterSetupViewController *)self setupController];
  objc_super v6 = [v5 financingController];
  [v6 setSelectedFundingSource:self->_selectedFundingSource];

  id v7 = [(PKPayLaterSetupViewController *)self setupController];
  v8 = [v7 financingController];
  [v8 setAutoPaymentOn:self->_autoPayment];

  [(PKPayLaterFundingSourceViewController *)self setShowNavigationBarSpinner:1];
  v9 = [(PKPayLaterSetupViewController *)self setupController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke;
  v10[3] = &unk_1E59CB6B0;
  v10[4] = self;
  [v9 nextViewControllerFromState:7 parentViewController:self completion:v10];
}

void __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    v8 = [*(id *)(a1 + 32) navigationController];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke_2;
    v15[3] = &unk_1E59CB6D8;
    v15[4] = *(void *)(a1 + 32);
    objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v15);
  }
  else if (v6)
  {
    v9 = PKAccountDisplayableError();
    id v10 = PKAlertForDisplayableErrorWithHandlers(v9, 0, 0, 0);

    objc_super v11 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke_3;
    v14[3] = &unk_1E59CA7D0;
    v14[4] = v11;
    [v11 presentViewController:v10 animated:1 completion:v14];
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke_4;
    v13[3] = &unk_1E59CA7D0;
    v13[4] = v12;
    [v12 dismissSetupFlowWithCompletion:v13];
  }
}

uint64_t __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

uint64_t __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

uint64_t __57__PKPayLaterFundingSourceViewController_nextButtonTapped__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

- (void)setShowNavigationBarSpinner:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterFundingSourceViewController;
  [(PKPaymentSetupOptionsViewController *)&v4 setShowNavigationBarSpinner:a3];
  [(PKPayLaterFundingSourceViewController *)self _updateEnabledButtons];
}

- (id)_title
{
  v3 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
  objc_super v4 = [v3 headerTitle];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(PKPayLaterSetupViewController *)self setupController];
    id v7 = [v6 preferredLanguage];
    PKLocalizedApplyFeatureString();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_subtitle
{
  v3 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
  objc_super v4 = [v3 headerSubtitle];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(PKPayLaterSetupViewController *)self setupController];
    id v7 = [v6 selectedFinancingOption];

    v8 = [v7 dueNow];
    v9 = [v8 currencyAmount];

    id v10 = [(PKPayLaterSetupViewController *)self setupController];
    objc_super v11 = [v10 preferredLanguage];
    v13 = [v9 formattedStringValue];
    PKLocalizedApplyFeatureString();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)_updateEnabledButtons
{
  [(PKPayLaterSetupViewController *)self setDisableRightBarButton:self->_selectedFundingSource == 0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);

  objc_storeStrong((id *)&self->_selectedFundingSource, 0);
}

@end