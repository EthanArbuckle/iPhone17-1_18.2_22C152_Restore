@interface WLMailAccountMigrator
+ (id)contentType;
- (ACAccountStore)accountStore;
- (BOOL)accountBased;
- (BOOL)storeRecordDataInDatabase;
- (BOOL)wantsSegmentedDownloads;
- (WLFeaturePayload)featurePayload;
- (WLMailAccountMigrator)init;
- (id)contentType;
- (id)dataType;
- (id)importDidEnd;
- (id)importWillBegin;
- (void)addWorkingTime:(unint64_t)a3;
- (void)enable;
- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4;
- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6;
- (void)setAccountStore:(id)a3;
- (void)setEstimatedDataSize:(unint64_t)a3;
- (void)setFeaturePayload:(id)a3;
- (void)setState:(id)a3;
@end

@implementation WLMailAccountMigrator

- (WLMailAccountMigrator)init
{
  v36[1] = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)WLMailAccountMigrator;
  v2 = [(WLMailAccountMigrator *)&v32 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFB210] defaultStore];
    [(WLMailAccountMigrator *)v2 setAccountStore:v3];

    accountStore = v2->_accountStore;
    if (accountStore)
    {
      v35 = @"com.google";
      v5 = [(ACAccountStore *)accountStore accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAEE8]];
      v36[0] = v5;
      uint64_t v6 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
      accountTypes = v2->_accountTypes;
      v2->_accountTypes = (NSDictionary *)v6;
    }
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    existingAccounts = v2->_existingAccounts;
    v2->_existingAccounts = v8;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = [(NSDictionary *)v2->_accountTypes allKeys];
    uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v23)
    {
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v12 = [(NSDictionary *)v2->_accountTypes objectForKeyedSubscript:v11];
          id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          v14 = [(ACAccountStore *)v2->_accountStore accountsWithAccountType:v12];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v33 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v25 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = [*(id *)(*((void *)&v24 + 1) + 8 * j) username];
                [v13 addObject:v19];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v33 count:16];
            }
            while (v16);
          }

          [(NSMutableDictionary *)v2->_existingAccounts setObject:v13 forKey:v11];
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v23);
    }
  }
  return v2;
}

- (void)enable
{
  p_featurePayload = &self->_featurePayload;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setEnabled:1];

  id v4 = objc_loadWeakRetained((id *)p_featurePayload);
  [v4 setState:@"enabled"];
}

- (void)setState:(id)a3
{
  p_featurePayload = &self->_featurePayload;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
  [WeakRetained setState:v4];
}

- (void)setEstimatedDataSize:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setSize:a3];
}

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);
}

+ (id)contentType
{
  return @"cloud";
}

- (id)contentType
{
  return +[WLMailAccountMigrator contentType];
}

- (id)dataType
{
  return +[WLMailAccountMigrator contentType];
}

- (BOOL)accountBased
{
  return 1;
}

- (BOOL)storeRecordDataInDatabase
{
  return 1;
}

- (BOOL)wantsSegmentedDownloads
{
  return 0;
}

- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4
{
  id v4 = a3;
  if (![v4 itemSize]) {
    [v4 setItemSize:5120];
  }
}

- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6
{
  v51[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(id, BOOL, id))a6;
  long long v30 = self;
  _WLLog();
  if (self->_accountStore && [(NSDictionary *)self->_accountTypes count])
  {
    id v44 = 0;
    v10 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v44];
    id v11 = v44;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v10;
      id v13 = [v12 objectForKeyedSubscript:@"accountType"];
      v14 = [v12 objectForKeyedSubscript:@"accountName"];
      v38 = v14;
      if ([v13 length] && objc_msgSend(v14, "length"))
      {
        _WLLog();
        uint64_t v15 = -[NSDictionary objectForKeyedSubscript:](self->_accountTypes, "objectForKeyedSubscript:", v13, self, v13, v14);
        if (v15)
        {
          v35 = [(NSMutableDictionary *)self->_existingAccounts objectForKeyedSubscript:v13];
          if ([v35 containsObject:v14])
          {
            _WLLog();
            BOOL v16 = 1;
          }
          else
          {
            v37 = v13;
            id v33 = v12;
            id v34 = v8;
            v21 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithAccountType:v15];
            [v21 setUsername:v14];
            [v21 setAccountDescription:v14];
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            objc_super v32 = v15;
            uint64_t v22 = [v15 supportedDataclasses];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v45 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v41;
              do
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v41 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v27 = *(void *)(*((void *)&v40 + 1) + 8 * i);
                  [v21 setProvisioned:1 forDataclass:v27];
                  [v21 setEnabled:1 forDataclass:v27];
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v45 count:16];
              }
              while (v24);
            }

            accountStore = self->_accountStore;
            id v39 = v11;
            [(ACAccountStore *)accountStore saveVerifiedAccount:v21 error:&v39];
            id v29 = v39;

            BOOL v16 = v29 == 0;
            if (!v29) {
              [v35 addObject:v38];
            }

            id v11 = v29;
            id v8 = v34;
            uint64_t v15 = v32;
            id v12 = v33;
            id v13 = v37;
          }
        }
        else
        {
          _WLLog();
          BOOL v16 = 1;
        }
      }
      else
      {
        v36 = v13;
        v19 = (void *)MEMORY[0x263F087E8];
        uint64_t v46 = *MEMORY[0x263F08320];
        v47 = @"invalid argument";
        uint64_t v15 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        uint64_t v20 = [v19 errorWithDomain:@"WLAccountErrorDomain" code:1 userInfo:v15];

        BOOL v16 = 0;
        id v11 = (id)v20;
        id v13 = v36;
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v48 = *MEMORY[0x263F08320];
      v49 = @"invalid argument";
      id v12 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      [v18 errorWithDomain:@"WLAccountErrorDomain" code:1 userInfo:v12];
      BOOL v16 = 0;
      id v13 = v11;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v50 = *MEMORY[0x263F08320];
    v51[0] = @"cannot continue to import an account due to an ACAccountStore error.";
    v10 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, &v50, 1, v30);
    id v11 = [v17 errorWithDomain:@"WLAccountErrorDomain" code:2 userInfo:v10];
    BOOL v16 = 0;
  }

  long long v31 = [v11 description];
  _WLLog();

  if (v9) {
    v9[2](v9, v16, v11);
  }
}

- (id)importWillBegin
{
  v10[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setSize:0];

  id v4 = 0;
  if (!self->_accountStore)
  {
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = *MEMORY[0x263F86308];
    uint64_t v9 = *MEMORY[0x263F08320];
    v10[0] = @"Mail account migrator couldn't create account store.";
    v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v4 = [v5 errorWithDomain:v6 code:1 userInfo:v7];
  }
  return v4;
}

- (id)importDidEnd
{
  [(WLMailAccountMigrator *)self setAccountStore:0];
  accountTypes = self->_accountTypes;
  self->_accountTypes = 0;

  existingAccounts = self->_existingAccounts;
  self->_existingAccounts = 0;

  return 0;
}

- (WLFeaturePayload)featurePayload
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  return (WLFeaturePayload *)WeakRetained;
}

- (void)setFeaturePayload:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_destroyWeak((id *)&self->_featurePayload);
  objc_storeStrong((id *)&self->_existingAccounts, 0);
  objc_storeStrong((id *)&self->_accountTypes, 0);
}

@end