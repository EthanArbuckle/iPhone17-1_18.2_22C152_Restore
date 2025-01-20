@interface RPApplicationStateMonitor
- (BKSApplicationStateMonitor)applicationStateMonitor;
- (BOOL)isApplicationInForegroundWithBundleIdentifier:(id)a3;
- (NSMutableDictionary)observers;
- (NSMutableDictionary)previousState;
- (RPApplicationStateMonitor)init;
- (RPSystemStateObserver)systemObserver;
- (int64_t)observersCount;
- (void)addObserver:(id)a3 processIdentifier:(int)a4;
- (void)addSystemObserver:(id)a3;
- (void)applicationStateDidChange:(id)a3;
- (void)handleApplicationStateChange:(id)a3;
- (void)notifyInAppSessionShouldPauseOrResume:(id)a3;
- (void)observersCountDidChange;
- (void)removeObserverWithProcessIdentifier:(int)a3;
- (void)removeSystemObserver;
- (void)setApplicationStateMonitor:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPreviousState:(id)a3;
- (void)setSystemObserver:(id)a3;
@end

@implementation RPApplicationStateMonitor

- (RPApplicationStateMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)RPApplicationStateMonitor;
  v2 = [(RPApplicationStateMonitor *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)BKSApplicationStateMonitor);
    [(RPApplicationStateMonitor *)v2 setApplicationStateMonitor:v3];

    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [(RPApplicationStateMonitor *)v2 setObservers:v4];

    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [(RPApplicationStateMonitor *)v2 setPreviousState:v5];

    [(RPApplicationStateMonitor *)v2 setSystemObserver:0];
  }
  return v2;
}

- (void)addObserver:(id)a3 processIdentifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  objc_super v7 = [(RPApplicationStateMonitor *)self observers];
  v8 = +[NSNumber numberWithInt:v4];
  [v7 setObject:v6 forKey:v8];

  v9 = [(RPApplicationStateMonitor *)self applicationStateMonitor];
  id v17 = [v9 applicationInfoForPID:v4];

  uint64_t v10 = BKSApplicationStateKey;
  v11 = [v17 objectForKeyedSubscript:BKSApplicationStateKey];
  v12 = [(RPApplicationStateMonitor *)self previousState];
  v13 = +[NSNumber numberWithInt:v4];
  [v12 setObject:v11 forKeyedSubscript:v13];

  v14 = [(RPApplicationStateMonitor *)self previousState];
  NSLog(@"%s processIdentifier %i userInfo %@ previousState %@", "-[RPApplicationStateMonitor addObserver:processIdentifier:]", v4, v17, v14);

  v15 = [v17 objectForKeyedSubscript:v10];
  v16 = [(RPApplicationStateMonitor *)self previousState];
  NSLog(@"%s processIdentifier %i BKSApplicationStateKey %@ previousState %@", "-[RPApplicationStateMonitor addObserver:processIdentifier:]", v4, v15, v16);

  [(RPApplicationStateMonitor *)self observersCountDidChange];
}

- (void)removeObserverWithProcessIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(RPApplicationStateMonitor *)self observers];
  id v6 = +[NSNumber numberWithInt:v3];
  [v5 removeObjectForKey:v6];

  [(RPApplicationStateMonitor *)self observersCountDidChange];
}

- (void)addSystemObserver:(id)a3
{
  [(RPApplicationStateMonitor *)self setSystemObserver:a3];

  [(RPApplicationStateMonitor *)self observersCountDidChange];
}

- (void)removeSystemObserver
{
  [(RPApplicationStateMonitor *)self setSystemObserver:0];

  [(RPApplicationStateMonitor *)self observersCountDidChange];
}

- (int64_t)observersCount
{
  uint64_t v3 = [(RPApplicationStateMonitor *)self observers];
  id v4 = [v3 count];
  id v5 = [(RPApplicationStateMonitor *)self systemObserver];
  if (v5) {
    int64_t v6 = (int64_t)v4 + 1;
  }
  else {
    int64_t v6 = (int64_t)v4;
  }

  return v6;
}

- (void)observersCountDidChange
{
  if ([(RPApplicationStateMonitor *)self observersCount] >= 1)
  {
    uint64_t v3 = [(RPApplicationStateMonitor *)self applicationStateMonitor];
    id v4 = [v3 handler];

    if (!v4)
    {
      objc_initWeak(&location, self);
      id v5 = [(RPApplicationStateMonitor *)self applicationStateMonitor];
      uint64_t v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472;
      v12 = sub_100019A78;
      v13 = &unk_100085628;
      objc_copyWeak(&v14, &location);
      [v5 setHandler:&v10];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  int64_t v6 = [(RPApplicationStateMonitor *)self applicationStateMonitor];
  uint64_t v7 = [v6 handler];
  if (v7)
  {
    v8 = (void *)v7;
    int64_t v9 = [(RPApplicationStateMonitor *)self observersCount];

    if (v9) {
      return;
    }
    int64_t v6 = [(RPApplicationStateMonitor *)self applicationStateMonitor];
    [v6 setHandler:0];
  }
}

- (void)applicationStateDidChange:(id)a3
{
  id v8 = a3;
  id v4 = [(RPApplicationStateMonitor *)self previousState];
  NSLog(@"%s userInfo %@ previousState %@", "-[RPApplicationStateMonitor applicationStateDidChange:]", v8, v4);

  id v5 = [(RPApplicationStateMonitor *)self systemObserver];

  if (v5) {
    [(RPApplicationStateMonitor *)self handleApplicationStateChange:v8];
  }
  int64_t v6 = [(RPApplicationStateMonitor *)self observers];
  id v7 = [v6 count];

  if (v7) {
    [(RPApplicationStateMonitor *)self notifyInAppSessionShouldPauseOrResume:v8];
  }
}

- (void)handleApplicationStateChange:(id)a3
{
  id v10 = a3;
  id v4 = [v10 objectForKeyedSubscript:BKSApplicationStateAppIsFrontmostKey];
  unsigned int v5 = [v4 BOOLValue];

  int64_t v6 = v10;
  if (v5)
  {
    id v7 = [v10 objectForKeyedSubscript:BKSApplicationStateDisplayIDKey];
    id v8 = (void *)SBSCopyFrontmostApplicationDisplayIdentifier();
    if ([v7 isEqualToString:v8])
    {
      int64_t v9 = [(RPApplicationStateMonitor *)self systemObserver];
      [v9 frontmostApplicationDidChange:v7];
    }
    int64_t v6 = v10;
  }
}

- (void)notifyInAppSessionShouldPauseOrResume:(id)a3
{
  id v16 = a3;
  id v4 = [v16 objectForKeyedSubscript:BKSApplicationStateProcessIDKey];
  unsigned int v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 integerValue]);

  int64_t v6 = [(RPApplicationStateMonitor *)self observers];
  id v7 = [v6 objectForKeyedSubscript:v5];

  NSLog(@"%s processIdentifer %@ observer nonnil %i", "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]", v5, v7 != 0);
  if (v7)
  {
    id v8 = [v16 objectForKeyedSubscript:BKSApplicationStateKey];
    id v9 = [v8 unsignedIntValue];

    id v10 = [(RPApplicationStateMonitor *)self previousState];
    uint64_t v11 = [v10 objectForKeyedSubscript:v5];
    id v12 = [v11 unsignedIntValue];

    NSLog(@"%s state %i previousState %i", "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]", v9, v12);
    if (v9 == 8)
    {
      if (v12 != 8)
      {
        NSLog(@"%s calling clientApplicationDidEnterForeground", "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]");
        [v7 clientApplicationDidEnterForeground];
      }
    }
    else if (v12 == 8)
    {
      NSLog(@"%s calling clientApplicationDidEnterBackground", "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]");
      [v7 clientApplicationDidEnterBackground];
    }
    v13 = +[NSNumber numberWithUnsignedInt:v9];
    id v14 = [(RPApplicationStateMonitor *)self previousState];
    [v14 setObject:v13 forKeyedSubscript:v5];

    v15 = [(RPApplicationStateMonitor *)self previousState];
    NSLog(@"%s state %i previousState %@", "-[RPApplicationStateMonitor notifyInAppSessionShouldPauseOrResume:]", v9, v15);
  }
}

- (BOOL)isApplicationInForegroundWithBundleIdentifier:(id)a3
{
  return ([(BKSApplicationStateMonitor *)self->_applicationStateMonitor applicationStateForApplication:a3] >> 3) & 1;
}

- (BKSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void)setApplicationStateMonitor:(id)a3
{
}

- (RPSystemStateObserver)systemObserver
{
  return self->_systemObserver;
}

- (void)setSystemObserver:(id)a3
{
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableDictionary)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_systemObserver, 0);

  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
}

@end