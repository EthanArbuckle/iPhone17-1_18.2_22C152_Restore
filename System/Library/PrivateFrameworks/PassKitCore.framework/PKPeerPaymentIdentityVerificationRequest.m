@interface PKPeerPaymentIdentityVerificationRequest
- (BOOL)devSigned;
- (NSArray)certificates;
- (NSString)prerequisiteIdentifier;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5 deviceScore:(id)a6 odiAssessment:(id)a7 deviceMetadata:(id)a8;
- (int64_t)verificationContext;
- (void)setCertificates:(id)a3;
- (void)setDevSigned:(BOOL)a3;
- (void)setPrerequisiteIdentifier:(id)a3;
- (void)setVerificationContext:(int64_t)a3;
@end

@implementation PKPeerPaymentIdentityVerificationRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5 deviceScore:(id)a6 odiAssessment:(id)a7 deviceMetadata:(id)a8
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = v19;
  if (!v14)
  {
    v21 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    v34 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v34);
    *(_DWORD *)buf = 138543618;
    v61 = v35;
    __int16 v62 = 2082;
    v63 = "url";
LABEL_22:
    _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_23;
  }
  if (!v15)
  {
    v21 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    v36 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v36);
    *(_DWORD *)buf = 138543618;
    v61 = v35;
    __int16 v62 = 2082;
    v63 = "appleAccountInformation";
    goto LABEL_22;
  }
  if (!v16)
  {
    v21 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    v37 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v37);
    *(_DWORD *)buf = 138543618;
    v61 = v35;
    __int16 v62 = 2082;
    v63 = "deviceIdentifier";
    goto LABEL_22;
  }
  if (!v19)
  {
    v21 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v38);
      *(_DWORD *)buf = 138543618;
      v61 = v35;
      __int16 v62 = 2082;
      v63 = "deviceMetadata";
      goto LABEL_22;
    }
LABEL_23:
    id v39 = 0;
    goto LABEL_24;
  }
  v21 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v14 endpointComponents:&unk_1EE22B588 queryParameters:0 appleAccountInformation:v15];
  [v21 setHTTPMethod:@"POST"];
  [v21 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v58 = [MEMORY[0x1E4F1CA60] dictionary];
  v22 = [(PKOverlayableWebServiceRequest *)self secureOverlayParameters];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    if (![(NSArray *)self->_certificates count])
    {
      v41 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v41, OS_LOG_TYPE_DEFAULT, "Error: Tried to verify identity without certificates", buf, 2u);
      }
      v42 = v21;
      v21 = 0;
      goto LABEL_38;
    }
    v24 = (void *)MEMORY[0x192FDC630]();
    v25 = [MEMORY[0x1E4F1CA60] dictionary];
    [(PKOverlayableWebServiceRequest *)self _applySecureOverlayToDictionary:v25];
    v52 = [v25 objectForKeyedSubscript:@"addressLine2"];
    if (![v52 length]) {
      [v25 removeObjectForKey:@"addressLine2"];
    }
    v55 = v25;
    if ([v25 count])
    {
      v51 = v24;
      v26 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = NSString;
        v53 = [v55 allKeys];
        v28 = [v27 stringWithFormat:@"Encrypted Identity Verification Fields: %@", v53];
        *(_DWORD *)buf = 138477827;
        v61 = v28;
        _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
      }
      oslog = v26;

      v29 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v55];
      certificates = self->_certificates;
      id v59 = 0;
      uint64_t v31 = PKPeerPaymentEncryptDataWithCertChain(v29, certificates, &v59);
      v54 = v59;

      if (v31)
      {
        uint64_t v32 = v31;
        v24 = v51;
        v33 = v55;
        v57 = v32;
LABEL_35:

        if (v57)
        {
          v56 = (void *)[[NSString alloc] initWithData:v57 encoding:4];
          [v58 setObject:@"EV_ECC_v1-ASN.1" forKey:@"encryptionVersion"];
          [v58 setObject:v56 forKey:@"encryptedInputData"];
          v43 = [v54 hexEncoding];
          [v58 setObject:v43 forKey:@"publicKeyHash"];
        }
        v44 = [MEMORY[0x1E4F1CA60] dictionary];
        [(PKOverlayableWebServiceRequest *)self _applyOverlayToDictionary:v44];
        [v58 setObject:v44 forKey:@"inputData"];

        v41 = v54;
        v42 = v57;
LABEL_38:

        goto LABEL_39;
      }
      v24 = v51;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, oslog, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate peer payment identity verification request encryptedCardData. This is bad!", buf, 2u);
      }

      v57 = 0;
    }
    else
    {
      v57 = 0;
      v54 = 0;
    }
    v33 = v55;
    goto LABEL_35;
  }
LABEL_39:
  if (v17)
  {
    v45 = [v17 hexEncoding];
    [v58 setObject:v45 forKey:@"deviceScore"];
  }
  if (v18) {
    [v58 setObject:v18 forKey:@"odiAssessment"];
  }
  v46 = [v20 dictionaryRepresentation];
  [v58 setObject:v46 forKey:@"deviceMetadata"];

  prerequisiteIdentifier = self->_prerequisiteIdentifier;
  if (prerequisiteIdentifier) {
    [v58 setObject:prerequisiteIdentifier forKey:@"prerequisiteIdentifier"];
  }
  v48 = PKPeerPaymentIdentityVerificationContextToString(self->_verificationContext);
  [v58 setObject:v48 forKey:@"verificationContext"];

  v49 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v58];
  [v21 setHTTPBody:v49];

  id v39 = [v21 copy];
LABEL_24:

  return v39;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (BOOL)devSigned
{
  return self->_devSigned;
}

- (void)setDevSigned:(BOOL)a3
{
  self->_devSigned = a3;
}

- (NSString)prerequisiteIdentifier
{
  return self->_prerequisiteIdentifier;
}

- (void)setPrerequisiteIdentifier:(id)a3
{
}

- (int64_t)verificationContext
{
  return self->_verificationContext;
}

- (void)setVerificationContext:(int64_t)a3
{
  self->_verificationContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prerequisiteIdentifier, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end