@interface PKPaymentVerificationUpdateRequest
- (NSString)stepIdentifier;
- (PKPaymentPass)pass;
- (PKVerificationChannel)channel;
- (void)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5 deviceData:(id)a6 webService:(id)a7 certChain:(id)a8 devSigned:(BOOL)a9 completion:(id)a10;
- (void)setChannel:(id)a3;
- (void)setPass:(id)a3;
- (void)setStepIdentifier:(id)a3;
@end

@implementation PKPaymentVerificationUpdateRequest

- (void)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5 deviceData:(id)a6 webService:(id)a7 certChain:(id)a8 devSigned:(BOOL)a9 completion:(id)a10
{
  v69[6] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v60 = a7;
  id v20 = a8;
  id v59 = a10;
  v69[0] = @"devices";
  v69[1] = v17;
  v62 = v17;
  v69[2] = @"passes";
  v21 = [(PKPass *)self->_pass passTypeIdentifier];
  v69[3] = v21;
  v22 = [(PKPass *)self->_pass serialNumber];
  v69[4] = v22;
  v69[5] = @"activation";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:6];
  v63 = v16;
  v61 = v18;
  v24 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v16 endpointComponents:v23 queryParameters:0 appleAccountInformation:v18];

  [v24 setHTTPMethod:@"POST"];
  [v24 setValue:@"application/binary" forHTTPHeaderField:@"Content-Type"];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v26 = v25;
  stepIdentifier = self->_stepIdentifier;
  if (stepIdentifier) {
    [v25 setObject:stepIdentifier forKey:@"stepIdentifier"];
  }
  v28 = [(PKVerificationChannel *)self->_channel identifier];

  if (v28)
  {
    v29 = [(PKVerificationChannel *)self->_channel identifier];
    [v26 setObject:v29 forKey:@"methodIdentifier"];

    v30 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v26];
    [v24 setHTTPBody:v30];

    v31 = (void *)[v24 copy];
    v32 = v59;
    (*((void (**)(id, void *))v59 + 2))(v59, v31);

    v33 = v19;
    v34 = v60;
    v35 = v20;
    goto LABEL_28;
  }
  if ([(PKOverlayableWebServiceRequest *)self hasOverlayParameters])
  {
    v36 = (void *)MEMORY[0x192FDC630]();
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(PKOverlayableWebServiceRequest *)self _applySecureOverlayToDictionary:v37];
    v33 = v19;
    if ([v37 count])
    {
      context = v36;
      v38 = [v19 primaryJSBLSequenceCounter];
      v39 = [v38 stringValue];

      v35 = v20;
      v40 = v39;
      if (v39)
      {
        v41 = [v39 dataUsingEncoding:4];
        v42 = [v41 hexEncoding];
        [v37 setObject:v42 forKeyedSubscript:@"jsblSequenceCounter"];
      }
      uint64_t v43 = [(PKSecureElementPass *)self->_pass deviceAccountIdentifier];
      if (v43) {
        [v37 setObject:v43 forKeyedSubscript:@"DPANIdentifier"];
      }
      v55 = (void *)v43;
      v56 = v40;
      v44 = PKLogFacilityTypeGetObject(6uLL);
      v34 = v60;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = [v37 allKeys];
        *(_DWORD *)buf = 138412290;
        v68 = v45;
        _os_log_impl(&dword_190E10000, v44, OS_LOG_TYPE_DEFAULT, "Encrypted Activation Fields: %@", buf, 0xCu);
      }
      v46 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v37];
      id v66 = 0;
      uint64_t v47 = PKPaymentEncryptDataWithCertChain(v46, v35, a9, &v66);
      id v58 = v66;

      if (v47)
      {

        v48 = (void *)v47;
        v49 = (void *)[[NSString alloc] initWithData:v47 encoding:4];
        [v26 setValue:@"EV_ECC_v1-ASN.1" forKey:@"encryptionVersion"];
        [v26 setValue:v49 forKey:@"encryptedCardData"];
        v50 = v58;
        v51 = [v58 hexEncoding];
        [v26 setValue:v51 forKey:@"publicKeyHash"];

        [(PKOverlayableWebServiceRequest *)self _applyOverlayToDictionary:v26];
        v52 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v26];
        [v24 setHTTPBody:v52];

        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __158__PKPaymentVerificationUpdateRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_deviceData_webService_certChain_devSigned_completion___block_invoke;
        v64[3] = &unk_1E56EDD70;
        v32 = v59;
        id v65 = v59;
        [(PKPaymentWebServiceRequest *)self _signRequest:v24 webService:v60 completion:v64];

        goto LABEL_25;
      }
      v36 = context;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v44, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate activation request encryptedCardData. This is bad!", buf, 2u);
      }
    }
    else
    {
      id v58 = 0;
      v34 = v60;
      v35 = v20;
    }

    [(PKOverlayableWebServiceRequest *)self _applyOverlayToDictionary:v26];
    v54 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v26];
    [v24 setHTTPBody:v54];

    v32 = v59;
    if (!v59)
    {
      v50 = v58;
      goto LABEL_27;
    }
    v48 = (void *)[v24 copy];
    (*((void (**)(id, void *))v59 + 2))(v59, v48);
    v50 = v58;
LABEL_25:

LABEL_27:
    goto LABEL_28;
  }
  v53 = PKLogFacilityTypeGetObject(0);
  v33 = v19;
  v34 = v60;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_190E10000, v53, OS_LOG_TYPE_ERROR, "Could not generate request, no overlay, no channel identifier. Returning nil", buf, 2u);
  }

  v35 = v20;
  v32 = v59;
  if (v59) {
    (*((void (**)(id, void))v59 + 2))(v59, 0);
  }
LABEL_28:
}

void __158__PKPaymentVerificationUpdateRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_deviceData_webService_certChain_devSigned_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (id)[a2 copy];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (PKVerificationChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
}

@end