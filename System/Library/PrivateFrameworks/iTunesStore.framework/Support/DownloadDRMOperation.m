@interface DownloadDRMOperation
- (BOOL)_checkoutRentalKeys:(id *)a3;
- (BOOL)_decryptAsset:(id *)a3;
- (BOOL)_unprotectMediaAsset:(id *)a3;
- (id)_sinfs;
- (void)operation:(id)a3 updatedProgress:(id)a4;
- (void)run;
@end

@implementation DownloadDRMOperation

- (void)run
{
  v3 = [(FinishDownloadStepOperation *)self download];
  v4 = [v3 mediaAsset];
  v5 = objc_alloc_init(FinishDownloadResponse);
  -[FinishDownloadResponse setDownloadIdentifier:](v5, "setDownloadIdentifier:", [v3 databaseID]);
  -[FinishDownloadResponse setMediaAssetIdentifier:](v5, "setMediaAssetIdentifier:", [v4 databaseID]);
  [(FinishDownloadResponse *)v5 setResult:4];
  v6 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]([DownloadHandle alloc], "initWithTransactionIdentifier:downloadIdentifier:", [v3 transactionID], objc_msgSend(v3, "databaseID"));
  [(FinishDownloadResponse *)v5 setDownloadHandle:v6];
  v7 = [v3 downloadKind];
  v8 = [v4 DPInfoData];
  if (v8
    || (SSDownloadKindIsEBookKind() & 1) != 0
    || [v7 isEqualToString:SSDownloadKindInAppContent])
  {
    id v17 = 0;
    unsigned __int8 v9 = [(DownloadDRMOperation *)self _decryptAsset:&v17];
    id v10 = v17;
    if (v9)
    {
LABEL_6:

      goto LABEL_7;
    }
LABEL_5:
    [(FinishDownloadResponse *)v5 setError:v10];
    [(FinishDownloadResponse *)v5 setResult:0];
    goto LABEL_6;
  }
  if ((SSDownloadKindIsMediaKind() & 1) != 0 || SSDownloadKindIsToneKind())
  {
    id v16 = 0;
    unsigned int v11 = [(DownloadDRMOperation *)self _unprotectMediaAsset:&v16];
    id v12 = v16;
    id v10 = v12;
    if (v11)
    {
      id v15 = v12;
      unsigned __int8 v13 = [(DownloadDRMOperation *)self _checkoutRentalKeys:&v15];
      id v14 = v15;

      id v10 = v14;
      if (v13) {
        goto LABEL_6;
      }
    }
    goto LABEL_5;
  }
LABEL_7:
  [(FinishDownloadStepOperation *)self finishWithDownloadResponse:v5];
}

- (void)operation:(id)a3 updatedProgress:(id)a4
{
  uint64_t v4 = OBJC_IVAR___ISOperation__progress;
  if (*(void *)&self->super.ISOperation_opaque[OBJC_IVAR___ISOperation__progress])
  {
    id v6 = objc_msgSend(a4, "copy", a3);
    v7 = *(void **)&self->super.ISOperation_opaque[v4];
    *(void *)&self->super.ISOperation_opaque[v4] = v6;

    id v8 = [(DownloadDRMOperation *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 operation:self updatedProgress:*(void *)&self->super.ISOperation_opaque[v4]];
    }
  }
}

- (BOOL)_checkoutRentalKeys:(id *)a3
{
  v5 = [(FinishDownloadStepOperation *)self download];
  id v6 = [v5 storeMetadata];
  unsigned int v7 = [v6 isRental];

  if (!v7) {
    goto LABEL_32;
  }
  id v8 = [(DownloadDRMOperation *)self _sinfs];
  unsigned __int8 v9 = [v5 storeMetadata];
  id v10 = [v9 rentalID];

  if (!v8)
  {
    if (v10)
    {
      v21 = +[SSAccountStore defaultStore];
      v22 = [v21 activeAccount];
      v18 = [v22 uniqueIdentifier];

      if (!v18)
      {
        id v20 = 0;
        unsigned __int8 v19 = 1;
        goto LABEL_15;
      }
      v23 = +[SSLogConfig sharedDaemonConfig];
      if (!v23)
      {
        v23 = +[SSLogConfig sharedConfig];
      }
      unsigned int v24 = [v23 shouldLog];
      if ([v23 shouldLogToDisk]) {
        int v25 = v24 | 2;
      }
      else {
        int v25 = v24;
      }
      v26 = [v23 OSLogObject];
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
        v25 &= 2u;
      }
      if (v25)
      {
        v27 = objc_opt_class();
        id v32 = v27;
        int v35 = 138412546;
        v36 = v27;
        __int16 v37 = 2048;
        id v38 = [v5 databaseID];
        LODWORD(v31) = 22;
        v28 = (void *)_os_log_send_and_compose_impl();

        if (!v28)
        {
LABEL_31:

          v29 = [[CheckoutRentalKeysOperation alloc] initWithAccountIdentifier:v18 rentalKeyIdentifier:v10];
          [(CheckoutRentalKeysOperation *)v29 setCheckoutType:1];
          id v33 = 0;
          unsigned __int8 v19 = [(DownloadDRMOperation *)self runSubOperation:v29 returningError:&v33];
          id v20 = v33;

          goto LABEL_15;
        }
        v26 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v35, v31);
        free(v28);
        SSFileLog();
      }

      goto LABEL_31;
    }
LABEL_32:
    id v20 = 0;
    unsigned __int8 v19 = 1;
    goto LABEL_33;
  }
  unsigned int v11 = +[SSLogConfig sharedDaemonConfig];
  if (!v11)
  {
    unsigned int v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  id v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
    v13 &= 2u;
  }
  if (!v13) {
    goto LABEL_13;
  }
  id v15 = objc_opt_class();
  id v16 = v15;
  int v35 = 138412546;
  v36 = v15;
  __int16 v37 = 2048;
  id v38 = [v5 databaseID];
  LODWORD(v31) = 22;
  id v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    id v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v35, v31);
    free(v17);
    SSFileLog();
LABEL_13:
  }
  v18 = [[CheckoutRentalKeysOperation alloc] initWithStoreDownloadSinfs:v8];
  [(CheckoutRentalKeysOperation *)v18 setCheckoutType:1];
  id v34 = 0;
  unsigned __int8 v19 = [(DownloadDRMOperation *)self runSubOperation:v18 returningError:&v34];
  id v20 = v34;
LABEL_15:

  if (a3 && (v19 & 1) == 0)
  {
    id v20 = v20;
    unsigned __int8 v19 = 0;
    *a3 = v20;
  }
LABEL_33:

  return v19;
}

- (BOOL)_decryptAsset:(id *)a3
{
  v5 = [(FinishDownloadStepOperation *)self download];
  id v6 = [v5 mediaAsset];
  unsigned int v7 = [v6 DPInfoData];
  if (![v7 length])
  {
    id v8 = [(DownloadDRMOperation *)self _sinfs];
    if (v8)
    {
      unsigned __int8 v9 = [[DownloadDRM alloc] initWithSinfArray:v8];
      uint64_t v10 = [(DownloadDRM *)v9 firstDataForSinfDataKey:off_100400C58];

      unsigned int v7 = (void *)v10;
    }
  }
  if ([v7 length])
  {
    unsigned int v11 = [v6 localPath];
    unsigned int v12 = +[SSLogConfig sharedDaemonConfig];
    if (!v12)
    {
      unsigned int v12 = +[SSLogConfig sharedConfig];
    }
    v27 = v5;
    unsigned int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    id v15 = [v12 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      int v16 = v14;
    }
    else {
      int v16 = v14 & 2;
    }
    if (v16)
    {
      id v17 = a3;
      v18 = objc_opt_class();
      id v19 = v18;
      int v29 = 138412802;
      v30 = v18;
      a3 = v17;
      __int16 v31 = 2048;
      id v32 = [v27 databaseID];
      __int16 v33 = 2112;
      id v34 = v11;
      LODWORD(v26) = 32;
      id v20 = (void *)_os_log_send_and_compose_impl();

      if (v20)
      {
        v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v29, v26);
        free(v20);
        SSFileLog();
      }
    }
    else
    {
    }
    unsigned int v24 = [[FairPlayDecryptFileOperation alloc] initWithPath:v11 dpInfo:v7];
    [(FairPlayDecryptFileOperation *)v24 setDelegate:self];
    [(FairPlayDecryptFileOperation *)v24 setShouldRunWithBackgroundPriority:1];
    id v28 = 0;
    unsigned __int8 v23 = [(DownloadDRMOperation *)self runSubOperation:v24 returningError:&v28];
    id v22 = v28;
    [(FairPlayDecryptFileOperation *)v24 setDelegate:0];

    if (a3)
    {
      v5 = v27;
      if ((v23 & 1) == 0)
      {
        id v22 = v22;
        unsigned __int8 v23 = 0;
        *a3 = v22;
      }
    }
    else
    {
      v5 = v27;
    }
  }
  else
  {
    id v22 = 0;
    unsigned __int8 v23 = 1;
  }

  return v23;
}

- (id)_sinfs
{
  v2 = [(FinishDownloadStepOperation *)self download];
  v3 = [v2 mediaAsset];
  uint64_t v4 = [v3 SINFData];

  if (v4)
  {
    v5 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:0];
  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [v2 storeMetadata];
    uint64_t v7 = [v6 sinfs];

    v5 = (void *)v7;
  }
  id v8 = [v2 storeSagaIdentifier];

  if (v8)
  {
    id v19 = v4;
    id v20 = v2;
    id v9 = objc_alloc_init((Class)NSMutableArray);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v16 = [v15 mutableCopy];
            id v17 = [v16 objectForKey:@"pinf"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && ![v17 length]) {
              [v16 removeObjectForKey:@"pinf"];
            }
            objc_msgSend(v9, "addObject:", v16, v19, v20, (void)v21);
          }
          else
          {
            [v9 addObject:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    uint64_t v4 = v19;
    v2 = v20;
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (BOOL)_unprotectMediaAsset:(id *)a3
{
  v5 = [(DownloadDRMOperation *)self _sinfs];
  id v6 = [(FinishDownloadStepOperation *)self download];
  unsigned __int8 v7 = [v6 isHLS];
  id v8 = 0;
  unsigned __int8 v9 = 1;
  if (!v5 || (v7 & 1) != 0) {
    goto LABEL_33;
  }
  id v34 = a3;
  int v35 = [(FinishDownloadStepOperation *)self download];
  id v10 = [v35 mediaAsset];
  id v11 = [v10 localPath];

  id v12 = +[SSLogConfig sharedDaemonConfig];
  if (!v12)
  {
    id v12 = +[SSLogConfig sharedConfig];
  }
  unsigned int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  id v15 = [v12 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
    int v16 = v14;
  }
  else {
    int v16 = v14 & 2;
  }
  if (v16)
  {
    id v17 = objc_opt_class();
    id v18 = v17;
    int v37 = 138412802;
    id v38 = v17;
    __int16 v39 = 2048;
    id v40 = [v35 databaseID];
    __int16 v41 = 2112;
    v42 = v11;
    LODWORD(v31) = 32;
    v30 = &v37;
    id v19 = (void *)_os_log_send_and_compose_impl();

    if (!v19) {
      goto LABEL_15;
    }
    id v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v37, v31);
    free(v19);
    v30 = (int *)v15;
    SSFileLog();
  }

LABEL_15:
  id v20 = [[MediaDRMOperation alloc] initWithMediaPath:v11 sinfs:v5];
  [(MediaDRMOperation *)v20 setDelegate:self];
  [(MediaDRMOperation *)v20 setShouldRunWithBackgroundPriority:1];
  id v36 = 0;
  unsigned __int8 v9 = [(DownloadDRMOperation *)self runSubOperation:v20 returningError:&v36];
  id v8 = v36;
  [(MediaDRMOperation *)v20 setDelegate:0];
  if ((v9 & 1) == 0)
  {
    id v33 = objc_alloc_init((Class)NSFileManager);
    [v33 removeItemAtPath:v11 error:0];
    long long v21 = +[SSLogConfig sharedDaemonConfig];
    if (!v21)
    {
      long long v21 = +[SSLogConfig sharedConfig];
    }
    unsigned int v22 = objc_msgSend(v21, "shouldLog", v30);
    if ([v21 shouldLogToDisk]) {
      v22 |= 2u;
    }
    long long v23 = [v21 OSLogObject];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      v22 &= 2u;
    }
    if (v22)
    {
      long long v24 = objc_opt_class();
      id v32 = v24;
      id v25 = [v35 databaseID];
      int v37 = 138412802;
      id v38 = v24;
      __int16 v39 = 2048;
      id v40 = v25;
      __int16 v41 = 2112;
      v42 = v11;
      LODWORD(v31) = 32;
      uint64_t v26 = (void *)_os_log_send_and_compose_impl();

      v27 = v33;
      if (!v26)
      {
LABEL_27:

        goto LABEL_28;
      }
      long long v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v37, v31);
      free(v26);
      SSFileLog();
    }
    else
    {
      v27 = v33;
    }

    goto LABEL_27;
  }
LABEL_28:

  if (v34) {
    char v28 = v9;
  }
  else {
    char v28 = 1;
  }
  if ((v28 & 1) == 0)
  {
    id v8 = v8;
    unsigned __int8 v9 = 0;
    *id v34 = v8;
  }
LABEL_33:

  return v9;
}

@end