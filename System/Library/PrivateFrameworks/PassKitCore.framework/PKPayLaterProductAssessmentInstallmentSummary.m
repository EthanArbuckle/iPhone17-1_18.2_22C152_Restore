@interface PKPayLaterProductAssessmentInstallmentSummary
- (NSArray)installmentAmounts;
- (NSArray)installmentDates;
- (int64_t)installmentCount;
- (void)setInstallmentAmounts:(id)a3;
- (void)setInstallmentCount:(int64_t)a3;
- (void)setInstallmentDates:(id)a3;
@end

@implementation PKPayLaterProductAssessmentInstallmentSummary

- (NSArray)installmentAmounts
{
  return self->_installmentAmounts;
}

- (void)setInstallmentAmounts:(id)a3
{
}

- (NSArray)installmentDates
{
  return self->_installmentDates;
}

- (void)setInstallmentDates:(id)a3
{
}

- (int64_t)installmentCount
{
  return self->_installmentCount;
}

- (void)setInstallmentCount:(int64_t)a3
{
  self->_installmentCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentDates, 0);
  objc_storeStrong((id *)&self->_installmentAmounts, 0);
}

@end