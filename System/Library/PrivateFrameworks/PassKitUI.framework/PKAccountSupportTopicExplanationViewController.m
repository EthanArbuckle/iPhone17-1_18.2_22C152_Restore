@interface PKAccountSupportTopicExplanationViewController
- (BOOL)shouldShowSupportLink:(id)a3;
- (PKAccountSupportTopicExplanationViewController)initWithAccount:(id)a3 topic:(id)a4 delegate:(id)a5;
- (void)_cancelTapped;
- (void)_openSupportLinkURL:(id)a3 confirmationTitle:(id)a4;
- (void)_performPrimaryAction;
- (void)_showMerchantDetails;
- (void)deselectCells;
- (void)openSupportLink:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKAccountSupportTopicExplanationViewController

- (PKAccountSupportTopicExplanationViewController)initWithAccount:(id)a3 topic:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PKAccountSupportTopicExplanationViewController;
  v12 = [(PKPaymentSetupOptionsViewController *)&v27 initWithProvisioningController:0 context:0 delegate:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topic, a4);
    objc_storeStrong((id *)&v13->_account, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = [PKAccountSupportTopicExplanationContentSectionController alloc];
    v15 = [v10 explanation];
    v16 = [v15 content];
    uint64_t v17 = [(PKAccountSupportTopicExplanationContentSectionController *)v14 initWithContent:v16];
    contentSectionController = v13->_contentSectionController;
    v13->_contentSectionController = (PKAccountSupportTopicExplanationContentSectionController *)v17;

    v19 = [PKAccountSupportTopicExplanationLinkSectionController alloc];
    v20 = [v10 explanation];
    v21 = [v20 link];
    uint64_t v22 = [(PKAccountSupportTopicExplanationLinkSectionController *)v19 initWithLink:v21 delegate:v13];
    linkSectionController = v13->_linkSectionController;
    v13->_linkSectionController = (PKAccountSupportTopicExplanationLinkSectionController *)v22;

    v24 = [(PKAccountSupportTopicExplanationViewController *)v13 navigationItem];
    [(PKAccount *)v13->_account feature];
    v25 = PKLocalizedFeatureString();
    [v24 setTitle:v25];
  }
  return v13;
}

- (void)viewDidLoad
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PKAccountSupportTopicExplanationViewController;
  [(PKPaymentSetupOptionsViewController *)&v18 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  v4 = [(PKDynamicCollectionViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  [(PKPaymentSetupOptionsViewController *)self setHeaderBackgroundColor:v3];
  v5 = [(PKAccountSupportTopic *)self->_topic explanation];
  v6 = [v5 headerTitle];
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v6];

  v7 = [v5 headerSubtitle];
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v7];

  v8 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2998], (void *)*MEMORY[0x1E4FB2788], 2, 0);
  [(PKPaymentSetupOptionsViewController *)self setTitleFont:v8];

  id v9 = [(PKPaymentSetupOptionsViewController *)self dockView];
  id v10 = [v5 primaryActionTitle];
  if (v10)
  {
    id v11 = [v9 primaryButton];
    [v11 setTitle:v10 forState:0];
    [v11 addTarget:self action:sel__performPrimaryAction forControlEvents:0x2000];
  }
  else
  {
    [v9 setPrimaryButton:0];
  }
  v12 = [v9 footerView];
  v13 = [v5 secondaryActionTitle];
  if (v13)
  {
    v14 = [v12 manualEntryButton];
    [v14 setTitle:v13 forState:0];
    [v14 addTarget:self action:sel__cancelTapped forControlEvents:64];
  }
  else
  {
    [v12 setManualEntryButton:0];
  }
  v15 = [(PKAccountSupportTopicExplanationViewController *)self view];
  [v15 setAccessibilityIdentifier:*MEMORY[0x1E4F85A80]];

  linkSectionController = self->_linkSectionController;
  v19[0] = self->_contentSectionController;
  v19[1] = linkSectionController;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [(PKPaymentSetupOptionsViewController *)self setSections:v17 animated:0];
}

- (BOOL)shouldShowSupportLink:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = [WeakRetained shouldShowSupportLink:v4];

  return v6;
}

- (void)openSupportLink:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 action];
  if (v4 == 1)
  {
    [(PKAccountSupportTopicExplanationViewController *)self _showMerchantDetails];
  }
  else if (!v4)
  {
    v5 = [v7 url];
    char v6 = [v7 confirmationTitle];
    [(PKAccountSupportTopicExplanationViewController *)self _openSupportLinkURL:v5 confirmationTitle:v6];
  }
}

- (void)_openSupportLinkURL:(id)a3 confirmationTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 scheme];
  id v9 = [v6 host];
  if ([v8 containsString:@"http"]
    && ([v9 containsString:*MEMORY[0x1E4F88090]] & 1) == 0)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v6];
    [v15 setModalPresentationStyle:2];
    [(PKAccountSupportTopicExplanationViewController *)self presentViewController:v15 animated:1 completion:0];
  }
  else if ([v8 containsString:@"tel"])
  {
    id v10 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v9];
    id v11 = v9;
    if (v10)
    {
      uint64_t v12 = [v10 pkFormattedStringValue];

      id v11 = (id)v12;
    }
    id v23 = v7;
    v24 = v10;
    if ([v7 length])
    {
      id v13 = v7;
    }
    else
    {
      [(PKAccount *)self->_account feature];
      PKLocalizedFeatureString();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v13;
    uint64_t v17 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v13 message:0 preferredStyle:0];
    objc_super v18 = (void *)MEMORY[0x1E4FB1410];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __88__PKAccountSupportTopicExplanationViewController__openSupportLinkURL_confirmationTitle___block_invoke;
    v25[3] = &unk_1E59CB1F0;
    id v26 = v6;
    v19 = [v18 actionWithTitle:v11 style:0 handler:v25];
    [v17 addAction:v19];

    v20 = (void *)MEMORY[0x1E4FB1410];
    [(PKAccount *)self->_account feature];
    v21 = PKLocalizedFeatureString();
    uint64_t v22 = [v20 actionWithTitle:v21 style:1 handler:0];
    [v17 addAction:v22];

    [(PKAccountSupportTopicExplanationViewController *)self presentViewController:v17 animated:1 completion:0];
    id v7 = v23;
  }
  else
  {
    v14 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v14 openSensitiveURL:v6 withOptions:0];
  }
}

void __88__PKAccountSupportTopicExplanationViewController__openSupportLinkURL_confirmationTitle___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:*(void *)(a1 + 32) withOptions:0];
}

- (void)_showMerchantDetails
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 showMerchantDetailsForTransaction];
  }
}

- (void)deselectCells
{
  v2.receiver = self;
  v2.super_class = (Class)PKAccountSupportTopicExplanationViewController;
  [(PKDynamicCollectionViewController *)&v2 deselectCells];
}

- (void)_performPrimaryAction
{
  if ((unint64_t)[(PKAccountSupportTopic *)self->_topic issueType] <= 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained openBusinessChatForTopic:self->_topic];
  }
}

- (void)_cancelTapped
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_linkSectionController, 0);
  objc_storeStrong((id *)&self->_contentSectionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_topic, 0);
}

@end