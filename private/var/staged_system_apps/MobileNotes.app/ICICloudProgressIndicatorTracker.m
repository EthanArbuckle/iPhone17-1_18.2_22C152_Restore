@interface ICICloudProgressIndicatorTracker
+ (BOOL)isMigratingICloudAccount:(id)a3;
+ (BOOL)isMigratingLocalAccount;
- (BOOL)isPerformingProgressUpdate;
- (BOOL)needsPerformingProgressUpdateAfterCurrentIsComplete;
- (ICICloudProgressIndicatorTracker)initWithDelegate:(id)a3;
- (ICSelectorDelayer)updateMakingProgressDelayer;
- (void)_performProgressUpdate;
- (void)cloudOperationsDidChange:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)migrationStateDidChange:(id)a3;
- (void)setIsPerformingProgressUpdate:(BOOL)a3;
- (void)setNeedsPerformingProgressUpdateAfterCurrentIsComplete:(BOOL)a3;
- (void)setUpdateMakingProgressDelayer:(id)a3;
- (void)updateMakingProgress;
@end

@implementation ICICloudProgressIndicatorTracker

- (ICICloudProgressIndicatorTracker)initWithDelegate:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ICICloudProgressIndicatorTracker;
  v3 = [(ICProgressIndicatorTracker *)&v13 initWithDelegate:a3];
  if (v3)
  {
    id v4 = [objc_alloc((Class)ICSelectorDelayer) initWithTarget:v3 selector:"updateMakingProgress" delay:0 waitToFireUntilRequestsStop:1 callOnMainThread:0.15];
    [(ICICloudProgressIndicatorTracker *)v3 setUpdateMakingProgressDelayer:v4];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v3 selector:"cloudOperationsDidChange:" name:ICCloudContextHasPendingOperationsDidChangeNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v3 selector:"migrationStateDidChange:" name:ICMigrationStateDidChangeNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v3 selector:"migrationStateDidChange:" name:@"ICCurrentDeviceMigrationStateDidChange" object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v3 selector:"legacyImportOperationsDidChange:" name:@"ICLegacyImportManagerOperationsDidChangeNotification" object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    uint64_t v10 = kReachabilityChangedNotification;
    v11 = +[ICReachability sharedReachabilityForInternetConnection];
    [v9 addObserver:v3 selector:"reachabilityChanged:" name:v10 object:v11];

    [(ICICloudProgressIndicatorTracker *)v3 updateMakingProgress];
  }
  return v3;
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)ICICloudProgressIndicatorTracker;
  [(ICProgressIndicatorTracker *)&v4 invalidate];
  v3 = [(ICICloudProgressIndicatorTracker *)self updateMakingProgressDelayer];
  [v3 cancelPreviousFireRequests];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICICloudProgressIndicatorTracker;
  [(ICICloudProgressIndicatorTracker *)&v4 dealloc];
}

+ (BOOL)isMigratingICloudAccount:(id)a3
{
  +[ICAccount allActiveCloudKitAccountsInContext:a3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = +[ICDeviceMigrationState currentDeviceMigrationStateForAccount:createIfNecessary:](ICDeviceMigrationState, "currentDeviceMigrationStateForAccount:createIfNecessary:", *(void *)(*((void *)&v10 + 1) + 8 * i), 0, (void)v10);
        unsigned __int8 v8 = [v7 isMigrating];

        if (v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

+ (BOOL)isMigratingLocalAccount
{
  v2 = +[UMUserManager sharedManager];
  id v3 = [v2 currentUser];

  if ([v3 userType] == (id)1
    || !+[ICMigrationController didChooseToMigrateLocalAccount])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    unsigned int v4 = !+[ICMigrationController didMigrateLocalAccount];
  }

  return v4;
}

- (void)cloudOperationsDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011BCBC;
  block[3] = &unk_100625AF0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)migrationStateDidChange:(id)a3
{
  unsigned int v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1004DC9DC(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  [(ICICloudProgressIndicatorTracker *)self updateMakingProgress];
}

- (void)updateMakingProgress
{
}

- (void)_performProgressUpdate
{
  objc_initWeak(&location, self);
  if (!+[NSThread isMainThread]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICICloudProgressIndicatorTracker _performProgressUpdate]", 1, 0, @"Unexpected call from background thread");
  }
  if ((+[ICDeviceSupport isRunningUnitTests] & 1) == 0)
  {
    if ([(ICICloudProgressIndicatorTracker *)self isPerformingProgressUpdate])
    {
      [(ICICloudProgressIndicatorTracker *)self setNeedsPerformingProgressUpdateAfterCurrentIsComplete:1];
    }
    else
    {
      [(ICICloudProgressIndicatorTracker *)self setIsPerformingProgressUpdate:1];
      id v3 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        sub_1004DC9DC(v3, v4, v5, v6, v7, v8, v9, v10);
      }

      uint64_t v11 = +[ICNoteContext sharedContext];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10011BF98;
      v12[3] = &unk_10062A630;
      objc_copyWeak(&v13, &location);
      v12[4] = self;
      [v11 performBackgroundTask:v12];

      objc_destroyWeak(&v13);
    }
  }
  objc_destroyWeak(&location);
}

- (ICSelectorDelayer)updateMakingProgressDelayer
{
  return self->_updateMakingProgressDelayer;
}

- (void)setUpdateMakingProgressDelayer:(id)a3
{
}

- (BOOL)isPerformingProgressUpdate
{
  return self->_isPerformingProgressUpdate;
}

- (void)setIsPerformingProgressUpdate:(BOOL)a3
{
  self->_isPerformingProgressUpdate = a3;
}

- (BOOL)needsPerformingProgressUpdateAfterCurrentIsComplete
{
  return self->_needsPerformingProgressUpdateAfterCurrentIsComplete;
}

- (void)setNeedsPerformingProgressUpdateAfterCurrentIsComplete:(BOOL)a3
{
  self->_needsPerformingProgressUpdateAfterCurrentIsComplete = a3;
}

- (void).cxx_destruct
{
}

@end