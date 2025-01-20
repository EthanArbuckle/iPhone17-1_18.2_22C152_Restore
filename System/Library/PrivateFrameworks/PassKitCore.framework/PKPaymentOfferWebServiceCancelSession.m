@interface PKPaymentOfferWebServiceCancelSession
- (NSError)error;
- (NSSet)sessionIdentifiers;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setError:(id)a3;
- (void)setSessionIdentifiers:(id)a3;
@end

@implementation PKPaymentOfferWebServiceCancelSession

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      __int16 v23 = 2082;
      v24 = "_baseURL";
LABEL_12:
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);
    }
LABEL_13:
    id v15 = 0;
    goto LABEL_14;
  }
  if (!self->_sessionIdentifiers)
  {
    v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      __int16 v23 = 2082;
      v24 = "_sessionIdentifiers";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v20 = @"cancelSession";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v7 = [(PKPaymentOfferWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v6 queryParameters:0 appleAccountInformation:v4];

  [v7 setHTTPMethod:@"POST"];
  [v7 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v9 = [(NSSet *)self->_sessionIdentifiers allObjects];
  [v8 setObject:v9 forKeyedSubscript:@"sessionIdentifiers"];

  error = self->_error;
  if (error)
  {
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSError code](error, "code"));
    [v8 setObject:v11 forKeyedSubscript:@"errorCode"];

    v12 = [(NSError *)self->_error domain];
    [v8 setObject:v12 forKeyedSubscript:@"errorDomain"];

    v13 = [(NSError *)self->_error description];
    [v8 setObject:v13 forKeyedSubscript:@"errorDescription"];
  }
  if (v8)
  {
    v14 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v8];
    [v7 setHTTPBody:v14];
  }
  id v15 = [v7 copy];

LABEL_14:
  return v15;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (NSSet)sessionIdentifiers
{
  return self->_sessionIdentifiers;
}

- (void)setSessionIdentifiers:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end