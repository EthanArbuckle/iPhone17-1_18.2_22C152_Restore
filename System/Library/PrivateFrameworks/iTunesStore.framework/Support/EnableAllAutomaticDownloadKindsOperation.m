@interface EnableAllAutomaticDownloadKindsOperation
- (void)run;
@end

@implementation EnableAllAutomaticDownloadKindsOperation

- (void)run
{
  uint64_t v17 = 0;
  id v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
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
    int v18 = 138412290;
    uint64_t v19 = objc_opt_class();
    LODWORD(v16) = 12;
    v15 = &v18;
    uint64_t v6 = _os_log_send_and_compose_impl();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v6, 4, &v18, v16);
      free(v7);
      v15 = (int *)v8;
      SSFileLog();
    }
  }
  v9 = +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0, v15);
  id v10 = 0;
  if ([(EnableAllAutomaticDownloadKindsOperation *)self loadURLBagWithContext:v9 returningError:0])id v10 = +[ISURLBag copyAllowedAutomaticDownloadKindsInBagContext:v9]; {
  if ([v10 count])
  }
  {
    v11 = objc_alloc_init(GetAutomaticDownloadKindsOperation);
    if ([(EnableAllAutomaticDownloadKindsOperation *)self runSubOperation:v11 returningError:&v17])
    {
      v12 = [(GetAutomaticDownloadKindsOperation *)v11 enabledDownloadKinds];
      if ([(NSArray *)v12 count])
      {
        objc_msgSend(+[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue"), "commitAutomaticDownloadKinds:markAsDirty:", +[NSSet setWithArray:](NSSet, "setWithArray:", v12), 0);
        uint64_t v13 = 1;
      }
      else
      {
        v14 = [[SetAutomaticDownloadKindsOperation alloc] initWithDownloadKinds:v10];
        uint64_t v13 = (uint64_t)[(EnableAllAutomaticDownloadKindsOperation *)self runSubOperation:v14 returningError:&v17];
        if (v13) {
          objc_msgSend(+[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue"), "commitAutomaticDownloadKinds:markAsDirty:", v10, 0);
        }
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 1;
  }

  [(EnableAllAutomaticDownloadKindsOperation *)self setError:v17];
  [(EnableAllAutomaticDownloadKindsOperation *)self setSuccess:v13];
}

@end