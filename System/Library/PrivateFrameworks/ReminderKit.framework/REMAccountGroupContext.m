@interface REMAccountGroupContext
- (REMAccount)account;
- (REMAccountGroupContext)initWithAccount:(id)a3;
- (id)fetchGroupsWithError:(id *)a3;
- (void)setAccount:(id)a3;
@end

@implementation REMAccountGroupContext

- (REMAccountGroupContext)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAccountGroupContext;
  v6 = [(REMAccountGroupContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)fetchGroupsWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = [(REMAccountGroupContext *)self account];
  id v5 = [v4 fetchListsWithError:a3];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v12, "isGroup", (void)v14)) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (REMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end