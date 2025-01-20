@interface PKAccountWebServiceFinancingOptionsRequest
- (BOOL)isMerchantTokenRequest;
- (BOOL)isMultiTokenRequest;
- (NSArray)supportedNetworks;
- (NSDecimalNumber)amount;
- (NSNumber)adamIdentifier;
- (NSString)accountIdentifier;
- (NSString)countryCode;
- (NSString)currencyCode;
- (NSString)merchantIdentifier;
- (NSString)merchantName;
- (NSString)originURL;
- (NSString)referrerIdentifier;
- (NSString)sessionIdentifier;
- (NSString)webMerchantIdentifier;
- (NSString)webMerchantName;
- (NSURL)baseURL;
- (PKCurrencyAmount)dueNext30Days;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (int64_t)suppressionMode;
- (unint64_t)channel;
- (void)setAccountIdentifier:(id)a3;
- (void)setAdamIdentifier:(id)a3;
- (void)setAmount:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setChannel:(unint64_t)a3;
- (void)setCountryCode:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDueNext30Days:(id)a3;
- (void)setIsMerchantTokenRequest:(BOOL)a3;
- (void)setIsMultiTokenRequest:(BOOL)a3;
- (void)setMerchantIdentifier:(id)a3;
- (void)setMerchantName:(id)a3;
- (void)setOriginURL:(id)a3;
- (void)setReferrerIdentifier:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSupportedNetworks:(id)a3;
- (void)setSuppressionMode:(int64_t)a3;
- (void)setWebMerchantIdentifier:(id)a3;
- (void)setWebMerchantName:(id)a3;
@end

@implementation PKAccountWebServiceFinancingOptionsRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    *(_DWORD *)buf = 138543618;
    v38 = v26;
    __int16 v39 = 2082;
    v40 = "_baseURL";
LABEL_48:
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_49;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    v27 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v27);
    *(_DWORD *)buf = 138543618;
    v38 = v26;
    __int16 v39 = 2082;
    v40 = "_accountIdentifier";
    goto LABEL_48;
  }
  if (!self->_amount)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    v28 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v28);
    *(_DWORD *)buf = 138543618;
    v38 = v26;
    __int16 v39 = 2082;
    v40 = "_amount";
    goto LABEL_48;
  }
  if (!self->_currencyCode)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    v29 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v29);
    *(_DWORD *)buf = 138543618;
    v38 = v26;
    __int16 v39 = 2082;
    v40 = "_currencyCode";
    goto LABEL_48;
  }
  if (self->_channel == 1 && !self->_merchantIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v34);
      *(_DWORD *)buf = 138543618;
      v38 = v26;
      __int16 v39 = 2082;
      v40 = "_merchantIdentifier";
      goto LABEL_48;
    }
    goto LABEL_49;
  }
  if (!v4)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138543618;
      v38 = v26;
      __int16 v39 = 2082;
      v40 = "appleAccountInformation";
      goto LABEL_48;
    }
LABEL_49:
    id v33 = 0;
    goto LABEL_50;
  }
  v36[0] = @"accounts";
  v36[1] = accountIdentifier;
  v36[2] = @"financingOptions";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  v9 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v5];

  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  referrerIdentifier = self->_referrerIdentifier;
  if (referrerIdentifier) {
    [v9 setValue:referrerIdentifier forHTTPHeaderField:@"x-apple-referrer-identifier"];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v12 = [(NSDecimalNumber *)self->_amount stringValue];
  [v11 setObject:v12 forKeyedSubscript:@"amount"];

  [v11 setObject:self->_currencyCode forKeyedSubscript:@"currencyCode"];
  [v11 setObject:self->_countryCode forKeyedSubscript:@"countryCode"];
  [v11 setObject:self->_merchantIdentifier forKeyedSubscript:@"merchantIdentifier"];
  originURL = self->_originURL;
  if (originURL) {
    [v11 setObject:originURL forKeyedSubscript:@"originURL"];
  }
  webMerchantIdentifier = self->_webMerchantIdentifier;
  if (webMerchantIdentifier) {
    [v11 setObject:webMerchantIdentifier forKeyedSubscript:@"webMerchantIdentifier"];
  }
  webMerchantName = self->_webMerchantName;
  if (webMerchantName) {
    [v11 setObject:webMerchantName forKeyedSubscript:@"webMerchantName"];
  }
  merchantName = self->_merchantName;
  if (merchantName) {
    [v11 setObject:merchantName forKeyedSubscript:@"merchantName"];
  }
  adamIdentifier = self->_adamIdentifier;
  if (adamIdentifier) {
    [v11 setObject:adamIdentifier forKeyedSubscript:@"adamIdentifier"];
  }
  if (self->_isMerchantTokenRequest)
  {
    v18 = [NSNumber numberWithBool:1];
    [v11 setObject:v18 forKeyedSubscript:@"isMerchantTokenRequest"];
  }
  if (self->_isMultiTokenRequest)
  {
    v19 = [NSNumber numberWithBool:1];
    [v11 setObject:v19 forKeyedSubscript:@"isMultiTokenRequest"];
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [v11 setObject:sessionIdentifier forKeyedSubscript:@"sessionIdentifier"];
  }
  if (self->_dueNext30Days)
  {
    v21 = +[PKAccountWebServiceRequest currencyAmountFormattedDictionary:](PKAccountWebServiceRequest, "currencyAmountFormattedDictionary:");
    [v11 setObject:v21 forKeyedSubscript:@"dueNext30Days"];
  }
  supportedNetworks = self->_supportedNetworks;
  if (supportedNetworks) {
    [v11 setObject:supportedNetworks forKeyedSubscript:@"supportedNetworks"];
  }
  unint64_t channel = self->_channel;
  if (channel > 3) {
    v24 = @"unknown";
  }
  else {
    v24 = off_1E56F2590[channel];
  }
  [v11 setObject:v24 forKeyedSubscript:@"channel"];
  v31 = PKApplePayLaterAvailabilityToString(self->_suppressionMode);
  [v11 setObject:v31 forKeyedSubscript:@"suppressionMode"];

  if (v11)
  {
    v32 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v11];
    [v9 setHTTPBody:v32];
  }
  id v33 = [v9 copy];

LABEL_50:
  return v33;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
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

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (PKCurrencyAmount)dueNext30Days
{
  return self->_dueNext30Days;
}

- (void)setDueNext30Days:(id)a3
{
}

- (unint64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(unint64_t)a3
{
  self->_unint64_t channel = a3;
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void)setSupportedNetworks:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
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
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_dueNext30Days, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_adamIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_originURL, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end