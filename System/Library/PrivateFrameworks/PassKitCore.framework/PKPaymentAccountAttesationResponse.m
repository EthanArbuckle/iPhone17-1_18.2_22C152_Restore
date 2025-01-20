@interface PKPaymentAccountAttesationResponse
- (NSData)attestation;
- (PKPaymentAccountAttesationResponse)initWithData:(id)a3;
@end

@implementation PKPaymentAccountAttesationResponse

- (PKPaymentAccountAttesationResponse)initWithData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentAccountAttesationResponse;
  v3 = [(PKWebServiceResponse *)&v14 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 PKStringForKey:@"attestation"];
      uint64_t v7 = objc_msgSend(v6, "pk_decodeHexadecimal");
      p_super = &v4->_attestation->super;
      v4->_attestation = (NSData *)v7;
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        v11 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v16 = v10;
        __int16 v17 = 2112;
        v18 = v11;
        id v12 = v11;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v6 = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (NSData)attestation
{
  return self->_attestation;
}

- (void).cxx_destruct
{
}

@end