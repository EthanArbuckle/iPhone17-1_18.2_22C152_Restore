@interface PKPeerPaymentWebServiceBadRequestResponse
- (NSNumber)errorCode;
- (NSString)serverDebugDescription;
- (PKPeerPaymentWebServiceBadRequestResponse)initWithData:(id)a3;
@end

@implementation PKPeerPaymentWebServiceBadRequestResponse

- (PKPeerPaymentWebServiceBadRequestResponse)initWithData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentWebServiceBadRequestResponse;
  v3 = [(PKWebServiceResponse *)&v14 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 PKStringForKey:@"errorCode"];
      v7 = v6;
      if (v6) {
        objc_msgSend(NSNumber, "numberWithInteger:", -[NSObject integerValue](v6, "integerValue"));
      }
      else {
      v10 = [v5 PKNumberForKey:@"errorCode"];
      }
      objc_storeStrong((id *)&v4->_errorCode, v10);

      uint64_t v11 = [v5 PKStringForKey:@"debugDescription"];
      serverDebugDescription = v4->_serverDebugDescription;
      v4->_serverDebugDescription = (NSString *)v11;
    }
    else
    {
      v7 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138543362;
        v16 = v9;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@", buf, 0xCu);
      }
    }
  }
  return v4;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (NSString)serverDebugDescription
{
  return self->_serverDebugDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverDebugDescription, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end