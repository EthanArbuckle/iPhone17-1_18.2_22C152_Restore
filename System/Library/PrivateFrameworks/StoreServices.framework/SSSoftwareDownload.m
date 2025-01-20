@interface SSSoftwareDownload
- (ASDJob)job;
- (BOOL)addAsset:(id)a3 forType:(id)a4;
- (BOOL)isBackgroundNetworkingUserInitiated;
- (BOOL)isCancelable;
- (BOOL)isEligibleForRestore:(id *)a3;
- (BOOL)removeAsset:(id)a3;
- (SSSoftwareDownload)initWithJob:(id)a3;
- (SSSoftwareDownload)initWithPersistentIdentifier:(int64_t)a3;
- (double)estimatedSecondsRemaining;
- (double)percentComplete;
- (id)assetsForType:(id)a3;
- (id)backgroundNetworkingJobGroupName;
- (id)downloadPhaseIdentifier;
- (id)downloadPolicy;
- (id)failureError;
- (id)metadata;
- (id)networkConstraints;
- (id)status;
- (id)valueForProperty:(id)a3;
- (int64_t)bytesDownloaded;
- (int64_t)bytesTotal;
- (int64_t)downloadSizeLimit;
- (void)pause;
- (void)prioritizeAboveDownload:(id)a3 completionBlock:(id)a4;
- (void)restart;
- (void)resume;
- (void)setBackgroundNetworkingJobGroupName:(id)a3;
- (void)setBackgroundNetworkingUserInitiated:(BOOL)a3;
- (void)setDownloadHandler:(id)a3 completionBlock:(id)a4;
- (void)setDownloadPolicy:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNetworkConstraints:(id)a3;
- (void)setStatus:(id)a3;
- (void)setValuesWithStoreDownloadMetadata:(id)a3;
@end

@implementation SSSoftwareDownload

- (SSSoftwareDownload)initWithJob:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSSoftwareDownload;
  v6 = -[SSEntity _initWithPersistentIdentifier:](&v9, sel__initWithPersistentIdentifier_, [v5 persistentID]);
  v7 = (SSSoftwareDownload *)v6;
  if (v6) {
    objc_storeStrong(v6 + 12, a3);
  }

  return v7;
}

- (SSSoftwareDownload)initWithPersistentIdentifier:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  v8 = [v5 OSLogObject];
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
  objc_super v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v18, v17);
    free(v9);
    SSFileLog(v5, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v8);
LABEL_11:
  }
  return 0;
}

- (BOOL)isCancelable
{
  unint64_t v2 = [(ASDJob *)self->_job phase];
  return (v2 < 0xA) & (0x2CCu >> v2);
}

- (id)downloadPhaseIdentifier
{
  unint64_t v2 = [(ASDJob *)self->_job phase];
  if (v2 > 8) {
    v3 = SSDownloadPhaseWaiting;
  }
  else {
    v3 = off_1E5BAEE50[v2];
  }
  v4 = *v3;
  return v4;
}

- (id)failureError
{
  return (id)[(ASDJob *)self->_job failureError];
}

- (double)percentComplete
{
  [(ASDJob *)self->_job percentComplete];
  return result;
}

- (id)valueForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"7"])
  {
    objc_msgSend(NSNumber, "numberWithLongLong:", -[ASDJob storeItemID](self->_job, "storeItemID"));
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    int v6 = v5;
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"V"])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[ASDJob type](self->_job, "type") == 3);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"c"])
  {
    id v5 = [(ASDJob *)self->_job bundleID];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"1"])
  {
    id v5 = @"software";
    goto LABEL_9;
  }
  int v6 = 0;
LABEL_10:

  return v6;
}

- (id)metadata
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = +[SSLogConfig sharedDaemonConfig];
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

- (id)networkConstraints
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = +[SSLogConfig sharedDaemonConfig];
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

- (void)setMetadata:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = +[SSLogConfig sharedDaemonConfig];
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

- (void)setNetworkConstraints:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = +[SSLogConfig sharedDaemonConfig];
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

- (void)setStatus:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = +[SSLogConfig sharedDaemonConfig];
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

- (id)status
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = +[SSLogConfig sharedDaemonConfig];
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

- (id)assetsForType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v4 = +[SSLogConfig sharedDaemonConfig];
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

- (BOOL)addAsset:(id)a3 forType:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = +[SSLogConfig sharedDaemonConfig];
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
  v3 = +[SSLogConfig sharedDaemonConfig];
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

- (int64_t)bytesDownloaded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = +[SSLogConfig sharedDaemonConfig];
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

- (int64_t)bytesTotal
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = +[SSLogConfig sharedDaemonConfig];
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
  v3 = +[SSLogConfig sharedDaemonConfig];
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
  v3 = +[SSLogConfig sharedDaemonConfig];
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

- (double)estimatedSecondsRemaining
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = +[SSLogConfig sharedDaemonConfig];
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
  return -1.0;
}

- (BOOL)isBackgroundNetworkingUserInitiated
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = +[SSLogConfig sharedDaemonConfig];
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
  int v4 = +[SSLogConfig sharedDaemonConfig];
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

- (void)pause
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = +[SSLogConfig sharedDaemonConfig];
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

- (void)prioritizeAboveDownload:(id)a3 completionBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v5 = +[SSLogConfig sharedDaemonConfig];
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
  int v4 = +[SSLogConfig sharedDaemonConfig];
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

- (void)resume
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = +[SSLogConfig sharedDaemonConfig];
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

- (void)restart
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = +[SSLogConfig sharedDaemonConfig];
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
  int v4 = +[SSLogConfig sharedDaemonConfig];
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
  int v4 = +[SSLogConfig sharedDaemonConfig];
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
  int v5 = +[SSLogConfig sharedDaemonConfig];
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
  int v4 = +[SSLogConfig sharedDaemonConfig];
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
  int v4 = +[SSLogConfig sharedDaemonConfig];
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

- (ASDJob)job
{
  return self->_job;
}

- (void).cxx_destruct
{
}

@end