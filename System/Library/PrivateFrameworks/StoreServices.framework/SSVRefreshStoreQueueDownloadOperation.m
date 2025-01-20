@interface SSVRefreshStoreQueueDownloadOperation
- (BOOL)_refreshDownloadWithTransactionID:(id)a3 accountID:(id)a4 bagKey:(id)a5 error:(id *)a6;
- (NSNumber)accountID;
- (NSString)downloadTransactionID;
- (SSVRefreshStoreQueueDownloadOperation)initWithDownloadTransactionIdentifier:(id)a3 accountID:(id)a4;
- (id)isDownloadTransactionID;
- (void)main;
@end

@implementation SSVRefreshStoreQueueDownloadOperation

- (SSVRefreshStoreQueueDownloadOperation)initWithDownloadTransactionIdentifier:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSVRefreshStoreQueueDownloadOperation;
  v8 = [(SSVLoadDownloadQueueOperation *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    downloadTransactionID = v8->_downloadTransactionID;
    v8->_downloadTransactionID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    accountID = v8->_accountID;
    v8->_accountID = (NSNumber *)v11;
  }
  return v8;
}

- (id)isDownloadTransactionID
{
  return self->_downloadTransactionID;
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (void)main
{
  downloadTransactionID = self->_downloadTransactionID;
  accountID = self->_accountID;
  id v7 = 0;
  BOOL v5 = [(SSVRefreshStoreQueueDownloadOperation *)self _refreshDownloadWithTransactionID:downloadTransactionID accountID:accountID bagKey:@"pendingApps" error:&v7];
  id v6 = v7;
  [(SSVOperation *)self setError:v6];
  [(SSVOperation *)self setSuccess:v5];
}

- (BOOL)_refreshDownloadWithTransactionID:(id)a3 accountID:(id)a4 bagKey:(id)a5 error:(id *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  BOOL v14 = 0;
  v15 = 0;
  if (v10 && v11 && v12)
  {
    v36 = a6;
    v16 = objc_alloc_init(SSMutableURLRequestProperties);
    [(SSMutableURLRequestProperties *)v16 setURLBagKey:v13];
    [(SSMutableURLRequestProperties *)v16 setValue:v10 forRequestParameter:@"endId"];
    [(SSMutableURLRequestProperties *)v16 setValue:v10 forRequestParameter:@"startId"];
    v17 = [[SSVLoadDownloadQueueOperation alloc] initWithRequestProperties:v16];
    [(SSVLoadDownloadQueueOperation *)v17 setAccountIdentifier:v11];
    [(SSVLoadDownloadQueueOperation *)v17 setNeedsAuthentication:0];
    v18 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v18)
    {
      v18 = +[SSLogConfig sharedConfig];
    }
    int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    v21 = [v18 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      int v22 = v20;
    }
    else {
      int v22 = v20 & 2;
    }
    if (v22)
    {
      v23 = objc_opt_class();
      accountID = self->_accountID;
      int v37 = 138412802;
      v38 = v23;
      __int16 v39 = 2112;
      v40 = accountID;
      __int16 v41 = 2112;
      id v42 = v10;
      id v25 = v23;
      LODWORD(v35) = 32;
      v26 = (void *)_os_log_send_and_compose_impl();

      if (v26)
      {
        v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v37, v35);
        free(v26);
        SSFileLog(v18, @"%@", v28, v29, v30, v31, v32, v33, (uint64_t)v27);
      }
    }
    else
    {
    }
    [(SSVOperation *)self runChildOperation:v17];
    BOOL v14 = [(SSVOperation *)v17 success];
    if (v14)
    {
      v15 = 0;
    }
    else
    {
      v15 = [(SSVOperation *)v17 error];
    }
    a6 = v36;
  }
  if (a6 && !v14) {
    *a6 = v15;
  }

  return v14;
}

- (NSString)downloadTransactionID
{
  return (NSString *)objc_getProperty(self, a2, 424, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadTransactionID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_downloadTrasactionID, 0);
}

@end