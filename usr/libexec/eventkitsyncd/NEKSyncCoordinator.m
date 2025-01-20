@interface NEKSyncCoordinator
+ (id)receivedReunionSyncNotificationString;
+ (id)receivedStartSyncNotificationString;
- (BOOL)okToPerformDeltaSync;
- (NEKSyncCoordinator)initWithEnvironment:(id)a3;
- (PSYServiceSyncSession)session;
- (PSYSyncCoordinator)syncCoordinator;
- (id)environment;
- (void)setSession:(id)a3;
- (void)setSyncCoordinator:(id)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
@end

@implementation NEKSyncCoordinator

+ (id)receivedStartSyncNotificationString
{
  return @"com.apple.eventkitsync.recievedpairedsyncstart";
}

+ (id)receivedReunionSyncNotificationString
{
  return @"com.apple.eventkitsync.recievedreunionsyncstart";
}

- (NEKSyncCoordinator)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEKSyncCoordinator;
  v5 = [(NEKSyncCoordinator *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    uint64_t v7 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.eventkitsync"];
    syncCoordinator = v6->_syncCoordinator;
    v6->_syncCoordinator = (PSYSyncCoordinator *)v7;

    v6->_shadowLock._os_unfair_lock_opaque = 0;
    v6->_syncRestrictionShadow = (unint64_t)[(PSYSyncCoordinator *)v6->_syncCoordinator syncRestriction];
    [(PSYSyncCoordinator *)v6->_syncCoordinator setDelegate:v6];
    v9 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v6->_syncCoordinator;
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NEKSyncCoordinator initialized %@", buf, 0xCu);
    }
  }

  return v6;
}

- (id)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return WeakRetained;
}

- (BOOL)okToPerformDeltaSync
{
  p_shadowLock = &self->_shadowLock;
  os_unfair_lock_lock(&self->_shadowLock);
  unint64_t syncRestrictionShadow = self->_syncRestrictionShadow;
  os_unfair_lock_unlock(p_shadowLock);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"internal_ignorePairedSync", @"com.apple.EventKitSync", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v6 = AppBooleanValue == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6 || syncRestrictionShadow == 0;
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136446722;
    v17 = "NEKSyncCoordinator.m";
    __int16 v18 = 1024;
    int v19 = 98;
    __int16 v20 = 2080;
    v21 = "-[NEKSyncCoordinator syncCoordinator:beginSyncSession:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", (uint8_t *)&v16, 0x1Cu);
  }
  [(NEKSyncCoordinator *)self setSession:v7];
  v9 = [(NEKSyncCoordinator *)self session];
  id v10 = [v9 syncSessionType];

  if (!v10)
  {
    v13 = +[NSNotificationCenter defaultCenter];
    uint64_t v14 = [(id)objc_opt_class() receivedStartSyncNotificationString];
    goto LABEL_7;
  }
  v11 = [(NEKSyncCoordinator *)self session];
  id v12 = [v11 syncSessionType];

  if (v12 == (id)1)
  {
    v13 = +[NSNotificationCenter defaultCenter];
    uint64_t v14 = [(id)objc_opt_class() receivedReunionSyncNotificationString];
LABEL_7:
    v15 = (void *)v14;
    [v13 postNotificationName:v14 object:self];
  }
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    id v7 = "NEKSyncCoordinator.m";
    __int16 v8 = 1024;
    int v9 = 109;
    __int16 v10 = 2080;
    v11 = "-[NEKSyncCoordinator syncCoordinator:didInvalidateSyncSession:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", (uint8_t *)&v6, 0x1Cu);
  }
  [(NEKSyncCoordinator *)self setSession:0];
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  p_shadowLock = &self->_shadowLock;
  id v5 = a3;
  os_unfair_lock_lock(p_shadowLock);
  id v6 = [v5 syncRestriction];

  self->_unint64_t syncRestrictionShadow = (unint64_t)v6;
  id v7 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_syncRestrictionShadow) {
      __int16 v8 = "LimitPush";
    }
    else {
      __int16 v8 = "None";
    }
    int v9 = 136446210;
    __int16 v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Restriction is now %{public}s", (uint8_t *)&v9, 0xCu);
  }
  os_unfair_lock_unlock(p_shadowLock);
}

- (PSYServiceSyncSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (PSYSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (void)setSyncCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end