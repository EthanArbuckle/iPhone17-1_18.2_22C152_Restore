@interface SULoadSectionsOperation
- (BOOL)_loadSectionsFromCacheForVersion:(id)a3;
- (BOOL)_loadSectionsFromNetworkWithDictionary:(id)a3;
- (BOOL)shouldUseCache;
- (NSString)activeSectionVersionString;
- (SULoadSectionsOperation)init;
- (SULoadSectionsOperation)initWithClientInterface:(id)a3;
- (SUSectionsResponse)sectionsResponse;
- (id)_cachePathForVersion:(id)a3 create:(BOOL)a4;
- (void)_setSectionsResponse:(id)a3;
- (void)_writeSectionsResponseToCache:(id)a3 forVersion:(id)a4;
- (void)dealloc;
- (void)run;
- (void)setActiveSectionVersionString:(id)a3;
- (void)setShouldUseCache:(BOOL)a3;
@end

@implementation SULoadSectionsOperation

- (SULoadSectionsOperation)init
{
  id v3 = +[SUClientDispatch clientInterface];

  return [(SULoadSectionsOperation *)self initWithClientInterface:v3];
}

- (SULoadSectionsOperation)initWithClientInterface:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SULoadSectionsOperation;
  v4 = [(SULoadSectionsOperation *)&v6 init];
  if (v4)
  {
    v4->_clientInterface = (SUClientInterface *)a3;
    v4->_shouldUseCache = 1;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SULoadSectionsOperation;
  [(SULoadSectionsOperation *)&v3 dealloc];
}

- (NSString)activeSectionVersionString
{
  [(SULoadSectionsOperation *)self lock];
  objc_super v3 = self->_activeSectionVersionString;
  [(SULoadSectionsOperation *)self unlock];
  return v3;
}

- (SUSectionsResponse)sectionsResponse
{
  [(SULoadSectionsOperation *)self lock];
  objc_super v3 = self->_sectionsResponse;
  [(SULoadSectionsOperation *)self unlock];
  return v3;
}

- (void)setActiveSectionVersionString:(id)a3
{
  [(SULoadSectionsOperation *)self lock];
  activeSectionVersionString = self->_activeSectionVersionString;
  if (activeSectionVersionString != a3)
  {

    self->_activeSectionVersionString = (NSString *)[a3 copy];
  }

  [(SULoadSectionsOperation *)self unlock];
}

- (void)setShouldUseCache:(BOOL)a3
{
  [(SULoadSectionsOperation *)self lock];
  self->_shouldUseCache = a3;

  [(SULoadSectionsOperation *)self unlock];
}

- (BOOL)shouldUseCache
{
  [(SULoadSectionsOperation *)self lock];
  BOOL shouldUseCache = self->_shouldUseCache;
  [(SULoadSectionsOperation *)self unlock];
  return shouldUseCache;
}

- (void)run
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v34 = 0;
  uint64_t v3 = [MEMORY[0x263F7B358] contextWithBagType:0];
  if ([(SULoadSectionsOperation *)self loadURLBagWithContext:v3 returningError:&v34])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      int v35 = 138412546;
      uint64_t v36 = v8;
      __int16 v37 = 2048;
      double v38 = Current;
      LODWORD(v33) = 22;
      v31 = &v35;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v35, v33);
        free(v10);
        v31 = (int *)v11;
        SSFileLog();
      }
    }
    v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F89540], "sharedCache", v31), "URLBagForContext:", v3), "valueForKey:", @"mobile-tab-bars");
    objc_opt_class();
    BOOL v15 = (objc_opt_isKindOfClass() & 1) == 0
       || (v13 = [(SUClientInterface *)self->_clientInterface clientIdentifier]) == 0
       || (uint64_t v14 = [v12 objectForKey:v13]) == 0
       || [(SULoadSectionsOperation *)self _loadSectionsFromNetworkWithDictionary:v14];
    double v23 = CFAbsoluteTimeGetCurrent();
    v24 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v25 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      int v26 = v25 | 2;
    }
    else {
      int v26 = v25;
    }
    if (!os_log_type_enabled((os_log_t)[v24 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v26 &= 2u;
    }
    if (v26)
    {
      uint64_t v27 = objc_opt_class();
      int v35 = 138412802;
      uint64_t v36 = v27;
      __int16 v37 = 2048;
      double v38 = v23;
      __int16 v39 = 2048;
      double v40 = v23 - Current;
      LODWORD(v33) = 32;
      v32 = &v35;
      uint64_t v28 = _os_log_send_and_compose_impl();
      if (v28)
      {
        v29 = (void *)v28;
        uint64_t v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v35, v33);
        free(v29);
        v32 = (int *)v30;
        SSFileLog();
      }
    }
  }
  else
  {
    v16 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    if (!os_log_type_enabled((os_log_t)[v16 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v18 &= 2u;
    }
    if (v18)
    {
      uint64_t v19 = objc_opt_class();
      int v35 = 138412290;
      uint64_t v36 = v19;
      LODWORD(v33) = 12;
      v31 = &v35;
      uint64_t v20 = _os_log_send_and_compose_impl();
      if (v20)
      {
        v21 = (void *)v20;
        uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v35, v33);
        free(v21);
        v31 = (int *)v22;
        SSFileLog();
      }
    }
    -[SULoadSectionsOperation setError:](self, "setError:", v34, v31);
    BOOL v15 = 0;
  }
  -[SULoadSectionsOperation setSuccess:](self, "setSuccess:", v15, v32);
}

- (id)_cachePathForVersion:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[SUSectionsResponse sectionsCacheDirectory];
  if (!v6) {
    return 0;
  }
  int v7 = (void *)[v6 stringByAppendingPathComponent:a3];
  if (v4 && ![MEMORY[0x263F08850] ensureDirectoryExists:v7]) {
    return 0;
  }
  return v7;
}

- (BOOL)_loadSectionsFromCacheForVersion:(id)a3
{
  id v4 = [(SULoadSectionsOperation *)self _cachePathForVersion:a3 create:0];
  if (!v4) {
    return 0;
  }
  v5 = [[SUSectionsResponse alloc] initWithClientInterface:self->_clientInterface cacheDirectory:v4];
  [(SULoadSectionsOperation *)self _setSectionsResponse:v5];
  BOOL v6 = v5 != 0;
  if (v5) {
    +[SUSectionsResponse setLastCachedVersionIdentifier:[(SUSectionsResponse *)v5 versionString]];
  }

  return v6;
}

- (BOOL)_loadSectionsFromNetworkWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v5 = (void *)[a3 objectForKey:@"version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)[v5 stringValue];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_9;
    }
  }
  if (!v5)
  {
LABEL_9:
    BOOL v6 = 0;
    goto LABEL_11;
  }
  if ([(SULoadSectionsOperation *)self shouldUseCache])
  {
    BOOL v6 = 1;
    if ([(SULoadSectionsOperation *)self _loadSectionsFromCacheForVersion:v5]) {
      return v6;
    }
  }
  else
  {
    BOOL v6 = 1;
  }
LABEL_11:
  int v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v44 = 138412290;
    uint64_t v45 = objc_opt_class();
    LODWORD(v40) = 12;
    double v38 = &v44;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v44, v40);
      free(v11);
      double v38 = (int *)v12;
      SSFileLog();
    }
  }
  uint64_t v13 = objc_msgSend(a3, "objectForKey:", @"url", v38);
  if (v13)
  {
    uint64_t v14 = [objc_alloc(NSURL) initWithString:v13];
    if (v14)
    {
      BOOL v15 = (void *)v14;
      v16 = [[SULoadNetworkSectionsOperation alloc] initWithURL:v14 clientInterface:self->_clientInterface];
      [(SULoadNetworkSectionsOperation *)v16 setExpectedVersionString:v5];
      uint64_t v43 = 0;
      if ([(SULoadSectionsOperation *)self runSubOperation:v16 returningError:&v43])
      {
        int v17 = [(SULoadNetworkSectionsOperation *)v16 sectionsResponse];
        int v18 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
        v42 = [(SUSectionsResponse *)v17 versionString];
        if ([(NSString *)v42 isEqualToString:+[SUSectionsResponse lastCachedVersionIdentifier]])
        {
          uint64_t v19 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
          int v20 = [v19 shouldLog];
          if ([v19 shouldLogToDisk]) {
            v20 |= 2u;
          }
          if (os_log_type_enabled((os_log_t)[v19 OSLogObject], OS_LOG_TYPE_DEBUG)) {
            int v21 = v20;
          }
          else {
            int v21 = v20 & 2;
          }
          if (v21)
          {
            uint64_t v22 = objc_opt_class();
            int v44 = 138412290;
            uint64_t v45 = v22;
            LODWORD(v40) = 12;
            __int16 v39 = &v44;
            uint64_t v23 = _os_log_send_and_compose_impl();
            if (v23)
            {
              v24 = (void *)v23;
              uint64_t v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v44, v40);
              free(v24);
              __int16 v39 = (int *)v25;
              SSFileLog();
            }
          }
          -[SUSectionsResponse setShouldResetUserOrdering:](v17, "setShouldResetUserOrdering:", 0, v39);
          int v26 = v42;
        }
        else
        {
          uint64_t v27 = [(SUSectionsResponse *)v17 shouldResetUserOrdering];
          uint64_t v28 = (void *)[v18 stringForKey:@"SULastSectionsStoreFront"];
          uint64_t v29 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B148], "currentDevice"), "storeFrontIdentifier");
          uint64_t v41 = v29;
          if (v28 && ([v28 isEqualToString:v29] & 1) == 0)
          {
            uint64_t v30 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
            int v31 = [v30 shouldLog];
            if ([v30 shouldLogToDisk]) {
              v31 |= 2u;
            }
            if (os_log_type_enabled((os_log_t)[v30 OSLogObject], OS_LOG_TYPE_DEBUG)) {
              int v32 = v31;
            }
            else {
              int v32 = v31 & 2;
            }
            if (v32)
            {
              uint64_t v33 = objc_opt_class();
              int v44 = 138412290;
              uint64_t v45 = v33;
              LODWORD(v40) = 12;
              __int16 v39 = &v44;
              uint64_t v34 = _os_log_send_and_compose_impl();
              if (v34)
              {
                int v35 = (void *)v34;
                uint64_t v36 = objc_msgSend(NSString, "stringWithCString:encoding:", v34, 4, &v44, v40);
                free(v35);
                __int16 v39 = (int *)v36;
                SSFileLog();
              }
            }
            uint64_t v27 = 1;
          }
          -[SUSectionsResponse setShouldResetUserOrdering:](v17, "setShouldResetUserOrdering:", v27, v39);
          int v26 = v42;
          if (v42) {
            +[SUSectionsResponse setLastCachedVersionIdentifier:v42];
          }
          if (v41) {
            [v18 setObject:v41 forKey:@"SULastSectionsStoreFront"];
          }
          [v18 synchronize];
        }
        [(SULoadSectionsOperation *)self _setSectionsResponse:v17];
        if ([(NSArray *)[(SUSectionsResponse *)v17 allSections] count])
        {
          if ((v6 & [(SUSectionsResponse *)v17 isCacheable]) == 1
            && (!v26 || [v5 isEqualToString:v26]))
          {
            [(SULoadSectionsOperation *)self _writeSectionsResponseToCache:v17 forVersion:v5];
          }
          LOBYTE(v6) = 1;
          goto LABEL_57;
        }
      }
      else
      {
        [(SULoadSectionsOperation *)self setError:v43];
      }
      LOBYTE(v6) = 0;
LABEL_57:

      return v6;
    }
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (void)_setSectionsResponse:(id)a3
{
  [(SULoadSectionsOperation *)self lock];
  sectionsResponse = self->_sectionsResponse;
  if (sectionsResponse != a3)
  {

    self->_sectionsResponse = (SUSectionsResponse *)a3;
  }

  [(SULoadSectionsOperation *)self unlock];
}

- (void)_writeSectionsResponseToCache:(id)a3 forVersion:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263F08850]);
  int v26 = self;
  BOOL v6 = [(SULoadSectionsOperation *)self activeSectionVersionString];
  id v7 = +[SUSectionsResponse sectionsCacheDirectory];
  uint64_t v27 = v5;
  int v8 = (void *)[v5 contentsOfDirectoryAtPath:v7 error:0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (([v13 isEqualToString:v6] & 1) == 0)
        {
          uint64_t v14 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
          int v15 = [v14 shouldLog];
          if ([v14 shouldLogToDisk]) {
            int v16 = v15 | 2;
          }
          else {
            int v16 = v15;
          }
          if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_DEBUG)) {
            v16 &= 2u;
          }
          if (v16)
          {
            uint64_t v17 = objc_opt_class();
            int v32 = 138412546;
            uint64_t v33 = v17;
            __int16 v34 = 2112;
            int v35 = v13;
            LODWORD(v23) = 22;
            uint64_t v22 = &v32;
            uint64_t v18 = _os_log_send_and_compose_impl();
            if (v18)
            {
              uint64_t v19 = (void *)v18;
              uint64_t v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v32, v23);
              free(v19);
              uint64_t v22 = (int *)v20;
              SSFileLog();
            }
          }
          objc_msgSend(v27, "removeItemAtPath:error:", objc_msgSend(v7, "stringByAppendingPathComponent:", v13, v22), 0);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v10);
  }
  uint64_t v21 = [(SULoadSectionsOperation *)v26 _cachePathForVersion:a4 create:1];
  if (v21) {
    [a3 writeToCacheDirectory:v21 error:0];
  }
}

@end