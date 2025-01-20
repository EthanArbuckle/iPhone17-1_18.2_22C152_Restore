@interface PKPeerPaymentRecipientRequest
- (NSString)recipientAddress;
- (NSString)senderAddress;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5;
- (unint64_t)recipientAddressSource;
- (void)setRecipientAddress:(id)a3;
- (void)setRecipientAddressSource:(unint64_t)a3;
- (void)setSenderAddress:(id)a3;
@end

@implementation PKPeerPaymentRecipientRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v8)
  {
    v20 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    int v30 = 138543618;
    v31 = v22;
    __int16 v32 = 2082;
    v33 = "url";
LABEL_26:
    _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v30, 0x16u);

    goto LABEL_27;
  }
  if (!v9)
  {
    v20 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    v23 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v23);
    int v30 = 138543618;
    v31 = v22;
    __int16 v32 = 2082;
    v33 = "appleAccountInformation";
    goto LABEL_26;
  }
  if (!v10)
  {
    v20 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    v24 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v24);
    int v30 = 138543618;
    v31 = v22;
    __int16 v32 = 2082;
    v33 = "deviceIdentifier";
    goto LABEL_26;
  }
  if (!self->_recipientAddress)
  {
    v20 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    v25 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v25);
    int v30 = 138543618;
    v31 = v22;
    __int16 v32 = 2082;
    v33 = "_recipientAddress";
    goto LABEL_26;
  }
  if (!self->_senderAddress)
  {
    v20 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v26);
      int v30 = 138543618;
      v31 = v22;
      __int16 v32 = 2082;
      v33 = "_senderAddress";
      goto LABEL_26;
    }
LABEL_27:

    v27 = 0;
    goto LABEL_28;
  }
  v12 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v8 endpointComponents:&unk_1EE22B510 queryParameters:0 appleAccountInformation:v9];
  [v12 setHTTPMethod:@"POST"];
  [v12 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v12 setTimeoutInterval:15.0];
  v13 = [MEMORY[0x1E4F1CA60] dictionary];
  [v13 setObject:v11 forKey:@"deviceIdentifier"];
  recipientAddress = self->_recipientAddress;
  if (recipientAddress)
  {
    v15 = PKIDSNormalizedAddress(recipientAddress);
    if (v15) {
      [v13 setObject:v15 forKey:@"recipientQuery"];
    }
  }
  senderAddress = self->_senderAddress;
  if (senderAddress)
  {
    v17 = PKIDSNormalizedAddress(senderAddress);
    if (v17) {
      [v13 setObject:v17 forKey:@"senderAddress"];
    }
  }
  unint64_t v18 = self->_recipientAddressSource - 1;
  if (v18 > 2) {
    v19 = @"unknown";
  }
  else {
    v19 = off_1E56F5668[v18];
  }
  [v13 setObject:v19 forKey:@"recipientSource"];
  v29 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v13];
  [v12 setHTTPBody:v29];

  v27 = (void *)[v12 copy];
LABEL_28:

  return v27;
}

- (NSString)recipientAddress
{
  return self->_recipientAddress;
}

- (void)setRecipientAddress:(id)a3
{
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
}

- (unint64_t)recipientAddressSource
{
  return self->_recipientAddressSource;
}

- (void)setRecipientAddressSource:(unint64_t)a3
{
  self->_recipientAddressSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_recipientAddress, 0);
}

@end