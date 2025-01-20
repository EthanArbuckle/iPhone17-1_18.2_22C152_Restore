@interface PKPaymentAugmentBaseResponse
- (NSData)networkMerchantIdentifier;
- (PKPaymentAugmentBaseResponse)initWithData:(id)a3;
- (int64_t)cryptogramType;
@end

@implementation PKPaymentAugmentBaseResponse

- (PKPaymentAugmentBaseResponse)initWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentAugmentBaseResponse;
  v3 = [(PKWebServiceResponse *)&v16 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 objectForKey:@"networkMerchantIdentifier"];
      uint64_t v7 = objc_msgSend(v6, "pk_decodeHexadecimal");
      networkMerchantIdentifier = v4->_networkMerchantIdentifier;
      v4->_networkMerchantIdentifier = (NSData *)v7;

      v9 = [v5 objectForKey:@"cryptogramType"];
      v4->_cryptogramType = PKPaymentCryptogramTypeFromString(v9);
    }
    else
    {
      v10 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        __int16 v19 = 2112;
        v20 = v13;
        id v14 = v13;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v9 = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (NSData)networkMerchantIdentifier
{
  return self->_networkMerchantIdentifier;
}

- (int64_t)cryptogramType
{
  return self->_cryptogramType;
}

- (void).cxx_destruct
{
}

@end