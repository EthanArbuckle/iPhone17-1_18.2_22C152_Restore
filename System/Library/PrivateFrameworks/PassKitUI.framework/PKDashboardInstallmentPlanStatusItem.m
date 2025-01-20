@interface PKDashboardInstallmentPlanStatusItem
+ (id)identifier;
- (PKAccount)account;
- (PKAccountUserCollection)accountUserCollection;
- (PKCreditInstallmentPlan)installmentPlan;
- (PKFamilyMemberCollection)familyMemberCollection;
- (PKTransactionSourceCollection)transactionSourceCollection;
- (void)setAccount:(id)a3;
- (void)setAccountUserCollection:(id)a3;
- (void)setFamilyMemberCollection:(id)a3;
- (void)setInstallmentPlan:(id)a3;
- (void)setTransactionSourceCollection:(id)a3;
@end

@implementation PKDashboardInstallmentPlanStatusItem

+ (id)identifier
{
  return @"installmentStatus";
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

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (void)setAccountUserCollection:(id)a3
{
}

- (PKFamilyMemberCollection)familyMemberCollection
{
  return self->_familyMemberCollection;
}

- (void)setFamilyMemberCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberCollection, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_installmentPlan, 0);
}

@end