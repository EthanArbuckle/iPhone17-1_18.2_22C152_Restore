@interface PKAccountServiceAccountResolutionConfiguration
- (NSDecimalNumber)billPayAmount;
- (PKBusinessChatContext)businessChatContext;
- (PKCreditInstallmentPlan)earlyInstallmentPlan;
- (id)description;
- (int64_t)billPayAmountType;
- (void)setBillPayAmount:(id)a3;
- (void)setBillPayAmountType:(int64_t)a3;
- (void)setBusinessChatContext:(id)a3;
- (void)setEarlyInstallmentPlan:(id)a3;
@end

@implementation PKAccountServiceAccountResolutionConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"earlyInstallmentPlan: '%@'; ", self->_earlyInstallmentPlan];
  [v3 appendFormat:@"businessChatContext: '%@'; ", self->_businessChatContext];
  [v3 appendFormat:@">"];
  return v3;
}

- (PKCreditInstallmentPlan)earlyInstallmentPlan
{
  return self->_earlyInstallmentPlan;
}

- (void)setEarlyInstallmentPlan:(id)a3
{
}

- (PKBusinessChatContext)businessChatContext
{
  return self->_businessChatContext;
}

- (void)setBusinessChatContext:(id)a3
{
}

- (int64_t)billPayAmountType
{
  return self->_billPayAmountType;
}

- (void)setBillPayAmountType:(int64_t)a3
{
  self->_billPayAmountType = a3;
}

- (NSDecimalNumber)billPayAmount
{
  return self->_billPayAmount;
}

- (void)setBillPayAmount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_billPayAmount, 0);
  objc_storeStrong((id *)&self->_businessChatContext, 0);
  objc_storeStrong((id *)&self->_earlyInstallmentPlan, 0);
}

@end