@interface PKApplyWebServiceApplyStepInfo
- (NSArray)encryptionCertificates;
- (NSArray)pages;
- (NSString)conversationIdentifier;
- (NSString)coreIDVServiceProviderName;
- (NSString)coreIDVSessionID;
- (NSString)coreIDVTier;
- (NSString)encryptionVersion;
- (PKApplyWebServiceApplyStepInfo)initWithJSONObject:(id)a3 featureApplication:(id)a4;
- (unint64_t)contextType;
- (void)_handleCertificates:(id)a3;
- (void)setConversationIdentifier:(id)a3;
@end

@implementation PKApplyWebServiceApplyStepInfo

- (PKApplyWebServiceApplyStepInfo)initWithJSONObject:(id)a3 featureApplication:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v55 = a4;
  v64.receiver = self;
  v64.super_class = (Class)PKApplyWebServiceApplyStepInfo;
  v7 = [(PKApplyWebServiceApplyStepInfo *)&v64 init];
  if (v7)
  {
    v8 = [v6 PKStringForKey:@"contextType"];
    v7->_contextType = PKApplyContextTypeFromString(v8);

    switch(v7->_contextType)
    {
      case 0uLL:
        [(PKApplyWebServiceApplyStepInfo *)v7 _handleCertificates:v6];
        v16 = [v6 PKArrayContaining:objc_opt_class() forKey:@"requiredFieldsByPage"];
        coreIDVSessionID = [MEMORY[0x1E4F1CA48] array];
        v17 = [v6 PKDictionaryForKey:@"requiredFieldOptions"];
        v18 = [v6 PKStringForKey:@"identifier"];
        v19 = v18;
        id v51 = v6;
        if (v18)
        {
          id v20 = v18;
        }
        else
        {
          id v20 = [v6 PKStringForKey:@"contextIdentifier"];
        }
        v41 = v20;

        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id obja = v16;
        uint64_t v42 = [obja countByEnumeratingWithState:&v60 objects:v69 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = 0;
          uint64_t v45 = *(void *)v61;
          do
          {
            for (uint64_t i = 0; i != v43; ++i)
            {
              if (*(void *)v61 != v45) {
                objc_enumerationMutation(obja);
              }
              v47 = [[PKApplyRequiredFieldsPage alloc] initWithDictionary:*(void *)(*((void *)&v60 + 1) + 8 * i) fieldOptions:v17 featureApplication:v55];
              [(PKDynamicProvisioningPageContent *)v47 setPageNumber:v44 + i];
              [(PKDynamicProvisioningPageContent *)v47 setIdentifier:v41];
              [coreIDVSessionID safelyAddObject:v47];
            }
            uint64_t v43 = [obja countByEnumeratingWithState:&v60 objects:v69 count:16];
            v44 += i;
          }
          while (v43);
        }
        v10 = obja;

        uint64_t v48 = [coreIDVSessionID copy];
        pages = v7->_pages;
        v7->_pages = (NSArray *)v48;

        id v6 = v51;
        goto LABEL_6;
      case 1uLL:
        v21 = [[PKDynamicProvisioningPageContent alloc] initWithDictonary:v6];
        v10 = v21;
        if (v21)
        {
          v67 = v21;
          uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
          v23 = v7->_pages;
          v7->_pages = (NSArray *)v22;
        }
        uint64_t v24 = [v6 PKStringForKey:@"coreIDVTier"];
        coreIDVTier = v7->_coreIDVTier;
        v7->_coreIDVTier = (NSString *)v24;

        uint64_t v26 = [v6 PKStringForKey:@"coreIDVServiceProviderName"];
        coreIDVServiceProviderName = v7->_coreIDVServiceProviderName;
        v7->_coreIDVServiceProviderName = (NSString *)v26;

        uint64_t v28 = [v6 PKStringForKey:@"coreIDVSessionID"];
        coreIDVSessionID = v7->_coreIDVSessionID;
        v7->_coreIDVSessionID = (NSString *)v28;
        goto LABEL_6;
      case 2uLL:
        [(PKApplyWebServiceApplyStepInfo *)v7 _handleCertificates:v6];
        v29 = [[PKApplyDocumentUploadPage alloc] initWithJSONObject:v6];
        v10 = v29;
        if (!v29) {
          goto LABEL_7;
        }
        v68 = v29;
        v11 = (void *)MEMORY[0x1E4F1C978];
        v12 = &v68;
        break;
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 0xAuLL:
        v9 = [[PKDynamicProvisioningPageContent alloc] initWithDictonary:v6];
        v10 = v9;
        if (!v9) {
          goto LABEL_7;
        }
        v65 = v9;
        v11 = (void *)MEMORY[0x1E4F1C978];
        v12 = &v65;
        break;
      case 9uLL:
        v10 = [v6 PKDictionaryForKey:@"requiredFieldOptions"];
        v30 = [v6 PKStringForKey:@"verificationType"];
        uint64_t v31 = PKApplyVerificationTypeFromString(v30);

        uint64_t v32 = [v6 PKIntegerForKey:@"verificationCodeLength"];
        v33 = [v6 PKArrayContaining:objc_opt_class() forKey:@"requiredFieldsByPage"];
        v34 = [MEMORY[0x1E4F1CA48] array];
        obuint64_t j = v33;
        if ([v33 count])
        {
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          v35 = v33;
          uint64_t v36 = [(PKApplyVerificationPage *)v35 countByEnumeratingWithState:&v56 objects:v66 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            v50 = v7;
            id v52 = v6;
            uint64_t v38 = *(void *)v57;
            do
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v57 != v38) {
                  objc_enumerationMutation(v35);
                }
                v40 = [[PKApplyVerificationPage alloc] initWithDictionary:*(void *)(*((void *)&v56 + 1) + 8 * j) type:v31 codeLength:v32 fieldOptions:v10];
                [v34 safelyAddObject:v40];
              }
              uint64_t v37 = [(PKApplyVerificationPage *)v35 countByEnumeratingWithState:&v56 objects:v66 count:16];
            }
            while (v37);
            v7 = v50;
            id v6 = v52;
          }
        }
        else
        {
          v35 = [[PKApplyVerificationPage alloc] initWithDictionary:v6 type:v31 codeLength:v32 fieldOptions:v10];
          [v34 safelyAddObject:v35];
        }

        if ([v34 count]) {
          objc_storeStrong((id *)&v7->_pages, v34);
        }

        coreIDVSessionID = obj;
        goto LABEL_6;
      default:
        goto LABEL_8;
    }
    uint64_t v13 = [v11 arrayWithObjects:v12 count:1];
    coreIDVSessionID = v7->_pages;
    v7->_pages = (NSArray *)v13;
LABEL_6:

LABEL_7:
  }
LABEL_8:

  return v7;
}

- (void)_handleCertificates:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), @"encryptionCertificates", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:*(void *)(*((void *)&v16 + 1) + 8 * v10) options:0];
        [v5 safelyAddObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v12 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];
  encryptionCertificates = self->_encryptionCertificates;
  self->_encryptionCertificates = v12;

  v14 = [v4 PKStringForKey:@"encryptionVersion"];
  encryptionVersion = self->_encryptionVersion;
  self->_encryptionVersion = v14;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (void)setConversationIdentifier:(id)a3
{
}

- (unint64_t)contextType
{
  return self->_contextType;
}

- (NSArray)pages
{
  return self->_pages;
}

- (NSString)coreIDVSessionID
{
  return self->_coreIDVSessionID;
}

- (NSString)coreIDVServiceProviderName
{
  return self->_coreIDVServiceProviderName;
}

- (NSString)coreIDVTier
{
  return self->_coreIDVTier;
}

- (NSArray)encryptionCertificates
{
  return self->_encryptionCertificates;
}

- (NSString)encryptionVersion
{
  return self->_encryptionVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_encryptionCertificates, 0);
  objc_storeStrong((id *)&self->_coreIDVTier, 0);
  objc_storeStrong((id *)&self->_coreIDVServiceProviderName, 0);
  objc_storeStrong((id *)&self->_coreIDVSessionID, 0);
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
}

@end