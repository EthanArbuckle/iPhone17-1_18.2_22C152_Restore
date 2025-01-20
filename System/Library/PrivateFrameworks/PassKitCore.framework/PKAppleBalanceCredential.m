@interface PKAppleBalanceCredential
- (BOOL)isFromBackgroundProvisioning;
- (PKAppleBalanceCredential)initWithProduct:(id)a3 eligibilitySource:(int64_t)a4;
- (PKPaymentSetupProduct)product;
- (id)setupProductIdentifier;
- (int64_t)eligibilitySource;
- (void)setIsFromBackgroundProvisioning:(BOOL)a3;
@end

@implementation PKAppleBalanceCredential

- (PKAppleBalanceCredential)initWithProduct:(id)a3 eligibilitySource:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAppleBalanceCredential;
  v8 = [(PKPaymentCredential *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_product, a3);
    v9->_eligibilitySource = a4;
    v9->_isFromBackgroundProvisioning = 0;
    [(PKPaymentCredential *)v9 setCredentialType:135];
    [(PKPaymentCredential *)v9 setCardType:1];
  }

  return v9;
}

- (id)setupProductIdentifier
{
  return [(PKPaymentSetupProduct *)self->_product productIdentifier];
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (int64_t)eligibilitySource
{
  return self->_eligibilitySource;
}

- (BOOL)isFromBackgroundProvisioning
{
  return self->_isFromBackgroundProvisioning;
}

- (void)setIsFromBackgroundProvisioning:(BOOL)a3
{
  self->_isFromBackgroundProvisioning = a3;
}

- (void).cxx_destruct
{
}

@end