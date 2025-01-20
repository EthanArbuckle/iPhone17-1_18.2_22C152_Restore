@interface PKPayLaterReviewPlanViewController
- (PKPayLaterReviewPlanViewController)initWithSetupFlowController:(id)a3;
- (void)_createDockView;
- (void)nextButtonTapped;
- (void)viewDidLoad;
@end

@implementation PKPayLaterReviewPlanViewController

- (PKPayLaterReviewPlanViewController)initWithSetupFlowController:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterReviewPlanViewController;
  v5 = [(PKPayLaterSetupViewController *)&v13 initWithSetupFlowController:v4 dynamicContentPageType:4];
  if (v5)
  {
    uint64_t v6 = [v4 selectedFinancingOption];
    selectedFinancingOption = v5->_selectedFinancingOption;
    v5->_selectedFinancingOption = (PKPayLaterFinancingOption *)v6;

    v8 = [PKPayLaterReviewPlanSectionController alloc];
    v9 = [(PKPayLaterSetupViewController *)v5 dynamicContentPage];
    uint64_t v10 = [(PKPayLaterReviewPlanSectionController *)v8 initWithSetupFlowController:v4 dynamicContentPage:v9 financingOption:v5->_selectedFinancingOption delegate:v5];
    sectionController = v5->_sectionController;
    v5->_sectionController = (PKPayLaterReviewPlanSectionController *)v10;

    [(PKPayLaterSectionController *)v5->_sectionController setDynamicCollectionDelegate:v5];
  }

  return v5;
}

- (void)viewDidLoad
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterReviewPlanViewController;
  [(PKPayLaterSetupViewController *)&v9 viewDidLoad];
  v3 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
  id v4 = [v3 headerTitle];
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v4];

  v5 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
  uint64_t v6 = [v5 headerSubtitle];
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v6];

  [(PKPaymentSetupOptionsViewController *)self setShowSearchBar:0];
  [(PKPayLaterReviewPlanViewController *)self _createDockView];
  v10[0] = self->_sectionController;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v7 animated:0];

  v8 = [(PKPayLaterSetupViewController *)self setupController];
  LODWORD(v6) = [v8 controllerContext] == 4;

  [(PKPayLaterSetupViewController *)self setRightBarButton:2 * v6];
}

- (void)nextButtonTapped
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKPayLaterReviewPlanViewController;
  [(PKPayLaterSetupViewController *)&v8 nextButtonTapped];
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PKPayLaterSetupViewController *)self setupController];
    v5 = [v4 selectedFinancingOption];
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "User agreed to financing option %@", buf, 0xCu);
  }
  [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:1];
  uint64_t v6 = [(PKPayLaterSetupViewController *)self setupController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke;
  v7[3] = &unk_1E59CB6B0;
  v7[4] = self;
  [v6 nextViewControllerFromState:8 parentViewController:self completion:v7];
}

void __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_super v8 = [*(id *)(a1 + 32) navigationController];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke_2;
    v15[3] = &unk_1E59CB6D8;
    v15[4] = *(void *)(a1 + 32);
    objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v15);
  }
  else if (v6)
  {
    objc_super v9 = PKAccountDisplayableError();
    id v10 = PKAlertForDisplayableErrorWithHandlers(v9, 0, 0, 0);

    uint64_t v11 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke_3;
    v14[3] = &unk_1E59CA7D0;
    v14[4] = v11;
    [v11 presentViewController:v10 animated:1 completion:v14];
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke_4;
    v13[3] = &unk_1E59CA7D0;
    v13[4] = v12;
    [v12 dismissSetupFlowWithCompletion:v13];
  }
}

uint64_t __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

uint64_t __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

uint64_t __54__PKPayLaterReviewPlanViewController_nextButtonTapped__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

- (void)_createDockView
{
  v3 = [(PKPayLaterSetupViewController *)self setupController];
  uint64_t v4 = [v3 controllerContext];

  if (v4 != 4)
  {
    id v10 = [(PKPaymentSetupOptionsViewController *)self dockView];
    id v5 = [v10 footerView];
    [v5 setManualEntryButton:0];
    [v5 setSetupLaterButton:0];
    id v6 = [v10 primaryButton];
    v7 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
    objc_super v8 = [v7 primaryActionTitle];
    [v6 setTitle:v8 forState:0];

    objc_super v9 = [v10 primaryButton];
    [v9 addTarget:self action:sel_nextButtonTapped forControlEvents:0x2000];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedFinancingOption, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);

  objc_storeStrong((id *)&self->_selectedFundingSource, 0);
}

@end