@interface PKPaymentRemoteCredentialsResponse
- (NSArray)credentials;
- (PKPaymentRemoteCredentialsResponse)initWithData:(id)a3;
@end

@implementation PKPaymentRemoteCredentialsResponse

- (PKPaymentRemoteCredentialsResponse)initWithData:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentRemoteCredentialsResponse;
  v3 = [(PKWebServiceResponse *)&v26 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = (PKPaymentRemoteCredentialsResponse *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * v11);
            v13 = [PKPaymentRemoteCredential alloc];
            v14 = -[PKPaymentRemoteCredential initWithDictionary:](v13, "initWithDictionary:", v12, (void)v22);
            if (v14) {
              [(PKPaymentRemoteCredentialsResponse *)v6 addObject:v14];
            }

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v31 count:16];
        }
        while (v9);
      }

      uint64_t v15 = [(PKPaymentRemoteCredentialsResponse *)v6 copy];
      p_super = &v4->_credentials->super;
      v4->_credentials = (NSArray *)v15;
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        v19 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v28 = v18;
        __int16 v29 = 2112;
        v30 = v19;
        id v20 = v19;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v6 = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (NSArray)credentials
{
  return self->_credentials;
}

- (void).cxx_destruct
{
}

@end