@interface PKApplyWebServiceDocumentSubmissionRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)certificates;
- (NSData)backImageData;
- (NSData)frontImageData;
- (NSData)uploadedDocumentData;
- (NSString)applicationIdentifier;
- (NSString)documentCountryCode;
- (NSString)odiAssessment;
- (NSURL)baseURL;
- (PKApplyWebServiceDocumentSubmissionRequest)initWithCoder:(id)a3;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (int64_t)channel;
- (unint64_t)documentType;
- (unint64_t)featureIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setBackImageData:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCertificates:(id)a3;
- (void)setChannel:(int64_t)a3;
- (void)setDocumentCountryCode:(id)a3;
- (void)setDocumentType:(unint64_t)a3;
- (void)setFeatureIdentifier:(unint64_t)a3;
- (void)setFrontImageData:(id)a3;
- (void)setOdiAssessment:(id)a3;
- (void)setUploadedDocumentData:(id)a3;
@end

@implementation PKApplyWebServiceDocumentSubmissionRequest

- (PKApplyWebServiceDocumentSubmissionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKApplyWebServiceDocumentSubmissionRequest;
  v5 = [(PKApplyWebServiceRequest *)&v26 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"certificates"];
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v13;

    v5->_featureIdentifier = [v4 decodeIntegerForKey:@"featureIdentifier"];
    v5->_documentType = [v4 decodeIntegerForKey:@"documentType"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    documentCountryCode = v5->_documentCountryCode;
    v5->_documentCountryCode = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frontImageData"];
    frontImageData = v5->_frontImageData;
    v5->_frontImageData = (NSData *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backImageData"];
    backImageData = v5->_backImageData;
    v5->_backImageData = (NSData *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uploadedDocumentData"];
    uploadedDocumentData = v5->_uploadedDocumentData;
    v5->_uploadedDocumentData = (NSData *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"odiAssessment"];
    odiAssessment = v5->_odiAssessment;
    v5->_odiAssessment = (NSString *)v23;

    v5->_channel = [v4 decodeIntegerForKey:@"channel"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceDocumentSubmissionRequest;
  id v4 = a3;
  [(PKApplyWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, @"applicationIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_baseURL forKey:@"baseURL"];
  [v4 encodeObject:self->_certificates forKey:@"certificates"];
  [v4 encodeInteger:self->_featureIdentifier forKey:@"featureIdentifier"];
  [v4 encodeInteger:self->_documentType forKey:@"documentType"];
  [v4 encodeObject:self->_documentCountryCode forKey:@"countryCode"];
  [v4 encodeObject:self->_frontImageData forKey:@"frontImageData"];
  [v4 encodeObject:self->_backImageData forKey:@"backImageData"];
  [v4 encodeObject:self->_uploadedDocumentData forKey:@"uploadedDocumentData"];
  [v4 encodeObject:self->_odiAssessment forKey:@"odiAssessment"];
  [v4 encodeInteger:self->_channel forKey:@"channel"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    uint64_t v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v46 = v14;
    __int16 v47 = 2082;
    v48 = "appleAccountInformation";
    uint64_t v15 = "Request %{public}@ missing parameter '%{public}s'.";
LABEL_13:
    v18 = v8;
    uint32_t v19 = 22;
    goto LABEL_14;
  }
  if (!self->_documentCountryCode)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    v16 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v46 = v14;
    __int16 v47 = 2082;
    v48 = "_documentCountryCode";
    uint64_t v15 = "Request %{public}@ missing parameter '%{public}s'.";
    goto LABEL_13;
  }
  if (!self->_documentType)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138543618;
      v46 = v14;
      __int16 v47 = 2082;
      v48 = "_documentType";
      uint64_t v15 = "Request %{public}@ missing parameter '%{public}s'.";
      goto LABEL_13;
    }
LABEL_16:
    id v20 = 0;
    goto LABEL_17;
  }
  baseURL = self->_baseURL;
  applicationIdentifier = self->_applicationIdentifier;
  v44[0] = @"applications";
  v44[1] = applicationIdentifier;
  v44[2] = @"documents";
  v44[3] = @"submit";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
  uint64_t v8 = [(PKApplyWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v7 queryParameters:0 appleAccountInformation:v4];

  [v8 setHTTPMethod:@"POST"];
  [v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  if (![(NSArray *)self->_certificates count])
  {
    v14 = PKLogFacilityTypeGetObject(0xDuLL);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    uint64_t v15 = "Error: Tried to submit document without certificates";
    v18 = v14;
    uint32_t v19 = 2;
LABEL_14:
    _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, v15, buf, v19);
LABEL_15:

    goto LABEL_16;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uploadedDocumentData = self->_uploadedDocumentData;
  if (uploadedDocumentData)
  {
    uint64_t v11 = [(NSData *)uploadedDocumentData base64EncodedStringWithOptions:0];
    [v9 setObject:v11 forKey:@"documentData"];
    v12 = @"uploadedDocumentData";
  }
  else
  {
    frontImageData = self->_frontImageData;
    if (frontImageData)
    {
      uint64_t v23 = [(NSData *)frontImageData base64EncodedStringWithOptions:0];
      [v9 setObject:v23 forKey:@"documentFrontImage"];
    }
    backImageData = self->_backImageData;
    if (!backImageData)
    {
      v12 = @"encryptedDocumentData";
      goto LABEL_27;
    }
    uint64_t v11 = [(NSData *)backImageData base64EncodedStringWithOptions:0];
    [v9 setObject:v11 forKey:@"documentBackImage"];
    v12 = @"encryptedDocumentData";
  }

LABEL_27:
  [v9 setObject:self->_documentCountryCode forKey:@"documentCountryCode"];
  v25 = PKPaymentDocumentTypeToString(self->_documentType);
  [v9 setObject:v25 forKey:@"documentType"];

  objc_super v26 = (void *)MEMORY[0x192FDC630]();
  if ([v9 count])
  {
    v42 = v12;
    v27 = PKLogFacilityTypeGetObject(0xDuLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = NSString;
      v29 = [v9 allKeys];
      v30 = [v28 stringWithFormat:@"Encrypted document data: %@", v29];
      *(_DWORD *)buf = 138477827;
      v46 = v30;
      _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
    }
    v31 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v9];
    certificates = self->_certificates;
    id v43 = 0;
    v33 = PKFeatureEncryptDataWithCertChain(v31, certificates, &v43, self->_featureIdentifier);
    id v34 = v43;

    if (v33)
    {
      v12 = v42;
    }
    else
    {
      v12 = v42;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate apply document submission request encryptedDocumentData. This is bad!", buf, 2u);
      }

      v33 = 0;
    }
  }
  else
  {
    v33 = 0;
    id v34 = 0;
  }
  v35 = [(PKApplyWebServiceRequest *)self _createMutableBody];
  if (v33)
  {
    v36 = (void *)[[NSString alloc] initWithData:v33 encoding:4];
    [v35 setObject:@"EV_ECC_v1-ASN.1" forKey:@"encryptionVersion"];
    [v35 setObject:v36 forKey:v12];
    v37 = [v34 hexEncoding];
    [v35 setObject:v37 forKey:@"publicKeyHash"];
  }
  odiAssessment = self->_odiAssessment;
  if (odiAssessment) {
    [v35 setObject:odiAssessment forKey:@"odiAssessment"];
  }
  int64_t channel = self->_channel;
  if (channel)
  {
    v40 = PKFeatureApplicationChannelToString(channel);
    [v35 setObject:v40 forKeyedSubscript:@"channel"];
  }
  v41 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v35];
  [v8 setHTTPBody:v41];

  id v20 = [v8 copy];
LABEL_17:

  return v20;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
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

- (NSData)uploadedDocumentData
{
  return self->_uploadedDocumentData;
}

- (void)setUploadedDocumentData:(id)a3
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

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_int64_t channel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_documentCountryCode, 0);
  objc_storeStrong((id *)&self->_uploadedDocumentData, 0);
  objc_storeStrong((id *)&self->_backImageData, 0);
  objc_storeStrong((id *)&self->_frontImageData, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end