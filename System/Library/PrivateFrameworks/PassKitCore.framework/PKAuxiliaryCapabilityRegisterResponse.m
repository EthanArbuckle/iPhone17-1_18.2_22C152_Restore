@interface PKAuxiliaryCapabilityRegisterResponse
+ (BOOL)jsonDataOptional;
- (NSArray)deviceDecryptionCertificateChain;
- (NSArray)deviceSignatureCertificateChain;
- (NSArray)serverDecryptionCertificateChain;
- (NSArray)serverSignatureCertificateChain;
- (PKAuxiliaryCapabilityRegisterResponse)initWithData:(id)a3;
- (id)_retrieveCertificateChainFromJSONObject:(id)a3 withParameterName:(id)a4;
- (void)setDeviceDecryptionCertificateChain:(id)a3;
- (void)setDeviceSignatureCertificateChain:(id)a3;
- (void)setServerDecryptionCertificateChain:(id)a3;
- (void)setServerSignatureCertificateChain:(id)a3;
@end

@implementation PKAuxiliaryCapabilityRegisterResponse

- (PKAuxiliaryCapabilityRegisterResponse)initWithData:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)PKAuxiliaryCapabilityRegisterResponse;
  v3 = [(PKWebServiceResponse *)&v20 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [(PKAuxiliaryCapabilityRegisterResponse *)v4 _retrieveCertificateChainFromJSONObject:v5 withParameterName:@"deviceSignatureCertificateChain"];
        deviceSignatureCertificateChain = v4->_deviceSignatureCertificateChain;
        v4->_deviceSignatureCertificateChain = (NSArray *)v6;

        uint64_t v8 = [(PKAuxiliaryCapabilityRegisterResponse *)v4 _retrieveCertificateChainFromJSONObject:v5 withParameterName:@"deviceDecryptionCertificateChain"];
        deviceDecryptionCertificateChain = v4->_deviceDecryptionCertificateChain;
        v4->_deviceDecryptionCertificateChain = (NSArray *)v8;

        uint64_t v10 = [(PKAuxiliaryCapabilityRegisterResponse *)v4 _retrieveCertificateChainFromJSONObject:v5 withParameterName:@"serverDecryptionCertificateChain"];
        serverDecryptionCertificateChain = v4->_serverDecryptionCertificateChain;
        v4->_serverDecryptionCertificateChain = (NSArray *)v10;

        uint64_t v12 = [(PKAuxiliaryCapabilityRegisterResponse *)v4 _retrieveCertificateChainFromJSONObject:v5 withParameterName:@"serverSignatureCertificateChain"];
        serverSignatureCertificateChain = v4->_serverSignatureCertificateChain;
        v4->_serverSignatureCertificateChain = (NSArray *)v12;
      }
      else
      {
        v14 = PKLogFacilityTypeGetObject(0x1CuLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (objc_class *)objc_opt_class();
          v16 = NSStringFromClass(v15);
          v17 = (objc_class *)objc_opt_class();
          v18 = NSStringFromClass(v17);
          *(_DWORD *)buf = 138543618;
          v22 = v16;
          __int16 v23 = 2114;
          v24 = v18;
          _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
        }
        serverSignatureCertificateChain = v4;
        v4 = 0;
      }
    }
  }
  return v4;
}

- (id)_retrieveCertificateChainFromJSONObject:(id)a3 withParameterName:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = [a3 objectForKeyedSubscript:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (id v12 = objc_alloc(MEMORY[0x1E4F1C9B8]),
                (uint64_t v13 = objc_msgSend(v12, "initWithBase64EncodedString:options:", v11, 0, (void)v17)) == 0))
          {

            v15 = 0;
            goto LABEL_14;
          }
          v14 = (void *)v13;
          [v5 addObject:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    v15 = (void *)[v5 copy];
  }
  else
  {
    v15 = 0;
    id v5 = 0;
  }
LABEL_14:

  return v15;
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

- (NSArray)deviceSignatureCertificateChain
{
  return self->_deviceSignatureCertificateChain;
}

- (void)setDeviceSignatureCertificateChain:(id)a3
{
}

- (NSArray)deviceDecryptionCertificateChain
{
  return self->_deviceDecryptionCertificateChain;
}

- (void)setDeviceDecryptionCertificateChain:(id)a3
{
}

- (NSArray)serverDecryptionCertificateChain
{
  return self->_serverDecryptionCertificateChain;
}

- (void)setServerDecryptionCertificateChain:(id)a3
{
}

- (NSArray)serverSignatureCertificateChain
{
  return self->_serverSignatureCertificateChain;
}

- (void)setServerSignatureCertificateChain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSignatureCertificateChain, 0);
  objc_storeStrong((id *)&self->_serverDecryptionCertificateChain, 0);
  objc_storeStrong((id *)&self->_deviceDecryptionCertificateChain, 0);
  objc_storeStrong((id *)&self->_deviceSignatureCertificateChain, 0);
}

@end