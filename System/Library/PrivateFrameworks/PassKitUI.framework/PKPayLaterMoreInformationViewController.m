@interface PKPayLaterMoreInformationViewController
- (PKPayLaterMoreInformationViewController)initWithSetupFlowController:(id)a3;
- (void)nextButtonTapped;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPayLaterMoreInformationViewController

- (PKPayLaterMoreInformationViewController)initWithSetupFlowController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterMoreInformationViewController;
  v5 = [(PKPayLaterSetupViewController *)&v11 initWithSetupFlowController:v4 dynamicContentPageType:9];
  if (v5)
  {
    v6 = [PKPayLaterMoreInformationSectionController alloc];
    v7 = [(PKPayLaterSetupViewController *)v5 dynamicContentPage];
    uint64_t v8 = [(PKPayLaterMoreInformationSectionController *)v6 initWithSetupFlowController:v4 dynamicContentPage:v7];
    sectionController = v5->_sectionController;
    v5->_sectionController = (PKPayLaterMoreInformationSectionController *)v8;

    [(PKPayLaterSectionController *)v5->_sectionController setDynamicCollectionDelegate:v5];
  }

  return v5;
}

- (void)viewDidLoad
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterMoreInformationViewController;
  [(PKPayLaterSetupViewController *)&v11 viewDidLoad];
  v3 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
  id v4 = [v3 headerTitle];
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v4];

  v5 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
  v6 = [v5 headerSubtitle];
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v6];

  [(PKPaymentSetupOptionsViewController *)self setShowSearchBar:0];
  [(PKPayLaterSetupViewController *)self setRightBarButton:1];
  v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  uint64_t v8 = [(PKPayLaterMoreInformationViewController *)self view];
  [v8 setBackgroundColor:v7];

  v9 = [(PKDynamicCollectionViewController *)self collectionView];
  [v9 setBackgroundColor:v7];

  v12[0] = self->_sectionController;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v10 animated:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterMoreInformationViewController;
  [(PKPayLaterSetupViewController *)&v6 viewWillAppear:a3];
  id v4 = [(PKPayLaterMoreInformationViewController *)self navigationItem];
  v5 = [v4 rightBarButtonItem];
  [v5 setEnabled:1];
}

- (void)nextButtonTapped
{
  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterMoreInformationViewController;
  [(PKPayLaterSetupViewController *)&v7 nextButtonTapped];
  [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  v3 = [(PKPayLaterSetupViewController *)self setupController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke;
  v4[3] = &unk_1E59CB9C8;
  objc_copyWeak(&v5, &location);
  [v3 nextViewControllerFromState:2 parentViewController:self completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      v9 = [WeakRetained navigationController];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke_2;
      v14[3] = &unk_1E59CB6D8;
      v14[4] = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v14);
    }
    else if (v6)
    {
      v10 = PKAccountDisplayableError();
      id v11 = PKAlertForDisplayableErrorWithHandlers(v10, 0, 0, 0);

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke_3;
      v13[3] = &unk_1E59CA7D0;
      v13[4] = v8;
      [v8 presentViewController:v11 animated:1 completion:v13];
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke_4;
      v12[3] = &unk_1E59CA7D0;
      v12[4] = WeakRetained;
      [WeakRetained dismissSetupFlowWithCompletion:v12];
    }
  }
}

uint64_t __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

uint64_t __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

uint64_t __59__PKPayLaterMoreInformationViewController_nextButtonTapped__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

- (void).cxx_destruct
{
}

@end