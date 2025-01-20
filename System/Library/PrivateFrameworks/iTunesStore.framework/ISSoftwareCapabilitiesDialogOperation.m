@interface ISSoftwareCapabilitiesDialogOperation
- (ISSoftwareCapabilitiesDialogOperation)initWithRequiredCapabilities:(id)a3 mismatches:(id)a4;
- (NSDictionary)mismatches;
- (id)requiredCapabilities;
- (void)_postDefaultDialog;
- (void)dealloc;
- (void)run;
@end

@implementation ISSoftwareCapabilitiesDialogOperation

- (ISSoftwareCapabilitiesDialogOperation)initWithRequiredCapabilities:(id)a3 mismatches:(id)a4
{
  __ISRecordSPIClassUsage(self);
  v7 = [(ISOperation *)self init];
  if (v7)
  {
    v7->_mismatches = (NSDictionary *)[a4 copy];
    v7->_requiredCapabilities = (id)[a3 copy];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISSoftwareCapabilitiesDialogOperation;
  [(ISSoftwareCapabilitiesDialogOperation *)&v3 dealloc];
}

- (NSDictionary)mismatches
{
  v2 = self->_mismatches;

  return v2;
}

- (id)requiredCapabilities
{
  id v2 = self->_requiredCapabilities;

  return v2;
}

- (void)run
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F7B358] contextWithBagType:0];
  [(ISOperation *)self loadURLBagWithContext:v3 returningError:0];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(+[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache"), "URLBagForContext:", v3), "urlForKey:", @"p2-capabilities-dialog");
  if (v4)
  {
    uint64_t v35 = v4;
    v36 = objc_alloc_init(ISStoreURLOperation);
    [(ISURLOperation *)v36 setDataProvider:+[ISDataProvider provider]];
    id v5 = [(ISSoftwareCapabilitiesDialogOperation *)self requiredCapabilities];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obj = [(ISSoftwareCapabilitiesDialogOperation *)self mismatches];
    uint64_t v8 = [(NSDictionary *)obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      uint64_t v11 = 1;
      uint64_t v12 = 1;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          v15 = (void *)[v6 objectForKey:v14];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ([v15 BOOLValue] & 1) == 0) {
            v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"vCap%ld", v12++);
          }
          else {
            v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"cap%ld", v11++);
          }
          [v7 setObject:v14 forKey:v16];
        }
        uint64_t v9 = [(NSDictionary *)obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v9);
    }
    id v17 = objc_alloc_init(MEMORY[0x263F7B290]);
    [v17 setCachePolicy:1];
    [v17 setRequestParameters:v7];
    [v17 setURL:v35];
    [(ISURLOperation *)v36 setRequestProperties:v17];

    uint64_t v38 = 0;
    if ([(ISOperation *)self runSubOperation:v36 returningError:&v38])
    {
      [(ISOperation *)self setSuccess:1];
    }
    else
    {
      v25 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v25) {
        v25 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v26 = [v25 shouldLog];
      if ([v25 shouldLogToDisk]) {
        int v27 = v26 | 2;
      }
      else {
        int v27 = v26;
      }
      if (os_log_type_enabled((os_log_t)[v25 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        int v28 = v27;
      }
      else {
        int v28 = v27 & 2;
      }
      if (v28)
      {
        uint64_t v29 = objc_opt_class();
        int v44 = 138412290;
        uint64_t v45 = v29;
        LODWORD(v34) = 12;
        v33 = &v44;
        uint64_t v30 = _os_log_send_and_compose_impl();
        if (v30)
        {
          v31 = (void *)v30;
          uint64_t v32 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, &v44, v34);
          free(v31);
          v33 = (int *)v32;
          SSFileLog();
        }
      }
      [(ISSoftwareCapabilitiesDialogOperation *)self _postDefaultDialog];
      [(ISOperation *)self setError:v38];
    }
  }
  else
  {
    v18 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v18) {
      v18 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    if (os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      int v21 = v20;
    }
    else {
      int v21 = v20 & 2;
    }
    if (v21)
    {
      int v44 = 138412290;
      uint64_t v45 = objc_opt_class();
      LODWORD(v34) = 12;
      v33 = &v44;
      uint64_t v22 = _os_log_send_and_compose_impl();
      if (v22)
      {
        v23 = (void *)v22;
        uint64_t v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v44, v34);
        free(v23);
        v33 = (int *)v24;
        SSFileLog();
      }
    }
    [(ISSoftwareCapabilitiesDialogOperation *)self _postDefaultDialog];
    [(ISOperation *)self setSuccess:1];
  }
}

- (void)_postDefaultDialog
{
  id v6 = (id)MGCopyAnswer();
  int v2 = [v6 intValue];
  uint64_t v3 = @"HARDWARE_INCOMPATIBLE_ERROR_BODY_IPHONE";
  if (v2 == 3) {
    uint64_t v3 = @"HARDWARE_INCOMPATIBLE_ERROR_BODY_IPAD";
  }
  if (v2 == 2) {
    uint64_t v4 = @"HARDWARE_INCOMPATIBLE_ERROR_BODY_IPOD";
  }
  else {
    uint64_t v4 = v3;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v4, &stru_26C6A2310, 0);
  id v5 = +[ISOperationQueue mainQueue];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"HARDWARE_INCOMPATIBLE_ERROR_TITLE", &stru_26C6A2310, 0);
  objc_msgSend(v5, "addOperation:", +[ISDialogOperation operationWithError:](ISDialogOperation, "operationWithError:", SSError()));
}

@end