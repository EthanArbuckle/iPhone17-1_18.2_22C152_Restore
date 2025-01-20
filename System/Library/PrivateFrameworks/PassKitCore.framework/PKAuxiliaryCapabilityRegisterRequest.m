@interface PKAuxiliaryCapabilityRegisterRequest
- (NSArray)dpanIdentifiers;
- (NSArray)validCertificatesOnDevice;
- (NSData)signatureData;
- (NSDictionary)deviceOwnedKeyMaterials;
- (PKSecureElementSignatureInfo)signatureInfo;
- (id)_dataToSign;
- (id)_groupedKeyMaterial;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setDeviceOwnedKeyMaterials:(id)a3;
- (void)setDpanIdentifiers:(id)a3;
- (void)setSignatureData:(id)a3;
- (void)setSignatureInfo:(id)a3;
- (void)setValidCertificatesOnDevice:(id)a3;
@end

@implementation PKAuxiliaryCapabilityRegisterRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v26[6] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PKAuxiliaryCapabilityWebServiceRequest *)self pass];
  v26[0] = @"devices";
  v26[1] = v9;
  v26[2] = @"passes";
  v12 = [v11 passTypeIdentifier];
  v26[3] = v12;
  v13 = [v11 serialNumber];
  v26[4] = v13;
  v26[5] = @"register";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:6];
  v15 = [(PKAuxiliaryCapabilityWebServiceRequest *)self _murlRequestWithServiceURL:v10 endpointComponents:v14 queryParameters:0 appleAccountInformation:v8];

  v16 = [MEMORY[0x1E4F1CA60] dictionary];
  [v16 setObject:self->_validCertificatesOnDevice forKey:@"validCertificatesOnDevice"];
  [v16 setObject:self->_dpanIdentifiers forKey:@"dpanIdentifiers"];
  deviceOwnedKeyMaterials = self->_deviceOwnedKeyMaterials;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __107__PKAuxiliaryCapabilityRegisterRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation___block_invoke;
  v24 = &unk_1E56DFF88;
  id v25 = v16;
  id v18 = v16;
  [(NSDictionary *)deviceOwnedKeyMaterials enumerateKeysAndObjectsUsingBlock:&v21];
  v19 = objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v18, v21, v22, v23, v24);
  [v15 setHTTPBody:v19];

  [v15 setHTTPMethod:@"POST"];
  PKUpdateURLRequestWithSignatureDataAndInfo(v15, self->_signatureData, self->_signatureInfo);

  return v15;
}

void __107__PKAuxiliaryCapabilityRegisterRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = a2;
  v6 = PKAuxiliaryCapabilityRoleToString([v5 role]);
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
  }
  id v8 = [v11 dictionaryRepresentation];
  id v9 = (void *)[v8 mutableCopy];

  id v10 = [v5 dictionaryRepresentation];

  [v9 setObject:v10 forKeyedSubscript:@"requirement"];
  [v7 addObject:v9];
}

- (id)_dataToSign
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  dpanIdentifiers = self->_dpanIdentifiers;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __51__PKAuxiliaryCapabilityRegisterRequest__dataToSign__block_invoke;
  v27[3] = &unk_1E56DFFB0;
  id v5 = v3;
  id v28 = v5;
  [(NSArray *)dpanIdentifiers enumerateObjectsUsingBlock:v27];
  v6 = [@"-" dataUsingEncoding:4];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKAuxiliaryCapabilityRegisterRequest__dataToSign__block_invoke_2;
  aBlock[3] = &unk_1E56DFFD8;
  id v7 = v5;
  id v25 = v7;
  v26 = v6;
  id v8 = _Block_copy(aBlock);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __51__PKAuxiliaryCapabilityRegisterRequest__dataToSign__block_invoke_3;
  v20 = &unk_1E56E0000;
  id v21 = v7;
  uint64_t v22 = v6;
  id v23 = v8;
  id v9 = v8;
  id v10 = v7;
  id v11 = (void (**)(void *, void *))_Block_copy(&v17);
  v12 = [(PKAuxiliaryCapabilityRegisterRequest *)self _groupedKeyMaterial];
  v13 = [v12 objectForKeyedSubscript:@"deviceDecryptions"];
  v11[2](v11, v13);

  v14 = [v12 objectForKeyedSubscript:@"deviceSignatures"];
  v11[2](v11, v14);

  v15 = [v10 SHA256Hash];

  return v15;
}

void __51__PKAuxiliaryCapabilityRegisterRequest__dataToSign__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 dataUsingEncoding:4];
  [v2 appendData:v3];
}

void __51__PKAuxiliaryCapabilityRegisterRequest__dataToSign__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3 && [v3 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(a1 + 32), "appendData:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
  else
  {
    [*(id *)(a1 + 32) appendData:*(void *)(a1 + 40)];
  }
}

void __51__PKAuxiliaryCapabilityRegisterRequest__dataToSign__block_invoke_3(void *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  obuint64_t j = a2;
  if (obj)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v26)
    {
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(obj);
          }
          v4 = [*(id *)(*((void *)&v31 + 1) + 8 * i) contents];
          if ([v4 count])
          {
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            id v5 = v4;
            uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v6)
            {
              uint64_t v7 = v6;
              uint64_t v8 = *(void *)v28;
              do
              {
                for (uint64_t j = 0; j != v7; ++j)
                {
                  if (*(void *)v28 != v8) {
                    objc_enumerationMutation(v5);
                  }
                  long long v10 = *(void **)(*((void *)&v27 + 1) + 8 * j);
                  long long v11 = (void *)a1[4];
                  long long v12 = [v10 publicKey];
                  long long v13 = v12;
                  if (!v12) {
                    long long v13 = (void *)a1[5];
                  }
                  [v11 appendData:v13];

                  uint64_t v14 = a1[6];
                  uint64_t v15 = [v10 attestation];
                  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

                  uint64_t v16 = a1[6];
                  uint64_t v17 = [v10 secondaryAttestation];
                  (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

                  uint64_t v18 = (void *)a1[4];
                  v19 = [v10 authorization];
                  v20 = v19;
                  if (!v19) {
                    v20 = (void *)a1[5];
                  }
                  [v18 appendData:v20];

                  id v21 = (void *)a1[4];
                  uint64_t v22 = [v10 signature];
                  id v23 = v22;
                  if (!v22) {
                    id v23 = (void *)a1[5];
                  }
                  [v21 appendData:v23];
                }
                uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
              }
              while (v7);
            }
          }
          else
          {
            (*(void (**)(void))(a1[6] + 16))();
            (*(void (**)(void))(a1[6] + 16))();
            (*(void (**)(void))(a1[6] + 16))();
            (*(void (**)(void))(a1[6] + 16))();
            (*(void (**)(void))(a1[6] + 16))();
          }
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v26);
    }
  }
}

- (id)_groupedKeyMaterial
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  deviceOwnedKeyMaterials = self->_deviceOwnedKeyMaterials;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__PKAuxiliaryCapabilityRegisterRequest__groupedKeyMaterial__block_invoke;
  v8[3] = &unk_1E56DFF88;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)deviceOwnedKeyMaterials enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

void __59__PKAuxiliaryCapabilityRegisterRequest__groupedKeyMaterial__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = PKAuxiliaryCapabilityRoleToString([a2 role]);
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
  [v6 addObject:v7];
}

- (NSArray)dpanIdentifiers
{
  return self->_dpanIdentifiers;
}

- (void)setDpanIdentifiers:(id)a3
{
}

- (NSArray)validCertificatesOnDevice
{
  return self->_validCertificatesOnDevice;
}

- (void)setValidCertificatesOnDevice:(id)a3
{
}

- (NSDictionary)deviceOwnedKeyMaterials
{
  return self->_deviceOwnedKeyMaterials;
}

- (void)setDeviceOwnedKeyMaterials:(id)a3
{
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (void)setSignatureData:(id)a3
{
}

- (PKSecureElementSignatureInfo)signatureInfo
{
  return self->_signatureInfo;
}

- (void)setSignatureInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureInfo, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_deviceOwnedKeyMaterials, 0);
  objc_storeStrong((id *)&self->_validCertificatesOnDevice, 0);
  objc_storeStrong((id *)&self->_dpanIdentifiers, 0);
}

@end