@interface PKDashboardFinancingPlanGroupItem
+ (id)identifier;
- (PKAccount)payLaterAccount;
- (PKDashboardFinancingPlanGroupItem)initWithFinancingPlansCount:(int64_t)a3 payLaterAccount:(id)a4 paymentIntentController:(id)a5;
- (PKPayLaterPaymentIntentController)paymentIntentController;
- (int64_t)financingPlansCount;
@end

@implementation PKDashboardFinancingPlanGroupItem

- (PKDashboardFinancingPlanGroupItem)initWithFinancingPlansCount:(int64_t)a3 payLaterAccount:(id)a4 paymentIntentController:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKDashboardFinancingPlanGroupItem;
  v11 = [(PKDashboardFinancingPlanGroupItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_financingPlansCount = a3;
    objc_storeStrong((id *)&v11->_payLaterAccount, a4);
    objc_storeStrong((id *)&v12->_paymentIntentController, a5);
  }

  return v12;
}

+ (id)identifier
{
  return @"financingPlanGroupItemIdentifier";
}

- (int64_t)financingPlansCount
{
  return self->_financingPlansCount;
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
}

@end