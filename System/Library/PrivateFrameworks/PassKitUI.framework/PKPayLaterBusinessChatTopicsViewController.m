@interface PKPayLaterBusinessChatTopicsViewController
- (BOOL)disablesAutomaticDismissalUponEnteringBackground;
- (PKPayLaterBusinessChatTopicsViewController)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7 topics:(id)a8 businessChatContext:(unint64_t)a9;
- (void)_cancelTapped;
- (void)_continueToChat;
- (void)openBusinessChatForTopic:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKPayLaterBusinessChatTopicsViewController

- (PKPayLaterBusinessChatTopicsViewController)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7 topics:(id)a8 businessChatContext:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id obj = a7;
  id v19 = a7;
  id v31 = a8;
  id v20 = a8;
  v32.receiver = self;
  v32.super_class = (Class)PKPayLaterBusinessChatTopicsViewController;
  v21 = [(PKPayLaterViewController *)&v32 initWithPayLaterAccount:v15];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_financingPlan, a5);
    objc_storeStrong((id *)&v22->_payLaterPass, a4);
    objc_storeStrong((id *)&v22->_installment, a6);
    objc_storeStrong((id *)&v22->_payment, obj);
    objc_storeStrong((id *)&v22->_topics, v31);
    v22->_businessChatContext = a9;
    v23 = [[PKPayLaterBusinessChatTopicsSectionController alloc] initWithPayLaterAccount:v15 payLaterPass:v16 financingPlan:v17 installment:v18 payment:v19 topics:v20 businessChatContext:a9 delegate:v22];
    sectionController = v22->_sectionController;
    v22->_sectionController = v23;

    [(PKPayLaterSectionController *)v22->_sectionController setDynamicCollectionDelegate:v22];
    v25 = [(PKPayLaterBusinessChatTopicsViewController *)v22 navigationItem];
    v26 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v22 action:sel__cancelTapped];
    [v25 setLeftBarButtonItem:v26];

    if (a9 - 1 > 2)
    {
      v27 = 0;
    }
    else
    {
      v27 = PKLocalizedCocoonString(&off_1E59DC398[a9 - 1]->isa);
    }
    v28 = [(PKPayLaterBusinessChatTopicsViewController *)v22 navigationItem];
    [v28 setTitle:v27];

    [(PKDynamicCollectionViewController *)v22 setUseItemIdentityWhenUpdating:1];
  }

  return v22;
}

- (void)viewDidLoad
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKPayLaterBusinessChatTopicsViewController;
  [(PKPayLaterViewController *)&v8 viewDidLoad];
  if (self->_businessChatContext == 1)
  {
    v3 = [(PKPaymentSetupOptionsViewController *)self dockView];
    v4 = [v3 primaryButton];
    v5 = PKLocalizedCocoonString(&cfstr_ContinueToChat.isa);
    [v4 setTitle:v5 forState:0];

    [v4 addTarget:self action:sel__continueToChat forControlEvents:0x2000];
    v6 = [v3 footerView];
    [v6 setForceShowSetupLaterButton:1];
    [v6 setManualEntryButton:0];
    [v6 setSetupLaterButton:0];
  }
  v9[0] = self->_sectionController;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v7 animated:0];
}

- (void)openBusinessChatForTopic:(id)a3
{
  id v4 = a3;
  businessChatController = self->_businessChatController;
  if (businessChatController) {
    v6 = businessChatController;
  }
  else {
    v6 = objc_alloc_init(PKBusinessChatController);
  }
  v7 = self->_businessChatController;
  self->_businessChatController = v6;

  objc_initWeak(&location, self);
  objc_super v8 = [PKBusinessChatPayLaterContext alloc];
  v9 = [(PKPayLaterViewController *)self payLaterAccount];
  v10 = [(PKBusinessChatPayLaterContext *)v8 initWithPayLaterAccount:v9 paymentPass:self->_payLaterPass topic:v4 financingPlan:self->_financingPlan installment:self->_installment payment:self->_payment dispute:0];

  v11 = self->_businessChatController;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PKPayLaterBusinessChatTopicsViewController_openBusinessChatForTopic___block_invoke;
  v12[3] = &unk_1E59CB240;
  objc_copyWeak(&v13, &location);
  [(PKBusinessChatController *)v11 openBusinessChatWithContext:v10 completion:v12];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

void __71__PKPayLaterBusinessChatTopicsViewController_openBusinessChatForTopic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__PKPayLaterBusinessChatTopicsViewController_openBusinessChatForTopic___block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __71__PKPayLaterBusinessChatTopicsViewController_openBusinessChatForTopic___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      id v3 = PKAccountDisplayableError();
      id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

      if (v4) {
        [v5 presentViewController:v4 animated:1 completion:0];
      }
      [v5 presentViewController:v4 animated:1 completion:0];
    }
    else
    {
      [WeakRetained dismissViewControllerAnimated:1 completion:0];
    }
    id WeakRetained = v5;
  }
}

- (BOOL)disablesAutomaticDismissalUponEnteringBackground
{
  return 0;
}

- (void)_continueToChat
{
  id v3 = [MEMORY[0x1E4F84960] genericBusinessChatTopicForContext:self->_businessChatContext];
  [(PKPayLaterBusinessChatTopicsViewController *)self openBusinessChatForTopic:v3];
}

- (void)_cancelTapped
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end