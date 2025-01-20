@interface CSDVoIPApplicationMonitor
- (BKSApplicationStateMonitor)applicationStateMonitor;
- (BOOL)isRunningForegroundForVoIPApplication:(id)a3;
- (CSDVoIPApplicationMonitor)init;
- (NSMutableDictionary)bundleIdentifierToApplicationState;
- (id)applicationStateForBundleIdentifier:(id)a3;
- (id)fetchApplicationStateForBundleIdentifier:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (void)addVoIPApplication:(id)a3;
- (void)dealloc;
- (void)removeVoIPApplication:(id)a3;
- (void)setApplicationState:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation CSDVoIPApplicationMonitor

- (CSDVoIPApplicationMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSDVoIPApplicationMonitor;
  v2 = [(CSDVoIPApplicationMonitor *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bundleIdentifierToApplicationState = v3->_bundleIdentifierToApplicationState;
    v3->_bundleIdentifierToApplicationState = v4;

    v6 = (BKSApplicationStateMonitor *)[objc_alloc((Class)BKSApplicationStateMonitor) initWithBundleIDs:&__NSArray0__struct states:0];
    applicationStateMonitor = v3->_applicationStateMonitor;
    v3->_applicationStateMonitor = v6;

    objc_initWeak(&location, v3);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10016B2E8;
    v9[3] = &unk_1005070A8;
    objc_copyWeak(&v10, &location);
    [(BKSApplicationStateMonitor *)v3->_applicationStateMonitor setHandler:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  [(BKSApplicationStateMonitor *)self->_applicationStateMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSDVoIPApplicationMonitor;
  [(CSDVoIPApplicationMonitor *)&v3 dealloc];
}

- (BOOL)isRunningForegroundForVoIPApplication:(id)a3
{
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  if ([v5 length])
  {
    v6 = [(CSDVoIPApplicationMonitor *)self applicationStateForBundleIdentifier:v5];
    unsigned int v7 = [v6 unsignedIntValue];

    BOOL v8 = v7 == 8;
  }
  else
  {
    v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Could not obtain bundle identifier from VoIP application %@", (uint8_t *)&v11, 0xCu);
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (void)addVoIPApplication:(id)a3
{
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  if ([v5 length])
  {
    p_accessorLock = &self->_accessorLock;
    os_unfair_lock_lock(&self->_accessorLock);
    unsigned int v7 = [(CSDVoIPApplicationMonitor *)self bundleIdentifierToApplicationState];
    BOOL v8 = [v7 objectForKeyedSubscript:v5];

    if (!v8)
    {
      v9 = [(CSDVoIPApplicationMonitor *)self bundleIdentifierToApplicationState];
      id v10 = [v9 allKeys];
      int v11 = [v10 arrayByAddingObject:v5];

      id v12 = [(CSDVoIPApplicationMonitor *)self applicationStateMonitor];
      [v12 updateInterestedBundleIDs:v11 states:BKSApplicationStateAll];

      v13 = [(CSDVoIPApplicationMonitor *)self fetchApplicationStateForBundleIdentifier:v5];
      v14 = [(CSDVoIPApplicationMonitor *)self bundleIdentifierToApplicationState];
      [v14 setObject:v13 forKeyedSubscript:v5];
    }
    os_unfair_lock_unlock(p_accessorLock);
  }
  else
  {
    v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Could not obtain bundle identifier from VoIP application %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)removeVoIPApplication:(id)a3
{
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  if ([v5 length])
  {
    p_accessorLock = &self->_accessorLock;
    os_unfair_lock_lock(&self->_accessorLock);
    unsigned int v7 = [(CSDVoIPApplicationMonitor *)self bundleIdentifierToApplicationState];
    BOOL v8 = [v7 objectForKeyedSubscript:v5];

    if (v8)
    {
      v9 = [(CSDVoIPApplicationMonitor *)self bundleIdentifierToApplicationState];
      [v9 setObject:0 forKeyedSubscript:v5];

      id v10 = [(CSDVoIPApplicationMonitor *)self bundleIdentifierToApplicationState];
      int v11 = [v10 allKeys];

      if ([v11 count]) {
        uint64_t v12 = BKSApplicationStateAll;
      }
      else {
        uint64_t v12 = 0;
      }
      v13 = [(CSDVoIPApplicationMonitor *)self applicationStateMonitor];
      [v13 updateInterestedBundleIDs:v11 states:v12];
    }
    else
    {
      v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Could not obtain bundle identifier from VoIP application %@", (uint8_t *)&v15, 0xCu);
      }
    }
    os_unfair_lock_unlock(p_accessorLock);
  }
}

- (id)applicationStateForBundleIdentifier:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  v6 = [(CSDVoIPApplicationMonitor *)self bundleIdentifierToApplicationState];
  unsigned int v7 = [v6 objectForKeyedSubscript:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  os_unfair_lock_unlock(p_accessorLock);

  return v8;
}

- (void)setApplicationState:(id)a3 forBundleIdentifier:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v8 = [(CSDVoIPApplicationMonitor *)self bundleIdentifierToApplicationState];
  v9 = [v8 objectForKeyedSubscript:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  if ((TUNumbersAreEqualOrNil() & 1) == 0)
  {
    int v11 = [(CSDVoIPApplicationMonitor *)self bundleIdentifierToApplicationState];
    [v11 setObject:v12 forKeyedSubscript:v6];
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (id)fetchApplicationStateForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDVoIPApplicationMonitor *)self bundleIdentifierToApplicationState];
  id v6 = [v5 allKeys];
  unsigned int v7 = [v6 arrayByAddingObject:v4];

  id v8 = [(CSDVoIPApplicationMonitor *)self applicationStateMonitor];
  [v8 updateInterestedBundleIDs:v7 states:BKSApplicationStateAll];

  v9 = [(CSDVoIPApplicationMonitor *)self applicationStateMonitor];
  id v10 = [v9 applicationStateForApplication:v4];

  int v11 = +[NSNumber numberWithUnsignedInt:v10];

  return v11;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSMutableDictionary)bundleIdentifierToApplicationState
{
  return self->_bundleIdentifierToApplicationState;
}

- (BKSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);

  objc_storeStrong((id *)&self->_bundleIdentifierToApplicationState, 0);
}

@end