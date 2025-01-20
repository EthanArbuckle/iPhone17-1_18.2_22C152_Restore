@interface MFAccountLoader
+ (BOOL)loadBundleForAccountClassString:(id)a3 error:(id *)a4;
+ (Class)_accountClassForString:(id)a3 error:(id *)a4;
+ (Class)accountClassForPersistentAccount:(id)a3 error:(id *)a4;
+ (id)_accountClassStringWithPersistentAccount:(id)a3 error:(id *)a4;
+ (id)_bundlePathForAccountClassString:(id)a3;
+ (id)accountWithAccountTypeIdentifier:(id)a3 error:(id *)a4;
+ (id)accountWithPersistentAccount:(id)a3 error:(id *)a4;
@end

@implementation MFAccountLoader

+ (Class)accountClassForPersistentAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [a1 _accountClassStringWithPersistentAccount:v6 error:a4];
    if (v7) {
      v8 = (void *)[a1 _accountClassForString:v7 error:a4];
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

+ (id)_accountClassStringWithPersistentAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 accountPropertyForKey:@"Class"];
    v8 = (void *)v7;
    if (a4 && !v7)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"MFAccountLoaderErrorDomain" code:1 userInfo:0];
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (Class)_accountClassForString:(id)a3 error:(id *)a4
{
  id v6 = (NSString *)a3;
  uint64_t v7 = v6;
  if (!v6)
  {
LABEL_5:
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_6;
  }
  id v6 = (NSString *)NSClassFromString(v6);
  if (v6) {
    goto LABEL_12;
  }
  if ([a1 loadBundleForAccountClassString:v7 error:a4])
  {
    id v6 = (NSString *)NSClassFromString(v7);
    goto LABEL_5;
  }
  id v6 = 0;
  if (!a4) {
    goto LABEL_12;
  }
LABEL_6:
  if (!v6)
  {
    if (*a4)
    {
      id v6 = 0;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MFAccountLoaderErrorDomain" code:2 userInfo:0];
      id v6 = 0;
      *a4 = v8;
    }
  }
LABEL_12:
  v9 = v6;

  return v9;
}

+ (id)accountWithPersistentAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[MFAccountLoader accountClassForPersistentAccount:v5 error:a4];
  if (v6) {
    uint64_t v7 = (void *)[[v6 alloc] initWithPersistentAccount:v5];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (BOOL)loadBundleForAccountClassString:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [a1 _bundlePathForAccountClassString:v6];
    if (v7)
    {
      id v8 = a1;
      objc_sync_enter(v8);
      if ([0 containsObject:v7])
      {
        BOOL v9 = 1;
      }
      else
      {
        v10 = [MEMORY[0x1E4F28B50] bundleWithPath:v7];
        v11 = v10;
        if (v10 && [v10 loadAndReturnError:a4])
        {
          [0 addObject:v7];
          v12 = MFLogGeneral();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            int v14 = 138412290;
            v15 = v7;
            _os_log_impl(&dword_1A7EFF000, v12, OS_LOG_TYPE_INFO, "Loaded bundle at %@", (uint8_t *)&v14, 0xCu);
          }

          BOOL v9 = 1;
        }
        else
        {
          BOOL v9 = 0;
        }
      }
      objc_sync_exit(v8);
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"MFAccountLoaderErrorDomain" code:3 userInfo:0];
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)_bundlePathForAccountClassString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MFAccountLoader__bundlePathForAccountClassString___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bundlePathForAccountClassString__onceToken == -1)
  {
    if (v4)
    {
LABEL_3:
      id v6 = [(id)_bundlePathForAccountClassString__sAccountClassToBundlePathMap objectForKey:v5];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&_bundlePathForAccountClassString__onceToken, block);
    if (v5) {
      goto LABEL_3;
    }
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

void __52__MFAccountLoader__bundlePathForAccountClassString___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];
  id v4 = [v3 bundlePath];
  v28 = [v4 stringByAppendingPathComponent:@"MailServices"];

  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v5 contentsOfDirectoryAtPath:v28 error:0];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v7)
  {
    uint64_t v27 = *(void *)v36;
    do
    {
      uint64_t v29 = v7;
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        v10 = [v28 stringByAppendingPathComponent:v9];
        v11 = (void *)MEMORY[0x1E4F1C9B8];
        v12 = [v10 stringByAppendingPathComponent:@"Info.plist"];
        uint64_t v30 = [v11 dataWithContentsOfFile:v12];

        v13 = (void *)v30;
        if (v30)
        {
          int v14 = [MEMORY[0x1E4F28F98] propertyListWithData:v30 options:0 format:0 error:0];
          if (v14)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [v14 objectForKey:@"InstantiableMailAccountClasses"];
              long long v33 = 0u;
              long long v34 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              id v16 = v15;
              v25 = v14;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v43 count:16];
              if (v17)
              {
                uint64_t v18 = *(void *)v32;
                do
                {
                  for (uint64_t j = 0; j != v17; ++j)
                  {
                    if (*(void *)v32 != v18) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * j);
                    v21 = [v2 objectForKey:v20];
                    BOOL v22 = v21 == 0;

                    if (v22)
                    {
                      [v2 setObject:v10 forKey:v20];
                    }
                    else
                    {
                      v23 = MFLogGeneral();
                      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        uint64_t v40 = v9;
                        __int16 v41 = 2112;
                        uint64_t v42 = v20;
                        _os_log_error_impl(&dword_1A7EFF000, v23, OS_LOG_TYPE_ERROR, "Ignoring MailServices bundle %@ for %@", buf, 0x16u);
                      }
                    }
                  }
                  uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v43 count:16];
                }
                while (v17);
              }

              int v14 = v25;
            }
          }

          v13 = (void *)v30;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v7);
  }

  v24 = (void *)_bundlePathForAccountClassString__sAccountClassToBundlePathMap;
  _bundlePathForAccountClassString__sAccountClassToBundlePathMap = (uint64_t)v2;
}

+ (id)accountWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  v16[6] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F177C0];
  v15[0] = *MEMORY[0x1E4F17740];
  v15[1] = v7;
  v16[0] = @"AOLAccount";
  v16[1] = @"GmailAccount";
  uint64_t v8 = *MEMORY[0x1E4F177E8];
  v15[2] = *MEMORY[0x1E4F17878];
  v15[3] = v8;
  v16[2] = @"YahooAccount";
  v16[3] = @"IMAPAccount";
  uint64_t v9 = *MEMORY[0x1E4F17850];
  v15[4] = *MEMORY[0x1E4F17830];
  v15[5] = v9;
  v16[4] = @"POPAccount";
  v16[5] = @"SMTPAccount";
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];
  v11 = [v10 objectForKeyedSubscript:v6];
  if (v11 && (v12 = (objc_class *)[a1 _accountClassForString:v11 error:a4]) != 0) {
    id v13 = objc_alloc_init(v12);
  }
  else {
    id v13 = 0;
  }

  return v13;
}

@end