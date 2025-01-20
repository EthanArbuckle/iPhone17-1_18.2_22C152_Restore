@interface PKPaymentRegisterPreTrackCredentialRequest
- (PKPaymentRegisterPreTrackCredentialRequest)initWithCredential:(id)a3 encryptedVehicleDataRequest:(id)a4 metadata:(id)a5;
- (PKPaymentRegisterPreTrackCredentialRequest)initWithCredential:(id)a3 metadata:(id)a4;
- (void)buildRequestBody:(id)a3;
@end

@implementation PKPaymentRegisterPreTrackCredentialRequest

- (PKPaymentRegisterPreTrackCredentialRequest)initWithCredential:(id)a3 metadata:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRegisterPreTrackCredentialRequest;
  v4 = [(PKPaymentRegisterCredentialRequest *)&v8 initWithCredential:a3 metadata:a4];
  v5 = v4;
  if (v4)
  {
    encryptedVehicleDataRequest = v4->_encryptedVehicleDataRequest;
    v4->_encryptedVehicleDataRequest = 0;
  }
  return v5;
}

- (PKPaymentRegisterPreTrackCredentialRequest)initWithCredential:(id)a3 encryptedVehicleDataRequest:(id)a4 metadata:(id)a5
{
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentRegisterPreTrackCredentialRequest;
  v9 = [(PKPaymentRegisterCredentialRequest *)&v16 initWithCredential:a3 metadata:a5];
  if (v9
    && (dictionaryFromSubcredentialEncryptedRequest(v8),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        encryptedVehicleDataRequest = v9->_encryptedVehicleDataRequest,
        v9->_encryptedVehicleDataRequest = (NSDictionary *)v10,
        encryptedVehicleDataRequest,
        !v9->_encryptedVehicleDataRequest))
  {
    v13 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Missing encryptedVehicleDataRequest on register request", v15, 2u);
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
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRegisterPreTrackCredentialRequest;
  [(PKPaymentRegisterCredentialRequest *)&v8 buildRequestBody:v4];
  if (self->_encryptedVehicleDataRequest)
  {
    if (PKSharingForceNilVehicleDataInPreTrackRequest())
    {
      v5 = PKLogFacilityTypeGetObject(0x21uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKSharingForceNilVehicleDataInPreTrackRequest enabled", v7, 2u);
      }

      encryptedVehicleDataRequest = 0;
    }
    else
    {
      encryptedVehicleDataRequest = self->_encryptedVehicleDataRequest;
    }
    [v4 setObject:encryptedVehicleDataRequest forKeyedSubscript:@"vehicleData"];
  }
}

- (void).cxx_destruct
{
}

@end