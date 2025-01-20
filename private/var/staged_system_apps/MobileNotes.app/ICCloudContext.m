@interface ICCloudContext
- (BOOL)isInForeground;
- (void)applicationDidEnterBackground;
- (void)applicationDidFinishLaunching;
- (void)applicationWillEnterForeground;
- (void)applicationWillTerminate;
@end

@implementation ICCloudContext

- (void)applicationDidFinishLaunching
{
  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100036DF8();
  }

  [(ICCloudContext *)self syncWithReason:@"DidFinishLaunching" completionHandler:0];
}

- (void)applicationDidEnterBackground
{
  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1004D4C38();
  }

  [(ICCloudContext *)self setQualityOfService:9];
  v4 = +[UMUserManager sharedManager];
  v5 = [v4 currentUser];
  id v6 = [v5 userType];

  v7 = +[UIApplication sharedApplication];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000579E0;
  v13[3] = &unk_100625D18;
  BOOL v14 = v6 == (id)1;
  v13[4] = self;
  qword_1006AA0C0 = (uint64_t)[v7 beginBackgroundTaskWithName:@"Background Sync" expirationHandler:v13];

  if (qword_1006AA0C0 != UIBackgroundTaskInvalid)
  {
    BOOL v8 = v6 != (id)1;
    unsigned __int8 v9 = [(ICCloudContext *)self syncOnlyIfReachable];
    [(ICCloudContext *)self setSyncOnlyIfReachable:v8];
    [(ICCloudContext *)self updateCloudContextState];
    v10 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1004D4C04();
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100057B5C;
    v11[3] = &unk_100626558;
    v11[4] = self;
    unsigned __int8 v12 = v9;
    [(ICCloudContext *)self processPendingCloudObjectsWithCompletionHandler:v11];
  }
}

- (void)applicationWillTerminate
{
  v2 = +[UIApplication sharedApplication];
  [v2 endBackgroundTask:qword_1006AA0C0];

  qword_1006AA0C0 = UIBackgroundTaskInvalid;
}

- (void)applicationWillEnterForeground
{
  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1004D4E68();
  }

  [(ICCloudContext *)self setQualityOfService:17];
  dispatchMainAfterDelay();
}

- (BOOL)isInForeground
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  performBlockOnMainThreadAndWait();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

@end