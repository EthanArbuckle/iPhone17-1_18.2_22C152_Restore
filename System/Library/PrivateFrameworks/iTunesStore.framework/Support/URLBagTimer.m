@interface URLBagTimer
+ (id)subscriptionRenewTimer;
- (NSString)bagKey;
- (NSString)cellularBagKey;
- (URLBagTimer)initWithIdentifier:(id)a3;
- (double)_readTimeIntervalFromUserDefaultsKey:(id)a3;
- (double)_timerInterval;
- (double)_timerIntervalWithBagKey:(id)a3 userDefaultsKey:(id)a4;
- (double)_windowWithUserDefaultsKey:(id)a3;
- (double)defaultInterval;
- (double)defaultWindow;
- (id)_nextFireDateWithInterval:(double)a3;
- (id)_userDefaultsKeyCellularOverride;
- (id)_userDefaultsKeyLastTimeCheck;
- (id)_userDefaultsKeyWiFiOverride;
- (id)_userDefaultsKeyWindowOverride;
- (id)eventBlock;
- (id)preconditionsBlock;
- (void)_addJobWithDate:(id)a3 window:(double)a4 allowsCellular:(BOOL)a5;
- (void)_attemptFireForJob:(id)a3 withName:(id)a4;
- (void)_fireTimer;
- (void)_resetBackgroundTaskJobs;
- (void)_setLastFireDate:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)reset;
- (void)setBagKey:(id)a3;
- (void)setCellularBagKey:(id)a3;
- (void)setDefaultInterval:(double)a3;
- (void)setDefaultWindow:(double)a3;
- (void)setEventBlock:(id)a3;
- (void)setPreconditionsBlock:(id)a3;
- (void)start;
@end

@implementation URLBagTimer

- (URLBagTimer)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)URLBagTimer;
  v5 = [(URLBagTimer *)&v16 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = v6;

    objc_initWeak(&location, v5);
    v8 = +[Daemon daemon];
    id v9 = [v4 copy];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000E6938;
    v13[3] = &unk_1003A4510;
    objc_copyWeak(&v14, &location);
    uint64_t v10 = [v8 addObserverForBackgroundTaskWithIdentifierPrefix:v9 withBlock:v13];
    id taskObserver = v5->_taskObserver;
    v5->_id taskObserver = (id)v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  if (self->_taskObserver)
  {
    v3 = +[Daemon daemon];
    [v3 removeBackgroundTaskObserver:self->_taskObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)URLBagTimer;
  [(URLBagTimer *)&v4 dealloc];
}

+ (id)subscriptionRenewTimer
{
  id v2 = [objc_alloc((Class)a1) initWithIdentifier:@"com.apple.itunesstored.subscription-poll"];
  [v2 setBagKey:@"subscription-status-refresh-interval-in-seconds"];
  [v2 setDefaultInterval:86400.0];
  [v2 setDefaultWindow:43200.0];

  return v2;
}

- (void)invalidate
{
  if (self->_taskObserver)
  {
    v3 = +[Daemon daemon];
    [v3 removeBackgroundTaskObserver:self->_taskObserver];

    id taskObserver = self->_taskObserver;
    self->_id taskObserver = 0;
  }
  if (self->_started)
  {
    self->_started = 0;
    if ([(NSString *)self->_identifier length])
    {
      id v5 = [(NSString *)self->_identifier stringByAppendingString:@".cell"];
      xpc_activity_unregister((const char *)[v5 UTF8String]);
      v6 = [(NSString *)self->_identifier stringByAppendingString:@".wifi"];

      id v16 = v6;
      xpc_activity_unregister((const char *)[v16 UTF8String]);

      return;
    }
    v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7)
    {
      v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    uint64_t v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      v9 &= 2u;
    }
    if (v9)
    {
      v11 = objc_opt_class();
      identifier = self->_identifier;
      int v17 = 138412546;
      v18 = v11;
      __int16 v19 = 2112;
      v20 = identifier;
      id v13 = v11;
      LODWORD(v15) = 22;
      id v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_19:

        return;
      }
      uint64_t v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v17, v15);
      free(v14);
      SSFileLog();
    }

    goto LABEL_19;
  }
}

- (void)reset
{
  v3 = +[NSDate date];
  [(URLBagTimer *)self _setLastFireDate:v3];

  [(URLBagTimer *)self _resetBackgroundTaskJobs];
}

- (void)start
{
  if (!self->_started)
  {
    self->_started = 1;
    CFStringRef v3 = [(URLBagTimer *)self _userDefaultsKeyLastTimeCheck];
    CFPropertyListRef v4 = CFPreferencesCopyAppValue(v3, kSSUserDefaultsIdentifier);
    id v5 = (void *)v4;
    if (v4
      && (CFTypeID v6 = CFGetTypeID(v4), v6 == CFDateGetTypeID())
      && (([v5 timeIntervalSinceNow],
           double v8 = v7,
           [(URLBagTimer *)self _timerInterval],
           v9 <= 0.0)
       || v8 >= -v9)
      || (preconditionsBlock = (unsigned int (**)(void))self->_preconditionsBlock) != 0 && !preconditionsBlock[2]())
    {
      [(URLBagTimer *)self _resetBackgroundTaskJobs];
      if (!v5) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11)
    {
      v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    id v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      v13 &= 2u;
    }
    if (v13)
    {
      uint64_t v15 = objc_opt_class();
      identifier = self->_identifier;
      *(_DWORD *)v20 = 138412546;
      *(void *)&v20[4] = v15;
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = identifier;
      id v17 = v15;
      LODWORD(v19) = 22;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18) {
        goto LABEL_19;
      }
      id v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, v20, v19, *(_OWORD *)v20, *(void *)&v20[16]);
      free(v18);
      SSFileLog();
    }

LABEL_19:
    [(URLBagTimer *)self _fireTimer];
    if (!v5)
    {
LABEL_21:
      CFRelease(v3);
      return;
    }
LABEL_20:
    CFRelease(v5);
    goto LABEL_21;
  }
}

- (void)_addJobWithDate:(id)a3 window:(double)a4 allowsCellular:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  [v7 timeIntervalSinceNow];
  double v9 = v8;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, !v5);
  xpc_dictionary_set_int64(v10, XPC_ACTIVITY_DELAY, (uint64_t)v9);
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  v11 = [[BackgroundTaskRequest alloc] initWithBackgroundTaskAgentJob:v10];
  if (v5) {
    CFStringRef v12 = @".cell";
  }
  else {
    CFStringRef v12 = @".wifi";
  }
  int v13 = [(NSString *)self->_identifier stringByAppendingString:v12];
  [(BackgroundTaskRequest *)v11 setRequestIdentifier:v13];
  id v14 = +[SSLogConfig sharedDaemonConfig];
  if (!v14)
  {
    id v14 = +[SSLogConfig sharedConfig];
  }
  unsigned int v15 = [v14 shouldLog];
  if ([v14 shouldLogToDisk]) {
    int v16 = v15 | 2;
  }
  else {
    int v16 = v15;
  }
  id v17 = [v14 OSLogObject];
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
    v16 &= 2u;
  }
  if (!v16) {
    goto LABEL_14;
  }
  *(_DWORD *)v22 = 138412802;
  *(void *)&v22[4] = objc_opt_class();
  *(_WORD *)&v22[12] = 2112;
  *(void *)&v22[14] = v13;
  *(_WORD *)&v22[22] = 2112;
  id v23 = v7;
  id v18 = *(id *)&v22[4];
  LODWORD(v21) = 32;
  uint64_t v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    id v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, v22, v21, *(_OWORD *)v22, *(void *)&v22[16], v23);
    free(v19);
    SSFileLog();
LABEL_14:
  }
  v20 = +[Daemon daemon];
  [v20 addBackgroundTaskWithRequest:v11];
}

- (void)_attemptFireForJob:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_started)
  {
    double v8 = +[ISNetworkObserver sharedInstance];
    id v9 = [v8 networkType];

    if ([v7 hasSuffix:@"cell"])
    {
      if ((SSNetworkTypeIsCellularType() & 1) == 0)
      {
LABEL_21:
        [(URLBagTimer *)self _resetBackgroundTaskJobs];
        goto LABEL_22;
      }
    }
    else if (![v7 hasSuffix:@"wifi"] || v9 != (id)1000)
    {
      goto LABEL_21;
    }
    preconditionsBlock = (unsigned int (**)(void))self->_preconditionsBlock;
    if (preconditionsBlock && !preconditionsBlock[2]()) {
      goto LABEL_21;
    }
    v11 = +[SSLogConfig sharedDaemonConfig];
    if (!v11)
    {
      v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    id v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      v13 &= 2u;
    }
    if (v13)
    {
      *(_DWORD *)id v18 = 138412546;
      *(void *)&v18[4] = objc_opt_class();
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v7;
      id v15 = *(id *)&v18[4];
      LODWORD(v17) = 22;
      int v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_20:

        [(URLBagTimer *)self _fireTimer];
        goto LABEL_22;
      }
      id v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, v18, v17, *(_OWORD *)v18, *(void *)&v18[16]);
      free(v16);
      SSFileLog();
    }

    goto LABEL_20;
  }
LABEL_22:
}

- (void)_fireTimer
{
  CFStringRef v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E7544;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(v3, block);

  CFPropertyListRef v4 = +[NSDate date];
  [(URLBagTimer *)self _setLastFireDate:v4];

  [(URLBagTimer *)self _resetBackgroundTaskJobs];
}

- (id)_nextFireDateWithInterval:(double)a3
{
  CFStringRef v5 = [(URLBagTimer *)self _userDefaultsKeyLastTimeCheck];
  id v6 = (void *)CFPreferencesCopyAppValue(v5, kSSUserDefaultsIdentifier);
  id v7 = +[NSDate date];
  double v8 = v7;
  if (v6)
  {
    CFTypeID v9 = CFGetTypeID(v6);
    if (v9 != CFDateGetTypeID() || ([v6 timeIntervalSinceNow], v10 > 2.22044605e-16))
    {
      id v11 = v8;
      [(URLBagTimer *)self _setLastFireDate:v11];
      goto LABEL_8;
    }
    id v12 = v6;
  }
  else
  {
    id v12 = v7;
  }
  id v11 = v12;
LABEL_8:
  id v13 = [objc_alloc((Class)NSDate) initWithTimeInterval:v11 sinceDate:a3];
  id v14 = [v13 earlierDate:v8];

  if (v14 == v13)
  {
    id v15 = [objc_alloc((Class)NSDate) initWithTimeInterval:v8 sinceDate:a3];

    id v13 = v15;
  }
  if (v6) {
    CFRelease(v6);
  }
  CFRelease(v5);

  return v13;
}

- (double)_readTimeIntervalFromUserDefaultsKey:(id)a3
{
  double valuePtr = 0.0;
  CFStringRef v3 = (__CFString *)a3;
  CFNumberRef v4 = (const __CFNumber *)CFPreferencesCopyAppValue(v3, kSSUserDefaultsIdentifier);
  if (v4)
  {
    CFNumberRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v5, kCFNumberDoubleType, &valuePtr);
    }
    else
    {
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID())
      {
        [(__CFNumber *)v5 doubleValue];
        double valuePtr = v8;
      }
    }
    CFRelease(v5);
  }
  CFRelease(v3);
  double v9 = valuePtr;

  return v9;
}

- (void)_resetBackgroundTaskJobs
{
  if (self->_started)
  {
    CFStringRef v3 = [(URLBagTimer *)self _userDefaultsKeyWindowOverride];
    [(URLBagTimer *)self _windowWithUserDefaultsKey:v3];
    double v5 = v4;

    bagKey = self->_bagKey;
    CFTypeID v7 = [(URLBagTimer *)self _userDefaultsKeyWiFiOverride];
    [(URLBagTimer *)self _timerIntervalWithBagKey:bagKey userDefaultsKey:v7];
    double defaultInterval = v8;

    if (defaultInterval < 2.22044605e-16) {
      double defaultInterval = self->_defaultInterval;
    }
    if (defaultInterval > 2.22044605e-16)
    {
      double v10 = [(URLBagTimer *)self _nextFireDateWithInterval:defaultInterval];
      [(URLBagTimer *)self _addJobWithDate:v10 window:0 allowsCellular:v5];
    }
    cellularBagKey = self->_cellularBagKey;
    id v12 = [(URLBagTimer *)self _userDefaultsKeyCellularOverride];
    [(URLBagTimer *)self _timerIntervalWithBagKey:cellularBagKey userDefaultsKey:v12];
    double v14 = v13;

    if (v14 < 2.22044605e-16 && !self->_cellularBagKey) {
      double v14 = defaultInterval;
    }
    if (v14 > 2.22044605e-16)
    {
      id v15 = [(URLBagTimer *)self _nextFireDateWithInterval:v14];
      [(URLBagTimer *)self _addJobWithDate:v15 window:1 allowsCellular:v5];
    }
  }
}

- (void)_setLastFireDate:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(URLBagTimer *)self _userDefaultsKeyLastTimeCheck];
  CFStringRef v6 = (const __CFString *)kITunesStoreDaemonDefaultsID;
  CFPreferencesSetAppValue(v5, v4, kITunesStoreDaemonDefaultsID);

  CFPreferencesAppSynchronize(v6);

  CFRelease(v5);
}

- (double)_timerInterval
{
  CFStringRef v3 = +[ISNetworkObserver sharedInstance];
  id v4 = [v3 networkType];

  if (v4 == (id)1000)
  {
    bagKey = self->_bagKey;
    uint64_t v6 = [(URLBagTimer *)self _userDefaultsKeyWiFiOverride];
  }
  else
  {
    if (!SSNetworkTypeIsCellularType()) {
      return self->_defaultInterval;
    }
    bagKey = self->_cellularBagKey;
    if (!bagKey) {
      bagKey = self->_bagKey;
    }
    uint64_t v6 = [(URLBagTimer *)self _userDefaultsKeyCellularOverride];
  }
  CFTypeID v7 = (void *)v6;
  [(URLBagTimer *)self _timerIntervalWithBagKey:bagKey userDefaultsKey:v6];
  double v9 = v8;

  if (v9 < 2.22044605e-16) {
    return self->_defaultInterval;
  }
  return v9;
}

- (double)_timerIntervalWithBagKey:(id)a3 userDefaultsKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [(URLBagTimer *)self _readTimeIntervalFromUserDefaultsKey:v7];
    double v9 = v8;
    if (!v6) {
      goto LABEL_7;
    }
  }
  else
  {
    double v9 = 0.0;
    if (!v6) {
      goto LABEL_7;
    }
  }
  if (v9 < 2.22044605e-16)
  {
    double v10 = +[ISURLBagCache sharedCache];
    id v11 = +[SSURLBagContext contextWithBagType:0];
    id v12 = [v10 URLBagForContext:v11];

    double v13 = [v12 valueForKey:v6];
    [v13 doubleValue];
    double v9 = v14;
  }
LABEL_7:

  return v9;
}

- (id)_userDefaultsKeyCellularOverride
{
  return [(NSString *)self->_identifier stringByAppendingString:@":CellularOverride"];
}

- (id)_userDefaultsKeyLastTimeCheck
{
  return [(NSString *)self->_identifier stringByAppendingString:@":LastCheckTime"];
}

- (id)_userDefaultsKeyWiFiOverride
{
  return [(NSString *)self->_identifier stringByAppendingString:@":WiFiOverride"];
}

- (id)_userDefaultsKeyWindowOverride
{
  return [(NSString *)self->_identifier stringByAppendingString:@":WindowOverride"];
}

- (double)_windowWithUserDefaultsKey:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([(URLBagTimer *)self _readTimeIntervalFromUserDefaultsKey:v4],
        defaultWindow < 2.22044605e-16))
  {
    double defaultWindow = self->_defaultWindow;
  }
  if (defaultWindow >= 2.22044605e-16) {
    double v6 = defaultWindow;
  }
  else {
    double v6 = 604800.0;
  }

  return v6;
}

- (NSString)bagKey
{
  return self->_bagKey;
}

- (void)setBagKey:(id)a3
{
}

- (NSString)cellularBagKey
{
  return self->_cellularBagKey;
}

- (void)setCellularBagKey:(id)a3
{
}

- (double)defaultInterval
{
  return self->_defaultInterval;
}

- (void)setDefaultInterval:(double)a3
{
  self->_double defaultInterval = a3;
}

- (double)defaultWindow
{
  return self->_defaultWindow;
}

- (void)setDefaultWindow:(double)a3
{
  self->_double defaultWindow = a3;
}

- (id)eventBlock
{
  return self->_eventBlock;
}

- (void)setEventBlock:(id)a3
{
}

- (id)preconditionsBlock
{
  return self->_preconditionsBlock;
}

- (void)setPreconditionsBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_taskObserver, 0);
  objc_storeStrong(&self->_preconditionsBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_eventBlock, 0);
  objc_storeStrong((id *)&self->_cellularBagKey, 0);

  objc_storeStrong((id *)&self->_bagKey, 0);
}

@end