@interface PKPeerPaymentQuoteCertificatesRequest
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (unint64_t)destination;
- (void)setDestination:(unint64_t)a3;
@end

@implementation PKPeerPaymentQuoteCertificatesRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    __int16 v23 = 2082;
    v24 = "url";
LABEL_12:
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_13;
  }
  if (!v7)
  {
    v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    __int16 v23 = 2082;
    v24 = "appleAccountInformation";
    goto LABEL_12;
  }
  unint64_t destination = self->_destination;
  if (destination)
  {
    v19 = @"destination";
    if (destination > 5) {
      v10 = @"unknown";
    }
    else {
      v10 = off_1E56F56E0[destination - 1];
    }
    v20 = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v17 = -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, &unk_1EE22B570, v11, v8, v19);
    [v17 setHTTPMethod:@"GET"];
    v16 = (void *)[v17 copy];

    goto LABEL_16;
  }
  v11 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    __int16 v23 = 2082;
    v24 = "_destination";
    goto LABEL_12;
  }
LABEL_13:
  v16 = 0;
LABEL_16:

  return v16;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_unint64_t destination = a3;
}

@end