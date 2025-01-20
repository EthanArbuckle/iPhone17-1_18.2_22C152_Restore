@interface InstallSoftwareDownloadOperation
- (BOOL)_downloadSecondaryAssets:(id *)a3;
- (id)_newSoftwarePropertiesWithDownload:(id)a3;
- (void)_monitorForTerminationOfBundleID:(id)a3;
- (void)operation:(id)a3 updatedProgress:(id)a4;
- (void)run;
@end

@implementation InstallSoftwareDownloadOperation

- (void)run
{
  v3 = [(FinishDownloadStepOperation *)self download];
  v105 = [v3 mediaAsset];
  v4 = objc_alloc_init(FinishDownloadResponse);
  -[FinishDownloadResponse setDownloadIdentifier:](v4, "setDownloadIdentifier:", [v3 databaseID]);
  -[FinishDownloadResponse setMediaAssetIdentifier:](v4, "setMediaAssetIdentifier:", [v105 databaseID]);
  [(FinishDownloadResponse *)v4 setResult:4];
  id v5 = [v3 automaticType];
  v106 = [v3 bundleIdentifier];
  v6 = (ApplicationHandle *)[v3 databaseID];
  id v7 = [v3 transactionID];
  v104 = [[DownloadHandle alloc] initWithTransactionIdentifier:v7 downloadIdentifier:v6];
  -[FinishDownloadResponse setDownloadHandle:](v4, "setDownloadHandle:");
  v107 = +[ApplicationWorkspace defaultWorkspace];
  if ([v107 isMultiUser])
  {
    v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8)
    {
      v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      v9 |= 2u;
    }
    v10 = [v8 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v117 = 138412802;
      id v118 = (id)objc_opt_class();
      __int16 v119 = 2048;
      v120 = v6;
      __int16 v121 = 2112;
      v122 = v106;
      id v11 = v118;
      LODWORD(v95) = 32;
      v92 = &v117;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (v12)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v117, v95);
        v13 = (int *)objc_claimAutoreleasedReturnValue();
        free(v12);
        v92 = v13;
        SSFileLog();
      }
    }
    else
    {
    }
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472;
    v113[2] = sub_1001AF0B4;
    v113[3] = &unk_1003A7580;
    v113[4] = self;
    v116 = v6;
    v114 = v106;
    dispatch_semaphore_t v115 = v14;
    v15 = v14;
    [v107 waitForSyncBubbleToTerminateWithCompletionBlock:v113];
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
  objc_msgSend(v107, "cancelPlaceholderInstallationForDownloadIdentifier:", v6, v92);
  id v112 = 0;
  unsigned __int8 v16 = [(InstallSoftwareDownloadOperation *)self _downloadSecondaryAssets:&v112];
  id v17 = v112;
  if ((v16 & 1) == 0)
  {
    [(FinishDownloadResponse *)v4 setError:v17];
    [(FinishDownloadResponse *)v4 setResult:0];
    goto LABEL_124;
  }
  char v111 = 0;
  v18 = (const void *)SBSApplicationTerminationAssertionCreateWithError();
  id v103 = [(InstallSoftwareDownloadOperation *)self _newSoftwarePropertiesWithDownload:v3];
  unsigned int v97 = [v3 isStoreDownload];
  if ((([v3 isTvTemplate] | v97 ^ 1) & 1) == 0)
  {
    v19 = [v103 sinfData];
    BOOL v20 = [v19 length] == 0;

    if (v20)
    {
      v78 = +[SSLogConfig sharedDaemonConfig];
      if (!v78)
      {
        v78 = +[SSLogConfig sharedConfig];
      }
      unsigned int v79 = [v78 shouldLog];
      if ([v78 shouldLogToDisk]) {
        v79 |= 2u;
      }
      v80 = [v78 OSLogObject];
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT)) {
        int v81 = v79;
      }
      else {
        int v81 = v79 & 2;
      }
      if (v81)
      {
        v82 = objc_opt_class();
        int v117 = 138412802;
        id v118 = v82;
        __int16 v119 = 2048;
        v120 = v6;
        __int16 v121 = 2112;
        v122 = v106;
        v83 = v18;
        id v84 = v82;
        LODWORD(v95) = 32;
        v93 = &v117;
        v85 = (void *)_os_log_send_and_compose_impl();

        v18 = v83;
        if (!v85)
        {
LABEL_105:

          v86 = SSError();
          [(FinishDownloadResponse *)v4 setError:v86];

          [(FinishDownloadResponse *)v4 setResult:3];
          goto LABEL_122;
        }
        v80 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v85, 4, &v117, v95);
        free(v85);
        v93 = (int *)v80;
        SSFileLog();
      }

      goto LABEL_105;
    }
  }
  v96 = v18;
  if (v5 != (id)2) {
    goto LABEL_32;
  }
  v101 = [[ApplicationHandle alloc] initWithTransactionIdentifier:v7 downloadIdentifier:v6 bundleIdentifier:v106];
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
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
    int v25 = v23;
  }
  else {
    int v25 = v23 & 2;
  }
  if (!v25) {
    goto LABEL_30;
  }
  v26 = objc_opt_class();
  int v117 = 138412546;
  id v118 = v26;
  __int16 v119 = 2112;
  v120 = v101;
  id v27 = v26;
  LODWORD(v95) = 22;
  v93 = &v117;
  v28 = (void *)_os_log_send_and_compose_impl();

  v18 = v96;
  if (v28)
  {
    v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v117, v95);
    free(v28);
    v93 = (int *)v24;
    SSFileLog();
LABEL_30:
  }
  [v107 installPlaceholderForApplicationHandle:v101];

LABEL_32:
  v109[0] = _NSConcreteStackBlock;
  v109[1] = 3221225472;
  v109[2] = sub_1001AF25C;
  v109[3] = &unk_1003A3140;
  dsema = dispatch_semaphore_create(0);
  v110 = dsema;
  [v107 waitForInstallOfDownloadIdentifier:v6 completionBlock:v109];
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  [v107 beginExternalInstallationForDownloadIdentifier:v6];
  v29 = +[SSLogConfig sharedDaemonConfig];
  if (!v29)
  {
    v29 = +[SSLogConfig sharedConfig];
  }
  unsigned int v30 = objc_msgSend(v29, "shouldLog", v93);
  unsigned int v31 = [v29 shouldLogToDisk];
  v32 = [v29 OSLogObject];
  v33 = v32;
  if (v31) {
    v30 |= 2u;
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
    int v34 = v30;
  }
  else {
    int v34 = v30 & 2;
  }
  if (v34)
  {
    v35 = objc_opt_class();
    int v117 = 138412802;
    id v118 = v35;
    __int16 v119 = 2048;
    v120 = v6;
    __int16 v121 = 2112;
    v122 = v106;
    id v36 = v35;
    LODWORD(v95) = 32;
    v93 = &v117;
    v37 = (void *)_os_log_send_and_compose_impl();

    v18 = v96;
    if (!v37) {
      goto LABEL_43;
    }
    v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, &v117, v95);
    free(v37);
    v93 = (int *)v33;
    SSFileLog();
  }

LABEL_43:
  v38 = [[InstallSoftwareOperation alloc] initWithSoftwareProperties:v103];
  [(InstallSoftwareOperation *)v38 setDelegate:self];
  id v108 = v17;
  unsigned int v102 = [(InstallSoftwareDownloadOperation *)self runSubOperation:v38 returningError:&v108];
  id v100 = v108;

  [(InstallSoftwareOperation *)v38 setDelegate:0];
  [v107 endExternalInstallationForDownloadIdentifier:v6];
  unsigned int v39 = v102;
  if (!v106) {
    unsigned int v39 = 0;
  }
  if (v39 == 1)
  {
    if (!v97) {
      goto LABEL_63;
    }
    v40 = [v103 appReceiptData];
    BOOL v41 = [v40 length] == 0;

    if (!v41) {
      goto LABEL_63;
    }
    v42 = +[SSLogConfig sharedDaemonConfig];
    if (!v42)
    {
      v42 = +[SSLogConfig sharedConfig];
    }
    unsigned int v43 = objc_msgSend(v42, "shouldLog", v93);
    if ([v42 shouldLogToDisk]) {
      v43 |= 2u;
    }
    v44 = [v42 OSLogObject];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO)) {
      int v45 = v43;
    }
    else {
      int v45 = v43 & 2;
    }
    if (v45)
    {
      v46 = objc_opt_class();
      int v117 = 138412546;
      id v118 = v46;
      __int16 v119 = 2112;
      v120 = v106;
      v47 = v18;
      id v48 = v46;
      LODWORD(v95) = 22;
      v93 = &v117;
      v49 = (void *)_os_log_send_and_compose_impl();

      v18 = v47;
      if (!v49) {
        goto LABEL_59;
      }
      v44 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v49, 4, &v117, v95);
      free(v49);
      v93 = (int *)v44;
      SSFileLog();
    }

LABEL_59:
    v50 = objc_alloc_init(AppReceiptRefreshOperationOptions);
    [(AppReceiptRefreshOperationOptions *)v50 setBundleIdentifier:v106];
    v51 = +[LSApplicationProxy applicationProxyForIdentifier:v106];
    v52 = v51;
    if (v51 && [v51 hasMIDBasedSINF]) {
      [(AppReceiptRefreshOperationOptions *)v50 setReceiptFlags:8];
    }
    v53 = [[AppReceiptRefreshOperation alloc] initWithOptions:v50];
    [(InstallSoftwareDownloadOperation *)self runSubOperation:v53 returningError:0];

LABEL_63:
    v54 = +[SSLogConfig sharedDaemonConfig];
    if (!v54)
    {
      v54 = +[SSLogConfig sharedConfig];
    }
    unsigned int v55 = [v54 shouldLog];
    if ([v54 shouldLogToDisk]) {
      v55 |= 2u;
    }
    v56 = [v54 OSLogObject];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO)) {
      int v57 = v55;
    }
    else {
      int v57 = v55 & 2;
    }
    if (v57)
    {
      v58 = objc_opt_class();
      int v117 = 138412546;
      id v118 = v58;
      __int16 v119 = 2112;
      v120 = v106;
      v59 = v18;
      id v60 = v58;
      LODWORD(v95) = 22;
      v61 = (void *)_os_log_send_and_compose_impl();

      v18 = v59;
      if (!v61)
      {
LABEL_74:

        id v98 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithObjects:", v106, 0);
        v62 = +[KeyValueStore defaultKeyValueStore];
        uint64_t v63 = kSSLockdownDomainITunesStore;
        uint64_t v64 = kSSLockdownKeyDownloadedApps;
        v65 = [v62 valueForDomain:kSSLockdownDomainITunesStore key:kSSLockdownKeyDownloadedApps];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v98 addObjectsFromArray:v65];
        }
        v66 = [v98 allObjects];
        [v62 setValue:v66 forDomain:v63 key:v64];

        goto LABEL_77;
      }
      v56 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v61, 4, &v117, v95);
      free(v61);
      SSFileLog();
    }

    goto LABEL_74;
  }
LABEL_77:
  if ((v102 & 1) == 0)
  {
    v67 = [v100 userInfo];
    v68 = [v67 objectForKey:@"Error"];

    v69 = [v105 assetType];
    unsigned int v70 = [v69 isEqualToString:SSDownloadAssetTypeDeltaPackage];

    if (v70
      && (([v68 isEqualToString:@"PackagePatchFailed"] & 1) != 0
       || [v68 isEqualToString:@"ApplicationVerificationFailed"]))
    {
      -[FinishDownloadResponse setAssetBlockedReason:](v4, "setAssetBlockedReason:", 1, v93);
      uint64_t v71 = 1;
LABEL_120:
      -[FinishDownloadResponse setResult:](v4, "setResult:", v71, v94);
      [(FinishDownloadResponse *)v4 setError:v100];

      goto LABEL_121;
    }
    if (objc_msgSend(v68, "isEqualToString:", @"AppBlacklisted", v93))
    {
      v72 = +[SSLogConfig sharedDaemonConfig];
      if (!v72)
      {
        v72 = +[SSLogConfig sharedConfig];
      }
      unsigned int v73 = [v72 shouldLog];
      if ([v72 shouldLogToDisk]) {
        v73 |= 2u;
      }
      v74 = [v72 OSLogObject];
      if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT)) {
        v73 &= 2u;
      }
      if (v73)
      {
        v75 = objc_opt_class();
        int v117 = 138412546;
        id v118 = v75;
        __int16 v119 = 2112;
        v120 = v106;
        id v76 = v75;
        LODWORD(v95) = 22;
        v94 = &v117;
        v77 = (void *)_os_log_send_and_compose_impl();

        if (!v77)
        {
LABEL_93:

          uint64_t v71 = 3;
          goto LABEL_120;
        }
        v74 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v77, 4, &v117, v95);
        free(v77);
        v94 = (int *)v74;
        SSFileLog();
      }

      goto LABEL_93;
    }
    if (![v68 isEqualToString:@"BundleiTunesMetadataVersionMismatch"])
    {
      uint64_t v71 = 0;
      goto LABEL_120;
    }
    v87 = +[SSLogConfig sharedDaemonConfig];
    if (!v87)
    {
      v87 = +[SSLogConfig sharedConfig];
    }
    unsigned int v88 = [v87 shouldLog];
    if ([v87 shouldLogToDisk]) {
      v88 |= 2u;
    }
    v89 = [v87 OSLogObject];
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
      int v90 = v88;
    }
    else {
      int v90 = v88 & 2;
    }
    if (v90)
    {
      int v117 = 134217984;
      id v118 = v6;
      LODWORD(v95) = 12;
      v94 = &v117;
      v91 = (void *)_os_log_send_and_compose_impl();

      if (!v91)
      {
LABEL_118:

        uint64_t v71 = 6;
        goto LABEL_120;
      }
      v89 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v91, 4, &v117, v95);
      free(v91);
      v94 = (int *)v89;
      SSFileLog();
    }

    goto LABEL_118;
  }
LABEL_121:

  id v17 = v100;
LABEL_122:

  if (v18)
  {
    SBSApplicationTerminationAssertionInvalidate();
    CFRelease(v18);
  }
LABEL_124:
  -[FinishDownloadStepOperation finishWithDownloadResponse:](self, "finishWithDownloadResponse:", v4, v93);
}

- (void)operation:(id)a3 updatedProgress:(id)a4
{
  uint64_t v4 = OBJC_IVAR___ISOperation__progress;
  if (*(void *)&self->super.ISOperation_opaque[OBJC_IVAR___ISOperation__progress])
  {
    id v6 = objc_msgSend(a4, "copy", a3);
    id v7 = *(void **)&self->super.ISOperation_opaque[v4];
    *(void *)&self->super.ISOperation_opaque[v4] = v6;

    id v8 = [(InstallSoftwareDownloadOperation *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 operation:self updatedProgress:*(void *)&self->super.ISOperation_opaque[v4]];
    }
  }
}

- (BOOL)_downloadSecondaryAssets:(id *)a3
{
  v16[0] = SSDownloadAssetTypeArtwork;
  v16[1] = SSDownloadAssetTypeNewsstandArtwork;
  v16[2] = SSDownloadAssetTypeTransitMapsData;
  id v5 = [(FinishDownloadStepOperation *)self download];
  unint64_t v6 = 0;
  id v7 = 0;
  do
  {
    id v8 = v7;
    while (1)
    {
      unsigned int v9 = [v5 secondaryAssetForType:v16[v6]];
      if (v9) {
        break;
      }

      if (v6++ >= 2)
      {
        BOOL v12 = 1;
        goto LABEL_11;
      }
    }
    id v15 = v7;
    unsigned int v11 = [(FinishDownloadStepOperation *)self downloadAsset:v9 error:&v15];
    id v7 = v15;

    if (v6 > 1) {
      break;
    }
    ++v6;
  }
  while (v11);
  if (v11)
  {
    BOOL v12 = 1;
  }
  else if (*a3)
  {
    id v7 = v7;
    BOOL v12 = 0;
    *a3 = v7;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_11:

  for (uint64_t i = 2; i != -1; --i)
  return v12;
}

- (void)_monitorForTerminationOfBundleID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(EventMonitorBlockEvent);
  [(EventMonitorEvent *)v5 setPollInterval:30];
  [(EventMonitorEvent *)v5 setShouldKeepDaemonAlive:1];
  unint64_t v6 = [(FinishDownloadStepOperation *)self download];
  id v7 = [v6 databaseID];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001AF620;
  v14[3] = &unk_1003A5220;
  id v16 = v7;
  id v8 = v4;
  id v15 = v8;
  [(EventMonitorBlockEvent *)v5 setEventBlock:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001AF860;
  v12[3] = &unk_1003A3118;
  id v13 = v8;
  id v9 = v8;
  [(EventMonitorBlockEvent *)v5 setTestBlock:v12];
  v10 = +[EventMonitor sharedEventMonitor];
  id v11 = [v10 monitorEvent:v5];
}

- (id)_newSoftwarePropertiesWithDownload:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(SoftwareProperties);
  id v5 = [v3 bundleIdentifier];
  [(SoftwareProperties *)v4 setBundleIdentifier:v5];

  -[SoftwareProperties setIsFromStore:](v4, "setIsFromStore:", [v3 isStoreDownload]);
  unint64_t v6 = [v3 bundleVersion];
  [(SoftwareProperties *)v4 setBundleVersion:v6];

  id v7 = [v3 storeMetadata];
  id v8 = [v7 appReceiptData];
  [(SoftwareProperties *)v4 setAppReceiptData:v8];

  id v9 = [DownloadDRM alloc];
  v10 = [v7 sinfs];
  id v11 = [(DownloadDRM *)v9 initWithSinfArray:v10];

  BOOL v12 = [(DownloadDRM *)v11 firstDataForSinfDataKey:off_100400C68];
  [(SoftwareProperties *)v4 setSinfData:v12];

  id v13 = [v3 newITunesMetadataDictionary];
  [(SoftwareProperties *)v4 setITunesMetadata:v13];
  dispatch_semaphore_t v14 = [v3 mediaAsset];
  id v15 = v14;
  if (v14)
  {
    id v16 = [v14 localPath];
    [(SoftwareProperties *)v4 setPackagePath:v16];
  }
  id v17 = [v3 secondaryAssetForType:SSDownloadAssetTypeArtwork];
  v18 = [v17 localPath];

  if (v18)
  {
    id v19 = [objc_alloc((Class)NSData) initWithContentsOfFile:v18];
    [(SoftwareProperties *)v4 setArtworkData:v19];
  }
  BOOL v20 = [v3 secondaryAssetForType:SSDownloadAssetTypeNewsstandArtwork];
  v21 = [v20 localPath];

  if (v21)
  {
    id v22 = [objc_alloc((Class)NSData) initWithContentsOfFile:v21];
    [(SoftwareProperties *)v4 setNewsstandArtworkData:v22];
  }
  int v23 = [v3 secondaryAssetForType:SSDownloadAssetTypeTransitMapsData];
  v24 = [v23 localPath];

  if (v24)
  {
    id v25 = [objc_alloc((Class)NSData) initWithContentsOfFile:v24];
    [(SoftwareProperties *)v4 setTransitMapData:v25];
  }
  if ([v3 isRestoreDownload])
  {
    v26 = &off_1003C94E0;
  }
  else
  {
    id v27 = [v3 automaticType];
    v28 = &off_1003C9528;
    if (v27 == (id)2) {
      v28 = &off_1003C9510;
    }
    if (v27 == (id)1) {
      v26 = &off_1003C94F8;
    }
    else {
      v26 = v28;
    }
  }
  [(SoftwareProperties *)v4 setInstallType:v26];

  return v4;
}

@end