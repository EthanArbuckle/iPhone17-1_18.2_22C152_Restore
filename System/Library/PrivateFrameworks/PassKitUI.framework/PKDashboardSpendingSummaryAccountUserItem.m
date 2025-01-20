@interface PKDashboardSpendingSummaryAccountUserItem
+ (id)identifier;
- (PKAccountUser)accountUser;
- (PKFamilyMember)familyMember;
- (PKSpendingSummary)spendingSummary;
- (void)setAccountUser:(id)a3;
- (void)setFamilyMember:(id)a3;
- (void)setSpendingSummary:(id)a3;
@end

@implementation PKDashboardSpendingSummaryAccountUserItem

+ (id)identifier
{
  return @"spendingSummaryAccountUser";
}

- (PKSpendingSummary)spendingSummary
{
  return self->_spendingSummary;
}

- (void)setSpendingSummary:(id)a3
{
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (void)setAccountUser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);

  objc_storeStrong((id *)&self->_spendingSummary, 0);
}

@end