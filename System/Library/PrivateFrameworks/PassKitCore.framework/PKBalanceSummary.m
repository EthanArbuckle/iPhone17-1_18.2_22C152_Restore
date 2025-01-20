@interface PKBalanceSummary
- (BOOL)isLoading;
- (NSDate)endDate;
- (NSDate)startDate;
- (PKPaymentTransactionGroup)orderedCredits;
- (PKPaymentTransactionGroup)orderedInterestCharges;
- (PKPaymentTransactionGroup)orderedSpendingTransactions;
- (PKPaymentTransactionGroup)rewards;
- (unint64_t)summaryType;
- (void)setEndDate:(id)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setOrderedCredits:(id)a3;
- (void)setOrderedInterestCharges:(id)a3;
- (void)setOrderedSpendingTransactions:(id)a3;
- (void)setRewards:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setSummaryType:(unint64_t)a3;
@end

@implementation PKBalanceSummary

- (unint64_t)summaryType
{
  return self->_summaryType;
}

- (void)setSummaryType:(unint64_t)a3
{
  self->_summaryType = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (PKPaymentTransactionGroup)orderedSpendingTransactions
{
  return self->_orderedSpendingTransactions;
}

- (void)setOrderedSpendingTransactions:(id)a3
{
}

- (PKPaymentTransactionGroup)orderedInterestCharges
{
  return self->_orderedInterestCharges;
}

- (void)setOrderedInterestCharges:(id)a3
{
}

- (PKPaymentTransactionGroup)orderedCredits
{
  return self->_orderedCredits;
}

- (void)setOrderedCredits:(id)a3
{
}

- (PKPaymentTransactionGroup)rewards
{
  return self->_rewards;
}

- (void)setRewards:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewards, 0);
  objc_storeStrong((id *)&self->_orderedCredits, 0);
  objc_storeStrong((id *)&self->_orderedInterestCharges, 0);
  objc_storeStrong((id *)&self->_orderedSpendingTransactions, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end