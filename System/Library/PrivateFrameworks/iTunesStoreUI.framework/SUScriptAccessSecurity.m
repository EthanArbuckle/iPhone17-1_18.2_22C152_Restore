@interface SUScriptAccessSecurity
- (BOOL)_canAccessType:(id)a3 inFrame:(id)a4 error:(id *)a5;
- (BOOL)_canAccessType:(id)a3 withURL:(id)a4 inFrame:(id)a5 error:(id *)a6;
- (BOOL)_url:(id)a3 matchesExpressions:(id)a4;
- (BOOL)_urls:(id)a3 matchPatternStrings:(id)a4;
- (BOOL)canAccessFacebookInFrame:(id)a3 error:(id *)a4;
- (BOOL)canAccessFacebookWithURL:(id)a3 inFrame:(id)a4 error:(id *)a5;
- (BOOL)canAccessTelephonyInFrame:(id)a3 error:(id *)a4;
- (id)_accessDictionaryForType:(id)a3;
- (id)_copyResourceURLsForWebFrame:(id)a3;
@end

@implementation SUScriptAccessSecurity

- (BOOL)canAccessFacebookInFrame:(id)a3 error:(id *)a4
{
  return [(SUScriptAccessSecurity *)self _canAccessType:@"facebook" inFrame:a3 error:a4];
}

- (BOOL)canAccessFacebookWithURL:(id)a3 inFrame:(id)a4 error:(id *)a5
{
  return [(SUScriptAccessSecurity *)self _canAccessType:@"facebook" withURL:a3 inFrame:a4 error:a5];
}

- (BOOL)canAccessTelephonyInFrame:(id)a3 error:(id *)a4
{
  return [(SUScriptAccessSecurity *)self _canAccessType:@"telephony" inFrame:a3 error:a4];
}

- (id)_accessDictionaryForType:(id)a3
{
  uint64_t v4 = [MEMORY[0x263F7B358] contextWithBagType:0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F89540], "sharedCache"), "URLBagForContext:", v4), "valueForKey:", @"p2-api-access");
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id result = 0;
  if (isKindOfClass)
  {
    v8 = (void *)[v5 objectForKey:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return v8;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (BOOL)_canAccessType:(id)a3 inFrame:(id)a4 error:(id *)a5
{
  if ([(SUScriptAccessSecurity *)self _accessDictionaryForType:a3])
  {
    id v8 = [(SUScriptAccessSecurity *)self _copyResourceURLsForWebFrame:a4];
    BOOL v9 = [(SUScriptAccessSecurity *)self _urls:v8 matchPatternStrings:&unk_26DBD7CC8];

    if (!a5) {
      return v9;
    }
  }
  else
  {
    BOOL v9 = 0;
    if (!a5) {
      return v9;
    }
  }
  if (!v9) {
    *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F7B758] code:107 userInfo:0];
  }
  return v9;
}

- (BOOL)_canAccessType:(id)a3 withURL:(id)a4 inFrame:(id)a5 error:(id *)a6
{
  uint64_t v9 = (uint64_t)self;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = [(SUScriptAccessSecurity *)self _accessDictionaryForType:a3];
  if (!v10)
  {
    v14 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      int v19 = 138412290;
      uint64_t v20 = objc_opt_class();
      LODWORD(v18) = 12;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (!v9) {
        goto LABEL_13;
      }
      objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v19, v18);
      free((void *)v9);
      SSFileLog();
    }
LABEL_12:
    LOBYTE(v9) = 0;
    goto LABEL_13;
  }
  v11 = v10;
  uint64_t v12 = [v10 objectForKey:@"request-patterns"];
  if (!objc_msgSend((id)v9, "_urls:matchPatternStrings:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a4, 0), v12))goto LABEL_12; {
  v13 = (void *)[(id)v9 _copyResourceURLsForWebFrame:a5];
  }
  LOBYTE(v9) = objc_msgSend((id)v9, "_urls:matchPatternStrings:", v13, objc_msgSend(v11, "objectForKey:", @"origin-patterns"));

LABEL_13:
  if (a6 && (v9 & 1) == 0) {
    *a6 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F7B758] code:107 userInfo:0];
  }
  return v9;
}

- (id)_copyResourceURLsForWebFrame:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = (void *)[a3 dataSource];
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", objc_msgSend((id)objc_msgSend(v3, "mainResource"), "URL"), 0);
  v5 = (void *)[v3 subresources];
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
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) URL];
        if (v10) {
          [v4 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v4;
}

- (BOOL)_url:(id)a3 matchesExpressions:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = (void *)[a3 absoluteString];
  uint64_t v6 = [v5 length];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(a4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "rangeOfFirstMatchInString:options:range:", v5, 0, 0, v6) != 0x7FFFFFFFFFFFFFFFLL)
        {
          LOBYTE(v7) = 1;
          return v7;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v8 = v7;
      if (v7) {
        continue;
      }
      break;
    }
  }
  return v7;
}

- (BOOL)_urls:(id)a3 matchPatternStrings:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v8 = [a4 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(a4);
          }
          uint64_t v12 = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:*(void *)(*((void *)&v35 + 1) + 8 * i) options:1 error:0];
          if (v12)
          {
            long long v13 = (void *)v12;
            [v7 addObject:v12];
          }
        }
        uint64_t v9 = [a4 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v9);
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v14 = [a3 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v32;
      while (2)
      {
        uint64_t v18 = 0;
        uint64_t v19 = v16 + v15;
        do
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(a3);
          }
          uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * v18);
          if (![(SUScriptAccessSecurity *)self _url:v20 matchesExpressions:v7])
          {
            uint64_t v21 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
            int v22 = [v21 shouldLog];
            if ([v21 shouldLogToDisk]) {
              int v23 = v22 | 2;
            }
            else {
              int v23 = v22;
            }
            if (!os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
              v23 &= 2u;
            }
            uint64_t v19 = v16 + v18;
            if (v23)
            {
              uint64_t v24 = objc_opt_class();
              int v39 = 138412546;
              uint64_t v40 = v24;
              __int16 v41 = 2112;
              uint64_t v42 = v20;
              LODWORD(v30) = 22;
              v29 = &v39;
              uint64_t v25 = _os_log_send_and_compose_impl();
              if (v25)
              {
                v26 = (void *)v25;
                uint64_t v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v39, v30);
                free(v26);
                v29 = (int *)v27;
                SSFileLog();
              }
            }
            goto LABEL_30;
          }
          ++v18;
        }
        while (v15 != v18);
        uint64_t v15 = [a3 countByEnumeratingWithState:&v31 objects:v43 count:16];
        uint64_t v16 = v19;
        if (v15) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
LABEL_30:
  }
  else
  {
    uint64_t v19 = 0;
  }
  return v19 == objc_msgSend(a3, "count", v29);
}

@end