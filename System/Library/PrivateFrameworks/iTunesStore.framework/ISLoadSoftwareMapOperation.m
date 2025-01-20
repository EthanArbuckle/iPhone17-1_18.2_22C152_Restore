@interface ISLoadSoftwareMapOperation
- (id)uniqueKey;
- (void)run;
@end

@implementation ISLoadSoftwareMapOperation

- (void)run
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (+[ISSoftwareMap currentMapIsValid])
  {
    [(ISOperation *)self setSuccess:1];
  }
  else
  {
    v3 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v3) {
      v3 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_INFO)) {
      v5 &= 2u;
    }
    if (v5)
    {
      int v26 = 138412290;
      uint64_t v27 = objc_opt_class();
      LODWORD(v25) = 12;
      v23 = &v26;
      uint64_t v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        v7 = (void *)v6;
        uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v6, 4, &v26, v25);
        free(v7);
        v23 = (int *)v8;
        SSFileLog();
      }
    }
    v9 = objc_alloc_init(ISSoftwareMap);
    uint64_t v10 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    v11 = (void *)v10;
    if (v9)
    {
      if (!v10) {
        v11 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v12 = objc_msgSend(v11, "shouldLog", v23);
      if ([v11 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_INFO)) {
        v13 &= 2u;
      }
      if (v13)
      {
        uint64_t v14 = objc_opt_class();
        int v26 = 138412290;
        uint64_t v27 = v14;
        LODWORD(v25) = 12;
        v24 = &v26;
        uint64_t v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          v16 = (void *)v15;
          uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v26, v25);
          free(v16);
          v24 = (int *)v17;
          SSFileLog();
        }
      }
      +[ISSoftwareMap setCurrentMap:](ISSoftwareMap, "setCurrentMap:", v9, v24);
      [(ISOperation *)self setSuccess:1];
    }
    else
    {
      if (!v10) {
        v11 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v18 = objc_msgSend(v11, "shouldLog", v23);
      if ([v11 shouldLogToDisk]) {
        int v19 = v18 | 2;
      }
      else {
        int v19 = v18;
      }
      if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v19 &= 2u;
      }
      if (v19)
      {
        uint64_t v20 = objc_opt_class();
        int v26 = 138412290;
        uint64_t v27 = v20;
        LODWORD(v25) = 12;
        uint64_t v21 = _os_log_send_and_compose_impl();
        if (v21)
        {
          v22 = (void *)v21;
          objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v26, v25);
          free(v22);
          SSFileLog();
        }
      }
    }
  }
}

- (id)uniqueKey
{
  return @"com.apple.iTunesStore.SoftwareMap";
}

@end