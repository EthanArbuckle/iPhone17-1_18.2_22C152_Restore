@interface PKVPANNonceResponse
- (NSString)nonce;
- (PKVPANNonceResponse)initWithData:(id)a3;
@end

@implementation PKVPANNonceResponse

- (PKVPANNonceResponse)initWithData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PKVPANNonceResponse;
  v3 = [(PKWebServiceResponse *)&v14 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 PKStringForKey:@"nOnce"];
      nonce = v4->_nonce;
      v4->_nonce = (NSString *)v6;

      if (v4->_nonce)
      {
LABEL_9:

        return v4;
      }
      v8 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v5;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Malformed response: no nonce %@", buf, 0xCu);
      }
    }
    else
    {
      v8 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        v11 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v16 = v10;
        __int16 v17 = 2112;
        v18 = v11;
        id v12 = v11;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
    }

    v4 = 0;
    goto LABEL_9;
  }
  return v4;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void).cxx_destruct
{
}

@end