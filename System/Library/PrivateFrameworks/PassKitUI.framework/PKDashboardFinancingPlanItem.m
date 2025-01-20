@interface PKDashboardFinancingPlanItem
+ (id)identifier;
- (PKAccount)payLaterAccount;
- (PKDashboardFinancingPlanItem)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 paymentIntentController:(id)a5;
- (PKPayLaterFinancingPlan)financingPlan;
- (PKPayLaterPaymentIntentController)paymentIntentController;
@end

@implementation PKDashboardFinancingPlanItem

- (PKDashboardFinancingPlanItem)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 paymentIntentController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKDashboardFinancingPlanItem;
  v12 = [(PKDashboardFinancingPlanItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_financingPlan, a3);
    objc_storeStrong((id *)&v13->_payLaterAccount, a4);
    objc_storeStrong((id *)&v13->_paymentIntentController, a5);
  }

  return v13;
}

+ (id)identifier
{
  return @"financingPlanItemIdentifier";
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (PKPayLaterPaymentIntentController)paymentIntentController
{
  return self->_paymentIntentController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end