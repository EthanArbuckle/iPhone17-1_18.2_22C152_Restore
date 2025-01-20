@interface PKPaymentProvisioningResponse
+ (BOOL)supportsSecureCoding;
- (NSArray)downloadablePasses;
- (NSArray)moreInfoURLs;
- (NSString)nonce;
- (PKContactInformation)idmsContactInformation;
- (PKExternalProvisioningOptions)externalProvisioningOptions;
- (PKPaymentProvisioningResponse)initWithCoder:(id)a3;
- (PKPaymentProvisioningResponse)initWithData:(id)a3;
- (PKProvisioningSupportData)encryptedProvisioningSupportData;
- (id)supportDataRepresentationWithSID:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentProvisioningResponse

- (PKPaymentProvisioningResponse)initWithData:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)PKPaymentProvisioningResponse;
  v3 = [(PKWebServiceResponse *)&v54 initWithData:a3];
  if (v3)
  {
    v4 = v3;
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v38 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (objc_class *)objc_opt_class();
        v40 = NSStringFromClass(v39);
        v41 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v56 = v40;
        __int16 v57 = 2112;
        v58 = v41;
        id v42 = v41;
        _os_log_impl(&dword_190E10000, v38, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v37 = 0;
LABEL_32:

      goto LABEL_33;
    }
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__PKPaymentProvisioningResponse_initWithData___block_invoke;
    aBlock[3] = &unk_1E56F6A78;
    id v7 = v6;
    id v52 = v7;
    v8 = v4;
    v53 = v8;
    v9 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
    if ((v9[2](v9, v5) & 1) == 0)
    {
      v10 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Unexpected response: expected root json to contain provisioning pass data. Attempting with \"passes\"", buf, 2u);
      }

      v11 = [v5 PKArrayContaining:objc_opt_class() forKey:@"passes"];
      v12 = v11;
      if (!v11)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v5;
          _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Unexpected response: \"passes\" dictionary array did not exist or did not contain expected dictionary of provisioning pass data.\nJSON: %@", buf, 0xCu);
        }
        char v36 = 0;
        uint64_t v26 = (uint64_t)v8;
        v8 = 0;
        goto LABEL_30;
      }
      v13 = [v11 firstObject];
      char v14 = v9[2](v9, v13);

      if ((v14 & 1) == 0)
      {
        char v36 = 0;
        v37 = 0;
LABEL_31:

        if ((v36 & 1) == 0)
        {

          v43 = 0;
          goto LABEL_34;
        }
        goto LABEL_32;
      }
    }
    uint64_t v15 = [v7 copy];
    downloadablePasses = v8->_downloadablePasses;
    v8->_downloadablePasses = (NSArray *)v15;

    v12 = [v5 PKArrayContaining:objc_opt_class() forKey:@"moreInfoURLs"];
    if ([v12 count])
    {
      v45 = v9;
      id v46 = v7;
      v17 = [MEMORY[0x1E4F1CA48] array];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v18 = v12;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v47 objects:v59 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v48 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v47 + 1) + 8 * i)];
            if (v23) {
              [v17 addObject:v23];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v47 objects:v59 count:16];
        }
        while (v20);
      }

      uint64_t v24 = [v17 copy];
      moreInfoURLs = v8->_moreInfoURLs;
      v8->_moreInfoURLs = (NSArray *)v24;

      v9 = v45;
      id v7 = v46;
    }
    uint64_t v26 = [v5 PKDictionaryForKey:@"contactInformation"];
    if (v26)
    {
      v27 = [[PKContactInformation alloc] initWithDictionary:v26];
      idmsContactInformation = v8->_idmsContactInformation;
      v8->_idmsContactInformation = v27;
    }
    uint64_t v29 = [v5 PKDictionaryForKey:@"encryptedProvisioningSupportData"];
    encryptedSupportDataDictionary = v8->_encryptedSupportDataDictionary;
    v8->_encryptedSupportDataDictionary = (NSDictionary *)v29;

    uint64_t v31 = [v5 PKStringForKey:@"nonce"];
    nonce = v8->_nonce;
    v8->_nonce = (NSString *)v31;

    v33 = [PKExternalProvisioningOptions alloc];
    v10 = [v5 PKDictionaryForKey:@"externalDestinationOptions"];
    uint64_t v34 = [(PKExternalProvisioningOptions *)v33 initWithDictionary:v10];
    externalProvisioningOptions = v8->_externalProvisioningOptions;
    v8->_externalProvisioningOptions = (PKExternalProvisioningOptions *)v34;

    char v36 = 1;
LABEL_30:
    v37 = v8;

    v8 = (PKPaymentProvisioningResponse *)v26;
    goto LABEL_31;
  }
  v37 = 0;
LABEL_33:
  v37 = v37;
  v43 = v37;
LABEL_34:

  return v43;
}

BOOL __46__PKPaymentProvisioningResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [[PKPaymentProvisioningPassData alloc] initWithDictionary:v3];
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2112;
      id v11 = v3;
      id v6 = v9;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Parsing Failure: did not create pass data inside %@ using %@", (uint8_t *)&v8, 0x16u);
    }
  }

  return v4 != 0;
}

- (id)supportDataRepresentationWithSID:(id)a3
{
  if (self->_encryptedSupportDataDictionary)
  {
    id v4 = a3;
    v5 = [[PKProvisioningJPKISupportData alloc] initWithEncryptedSupportDataDictionary:self->_encryptedSupportDataDictionary sid:v4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentProvisioningResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentProvisioningResponse;
  v5 = [(PKWebServiceResponse *)&v23 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    int v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"downloadablePasses"];
    downloadablePasses = v5->_downloadablePasses;
    v5->_downloadablePasses = (NSArray *)v9;

    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"moreInfoURLs"];
    moreInfoURLs = v5->_moreInfoURLs;
    v5->_moreInfoURLs = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idmsContactInformation"];
    idmsContactInformation = v5->_idmsContactInformation;
    v5->_idmsContactInformation = (PKContactInformation *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalProvisioningOptions"];
    externalProvisioningOptions = v5->_externalProvisioningOptions;
    v5->_externalProvisioningOptions = (PKExternalProvisioningOptions *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningResponse;
  id v4 = a3;
  [(PKWebServiceResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_downloadablePasses, @"downloadablePasses", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_moreInfoURLs forKey:@"moreInfoURLs"];
  [v4 encodeObject:self->_idmsContactInformation forKey:@"idmsContactInformation"];
  [v4 encodeObject:self->_nonce forKey:@"nonce"];
  [v4 encodeObject:self->_externalProvisioningOptions forKey:@"externalProvisioningOptions"];
}

- (NSArray)downloadablePasses
{
  return self->_downloadablePasses;
}

- (NSArray)moreInfoURLs
{
  return self->_moreInfoURLs;
}

- (PKContactInformation)idmsContactInformation
{
  return self->_idmsContactInformation;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (PKExternalProvisioningOptions)externalProvisioningOptions
{
  return self->_externalProvisioningOptions;
}

- (PKProvisioningSupportData)encryptedProvisioningSupportData
{
  return self->_encryptedProvisioningSupportData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedProvisioningSupportData, 0);
  objc_storeStrong((id *)&self->_externalProvisioningOptions, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_idmsContactInformation, 0);
  objc_storeStrong((id *)&self->_moreInfoURLs, 0);
  objc_storeStrong((id *)&self->_downloadablePasses, 0);
  objc_storeStrong((id *)&self->_encryptedSupportDataDictionary, 0);
}

@end