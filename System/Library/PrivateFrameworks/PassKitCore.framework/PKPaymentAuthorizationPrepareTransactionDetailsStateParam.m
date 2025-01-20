@interface PKPaymentAuthorizationPrepareTransactionDetailsStateParam
+ (id)paramWithMerchantSession:(id)a3 secureElementIdentifier:(id)a4 transactionAmount:(id)a5 currencyCode:(id)a6;
- (NSDecimalNumber)transactionAmount;
- (NSString)currencyCode;
- (NSString)secureElementIdentifier;
- (PKPaymentMerchantSession)merchantSession;
- (id)description;
- (void)setCurrencyCode:(id)a3;
- (void)setMerchantSession:(id)a3;
- (void)setSecureElementIdentifier:(id)a3;
- (void)setTransactionAmount:(id)a3;
@end

@implementation PKPaymentAuthorizationPrepareTransactionDetailsStateParam

+ (id)paramWithMerchantSession:(id)a3 secureElementIdentifier:(id)a4 transactionAmount:(id)a5 currencyCode:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [a1 param];
  [v14 setMerchantSession:v13];

  [v14 setSecureElementIdentifier:v12];
  [v14 setTransactionAmount:v11];

  [v14 setCurrencyCode:v10];
  return v14;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; merchantSession: %@; secureElementIdentifier: %@; transactionAmount: %@, currencyCode: %@;>",
    v5,
    self,
    self->_merchantSession,
    self->_secureElementIdentifier,
    @"<redacted>",
  v6 = self->_currencyCode);

  return v6;
}

- (PKPaymentMerchantSession)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantSession, 0);
}

@end