@interface PKAccountPaymentFundingDetailsApplePayCash
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
@end

@implementation PKAccountPaymentFundingDetailsApplePayCash

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)PKAccountPaymentFundingDetailsApplePayCash;
    BOOL v5 = [(PKAccountPaymentFundingDetails *)&v7 isEqual:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end