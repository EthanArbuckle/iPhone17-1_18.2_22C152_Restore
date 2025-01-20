@interface PKPeerPaymentDocumentSubmissionRequest
- (BOOL)devSigned;
- (NSArray)certificates;
- (NSData)backImageData;
- (NSData)frontImageData;
- (NSString)documentCountryCode;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (unint64_t)documentType;
- (void)setBackImageData:(id)a3;
- (void)setCertificates:(id)a3;
- (void)setDevSigned:(BOOL)a3;
- (void)setDocumentCountryCode:(id)a3;
- (void)setDocumentType:(unint64_t)a3;
- (void)setFrontImageData:(id)a3;
@end

@implementation PKPeerPaymentDocumentSubmissionRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v9 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    *(_DWORD *)buf = 138543618;
    v43 = v27;
    __int16 v44 = 2082;
    v45 = "url";
    v28 = "Request %{public}@ missing parameter '%{public}s'.";
LABEL_26:
    v33 = v9;
    uint32_t v34 = 22;
    goto LABEL_27;
  }
  if (!v7)
  {
    v9 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    v29 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v29);
    *(_DWORD *)buf = 138543618;
    v43 = v27;
    __int16 v44 = 2082;
    v45 = "appleAccountInformation";
    v28 = "Request %{public}@ missing parameter '%{public}s'.";
    goto LABEL_26;
  }
  if (!self->_frontImageData)
  {
    v9 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    v30 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v30);
    *(_DWORD *)buf = 138543618;
    v43 = v27;
    __int16 v44 = 2082;
    v45 = "_frontImageData";
    v28 = "Request %{public}@ missing parameter '%{public}s'.";
    goto LABEL_26;
  }
  if (!self->_documentCountryCode)
  {
    v9 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    v31 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v31);
    *(_DWORD *)buf = 138543618;
    v43 = v27;
    __int16 v44 = 2082;
    v45 = "_documentCountryCode";
    v28 = "Request %{public}@ missing parameter '%{public}s'.";
    goto LABEL_26;
  }
  if (!self->_documentType)
  {
    v9 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v32);
      *(_DWORD *)buf = 138543618;
      v43 = v27;
      __int16 v44 = 2082;
      v45 = "_documentType";
      v28 = "Request %{public}@ missing parameter '%{public}s'.";
      goto LABEL_26;
    }
LABEL_29:
    id v35 = 0;
    goto LABEL_30;
  }
  v9 = [(PKPeerPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:&unk_1EE22B5B8 queryParameters:0 appleAccountInformation:v7];
  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  if (![(NSArray *)self->_certificates count])
  {
    v27 = PKLogFacilityTypeGetObject(0xBuLL);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    v28 = "Error: Tried to submit document without certificates";
    v33 = v27;
    uint32_t v34 = 2;
LABEL_27:
    _os_log_impl(&dword_190E10000, v33, OS_LOG_TYPE_DEFAULT, v28, buf, v34);
LABEL_28:

    goto LABEL_29;
  }
  unint64_t v10 = 0x1E4F1C000uLL;
  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  frontImageData = self->_frontImageData;
  if (frontImageData)
  {
    v13 = [(NSData *)frontImageData base64EncodedStringWithOptions:0];
    [v11 setObject:v13 forKey:@"documentFrontImage"];
  }
  backImageData = self->_backImageData;
  if (backImageData)
  {
    v15 = [(NSData *)backImageData base64EncodedStringWithOptions:0];
    [v11 setObject:v15 forKey:@"documentBackImage"];
  }
  [v11 setObject:self->_documentCountryCode forKey:@"documentCountryCode"];
  v16 = PKPaymentDocumentTypeToString(self->_documentType);
  [v11 setObject:v16 forKey:@"documentType"];

  v17 = (void *)MEMORY[0x192FDC630]();
  if ([v11 count])
  {
    v18 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = NSString;
      v20 = [v11 allKeys];
      v21 = [v19 stringWithFormat:@"Encrypted document data: %@", v20];
      *(_DWORD *)buf = 138477827;
      v43 = v21;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
    }
    v22 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v11];
    certificates = self->_certificates;
    id v41 = 0;
    v24 = PKPeerPaymentEncryptDataWithCertChain(v22, certificates, &v41);
    id v25 = v41;

    if (v24)
    {
      unint64_t v10 = 0x1E4F1C000;
    }
    else
    {
      unint64_t v10 = 0x1E4F1C000uLL;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate peer payment document submission request encryptedDocumentData. This is bad!", buf, 2u);
      }

      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
    id v25 = 0;
  }
  v37 = [*(id *)(v10 + 2656) dictionary];
  if (v24)
  {
    v38 = (void *)[[NSString alloc] initWithData:v24 encoding:4];
    [v37 setObject:@"EV_ECC_v1-ASN.1" forKey:@"encryptionVersion"];
    [v37 setObject:v38 forKey:@"encryptedDocumentData"];
    v39 = [v25 hexEncoding];
    [v37 setObject:v39 forKey:@"publicKeyHash"];
  }
  v40 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v37];
  [v9 setHTTPBody:v40];

  id v35 = [v9 copy];
LABEL_30:

  return v35;
}

- (NSData)frontImageData
{
  return self->_frontImageData;
}

- (void)setFrontImageData:(id)a3
{
}

- (NSData)backImageData
{
  return self->_backImageData;
}

- (void)setBackImageData:(id)a3
{
}

- (NSString)documentCountryCode
{
  return self->_documentCountryCode;
}

- (void)setDocumentCountryCode:(id)a3
{
}

- (unint64_t)documentType
{
  return self->_documentType;
}

- (void)setDocumentType:(unint64_t)a3
{
  self->_documentType = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_documentCountryCode, 0);
  objc_storeStrong((id *)&self->_backImageData, 0);
  objc_storeStrong((id *)&self->_frontImageData, 0);
}

@end