@interface PKPayLaterFinancingControllerConfiguration
- (BOOL)isMerchantTokenRequest;
- (BOOL)isMultiTokenRequest;
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
- (PKPayLaterFinancingControllerConfiguration)initWithCurrencyCode:(id)a3 channel:(unint64_t)a4;
- (PKPayLaterFinancingControllerConfiguration)initWithTransactionAmount:(id)a3 currencyCode:(id)a4 merchantCountryCode:(id)a5 merchantIdentifier:(id)a6 originURL:(id)a7 webMerchantIdentifier:(id)a8 webMerchantName:(id)a9 merchantName:(id)a10 adamIdentifier:(id)a11 isMerchantTokenRequest:(BOOL)a12 isMultiTokenRequest:(BOOL)a13 channel:(unint64_t)a14 channelType:(unint64_t)a15 supportedNetworks:(id)a16 suppressionMode:(int64_t)a17;
- (int64_t)suppressionMode;
- (unint64_t)channel;
- (unint64_t)channelType;
- (void)setAdamIdentifier:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setIsMerchantTokenRequest:(BOOL)a3;
- (void)setIsMultiTokenRequest:(BOOL)a3;
- (void)setMerchantCountryCode:(id)a3;
- (void)setMerchantIdentifier:(id)a3;
- (void)setMerchantName:(id)a3;
- (void)setOriginURL:(id)a3;
- (void)setSupportedNetworks:(id)a3;
- (void)setSuppressionMode:(int64_t)a3;
- (void)setTransactionAmount:(id)a3;
- (void)setWebMerchantIdentifier:(id)a3;
- (void)setWebMerchantName:(id)a3;
- (void)updateMerchantIdentifier:(id)a3 originURL:(id)a4 webMerchantIdentifier:(id)a5 webMerchantName:(id)a6;
- (void)updateTransactionAmount:(id)a3;
@end

@implementation PKPayLaterFinancingControllerConfiguration

- (PKPayLaterFinancingControllerConfiguration)initWithCurrencyCode:(id)a3 channel:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterFinancingControllerConfiguration;
  v8 = [(PKPayLaterFinancingControllerConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_currencyCode, a3);
    v9->_channel = a4;
  }

  return v9;
}

- (PKPayLaterFinancingControllerConfiguration)initWithTransactionAmount:(id)a3 currencyCode:(id)a4 merchantCountryCode:(id)a5 merchantIdentifier:(id)a6 originURL:(id)a7 webMerchantIdentifier:(id)a8 webMerchantName:(id)a9 merchantName:(id)a10 adamIdentifier:(id)a11 isMerchantTokenRequest:(BOOL)a12 isMultiTokenRequest:(BOOL)a13 channel:(unint64_t)a14 channelType:(unint64_t)a15 supportedNetworks:(id)a16 suppressionMode:(int64_t)a17
{
  id v36 = a3;
  id v35 = a5;
  id v34 = a6;
  id v29 = a7;
  id v33 = a7;
  id v22 = a8;
  id v32 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a16;
  v26 = [(PKPayLaterFinancingControllerConfiguration *)self initWithCurrencyCode:a4 channel:a14];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_transactionAmount, a3);
    objc_storeStrong((id *)&v27->_merchantIdentifier, a6);
    objc_storeStrong((id *)&v27->_originURL, v29);
    objc_storeStrong((id *)&v27->_webMerchantName, a9);
    objc_storeStrong((id *)&v27->_merchantName, a10);
    objc_storeStrong((id *)&v27->_merchantCountryCode, a5);
    objc_storeStrong((id *)&v27->_webMerchantIdentifier, a8);
    objc_storeStrong((id *)&v27->_adamIdentifier, a11);
    v27->_isMerchantTokenRequest = a12;
    v27->_isMultiTokenRequest = a13;
    v27->_channelType = a15;
    objc_storeStrong((id *)&v27->_supportedNetworks, a16);
    v27->_suppressionMode = a17;
  }

  return v27;
}

- (void)updateTransactionAmount:(id)a3
{
}

- (void)updateMerchantIdentifier:(id)a3 originURL:(id)a4 webMerchantIdentifier:(id)a5 webMerchantName:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = (NSString *)[a3 copy];
  merchantIdentifier = self->_merchantIdentifier;
  self->_merchantIdentifier = v13;

  v15 = (NSString *)[v12 copy];
  originURL = self->_originURL;
  self->_originURL = v15;

  v17 = (NSString *)[v11 copy];
  webMerchantIdentifier = self->_webMerchantIdentifier;
  self->_webMerchantIdentifier = v17;

  v19 = (NSString *)[v10 copy];
  webMerchantName = self->_webMerchantName;
  self->_webMerchantName = v19;
}

- (unint64_t)channel
{
  return self->_channel;
}

- (unint64_t)channelType
{
  return self->_channelType;
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

- (NSString)merchantCountryCode
{
  return self->_merchantCountryCode;
}

- (void)setMerchantCountryCode:(id)a3
{
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (NSString)originURL
{
  return self->_originURL;
}

- (void)setOriginURL:(id)a3
{
}

- (NSString)webMerchantIdentifier
{
  return self->_webMerchantIdentifier;
}

- (void)setWebMerchantIdentifier:(id)a3
{
}

- (NSString)webMerchantName
{
  return self->_webMerchantName;
}

- (void)setWebMerchantName:(id)a3
{
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (void)setMerchantName:(id)a3
{
}

- (NSNumber)adamIdentifier
{
  return self->_adamIdentifier;
}

- (void)setAdamIdentifier:(id)a3
{
}

- (BOOL)isMerchantTokenRequest
{
  return self->_isMerchantTokenRequest;
}

- (void)setIsMerchantTokenRequest:(BOOL)a3
{
  self->_isMerchantTokenRequest = a3;
}

- (BOOL)isMultiTokenRequest
{
  return self->_isMultiTokenRequest;
}

- (void)setIsMultiTokenRequest:(BOOL)a3
{
  self->_isMultiTokenRequest = a3;
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void)setSupportedNetworks:(id)a3
{
}

- (int64_t)suppressionMode
{
  return self->_suppressionMode;
}

- (void)setSuppressionMode:(int64_t)a3
{
  self->_suppressionMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_adamIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_originURL, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantCountryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
}

@end