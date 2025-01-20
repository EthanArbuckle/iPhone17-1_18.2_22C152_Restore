@interface PKPaymentBillingAgreementDataItem
+ (int64_t)dataType;
- (BOOL)isValidWithError:(id *)a3;
- (NSString)billingAgreement;
- (int64_t)context;
@end

@implementation PKPaymentBillingAgreementDataItem

- (int64_t)context
{
  return 1;
}

+ (int64_t)dataType
{
  return 12;
}

- (NSString)billingAgreement
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 paymentRequest];

  v4 = [v3 recurringPaymentRequest];
  v5 = [v3 automaticReloadPaymentRequest];
  v6 = v5;
  if (v4) {
    v5 = v4;
  }
  v7 = [v5 billingAgreement];

  return (NSString *)v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

@end