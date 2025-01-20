@interface ICKeychain
+ (BOOL)BOOLeanForIdentifier:(id)a3 account:(id)a4;
+ (BOOL)deleteItemsForIdentifier:(id)a3 account:(id)a4 error:(id *)a5;
+ (BOOL)deleteItemsForIdentifier:(id)a3 account:(id)a4 isSynced:(BOOL)a5 error:(id *)a6;
+ (BOOL)deleteItemsOfType:(unint64_t)a3 account:(id)a4 error:(id *)a5;
+ (BOOL)deleteItemsOfType:(unint64_t)a3 account:(id)a4 isSynced:(BOOL)a5 error:(id *)a6;
+ (BOOL)hasItemForIdentifier:(id)a3 account:(id)a4;
+ (BOOL)isSyncAvailableForAccount:(id)a3;
+ (BOOL)setBoolean:(BOOL)a3 forIdentifier:(id)a4 account:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7;
+ (BOOL)setData:(id)a3 forIdentifier:(id)a4 account:(id)a5 error:(id *)a6;
+ (BOOL)setData:(id)a3 forIdentifier:(id)a4 account:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7;
+ (BOOL)setData:(id)a3 forIdentifier:(id)a4 account:(id)a5 type:(unint64_t)a6 shouldSync:(BOOL)a7 accessFlags:(unint64_t)a8 accessGroup:(id)a9 error:(id *)a10;
+ (BOOL)setString:(id)a3 forIdentifier:(id)a4 account:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7;
+ (BOOL)setUnsignedInteger:(unint64_t)a3 forIdentifier:(id)a4 account:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7;
+ (BOOL)shouldFetchItemsWithError:(id *)a3;
+ (id)accessControlObjectWithProtection:(void *)a3 flags:(unint64_t)a4 error:(id *)a5;
+ (id)dataForIdentifier:(id)a3 account:(id)a4;
+ (id)dataForIdentifier:(id)a3 account:(id)a4 authenticationContext:(id)a5;
+ (id)dataForIdentifier:(id)a3 account:(id)a4 isSynced:(BOOL)a5 authenticationContext:(id)a6;
+ (id)itemsOfType:(unint64_t)a3 account:(id)a4 authenticationContext:(id)a5;
+ (id)itemsOfType:(unint64_t)a3 account:(id)a4 isSynced:(BOOL)a5 authenticationContext:(id)a6;
+ (id)queryForItemClass:(id)a3 forIdentifier:(id)a4 account:(id)a5 isSynced:(BOOL)a6 type:(unint64_t)a7 authenticationContext:(id)a8 returnData:(BOOL)a9 limit:(id)a10;
+ (id)stringForIdentifier:(id)a3 account:(id)a4 isSynced:(BOOL)a5;
+ (unint64_t)unsignedIntegerForIdentifier:(id)a3 account:(id)a4;
+ (void)fetchItemsWithCompletionHandler:(id)a3;
+ (void)tests_setLastItemsError:(id)a3 lastItemsErrorDate:(id)a4 lastItemsFetchDate:(id)a5;
@end

@implementation ICKeychain

+ (id)stringForIdentifier:(id)a3 account:(id)a4 isSynced:(BOOL)a5
{
  v5 = [a1 dataForIdentifier:a3 account:a4 isSynced:a5 authenticationContext:0];
  v6 = objc_msgSend(v5, "ic_stringValue");

  return v6;
}

+ (BOOL)setString:(id)a3 forIdentifier:(id)a4 account:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  v14 = objc_msgSend(a3, "ic_dataValue");
  LOBYTE(a7) = [a1 setData:v14 forIdentifier:v13 account:v12 shouldSync:v8 error:a7];

  return (char)a7;
}

+ (BOOL)BOOLeanForIdentifier:(id)a3 account:(id)a4
{
  v4 = [a1 dataForIdentifier:a3 account:a4];
  char v5 = objc_msgSend(v4, "ic_BOOLValue");

  return v5;
}

+ (BOOL)setBoolean:(BOOL)a3 forIdentifier:(id)a4 account:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v10 = a3;
  id v12 = (void *)MEMORY[0x1E4F1C9B8];
  id v13 = a5;
  id v14 = a4;
  v15 = objc_msgSend(v12, "ic_dataWithBoolean:", v10);
  LOBYTE(a7) = [a1 setData:v15 forIdentifier:v14 account:v13 shouldSync:v8 error:a7];

  return (char)a7;
}

+ (unint64_t)unsignedIntegerForIdentifier:(id)a3 account:(id)a4
{
  v4 = [a1 dataForIdentifier:a3 account:a4];
  unint64_t v5 = objc_msgSend(v4, "ic_unsignedIntegerValue");

  return v5;
}

+ (BOOL)setUnsignedInteger:(unint64_t)a3 forIdentifier:(id)a4 account:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = (void *)MEMORY[0x1E4F1C9B8];
  id v13 = a5;
  id v14 = a4;
  v15 = objc_msgSend(v12, "ic_dataWithUnsignedInteger:", a3);
  LOBYTE(a7) = [a1 setData:v15 forIdentifier:v14 account:v13 shouldSync:v8 error:a7];

  return (char)a7;
}

+ (id)dataForIdentifier:(id)a3 account:(id)a4
{
  return (id)[a1 dataForIdentifier:a3 account:a4 authenticationContext:0];
}

+ (id)dataForIdentifier:(id)a3 account:(id)a4 authenticationContext:(id)a5
{
  return (id)[a1 dataForIdentifier:a3 account:a4 isSynced:0 authenticationContext:a5];
}

+ (id)dataForIdentifier:(id)a3 account:(id)a4 isSynced:(BOOL)a5 authenticationContext:(id)a6
{
  BOOL v7 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  LOBYTE(v18) = 1;
  CFDictionaryRef v12 = [a1 queryForItemClass:*MEMORY[0x1E4F3B988] forIdentifier:v10 account:v11 isSynced:v7 type:0 authenticationContext:a6 returnData:v18 limit:0];
  CFTypeRef result = 0;
  OSStatus v13 = SecItemCopyMatching(v12, &result);
  if (v13 != -25300)
  {
    OSStatus v14 = v13;
    if (!v13)
    {
      v15 = (void *)result;
      goto LABEL_8;
    }
    v16 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 1024;
      OSStatus v25 = v14;
      _os_log_error_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_ERROR, "Failed getting item (%@) for account (%@) with code: %d", buf, 0x1Cu);
    }
  }
  v15 = 0;
LABEL_8:

  return v15;
}

+ (id)itemsOfType:(unint64_t)a3 account:(id)a4 authenticationContext:(id)a5
{
  return (id)[a1 itemsOfType:a3 account:a4 isSynced:0 authenticationContext:a5];
}

+ (id)itemsOfType:(unint64_t)a3 account:(id)a4 isSynced:(BOOL)a5 authenticationContext:(id)a6
{
  BOOL v7 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  LOBYTE(v17) = 1;
  CFDictionaryRef v11 = [a1 queryForItemClass:*MEMORY[0x1E4F3B988] forIdentifier:0 account:v10 isSynced:v7 type:a3 authenticationContext:a6 returnData:v17 limit:*MEMORY[0x1E4F3BB88]];
  CFTypeRef result = 0;
  OSStatus v12 = SecItemCopyMatching(v11, &result);
  if (v12 != -25300)
  {
    OSStatus v13 = v12;
    if (!v12)
    {
      OSStatus v14 = (void *)result;
      goto LABEL_8;
    }
    v15 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      unint64_t v20 = a3;
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 1024;
      OSStatus v24 = v13;
      _os_log_error_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_ERROR, "Failed getting items of type (%lu) for account (%@) with code: %d", buf, 0x1Cu);
    }
  }
  OSStatus v14 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_8:

  return v14;
}

+ (BOOL)setData:(id)a3 forIdentifier:(id)a4 account:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  OSStatus v13 = ICGroupContainerIdentifier();
  LOBYTE(a6) = [a1 setData:v12 forIdentifier:v11 account:v10 type:0 shouldSync:0 accessFlags:0 accessGroup:v13 error:a6];

  return (char)a6;
}

+ (BOOL)setData:(id)a3 forIdentifier:(id)a4 account:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = ICGroupContainerIdentifier();
  LOBYTE(a7) = [a1 setData:v14 forIdentifier:v13 account:v12 type:0 shouldSync:v8 accessFlags:0 accessGroup:v15 error:a7];

  return (char)a7;
}

+ (BOOL)setData:(id)a3 forIdentifier:(id)a4 account:(id)a5 type:(unint64_t)a6 shouldSync:(BOOL)a7 accessFlags:(unint64_t)a8 accessGroup:(id)a9 error:(id *)a10
{
  BOOL v45 = a7;
  v56[5] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  id v19 = (id)*MEMORY[0x1E4F3B988];
  if (a10) {
    *a10 = 0;
  }
  if (v15)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v21 = *MEMORY[0x1E4F3BD38];
    v55[0] = *MEMORY[0x1E4F3B978];
    v55[1] = v21;
    uint64_t v43 = v21;
    uint64_t v22 = *MEMORY[0x1E4F3B698];
    v55[2] = *MEMORY[0x1E4F3BD08];
    v55[3] = v22;
    id v46 = v19;
    v56[0] = v19;
    v56[1] = v15;
    v55[4] = *MEMORY[0x1E4F3B878];
    uint64_t v23 = MEMORY[0x1E4F1CC28];
    v56[2] = MEMORY[0x1E4F1CC38];
    v56[3] = MEMORY[0x1E4F1CC38];
    if (v45) {
      uint64_t v23 = MEMORY[0x1E4F1CC38];
    }
    v56[4] = v23;
    id v44 = v16;
    if (v45) {
      OSStatus v24 = (uint64_t *)MEMORY[0x1E4F3B5C0];
    }
    else {
      OSStatus v24 = (uint64_t *)MEMORY[0x1E4F3B850];
    }
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:5];
    uint64_t v26 = (void *)[v20 initWithDictionary:v25];

    uint64_t v27 = *v24;
    id v16 = v44;
    [v26 setObject:v44 forKeyedSubscript:v27];
    if (v17) {
      [v26 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
    }
    if (a6)
    {
      v28 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a6];
      [v26 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F3B8C0]];
    }
    uint64_t v29 = *MEMORY[0x1E4F3B570];
    id v19 = v46;
    if (a8)
    {
      v30 = [a1 accessControlObjectWithProtection:v29 flags:a8 error:a10];
      v31 = v30;
      if (!v30 || a10 && *a10)
      {

        char v32 = 0;
LABEL_33:

        goto LABEL_34;
      }
      [v26 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F3B548]];

      if (!v18)
      {
LABEL_21:
        CFDictionaryRef v33 = (const __CFDictionary *)[v26 copy];
        OSStatus v34 = SecItemAdd(v33, 0);

        if (v34 == -25299)
        {
          LOBYTE(v42) = 0;
          CFDictionaryRef v35 = [a1 queryForItemClass:v46 forIdentifier:v44 account:v17 isSynced:v45 type:0 authenticationContext:0 returnData:v42 limit:0];
          id v36 = objc_alloc(MEMORY[0x1E4F1CA60]);
          uint64_t v53 = v43;
          id v54 = v15;
          v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          v38 = (void *)[v36 initWithDictionary:v37];

          CFDictionaryRef v39 = (const __CFDictionary *)[v38 copy];
          OSStatus v34 = SecItemUpdate(v35, v39);

          id v16 = v44;
          uint64_t v26 = v38;
        }
        if (v34)
        {
          v40 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            id v48 = v44;
            __int16 v49 = 2112;
            id v50 = v17;
            __int16 v51 = 1024;
            OSStatus v52 = v34;
            _os_log_error_impl(&dword_1C3A61000, v40, OS_LOG_TYPE_ERROR, "Failed writing item (%@) for account (%@) to keychain with code: %d", buf, 0x1Cu);
          }

          id v19 = v46;
          if (a10)
          {
            [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v34 userInfo:0];
            char v32 = 0;
            *a10 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            char v32 = 0;
          }
          id v16 = v44;
        }
        else
        {
          char v32 = 1;
          id v19 = v46;
        }
        goto LABEL_33;
      }
    }
    else
    {
      [v26 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F3B558]];
      if (!v18) {
        goto LABEL_21;
      }
    }
    [v26 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F3B550]];
    goto LABEL_21;
  }
  char v32 = [a1 deleteItemsForIdentifier:v16 account:v17 error:a10];
LABEL_34:

  return v32;
}

+ (BOOL)hasItemForIdentifier:(id)a3 account:(id)a4
{
  v4 = [a1 dataForIdentifier:a3 account:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

+ (BOOL)deleteItemsForIdentifier:(id)a3 account:(id)a4 error:(id *)a5
{
  return [a1 deleteItemsForIdentifier:a3 account:a4 isSynced:0 error:a5];
}

+ (BOOL)deleteItemsForIdentifier:(id)a3 account:(id)a4 isSynced:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (a6)
  {
    *a6 = 0;
    if (![v10 length])
    {
      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.notes.keychain" code:3 userInfo:0];
LABEL_16:
      id v12 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[ICKeychain deleteItemsForIdentifier:account:isSynced:error:]();
      }
      BOOL v15 = 0;
      goto LABEL_19;
    }
  }
  else if (![v10 length])
  {
    goto LABEL_16;
  }
  LOBYTE(v19) = 0;
  id v12 = [a1 queryForItemClass:*MEMORY[0x1E4F3B988] forIdentifier:v10 account:v11 isSynced:v7 type:0 authenticationContext:0 returnData:v19 limit:0];
  CFDictionaryRef v13 = [v12 copy];
  OSStatus v14 = SecItemDelete(v13);

  if (v14) {
    BOOL v15 = v14 == -25300;
  }
  else {
    BOOL v15 = 1;
  }
  if (v14 != -25300 && v14 != 0)
  {
    id v17 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 1024;
      OSStatus v25 = v14;
      _os_log_error_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_ERROR, "Failed deleting keychain item (%@) for account (%@) with code: %d", buf, 0x1Cu);
    }

    if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:0];
    }
  }
LABEL_19:

  return v15;
}

+ (BOOL)deleteItemsOfType:(unint64_t)a3 account:(id)a4 error:(id *)a5
{
  return [a1 deleteItemsOfType:a3 account:a4 isSynced:0 error:a5];
}

+ (BOOL)deleteItemsOfType:(unint64_t)a3 account:(id)a4 isSynced:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = v10;
  if (a6) {
    *a6 = 0;
  }
  if (a3 || [v10 length])
  {
    LOBYTE(v19) = 0;
    id v12 = [a1 queryForItemClass:*MEMORY[0x1E4F3B988] forIdentifier:0 account:v11 isSynced:v7 type:a3 authenticationContext:0 returnData:v19 limit:0];
    CFDictionaryRef v13 = [v12 copy];
    OSStatus v14 = SecItemDelete(v13);

    if (v14) {
      BOOL v15 = v14 == -25300;
    }
    else {
      BOOL v15 = 1;
    }
    if (v14 != -25300 && v14 != 0)
    {
      id v17 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        unint64_t v21 = a3;
        __int16 v22 = 2112;
        id v23 = v11;
        __int16 v24 = 1024;
        OSStatus v25 = v14;
        _os_log_error_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_ERROR, "Failed deleting keychain items of type (%lu) for account (%@) with code: %d", buf, 0x1Cu);
      }

      if (a6)
      {
        *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:0];
      }
    }
  }
  else
  {
    if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.notes.keychain" code:3 userInfo:0];
    }
    id v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[ICKeychain deleteItemsOfType:account:isSynced:error:]();
    }
    BOOL v15 = 0;
  }

  return v15;
}

+ (BOOL)isSyncAvailableForAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 managedObjectContext];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    char v6 = [v3 isDeleted];

    if ((v6 & 1) == 0)
    {
      if ([v3 isPrimaryiCloudAccount])
      {
        BOOL v8 = [v3 altDSID];
        if (!v8) {
          goto LABEL_16;
        }
      }
      else
      {
        if ([v3 accountType] != 3)
        {
          id v23 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            +[ICKeychain isSyncAvailableForAccount:].cold.6(v3);
          }

          goto LABEL_16;
        }
        v9 = [MEMORY[0x1E4F836D8] sharedInstance];
        id v10 = [v9 accountStore];
        id v11 = [v10 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17750]];

        id v12 = [MEMORY[0x1E4F836D8] sharedInstance];
        CFDictionaryRef v13 = [v12 accountStore];
        OSStatus v14 = [v13 accountsWithAccountType:v11];

        BOOL v15 = objc_msgSend(v14, "ic_objectPassingTest:", &__block_literal_global_27);
        BOOL v8 = objc_msgSend(v15, "aa_altDSID");

        if (!v8)
        {
LABEL_16:
          BOOL v8 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            +[ICKeychain isSyncAvailableForAccount:]();
          }
          BOOL v7 = 0;
          goto LABEL_32;
        }
      }
      id v16 = objc_alloc_init(MEMORY[0x1E4F3B438]);
      [v16 setContext:*MEMORY[0x1E4F3B458]];
      [v16 setAltDSID:v8];
      id v17 = (void *)[objc_alloc(MEMORY[0x1E4F3B430]) initWithContextData:v16];
      id v18 = objc_alloc_init(MEMORY[0x1E4F3B448]);
      [v18 setUseCachedAccountStatus:1];
      id v27 = 0;
      uint64_t v19 = [v17 fetchCliqueStatus:v18 error:&v27];
      id v20 = v27;
      if (v20)
      {
        unint64_t v21 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          +[ICKeychain isSyncAvailableForAccount:].cold.5(v3);
        }
      }
      else
      {
        if ((v19 | 2) == 2)
        {
          id v26 = 0;
          char v24 = [v17 fetchUserControllableViewsSyncingEnabled:&v26];
          __int16 v22 = v26;
          if (v22)
          {
            unint64_t v21 = os_log_create("com.apple.notes", "Crypto");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              +[ICKeychain isSyncAvailableForAccount:].cold.4(v3);
            }
          }
          else
          {
            if (v24)
            {
              BOOL v7 = 1;
LABEL_31:

LABEL_32:
              goto LABEL_33;
            }
            unint64_t v21 = os_log_create("com.apple.notes", "Crypto");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
              +[ICKeychain isSyncAvailableForAccount:](v3);
            }
          }

LABEL_30:
          BOOL v7 = 0;
          goto LABEL_31;
        }
        unint64_t v21 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          +[ICKeychain isSyncAvailableForAccount:](v3);
        }
      }
      __int16 v22 = v21;
      goto LABEL_30;
    }
  }
  BOOL v7 = 0;
LABEL_33:

  return v7;
}

uint64_t __40__ICKeychain_isSyncAvailableForAccount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aa_isAccountClass:", *MEMORY[0x1E4F4BF38]);
}

+ (BOOL)shouldFetchItemsWithError:(id *)a3
{
  id v4 = a1;
  objc_sync_enter(v4);
  BOOL v5 = +[ICCloudConfiguration sharedConfiguration];
  char v6 = [v5 keychainFetchingEnabled];

  if ((v6 & 1) == 0)
  {
    BOOL v15 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[ICKeychain shouldFetchItemsWithError:].cold.4();
    }

    if (!a3) {
      goto LABEL_22;
    }
    id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.notes.keychain" code:5 userInfo:0];
LABEL_15:
    id v18 = v16;
    goto LABEL_16;
  }
  BOOL v7 = [MEMORY[0x1E4F837B0] sharedReachabilityForInternetConnection];
  uint64_t v8 = [v7 currentReachabilityStatus];

  if (!v8)
  {
    id v17 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      +[ICKeychain shouldFetchItemsWithError:]();
    }

    if (!a3) {
      goto LABEL_22;
    }
    id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.notes.keychain" code:4 userInfo:0];
    goto LABEL_15;
  }
  v9 = (void *)lastItemsFetchFetchDate;
  id v10 = +[ICCloudConfiguration sharedConfiguration];
  [v10 keychainMinimumSyncInterval];
  id v11 = objc_msgSend(v9, "dateByAddingTimeInterval:");
  id v12 = [MEMORY[0x1E4F1C9C8] now];
  int v13 = objc_msgSend(v11, "ic_isLaterThanDate:", v12);

  if (v13)
  {
    OSStatus v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[ICKeychain shouldFetchItemsWithError:]();
    }

LABEL_22:
    BOOL v19 = 0;
    goto LABEL_23;
  }
  id v20 = (void *)lastItemsFetchErrorDate;
  unint64_t v21 = +[ICCloudConfiguration sharedConfiguration];
  [v21 keychainFetchErrorTimeout];
  __int16 v22 = objc_msgSend(v20, "dateByAddingTimeInterval:");
  id v23 = [MEMORY[0x1E4F1C9C8] now];
  int v24 = objc_msgSend(v22, "ic_isLaterThanDate:", v23);

  if (!v24)
  {
    BOOL v19 = 1;
    goto LABEL_23;
  }
  OSStatus v25 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    +[ICKeychain shouldFetchItemsWithError:]();
  }

  if (!a3) {
    goto LABEL_22;
  }
  id v18 = (id) lastItemsFetchError;
LABEL_16:
  BOOL v19 = 0;
  *a3 = v18;
LABEL_23:
  objc_sync_exit(v4);

  return v19;
}

+ (void)fetchItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v18 = 0;
  BOOL v5 = [MEMORY[0x1E4F3B3F8] controlObject:&v18];
  id v6 = v18;
  if (v5)
  {
    id v7 = a1;
    objc_sync_enter(v7);
    id v17 = v6;
    char v8 = [v7 shouldFetchItemsWithError:&v17];
    id v9 = v17;

    if (v8)
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
      id v11 = (void *)lastItemsFetchFetchDate;
      lastItemsFetchFetchDate = v10;

      objc_sync_exit(v7);
      id v12 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        +[ICKeychain fetchItemsWithCompletionHandler:]();
      }

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__ICKeychain_fetchItemsWithCompletionHandler___block_invoke;
      v14[3] = &unk_1E64A6610;
      id v16 = v7;
      id v15 = v4;
      [v5 rpcFetchAndProcessChanges:0 reply:v14];
    }
    else
    {
      if (v4) {
        (*((void (**)(id, id))v4 + 2))(v4, v9);
      }
      objc_sync_exit(v7);
    }
  }
  else
  {
    int v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[ICKeychain fetchItemsWithCompletionHandler:]();
    }

    if (v4) {
      (*((void (**)(id, id))v4 + 2))(v4, v6);
    }
    id v9 = v6;
  }
}

void __46__ICKeychain_fetchItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  BOOL v5 = os_log_create("com.apple.notes", "Crypto");
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__ICKeychain_fetchItemsWithCompletionHandler___block_invoke_cold_1();
    }

    id v7 = *(id *)(a1 + 40);
    objc_sync_enter(v7);
    objc_storeStrong((id *)&lastItemsFetchError, a2);
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
    id v9 = (void *)lastItemsFetchErrorDate;
    lastItemsFetchErrorDate = v8;
    uint64_t v10 = &lastItemsFetchFetchDate;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v13 = 0;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "Fetched Keychain items", v13, 2u);
    }

    id v7 = *(id *)(a1 + 40);
    objc_sync_enter(v7);
    id v9 = (void *)lastItemsFetchError;
    lastItemsFetchError = 0;
    uint64_t v10 = &lastItemsFetchErrorDate;
  }

  id v11 = (void *)*v10;
  *uint64_t v10 = 0;

  objc_sync_exit(v7);
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v4);
  }
}

+ (void)tests_setLastItemsError:(id)a3 lastItemsErrorDate:(id)a4 lastItemsFetchDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id obj = a1;
  objc_sync_enter(obj);
  id v11 = (void *)lastItemsFetchError;
  lastItemsFetchError = (uint64_t)v8;
  id v12 = v8;

  int v13 = (void *)lastItemsFetchErrorDate;
  lastItemsFetchErrorDate = (uint64_t)v9;
  id v14 = v9;

  id v15 = (void *)lastItemsFetchFetchDate;
  lastItemsFetchFetchDate = (uint64_t)v10;

  objc_sync_exit(obj);
}

+ (id)queryForItemClass:(id)a3 forIdentifier:(id)a4 account:(id)a5 isSynced:(BOOL)a6 type:(unint64_t)a7 authenticationContext:(id)a8 returnData:(BOOL)a9 limit:(id)a10
{
  BOOL v12 = a6;
  v30[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a10;
  id v20 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v21 = *MEMORY[0x1E4F3B878];
  v29[0] = *MEMORY[0x1E4F3BD08];
  v29[1] = v21;
  uint64_t v22 = MEMORY[0x1E4F1CC28];
  if (v12) {
    uint64_t v22 = MEMORY[0x1E4F1CC38];
  }
  v30[0] = MEMORY[0x1E4F1CC38];
  v30[1] = v22;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  int v24 = (void *)[v20 initWithDictionary:v23];

  if (v16)
  {
    OSStatus v25 = (void *)MEMORY[0x1E4F3B5C0];
    if (!v12) {
      OSStatus v25 = (void *)MEMORY[0x1E4F3B850];
    }
    [v24 setObject:v16 forKeyedSubscript:*v25];
  }
  if (v15) {
    [v24 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  }
  if (v17) {
    [v24 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
  }
  if (a7)
  {
    id v26 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
    [v24 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F3B8C0]];
  }
  if (a9) {
    [v24 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC70]];
  }
  if (v19) {
    [v24 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F3BB80]];
  }
  if (v18) {
    [v24 setObject:v18 forKey:*MEMORY[0x1E4F3BCE8]];
  }
  id v27 = (void *)[v24 copy];

  return v27;
}

+ (id)accessControlObjectWithProtection:(void *)a3 flags:(unint64_t)a4 error:(id *)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (a5) {
    *a5 = 0;
  }
  CFErrorRef v19 = 0;
  SecAccessControlRef v6 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, a4, &v19);
  if (v6) {
    BOOL v7 = v19 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    id v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ICKeychain accessControlObjectWithProtection:flags:error:]((uint64_t)&v19, v8, v9, v10, v11, v12, v13, v14);
    }

    if (a5)
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28A50];
      v20[0] = *MEMORY[0x1E4F28568];
      v20[1] = v16;
      v21[0] = @"SecAccessControlCreateWithFlags() returned with an error";
      v21[1] = v19;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      *a5 = [v15 errorWithDomain:@"com.apple.notes.keychain" code:1 userInfo:v17];
    }
    if (v6)
    {
      CFRelease(v6);
      SecAccessControlRef v6 = 0;
    }
  }
  return v6;
}

+ (void)deleteItemsForIdentifier:account:isSynced:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Cannot delete items from keychain because no itemIdentifier was specified", v1, 2u);
}

+ (void)deleteItemsOfType:account:isSynced:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Cannot delete items from keychain because no type or accountIdentifier was specified", v1, 2u);
}

+ (void)isSyncAvailableForAccount:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Couldn't resolve account alt DSID", v2, v3, v4, v5, v6);
}

+ (void)isSyncAvailableForAccount:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Unexpected keychain clique status for account (%@): %lu", v4, v5, v6, v7, v8);
}

+ (void)isSyncAvailableForAccount:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Keychain syncing is not enabled for account: %@", v4, v5, v6, v7, v8);
}

+ (void)isSyncAvailableForAccount:(void *)a1 .cold.4(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Failed to fetch keychain sync status for account (%@): %@", v4, v5, v6, v7, v8);
}

+ (void)isSyncAvailableForAccount:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Failed to fetch keychain clique status for account (%@): %@", v4, v5, v6, v7, v8);
}

+ (void)isSyncAvailableForAccount:(void *)a1 .cold.6(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "iCloud keychain sync is not available for non-primary, non-local account: %@", v4, v5, v6, v7, v8);
}

+ (void)shouldFetchItemsWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Not fetching Keychain items because internet is not reachable", v2, v3, v4, v5, v6);
}

+ (void)shouldFetchItemsWithError:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Not fetching Keychain items because we fetched them recently", v2, v3, v4, v5, v6);
}

+ (void)shouldFetchItemsWithError:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Not fetching Keychain items because we encountered an error recently", v2, v3, v4, v5, v6);
}

+ (void)shouldFetchItemsWithError:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Not fetching Keychain items because it's disabled via the cloud configuration", v2, v3, v4, v5, v6);
}

+ (void)fetchItemsWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error creating control object for fetching Keychain items {error: %@}", v2, v3, v4, v5, v6);
}

+ (void)fetchItemsWithCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Fetching Keychain items…", v2, v3, v4, v5, v6);
}

void __46__ICKeychain_fetchItemsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error fetching Keychain items {error: %@}", v2, v3, v4, v5, v6);
}

+ (void)accessControlObjectWithProtection:(uint64_t)a3 flags:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end