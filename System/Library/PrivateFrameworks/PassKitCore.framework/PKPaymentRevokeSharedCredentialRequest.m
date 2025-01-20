@interface PKPaymentRevokeSharedCredentialRequest
- (PKPaymentRevokeSharedCredentialRequest)initWithCredential:(id)a3 revocationAttestation:(id)a4;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (id)requestBody;
@end

@implementation PKPaymentRevokeSharedCredentialRequest

- (PKPaymentRevokeSharedCredentialRequest)initWithCredential:(id)a3 revocationAttestation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentRevokeSharedCredentialRequest;
  v9 = [(PKOverlayableWebServiceRequest *)&v19 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_4;
  }
  p_credential = &v9->_credential;
  objc_storeStrong((id *)&v9->_credential, a3);
  uint64_t v12 = dictionaryFromSubcredentialEncryptedRequest(v8);
  revocationAttestation = v10->_revocationAttestation;
  v10->_revocationAttestation = (NSDictionary *)v12;

  if (!*p_credential)
  {
    v15 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18[0] = 0;
      v16 = "Missing credential on deletion request";
LABEL_9:
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)v18, 2u);
    }
LABEL_10:

    v14 = 0;
    goto LABEL_11;
  }
  if (!v10->_revocationAttestation)
  {
    v15 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18[0] = 0;
      v16 = "Missing attestation on revocation request";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v14 = v10;
LABEL_11:

  return v14;
}

- (id)requestBody
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(PKAppletSubcredential *)self->_credential identifier];
  [v3 setObject:v4 forKeyedSubscript:@"keyID"];

  v5 = [(PKAppletSubcredential *)self->_credential partnerIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"partnerID"];

  v6 = [(PKAppletSubcredential *)self->_credential brandIdentifier];
  [v3 setObject:v6 forKeyedSubscript:@"brand"];

  revocationAttestation = self->_revocationAttestation;
  if (revocationAttestation) {
    [v3 setObject:revocationAttestation forKeyedSubscript:@"remoteTerminationRequest"];
  }
  return v3;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v19 = @"devices";
  id v20 = a4;
  v21 = @"deleteKey";
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 arrayWithObjects:&v19 count:3];

  v13 = -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v9, v19, v20, v21, v22);

  [v13 setHTTPMethod:@"POST"];
  v14 = objc_opt_class();
  v15 = [(PKPaymentRevokeSharedCredentialRequest *)self requestBody];
  v16 = [v14 _HTTPBodyWithDictionary:v15];
  [v13 setHTTPBody:v16];

  v17 = (void *)[v13 copy];
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_revocationAttestation, 0);
}

@end