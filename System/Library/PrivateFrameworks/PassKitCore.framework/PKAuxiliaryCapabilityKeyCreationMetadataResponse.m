@interface PKAuxiliaryCapabilityKeyCreationMetadataResponse
- (PKAuxiliaryCapabilityKeyCreationMetadataResponse)initWithData:(id)a3;
- (id)entriesForCapabilities:(id)a3;
@end

@implementation PKAuxiliaryCapabilityKeyCreationMetadataResponse

- (PKAuxiliaryCapabilityKeyCreationMetadataResponse)initWithData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PKAuxiliaryCapabilityKeyCreationMetadataResponse;
  v3 = [(PKWebServiceResponse *)&v15 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      uint64_t v7 = [(PKAuxiliaryCapabilityKeyCreationMetadataResponse *)v6 PKArrayContaining:objc_opt_class() forKey:@"entries"];
      entryDicts = v4->_entryDicts;
      v4->_entryDicts = (NSArray *)v7;

      p_super = &v4->super.super.super.super;
      if (v4->_entryDicts)
      {
LABEL_9:

        return v4;
      }
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject(0x1CuLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138543618;
        v17 = v11;
        __int16 v18 = 2114;
        v19 = v13;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
      v6 = v4;
    }

    v4 = 0;
    goto LABEL_9;
  }
  return v4;
}

- (id)entriesForCapabilities:(id)a3
{
  v4 = objc_msgSend(a3, "pk_indexDictionaryByApplyingBlock:", &__block_literal_global_120);
  entryDicts = self->_entryDicts;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__PKAuxiliaryCapabilityKeyCreationMetadataResponse_entriesForCapabilities___block_invoke_2;
  v9[3] = &unk_1E56DF920;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSArray *)entryDicts pk_arrayBySafelyApplyingBlock:v9];

  return v7;
}

uint64_t __75__PKAuxiliaryCapabilityKeyCreationMetadataResponse_entriesForCapabilities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

PKAuxiliaryCapabilityKeyCreationMetadataResponseEntry *__75__PKAuxiliaryCapabilityKeyCreationMetadataResponse_entriesForCapabilities___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 PKDictionaryForKey:@"capability"];
  v5 = [v4 PKStringForKey:@"role"];
  id v6 = v5;
  if (!v5)
  {
    v9 = [v4 PKStringForKey:@"identifier"];
    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
    }
    else
    {
      id v10 = 0;
    }

    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  uint64_t v7 = PKAuxiliaryCapabilityRoleFromString(v5);
  if (v7 == 2)
  {
    v8 = PKPassAuxiliaryRegistrationSignatureRequirement;
LABEL_8:
    id v10 = (void *)[[v8 alloc] initWithDictionary:v4];
    if (!v10) {
      goto LABEL_9;
    }
LABEL_12:
    v12 = [v3 PKDictionaryForKey:@"metadata"];
    v13 = +[PKPassAuxiliaryCapabilityKeyCreationMetadata createMetadataFromDictionary:v12 forCapability:v10];

    if (v13) {
      v11 = [[PKAuxiliaryCapabilityKeyCreationMetadataResponseEntry alloc] initWithCapability:v10 metadata:v13];
    }
    else {
      v11 = 0;
    }

    goto LABEL_16;
  }
  if (v7 == 1)
  {
    v8 = PKPassAuxiliaryRegistrationDecryptionRequirement;
    goto LABEL_8;
  }
LABEL_9:
  v11 = 0;
LABEL_16:

  return v11;
}

- (void).cxx_destruct
{
}

@end