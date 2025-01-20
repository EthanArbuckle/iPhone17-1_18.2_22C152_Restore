@interface PKPayLaterFinancingPlanGeneratorConfiguration
+ (id)configurationForBNPLWithTotalPrincipal:(id)a3 daysSinceTransactionStart:(int64_t)a4 payments:(id)a5;
+ (id)configurationWithProductType:(unint64_t)a3 apr:(id)a4 totalPrincipal:(id)a5 installmentCount:(int64_t)a6 daysSinceTransactionStart:(int64_t)a7 merchant:(unint64_t)a8 fundingSources:(unint64_t)a9 payments:(id)a10;
+ (id)configurationWithProductType:(unint64_t)a3 apr:(id)a4 totalPrincipal:(id)a5 installmentCount:(int64_t)a6 daysSinceTransactionStart:(int64_t)a7 payments:(id)a8;
- (BOOL)autoPayment;
- (BOOL)ignoreFuturePayments;
- (NSArray)payments;
- (NSDecimalNumber)apr;
- (NSDecimalNumber)totalPrincipal;
- (NSString)currency;
- (int64_t)daysSinceTransactionStart;
- (int64_t)installmentCount;
- (unint64_t)fundingSources;
- (unint64_t)merchant;
- (unint64_t)productType;
- (unint64_t)scheduleSummaryReason;
- (void)setApr:(id)a3;
- (void)setAutoPayment:(BOOL)a3;
- (void)setCurrency:(id)a3;
- (void)setDaysSinceTransactionStart:(int64_t)a3;
- (void)setFundingSources:(unint64_t)a3;
- (void)setIgnoreFuturePayments:(BOOL)a3;
- (void)setInstallmentCount:(int64_t)a3;
- (void)setMerchant:(unint64_t)a3;
- (void)setPayments:(id)a3;
- (void)setProductType:(unint64_t)a3;
- (void)setScheduleSummaryReason:(unint64_t)a3;
- (void)setTotalPrincipal:(id)a3;
@end

@implementation PKPayLaterFinancingPlanGeneratorConfiguration

+ (id)configurationWithProductType:(unint64_t)a3 apr:(id)a4 totalPrincipal:(id)a5 installmentCount:(int64_t)a6 daysSinceTransactionStart:(int64_t)a7 merchant:(unint64_t)a8 fundingSources:(unint64_t)a9 payments:(id)a10
{
  id v16 = a10;
  id v17 = a5;
  id v18 = a4;
  v19 = objc_alloc_init(PKPayLaterFinancingPlanGeneratorConfiguration);
  [(PKPayLaterFinancingPlanGeneratorConfiguration *)v19 setProductType:a3];
  [(PKPayLaterFinancingPlanGeneratorConfiguration *)v19 setApr:v18];

  [(PKPayLaterFinancingPlanGeneratorConfiguration *)v19 setTotalPrincipal:v17];
  [(PKPayLaterFinancingPlanGeneratorConfiguration *)v19 setInstallmentCount:a6];
  [(PKPayLaterFinancingPlanGeneratorConfiguration *)v19 setDaysSinceTransactionStart:a7];
  [(PKPayLaterFinancingPlanGeneratorConfiguration *)v19 setMerchant:a8];
  [(PKPayLaterFinancingPlanGeneratorConfiguration *)v19 setFundingSources:a9];
  [(PKPayLaterFinancingPlanGeneratorConfiguration *)v19 setPayments:v16];

  [(PKPayLaterFinancingPlanGeneratorConfiguration *)v19 setAutoPayment:1];
  [(PKPayLaterFinancingPlanGeneratorConfiguration *)v19 setCurrency:@"USD"];
  return v19;
}

+ (id)configurationWithProductType:(unint64_t)a3 apr:(id)a4 totalPrincipal:(id)a5 installmentCount:(int64_t)a6 daysSinceTransactionStart:(int64_t)a7 payments:(id)a8
{
  return (id)[a1 configurationWithProductType:a3 apr:a4 totalPrincipal:a5 installmentCount:a6 daysSinceTransactionStart:a7 merchant:1 fundingSources:1 payments:a8];
}

+ (id)configurationForBNPLWithTotalPrincipal:(id)a3 daysSinceTransactionStart:(int64_t)a4 payments:(id)a5
{
  return (id)[a1 configurationWithProductType:1 apr:0 totalPrincipal:a3 installmentCount:4 daysSinceTransactionStart:a4 merchant:1 fundingSources:1 payments:a5];
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (BOOL)autoPayment
{
  return self->_autoPayment;
}

- (void)setAutoPayment:(BOOL)a3
{
  self->_autoPayment = a3;
}

- (NSDecimalNumber)apr
{
  return self->_apr;
}

- (void)setApr:(id)a3
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

- (int64_t)daysSinceTransactionStart
{
  return self->_daysSinceTransactionStart;
}

- (void)setDaysSinceTransactionStart:(int64_t)a3
{
  self->_daysSinceTransactionStart = a3;
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (NSDecimalNumber)totalPrincipal
{
  return self->_totalPrincipal;
}

- (void)setTotalPrincipal:(id)a3
{
}

- (unint64_t)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(unint64_t)a3
{
  self->_merchant = a3;
}

- (unint64_t)fundingSources
{
  return self->_fundingSources;
}

- (void)setFundingSources:(unint64_t)a3
{
  self->_fundingSources = a3;
}

- (unint64_t)scheduleSummaryReason
{
  return self->_scheduleSummaryReason;
}

- (void)setScheduleSummaryReason:(unint64_t)a3
{
  self->_scheduleSummaryReason = a3;
}

- (BOOL)ignoreFuturePayments
{
  return self->_ignoreFuturePayments;
}

- (void)setIgnoreFuturePayments:(BOOL)a3
{
  self->_ignoreFuturePayments = a3;
}

- (NSArray)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_totalPrincipal, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_apr, 0);
}

@end