@interface PKAccountWebServiceBalanceHistoryResponse
- (NSArray)balances;
- (PKAccountWebServiceBalanceHistoryResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServiceBalanceHistoryResponse

- (PKAccountWebServiceBalanceHistoryResponse)initWithData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)PKAccountWebServiceBalanceHistoryResponse;
  v3 = [(PKWebServiceResponse *)&v26 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v20 = v5;
      id v6 = v5;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v23 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v12 = [v11 PKDecimalNumberFromStringForKey:@"balance"];
              uint64_t v13 = [v11 PKDateForKey:@"date"];
              v14 = (void *)v13;
              if (v12) {
                BOOL v15 = v13 == 0;
              }
              else {
                BOOL v15 = 1;
              }
              if (!v15)
              {
                v16 = [[PKAccountHistoricalBalance alloc] initWithBalance:v12 date:v13];
                [v21 addObject:v16];
              }
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v8);
      }
      uint64_t v17 = [v21 copy];
      balances = v4->_balances;
      v4->_balances = (NSArray *)v17;

      v5 = v20;
    }
  }
  return v4;
}

- (NSArray)balances
{
  return self->_balances;
}

- (void).cxx_destruct
{
}

@end