@interface ICMediaAPIURLMappingSet
- (ICMediaAPIURLMappingSet)initWithResponsePayload:(id)a3;
- (NSArray)responsePayload;
- (id)mappingsForFeatureName:(id)a3;
- (void)enumerateMappingsUsingBlock:(id)a3;
@end

@implementation ICMediaAPIURLMappingSet

- (void).cxx_destruct
{
}

- (id)mappingsForFeatureName:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = self->_responsePayload;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (_NSIsNSDictionary())
        {
          v12 = [ICMediaAPIURLMapping alloc];
          v13 = -[ICMediaAPIURLMapping initWithResponseDictionary:](v12, "initWithResponseDictionary:", v11, (void)v18);
          id v14 = [(ICMediaAPIURLMapping *)v13 featureName];
          if (v14 == v4)
          {
          }
          else
          {
            v15 = v14;
            int v16 = [v4 isEqual:v14];

            if (!v16) {
              goto LABEL_12;
            }
          }
          [v5 addObject:v13];
LABEL_12:

          continue;
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)enumerateMappingsUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_responsePayload;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        if (_NSIsNSDictionary())
        {
          uint64_t v11 = [ICMediaAPIURLMapping alloc];
          v12 = -[ICMediaAPIURLMapping initWithResponseDictionary:](v11, "initWithResponseDictionary:", v10, (void)v13);
          v4[2](v4, v12);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (NSArray)responsePayload
{
  return self->_responsePayload;
}

- (ICMediaAPIURLMappingSet)initWithResponsePayload:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICMediaAPIURLMappingSet;
  v5 = [(ICMediaAPIURLMappingSet *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    responsePayload = v5->_responsePayload;
    v5->_responsePayload = (NSArray *)v6;
  }
  return v5;
}

@end