@interface ApplicationWorkspaceFinishOperation
- (ApplicationWorkspaceFinishOperation)initWithApplicationHandle:(id)a3;
- (ApplicationWorkspaceFinishOperation)initWithApplicationHandle:(id)a3 isPlaceholderRestore:(BOOL)a4;
- (void)runWithCompletionBlock:(id)a3;
@end

@implementation ApplicationWorkspaceFinishOperation

- (ApplicationWorkspaceFinishOperation)initWithApplicationHandle:(id)a3
{
  return [(ApplicationWorkspaceFinishOperation *)self initWithApplicationHandle:a3 isPlaceholderRestore:0];
}

- (ApplicationWorkspaceFinishOperation)initWithApplicationHandle:(id)a3 isPlaceholderRestore:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ApplicationWorkspaceFinishOperation;
  result = [(ApplicationWorkspaceOperation *)&v6 initWithApplicationHandle:a3];
  if (result) {
    result->_isPlaceholderRestore = a4;
  }
  return result;
}

- (void)runWithCompletionBlock:(id)a3
{
  v5 = [(ApplicationHandle *)[(ApplicationWorkspaceOperation *)self applicationHandle] bundleID];
  id v6 = +[LSApplicationWorkspace defaultWorkspace];
  BOOL isPlaceholderRestore = self->_isPlaceholderRestore;
  id v8 = +[SSLogConfig sharedDaemonConfig];
  id v9 = v8;
  if (isPlaceholderRestore)
  {
    if (!v8) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
LABEL_19:
      *(_DWORD *)v31 = 138412290;
      *(void *)&v31[4] = [(ApplicationWorkspaceOperation *)self applicationHandle];
      LODWORD(v30) = 12;
      v29 = (NSString *)v31;
      v14 = (void *)_os_log_send_and_compose_impl();
      if (v14)
      {
        v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, v31, v30, *(_OWORD *)v31);
        free(v14);
        v29 = v15;
        SSFileLog();
      }
    }
  }
  else
  {
    if (!v8) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13) {
      goto LABEL_19;
    }
  }
  if (-[ApplicationWorkspaceOperation applicationIsInstalled:](self, "applicationIsInstalled:", v5, v29))
  {
    uint64_t v16 = (uint64_t)+[LSApplicationProxy applicationProxyForIdentifier:v5 placeholder:1];
    if (v16)
    {
      id v17 = [v6 installProgressForApplication:v16 withPhase:0];
      if ([v17 installState] != (id)5)
      {
        [v17 setCompletedUnitCount:1];
        [v17 setInstallState:5];
        [v17 setTotalUnitCount:1];
      }
      if ([v6 installPhaseFinishedForProgress:v17])
      {
        uint64_t v16 = 1;
      }
      else
      {
        id v23 = [v6 installProgressForApplication:v16 withPhase:0];
        if ([v23 installState] != (id)5)
        {
          [v23 setCompletedUnitCount:1];
          [v23 setInstallState:5];
          [v23 setTotalUnitCount:1];
        }
        uint64_t v16 = (uint64_t)[v6 installPhaseFinishedForProgress:v23];
      }
      id v24 = +[SSLogConfig sharedDaemonConfig];
      if (!v24) {
        id v24 = +[SSLogConfig sharedConfig];
      }
      unsigned int v25 = [v24 shouldLog];
      if ([v24 shouldLogToDisk]) {
        int v26 = v25 | 2;
      }
      else {
        int v26 = v25;
      }
      if (!os_log_type_enabled((os_log_t)[v24 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v26 &= 2u;
      }
      if (v26)
      {
        v27 = self->_isPlaceholderRestore ? @"restored" : @"updated";
        v28 = [(ApplicationWorkspaceOperation *)self applicationHandle];
        *(_DWORD *)v31 = 138412802;
        *(void *)&v31[4] = v27;
        *(_WORD *)&v31[12] = 2112;
        *(void *)&v31[14] = v28;
        __int16 v32 = 1024;
        int v33 = v16;
        LODWORD(v30) = 28;
        v22 = (void *)_os_log_send_and_compose_impl();
        if (v22)
        {
LABEL_53:
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, v31, v30);
          free(v22);
          SSFileLog();
        }
      }
    }
  }
  else
  {
    id v18 = +[SSLogConfig sharedDaemonConfig];
    if (!v18) {
      id v18 = +[SSLogConfig sharedConfig];
    }
    unsigned int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v20 &= 2u;
    }
    if (!v20)
    {
      uint64_t v16 = 0;
      goto LABEL_54;
    }
    v21 = [(ApplicationWorkspaceOperation *)self applicationHandle];
    *(_DWORD *)v31 = 138412290;
    *(void *)&v31[4] = v21;
    LODWORD(v30) = 12;
    v22 = (void *)_os_log_send_and_compose_impl();
    uint64_t v16 = 0;
    if (v22) {
      goto LABEL_53;
    }
  }
LABEL_54:
  if (a3) {
    (*((void (**)(id, uint64_t, void, void))a3 + 2))(a3, v16, 0, 0);
  }
}

@end