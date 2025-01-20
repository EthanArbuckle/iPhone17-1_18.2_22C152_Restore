@interface WLKSiriSearchResponse
- (NSArray)items;
- (NSDictionary)dictionary;
- (WLKSiriSearchResponse)init;
- (WLKSiriSearchResponse)initWithDictionary:(id)a3;
@end

@implementation WLKSiriSearchResponse

- (WLKSiriSearchResponse)initWithDictionary:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WLKSiriSearchResponse;
  v6 = [(WLKSiriSearchResponse *)&v32 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9 = objc_msgSend(v5, "wlk_dictionaryForKey:", @"data");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_28:

      goto LABEL_29;
    }
    v10 = objc_msgSend(v9, "wlk_dictionaryForKey:", @"pagedList");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_27:

      goto LABEL_28;
    }
    v11 = objc_msgSend(v10, "wlk_arrayForKey:", @"items");
    if ([v11 count] == 1)
    {
      id v12 = [v11 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = objc_msgSend(v12, "wlk_dictionaryForKey:", @"content");
        v14 = [WLKBasicContentMetadata alloc];
        if (v13) {
          id v15 = v13;
        }
        else {
          id v15 = v12;
        }
        v22 = [(WLKBasicContentMetadata *)v14 initWithDictionary:v15];
        if (v22) {
          [v8 addObject:v22];
        }
      }
    }
    else
    {
      if ((unint64_t)[v11 count] < 2)
      {
LABEL_26:
        uint64_t v23 = [v8 copy];
        items = v7->_items;
        v7->_items = (NSArray *)v23;

        goto LABEL_27;
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v12 = v11;
      uint64_t v16 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        v26 = v11;
        v27 = v9;
        uint64_t v18 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v12);
            }
            uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = [[WLKBasicContentMetadata alloc] initWithDictionary:v20];
              if (v21) {
                [v8 addObject:v21];
              }
            }
          }
          uint64_t v17 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v17);
        v9 = v27;
        v11 = v26;
      }
    }

    goto LABEL_26;
  }
LABEL_29:

  return v7;
}

- (WLKSiriSearchResponse)init
{
  return 0;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end