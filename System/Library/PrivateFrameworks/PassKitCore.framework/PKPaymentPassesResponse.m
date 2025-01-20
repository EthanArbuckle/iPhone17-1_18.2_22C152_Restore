@interface PKPaymentPassesResponse
- (NSArray)devicePassSerialNumbers;
- (NSArray)passURLs;
- (NSString)lastUpdatedTag;
- (PKPaymentPassesResponse)initWithData:(id)a3;
- (void)setDevicePassSerialNumbers:(id)a3;
- (void)setLastUpdatedTag:(id)a3;
- (void)setPassURLs:(id)a3;
@end

@implementation PKPaymentPassesResponse

- (PKPaymentPassesResponse)initWithData:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)PKPaymentPassesResponse;
  v3 = [(PKWebServiceResponse *)&v28 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 objectForKey:@"lastUpdated"];
      lastUpdatedTag = v4->_lastUpdatedTag;
      v4->_lastUpdatedTag = (NSString *)v6;

      v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v9 = [v5 objectForKey:@"passURLs"];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v24 + 1) + 8 * v13)];
            if (v14) {
              [(NSArray *)v8 addObject:v14];
            }

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
        }
        while (v11);
      }
      passURLs = v4->_passURLs;
      v4->_passURLs = v8;
      v16 = v8;

      uint64_t v17 = [v5 objectForKey:@"devicePassSerialNumbers"];
      devicePassSerialNumbers = v4->_devicePassSerialNumbers;
      v4->_devicePassSerialNumbers = (NSArray *)v17;
    }
    else
    {
      v16 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        v21 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v30 = v20;
        __int16 v31 = 2112;
        v32 = v21;
        id v22 = v21;
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v9 = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (NSArray)passURLs
{
  return self->_passURLs;
}

- (void)setPassURLs:(id)a3
{
}

- (NSString)lastUpdatedTag
{
  return self->_lastUpdatedTag;
}

- (void)setLastUpdatedTag:(id)a3
{
}

- (NSArray)devicePassSerialNumbers
{
  return self->_devicePassSerialNumbers;
}

- (void)setDevicePassSerialNumbers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicePassSerialNumbers, 0);
  objc_storeStrong((id *)&self->_lastUpdatedTag, 0);
  objc_storeStrong((id *)&self->_passURLs, 0);
}

@end