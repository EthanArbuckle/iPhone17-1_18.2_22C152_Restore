@interface PKPeerPaymentEmailTermsAccountRequest
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
@end

@implementation PKPeerPaymentEmailTermsAccountRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v9 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:&unk_1EE22B648 queryParameters:0 appleAccountInformation:v7];
      [v9 setHTTPMethod:@"POST"];
      [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      v10 = [MEMORY[0x1E4F1CA60] dictionary];
      [v10 setObject:@"emailTerms" forKey:@"action"];
      v11 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
      [v9 setHTTPBody:v11];

      v12 = (void *)[v9 copy];
      goto LABEL_10;
    }
    v13 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v16);
      int v18 = 138543618;
      v19 = v15;
      __int16 v20 = 2082;
      v21 = "appleAccountInformation";
      goto LABEL_8;
    }
  }
  else
  {
    v13 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      int v18 = 138543618;
      v19 = v15;
      __int16 v20 = 2082;
      v21 = "url";
LABEL_8:
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v18, 0x16u);
    }
  }

  v12 = 0;
LABEL_10:

  return v12;
}

@end