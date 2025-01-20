@interface PKPaymentOfferWebServiceCatalogRequest
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setBaseURL:(id)a3;
@end

@implementation PKPaymentOfferWebServiceCatalogRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (baseURL)
  {
    if (v4)
    {
      v14 = @"paymentOfferCatalog";
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      v8 = [(PKPaymentOfferWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v7 queryParameters:0 appleAccountInformation:v5];

      [v8 setHTTPMethod:@"GET"];
      [v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      id v9 = [v8 copy];
      goto LABEL_10;
    }
    v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      __int16 v17 = 2082;
      v18 = "appleAccountInformation";
      goto LABEL_8;
    }
  }
  else
  {
    v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      __int16 v17 = 2082;
      v18 = "_baseURL";
LABEL_8:
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);
    }
  }
  id v9 = 0;
LABEL_10:

  return v9;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end