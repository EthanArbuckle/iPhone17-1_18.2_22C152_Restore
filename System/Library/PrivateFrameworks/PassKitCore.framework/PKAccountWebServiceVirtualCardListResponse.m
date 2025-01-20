@interface PKAccountWebServiceVirtualCardListResponse
- (NSArray)virtualCards;
- (PKAccountWebServiceVirtualCardListResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServiceVirtualCardListResponse

- (PKAccountWebServiceVirtualCardListResponse)initWithData:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)PKAccountWebServiceVirtualCardListResponse;
  v3 = [(PKWebServiceResponse *)&v23 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = [MEMORY[0x1E4F1CA48] array];
      v8 = [v6 PKArrayForKey:@"virtualCards"];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v28 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = [[PKVirtualCard alloc] initWithDictionary:*(void *)(*((void *)&v19 + 1) + 8 * v12)];
            [v7 addObject:v13];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v28 count:16];
        }
        while (v10);
      }
      uint64_t v14 = [v7 copy];
      virtualCards = v4->_virtualCards;
      v4->_virtualCards = (NSArray *)v14;
    }
    else
    {
      v6 = PKLogFacilityTypeGetObject(0xEuLL);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        return v4;
      }
      v16 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v16);
      v17 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138543618;
      v25 = v7;
      __int16 v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
    }

    goto LABEL_14;
  }
  return v4;
}

- (NSArray)virtualCards
{
  return self->_virtualCards;
}

- (void).cxx_destruct
{
}

@end