@interface GKApplicationStateMonitor
- (BOOL)startObservingStateChangesForBundleID:(id)a3;
- (GKApplicationStateMonitor)init;
- (LSApplicationWorkspaceObserverProtocol)delegate;
- (NSMutableSet)interestedBundleIDs;
- (RBSProcessMonitor)processMonitor;
- (id)handler;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setHandler:(id)a3;
- (void)setInterestedBundleIDs:(id)a3;
- (void)setProcessMonitor:(id)a3;
- (void)startObservingApplicationWorkspaceChanges;
- (void)stopObservingStateChangesForBundleID:(id)a3;
- (void)updateStateObservation;
@end

@implementation GKApplicationStateMonitor

- (BOOL)startObservingStateChangesForBundleID:(id)a3
{
  id v4 = a3;
  v5 = [(GKApplicationStateMonitor *)self interestedBundleIDs];
  unsigned __int8 v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    v7 = [(GKApplicationStateMonitor *)self interestedBundleIDs];
    [v7 addObject:v4];

    [(GKApplicationStateMonitor *)self updateStateObservation];
  }

  return v6 ^ 1;
}

- (NSMutableSet)interestedBundleIDs
{
  return self->_interestedBundleIDs;
}

- (void)updateStateObservation
{
  objc_initWeak(&location, self);
  v3 = [(GKApplicationStateMonitor *)self processMonitor];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000AF00;
  v4[3] = &unk_1002DB510;
  objc_copyWeak(&v5, &location);
  [v3 updateConfiguration:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (GKApplicationStateMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKApplicationStateMonitor;
  v2 = [(GKApplicationStateMonitor *)&v6 init];
  if (v2)
  {
    v3 = +[RBSProcessMonitor monitor];
    [(GKApplicationStateMonitor *)v2 setProcessMonitor:v3];

    id v4 = +[NSMutableSet set];
    [(GKApplicationStateMonitor *)v2 setInterestedBundleIDs:v4];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKApplicationStateMonitor;
  [(GKApplicationStateMonitor *)&v4 dealloc];
}

- (void)setHandler:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  id handler = self->_handler;
  self->_id handler = v5;

  objc_initWeak(&location, self);
  v7 = [(GKApplicationStateMonitor *)self processMonitor];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011974C;
  v8[3] = &unk_1002DB510;
  objc_copyWeak(&v9, &location);
  [v7 updateConfiguration:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)stopObservingStateChangesForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(GKApplicationStateMonitor *)self interestedBundleIDs];
  [v5 removeObject:v4];

  [(GKApplicationStateMonitor *)self updateStateObservation];
}

- (void)startObservingApplicationWorkspaceChanges
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[GKApplicationStateMonitor startObservingApplicationWorkspaceChanges]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }
  id v5 = +[LSApplicationWorkspace defaultWorkspace];
  [v5 addObserver:self];
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  int v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    v11 = "-[GKApplicationStateMonitor applicationsDidUninstall:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v10, 0x16u);
  }
  v7 = [(GKApplicationStateMonitor *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(GKApplicationStateMonitor *)self delegate];
    [v9 applicationsDidUninstall:v4];
  }
}

- (void)applicationsWillUninstall:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  int v6 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    v11 = "-[GKApplicationStateMonitor applicationsWillUninstall:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v10, 0x16u);
  }
  v7 = [(GKApplicationStateMonitor *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(GKApplicationStateMonitor *)self delegate];
    [v9 applicationsWillUninstall:v4];
  }
}

- (id)handler
{
  return self->_handler;
}

- (LSApplicationWorkspaceObserverProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LSApplicationWorkspaceObserverProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setProcessMonitor:(id)a3
{
}

- (void)setInterestedBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestedBundleIDs, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong(&self->_handler, 0);
}

@end