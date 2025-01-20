@interface PKRetrieveMerchantTokensResponse
- (NSArray)merchantTokens;
- (NSNumber)pageNumber;
- (NSNumber)pageSize;
- (NSNumber)totalMerchantTokens;
- (NSNumber)totalPages;
- (PKRetrieveMerchantTokensResponse)initWithData:(id)a3;
- (PKRetrieveMerchantTokensResponse)initWithMerchantTokens:(id)a3 totalMerchantTokens:(id)a4 pageSize:(id)a5 totalPages:(id)a6 pageNumber:(id)a7;
@end

@implementation PKRetrieveMerchantTokensResponse

- (PKRetrieveMerchantTokensResponse)initWithData:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)PKRetrieveMerchantTokensResponse;
  v3 = [(PKWebServiceResponse *)&v35 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 PKArrayContaining:objc_opt_class() forKey:@"merchantTokens"];
      v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v8 = v6;
      uint64_t v9 = [(PKRetrieveMerchantTokensResponse *)v8 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v32;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v32 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * v12);
            v14 = [PKMerchantToken alloc];
            v15 = -[PKMerchantToken initWithDictionary:](v14, "initWithDictionary:", v13, (void)v31);
            if (v15) {
              [v7 addObject:v15];
            }

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [(PKRetrieveMerchantTokensResponse *)v8 countByEnumeratingWithState:&v31 objects:v40 count:16];
        }
        while (v10);
      }

      uint64_t v16 = [v7 copy];
      merchantTokens = v4->_merchantTokens;
      v4->_merchantTokens = (NSArray *)v16;

      uint64_t v18 = [v5 PKNumberForKey:@"totalMerchantTokens"];
      totalMerchantTokens = v4->_totalMerchantTokens;
      v4->_totalMerchantTokens = (NSNumber *)v18;

      uint64_t v20 = [v5 PKNumberForKey:@"pageSize"];
      pageSize = v4->_pageSize;
      v4->_pageSize = (NSNumber *)v20;

      uint64_t v22 = [v5 PKNumberForKey:@"totalPages"];
      totalPages = v4->_totalPages;
      v4->_totalPages = (NSNumber *)v22;

      uint64_t v24 = [v5 PKNumberForKey:@"pageNumber"];
      pageNumber = v4->_pageNumber;
      v4->_pageNumber = (NSNumber *)v24;
    }
    else
    {
      v7 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v26);
        v28 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v37 = v27;
        __int16 v38 = 2112;
        v39 = v28;
        id v29 = v28;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v8 = v4;
      v4 = 0;
    }
  }
  return v4;
}

- (PKRetrieveMerchantTokensResponse)initWithMerchantTokens:(id)a3 totalMerchantTokens:(id)a4 pageSize:(id)a5 totalPages:(id)a6 pageNumber:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PKRetrieveMerchantTokensResponse;
  v17 = [(PKRetrieveMerchantTokensResponse *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    merchantTokens = v17->_merchantTokens;
    v17->_merchantTokens = (NSArray *)v18;

    uint64_t v20 = [v13 copy];
    totalMerchantTokens = v17->_totalMerchantTokens;
    v17->_totalMerchantTokens = (NSNumber *)v20;

    uint64_t v22 = [v14 copy];
    pageSize = v17->_pageSize;
    v17->_pageSize = (NSNumber *)v22;

    uint64_t v24 = [v15 copy];
    totalPages = v17->_totalPages;
    v17->_totalPages = (NSNumber *)v24;

    uint64_t v26 = [v16 copy];
    pageNumber = v17->_pageNumber;
    v17->_pageNumber = (NSNumber *)v26;
  }
  return v17;
}

- (NSArray)merchantTokens
{
  return self->_merchantTokens;
}

- (NSNumber)totalMerchantTokens
{
  return self->_totalMerchantTokens;
}

- (NSNumber)pageSize
{
  return self->_pageSize;
}

- (NSNumber)totalPages
{
  return self->_totalPages;
}

- (NSNumber)pageNumber
{
  return self->_pageNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageNumber, 0);
  objc_storeStrong((id *)&self->_totalPages, 0);
  objc_storeStrong((id *)&self->_pageSize, 0);
  objc_storeStrong((id *)&self->_totalMerchantTokens, 0);
  objc_storeStrong((id *)&self->_merchantTokens, 0);
}

@end