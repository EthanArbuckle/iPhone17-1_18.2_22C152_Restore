@interface InstallDownloadOperation
- (void)operation:(id)a3 updatedProgress:(id)a4;
- (void)run;
@end

@implementation InstallDownloadOperation

- (void)run
{
  v3 = [(FinishDownloadStepOperation *)self download];
  v4 = [v3 downloadKind];
  if (SSDownloadKindIsSoftwareKind())
  {
    v5 = off_1003A18A0;
  }
  else if (SSDownloadKindIsMediaKind() & 1) != 0 || (SSDownloadKindIsPodcastKind())
  {
    v5 = off_1003A1890;
  }
  else
  {
    v5 = off_1003A1888;
    if ((SSDownloadKindIsEBookKind() & 1) == 0)
    {
      if (SSDownloadKindIsToneKind())
      {
        v5 = &off_1003A18A8;
      }
      else if ([v4 isEqualToString:SSDownloadKindInAppContent])
      {
        v5 = off_1003A1898;
      }
      else
      {
        v30 = [v3 documentTargetIdentifier];
        unsigned int v31 = [v30 isEqualToString:@"com.apple.iBooks"];

        if (!v31) {
          v5 = off_1003A1880;
        }
      }
    }
  }
  id v6 = [objc_alloc(*v5) initWithDownload:v3];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_1000F38F4;
  v39 = sub_1000F3904;
  id v40 = 0;
  if (!v6)
  {
    v15 = +[SSLogConfig sharedDaemonConfig];
    if (!v15)
    {
      v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    unsigned int v17 = [v15 shouldLogToDisk];
    v18 = [v15 OSLogObject];
    v19 = v18;
    if (v17) {
      v16 |= 2u;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      id v20 = (id)objc_opt_class();
      id v21 = [v3 databaseID];
      int v41 = 138412546;
      id v42 = v20;
      __int16 v43 = 2048;
      id v44 = v21;
      LODWORD(v33) = 22;
      v32 = &v41;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_28:

        v23 = objc_alloc_init(FinishDownloadResponse);
        v24 = (void *)v36[5];
        v36[5] = (uint64_t)v23;

        objc_msgSend((id)v36[5], "setDownloadIdentifier:", objc_msgSend(v3, "databaseID"));
        v25 = (void *)v36[5];
        v26 = [v3 mediaAsset];
        objc_msgSend(v25, "setMediaAssetIdentifier:", objc_msgSend(v26, "databaseID"));

        [(id)v36[5] setResult:0];
        v27 = (void *)v36[5];
        v28 = SSError();
        [v27 setError:v28];

        v29 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]([DownloadHandle alloc], "initWithTransactionIdentifier:downloadIdentifier:", [v3 transactionID], objc_msgSend(v3, "databaseID"));
        [(id)v36[5] setDownloadHandle:v29];

        goto LABEL_29;
      }
      v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v41, v33);
      free(v22);
      v32 = (int *)v19;
      SSFileLog();
    }

    goto LABEL_28;
  }
  v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  unsigned int v9 = [v7 shouldLogToDisk];
  v10 = [v7 OSLogObject];
  v11 = v10;
  if (v9) {
    v8 |= 2u;
  }
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    v8 &= 2u;
  }
  if (!v8) {
    goto LABEL_16;
  }
  id v12 = (id)objc_opt_class();
  id v13 = [v3 databaseID];
  int v41 = 138412802;
  id v42 = v12;
  __int16 v43 = 2048;
  id v44 = v13;
  __int16 v45 = 2112;
  id v46 = v6;
  LODWORD(v33) = 32;
  v32 = &v41;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v41, v33);
    free(v14);
    v32 = (int *)v11;
    SSFileLog();
LABEL_16:
  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000F390C;
  v34[3] = &unk_1003A6460;
  v34[4] = &v35;
  [v6 setOutputBlock:v34];
  [v6 setDelegate:self];
  [(InstallDownloadOperation *)self runSubOperation:v6 returningError:0];
  [v6 setDelegate:0];
LABEL_29:
  -[FinishDownloadStepOperation finishWithDownloadResponse:](self, "finishWithDownloadResponse:", v36[5], v32);
  _Block_object_dispose(&v35, 8);
}

- (void)operation:(id)a3 updatedProgress:(id)a4
{
  uint64_t v4 = OBJC_IVAR___ISOperation__progress;
  if (*(void *)&self->super.ISOperation_opaque[OBJC_IVAR___ISOperation__progress])
  {
    id v6 = objc_msgSend(a4, "copy", a3);
    v7 = *(void **)&self->super.ISOperation_opaque[v4];
    *(void *)&self->super.ISOperation_opaque[v4] = v6;

    id v8 = [(InstallDownloadOperation *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 operation:self updatedProgress:*(void *)&self->super.ISOperation_opaque[v4]];
    }
  }
}

@end