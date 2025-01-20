@interface PKPaymentPushProvisioningSharingIdentifiersResponse
- (NSArray)sharedCredentials;
- (PKPaymentPushProvisioningSharingIdentifiersResponse)initWithData:(id)a3;
@end

@implementation PKPaymentPushProvisioningSharingIdentifiersResponse

- (PKPaymentPushProvisioningSharingIdentifiersResponse)initWithData:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentPushProvisioningSharingIdentifiersResponse;
  v3 = [(PKWebServiceResponse *)&v24 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = (PKPaymentPushProvisioningSharingIdentifiersResponse *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = [v5 PKArrayForKey:@"availableSharedCredentials"];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = [[PKPaymentPushProvisioningCredential alloc] initWithDict:*(void *)(*((void *)&v20 + 1) + 8 * v11)];
            [(PKPaymentPushProvisioningSharingIdentifiersResponse *)v6 safelyAddObject:v12];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
        }
        while (v9);
      }
      uint64_t v13 = [(PKPaymentPushProvisioningSharingIdentifiersResponse *)v6 copy];
      sharedCredentials = v4->_sharedCredentials;
      v4->_sharedCredentials = (NSArray *)v13;
    }
    else
    {
      v7 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        v17 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v26 = v16;
        __int16 v27 = 2112;
        v28 = v17;
        id v18 = v17;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v6 = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (NSArray)sharedCredentials
{
  return self->_sharedCredentials;
}

- (void).cxx_destruct
{
}

@end