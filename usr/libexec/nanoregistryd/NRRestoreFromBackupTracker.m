@interface NRRestoreFromBackupTracker
+ (id)sharedInstance;
+ (void)_markFileForFullSync:(id)a3;
- (BOOL)_writeToDisk:(id)a3;
- (BOOL)didRestoredFromBackup;
- (BOOL)isTracked;
- (NRPreferences)preferences;
- (NRRestoreFromBackupTracker)init;
- (NSString)restoreTrackerPath;
- (unsigned)lastKnownState;
- (void)refresh;
- (void)setPreferences:(id)a3;
- (void)setRestoreTrackerPath:(id)a3;
- (void)stopTracking;
- (void)updateState:(unsigned __int8)a3;
@end

@implementation NRRestoreFromBackupTracker

- (NRRestoreFromBackupTracker)init
{
  v8.receiver = self;
  v8.super_class = (Class)NRRestoreFromBackupTracker;
  v2 = [(NRRestoreFromBackupTracker *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NRDataFilePaths _pathToUnpairTriggerFile];
    restoreTrackerPath = v2->_restoreTrackerPath;
    v2->_restoreTrackerPath = (NSString *)v3;

    v5 = [[NRPreferences alloc] initWithDomain:@"com.apple.NanoRegistry"];
    preferences = v2->_preferences;
    v2->_preferences = v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001A12B8 != -1) {
    dispatch_once(&qword_1001A12B8, &stru_100168670);
  }
  v2 = (void *)qword_1001A12B0;

  return v2;
}

- (BOOL)isTracked
{
  v2 = [(NRPreferences *)self->_preferences objectForKeyedSubscript:@"lastRestoreIdentifier"];
  uint64_t v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"YES";
      if (!v2) {
        CFStringRef v6 = @"NO";
      }
      int v8 = 136446466;
      v9 = "-[NRRestoreFromBackupTracker isTracked]";
      __int16 v10 = 2114;
      CFStringRef v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  return v2 != 0;
}

- (BOOL)didRestoredFromBackup
{
  unsigned int v3 = [(NRRestoreFromBackupTracker *)self lastKnownState];
  BOOL v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:self->_restoreTrackerPath];

  if ((v5 & 1) != 0 || v3)
  {
    int v8 = [(NRPreferences *)self->_preferences objectForKeyedSubscript:@"lastRestoreIdentifier"];
    restoreTrackerPath = self->_restoreTrackerPath;
    id v19 = 0;
    CFStringRef v11 = +[NSString stringWithContentsOfFile:restoreTrackerPath encoding:4 error:&v19];
    id v12 = v19;
    if (v3) {
      unsigned int v9 = 0;
    }
    else {
      unsigned int v9 = [v8 isEqualToString:v11] ^ 1;
    }
    v13 = nr_daemon_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      v15 = nr_daemon_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        if (v3 > 3) {
          CFStringRef v16 = @"NRRestoreTrackerStateUnknown";
        }
        else {
          CFStringRef v16 = off_100168690[(char)v3];
        }
        CFStringRef v17 = @"NO";
        *(_DWORD *)buf = 136447234;
        v21 = "-[NRRestoreFromBackupTracker didRestoredFromBackup]";
        if (v9) {
          CFStringRef v17 = @"YES";
        }
        __int16 v22 = 2114;
        CFStringRef v23 = (const __CFString *)v8;
        __int16 v24 = 2114;
        v25 = v11;
        __int16 v26 = 2112;
        CFStringRef v27 = v16;
        __int16 v28 = 2112;
        CFStringRef v29 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s: last known restore id (prefs: %{public}@; file: %{public}@).  Last known state was %@. Returning %@",
          buf,
          0x34u);
      }
    }
    goto LABEL_21;
  }
  CFStringRef v6 = nr_daemon_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    int v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[NRRestoreFromBackupTracker didRestoredFromBackup]";
      __int16 v22 = 2112;
      CFStringRef v23 = @"NRRestoreTrackerStateTracking";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s (%@): Tracker file does not exist.", buf, 0x16u);
    }
    LOBYTE(v9) = 1;
LABEL_21:

    return v9;
  }
  LOBYTE(v9) = 1;
  return v9;
}

- (BOOL)_writeToDisk:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSURL fileURLWithPath:self->_restoreTrackerPath isDirectory:0];
  CFStringRef v6 = +[NSFileManager defaultManager];
  BOOL v7 = +[NRDataFilePaths _pathToNanoRegistryUnpairTriggerFileDirectory];
  id v35 = 0;
  unsigned __int8 v8 = [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v35];
  id v9 = v35;

  __int16 v10 = nr_daemon_log();
  CFStringRef v11 = v10;
  if (v8)
  {
    BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      v13 = nr_daemon_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v39 = "-[NRRestoreFromBackupTracker _writeToDisk:]";
        __int16 v40 = 2112;
        id v41 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: Creating unpair trigger file with content %@", buf, 0x16u);
      }
    }
    [(NRRestoreFromBackupTracker *)self updateState:1];
    id v34 = v9;
    unsigned __int8 v14 = [v4 writeToURL:v5 atomically:1 encoding:4 error:&v34];
    id v15 = v34;

    if (v14)
    {
      CFStringRef v16 = +[NSFileManager defaultManager];
      NSFileAttributeKey v36 = NSFileProtectionKey;
      NSFileProtectionType v37 = NSFileProtectionNone;
      CFStringRef v17 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      restoreTrackerPath = self->_restoreTrackerPath;
      id v33 = v15;
      unsigned __int8 v19 = [v16 setAttributes:v17 ofItemAtPath:restoreTrackerPath error:&v33];
      id v20 = v33;

      if ((v19 & 1) == 0)
      {
        v21 = nr_daemon_log();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

        if (v22)
        {
          CFStringRef v23 = nr_daemon_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_1000FA588();
          }
        }
        id v20 = 0;
      }
      id v32 = v20;
      unsigned __int8 v24 = [v5 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v32];
      id v9 = v32;

      if ((v24 & 1) == 0)
      {
        v25 = nr_daemon_log();
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

        if (v26)
        {
          CFStringRef v27 = nr_daemon_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_1000FA514();
          }
        }
        id v9 = 0;
      }
      [(id)objc_opt_class() _markFileForFullSync:self->_restoreTrackerPath];
      LOBYTE(self) = 1;
    }
    else
    {
      __int16 v28 = nr_daemon_log();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

      if (v29)
      {
        v30 = nr_daemon_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_1000FA5FC();
        }
      }
      LOBYTE(self) = 0;
      id v9 = v15;
    }
  }
  else
  {
    LODWORD(self) = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (self)
    {
      nr_daemon_log();
      self = (NRRestoreFromBackupTracker *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&self->super, OS_LOG_TYPE_ERROR)) {
        sub_1000FA670();
      }

      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (void)refresh
{
  if ([(NRRestoreFromBackupTracker *)self didRestoredFromBackup])
  {
    unsigned int v3 = (void *)os_transaction_create();
    id v4 = [(NRPreferences *)self->_preferences objectForKeyedSubscript:@"lastRestoreIdentifier"];
    unsigned __int8 v5 = +[NSUUID UUID];
    CFStringRef v6 = [v5 UUIDString];

    [(NRRestoreFromBackupTracker *)self updateState:2];
    [(NRPreferences *)self->_preferences setObject:v6 forKeyedSubscript:@"lastRestoreIdentifier"];
    if ([(NRPreferences *)self->_preferences synchronize])
    {
      unsigned int v7 = [(NRRestoreFromBackupTracker *)self _writeToDisk:v6];
      unsigned __int8 v8 = nr_daemon_log();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v7)
      {
        if (v9)
        {
          __int16 v10 = nr_daemon_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            int v19 = 136446466;
            id v20 = "-[NRRestoreFromBackupTracker refresh]";
            __int16 v21 = 2112;
            BOOL v22 = v6;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s: Created unpair trigger file with content %@", (uint8_t *)&v19, 0x16u);
          }
        }
        CFStringRef v11 = self;
        uint64_t v12 = 0;
      }
      else
      {
        if (v9)
        {
          v18 = nr_daemon_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            int v19 = 136446466;
            id v20 = "-[NRRestoreFromBackupTracker refresh]";
            __int16 v21 = 2112;
            BOOL v22 = v4;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s:Reverting back to %@", (uint8_t *)&v19, 0x16u);
          }
        }
        [(NRPreferences *)self->_preferences setObject:v4 forKeyedSubscript:@"lastRestoreIdentifier"];
        [(NRPreferences *)self->_preferences synchronize];
        CFStringRef v11 = self;
        uint64_t v12 = 3;
      }
      [(NRRestoreFromBackupTracker *)v11 updateState:v12];
    }
    else
    {
      id v15 = nr_daemon_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        CFStringRef v17 = nr_daemon_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1000FA6E4(v17);
        }
      }
    }
  }
  else
  {
    v13 = nr_daemon_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (!v14) {
      return;
    }
    id v4 = nr_daemon_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136446210;
      id v20 = "-[NRRestoreFromBackupTracker refresh]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: Not restored from backup. Not creating a new restore file.", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)stopTracking
{
  unsigned int v3 = (void *)os_transaction_create();
  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:self->_restoreTrackerPath];

  if (v5)
  {
    CFStringRef v6 = +[NSFileManager defaultManager];
    restoreTrackerPath = self->_restoreTrackerPath;
    id v16 = 0;
    unsigned __int8 v8 = [v6 removeItemAtPath:restoreTrackerPath error:&v16];
    id v9 = v16;

    if ((v8 & 1) == 0)
    {
      __int16 v10 = nr_daemon_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (v11)
      {
        uint64_t v12 = nr_daemon_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1000FA768(v9, v12);
        }
      }
    }
  }
  [(NRPreferences *)self->_preferences setObject:0 forKeyedSubscript:@"lastRestoreIdentifier"];
  [(NRPreferences *)self->_preferences synchronize];
  v13 = nr_daemon_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v15 = nr_daemon_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v18 = "-[NRRestoreFromBackupTracker stopTracking]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s: Removed unpair trigger file and pref.", buf, 0xCu);
    }
  }
}

- (void)updateState:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  unsigned int v5 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:");
  [(NRPreferences *)self->_preferences setObject:v5 forKeyedSubscript:@"lastRestoreIdentifier_state"];

  [(NRPreferences *)self->_preferences synchronize];
  CFStringRef v6 = nr_daemon_log();
  LODWORD(v5) = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    unsigned int v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v3 > 3) {
        CFStringRef v8 = @"NRRestoreTrackerStateUnknown";
      }
      else {
        CFStringRef v8 = off_100168690[(char)v3];
      }
      int v9 = 136446466;
      __int16 v10 = "-[NRRestoreFromBackupTracker updateState:]";
      __int16 v11 = 2112;
      CFStringRef v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (unsigned)lastKnownState
{
  [(NRPreferences *)self->_preferences synchronize];
  unsigned int v3 = [(NRPreferences *)self->_preferences objectForKeyedSubscript:@"lastRestoreIdentifier_state"];
  unsigned __int8 v4 = [v3 unsignedIntValue];

  unsigned int v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    unsigned int v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v4 > 3u) {
        CFStringRef v8 = @"NRRestoreTrackerStateUnknown";
      }
      else {
        CFStringRef v8 = off_100168690[(char)v4];
      }
      int v10 = 136446466;
      __int16 v11 = "-[NRRestoreFromBackupTracker lastKnownState]";
      __int16 v12 = 2112;
      CFStringRef v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  return v4;
}

+ (void)_markFileForFullSync:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v10 = +[NSException exceptionWithName:@"NPSPrefPlistProtectedUtil" reason:@"Path cannot be nil" userInfo:0];
    objc_exception_throw(v10);
  }
  id v4 = v3;
  int v5 = open((const char *)[v4 UTF8String], 2, 0);
  if (v5 != -1)
  {
    int v6 = v5;
    fcntl(v5, 51, 1);
    close(v6);
  }
  unsigned int v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

  if (v8)
  {
    int v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000FA834();
    }
  }
}

- (NSString)restoreTrackerPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRestoreTrackerPath:(id)a3
{
}

- (NRPreferences)preferences
{
  return (NRPreferences *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);

  objc_storeStrong((id *)&self->_restoreTrackerPath, 0);
}

@end