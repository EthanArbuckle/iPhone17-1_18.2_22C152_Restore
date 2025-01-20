@interface MKAccountMigrator
- (MKAccountMigrator)init;
- (void)import:(id)a3;
- (void)importDataEncodedInJSON:(id)a3;
@end

@implementation MKAccountMigrator

- (MKAccountMigrator)init
{
  v37[1] = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)MKAccountMigrator;
  v2 = [(MKMigrator *)&v33 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFB210] defaultStore];
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v3;

    v5 = v2->_accountStore;
    if (v5)
    {
      v36 = @"com.google";
      v6 = [(ACAccountStore *)v5 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAEE8]];
      v37[0] = v6;
      uint64_t v7 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
      accountTypes = v2->_accountTypes;
      v2->_accountTypes = (NSDictionary *)v7;
    }
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    existingAccounts = v2->_existingAccounts;
    v2->_existingAccounts = v9;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = [(NSDictionary *)v2->_accountTypes allKeys];
    uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v24)
    {
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v13 = [(NSDictionary *)v2->_accountTypes objectForKeyedSubscript:v12];
          id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          v15 = [(ACAccountStore *)v2->_accountStore accountsWithAccountType:v13];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v26 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = [*(id *)(*((void *)&v25 + 1) + 8 * j) username];
                [v14 addObject:v20];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
            }
            while (v17);
          }

          [(NSMutableDictionary *)v2->_existingAccounts setObject:v14 forKey:v12];
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v24);
    }

    [(MKMigrator *)v2 setType:1];
  }
  return v2;
}

- (void)importDataEncodedInJSON:(id)a3
{
  id v7 = a3;
  v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x230F5C060](v5);
  [(MKAccountMigrator *)v4 import:v7];
  objc_sync_exit(v4);
}

- (void)import:(id)a3
{
  v64[1] = *MEMORY[0x263EF8340];
  id v48 = a3;
  v4 = [MEMORY[0x263EFF910] date];
  uint64_t v5 = +[MKLog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v56 = self;
    _os_log_impl(&dword_22BFAC000, v5, OS_LOG_TYPE_INFO, "%@ will import an account.", buf, 0xCu);
  }

  if (!self->_accountStore || ![(NSDictionary *)self->_accountTypes count])
  {
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v63 = *MEMORY[0x263F08320];
    v64[0] = @"cannot continue to import an account due to an ACAccountStore error.";
    v6 = [NSDictionary dictionaryWithObjects:v64 forKeys:&v63 count:1];
    uint64_t v22 = [v21 errorWithDomain:@"MKAccountErrorDomain" code:2 userInfo:v6];
LABEL_14:
    v19 = (MKAccount *)v22;
    BOOL v20 = 0;
LABEL_15:

    uint64_t v23 = +[MKLog log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [(MKAccount *)v19 description];
      *(_DWORD *)buf = 138412546;
      v56 = self;
      __int16 v57 = 2112;
      v58 = v24;
      _os_log_impl(&dword_22BFAC000, v23, OS_LOG_TYPE_INFO, "%@ account store did store an account. error=%@", buf, 0x16u);
    }
    if (v20)
    {
      [(MKMigrator *)self migratorDidImport];
      -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", [v48 length]);
    }
    else
    {
      [(MKMigrator *)self migratorDidFailWithImportError:v19];
    }
    long long v25 = +[MKAnalytics sharedInstance];
    objc_sync_enter(v25);
    long long v26 = [v25 payload];
    long long v27 = [v26 accounts];

    long long v28 = [MEMORY[0x263EFF910] date];
    [v28 timeIntervalSinceDate:v4];
    double v30 = v29;

    long long v31 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v30];
    long long v32 = [v27 importElapsedTime];
    objc_super v33 = [v32 decimalNumberByAdding:v31];
    [v27 setImportElapsedTime:v33];

    objc_sync_exit(v25);
    v6 = v19;
    goto LABEL_21;
  }
  v6 = [[MKAccount alloc] initWithData:v48];
  if (!v6)
  {
    v34 = (void *)MEMORY[0x263F087E8];
    uint64_t v61 = *MEMORY[0x263F08320];
    v62 = @"invalid argument";
    v6 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    uint64_t v22 = [v34 errorWithDomain:@"MKAccountErrorDomain" code:1 userInfo:v6];
    goto LABEL_14;
  }
  id v7 = +[MKLog log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [(MKAccount *)v6 type];
    v9 = [(MKAccount *)v6 name];
    *(_DWORD *)buf = 138412802;
    v56 = self;
    __int16 v57 = 2112;
    v58 = v8;
    __int16 v59 = 2112;
    v60 = v9;
    _os_log_impl(&dword_22BFAC000, v7, OS_LOG_TYPE_INFO, "%@ received an account. type=%@, name=%@", buf, 0x20u);
  }
  accountTypes = self->_accountTypes;
  v11 = [(MKAccount *)v6 type];
  v47 = [(NSDictionary *)accountTypes objectForKeyedSubscript:v11];

  if (v47)
  {
    existingAccounts = self->_existingAccounts;
    v13 = [(MKAccount *)v6 type];
    v46 = [(NSMutableDictionary *)existingAccounts objectForKeyedSubscript:v13];

    id v14 = [(MKAccount *)v6 name];
    int v15 = [v46 containsObject:v14];

    if (v15)
    {
      uint64_t v16 = +[MKLog log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = [(MKAccount *)v6 type];
        uint64_t v18 = [(MKAccount *)v6 name];
        *(_DWORD *)buf = 138412802;
        v56 = self;
        __int16 v57 = 2112;
        v58 = v17;
        __int16 v59 = 2112;
        v60 = v18;
        _os_log_impl(&dword_22BFAC000, v16, OS_LOG_TYPE_INFO, "%@ account already exists. type=%@, name=%@", buf, 0x20u);
      }
      v19 = 0;
      BOOL v20 = 1;
    }
    else
    {
      v36 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithAccountType:v47];
      v37 = [(MKAccount *)v6 name];
      [v36 setUsername:v37];

      v38 = [(MKAccount *)v6 name];
      [v36 setAccountDescription:v38];

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v39 = [v47 supportedDataclasses];
      uint64_t v40 = [v39 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v51 != v41) {
              objc_enumerationMutation(v39);
            }
            uint64_t v43 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            objc_msgSend(v36, "setProvisioned:forDataclass:", 1, v43, v46);
            [v36 setEnabled:1 forDataclass:v43];
          }
          uint64_t v40 = [v39 countByEnumeratingWithState:&v50 objects:v54 count:16];
        }
        while (v40);
      }

      accountStore = self->_accountStore;
      id v49 = 0;
      [(ACAccountStore *)accountStore saveVerifiedAccount:v36 error:&v49];
      v19 = (MKAccount *)v49;
      BOOL v20 = v19 == 0;
      if (!v19)
      {
        v45 = [(MKAccount *)v6 name];
        [v46 addObject:v45];
      }
    }
    goto LABEL_15;
  }
  long long v25 = +[MKLog log];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v35 = [(MKAccount *)v6 type];
    *(_DWORD *)buf = 138412546;
    v56 = self;
    __int16 v57 = 2112;
    v58 = v35;
    _os_log_impl(&dword_22BFAC000, v25, OS_LOG_TYPE_INFO, "%@ will skip an account. type=%@", buf, 0x16u);
  }
LABEL_21:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingAccounts, 0);
  objc_storeStrong((id *)&self->_accountTypes, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end