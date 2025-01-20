@interface PKPaymentOfferWebServicePaymentOffers
- (BOOL)handoff;
- (NSArray)supportedNetworks;
- (NSDecimalNumber)amount;
- (NSNumber)adamIdentifier;
- (NSString)challenge;
- (NSString)countryCode;
- (NSString)criteriaIdentifier;
- (NSString)currencyCode;
- (NSString)dpanIdentifier;
- (NSString)fpanIdentifier;
- (NSString)fraudAssessment;
- (NSString)merchantIdentifier;
- (NSString)merchantName;
- (NSString)originURL;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (NSString)sessionIdentifier;
- (NSString)webMerchantIdentifier;
- (NSString)webMerchantName;
- (NSURL)baseURL;
- (PKPaymentDeviceMetadata)deviceMetadata;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (int64_t)payLaterSuppressionMode;
- (void)setAdamIdentifier:(id)a3;
- (void)setAmount:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setCriteriaIdentifier:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDeviceMetadata:(id)a3;
- (void)setDpanIdentifier:(id)a3;
- (void)setFpanIdentifier:(id)a3;
- (void)setFraudAssessment:(id)a3;
- (void)setHandoff:(BOOL)a3;
- (void)setMerchantIdentifier:(id)a3;
- (void)setMerchantName:(id)a3;
- (void)setOriginURL:(id)a3;
- (void)setPassSerialNumber:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPayLaterSuppressionMode:(int64_t)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSupportedNetworks:(id)a3;
- (void)setWebMerchantIdentifier:(id)a3;
- (void)setWebMerchantName:(id)a3;
@end

@implementation PKPaymentOfferWebServicePaymentOffers

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v9 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    v33 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v33);
    *(_DWORD *)buf = 138543618;
    v41 = v34;
    __int16 v42 = 2082;
    v43 = "_baseURL";
LABEL_50:
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_51;
  }
  criteriaIdentifier = self->_criteriaIdentifier;
  if (!criteriaIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    v35 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v35);
    *(_DWORD *)buf = 138543618;
    v41 = v34;
    __int16 v42 = 2082;
    v43 = "_criteriaIdentifier";
    goto LABEL_50;
  }
  if (!self->_sessionIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    v36 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v36);
    *(_DWORD *)buf = 138543618;
    v41 = v34;
    __int16 v42 = 2082;
    v43 = "_sessionIdentifier";
    goto LABEL_50;
  }
  if (!v4)
  {
    v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v37);
      *(_DWORD *)buf = 138543618;
      v41 = v34;
      __int16 v42 = 2082;
      v43 = "appleAccountInformation";
      goto LABEL_50;
    }
LABEL_51:
    id v32 = 0;
    goto LABEL_52;
  }
  v39[0] = @"paymentOffers";
  v39[1] = criteriaIdentifier;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  v9 = [(PKPaymentOfferWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v5];

  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v10 setObject:self->_sessionIdentifier forKeyedSubscript:@"sessionIdentifier"];
  passSerialNumber = self->_passSerialNumber;
  if (passSerialNumber) {
    [v10 setObject:passSerialNumber forKeyedSubscript:@"passSerialNumber"];
  }
  passTypeIdentifier = self->_passTypeIdentifier;
  if (passTypeIdentifier) {
    [v10 setObject:passTypeIdentifier forKeyedSubscript:@"passTypeIdentifier"];
  }
  dpanIdentifier = self->_dpanIdentifier;
  if (dpanIdentifier) {
    [v10 setObject:dpanIdentifier forKeyedSubscript:@"dpanIdentifier"];
  }
  fpanIdentifier = self->_fpanIdentifier;
  if (fpanIdentifier) {
    [v10 setObject:fpanIdentifier forKeyedSubscript:@"fpanIdentifier"];
  }
  amount = self->_amount;
  if (amount)
  {
    v16 = [(NSDecimalNumber *)amount stringValue];
    [v10 setObject:v16 forKeyedSubscript:@"amount"];
  }
  currencyCode = self->_currencyCode;
  if (currencyCode) {
    [v10 setObject:currencyCode forKeyedSubscript:@"currencyCode"];
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    [v10 setObject:countryCode forKeyedSubscript:@"countryCode"];
  }
  supportedNetworks = self->_supportedNetworks;
  if (supportedNetworks) {
    [v10 setObject:supportedNetworks forKeyedSubscript:@"supportedNetworks"];
  }
  v20 = PKApplePayLaterAvailabilityToString(self->_payLaterSuppressionMode);
  [v10 setObject:v20 forKeyedSubscript:@"payLaterSuppressionMode"];

  merchantIdentifier = self->_merchantIdentifier;
  if (merchantIdentifier) {
    [v10 setObject:merchantIdentifier forKeyedSubscript:@"merchantIdentifier"];
  }
  originURL = self->_originURL;
  if (originURL) {
    [v10 setObject:originURL forKeyedSubscript:@"originURL"];
  }
  webMerchantIdentifier = self->_webMerchantIdentifier;
  if (webMerchantIdentifier) {
    [v10 setObject:webMerchantIdentifier forKeyedSubscript:@"webMerchantIdentifier"];
  }
  webMerchantName = self->_webMerchantName;
  if (webMerchantName) {
    [v10 setObject:webMerchantName forKeyedSubscript:@"webMerchantName"];
  }
  merchantName = self->_merchantName;
  if (merchantName) {
    [v10 setObject:merchantName forKeyedSubscript:@"merchantName"];
  }
  adamIdentifier = self->_adamIdentifier;
  if (adamIdentifier) {
    [v10 setObject:adamIdentifier forKeyedSubscript:@"adamIdentifier"];
  }
  fraudAssessment = self->_fraudAssessment;
  if (fraudAssessment) {
    [v10 setObject:fraudAssessment forKeyedSubscript:@"fraudAssessment"];
  }
  challenge = self->_challenge;
  if (challenge) {
    [v10 setObject:challenge forKeyedSubscript:@"challenge"];
  }
  v29 = [(PKPaymentDeviceMetadata *)self->_deviceMetadata dictionaryRepresentation];
  [v10 safelySetObject:v29 forKey:@"deviceMetadata"];

  if (self->_handoff)
  {
    v30 = [NSNumber numberWithBool:1];
    [v10 setObject:v30 forKeyedSubscript:@"handoff"];
  }
  if (v10)
  {
    v31 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
    [v9 setHTTPBody:v31];
  }
  id v32 = [v9 copy];

LABEL_52:
  return v32;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (NSString)criteriaIdentifier
{
  return self->_criteriaIdentifier;
}

- (void)setCriteriaIdentifier:(id)a3
{
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFpanIdentifier:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
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

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void)setSupportedNetworks:(id)a3
{
}

- (int64_t)payLaterSuppressionMode
{
  return self->_payLaterSuppressionMode;
}

- (void)setPayLaterSuppressionMode:(int64_t)a3
{
  self->_payLaterSuppressionMode = a3;
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

- (NSString)fraudAssessment
{
  return self->_fraudAssessment;
}

- (void)setFraudAssessment:(id)a3
{
}

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
}

- (NSString)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (BOOL)handoff
{
  return self->_handoff;
}

- (void)setHandoff:(BOOL)a3
{
  self->_handoff = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_fraudAssessment, 0);
  objc_storeStrong((id *)&self->_adamIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_originURL, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_criteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end