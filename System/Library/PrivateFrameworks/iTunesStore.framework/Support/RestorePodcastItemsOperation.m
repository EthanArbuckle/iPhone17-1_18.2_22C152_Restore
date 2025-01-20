@interface RestorePodcastItemsOperation
- (NSArray)downloadItems;
- (NSArray)responses;
- (RestorePodcastItemsOperation)initWithDownloadItems:(id)a3;
- (id)_addResponseForItem:(id)a3 operation:(id)a4;
- (id)_newResponseWithItems:(id)a3 error:(id)a4;
- (id)_newURLOperationForItem:(id)a3 error:(id *)a4;
- (void)_addResponse:(id)a3;
- (void)run;
@end

@implementation RestorePodcastItemsOperation

- (RestorePodcastItemsOperation)initWithDownloadItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RestorePodcastItemsOperation;
  v5 = [(RestorePodcastItemsOperation *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    downloadItems = v5->_downloadItems;
    v5->_downloadItems = v6;
  }
  return v5;
}

- (NSArray)downloadItems
{
  return self->_downloadItems;
}

- (NSArray)responses
{
  [(RestorePodcastItemsOperation *)self lock];
  id v3 = [(NSMutableArray *)self->_responses copy];
  [(RestorePodcastItemsOperation *)self unlock];

  return (NSArray *)v3;
}

- (void)run
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
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (v5)
  {
    v7 = objc_opt_class();
    downloadItems = self->_downloadItems;
    id v9 = v7;
    int v56 = 138412546;
    v57 = v7;
    __int16 v58 = 2048;
    CFStringRef v59 = [(NSArray *)downloadItems count];
    LODWORD(v41) = 22;
    v40 = &v56;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_12;
    }
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v56, v41);
    free(v10);
    v40 = (int *)v6;
    SSFileLog();
  }

LABEL_12:
  v11 = +[SSURLBagContext contextWithBagType:0];
  id v54 = 0;
  unsigned __int8 v12 = [(RestorePodcastItemsOperation *)self loadURLBagWithContext:v11 returningError:&v54];
  id v13 = v54;
  if ((v12 & 1) == 0)
  {
    id v32 = [(RestorePodcastItemsOperation *)self _newResponseWithItems:self->_downloadItems error:v13];
    [(RestorePodcastItemsOperation *)self _addResponse:v32];
    uint64_t v18 = 0;
    goto LABEL_44;
  }
  v14 = +[ISURLBagCache sharedCache];
  v15 = [v14 URLBagForContext:v11];

  v43 = v15;
  v16 = [v15 urlForKey:@"p2-podcast-restore"];

  if (v16)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v17 = self->_downloadItems;
    id v45 = [(NSArray *)v17 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v45)
    {
      v42 = v11;
      uint64_t v44 = *(void *)v51;
      LODWORD(v18) = 1;
      while (1)
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(void *)v51 != v44) {
            objc_enumerationMutation(v17);
          }
          uint64_t v20 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          id v49 = 0;
          id v22 = [(RestorePodcastItemsOperation *)self _newURLOperationForItem:v20 error:&v49];
          id v23 = v49;
          v24 = v23;
          if (v22)
          {
            v46 = v21;
            id v48 = v23;
            v25 = v17;
            id v26 = v13;
            unsigned __int8 v27 = [(RestorePodcastItemsOperation *)self runSubOperation:v22 returningError:&v48];
            id v28 = v48;

            if (v27)
            {
              id v29 = [(RestorePodcastItemsOperation *)self _addResponseForItem:v20 operation:v22];
              v24 = [v29 responseError];

              BOOL v30 = v24 == 0;
              id v13 = v26;
              v17 = v25;
              v21 = v46;
              goto LABEL_24;
            }
            v24 = v28;
            id v13 = v26;
            v17 = v25;
            v21 = v46;
          }
          v31 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v20, v40);
          id v29 = [(RestorePodcastItemsOperation *)self _newResponseWithItems:v31 error:v24];

          [(RestorePodcastItemsOperation *)self _addResponse:v29];
          BOOL v30 = 0;
LABEL_24:

          if (!v13) {
            id v13 = v24;
          }
          uint64_t v18 = v18 & v30;
        }
        id v45 = [(NSArray *)v17 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (!v45)
        {
          v11 = v42;
          goto LABEL_43;
        }
      }
    }
    goto LABEL_42;
  }
  v47 = v13;
  v33 = +[SSLogConfig sharedDaemonConfig];
  if (!v33)
  {
    v33 = +[SSLogConfig sharedConfig];
  }
  unsigned int v34 = objc_msgSend(v33, "shouldLog", v40);
  if ([v33 shouldLogToDisk]) {
    v34 |= 2u;
  }
  v35 = [v33 OSLogObject];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
    int v36 = v34;
  }
  else {
    int v36 = v34 & 2;
  }
  if (!v36) {
    goto LABEL_40;
  }
  v37 = objc_opt_class();
  int v56 = 138412546;
  v57 = v37;
  __int16 v58 = 2112;
  CFStringRef v59 = @"p2-podcast-restore";
  id v38 = v37;
  LODWORD(v41) = 22;
  v39 = (void *)_os_log_send_and_compose_impl();

  if (v39)
  {
    v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v39, 4, &v56, v41);
    free(v39);
    SSFileLog();
LABEL_40:
  }
  SSError();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  v17 = [(RestorePodcastItemsOperation *)self _newResponseWithItems:self->_downloadItems error:v13];
  [(RestorePodcastItemsOperation *)self _addResponse:v17];
LABEL_42:
  uint64_t v18 = 1;
LABEL_43:

  id v32 = v43;
LABEL_44:

  [(RestorePodcastItemsOperation *)self setError:v13];
  [(RestorePodcastItemsOperation *)self setSuccess:v18];
}

- (void)_addResponse:(id)a3
{
  id v8 = a3;
  [(RestorePodcastItemsOperation *)self lock];
  unsigned int v4 = (id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__delegate];
  id WeakRetained = objc_loadWeakRetained(v4);
  char v6 = objc_opt_respondsToSelector();

  if (v6) {
    id v7 = objc_loadWeakRetained(v4);
  }
  else {
    id v7 = 0;
  }
  [(NSMutableArray *)self->_responses addObject:v8];
  [(RestorePodcastItemsOperation *)self unlock];
  if (v7) {
    [v7 restorePodcastItemsOperation:self didReceiveResponse:v8];
  }
}

- (id)_addResponseForItem:(id)a3 operation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(RestorePodcastItemsResponse);
  id v9 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v6, 0);
  [(RestorePodcastItemsResponse *)v8 setRequestItems:v9];

  v10 = [v7 dataProvider];

  v11 = [v10 output];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [objc_alloc((Class)SSItem) initWithItemDictionary:v11];
    id v13 = [[StoreDownload alloc] initWithItem:v12];
    v14 = [(StoreDownload *)v13 primaryAssetURL];

    if (v14)
    {
      id v15 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v13, 0);
      [(RestorePodcastItemsResponse *)v8 setResponseDownloads:v15];
    }
    else
    {
      id v15 = [v11 objectForKey:@"failureType"];
      if (objc_opt_respondsToSelector()) {
        [v15 integerValue];
      }
      v16 = SSError();
      v17 = [v6 storeItemID];
      [(RestorePodcastItemsResponse *)v8 setError:v16 forItemIdentifier:v17];
    }
  }
  else
  {
    SSError();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [(RestorePodcastItemsResponse *)v8 setResponseError:v12];
  }

  [(RestorePodcastItemsOperation *)self _addResponse:v8];

  return v8;
}

- (id)_newResponseWithItems:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(RestorePodcastItemsResponse);
  [(RestorePodcastItemsResponse *)v7 setRequestItems:v6];

  [(RestorePodcastItemsResponse *)v7 setResponseError:v5];
  return v7;
}

- (id)_newURLOperationForItem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 podcastEpisodeGUID];
  uint64_t v7 = [v5 storeItemID];

  if (!(v7 | v6))
  {
    id v8 = SSError();
    id v9 = 0;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  id v9 = objc_alloc_init((Class)ISStoreURLOperation);
  v10 = +[DaemonProtocolDataProvider provider];
  [v9 setDataProvider:v10];

  id v11 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  if (v7 && (uint64_t)[(id)v7 longLongValue] >= 1)
  {
    id v12 = [(id)v7 stringValue];
    [v11 setValue:v12 forRequestParameter:@"id"];
  }
  else if (v6)
  {
    [v11 setValue:v6 forRequestParameter:@"epguid"];
  }
  [v11 setURLBagKey:@"p2-podcast-restore"];
  [v9 setRequestProperties:v11];

  id v8 = 0;
  if (a4)
  {
LABEL_10:
    if (!v9) {
      *a4 = v8;
    }
  }
LABEL_12:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responses, 0);

  objc_storeStrong((id *)&self->_downloadItems, 0);
}

@end