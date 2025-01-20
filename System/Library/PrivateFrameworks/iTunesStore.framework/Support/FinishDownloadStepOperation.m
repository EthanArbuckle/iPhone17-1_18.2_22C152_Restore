@interface FinishDownloadStepOperation
- (BOOL)downloadAndInstallAsset:(id)a3 error:(id *)a4;
- (BOOL)downloadAsset:(id)a3 error:(id *)a4;
- (BOOL)installAsset:(id)a3 error:(id *)a4;
- (BOOL)moveAsset:(id)a3 toPath:(id *)a4 installBehavior:(int64_t)a5 error:(id *)a6;
- (BOOL)moveFile:(id)a3 toPath:(id *)a4 installBehavior:(int64_t)a5 error:(id *)a6;
- (BOOL)removeInstalledAsset:(id)a3 error:(id *)a4;
- (BOOL)rollbackAsset:(id)a3 error:(id *)a4;
- (BOOL)unzipAsset:(id)a3 unzippedPath:(id *)a4 error:(id *)a5;
- (BOOL)writeBinaryPropertyList:(id)a3 toPath:(id)a4 error:(id *)a5;
- (FinishDownloadMemoryEntity)download;
- (FinishDownloadStepOperation)initWithDownload:(id)a3;
- (NSString)downloadPhase;
- (double)progressFraction;
- (id)_newURLOperationWithAsset:(id)a3;
- (id)documentsDirectoryPathWithClientIdentifier:(id)a3 downloadKind:(id)a4;
- (id)outputBlock;
- (void)addPurchaseManifestItem;
- (void)addPurchaseManifestItemWithLibraryIdentifier:(id)a3;
- (void)finishWithDownloadResponse:(id)a3;
- (void)setDownloadPhase:(id)a3;
- (void)setOutputBlock:(id)a3;
- (void)setProgressFraction:(double)a3;
@end

@implementation FinishDownloadStepOperation

- (FinishDownloadStepOperation)initWithDownload:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FinishDownloadStepOperation;
  v6 = [(FinishDownloadStepOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_download, a3);
  }

  return v7;
}

- (void)addPurchaseManifestItem
{
}

- (void)addPurchaseManifestItemWithLibraryIdentifier:(id)a3
{
  id v17 = a3;
  v4 = [(FinishDownloadStepOperation *)self download];
  id v5 = [v4 downloadKind];
  v6 = +[PurchaseManifest sharedManifestForDownloadKind:v5];

  if (v6)
  {
    v7 = objc_alloc_init(PurchaseManifestItem);
    [(PurchaseManifestItem *)v7 setLibraryPersistentIdentifier:v17];
    v8 = [v4 mediaAsset];
    objc_super v9 = [v8 destinationFileName];
    [(PurchaseManifestItem *)v7 setRelativeMediaAssetPath:v9];

    v10 = [v4 ITunesMetadataDestinationPath];
    v11 = [v10 lastPathComponent];
    [(PurchaseManifestItem *)v7 setRelativeMetadataPath:v11];

    v12 = [v4 secondaryAssetForType:SSDownloadAssetTypeArtwork];
    v13 = v12;
    if (v12)
    {
      v14 = [v12 destinationFileName];
      [(PurchaseManifestItem *)v7 setRelativeArtworkPath:v14];
    }
    v15 = [v4 secondaryAssetForType:SSDownloadAssetTypeXMLFeed];

    if (v15)
    {
      v16 = [v15 destinationFileName];
      [(PurchaseManifestItem *)v7 setRelativeFeedAssetPath:v16];
    }
    [v6 addCompletedItem:v7];
  }
}

- (NSString)downloadPhase
{
  [(FinishDownloadStepOperation *)self lock];
  id v3 = [(NSString *)self->_downloadPhase copy];
  [(FinishDownloadStepOperation *)self unlock];

  return (NSString *)v3;
}

- (id)documentsDirectoryPathWithClientIdentifier:(id)a3 downloadKind:(id)a4
{
  id v4 = a3;
  int IsThirdPartyKind = SSDownloadKindIsThirdPartyKind();
  id v6 = objc_alloc((Class)NSArray);
  if (IsThirdPartyKind) {
    id v7 = objc_msgSend(v6, "initWithObjects:", @"Library", @"Caches", 0);
  }
  else {
    id v7 = objc_msgSend(v6, "initWithObjects:", @"Documents", 0, v21);
  }
  v8 = v7;
  objc_super v9 = +[LSApplicationProxy applicationProxyForIdentifier:v4];
  v10 = v9;
  if (v9
    && ([v9 applicationType],
        v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 isEqualToString:LSUserApplicationType],
        v11,
        v12))
  {
    id v13 = objc_alloc((Class)NSMutableArray);
    v14 = [v10 dataContainerURL];
    v15 = [v14 path];
    id v16 = objc_msgSend(v13, "initWithObjects:", v15, 0);

    [v16 addObjectsFromArray:v8];
    id v17 = +[NSString pathWithComponents:v16];
  }
  else
  {
    v18 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
    id v16 = [v18 lastObject];

    id v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v16, @"Containers", v4, 0);
    [v19 addObjectsFromArray:v8];
    id v17 = +[NSString pathWithComponents:v19];
  }

  return v17;
}

- (BOOL)downloadAndInstallAsset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(FinishDownloadStepOperation *)self _newURLOperationWithAsset:v6];
  v46 = a4;
  if (!v7)
  {
    id v31 = 0;
    goto LABEL_31;
  }
  v8 = +[SSLogConfig sharedDaemonConfig];
  if (!v8)
  {
    v8 = +[SSLogConfig sharedConfig];
  }
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  v11 = [v8 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    int v12 = v10;
  }
  else {
    int v12 = v10 & 2;
  }
  if (v12)
  {
    id v13 = objc_opt_class();
    id v14 = v13;
    id v15 = [v6 databaseID];
    id v16 = [(FinishDownloadMemoryEntity *)self->_download databaseID];
    int v49 = 138412802;
    v50 = v13;
    __int16 v51 = 2048;
    id v52 = v15;
    __int16 v53 = 2048;
    id v54 = v16;
    LODWORD(v44) = 32;
    v43 = &v49;
    id v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17) {
      goto LABEL_14;
    }
    v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v49, v44);
    free(v17);
    v43 = (int *)v11;
    SSFileLog();
  }

LABEL_14:
  id v48 = 0;
  unsigned int v18 = [(FinishDownloadStepOperation *)self runSubOperation:v7 returningError:&v48];
  id v19 = v48;
  v20 = v19;
  if (!v18)
  {
    id v31 = v19;
    goto LABEL_31;
  }
  uint64_t v21 = +[SSLogConfig sharedDaemonConfig];
  if (!v21)
  {
    uint64_t v21 = +[SSLogConfig sharedConfig];
  }
  unsigned int v22 = objc_msgSend(v21, "shouldLog", v43);
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
  if (v25)
  {
    v26 = objc_opt_class();
    id v45 = v26;
    id v27 = [v6 databaseID];
    id v28 = [(FinishDownloadMemoryEntity *)self->_download databaseID];
    int v49 = 138412802;
    v50 = v26;
    __int16 v51 = 2048;
    id v52 = v27;
    __int16 v53 = 2048;
    id v54 = v28;
    LODWORD(v44) = 32;
    v43 = &v49;
    v29 = (void *)_os_log_send_and_compose_impl();

    if (!v29) {
      goto LABEL_27;
    }
    v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v49, v44);
    free(v29);
    v43 = (int *)v24;
    SSFileLog();
  }

LABEL_27:
  id v47 = v20;
  unsigned __int8 v30 = [(FinishDownloadStepOperation *)self installAsset:v6 error:&v47];
  id v31 = v47;

  if (v30)
  {
    BOOL v32 = 1;
    goto LABEL_45;
  }
LABEL_31:
  v33 = +[SSLogConfig sharedDaemonConfig];
  if (!v33)
  {
    v33 = +[SSLogConfig sharedConfig];
  }
  unsigned int v34 = [v33 shouldLog];
  if ([v33 shouldLogToDisk]) {
    v34 |= 2u;
  }
  v35 = [v33 OSLogObject];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
    int v36 = v34;
  }
  else {
    int v36 = v34 & 2;
  }
  if (v36)
  {
    v37 = objc_opt_class();
    id v38 = v37;
    id v39 = [v6 databaseID];
    id v40 = [(FinishDownloadMemoryEntity *)self->_download databaseID];
    int v49 = 138412802;
    v50 = v37;
    __int16 v51 = 2048;
    id v52 = v39;
    __int16 v53 = 2048;
    id v54 = v40;
    LODWORD(v44) = 32;
    v41 = (void *)_os_log_send_and_compose_impl();

    if (!v41) {
      goto LABEL_42;
    }
    v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, &v49, v44);
    free(v41);
    SSFileLog();
  }

LABEL_42:
  if (v46)
  {
    id v31 = v31;
    BOOL v32 = 0;
    id *v46 = v31;
  }
  else
  {
    BOOL v32 = 0;
  }
LABEL_45:

  return v32;
}

- (BOOL)downloadAsset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(FinishDownloadStepOperation *)self _newURLOperationWithAsset:v6];
  if (!v7)
  {
    id v19 = 0;
    unsigned __int8 v18 = 0;
    if (!a4) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  v8 = +[SSLogConfig sharedDaemonConfig];
  if (!v8)
  {
    v8 = +[SSLogConfig sharedConfig];
  }
  unsigned int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  v11 = [v8 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    int v12 = v10;
  }
  else {
    int v12 = v10 & 2;
  }
  if (v12)
  {
    id v13 = objc_opt_class();
    id v22 = v13;
    id v14 = [v6 databaseID];
    id v15 = [v6 assetType];
    id v16 = [(FinishDownloadMemoryEntity *)self->_download databaseID];
    int v24 = 138413058;
    int v25 = v13;
    __int16 v26 = 2048;
    id v27 = v14;
    __int16 v28 = 2112;
    v29 = v15;
    __int16 v30 = 2048;
    id v31 = v16;
    LODWORD(v21) = 42;
    id v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17) {
      goto LABEL_14;
    }
    v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v24, v21);
    free(v17);
    SSFileLog();
  }

LABEL_14:
  id v23 = 0;
  unsigned __int8 v18 = [(FinishDownloadStepOperation *)self runSubOperation:v7 returningError:&v23];
  id v19 = v23;
  if (!a4) {
    goto LABEL_19;
  }
LABEL_17:
  if ((v18 & 1) == 0) {
    *a4 = v19;
  }
LABEL_19:

  return v18;
}

- (void)finishWithDownloadResponse:(id)a3
{
  id v8 = a3;
  id v4 = [v8 error];
  [(FinishDownloadStepOperation *)self setError:v4];

  -[FinishDownloadStepOperation setSuccess:](self, "setSuccess:", [v8 result] == (id)4);
  uint64_t v5 = [(FinishDownloadStepOperation *)self outputBlock];
  id v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);
    [(FinishDownloadStepOperation *)self setOutputBlock:0];
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kSSNotificationDownloadFinished, 0, 0, 1u);
}

- (BOOL)installAsset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSFileManager);
  id v8 = [v6 localPath];
  if (![v7 fileExistsAtPath:v8])
  {
    id v14 = 0;
    BOOL v12 = 0;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  unsigned int v9 = [(FinishDownloadMemoryEntity *)self->_download destinationDirectoryPathForAsset:v6];
  if (v9)
  {
    int v10 = [v6 destinationFileName];
    v11 = [v9 stringByAppendingPathComponent:v10];

    id v16 = 0;
    id v17 = v11;
    BOOL v12 = [(FinishDownloadStepOperation *)self moveAsset:v6 toPath:&v17 installBehavior:0 error:&v16];
    id v13 = v17;

    id v14 = v16;
  }
  else
  {
    id v14 = 0;
    BOOL v12 = 0;
  }

  if (a4)
  {
LABEL_8:
    if (!v12) {
      *a4 = v14;
    }
  }
LABEL_10:

  return v12;
}

- (BOOL)moveAsset:(id)a3 toPath:(id *)a4 installBehavior:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [v10 localPath];
  BOOL v12 = [(FinishDownloadStepOperation *)self moveFile:v11 toPath:a4 installBehavior:a5 error:a6];

  if (v12)
  {
    id v13 = [v10 fileAttributes];
    if ([v13 count])
    {
      id v14 = objc_alloc_init((Class)NSFileManager);
      [v14 setAttributes:v13 ofItemAtPath:*a4 error:0];
    }
  }

  return v12;
}

- (BOOL)moveFile:(id)a3 toPath:(id *)a4 installBehavior:(int64_t)a5 error:(id *)a6
{
  id v9 = a3;
  uint64_t v10 = [*a4 stringByDeletingLastPathComponent];
  v11 = [*a4 lastPathComponent];
  v68 = [v11 stringByDeletingPathExtension];
  v66 = v11;
  BOOL v12 = [v11 pathExtension];
  id v13 = objc_alloc_init((Class)NSFileManager);
  id v14 = v13;
  v67 = (void *)v10;
  if (!v10)
  {
    __int16 v30 = +[SSLogConfig sharedDaemonConfig];
    if (!v30)
    {
      __int16 v30 = +[SSLogConfig sharedConfig];
    }
    unsigned int v31 = [v30 shouldLog];
    if ([v30 shouldLogToDisk]) {
      int v32 = v31 | 2;
    }
    else {
      int v32 = v31;
    }
    v33 = [v30 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      int v34 = v32;
    }
    else {
      int v34 = v32 & 2;
    }
    if (v34)
    {
      LOWORD(v71) = 0;
      LODWORD(v58) = 2;
      v35 = (void *)_os_log_send_and_compose_impl();

      v29 = v11;
      if (v35)
      {
        int v36 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v35, 4, &v71, v58);
        free(v35);
        SSFileLog();
      }
    }
    else
    {

      v29 = v11;
    }

    uint64_t v54 = SSErrorDomain;
    NSErrorUserInfoKey v73 = NSLocalizedDescriptionKey;
    CFStringRef v74 = @"DownloadInstaller: Missing destination path";
    v55 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    id v22 = +[NSError errorWithDomain:v54 code:137 userInfo:v55];

    char v39 = 0;
    id v40 = 0;
    goto LABEL_69;
  }
  v63 = a6;
  id v64 = v9;
  uint64_t v15 = 1;
  [v13 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0];
  id v62 = [objc_alloc((Class)NSURL) initFileURLWithPath:v10 isDirectory:1];
  unsigned int v61 = [v62 startAccessingSecurityScopedResource];
  v65 = 0;
  uint64_t v60 = SSErrorDomain;
LABEL_3:
  id v16 = (void *)v10;
  do
  {
    unsigned int v17 = [v14 fileExistsAtPath:*a4];
    if (!v17)
    {
      id v37 = *a4;
      id v9 = v64;
      id v69 = v65;
      unsigned __int8 v38 = [v14 moveItemAtPath:v64 toPath:v37 error:&v69];
      id v22 = v69;

      if (v38)
      {
        v29 = v66;
        goto LABEL_35;
      }
      id v48 = +[SSLogConfig sharedDaemonConfig];
      if (!v48)
      {
        id v48 = +[SSLogConfig sharedConfig];
      }
      unsigned int v49 = [v48 shouldLog];
      if ([v48 shouldLogToDisk]) {
        int v50 = v49 | 2;
      }
      else {
        int v50 = v49;
      }
      __int16 v51 = [v48 OSLogObject];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        int v52 = v50;
      }
      else {
        int v52 = v50 & 2;
      }
      a6 = v63;
      if (v52)
      {
        int v71 = 138412290;
        id v72 = v22;
        LODWORD(v58) = 12;
        v57 = &v71;
        __int16 v53 = (void *)_os_log_send_and_compose_impl();

        v29 = v66;
        if (!v53)
        {
LABEL_66:

          goto LABEL_67;
        }
        __int16 v51 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v53, 4, &v71, v58);
        free(v53);
        v57 = (int *)v51;
        SSFileLog();
      }
      else
      {
        v29 = v66;
      }

      goto LABEL_66;
    }
    if (a5 != 1)
    {
      id v21 = *a4;
      id v70 = v65;
      unsigned __int8 v59 = [v14 removeItemAtPath:v21 error:&v70];
      id v22 = v70;

      v65 = v22;
      if (v59) {
        goto LABEL_3;
      }
      id v23 = +[SSLogConfig sharedDaemonConfig];
      if (!v23)
      {
        id v23 = +[SSLogConfig sharedConfig];
      }
      unsigned int v24 = [v23 shouldLog];
      if ([v23 shouldLogToDisk]) {
        int v25 = v24 | 2;
      }
      else {
        int v25 = v24;
      }
      __int16 v26 = [v23 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        int v27 = v25;
      }
      else {
        int v27 = v25 & 2;
      }
      id v9 = v64;
      if (v27)
      {
        int v71 = 138412290;
        id v72 = v22;
        LODWORD(v58) = 12;
        v57 = &v71;
        __int16 v28 = (void *)_os_log_send_and_compose_impl();

        v29 = v66;
        if (!v28)
        {
LABEL_75:

LABEL_35:
          char v39 = v17 ^ 1;
          id v40 = v62;
          a6 = v63;
          if (!v61) {
            goto LABEL_69;
          }
          goto LABEL_68;
        }
        __int16 v26 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v71, v58);
        free(v28);
        v57 = (int *)v26;
        SSFileLog();
      }
      else
      {
        v29 = v66;
      }

      goto LABEL_75;
    }
    unsigned __int8 v18 = +[NSString stringWithFormat:@"%@-%ld", v68, v15];
    if ([v12 length])
    {
      uint64_t v19 = [v18 stringByAppendingPathExtension:v12];

      unsigned __int8 v18 = (void *)v19;
      id v16 = (void *)v10;
    }
    *a4 = [v16 stringByAppendingPathComponent:v18];
  }
  while (v15++ < 10000);
  uint64_t v41 = +[SSLogConfig sharedDaemonConfig];
  v42 = (void *)v41;
  if (!v41)
  {
    v42 = +[SSLogConfig sharedConfig];
  }
  unsigned int v43 = [v42 shouldLog];
  if ([v42 shouldLogToDisk]) {
    int v44 = v43 | 2;
  }
  else {
    int v44 = v43;
  }
  id v45 = [v42 OSLogObject];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
    int v46 = v44;
  }
  else {
    int v46 = v44 & 2;
  }
  a6 = v63;
  id v9 = v64;
  if (v46)
  {
    int v71 = 138412290;
    v29 = v66;
    id v72 = v66;
    LODWORD(v58) = 12;
    v57 = &v71;
    id v47 = (void *)_os_log_send_and_compose_impl();

    if (v47)
    {
      id v45 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v47, 4, &v71, v58);
      free(v47);
      v57 = (int *)v45;
      SSFileLog();
      goto LABEL_62;
    }
  }
  else
  {
    v29 = v66;
LABEL_62:
  }
  id v22 = +[NSError errorWithDomain:v60 code:100 userInfo:0];

LABEL_67:
  char v39 = 0;
  id v40 = v62;
  if ((v61 & 1) == 0) {
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(v40, "stopAccessingSecurityScopedResource", v57);
LABEL_69:
  if (a6 && (v39 & 1) == 0) {
    *a6 = v22;
  }

  return v39;
}

- (BOOL)removeInstalledAsset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSFileManager);
  id v8 = [(FinishDownloadMemoryEntity *)self->_download destinationDirectoryPathForAsset:v6];
  id v9 = [v6 destinationFileName];

  uint64_t v10 = [v8 stringByAppendingPathComponent:v9];

  if (![v7 fileExistsAtPath:v10])
  {
    id v21 = +[SSLogConfig sharedDaemonConfig];
    if (!v21)
    {
      id v21 = +[SSLogConfig sharedConfig];
    }
    unsigned int v22 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    unsigned int v24 = [v21 OSLogObject];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      v23 &= 2u;
    }
    if (v23)
    {
      int v37 = 138543618;
      id v38 = (id)objc_opt_class();
      __int16 v39 = 2114;
      id v40 = v10;
      id v25 = v38;
      LODWORD(v35) = 22;
      __int16 v26 = (void *)_os_log_send_and_compose_impl();

      if (!v26)
      {
LABEL_26:

        id v12 = 0;
        goto LABEL_27;
      }
      unsigned int v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v37, v35);
      free(v26);
      SSFileLog();
    }

    goto LABEL_26;
  }
  id v36 = 0;
  unsigned int v11 = [v7 removeItemAtPath:v10 error:&v36];
  id v12 = v36;
  uint64_t v13 = +[SSLogConfig sharedDaemonConfig];
  id v14 = (void *)v13;
  if (v11)
  {
    if (!v13)
    {
      id v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    unsigned int v17 = [v14 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      unsigned __int8 v18 = objc_opt_class();
      int v37 = 138543618;
      id v38 = v18;
      __int16 v39 = 2114;
      id v40 = v10;
      id v19 = v18;
      LODWORD(v35) = 22;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_14:

LABEL_27:
        BOOL v27 = 1;
        goto LABEL_28;
      }
      unsigned int v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v37, v35);
      free(v20);
      SSFileLog();
    }

    goto LABEL_14;
  }
  if (!v13)
  {
    id v14 = +[SSLogConfig sharedConfig];
  }
  unsigned int v29 = [v14 shouldLog];
  if ([v14 shouldLogToDisk]) {
    int v30 = v29 | 2;
  }
  else {
    int v30 = v29;
  }
  unsigned int v31 = [v14 OSLogObject];
  if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    v30 &= 2u;
  }
  if (v30)
  {
    int v32 = objc_opt_class();
    int v37 = 138543874;
    id v38 = v32;
    __int16 v39 = 2114;
    id v40 = v10;
    __int16 v41 = 2114;
    id v42 = v12;
    id v33 = v32;
    LODWORD(v35) = 32;
    int v34 = (void *)_os_log_send_and_compose_impl();

    if (!v34) {
      goto LABEL_40;
    }
    unsigned int v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4, &v37, v35);
    free(v34);
    SSFileLog();
  }

LABEL_40:
  if (a4)
  {
    id v12 = v12;
    BOOL v27 = 0;
    *a4 = v12;
  }
  else
  {
    BOOL v27 = 0;
  }
LABEL_28:

  return v27;
}

- (id)outputBlock
{
  [(FinishDownloadStepOperation *)self lock];
  id v3 = [self->_outputBlock copy];
  [(FinishDownloadStepOperation *)self unlock];
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (double)progressFraction
{
  [(FinishDownloadStepOperation *)self lock];
  double progressFraction = self->_progressFraction;
  [(FinishDownloadStepOperation *)self unlock];
  return progressFraction;
}

- (BOOL)rollbackAsset:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSFileManager);
  id v8 = [(FinishDownloadMemoryEntity *)self->_download destinationDirectoryPathForAsset:v6];
  id v9 = [v6 destinationFileName];
  uint64_t v10 = [v8 stringByAppendingPathComponent:v9];

  if (![v7 fileExistsAtPath:v10]) {
    goto LABEL_18;
  }
  uint64_t v35 = a4;
  unsigned int v11 = [v6 localPath];
  if (![v7 fileExistsAtPath:v11])
  {
    id v13 = 0;
LABEL_6:
    int v34 = v8;
    unsigned int v15 = +[SSLogConfig sharedDaemonConfig];
    if (!v15)
    {
      unsigned int v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      v16 |= 2u;
    }
    unsigned int v17 = [v15 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      unsigned __int8 v18 = objc_opt_class();
      int v38 = 138412546;
      __int16 v39 = v18;
      __int16 v40 = 2112;
      id v41 = v11;
      id v19 = v11;
      id v20 = v18;
      LODWORD(v32) = 22;
      unsigned int v31 = &v38;
      id v21 = (void *)_os_log_send_and_compose_impl();

      unsigned int v11 = v19;
      id v8 = v34;
      if (!v21)
      {
LABEL_16:

        id v36 = v13;
        unsigned int v22 = [v7 moveItemAtPath:v10 toPath:v11 error:&v36];
        id v14 = v36;

        if (!v22) {
          goto LABEL_19;
        }

LABEL_18:
        id v14 = 0;
        BOOL v23 = 1;
        goto LABEL_32;
      }
      unsigned int v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v38, v32);
      free(v21);
      unsigned int v31 = (int *)v17;
      SSFileLog();
    }

    goto LABEL_16;
  }
  id v37 = 0;
  unsigned int v12 = [v7 removeItemAtPath:v11 error:&v37];
  id v13 = v37;
  id v14 = v13;
  if (v12) {
    goto LABEL_6;
  }
LABEL_19:
  id v33 = v11;
  unsigned int v24 = +[SSLogConfig sharedDaemonConfig];
  if (!v24)
  {
    unsigned int v24 = +[SSLogConfig sharedConfig];
  }
  unsigned int v25 = [v24 shouldLog];
  if ([v24 shouldLogToDisk]) {
    v25 |= 2u;
  }
  __int16 v26 = [v24 OSLogObject];
  if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
    v25 &= 2u;
  }
  if (v25)
  {
    BOOL v27 = objc_opt_class();
    int v38 = 138412546;
    __int16 v39 = v27;
    __int16 v40 = 2112;
    id v41 = v14;
    id v28 = v27;
    LODWORD(v32) = 22;
    unsigned int v29 = (void *)_os_log_send_and_compose_impl();

    unsigned int v11 = v33;
    if (!v29) {
      goto LABEL_29;
    }
    __int16 v26 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v38, v32);
    free(v29);
    SSFileLog();
  }

LABEL_29:
  [v7 removeItemAtPath:v10 error:0];

  if (v35)
  {
    id v14 = v14;
    BOOL v23 = 0;
    id *v35 = v14;
  }
  else
  {
    BOOL v23 = 0;
  }
LABEL_32:

  return v23;
}

- (void)setDownloadPhase:(id)a3
{
  id v6 = (NSString *)a3;
  [(FinishDownloadStepOperation *)self lock];
  if (self->_downloadPhase != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    downloadPhase = self->_downloadPhase;
    self->_downloadPhase = v4;
  }
  [(FinishDownloadStepOperation *)self unlock];
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  [(FinishDownloadStepOperation *)self lock];
  if (self->_outputBlock != v6)
  {
    id v4 = [v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }
  [(FinishDownloadStepOperation *)self unlock];
}

- (void)setProgressFraction:(double)a3
{
  [(FinishDownloadStepOperation *)self lock];
  self->_double progressFraction = a3;

  [(FinishDownloadStepOperation *)self unlock];
}

- (BOOL)unzipAsset:(id)a3 unzippedPath:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 localPath];
  uint64_t v10 = [v9 stringByAppendingPathExtension:@"ext"];
  unsigned int v11 = objc_alloc_init(ExtractFileOperation);
  [(ExtractFileOperation *)v11 setDestinationFilePath:v10];
  unsigned int v12 = [v8 fileAttributes];

  [(ExtractFileOperation *)v11 setFileAttributes:v12];
  [(ExtractFileOperation *)v11 setShouldRunWithBackgroundPriority:1];
  [(ExtractFileOperation *)v11 setSourceFilePath:v9];
  [(ExtractFileOperation *)v11 setSourceFileType:0];
  id v17 = 0;
  unsigned int v13 = [(FinishDownloadStepOperation *)self runSubOperation:v11 returningError:&v17];
  id v14 = v17;
  unsigned int v15 = v14;
  if (v13)
  {
    id v14 = v10;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  a4 = a5;
  if (a5) {
LABEL_5:
  }
    *a4 = v14;
LABEL_6:

  return v13;
}

- (BOOL)writeBinaryPropertyList:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v31 = 0;
  id v8 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:200 options:0 error:&v31];
  id v9 = v31;
  uint64_t v10 = v9;
  if (v8)
  {
    id v30 = v9;
    unsigned int v11 = [v8 writeToFile:v7 options:1 error:&v30];
    id v12 = v30;

    uint64_t v13 = +[SSLogConfig sharedDaemonConfig];
    id v14 = (void *)v13;
    if (v11)
    {
      if (!v13)
      {
        id v14 = +[SSLogConfig sharedConfig];
      }
      unsigned int v15 = [v14 shouldLog];
      if ([v14 shouldLogToDisk]) {
        int v16 = v15 | 2;
      }
      else {
        int v16 = v15;
      }
      id v17 = [v14 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
        int v18 = v16;
      }
      else {
        int v18 = v16 & 2;
      }
      if (v18)
      {
        int v32 = 138412290;
        id v33 = v7;
        LODWORD(v29) = 12;
        id v19 = (void *)_os_log_send_and_compose_impl();

        if (!v19)
        {
LABEL_15:

          BOOL v20 = 1;
          goto LABEL_42;
        }
        id v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v32, v29);
        free(v19);
        SSFileLog();
      }

      goto LABEL_15;
    }
    if (!v13)
    {
      id v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v25 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      v25 |= 2u;
    }
    unsigned int v22 = [v14 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      int v26 = v25;
    }
    else {
      int v26 = v25 & 2;
    }
    if (v26)
    {
      int v32 = 138412290;
      id v33 = v12;
      LODWORD(v29) = 12;
      BOOL v27 = (void *)_os_log_send_and_compose_impl();

      if (!v27) {
        goto LABEL_39;
      }
      unsigned int v22 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, &v32, v29);
      free(v27);
      SSFileLog();
    }
    uint64_t v10 = v12;
    goto LABEL_37;
  }
  id v14 = +[SSLogConfig sharedDaemonConfig];
  if (!v14)
  {
    id v14 = +[SSLogConfig sharedConfig];
  }
  unsigned int v21 = [v14 shouldLog];
  if ([v14 shouldLogToDisk]) {
    v21 |= 2u;
  }
  unsigned int v22 = [v14 OSLogObject];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
    int v23 = v21;
  }
  else {
    int v23 = v21 & 2;
  }
  if (!v23)
  {
LABEL_37:

    goto LABEL_38;
  }
  int v32 = 138412290;
  id v33 = v10;
  LODWORD(v29) = 12;
  unsigned int v24 = (void *)_os_log_send_and_compose_impl();

  if (v24)
  {
    unsigned int v22 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v32, v29);
    free(v24);
    SSFileLog();
    goto LABEL_37;
  }
LABEL_38:
  id v12 = v10;
LABEL_39:

  if (a5)
  {
    id v12 = v12;
    BOOL v20 = 0;
    *a5 = v12;
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_42:

  return v20;
}

- (id)_newURLOperationWithAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sourceURLString];
  if (!v5)
  {
    id v6 = 0;
    goto LABEL_7;
  }
  id v6 = [objc_alloc((Class)NSURL) initWithString:v5];
  if (!v6)
  {
LABEL_7:
    id v8 = 0;
    goto LABEL_10;
  }
  id v7 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURL:v6];
  [v7 setAllowedRetryCount:0];
  [v7 setRequiresExtendedValidationCertificates:0];
  if (([v4 isExternalAsset] & 1) != 0
    || ![(FinishDownloadMemoryEntity *)self->_download isStoreDownload])
  {
    id v8 = objc_alloc_init((Class)ISURLOperation);
    [v8 _setUsesPrivateCookieStore:0];
    uint64_t v9 = 0;
    uint64_t v10 = 2;
  }
  else
  {
    id v8 = objc_alloc_init((Class)ISStoreURLOperation);
    [v8 setCanSendGUIDParameter:0];
    uint64_t v9 = 1;
    [v8 setUrlKnownToBeTrusted:1];
    uint64_t v10 = 0;
  }
  [v7 setITunesStoreRequest:v9];
  [v7 setURLBagType:v10];
  [v8 setRequestProperties:v7];
  id v11 = objc_alloc_init((Class)ISHashedDownloadProvider);
  id v12 = [v4 localPath];
  [v11 setLocalFilePath:v12];

  [v8 setDataProvider:v11];
LABEL_10:

  return v8;
}

- (FinishDownloadMemoryEntity)download
{
  return self->_download;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_downloadPhase, 0);

  objc_storeStrong((id *)&self->_download, 0);
}

@end