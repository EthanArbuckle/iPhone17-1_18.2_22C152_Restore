@interface PKPaymentOffersControllerConfiguration
- (NSArray)supportedNetworks;
- (NSDecimalNumber)transactionAmount;
- (NSNumber)adamIdentifier;
- (NSString)currencyCode;
- (NSString)merchantCountryCode;
- (NSString)merchantIdentifier;
- (NSString)merchantName;
- (NSString)originURL;
- (NSString)webMerchantIdentifier;
- (NSString)webMerchantName;
- (PKPaymentOffersControllerConfiguration)initWithTransactionAmount:(id)a3 currencyCode:(id)a4 merchantCountryCode:(id)a5 merchantIdentifier:(id)a6 originURL:(id)a7 webMerchantIdentifier:(id)a8 webMerchantName:(id)a9 merchantName:(id)a10 adamIdentifier:(id)a11 supportedNetworks:(id)a12 merchantCapabilities:(unint64_t)a13 payLaterSuppressionMode:(int64_t)a14 options:(unint64_t)a15;
- (int64_t)payLaterSuppressionMode;
- (unint64_t)merchantCapabilities;
- (unint64_t)options;
- (void)updateMerchantIdentifier:(id)a3 originURL:(id)a4 webMerchantIdentifier:(id)a5 webMerchantName:(id)a6;
- (void)updateTransactionAmount:(id)a3;
@end

@implementation PKPaymentOffersControllerConfiguration

- (PKPaymentOffersControllerConfiguration)initWithTransactionAmount:(id)a3 currencyCode:(id)a4 merchantCountryCode:(id)a5 merchantIdentifier:(id)a6 originURL:(id)a7 webMerchantIdentifier:(id)a8 webMerchantName:(id)a9 merchantName:(id)a10 adamIdentifier:(id)a11 supportedNetworks:(id)a12 merchantCapabilities:(unint64_t)a13 payLaterSuppressionMode:(int64_t)a14 options:(unint64_t)a15
{
  id v37 = a3;
  id obj = a4;
  id v36 = a4;
  id v29 = a5;
  id v35 = a5;
  id v30 = a6;
  id v34 = a6;
  id v33 = a7;
  id v32 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  v38.receiver = self;
  v38.super_class = (Class)PKPaymentOffersControllerConfiguration;
  v25 = [(PKPaymentOffersControllerConfiguration *)&v38 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_transactionAmount, a3);
    objc_storeStrong((id *)&v26->_currencyCode, obj);
    objc_storeStrong((id *)&v26->_merchantCountryCode, v29);
    objc_storeStrong((id *)&v26->_merchantIdentifier, v30);
    objc_storeStrong((id *)&v26->_originURL, a7);
    objc_storeStrong((id *)&v26->_webMerchantIdentifier, a8);
    objc_storeStrong((id *)&v26->_webMerchantName, a9);
    objc_storeStrong((id *)&v26->_merchantName, a10);
    objc_storeStrong((id *)&v26->_adamIdentifier, a11);
    objc_storeStrong((id *)&v26->_supportedNetworks, a12);
    v26->_merchantCapabilities = a13;
    v26->_payLaterSuppressionMode = a14;
    v26->_options = a15;
  }

  return v26;
}

- (void)updateTransactionAmount:(id)a3
{
  v5 = (NSDecimalNumber *)a3;
  transactionAmount = self->_transactionAmount;
  p_transactionAmount = &self->_transactionAmount;
  v6 = transactionAmount;
  v9 = v5;
  if (!v5 || !v6)
  {
    if (v6 == v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (([(NSDecimalNumber *)v6 isEqual:v5] & 1) == 0) {
LABEL_6:
  }
    objc_storeStrong((id *)p_transactionAmount, a3);
LABEL_7:
}

- (void)updateMerchantIdentifier:(id)a3 originURL:(id)a4 webMerchantIdentifier:(id)a5 webMerchantName:(id)a6
{
  v10 = (NSString *)a3;
  v11 = (NSString *)a4;
  v12 = (NSString *)a5;
  v13 = (NSString *)a6;
  merchantIdentifier = self->_merchantIdentifier;
  self->_merchantIdentifier = v10;
  v20 = v10;

  originURL = self->_originURL;
  self->_originURL = v11;
  v16 = v11;

  webMerchantIdentifier = self->_webMerchantIdentifier;
  self->_webMerchantIdentifier = v12;
  v18 = v12;

  webMerchantName = self->_webMerchantName;
  self->_webMerchantName = v13;
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSString)merchantCountryCode
{
  return self->_merchantCountryCode;
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (unint64_t)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (int64_t)payLaterSuppressionMode
{
  return self->_payLaterSuppressionMode;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (NSString)originURL
{
  return self->_originURL;
}

- (NSString)webMerchantIdentifier
{
  return self->_webMerchantIdentifier;
}

- (NSString)webMerchantName
{
  return self->_webMerchantName;
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (NSNumber)adamIdentifier
{
  return self->_adamIdentifier;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_originURL, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_merchantCountryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
}

@end