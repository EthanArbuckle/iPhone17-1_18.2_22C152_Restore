@interface SSBookDownload
- (BOOL)addAsset:(id)a3 forType:(id)a4;
- (BOOL)isBackgroundNetworkingUserInitiated;
- (BOOL)isCancelable;
- (BOOL)isEligibleForRestore:(id *)a3;
- (BOOL)removeAsset:(id)a3;
- (NSString)downloadID;
- (NSString)downloadPhaseIdentifierOverride;
- (SSBookDownload)initWithDownloadStatus:(id)a3;
- (SSBookDownloadStatus)downloadStatus;
- (double)estimatedSecondsRemaining;
- (double)percentComplete;
- (id)assetsForType:(id)a3;
- (id)backgroundNetworkingJobGroupName;
- (id)downloadPhaseIdentifier;
- (id)downloadPolicy;
- (id)metadata;
- (id)networkConstraints;
- (id)status;
- (id)valueForProperty:(id)a3;
- (int64_t)bytesDownloaded;
- (int64_t)bytesTotal;
- (int64_t)downloadSizeLimit;
- (int64_t)persistentIdentifier;
- (void)pause;
- (void)prioritizeAboveDownload:(id)a3 completionBlock:(id)a4;
- (void)restart;
- (void)resume;
- (void)setBackgroundNetworkingJobGroupName:(id)a3;
- (void)setBackgroundNetworkingUserInitiated:(BOOL)a3;
- (void)setDownloadHandler:(id)a3 completionBlock:(id)a4;
- (void)setDownloadPhaseIdentifierOverride:(id)a3;
- (void)setDownloadPolicy:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNetworkConstraints:(id)a3;
- (void)setStatus:(id)a3;
- (void)setValuesWithStoreDownloadMetadata:(id)a3;
@end

@implementation SSBookDownload

- (SSBookDownload)initWithDownloadStatus:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 downloadID];
  v6 = [v5 numberFromHexDigits];
  uint64_t v7 = [v6 longLongValue];

  v29.receiver = self;
  v29.super_class = (Class)SSBookDownload;
  v8 = [(SSEntity *)&v29 _initWithPersistentIdentifier:v7];
  if (v8)
  {
    uint64_t v9 = [v4 copy];
    downloadStatus = v8->_downloadStatus;
    v8->_downloadStatus = (SSBookDownloadStatus *)v9;

    uint64_t v11 = SSVBookAssetDaemonFramework();
    id v12 = SSVWeakLinkedClassForString(&cfstr_Bldownloadqueu.isa, v11);
    if (v12)
    {
      uint64_t v13 = [v12 sharedInstance];
      downloadQueue = v8->_downloadQueue;
      v8->_downloadQueue = (SSBookDownloadQueue *)v13;
LABEL_15:

      goto LABEL_16;
    }
    downloadQueue = +[SSLogConfig sharedStoreServicesConfig];
    if (!downloadQueue)
    {
      downloadQueue = +[SSLogConfig sharedConfig];
    }
    int v15 = [downloadQueue shouldLog];
    if ([downloadQueue shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    v17 = [downloadQueue OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      v16 &= 2u;
    }
    if (v16)
    {
      v18 = objc_opt_class();
      int v30 = 138543362;
      v31 = v18;
      id v19 = v18;
      LODWORD(v28) = 12;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20) {
        goto LABEL_15;
      }
      v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v30, v28);
      free(v20);
      SSFileLog(downloadQueue, @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v17);
    }

    goto LABEL_15;
  }
LABEL_16:

  return v8;
}

- (int64_t)persistentIdentifier
{
  return [(SSBookDownloadStatus *)self->_downloadStatus persistentIdentifier];
}

- (NSString)downloadID
{
  return (NSString *)[(SSBookDownloadStatus *)self->_downloadStatus downloadID];
}

- (BOOL)isCancelable
{
  return [(SSBookDownloadStatus *)self->_downloadStatus downloadPhase] != 4
      && [(SSBookDownloadStatus *)self->_downloadStatus downloadPhase] != 5;
}

- (id)downloadPhaseIdentifier
{
  downloadPhaseIdentifierOverride = self->_downloadPhaseIdentifierOverride;
  if (!downloadPhaseIdentifierOverride)
  {
    switch([(SSBookDownloadStatus *)self->_downloadStatus downloadPhase])
    {
      case 0:
        v3 = SSDownloadPhasePreflight;
        goto LABEL_13;
      case 1:
        v3 = SSDownloadPhaseWaiting;
        goto LABEL_13;
      case 2:
        v3 = SSDownloadPhaseDownloading;
        goto LABEL_13;
      case 3:
        v3 = SSDownloadPhasePaused;
        goto LABEL_13;
      case 4:
        v3 = SSDownloadPhaseCanceled;
        goto LABEL_13;
      case 5:
        v3 = &SSDownloadPhaseFailed;
        goto LABEL_13;
      case 6:
        v3 = SSDownloadPhaseProcessing;
        goto LABEL_13;
      case 7:
        v3 = SSDownloadPhaseInstalling;
        goto LABEL_13;
      case 8:
        v3 = SSDownloadPhaseFinished;
LABEL_13:
        downloadPhaseIdentifierOverride = (NSString *)*v3;
        break;
      default:
        id v4 = 0;
        goto LABEL_15;
    }
  }
  id v4 = downloadPhaseIdentifierOverride;
LABEL_15:
  return v4;
}

- (double)percentComplete
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  uint64_t v7 = objc_opt_class();
  downloadStatus = self->_downloadStatus;
  id v9 = v7;
  v10 = [(SSBookDownloadStatus *)downloadStatus percentComplete];
  [v10 doubleValue];
  int v24 = 138543618;
  uint64_t v25 = v7;
  __int16 v26 = 2048;
  uint64_t v27 = v11;
  LODWORD(v23) = 22;
  id v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v24, v23);
    free(v12);
    SSFileLog(v3, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v6);
LABEL_11:
  }
  id v19 = [(SSBookDownloadStatus *)self->_downloadStatus percentComplete];
  [v19 doubleValue];
  double v21 = v20;

  return v21;
}

- (void)pause
{
  downloadQueue = self->_downloadQueue;
  id v3 = [(SSBookDownload *)self downloadID];
  [(SSBookDownloadQueue *)downloadQueue pauseDownloadWithID:v3 withCompletion:0];
}

- (void)resume
{
  downloadQueue = self->_downloadQueue;
  id v3 = [(SSBookDownload *)self downloadID];
  [(SSBookDownloadQueue *)downloadQueue resumeDownloadWithID:v3 withCompletion:0];
}

- (id)valueForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"7"])
  {
    int v5 = [(SSBookDownloadStatus *)self->_downloadStatus storeID];
LABEL_10:
    v8 = v5;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"Q"])
  {
    int v5 = [(SSBookDownloadStatus *)self->_downloadStatus downloadID];
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"V"])
  {
    v6 = NSNumber;
    uint64_t v7 = [(SSBookDownloadStatus *)self->_downloadStatus isRestore];
LABEL_9:
    int v5 = [v6 numberWithBool:v7];
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"M"])
  {
    v6 = NSNumber;
    uint64_t v7 = [(SSBookDownloadStatus *)self->_downloadStatus isPurchase];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"c"])
  {
    v8 = @"com.apple.bookassetd";
  }
  else
  {
    if ([v4 isEqualToString:@"1"])
    {
      int v5 = @"ebook";
      goto LABEL_10;
    }
    if (([v4 isEqualToString:@"11"] & 1) == 0)
    {
      if ([v4 isEqualToString:@"d"])
      {
        int v5 = [(SSBookDownloadStatus *)self->_downloadStatus artistName];
        goto LABEL_10;
      }
      if ([v4 isEqualToString:@"i"])
      {
        int v5 = [(SSBookDownloadStatus *)self->_downloadStatus genre];
        goto LABEL_10;
      }
      if ([v4 isEqualToString:@"2"])
      {
        int v5 = [(SSBookDownloadStatus *)self->_downloadStatus title];
        goto LABEL_10;
      }
      if ([v4 isEqualToString:@"8"])
      {
        int v5 = [(SSBookDownloadStatus *)self->_downloadStatus purchaseDate];
        goto LABEL_10;
      }
      if ([v4 isEqualToString:@"t"])
      {
        v6 = NSNumber;
        uint64_t v7 = [(SSBookDownloadStatus *)self->_downloadStatus isSample];
        goto LABEL_9;
      }
    }
    v8 = 0;
  }
LABEL_11:

  return v8;
}

- (int64_t)bytesDownloaded
{
  v2 = [(SSBookDownloadStatus *)self->_downloadStatus transferBytesWritten];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (int64_t)bytesTotal
{
  v2 = [(SSBookDownloadStatus *)self->_downloadStatus transferBytesExpected];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (double)estimatedSecondsRemaining
{
  v2 = [(SSBookDownloadStatus *)self->_downloadStatus estimatedTimeRemaining];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (id)metadata
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    double v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v16 = 138543362;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  uint64_t v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v16, v15);
    free(v7);
    SSFileLog(v3, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:
  }
  return 0;
}

- (id)networkConstraints
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    double v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v16 = 138543362;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  uint64_t v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v16, v15);
    free(v7);
    SSFileLog(v3, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:
  }
  return 0;
}

- (void)setMetadata:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    int v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  uint64_t v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v16 = 138543362;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v16, v15);
    free(v8);
    SSFileLog(v4, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:
  }
}

- (void)setNetworkConstraints:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    int v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  uint64_t v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v16 = 138543362;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v16, v15);
    free(v8);
    SSFileLog(v4, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:
  }
}

- (void)setStatus:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    int v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  uint64_t v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v16 = 138543362;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v16, v15);
    free(v8);
    SSFileLog(v4, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:
  }
}

- (id)status
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    double v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  int v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v16 = 138543362;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  uint64_t v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    int v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v16, v15);
    free(v7);
    SSFileLog(v3, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:
  }
  return 0;
}

- (id)assetsForType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    int v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  uint64_t v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v17 = 138543362;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v17, v16);
    free(v8);
    SSFileLog(v4, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:
  }
  return 0;
}

- (BOOL)addAsset:(id)a3 forType:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v5)
  {
    int v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  uint64_t v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v18 = 138543362;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 12;
  uint64_t v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v18, v17);
    free(v9);
    SSFileLog(v5, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v8);
LABEL_11:
  }
  return 0;
}

- (id)backgroundNetworkingJobGroupName
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    double v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  int v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v16 = 138543362;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  int v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    int v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v16, v15);
    free(v7);
    SSFileLog(v3, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:
  }
  return 0;
}

- (id)downloadPolicy
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    double v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  int v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v16 = 138543362;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  int v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    int v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v16, v15);
    free(v7);
    SSFileLog(v3, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:
  }
  return 0;
}

- (int64_t)downloadSizeLimit
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    double v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  int v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v16 = 138543362;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  int v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    int v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v16, v15);
    free(v7);
    SSFileLog(v3, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:
  }
  return 0;
}

- (BOOL)isBackgroundNetworkingUserInitiated
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    double v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  int v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v16 = 138543362;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  int v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    int v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v16, v15);
    free(v7);
    SSFileLog(v3, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:
  }
  return 0;
}

- (BOOL)isEligibleForRestore:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    int v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  int v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v17 = 138543362;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    int v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v17, v16);
    free(v8);
    SSFileLog(v4, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:
  }
  return 0;
}

- (void)prioritizeAboveDownload:(id)a3 completionBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v5 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v5)
  {
    int v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  uint64_t v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v17 = 138543362;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  uint64_t v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v17, v16);
    free(v9);
    SSFileLog(v5, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v8);
LABEL_11:
  }
}

- (BOOL)removeAsset:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    int v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  int v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v17 = 138543362;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    int v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v17, v16);
    free(v8);
    SSFileLog(v4, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:
  }
  return 0;
}

- (void)restart
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    double v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  int v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v15 = 138543362;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 12;
  int v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    int v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v15, v14);
    free(v7);
    SSFileLog(v3, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:
  }
}

- (void)setBackgroundNetworkingJobGroupName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    int v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  int v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v16 = 138543362;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    int v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v16, v15);
    free(v8);
    SSFileLog(v4, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:
  }
}

- (void)setBackgroundNetworkingUserInitiated:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    int v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  int v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v16 = 138543362;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    int v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v16, v15);
    free(v8);
    SSFileLog(v4, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:
  }
}

- (void)setDownloadHandler:(id)a3 completionBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v5 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v5)
  {
    int v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  uint64_t v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v17 = 138543362;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  uint64_t v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v17, v16);
    free(v9);
    SSFileLog(v5, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v8);
LABEL_11:
  }
}

- (void)setDownloadPolicy:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    int v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  int v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v16 = 138543362;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    int v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v16, v15);
    free(v8);
    SSFileLog(v4, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:
  }
}

- (void)setValuesWithStoreDownloadMetadata:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    int v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  int v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  NSStringFromSelector(a2);
  int v16 = 138543362;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    int v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v16, v15);
    free(v8);
    SSFileLog(v4, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:
  }
}

- (NSString)downloadPhaseIdentifierOverride
{
  return self->_downloadPhaseIdentifierOverride;
}

- (void)setDownloadPhaseIdentifierOverride:(id)a3
{
}

- (SSBookDownloadStatus)downloadStatus
{
  return self->_downloadStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadStatus, 0);
  objc_storeStrong((id *)&self->_downloadPhaseIdentifierOverride, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
}

@end