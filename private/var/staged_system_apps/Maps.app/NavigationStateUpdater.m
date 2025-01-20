@interface NavigationStateUpdater
+ (int64_t)creationPreference;
- (DirectionsPlan)directionPlan;
- (NavigationSession)navigationSession;
- (NavigationStateUpdater)initWithPlatformController:(id)a3;
- (PlatformController)platformController;
- (void)_saveDirectionPlan;
- (void)dealloc;
- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationWaypointController:(id)a3 didUpdateDisplayedWaypoints:(id)a4;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)setDirectionPlan:(id)a3;
- (void)setNavigationSession:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)updateMapsActivityWithStack:(id)a3;
@end

@implementation NavigationStateUpdater

- (NavigationStateUpdater)initWithPlatformController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NavigationStateUpdater;
  v5 = [(NavigationStateUpdater *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_platformController, v4);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.Maps.NavigationStateUpdater", 0);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v7;

    v9 = +[MNNavigationService sharedService];
    [v9 registerObserver:v6];
  }
  return v6;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)dealloc
{
  v3 = +[MNNavigationService sharedService];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NavigationStateUpdater;
  [(NavigationStateUpdater *)&v4 dealloc];
}

- (void)updateMapsActivityWithStack:(id)a3
{
  id v4 = a3;
  v5 = sub_100084D38();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    dispatch_queue_t v7 = v6;
    if (v6)
    {
      if ([v6 count])
      {
        v8 = [v7 componentsJoinedByString:@", "];
        v9 = +[NSString stringWithFormat:@"<%p> [%@]", v7, v8];
      }
      else
      {
        v9 = +[NSString stringWithFormat:@"<%p> (empty)", v7];
      }
    }
    else
    {
      v9 = @"<nil>";
    }

    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[EP] updateMapsActivityWithStack: %{public}@", buf, 0xCu);
  }
  v10 = [(NavigationStateUpdater *)self navigationSession];
  if (v10)
  {
    objc_super v11 = [(NavigationStateUpdater *)self navigationSession];
    id v12 = [v11 guidanceType];

    if (v12 == (id)2 || ![v4 count])
    {
      v10 = 0;
    }
    else
    {
      v13 = sub_10050D1A0(v4, 0xFFFFFFFLL);
      v10 = [v13 buildDirectionsPlan];
    }
  }
  [(NavigationStateUpdater *)self setDirectionPlan:v10];
  [(NavigationStateUpdater *)self _saveDirectionPlan];
}

- (void)_saveDirectionPlan
{
  v3 = [(NavigationStateUpdater *)self directionPlan];
  id v4 = [v3 copy];

  v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = v5;
  if (v4)
  {
    [v5 setBool:0 forKey:@"NavigationUserActivityPendingDeletion"];

    dispatch_queue_t v7 = sub_100084D38();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "_saveDirectionPlan: plan is not marked for deletion";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
    }
  }
  else
  {
    [v5 setBool:1 forKey:@"NavigationUserActivityPendingDeletion"];

    dispatch_queue_t v7 = sub_100084D38();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "_saveDirectionPlan: plan is marked for deletion";
      goto LABEL_6;
    }
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009ADAF8;
  block[3] = &unk_1012E5D08;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(workQueue, block);
}

- (void)setNavigationSession:(id)a3
{
  v5 = (NavigationSession *)a3;
  navigationSession = self->_navigationSession;
  if (navigationSession != v5)
  {
    v9 = v5;
    dispatch_queue_t v7 = [(NavigationSession *)navigationSession waypointController];
    [v7 unregisterObserver:self];

    [(NavigationSession *)self->_navigationSession removeObserver:self];
    objc_storeStrong((id *)&self->_navigationSession, a3);
    [(NavigationSession *)self->_navigationSession addObserver:self];
    v8 = [(NavigationSession *)self->_navigationSession waypointController];
    [v8 registerObserver:self];

    v5 = v9;
  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v11 = a5;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v11;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  [(NavigationStateUpdater *)self setNavigationSession:v9];

  id v10 = [v7 sessionStack];

  [(NavigationStateUpdater *)self updateMapsActivityWithStack:v10];
}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(NavigationStateUpdater *)self navigationSession];

  if (v7 == v6)
  {
    v8 = sub_100084D38();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = @"NotStarted";
      if (a4 == 1) {
        CFStringRef v9 = @"Running";
      }
      if (a4 == 2) {
        CFStringRef v9 = @"Suspended";
      }
      int v11 = 138543362;
      CFStringRef v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[EP] mapsSession:didChangeState: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    if (a4 == 1)
    {
      id v10 = [(NavigationStateUpdater *)self directionPlan];
      [v10 setDisplayMethod:2];

      [(NavigationStateUpdater *)self _saveDirectionPlan];
    }
  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v8 = a3;
  if (a5 != a4)
  {
    id v12 = v8;
    char v9 = MNNavigationServiceStateChangedToNavigating();
    id v8 = v12;
    if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 4 && (v9 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
      int v11 = [WeakRetained sessionStack];
      [(NavigationStateUpdater *)self updateMapsActivityWithStack:v11];

      id v8 = v12;
    }
  }
}

- (void)navigationService:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v7 = +[MNNavigationService sharedService];
  id v8 = [v7 route];
  char v9 = [v8 legs];
  id v10 = (char *)[v9 count] - 1;

  if (v10 == (char *)a5)
  {
    [(NavigationStateUpdater *)self setDirectionPlan:0];
    [(NavigationStateUpdater *)self _saveDirectionPlan];
  }
}

- (void)navigationWaypointController:(id)a3 didUpdateDisplayedWaypoints:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  v5 = [WeakRetained sessionStack];
  [(NavigationStateUpdater *)self updateMapsActivityWithStack:v5];
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (DirectionsPlan)directionPlan
{
  return self->_directionPlan;
}

- (void)setDirectionPlan:(id)a3
{
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_directionPlan, 0);
  objc_storeStrong((id *)&self->_navigationSession, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end