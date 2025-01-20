@interface SUUIWishlistDataConsumer
- (id)_errorWithData:(id)a3 MIMEType:(id)a4;
- (id)_itemsWithJSONData:(id)a3 error:(id *)a4;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SUUIWishlistDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [a4 MIMEType];
  if ([v9 rangeOfString:@"application/json" options:1] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = [(SUUIWishlistDataConsumer *)self _errorWithData:v8 MIMEType:v9];

    v11 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    id v13 = 0;
    v11 = [(SUUIWishlistDataConsumer *)self _itemsWithJSONData:v8 error:&v13];

    id v10 = v13;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if (!v11) {
    *a5 = v10;
  }
LABEL_7:

  return v11;
}

- (id)_errorWithData:(id)a3 MIMEType:(id)a4
{
  id v5 = a3;
  if ([a4 rangeOfString:@"xml" options:1] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_10;
  }
  v6 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:0 format:0 error:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_10:
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F7BD38] code:0 userInfo:0];
    goto LABEL_11;
  }
  v7 = (void *)[objc_alloc(MEMORY[0x263F7B150]) initWithResponseDictionary:v6];
  id v8 = [v7 actionsWithActionType:*MEMORY[0x263F7BC48]];
  if ([v8 count] == 1)
  {
    v9 = [v8 objectAtIndex:0];
    id v10 = [v9 dialog];
    v11 = [v10 dialogKind];
    int v12 = [v11 isEqualToString:*MEMORY[0x263F7B508]];

    id v13 = 0;
    if (v12)
    {
      id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F7BD38] code:1 userInfo:0];
    }
  }
  else
  {
    id v13 = 0;
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
  id v5 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v18];
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
      id v10 = SUUIStorePageItemsWithStorePlatformDictionary(v8, 0, v9);
    }
    else
    {
      id v10 = 0;
    }
    v11 = [v5 objectForKey:@"content"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __53__SUUIWishlistDataConsumer__itemsWithJSONData_error___block_invoke;
      v15[3] = &unk_265402258;
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

void __53__SUUIWishlistDataConsumer__itemsWithJSONData_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
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
            v11 = [*(id *)(a1 + 32) objectForKey:v10];
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

@end