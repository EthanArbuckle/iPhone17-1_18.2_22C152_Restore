@interface PKPaymentRegisterTrackCredentialRequest
- (PKPaymentRegisterTrackCredentialRequest)initWithCredential:(id)a3 registrationData:(id)a4 metadata:(id)a5;
- (void)buildRequestBody:(id)a3;
@end

@implementation PKPaymentRegisterTrackCredentialRequest

- (PKPaymentRegisterTrackCredentialRequest)initWithCredential:(id)a3 registrationData:(id)a4 metadata:(id)a5
{
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentRegisterTrackCredentialRequest;
  v9 = [(PKPaymentRegisterCredentialRequest *)&v16 initWithCredential:a3 metadata:a5];
  if (v9
    && (dictionaryFromSubcredentialEncryptedRequest(v8),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        registrationData = v9->_registrationData,
        v9->_registrationData = (NSDictionary *)v10,
        registrationData,
        !v9->_registrationData))
  {
    v13 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Missing registrationData on register request", v15, 2u);
    }

    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

- (void)buildRequestBody:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentRegisterTrackCredentialRequest;
  id v4 = a3;
  [(PKPaymentRegisterCredentialRequest *)&v5 buildRequestBody:v4];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_registrationData, @"keyData", v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
}

@end