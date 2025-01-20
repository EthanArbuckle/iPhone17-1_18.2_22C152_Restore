@interface PALAppUninstallObserver
- (PALAppUninstallDelegateProtocol)delegate;
- (PALAppUninstallObserver)init;
- (void)_didReceiveApplicationUnregisteredNotification:(id)a3;
- (void)_handleNewUninstalledAppsWithBundleIDs:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation PALAppUninstallObserver

- (PALAppUninstallObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)PALAppUninstallObserver;
  v2 = [(PALAppUninstallObserver *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.PrivacyAccounting", "PALAppUninstallObserver");
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)startObserving
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_didReceiveApplicationUnregisteredNotification:" name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
  os_log_t v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 addObserver:self];
}

- (void)stopObserving
{
  os_log_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 removeObserver:self];
}

- (void)dealloc
{
  [(PALAppUninstallObserver *)self stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)PALAppUninstallObserver;
  [(PALAppUninstallObserver *)&v3 dealloc];
}

- (void)_handleNewUninstalledAppsWithBundleIDs:(id)a3
{
  id v22 = a3;
  id v4 = [(PALAppUninstallObserver *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    objc_super v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v22 count]);
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v7 = [v22 count];
    long long v28 = 0u;
    long long v29 = 0u;
    if ((unint64_t)v7 <= 0xA) {
      unint64_t v8 = 10;
    }
    else {
      unint64_t v8 = (unint64_t)v7;
    }
    long long v26 = 0uLL;
    long long v27 = 0uLL;
    id v9 = v22;
    id v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v27;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (-[NSMutableOrderedSet containsObject:](self->_lastUninstalledBundleIDs, "containsObject:", v13, lock))
          {
            logger = self->_logger;
            if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v31 = v13;
              _os_log_debug_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEBUG, "Deduplicated app uninstalled notification for bundleID: %{public}@", buf, 0xCu);
            }
            [(NSMutableOrderedSet *)self->_lastUninstalledBundleIDs removeObject:v13];
          }
          else
          {
            if ((unint64_t)[(NSMutableOrderedSet *)self->_lastUninstalledBundleIDs count] >= v8) {
              [(NSMutableOrderedSet *)self->_lastUninstalledBundleIDs removeObjectAtIndex:0];
            }
            lastUninstalledBundleIDs = self->_lastUninstalledBundleIDs;
            id v16 = [v13 copy];
            [(NSMutableOrderedSet *)lastUninstalledBundleIDs addObject:v16];

            v17 = +[PAApplication applicationWithBundleID:v13];
            [v6 addObject:v17];
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v10);
    }

    os_unfair_lock_unlock(lock);
    v18 = [(PALAppUninstallObserver *)self delegate];
    v19 = [v18 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005D80;
    block[3] = &unk_100018710;
    id v24 = v6;
    v25 = self;
    id v20 = v6;
    dispatch_async(v19, block);
  }
}

- (void)_didReceiveApplicationUnregisteredNotification:(id)a3
{
  id v4 = a3;
  char v5 = [v4 name];
  if (([v5 isEqualToString:@"com.apple.LaunchServices.applicationUnregistered"] & 1) == 0) {
    sub_100006198();
  }

  objc_super v6 = [v4 userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"bundleIDs"];
  logger = self->_logger;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_INFO, "Received applicationUnregisteredNotification for bundleIDs: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [(PALAppUninstallObserver *)self _handleNewUninstalledAppsWithBundleIDs:v7];
  }
  else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
  {
    sub_100006120((uint64_t)v6, logger);
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = [a3 valueForKey:@"bundleIdentifier"];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_INFO, "Received applicationsDidUninstall notification for bundleIDs: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(PALAppUninstallObserver *)self _handleNewUninstalledAppsWithBundleIDs:v4];
}

- (PALAppUninstallDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (PALAppUninstallDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_lastUninstalledBundleIDs, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

@end