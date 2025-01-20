@interface RefreshStoreQueueDownloadOperation
- (BOOL)_refreshDownload:(id)a3 error:(id *)a4;
- (RefreshStoreQueueDownloadOperation)initWithDownloadIdentifier:(int64_t)a3;
- (id)_URLBagKeyForDownload:(id)a3;
- (int64_t)downloadIdentifier;
- (void)run;
@end

@implementation RefreshStoreQueueDownloadOperation

- (RefreshStoreQueueDownloadOperation)initWithDownloadIdentifier:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RefreshStoreQueueDownloadOperation;
  result = [(RefreshStoreQueueDownloadOperation *)&v5 init];
  if (result) {
    result->_downloadID = a3;
  }
  return result;
}

- (int64_t)downloadIdentifier
{
  return self->_downloadID;
}

- (void)run
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_10018B848;
  v10 = sub_10018B858;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10018B864;
  v5[3] = &unk_1003A8670;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "readUsingTransactionBlock:", v5);
  uint64_t v4 = 0;
  BOOL v3 = [(RefreshStoreQueueDownloadOperation *)self _refreshDownload:v7[5] error:&v4];
  [(RefreshStoreQueueDownloadOperation *)self setError:v4];
  [(RefreshStoreQueueDownloadOperation *)self setSuccess:v3];

  _Block_object_dispose(&v6, 8);
}

- (BOOL)_refreshDownload:(id)a3 error:(id *)a4
{
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  v55 = 0;
  id v7 = [a3 valueForProperty:@"store_account_id"];
  id v8 = [(RefreshStoreQueueDownloadOperation *)self _URLBagKeyForDownload:a3];
  id v9 = [a3 valueForProperty:@"store_transaction_id"];
  id v10 = v9;
  if (v7) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11 && v9 != 0)
  {
    id v13 = objc_alloc_init((Class)SSMutableURLRequestProperties);
    [v13 setURLBagKey:v8];
    [v13 setValue:v10 forRequestParameter:@"endId"];
    [v13 setValue:v10 forRequestParameter:@"startId"];
    v14 = [[LoadDownloadQueueOperation alloc] initWithRequestProperties:v13];
    [(LoadDownloadQueueOperation *)v14 setAccountIdentifier:v7];
    [(LoadDownloadQueueOperation *)v14 setNeedsAuthentication:0];
    id v15 = +[SSLogConfig sharedDaemonConfig];
    if (!v15) {
      id v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    unsigned int v17 = [v15 shouldLogToDisk];
    v18 = [v15 OSLogObject];
    if (v17) {
      v16 |= 2u;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      v16 &= 2u;
    }
    if (v16)
    {
      uint64_t v19 = objc_opt_class();
      int64_t downloadID = self->_downloadID;
      int v60 = 138412802;
      uint64_t v61 = v19;
      __int16 v62 = 2048;
      int64_t v63 = downloadID;
      __int16 v64 = 2112;
      int64_t v65 = (int64_t)v10;
      LODWORD(v51) = 32;
      v49 = &v60;
      uint64_t v21 = _os_log_send_and_compose_impl();
      if (v21)
      {
        v22 = (void *)v21;
        v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v60, v51);
        free(v22);
        v49 = (int *)v23;
        SSFileLog();
      }
    }
    unsigned int v24 = -[RefreshStoreQueueDownloadOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v14, &v55, v49);
    *((unsigned char *)v57 + 24) = v24;
    if (v24)
    {
      v25 = [(LoadDownloadQueueOperation *)v14 downloads];
      if ((id)[(NSOrderedSet *)v25 count] == (id)1)
      {
        v26 = [[Download alloc] initWithStoreDownload:[(NSOrderedSet *)v25 objectAtIndex:0]];
        if (v26)
        {
          id v27 = +[SSLogConfig sharedDaemonConfig];
          if (!v27) {
            id v27 = +[SSLogConfig sharedConfig];
          }
          unsigned int v28 = [v27 shouldLog];
          unsigned int v29 = [v27 shouldLogToDisk];
          v30 = [v27 OSLogObject];
          if (v29) {
            v28 |= 2u;
          }
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
            v28 &= 2u;
          }
          if (v28)
          {
            uint64_t v53 = objc_opt_class();
            int64_t v52 = self->_downloadID;
            id v31 = [a3 valueForProperty:@"store_download_key"];
            id v32 = [(Download *)v26 valueForProperty:@"store_download_key"];
            int v60 = 138413058;
            uint64_t v61 = v53;
            __int16 v62 = 2048;
            int64_t v63 = v52;
            __int16 v64 = 2112;
            int64_t v65 = (int64_t)v31;
            __int16 v66 = 2112;
            id v67 = v32;
            LODWORD(v51) = 42;
            v50 = &v60;
            uint64_t v33 = _os_log_send_and_compose_impl();
            if (v33)
            {
              v34 = (void *)v33;
              v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v60, v51);
              free(v34);
              v50 = (int *)v35;
              SSFileLog();
            }
          }
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_10018BFD8;
          v54[3] = &unk_1003A8698;
          v54[5] = v26;
          v54[6] = &v56;
          v54[4] = self;
          objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v50), "modifyUsingTransactionBlock:", v54);
        }
      }
      else
      {
        id v36 = +[SSLogConfig sharedDaemonConfig];
        if (!v36) {
          id v36 = +[SSLogConfig sharedConfig];
        }
        unsigned int v37 = [v36 shouldLog];
        unsigned int v38 = [v36 shouldLogToDisk];
        v39 = [v36 OSLogObject];
        if (v38) {
          v37 |= 2u;
        }
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
          v37 &= 2u;
        }
        if (v37)
        {
          uint64_t v40 = objc_opt_class();
          NSUInteger v41 = [(NSOrderedSet *)v25 count];
          int64_t v42 = self->_downloadID;
          int v60 = 138412802;
          uint64_t v61 = v40;
          __int16 v62 = 2048;
          int64_t v63 = v41;
          __int16 v64 = 2048;
          int64_t v65 = v42;
          LODWORD(v51) = 32;
          uint64_t v43 = _os_log_send_and_compose_impl();
          if (v43)
          {
            v44 = (void *)v43;
            +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v43, 4, &v60, v51);
            free(v44);
            SSFileLog();
          }
        }
        *((unsigned char *)v57 + 24) = 0;
      }
    }
  }
  v45 = v57;
  int v46 = *((unsigned __int8 *)v57 + 24);
  if (a4 && !*((unsigned char *)v57 + 24))
  {
    *a4 = v55;
    int v46 = *((unsigned __int8 *)v45 + 24);
  }
  BOOL v47 = v46 != 0;
  _Block_object_dispose(&v56, 8);
  return v47;
}

- (id)_URLBagKeyForDownload:(id)a3
{
  uint64_t v4 = objc_alloc_init(StoreDownloadQueueRequest);
  -[StoreDownloadQueueRequest setQueueIdentifier:](v4, "setQueueIdentifier:", sub_1000AAFC0((uint64_t)[a3 valueForProperty:@"kind"]));
  objc_super v5 = [(StoreDownloadQueueRequest *)v4 queueContentsURLBagKey];

  return v5;
}

@end