@interface ISPersonalizeOffersOperation
- (BOOL)_runWithURLDictionary:(id)a3 error:(id *)a4;
- (ISPersonalizeOffersOperation)initWithPersonalizeOffersRequest:(id)a3;
- (ISPersonalizeOffersRequest)personalizeOffersReqeust;
- (SSPersonalizeOffersResponse)response;
- (id)_copyResponseForURL:(id)a3 requestString:(id)a4 error:(id *)a5;
- (void)_addDictionaryToResponse:(id)a3;
- (void)dealloc;
- (void)run;
@end

@implementation ISPersonalizeOffersOperation

- (ISPersonalizeOffersOperation)initWithPersonalizeOffersRequest:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ISPersonalizeOffersOperation;
  v4 = [(ISOperation *)&v6 init];
  if (v4) {
    v4->_request = (ISPersonalizeOffersRequest *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISPersonalizeOffersOperation;
  [(ISPersonalizeOffersOperation *)&v3 dealloc];
}

- (ISPersonalizeOffersRequest)personalizeOffersReqeust
{
  v2 = (void *)[(ISPersonalizeOffersRequest *)self->_request copy];

  return (ISPersonalizeOffersRequest *)v2;
}

- (SSPersonalizeOffersResponse)response
{
  [(ISOperation *)self lock];
  objc_super v3 = self->_response;
  [(ISOperation *)self unlock];
  return v3;
}

- (void)run
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  if ([(ISPersonalizeOffersRequest *)self->_request accountIdentifier])
  {
    uint64_t v3 = [MEMORY[0x263F7B358] contextWithBagType:0];
    if ([(ISOperation *)self loadURLBagWithContext:v3 returningError:&v25])
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(+[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache"), "URLBagForContext:", v3), "valueForKey:", @"personalized-buy-buttons");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v5 = [(ISPersonalizeOffersOperation *)self _runWithURLDictionary:v4 error:&v25];
        goto LABEL_37;
      }
      v16 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v16) {
        v16 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
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
      if (!v18)
      {
LABEL_36:
        BOOL v5 = 0;
        goto LABEL_37;
      }
      uint64_t v19 = objc_opt_class();
      int v26 = 138412546;
      uint64_t v27 = v19;
      __int16 v28 = 2112;
      v29 = @"personalized-buy-buttons";
      LODWORD(v24) = 22;
      v23 = &v26;
    }
    else
    {
      v12 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v12) {
        v12 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v13 = [v12 shouldLog];
      if ([v12 shouldLogToDisk]) {
        int v14 = v13 | 2;
      }
      else {
        int v14 = v13;
      }
      if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v14 &= 2u;
      }
      if (!v14) {
        goto LABEL_36;
      }
      uint64_t v15 = objc_opt_class();
      int v26 = 138412546;
      uint64_t v27 = v15;
      __int16 v28 = 2112;
      v29 = (__CFString *)v25;
      LODWORD(v24) = 22;
      v23 = &v26;
    }
    uint64_t v20 = _os_log_send_and_compose_impl();
    if (v20)
    {
      v21 = (void *)v20;
      uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v26, v24);
      free(v21);
      v23 = (int *)v22;
      SSFileLog();
    }
    goto LABEL_36;
  }
  objc_super v6 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v6) {
    objc_super v6 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (v8)
  {
    int v26 = 138412290;
    uint64_t v27 = objc_opt_class();
    LODWORD(v24) = 12;
    v23 = &v26;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (void *)v9;
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v26, v24);
      free(v10);
      v23 = (int *)v11;
      SSFileLog();
    }
  }
  BOOL v5 = 0;
  uint64_t v25 = SSError();
LABEL_37:
  -[ISOperation setError:](self, "setError:", v25, v23);
  [(ISOperation *)self setSuccess:v5];
}

- (void)_addDictionaryToResponse:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  [(ISOperation *)self lock];
  if (!self->_response) {
    self->_response = (SSPersonalizeOffersResponse *)objc_alloc_init(MEMORY[0x263F7B2B0]);
  }
  BOOL v5 = (void *)[a3 objectForKey:@"owns-data"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v11 = [v5 objectForKey:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(SSPersonalizeOffersResponse *)self->_response setActionParameters:v11 forItemIdentifier:v10];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = [a3 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(a3);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        uint64_t v17 = [a3 objectForKey:v16];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v16 rangeOfString:@"action-display-name-" options:8])
            {
              if (![v16 rangeOfString:@"button-text-" options:8])
              {
                uint64_t v20 = (void *)[v16 substringFromIndex:v19];
                if ([v20 length]) {
                  [(SSPersonalizeOffersResponse *)self->_response setPriceDisplayString:v17 forItemType:v20];
                }
              }
            }
            else
            {
              v21 = (void *)[v16 substringFromIndex:v18];
              if ([v21 length]) {
                [(SSPersonalizeOffersResponse *)self->_response setActionDisplayNameString:v17 forItemType:v21];
              }
            }
          }
        }
      }
      uint64_t v13 = [a3 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v13);
  }
  [(ISOperation *)self unlock];
}

- (id)_copyResponseForURL:(id)a3 requestString:(id)a4 error:(id *)a5
{
  uint64_t v15 = 0;
  uint64_t v9 = objc_alloc_init(ISStoreURLOperation);
  uint64_t v10 = objc_alloc_init(ISJSONDataProvider);
  [(ISURLOperation *)v9 setDataProvider:v10];
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F7B120]), "initWithAccountIdentifier:", -[ISPersonalizeOffersRequest accountIdentifier](self->_request, "accountIdentifier"));
  [(ISURLOperation *)v9 setAuthenticationContext:v11];

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F7B290]) initWithURL:a3];
  objc_msgSend(v12, "setHTTPBody:", objc_msgSend(a4, "dataUsingEncoding:", 4));
  [v12 setHTTPMethod:@"POST"];
  [(ISURLOperation *)v9 setRequestProperties:v12];

  [(ISOperation *)self runSubOperation:v9 returningError:&v15];
  id v13 = [(ISDataProvider *)v10 output];

  if (a5) {
    *a5 = v15;
  }
  return v13;
}

- (BOOL)_runWithURLDictionary:(id)a3 error:(id *)a4
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v66 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v69 = self;
  BOOL v5 = [(ISPersonalizeOffersRequest *)self->_request allItemTypes];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v78 objects:v87 count:16];
  unint64_t v7 = 0x263F08000uLL;
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v79 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v78 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(a3, "objectForKey:", v11, v60, v63);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 length])
        {
          id v13 = (id)[v66 objectForKey:v12];
          if (!v13)
          {
            id v13 = (id)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"ids="];
            [v66 setObject:v13 forKey:v12];
          }
          id v14 = [(ISPersonalizeOffersRequest *)v69->_request itemIdentifiersForItemType:v11];
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v74 objects:v83 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v75;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v75 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v74 + 1) + 8 * j);
                if ((unint64_t)[v13 length] >= 5) {
                  [v13 appendString:@","];
                }
                [v13 appendString:v19];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v74 objects:v83 count:16];
            }
            while (v16);
          }

          unint64_t v7 = 0x263F08000;
        }
        else
        {
          uint64_t v20 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
          if (!v20) {
            uint64_t v20 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
          }
          int v21 = [v20 shouldLog];
          if ([v20 shouldLogToDisk]) {
            int v22 = v21 | 2;
          }
          else {
            int v22 = v21;
          }
          if (os_log_type_enabled((os_log_t)[v20 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
            int v23 = v22;
          }
          else {
            int v23 = v22 & 2;
          }
          if (v23)
          {
            uint64_t v24 = objc_opt_class();
            *(_DWORD *)v84 = 138412546;
            *(void *)&v84[4] = v24;
            __int16 v85 = 2112;
            uint64_t v86 = v11;
            LODWORD(v63) = 22;
            v60 = v84;
            uint64_t v25 = _os_log_send_and_compose_impl();
            if (v25)
            {
              long long v26 = (void *)v25;
              uint64_t v27 = objc_msgSend(*(id *)(v7 + 2880), "stringWithCString:encoding:", v25, 4, v84, v63);
              free(v26);
              v60 = (unsigned char *)v27;
              SSFileLog();
            }
          }
        }
      }
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v78 objects:v87 count:16];
    }
    while (v8);
  }
  long long v28 = objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", v60);
  if (!v28) {
    long long v28 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v29 = [v28 shouldLog];
  if ([v28 shouldLogToDisk]) {
    int v30 = v29 | 2;
  }
  else {
    int v30 = v29;
  }
  if (os_log_type_enabled((os_log_t)[v28 OSLogObject], OS_LOG_TYPE_INFO)) {
    int v31 = v30;
  }
  else {
    int v31 = v30 & 2;
  }
  uint64_t v32 = v66;
  v33 = v69;
  if (v31)
  {
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = [v66 count];
    *(_DWORD *)v84 = 138412546;
    *(void *)&v84[4] = v34;
    __int16 v85 = 2048;
    uint64_t v86 = v35;
    LODWORD(v63) = 22;
    v61 = v84;
    uint64_t v36 = _os_log_send_and_compose_impl();
    if (v36)
    {
      v37 = (void *)v36;
      uint64_t v38 = objc_msgSend(NSString, "stringWithCString:encoding:", v36, 4, v84, v63);
      free(v37);
      v61 = (unsigned char *)v38;
      SSFileLog();
    }
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v39 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v70, v82, 16, v61);
  if (v39)
  {
    uint64_t v40 = v39;
    unint64_t v41 = 0;
    v68 = 0;
    uint64_t v42 = *(void *)v71;
    do
    {
      for (uint64_t k = 0; k != v40; ++k)
      {
        if (*(void *)v71 != v42) {
          objc_enumerationMutation(v32);
        }
        uint64_t v44 = *(void *)(*((void *)&v70 + 1) + 8 * k);
        uint64_t v45 = [objc_alloc(NSURL) initWithString:v44];
        if (v45)
        {
          v46 = (void *)v45;
          *(void *)v84 = 0;
          id v47 = -[ISPersonalizeOffersOperation _copyResponseForURL:requestString:error:](v33, "_copyResponseForURL:requestString:error:", v45, [v32 objectForKey:v44], v84);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(ISPersonalizeOffersOperation *)v33 _addDictionaryToResponse:v47];
          }
          else
          {
            ++v41;
            v56 = v68;
            if (!v68) {
              v56 = *(void **)v84;
            }
            v68 = v56;
          }
        }
        else
        {
          v48 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
          if (!v48) {
            v48 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
          }
          int v49 = objc_msgSend(v48, "shouldLog", v62, v63);
          if ([v48 shouldLogToDisk]) {
            int v50 = v49 | 2;
          }
          else {
            int v50 = v49;
          }
          if (os_log_type_enabled((os_log_t)[v48 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
            int v51 = v50;
          }
          else {
            int v51 = v50 & 2;
          }
          if (v51)
          {
            uint64_t v52 = objc_opt_class();
            *(_DWORD *)v84 = 138412546;
            *(void *)&v84[4] = v52;
            __int16 v85 = 2112;
            uint64_t v86 = v44;
            LODWORD(v63) = 22;
            v62 = v84;
            uint64_t v53 = _os_log_send_and_compose_impl();
            if (v53)
            {
              v54 = (void *)v53;
              uint64_t v55 = objc_msgSend(NSString, "stringWithCString:encoding:", v53, 4, v84, v63);
              free(v54);
              v62 = (unsigned char *)v55;
              SSFileLog();
            }
          }
          ++v41;
          uint64_t v32 = v66;
          v33 = v69;
        }
      }
      uint64_t v40 = [v32 countByEnumeratingWithState:&v70 objects:v82 count:16];
    }
    while (v40);
    if (v41) {
      BOOL v57 = v41 < [v32 count];
    }
    else {
      BOOL v57 = 1;
    }
    v58 = v68;
  }
  else
  {
    v58 = 0;
    BOOL v57 = 1;
  }

  if (a4) {
    *a4 = v58;
  }
  return v57;
}

@end