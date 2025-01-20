@interface PKPeerPaymentBankLookupRequest
- (NSString)countryCode;
- (NSString)query;
- (PKPeerPaymentBankLookupRequest)initWithCountryCode:(id)a3 query:(id)a4;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setCountryCode:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation PKPeerPaymentBankLookupRequest

- (PKPeerPaymentBankLookupRequest)initWithCountryCode:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentBankLookupRequest;
  v8 = [(PKOverlayableWebServiceRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    countryCode = v8->_countryCode;
    v8->_countryCode = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    query = v8->_query;
    v8->_query = (NSString *)v11;
  }
  return v8;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v12 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    objc_super v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    __int16 v24 = 2082;
    v25 = "url";
LABEL_14:
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_15;
  }
  if (!v7)
  {
    v12 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    __int16 v24 = 2082;
    v25 = "appleAccountInformation";
    goto LABEL_14;
  }
  countryCode = self->_countryCode;
  if (!countryCode)
  {
    v12 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v17 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v17);
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    __int16 v24 = 2082;
    v25 = "_countryCode";
    goto LABEL_14;
  }
  query = self->_query;
  if (query)
  {
    v20[0] = @"countryCode";
    v20[1] = @"query";
    v21[0] = countryCode;
    v21[1] = query;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    v12 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:&unk_1EE22B600 queryParameters:v11 appleAccountInformation:v8];
    [v12 setHTTPMethod:@"GET"];

    id v13 = [v12 copy];
    goto LABEL_16;
  }
  v12 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    __int16 v24 = 2082;
    v25 = "_query";
    goto LABEL_14;
  }
LABEL_15:
  id v13 = 0;
LABEL_16:

  return v13;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end