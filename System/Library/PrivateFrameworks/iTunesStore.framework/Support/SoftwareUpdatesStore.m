@interface SoftwareUpdatesStore
+ (id)defaultStore;
+ (void)hideAppstoredPendingUpdatesBadgeWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)reloadAppstoredUpdatesWithMessage:(id)a3 connection:(id)a4;
- (SoftwareUpdatesStore)init;
@end

@implementation SoftwareUpdatesStore

- (SoftwareUpdatesStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)SoftwareUpdatesStore;
  return [(SoftwareUpdatesStore *)&v3 init];
}

+ (id)defaultStore
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B1300;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100402010 != -1) {
    dispatch_once(&qword_100402010, block);
  }
  v2 = (void *)qword_100402008;

  return v2;
}

+ (void)hideAppstoredPendingUpdatesBadgeWithMessage:(id)a3 connection:(id)a4
{
  if (SSXPCConnectionHasEntitlement())
  {
    +[AppStoreUtility hidePendingUpdatesBadge];
  }
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
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
  *(_DWORD *)v12 = 138412546;
  *(void *)&v12[4] = objc_opt_class();
  *(_WORD *)&v12[12] = 2112;
  *(void *)&v12[14] = v4;
  id v9 = *(id *)&v12[4];
  LODWORD(v11) = 22;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, v12, v11, *(_OWORD *)v12, *(void *)&v12[16]);
    free(v10);
    SSFileLog();
LABEL_11:
  }
  [v4 addObserver:a1 selector:"hideAppstoredPendingUpdatesBadgeWithMessage:connection:" forMessage:118];
  [v4 addObserver:a1 selector:"reloadAppstoredUpdatesWithMessage:connection:" forMessage:106];
}

+ (void)reloadAppstoredUpdatesWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001B1614;
  v9[3] = &unk_1003A91D8;
  id v11 = a4;
  id v12 = a1;
  id v10 = v6;
  id v7 = v11;
  id v8 = v6;
  +[AppStoreUtility reloadUpdatesWithCompletionBlock:v9];
}

@end