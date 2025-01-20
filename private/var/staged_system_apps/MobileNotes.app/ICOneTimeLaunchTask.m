@interface ICOneTimeLaunchTask
- (id)taskIdentifier;
- (void)runLaunchTask;
@end

@implementation ICOneTimeLaunchTask

- (void)runLaunchTask
{
  v3 = [(ICOneTimeLaunchTask *)self taskIdentifier];
  v4 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1004D5650((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  v11 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v12 = [v11 BOOLForKey:v3];

  v13 = os_log_create("com.apple.notes", "LaunchTask");
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14) {
      sub_1004D5578((uint64_t)v3, v13, v15, v16, v17, v18, v19, v20);
    }
  }
  else
  {
    if (v14) {
      sub_1004D55E4((uint64_t)v3, v13, v15, v16, v17, v18, v19, v20);
    }

    [(ICOneTimeLaunchTask *)self runOneTimeLaunchTask];
    v13 = +[NSUserDefaults standardUserDefaults];
    [v13 setBool:1 forKey:v3];
  }
}

- (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end