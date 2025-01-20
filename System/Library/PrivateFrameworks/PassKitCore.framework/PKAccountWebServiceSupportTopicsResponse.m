@interface PKAccountWebServiceSupportTopicsResponse
- (NSArray)topics;
- (PKAccountWebServiceSupportTopicsResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServiceSupportTopicsResponse

- (PKAccountWebServiceSupportTopicsResponse)initWithData:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)PKAccountWebServiceSupportTopicsResponse;
  v3 = [(PKWebServiceResponse *)&v23 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 PKArrayForKey:@"topics"];
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
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
            uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [PKAccountSupportTopic alloc];
              v15 = -[PKAccountSupportTopic initWithDictionary:](v14, "initWithDictionary:", v13, (void)v19);
              if (v15) {
                [v7 addObject:v15];
              }
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v10);
      }

      uint64_t v16 = [v7 copy];
      topics = v4->_topics;
      v4->_topics = (NSArray *)v16;
    }
  }
  return v4;
}

- (NSArray)topics
{
  return self->_topics;
}

- (void).cxx_destruct
{
}

@end