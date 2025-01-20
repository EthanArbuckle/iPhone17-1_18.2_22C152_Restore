@interface PKDashboardFinancingPlanInstallmentItem
+ (id)identifier;
- (PKDashboardFinancingPlanInstallmentItem)initWithFinancingPlan:(id)a3 relevantInstallment:(id)a4 paymentIntentController:(id)a5;
- (PKPayLaterFinancingPlan)financingPlan;
- (PKPayLaterInstallment)relevantInstallment;
- (PKPayLaterPaymentIntentController)paymentIntentController;
@end

@implementation PKDashboardFinancingPlanInstallmentItem

- (PKDashboardFinancingPlanInstallmentItem)initWithFinancingPlan:(id)a3 relevantInstallment:(id)a4 paymentIntentController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKDashboardFinancingPlanInstallmentItem;
  v12 = [(PKDashboardFinancingPlanInstallmentItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_financingPlan, a3);
    objc_storeStrong((id *)&v13->_relevantInstallment, a4);
    objc_storeStrong((id *)&v13->_paymentIntentController, a5);
  }

  return v13;
}

+ (id)identifier
{
  return @"financingPlanInstallmentItemIdentifier";
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (PKPayLaterInstallment)relevantInstallment
{
  return self->_relevantInstallment;
}

- (PKPayLaterPaymentIntentController)paymentIntentController
{
  return self->_paymentIntentController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_relevantInstallment, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end