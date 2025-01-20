@interface PKPaymentIssuerProvisioningCertificatesResponse
- (NSArray)certificates;
- (NSData)nonce;
- (NSData)nonceSignature;
- (NSData)publicKeyHash;
- (PKPaymentIssuerProvisioningCertificatesResponse)initWithData:(id)a3;
- (void)setNonceSignature:(id)a3;
- (void)setPublicKeyHash:(id)a3;
@end

@implementation PKPaymentIssuerProvisioningCertificatesResponse

- (PKPaymentIssuerProvisioningCertificatesResponse)initWithData:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)PKPaymentIssuerProvisioningCertificatesResponse;
  v3 = [(PKWebServiceResponse *)&v29 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 objectForKeyedSubscript:@"certificates"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [v5 objectForKeyedSubscript:@"nonce"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || !v7)
        {
          v24 = v7;
          v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v6 = v6;
          uint64_t v9 = [v6 countByEnumeratingWithState:&v25 objects:v32 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v26;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v26 != v11) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * v12);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v13 options:0];
                  if (v14) {
                    [v8 addObject:v14];
                  }
                }
                ++v12;
              }
              while (v10 != v12);
              uint64_t v10 = [v6 countByEnumeratingWithState:&v25 objects:v32 count:16];
            }
            while (v10);
          }

          if ([v8 count])
          {
            uint64_t v15 = [v8 copy];
            certificates = v4->_certificates;
            v4->_certificates = (NSArray *)v15;
          }
          v7 = v24;
          v17 = objc_msgSend(v24, "pk_decodeHexadecimal");
          uint64_t v18 = [v17 copy];
          nonce = v4->_nonce;
          v4->_nonce = (NSData *)v18;
        }
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
      id v6 = 0;
    }
    if (!v4->_certificates || !v4->_nonce)
    {
      v20 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 138543362;
        v31 = v22;
        _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@.", buf, 0xCu);
      }
      v4 = 0;
    }
  }
  return v4;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
}

- (NSData)nonceSignature
{
  return self->_nonceSignature;
}

- (void)setNonceSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonceSignature, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end