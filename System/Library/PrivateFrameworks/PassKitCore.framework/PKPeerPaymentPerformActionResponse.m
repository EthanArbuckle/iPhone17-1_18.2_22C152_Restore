@interface PKPeerPaymentPerformActionResponse
- (BOOL)success;
- (PKPeerPaymentPerformActionResponse)initWithData:(id)a3;
- (int64_t)status;
@end

@implementation PKPeerPaymentPerformActionResponse

- (PKPeerPaymentPerformActionResponse)initWithData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentPerformActionResponse;
  v3 = [(PKWebServiceResponse *)&v15 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      v4->_success = [v6 PKBoolForKey:@"success"];
      v7 = [v6 PKStringForKey:@"status"];

      uint64_t v8 = PKPaymentTransactionStatusFromString(v7);
      if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 2) {
        uint64_t v9 = -1;
      }
      else {
        uint64_t v9 = v8;
      }
      v4->_status = v9;
    }
    else
    {
      v7 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138543618;
        v17 = v11;
        __int16 v18 = 2114;
        v19 = v13;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (BOOL)success
{
  return self->_success;
}

- (int64_t)status
{
  return self->_status;
}

@end