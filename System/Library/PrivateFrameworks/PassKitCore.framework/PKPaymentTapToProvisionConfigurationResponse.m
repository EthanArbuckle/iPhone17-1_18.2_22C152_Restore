@interface PKPaymentTapToProvisionConfigurationResponse
- (NSData)nonce;
- (PKPaymentTapToProvisionConfigurationResponse)initWithData:(id)a3;
- (int64_t)countryCode;
- (int64_t)currencyCode;
@end

@implementation PKPaymentTapToProvisionConfigurationResponse

- (PKPaymentTapToProvisionConfigurationResponse)initWithData:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentTapToProvisionConfigurationResponse;
  v3 = [(PKWebServiceResponse *)&v21 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = [(PKPaymentTapToProvisionConfigurationResponse *)v6 PKStringForKey:@"nonce"];
      uint64_t v8 = objc_msgSend(v7, "pk_decodeHexadecimal");
      nonce = v4->_nonce;
      v4->_nonce = (NSData *)v8;

      v10 = [(PKPaymentTapToProvisionConfigurationResponse *)v6 PKNumberForKey:@"countryCode"];
      v4->_countryCode = [v10 integerValue];

      v11 = [(PKPaymentTapToProvisionConfigurationResponse *)v6 PKNumberForKey:@"currencyCode"];
      v4->_currencyCode = [v11 integerValue];

      if (v4->_nonce && v4->_countryCode && v4->_currencyCode) {
        goto LABEL_13;
      }
      v12 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v23 = v13;
        id v14 = v13;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Malformed response: missing required fields inside %@", buf, 0xCu);
      }
      p_super = &v4->super.super.super;
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        v18 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v23 = v17;
        __int16 v24 = 2112;
        v25 = v18;
        id v19 = v18;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v6 = v4;
    }

    v4 = 0;
LABEL_13:
  }
  return v4;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (int64_t)countryCode
{
  return self->_countryCode;
}

- (int64_t)currencyCode
{
  return self->_currencyCode;
}

- (void).cxx_destruct
{
}

@end