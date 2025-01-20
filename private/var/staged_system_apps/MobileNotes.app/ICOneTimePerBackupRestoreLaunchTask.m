@interface ICOneTimePerBackupRestoreLaunchTask
- (id)completionFileName;
- (id)taskIdentifier;
- (void)runLaunchTask;
@end

@implementation ICOneTimePerBackupRestoreLaunchTask

- (void)runLaunchTask
{
  v3 = [(ICOneTimePerBackupRestoreLaunchTask *)self completionFileName];
  v4 = +[ICPaths applicationDocumentsURL];
  v5 = [v4 URLByAppendingPathComponent:v3 isDirectory:0];

  v6 = +[NSFileManager defaultManager];
  v7 = [v5 path];
  unsigned int v8 = [v6 fileExistsAtPath:v7];

  v9 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = [v5 path];
    v17 = (void *)v16;
    CFStringRef v18 = @"NO";
    *(_DWORD *)buf = 138412802;
    v21 = v3;
    __int16 v22 = 2112;
    if (v8) {
      CFStringRef v18 = @"YES";
    }
    uint64_t v23 = v16;
    __int16 v24 = 2112;
    CFStringRef v25 = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Running %@ if necessary. Checking file at URL %@, File Exist ? %@", buf, 0x20u);
  }
  v10 = os_log_create("com.apple.notes", "LaunchTask");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v11) {
      sub_1004D5A64((uint64_t)v3, v10);
    }
  }
  else
  {
    if (v11) {
      sub_1004D5B64((uint64_t)v3, v10);
    }

    [(ICOneTimePerBackupRestoreLaunchTask *)self runOneTimePerBackupRestoreLaunchTask];
    uint64_t v12 = +[NSFileManager defaultManager];
    v13 = [v5 path];
    v14 = +[NSData data];
    [(id)v12 createFileAtPath:v13 contents:v14 attributes:0];

    id v19 = 0;
    LOBYTE(v12) = [v5 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v19];
    v10 = v19;
    if ((v12 & 1) == 0)
    {
      v15 = os_log_create("com.apple.notes", "LaunchTask");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1004D5ADC((uint64_t)v5, (uint64_t)v10, v15);
      }
    }
  }
}

- (id)completionFileName
{
  v2 = [(ICOneTimePerBackupRestoreLaunchTask *)self taskIdentifier];
  v3 = +[NSString stringWithFormat:@"completionOfPerBackupRestoreLaunchTask_%@", v2];

  return v3;
}

- (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end