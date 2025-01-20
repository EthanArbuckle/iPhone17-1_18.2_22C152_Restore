@interface PKPaymentNotificationActionResponse
- (NSDictionary)aps;
- (NSString)action;
- (NSString)requestID;
- (PKPaymentNotificationActionResponse)initWithData:(id)a3;
@end

@implementation PKPaymentNotificationActionResponse

- (PKPaymentNotificationActionResponse)initWithData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentNotificationActionResponse;
  v3 = [(PKWebServiceResponse *)&v18 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 PKStringForKey:@"requestId"];
      requestID = v4->_requestID;
      v4->_requestID = (NSString *)v6;

      uint64_t v8 = [v5 PKDictionaryForKey:@"aps"];
      aps = v4->_aps;
      v4->_aps = (NSDictionary *)v8;

      uint64_t v10 = [v5 PKStringForKey:@"action"];
      action = (PKPaymentNotificationActionResponse *)v4->_action;
      v4->_action = (NSString *)v10;
    }
    else
    {
      v12 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v20 = v14;
        __int16 v21 = 2112;
        v22 = v15;
        id v16 = v15;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      action = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (NSDictionary)aps
{
  return self->_aps;
}

- (NSString)action
{
  return self->_action;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_aps, 0);
}

@end