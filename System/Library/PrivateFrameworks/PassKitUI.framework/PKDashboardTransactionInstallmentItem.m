@interface PKDashboardTransactionInstallmentItem
+ (id)identifier;
- (PKAccount)account;
- (PKCreditInstallmentPlan)installmentPlan;
- (PKTransactionSourceCollection)transactionSourceCollection;
- (void)setAccount:(id)a3;
- (void)setInstallmentPlan:(id)a3;
- (void)setTransactionSourceCollection:(id)a3;
@end

@implementation PKDashboardTransactionInstallmentItem

+ (id)identifier
{
  return @"installment";
}

- (PKCreditInstallmentPlan)installmentPlan
{
  return self->_installmentPlan;
}

- (void)setInstallmentPlan:(id)a3
{
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (void)setTransactionSourceCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_installmentPlan, 0);
}

@end