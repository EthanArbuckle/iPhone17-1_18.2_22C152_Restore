@interface PDSUserTracker
+ (id)standardAccountStore;
- (BOOL)validUser:(id)a3 withError:(id *)a4;
- (PDSUserTracker)init;
- (PDSUserTracker)initWithAccountStoreBlock:(id)a3;
- (id)_accountForUser:(id)a3 withError:(id *)a4;
- (id)accountStoreBlock;
- (id)tokenAndIdentifier:(id *)a3 forUser:(id)a4 withError:(id *)a5;
- (void)refreshCredentialsForUser:(id)a3 withError:(id *)a4 completion:(id)a5;
- (void)setAccountStoreBlock:(id)a3;
@end

@implementation PDSUserTracker

+ (id)standardAccountStore
{
  id v2 = objc_alloc_init(MEMORY[0x263EFB210]);
  return v2;
}

- (PDSUserTracker)init
{
  return [(PDSUserTracker *)self initWithAccountStoreBlock:&__block_literal_global_0];
}

id __22__PDSUserTracker_init__block_invoke()
{
  return +[PDSUserTracker standardAccountStore];
}

- (PDSUserTracker)initWithAccountStoreBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PDSUserTracker.m", 32, @"Invalid parameter not satisfying: %@", @"accountStoreBlock" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PDSUserTracker;
  v6 = [(PDSUserTracker *)&v11 init];
  if (v6)
  {
    uint64_t v7 = MEMORY[0x223C8A560](v5);
    id accountStoreBlock = v6->_accountStoreBlock;
    v6->_id accountStoreBlock = (id)v7;
  }
  return v6;
}

- (BOOL)validUser:(id)a3 withError:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PDSUserTracker.m", 43, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];
  }
  if ([v7 userType] == 1
    && ([v7 userID],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 length],
        v8,
        v9))
  {
    v10 = (*((void (**)(void))self->_accountStoreBlock + 2))();
    objc_super v11 = v10;
    if (v10)
    {
      uint64_t v12 = *MEMORY[0x263EFAE58];
      id v34 = 0;
      v13 = [v10 accountTypeWithAccountTypeIdentifier:v12 error:&v34];
      id v14 = v34;
      v15 = v14;
      if (v13)
      {
        id v27 = v14;
        v16 = [v7 userID];
        v28 = v13;
        v29 = v11;
        [v11 accountsWithAccountType:v13];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v31;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v31 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = [*(id *)(*((void *)&v30 + 1) + 8 * i) accountProperties];
              v23 = [v22 objectForKeyedSubscript:@"personID"];

              LODWORD(v22) = [v16 isEqualToString:v23];
              if (v22)
              {

                BOOL v24 = 1;
                goto LABEL_23;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        if (a4)
        {
          [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA28] code:-102 userInfo:0];
          BOOL v24 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v24 = 0;
        }
LABEL_23:
        v13 = v28;
        objc_super v11 = v29;
        v15 = v27;
      }
      else
      {
        BOOL v24 = 0;
        if (a4) {
          *a4 = v14;
        }
      }
    }
    else if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA28] code:-101 userInfo:0];
      BOOL v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA28] code:-100 userInfo:0];
    BOOL v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (id)tokenAndIdentifier:(id *)a3 forUser:(id)a4 withError:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v9 = a4;
  if (!v9)
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PDSUserTracker.m", 74, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];
  }
  if ([v9 userType] == 1
    && ([v9 userID],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 length],
        v10,
        v11))
  {
    uint64_t v12 = (*((void (**)(void))self->_accountStoreBlock + 2))();
    v13 = v12;
    if (v12)
    {
      uint64_t v14 = *MEMORY[0x263EFAE68];
      id v37 = 0;
      v15 = [v12 accountTypeWithAccountTypeIdentifier:v14 error:&v37];
      id v16 = v37;
      id v17 = v16;
      if (v15)
      {
        long long v30 = a3;
        id v31 = v16;
        uint64_t v18 = [v9 userID];
        long long v32 = v15;
        [v13 accountsWithAccountType:v15];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v34;
LABEL_9:
          uint64_t v23 = 0;
          while (1)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v19);
            }
            BOOL v24 = *(void **)(*((void *)&v33 + 1) + 8 * v23);
            v25 = objc_msgSend(v24, "aida_dsid");
            if ([v18 isEqualToString:v25]) {
              break;
            }

            if (v21 == ++v23)
            {
              uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v38 count:16];
              if (v21) {
                goto LABEL_9;
              }
              goto LABEL_15;
            }
          }
          id v27 = v24;

          if (!v27) {
            goto LABEL_25;
          }
          v26 = objc_msgSend(v27, "aida_tokenWithExpiryCheckForService:", @"com.apple.gs.global.auth");
          if (v30)
          {
            objc_msgSend(v27, "aida_alternateDSID");
            *long long v30 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
LABEL_15:

LABEL_25:
          if (a5)
          {
            [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA28] code:-102 userInfo:0];
            v26 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v26 = 0;
          }
        }
        id v17 = v31;
        v15 = v32;
      }
      else
      {
        v26 = 0;
        if (a5) {
          *a5 = v16;
        }
      }
    }
    else if (a5)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA28] code:-101 userInfo:0];
      v26 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
  }
  else if (a5)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA28] code:-100 userInfo:0];
    v26 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)refreshCredentialsForUser:(id)a3 withError:(id *)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  id v9 = (*((void (**)(void))self->_accountStoreBlock + 2))();
  if (v9)
  {
    v10 = [(PDSUserTracker *)self _accountForUser:v11 withError:a4];
    if (v10)
    {
      objc_msgSend(v9, "aida_renewCredentialsForAccount:services:completion:", v10, &unk_26D3D4458, v8);
    }
    else if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA28] code:-102 userInfo:0];
    }
  }
  else if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA28] code:-101 userInfo:0];
  }
}

- (id)_accountForUser:(id)a3 withError:(id *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PDSUserTracker.m", 132, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];
  }
  if ([v7 userType] == 1
    && ([v7 userID],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 length],
        v8,
        v9))
  {
    v10 = (*((void (**)(void))self->_accountStoreBlock + 2))();
    id v11 = v10;
    if (v10)
    {
      uint64_t v12 = *MEMORY[0x263EFAE68];
      id v33 = 0;
      v13 = [v10 accountTypeWithAccountTypeIdentifier:v12 error:&v33];
      id v14 = v33;
      v15 = v14;
      if (v13)
      {
        id v27 = v14;
        id v16 = [v7 userID];
        v28 = v13;
        [v11 accountsWithAccountType:v13];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v30;
LABEL_9:
          uint64_t v21 = 0;
          while (1)
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void **)(*((void *)&v29 + 1) + 8 * v21);
            uint64_t v23 = objc_msgSend(v22, "aida_dsid");
            if ([v16 isEqualToString:v23]) {
              break;
            }

            if (v19 == ++v21)
            {
              uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v34 count:16];
              if (v19) {
                goto LABEL_9;
              }
              goto LABEL_15;
            }
          }
          id v24 = v22;

          v15 = v27;
          v13 = v28;
          if (v24) {
            goto LABEL_28;
          }
        }
        else
        {
LABEL_15:

          v15 = v27;
          v13 = v28;
        }
        if (a4)
        {
          [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA28] code:-102 userInfo:0];
          id v24 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v24 = 0;
        }
LABEL_28:
      }
      else
      {
        id v24 = 0;
        if (a4) {
          *a4 = v14;
        }
      }
    }
    else if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA28] code:-101 userInfo:0];
      id v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v24 = 0;
    }
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F5BA28] code:-100 userInfo:0];
    id v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)accountStoreBlock
{
  return self->_accountStoreBlock;
}

- (void)setAccountStoreBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end