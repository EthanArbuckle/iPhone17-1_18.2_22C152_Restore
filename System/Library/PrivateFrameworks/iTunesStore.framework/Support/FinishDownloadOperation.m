@interface FinishDownloadOperation
- (BOOL)_needsDRMOperationForDownloadKind:(id)a3;
- (FinishDownloadOperation)initWithDownloadIdentifier:(int64_t)a3 databaseSession:(id)a4;
- (NSNumber)rentalIdentifier;
- (NSNumber)storeItemIdentifier;
- (NSString)handlerReleasedDownloadPhase;
- (NSString)initialDownloadPhase;
- (id)_downloadSessionPropertiesWithDownloadPhase:(id)a3;
- (id)_finishResult:(int64_t)a3;
- (id)_stepOperations;
- (id)outputBlock;
- (int64_t)downloadIdentifier;
- (void)_sendProgressToDelegate:(id)a3;
- (void)operation:(id)a3 updatedProgress:(id)a4;
- (void)run;
- (void)setHandlerReleasedDownloadPhase:(id)a3;
- (void)setInitialDownloadPhase:(id)a3;
- (void)setOutputBlock:(id)a3;
- (void)stopWithFinishResult:(int64_t)a3;
@end

@implementation FinishDownloadOperation

- (FinishDownloadOperation)initWithDownloadIdentifier:(int64_t)a3 databaseSession:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FinishDownloadOperation;
  v7 = [(FinishDownloadOperation *)&v20 init];
  if (v7)
  {
    v8 = [DownloadEntity alloc];
    v9 = [v6 database];
    v10 = [(DownloadEntity *)v8 initWithPersistentID:a3 inDatabase:v9];

    v11 = [FinishDownloadMemoryEntity alloc];
    v12 = +[FinishDownloadMemoryEntity defaultProperties];
    v13 = [(FinishDownloadMemoryEntity *)v11 initWithDatabaseEntity:v10 properties:v12];
    download = v7->_download;
    v7->_download = v13;

    [(FinishDownloadMemoryEntity *)v7->_download loadAssetsUsingSession:v6];
    id v15 = [(DownloadEntity *)v10 copyStoreDownloadMetadata];
    v16 = [v15 sinfs];

    if (!v16)
    {
      v17 = [(FinishDownloadMemoryEntity *)v7->_download mediaAsset];
      v18 = [v17 SINFs];
      [v15 setSinfs:v18];
    }
    [(FinishDownloadMemoryEntity *)v7->_download setStoreMetadata:v15];
    v7->_stopResult = -1;
  }
  return v7;
}

- (int64_t)downloadIdentifier
{
  return (int64_t)[(FinishDownloadMemoryEntity *)self->_download databaseID];
}

- (NSNumber)storeItemIdentifier
{
  return (NSNumber *)[(FinishDownloadMemoryEntity *)self->_download valueForProperty:@"store_item_id"];
}

- (NSNumber)rentalIdentifier
{
  return (NSNumber *)[(FinishDownloadMemoryEntity *)self->_download valueForProperty:@"rental_id"];
}

- (NSString)handlerReleasedDownloadPhase
{
  [(FinishDownloadOperation *)self lock];
  id v3 = [(NSString *)self->_handlerReleasedDownloadPhase copy];
  [(FinishDownloadOperation *)self unlock];

  return (NSString *)v3;
}

- (NSString)initialDownloadPhase
{
  [(FinishDownloadOperation *)self lock];
  id v3 = [(NSString *)self->_initialDownloadPhase copy];
  [(FinishDownloadOperation *)self unlock];

  return (NSString *)v3;
}

- (id)outputBlock
{
  [(FinishDownloadOperation *)self lock];
  id v3 = [self->_outputBlock copy];
  [(FinishDownloadOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setHandlerReleasedDownloadPhase:(id)a3
{
  id v6 = (NSString *)a3;
  [(FinishDownloadOperation *)self lock];
  if (self->_handlerReleasedDownloadPhase != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    handlerReleasedDownloadPhase = self->_handlerReleasedDownloadPhase;
    self->_handlerReleasedDownloadPhase = v4;
  }
  [(FinishDownloadOperation *)self unlock];
}

- (void)setInitialDownloadPhase:(id)a3
{
  id v6 = (NSString *)a3;
  [(FinishDownloadOperation *)self lock];
  if (self->_initialDownloadPhase != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    initialDownloadPhase = self->_initialDownloadPhase;
    self->_initialDownloadPhase = v4;
  }
  [(FinishDownloadOperation *)self unlock];
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  [(FinishDownloadOperation *)self lock];
  if (self->_outputBlock != v6)
  {
    id v4 = [v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }
  [(FinishDownloadOperation *)self unlock];
}

- (void)stopWithFinishResult:(int64_t)a3
{
  [(FinishDownloadOperation *)self lock];
  self->_stopResult = a3;
  [(FinishDownloadOperation *)self unlock];

  [(FinishDownloadOperation *)self cancel];
}

- (void)run
{
  id v33 = [(FinishDownloadMemoryEntity *)self->_download databaseID];
  int64_t v3 = [(FinishDownloadMemoryEntity *)self->_download transactionID];
  v31 = [(FinishDownloadOperation *)self _stepOperations];
  id v4 = [[DownloadHandle alloc] initWithTransactionIdentifier:v3 downloadIdentifier:v33];
  id v5 = objc_alloc_init((Class)SSOperationProgress);
  uint64_t v6 = OBJC_IVAR___ISOperation__progress;
  v7 = *(void **)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress];
  *(void *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] = v5;

  [*(id *)&self->ISOperation_opaque[v6] setCurrentValue:0];
  [*(id *)&self->ISOperation_opaque[v6] setMaxValue:1000000];
  v56[0] = SSDownloadPhaseProcessing;
  v56[1] = SSDownloadPhaseDataRestore;
  v56[2] = SSDownloadPhaseInstalling;
  v8 = +[NSArray arrayWithObjects:v56 count:3];
  v9 = [(FinishDownloadOperation *)self handlerReleasedDownloadPhase];
  if (v9) {
    uint64_t v10 = (uint64_t)[v8 indexOfObject:v9];
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v32 = [(FinishDownloadOperation *)self initialDownloadPhase];
  if (v32) {
    id v11 = objc_msgSend(v8, "indexOfObject:");
  }
  else {
    id v11 = 0;
  }
  v12 = +[DownloadsDatabase downloadsDatabase];
  v13 = [(FinishDownloadMemoryEntity *)self->_download valueForProperty:@"kind"];
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v51[3] = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_100168A20;
  v49 = sub_100168A30;
  id v50 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100168A38;
  v34[3] = &unk_1003A80F8;
  id v42 = v11;
  uint64_t v43 = v10;
  id v30 = v8;
  id v35 = v30;
  v36 = self;
  v40 = &v45;
  v29 = v4;
  v37 = v29;
  id v44 = v33;
  id v14 = v12;
  id v38 = v14;
  id v15 = v13;
  id v39 = v15;
  v41 = v51;
  [v31 enumerateObjectsUsingBlock:v34];
  uint64_t v16 = [(FinishDownloadOperation *)self outputBlock];
  v17 = (void *)v16;
  if (v16)
  {
    (*(void (**)(uint64_t, FinishDownloadOperation *, uint64_t))(v16 + 16))(v16, self, v46[5]);
    [(FinishDownloadOperation *)self setOutputBlock:0];
  }
  v18 = +[SSLogConfig sharedDaemonConfig];
  if (!v18)
  {
    v18 = +[SSLogConfig sharedConfig];
  }
  unsigned int v19 = [v18 shouldLog];
  unsigned int v20 = [v18 shouldLogToDisk];
  v21 = [v18 OSLogObject];
  v22 = v21;
  if (v20) {
    int v23 = v19 | 2;
  }
  else {
    int v23 = v19;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
    int v24 = v23;
  }
  else {
    int v24 = v23 & 2;
  }
  if (!v24) {
    goto LABEL_20;
  }
  v25 = -[FinishDownloadOperation _finishResult:](self, "_finishResult:", [(id)v46[5] result]);
  int v52 = 134218242;
  id v53 = v33;
  __int16 v54 = 2112;
  v55 = v25;
  LODWORD(v27) = 22;
  v26 = (void *)_os_log_send_and_compose_impl();

  if (v26)
  {
    v22 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v52, v27);
    free(v26);
    SSFileLog();
LABEL_20:
  }
  objc_opt_class();
  v28 = -[FinishDownloadOperation _finishResult:](self, "_finishResult:", [(id)v46[5] result]);
  SSDebugLog();

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v51, 8);
}

- (void)operation:(id)a3 updatedProgress:(id)a4
{
  id v12 = a4;
  [a3 progressFraction];
  double v7 = v6;
  if (v6 > 2.22044605e-16)
  {
    double v8 = (double)(uint64_t)[v12 currentValue];
    double v9 = v8 / (double)(uint64_t)[v12 maxValue];
    uint64_t v10 = OBJC_IVAR___ISOperation__progress;
    id v11 = [*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] copy];
    objc_msgSend(v11, "setCurrentValue:", (uint64_t)((double)(uint64_t)objc_msgSend(*(id *)&self->ISOperation_opaque[v10], "currentValue")+ v7 * v9 * (double)(uint64_t)objc_msgSend(*(id *)&self->ISOperation_opaque[v10], "maxValue")));
    [(FinishDownloadOperation *)self _sendProgressToDelegate:v11];
  }
}

- (id)_downloadSessionPropertiesWithDownloadPhase:(id)a3
{
  id v4 = a3;
  id v5 = [DownloadSessionProperties alloc];
  double v6 = [(FinishDownloadMemoryEntity *)self->_download clientIdentifier];
  double v7 = [(FinishDownloadMemoryEntity *)self->_download handlerIdentifier];
  double v8 = -[DownloadSessionProperties initWithClientIdentifier:handlerIdentifier:](v5, "initWithClientIdentifier:handlerIdentifier:", v6, [v7 longLongValue]);

  double v9 = [(FinishDownloadMemoryEntity *)self->_download mediaAsset];
  -[DownloadSessionProperties setAssetIdentifier:](v8, "setAssetIdentifier:", [v9 databaseID]);

  [(DownloadSessionProperties *)v8 setDownloadIdentifier:[(FinishDownloadMemoryEntity *)self->_download databaseID]];
  [(DownloadSessionProperties *)v8 setDownloadPhase:v4];

  return v8;
}

- (BOOL)_needsDRMOperationForDownloadKind:(id)a3
{
  id v3 = a3;
  if ((SSDownloadKindIsMediaKind() & 1) != 0
    || (SSDownloadKindIsEBookKind() & 1) != 0
    || (SSDownloadKindIsToneKind() & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:SSDownloadKindInAppContent];
  }

  return v4;
}

- (void)_sendProgressToDelegate:(id)a3
{
  id v5 = a3;
  unsigned __int8 v4 = [(FinishDownloadOperation *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 operation:self updatedProgress:v5];
  }
}

- (id)_finishResult:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return @"Unknown";
  }
  else {
    return off_1003A8118[a3];
  }
}

- (id)_stepOperations
{
  id v3 = +[NSMutableArray array];
  uint64_t v4 = [(FinishDownloadMemoryEntity *)self->_download downloadKind];
  id v5 = [(FinishDownloadMemoryEntity *)self->_download mediaAsset];
  if ([v5 isDRMFree])
  {
    BOOL v6 = 1;
  }
  else
  {
    double v7 = [v5 DPInfoData];
    BOOL v6 = v7 != 0;
  }
  double v8 = +[NSMutableArray array];
  if ([(FinishDownloadMemoryEntity *)self->_download isRestoreDownload]
    && [(FinishDownloadMemoryEntity *)self->_download hasRestoreData]
    && SSDownloadKindIsSoftwareKind())
  {
    double v9 = [(FinishDownloadStepOperation *)[RestoreDownloadDataOperation alloc] initWithDownload:self->_download];
    [(FinishDownloadStepOperation *)v9 setDownloadPhase:SSDownloadPhaseDataRestore];
  }
  else
  {
    double v9 = 0;
  }
  v40 = (void *)v4;
  id v41 = v3;
  if ((id)[(FinishDownloadMemoryEntity *)self->_download restoreState] == (id)1)
  {
    if (!v9)
    {
      uint64_t v10 = 0;
      id v11 = 0;
      goto LABEL_26;
    }
    [v3 addObject:v9];
    [v8 addObject:@"Restore Data Hard Fail"];
    uint64_t v10 = 0;
    id v11 = 0;
    goto LABEL_24;
  }
  if (v6
    || [(FinishDownloadMemoryEntity *)self->_download isStoreDownload]
    && [(FinishDownloadOperation *)self _needsDRMOperationForDownloadKind:v4])
  {
    id v12 = +[ApplicationWorkspace defaultWorkspace];
    if (![v12 isMultiUser])
    {

      goto LABEL_21;
    }
    unsigned int v13 = [(FinishDownloadMemoryEntity *)self->_download isSharedDownload];

    if (!v13) {
      goto LABEL_21;
    }
    id v38 = +[EBookManifest sharedPurchasedBookManifest];
    uint64_t v37 = [(FinishDownloadMemoryEntity *)self->_download valueForProperty:@"store_publication_version"];
    uint64_t v14 = [(FinishDownloadMemoryEntity *)self->_download valueForProperty:@"store_item_id"];
    id v15 = [(FinishDownloadMemoryEntity *)self->_download valueForProperty:@"download_permalink"];
    uint64_t v16 = [(FinishDownloadMemoryEntity *)self->_download valueForProperty:@"is_from_store"];
    unsigned int v17 = [v16 BOOLValue];

    id v39 = v15;
    if (v17)
    {
      v18 = v38;
      unsigned int v19 = (void *)v14;
      uint64_t v20 = v14;
      v21 = (void *)v37;
      v22 = [v38 bookPathForAdamID:v20 withPublicationVersion:v37];
    }
    else
    {
      v36 = (void *)v14;
      v21 = (void *)v37;
      if (![v15 length])
      {
        v22 = 0;
        v18 = v38;
        unsigned int v19 = v36;
LABEL_50:

        id v3 = v41;
        if (v22) {
          goto LABEL_51;
        }
LABEL_21:
        uint64_t v10 = [(FinishDownloadStepOperation *)[DownloadDRMOperation alloc] initWithDownload:self->_download];
        [(FinishDownloadStepOperation *)v10 setDownloadPhase:SSDownloadPhaseProcessing];
        [v3 addObject:v10];
        [v8 addObject:@"DRM"];
        if (!v9) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
      v34 = v15;
      v18 = v38;
      v22 = [v38 bookPathPermalink:v34];
      unsigned int v19 = v36;
    }

    goto LABEL_50;
  }
LABEL_51:
  uint64_t v10 = 0;
  if (v9)
  {
LABEL_22:
    [v3 addObject:v9];
    [v8 addObject:@"Restore Data"];
  }
LABEL_23:
  id v11 = [(FinishDownloadStepOperation *)[InstallDownloadOperation alloc] initWithDownload:self->_download];
  [(FinishDownloadStepOperation *)v11 setDownloadPhase:SSDownloadPhaseInstalling];
  [v3 addObject:v11];
  [v8 addObject:@"Install"];
  if (v9)
  {
LABEL_24:
    double v23 = 1.0;
    int v24 = v9;
LABEL_25:
    [v24 setProgressFraction:v23];
    goto LABEL_26;
  }
  if (v10 && v11)
  {
    [(FinishDownloadStepOperation *)v10 setProgressFraction:1.0];
    if (v6)
    {
      [(FinishDownloadStepOperation *)v10 setProgressFraction:0.5];
      double v23 = 0.5;
      int v24 = v11;
      goto LABEL_25;
    }
  }
  else
  {
    if (v10)
    {
      double v23 = 1.0;
      int v24 = v10;
      goto LABEL_25;
    }
    if (v11) {
      [(FinishDownloadStepOperation *)v11 setProgressFraction:1.0];
    }
    uint64_t v10 = 0;
  }
LABEL_26:
  v25 = +[SSLogConfig sharedDaemonConfig];
  if (!v25)
  {
    v25 = +[SSLogConfig sharedConfig];
  }
  unsigned int v26 = [v25 shouldLog];
  if ([v25 shouldLogToDisk]) {
    int v27 = v26 | 2;
  }
  else {
    int v27 = v26;
  }
  v28 = [v25 OSLogObject];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
    int v29 = v27;
  }
  else {
    int v29 = v27 & 2;
  }
  if (v29)
  {
    int64_t v30 = [(FinishDownloadOperation *)self downloadIdentifier];
    [v8 componentsJoinedByString:@", "];
    int v42 = 134218242;
    int64_t v43 = v30;
    __int16 v44 = 2112;
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = 22;
    v31 = (void *)_os_log_send_and_compose_impl();

    if (v31)
    {
      v32 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v42, v35);
      free(v31);
      SSFileLog();
    }
  }
  else
  {
  }

  return v41;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_initialDownloadPhase, 0);
  objc_storeStrong((id *)&self->_handlerReleasedDownloadPhase, 0);

  objc_storeStrong((id *)&self->_download, 0);
}

@end