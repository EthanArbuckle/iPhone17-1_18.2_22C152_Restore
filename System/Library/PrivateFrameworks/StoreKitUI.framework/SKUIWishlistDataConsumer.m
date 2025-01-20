@interface SKUIWishlistDataConsumer
- (id)_errorWithData:(id)a3 MIMEType:(id)a4;
- (id)_itemsWithJSONData:(id)a3 error:(id *)a4;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SKUIWishlistDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIWishlistDataConsumer objectForData:response:error:]();
  }
  v10 = [v9 MIMEType];
  if ([v10 rangeOfString:@"application/json" options:1] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = [(SKUIWishlistDataConsumer *)self _errorWithData:v8 MIMEType:v10];
    v12 = 0;
    if (!a5) {
      goto LABEL_11;
    }
  }
  else
  {
    id v14 = 0;
    v12 = [(SKUIWishlistDataConsumer *)self _itemsWithJSONData:v8 error:&v14];
    id v11 = v14;
    if (!a5) {
      goto LABEL_11;
    }
  }
  if (!v12) {
    *a5 = v11;
  }
LABEL_11:

  return v12;
}

- (id)_errorWithData:(id)a3 MIMEType:(id)a4
{
  id v5 = a3;
  if ([a4 rangeOfString:@"xml" options:1] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_10;
  }
  v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_10:
    v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FA89B8] code:0 userInfo:0];
    goto LABEL_11;
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4FA8148]) initWithResponseDictionary:v6];
  id v8 = [v7 actionsWithActionType:*MEMORY[0x1E4FA8900]];
  if ([v8 count] == 1)
  {
    id v9 = [v8 objectAtIndex:0];
    v10 = [v9 dialog];
    id v11 = [v10 dialogKind];
    int v12 = [v11 isEqualToString:*MEMORY[0x1E4FA8408]];

    v13 = 0;
    if (v12)
    {
      v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FA89B8] code:1 userInfo:0];
    }
  }
  else
  {
    v13 = 0;
  }

  if (!v13) {
    goto LABEL_10;
  }
LABEL_11:

  return v13;
}

- (id)_itemsWithJSONData:(id)a3 error:(id *)a4
{
  id v18 = 0;
  id v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v18];
  id v6 = v18;
  objc_opt_class();
  id v7 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v5 objectForKey:@"storePlatformData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = objc_opt_class();
      v10 = SKUIStorePageItemsWithStorePlatformDictionary(v8, 0, v9);
    }
    else
    {
      v10 = 0;
    }
    id v11 = [v5 objectForKey:@"content"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __53__SKUIWishlistDataConsumer__itemsWithJSONData_error___block_invoke;
      v15[3] = &unk_1E642A0C0;
      id v16 = v10;
      id v7 = v12;
      id v17 = v7;
      [v11 enumerateKeysAndObjectsUsingBlock:v15];
    }
    else
    {
      id v7 = 0;
    }
  }
  if (a4 && !v7) {
    *a4 = v6;
  }
  id v13 = v7;

  return v13;
}

void __53__SKUIWishlistDataConsumer__itemsWithJSONData_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 objectForKey:@"adamIds"];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = [*(id *)(a1 + 32) objectForKey:v10];
            if (v11) {
              [*(id *)(a1 + 40) addObject:v11];
            }
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)objectForData:response:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIWishlistDataConsumer objectForData:response:error:]";
}

@end