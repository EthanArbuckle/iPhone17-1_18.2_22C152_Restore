@interface ApplicationWorkspace
+ (BOOL)keepSafeHarborDataForBundleID:(id)a3;
+ (id)defaultWorkspace;
- (ApplicationWorkspace)init;
- (BOOL)_hasThumbnailDownloadOperationForDownloadID:(int64_t)a3;
- (BOOL)_isInstallingForDownloadIdentifier:(int64_t)a3;
- (BOOL)isDownloadingOrInstallingForItemIdentifier:(id)a3;
- (BOOL)isInstalledApp:(id)a3;
- (BOOL)isMultiUser;
- (BOOL)isRemovedSystemApp:(id)a3;
- (BOOL)shouldModifyQuota:(id)a3;
- (id)_copyCombinedApplicationProgress:(id)a3 forApplicationHandle:(id)a4;
- (id)_thumbnailDownloadOperationForDownloadID:(int64_t)a3;
- (id)sinfPathForBundleID:(id)a3;
- (void)_addOperationAtBeginning:(id)a3;
- (void)_addProgressOperation:(id)a3;
- (void)_cancelPlaceholderThumbnailInstallForDownloadID:(int64_t)a3;
- (void)_decrementPendingInstallsForDownloadIdentifier:(int64_t)a3;
- (void)_fireWaitBlocksForSyncTermination;
- (void)_fireWaitBlocksIfNecessaryForDownloadWithIdentifier:(int64_t)a3;
- (void)_incrementPendingInstallsForDownloadIdentifier:(int64_t)a3;
- (void)_performNextOperation;
- (void)_removeApplicationDownloadProgressForApplicationHandle:(id)a3;
- (void)_removeOperationsForDownloadIdentifier:(int64_t)a3;
- (void)_removeOperationsForDownloadIdentifier:(int64_t)a3 operationClass:(Class)a4;
- (void)_stopObservingODRProgress:(id)a3;
- (void)_updatePlaceholderWithODRProgressForApplicationHandle:(id)a3;
- (void)addPlaceholderThumbnailOperation:(id)a3;
- (void)applyWorkspaceChanges:(id)a3;
- (void)cancelPlaceholderInstallationForDownloadIdentifier:(int64_t)a3;
- (void)endExternalInstallationForDownloadIdentifier:(int64_t)a3;
- (void)finishInstallOfApplicationHandle:(id)a3;
- (void)installPlaceholderForApplicationHandle:(id)a3;
- (void)markFailedPlaceholderForApplicationHandle:(id)a3;
- (void)replayIncompleteOperations;
- (void)resetProgressForApplicationHandle:(id)a3;
- (void)restorePlaceholderForApplicationHandle:(id)a3;
- (void)resumeQuotas;
- (void)setIconData:(id)a3 forApplicationHandle:(id)a4;
- (void)suspendQuotas;
- (void)uninstallPlaceholderForApplicationHandle:(id)a3;
- (void)updatePlaceholderForApplicationHandle:(id)a3;
- (void)updatePlaceholderWithApplicationProgress:(id)a3;
- (void)waitForInstallOfDownloadIdentifier:(int64_t)a3 completionBlock:(id)a4;
- (void)waitForSyncBubbleToTerminateWithCompletionBlock:(id)a3;
- (void)willSwitchUser;
@end

@implementation ApplicationWorkspace

- (ApplicationWorkspace)init
{
  v28.receiver = self;
  v28.super_class = (Class)ApplicationWorkspace;
  id v2 = [(ApplicationWorkspace *)&v28 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.ApplicationWorkspace.callback", 0);
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    v5 = *((void *)v2 + 2);
    v6 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v5, v6);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunesstored.ApplicationWorkspace", 0);
    v8 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v7;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 3), v6);
    id v9 = objc_alloc_init((Class)NSLock);
    v10 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v9;

    [*((id *)v2 + 4) setName:@"com.apple.itunesstored.ApplicationWorkspace"];
    id v11 = objc_alloc_init((Class)NSMutableArray);
    v12 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v11;

    id v13 = objc_alloc_init((Class)NSCountedSet);
    v14 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v13;

    id v15 = objc_alloc_init((Class)ISOperationQueue);
    v16 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v15;

    [*((id *)v2 + 7) setAdjustsMaxConcurrentOperationCount:0];
    [*((id *)v2 + 7) setMaxConcurrentOperationCount:1];
    [*((id *)v2 + 7) setName:@"com.apple.itunesstored.ApplicationWorkspace.background"];
    v17 = +[UMUserManager sharedManager];
    LODWORD(v6) = [v17 isMultiUser];

    if (v6)
    {
      v18 = +[UMUserManager sharedManager];
      [v18 registerUserSwitchStakeHolder:v2];

      v19 = +[SSLogConfig sharedDaemonConfig];
      if (!v19)
      {
        v19 = +[SSLogConfig sharedConfig];
      }
      unsigned int v20 = [v19 shouldLog];
      if ([v19 shouldLogToDisk]) {
        int v21 = v20 | 2;
      }
      else {
        int v21 = v20;
      }
      v22 = [v19 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
        int v23 = v21;
      }
      else {
        int v23 = v21 & 2;
      }
      if (v23)
      {
        v27[0] = 0;
        LODWORD(v26) = 2;
        v24 = (void *)_os_log_send_and_compose_impl();

        if (!v24)
        {
LABEL_15:

          return (ApplicationWorkspace *)v2;
        }
        v22 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, v27, v26);
        free(v24);
        SSFileLog();
      }

      goto LABEL_15;
    }
  }
  return (ApplicationWorkspace *)v2;
}

+ (id)defaultWorkspace
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E9E94;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100401DB0 != -1) {
    dispatch_once(&qword_100401DB0, block);
  }
  id v2 = (void *)qword_100401DA8;

  return v2;
}

- (void)applyWorkspaceChanges:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        switch((unint64_t)[v9 changeType])
        {
          case 0uLL:
            v10 = [v9 applicationHandle];
            [(ApplicationWorkspace *)self installPlaceholderForApplicationHandle:v10];
            goto LABEL_12;
          case 1uLL:
            v10 = [v9 applicationHandle];
            [(ApplicationWorkspace *)self uninstallPlaceholderForApplicationHandle:v10];
            goto LABEL_12;
          case 2uLL:
            v10 = [v9 applicationHandle];
            [(ApplicationWorkspace *)self finishInstallOfApplicationHandle:v10];
            goto LABEL_12;
          case 3uLL:
            v10 = [v9 applicationHandle];
            [(ApplicationWorkspace *)self markFailedPlaceholderForApplicationHandle:v10];
            goto LABEL_12;
          case 5uLL:
            v10 = [v9 applicationHandle];
            [(ApplicationWorkspace *)self updatePlaceholderForApplicationHandle:v10];
LABEL_12:

            break;
          default:
            continue;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)addPlaceholderThumbnailOperation:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_lock lock];
  id v5 = [v4 applicationHandle];
  if (-[ApplicationWorkspace _hasThumbnailDownloadOperationForDownloadID:](self, "_hasThumbnailDownloadOperationForDownloadID:", [v5 downloadID]))
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    id v9 = [v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      int v10 = v8;
    }
    else {
      int v10 = v8 & 2;
    }
    if (!v10) {
      goto LABEL_24;
    }
    LODWORD(v16) = 138412290;
    *(void *)((char *)&v16 + 4) = v5;
    LODWORD(v15) = 12;
  }
  else
  {
    [(ISOperationQueue *)self->_placeholderIconOperationQueue addOperation:v4];
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    id v9 = [v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      int v13 = v12;
    }
    else {
      int v13 = v12 & 2;
    }
    if (!v13) {
      goto LABEL_24;
    }
    LODWORD(v16) = 138412290;
    *(void *)((char *)&v16 + 4) = v5;
    LODWORD(v15) = 12;
  }
  long long v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v16, v15, v16);
    free(v14);
    SSFileLog();
LABEL_24:
  }
  [(NSLock *)self->_lock unlock];
}

- (void)cancelPlaceholderInstallationForDownloadIdentifier:(int64_t)a3
{
  [(NSLock *)self->_lock lock];
  if ([(ApplicationWorkspace *)self _hasThumbnailDownloadOperationForDownloadID:a3])
  {
    [(ApplicationWorkspace *)self _cancelPlaceholderThumbnailInstallForDownloadID:a3];
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)endExternalInstallationForDownloadIdentifier:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EA3D8;
  v4[3] = &unk_1003A5220;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)finishInstallOfApplicationHandle:(id)a3
{
  id v4 = a3;
  id v5 = [[ApplicationWorkspaceFinishOperation alloc] initWithApplicationHandle:v4];
  [(NSLock *)self->_lock lock];
  id v6 = [v4 downloadID];
  [(ApplicationWorkspace *)self _removeApplicationDownloadProgressForApplicationHandle:v4];

  [(ApplicationWorkspace *)self _removeOperationsForDownloadIdentifier:v6];
  [(ApplicationWorkspace *)self _addOperationAtBeginning:v5];
  [(NSLock *)self->_lock unlock];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EA508;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)isDownloadingOrInstallingForItemIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  unsigned int v7 = [v5 shouldLogToDisk];
  int v8 = [v5 OSLogObject];
  id v9 = v8;
  if (v7) {
    v6 |= 2u;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    int v10 = v6;
  }
  else {
    int v10 = v6 & 2;
  }
  if (v10)
  {
    int v51 = 138412290;
    id v52 = v4;
    LODWORD(v37) = 12;
    v36 = &v51;
    unsigned int v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_12;
    }
    id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v51, v37);
    free(v11);
    v36 = (int *)v9;
    SSFileLog();
  }

LABEL_12:
  int v12 = objc_opt_new();
  int v13 = +[DownloadsDatabase downloadsDatabase];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000EAC68;
  v42[3] = &unk_1003A6230;
  id v14 = v4;
  id v43 = v14;
  v45 = &v46;
  id v15 = v12;
  id v44 = v15;
  [v13 readUsingTransactionBlock:v42];

  if (*((unsigned char *)v47 + 24) || ![v15 count]) {
    goto LABEL_36;
  }
  [(NSLock *)self->_lock lock];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (!v17) {
    goto LABEL_35;
  }
  uint64_t v18 = *(void *)v39;
  while (2)
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(void *)v39 != v18) {
        objc_enumerationMutation(v16);
      }
      if (-[ApplicationWorkspace _isInstallingForDownloadIdentifier:](self, "_isInstallingForDownloadIdentifier:", objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "longLongValue", v36)))
      {
        unsigned int v20 = +[SSLogConfig sharedDaemonConfig];
        if (!v20)
        {
          unsigned int v20 = +[SSLogConfig sharedConfig];
        }
        unsigned int v21 = [v20 shouldLog];
        unsigned int v22 = [v20 shouldLogToDisk];
        int v23 = [v20 OSLogObject];
        v24 = v23;
        if (v22) {
          v21 |= 2u;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
          int v25 = v21;
        }
        else {
          int v25 = v21 & 2;
        }
        if (v25)
        {
          int v51 = 138412290;
          id v52 = v14;
          LODWORD(v37) = 12;
          v36 = &v51;
          uint64_t v26 = (void *)_os_log_send_and_compose_impl();

          if (!v26)
          {
LABEL_34:

            *((unsigned char *)v47 + 24) = 0;
            goto LABEL_35;
          }
          v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v51, v37, (void)v38);
          free(v26);
          v36 = (int *)v24;
          SSFileLog();
        }

        goto LABEL_34;
      }
    }
    id v17 = [v16 countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v17) {
      continue;
    }
    break;
  }
LABEL_35:

  [(NSLock *)self->_lock unlock];
LABEL_36:
  if (*((unsigned char *)v47 + 24))
  {
    v27 = +[SSLogConfig sharedDaemonConfig];
    if (!v27)
    {
      v27 = +[SSLogConfig sharedConfig];
    }
    unsigned int v28 = objc_msgSend(v27, "shouldLog", v36);
    unsigned int v29 = [v27 shouldLogToDisk];
    v30 = [v27 OSLogObject];
    v31 = v30;
    if (v29) {
      v28 |= 2u;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      int v32 = v28;
    }
    else {
      int v32 = v28 & 2;
    }
    if (v32)
    {
      int v51 = 138412290;
      id v52 = v14;
      LODWORD(v37) = 12;
      v33 = (void *)_os_log_send_and_compose_impl();

      if (v33)
      {
        v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v51, v37);
        free(v33);
        SSFileLog();
        goto LABEL_47;
      }
    }
    else
    {
LABEL_47:
    }
    BOOL v34 = *((unsigned char *)v47 + 24) != 0;
  }
  else
  {
    BOOL v34 = 0;
  }

  _Block_object_dispose(&v46, 8);
  return v34;
}

- (BOOL)isMultiUser
{
  id v2 = +[UMUserManager sharedManager];
  unsigned __int8 v3 = [v2 isMultiUser];

  return v3;
}

- (void)installPlaceholderForApplicationHandle:(id)a3
{
  id v4 = a3;
  if (!SSDebugShouldUseAppstored())
  {
    unsigned int v11 = [[ApplicationWorkspaceInstallPlaceholderOperation alloc] initWithApplicationHandle:v4 forceUpdate:0];

    [(NSLock *)self->_lock lock];
    [(NSMutableArray *)self->_operations addObject:v11];
    [(NSLock *)self->_lock unlock];
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EB348;
    block[3] = &unk_1003A3140;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
    goto LABEL_15;
  }
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  int v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_12;
  }
  int v15 = 138412290;
  id v16 = (id)objc_opt_class();
  id v9 = v16;
  LODWORD(v13) = 12;
  int v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    int v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v15, v13);
    free(v10);
    SSFileLog();
LABEL_12:
  }
  unsigned int v11 = [v4 bundleID];

  +[ApplicationWorkspaceState completeNotificationForInstallingBundleIdentifier:v11];
LABEL_15:
}

- (BOOL)isInstalledApp:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = +[LSApplicationProxy applicationProxyForIdentifier:v4];
    unsigned int v6 = v5;
    if (v5)
    {
      int v7 = [v5 appState];
      if ([v7 isInstalled])
      {

LABEL_8:
        unsigned int v11 = [v6 appState];
        unsigned __int8 v8 = [v11 isValid];

LABEL_10:
        goto LABEL_11;
      }
      id v9 = [v6 appState];
      unsigned int v10 = [v9 isPlaceholder];

      if (v10) {
        goto LABEL_8;
      }
    }
    unsigned __int8 v8 = 0;
    goto LABEL_10;
  }
  unsigned __int8 v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)isRemovedSystemApp:(id)a3
{
  return ![(ApplicationWorkspace *)self isInstalledApp:a3];
}

+ (BOOL)keepSafeHarborDataForBundleID:(id)a3
{
  id v3 = +[LSApplicationProxy applicationProxyForIdentifier:a3];
  id v4 = [v3 bundleContainerURL];
  id v5 = [v4 path];

  unsigned int v6 = [v5 stringByAppendingPathComponent:@"iTunesMetadata.plist"];
  int v7 = +[NSMutableDictionary dictionaryWithContentsOfFile:v6];
  unsigned __int8 v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKey:@"DeviceBasedVPP"];
    if (v9 && (objc_opt_class(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      unsigned __int8 v10 = [v9 BOOLValue];
    }
    else {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)markFailedPlaceholderForApplicationHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(ApplicationWorkspaceOperation *)[ApplicationWorkspaceFailedPlaceholderOperation alloc] initWithApplicationHandle:v4];
  [(NSLock *)self->_lock lock];
  id v6 = [v4 downloadID];

  [(ApplicationWorkspace *)self _removeOperationsForDownloadIdentifier:v6];
  [(ApplicationWorkspace *)self _addOperationAtBeginning:v5];
  [(NSLock *)self->_lock unlock];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EB62C;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)replayIncompleteOperations
{
  +[NSDate timeIntervalSinceReferenceDate];
  id v4 = +[NSNumber numberWithInt:(int)v3];
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  unsigned __int8 v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_11;
  }
  int v17 = 138412546;
  id v18 = (id)objc_opt_class();
  __int16 v19 = 2112;
  unsigned int v20 = v4;
  id v9 = v18;
  LODWORD(v13) = 22;
  unsigned __int8 v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    unsigned __int8 v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v17, v13);
    free(v10);
    SSFileLog();
LABEL_11:
  }
  unsigned int v11 = +[DownloadsDatabase downloadsDatabase];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000EB868;
  v14[3] = &unk_1003A55F8;
  id v15 = v4;
  id v16 = self;
  id v12 = v4;
  [v11 modifyAsyncUsingTransactionBlock:v14];
}

- (void)resetProgressForApplicationHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(ApplicationWorkspaceOperation *)[ApplicationWorkspaceClearProgressOperation alloc] initWithApplicationHandle:v4];

  [(NSLock *)self->_lock lock];
  [(NSMutableArray *)self->_operations addObject:v5];
  [(NSLock *)self->_lock unlock];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EC450;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)restorePlaceholderForApplicationHandle:(id)a3
{
  id v4 = a3;
  id v5 = [[ApplicationWorkspaceFinishOperation alloc] initWithApplicationHandle:v4 isPlaceholderRestore:1];

  [(NSLock *)self->_lock lock];
  [(ApplicationWorkspace *)self _addOperationAtBeginning:v5];
  [(NSLock *)self->_lock unlock];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EC528;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)resumeQuotas
{
  double v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3)
  {
    double v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  unsigned int v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (v5)
  {
    LODWORD(v33) = 138412290;
    *(void *)((char *)&v33 + 4) = objc_opt_class();
    id v7 = *(id *)((char *)&v33 + 4);
    LODWORD(v27) = 12;
    uint64_t v26 = &v33;
    unsigned __int8 v8 = (void *)_os_log_send_and_compose_impl();

    if (v8)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v33, v27);
      id v9 = (long long *)objc_claimAutoreleasedReturnValue();
      free(v8);
      uint64_t v26 = v9;
      SSFileLog();
    }
  }
  else
  {
  }
  *(void *)&long long v33 = 0;
  *((void *)&v33 + 1) = &v33;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  unsigned __int8 v10 = +[DownloadsDatabase downloadsDatabase];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000EC9FC;
  v28[3] = &unk_1003A62A8;
  v28[4] = self;
  v28[5] = &v33;
  [v10 readUsingTransactionBlock:v28];

  if (*(_DWORD *)(*((void *)&v33 + 1) + 24))
  {
    unsigned int v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11)
    {
      unsigned int v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = objc_msgSend(v11, "shouldLog", v26);
    unsigned int v13 = [v11 shouldLogToDisk];
    id v14 = [v11 OSLogObject];
    id v15 = v14;
    if (v13) {
      v12 |= 2u;
    }
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      v12 &= 2u;
    }
    if (!v12) {
      goto LABEL_31;
    }
    id v16 = objc_opt_class();
    int v17 = *(_DWORD *)(*((void *)&v33 + 1) + 24);
    int v29 = 138412546;
    v30 = v16;
    __int16 v31 = 1024;
    int v32 = v17;
    id v18 = v16;
    LODWORD(v27) = 18;
    __int16 v19 = (void *)_os_log_send_and_compose_impl();

    if (v19)
    {
LABEL_30:
      id v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v29, v27);
      free(v19);
      SSFileLog();
LABEL_31:
    }
  }
  else
  {
    unsigned int v20 = +[UMUserManager sharedManager];
    [v20 resumeQuotas];

    unsigned int v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11)
    {
      unsigned int v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v21 = objc_msgSend(v11, "shouldLog", v26);
    unsigned int v22 = [v11 shouldLogToDisk];
    int v23 = [v11 OSLogObject];
    id v15 = v23;
    if (v22) {
      v21 |= 2u;
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
      v21 &= 2u;
    }
    if (!v21) {
      goto LABEL_31;
    }
    v24 = objc_opt_class();
    int v29 = 138412290;
    v30 = v24;
    id v25 = v24;
    LODWORD(v27) = 12;
    __int16 v19 = (void *)_os_log_send_and_compose_impl();

    if (v19) {
      goto LABEL_30;
    }
  }

  _Block_object_dispose(&v33, 8);
}

- (void)setIconData:(id)a3 forApplicationHandle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned __int8 v8 = [[ApplicationWorkspaceInstallPlaceholderOperation alloc] initWithApplicationHandle:v6 iconData:v7];

  [(NSLock *)self->_lock lock];
  id v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9)
  {
    id v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  unsigned int v12 = [v9 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    int v13 = v11;
  }
  else {
    int v13 = v11 & 2;
  }
  if (!v13) {
    goto LABEL_12;
  }
  int v18 = 138412290;
  id v19 = v6;
  LODWORD(v16) = 12;
  id v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    unsigned int v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v18, v16);
    free(v14);
    SSFileLog();
LABEL_12:
  }
  [(NSMutableArray *)self->_operations addObject:v8];
  [(NSLock *)self->_lock unlock];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED010;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)shouldModifyQuota:(id)a3
{
  id v3 = a3;
  if (SSDownloadKindIsSoftwareKind())
  {
    unsigned __int8 v4 = 0;
  }
  else if (SSDownloadKindIsEBookKind())
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:SSDownloadKindDocument];
  }

  return v4;
}

- (void)suspendQuotas
{
  id v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3)
  {
    id v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  int v12 = 138412290;
  id v13 = (id)objc_opt_class();
  id v7 = v13;
  LODWORD(v10) = 12;
  unsigned __int8 v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    id v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v12, v10);
    free(v8);
    SSFileLog();
LABEL_11:
  }
  id v9 = +[UMUserManager sharedManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000ED268;
  v11[3] = &unk_1003A3700;
  v11[4] = self;
  [v9 suspendQuotasWithCompletionHandler:v11];
}

- (void)uninstallPlaceholderForApplicationHandle:(id)a3
{
  id v4 = a3;
  int v5 = [(ApplicationWorkspaceOperation *)[ApplicationWorkspaceUninstallOperation alloc] initWithApplicationHandle:v4];
  [(NSLock *)self->_lock lock];
  id v6 = [v4 downloadID];

  [(ApplicationWorkspace *)self _removeOperationsForDownloadIdentifier:v6];
  [(ApplicationWorkspace *)self _addOperationAtBeginning:v5];
  [(NSLock *)self->_lock unlock];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED4E4;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)updatePlaceholderForApplicationHandle:(id)a3
{
  id v4 = a3;
  int v5 = [[ApplicationWorkspaceInstallPlaceholderOperation alloc] initWithApplicationHandle:v4 forceUpdate:1];

  [(NSLock *)self->_lock lock];
  [(NSMutableArray *)self->_operations addObject:v5];
  [(NSLock *)self->_lock unlock];
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED5BC;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)updatePlaceholderWithApplicationProgress:(id)a3
{
  id v4 = a3;
  id v11 = [v4 applicationHandle];
  [(NSLock *)self->_lock lock];
  appProgress = self->_appProgress;
  if (!appProgress)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v7 = self->_appProgress;
    self->_appProgress = v6;

    appProgress = self->_appProgress;
  }
  id v8 = [v4 copy];
  [(NSMutableDictionary *)appProgress setObject:v8 forKey:v11];

  [(NSLock *)self->_lock unlock];
  id v9 = [(ApplicationWorkspace *)self _copyCombinedApplicationProgress:v4 forApplicationHandle:v11];

  uint64_t v10 = [[ApplicationWorkspaceProgressOperation alloc] initWithApplicationDownloadProgress:v9];
  [(ApplicationWorkspace *)self _addProgressOperation:v10];
}

- (void)waitForInstallOfDownloadIdentifier:(int64_t)a3 completionBlock:(id)a4
{
  id v6 = [a4 copy];
  [(NSLock *)self->_lock lock];
  if (![(ApplicationWorkspace *)self _isInstallingForDownloadIdentifier:a3])
  {
    callbackQueue = self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000ED970;
    block[3] = &unk_1003A31C8;
    id v26 = v6;
    dispatch_async(callbackQueue, block);
    id v13 = v26;
    goto LABEL_21;
  }
  id v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    id v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  uint64_t v10 = [v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    int v11 = v9;
  }
  else {
    int v11 = v9 & 2;
  }
  if (!v11) {
    goto LABEL_13;
  }
  int v27 = 134217984;
  int64_t v28 = a3;
  LODWORD(v24) = 12;
  int v23 = &v27;
  int v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    uint64_t v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v27, v24);
    free(v12);
    int v23 = (int *)v10;
    SSFileLog();
LABEL_13:
  }
  id v13 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  waitBlocks = self->_waitBlocks;
  if (!waitBlocks)
  {
    id v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v16 = self->_waitBlocks;
    self->_waitBlocks = v15;

    waitBlocks = self->_waitBlocks;
  }
  uint64_t v17 = -[NSMutableDictionary objectForKey:](waitBlocks, "objectForKey:", v13, v23);
  if (v17)
  {
    id v18 = (id)v17;
    id v19 = objc_retainBlock(v6);
    [v18 addObject:v19];
  }
  else
  {
    id v21 = objc_alloc((Class)NSMutableArray);
    id v22 = objc_retainBlock(v6);
    id v18 = objc_msgSend(v21, "initWithObjects:", v22, 0);

    [(NSMutableDictionary *)self->_waitBlocks setObject:v18 forKey:v13];
  }

LABEL_21:
  [(NSLock *)self->_lock unlock];
}

- (void)waitForSyncBubbleToTerminateWithCompletionBlock:(id)a3
{
  id v4 = [a3 copy];
  [(NSLock *)self->_lock lock];
  syncWaitBlocks = self->_syncWaitBlocks;
  if (!syncWaitBlocks)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = self->_syncWaitBlocks;
    self->_syncWaitBlocks = v6;

    syncWaitBlocks = self->_syncWaitBlocks;
  }
  id v8 = objc_retainBlock(v4);
  [(NSMutableArray *)syncWaitBlocks addObject:v8];

  if ([(NSMutableArray *)self->_syncWaitBlocks count] == (id)1)
  {
    int v9 = +[UMUserManager sharedManager];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000EDA88;
    v10[3] = &unk_1003A3140;
    v10[4] = self;
    [v9 terminateSyncWithCompletionHandler:v10];
  }
  [(NSLock *)self->_lock unlock];
}

- (id)sinfPathForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    int v5 = +[LSApplicationProxy applicationProxyForIdentifier:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 bundleURL];
      id v8 = [v7 path];

      int v9 = [v6 bundleExecutable];
      uint64_t v10 = [v9 stringByAppendingPathExtension:@"sinf"];

      if ([v8 length] && objc_msgSend(v10, "length"))
      {
        id v11 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v8, @"SC_Info", v10, 0);
        int v12 = +[NSString pathWithComponents:v11];
      }
      else
      {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (void)willSwitchUser
{
  [(NSLock *)self->_lock lock];
  id v3 = [(NSCountedSet *)self->_pendingInstalls copy];
  char v49 = self;
  [(NSLock *)self->_lock unlock];
  id v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4)
  {
    id v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  id v8 = [v3 count];
  int v57 = 134217984;
  id v58 = v8;
  LODWORD(v45) = 12;
  id v43 = &v57;
  int v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    id v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v57, v45);
    free(v9);
    id v43 = (int *)v7;
    SSFileLog();
LABEL_11:
  }
  uint64_t v10 = +[UMUserSwitchBlockingTask taskWithName:@"terminate multiuser mode" reason:@"user is going to change"];
  [v10 begin];
  id v11 = +[DownloadsDatabase downloadsDatabase];
  id v12 = [v11 modifyUsingTransactionBlock:&stru_1003A62C8];

  if (![v3 count])
  {
    v36 = 0;
    goto LABEL_59;
  }
  id v46 = v3;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v3;
  id v13 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (!v13)
  {
    uint64_t v48 = 0;
    goto LABEL_58;
  }
  id v14 = v13;
  uint64_t v48 = 0;
  uint64_t v15 = *(void *)v53;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v53 != v15) {
        objc_enumerationMutation(obj);
      }
      id v17 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "longLongValue", v43);
      id v18 = +[SSLogConfig sharedDaemonConfig];
      if (!v18)
      {
        id v18 = +[SSLogConfig sharedConfig];
      }
      unsigned int v19 = [v18 shouldLog];
      if ([v18 shouldLogToDisk]) {
        int v20 = v19 | 2;
      }
      else {
        int v20 = v19;
      }
      id v21 = [v18 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
        int v22 = v20;
      }
      else {
        int v22 = v20 & 2;
      }
      if (v22)
      {
        int v57 = 134217984;
        id v58 = v17;
        LODWORD(v45) = 12;
        id v44 = &v57;
        int v23 = (void *)_os_log_send_and_compose_impl();

        if (!v23) {
          goto LABEL_30;
        }
        id v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v57, v45);
        free(v23);
        id v44 = (int *)v21;
        SSFileLog();
      }

LABEL_30:
      dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_1000EE8B8;
      v50[3] = &unk_1003A3140;
      id v25 = v24;
      int v51 = v25;
      [(ApplicationWorkspace *)v49 waitForInstallOfDownloadIdentifier:v17 completionBlock:v50];
      dispatch_time_t v26 = dispatch_time(0, 60000000000);
      if (dispatch_semaphore_wait(v25, v26))
      {
        int v27 = +[SSLogConfig sharedDaemonConfig];
        if (!v27)
        {
          int v27 = +[SSLogConfig sharedConfig];
        }
        unsigned int v28 = objc_msgSend(v27, "shouldLog", v44);
        if ([v27 shouldLogToDisk]) {
          int v29 = v28 | 2;
        }
        else {
          int v29 = v28;
        }
        v30 = [v27 OSLogObject];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
          int v31 = v29;
        }
        else {
          int v31 = v29 & 2;
        }
        if (!v31) {
          goto LABEL_52;
        }
      }
      else
      {
        int v27 = +[SSLogConfig sharedDaemonConfig];
        if (!v27)
        {
          int v27 = +[SSLogConfig sharedConfig];
        }
        ++v48;
        unsigned int v32 = objc_msgSend(v27, "shouldLog", v44);
        if ([v27 shouldLogToDisk]) {
          int v33 = v32 | 2;
        }
        else {
          int v33 = v32;
        }
        v30 = [v27 OSLogObject];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
          int v34 = v33;
        }
        else {
          int v34 = v33 & 2;
        }
        if (!v34) {
          goto LABEL_52;
        }
      }
      int v57 = 134217984;
      id v58 = v17;
      LODWORD(v45) = 12;
      id v43 = &v57;
      int v35 = (void *)_os_log_send_and_compose_impl();

      if (!v35) {
        goto LABEL_53;
      }
      v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v35, 4, &v57, v45);
      free(v35);
      id v43 = (int *)v30;
      SSFileLog();
LABEL_52:

LABEL_53:
    }
    id v14 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  }
  while (v14);
LABEL_58:

  id v3 = v46;
  v36 = v48;
LABEL_59:
  uint64_t v37 = +[SSLogConfig sharedDaemonConfig];
  if (!v37)
  {
    uint64_t v37 = +[SSLogConfig sharedConfig];
  }
  unsigned int v38 = [v37 shouldLog];
  if ([v37 shouldLogToDisk]) {
    int v39 = v38 | 2;
  }
  else {
    int v39 = v38;
  }
  long long v40 = [v37 OSLogObject];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
    int v41 = v39;
  }
  else {
    int v41 = v39 & 2;
  }
  if (v41)
  {
    int v57 = 134217984;
    id v58 = v36;
    LODWORD(v45) = 12;
    v42 = (void *)_os_log_send_and_compose_impl();

    if (v42)
    {
      long long v40 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 4, &v57, v45);
      free(v42);
      SSFileLog();
      goto LABEL_70;
    }
  }
  else
  {
LABEL_70:
  }
  [v10 end];
}

- (void)_addOperationAtBeginning:(id)a3
{
  id v10 = a3;
  uint64_t v4 = (uint64_t)[(NSMutableArray *)self->_operations count];
  if (v4 < 1)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(NSMutableArray *)self->_operations objectAtIndex:v6];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();

      if (v8 != v9) {
        break;
      }
      if (v5 == ++v6)
      {
        uint64_t v6 = v5;
        break;
      }
    }
  }
  [(NSMutableArray *)self->_operations insertObject:v10 atIndex:v6];
}

- (void)_addProgressOperation:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_lock lock];
  uint64_t v5 = [v4 applicationHandle];
  id v6 = [v5 downloadID];

  uint64_t v7 = (uint64_t)[(NSMutableArray *)self->_operations count];
  if (v7 >= 1)
  {
    uint64_t v8 = v7 + 1;
    while (1)
    {
      uint64_t v9 = [(NSMutableArray *)self->_operations objectAtIndex:v8 - 2];
      uint64_t v10 = objc_opt_class();
      if (v10 == objc_opt_class())
      {
        id v11 = [v9 applicationHandle];
        id v12 = [v11 downloadID];

        if (v12 == v6) {
          break;
        }
      }

      if ((unint64_t)--v8 <= 1) {
        goto LABEL_8;
      }
    }
    [(NSMutableArray *)self->_operations removeObjectAtIndex:v8 - 2];
  }
LABEL_8:
  operations = self->_operations;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000EEB68;
  v17[3] = &unk_1003A62E8;
  v17[4] = v6;
  id v14 = (char *)[(NSMutableArray *)operations indexOfObjectWithOptions:2 passingTest:v17];
  if (v14 == (char *)0x7FFFFFFFFFFFFFFFLL) {
    [(ApplicationWorkspace *)self _addOperationAtBeginning:v4];
  }
  else {
    [(NSMutableArray *)self->_operations insertObject:v4 atIndex:v14 + 1];
  }
  [(NSLock *)self->_lock unlock];
  dispatchQueue = self->_dispatchQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000EEBAC;
  v16[3] = &unk_1003A3140;
  v16[4] = self;
  dispatch_async(dispatchQueue, v16);
}

- (void)_cancelPlaceholderThumbnailInstallForDownloadID:(int64_t)a3
{
  id v3 = [(ApplicationWorkspace *)self _thumbnailDownloadOperationForDownloadID:a3];
  id v4 = v3;
  if (v3)
  {
    [v3 cancel];
    uint64_t v5 = +[SSLogConfig sharedDaemonConfig];
    if (!v5)
    {
      uint64_t v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    uint64_t v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (v7)
    {
      [v4 applicationHandle];
      int v11 = 138412290;
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = 12;
      uint64_t v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v11, v10);
      free(v9);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (id)_copyCombinedApplicationProgress:(id)a3 forApplicationHandle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = objc_alloc_init(ApplicationDownloadProgress);
  [(ApplicationDownloadProgress *)v7 setApplicationHandle:v5];

  id v8 = [v6 completedUnitCount];
  id v9 = [v6 totalUnitCount];

  [(ApplicationDownloadProgress *)v7 setCompletedUnitCount:v8];
  [(ApplicationDownloadProgress *)v7 setTotalUnitCount:v9];
  return v7;
}

- (void)_fireWaitBlocksIfNecessaryForDownloadWithIdentifier:(int64_t)a3
{
  [(NSLock *)self->_lock lock];
  if ([(ApplicationWorkspace *)self _isInstallingForDownloadIdentifier:a3])
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
    int v7 = [(NSMutableDictionary *)self->_waitBlocks objectForKey:v6];
    id v5 = [v7 copy];

    [(NSMutableDictionary *)self->_waitBlocks removeObjectForKey:v6];
  }
  [(NSLock *)self->_lock unlock];
  if ([v5 count])
  {
    callbackQueue = self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EEEF4;
    block[3] = &unk_1003A3140;
    id v10 = v5;
    dispatch_async(callbackQueue, block);
  }
}

- (void)_fireWaitBlocksForSyncTermination
{
  [(NSLock *)self->_lock lock];
  id v3 = [(NSMutableArray *)self->_syncWaitBlocks copy];
  [(NSMutableArray *)self->_syncWaitBlocks removeAllObjects];
  [(NSLock *)self->_lock unlock];
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000EF0A8;
  v6[3] = &unk_1003A3268;
  id v7 = v3;
  id v8 = self;
  id v5 = v3;
  dispatch_async(dispatchQueue, v6);
}

- (BOOL)_hasThumbnailDownloadOperationForDownloadID:(int64_t)a3
{
  id v3 = [(ApplicationWorkspace *)self _thumbnailDownloadOperationForDownloadID:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_isInstallingForDownloadIdentifier:(int64_t)a3
{
  id v5 = [objc_alloc((Class)NSNumber) initWithLongLong:a3];
  if ([(NSCountedSet *)self->_pendingInstalls countForObject:v5])
  {
    BOOL v6 = 1;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = self->_operations;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v13 = objc_msgSend(v12, "applicationHandle", (void)v16);
          if ([v13 downloadID] == (id)a3)
          {
            unsigned __int8 v14 = [v12 blocksAppInstallation];

            if (v14)
            {
              BOOL v6 = 1;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
    BOOL v6 = 0;
LABEL_15:
  }
  return v6;
}

- (void)_performNextOperation
{
  [(NSLock *)self->_lock lock];
  if ([(NSMutableArray *)self->_operations count])
  {
    id v3 = [(NSMutableArray *)self->_operations objectAtIndex:0];
    [(NSMutableArray *)self->_operations removeObjectAtIndex:0];
    [(NSLock *)self->_lock unlock];
    if (v3)
    {
      uint64_t v15 = 0;
      long long v16 = &v15;
      uint64_t v17 = 0x3032000000;
      long long v18 = sub_1000EF5F0;
      long long v19 = sub_1000EF600;
      id v20 = 0;
      BOOL v4 = [v3 applicationHandle];
      id v5 = [v4 downloadID];
      if ([v3 blocksAppInstallation]) {
        [(ApplicationWorkspace *)self _incrementPendingInstallsForDownloadIdentifier:v5];
      }
      id v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472;
      int v11 = sub_1000EF608;
      id v12 = &unk_1003A6310;
      unsigned __int8 v14 = &v15;
      BOOL v6 = dispatch_semaphore_create(0);
      id v13 = v6;
      [v3 runWithCompletionBlock:&v9];
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      id v7 = (void *)v16[5];
      if (v7) {
        objc_msgSend(v7, "isFinished", v9, v10, v11, v12);
      }
      if (objc_msgSend(v3, "blocksAppInstallation", v9, v10, v11, v12)) {
        [(ApplicationWorkspace *)self _decrementPendingInstallsForDownloadIdentifier:v5];
      }
      [(ApplicationWorkspace *)self _fireWaitBlocksIfNecessaryForDownloadWithIdentifier:v5];

      _Block_object_dispose(&v15, 8);
    }
  }
  else
  {
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (void)_removeApplicationDownloadProgressForApplicationHandle:(id)a3
{
  [(NSMutableDictionary *)self->_appProgress removeObjectForKey:a3];
  if (![(NSMutableDictionary *)self->_appProgress count])
  {
    appProgress = self->_appProgress;
    self->_appProgress = 0;
  }
}

- (void)_removeOperationsForDownloadIdentifier:(int64_t)a3
{
}

- (void)_removeOperationsForDownloadIdentifier:(int64_t)a3 operationClass:(Class)a4
{
  uint64_t v7 = (uint64_t)[(NSMutableArray *)self->_operations count];
  if (v7 >= 1)
  {
    unint64_t v8 = v7 + 1;
    do
    {
      id v9 = [(NSMutableArray *)self->_operations objectAtIndex:v8 - 2];
      uint64_t v10 = [v9 applicationHandle];
      id v11 = [v10 downloadID];

      if (v11 == (id)a3 && (!a4 || (objc_opt_isKindOfClass() & 1) != 0)) {
        [(NSMutableArray *)self->_operations removeObjectAtIndex:v8 - 2];
      }

      --v8;
    }
    while (v8 > 1);
  }
}

- (void)_stopObservingODRProgress:(id)a3
{
  id v4 = a3;
  [v4 removeObserver:self forKeyPath:@"finished" context:0];
  [v4 removeObserver:self forKeyPath:@"fractionCompleted" context:0];
}

- (id)_thumbnailDownloadOperationForDownloadID:(int64_t)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(ISOperationQueue *)self->_placeholderIconOperationQueue operations];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 applicationHandle];
        if ([v10 downloadID] == (id)a3)
        {
          id v11 = v9;

          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (void)_updatePlaceholderWithODRProgressForApplicationHandle:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  id v8 = [(NSMutableDictionary *)self->_appProgress objectForKey:v5];
  [(NSLock *)self->_lock unlock];
  id v6 = [(ApplicationWorkspace *)self _copyCombinedApplicationProgress:v8 forApplicationHandle:v5];

  uint64_t v7 = [[ApplicationWorkspaceProgressOperation alloc] initWithApplicationDownloadProgress:v6];
  [(ApplicationWorkspace *)self _addProgressOperation:v7];
}

- (void)_incrementPendingInstallsForDownloadIdentifier:(int64_t)a3
{
  [(NSLock *)self->_lock lock];
  id v5 = +[NSNumber numberWithLongLong:a3];
  [(NSCountedSet *)self->_pendingInstalls addObject:v5];

  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)_decrementPendingInstallsForDownloadIdentifier:(int64_t)a3
{
  [(NSLock *)self->_lock lock];
  id v5 = +[NSNumber numberWithLongLong:a3];
  if (![(NSCountedSet *)self->_pendingInstalls containsObject:v5])
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    id v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      v8 &= 2u;
    }
    if (v8)
    {
      *(_DWORD *)long long v13 = 138412546;
      *(void *)&v13[4] = objc_opt_class();
      *(_WORD *)&v13[12] = 2048;
      *(void *)&v13[14] = a3;
      id v10 = *(id *)&v13[4];
      LODWORD(v12) = 22;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, v13, v12, *(_OWORD *)v13, *(void *)&v13[16]);
      free(v11);
      SSFileLog();
    }

    goto LABEL_14;
  }
  [(NSCountedSet *)self->_pendingInstalls removeObject:v5];
LABEL_15:

  [(NSLock *)self->_lock unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitBlocks, 0);
  objc_storeStrong((id *)&self->_syncWaitBlocks, 0);
  objc_storeStrong((id *)&self->_placeholderIconOperationQueue, 0);
  objc_storeStrong((id *)&self->_pendingInstalls, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_appProgress, 0);
}

@end