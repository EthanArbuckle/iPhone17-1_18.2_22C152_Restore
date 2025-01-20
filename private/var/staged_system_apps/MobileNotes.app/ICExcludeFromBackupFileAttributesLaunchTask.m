@interface ICExcludeFromBackupFileAttributesLaunchTask
- (id)taskIdentifier;
- (void)runOneTimeLaunchTask;
@end

@implementation ICExcludeFromBackupFileAttributesLaunchTask

- (id)taskIdentifier
{
  return @"DidFixExcludedFromBackupFlagsV3";
}

- (void)runOneTimeLaunchTask
{
  v3 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1004DB7A8(v3);
  }

  [(ICWorkerContextLaunchTask *)self workerContext];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000EB2B0;
  v6[3] = &unk_100625AF0;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v7;
  [v4 performBlockAndWait:v6];
  v5 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1004DB764(v5);
  }
}

@end