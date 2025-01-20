@interface MTURLDeresAction
- (MTURLDeresAction)initWithField:(id)a3 configDictionary:(id)a4;
- (NSDictionary)allowedParams;
- (NSString)scope;
- (id)allowedQueryItemsFromItems:(id)a3;
- (id)performAction:(id)a3 context:(id)a4;
- (void)setAllowedParams:(id)a3;
- (void)setScope:(id)a3;
@end

@implementation MTURLDeresAction

- (MTURLDeresAction)initWithField:(id)a3 configDictionary:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)MTURLDeresAction;
  v7 = [(MTTreatmentAction *)&v24 initWithField:a3 configDictionary:v6];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"scope"];
    [(MTURLDeresAction *)v7 setScope:v8];

    v9 = [v6 objectForKeyedSubscript:@"allowedParams"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
        uint64_t v16 = MEMORY[0x263EFFA78];
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, *(void *)(*((void *)&v20 + 1) + 8 * v17++), (void)v20);
          }
          while (v14 != v17);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v14);
      }

      v18 = (void *)[v11 copy];
      [(MTURLDeresAction *)v7 setAllowedParams:v18];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(MTURLDeresAction *)v7 setAllowedParams:v9];
      }
    }
  }
  return v7;
}

- (id)performAction:(id)a3 context:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)MTURLDeresAction;
  v5 = [(MTTreatmentAction *)&v22 performAction:a3 context:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = 0;
    goto LABEL_11;
  }
  id v6 = [MEMORY[0x263F08BA0] componentsWithString:v5];
  v7 = [(MTURLDeresAction *)self scope];
  int v8 = [v7 isEqualToString:@"hostname"];

  if (!v8)
  {
    [v6 setPassword:0];
    [v6 setUser:0];
    v11 = [(MTURLDeresAction *)self scope];
    if ([v11 isEqualToString:@"urlWithoutParams"])
    {
    }
    else
    {
      id v12 = [(MTURLDeresAction *)self scope];
      int v13 = [v12 isEqualToString:@"fullWithoutParams"];

      if (!v13)
      {
        uint64_t v17 = [(MTURLDeresAction *)self scope];
        if ([v17 isEqualToString:@"urlWithoutPath"])
        {
        }
        else
        {
          v18 = [(MTURLDeresAction *)self scope];
          int v19 = [v18 isEqualToString:@"fullWithoutPath"];

          if (!v19) {
            goto LABEL_9;
          }
        }
        [v6 setFragment:0];
        long long v20 = [v6 queryItems];
        long long v21 = [(MTURLDeresAction *)self allowedQueryItemsFromItems:v20];
        [v6 setQueryItems:v21];

        [v6 setPath:0];
        goto LABEL_9;
      }
    }
    [v6 setFragment:0];
    uint64_t v14 = [v6 queryItems];
    uint64_t v15 = [(MTURLDeresAction *)self allowedQueryItemsFromItems:v14];
    [v6 setQueryItems:v15];

LABEL_9:
    uint64_t v9 = [v6 string];
    goto LABEL_10;
  }
  uint64_t v9 = [v6 host];
LABEL_10:
  id v10 = (void *)v9;

LABEL_11:

  return v10;
}

- (id)allowedQueryItemsFromItems:(id)a3
{
  id v4 = a3;
  v5 = [(MTURLDeresAction *)self allowedParams];
  if ([v5 count])
  {
    uint64_t v6 = [v4 count];

    if (v6)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __47__MTURLDeresAction_allowedQueryItemsFromItems___block_invoke;
      v12[3] = &unk_264310198;
      v12[4] = self;
      v7 = [MEMORY[0x263F08A98] predicateWithBlock:v12];
      int v8 = [v4 filteredArrayUsingPredicate:v7];

      if ([v8 count]) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      id v10 = v9;

      id v4 = v8;
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

uint64_t __47__MTURLDeresAction_allowedQueryItemsFromItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) allowedParams];
  v5 = [v3 name];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = [v6 objectForKeyedSubscript:@"allowedValues"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [v3 value];
      uint64_t v9 = [v7 containsObject:v8];
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (NSString)scope
{
  return self->_scope;
}

- (void)setScope:(id)a3
{
}

- (NSDictionary)allowedParams
{
  return self->_allowedParams;
}

- (void)setAllowedParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedParams, 0);

  objc_storeStrong((id *)&self->_scope, 0);
}

@end