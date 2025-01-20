@interface PKInAppPaymentSessionAuthorizationRequest
- (NSArray)supportedNetworks;
- (NSData)applicationData;
- (NSDecimalNumber)transactionAmount;
- (NSString)countryCode;
- (NSString)currencyCode;
- (NSString)merchantIdentifier;
- (PKPaymentApplication)paymentApplication;
- (PKPaymentMerchantSession)merchantSession;
- (unint64_t)merchantCapabilities;
- (void)setApplicationData:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setMerchantCapabilities:(unint64_t)a3;
- (void)setMerchantIdentifier:(id)a3;
- (void)setMerchantSession:(id)a3;
- (void)setPaymentApplication:(id)a3;
- (void)setSupportedNetworks:(id)a3;
- (void)setTransactionAmount:(id)a3;
@end

@implementation PKInAppPaymentSessionAuthorizationRequest

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (void)setPaymentApplication:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
}

- (unint64_t)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (void)setMerchantCapabilities:(unint64_t)a3
{
  self->_merchantCapabilities = a3;
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void)setSupportedNetworks:(id)a3
{
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(id)a3
{
}

- (PKPaymentMerchantSession)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantSession, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
}

@end