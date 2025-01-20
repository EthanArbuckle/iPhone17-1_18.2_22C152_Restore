@interface PKAccountWebServiceStatementsResponse
- (NSArray)statements;
- (PKAccountWebServiceStatementsResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServiceStatementsResponse

- (PKAccountWebServiceStatementsResponse)initWithData:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)PKAccountWebServiceStatementsResponse;
  v3 = [(PKWebServiceResponse *)&v26 initWithData:a3];
  v4 = v3;
  if (!v3)
  {
LABEL_13:
    v15 = v4;
    goto LABEL_17;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v7 = objc_msgSend(v5, "PKArrayForKey:", @"statements", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
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
          v12 = [[PKCreditAccountStatement alloc] initWithDictionary:*(void *)(*((void *)&v22 + 1) + 8 * v11)];
          if (v12) {
            [v6 addObject:v12];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }

    uint64_t v13 = [v6 copy];
    statements = v4->_statements;
    v4->_statements = (NSArray *)v13;

    goto LABEL_13;
  }
  v16 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138543618;
    v29 = v18;
    __int16 v30 = 2114;
    v31 = v20;
    _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v15 = 0;
LABEL_17:

  return v15;
}

- (NSArray)statements
{
  return self->_statements;
}

- (void).cxx_destruct
{
}

@end