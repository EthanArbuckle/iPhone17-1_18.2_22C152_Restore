@interface ApplicationWorkspaceFailedPlaceholderOperation
- (void)runWithCompletionBlock:(id)a3;
@end

@implementation ApplicationWorkspaceFailedPlaceholderOperation

- (void)runWithCompletionBlock:(id)a3
{
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5) {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_INFO)) {
    v7 &= 2u;
  }
  if (v7)
  {
    int v20 = 138412546;
    uint64_t v21 = objc_opt_class();
    __int16 v22 = 2112;
    v23 = [(ApplicationWorkspaceOperation *)self applicationHandle];
    LODWORD(v19) = 22;
    v18 = &v20;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v20, v19);
      free(v9);
      v18 = (int *)v10;
      SSFileLog();
    }
  }
  v11 = [(ApplicationHandle *)[(ApplicationWorkspaceOperation *)self applicationHandle] bundleID];
  id v12 = +[LSApplicationWorkspace defaultWorkspace];
  if (![(ApplicationWorkspaceOperation *)self applicationIsInstalled:v11]) {
    goto LABEL_19;
  }
  id v13 = +[LSApplicationProxy applicationProxyForIdentifier:v11 placeholder:1];
  if (!v13) {
    goto LABEL_22;
  }
  id v14 = v13;
  id v15 = [v12 installProgressForApplication:v13 withPhase:0];
  if ([v15 installState] != (id)4) {
    [v15 setInstallState:4];
  }
  if ([v12 installPhaseFinishedForProgress:v15]) {
    goto LABEL_19;
  }
  id v16 = [v12 installProgressForApplication:v14 withPhase:0];
  if ([v16 installState] != (id)4) {
    [v16 setInstallState:4];
  }
  if ([v12 installPhaseFinishedForProgress:v16])
  {
LABEL_19:
    +[ApplicationWorkspaceState completeNotificationForFailedBundleIdentifier:v11];
    uint64_t v17 = 1;
    if (!a3) {
      return;
    }
  }
  else
  {
LABEL_22:
    uint64_t v17 = 0;
    if (!a3) {
      return;
    }
  }
  (*((void (**)(id, uint64_t, void, void))a3 + 2))(a3, v17, 0, 0);
}

@end