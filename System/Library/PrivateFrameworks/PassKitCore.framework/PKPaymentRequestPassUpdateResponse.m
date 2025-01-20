@interface PKPaymentRequestPassUpdateResponse
- (NSString)passURL;
- (PKPaymentRequestPassUpdateResponse)initWithData:(id)a3;
- (unint64_t)appletState;
@end

@implementation PKPaymentRequestPassUpdateResponse

- (PKPaymentRequestPassUpdateResponse)initWithData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentRequestPassUpdateResponse;
  v3 = [(PKWebServiceResponse *)&v17 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 PKStringForKey:@"passURL"];
      passURL = v4->_passURL;
      v4->_passURL = (NSString *)v6;

      v8 = [v5 PKStringForKey:@"appletState"];
      if ([v8 isEqualToString:@"upgradePending"])
      {
        uint64_t v9 = 1;
      }
      else
      {
        int v15 = [v8 isEqualToString:@"upgradeCompleted"];
        uint64_t v9 = 2;
        if (!v15) {
          uint64_t v9 = 0;
        }
      }
      v4->_appletState = v9;
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
        v19 = v12;
        __int16 v20 = 2112;
        v21 = v13;
        id v14 = v13;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v8 = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (NSString)passURL
{
  return self->_passURL;
}

- (unint64_t)appletState
{
  return self->_appletState;
}

- (void).cxx_destruct
{
}

@end