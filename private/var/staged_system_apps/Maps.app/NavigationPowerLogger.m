@interface NavigationPowerLogger
- (BOOL)displayingNavOnLockScreen;
- (NavigationPowerLogger)init;
- (id)_currentNavStateDictionary;
- (id)_powerLogLightLevelValue;
- (id)_powerLogNavAppStateValue;
- (id)_powerLogNavTransportTypeValue;
- (unint64_t)mapType;
- (void)_logCurrentNavState:(BOOL)a3;
- (void)_logCurrentNavStateIfNeeded;
- (void)_navigationEnded;
- (void)_navigationStarted;
- (void)_resetLogEvent;
- (void)dealloc;
- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)screenLayoutDidChangeWithReason:(unint64_t)a3;
- (void)setDisplayingNavOnLockScreen:(BOOL)a3;
- (void)setMapType:(unint64_t)a3;
- (void)startLogging;
- (void)stopLogging;
@end

@implementation NavigationPowerLogger

- (NavigationPowerLogger)init
{
  v8.receiver = self;
  v8.super_class = (Class)NavigationPowerLogger;
  v2 = [(NavigationPowerLogger *)&v8 init];
  if (v2)
  {
    v3 = +[MNNavigationService sharedService];
    [v3 registerObserver:v2];

    v4 = +[MapsScreenLayoutMonitor sharedMonitor];
    [v4 startMonitoringWithObserver:v2];

    v5 = +[MNNavigationService sharedService];
    unsigned int v6 = [v5 isInNavigatingState];

    if (v6) {
      [(NavigationPowerLogger *)v2 _navigationStarted];
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[MNNavigationService sharedService];
  [v3 unregisterObserver:self];

  v4 = +[MapsScreenLayoutMonitor sharedMonitor];
  [v4 stopMonitoringWithObserver:self];

  if (self->_trackedState) {
    [(NavigationPowerLogger *)self _logCurrentNavState:1];
  }
  v5.receiver = self;
  v5.super_class = (Class)NavigationPowerLogger;
  [(NavigationPowerLogger *)&v5 dealloc];
}

- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4
{
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (MNNavigationServiceStateChangedToNavigating())
  {
    [(NavigationPowerLogger *)self _navigationStarted];
  }
  else if (!a5)
  {
    [(NavigationPowerLogger *)self _navigationEnded];
  }
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
}

- (void)setDisplayingNavOnLockScreen:(BOOL)a3
{
  if (self->_displayingNavOnLockScreen != a3)
  {
    self->_displayingNavOnLockScreen = a3;
    [(NavigationPowerLogger *)self _logCurrentNavStateIfNeeded];
  }
}

- (void)setMapType:(unint64_t)a3
{
  if (self->_mapType != a3)
  {
    self->_mapType = a3;
    [(NavigationPowerLogger *)self _logCurrentNavStateIfNeeded];
  }
}

- (void)startLogging
{
  if (!self->_shouldLog)
  {
    self->_shouldLog = 1;
    [(NavigationPowerLogger *)self _logCurrentNavStateIfNeeded];
  }
}

- (void)stopLogging
{
  if (self->_shouldLog)
  {
    [(NavigationPowerLogger *)self _logCurrentNavState:1];
    [(NavigationPowerLogger *)self _resetLogEvent];
    self->_shouldLog = 0;
  }
}

- (void)_navigationStarted
{
  [(NavigationPowerLogger *)self _resetLogEvent];
  v3 = +[MapsScreenLayoutMonitor sharedMonitor];
  self->_screenIsLocked = [v3 isLocked];

  [(NavigationPowerLogger *)self _logCurrentNavState:1];
  id v4 = +[MapsScreenLayoutMonitor sharedMonitor];
  [v4 startMonitoringWithObserver:self];
}

- (void)_navigationEnded
{
  v3 = +[MapsScreenLayoutMonitor sharedMonitor];
  [v3 stopMonitoringWithObserver:self];

  [(NavigationPowerLogger *)self _logCurrentNavState:1];

  [(NavigationPowerLogger *)self _resetLogEvent];
}

- (void)_logCurrentNavStateIfNeeded
{
}

- (void)_resetLogEvent
{
  trackedState = self->_trackedState;
  self->_trackedState = 0;

  eventStartDate = self->_eventStartDate;
  self->_eventStartDate = 0;
}

- (void)_logCurrentNavState:(BOOL)a3
{
  if (self->_shouldLog)
  {
    uint64_t v5 = [(NavigationPowerLogger *)self _currentNavStateDictionary];
    id obj = (id)v5;
    if (a3
      || (unsigned __int8 v7 = [(NSDictionary *)self->_trackedState isEqualToDictionary:v5],
          unsigned int v6 = obj,
          (v7 & 1) == 0))
    {
      objc_super v8 = +[NSDate date];
      p_trackedState = &self->_trackedState;
      if (self->_trackedState)
      {
        v10 = (__CFString *)[obj mutableCopy];
        [(NSDate *)self->_eventStartDate timeIntervalSince1970];
        v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(__CFString *)v10 setObject:v11 forKeyedSubscript:@"StartUnix"];

        [(NSDate *)v8 timeIntervalSince1970];
        v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(__CFString *)v10 setObject:v12 forKeyedSubscript:@"EndUnix"];

        CFRetain(@"MapsNavigationStateEvent");
        if (v10)
        {
          CFRetain(v10);
          PLLogRegisteredEvent();
          CFRelease(@"MapsNavigationStateEvent");
          CFStringRef v13 = v10;
        }
        else
        {
          CFStringRef v13 = @"MapsNavigationStateEvent";
          PLLogRegisteredEvent();
        }
        CFRelease(v13);
      }
      eventStartDate = self->_eventStartDate;
      self->_eventStartDate = v8;
      v15 = v8;

      objc_storeStrong((id *)p_trackedState, obj);
      unsigned int v6 = obj;
    }
  }
}

- (id)_currentNavStateDictionary
{
  v9[0] = @"NavigationType";
  v3 = [(NavigationPowerLogger *)self _powerLogNavTransportTypeValue];
  v10[0] = v3;
  v9[1] = @"NavigationAppState";
  id v4 = [(NavigationPowerLogger *)self _powerLogNavAppStateValue];
  v10[1] = v4;
  v9[2] = @"NightMode";
  uint64_t v5 = [(NavigationPowerLogger *)self _powerLogLightLevelValue];
  v10[2] = v5;
  v9[3] = @"NavigationMapType";
  unsigned int v6 = +[NSNumber numberWithUnsignedInteger:[(NavigationPowerLogger *)self mapType]];
  v10[3] = v6;
  unsigned __int8 v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (id)_powerLogNavAppStateValue
{
  if ([(NavigationPowerLogger *)self displayingNavOnLockScreen] && self->_screenIsLocked) {
    return &off_1013A7480;
  }
  id v4 = +[MKApplicationStateMonitor sharedInstance];
  if ([v4 isInBackground]) {
    v3 = &off_1013A7498;
  }
  else {
    v3 = &off_1013A74B0;
  }

  return v3;
}

- (id)_powerLogNavTransportTypeValue
{
  v2 = +[MNNavigationService sharedService];
  unsigned int v3 = [v2 navigationTransportType];

  if (v3 > 6) {
    return &off_1013A74B0;
  }
  else {
    return (&off_1012ED8B8)[v3];
  }
}

- (id)_powerLogLightLevelValue
{
  v2 = +[MapsLightLevelController sharedController];
  if ([v2 shouldUseNightMode]) {
    unsigned int v3 = &off_1013A74B0;
  }
  else {
    unsigned int v3 = &off_1013A74E0;
  }
  id v4 = v3;

  return v4;
}

- (void)screenLayoutDidChangeWithReason:(unint64_t)a3
{
  id v4 = +[MapsScreenLayoutMonitor sharedMonitor];
  unsigned int v5 = [v4 isLocked];

  if (self->_screenIsLocked != v5)
  {
    self->_screenIsLocked = v5;
    [(NavigationPowerLogger *)self _logCurrentNavStateIfNeeded];
  }
}

- (BOOL)displayingNavOnLockScreen
{
  return self->_displayingNavOnLockScreen;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedState, 0);

  objc_storeStrong((id *)&self->_eventStartDate, 0);
}

@end