@interface PKPayLaterBusinessChatTopicExplanationViewController
- (BOOL)disablesAutomaticDismissalUponEnteringBackground;
- (PKPayLaterBusinessChatTopicExplanationViewController)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7 topic:(id)a8 dynamicContent:(id)a9;
- (void)_cancelTapped;
- (void)_openBusinessChat;
- (void)viewDidLoad;
@end

@implementation PKPayLaterBusinessChatTopicExplanationViewController

- (PKPayLaterBusinessChatTopicExplanationViewController)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7 topic:(id)a8 dynamicContent:(id)a9
{
  id v15 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a7;
  id v16 = a8;
  id v17 = a9;
  v31.receiver = self;
  v31.super_class = (Class)PKPayLaterBusinessChatTopicExplanationViewController;
  v18 = [(PKPayLaterViewController *)&v31 initWithPayLaterAccount:v15];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_financingPlan, a5);
    objc_storeStrong((id *)&v19->_payLaterPass, a4);
    objc_storeStrong((id *)&v19->_installment, a6);
    objc_storeStrong((id *)&v19->_payment, a7);
    objc_storeStrong((id *)&v19->_topic, a8);
    uint64_t v20 = [v17 dynamicContentPageForPageType:12];
    dynamicContentPage = v19->_dynamicContentPage;
    v19->_dynamicContentPage = (PKPayLaterDynamicContentPage *)v20;

    v22 = [[PKPayLaterBusinessChatTopicExplanationSectionController alloc] initWithPayLaterAccount:v15 payLaterPass:v30 financingPlan:v29 installment:v28 payment:v27 topic:v16 dynamicContentPage:v19->_dynamicContentPage delegate:v19];
    sectionController = v19->_sectionController;
    v19->_sectionController = v22;

    [(PKPayLaterSectionController *)v19->_sectionController setDynamicCollectionDelegate:v19];
    v24 = [(PKPayLaterBusinessChatTopicExplanationViewController *)v19 navigationItem];
    v25 = PKLocalizedCocoonString(&cfstr_ReportAnIssue.isa);
    [v24 setTitle:v25];
  }
  return v19;
}

- (BOOL)disablesAutomaticDismissalUponEnteringBackground
{
  return 0;
}

- (void)viewDidLoad
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterBusinessChatTopicExplanationViewController;
  [(PKPayLaterViewController *)&v12 viewDidLoad];
  v3 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage headerTitle];
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v3];

  v4 = [(PKPaymentSetupOptionsViewController *)self dockView];
  v5 = [v4 primaryButton];
  v6 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage primaryActionTitle];
  [v5 setTitle:v6 forState:0];

  [v5 addTarget:self action:sel__openBusinessChat forControlEvents:0x2000];
  v7 = [v4 footerView];
  [v7 setForceShowSetupLaterButton:1];
  [v7 setSetupLaterButton:0];
  v8 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage secondaryActionTitle];

  if (v8)
  {
    v9 = [v7 manualEntryButton];
    v10 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage secondaryActionTitle];
    [v9 setTitle:v10 forState:0];

    [v9 addTarget:self action:sel__cancelTapped forControlEvents:64];
  }
  else
  {
    [v7 setManualEntryButton:0];
  }
  v13[0] = self->_sectionController;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v11 animated:0];
}

- (void)_openBusinessChat
{
  businessChatController = self->_businessChatController;
  if (businessChatController) {
    v4 = businessChatController;
  }
  else {
    v4 = objc_alloc_init(PKBusinessChatController);
  }
  v5 = self->_businessChatController;
  self->_businessChatController = v4;

  objc_initWeak(&location, self);
  v6 = [PKBusinessChatPayLaterContext alloc];
  v7 = [(PKPayLaterViewController *)self payLaterAccount];
  v8 = [(PKBusinessChatPayLaterContext *)v6 initWithPayLaterAccount:v7 paymentPass:self->_payLaterPass topic:self->_topic financingPlan:self->_financingPlan installment:self->_installment payment:self->_payment dispute:0];

  v9 = self->_businessChatController;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PKPayLaterBusinessChatTopicExplanationViewController__openBusinessChat__block_invoke;
  v10[3] = &unk_1E59CB240;
  objc_copyWeak(&v11, &location);
  [(PKBusinessChatController *)v9 openBusinessChatWithContext:v8 completion:v10];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __73__PKPayLaterBusinessChatTopicExplanationViewController__openBusinessChat__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__PKPayLaterBusinessChatTopicExplanationViewController__openBusinessChat__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __73__PKPayLaterBusinessChatTopicExplanationViewController__openBusinessChat__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    v5 = WeakRetained;
    id v3 = PKAccountDisplayableError();
    id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    if (v4) {
      [v5 presentViewController:v4 animated:1 completion:0];
    }
    [v5 presentViewController:v4 animated:1 completion:0];

    id WeakRetained = v5;
  }
}

- (void)_cancelTapped
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicContentPage, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end