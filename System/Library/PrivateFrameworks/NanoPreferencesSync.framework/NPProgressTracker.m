@interface NPProgressTracker
+ (NPProgressTracker)sharedInstance;
- (BOOL)canStartOperation:(id)a3;
- (BOOL)crashedDuringLastRun;
- (NSMutableSet)problematicOperationSet;
- (id)_getOperationDictionary:(id)a3;
- (id)_init;
- (id)_lastBootedTimeFromPref;
- (id)_valueForKey:(id)a3;
- (id)dump;
- (void)_clearState;
- (void)_processStateClearIfNeeded;
- (void)_save:(id)a3 forOperation:(id)a4;
- (void)_saveLastBootedTimeToPref:(id)a3;
- (void)_setValue:(id)a3 forKey:(id)a4;
- (void)addToProblematicOperationSet:(id)a3;
- (void)clearState;
- (void)completedOperations;
- (void)setCrashedDuringLastRun:(BOOL)a3;
- (void)setProblematicOperationSet:(id)a3;
- (void)startedOperations;
@end

@implementation NPProgressTracker

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)NPProgressTracker;
  v2 = [(NPProgressTracker *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NPProgressTracker *)v2 _processStateClearIfNeeded];
  }
  return v3;
}

+ (NPProgressTracker)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020814;
  block[3] = &unk_10003D258;
  block[4] = a1;
  if (qword_100045778 != -1) {
    dispatch_once(&qword_100045778, block);
  }
  v2 = (void *)qword_100045770;
  return (NPProgressTracker *)v2;
}

- (void)startedOperations
{
  v3 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_crashedDuringLastRun) {
      CFStringRef v4 = @"YES";
    }
    else {
      CFStringRef v4 = @"NO";
    }
    int v5 = 138412290;
    CFStringRef v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Progress Tracker] Started tracking progress. (Crashed last time %@)", (uint8_t *)&v5, 0xCu);
  }
  [(NPProgressTracker *)self _clearState];
  [(NPProgressTracker *)self _setValue:@"kNPProgressTrackerStateStarted" forKey:@"kNPProgressTrackerStateKey"];
}

- (BOOL)canStartOperation:(id)a3
{
  id v4 = a3;
  if (self->_crashedDuringLastRun) {
    unsigned int v5 = [(NSMutableSet *)self->_problematicOperationSet containsObject:v4] ^ 1;
  }
  else {
    unsigned int v5 = 1;
  }
  CFStringRef v6 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v5) {
      CFStringRef v7 = @"YES";
    }
    int v9 = 138543618;
    id v10 = v4;
    __int16 v11 = 2112;
    CFStringRef v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Progress Tracker] Can start syncing (%{public}@)? %@", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (void)completedOperations
{
  v3 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Progress Tracker] Stopped tracking progress.", v4, 2u);
  }
  [(NPProgressTracker *)self _setValue:0 forKey:@"kNPProgressTrackerLastProcessingDomainKey"];
  [(NPProgressTracker *)self _setValue:@"kNPProgressTrackerStateCompleted" forKey:@"kNPProgressTrackerStateKey"];
  self->_crashedDuringLastRun = 0;
}

- (void)clearState
{
  v3 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Progress Tracker] Requested to clear state.", v4, 2u);
  }
  [(NPProgressTracker *)self _clearState];
}

- (id)dump
{
  CFDictionaryRef v2 = CFPreferencesCopyMultiple(0, @"kNPProgressTrackerDomain", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFDictionaryRef v3 = v2;
  if (v2)
  {
    id v4 = [(__CFDictionary *)v2 description];
  }
  else
  {
    id v4 = &stru_10003DD30;
  }

  return v4;
}

- (void)addToProblematicOperationSet:(id)a3
{
  id v4 = a3;
  unsigned int v5 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Progress Tracker] Adding %{public}@ to known problematic operation set.", (uint8_t *)&v11, 0xCu);
  }
  p_problematicOperationSet = &self->_problematicOperationSet;
  problematicOperationSet = self->_problematicOperationSet;
  if (problematicOperationSet) {
    v8 = problematicOperationSet;
  }
  else {
    v8 = (NSMutableSet *)objc_opt_new();
  }
  int v9 = v8;
  if (([(NSMutableSet *)v8 containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)v9 addObject:v4];
    objc_storeStrong((id *)&self->_problematicOperationSet, v9);
    if (*p_problematicOperationSet)
    {
      id v10 = [(NSMutableSet *)*p_problematicOperationSet allObjects];
    }
    else
    {
      id v10 = 0;
    }
    [(NPProgressTracker *)self _setValue:v10 forKey:@"kNPProgressTrackerOversizedDomainsKey"];
  }
}

- (void)_clearState
{
  [(NPProgressTracker *)self _setValue:0 forKey:@"kNPProgressTrackerLastProcessingDomainKey"];
  [(NPProgressTracker *)self _setValue:0 forKey:@"kNPProgressTrackerStateKey"];
  [(NPProgressTracker *)self _setValue:0 forKey:@"kNPProgressTrackerDomainsKey"];
  [(NPProgressTracker *)self _setValue:0 forKey:@"kNPProgressTrackerOversizedDomainsKey"];
}

- (void)_processStateClearIfNeeded
{
  CFDictionaryRef v3 = [(NPProgressTracker *)self _lastBootedTimeFromPref];
  *(void *)v18 = 0x1500000001;
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  size_t v14 = 16;
  int v4 = sysctl(v18, 2u, buf, &v14, 0, 0);
  double v5 = -1.0;
  if (v4 != -1 && *(void *)buf) {
    double v5 = (double)*(int *)&buf[8] / 1000000.0 + (double)*(uint64_t *)buf;
  }
  CFStringRef v6 = +[NSNumber numberWithDouble:v5];
  CFStringRef v7 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "storedBootTime: %@ freshBootTime: %@", buf, 0x16u);
  }
  if (v3 && ([v3 isEqual:v6] & 1) != 0)
  {
    v8 = [(NPProgressTracker *)self _valueForKey:@"kNPProgressTrackerStateKey"];
    int v9 = [(NPProgressTracker *)self _valueForKey:@"kNPProgressTrackerLastProcessingDomainKey"];
    id v10 = [(NPProgressTracker *)self _valueForKey:@"kNPProgressTrackerOversizedDomainsKey"];
    int v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NSMutableSet *)v11 addObjectsFromArray:v10];
    }
    id v12 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Progress Tracker] State from prefs %{public}@.                  Last domain being processed %{public}@.                  List of oversized domains %{public}@", buf, 0x20u);
    }
    self->_crashedDuringLastRun = [v8 isEqualToString:@"kNPProgressTrackerStateStarted"];
    problematicOperationSet = self->_problematicOperationSet;
    self->_problematicOperationSet = v11;
  }
  else
  {
    [(NPProgressTracker *)self _clearState];
    [(NPProgressTracker *)self _saveLastBootedTimeToPref:v6];
  }
}

- (id)_lastBootedTimeFromPref
{
  return [(NPProgressTracker *)self _valueForKey:@"kNPProgressTrackerLastBootedKey"];
}

- (void)_saveLastBootedTimeToPref:(id)a3
{
}

- (void)_setValue:(id)a3 forKey:(id)a4
{
  id value = a3;
  CFStringRef v6 = (__CFString *)a4;
  CFStringRef v7 = self;
  objc_sync_enter(v7);
  CFPreferencesSetAppValue(v6, value, @"kNPProgressTrackerDomain");
  CFPreferencesAppSynchronize(@"kNPProgressTrackerDomain");
  objc_sync_exit(v7);
}

- (id)_valueForKey:(id)a3
{
  int v4 = (__CFString *)a3;
  double v5 = self;
  objc_sync_enter(v5);
  CFStringRef v6 = (void *)CFPreferencesCopyAppValue(v4, @"kNPProgressTrackerDomain");
  objc_sync_exit(v5);

  return v6;
}

- (id)_getOperationDictionary:(id)a3
{
  id v4 = a3;
  double v5 = [(NPProgressTracker *)self _valueForKey:@"kNPProgressTrackerDomainsKey"];
  id v6 = [v5 mutableCopy];

  if (!v6) {
    id v6 = (id)objc_opt_new();
  }
  CFStringRef v7 = [v6 objectForKeyedSubscript:v4];

  id v8 = [v7 mutableCopy];
  int v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  int v11 = v10;

  return v11;
}

- (void)_save:(id)a3 forOperation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPProgressTracker *)self _valueForKey:@"kNPProgressTrackerDomainsKey"];
  id v10 = [v8 mutableCopy];

  int v9 = v10;
  if (!v10) {
    int v9 = objc_opt_new();
  }
  id v11 = v9;
  [v9 setObject:v7 forKeyedSubscript:v6];

  [(NPProgressTracker *)self _setValue:v11 forKey:@"kNPProgressTrackerDomainsKey"];
}

- (BOOL)crashedDuringLastRun
{
  return self->_crashedDuringLastRun;
}

- (void)setCrashedDuringLastRun:(BOOL)a3
{
  self->_crashedDuringLastRun = a3;
}

- (NSMutableSet)problematicOperationSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProblematicOperationSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end