@interface RefreshITunesMatchDownloadOperation
- (BOOL)_applyResultsOfOperation:(id)a3 toDownload:(id)a4 error:(id *)a5;
- (BOOL)_refreshDownload:(id)a3 error:(id *)a4;
- (RefreshITunesMatchDownloadOperation)initWithDownloadIdentifier:(int64_t)a3;
- (id)_newPurchaseForDownload:(id)a3;
- (int64_t)downloadIdentifier;
- (void)run;
@end

@implementation RefreshITunesMatchDownloadOperation

- (RefreshITunesMatchDownloadOperation)initWithDownloadIdentifier:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RefreshITunesMatchDownloadOperation;
  result = [(RefreshITunesMatchDownloadOperation *)&v5 init];
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
  v9 = sub_10018DA84;
  v10 = sub_10018DA94;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10018DAA0;
  v5[3] = &unk_1003A8670;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "readUsingTransactionBlock:", v5);
  uint64_t v4 = 0;
  BOOL v3 = [(RefreshITunesMatchDownloadOperation *)self _refreshDownload:v7[5] error:&v4];
  [(RefreshITunesMatchDownloadOperation *)self setError:v4];
  [(RefreshITunesMatchDownloadOperation *)self setSuccess:v3];

  _Block_object_dispose(&v6, 8);
}

- (BOOL)_applyResultsOfOperation:(id)a3 toDownload:(id)a4 error:(id *)a5
{
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  v7 = -[StoreDownloadQueueResponse initWithDictionary:userIdentifier:preferredAssetFlavor:]([StoreDownloadQueueResponse alloc], "initWithDictionary:userIdentifier:preferredAssetFlavor:", [a3 rawOutput], objc_msgSend(a4, "valueForProperty:", @"store_account_id"), objc_msgSend(a4, "valueForProperty:", @"preferred_asset_flavor"));
  uint64_t v8 = [(StoreDownloadQueueResponse *)v7 downloads];
  if ((id)[(NSOrderedSet *)v8 count] == (id)1)
  {
    v9 = [[Download alloc] initWithStoreDownload:[(NSOrderedSet *)v8 objectAtIndex:0]];
    if (v9)
    {
      id v10 = +[SSLogConfig sharedDaemonConfig];
      if (!v10) {
        id v10 = +[SSLogConfig sharedConfig];
      }
      unsigned int v11 = [v10 shouldLog];
      unsigned int v12 = [v10 shouldLogToDisk];
      v13 = [v10 OSLogObject];
      if (v12) {
        v11 |= 2u;
      }
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        v11 &= 2u;
      }
      if (v11)
      {
        uint64_t v14 = objc_opt_class();
        int64_t downloadID = self->_downloadID;
        id v16 = [(Download *)v9 valueForProperty:@"store_download_key"];
        int v40 = 138412802;
        uint64_t v41 = v14;
        __int16 v42 = 2048;
        int64_t v43 = downloadID;
        __int16 v44 = 2112;
        id v45 = v16;
        LODWORD(v34) = 32;
        v33 = &v40;
        uint64_t v17 = _os_log_send_and_compose_impl();
        if (v17)
        {
          v18 = (void *)v17;
          v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v40, v34);
          free(v18);
          v33 = (int *)v19;
          SSFileLog();
        }
      }
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10018E01C;
      v35[3] = &unk_1003A8698;
      v35[5] = v9;
      v35[6] = &v36;
      v35[4] = self;
      objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", v33), "modifyUsingTransactionBlock:", v35);
    }
  }
  else
  {
    id v20 = +[SSLogConfig sharedDaemonConfig];
    if (!v20) {
      id v20 = +[SSLogConfig sharedConfig];
    }
    unsigned int v21 = [v20 shouldLog];
    unsigned int v22 = [v20 shouldLogToDisk];
    v23 = [v20 OSLogObject];
    if (v22) {
      v21 |= 2u;
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      v21 &= 2u;
    }
    if (v21)
    {
      uint64_t v24 = objc_opt_class();
      int64_t v25 = self->_downloadID;
      id v26 = [(NSOrderedSet *)v8 count];
      int v40 = 138412802;
      uint64_t v41 = v24;
      __int16 v42 = 2048;
      int64_t v43 = v25;
      __int16 v44 = 2048;
      id v45 = v26;
      LODWORD(v34) = 32;
      uint64_t v27 = _os_log_send_and_compose_impl();
      if (v27)
      {
        v28 = (void *)v27;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, &v40, v34);
        free(v28);
        SSFileLog();
      }
    }
  }

  v29 = v37;
  int v30 = *((unsigned __int8 *)v37 + 24);
  if (a5 && !*((unsigned char *)v37 + 24))
  {
    *a5 = 0;
    int v30 = *((unsigned __int8 *)v29 + 24);
  }
  BOOL v31 = v30 != 0;
  _Block_object_dispose(&v36, 8);
  return v31;
}

- (id)_newPurchaseForDownload:(id)a3
{
  id v4 = [a3 valueForProperty:@"store_account_id"];
  id v5 = [a3 valueForProperty:@"store_redownload_parameters"];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 0;
  }
  id v7 = v5;
  id v8 = objc_alloc_init((Class)SSPurchase);
  [v8 setAccountIdentifier:v4];
  [v8 setBuyParameters:v7];
  [v8 setIgnoresForcedPasswordRestriction:1];
  id v9 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v9 setURLBagKey:@"paidRedownloadProduct"];
  [v8 setRequestProperties:v9];

  return v8;
}

- (BOOL)_refreshDownload:(id)a3 error:(id *)a4
{
  unsigned int v22 = 0;
  id v7 = -[RefreshITunesMatchDownloadOperation _newPurchaseForDownload:](self, "_newPurchaseForDownload:");
  if (!v7)
  {
    BOOL v18 = 0;
    if (!a4) {
      return v18;
    }
    goto LABEL_18;
  }
  id v8 = v7;
  id v9 = [[PurchaseOperation alloc] initWithPurchase:v7];
  [(PurchaseOperation *)v9 setShouldSendKeyBagSyncData:1];
  id v10 = +[SSLogConfig sharedDaemonConfig];
  if (!v10) {
    id v10 = +[SSLogConfig sharedConfig];
  }
  unsigned int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_INFO)) {
    v12 &= 2u;
  }
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    int64_t downloadID = self->_downloadID;
    int v23 = 138412802;
    uint64_t v24 = v13;
    __int16 v25 = 2048;
    int64_t v26 = downloadID;
    __int16 v27 = 2112;
    id v28 = [v8 buyParameters];
    LODWORD(v21) = 32;
    id v20 = &v23;
    uint64_t v15 = _os_log_send_and_compose_impl();
    if (v15)
    {
      id v16 = (void *)v15;
      uint64_t v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v23, v21);
      free(v16);
      id v20 = (int *)v17;
      SSFileLog();
    }
  }
  if (-[RefreshITunesMatchDownloadOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v9, &v22, v20))BOOL v18 = [(RefreshITunesMatchDownloadOperation *)self _applyResultsOfOperation:v9 toDownload:a3 error:&v22]; {
  else
  }
    BOOL v18 = 0;

  if (a4)
  {
LABEL_18:
    if (!v18) {
      *a4 = v22;
    }
  }
  return v18;
}

@end