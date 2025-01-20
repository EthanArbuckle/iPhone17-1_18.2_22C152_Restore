@interface InstallMicroPaymentDownloadOperation
- (void)run;
@end

@implementation InstallMicroPaymentDownloadOperation

- (void)run
{
  v3 = objc_alloc_init(FinishDownloadResponse);
  [(FinishDownloadResponse *)v3 setResult:4];
  v4 = [(FinishDownloadStepOperation *)self download];
  -[FinishDownloadResponse setDownloadIdentifier:](v3, "setDownloadIdentifier:", [v4 databaseID]);
  v5 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]([DownloadHandle alloc], "initWithTransactionIdentifier:downloadIdentifier:", [v4 transactionID], objc_msgSend(v4, "databaseID"));
  [(FinishDownloadResponse *)v3 setDownloadHandle:v5];
  v6 = [v4 mediaAsset];
  -[FinishDownloadResponse setMediaAssetIdentifier:](v3, "setMediaAssetIdentifier:", [v6 databaseID]);
  v7 = [v4 clientIdentifier];
  if (v7)
  {
    v8 = [v4 downloadKind];
    v38 = [(FinishDownloadStepOperation *)self documentsDirectoryPathWithClientIdentifier:v7 downloadKind:v8];
  }
  else
  {
    v38 = 0;
  }
  v9 = +[NSUUID UUID];
  v10 = [v9 UUIDString];

  if (v10)
  {
    v11 = [v6 destinationFileName];
    v12 = [v11 pathExtension];

    if (v12)
    {
      id v13 = [v10 stringByAppendingPathExtension:v12];
    }
    else
    {
      id v13 = v10;
    }
    v15 = v13;

    id v14 = 0;
    if (!v38 || !v15) {
      goto LABEL_28;
    }
    v37 = v15;
    id v41 = 0;
    id v42 = 0;
    unsigned int v16 = [(FinishDownloadStepOperation *)self unzipAsset:v6 unzippedPath:&v42 error:&v41];
    id v17 = v42;
    id v18 = v41;
    if (v16)
    {
      v36 = v7;
      v34 = v5;
      v19 = [v38 stringByAppendingPathComponent:v37];
      id v39 = v18;
      id v40 = v19;
      v35 = v17;
      unsigned int v20 = [(FinishDownloadStepOperation *)self moveFile:v17 toPath:&v40 installBehavior:1 error:&v39];
      id v21 = v40;

      id v14 = v39;
      if (v20)
      {
        v33 = v21;
        v22 = +[SSLogConfig sharedDaemonConfig];
        if (!v22)
        {
          v22 = +[SSLogConfig sharedConfig];
        }
        unsigned int v23 = [v22 shouldLog];
        if ([v22 shouldLogToDisk]) {
          v23 |= 2u;
        }
        v32 = v22;
        v24 = [v22 OSLogObject];
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
          v23 &= 2u;
        }
        v15 = v37;
        if (v23)
        {
          v25 = objc_opt_class();
          id v31 = v25;
          id v26 = [v4 databaseID];
          int v43 = 138412802;
          v44 = v25;
          __int16 v45 = 2048;
          id v46 = v26;
          __int16 v47 = 2112;
          v48 = v33;
          LODWORD(v30) = 32;
          v29 = &v43;
          v27 = (void *)_os_log_send_and_compose_impl();

          v5 = v34;
          if (!v27)
          {
LABEL_32:

            [(FinishDownloadResponse *)v3 setMediaAssetInstallPath:v33];
            v7 = v36;
            goto LABEL_29;
          }
          v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, &v43, v30);
          free(v27);
          v29 = (int *)v24;
          SSFileLog();
        }
        else
        {
          v5 = v34;
        }

        goto LABEL_32;
      }
      id v18 = v14;
      v5 = v34;
      v28 = v17;
    }
    else
    {
      v28 = v17;
      if (!v17)
      {
        v15 = v37;
        goto LABEL_27;
      }
      v36 = v7;
      id v21 = objc_alloc_init((Class)NSFileManager);
      [v21 removeItemAtPath:v17 error:0];
    }
    v15 = v37;

    v7 = v36;
LABEL_27:

    id v14 = v18;
    goto LABEL_28;
  }
  id v14 = 0;
  v15 = 0;
LABEL_28:
  [(FinishDownloadResponse *)v3 setError:v14];
  [(FinishDownloadResponse *)v3 setResult:0];
  [(FinishDownloadStepOperation *)self rollbackAsset:v6 error:0];
LABEL_29:
  -[FinishDownloadStepOperation finishWithDownloadResponse:](self, "finishWithDownloadResponse:", v3, v29);
}

@end