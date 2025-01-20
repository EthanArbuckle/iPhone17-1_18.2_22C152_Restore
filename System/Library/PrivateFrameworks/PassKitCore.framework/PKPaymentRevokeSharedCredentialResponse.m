@interface PKPaymentRevokeSharedCredentialResponse
- (NSURL)passURL;
- (PKPaymentRevokeSharedCredentialResponse)initWithData:(id)a3;
@end

@implementation PKPaymentRevokeSharedCredentialResponse

- (PKPaymentRevokeSharedCredentialResponse)initWithData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentRevokeSharedCredentialResponse;
  v3 = [(PKWebServiceResponse *)&v15 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = (void *)MEMORY[0x1E4F1CB10];
      v7 = [v5 PKStringForKey:@"passURL"];
      uint64_t v8 = [v6 URLWithString:v7];
      p_super = &v4->_passURL->super;
      v4->_passURL = (NSURL *)v8;
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        v12 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v17 = v11;
        __int16 v18 = 2112;
        v19 = v12;
        id v13 = v12;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v7 = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (void).cxx_destruct
{
}

@end