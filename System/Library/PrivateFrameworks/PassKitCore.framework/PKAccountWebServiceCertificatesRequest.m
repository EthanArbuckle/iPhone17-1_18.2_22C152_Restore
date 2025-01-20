@interface PKAccountWebServiceCertificatesRequest
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (unint64_t)destination;
- (void)setBaseURL:(id)a3;
- (void)setDestination:(unint64_t)a3;
@end

@implementation PKAccountWebServiceCertificatesRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (self->_baseURL)
  {
    if (v4)
    {
      v6 = [MEMORY[0x1E4F1CA60] dictionary];
      v7 = v6;
      unint64_t v8 = self->_destination - 1;
      if (v8 > 2) {
        v9 = @"unknown";
      }
      else {
        v9 = off_1E56DD600[v8];
      }
      [v6 setObject:v9 forKeyedSubscript:@"destination"];
      baseURL = self->_baseURL;
      v18 = @"certificates";
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      v16 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v15 queryParameters:v7 appleAccountInformation:v5];

      [v16 setHTTPMethod:@"GET"];
      [v16 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      v13 = (void *)[v16 copy];

      goto LABEL_13;
    }
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      __int16 v21 = 2082;
      v22 = "appleAccountInformation";
      goto LABEL_9;
    }
  }
  else
  {
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      __int16 v21 = 2082;
      v22 = "_baseURL";
LABEL_9:
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (void).cxx_destruct
{
}

@end