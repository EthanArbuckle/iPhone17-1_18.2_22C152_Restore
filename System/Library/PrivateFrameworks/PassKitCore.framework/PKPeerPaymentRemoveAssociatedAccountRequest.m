@interface PKPeerPaymentRemoveAssociatedAccountRequest
- (PKPeerPaymentRemoveAssociatedAccountRequest)initWithAssociatedAccountIdentifier:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
@end

@implementation PKPeerPaymentRemoveAssociatedAccountRequest

- (PKPeerPaymentRemoveAssociatedAccountRequest)initWithAssociatedAccountIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentRemoveAssociatedAccountRequest;
  v6 = [(PKOverlayableWebServiceRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_associatedAccountIdentifier, a3);
  }

  return v7;
}

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
  associatedAccountIdentifier = self->_associatedAccountIdentifier;
  if (associatedAccountIdentifier)
  {
    v18[0] = @"account";
    v18[1] = @"associatedAccount";
    v18[2] = associatedAccountIdentifier;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
    v11 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:v10 queryParameters:0 appleAccountInformation:v8];

    [v11 setHTTPMethod:@"DELETE"];
    [v11 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
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
    v22 = "_associatedAccountIdentifier";
    goto LABEL_11;
  }
LABEL_12:
  id v12 = 0;
LABEL_13:

  return v12;
}

- (void).cxx_destruct
{
}

@end