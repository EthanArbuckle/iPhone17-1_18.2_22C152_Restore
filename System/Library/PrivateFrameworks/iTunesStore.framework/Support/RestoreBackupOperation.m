@interface RestoreBackupOperation
+ (BOOL)cancelApplicationRestoreWithBundleID:(id)a3 error:(id *)a4;
+ (BOOL)cancelApplicationRestoresWithBundleIDs:(id)a3;
+ (BOOL)restoreDataExistsForApplicationWithBundleID:(id)a3 size:(unint64_t *)a4;
- (BOOL)isFailed;
- (NSString)bundleIdentifier;
- (RestoreBackupOperation)initWithBundleIdentifier:(id)a3 withPriority:(int64_t)a4 isFailed:(BOOL)a5;
- (int64_t)priority;
- (void)cancel;
- (void)dealloc;
- (void)manager:(id)a3 didFailBackupWithError:(id)a4;
- (void)manager:(id)a3 didFailRestoreWithError:(id)a4;
- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5;
- (void)managerDidFinishBackup:(id)a3;
- (void)managerDidFinishRestore:(id)a3;
- (void)managerDidLoseConnectionToService:(id)a3;
- (void)run;
@end

@implementation RestoreBackupOperation

- (RestoreBackupOperation)initWithBundleIdentifier:(id)a3 withPriority:(int64_t)a4 isFailed:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)RestoreBackupOperation;
  v8 = [(RestoreBackupOperation *)&v10 init];
  if (v8)
  {
    v8->_bundleID = (NSString *)[a3 copy];
    v8->_priority = a4;
    v8->_isFailed = a5;
    v8->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  }
  return v8;
}

- (void)dealloc
{
  semaphore = self->_semaphore;
  if (semaphore) {
    dispatch_release(semaphore);
  }
  v4.receiver = self;
  v4.super_class = (Class)RestoreBackupOperation;
  [(RestoreBackupOperation *)&v4 dealloc];
}

+ (BOOL)cancelApplicationRestoreWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  unsigned __int8 v7 = [v6 cancelApplicationRestoreWithBundleID:a3 error:a4];

  return v7;
}

+ (BOOL)cancelApplicationRestoresWithBundleIDs:(id)a3
{
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v3 = [a3 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (!v3) {
    return 1;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v37;
  BOOL v6 = 1;
  while (2)
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v37 != v5) {
        objc_enumerationMutation(a3);
      }
      uint64_t v8 = *(void *)(*((void *)&v36 + 1) + 8 * i);
      unsigned __int8 v9 = +[ApplicationWorkspace keepSafeHarborDataForBundleID:](ApplicationWorkspace, "keepSafeHarborDataForBundleID:", v8, v31);
      id v10 = +[SSLogConfig sharedDaemonConfig];
      id v11 = v10;
      if (v9)
      {
        if (!v10) {
          id v11 = +[SSLogConfig sharedConfig];
        }
        unsigned int v25 = [v11 shouldLog];
        if ([v11 shouldLogToDisk]) {
          int v26 = v25 | 2;
        }
        else {
          int v26 = v25;
        }
        if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          v26 &= 2u;
        }
        if (v26)
        {
          uint64_t v27 = objc_opt_class();
          int v40 = 138412546;
          uint64_t v41 = v27;
          __int16 v42 = 2112;
          uint64_t v43 = v8;
          LODWORD(v33) = 22;
          uint64_t v28 = _os_log_send_and_compose_impl();
          if (v28)
          {
            v29 = (void *)v28;
            +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v40, v33);
            free(v29);
            SSFileLog();
          }
        }
        return 0;
      }
      if (!v10) {
        id v11 = +[SSLogConfig sharedConfig];
      }
      unsigned int v12 = [v11 shouldLog];
      if ([v11 shouldLogToDisk]) {
        v12 |= 2u;
      }
      if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_INFO)) {
        v12 &= 2u;
      }
      if (v12)
      {
        uint64_t v13 = objc_opt_class();
        int v40 = 138412546;
        uint64_t v41 = v13;
        __int16 v42 = 2112;
        uint64_t v43 = v8;
        LODWORD(v33) = 22;
        v32 = &v40;
        uint64_t v14 = _os_log_send_and_compose_impl();
        if (v14)
        {
          v15 = (void *)v14;
          v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v40, v33);
          free(v15);
          v32 = (int *)v16;
          SSFileLog();
        }
      }
      uint64_t v35 = 0;
      if (!+[RestoreBackupOperation cancelApplicationRestoreWithBundleID:error:](RestoreBackupOperation, "cancelApplicationRestoreWithBundleID:error:", v8, &v35, v32))
      {
        id v17 = +[SSLogConfig sharedDaemonConfig];
        if (!v17) {
          id v17 = +[SSLogConfig sharedConfig];
        }
        unsigned int v18 = [v17 shouldLog];
        if ([v17 shouldLogToDisk]) {
          int v19 = v18 | 2;
        }
        else {
          int v19 = v18;
        }
        if (os_log_type_enabled((os_log_t)[v17 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          int v20 = v19;
        }
        else {
          int v20 = v19 & 2;
        }
        if (v20)
        {
          uint64_t v21 = objc_opt_class();
          int v40 = 138412802;
          uint64_t v41 = v21;
          __int16 v42 = 2112;
          uint64_t v43 = v8;
          __int16 v44 = 2112;
          uint64_t v45 = v35;
          LODWORD(v33) = 32;
          v31 = &v40;
          uint64_t v22 = _os_log_send_and_compose_impl();
          if (v22)
          {
            v23 = (void *)v22;
            v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v40, v33);
            free(v23);
            v31 = (int *)v24;
            SSFileLog();
          }
        }
        BOOL v6 = 0;
      }
    }
    id v4 = [a3 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v4) {
      continue;
    }
    break;
  }
  return v6;
}

+ (BOOL)restoreDataExistsForApplicationWithBundleID:(id)a3 size:(unint64_t *)a4
{
  id v6 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  unsigned __int8 v7 = [v6 restoreDataExistsForApplicationWithBundleID:a3 size:a4];

  return v7;
}

- (NSString)bundleIdentifier
{
  v2 = self->_bundleID;

  return v2;
}

- (BOOL)isFailed
{
  return self->_isFailed;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)RestoreBackupOperation;
  [(RestoreBackupOperation *)&v3 cancel];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (void)run
{
  [(RestoreBackupOperation *)self lock];
  [*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] setMaxValue:10000];
  [(RestoreBackupOperation *)self unlock];
  [(RestoreBackupOperation *)self sendProgressToDelegate];
  if ([(id)objc_opt_class() restoreDataExistsForApplicationWithBundleID:self->_bundleID size:0])
  {
    id v3 = +[SSLogConfig sharedDaemonConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    unsigned int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_INFO)) {
      v5 &= 2u;
    }
    if (v5)
    {
      uint64_t v6 = objc_opt_class();
      bundleID = self->_bundleID;
      BOOL isFailed = self->_isFailed;
      int v76 = 138412802;
      uint64_t v77 = v6;
      __int16 v78 = 2112;
      unint64_t v79 = (unint64_t)bundleID;
      __int16 v80 = 1024;
      LODWORD(v81) = isFailed;
      LODWORD(v74) = 28;
      v69 = &v76;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        id v10 = (void *)v9;
        id v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v76, v74);
        free(v10);
        v69 = (int *)v11;
        SSFileLog();
      }
    }
    unint64_t v12 = 0;
    do
    {
      id v13 = +[SSLogConfig sharedDaemonConfig];
      if (!v13) {
        id v13 = +[SSLogConfig sharedConfig];
      }
      unsigned int v14 = [v13 shouldLog];
      if ([v13 shouldLogToDisk]) {
        v14 |= 2u;
      }
      if (os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_INFO)) {
        int v15 = v14;
      }
      else {
        int v15 = v14 & 2;
      }
      if (v15)
      {
        uint64_t v16 = objc_opt_class();
        id v17 = self->_bundleID;
        BOOL v18 = self->_isFailed;
        int v76 = 138413058;
        uint64_t v77 = v16;
        __int16 v78 = 2048;
        unint64_t v79 = v12;
        __int16 v80 = 2112;
        v81 = v17;
        __int16 v82 = 1024;
        BOOL v83 = v18;
        LODWORD(v74) = 38;
        v70 = &v76;
        uint64_t v19 = _os_log_send_and_compose_impl();
        if (v19)
        {
          int v20 = (void *)v19;
          uint64_t v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v76, v74);
          free(v20);
          v70 = (int *)v21;
          SSFileLog();
        }
      }
      id v22 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithDelegate:self];
      unint64_t v75 = 0;
      id v23 = +[SSLogConfig sharedDaemonConfig];
      if (!v23) {
        id v23 = +[SSLogConfig sharedConfig];
      }
      unsigned int v24 = objc_msgSend(v23, "shouldLog", v70);
      unsigned int v25 = [v23 shouldLogToDisk];
      int v26 = [v23 OSLogObject];
      if (v25) {
        v24 |= 2u;
      }
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
        v24 &= 2u;
      }
      if (v24)
      {
        uint64_t v27 = objc_opt_class();
        int64_t priority = self->_priority;
        int v76 = 138412546;
        uint64_t v77 = v27;
        __int16 v78 = 2048;
        unint64_t v79 = priority;
        LODWORD(v74) = 22;
        v71 = &v76;
        uint64_t v29 = _os_log_send_and_compose_impl();
        if (v29)
        {
          v30 = (void *)v29;
          v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v76, v74);
          free(v30);
          v71 = (int *)v31;
          SSFileLog();
        }
      }
      if (self->_priority == 1)
      {
        id v32 = +[SSLogConfig sharedDaemonConfig];
        if (!v32) {
          id v32 = +[SSLogConfig sharedConfig];
        }
        unsigned int v33 = objc_msgSend(v32, "shouldLog", v71);
        unsigned int v34 = [v32 shouldLogToDisk];
        uint64_t v35 = [v32 OSLogObject];
        if (v34) {
          v33 |= 2u;
        }
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
          v33 &= 2u;
        }
        if (v33)
        {
          uint64_t v36 = objc_opt_class();
          int64_t v37 = self->_priority;
          int v76 = 138412546;
          uint64_t v77 = v36;
          __int16 v78 = 2048;
          unint64_t v79 = v37;
          LODWORD(v74) = 22;
          v72 = &v76;
          uint64_t v38 = _os_log_send_and_compose_impl();
          if (v38)
          {
            long long v39 = (void *)v38;
            int v40 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v76, v74);
            free(v39);
            v72 = (int *)v40;
            SSFileLog();
          }
        }
        unsigned __int8 v41 = objc_msgSend(v22, "restoreApplicationWithBundleID:failed:withQOS:context:error:", self->_bundleID, self->_isFailed, 25, 0, &v75, v72);
      }
      else
      {
        id v42 = +[SSLogConfig sharedDaemonConfig];
        if (!v42) {
          id v42 = +[SSLogConfig sharedConfig];
        }
        unsigned int v43 = objc_msgSend(v42, "shouldLog", v71);
        unsigned int v44 = [v42 shouldLogToDisk];
        uint64_t v45 = [v42 OSLogObject];
        if (v44) {
          v43 |= 2u;
        }
        if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO)) {
          v43 &= 2u;
        }
        if (v43)
        {
          uint64_t v46 = objc_opt_class();
          int64_t v47 = self->_priority;
          int v76 = 138412546;
          uint64_t v77 = v46;
          __int16 v78 = 2048;
          unint64_t v79 = v47;
          LODWORD(v74) = 22;
          v73 = &v76;
          uint64_t v48 = _os_log_send_and_compose_impl();
          if (v48)
          {
            v49 = (void *)v48;
            v50 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v48, 4, &v76, v74);
            free(v49);
            v73 = (int *)v50;
            SSFileLog();
          }
        }
        unsigned __int8 v41 = objc_msgSend(v22, "restoreApplicationWithBundleID:failed:error:", self->_bundleID, self->_isFailed, &v75, v73);
      }
      if (v41)
      {
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
        if ([(RestoreBackupOperation *)self isCancelled]) {
          [v22 cancel];
        }
      }
      else
      {
        id v51 = +[SSLogConfig sharedDaemonConfig];
        if (!v51) {
          id v51 = +[SSLogConfig sharedConfig];
        }
        unsigned int v52 = [v51 shouldLog];
        unsigned int v53 = [v51 shouldLogToDisk];
        v54 = [v51 OSLogObject];
        if (v53) {
          v52 |= 2u;
        }
        if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
          v52 &= 2u;
        }
        if (v52)
        {
          uint64_t v55 = objc_opt_class();
          int v76 = 138412546;
          uint64_t v77 = v55;
          __int16 v78 = 2112;
          unint64_t v79 = v75;
          LODWORD(v74) = 22;
          v69 = &v76;
          uint64_t v56 = _os_log_send_and_compose_impl();
          if (v56)
          {
            v57 = (void *)v56;
            v58 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v56, 4, &v76, v74);
            free(v57);
            v69 = (int *)v58;
            SSFileLog();
          }
        }
        -[RestoreBackupOperation setSuccess:](self, "setSuccess:", 0, v69);
        if (!v75) {
          SSError();
        }
        -[RestoreBackupOperation setError:](self, "setError:");
      }
      [v22 setDelegate:0];

      if (([(RestoreBackupOperation *)self success] & 1) != 0
        || [(RestoreBackupOperation *)self error])
      {
        break;
      }
      unsigned __int8 v59 = [(RestoreBackupOperation *)self isCancelled];
      char v60 = v12++ > 3 ? 1 : v59;
    }
    while ((v60 & 1) == 0);
  }
  else
  {
    [(RestoreBackupOperation *)self setSuccess:1];
    id v61 = +[SSLogConfig sharedDaemonConfig];
    if (!v61) {
      id v61 = +[SSLogConfig sharedConfig];
    }
    unsigned int v62 = [v61 shouldLog];
    if ([v61 shouldLogToDisk]) {
      int v63 = v62 | 2;
    }
    else {
      int v63 = v62;
    }
    if (!os_log_type_enabled((os_log_t)[v61 OSLogObject], OS_LOG_TYPE_INFO)) {
      v63 &= 2u;
    }
    if (v63)
    {
      uint64_t v64 = objc_opt_class();
      v65 = self->_bundleID;
      BOOL v66 = self->_isFailed;
      int v76 = 138412802;
      uint64_t v77 = v64;
      __int16 v78 = 2112;
      unint64_t v79 = (unint64_t)v65;
      __int16 v80 = 1024;
      LODWORD(v81) = v66;
      LODWORD(v74) = 28;
      uint64_t v67 = _os_log_send_and_compose_impl();
      if (v67)
      {
        v68 = (void *)v67;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v67, 4, &v76, v74);
        free(v68);
        SSFileLog();
      }
    }
  }
}

- (void)manager:(id)a3 didFailBackupWithError:(id)a4
{
  id v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    bundleID = self->_bundleID;
    int v16 = 138412802;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = bundleID;
    __int16 v20 = 2112;
    id v21 = a4;
    LODWORD(v15) = 32;
    unsigned int v14 = &v16;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      unint64_t v12 = (void *)v11;
      id v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v16, v15);
      free(v12);
      unsigned int v14 = (int *)v13;
      SSFileLog();
    }
  }
  if (!a4) {
    a4 = (id)SSError();
  }
  -[RestoreBackupOperation setError:](self, "setError:", a4, v14);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (void)manager:(id)a3 didFailRestoreWithError:(id)a4
{
  id v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    bundleID = self->_bundleID;
    int v16 = 138412802;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = bundleID;
    __int16 v20 = 2112;
    id v21 = a4;
    LODWORD(v15) = 32;
    unsigned int v14 = &v16;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      unint64_t v12 = (void *)v11;
      id v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v16, v15);
      free(v12);
      unsigned int v14 = (int *)v13;
      SSFileLog();
    }
  }
  if (!a4) {
    a4 = (id)SSError();
  }
  -[RestoreBackupOperation setError:](self, "setError:", a4, v14);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5
{
  id v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v16 = 138412546;
    uint64_t v17 = objc_opt_class();
    __int16 v18 = 2048;
    double v19 = a4;
    LODWORD(v15) = 22;
    unsigned int v14 = &v16;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      unint64_t v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v16, v15);
      free(v11);
      unsigned int v14 = (int *)v12;
      SSFileLog();
    }
  }
  [(RestoreBackupOperation *)self lock];
  uint64_t v13 = OBJC_IVAR___ISOperation__progress;
  objc_msgSend(*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress], "setCurrentValue:", (uint64_t)(float)((float)(uint64_t)objc_msgSend(*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress], "maxValue")* a4));
  [*(id *)&self->ISOperation_opaque[v13] snapshot];
  [(RestoreBackupOperation *)self unlock];
  [(RestoreBackupOperation *)self sendProgressToDelegate];
}

- (void)managerDidFinishBackup:(id)a3
{
  id v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_INFO)) {
    v6 &= 2u;
  }
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    bundleID = self->_bundleID;
    int v14 = 138412546;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = bundleID;
    LODWORD(v13) = 22;
    unint64_t v12 = &v14;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v14, v13);
      free(v10);
      unint64_t v12 = (int *)v11;
      SSFileLog();
    }
  }
  -[RestoreBackupOperation setSuccess:](self, "setSuccess:", 1, v12);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (void)managerDidFinishRestore:(id)a3
{
  id v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_INFO)) {
    v6 &= 2u;
  }
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    bundleID = self->_bundleID;
    int v14 = 138412546;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = bundleID;
    LODWORD(v13) = 22;
    unint64_t v12 = &v14;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v14, v13);
      free(v10);
      unint64_t v12 = (int *)v11;
      SSFileLog();
    }
  }
  -[RestoreBackupOperation setSuccess:](self, "setSuccess:", 1, v12);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (void)managerDidLoseConnectionToService:(id)a3
{
  id v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v6 &= 2u;
  }
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    bundleID = self->_bundleID;
    int v12 = 138412546;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = bundleID;
    LODWORD(v11) = 22;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v12, v11);
      free(v10);
      SSFileLog();
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (int64_t)priority
{
  return self->_priority;
}

@end