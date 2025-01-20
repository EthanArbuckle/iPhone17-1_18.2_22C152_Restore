@interface PKPaymentRegisterCredentialRequest
+ (id)requestMetadataFromCarKeyRegistrationMetadata:(id)a3 withCredential:(id)a4;
+ (id)requestMetadataFromRegistrationMetadata:(id)a3 withCredential:(id)a4;
- (PKAppletSubcredential)credential;
- (PKPaymentRegisterCredentialRequest)initWithCredential:(id)a3 metadata:(id)a4;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (id)requestBody;
- (void)buildRequestBody:(id)a3;
- (void)setCredential:(id)a3;
@end

@implementation PKPaymentRegisterCredentialRequest

+ (id)requestMetadataFromRegistrationMetadata:(id)a3 withCredential:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if ([v6 productType])
    {
      v9 = 0;
    }
    else
    {
      v9 = [a1 requestMetadataFromCarKeyRegistrationMetadata:v6 withCredential:v8];
    }
  }

  return v9;
}

+ (id)requestMetadataFromCarKeyRegistrationMetadata:(id)a3 withCredential:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = PKPartnerIdentifierOverride();
  v8 = [v6 partnerIdentifier];
  if ([v7 length])
  {
    v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      v25 = v7;
      __int16 v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Overriding partner identifier with value %@ (was %@)", (uint8_t *)&v24, 0x16u);
    }

    id v10 = v7;
    v8 = v10;
  }
  v11 = 0;
  if (v5 && v8)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v12 setObject:@"car" forKeyedSubscript:@"category"];
    [v12 setObject:v8 forKeyedSubscript:@"partnerID"];
    v13 = [v6 brandIdentifier];
    [v12 setObject:v13 forKeyedSubscript:@"brand"];

    v14 = PKAppletSubcredentialCarKeyVehicleVersionToString([v6 carKeyVehicleVersion]);
    [v12 setObject:v14 forKeyedSubscript:@"deviceVehicleServerVersion"];

    v15 = PKAppletSubcredentialCarKeyServerVersionToString([v6 carKeyServerVersion]);
    [v12 setObject:v15 forKeyedSubscript:@"vehicleOwnerDeviceFrameworkVersion"];

    v16 = PKAppletSubcredentialKeyClassToString([v6 keyClass]);
    [v12 setObject:v16 forKeyedSubscript:@"keyClass"];

    v17 = PKAppletSubcredentialCredentialAuthorityTypeToString([v6 credentialAuthorityType]);
    [v12 setObject:v17 forKeyedSubscript:@"keyOrigin"];

    v18 = [v5 personalizedVehicleIdentifier];
    [v12 setObject:v18 forKeyedSubscript:@"personalizedVehicleIdentifier"];

    uint64_t v19 = [v5 keyType];
    if (v19)
    {
      if (v19 != 1)
      {
LABEL_12:
        v21 = [v5 make];
        [v12 setObject:v21 forKeyedSubscript:@"make"];

        v22 = [v5 model];
        [v12 setObject:v22 forKeyedSubscript:@"model"];

        v11 = (void *)[v12 copy];
        goto LABEL_13;
      }
      v20 = @"SHARED";
    }
    else
    {
      v20 = @"OWNER";
    }
    [v12 setObject:v20 forKeyedSubscript:@"type"];
    goto LABEL_12;
  }
LABEL_13:

  return v11;
}

- (PKPaymentRegisterCredentialRequest)initWithCredential:(id)a3 metadata:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentRegisterCredentialRequest;
  v9 = [(PKOverlayableWebServiceRequest *)&v19 init];
  id v10 = v9;
  if (!v9) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v9->_credential, a3);
  uint64_t v11 = [v7 identifier];
  credentialIdentifier = v10->_credentialIdentifier;
  v10->_credentialIdentifier = (NSString *)v11;

  if (!v10->_credentialIdentifier)
  {
    v16 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Missing credential identifier on register request: %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  uint64_t v13 = [(id)objc_opt_class() requestMetadataFromRegistrationMetadata:v8 withCredential:v7];
  metadata = v10->_metadata;
  v10->_metadata = (NSDictionary *)v13;

  if (!v10->_metadata)
  {
    v16 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v7 partnerIdentifier];
      *(_DWORD *)buf = 138412546;
      id v21 = v8;
      __int16 v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Invalid metadata/partner identifier on register request: %@, %@", buf, 0x16u);
    }
LABEL_9:

    v15 = 0;
    goto LABEL_10;
  }
LABEL_4:
  v15 = v10;
LABEL_10:

  return v15;
}

- (id)requestBody
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(PKPaymentRegisterCredentialRequest *)self buildRequestBody:v3];
  v4 = (void *)[v3 copy];

  return v4;
}

- (void)buildRequestBody:(id)a3
{
  credentialIdentifier = self->_credentialIdentifier;
  id v5 = a3;
  [v5 setObject:credentialIdentifier forKeyedSubscript:@"keyID"];
  [v5 setObject:self->_metadata forKeyedSubscript:@"keyMetadata"];
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v19 = @"devices";
  id v20 = a4;
  id v21 = @"registerKey";
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 arrayWithObjects:&v19 count:3];

  uint64_t v13 = -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v9, v19, v20, v21, v22);

  [v13 setHTTPMethod:@"POST"];
  v14 = objc_opt_class();
  v15 = [(PKPaymentRegisterCredentialRequest *)self requestBody];
  v16 = [v14 _HTTPBodyWithDictionary:v15];
  [v13 setHTTPBody:v16];

  v17 = (void *)[v13 copy];
  return v17;
}

- (PKAppletSubcredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end