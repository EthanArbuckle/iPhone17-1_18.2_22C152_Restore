@interface SKUICompletionList
- (NSArray)completions;
- (NSMutableDictionary)cacheRepresentation;
- (NSString)title;
- (SKUICompletionList)initWithCacheRepresentation:(id)a3;
- (SKUICompletionList)initWithCompletionListDictionary:(id)a3;
@end

@implementation SKUICompletionList

- (SKUICompletionList)initWithCompletionListDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICompletionList initWithCompletionListDictionary:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)SKUICompletionList;
  v13 = [(SKUICompletionList *)&v31 init];
  if (v13)
  {
    v14 = [v4 objectForKey:@"item"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v13->_title, v14);
    }
    v15 = [v4 objectForKey:@"hints"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v26 = v4;
      v16 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v28;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * v21);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = [[SKUICompletion alloc] initWithCompletionDictionary:v22];
              [(NSArray *)v16 addObject:v23];
            }
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v19);
      }

      completions = v13->_completions;
      v13->_completions = v16;

      id v4 = v26;
    }
  }
  return v13;
}

- (SKUICompletionList)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICompletionList initWithCacheRepresentation:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUICompletionList;
  v13 = [(SKUICompletionList *)&v21 init];
  if (v13)
  {
    v14 = [v4 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 copy];
      title = v13->_title;
      v13->_title = (NSString *)v15;
    }
    self = [v4 objectForKey:@"completions"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = SKUICacheCodingDecodeArray(self, v17);
      completions = v13->_completions;
      v13->_completions = (NSArray *)v18;
    }
    goto LABEL_12;
  }
LABEL_13:

  return v13;
}

- (NSMutableDictionary)cacheRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  completions = self->_completions;
  if (completions)
  {
    BOOL v5 = SKUICacheCodingEncodeArray(completions);
    [v3 setObject:v5 forKey:@"completions"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }

  return (NSMutableDictionary *)v3;
}

- (NSArray)completions
{
  return self->_completions;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_completions, 0);
}

- (void)initWithCompletionListDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCacheRepresentation:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end