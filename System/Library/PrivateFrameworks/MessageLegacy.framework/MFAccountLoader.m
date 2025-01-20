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
  if (!a3) {
    return 0;
  }
  uint64_t v6 = objc_msgSend(a1, "_accountClassStringWithPersistentAccount:error:");
  if (!v6) {
    return 0;
  }
  return (Class)[a1 _accountClassForString:v6 error:a4];
}

+ (id)_accountClassStringWithPersistentAccount:(id)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  id result = (id)[a3 accountPropertyForKey:@"Class"];
  if (a4)
  {
    if (!result)
    {
      uint64_t v6 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"MFAccountLoaderErrorDomain" code:1 userInfo:0];
      id result = 0;
      *a4 = v6;
    }
  }
  return result;
}

+ (Class)_accountClassForString:(id)a3 error:(id *)a4
{
  if (!a3) {
    goto LABEL_6;
  }
  Class result = NSClassFromString((NSString *)a3);
  if (result) {
    return result;
  }
  if ([a1 loadBundleForAccountClassString:a3 error:a4])
  {
    Class result = NSClassFromString((NSString *)a3);
    if (!a4) {
      return result;
    }
  }
  else
  {
LABEL_6:
    Class result = 0;
    if (!a4) {
      return result;
    }
  }
  if (!result)
  {
    if (*a4)
    {
      return 0;
    }
    else
    {
      v8 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"MFAccountLoaderErrorDomain" code:2 userInfo:0];
      Class result = 0;
      *a4 = v8;
    }
  }
  return result;
}

+ (id)accountWithPersistentAccount:(id)a3 error:(id *)a4
{
  id result = +[MFAccountLoader accountClassForPersistentAccount:a3 error:a4];
  if (result)
  {
    uint64_t v6 = (void *)[objc_alloc((Class)result) initWithPersistentAccount:a3];
    return v6;
  }
  return result;
}

+ (BOOL)loadBundleForAccountClassString:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  uint64_t v6 = objc_msgSend(a1, "_bundlePathForAccountClassString:");
  if (!v6)
  {
    if (a4)
    {
      BOOL v8 = 0;
      *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"MFAccountLoaderErrorDomain" code:3 userInfo:0];
      return v8;
    }
    return 0;
  }
  uint64_t v7 = v6;
  objc_sync_enter(a1);
  if ([0 containsObject:v7])
  {
    BOOL v8 = 1;
  }
  else
  {
    v9 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:v7];
    if (v9 && [v9 loadAndReturnError:a4])
    {
      [0 addObject:v7];
      v10 = MFLogGeneral();
      BOOL v8 = 1;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        uint64_t v13 = v7;
        _os_log_impl(&dword_1CFCFE000, v10, OS_LOG_TYPE_INFO, "Loaded bundle at %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  objc_sync_exit(a1);
  return v8;
}

+ (id)_bundlePathForAccountClassString:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MFAccountLoader__bundlePathForAccountClassString___block_invoke;
  block[3] = &unk_1E68661B8;
  block[4] = a1;
  if (_bundlePathForAccountClassString__onceToken == -1)
  {
    if (a3) {
      return (id)[(id)_bundlePathForAccountClassString__sAccountClassToBundlePathMap objectForKey:a3];
    }
  }
  else
  {
    dispatch_once(&_bundlePathForAccountClassString__onceToken, block);
    if (a3) {
      return (id)[(id)_bundlePathForAccountClassString__sAccountClassToBundlePathMap objectForKey:a3];
    }
  }
  return 0;
}

uint64_t __52__MFAccountLoader__bundlePathForAccountClassString___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", *(void *)(a1 + 32)), "bundlePath"), "stringByAppendingPathComponent:", @"MailServices");
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", v19, 0);
  uint64_t result = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
  uint64_t v20 = result;
  if (result)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v25 + 1) + 8 * v4);
        uint64_t v6 = (void *)[v19 stringByAppendingPathComponent:v5];
        uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfFile:", objc_msgSend(v6, "stringByAppendingPathComponent:", @"Info.plist"));
        if (v7)
        {
          uint64_t v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:0];
          if (v8)
          {
            v9 = (void *)v8;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v10 = (void *)[v9 objectForKey:@"InstantiableMailAccountClasses"];
              long long v21 = 0u;
              long long v22 = 0u;
              long long v23 = 0u;
              long long v24 = 0u;
              uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v33 count:16];
              if (v11)
              {
                uint64_t v12 = v11;
                uint64_t v13 = *(void *)v22;
                do
                {
                  for (uint64_t i = 0; i != v12; ++i)
                  {
                    if (*(void *)v22 != v13) {
                      objc_enumerationMutation(v10);
                    }
                    uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
                    if ([v2 objectForKey:v15])
                    {
                      v16 = MFLogGeneral();
                      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        uint64_t v30 = v5;
                        __int16 v31 = 2112;
                        uint64_t v32 = v15;
                        _os_log_error_impl(&dword_1CFCFE000, v16, OS_LOG_TYPE_ERROR, "Ignoring MailServices bundle %@ for %@", buf, 0x16u);
                      }
                    }
                    else
                    {
                      [v2 setObject:v6 forKey:v15];
                    }
                  }
                  uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v33 count:16];
                }
                while (v12);
              }
            }
          }
        }
        ++v4;
      }
      while (v4 != v20);
      uint64_t result = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
      uint64_t v20 = result;
    }
    while (result);
  }
  _bundlePathForAccountClassString__sAccountClassToBundlePathMap = (uint64_t)v2;
  return result;
}

+ (id)accountWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  v12[6] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F177C0];
  v11[0] = *MEMORY[0x1E4F17740];
  v11[1] = v6;
  v12[0] = @"AOLAccount";
  v12[1] = @"GmailAccount";
  uint64_t v7 = *MEMORY[0x1E4F177E8];
  v11[2] = *MEMORY[0x1E4F17878];
  v11[3] = v7;
  v12[2] = @"YahooAccount";
  v12[3] = @"IMAPAccount";
  uint64_t v8 = *MEMORY[0x1E4F17850];
  v11[4] = *MEMORY[0x1E4F17830];
  v11[5] = v8;
  v12[4] = @"POPAccount";
  v12[5] = @"SMTPAccount";
  v9 = (objc_class *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, v11, 6), "objectForKeyedSubscript:", a3);
  if (v9)
  {
    v9 = (objc_class *)[a1 _accountClassForString:v9 error:a4];
    if (v9) {
      v9 = (objc_class *)objc_alloc_init(v9);
    }
  }
  return v9;
}

@end