@interface PKAccountSupportTopicsViewController
- (BOOL)shouldShowSupportLink:(id)a3;
- (PKAccountSupportTopic)suggestedTopic;
- (PKAccountSupportTopicsViewController)initWithAccount:(id)a3;
- (void)_cancelTapped;
- (void)_continueToChat;
- (void)_fetchCommonSupportTopics;
- (void)_reloadSectionControllerWithTopics:(id)a3;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)deselectCells;
- (void)openBusinessChatForTopic:(id)a3;
- (void)reloadItem:(id)a3 animated:(BOOL)a4;
- (void)setSuggestedTopic:(id)a3;
- (void)showExplanationForTopic:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAccountSupportTopicsViewController

- (PKAccountSupportTopicsViewController)initWithAccount:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountSupportTopicsViewController;
  v6 = [(PKPaymentSetupOptionsViewController *)&v12 initWithProvisioningController:0 context:0 delegate:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v7->_loadingTopics = 0;
    v8 = [(PKAccountSupportTopicsViewController *)v7 navigationItem];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v7 action:sel__cancelTapped];
    [v8 setLeftBarButtonItem:v9];

    [v8 setBackButtonDisplayMode:2];
    v10 = PKLocalizedFeatureString();
    [v8 setTitle:v10];
  }
  return v7;
}

- (void)_fetchCommonSupportTopics
{
  self->_loadingTopics = 1;
  [(PKAccountSupportTopicsViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
  id v3 = objc_alloc_init(MEMORY[0x1E4F84368]);
  v4 = [(PKAccount *)self->_account accountBaseURL];
  [v3 setBaseURL:v4];

  id v5 = [(PKAccount *)self->_account accountIdentifier];
  [v3 setAccountIdentifier:v5];

  objc_initWeak(&location, self);
  v6 = [MEMORY[0x1E4F84D50] sharedService];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__PKAccountSupportTopicsViewController__fetchCommonSupportTopics__block_invoke;
  v7[3] = &unk_1E59CEC78;
  objc_copyWeak(&v8, &location);
  [v6 supportTopicsWithRequest:v3 completion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __65__PKAccountSupportTopicsViewController__fetchCommonSupportTopics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKAccountSupportTopicsViewController__fetchCommonSupportTopics__block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __65__PKAccountSupportTopicsViewController__fetchCommonSupportTopics__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1312) = 0;
    [WeakRetained _setNeedsUpdateContentUnavailableConfiguration];
    v4 = [*(id *)(a1 + 32) topics];
    [v3 _reloadSectionControllerWithTopics:v4];
    uint64_t v5 = [v3[165] businessChatTargetDialog];
    id v6 = (void *)v5;
    if (!*(void *)(a1 + 40) && v5 && [v4 count])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __65__PKAccountSupportTopicsViewController__fetchCommonSupportTopics__block_invoke_3;
      v8[3] = &unk_1E59CEC50;
      id v9 = v6;
      id v7 = objc_msgSend(v4, "pk_firstObjectPassingTest:", v8);
      if (v7) {
        [v3 showExplanationForTopic:v7];
      }
    }
  }
}

uint64_t __65__PKAccountSupportTopicsViewController__fetchCommonSupportTopics__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 businessChatTargetDialog];
  v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (void)_reloadSectionControllerWithTopics:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [PKAccountSupportTopicsSectionController alloc];
    account = self->_account;
    [(PKAccount *)account feature];
    id v7 = PKLocalizedFeatureString();
    uint64_t v8 = [v7 uppercaseString];
    id v9 = [(PKAccountSupportTopicsSectionController *)v5 initWithAccount:account topics:v4 sectionTitle:v8 delegate:self];
    sectionTopicController = self->_sectionTopicController;
    self->_sectionTopicController = v9;

    id v11 = [[PKAccountSupportSectionController alloc] initWithAccount:self->_account];
    sectionAccountController = self->_sectionAccountController;
    self->_sectionAccountController = v11;

    v13 = self->_sectionTopicController;
    v15[0] = self->_sectionAccountController;
    v15[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    [(PKPaymentSetupOptionsViewController *)self setSections:v14 animated:1];
  }
  else
  {
    [(PKAccountSupportTopicsViewController *)self _continueToChat];
  }
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKAccountSupportTopicsViewController;
  [(PKPaymentSetupOptionsViewController *)&v8 viewDidLoad];
  id v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  id v4 = [(PKDynamicCollectionViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  [(PKPaymentSetupOptionsViewController *)self setHeaderBackgroundColor:v3];
  id v5 = [(PKPaymentSetupOptionsViewController *)self dockView];
  id v6 = [v5 primaryButton];
  id v7 = PKLocalizedFeatureString();
  [v6 setTitle:v7 forState:0];

  [v6 addTarget:self action:sel__continueToChat forControlEvents:0x2000];
  [(PKAccountSupportTopicsViewController *)self _fetchCommonSupportTopics];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKAccountSupportTopicsViewController;
  [(PKPaymentSetupOptionsViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(PKDynamicCollectionViewController *)self collectionView];
  id v4 = [(PKAccountSupportTopicsViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  if (self->_loadingTopics)
  {
    id v4 = (void *)MEMORY[0x1E4FB1658];
    id v5 = a3;
    id v6 = [v4 loadingConfiguration];
    id v7 = [v6 updatedConfigurationForState:v5];
  }
  else
  {
    id v7 = 0;
  }
  [(PKAccountSupportTopicsViewController *)self _setContentUnavailableConfiguration:v7];
}

- (BOOL)shouldShowSupportLink:(id)a3
{
  return 1;
}

- (void)openBusinessChatForTopic:(id)a3
{
  id v4 = (PKAccountSupportTopic *)a3;
  businessChatController = self->_businessChatController;
  if (businessChatController) {
    id v6 = businessChatController;
  }
  else {
    id v6 = objc_alloc_init(PKBusinessChatController);
  }
  id v7 = self->_businessChatController;
  self->_businessChatController = v6;

  objc_initWeak(&location, self);
  if (!v4)
  {
    suggestedTopic = self->_suggestedTopic;
    if (suggestedTopic) {
      id v9 = suggestedTopic;
    }
    else {
      id v9 = (PKAccountSupportTopic *)[objc_alloc(MEMORY[0x1E4F84290]) initWithOtherTopicForAccount:self->_account];
    }
    id v4 = v9;
  }
  id v10 = [[PKBusinessChatAccountContext alloc] initWithAccount:self->_account topic:v4];
  id v11 = self->_businessChatController;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__PKAccountSupportTopicsViewController_openBusinessChatForTopic___block_invoke;
  v12[3] = &unk_1E59CB240;
  objc_copyWeak(&v13, &location);
  [(PKBusinessChatController *)v11 openBusinessChatWithContext:v10 completion:v12];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

void __65__PKAccountSupportTopicsViewController_openBusinessChatForTopic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PKAccountSupportTopicsViewController_openBusinessChatForTopic___block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __65__PKAccountSupportTopicsViewController_openBusinessChatForTopic___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v5 = WeakRetained;
      id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      if (v4) {
        [v5 presentViewController:v4 animated:1 completion:0];
      }

      id WeakRetained = v5;
    }
  }
}

- (void)showExplanationForTopic:(id)a3
{
  id v4 = a3;
  id v6 = [[PKAccountSupportTopicExplanationViewController alloc] initWithAccount:self->_account topic:v4 delegate:self];

  id v5 = [(PKAccountSupportTopicsViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)deselectCells
{
  v2.receiver = self;
  v2.super_class = (Class)PKAccountSupportTopicsViewController;
  [(PKDynamicCollectionViewController *)&v2 deselectCells];
}

- (void)reloadItem:(id)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PKAccountSupportTopicsViewController;
  [(PKDynamicCollectionViewController *)&v4 reloadItem:a3 animated:a4];
}

- (void)_continueToChat
{
}

- (void)_cancelTapped
{
}

- (PKAccountSupportTopic)suggestedTopic
{
  return self->_suggestedTopic;
}

- (void)setSuggestedTopic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedTopic, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_sectionAccountController, 0);
  objc_storeStrong((id *)&self->_sectionTopicController, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end