@interface PKPeerPaymentServiceRegistrationResponse
- (NSString)deviceIdentifier;
- (NSString)peerPaymentServicesPushTopic;
- (NSURL)peerPaymentServiceURL;
- (PKPeerPaymentServiceRegistrationResponse)initWithData:(id)a3;
@end

@implementation PKPeerPaymentServiceRegistrationResponse

- (PKPeerPaymentServiceRegistrationResponse)initWithData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentServiceRegistrationResponse;
  v3 = [(PKWebServiceResponse *)&v18 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      uint64_t v7 = [v6 PKStringForKey:@"deviceIdentifier"];
      deviceIdentifier = v4->_deviceIdentifier;
      v4->_deviceIdentifier = (NSString *)v7;

      uint64_t v9 = [v6 PKStringForKey:@"peerPaymentServicesPushTopic"];
      peerPaymentServicesPushTopic = v4->_peerPaymentServicesPushTopic;
      v4->_peerPaymentServicesPushTopic = (NSString *)v9;

      uint64_t v11 = [v6 PKURLForKey:@"peerPaymentServiceURL"];

      p_super = &v4->_peerPaymentServiceURL->super;
      v4->_peerPaymentServiceURL = (NSURL *)v11;
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        *(_DWORD *)buf = 138543618;
        v20 = v14;
        __int16 v21 = 2114;
        v22 = v16;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)peerPaymentServicesPushTopic
{
  return self->_peerPaymentServicesPushTopic;
}

- (NSURL)peerPaymentServiceURL
{
  return self->_peerPaymentServiceURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentServiceURL, 0);
  objc_storeStrong((id *)&self->_peerPaymentServicesPushTopic, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end