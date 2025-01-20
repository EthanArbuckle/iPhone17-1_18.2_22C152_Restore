@interface PKPaymentServiceProviderPerformPaymentResponse
- (PKPaymentServiceProviderPerformPaymentResponse)initWithData:(id)a3;
- (PKServiceProviderPurchase)purchase;
@end

@implementation PKPaymentServiceProviderPerformPaymentResponse

- (PKPaymentServiceProviderPerformPaymentResponse)initWithData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentServiceProviderPerformPaymentResponse;
  v3 = [(PKWebServiceResponse *)&v15 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 PKDictionaryForKey:@"purchase"];
      if (v6)
      {
        v7 = [[PKServiceProviderPurchase alloc] initWithDictionary:v6];
        p_super = &v4->_purchase->super;
        v4->_purchase = v7;
LABEL_12:

        return v4;
      }
      v13 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Malformed PKPaymentServiceProviderPerformPaymentResponse: expected \"purchase\" dictionary, however we received %@", buf, 0xCu);
      }

      p_super = &v4->super.super.super;
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
        v17 = v10;
        __int16 v18 = 2112;
        v19 = v11;
        id v12 = v11;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v6 = v4;
    }
    v4 = 0;
    goto LABEL_12;
  }
  return v4;
}

- (PKServiceProviderPurchase)purchase
{
  return self->_purchase;
}

- (void).cxx_destruct
{
}

@end