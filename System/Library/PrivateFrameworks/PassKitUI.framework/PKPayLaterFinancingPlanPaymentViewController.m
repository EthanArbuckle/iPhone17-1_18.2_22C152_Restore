@interface PKPayLaterFinancingPlanPaymentViewController
- (PKPayLaterFinancingPlanPaymentViewController)initWithFinancingPlan:(id)a3 payment:(id)a4 payLaterAccount:(id)a5 paymentIntentController:(id)a6 merchantIcon:(id)a7;
- (void)didUpdateFinancingPlan:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKPayLaterFinancingPlanPaymentViewController

- (PKPayLaterFinancingPlanPaymentViewController)initWithFinancingPlan:(id)a3 payment:(id)a4 payLaterAccount:(id)a5 paymentIntentController:(id)a6 merchantIcon:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PKPayLaterFinancingPlanPaymentViewController;
  v18 = [(PKPayLaterViewController *)&v23 initWithPayLaterAccount:v15];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_financingPlan, a3);
    objc_storeStrong((id *)&v19->_payment, a4);
    v20 = [[PKPayLaterFinancingPlanPaymentSectionController alloc] initWithFinancingPlan:v19->_financingPlan payment:v14 payLaterAccount:v15 paymentIntentController:v16 merchantIcon:v17 delegate:v19];
    sectionController = v19->_sectionController;
    v19->_sectionController = v20;

    [(PKPayLaterSectionController *)v19->_sectionController setDynamicCollectionDelegate:v19];
    [(PKDynamicCollectionViewController *)v19 setUseItemIdentityWhenUpdating:1];
  }

  return v19;
}

- (void)viewDidLoad
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterFinancingPlanPaymentViewController;
  [(PKPayLaterViewController *)&v5 viewDidLoad];
  v6[0] = self->_sectionController;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v3 animated:0];

  v4 = [(PKPayLaterFinancingPlanPaymentViewController *)self view];
  [v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85590]];
}

- (void)didUpdateFinancingPlan:(id)a3
{
  id v5 = a3;
  v6 = [v5 planIdentifier];
  p_financingPlan = &self->_financingPlan;
  v8 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  id v9 = v6;
  id v10 = v8;
  if (v9 == v10)
  {
  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
    {

      goto LABEL_11;
    }
    char v12 = [v9 isEqualToString:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_11;
    }
  }
  objc_storeStrong((id *)&self->_financingPlan, a3);
  [(PKPayLaterFinancingPlanPaymentSectionController *)self->_sectionController setFinancingPlan:*p_financingPlan];
  id v13 = [(PKPayLaterFinancingPlan *)*p_financingPlan scheduleSummary];
  id v14 = [v13 payments];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__PKPayLaterFinancingPlanPaymentViewController_didUpdateFinancingPlan___block_invoke;
  v16[3] = &unk_1E59CBA40;
  v16[4] = self;
  id v15 = objc_msgSend(v14, "pk_firstObjectPassingTest:", v16);

  if (v15)
  {
    objc_storeStrong((id *)&self->_payment, v15);
    [(PKPayLaterFinancingPlanPaymentSectionController *)self->_sectionController setPayment:v15];
  }
  [(PKDynamicCollectionViewController *)self reloadDataAnimated:1];

LABEL_11:
}

uint64_t __71__PKPayLaterFinancingPlanPaymentViewController_didUpdateFinancingPlan___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 paymentIdentifier];
  v4 = [*(id *)(*(void *)(a1 + 32) + 1336) paymentIdentifier];
  id v5 = v3;
  id v6 = v4;
  v7 = v6;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_payment, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end