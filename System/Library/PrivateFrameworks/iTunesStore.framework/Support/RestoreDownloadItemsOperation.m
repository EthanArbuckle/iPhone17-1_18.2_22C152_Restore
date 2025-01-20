@interface RestoreDownloadItemsOperation
- (BOOL)_runWithOptions:(id)a3 error:(id *)a4;
- (BOOL)shouldShowTermsAndConditionsDialog;
- (NSArray)downloadItems;
- (NSArray)responses;
- (RestoreDownloadItemsOperation)initWithDownloadItems:(id)a3 account:(id)a4;
- (SSAccount)account;
- (id)_newResponseWithItems:(id)a3 error:(id)a4;
- (id)_plistDataWithItems:(id)a3 options:(id)a4 error:(id *)a5;
- (id)_runWithBodyData:(id)a3 contentEncoding:(id)a4 options:(id)a5 error:(id *)a6;
- (id)_runWithItems:(id)a3 options:(id)a4;
- (void)_addResponse:(id)a3;
- (void)_run;
- (void)_showDialogsForResponse:(id)a3;
- (void)run;
- (void)setShouldShowTermsAndConditionsDialog:(BOOL)a3;
@end

@implementation RestoreDownloadItemsOperation

- (RestoreDownloadItemsOperation)initWithDownloadItems:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RestoreDownloadItemsOperation;
  v8 = [(RestoreDownloadItemsOperation *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_account, a4);
    v10 = (NSArray *)[v6 copy];
    downloadItems = v9->_downloadItems;
    v9->_downloadItems = v10;

    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    responses = v9->_responses;
    v9->_responses = v12;
  }
  return v9;
}

- (SSAccount)account
{
  return self->_account;
}

- (NSArray)downloadItems
{
  return self->_downloadItems;
}

- (NSArray)responses
{
  [(RestoreDownloadItemsOperation *)self lock];
  id v3 = [(NSMutableArray *)self->_responses copy];
  [(RestoreDownloadItemsOperation *)self unlock];

  return (NSArray *)v3;
}

- (void)setShouldShowTermsAndConditionsDialog:(BOOL)a3
{
  [(RestoreDownloadItemsOperation *)self lock];
  self->_shouldShowTermsAndConditionsDialog = a3;

  [(RestoreDownloadItemsOperation *)self unlock];
}

- (BOOL)shouldShowTermsAndConditionsDialog
{
  [(RestoreDownloadItemsOperation *)self lock];
  BOOL shouldShowTermsAndConditionsDialog = self->_shouldShowTermsAndConditionsDialog;
  [(RestoreDownloadItemsOperation *)self unlock];
  return shouldShowTermsAndConditionsDialog;
}

- (void)run
{
}

- (void)_addResponse:(id)a3
{
  id v8 = a3;
  [(RestoreDownloadItemsOperation *)self lock];
  v4 = (id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__delegate];
  id WeakRetained = objc_loadWeakRetained(v4);
  char v6 = objc_opt_respondsToSelector();

  if (v6) {
    id v7 = objc_loadWeakRetained(v4);
  }
  else {
    id v7 = 0;
  }
  [(NSMutableArray *)self->_responses addObject:v8];
  [(RestoreDownloadItemsOperation *)self unlock];
  if (v7) {
    [v7 restoreDownloadItemsOperation:self didReceiveResponse:v8];
  }
}

- (id)_newResponseWithItems:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(RestoreDownloadItemsResponse);
  v9 = [StoreDownloadQueueResponse alloc];
  v10 = [(SSAccount *)self->_account uniqueIdentifier];
  v11 = [(StoreDownloadQueueResponse *)v9 initWithError:v6 userIdentifier:v10];

  [(RestoreDownloadItemsResponse *)v8 setRequestItems:v7];
  [(RestoreDownloadItemsResponse *)v8 setServerResponse:v11];

  return v8;
}

- (id)_plistDataWithItems:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = +[ISDevice sharedInstance];
  v10 = [v9 deviceName];
  if (v10) {
    [v8 setObject:v10 forKey:@"device-name"];
  }
  v11 = [v9 guid];

  if (v11) {
    [v8 setObject:v11 forKey:@"guid"];
  }
  v12 = [v9 serialNumber];

  if (v12) {
    [v8 setObject:v12 forKey:@"serial-number"];
  }
  v13 = [(SSAccount *)self->_account uniqueIdentifier];
  CFDataRef v14 = sub_10002D24C((uint64_t)[v13 unsignedLongLongValue], 1);

  if ([(__CFData *)v14 length]) {
    [v8 setObject:v14 forKey:@"kbsync"];
  }
  if (v7)
  {
    v24 = a5;
    id v15 = objc_alloc_init((Class)NSMutableArray);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v25 = v7;
    id v16 = v7;
    id v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "copyRestoreDictionary", v24);
          if (v21) {
            [v15 addObject:v21];
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v18);
    }

    [v8 setObject:v15 forKey:@"items"];
    a5 = v24;
    id v7 = v25;
  }
  v22 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v8, 100, 0, a5, v24);

  return v22;
}

- (void)_run
{
  id v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3)
  {
    id v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    int v7 = v5;
  }
  else {
    int v7 = v5 & 2;
  }
  if (v7)
  {
    id v8 = objc_opt_class();
    downloadItems = self->_downloadItems;
    id v10 = v8;
    v11 = [(NSArray *)downloadItems componentsJoinedByString:@", "];
    v12 = [(SSAccount *)self->_account uniqueIdentifier];
    [(SSAccount *)self->_account storeFrontIdentifier];
    int v48 = 138413058;
    v49 = v8;
    __int16 v50 = 2114;
    v51 = v11;
    __int16 v52 = 2112;
    v53 = v12;
    __int16 v54 = 2112;
    id v55 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v43) = 42;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_13;
    }
    id v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v48, v43);
    free(v13);
    SSFileLog();
  }

LABEL_13:
  uint64_t v14 = objc_opt_class();
  id v15 = [(NSArray *)self->_downloadItems componentsJoinedByString:@", "];
  v45 = [(SSAccount *)self->_account uniqueIdentifier];
  SSDebugLog();

  id v16 = [(SSAccount *)self->_account accountName];
  id v17 = [v16 length];

  if (v17)
  {
    [(SSAccount *)self->_account accountScope];
    id v18 = +[SSURLBagContext contextWithBagType:SSURLBagTypeForAccountScope()];
    uint64_t v19 = [(SSAccount *)self->_account uniqueIdentifier];
    [v18 setUserIdentifier:v19];

    id v47 = 0;
    unsigned __int8 v20 = [(RestoreDownloadItemsOperation *)self loadURLBagWithContext:v18 returningError:&v47];
    id v21 = v47;
    if ((v20 & 1) == 0)
    {
      id v23 = [(RestoreDownloadItemsOperation *)self _newResponseWithItems:self->_downloadItems error:v21];
      [(RestoreDownloadItemsOperation *)self _addResponse:v23];
      BOOL v26 = 0;
LABEL_44:

      goto LABEL_45;
    }
    v22 = +[ISURLBagCache sharedCache];
    id v23 = [v22 URLBagForContext:v18];

    v24 = [v23 valueForKey:@"p2-content-restore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = [v24 objectForKey:@"url"];

      if (v25)
      {
        id v46 = v21;
        BOOL v26 = [(RestoreDownloadItemsOperation *)self _runWithOptions:v24 error:&v46];
        id v27 = v46;
LABEL_43:

        id v21 = v27;
        goto LABEL_44;
      }
    }
    v36 = +[SSLogConfig sharedDaemonConfig];
    if (!v36)
    {
      v36 = +[SSLogConfig sharedConfig];
    }
    unsigned int v37 = [v36 shouldLog];
    if ([v36 shouldLogToDisk]) {
      int v38 = v37 | 2;
    }
    else {
      int v38 = v37;
    }
    v39 = [v36 OSLogObject];
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      v38 &= 2u;
    }
    if (v38)
    {
      v40 = objc_opt_class();
      int v48 = 138412290;
      v49 = v40;
      id v41 = v40;
      LODWORD(v44) = 12;
      v42 = (void *)_os_log_send_and_compose_impl();

      if (!v42)
      {
LABEL_42:

        SSError();
        id v27 = (id)objc_claimAutoreleasedReturnValue();

        id v21 = [(RestoreDownloadItemsOperation *)self _newResponseWithItems:self->_downloadItems error:v27];
        [(RestoreDownloadItemsOperation *)self _addResponse:v21];
        BOOL v26 = 1;
        goto LABEL_43;
      }
      v39 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 4, &v48, v44);
      free(v42);
      SSFileLog();
    }

    goto LABEL_42;
  }
  long long v28 = +[SSLogConfig sharedDaemonConfig];
  if (!v28)
  {
    long long v28 = +[SSLogConfig sharedConfig];
  }
  unsigned int v29 = [v28 shouldLog];
  if ([v28 shouldLogToDisk]) {
    int v30 = v29 | 2;
  }
  else {
    int v30 = v29;
  }
  v31 = [v28 OSLogObject];
  if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
    v30 &= 2u;
  }
  if (!v30) {
    goto LABEL_28;
  }
  v32 = objc_opt_class();
  account = self->_account;
  int v48 = 138412546;
  v49 = v32;
  __int16 v50 = 2112;
  v51 = account;
  id v34 = v32;
  LODWORD(v44) = 22;
  v35 = (void *)_os_log_send_and_compose_impl();

  if (v35)
  {
    v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v35, 4, &v48, v44);
    free(v35);
    SSFileLog();
LABEL_28:
  }
  SSError();
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = [(RestoreDownloadItemsOperation *)self _newResponseWithItems:self->_downloadItems error:v21];
  [(RestoreDownloadItemsOperation *)self _addResponse:v18];
  BOOL v26 = 0;
LABEL_45:

  [(RestoreDownloadItemsOperation *)self setError:v21];
  [(RestoreDownloadItemsOperation *)self setSuccess:v26];
}

- (id)_runWithBodyData:(id)a3 contentEncoding:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = [a5 objectForKey:@"url"];
  if (!v12 || (id v13 = [objc_alloc((Class)NSURL) initWithString:v12]) == 0)
  {
    v32 = +[SSLogConfig sharedDaemonConfig];
    if (!v32)
    {
      v32 = +[SSLogConfig sharedConfig];
    }
    unsigned int v33 = [v32 shouldLog];
    if ([v32 shouldLogToDisk]) {
      int v34 = v33 | 2;
    }
    else {
      int v34 = v33;
    }
    v35 = [v32 OSLogObject];
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      v34 &= 2u;
    }
    if (v34)
    {
      int v51 = 138412546;
      id v52 = (id)objc_opt_class();
      __int16 v53 = 2112;
      __int16 v54 = v12;
      id v36 = v52;
      LODWORD(v40) = 22;
      unsigned int v37 = (void *)_os_log_send_and_compose_impl();

      if (!v37) {
        goto LABEL_28;
      }
      v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, &v51, v40);
      free(v37);
      SSFileLog();
    }

LABEL_28:
    SSError();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = 0;
    id v27 = 0;
    if (!a6) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  uint64_t v14 = v13;
  v42 = self;
  int v48 = a6;
  id v15 = objc_alloc_init((Class)ISStoreURLOperation);
  [v15 setShouldSendXTokenHeader:1];
  [v15 setUseUserSpecificURLBag:1];
  id v16 = objc_alloc_init(DaemonProtocolDataProvider);
  [(DaemonProtocolDataProvider *)v16 setShouldProcessDialogs:0];
  id v46 = v16;
  [v15 setDataProvider:v16];
  id v17 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURL:v14];
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v19 = +[ISDevice sharedInstance];
  uint64_t v20 = [v19 serialNumber];

  if (v20) {
    [v18 setObject:v20 forKey:@"serial-number"];
  }
  [v17 setRequestParameters:v18];
  id v21 = +[SSDevice currentDevice];
  uint64_t v22 = [v21 thinnedApplicationVariantIdentifier];

  if (v22) {
    [v17 setValue:v22 forHTTPHeaderField:SSHTTPHeaderXAppleTADevice];
  }
  uint64_t v43 = (void *)v22;
  uint64_t v44 = (void *)v20;
  v45 = v18;
  [v17 setCachePolicy:1];
  id v49 = v10;
  [v17 setHTTPBody:v10];
  [v17 setHTTPMethod:@"POST"];
  if (v11) {
    [v17 setValue:v11 forHTTPHeaderField:@"Content-Encoding"];
  }
  id v47 = v11;
  [v17 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  [v15 setRequestProperties:v17];
  id v23 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccount:v42->_account];
  [v23 setAccountNameEditable:1];
  [v23 setCanCreateNewAccount:0];
  [v23 setPromptStyle:1001];
  [v15 setAuthenticationContext:v23];
  id v50 = 0;
  unsigned __int8 v41 = [(RestoreDownloadItemsOperation *)v42 runSubOperation:v15 returningError:&v50];
  id v24 = v50;
  id v25 = [v15 dataProvider];
  BOOL v26 = [v25 output];

  objc_opt_class();
  id v27 = 0;
  if (objc_opt_isKindOfClass())
  {
    long long v28 = [StoreDownloadQueueResponse alloc];
    unsigned int v29 = [(SSAccount *)v42->_account uniqueIdentifier];
    id v27 = [(StoreDownloadQueueResponse *)v28 initWithDictionary:v26 userIdentifier:v29];

    [(RestoreDownloadItemsOperation *)v42 _showDialogsForResponse:v26];
    char v30 = v27 ? v41 : 1;
    if ((v30 & 1) == 0)
    {
      v31 = [(StoreDownloadQueueResponse *)v27 error];

      if (!v31)
      {
        if (v24)
        {
          [(StoreDownloadQueueResponse *)v27 setError:v24];
          [(StoreDownloadQueueResponse *)v27 setShouldCancelPurchaseBatch:ISErrorIsEqual()];
        }
        else
        {
          v39 = SSError();
          [(StoreDownloadQueueResponse *)v27 setError:v39];
        }
      }
    }
  }

  a6 = v48;
  id v10 = v49;
  id v11 = v47;
  if (v48) {
LABEL_29:
  }
    *a6 = v24;
LABEL_30:

  return v27;
}

- (id)_runWithItems:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v58 = 0;
  id v8 = [(RestoreDownloadItemsOperation *)self _plistDataWithItems:v6 options:v7 error:&v58];
  id v9 = v58;
  if (!v8)
  {
    unsigned int v29 = +[SSLogConfig sharedDaemonConfig];
    if (!v29)
    {
      unsigned int v29 = +[SSLogConfig sharedConfig];
    }
    unsigned int v30 = [v29 shouldLog];
    if ([v29 shouldLogToDisk]) {
      int v31 = v30 | 2;
    }
    else {
      int v31 = v30;
    }
    v32 = [v29 OSLogObject];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      int v33 = v31;
    }
    else {
      int v33 = v31 & 2;
    }
    if (v33)
    {
      int v34 = objc_opt_class();
      int v59 = 138412802;
      v60 = v34;
      __int16 v61 = 2114;
      id v62 = v6;
      __int16 v63 = 2114;
      id v64 = v9;
      id v35 = v34;
      LODWORD(v49) = 32;
      id v36 = (void *)_os_log_send_and_compose_impl();

      if (!v36)
      {
LABEL_36:

        id v12 = 0;
        goto LABEL_38;
      }
      v32 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v36, 4, &v59, v49);
      free(v36);
      SSFileLog();
    }

    goto LABEL_36;
  }
  CFStringRef v10 = @"gzip";
  id v11 = [v7 objectForKey:@"gzip"];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![v11 BOOLValue]
    || ((v12 = (id)ISCopyGzippedDataForData()) != 0 ? (v13 = @"gzip") : (v13 = 0), uint64_t v14 = v13,
                                                                                             !v12))
  {
    id v12 = v8;
    CFStringRef v10 = 0;
  }

  id v57 = v9;
  id v15 = [(RestoreDownloadItemsOperation *)self _runWithBodyData:v12 contentEncoding:v10 options:v7 error:&v57];
  id v16 = v57;

  if (v15)
  {
    id v17 = [(StoreDownloadQueueResponse *)v15 error];

    uint64_t v18 = +[SSLogConfig sharedDaemonConfig];
    uint64_t v19 = (void *)v18;
    id v55 = v8;
    v56 = v6;
    if (v17)
    {
      if (!v18)
      {
        uint64_t v19 = +[SSLogConfig sharedConfig];
      }
      id v53 = v12;
      unsigned int v20 = [v19 shouldLog];
      if ([v19 shouldLogToDisk]) {
        int v21 = v20 | 2;
      }
      else {
        int v21 = v20;
      }
      uint64_t v22 = [v19 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        int v23 = v21;
      }
      else {
        int v23 = v21 & 2;
      }
      if (v23)
      {
        id v24 = objc_opt_class();
        id v51 = v24;
        id v25 = [v6 componentsJoinedByString:@", "];
        BOOL v26 = [(StoreDownloadQueueResponse *)v15 error];
        int v59 = 138412802;
        v60 = v24;
        __int16 v61 = 2114;
        id v62 = v25;
        __int16 v63 = 2114;
        id v64 = v26;
        LODWORD(v49) = 32;
        id v27 = (void *)_os_log_send_and_compose_impl();

        id v6 = v56;
        if (!v27)
        {
LABEL_23:

          objc_opt_class();
          long long v28 = [v6 componentsJoinedByString:@", "];
          id v50 = [(StoreDownloadQueueResponse *)v15 error];
          SSDebugLog();

          id v8 = v55;
          id v6 = v56;
          id v12 = v53;
          goto LABEL_41;
        }
        uint64_t v22 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, &v59, v49);
        free(v27);
        SSFileLog();
      }

      goto LABEL_23;
    }
    if (!v18)
    {
      uint64_t v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v40 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      v40 |= 2u;
    }
    unsigned __int8 v41 = [v19 OSLogObject];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
      int v42 = v40;
    }
    else {
      int v42 = v40 & 2;
    }
    if (v42)
    {
      uint64_t v43 = objc_opt_class();
      id v54 = v43;
      id v52 = [(StoreDownloadQueueResponse *)v15 downloads];
      id v44 = v12;
      id v45 = [v52 count];
      id v46 = [v56 componentsJoinedByString:@", "];
      int v59 = 138412802;
      v60 = v43;
      __int16 v61 = 2048;
      id v62 = v45;
      id v12 = v44;
      __int16 v63 = 2114;
      id v64 = v46;
      LODWORD(v49) = 32;
      id v47 = (void *)_os_log_send_and_compose_impl();

      if (!v47)
      {
LABEL_55:

        int v48 = [(StoreDownloadQueueResponse *)v15 keybag];
        if ([v48 length]) {
          sub_10002E31C(v48);
        }

        id v8 = v55;
        id v6 = v56;
        goto LABEL_41;
      }
      unsigned __int8 v41 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v47, 4, &v59, v49);
      free(v47);
      SSFileLog();
    }

    goto LABEL_55;
  }
  id v9 = v16;
LABEL_38:
  if (!v9)
  {
    SSError();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  unsigned int v37 = [StoreDownloadQueueResponse alloc];
  int v38 = [(SSAccount *)self->_account uniqueIdentifier];
  id v15 = [(StoreDownloadQueueResponse *)v37 initWithError:v9 userIdentifier:v38];

  [(StoreDownloadQueueResponse *)v15 setShouldCancelPurchaseBatch:ISErrorIsEqual()];
  id v16 = v9;
LABEL_41:

  return v15;
}

- (BOOL)_runWithOptions:(id)a3 error:(id *)a4
{
  id v4 = a3;
  int v5 = [v4 objectForKey:@"allowed-kinds"];

  if (v5)
  {
    id v6 = objc_alloc((Class)NSMutableSet);
    id v7 = [v4 objectForKey:@"allowed-kinds"];
    id v106 = [v6 initWithArray:v7];
  }
  else
  {
    id v106 = 0;
  }
  CFPropertyListRef v8 = CFPreferencesCopyAppValue(@"ExtraRestoreKinds", kSSUserDefaultsIdentifier);
  objc_opt_class();
  v105 = (void *)v8;
  id v117 = v4;
  if (objc_opt_isKindOfClass())
  {
    id v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9)
    {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    id v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v135 = 138412546;
      id v136 = (id)objc_opt_class();
      __int16 v137 = 2112;
      uint64_t v138 = (uint64_t)v105;
      id v13 = v136;
      LODWORD(v102) = 22;
      v100 = &v135;
      uint64_t v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_16:

        [v106 addObjectsFromArray:v105];
        id v4 = v117;
        goto LABEL_17;
      }
      id v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v135, v102);
      free(v14);
      v100 = (int *)v12;
      SSFileLog();
    }

    goto LABEL_16;
  }
LABEL_17:
  id v15 = objc_msgSend(v4, "objectForKey:", @"allowed-match-status", v100);

  id v16 = objc_alloc((Class)NSMutableSet);
  if (v15)
  {
    id v17 = [v4 objectForKey:@"allowed-match-status"];
    id v18 = [v16 initWithArray:v17];
  }
  else
  {
    id v17 = +[NSNumber numberWithInteger:0];
    id v18 = objc_msgSend(v16, "initWithObjects:", v17, 0);
  }
  v115 = v18;
  uint64_t v19 = v106;

  id v20 = objc_alloc_init((Class)NSMutableDictionary);
  id v109 = objc_alloc_init((Class)NSMutableArray);
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  obj = self->_downloadItems;
  id v21 = [(NSArray *)obj countByEnumeratingWithState:&v131 objects:v144 count:16];
  id v111 = v20;
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v132;
    uint64_t v121 = *(void *)v132;
    do
    {
      id v24 = 0;
      id v123 = v22;
      do
      {
        if (*(void *)v132 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v131 + 1) + 8 * (void)v24);
        BOOL v26 = objc_msgSend(v25, "downloadKind", v101);
        id v27 = [v25 cloudMatchStatus];
        if (v19 && ([v19 containsObject:v26] & 1) == 0)
        {
          unsigned int v30 = +[SSLogConfig sharedDaemonConfig];
          if (!v30)
          {
            unsigned int v30 = +[SSLogConfig sharedConfig];
          }
          unsigned int v31 = [v30 shouldLog];
          if ([v30 shouldLogToDisk]) {
            int v32 = v31 | 2;
          }
          else {
            int v32 = v31;
          }
          int v33 = [v30 OSLogObject];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
            int v34 = v32;
          }
          else {
            int v34 = v32 & 2;
          }
          if (v34)
          {
            id v35 = objc_opt_class();
            id v36 = v35;
            unsigned int v37 = [v25 storeItemID];
            int v135 = 138412802;
            id v136 = v35;
            id v20 = v111;
            __int16 v137 = 2112;
            uint64_t v138 = (uint64_t)v26;
            __int16 v139 = 2112;
            v140 = v37;
            LODWORD(v102) = 32;
            v101 = &v135;
            int v38 = (void *)_os_log_send_and_compose_impl();

            goto LABEL_53;
          }
LABEL_55:
          uint64_t v23 = v121;
LABEL_56:

LABEL_57:
          [v109 addObject:v25];
          id v22 = v123;
          goto LABEL_58;
        }
        if (v115 && v27 && ([v115 containsObject:v27] & 1) == 0)
        {
          unsigned int v30 = +[SSLogConfig sharedDaemonConfig];
          if (!v30)
          {
            unsigned int v30 = +[SSLogConfig sharedConfig];
          }
          unsigned int v39 = [v30 shouldLog];
          if ([v30 shouldLogToDisk]) {
            v39 |= 2u;
          }
          int v33 = [v30 OSLogObject];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
            int v40 = v39;
          }
          else {
            int v40 = v39 & 2;
          }
          if (!v40) {
            goto LABEL_55;
          }
          unsigned __int8 v41 = objc_opt_class();
          id v36 = v41;
          int v42 = [v25 storeItemID];
          int v135 = 138412802;
          id v136 = v41;
          __int16 v137 = 2112;
          uint64_t v138 = (uint64_t)v27;
          __int16 v139 = 2112;
          v140 = v42;
          LODWORD(v102) = 32;
          v101 = &v135;
          int v38 = (void *)_os_log_send_and_compose_impl();

          id v20 = v111;
LABEL_53:

          uint64_t v19 = v106;
          uint64_t v23 = v121;
          if (v38)
          {
            int v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v135, v102);
            free(v38);
            v101 = (int *)v33;
            SSFileLog();
            goto LABEL_56;
          }
          goto LABEL_57;
        }
        long long v28 = [v20 objectForKey:v26];
        if (v28)
        {
          id v29 = v28;
          [v28 addObject:v25];
        }
        else
        {
          id v29 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v25, 0);
          [v20 setObject:v29 forKey:v26];
        }

LABEL_58:
        id v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [(NSArray *)obj countByEnumeratingWithState:&v131 objects:v144 count:16];
    }
    while (v22);
  }

  if ([v109 count])
  {
    uint64_t v43 = SSError();
    id v44 = [(RestoreDownloadItemsOperation *)self _newResponseWithItems:v109 error:v43];

    [(RestoreDownloadItemsOperation *)self _addResponse:v44];
  }
  id v116 = objc_alloc_init((Class)NSMutableArray);
  id v45 = [v20 allKeys];
  id v46 = [v45 sortedArrayUsingComparator:&stru_1003A61D0];

  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v110 = v46;
  id v47 = [v110 countByEnumeratingWithState:&v127 objects:v143 count:16];
  if (!v47)
  {
    uint64_t v49 = 0;
    BOOL v124 = 1;
    id v51 = v117;
    id v52 = &syslog_ptr;
    goto LABEL_124;
  }
  id v48 = v47;
  uint64_t v49 = 0;
  uint64_t v50 = *(void *)v128;
  BOOL v124 = 1;
  id v51 = v117;
  id v52 = &syslog_ptr;
  uint64_t v107 = *(void *)v128;
  do
  {
    id v53 = 0;
    id v108 = v48;
    do
    {
      if (*(void *)v128 != v50) {
        objc_enumerationMutation(v110);
      }
      id v54 = *(void **)(*((void *)&v127 + 1) + 8 * (void)v53);
      v56 = [v20 objectForKey:v54];
      if (v49)
      {
        [v116 addObjectsFromArray:v56];
        goto LABEL_120;
      }
      v118 = v54;
      id v57 = objc_alloc_init((Class)NSMutableArray);
      v119 = v56;
      uint64_t v58 = (uint64_t)[v56 count];
      int v59 = [v51 objectForKey:@"max-item-count"];
      uint64_t v120 = v58;
      if (objc_opt_respondsToSelector()) {
        uint64_t v120 = (int)[v59 intValue];
      }
      v112 = v59;
      v60 = objc_msgSend(v52[405], "sharedDaemonConfig", v101, v102);
      if (!v60)
      {
        v60 = [v52[405] sharedConfig];
      }
      v113 = v55;
      v114 = v53;
      unsigned int v61 = [v60 shouldLog];
      if ([v60 shouldLogToDisk]) {
        int v62 = v61 | 2;
      }
      else {
        int v62 = v61;
      }
      __int16 v63 = [v60 OSLogObject];
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO)) {
        int v64 = v62;
      }
      else {
        int v64 = v62 & 2;
      }
      if (v64)
      {
        v65 = objc_opt_class();
        int v135 = 138413058;
        id v136 = v65;
        __int16 v137 = 2048;
        uint64_t v138 = v58;
        __int16 v139 = 2112;
        v140 = v118;
        __int16 v141 = 2048;
        id v66 = (id)v120;
        uint64_t v142 = v120;
        id v67 = v65;
        LODWORD(v102) = 42;
        v101 = &v135;
        v68 = (void *)_os_log_send_and_compose_impl();

        id v51 = v117;
        if (!v68) {
          goto LABEL_84;
        }
        __int16 v63 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v68, 4, &v135, v102);
        free(v68);
        v101 = (int *)v63;
        SSFileLog();
      }
      else
      {
        id v51 = v117;
        id v66 = (id)v120;
      }

LABEL_84:
      if (v58 >= 1)
      {
        uint64_t v69 = 0;
        uint64_t v49 = 0;
        id v52 = &syslog_ptr;
        v70 = v56;
        while (1)
        {
          v71 = objc_msgSend(v70, "objectAtIndex:", v69, v101);
          [v57 addObject:v71];
          if ([v57 count] == v66 || v69 == v58 - 1) {
            break;
          }
LABEL_116:

          if (++v69 >= v58) {
            goto LABEL_119;
          }
        }
        v72 = objc_alloc_init(RestoreDownloadItemsResponse);
        [(RestoreDownloadItemsResponse *)v72 setRequestItems:v57];
        if (![v57 count])
        {
LABEL_112:
          [(RestoreDownloadItemsOperation *)self _addResponse:v72];
          if (v49 && v69 + 1 < v58)
          {
            v87 = objc_msgSend(v70, "subarrayWithRange:");
            [v116 addObjectsFromArray:v87];

            uint64_t v69 = v58;
          }

          goto LABEL_116;
        }
        v122 = v49;
        v73 = [v52[405] sharedDaemonConfig];
        if (!v73)
        {
          v73 = [v52[405] sharedConfig];
        }
        unsigned int v74 = [v73 shouldLog];
        if ([v73 shouldLogToDisk]) {
          int v75 = v74 | 2;
        }
        else {
          int v75 = v74;
        }
        v76 = [v73 OSLogObject];
        if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO)) {
          int v77 = v75;
        }
        else {
          int v77 = v75 & 2;
        }
        if (v77)
        {
          v78 = objc_opt_class();
          id v79 = v78;
          id v80 = [v57 count];
          int v135 = 138412802;
          id v136 = v78;
          __int16 v137 = 2048;
          uint64_t v138 = (uint64_t)v80;
          __int16 v139 = 2112;
          v140 = v118;
          LODWORD(v102) = 32;
          v101 = &v135;
          v81 = (void *)_os_log_send_and_compose_impl();

          id v51 = v117;
          id v52 = &syslog_ptr;
          if (!v81)
          {
LABEL_102:

            v82 = [(RestoreDownloadItemsOperation *)self _runWithItems:v57 options:v51];
            if ([v82 shouldCancelPurchaseBatch])
            {
              v83 = [v82 error];
              v84 = v83;
              if (v83)
              {
                id v85 = v83;
              }
              else
              {
                SSError();
                id v85 = (id)objc_claimAutoreleasedReturnValue();
              }
              uint64_t v49 = v85;
            }
            else
            {
              uint64_t v49 = v122;
            }
            v70 = v119;
            if (v124)
            {
              v86 = [v82 error];
              BOOL v124 = v86 == 0;
            }
            else
            {
              BOOL v124 = 0;
            }
            -[RestoreDownloadItemsResponse setServerResponse:](v72, "setServerResponse:", v82, v101);
            [v57 removeAllObjects];

            id v66 = (id)v120;
            goto LABEL_112;
          }
          v76 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v81, 4, &v135, v102);
          free(v81);
          v101 = (int *)v76;
          SSFileLog();
        }
        else
        {
          id v52 = &syslog_ptr;
        }

        goto LABEL_102;
      }
      uint64_t v49 = 0;
      id v52 = &syslog_ptr;
      v70 = v56;
LABEL_119:

      id v20 = v111;
      uint64_t v50 = v107;
      v56 = v70;
      id v48 = v108;
      id v55 = v113;
      id v53 = v114;
LABEL_120:

      id v53 = (char *)v53 + 1;
    }
    while (v53 != v48);
    id v48 = [v110 countByEnumeratingWithState:&v127 objects:v143 count:16];
  }
  while (v48);
LABEL_124:

  if ([v116 count])
  {
    v88 = v49;
    v89 = [v52[405] sharedDaemonConfig];
    if (!v89)
    {
      v89 = [v52[405] sharedConfig];
    }
    unsigned int v90 = objc_msgSend(v89, "shouldLog", v101);
    if ([v89 shouldLogToDisk]) {
      v90 |= 2u;
    }
    v91 = [v89 OSLogObject];
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT)) {
      int v92 = v90;
    }
    else {
      int v92 = v90 & 2;
    }
    if (v92)
    {
      v93 = objc_opt_class();
      id v94 = v93;
      v95 = [v116 componentsJoinedByString:@", "];
      int v135 = 138412802;
      id v136 = v93;
      __int16 v137 = 2114;
      uint64_t v138 = (uint64_t)v95;
      __int16 v139 = 2114;
      v140 = v88;
      LODWORD(v102) = 32;
      v96 = (void *)_os_log_send_and_compose_impl();

      uint64_t v49 = v88;
      if (v96)
      {
        v91 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v96, 4, &v135, v102);
        free(v96);
        SSFileLog();
        goto LABEL_135;
      }
    }
    else
    {
LABEL_135:
    }
    uint64_t v97 = objc_opt_class();
    v103 = [v116 componentsJoinedByString:@", "];
    SSDebugLog();

    id v98 = -[RestoreDownloadItemsOperation _newResponseWithItems:error:](self, "_newResponseWithItems:error:", v116, v49, v97, v103, v49);
    [(RestoreDownloadItemsOperation *)self _addResponse:v98];

    id v51 = v117;
  }
  if (a4) {
    *a4 = 0;
  }

  return v124;
}

- (void)_showDialogsForResponse:(id)a3
{
  id v4 = a3;
  int v5 = [v4 objectForKey:kISFailureTypeKey];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v6 = [v4 objectForKey:@"status"];

    int v5 = (void *)v6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v5 intValue] == 3038
    && ![(RestoreDownloadItemsOperation *)self shouldShowTermsAndConditionsDialog])
  {
    CFPropertyListRef v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8)
    {
      CFPropertyListRef v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    int v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      LODWORD(v15) = 138412290;
      *(void *)((char *)&v15 + 4) = objc_opt_class();
      id v12 = *(id *)((char *)&v15 + 4);
      LODWORD(v14) = 12;
      id v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_19:

        goto LABEL_7;
      }
      int v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v15, v14, v15);
      free(v13);
      SSFileLog();
    }

    goto LABEL_19;
  }
  id v7 = objc_alloc_init(DaemonProtocolDataProvider);
  [(DaemonProtocolDataProvider *)v7 setShouldProcessAuthenticationDialogs:0];
  [(DaemonProtocolDataProvider *)v7 processDialogFromDictionary:v4 error:0];

LABEL_7:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_downloadItems, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end