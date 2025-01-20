@interface PKPeerPaymentAssociatedAccountsResponse
- (PKPeerPaymentAssociatedAccountInformation)associatedAccountInformation;
- (PKPeerPaymentAssociatedAccountsResponse)initWithData:(id)a3;
@end

@implementation PKPeerPaymentAssociatedAccountsResponse

- (PKPeerPaymentAssociatedAccountsResponse)initWithData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentAssociatedAccountsResponse;
  v3 = [(PKWebServiceResponse *)&v14 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      v7 = [PKPeerPaymentAssociatedAccountInformation alloc];
      v8 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v9 = [(PKPeerPaymentAssociatedAccountInformation *)v7 initWithDictionary:v6 lastUpdated:v8];

      associatedAccountInformation = v4->_associatedAccountInformation;
      v4->_associatedAccountInformation = (PKPeerPaymentAssociatedAccountInformation *)v9;
    }
    else
    {
      v8 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138543362;
        v16 = v12;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Malformed PKPeerPaymentAssociatedAccountsResponse: expected dictionary and received %{public}@", buf, 0xCu);
      }
    }
  }
  return v4;
}

- (PKPeerPaymentAssociatedAccountInformation)associatedAccountInformation
{
  return self->_associatedAccountInformation;
}

- (void).cxx_destruct
{
}

@end