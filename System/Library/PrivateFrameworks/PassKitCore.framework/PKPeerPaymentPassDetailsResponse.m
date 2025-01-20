@interface PKPeerPaymentPassDetailsResponse
- (NSString)ownershipTokenIdentifier;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (NSString)provisioningIdentifier;
- (NSURL)passURL;
- (PKPaymentRemoteCredential)remoteCredential;
- (PKPeerPaymentPassDetailsResponse)initWithData:(id)a3;
- (int64_t)cardType;
- (int64_t)status;
@end

@implementation PKPeerPaymentPassDetailsResponse

- (PKPeerPaymentPassDetailsResponse)initWithData:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)PKPeerPaymentPassDetailsResponse;
  v3 = [(PKWebServiceResponse *)&v24 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      uint64_t v7 = [v6 PKStringForKey:@"provisioningIdentifier"];
      provisioningIdentifier = v4->_provisioningIdentifier;
      v4->_provisioningIdentifier = (NSString *)v7;

      v4->_cardType = [v6 PKIntegerForKey:@"cardType"];
      v4->_status = [v6 PKIntegerForKey:@"status"];
      uint64_t v9 = [v6 PKURLForKey:@"passURL"];
      passURL = v4->_passURL;
      v4->_passURL = (NSURL *)v9;

      uint64_t v11 = [v6 PKStringForKey:@"passTypeIdentifier"];
      passTypeIdentifier = v4->_passTypeIdentifier;
      v4->_passTypeIdentifier = (NSString *)v11;

      uint64_t v13 = [v6 PKStringForKey:@"passSerialNumber"];
      passSerialNumber = v4->_passSerialNumber;
      v4->_passSerialNumber = (NSString *)v13;

      uint64_t v15 = [v6 PKStringForKey:@"ownershipTokenIdentifier"];

      ownershipTokenIdentifier = v4->_ownershipTokenIdentifier;
      v4->_ownershipTokenIdentifier = (NSString *)v15;

      v17 = [[PKPaymentRemoteCredential alloc] initWithIdentifier:v4->_provisioningIdentifier status:v4->_status credentialType:v4->_cardType passURL:v4->_passURL];
      p_super = &v4->_remoteCredential->super.super;
      v4->_remoteCredential = v17;
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 138543618;
        v26 = v20;
        __int16 v27 = 2114;
        v28 = v22;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (NSString)provisioningIdentifier
{
  return self->_provisioningIdentifier;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (int64_t)status
{
  return self->_status;
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (NSString)ownershipTokenIdentifier
{
  return self->_ownershipTokenIdentifier;
}

- (PKPaymentRemoteCredential)remoteCredential
{
  return self->_remoteCredential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCredential, 0);
  objc_storeStrong((id *)&self->_ownershipTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_provisioningIdentifier, 0);
}

@end