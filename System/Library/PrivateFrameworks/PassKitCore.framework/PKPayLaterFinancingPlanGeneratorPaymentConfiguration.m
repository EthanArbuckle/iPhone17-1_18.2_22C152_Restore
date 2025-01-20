@interface PKPayLaterFinancingPlanGeneratorPaymentConfiguration
+ (id)paymentConfigurationForDeclinedPaymentForInstallmentNumber:(int64_t)a3;
+ (id)paymentConfigurationForDeclinedPaymentForInstallmentNumber:(int64_t)a3 daysPriorToRelativeInstallmentNumber:(int64_t)a4;
+ (id)paymentConfigurationForDefaultInstallmentNumber:(int64_t)a3;
+ (id)paymentConfigurationForDefaultInstallmentNumber:(int64_t)a3 daysPriorToRelativeInstallmentNumber:(int64_t)a4;
+ (id)paymentConfigurationForDefaultInstallmentNumber:(int64_t)a3 daysPriorToRelativeInstallmentNumber:(int64_t)a4 installmentAmountMultiple:(int64_t)a5;
+ (id)paymentConfigurationForRemainingFinancingPlanBalancRelativeToInstallmentNumber:(int64_t)a3 daysPriorToRelativeInstallmentNumber:(int64_t)a4;
+ (id)paymentConfigurationWithAmount:(id)a3 relativeToInstallmentNumber:(int64_t)a4 daysPriorToRelativeInstallmentNumber:(int64_t)a5;
+ (id)paymentConfigurationWithPaymentType:(unint64_t)a3 amount:(id)a4 relativeToInstallmentNumber:(int64_t)a5 daysPriorToRelativeInstallmentNumber:(int64_t)a6;
+ (id)paymentConfigurationWithPaymentType:(unint64_t)a3 amount:(id)a4 relativeToInstallmentNumber:(int64_t)a5 daysPriorToRelativeInstallmentNumber:(int64_t)a6 fundingSources:(unint64_t)a7;
+ (id)paymentConfigurationWithPaymentType:(unint64_t)a3 relativeToInstallmentNumber:(int64_t)a4 daysPriorToRelativeInstallmentNumber:(int64_t)a5 installmentAmountMultiple:(int64_t)a6;
- (BOOL)forDispute;
- (BOOL)payOffRestOfLoanBalance;
- (NSDecimalNumber)amount;
- (int64_t)daysPriorToRelativeInstallmentNumber;
- (int64_t)installmentAmountMultiple;
- (int64_t)relativeToInstallmentNumber;
- (unint64_t)fundingSources;
- (unint64_t)paymentSubtype;
- (unint64_t)paymentType;
- (void)setAmount:(id)a3;
- (void)setDaysPriorToRelativeInstallmentNumber:(int64_t)a3;
- (void)setForDispute:(BOOL)a3;
- (void)setFundingSources:(unint64_t)a3;
- (void)setInstallmentAmountMultiple:(int64_t)a3;
- (void)setPayOffRestOfLoanBalance:(BOOL)a3;
- (void)setPaymentSubtype:(unint64_t)a3;
- (void)setPaymentType:(unint64_t)a3;
- (void)setRelativeToInstallmentNumber:(int64_t)a3;
@end

@implementation PKPayLaterFinancingPlanGeneratorPaymentConfiguration

+ (id)paymentConfigurationWithPaymentType:(unint64_t)a3 amount:(id)a4 relativeToInstallmentNumber:(int64_t)a5 daysPriorToRelativeInstallmentNumber:(int64_t)a6 fundingSources:(unint64_t)a7
{
  id v11 = a4;
  v12 = objc_alloc_init(PKPayLaterFinancingPlanGeneratorPaymentConfiguration);
  v13 = v12;
  if (a3 <= 1) {
    unint64_t v14 = 1;
  }
  else {
    unint64_t v14 = a3;
  }
  [(PKPayLaterFinancingPlanGeneratorPaymentConfiguration *)v12 setPaymentType:v14];
  [(PKPayLaterFinancingPlanGeneratorPaymentConfiguration *)v13 setAmount:v11];

  [(PKPayLaterFinancingPlanGeneratorPaymentConfiguration *)v13 setRelativeToInstallmentNumber:a5];
  [(PKPayLaterFinancingPlanGeneratorPaymentConfiguration *)v13 setDaysPriorToRelativeInstallmentNumber:a6];
  [(PKPayLaterFinancingPlanGeneratorPaymentConfiguration *)v13 setFundingSources:a7];
  return v13;
}

+ (id)paymentConfigurationWithPaymentType:(unint64_t)a3 amount:(id)a4 relativeToInstallmentNumber:(int64_t)a5 daysPriorToRelativeInstallmentNumber:(int64_t)a6
{
  return (id)[a1 paymentConfigurationWithPaymentType:a3 amount:a4 relativeToInstallmentNumber:a5 daysPriorToRelativeInstallmentNumber:a6 fundingSources:1];
}

+ (id)paymentConfigurationWithAmount:(id)a3 relativeToInstallmentNumber:(int64_t)a4 daysPriorToRelativeInstallmentNumber:(int64_t)a5
{
  return (id)[a1 paymentConfigurationWithPaymentType:1 amount:a3 relativeToInstallmentNumber:a4 daysPriorToRelativeInstallmentNumber:a5 fundingSources:1];
}

+ (id)paymentConfigurationForDefaultInstallmentNumber:(int64_t)a3
{
  return (id)[a1 paymentConfigurationWithAmount:0 relativeToInstallmentNumber:a3 daysPriorToRelativeInstallmentNumber:0];
}

+ (id)paymentConfigurationForDefaultInstallmentNumber:(int64_t)a3 daysPriorToRelativeInstallmentNumber:(int64_t)a4
{
  return (id)[a1 paymentConfigurationWithAmount:0 relativeToInstallmentNumber:a3 daysPriorToRelativeInstallmentNumber:a4];
}

+ (id)paymentConfigurationForDefaultInstallmentNumber:(int64_t)a3 daysPriorToRelativeInstallmentNumber:(int64_t)a4 installmentAmountMultiple:(int64_t)a5
{
  v6 = +[PKPayLaterFinancingPlanGeneratorPaymentConfiguration paymentConfigurationForDefaultInstallmentNumber:a3 daysPriorToRelativeInstallmentNumber:a4];
  [v6 setInstallmentAmountMultiple:a5];
  return v6;
}

+ (id)paymentConfigurationWithPaymentType:(unint64_t)a3 relativeToInstallmentNumber:(int64_t)a4 daysPriorToRelativeInstallmentNumber:(int64_t)a5 installmentAmountMultiple:(int64_t)a6
{
  v7 = [a1 paymentConfigurationForDefaultInstallmentNumber:a4 daysPriorToRelativeInstallmentNumber:a5 installmentAmountMultiple:a6];
  [v7 setPaymentType:a3];
  return v7;
}

+ (id)paymentConfigurationForRemainingFinancingPlanBalancRelativeToInstallmentNumber:(int64_t)a3 daysPriorToRelativeInstallmentNumber:(int64_t)a4
{
  v4 = +[PKPayLaterFinancingPlanGeneratorPaymentConfiguration paymentConfigurationForDefaultInstallmentNumber:a3 daysPriorToRelativeInstallmentNumber:a4];
  [v4 setPayOffRestOfLoanBalance:1];
  return v4;
}

+ (id)paymentConfigurationForDeclinedPaymentForInstallmentNumber:(int64_t)a3
{
  v3 = [a1 paymentConfigurationForDefaultInstallmentNumber:a3];
  [v3 setPaymentType:5];
  return v3;
}

+ (id)paymentConfigurationForDeclinedPaymentForInstallmentNumber:(int64_t)a3 daysPriorToRelativeInstallmentNumber:(int64_t)a4
{
  v4 = [a1 paymentConfigurationForDefaultInstallmentNumber:a3 daysPriorToRelativeInstallmentNumber:a4];
  [v4 setPaymentType:5];
  return v4;
}

- (unint64_t)paymentType
{
  return self->_paymentType;
}

- (void)setPaymentType:(unint64_t)a3
{
  self->_paymentType = a3;
}

- (unint64_t)paymentSubtype
{
  return self->_paymentSubtype;
}

- (void)setPaymentSubtype:(unint64_t)a3
{
  self->_paymentSubtype = a3;
}

- (BOOL)forDispute
{
  return self->_forDispute;
}

- (void)setForDispute:(BOOL)a3
{
  self->_forDispute = a3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (int64_t)relativeToInstallmentNumber
{
  return self->_relativeToInstallmentNumber;
}

- (void)setRelativeToInstallmentNumber:(int64_t)a3
{
  self->_relativeToInstallmentNumber = a3;
}

- (int64_t)daysPriorToRelativeInstallmentNumber
{
  return self->_daysPriorToRelativeInstallmentNumber;
}

- (void)setDaysPriorToRelativeInstallmentNumber:(int64_t)a3
{
  self->_daysPriorToRelativeInstallmentNumber = a3;
}

- (unint64_t)fundingSources
{
  return self->_fundingSources;
}

- (void)setFundingSources:(unint64_t)a3
{
  self->_fundingSources = a3;
}

- (BOOL)payOffRestOfLoanBalance
{
  return self->_payOffRestOfLoanBalance;
}

- (void)setPayOffRestOfLoanBalance:(BOOL)a3
{
  self->_payOffRestOfLoanBalance = a3;
}

- (int64_t)installmentAmountMultiple
{
  return self->_installmentAmountMultiple;
}

- (void)setInstallmentAmountMultiple:(int64_t)a3
{
  self->_installmentAmountMultiple = a3;
}

- (void).cxx_destruct
{
}

@end