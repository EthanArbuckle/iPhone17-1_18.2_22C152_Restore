@interface PKDashboardPayLaterEligibleSpendItem
+ (id)identifier;
- (PKAccount)payLaterAccount;
- (PKDashboardPayLaterEligibleSpendItem)initWithPayLaterAccount:(id)a3;
@end

@implementation PKDashboardPayLaterEligibleSpendItem

- (PKDashboardPayLaterEligibleSpendItem)initWithPayLaterAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardPayLaterEligibleSpendItem;
  v6 = [(PKDashboardPayLaterEligibleSpendItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_payLaterAccount, a3);
  }

  return v7;
}

+ (id)identifier
{
  return @"payLaterEligibleSpendItem";
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (void).cxx_destruct
{
}

@end