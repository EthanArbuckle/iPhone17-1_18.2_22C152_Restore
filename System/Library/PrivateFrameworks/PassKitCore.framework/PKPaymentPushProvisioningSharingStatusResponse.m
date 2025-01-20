@interface PKPaymentPushProvisioningSharingStatusResponse
- (PKPaymentPushProvisioningSharingStatusResponse)initWithData:(id)a3;
- (unint64_t)sharingStatus;
@end

@implementation PKPaymentPushProvisioningSharingStatusResponse

- (PKPaymentPushProvisioningSharingStatusResponse)initWithData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentPushProvisioningSharingStatusResponse;
  v3 = [(PKWebServiceResponse *)&v13 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 PKStringForKey:@"status"];
      v4->_sharingStatus = PKPushProvisioningSharingStatusFromString(v6);
    }
    else
    {
      v7 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        v10 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v15 = v9;
        __int16 v16 = 2112;
        v17 = v10;
        id v11 = v10;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v6 = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (unint64_t)sharingStatus
{
  return self->_sharingStatus;
}

@end