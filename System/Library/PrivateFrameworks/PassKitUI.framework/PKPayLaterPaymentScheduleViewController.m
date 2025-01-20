@interface PKPayLaterPaymentScheduleViewController
- (PKPayLaterPaymentScheduleViewController)initWithSetupFlowController:(id)a3 dynamicContentPageType:(unint64_t)a4;
- (void)nextButtonTapped;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPayLaterPaymentScheduleViewController

- (PKPayLaterPaymentScheduleViewController)initWithSetupFlowController:(id)a3 dynamicContentPageType:(unint64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterPaymentScheduleViewController;
  v7 = [(PKPayLaterSetupViewController *)&v15 initWithSetupFlowController:v6 dynamicContentPageType:a4];
  if (v7)
  {
    v7->_setupFlowControllerContext = [v6 controllerContext];
    uint64_t v8 = [v6 selectedFinancingOption];
    selectedFinancingOption = v7->_selectedFinancingOption;
    v7->_selectedFinancingOption = (PKPayLaterFinancingOption *)v8;

    v10 = [PKPayLaterPaymentScheduleSectionController alloc];
    v11 = [(PKPayLaterSetupViewController *)v7 dynamicContentPage];
    uint64_t v12 = [(PKPayLaterPaymentScheduleSectionController *)v10 initWithSetupFlowController:v6 dynamicContentPage:v11 selectedFinancingOption:v7->_selectedFinancingOption delegate:v7];
    sectionController = v7->_sectionController;
    v7->_sectionController = (PKPayLaterPaymentScheduleSectionController *)v12;

    [(PKPayLaterSectionController *)v7->_sectionController setDynamicCollectionDelegate:v7];
  }

  return v7;
}

- (void)nextButtonTapped
{
  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterPaymentScheduleViewController;
  [(PKPayLaterSetupViewController *)&v5 nextButtonTapped];
  [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:1];
  v3 = [(PKPayLaterSetupViewController *)self setupController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke;
  v4[3] = &unk_1E59CB6B0;
  v4[4] = self;
  [v3 nextViewControllerFromState:6 parentViewController:self completion:v4];
}

void __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    uint64_t v8 = [*(id *)(a1 + 32) navigationController];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke_2;
    v15[3] = &unk_1E59CB6D8;
    v15[4] = *(void *)(a1 + 32);
    objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v15);
  }
  else if (v6)
  {
    v9 = PKAccountDisplayableError();
    id v10 = PKAlertForDisplayableErrorWithHandlers(v9, 0, 0, 0);

    v11 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke_3;
    v14[3] = &unk_1E59CA7D0;
    v14[4] = v11;
    [v11 presentViewController:v10 animated:1 completion:v14];
  }
  else
  {
    uint64_t v12 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke_4;
    v13[3] = &unk_1E59CA7D0;
    v13[4] = v12;
    [v12 dismissSetupFlowWithCompletion:v13];
  }
}

uint64_t __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

uint64_t __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

uint64_t __59__PKPayLaterPaymentScheduleViewController_nextButtonTapped__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

- (void)viewDidLoad
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterPaymentScheduleViewController;
  [(PKPayLaterSetupViewController *)&v16 viewDidLoad];
  v3 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
  v4 = [v3 headerTitle];
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v4];

  id v5 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
  id v6 = [v5 headerSubtitle];
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v6];

  [(PKPaymentSetupOptionsViewController *)self setShowSearchBar:0];
  v17[0] = self->_sectionController;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v7 animated:0];

  uint64_t v8 = [(PKPaymentSetupOptionsViewController *)self dockView];
  v9 = [v8 footerView];
  int64_t setupFlowControllerContext = self->_setupFlowControllerContext;
  if (setupFlowControllerContext == 4)
  {
    [(PKPayLaterSetupViewController *)self setRightBarButton:2];
    [v8 setPrimaryButton:0];
    [v9 setManualEntryButton:0];
    [v9 setSetupLaterButton:0];
  }
  else if (!setupFlowControllerContext)
  {
    [(PKPayLaterSetupViewController *)self setRightBarButton:0];
    v11 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
    uint64_t v12 = [v11 primaryActionTitle];

    if (v12)
    {
      v13 = [v8 primaryButton];
      [v13 setTitle:v12 forState:0];

      v14 = [v8 primaryButton];
      [v14 addTarget:self action:sel_nextButtonTapped forControlEvents:64];
    }
    [v9 setManualEntryButton:0];
    [v9 setSetupLaterButton:0];
  }
  objc_super v15 = [(PKPayLaterPaymentScheduleViewController *)self view];
  [v15 setAccessibilityIdentifier:*MEMORY[0x1E4F85960]];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterPaymentScheduleViewController;
  [(PKPayLaterSetupViewController *)&v4 viewWillAppear:a3];
  [(PKPayLaterSetupViewController *)self setDisableRightBarButton:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedFinancingOption, 0);

  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end