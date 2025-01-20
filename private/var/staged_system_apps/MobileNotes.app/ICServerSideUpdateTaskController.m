@interface ICServerSideUpdateTaskController
- (BOOL)isInternetReachable;
- (BOOL)overrideInternetReachabilityToNotReachable;
- (ICCloudContext)cloudContext;
- (ICNotesInvernessClient)overrideInvernessClient;
- (ICServerSideUpdateTaskController)initWithWorkerContext:(id)a3;
- (NSManagedObjectContext)workerContext;
- (NSString)overrideCurrentBuild;
- (NSString)overrideCurrentVersion;
- (id)accountsNeedingServerUpgrade;
- (id)currentBuild;
- (id)currentVersion;
- (id)invernessClientForAccount:(id)a3;
- (id)platformName;
- (void)resetState;
- (void)runServerSideTaskWithClient:(id)a3 account:(id)a4 completion:(id)a5;
- (void)runServerSideTasksIfNeeded:(id)a3;
- (void)setCloudContext:(id)a3;
- (void)setOverrideCurrentBuild:(id)a3;
- (void)setOverrideCurrentVersion:(id)a3;
- (void)setOverrideInternetReachabilityToNotReachable:(BOOL)a3;
- (void)setOverrideInvernessClient:(id)a3;
- (void)setWorkerContext:(id)a3;
@end

@implementation ICServerSideUpdateTaskController

- (ICServerSideUpdateTaskController)initWithWorkerContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICServerSideUpdateTaskController;
  v6 = [(ICServerSideUpdateTaskController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_workerContext, a3);
  }

  return v7;
}

- (ICCloudContext)cloudContext
{
  cloudContext = self->_cloudContext;
  if (cloudContext)
  {
    v3 = cloudContext;
  }
  else
  {
    v3 = +[ICCloudContext sharedContext];
  }

  return v3;
}

- (void)runServerSideTasksIfNeeded:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  if ([(ICServerSideUpdateTaskController *)self isInternetReachable])
  {
    v6 = [(ICServerSideUpdateTaskController *)self workerContext];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10009C734;
    v19[3] = &unk_100625860;
    v19[4] = self;
    v20 = v5;
    [v6 performBlockAndWait:v19];
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "ServerSideUpdateTask");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1004D88BC(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v15 = dispatch_get_global_queue(-32768, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009CA60;
  block[3] = &unk_100625988;
  id v18 = v4;
  id v16 = v4;
  dispatch_group_notify(v5, v15, block);
}

- (void)runServerSideTaskWithClient:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = os_log_create("com.apple.notes", "ServerSideUpdateTask");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1004D89A4(v9, self, v11);
  }

  v20 = [v9 serverSideUpdateTaskLastCompletedBuild];
  uint64_t v12 = [v9 serverSideUpdateTaskLastCompletedVersion];
  uint64_t v13 = [(ICServerSideUpdateTaskController *)self currentBuild];
  uint64_t v14 = [(ICServerSideUpdateTaskController *)self currentVersion];
  v15 = [(ICServerSideUpdateTaskController *)self platformName];
  id v16 = [v9 serverSideUpdateTaskContinuationToken];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10009CC9C;
  v21[3] = &unk_100627C38;
  v21[4] = self;
  id v22 = v9;
  id v23 = v8;
  id v24 = v10;
  id v17 = v10;
  id v18 = v8;
  id v19 = v9;
  [v18 didCompleteInstallOrUpdateWithPreviousBuildNumber:v20 previousVersion:v12 currentBuildNumber:v13 currentVersion:v14 platformName:v15 continuationToken:v16 callback:v21];
}

- (void)resetState
{
  v3 = [(ICServerSideUpdateTaskController *)self workerContext];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009D234;
  v6[3] = &unk_100625AF0;
  v6[4] = self;
  [v3 performBlockAndWait:v6];

  id v4 = os_log_create("com.apple.notes", "ServerSideUpdateTask");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_group_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Successfully reset state for all accounts", v5, 2u);
  }
}

- (id)accountsNeedingServerUpgrade
{
  v3 = +[ICCloudConfiguration sharedConfiguration];
  unsigned __int16 v4 = (unsigned __int16)[v3 serverSideUpdateTaskMaxFailureCount];

  dispatch_group_t v5 = [(ICServerSideUpdateTaskController *)self workerContext];
  v6 = +[ICAccount allActiveCloudKitAccountsInContext:v5];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009D4B0;
  v9[3] = &unk_100627C60;
  unsigned __int16 v10 = v4;
  v9[4] = self;
  v7 = [v6 ic_objectsPassingTest:v9];

  return v7;
}

- (BOOL)isInternetReachable
{
  if ([(ICServerSideUpdateTaskController *)self overrideInternetReachabilityToNotReachable])
  {
    v2 = os_log_create("com.apple.notes", "ServerSideUpdateTask");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_1004D8E18(v2, v3, v4, v5, v6, v7, v8, v9);
    }

    return 0;
  }
  else
  {
    uint64_t v11 = +[ICReachability sharedReachabilityForInternetConnection];
    BOOL v10 = [v11 currentReachabilityStatus] != 0;
  }
  return v10;
}

- (id)invernessClientForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICServerSideUpdateTaskController *)self overrideInvernessClient];

  if (v5)
  {
    uint64_t v6 = [(ICServerSideUpdateTaskController *)self overrideInvernessClient];
  }
  else
  {
    uint64_t v7 = [(ICServerSideUpdateTaskController *)self cloudContext];
    uint64_t v8 = [v4 identifier];
    uint64_t v6 = [v7 invernessClientForAccountID:v8];
  }

  return v6;
}

- (id)currentVersion
{
  uint64_t v3 = [(ICServerSideUpdateTaskController *)self overrideCurrentVersion];

  if (v3) {
    [(ICServerSideUpdateTaskController *)self overrideCurrentVersion];
  }
  else {
  id v4 = +[ICDeviceSupport productVersion];
  }

  return v4;
}

- (id)currentBuild
{
  uint64_t v3 = [(ICServerSideUpdateTaskController *)self overrideCurrentBuild];

  if (v3) {
    [(ICServerSideUpdateTaskController *)self overrideCurrentBuild];
  }
  else {
  id v4 = +[ICDeviceSupport productBuildVersion];
  }

  return v4;
}

- (id)platformName
{
  return +[ICDeviceSupport productName];
}

- (BOOL)overrideInternetReachabilityToNotReachable
{
  return self->_overrideInternetReachabilityToNotReachable;
}

- (void)setOverrideInternetReachabilityToNotReachable:(BOOL)a3
{
  self->_overrideInternetReachabilityToNotReachable = a3;
}

- (ICNotesInvernessClient)overrideInvernessClient
{
  return self->_overrideInvernessClient;
}

- (void)setOverrideInvernessClient:(id)a3
{
}

- (NSString)overrideCurrentVersion
{
  return self->_overrideCurrentVersion;
}

- (void)setOverrideCurrentVersion:(id)a3
{
}

- (NSString)overrideCurrentBuild
{
  return self->_overrideCurrentBuild;
}

- (void)setOverrideCurrentBuild:(id)a3
{
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (void)setWorkerContext:(id)a3
{
}

- (void)setCloudContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
  objc_storeStrong((id *)&self->_overrideCurrentBuild, 0);
  objc_storeStrong((id *)&self->_overrideCurrentVersion, 0);

  objc_storeStrong((id *)&self->_overrideInvernessClient, 0);
}

@end