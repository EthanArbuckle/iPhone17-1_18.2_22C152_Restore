@interface ICOneTimePerNotesUpgradeLaunchTask
- (ICOneTimePerNotesUpgradeLaunchTask)init;
- (NSString)lastRunNotesVersionKey;
- (NSString)taskIdentifier;
- (int64_t)currentNotesVersion;
- (int64_t)lastRunNotesVersion;
- (void)runLaunchTask;
- (void)setCurrentNotesVersion:(int64_t)a3;
- (void)setLastRunNotesVersion:(int64_t)a3;
@end

@implementation ICOneTimePerNotesUpgradeLaunchTask

- (ICOneTimePerNotesUpgradeLaunchTask)init
{
  v4.receiver = self;
  v4.super_class = (Class)ICOneTimePerNotesUpgradeLaunchTask;
  v2 = [(ICOneTimePerNotesUpgradeLaunchTask *)&v4 init];
  if (v2) {
    v2->_currentNotesVersion = (int64_t)+[ICCloudSyncingObject currentNotesVersion];
  }
  return v2;
}

- (NSString)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (NSString)lastRunNotesVersionKey
{
  v2 = [(ICOneTimePerNotesUpgradeLaunchTask *)self taskIdentifier];
  v3 = +[NSString stringWithFormat:@"NotesVersionOfLastRun_%@", v2];

  return (NSString *)v3;
}

- (int64_t)lastRunNotesVersion
{
  v3 = +[NSUserDefaults standardUserDefaults];
  objc_super v4 = [(ICOneTimePerNotesUpgradeLaunchTask *)self lastRunNotesVersionKey];
  id v5 = [v3 integerForKey:v4];

  return (int64_t)v5;
}

- (void)setLastRunNotesVersion:(int64_t)a3
{
  id v6 = +[NSUserDefaults standardUserDefaults];
  id v5 = [(ICOneTimePerNotesUpgradeLaunchTask *)self lastRunNotesVersionKey];
  [v6 setInteger:a3 forKey:v5];
}

- (void)runLaunchTask
{
  v3 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(ICOneTimePerNotesUpgradeLaunchTask *)self taskIdentifier];
    id v5 = +[NSNumber numberWithLongLong:[(ICOneTimePerNotesUpgradeLaunchTask *)self lastRunNotesVersion]];
    id v6 = +[NSNumber numberWithLongLong:[(ICOneTimePerNotesUpgradeLaunchTask *)self currentNotesVersion]];
    *(_DWORD *)buf = 138413314;
    v18 = v4;
    __int16 v19 = 2112;
    v20 = v5;
    __int16 v21 = 2112;
    __int16 v23 = 2080;
    v22 = v6;
    v24 = "-[ICOneTimePerNotesUpgradeLaunchTask runLaunchTask]";
    __int16 v25 = 1024;
    int v26 = 49;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Running launch tasks for Notes versions… {taskIdentifier: %@, lastRunNotesVersion: %@, currentNotesVersion: %@}%s:%d", buf, 0x30u);
  }
  if ([(ICOneTimePerNotesUpgradeLaunchTask *)self lastRunNotesVersion] <= 7)
  {
    v7 = os_log_create("com.apple.notes", "LaunchTask");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1004D5378(self);
    }

    [(ICOneTimePerNotesUpgradeLaunchTask *)self setLastRunNotesVersion:8];
  }
  int64_t v8 = [(ICOneTimePerNotesUpgradeLaunchTask *)self lastRunNotesVersion];
  int64_t v9 = [(ICOneTimePerNotesUpgradeLaunchTask *)self currentNotesVersion];
  uint64_t v10 = [(ICOneTimePerNotesUpgradeLaunchTask *)self lastRunNotesVersion];
  int64_t v11 = [(ICOneTimePerNotesUpgradeLaunchTask *)self currentNotesVersion];
  if (v8 >= v9)
  {
    if (v10 == v11)
    {
      v15 = os_log_create("com.apple.notes", "LaunchTask");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1004D5258(self);
      }
    }
    else
    {
      uint64_t v16 = [(ICOneTimePerNotesUpgradeLaunchTask *)self lastRunNotesVersion];
      if (v16 <= [(ICOneTimePerNotesUpgradeLaunchTask *)self currentNotesVersion]) {
        return;
      }
      v15 = os_log_create("com.apple.notes", "LaunchTask");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1004D52E0(self, v15);
      }
    }
  }
  else if (v10 < v11)
  {
    do
    {
      ++v10;
      v12 = os_log_create("com.apple.notes", "LaunchTask");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = [(ICOneTimePerNotesUpgradeLaunchTask *)self taskIdentifier];
        v14 = +[NSNumber numberWithInteger:v10];
        *(_DWORD *)buf = 138412546;
        v18 = v13;
        __int16 v19 = 2112;
        v20 = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Running launch task for Notes version… {taskIdentifier: %@, notesVersion: %@}", buf, 0x16u);
      }
      [(ICOneTimePerNotesUpgradeLaunchTask *)self runTaskForNotesVersion:v10];
      [(ICOneTimePerNotesUpgradeLaunchTask *)self setLastRunNotesVersion:v10];
    }
    while (v10 < [(ICOneTimePerNotesUpgradeLaunchTask *)self currentNotesVersion]);
  }
}

- (int64_t)currentNotesVersion
{
  return self->_currentNotesVersion;
}

- (void)setCurrentNotesVersion:(int64_t)a3
{
  self->_currentNotesVersion = a3;
}

@end