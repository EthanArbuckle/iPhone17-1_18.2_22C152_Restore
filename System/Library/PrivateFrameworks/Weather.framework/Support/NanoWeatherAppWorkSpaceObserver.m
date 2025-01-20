@interface NanoWeatherAppWorkSpaceObserver
+ (id)sharedWorkspaceObserver;
- (LSApplicationWorkspace)defaultAppWorkspace;
- (NanoWeatherAppWorkSpaceObserver)init;
- (NanoWeatherAppWorkSpaceObserverDelegate)delegate;
- (id)_weatherApplicationProxyFromProxies:(id)a3;
- (void)_weatherApplicationStateDidChange:(unint64_t)a3 forApplicationProxies:(id)a4;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)setDefaultAppWorkspace:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startObservingAppInstallation;
- (void)stopObservingAppInstallation;
@end

@implementation NanoWeatherAppWorkSpaceObserver

+ (id)sharedWorkspaceObserver
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002630;
  block[3] = &unk_10000C458;
  block[4] = a1;
  if (qword_100011898 != -1) {
    dispatch_once(&qword_100011898, block);
  }
  v2 = (void *)qword_100011890;
  return v2;
}

- (NanoWeatherAppWorkSpaceObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)NanoWeatherAppWorkSpaceObserver;
  v2 = [(NanoWeatherAppWorkSpaceObserver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[LSApplicationWorkspace defaultWorkspace];
    defaultAppWorkspace = v2->_defaultAppWorkspace;
    v2->_defaultAppWorkspace = (LSApplicationWorkspace *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(NanoWeatherAppWorkSpaceObserver *)self stopObservingAppInstallation];
  v3.receiver = self;
  v3.super_class = (Class)NanoWeatherAppWorkSpaceObserver;
  [(NanoWeatherAppWorkSpaceObserver *)&v3 dealloc];
}

- (id)_weatherApplicationProxyFromProxies:(id)a3
{
  id v3 = a3;
  id v4 = [v3 indexOfObjectPassingTest:&stru_10000C498];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v3 objectAtIndexedSubscript:v4];
  }

  return v5;
}

- (void)_weatherApplicationStateDidChange:(unint64_t)a3 forApplicationProxies:(id)a4
{
  id v6 = a4;
  v7 = [(NanoWeatherAppWorkSpaceObserver *)self delegate];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000288C;
  v9[3] = &unk_10000C4E8;
  v9[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [v7 performBlockAsXPCXaction:v9];
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)startObservingAppInstallation
{
  id v3 = sub_100002174(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Start observing for Weather App installation", v5, 2u);
  }

  id v4 = [(NanoWeatherAppWorkSpaceObserver *)self defaultAppWorkspace];
  [v4 addObserver:self];
}

- (void)stopObservingAppInstallation
{
  id v3 = sub_100002174(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Stop observing for Weather App installation", v5, 2u);
  }

  id v4 = [(NanoWeatherAppWorkSpaceObserver *)self defaultAppWorkspace];
  [v4 removeObserver:self];
}

- (NanoWeatherAppWorkSpaceObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NanoWeatherAppWorkSpaceObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (LSApplicationWorkspace)defaultAppWorkspace
{
  return self->_defaultAppWorkspace;
}

- (void)setDefaultAppWorkspace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAppWorkspace, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end