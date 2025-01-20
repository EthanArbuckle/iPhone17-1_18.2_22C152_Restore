@interface PKPeerPaymentAccountRequest
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
@end

@implementation PKPeerPaymentAccountRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v9 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:&unk_1EE22B4E0 queryParameters:0 appleAccountInformation:v7];
      [v9 setHTTPMethod:@"GET"];
      [v9 setCachePolicy:1];
      v10 = (void *)[v9 copy];

      goto LABEL_10;
    }
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v14);
      int v16 = 138543618;
      v17 = v13;
      __int16 v18 = 2082;
      v19 = "appleAccountInformation";
      goto LABEL_8;
    }
  }
  else
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      int v16 = 138543618;
      v17 = v13;
      __int16 v18 = 2082;
      v19 = "url";
LABEL_8:
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v16, 0x16u);
    }
  }

  v10 = 0;
LABEL_10:

  return v10;
}

@end