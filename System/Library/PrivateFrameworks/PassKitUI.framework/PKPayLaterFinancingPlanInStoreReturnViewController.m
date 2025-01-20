@interface PKPayLaterFinancingPlanInStoreReturnViewController
- (PKPayLaterFinancingPlanInStoreReturnViewController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4;
- (void)didUpdateFinancingPlan:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKPayLaterFinancingPlanInStoreReturnViewController

- (PKPayLaterFinancingPlanInStoreReturnViewController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFinancingPlanInStoreReturnViewController;
  v9 = [(PKPayLaterViewController *)&v16 initWithPayLaterAccount:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_financingPlan, a3);
    v11 = [[PKPayLaterFinancingPlanInStoreReturnSectionController alloc] initWithFinancingPlan:v10->_financingPlan payLaterAccount:v8 delegate:v10];
    sectionController = v10->_sectionController;
    v10->_sectionController = v11;

    [(PKPayLaterSectionController *)v10->_sectionController setDynamicCollectionDelegate:v10];
    v13 = [(PKPayLaterFinancingPlanInStoreReturnViewController *)v10 navigationItem];
    v14 = PKLocalizedCocoonString(&cfstr_InStoreReturnC_2.isa);
    [v13 setTitle:v14];
  }
  return v10;
}

- (void)viewDidLoad
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterFinancingPlanInStoreReturnViewController;
  [(PKPayLaterViewController *)&v4 viewDidLoad];
  v5[0] = self->_sectionController;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v3 animated:0];
}

- (void)didUpdateFinancingPlan:(id)a3
{
  id v11 = a3;
  v5 = [v11 planIdentifier];
  v6 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  id v7 = v5;
  id v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  v9 = v8;
  if (!v7 || !v8)
  {

    goto LABEL_9;
  }
  char v10 = [v7 isEqualToString:v8];

  if (v10)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_financingPlan, a3);
    [(PKPayLaterFinancingPlanInStoreReturnSectionController *)self->_sectionController setFinancingPlan:self->_financingPlan];
    [(PKDynamicCollectionViewController *)self reloadDataAnimated:1];
  }
LABEL_9:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end