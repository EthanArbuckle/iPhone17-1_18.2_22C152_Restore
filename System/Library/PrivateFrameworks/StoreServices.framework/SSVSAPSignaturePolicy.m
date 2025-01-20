@interface SSVSAPSignaturePolicy
- (NSArray)signatureComponents;
- (SSVSAPSignaturePolicy)initWithPolicyType:(int64_t)a3;
- (SSVSAPSignaturePolicy)initWithPolicyType:(int64_t)a3 signatureComponents:(id)a4;
- (SSVSAPSignaturePolicy)initWithSignedActionsDictionary:(id)a3;
- (id)_dataToSignWithDataSource:(id)a3;
- (id)dataToSignWithRequestProperties:(id)a3;
- (id)dataToSignWithURLRequest:(id)a3;
- (id)dataToSignWithURLResponse:(id)a3 responseData:(id)a4;
- (int64_t)policyType;
@end

@implementation SSVSAPSignaturePolicy

- (SSVSAPSignaturePolicy)initWithPolicyType:(int64_t)a3
{
  return [(SSVSAPSignaturePolicy *)self initWithPolicyType:a3 signatureComponents:0];
}

- (SSVSAPSignaturePolicy)initWithPolicyType:(int64_t)a3 signatureComponents:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SSVSAPSignaturePolicy;
  v7 = [(SSVSAPSignaturePolicy *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_policyType = a3;
    uint64_t v9 = [v6 copy];
    signatureComponents = v8->_signatureComponents;
    v8->_signatureComponents = (NSArray *)v9;
  }
  return v8;
}

- (SSVSAPSignaturePolicy)initWithSignedActionsDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [v4 objectForKey:@"headers"];
  objc_opt_class();
  v25 = v6;
  if (objc_opt_isKindOfClass())
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v13 = [[SSVSAPSignatureComponent alloc] initWithComponentType:1 key:v12];
            [v5 addObject:v13];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v9);
    }

    id v6 = v25;
  }
  v14 = [v4 objectForKey:@"fields"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = self;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * v19);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v21 = [[SSVSAPSignatureComponent alloc] initWithComponentType:2 key:v20];
            [v5 addObject:v21];
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v17);
    }

    self = v24;
    id v6 = v25;
  }
  if (objc_msgSend(v5, "count", v24))
  {
    v22 = [(SSVSAPSignaturePolicy *)self initWithPolicyType:2 signatureComponents:v5];
  }
  else
  {

    v22 = 0;
  }

  return v22;
}

- (id)dataToSignWithRequestProperties:(id)a3
{
  id v4 = a3;
  id v5 = [[SSVSAPSignatureDataSource alloc] initWithURLRequestProperties:v4];

  id v6 = [(SSVSAPSignaturePolicy *)self _dataToSignWithDataSource:v5];

  return v6;
}

- (id)dataToSignWithURLRequest:(id)a3
{
  id v4 = a3;
  id v5 = [[SSVSAPSignatureDataSource alloc] initWithURLRequest:v4];

  id v6 = [(SSVSAPSignaturePolicy *)self _dataToSignWithDataSource:v5];

  return v6;
}

- (id)dataToSignWithURLResponse:(id)a3 responseData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[SSVSAPSignatureDataSource alloc] initWithURLResponse:v7 bodyData:v6];

  uint64_t v9 = [(SSVSAPSignaturePolicy *)self _dataToSignWithDataSource:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = (id)[v9 mutableCopy];
  }
  uint64_t v11 = v10;

  return v11;
}

- (id)_dataToSignWithDataSource:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 HTTPMethod];
  int v6 = [v5 isEqualToString:@"POST"];

  if (v6)
  {
    id v7 = [v4 HTTPBody];
  }
  else if (self->_policyType == 2)
  {
    if ([(NSArray *)self->_signatureComponents count] == 1)
    {
      uint64_t v8 = [(NSArray *)self->_signatureComponents firstObject];
      id v7 = [(NSArray *)v8 _dataToSignWithDataSource:v4];
    }
    else
    {
      id v7 = [MEMORY[0x1E4F1CA58] data];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v8 = self->_signatureComponents;
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "_dataToSignWithDataSource:", v4, (void)v15);
            if (v13) {
              [v7 appendData:v13];
            }
          }
          uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (int64_t)policyType
{
  return self->_policyType;
}

- (NSArray)signatureComponents
{
  return self->_signatureComponents;
}

- (void).cxx_destruct
{
}

@end