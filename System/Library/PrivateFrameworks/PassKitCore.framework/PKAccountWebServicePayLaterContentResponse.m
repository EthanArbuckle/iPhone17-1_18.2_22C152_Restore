@interface PKAccountWebServicePayLaterContentResponse
- (NSArray)reportIssueTopics;
- (PKAccountWebServicePayLaterContentResponse)initWithData:(id)a3;
- (PKPayLaterDynamicContent)dynamicContent;
@end

@implementation PKAccountWebServicePayLaterContentResponse

- (PKAccountWebServicePayLaterContentResponse)initWithData:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)PKAccountWebServicePayLaterContentResponse;
  v3 = [(PKWebServiceResponse *)&v32 initWithData:a3];
  v4 = v3;
  if (!v3)
  {
LABEL_21:
    v26 = v4;
    goto LABEL_22;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 objectForKey:@"dynamicContent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PKPayLaterDynamicContent alloc] initWithDictionary:v6];
      dynamicContent = v4->_dynamicContent;
      v4->_dynamicContent = v7;
    }
    v9 = [v5 PKArrayContaining:objc_opt_class() forKey:@"reportIssueTopics"];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v17 = [PKPayLaterBusinessChatTopic alloc];
          v18 = -[PKPayLaterBusinessChatTopic initWithDictionary:](v17, "initWithDictionary:", v16, (void)v28);
          [v10 safelyAddObject:v18];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v13);
    }

    uint64_t v19 = [v10 count];
    if (v19) {
      v20 = (void *)[v10 copy];
    }
    else {
      v20 = 0;
    }
    objc_storeStrong((id *)&v4->_reportIssueTopics, v20);
    if (v19) {

    }
    goto LABEL_21;
  }
  v21 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    *(_DWORD *)buf = 138543618;
    v35 = v23;
    __int16 v36 = 2114;
    v37 = v25;
    _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v26 = 0;
LABEL_22:

  return v26;
}

- (PKPayLaterDynamicContent)dynamicContent
{
  return self->_dynamicContent;
}

- (NSArray)reportIssueTopics
{
  return self->_reportIssueTopics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportIssueTopics, 0);
  objc_storeStrong((id *)&self->_dynamicContent, 0);
}

@end