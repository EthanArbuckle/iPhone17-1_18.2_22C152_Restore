@interface PKApplyDocumentUploadPage
- (BOOL)requiresCoreIDVImageCaptureUpload;
- (NSArray)acceptableDocuments;
- (NSArray)imageCaptureEncryptionCertificates;
- (NSString)imageCaptureEncryptionVersion;
- (PKApplyDocumentUploadPage)initWithJSONObject:(id)a3;
- (void)setAcceptableDocuments:(id)a3;
@end

@implementation PKApplyDocumentUploadPage

- (PKApplyDocumentUploadPage)initWithJSONObject:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)PKApplyDocumentUploadPage;
  v5 = [(PKDynamicProvisioningPageContent *)&v51 initWithDictonary:v4];
  v6 = v5;
  if (v5)
  {
    v34 = v5;
    v35 = v4;
    v7 = [v4 PKArrayContaining:objc_opt_class() forKey:@"acceptableDocuments"];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obuint64_t j = v7;
    uint64_t v38 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v38)
    {
      uint64_t v37 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v48 != v37) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          v11 = [v10 PKStringForKey:@"documentType"];
          uint64_t v12 = PKPaymentDocumentTypeFromString(v11);

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v13 = [v10 PKArrayForKey:@"countryCodes"];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v43 objects:v53 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v44;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v44 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v43 + 1) + 8 * j);
                v19 = objc_alloc_init(PKDocumentRequest);
                [(PKDocumentRequest *)v19 setDocumentType:v12];
                [(PKDocumentRequest *)v19 setCountryCode:v18];
                [v8 safelyAddObject:v19];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v43 objects:v53 count:16];
            }
            while (v15);
          }
        }
        uint64_t v38 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
      }
      while (v38);
    }

    uint64_t v20 = [v8 copy];
    v6 = v34;
    acceptableDocuments = v34->_acceptableDocuments;
    v34->_acceptableDocuments = (NSArray *)v20;

    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v4 = v35;
    v23 = [v35 PKArrayContaining:objc_opt_class() forKey:@"imageCaptureEncryptionCertificates"];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:*(void *)(*((void *)&v39 + 1) + 8 * k) options:0];
          [v22 safelyAddObject:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v52 count:16];
      }
      while (v25);
    }

    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithArray:v22];
    imageCaptureEncryptionCertificates = v34->_imageCaptureEncryptionCertificates;
    v34->_imageCaptureEncryptionCertificates = (NSArray *)v29;

    uint64_t v31 = [v35 PKStringForKey:@"imageCaptureEncryptionVersion"];
    imageCaptureEncryptionVersion = v34->_imageCaptureEncryptionVersion;
    v34->_imageCaptureEncryptionVersion = (NSString *)v31;

    v34->_requiresCoreIDVImageCaptureUpload = [v35 PKBoolForKey:@"requiresCoreIDVImageCaptureUpload"];
  }

  return v6;
}

- (NSArray)acceptableDocuments
{
  return self->_acceptableDocuments;
}

- (void)setAcceptableDocuments:(id)a3
{
}

- (BOOL)requiresCoreIDVImageCaptureUpload
{
  return self->_requiresCoreIDVImageCaptureUpload;
}

- (NSArray)imageCaptureEncryptionCertificates
{
  return self->_imageCaptureEncryptionCertificates;
}

- (NSString)imageCaptureEncryptionVersion
{
  return self->_imageCaptureEncryptionVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCaptureEncryptionVersion, 0);
  objc_storeStrong((id *)&self->_imageCaptureEncryptionCertificates, 0);
  objc_storeStrong((id *)&self->_acceptableDocuments, 0);
}

@end