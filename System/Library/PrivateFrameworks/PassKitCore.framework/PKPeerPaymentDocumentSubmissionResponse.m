@interface PKPeerPaymentDocumentSubmissionResponse
- (PKPeerPaymentDocumentSubmissionResponse)initWithData:(id)a3;
- (unint64_t)status;
@end

@implementation PKPeerPaymentDocumentSubmissionResponse

- (PKPeerPaymentDocumentSubmissionResponse)initWithData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentDocumentSubmissionResponse;
  v3 = [(PKWebServiceResponse *)&v12 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 objectForKey:@"result"];
      v4->_status = PKPeerPaymentDocumentSubmissionStatusFromString(v6);
    }
    else
    {
      v6 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (objc_class *)objc_opt_class();
        v8 = NSStringFromClass(v7);
        v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        *(_DWORD *)buf = 138543618;
        v14 = v8;
        __int16 v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (unint64_t)status
{
  return self->_status;
}

@end