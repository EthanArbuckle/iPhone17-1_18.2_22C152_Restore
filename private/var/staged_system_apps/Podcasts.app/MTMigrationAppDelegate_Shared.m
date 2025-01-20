@interface MTMigrationAppDelegate_Shared
+ (Class)appDelegateClass;
+ (void)destroyAndRebuildDatabase;
+ (void)moveSourceFile:(id)a3 toPath:(id)a4;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)didBecomeActiveWhileMigrating;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMigrating;
- (BOOL)respondsToSelector:(SEL)a3;
- (MTAppDelegateProtocol)appDelegate;
- (MTMigrationAppDelegate_Shared)init;
- (NSMutableArray)queuedInvocations;
- (UIWindow)window;
- (id)createWindowWithScene:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (int64_t)alertControllerStyleForInterfaceIdiom;
- (unint64_t)processAssertion;
- (void)applicationDidBecomeActive:(id)a3;
- (void)finishMigration;
- (void)flushInvocations;
- (void)forwardInvocation:(id)a3;
- (void)performIncompatibleDBDialogAction;
- (void)setAppDelegate:(id)a3;
- (void)setDidBecomeActiveWhileMigrating:(BOOL)a3;
- (void)setIsMigrating:(BOOL)a3;
- (void)setProcessAssertion:(unint64_t)a3;
- (void)setQueuedInvocations:(id)a3;
- (void)setWindow:(id)a3;
- (void)showIncompatibleDBDialog;
- (void)willConnectScene;
@end

@implementation MTMigrationAppDelegate_Shared

- (MTMigrationAppDelegate_Shared)init
{
  if (self)
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    [(MTMigrationAppDelegate_Shared *)self setQueuedInvocations:v3];
  }
  return self;
}

+ (Class)appDelegateClass
{
  return 0;
}

- (MTAppDelegateProtocol)appDelegate
{
  appDelegate = self->_appDelegate;
  if (!appDelegate)
  {
    v4 = (MTAppDelegateProtocol *)objc_alloc_init((Class)[(id)objc_opt_class() appDelegateClass]);
    v5 = self->_appDelegate;
    self->_appDelegate = v4;

    appDelegate = self->_appDelegate;
  }

  return appDelegate;
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v6 = a3;
  [(MTMigrationAppDelegate_Shared *)self setDidBecomeActiveWhileMigrating:1];
  v4 = [(MTMigrationAppDelegate_Shared *)self methodSignatureForSelector:"applicationDidBecomeActive:"];
  v5 = +[NSInvocation invocationWithMethodSignature:v4];
  [v5 setSelector:"applicationDidBecomeActive:"];
  [v5 setArgument:&v6 atIndex:2];
  [(MTMigrationAppDelegate_Shared *)self forwardInvocation:v5];
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v35 = a3;
  id v34 = a4;
  v36[0] = @"current_data_version";
  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[MTDB libraryDataVersion]);
  v37[0] = v6;
  v36[1] = @"current_core_data_version";
  v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[MTDB coreDataVersion]);
  v37[1] = v7;
  v37[2] = &off_100579668;
  v36[2] = @"new_data_version";
  v36[3] = @"new_core_data_version";
  v37[3] = &off_100579680;
  v36[4] = @"has_corrupt_db";
  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[MTDB isCorrupt]);
  v37[4] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:5];
  +[IMMetrics recordUserAction:@"migration" dataSource:0 withData:v9];

  +[IMMetrics startTimer:@"migration"];
  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  id v11 = +[MTDB libraryDataVersion];
  id v12 = +[MTDB coreDataVersion];
  LOBYTE(v8) = +[MTDB isCorrupt];
  v13 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  v14 = (char *)[v13 integerForKey:@"migrationAttemptCount"];

  v15 = +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults];
  [v15 setInteger:v14 + 1 forKey:@"migrationAttemptCount"];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000C99FC;
  v31[3] = &unk_10054D9B0;
  id v32 = v35;
  v33 = self;
  -[MTMigrationAppDelegate_Shared setProcessAssertion:](self, "setProcessAssertion:", [v32 beginBackgroundTaskWithName:@"Database migration" expirationHandler:v31]);
  [(MTMigrationAppDelegate_Shared *)self setIsMigrating:1];
  v16 = +[MTCarPlayMigrationBridge sharedInstance];
  [v16 setIsMigrating:1];

  +[MTBackgroundTaskScheduler registerBackgroundTaskClass:objc_opt_class()];
  v17 = objc_alloc_init(MTBackgroundTaskScheduler);
  v18 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
  [v18 setBackgroundTaskScheduler:v17];

  v19 = [(MTMigrationAppDelegate_Shared *)self methodSignatureForSelector:"application:willFinishLaunchingWithOptions:"];
  v20 = +[NSInvocation invocationWithMethodSignature:v19];
  [v20 setSelector:"application:willFinishLaunchingWithOptions:"];
  [v20 setArgument:&v35 atIndex:2];
  [v20 setArgument:&v34 atIndex:3];
  [(MTMigrationAppDelegate_Shared *)self forwardInvocation:v20];
  v21 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C9A7C;
  block[3] = &unk_100550768;
  block[4] = self;
  block[5] = v10;
  block[6] = v11;
  block[7] = 70;
  block[8] = v12;
  block[9] = 142;
  char v30 = (char)v8;
  dispatch_async(v21, block);

  v22 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
  char v23 = objc_opt_respondsToSelector();
  if (v23)
  {
    id v11 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
    if (objc_opt_respondsToSelector())
    {

LABEL_8:
      goto LABEL_9;
    }
  }
  v24 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
  char v25 = objc_opt_respondsToSelector();

  if (v23) {
  if (v25)
  }
  {
    v26 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
    v27 = [v26 createWindowForApplication:v35];
    [(MTMigrationAppDelegate_Shared *)self setWindow:v27];

    [(MTMigrationAppDelegate_Shared *)self willConnectScene];
    v22 = [(MTMigrationAppDelegate_Shared *)self window];
    [v22 makeKeyAndVisible];
    goto LABEL_8;
  }
LABEL_9:

  return 1;
}

- (void)willConnectScene
{
  id v3 = [(MTMigrationAppDelegate_Shared *)self window];
  v2 = objc_opt_new();
  [v3 setRootViewController:v2];
}

- (id)createWindowWithScene:(id)a3
{
  id v4 = a3;
  v5 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
  id v6 = [v5 createWindowWithScene:v4];

  return v6;
}

- (void)showIncompatibleDBDialog
{
  id v3 = +[SyncKeysRepository shared];
  unsigned int v4 = [v3 isLibrarySyncEnabled];

  CFStringRef v5 = @"INCOMPATIBLE_DB_BUTTON_WITHOUT_SYNC";
  if (v4)
  {
    CFStringRef v5 = @"INCOMPATIBLE_DB_BUTTON_WITH_SYNC";
    CFStringRef v6 = @"INCOMPATIBLE_DB_MESSAGE_WITH_SYNC";
  }
  else
  {
    CFStringRef v6 = @"INCOMPATIBLE_DB_MESSAGE_WITHOUT_SYNC";
  }
  int64_t v7 = [(MTMigrationAppDelegate_Shared *)self alertControllerStyleForInterfaceIdiom];
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"INCOMPATIBLE_DB_TITLE" value:&stru_10056A8A0 table:0];
  __uint64_t v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:v6 value:&stru_10056A8A0 table:0];
  id v12 = +[UIAlertController alertControllerWithTitle:v9 message:v11 preferredStyle:v7];

  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:v17 value:&stru_10056A8A0 table:0];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000CA27C;
  v18[3] = &unk_100550790;
  v18[4] = self;
  v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v18];
  [v12 addAction:v15];

  v16 = +[UIViewController mt_rootViewController];
  [v16 presentViewController:v12 animated:1 completion:0];
}

- (int64_t)alertControllerStyleForInterfaceIdiom
{
  return 0;
}

- (void)performIncompatibleDBDialogAction
{
  [(id)objc_opt_class() destroyAndRebuildDatabase];

  [(MTMigrationAppDelegate_Shared *)self finishMigration];
}

- (void)finishMigration
{
  [(MTMigrationAppDelegate_Shared *)self setIsMigrating:0];
  id v3 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
  unsigned int v4 = +[UIApplication sharedApplication];
  [v4 setDelegate:v3];

  [(MTMigrationAppDelegate_Shared *)self flushInvocations];
  CFStringRef v5 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
  if (objc_opt_respondsToSelector())
  {
    CFStringRef v6 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      goto LABEL_5;
    }
    v8 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
    v9 = [(MTMigrationAppDelegate_Shared *)self window];
    __uint64_t v10 = [v9 windowScene];
    id v11 = [v8 createWindowWithScene:v10];
    id v12 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
    [v12 setWindow:v11];

    v13 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
    [v13 willConnectScene];

    CFStringRef v5 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
    v14 = [v5 window];
    [v14 makeKeyAndVisible];
  }
LABEL_5:
  v15 = +[MTCarPlayMigrationBridge sharedInstance];
  [v15 setIsMigrating:0];

  v16 = [(MTMigrationAppDelegate_Shared *)self window];
  [v16 setHidden:1];

  [(MTMigrationAppDelegate_Shared *)self setWindow:0];
  if ([(MTMigrationAppDelegate_Shared *)self processAssertion])
  {
    id v17 = +[UIApplication sharedApplication];
    [v17 endBackgroundTask:[self processAssertion]];
  }
}

- (void)forwardInvocation:(id)a3
{
  id v6 = a3;
  if ([(MTMigrationAppDelegate_Shared *)self isMigrating])
  {
    unsigned int v4 = [(MTMigrationAppDelegate_Shared *)self queuedInvocations];
    objc_sync_enter(v4);
    [v6 retainArguments];
    CFStringRef v5 = [(MTMigrationAppDelegate_Shared *)self queuedInvocations];
    [v5 addObject:v6];

    objc_sync_exit(v4);
  }
  else
  {
    unsigned int v4 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
    [v6 invokeWithTarget:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  unsigned int v4 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
  CFStringRef v5 = [v4 methodSignatureForSelector:a3];

  return v5;
}

- (void)flushInvocations
{
  id v3 = [(MTMigrationAppDelegate_Shared *)self queuedInvocations];
  objc_sync_enter(v3);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v4 = [(MTMigrationAppDelegate_Shared *)self queuedInvocations];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      char v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        v9 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
        [v8 invokeWithTarget:v9];

        char v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (BOOL)isKindOfClass:(Class)a3
{
  id v3 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id v3 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  id v5 = [(MTMigrationAppDelegate_Shared *)self appDelegate];
  unsigned __int8 v6 = [v5 conformsToProtocol:v4];

  return v6;
}

+ (void)destroyAndRebuildDatabase
{
  id v3 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Rebuilding library database", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSDateFormatter);
  [v4 setDateFormat:@"yyyy-MM-dd-hh:mm:ss"];
  id v5 = +[NSDate date];
  unsigned __int8 v6 = [v4 stringFromDate:v5];
  char v7 = +[NSString stringWithFormat:@"backup_%@", v6];

  v8 = +[MTConstants sharedDocumentsDirectory];
  v9 = [v8 URLByAppendingPathComponent:v7];

  long long v10 = +[NSFileManager defaultManager];
  [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:0];

  long long v11 = +[MTDB libraryPath];
  [a1 moveSourceFile:v11 toPath:v9];

  long long v12 = +[MTDB libraryShmPath];
  [a1 moveSourceFile:v12 toPath:v9];

  long long v13 = +[MTDB libraryWalPath];
  [a1 moveSourceFile:v13 toPath:v9];

  v14 = +[SyncControllerFactory resolvedSyncController];
  [v14 resetMetadataToInitialState];

  +[MTDB setCorrupt:0];
  +[MTLibraryMigrator needsMigration];
}

+ (void)moveSourceFile:(id)a3 toPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = [v6 lastPathComponent];
  char v7 = [v5 URLByAppendingPathComponent:v9];

  v8 = +[NSFileManager defaultManager];
  [v8 moveItemAtURL:v6 toURL:v7 error:0];
}

- (UIWindow)window
{
  return self->window;
}

- (void)setWindow:(id)a3
{
}

- (BOOL)isMigrating
{
  return self->_isMigrating;
}

- (void)setIsMigrating:(BOOL)a3
{
  self->_isMigrating = a3;
}

- (void)setAppDelegate:(id)a3
{
}

- (NSMutableArray)queuedInvocations
{
  return self->_queuedInvocations;
}

- (void)setQueuedInvocations:(id)a3
{
}

- (unint64_t)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(unint64_t)a3
{
  self->_processAssertion = a3;
}

- (BOOL)didBecomeActiveWhileMigrating
{
  return self->_didBecomeActiveWhileMigrating;
}

- (void)setDidBecomeActiveWhileMigrating:(BOOL)a3
{
  self->_didBecomeActiveWhileMigrating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedInvocations, 0);
  objc_storeStrong((id *)&self->_appDelegate, 0);

  objc_storeStrong((id *)&self->window, 0);
}

@end