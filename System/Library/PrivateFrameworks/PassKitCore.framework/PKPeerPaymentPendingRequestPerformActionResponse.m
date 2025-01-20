@interface PKPeerPaymentPendingRequestPerformActionResponse
- (BOOL)success;
- (NSString)status;
- (PKPeerPaymentPendingRequestPerformActionResponse)initWithData:(id)a3;
@end

@implementation PKPeerPaymentPendingRequestPerformActionResponse

- (PKPeerPaymentPendingRequestPerformActionResponse)initWithData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentPendingRequestPerformActionResponse;
  v3 = [(PKWebServiceResponse *)&v14 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      v4->_success = [v6 PKBoolForKey:@"success"];
      uint64_t v7 = [v6 PKStringForKey:@"status"];

      status = v4->_status;
      v4->_status = (NSString *)v7;
    }
    else
    {
      status = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(status, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138543618;
        v16 = v10;
        __int16 v17 = 2114;
        v18 = v12;
        _os_log_impl(&dword_190E10000, status, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (BOOL)success
{
  return self->_success;
}

- (NSString)status
{
  return self->_status;
}

- (void).cxx_destruct
{
}

@end