@interface PKPaymentRegisterCredentialResponse
- (NSData)credentialAttestation;
- (NSURL)passURL;
- (PKPaymentRegisterCredentialResponse)initWithData:(id)a3;
- (PKSubcredentialEncryptedContainer)vehicleMobilizationEncryptedContainer;
@end

@implementation PKPaymentRegisterCredentialResponse

- (PKPaymentRegisterCredentialResponse)initWithData:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentRegisterCredentialResponse;
  v3 = [(PKWebServiceResponse *)&v24 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = (void *)MEMORY[0x1E4F1CB10];
      v7 = [v5 PKStringForKey:@"passURL"];
      uint64_t v8 = [v6 URLWithString:v7];
      passURL = v4->_passURL;
      v4->_passURL = (NSURL *)v8;

      if (v4->_passURL)
      {
        v10 = [v5 PKStringForKey:@"ktsSignature"];
        uint64_t v11 = objc_msgSend(v10, "pk_decodeHexadecimal");
        credentialAttestation = v4->_credentialAttestation;
        v4->_credentialAttestation = (NSData *)v11;

        v13 = [v5 PKDictionaryForKey:@"vehicleMobilizationData"];
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          v15 = [v5 PKDictionaryForKey:@"keyData"];
        }
        v21 = v15;

        v22 = [[PKSubcredentialEncryptedContainer alloc] initWithDictionary:v21];
        p_super = &v4->_vehicleMobilizationEncryptedContainer->super;
        v4->_vehicleMobilizationEncryptedContainer = v22;
        goto LABEL_13;
      }
      p_super = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: Response missing pass url", buf, 2u);
      }
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        v19 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v26 = v18;
        __int16 v27 = 2112;
        v28 = v19;
        id v20 = v19;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
    }
    v21 = v4;
    v4 = 0;
LABEL_13:
  }
  return v4;
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (NSData)credentialAttestation
{
  return self->_credentialAttestation;
}

- (PKSubcredentialEncryptedContainer)vehicleMobilizationEncryptedContainer
{
  return self->_vehicleMobilizationEncryptedContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleMobilizationEncryptedContainer, 0);
  objc_storeStrong((id *)&self->_credentialAttestation, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
}

@end