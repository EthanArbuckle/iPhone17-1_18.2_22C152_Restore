@interface PKAccountWebServiceCertificatesResponse
- (BOOL)devSigned;
- (NSArray)encryptionCertificates;
- (NSString)encryptionVersion;
- (PKAccountWebServiceCertificatesResponse)initWithData:(id)a3;
- (void)setDevSigned:(BOOL)a3;
@end

@implementation PKAccountWebServiceCertificatesResponse

- (PKAccountWebServiceCertificatesResponse)initWithData:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)PKAccountWebServiceCertificatesResponse;
  v3 = [(PKWebServiceResponse *)&v26 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = [MEMORY[0x1E4F1CA48] array];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v8 = [v6 PKArrayContaining:objc_opt_class(), @"encryptionCertificates", 0 forKey];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v23;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:*(void *)(*((void *)&v22 + 1) + 8 * v12) options:0];
            [v7 safelyAddObject:v13];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
        }
        while (v10);
      }

      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];
      encryptionCertificates = v4->_encryptionCertificates;
      v4->_encryptionCertificates = (NSArray *)v14;

      uint64_t v16 = [v6 PKStringForKey:@"encryptionVersion"];
      encryptionVersion = v4->_encryptionVersion;
      v4->_encryptionVersion = (NSString *)v16;
    }
    else
    {
      v6 = PKLogFacilityTypeGetObject(0xEuLL);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        return v4;
      }
      v18 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v18);
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138543618;
      v28 = v7;
      __int16 v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  return v4;
}

- (NSArray)encryptionCertificates
{
  return self->_encryptionCertificates;
}

- (NSString)encryptionVersion
{
  return self->_encryptionVersion;
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
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_encryptionCertificates, 0);
}

@end