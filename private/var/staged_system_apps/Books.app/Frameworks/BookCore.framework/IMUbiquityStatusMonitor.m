@interface IMUbiquityStatusMonitor
- (BCICloudIdentityToken)currentUbiquityIdentityToken;
- (BCICloudIdentityToken)lastArchivedNonNilUbiquityIdentityToken;
- (BCICloudIdentityToken)lastArchivedUbiquityIdentityToken;
- (BCICloudIdentityToken)ubiquityIdentityToken;
- (BOOL)archivedCloudDriveOptedIn;
- (BOOL)dq_isICloudDriveEnabled;
- (BOOL)isICloudDriveEnabled;
- (BOOL)lastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch;
- (IMUbiquityStatusChangeObserving)coordinatingObserver;
- (IMUbiquityStatusMonitor)init;
- (IMUbiquityStatusMonitor)initWithContainerIdentifier:(id)a3;
- (NSHashTable)observers;
- (NSString)containerIdentifier;
- (NSURL)containerURL;
- (NSURL)documentsURL;
- (OS_dispatch_queue)containerQueue;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_queue)notifyQueue;
- (id)_stateForLog;
- (id)description;
- (id)makeOSStateHandler;
- (void)_notifyObserversForChangesWithCurrentToken:(id)a3 lastToken:(id)a4;
- (void)_notifyObserversForUnchangedWithCurrentToken:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)dq_archiveCurrentUbiquityIdentityToken;
- (void)dq_refreshUbiquityAvailabilityStatus;
- (void)p_ubiquityIdentityDidChange:(id)a3;
- (void)registerCoordinatingObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)restartObserving;
- (void)setArchivedCloudDriveOptedIn:(BOOL)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setContainerQueue:(id)a3;
- (void)setContainerURL:(id)a3;
- (void)setCoordinatingObserver:(id)a3;
- (void)setCurrentUbiquityIdentityToken:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDocumentsURL:(id)a3;
- (void)setLastArchivedNonNilUbiquityIdentityToken:(id)a3;
- (void)setLastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch:(BOOL)a3;
- (void)setLastArchivedUbiquityIdentityToken:(id)a3;
- (void)setNotifyQueue:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation IMUbiquityStatusMonitor

- (IMUbiquityStatusMonitor)init
{
  return [(IMUbiquityStatusMonitor *)self initWithContainerIdentifier:@"iCloud.com.apple.iBooks"];
}

- (IMUbiquityStatusMonitor)initWithContainerIdentifier:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IMUbiquityStatusMonitor;
  v6 = [(IMUbiquityStatusMonitor *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_containerIdentifier, a3);
    uint64_t v8 = +[NSHashTable hashTableWithOptions:517];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.iBooks.IMUbiquityStatusMonitor.containerQueue", 0);
    containerQueue = v7->_containerQueue;
    v7->_containerQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.iBooks.IMUbiquityStatusMonitor.dispatchQueue", 0);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.iBooks.IMUbiquityStatusMonitor.notifyQueue", 0);
    notifyQueue = v7->_notifyQueue;
    v7->_notifyQueue = (OS_dispatch_queue *)v14;

    v16 = +[NSUserDefaults standardUserDefaults];
    v17 = [v16 valueForKey:@"nonNilUbiquityIdentityToken"];
    v7->_lastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch = v17 != 0;

    v7->_archivedCloudDriveOptedIn = +[BCSyncUserDefaults archivedICloudDriveSyncOptedInBeforeInitialTCCSync];
    v18 = v7->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5104C;
    block[3] = &unk_2C3C50;
    v19 = v7;
    v23 = v19;
    dispatch_async(v18, block);
    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v19 selector:"p_ubiquityIdentityDidChange:" name:NSUbiquityIdentityDidChangeNotification object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)IMUbiquityStatusMonitor;
  [(IMUbiquityStatusMonitor *)&v4 dealloc];
}

- (BCICloudIdentityToken)ubiquityIdentityToken
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  dispatch_queue_t v10 = sub_511D4;
  v11 = sub_511E4;
  id v12 = 0;
  v3 = [(IMUbiquityStatusMonitor *)self dispatchQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_511EC;
  v6[3] = &unk_2C39F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (BCICloudIdentityToken *)v4;
}

- (BOOL)dq_isICloudDriveEnabled
{
  unsigned int v2 = +[BCSyncUserDefaults isICloudDriveSyncOptedIn];
  if (v2)
  {
    BOOL v3 = +[BCSyncUserDefaults isGlobalICloudDriveSyncOptedIn];
    if (v3) {
      CFStringRef v4 = @"YES";
    }
    else {
      CFStringRef v4 = @"NO";
    }
  }
  else
  {
    BOOL v3 = 0;
    CFStringRef v4 = @"NO";
  }
  id v5 = BCUbiquityEnabledLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v7 = @"YES";
    if (v2) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    int v9 = 138412802;
    CFStringRef v10 = v8;
    __int16 v11 = 2112;
    if (!v3) {
      CFStringRef v7 = @"NO";
    }
    CFStringRef v12 = v4;
    __int16 v13 = 2112;
    CFStringRef v14 = v7;
    _os_log_debug_impl(&def_7D91C, v5, OS_LOG_TYPE_DEBUG, "BCUbiquityStatusMonitor: dq_isICloudDriveEnabled: isICloudDriveSyncOptedIn = %@, globalICloudDrive = %@, isICloudDriveEnabled = %@", (uint8_t *)&v9, 0x20u);
  }

  return v3;
}

- (BOOL)isICloudDriveEnabled
{
  unsigned int v2 = self;
  uint64_t v6 = 0;
  CFStringRef v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(IMUbiquityStatusMonitor *)self dispatchQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_51438;
  v5[3] = &unk_2C39F0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = [(IMUbiquityStatusMonitor *)self dispatchQueue];
    v9[0] = (uint64_t)_NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = (uint64_t)sub_5154C;
    v9[3] = (uint64_t)&unk_2C3AF8;
    v9[4] = (uint64_t)self;
    id v10 = v7;
    dispatch_async(v8, v9);
  }
  else
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCUbiquityStatusMonitor.m", 124, (uint64_t)"-[IMUbiquityStatusMonitor addObserver:]", (uint64_t)"observer", 0, v4, v5, v6, v9[0]);
  }
}

- (void)removeObserver:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = [(IMUbiquityStatusMonitor *)self dispatchQueue];
    v9[0] = (uint64_t)_NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = (uint64_t)sub_516E0;
    v9[3] = (uint64_t)&unk_2C3AF8;
    v9[4] = (uint64_t)self;
    id v10 = v7;
    dispatch_async(v8, v9);
  }
  else
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCUbiquityStatusMonitor.m", 137, (uint64_t)"-[IMUbiquityStatusMonitor removeObserver:]", (uint64_t)"observer", 0, v4, v5, v6, v9[0]);
  }
}

- (void)registerCoordinatingObserver:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = [(IMUbiquityStatusMonitor *)self dispatchQueue];
    v9[0] = (uint64_t)_NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = (uint64_t)sub_51854;
    v9[3] = (uint64_t)&unk_2C3AF8;
    v9[4] = (uint64_t)self;
    id v10 = v7;
    dispatch_async(v8, v9);
  }
  else
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCUbiquityStatusMonitor.m", 152, (uint64_t)"-[IMUbiquityStatusMonitor registerCoordinatingObserver:]", (uint64_t)"observer", 0, v4, v5, v6, v9[0]);
  }
}

- (void)restartObserving
{
  BOOL v3 = [(IMUbiquityStatusMonitor *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_51950;
  block[3] = &unk_2C3C50;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)dq_archiveCurrentUbiquityIdentityToken
{
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v4 = [(IMUbiquityStatusMonitor *)self currentUbiquityIdentityToken];
  uint64_t v5 = [v4 token];
  [v3 setObject:v5 forKey:@"ubiquityIdentityToken"];

  uint64_t v6 = [(IMUbiquityStatusMonitor *)self currentUbiquityIdentityToken];

  if (v6)
  {
    id v7 = +[NSUserDefaults standardUserDefaults];
    uint64_t v8 = [(IMUbiquityStatusMonitor *)self currentUbiquityIdentityToken];
    char v9 = [v8 token];
    [v7 setObject:v9 forKey:@"nonNilUbiquityIdentityToken"];
  }
  id v10 = +[NSUserDefaults standardUserDefaults];
  [v10 synchronize];
}

- (void)p_ubiquityIdentityDidChange:(id)a3
{
  uint64_t v4 = [(IMUbiquityStatusMonitor *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_51DF8;
  block[3] = &unk_2C3C50;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)_notifyObserversForChangesWithCurrentToken:(id)a3 lastToken:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = [(IMUbiquityStatusMonitor *)self observers];
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      __int16 v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          __int16 v13 = [(IMUbiquityStatusMonitor *)self notifyQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_52228;
          block[3] = &unk_2C48E0;
          id v22 = v16;
          id v23 = v6;
          uint64_t v24 = v12;
          dispatch_async(v13, block);
        }
        __int16 v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  CFStringRef v14 = [(IMUbiquityStatusMonitor *)self coordinatingObserver];
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = [(IMUbiquityStatusMonitor *)self notifyQueue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_522E8;
    v17[3] = &unk_2C48E0;
    id v18 = v16;
    id v19 = v6;
    id v20 = v14;
    dispatch_async(v15, v17);
  }
}

- (void)_notifyObserversForUnchangedWithCurrentToken:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [(IMUbiquityStatusMonitor *)self observers];
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          __int16 v11 = [(IMUbiquityStatusMonitor *)self notifyQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_525FC;
          block[3] = &unk_2C3AF8;
          id v18 = v4;
          uint64_t v19 = v10;
          dispatch_async(v11, block);
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [(IMUbiquityStatusMonitor *)self coordinatingObserver];
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    __int16 v13 = [(IMUbiquityStatusMonitor *)self notifyQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_526AC;
    v14[3] = &unk_2C3AF8;
    id v15 = v4;
    id v16 = v12;
    dispatch_async(v13, v14);
  }
}

- (void)dq_refreshUbiquityAvailabilityStatus
{
  +[BCSyncUserDefaults syncDefaultsWithTCC];
  BOOL v3 = +[BCICloudIdentityToken tokenForCurrentIdentityIfICloudDriveEnabled];
  currentUbiquityIdentityToken = self->_currentUbiquityIdentityToken;
  self->_currentUbiquityIdentityToken = v3;

  uint64_t v5 = [BCICloudIdentityToken alloc];
  id v6 = +[NSUserDefaults standardUserDefaults];
  id v7 = [v6 valueForKey:@"ubiquityIdentityToken"];
  uint64_t v8 = [(BCICloudIdentityToken *)v5 initFromArchive:v7];
  lastArchivedUbiquityIdentityToken = self->_lastArchivedUbiquityIdentityToken;
  self->_lastArchivedUbiquityIdentityToken = v8;

  uint64_t v10 = BCUbiquityEnabledLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v16 = [(IMUbiquityStatusMonitor *)self containerIdentifier];
    v17 = self->_currentUbiquityIdentityToken;
    id v18 = self->_lastArchivedUbiquityIdentityToken;
    *(_DWORD *)buf = 138412802;
    long long v22 = v16;
    __int16 v23 = 2112;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    long long v26 = v18;
    _os_log_debug_impl(&def_7D91C, v10, OS_LOG_TYPE_DEBUG, "BCUbiquityStatusMonitor: dq_refreshUbiquityAvailabilityStatus container:%@ current::%@ oldToken:%@", buf, 0x20u);
  }
  __int16 v11 = self->_currentUbiquityIdentityToken;
  uint64_t v12 = [(IMUbiquityStatusMonitor *)self containerQueue];
  __int16 v13 = v12;
  if (v11)
  {
    CFStringRef v14 = v20;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    id v15 = sub_52960;
  }
  else
  {
    CFStringRef v14 = v19;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    id v15 = sub_52FE0;
  }
  v14[2] = v15;
  v14[3] = &unk_2C3C50;
  void v14[4] = self;
  dispatch_async(v12, v14);
}

- (NSURL)containerURL
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_511D4;
  __int16 v11 = sub_511E4;
  id v12 = 0;
  BOOL v3 = [(IMUbiquityStatusMonitor *)self containerQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_53188;
  v6[3] = &unk_2C39F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSURL *)v4;
}

- (NSURL)documentsURL
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_511D4;
  __int16 v11 = sub_511E4;
  id v12 = 0;
  BOOL v3 = [(IMUbiquityStatusMonitor *)self containerQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_532B8;
  v6[3] = &unk_2C39F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSURL *)v4;
}

- (id)description
{
  BOOL v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  if ([(IMUbiquityStatusMonitor *)self isICloudDriveEnabled]) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  id v6 = [(IMUbiquityStatusMonitor *)self containerURL];
  uint64_t v7 = [(IMUbiquityStatusMonitor *)self documentsURL];
  uint64_t v8 = +[NSString stringWithFormat:@"<%@(%p) iCloudDrive=%@ containerURL='%@' documentsURL='%@'", v4, self, v5, v6, v7];

  return v8;
}

- (id)makeOSStateHandler
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc((Class)BUOSStateHandler);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_53494;
  v5[3] = &unk_2C5918;
  objc_copyWeak(&v6, &location);
  id v3 = [v2 initWithTitle:@"BCUbiquityStatusMonitor" block:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (id)_stateForLog
{
  CFStringRef v8 = @"ubiquityIdentityToken";
  id v2 = [(IMUbiquityStatusMonitor *)self ubiquityIdentityToken];
  uint64_t v3 = [v2 token];
  id v4 = (void *)v3;
  CFStringRef v5 = &stru_2CE418;
  if (v3) {
    CFStringRef v5 = (const __CFString *)v3;
  }
  CFStringRef v9 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  return v6;
}

- (void)setContainerURL:(id)a3
{
}

- (void)setDocumentsURL:(id)a3
{
}

- (BCICloudIdentityToken)lastArchivedUbiquityIdentityToken
{
  return self->_lastArchivedUbiquityIdentityToken;
}

- (void)setLastArchivedUbiquityIdentityToken:(id)a3
{
}

- (BCICloudIdentityToken)lastArchivedNonNilUbiquityIdentityToken
{
  return self->_lastArchivedNonNilUbiquityIdentityToken;
}

- (void)setLastArchivedNonNilUbiquityIdentityToken:(id)a3
{
}

- (BCICloudIdentityToken)currentUbiquityIdentityToken
{
  return self->_currentUbiquityIdentityToken;
}

- (void)setCurrentUbiquityIdentityToken:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (BOOL)archivedCloudDriveOptedIn
{
  return self->_archivedCloudDriveOptedIn;
}

- (void)setArchivedCloudDriveOptedIn:(BOOL)a3
{
  self->_archivedCloudDriveOptedIn = a3;
}

- (BOOL)lastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch
{
  return self->_lastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch;
}

- (void)setLastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch:(BOOL)a3
{
  self->_lastArchivedNonNilUbiquityIdentityTokenWasNonNilAtColdLaunch = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)containerQueue
{
  return self->_containerQueue;
}

- (void)setContainerQueue:(id)a3
{
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (IMUbiquityStatusChangeObserving)coordinatingObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinatingObserver);

  return (IMUbiquityStatusChangeObserving *)WeakRetained;
}

- (void)setCoordinatingObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinatingObserver);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_containerQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_currentUbiquityIdentityToken, 0);
  objc_storeStrong((id *)&self->_lastArchivedNonNilUbiquityIdentityToken, 0);
  objc_storeStrong((id *)&self->_lastArchivedUbiquityIdentityToken, 0);
  objc_storeStrong((id *)&self->_documentsURL, 0);

  objc_storeStrong((id *)&self->_containerURL, 0);
}

@end