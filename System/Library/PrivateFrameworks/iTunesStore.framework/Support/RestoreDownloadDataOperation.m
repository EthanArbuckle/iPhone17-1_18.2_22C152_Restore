@interface RestoreDownloadDataOperation
- (BOOL)_isFatalRestoreError:(id)a3;
- (BOOL)_restoreDataForBundleID:(id)a3 restoreState:(int64_t)a4 error:(id *)a5;
- (void)operation:(id)a3 updatedProgress:(id)a4;
- (void)run;
@end

@implementation RestoreDownloadDataOperation

- (void)run
{
  v3 = objc_alloc_init(FinishDownloadResponse);
  [(FinishDownloadResponse *)v3 setResult:4];
  v55 = self;
  v4 = [(FinishDownloadStepOperation *)self download];
  -[FinishDownloadResponse setDownloadIdentifier:](v3, "setDownloadIdentifier:", [v4 databaseID]);
  v52 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]([DownloadHandle alloc], "initWithTransactionIdentifier:downloadIdentifier:", [v4 transactionID], objc_msgSend(v4, "databaseID"));
  -[FinishDownloadResponse setDownloadHandle:](v3, "setDownloadHandle:");
  v51 = [v4 mediaAsset];
  -[FinishDownloadResponse setMediaAssetIdentifier:](v3, "setMediaAssetIdentifier:", [v51 databaseID]);
  id v5 = [v4 restoreState];
  v6 = [v4 bundleIdentifier];
  unsigned int v7 = +[ApplicationWorkspace keepSafeHarborDataForBundleID:v6];

  v8 = &syslog_ptr;
  if (v7)
  {
    v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9)
    {
      v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    v12 = [v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      int v13 = v11;
    }
    else {
      int v13 = v11 & 2;
    }
    if (v13)
    {
      v14 = objc_opt_class();
      id v53 = v14;
      id v15 = [v4 databaseID];
      v16 = [v4 bundleIdentifier];
      int v57 = 138412802;
      v58 = v14;
      __int16 v59 = 2048;
      int64_t v60 = (int64_t)v15;
      __int16 v61 = 2112;
      id v62 = v16;
      LODWORD(v47) = 32;
      v45 = &v57;
      v17 = (void *)_os_log_send_and_compose_impl();

      v8 = &syslog_ptr;
      if (v17)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v57, v47);
        v18 = (int *)objc_claimAutoreleasedReturnValue();
        free(v17);
        v45 = v18;
        SSFileLog();
      }
    }
    else
    {
    }
  }
  v19 = objc_msgSend(v4, "bundleIdentifier", v45);
  id v56 = 0;
  v20 = v55;
  unsigned __int8 v21 = [(RestoreDownloadDataOperation *)v55 _restoreDataForBundleID:v19 restoreState:v5 error:&v56];
  id v22 = v56;

  v54 = v3;
  if ((v21 & 1) == 0)
  {
    [(FinishDownloadResponse *)v3 setError:v22];
    uint64_t v33 = 0;
    goto LABEL_32;
  }
  if (v5 != (id)1) {
    goto LABEL_33;
  }
  if (!v7)
  {
    uint64_t v33 = 3;
    goto LABEL_32;
  }
  v23 = [v8[405] sharedDaemonConfig];
  if (!v23)
  {
    v23 = [v8[405] sharedConfig];
  }
  unsigned int v24 = [v23 shouldLog];
  if ([v23 shouldLogToDisk]) {
    v24 |= 2u;
  }
  v25 = [v23 OSLogObject];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
    int v26 = v24;
  }
  else {
    int v26 = v24 & 2;
  }
  if (!v26) {
    goto LABEL_28;
  }
  v27 = objc_opt_class();
  id v49 = v27;
  int64_t v48 = [(FinishDownloadResponse *)v3 result];
  v28 = v8;
  id v29 = [v4 databaseID];
  [v4 bundleIdentifier];
  v31 = id v30 = v22;
  int v57 = 138413058;
  v58 = v27;
  __int16 v59 = 2048;
  int64_t v60 = v48;
  __int16 v61 = 2048;
  id v62 = v29;
  v8 = v28;
  __int16 v63 = 2112;
  v64 = v31;
  LODWORD(v47) = 42;
  v46 = &v57;
  v32 = (void *)_os_log_send_and_compose_impl();

  id v22 = v30;
  v3 = v54;

  if (v32)
  {
    v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v57, v47);
    free(v32);
    v46 = (int *)v25;
    SSFileLog();
LABEL_28:
  }
  uint64_t v33 = 7;
LABEL_32:
  -[FinishDownloadResponse setResult:](v3, "setResult:", v33, v46);
LABEL_33:
  v34 = [v8[405] sharedDaemonConfig];
  if (!v34)
  {
    v34 = [v8[405] sharedConfig];
  }
  unsigned int v35 = [v34 shouldLog];
  if ([v34 shouldLogToDisk]) {
    v35 |= 2u;
  }
  v36 = [v34 OSLogObject];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO)) {
    int v37 = v35;
  }
  else {
    int v37 = v35 & 2;
  }
  if (!v37)
  {
    v40 = v54;
    goto LABEL_44;
  }
  v38 = objc_opt_class();
  id v50 = v22;
  id v39 = v38;
  v40 = v54;
  int64_t v41 = [(FinishDownloadResponse *)v54 result];
  id v42 = [v4 databaseID];
  v43 = [v4 bundleIdentifier];
  int v57 = 138413058;
  v58 = v38;
  __int16 v59 = 2048;
  int64_t v60 = v41;
  __int16 v61 = 2048;
  id v62 = v42;
  __int16 v63 = 2112;
  v64 = v43;
  LODWORD(v47) = 42;
  v44 = (void *)_os_log_send_and_compose_impl();

  v20 = v55;
  id v22 = v50;

  if (v44)
  {
    v36 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v44, 4, &v57, v47);
    free(v44);
    SSFileLog();
LABEL_44:
  }
  [(FinishDownloadStepOperation *)v20 finishWithDownloadResponse:v40];
}

- (void)operation:(id)a3 updatedProgress:(id)a4
{
  uint64_t v4 = OBJC_IVAR___ISOperation__progress;
  if (*(void *)&self->super.ISOperation_opaque[OBJC_IVAR___ISOperation__progress])
  {
    id v6 = objc_msgSend(a4, "copy", a3);
    unsigned int v7 = *(void **)&self->super.ISOperation_opaque[v4];
    *(void *)&self->super.ISOperation_opaque[v4] = v6;

    id v8 = [(RestoreDownloadDataOperation *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 operation:self updatedProgress:*(void *)&self->super.ISOperation_opaque[v4]];
    }
  }
}

- (BOOL)_isFatalRestoreError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:@"MBErrorDomain"];

  if (v5 && (v6 = [v3 code], (unsigned int v7 = (uint64_t (*)(id))ISWeakLinkedSymbolForString()) != 0)) {
    char v8 = v7(v6);
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_restoreDataForBundleID:(id)a3 restoreState:(int64_t)a4 error:(id *)a5
{
  id v70 = a3;
  id v6 = [(FinishDownloadStepOperation *)self download];
  id v69 = [v6 databaseID];

  unsigned int v7 = 0;
  uint64_t v8 = 1;
  v9 = &syslog_ptr;
  while (1)
  {
    unsigned int v10 = [v9[405] sharedDaemonConfig];
    if (!v10)
    {
      unsigned int v10 = [v9[405] sharedConfig];
    }
    unsigned int v11 = objc_msgSend(v10, "shouldLog", v63);
    if ([v10 shouldLogToDisk]) {
      v11 |= 2u;
    }
    v12 = [v10 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      int v13 = v11;
    }
    else {
      int v13 = v11 & 2;
    }
    if (v13)
    {
      v14 = objc_opt_class();
      int v73 = 138413058;
      v74 = v14;
      __int16 v75 = 2048;
      *(void *)v76 = v8;
      *(_WORD *)&v76[8] = 2048;
      *(void *)&v76[10] = v69;
      *(_WORD *)&v76[18] = 2112;
      *(void *)&v76[20] = v70;
      id v15 = v14;
      LODWORD(v66) = 42;
      v64 = &v73;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16) {
        goto LABEL_13;
      }
      v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v73, v66);
      free(v16);
      v64 = (int *)v12;
      SSFileLog();
    }

LABEL_13:
    v17 = [v9[405] sharedDaemonConfig];
    if (!v17)
    {
      v17 = [v9[405] sharedConfig];
    }
    v18 = v9;
    unsigned int v19 = objc_msgSend(v17, "shouldLog", v64);
    if ([v17 shouldLogToDisk]) {
      v19 |= 2u;
    }
    v20 = [v17 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      int v21 = v19;
    }
    else {
      int v21 = v19 & 2;
    }
    if (v21)
    {
      id v22 = objc_opt_class();
      id v23 = v22;
      unsigned int v24 = [(FinishDownloadStepOperation *)self download];
      id v25 = [v24 priority];
      int v73 = 138412546;
      v74 = v22;
      __int16 v75 = 2048;
      *(void *)v76 = v25;
      LODWORD(v66) = 22;
      v65 = &v73;
      int v26 = (void *)_os_log_send_and_compose_impl();

      if (!v26) {
        goto LABEL_24;
      }
      v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v73, v66);
      free(v26);
      v65 = (int *)v20;
      SSFileLog();
    }

LABEL_24:
    v27 = [RestoreBackupOperation alloc];
    v28 = [(FinishDownloadStepOperation *)self download];
    id v29 = -[RestoreBackupOperation initWithBundleIdentifier:withPriority:isFailed:](v27, "initWithBundleIdentifier:withPriority:isFailed:", v70, [v28 priority], a4 == 1);

    [(RestoreBackupOperation *)v29 setDelegate:self];
    id v72 = v7;
    unsigned __int8 v30 = [(RestoreDownloadDataOperation *)self runSubOperation:v29 returningError:&v72];
    id v31 = v72;

    [(RestoreBackupOperation *)v29 setDelegate:0];
    if (v30) {
      goto LABEL_52;
    }
    if ([(RestoreDownloadDataOperation *)self _isFatalRestoreError:v31])
    {
      v40 = [v18[405] sharedDaemonConfig];
      if (!v40)
      {
        v40 = [v18[405] sharedConfig];
      }
      unsigned int v41 = objc_msgSend(v40, "shouldLog", v65);
      if ([v40 shouldLogToDisk]) {
        v41 |= 2u;
      }
      id v42 = [v40 OSLogObject];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
        int v43 = v41;
      }
      else {
        int v43 = v41 & 2;
      }
      if (v43)
      {
        v44 = objc_opt_class();
        int v73 = 138412802;
        v74 = v44;
        __int16 v75 = 2048;
        *(void *)v76 = v69;
        *(_WORD *)&v76[8] = 2112;
        *(void *)&v76[10] = v31;
        id v45 = v44;
        LODWORD(v66) = 32;
        v46 = (void *)_os_log_send_and_compose_impl();

        if (v46)
        {
          id v42 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v46, 4, &v73, v66);
          free(v46);
          SSFileLog();
          goto LABEL_50;
        }
      }
      else
      {
LABEL_50:
      }
LABEL_52:

      BOOL v47 = 1;
      goto LABEL_86;
    }
    v9 = v18;
    if (sub_1000682BC(v31))
    {
      v34 = [v18[405] sharedDaemonConfig];
      if (!v34)
      {
        v34 = [v18[405] sharedConfig];
      }
      unsigned int v48 = objc_msgSend(v34, "shouldLog", v65);
      if ([v34 shouldLogToDisk]) {
        v48 |= 2u;
      }
      id v49 = [v34 OSLogObject];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
        int v50 = v48;
      }
      else {
        int v50 = v48 & 2;
      }
      if (v50)
      {
        v51 = objc_opt_class();
        int v73 = 138412802;
        v74 = v51;
        __int16 v75 = 2048;
        *(void *)v76 = v69;
        *(_WORD *)&v76[8] = 2112;
        *(void *)&v76[10] = v31;
        id v52 = v51;
        LODWORD(v66) = 32;
        goto LABEL_80;
      }
LABEL_82:
      int64_t v60 = context;
      __int16 v61 = a5;

      goto LABEL_84;
    }
    if ((unint64_t)v8 >= 3)
    {
      v34 = [v18[405] sharedDaemonConfig];
      if (!v34)
      {
        v34 = [v18[405] sharedConfig];
      }
      unsigned int v53 = objc_msgSend(v34, "shouldLog", v65);
      if ([v34 shouldLogToDisk]) {
        v53 |= 2u;
      }
      id v49 = [v34 OSLogObject];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
        int v54 = v53;
      }
      else {
        int v54 = v53 & 2;
      }
      if (!v54) {
        goto LABEL_82;
      }
      v55 = objc_opt_class();
      int v73 = 138413058;
      v74 = v55;
      __int16 v75 = 1024;
      *(_DWORD *)v76 = 3;
      *(_WORD *)&v76[4] = 2048;
      *(void *)&v76[6] = v69;
      *(_WORD *)&v76[14] = 2112;
      *(void *)&v76[16] = v31;
      id v52 = v55;
      LODWORD(v66) = 38;
      goto LABEL_80;
    }
    unsigned int v32 = [(RestoreDownloadDataOperation *)self isCancelled];
    uint64_t v33 = [v18[405] sharedDaemonConfig];
    v34 = (void *)v33;
    if (v32) {
      break;
    }
    if (!v33)
    {
      v34 = [v18[405] sharedConfig];
    }
    unsigned int v35 = objc_msgSend(v34, "shouldLog", v65);
    if ([v34 shouldLogToDisk]) {
      v35 |= 2u;
    }
    v36 = [v34 OSLogObject];
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      v35 &= 2u;
    }
    if (v35)
    {
      int v37 = objc_opt_class();
      int v73 = 138412802;
      v74 = v37;
      __int16 v75 = 2048;
      *(void *)v76 = v69;
      *(_WORD *)&v76[8] = 2112;
      *(void *)&v76[10] = v31;
      id v38 = v37;
      LODWORD(v66) = 32;
      __int16 v63 = &v73;
      id v39 = (void *)_os_log_send_and_compose_impl();

      v9 = v18;
      if (!v39) {
        goto LABEL_39;
      }
      v36 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v39, 4, &v73, v66);
      free(v39);
      __int16 v63 = (int *)v36;
      SSFileLog();
    }

LABEL_39:
    +[NSThread sleepForTimeInterval:(double)v8++ * 10.0];

    unsigned int v7 = v31;
  }
  if (!v33)
  {
    v34 = [v18[405] sharedConfig];
  }
  unsigned int v56 = objc_msgSend(v34, "shouldLog", v65);
  if ([v34 shouldLogToDisk]) {
    v56 |= 2u;
  }
  id v49 = [v34 OSLogObject];
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
    int v57 = v56;
  }
  else {
    int v57 = v56 & 2;
  }
  if (!v57) {
    goto LABEL_82;
  }
  v58 = objc_opt_class();
  int v73 = 138413058;
  v74 = v58;
  __int16 v75 = 2048;
  *(void *)v76 = v8;
  *(_WORD *)&v76[8] = 2048;
  *(void *)&v76[10] = v69;
  *(_WORD *)&v76[18] = 2112;
  *(void *)&v76[20] = v70;
  id v52 = v58;
  LODWORD(v66) = 42;
LABEL_80:
  __int16 v59 = (void *)_os_log_send_and_compose_impl();

  if (v59)
  {
    id v49 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v59, 4, &v73, v66);
    free(v59);
    SSFileLog();
    goto LABEL_82;
  }
  int64_t v60 = context;
  __int16 v61 = a5;
LABEL_84:

  BOOL v47 = 0;
  if (v61) {
    *__int16 v61 = v31;
  }
LABEL_86:

  return v47;
}

@end