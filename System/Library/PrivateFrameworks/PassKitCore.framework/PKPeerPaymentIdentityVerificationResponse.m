@interface PKPeerPaymentIdentityVerificationResponse
- (BOOL)complete;
- (BOOL)useDeviceValidation;
- (NSArray)acceptableDocuments;
- (NSArray)encryptionCertificates;
- (NSArray)requiredFieldsByPage;
- (NSString)encryptionVersion;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (NSString)subtitle;
- (NSString)title;
- (PKDynamicProvisioningPageLearnMoreContent)learnMore;
- (PKPeerPaymentAccount)account;
- (PKPeerPaymentIdentityVerificationResponse)initWithData:(id)a3;
- (int64_t)verificationContext;
- (void)setVerificationContext:(int64_t)a3;
@end

@implementation PKPeerPaymentIdentityVerificationResponse

- (PKPeerPaymentIdentityVerificationResponse)initWithData:(id)a3
{
  v105[1] = *MEMORY[0x1E4F143B8];
  v94.receiver = self;
  v94.super_class = (Class)PKPeerPaymentIdentityVerificationResponse;
  v3 = [(PKWebServiceResponse *)&v94 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v4->_complete = [v6 PKBoolForKey:@"complete"];
      v7 = [v6 PKDictionaryForKey:@"account"];
      if ([v7 count])
      {
        v8 = [PKPeerPaymentAccount alloc];
        v9 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v10 = [(PKPeerPaymentAccount *)v8 initWithDictionary:v7 lastUpdated:v9];
        account = v4->_account;
        v4->_account = (PKPeerPaymentAccount *)v10;
      }
      v67 = v7;
      uint64_t v12 = [v6 PKStringForKey:@"title"];
      title = v4->_title;
      v4->_title = (NSString *)v12;

      uint64_t v14 = [v6 PKStringForKey:@"subtitle"];
      subtitle = v4->_subtitle;
      v4->_subtitle = (NSString *)v14;

      uint64_t v16 = [v6 PKStringForKey:@"localizedTitle"];
      localizedTitle = v4->_localizedTitle;
      v4->_localizedTitle = (NSString *)v16;

      uint64_t v18 = [v6 PKStringForKey:@"localizedDescription"];
      localizedDescription = v4->_localizedDescription;
      v4->_localizedDescription = (NSString *)v18;

      v20 = [v6 PKDictionaryForKey:@"learnMore"];
      if ([v20 count])
      {
        v21 = [[PKDynamicProvisioningPageLearnMoreContent alloc] initWithDictionary:v20];
        learnMore = v4->_learnMore;
        v4->_learnMore = v21;
      }
      v65 = v20;
      v23 = [v6 PKArrayContaining:objc_opt_class() forKey:@"requiredFieldsByPage"];
      if (!v23)
      {
        uint64_t v24 = [v6 PKArrayContaining:objc_opt_class(), @"requiredFields", v65 forKey];
        v25 = (void *)v24;
        if (v24)
        {
          v103 = @"requiredFields";
          uint64_t v104 = v24;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
          v105[0] = v26;
          v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:1];
        }
        else
        {
          v23 = 0;
        }
      }
      v69 = v5;
      v76 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v65);
      v74 = [v6 PKDictionaryForKey:@"requiredFieldOptions"];
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      obuint64_t j = v23;
      uint64_t v32 = [obj countByEnumeratingWithState:&v90 objects:v102 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v91;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v91 != v34) {
              objc_enumerationMutation(obj);
            }
            v36 = [[PKPeerPaymentRequiredFieldsPage alloc] initWithDictionary:*(void *)(*((void *)&v90 + 1) + 8 * i) fieldOptions:v74];
            [v76 safelyAddObject:v36];
          }
          uint64_t v33 = [obj countByEnumeratingWithState:&v90 objects:v102 count:16];
        }
        while (v33);
      }

      uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithArray:v76];
      requiredFieldsByPage = v4->_requiredFieldsByPage;
      v4->_requiredFieldsByPage = (NSArray *)v37;

      v75 = [MEMORY[0x1E4F1CA48] array];
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      v39 = [v6 PKArrayContaining:objc_opt_class() forKey:@"encryptionCertificates"];
      uint64_t v40 = [v39 countByEnumeratingWithState:&v86 objects:v101 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v87;
        do
        {
          for (uint64_t j = 0; j != v41; ++j)
          {
            if (*(void *)v87 != v42) {
              objc_enumerationMutation(v39);
            }
            v44 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:*(void *)(*((void *)&v86 + 1) + 8 * j) options:0];
            [v75 safelyAddObject:v44];
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v86 objects:v101 count:16];
        }
        while (v41);
      }

      uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithArray:v75];
      encryptionCertificates = v4->_encryptionCertificates;
      v4->_encryptionCertificates = (NSArray *)v45;

      uint64_t v47 = [v6 PKStringForKey:@"encryptionVersion"];
      encryptionVersion = v4->_encryptionVersion;
      v70 = v4;
      v4->_encryptionVersion = (NSString *)v47;

      v68 = v6;
      v49 = [v6 objectForKey:@"acceptableDocuments"];
      id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v71 = v49;
      uint64_t v77 = [v71 countByEnumeratingWithState:&v82 objects:v100 count:16];
      if (v77)
      {
        uint64_t v73 = *(void *)v83;
        do
        {
          for (uint64_t k = 0; k != v77; ++k)
          {
            if (*(void *)v83 != v73) {
              objc_enumerationMutation(v71);
            }
            v52 = *(void **)(*((void *)&v82 + 1) + 8 * k);
            v53 = [v52 objectForKey:@"documentType"];
            uint64_t v54 = PKPaymentDocumentTypeFromString(v53);

            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            v55 = [v52 PKArrayForKey:@"countryCodes"];
            uint64_t v56 = [v55 countByEnumeratingWithState:&v78 objects:v99 count:16];
            if (v56)
            {
              uint64_t v57 = v56;
              uint64_t v58 = *(void *)v79;
              do
              {
                for (uint64_t m = 0; m != v57; ++m)
                {
                  if (*(void *)v79 != v58) {
                    objc_enumerationMutation(v55);
                  }
                  uint64_t v60 = *(void *)(*((void *)&v78 + 1) + 8 * m);
                  v61 = objc_alloc_init(PKDocumentRequest);
                  [(PKDocumentRequest *)v61 setDocumentType:v54];
                  [(PKDocumentRequest *)v61 setCountryCode:v60];
                  [v50 safelyAddObject:v61];
                }
                uint64_t v57 = [v55 countByEnumeratingWithState:&v78 objects:v99 count:16];
              }
              while (v57);
            }
          }
          uint64_t v77 = [v71 countByEnumeratingWithState:&v82 objects:v100 count:16];
        }
        while (v77);
      }

      uint64_t v62 = [MEMORY[0x1E4F1C978] arrayWithArray:v50];
      v4 = v70;
      acceptableDocuments = v70->_acceptableDocuments;
      v70->_acceptableDocuments = (NSArray *)v62;

      v27 = v68;
      v70->_useDeviceValidation = [v68 PKBoolForKey:@"useDeviceValidation"];

      v5 = v69;
    }
    else
    {
      v27 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        *(_DWORD *)buf = 138543618;
        v96 = v29;
        __int16 v97 = 2114;
        v98 = v31;
        _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (BOOL)complete
{
  return self->_complete;
}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (PKDynamicProvisioningPageLearnMoreContent)learnMore
{
  return self->_learnMore;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSArray)requiredFieldsByPage
{
  return self->_requiredFieldsByPage;
}

- (NSArray)acceptableDocuments
{
  return self->_acceptableDocuments;
}

- (BOOL)useDeviceValidation
{
  return self->_useDeviceValidation;
}

- (NSArray)encryptionCertificates
{
  return self->_encryptionCertificates;
}

- (NSString)encryptionVersion
{
  return self->_encryptionVersion;
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
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_encryptionCertificates, 0);
  objc_storeStrong((id *)&self->_acceptableDocuments, 0);
  objc_storeStrong((id *)&self->_requiredFieldsByPage, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_learnMore, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end