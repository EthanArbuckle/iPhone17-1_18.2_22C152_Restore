@interface InstallToneOperation
- (id)_newRingtoneDictionary;
- (id)_ringtoneGUID;
- (int64_t)_performImport;
- (void)run;
@end

@implementation InstallToneOperation

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
  id v11 = 0;
  unsigned int v7 = [(FinishDownloadStepOperation *)self installAsset:v6 error:&v11];
  id v8 = v11;
  if (!v7) {
    goto LABEL_6;
  }
  int64_t v9 = [(InstallToneOperation *)self _performImport];
  if (v9 == 2)
  {
    uint64_t v10 = SSError();

    id v8 = (id)v10;
LABEL_6:
    [(FinishDownloadResponse *)v3 setError:v8];
    [(FinishDownloadResponse *)v3 setResult:0];
    [(FinishDownloadStepOperation *)self rollbackAsset:v6 error:0];
    goto LABEL_7;
  }
  if (v9 == 1) {
    [(FinishDownloadStepOperation *)self removeInstalledAsset:v6 error:0];
  }
LABEL_7:
  [(FinishDownloadStepOperation *)self finishWithDownloadResponse:v3];
}

- (id)_newRingtoneDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = ISWeakLinkedStringConstantForString();
  [v3 setObject:&__kCFBooleanTrue forKey:v4];
  v5 = [(FinishDownloadStepOperation *)self download];
  v6 = ISWeakLinkedStringConstantForString();

  unsigned int v7 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v5 databaseID]);
  [v3 setObject:v7 forKey:v6];

  id v8 = ISWeakLinkedStringConstantForString();

  int64_t v9 = [(InstallToneOperation *)self _ringtoneGUID];
  [v3 setObject:v9 forKey:v8];

  uint64_t v10 = [v5 storeItemIdentifier];
  if (v10)
  {
    uint64_t v11 = ISWeakLinkedStringConstantForString();

    [v3 setObject:v10 forKey:v11];
    id v8 = (void *)v11;
  }
  v12 = [v5 storeFrontIdentifier];

  if (v12)
  {
    uint64_t v13 = ISWeakLinkedStringConstantForString();

    [v3 setObject:v12 forKey:v13];
    id v8 = (void *)v13;
  }
  v14 = [v5 collectionName];

  if (v14)
  {
    uint64_t v15 = ISWeakLinkedStringConstantForString();

    [v3 setObject:v14 forKey:v15];
    id v8 = (void *)v15;
  }
  v16 = [v5 artistName];

  if (v16)
  {
    uint64_t v17 = ISWeakLinkedStringConstantForString();

    [v3 setObject:v16 forKey:v17];
    id v8 = (void *)v17;
  }
  v18 = [v5 genreName];

  if (v18)
  {
    uint64_t v19 = ISWeakLinkedStringConstantForString();

    [v3 setObject:v18 forKey:v19];
    id v8 = (void *)v19;
  }
  v20 = [v5 title];

  if (v20)
  {
    uint64_t v21 = ISWeakLinkedStringConstantForString();

    [v3 setObject:v20 forKey:v21];
    id v8 = (void *)v21;
  }
  v22 = [v5 durationInMilliseconds];

  if (v22)
  {
    uint64_t v23 = ISWeakLinkedStringConstantForString();

    [v3 setObject:v22 forKey:v23];
    id v8 = (void *)v23;
  }
  v24 = [v5 downloadKind];

  [v24 isEqualToString:SSDownloadKindTone];
  v25 = ISWeakLinkedStringConstantForString();

  if (v25)
  {
    uint64_t v26 = ISWeakLinkedStringConstantForString();

    [v3 setObject:v25 forKey:v26];
    id v8 = (void *)v26;
  }

  return v3;
}

- (id)_ringtoneGUID
{
  v2 = [(FinishDownloadStepOperation *)self download];
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llx", [v2 databaseID]);

  return v3;
}

- (int64_t)_performImport
{
  id v3 = [(InstallToneOperation *)self _newRingtoneDictionary];
  v4 = [(FinishDownloadStepOperation *)self download];
  v5 = [v4 storeItemIdentifier];
  uint64_t v6 = SSGetItemIdentifierFromValue();

  v56 = [v4 storeTransactionIdentifier];
  unsigned int v7 = objc_alloc_init(RingtonePurchaseStore);
  id v8 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  int64_t v9 = [v4 mediaAsset];
  uint64_t v10 = [v9 destinationFileName];
  uint64_t v11 = [v8 _importPurchasedToneWithMetadata:v3 fileName:v10];

  id v12 = [v11 statusCode];
  uint64_t v13 = [v11 toneIdentifier];
  v14 = (void *)v13;
  if (v12 == (id)2)
  {
    id v52 = v8;
    v54 = (void *)v13;
    v28 = +[SSLogConfig sharedDaemonConfig];
    if (!v28)
    {
      v28 = +[SSLogConfig sharedConfig];
    }
    unsigned int v29 = [v28 shouldLog];
    if ([v28 shouldLogToDisk]) {
      v29 |= 2u;
    }
    v30 = [v28 OSLogObject];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      int v31 = v29;
    }
    else {
      int v31 = v29 & 2;
    }
    if (v31)
    {
      v32 = objc_opt_class();
      id v49 = v32;
      [v4 title];
      int v57 = 138543618;
      v58 = v32;
      __int16 v59 = 2114;
      id v60 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v44) = 22;
      v33 = (void *)_os_log_send_and_compose_impl();

      if (v33)
      {
        v34 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v57, v44);
        free(v33);
        SSFileLog();
      }
    }
    else
    {
    }
    int64_t v42 = 2;
    id v8 = v52;
    v14 = v54;
  }
  else
  {
    if (v12 == (id)1)
    {
      uint64_t v50 = v6;
      id v51 = v8;
      v55 = (void *)v13;
      v35 = +[SSLogConfig sharedDaemonConfig];
      if (!v35)
      {
        v35 = +[SSLogConfig sharedConfig];
      }
      unsigned int v36 = [v35 shouldLog];
      if ([v35 shouldLogToDisk]) {
        v36 |= 2u;
      }
      v37 = [v35 OSLogObject];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
        int v38 = v36;
      }
      else {
        int v38 = v36 & 2;
      }
      if (v38)
      {
        v39 = objc_opt_class();
        id v47 = v39;
        [v4 title];
        int v57 = 138543874;
        v58 = v39;
        __int16 v59 = 2114;
        id v60 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v61 = 2114;
        v62 = v55;
        LODWORD(v44) = 32;
        v40 = (void *)_os_log_send_and_compose_impl();

        if (v40)
        {
          v41 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v40, 4, &v57, v44);
          free(v40);
          SSFileLog();
        }
      }
      else
      {
      }
      v14 = v55;
      [(RingtonePurchaseStore *)v7 finalizeRingtoneForAdamID:v50 transactionID:v56 toneIdentifier:v55];
      int64_t v42 = 1;
      goto LABEL_46;
    }
    if (!v12)
    {
      v53 = (void *)v13;
      id v15 = [v4 newITunesMetadataDictionary];
      v46 = v15;
      if (v15)
      {
        uint64_t v16 = SSDownloadMetadataKeyAdditionalInfo;
        id v17 = [v15 objectForKey:SSDownloadMetadataKeyAdditionalInfo];
        if (!v17)
        {
          id v17 = objc_alloc_init((Class)NSMutableDictionary);
          [v46 setObject:v17 forKey:v16];
        }
        v18 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v4 databaseID]);
        [v17 setObject:v18 forKey:SSDownloadMetadataKeyTrackPersistentID];

        uint64_t v19 = [v4 ITunesMetadataDestinationPath];
        [(FinishDownloadStepOperation *)self writeBinaryPropertyList:v46 toPath:v19 error:0];
      }
      uint64_t v48 = v6;
      id v51 = v8;
      [(FinishDownloadStepOperation *)self addPurchaseManifestItem];
      v20 = +[SSLogConfig sharedDaemonConfig];
      if (!v20)
      {
        v20 = +[SSLogConfig sharedConfig];
      }
      unsigned int v21 = [v20 shouldLog];
      if ([v20 shouldLogToDisk]) {
        int v22 = v21 | 2;
      }
      else {
        int v22 = v21;
      }
      uint64_t v23 = [v20 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
        int v24 = v22;
      }
      else {
        int v24 = v22 & 2;
      }
      if (v24)
      {
        v25 = objc_opt_class();
        id v45 = v25;
        [v4 title];
        int v57 = 138543874;
        v58 = v25;
        __int16 v59 = 2114;
        id v60 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v61 = 2114;
        v62 = v53;
        LODWORD(v44) = 32;
        uint64_t v26 = (void *)_os_log_send_and_compose_impl();

        if (v26)
        {
          v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v57, v44);
          free(v26);
          SSFileLog();
        }
      }
      else
      {
      }
      v14 = v53;
      [(RingtonePurchaseStore *)v7 finalizeRingtoneForAdamID:v48 transactionID:v56 toneIdentifier:v53];

      int64_t v42 = 0;
LABEL_46:
      id v8 = v51;
      goto LABEL_47;
    }
    int64_t v42 = 0;
  }
LABEL_47:

  return v42;
}

@end