@interface PKPeerPaymentStatusRequest
- (NSString)paymentIdentifier;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setPaymentIdentifier:(id)a3;
@end

@implementation PKPeerPaymentStatusRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    __int16 v21 = 2082;
    v22 = "url";
LABEL_11:
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_12;
  }
  if (!v7)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    __int16 v21 = 2082;
    v22 = "appleAccountInformation";
    goto LABEL_11;
  }
  paymentIdentifier = self->_paymentIdentifier;
  if (paymentIdentifier)
  {
    v18[0] = @"payment";
    v18[1] = paymentIdentifier;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v11 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:v10 queryParameters:0 appleAccountInformation:v8];

    [v11 setHTTPMethod:@"GET"];
    id v12 = [v11 copy];
    goto LABEL_13;
  }
  v11 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    __int16 v21 = 2082;
    v22 = "_paymentIdentifier";
    goto LABEL_11;
  }
LABEL_12:
  id v12 = 0;
LABEL_13:

  return v12;
}

- (NSString)paymentIdentifier
{
  return self->_paymentIdentifier;
}

- (void)setPaymentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end