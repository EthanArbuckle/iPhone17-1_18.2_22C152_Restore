@interface PKPeerPaymentStatementRequest
- (NSString)accountIdentifier;
- (NSString)emailAddress;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setAccountIdentifier:(id)a3;
- (void)setEmailAddress:(id)a3;
@end

@implementation PKPeerPaymentStatementRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138543618;
    v25 = v12;
    __int16 v26 = 2082;
    v27 = "url";
LABEL_12:
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_13;
  }
  if (!v7)
  {
    v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v25 = v12;
    __int16 v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_12;
  }
  if (!self->_emailAddress)
  {
    v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543618;
      v25 = v12;
      __int16 v26 = 2082;
      v27 = "_emailAddress";
      goto LABEL_12;
    }
LABEL_13:
    v15 = 0;
    goto LABEL_18;
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
  {
    v22 = @"accountIdentifier";
    v23 = accountIdentifier;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  }
  else
  {
    v10 = 0;
  }
  v16 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:&unk_1EE22B618 queryParameters:v10 appleAccountInformation:v8];
  [v16 setHTTPMethod:@"POST"];
  [v16 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v17 = [MEMORY[0x1E4F1CA60] dictionary];
  v18 = v17;
  emailAddress = self->_emailAddress;
  if (emailAddress) {
    [v17 setObject:emailAddress forKey:@"emailAddress"];
  }
  v20 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v18];
  [v16 setHTTPBody:v20];

  v15 = (void *)[v16 copy];
LABEL_18:

  return v15;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
}

@end