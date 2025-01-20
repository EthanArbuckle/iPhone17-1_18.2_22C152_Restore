@interface QPAccountsManager
+ (id)sharedAccountsManager;
- (CNContactStoreConfiguration)contactsConfiguration;
- (NSArray)accountTypes;
- (NSArray)contentsArray;
- (NSDictionary)meCard;
- (id)getMeCard;
- (id)nameToEmailAddresses;
- (void)getMeCard;
- (void)setAccountTypes:(id)a3;
- (void)setContactsConfiguration:(id)a3;
- (void)setContentsArray:(id)a3;
- (void)setMeCard:(id)a3;
- (void)update:(id)a3;
@end

@implementation QPAccountsManager

+ (id)sharedAccountsManager
{
  if (sharedAccountsManager_onceToken != -1) {
    dispatch_once(&sharedAccountsManager_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)sharedAccountsManager__instance;
  return v2;
}

uint64_t __42__QPAccountsManager_sharedAccountsManager__block_invoke()
{
  v14[14] = *MEMORY[0x263EF8340];
  if (initEntitlements_onceToken != -1) {
    dispatch_once(&initEntitlements_onceToken, &__block_literal_global_106);
  }
  v0 = objc_alloc_init(QPAccountsManager);
  v1 = (void *)sharedAccountsManager__instance;
  sharedAccountsManager__instance = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x263EFEA68]);
  [(id)sharedAccountsManager__instance setContactsConfiguration:v2];

  uint64_t v3 = *MEMORY[0x263EFAF10];
  v14[0] = *MEMORY[0x263EFAF08];
  v14[1] = v3;
  uint64_t v4 = *MEMORY[0x263EFAF78];
  v14[2] = *MEMORY[0x263EFAEB0];
  v14[3] = v4;
  uint64_t v5 = *MEMORY[0x263EFAF70];
  v14[4] = *MEMORY[0x263EFAF98];
  v14[5] = v5;
  uint64_t v6 = *MEMORY[0x263EFAE58];
  v14[6] = *MEMORY[0x263EFAE50];
  v14[7] = v6;
  uint64_t v7 = *MEMORY[0x263EFAEE8];
  v14[8] = *MEMORY[0x263EFAFE0];
  v14[9] = v7;
  uint64_t v8 = *MEMORY[0x263EFAE38];
  v14[10] = *MEMORY[0x263EFAEF8];
  v14[11] = v8;
  uint64_t v9 = *MEMORY[0x263EFAF88];
  v14[12] = *MEMORY[0x263EFAE40];
  v14[13] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:14];
  [(id)sharedAccountsManager__instance setAccountTypes:v10];

  v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 addObserver:sharedAccountsManager__instance selector:sel_update_ name:*MEMORY[0x263EFE118] object:0];

  v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:sharedAccountsManager__instance selector:sel_update_ name:*MEMORY[0x263EFB060] object:0];

  return [(id)sharedAccountsManager__instance update:0];
}

- (id)nameToEmailAddresses
{
  uint64_t v136 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  v114 = [MEMORY[0x263EFF9A0] dictionary];
  v113 = [MEMORY[0x263EFF9A0] dictionary];
  v115 = v3;
  if (sPrivateAccountsEntitlement)
  {
    uint64_t v4 = [MEMORY[0x263EFB210] defaultStore];
    v93 = self;
    accountTypes = self->_accountTypes;
    id v129 = 0;
    uint64_t v6 = [v4 accountsWithAccountTypeIdentifiers:accountTypes error:&v129];
    id v7 = v129;

    id v94 = v7;
    if (!v7)
    {
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      id obj = v6;
      uint64_t v8 = [obj countByEnumeratingWithState:&v125 objects:v135 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v126;
        uint64_t v98 = *MEMORY[0x263EFAFE0];
        uint64_t v97 = *MEMORY[0x263EFAEF8];
        uint64_t v96 = *MEMORY[0x263EFAEE8];
        uint64_t v95 = *MEMORY[0x263EFAF08];
        uint64_t v91 = *MEMORY[0x263EFAE58];
        uint64_t v92 = *MEMORY[0x263EFAF10];
        uint64_t v99 = *(void *)v126;
        v100 = v6;
        do
        {
          uint64_t v11 = 0;
          uint64_t v101 = v9;
          do
          {
            if (*(void *)v126 != v10) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v125 + 1) + 8 * v11);
            if ([v12 isActive])
            {
              v13 = [v12 accountProperties];
              v14 = [MEMORY[0x263EFF980] array];
              v15 = [v13 objectForKey:@"EmailAddresses"];
              if ([v15 count]) {
                [v14 addObjectsFromArray:v15];
              }
              v108 = v15;
              if (![v14 count])
              {
                v16 = v13;
                v17 = [v13 objectForKey:@"IdentityEmailAddress"];
                if ([v17 length])
                {
                  v18 = [v17 lowercaseString];
                  [v14 addObject:v18];
                }
                v19 = [v12 accountType];
                v20 = v19;
                if (v19)
                {
                  uint64_t v105 = v11;
                  v21 = [v19 identifier];
                  if ([v21 length]
                    && (([v21 isEqualToString:v98] & 1) != 0
                     || ([v21 isEqualToString:v97] & 1) != 0
                     || ([v21 isEqualToString:v96] & 1) != 0
                     || ([v21 isEqualToString:v95] & 1) != 0
                     || ([v21 isEqualToString:v92] & 1) != 0
                     || [v21 isEqualToString:v91]))
                  {
                    v22 = [v12 username];
                    if ([v22 length])
                    {
                      [v22 lowercaseString];
                      v24 = v23 = v6;
                      [v14 addObject:v24];

                      uint64_t v6 = v23;
                    }
                  }
                  uint64_t v9 = v101;
                  uint64_t v11 = v105;
                }

                v13 = v16;
                v15 = v108;
              }
              if ([v14 count])
              {
                v25 = [v13 objectForKey:@"FullUserName"];
                v104 = v13;
                if (![v25 length])
                {
                  uint64_t v26 = [v13 objectForKey:@"ACPropertyFullName"];

                  v25 = (void *)v26;
                }
                uint64_t v106 = v11;
                uint64_t v27 = [v25 length];
                if (!v27)
                {
                  uint64_t v28 = [v14 firstObject];

                  v25 = (void *)v28;
                }
                long long v123 = 0u;
                long long v124 = 0u;
                long long v121 = 0u;
                long long v122 = 0u;
                v103 = v14;
                id v111 = v14;
                uint64_t v29 = [v111 countByEnumeratingWithState:&v121 objects:v134 count:16];
                if (v29)
                {
                  uint64_t v30 = v29;
                  uint64_t v31 = *(void *)v122;
                  do
                  {
                    for (uint64_t i = 0; i != v30; ++i)
                    {
                      if (*(void *)v122 != v31) {
                        objc_enumerationMutation(v111);
                      }
                      v33 = *(void **)(*((void *)&v121 + 1) + 8 * i);
                      if ([v33 length])
                      {
                        v34 = [v113 objectForKey:v33];
                        v35 = [v114 objectForKey:v33];
                        v36 = v35;
                        if (v35 && [v35 length])
                        {
                          if (v34)
                          {
                            uint64_t v3 = v115;
                            if ([v34 BOOLValue] & 1 | (v27 == 0)) {
                              goto LABEL_49;
                            }
                          }
                          else
                          {
                            uint64_t v3 = v115;
                            if (!v27)
                            {
LABEL_49:

                              continue;
                            }
                          }
                          v37 = [v3 objectForKeyedSubscript:v36];
                          [v37 removeObject:v33];

                          v38 = [v3 objectForKeyedSubscript:v36];
                          uint64_t v39 = [v38 count];

                          if (!v39) {
                            [v115 removeObjectForKey:v36];
                          }
                        }
                        v40 = [v115 objectForKey:v25];

                        if (!v40)
                        {
                          v41 = [MEMORY[0x263EFF9C0] set];
                          [v115 setObject:v41 forKey:v25];
                        }
                        v42 = [v115 objectForKeyedSubscript:v25];
                        [v42 addObject:v33];

                        uint64_t v3 = v115;
                        [v114 setObject:v25 forKey:v33];
                        v43 = [NSNumber numberWithBool:v27 != 0];
                        [v113 setObject:v43 forKey:v33];

                        goto LABEL_49;
                      }
                    }
                    uint64_t v30 = [v111 countByEnumeratingWithState:&v121 objects:v134 count:16];
                  }
                  while (v30);
                }

                uint64_t v10 = v99;
                uint64_t v6 = v100;
                uint64_t v9 = v101;
                v13 = v104;
                uint64_t v11 = v106;
                v14 = v103;
                v15 = v108;
              }
            }
            ++v11;
          }
          while (v11 != v9);
          uint64_t v9 = [obj countByEnumeratingWithState:&v125 objects:v135 count:16];
        }
        while (v9);
      }

      if (accountsLogger_token != -1) {
        dispatch_once(&accountsLogger_token, &__block_literal_global_108);
      }
      v44 = (void *)accountsLogger_log;
      if (os_log_type_enabled((os_log_t)accountsLogger_log, OS_LOG_TYPE_INFO))
      {
        v45 = v44;
        uint64_t v46 = [v3 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v133 = v46;
        _os_log_impl(&dword_224D85000, v45, OS_LOG_TYPE_INFO, "QueryParserAccountsManager: found %lu distinct Accounts names", buf, 0xCu);
      }
    }

    self = v93;
    v47 = v94;
  }
  else
  {
    if (accountsLogger_token != -1) {
      dispatch_once(&accountsLogger_token, &__block_literal_global_108);
    }
    v48 = accountsLogger_log;
    if (os_log_type_enabled((os_log_t)accountsLogger_log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224D85000, v48, OS_LOG_TYPE_INFO, "QueryParserAccountsManager: not entitled to access Accounts", buf, 2u);
    }
    v47 = 0;
  }
  if (sPrivateContactsEntitlement)
  {
    v49 = (void *)[objc_alloc(MEMORY[0x263EFEA58]) initWithConfiguration:self->_contactsConfiguration];
    uint64_t v50 = *MEMORY[0x263EFE038];
    v131[0] = *MEMORY[0x263EFDFC8];
    v131[1] = v50;
    uint64_t v51 = *MEMORY[0x263EFDF80];
    v131[2] = *MEMORY[0x263EFDFB8];
    v131[3] = v51;
    v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v131 count:4];
    id v120 = v47;
    v53 = [v49 _crossPlatformUnifiedMeContactWithKeysToFetch:v52 error:&v120];
    id v54 = v120;

    if (v54)
    {

      v47 = v54;
      goto LABEL_108;
    }
    v56 = [MEMORY[0x263EFF980] array];
    v57 = [v53 givenName];
    uint64_t v58 = [v57 length];

    if (v58)
    {
      v59 = [v53 givenName];
      [v56 addObject:v59];
    }
    v60 = [v53 middleName];
    uint64_t v61 = [v60 length];

    if (v61)
    {
      v62 = [v53 middleName];
      [v56 addObject:v62];
    }
    v63 = [v53 familyName];
    uint64_t v64 = [v63 length];

    if (v64)
    {
      v65 = [v53 familyName];
      [v56 addObject:v65];
    }
    v110 = v49;
    v107 = v56;
    if ([v56 count])
    {
      v66 = [v56 componentsJoinedByString:@" "];
    }
    else
    {
      v66 = 0;
    }
    uint64_t v3 = v115;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    v109 = v53;
    v67 = [v53 emailAddresses];
    uint64_t v68 = [v67 countByEnumeratingWithState:&v116 objects:v130 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v117;
      do
      {
        uint64_t v71 = 0;
        id v112 = (id)v69;
        do
        {
          if (*(void *)v117 != v70) {
            objc_enumerationMutation(v67);
          }
          v72 = [*(id *)(*((void *)&v116 + 1) + 8 * v71) value];
          if ([v72 length])
          {
            v73 = [v114 objectForKey:v72];
            id v74 = v66;
            if ([v74 length])
            {
              if (v73 && [v73 length])
              {
                v75 = v66;
                uint64_t v76 = v70;
                v77 = v67;
                v78 = [v3 objectForKeyedSubscript:v73];
                [v78 removeObject:v72];

                v79 = [v3 objectForKeyedSubscript:v73];
                v80 = v3;
                uint64_t v81 = [v79 count];

                if (!v81) {
                  [v80 removeObjectForKey:v73];
                }
                uint64_t v3 = v80;
                v67 = v77;
                uint64_t v70 = v76;
                v66 = v75;
                uint64_t v69 = (uint64_t)v112;
              }
LABEL_97:
              v83 = [v3 objectForKey:v74];

              if (!v83)
              {
                v84 = [MEMORY[0x263EFF9C0] set];
                [v3 setObject:v84 forKey:v74];
              }
              v85 = [v3 objectForKeyedSubscript:v74];
              [v85 addObject:v72];

              uint64_t v3 = v115;
              [v114 setObject:v74 forKey:v72];
              v86 = [NSNumber numberWithBool:v66 != 0];
              [v113 setObject:v86 forKey:v72];
            }
            else if (!v73 || ![v73 length])
            {
              id v82 = v72;

              id v74 = v82;
              goto LABEL_97;
            }
          }
          ++v71;
        }
        while (v69 != v71);
        uint64_t v69 = [v67 countByEnumeratingWithState:&v116 objects:v130 count:16];
      }
      while (v69);
    }

    v47 = 0;
  }
  else
  {
    if (accountsLogger_token != -1) {
      dispatch_once(&accountsLogger_token, &__block_literal_global_108);
    }
    v55 = accountsLogger_log;
    if (os_log_type_enabled((os_log_t)accountsLogger_log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224D85000, v55, OS_LOG_TYPE_INFO, "QueryParserAccountsManager: not entitled to access Contacts", buf, 2u);
    }
  }
  if (accountsLogger_token != -1) {
    dispatch_once(&accountsLogger_token, &__block_literal_global_108);
  }
  v87 = (void *)accountsLogger_log;
  if (os_log_type_enabled((os_log_t)accountsLogger_log, OS_LOG_TYPE_INFO))
  {
    v88 = v87;
    uint64_t v89 = [v3 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v133 = v89;
    _os_log_impl(&dword_224D85000, v88, OS_LOG_TYPE_INFO, "QueryParserAccountsManager: found %lu distinct names in total", buf, 0xCu);
  }
LABEL_108:

  return v3;
}

- (void)update:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (accountsLogger_token != -1) {
    dispatch_once(&accountsLogger_token, &__block_literal_global_108);
  }
  uint64_t v5 = (void *)accountsLogger_log;
  if (os_log_type_enabled((os_log_t)accountsLogger_log, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v5;
    id v7 = [v4 name];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_224D85000, v6, OS_LOG_TYPE_INFO, "QueryParserAccountsManager: start update AccountsManager based on %@ notification", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v8 = [(QPAccountsManager *)self getMeCard];
  meCard = self->_meCard;
  self->_meCard = v8;

  uint64_t v10 = [(QPAccountsManager *)self nameToEmailAddresses];
  contentsArray = self->_contentsArray;
  p_contentsArray = (id *)&self->_contentsArray;
  id *p_contentsArray = 0;

  if ([v10 count])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__16;
    v38 = __Block_byref_object_dispose__16;
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count") + 1);
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = __Block_byref_object_copy__16;
    uint64_t v30 = __Block_byref_object_dispose__16;
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__16;
    v24 = __Block_byref_object_dispose__16;
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __28__QPAccountsManager_update___block_invoke;
    v19[3] = &unk_264706640;
    v19[4] = &v26;
    v19[5] = &v20;
    v19[6] = &buf;
    [v10 enumerateKeysAndObjectsUsingBlock:v19];
    v13 = *(void **)(*((void *)&buf + 1) + 40);
    v14 = [(id)v27[5] componentsJoinedByString:@","];
    v34[0] = v14;
    v15 = [(id)v21[5] componentsJoinedByString:@","];
    v34[1] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
    [v13 addObject:v16];

    objc_storeStrong(p_contentsArray, *(id *)(*((void *)&buf + 1) + 40));
    if (accountsLogger_token != -1) {
      dispatch_once(&accountsLogger_token, &__block_literal_global_108);
    }
    v17 = (id)accountsLogger_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = [v4 name];
      *(_DWORD *)v32 = 138412290;
      v33 = v18;
      _os_log_impl(&dword_224D85000, v17, OS_LOG_TYPE_INFO, "QueryParserAccountsManager: end update AccountsManager based on %@ notification", v32, 0xCu);
    }
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&buf, 8);
  }
}

void __28__QPAccountsManager_update___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x263EFF980];
  id v6 = a3;
  id v7 = a2;
  id v14 = [v5 arrayWithCapacity:5];
  [v14 addObject:v7];
  uint64_t v8 = [NSString stringWithFormat:@"\"%@\"", v7];
  [*(id *)(*(void *)(a1[4] + 8) + 40) addObject:v8];
  [v14 addObject:v8];
  uint64_t v9 = createStringFromSet(v6, @"%@", @"\"%@\", @","");
  [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v9];
  [v14 addObject:v9];
  uint64_t v10 = createStringFromSet(v6, @"(%@)", @"** == \"%@\"cdw", @" || ");
  uint64_t v11 = [NSString stringWithFormat:@"(** == \"%@\"cdw)", v7];

  v12 = [NSString stringWithFormat:@"(%@ || %@)", v10, v11];
  [v14 addObject:v12];
  v13 = [v6 allObjects];

  [v14 addObject:v13];
  [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v14];
}

- (id)getMeCard
{
  v54[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFEA58]) initWithConfiguration:self->_contactsConfiguration];
  uint64_t v5 = *MEMORY[0x263EFE038];
  v54[0] = *MEMORY[0x263EFDFC8];
  v54[1] = v5;
  uint64_t v6 = *MEMORY[0x263EFDF80];
  v54[2] = *MEMORY[0x263EFDFB8];
  v54[3] = v6;
  v54[4] = *MEMORY[0x263EFE070];
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:5];
  id v50 = 0;
  uint64_t v8 = [v4 _crossPlatformUnifiedMeContactWithKeysToFetch:v7 error:&v50];
  id v9 = v50;

  if (v9)
  {
    if (accountsLogger_token != -1) {
      dispatch_once(&accountsLogger_token, &__block_literal_global_108);
    }
    uint64_t v10 = accountsLogger_log;
    if (os_log_type_enabled((os_log_t)accountsLogger_log, OS_LOG_TYPE_ERROR)) {
      -[QPAccountsManager getMeCard](v10);
    }
  }
  else
  {
    v41 = v4;
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    v12 = [v8 givenName];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      id v14 = [v8 givenName];
      [v11 addObject:v14];
    }
    v15 = [v8 middleName];
    uint64_t v16 = [v15 length];

    if (v16)
    {
      v17 = [v8 middleName];
      [v11 addObject:v17];
    }
    v18 = [v8 familyName];
    uint64_t v19 = [v18 length];

    if (v19)
    {
      uint64_t v20 = [v8 familyName];
      [v11 addObject:v20];
    }
    uint64_t v40 = v11;
    if ([v11 count])
    {
      [v11 componentsJoinedByString:@" "];
      objc_msgSend(MEMORY[0x263EFF980], "array", objc_claimAutoreleasedReturnValue());
    }
    else
    {
      objc_msgSend(MEMORY[0x263EFF980], "array", 0);
    v21 = };
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v22 = [v8 emailAddresses];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v53 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v47 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = [*(id *)(*((void *)&v46 + 1) + 8 * i) value];
          [v21 addObject:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v46 objects:v53 count:16];
      }
      while (v24);
    }

    uint64_t v28 = [MEMORY[0x263EFF980] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v29 = [v8 phoneNumbers];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v43 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [*(id *)(*((void *)&v42 + 1) + 8 * j) value];
          v35 = v34;
          if (v34)
          {
            uint64_t v36 = [v34 stringValue];
            [v28 addObject:v36];
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v42 objects:v52 count:16];
      }
      while (v31);
    }

    if (v39)
    {
      uint64_t v51 = v39;
      v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
      [v3 setObject:v37 forKeyedSubscript:@"personNames"];
    }
    else
    {
      [v3 setObject:MEMORY[0x263EFFA68] forKeyedSubscript:@"personNames"];
    }
    id v9 = 0;
    id v4 = v41;
    [v3 setObject:v40 forKeyedSubscript:@"personSubNames"];
    [v3 setObject:v21 forKeyedSubscript:@"personEmails"];
    [v3 setObject:v28 forKeyedSubscript:@"personPhoneNumbers"];
  }
  return v3;
}

- (CNContactStoreConfiguration)contactsConfiguration
{
  return self->_contactsConfiguration;
}

- (void)setContactsConfiguration:(id)a3
{
}

- (NSArray)accountTypes
{
  return self->_accountTypes;
}

- (void)setAccountTypes:(id)a3
{
}

- (NSArray)contentsArray
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContentsArray:(id)a3
{
}

- (NSDictionary)meCard
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMeCard:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCard, 0);
  objc_storeStrong((id *)&self->_contentsArray, 0);
  objc_storeStrong((id *)&self->_accountTypes, 0);
  objc_storeStrong((id *)&self->_contactsConfiguration, 0);
}

- (void)getMeCard
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224D85000, log, OS_LOG_TYPE_ERROR, "QueryParserAccountsManager: Unable to get MeCard", v1, 2u);
}

@end