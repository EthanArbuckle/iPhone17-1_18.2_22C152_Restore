@interface ExpiredDownloadRecoveryOperation
+ (BOOL)canAttemptRecoveryWithError:(id)a3;
- (ExpiredDownloadRecoveryOperation)initWithDownloadIdentifier:(int64_t)a3 databaseSession:(id)a4;
- (id)outputBlock;
- (void)run;
- (void)setOutputBlock:(id)a3;
@end

@implementation ExpiredDownloadRecoveryOperation

- (ExpiredDownloadRecoveryOperation)initWithDownloadIdentifier:(int64_t)a3 databaseSession:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ExpiredDownloadRecoveryOperation;
  v7 = [(ExpiredDownloadRecoveryOperation *)&v18 init];
  if (v7)
  {
    id v8 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"is_automatic", @"is_store_queued", @"kind", @"download_state.store_queue_refresh_count", @"store_saga_id", 0);
    v9 = [DownloadEntity alloc];
    v10 = [v6 database];
    v11 = [(DownloadEntity *)v9 initWithPersistentID:a3 inDatabase:v10];

    v12 = (SSMemoryEntity *)[objc_alloc((Class)SSMemoryEntity) initWithDatabaseEntity:v11 properties:v8];
    download = v7->_download;
    v7->_download = v12;

    v14 = [(SSMemoryEntity *)v7->_download valueForProperty:@"download_state.store_queue_refresh_count"];
    v15 = (char *)[v14 integerValue];

    v16 = +[NSNumber numberWithInteger:v15 + 1];
    [(DownloadEntity *)v11 setValue:v16 forProperty:@"download_state.store_queue_refresh_count"];
  }
  return v7;
}

+ (BOOL)canAttemptRecoveryWithError:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  v5 = [v4 objectForKey:SSErrorHTTPStatusCodeKey];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 integerValue] == (id)403) {
    char IsEqual = 1;
  }
  else {
    char IsEqual = ISErrorIsEqual();
  }

  return IsEqual;
}

- (id)outputBlock
{
  [(ExpiredDownloadRecoveryOperation *)self lock];
  id v3 = [self->_outputBlock copy];
  [(ExpiredDownloadRecoveryOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  [(ExpiredDownloadRecoveryOperation *)self lock];
  if (self->_outputBlock != v6)
  {
    id v4 = [v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }
  [(ExpiredDownloadRecoveryOperation *)self unlock];
}

- (void)run
{
  id v3 = objc_alloc_init(ExpiredDownloadRecoveryResponse);
  [(ExpiredDownloadRecoveryResponse *)v3 setResult:0];
  id v4 = [(SSMemoryEntity *)self->_download databaseID];
  [(ExpiredDownloadRecoveryResponse *)v3 setDownloadIdentifier:v4];
  v5 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_automatic"];
  id v6 = [v5 integerValue];

  if (v6 == (id)2) {
    [(ExpiredDownloadRecoveryResponse *)v3 setResult:1];
  }
  v7 = [(SSMemoryEntity *)self->_download valueForProperty:@"kind"];
  unsigned __int8 v8 = [v7 isEqualToString:SSDownloadKindInAppContent];

  v9 = [(SSMemoryEntity *)self->_download valueForProperty:@"is_store_queued"];
  v10 = [(SSMemoryEntity *)self->_download valueForProperty:@"store_saga_id"];
  uint64_t v11 = SSGetItemIdentifierFromValue();

  v12 = [(SSMemoryEntity *)self->_download valueForProperty:@"download_state.store_queue_refresh_count"];
  uint64_t v13 = (uint64_t)[v12 integerValue];

  if (v8)
  {
    if (v13 <= 1)
    {
      v14 = off_1003A1B68;
      goto LABEL_34;
    }
    goto LABEL_22;
  }
  if (![v9 BOOLValue] && !v11 && v6 != (id)2)
  {
    v15 = +[SSLogConfig sharedDaemonConfig];
    if (!v15)
    {
      v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    objc_super v18 = [v15 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (v17)
    {
      int v53 = 138412546;
      id v54 = (id)objc_opt_class();
      __int16 v55 = 2048;
      id v56 = v4;
      id v19 = v54;
      LODWORD(v51) = 22;
      v50 = &v53;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_20:

        [(ExpiredDownloadRecoveryResponse *)v3 setResult:1];
        goto LABEL_72;
      }
      objc_super v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v53, v51);
      free(v20);
      v50 = (int *)v18;
      SSFileLog();
    }

    goto LABEL_20;
  }
  if (v13 < 2)
  {
    v14 = off_1003A1B60;
    if (!v11) {
      v14 = &off_1003A1B70;
    }
LABEL_34:
    v21 = [objc_alloc(*v14) initWithDownloadIdentifier:v4];
    v27 = +[SSLogConfig sharedDaemonConfig];
    if (!v27)
    {
      v27 = +[SSLogConfig sharedConfig];
    }
    unsigned int v28 = [v27 shouldLog];
    if ([v27 shouldLogToDisk]) {
      int v29 = v28 | 2;
    }
    else {
      int v29 = v28;
    }
    v30 = [v27 OSLogObject];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
      v29 &= 2u;
    }
    if (v29)
    {
      int v53 = 138412802;
      id v54 = (id)objc_opt_class();
      __int16 v55 = 2048;
      id v56 = v4;
      __int16 v57 = 2112;
      v58 = v21;
      id v31 = v54;
      LODWORD(v51) = 32;
      v50 = &v53;
      v32 = (void *)_os_log_send_and_compose_impl();

      if (!v32) {
        goto LABEL_45;
      }
      v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v53, v51);
      free(v32);
      v50 = (int *)v30;
      SSFileLog();
    }

LABEL_45:
    id v52 = 0;
    unsigned int v33 = [(ExpiredDownloadRecoveryOperation *)self runSubOperation:v21 returningError:&v52];
    v24 = v52;
    uint64_t v34 = +[SSLogConfig sharedDaemonConfig];
    v35 = (void *)v34;
    if (v33)
    {
      if (!v34)
      {
        v35 = +[SSLogConfig sharedConfig];
      }
      unsigned int v36 = objc_msgSend(v35, "shouldLog", v50);
      if ([v35 shouldLogToDisk]) {
        int v37 = v36 | 2;
      }
      else {
        int v37 = v36;
      }
      v38 = [v35 OSLogObject];
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
        v37 &= 2u;
      }
      if (v37)
      {
        v39 = objc_opt_class();
        int v53 = 138412546;
        id v54 = v39;
        __int16 v55 = 2048;
        id v56 = v4;
        id v40 = v39;
        LODWORD(v51) = 22;
        v50 = &v53;
        v41 = (void *)_os_log_send_and_compose_impl();

        if (!v41)
        {
LABEL_57:

          [(ExpiredDownloadRecoveryResponse *)v3 setResult:2];
          goto LABEL_70;
        }
        v38 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, &v53, v51);
        free(v41);
        v50 = (int *)v38;
        SSFileLog();
      }

      goto LABEL_57;
    }
    if (!v34)
    {
      v35 = +[SSLogConfig sharedConfig];
    }
    unsigned int v42 = objc_msgSend(v35, "shouldLog", v50);
    if ([v35 shouldLogToDisk]) {
      int v43 = v42 | 2;
    }
    else {
      int v43 = v42;
    }
    v44 = [v35 OSLogObject];
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
      v43 &= 2u;
    }
    if (v43)
    {
      v45 = objc_opt_class();
      int v53 = 138412802;
      id v54 = v45;
      __int16 v55 = 2048;
      id v56 = v4;
      __int16 v57 = 2112;
      v58 = v24;
      id v46 = v45;
      LODWORD(v51) = 32;
      v50 = &v53;
      v47 = (void *)_os_log_send_and_compose_impl();

      if (!v47)
      {
LABEL_69:

        [(ExpiredDownloadRecoveryResponse *)v3 setError:v24];
        goto LABEL_70;
      }
      v44 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v47, 4, &v53, v51);
      free(v47);
      v50 = (int *)v44;
      SSFileLog();
    }

    goto LABEL_69;
  }
LABEL_22:
  v21 = +[SSLogConfig sharedDaemonConfig];
  if (!v21)
  {
    v21 = +[SSLogConfig sharedConfig];
  }
  unsigned int v22 = [v21 shouldLog];
  if ([v21 shouldLogToDisk]) {
    int v23 = v22 | 2;
  }
  else {
    int v23 = v22;
  }
  v24 = [v21 OSLogObject];
  if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
    v23 &= 2u;
  }
  if (!v23) {
    goto LABEL_70;
  }
  int v53 = 138412546;
  id v54 = (id)objc_opt_class();
  __int16 v55 = 2048;
  id v56 = v4;
  id v25 = v54;
  LODWORD(v51) = 22;
  v50 = &v53;
  v26 = (void *)_os_log_send_and_compose_impl();

  if (v26)
  {
    v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v53, v51);
    free(v26);
    v50 = (int *)v24;
    SSFileLog();
LABEL_70:
  }
LABEL_72:
  uint64_t v48 = [(ExpiredDownloadRecoveryOperation *)self outputBlock];
  v49 = (void *)v48;
  if (v48)
  {
    (*(void (**)(uint64_t, ExpiredDownloadRecoveryOperation *, ExpiredDownloadRecoveryResponse *))(v48 + 16))(v48, self, v3);
    [(ExpiredDownloadRecoveryOperation *)self setOutputBlock:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);

  objc_storeStrong((id *)&self->_download, 0);
}

@end