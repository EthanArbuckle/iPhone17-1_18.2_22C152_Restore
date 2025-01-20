@interface PKPeerPaymentSubmitDeviceScoreIdentifiersRequest
- (NSString)paymentIdentifier;
- (NSUUID)requestDeviceScoreIdentifier;
- (NSUUID)sendDeviceScoreIdentifier;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setPaymentIdentifier:(id)a3;
- (void)setRequestDeviceScoreIdentifier:(id)a3;
- (void)setSendDeviceScoreIdentifier:(id)a3;
@end

@implementation PKPeerPaymentSubmitDeviceScoreIdentifiersRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138543618;
    v26 = v20;
    __int16 v27 = 2082;
    v28 = "url";
LABEL_15:
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_16;
  }
  if (!v7)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    v21 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138543618;
    v26 = v20;
    __int16 v27 = 2082;
    v28 = "appleAccountInformation";
    goto LABEL_15;
  }
  paymentIdentifier = self->_paymentIdentifier;
  if (!paymentIdentifier)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      __int16 v27 = 2082;
      v28 = "_paymentIdentifier";
      goto LABEL_15;
    }
LABEL_16:
    id v18 = 0;
    goto LABEL_17;
  }
  v24[0] = @"payment";
  v24[1] = paymentIdentifier;
  v24[2] = @"submitDeviceScoreIdentifiers";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  v11 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:v10 queryParameters:0 appleAccountInformation:v8];

  [v11 setHTTPMethod:@"POST"];
  [v11 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  requestDeviceScoreIdentifier = self->_requestDeviceScoreIdentifier;
  if (requestDeviceScoreIdentifier)
  {
    v14 = [(NSUUID *)requestDeviceScoreIdentifier UUIDString];
    [v12 setObject:v14 forKey:@"requestDeviceScoreIdentifier"];
  }
  sendDeviceScoreIdentifier = self->_sendDeviceScoreIdentifier;
  if (sendDeviceScoreIdentifier)
  {
    v16 = [(NSUUID *)sendDeviceScoreIdentifier UUIDString];
    [v12 setObject:v16 forKey:@"sendDeviceScoreIdentifier"];
  }
  v17 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v12];
  [v11 setHTTPBody:v17];

  id v18 = [v11 copy];
LABEL_17:

  return v18;
}

- (NSString)paymentIdentifier
{
  return self->_paymentIdentifier;
}

- (void)setPaymentIdentifier:(id)a3
{
}

- (NSUUID)requestDeviceScoreIdentifier
{
  return self->_requestDeviceScoreIdentifier;
}

- (void)setRequestDeviceScoreIdentifier:(id)a3
{
}

- (NSUUID)sendDeviceScoreIdentifier
{
  return self->_sendDeviceScoreIdentifier;
}

- (void)setSendDeviceScoreIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendDeviceScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_requestDeviceScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentIdentifier, 0);
}

@end