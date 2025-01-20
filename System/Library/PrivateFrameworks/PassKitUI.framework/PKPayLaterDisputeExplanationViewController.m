@interface PKPayLaterDisputeExplanationViewController
+ (id)dynamicContentPageForEvidenceRequiredForDispute:(id)a3;
- (PKPayLaterDisputeExplanationViewController)initWithFinancingPlan:(id)a3 dispute:(id)a4 payLaterAccount:(id)a5 payLaterPass:(id)a6 layout:(unint64_t)a7 dynamicContentPage:(id)a8;
- (void)_resendEmailTapped;
- (void)_showSpinner:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPayLaterDisputeExplanationViewController

- (PKPayLaterDisputeExplanationViewController)initWithFinancingPlan:(id)a3 dispute:(id)a4 payLaterAccount:(id)a5 payLaterPass:(id)a6 layout:(unint64_t)a7 dynamicContentPage:(id)a8
{
  v13 = a3;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  v20 = v19;
  if (a7 == 1 && !v19)
  {
    v20 = [(id)objc_opt_class() dynamicContentPageForEvidenceRequiredForDispute:v16];
  }
  v29.receiver = self;
  v29.super_class = (Class)PKPayLaterDisputeExplanationViewController;
  v21 = [(PKPayLaterViewController *)&v29 initWithPayLaterAccount:v17];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_financingPlan, v13);
    objc_storeStrong((id *)&v22->_dynamicContentPage, v20);
    objc_storeStrong((id *)&v22->_dispute, a4);
    v22->_layout = a7;
    v23 = v18;
    if (!v18)
    {
      v24 = [MEMORY[0x1E4F84898] sharedInstance];
      a7 = [v17 associatedPassUniqueID];
      v28 = v24;
      v13 = [v24 passWithUniqueID:a7];
      v23 = [v13 paymentPass];
    }
    objc_storeStrong((id *)&v22->_payLaterPass, v23);
    if (!v18)
    {
    }
    v25 = [[PKPayLaterDisputeExplanationSectionController alloc] initWithFinancingPlan:v15 payLaterAccount:v17 layout:v22->_layout dynamicContentPage:v20 viewControllerDelegate:v22];
    sectionController = v22->_sectionController;
    v22->_sectionController = v25;
  }
  return v22;
}

- (void)viewDidLoad
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKPayLaterDisputeExplanationViewController;
  [(PKPayLaterViewController *)&v8 viewDidLoad];
  if (self->_layout == 1)
  {
    v3 = [(PKPayLaterDynamicContentPage *)self->_dynamicContentPage primaryActionTitle];
    if (v3)
    {
      v4 = [(PKPaymentSetupOptionsViewController *)self dockView];
      v5 = [v4 footerView];
      [v5 setManualEntryButton:0];
      [v5 setSetupLaterButton:0];
      [v4 setPrimaryButton:0];
      v6 = [v4 primaryButton];
      [v6 setTitle:v3 forState:0];
      [v6 addTarget:self action:sel__resendEmailTapped forControlEvents:0x2000];
    }
  }
  v9[0] = self->_sectionController;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v7 animated:0];
}

- (void)_resendEmailTapped
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F84960]) initWithContext:2 topicType:11];
  v4 = [PKBusinessChatPayLaterContext alloc];
  v5 = [(PKPayLaterViewController *)self payLaterAccount];
  v6 = [(PKBusinessChatPayLaterContext *)v4 initWithPayLaterAccount:v5 paymentPass:self->_payLaterPass topic:v3 financingPlan:self->_financingPlan installment:0 payment:0 dispute:self->_dispute];

  businessChatController = self->_businessChatController;
  if (businessChatController) {
    objc_super v8 = businessChatController;
  }
  else {
    objc_super v8 = objc_alloc_init(PKBusinessChatController);
  }
  v9 = self->_businessChatController;
  self->_businessChatController = v8;

  objc_initWeak(&location, self);
  [(PKPayLaterDisputeExplanationViewController *)self _showSpinner:1];
  v10 = self->_businessChatController;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__PKPayLaterDisputeExplanationViewController__resendEmailTapped__block_invoke;
  v11[3] = &unk_1E59CB240;
  objc_copyWeak(&v12, &location);
  [(PKBusinessChatController *)v10 openBusinessChatWithContext:v6 completion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __64__PKPayLaterDisputeExplanationViewController__resendEmailTapped__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PKPayLaterDisputeExplanationViewController__resendEmailTapped__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __64__PKPayLaterDisputeExplanationViewController__resendEmailTapped__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained _showSpinner:0];
    id v3 = v6;
    if (*(void *)(a1 + 32))
    {
      id v4 = PKAccountDisplayableError();
      id v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);

      if (v5) {
        [v6 presentViewController:v5 animated:1 completion:0];
      }
      [v6 presentViewController:v5 animated:1 completion:0];

      id v3 = v6;
    }
  }
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKPaymentSetupOptionsViewController *)self dockView];
  [v5 setButtonsEnabled:v3 ^ 1];

  [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:v3];
}

+ (id)dynamicContentPageForEvidenceRequiredForDispute:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _MergedGlobals_3_0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_MergedGlobals_3_0, &__block_literal_global_59);
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F84968]);
  id v6 = PKLocalizedCocoonString(&cfstr_DisputeEvidenc.isa);
  [v5 setHeaderTitle:v6];

  id v7 = PKLocalizedCocoonString(&cfstr_DisputeEvidenc_0.isa);
  [v5 setPrimaryActionTitle:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F84970]);
  v9 = [v4 emailAddress];
  v10 = (void *)qword_1E94F56B0;
  v11 = [v4 deadlineDate];
  id v12 = [v10 stringFromDate:v11];

  v13 = (void *)qword_1E94F56B0;
  v14 = [v4 lastUpdated];

  id v15 = [v13 stringFromDate:v14];

  id v16 = PKLocalizedCocoonString(&cfstr_DisputeEvidenc_1.isa, &stru_1EF1B9A70.isa, v9, v15, v12);
  [v8 setContentTitle:v16];

  id v17 = objc_alloc_init(MEMORY[0x1E4F84978]);
  v22[0] = v8;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [v17 setRows:v18];

  id v21 = v17;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  [v5 setSections:v19];

  return v5;
}

uint64_t __94__PKPayLaterDisputeExplanationViewController_dynamicContentPageForEvidenceRequiredForDispute___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1E94F56B0;
  qword_1E94F56B0 = (uint64_t)v0;

  v2 = (void *)qword_1E94F56B0;
  uint64_t v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v2 setCalendar:v3];

  id v4 = (void *)qword_1E94F56B0;

  return [v4 setDateStyle:2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_dynamicContentPage, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_dispute, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end