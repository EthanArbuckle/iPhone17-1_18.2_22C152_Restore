@interface MapsScreenLayoutMonitor
+ (MapsScreenLayoutMonitor)sharedMonitor;
- (BOOL)_isMapsActiveInLayout:(id)a3;
- (BOOL)isLocked;
- (BOOL)isOurAppActive;
- (BOOL)isScreenFullyOn;
- (BOOL)isScreenOn;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (FBSDisplayLayoutMonitorConfiguration)configuration;
- (MapsScreenLayoutMonitor)init;
- (unint64_t)_changeReasonWithNewLayout:(id)a3 context:(id)a4;
- (unint64_t)changeReason;
- (void)_layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)_notifyObserversWithReason:(unint64_t)a3;
- (void)_prepareLayoutMonitor;
- (void)dealloc;
- (void)setChangeReason:(unint64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setIsOurAppActive:(BOOL)a3;
- (void)setIsScreenFullyOn:(BOOL)a3;
- (void)setIsScreenOn:(BOOL)a3;
- (void)setLayoutMonitor:(id)a3;
- (void)setLocked:(BOOL)a3;
- (void)startMonitoringWithObserver:(id)a3;
- (void)stopMonitoringWithObserver:(id)a3;
@end

@implementation MapsScreenLayoutMonitor

+ (MapsScreenLayoutMonitor)sharedMonitor
{
  if (qword_10160F898 != -1) {
    dispatch_once(&qword_10160F898, &stru_1012F8318);
  }
  v2 = (void *)qword_10160F890;

  return (MapsScreenLayoutMonitor *)v2;
}

- (MapsScreenLayoutMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)MapsScreenLayoutMonitor;
  v2 = [(MapsScreenLayoutMonitor *)&v6 init];
  if (v2)
  {
    v3 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___MapsScreenLayoutObserver queue:&_dispatch_main_q];
    observers = v2->_observers;
    v2->_observers = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(MapsScreenLayoutMonitor *)self setLayoutMonitor:0];
  v3.receiver = self;
  v3.super_class = (Class)MapsScreenLayoutMonitor;
  [(MapsScreenLayoutMonitor *)&v3 dealloc];
}

- (void)setLocked:(BOOL)a3
{
  if (self->_locked != a3)
  {
    self->_locked = a3;
    self->_needsUpdate = 1;
  }
}

- (void)setIsScreenFullyOn:(BOOL)a3
{
  if (self->_isScreenFullyOn != a3)
  {
    self->_isScreenFullyOn = a3;
    self->_needsUpdate = 1;
  }
}

- (void)setIsScreenOn:(BOOL)a3
{
  if (self->_isScreenOn != a3)
  {
    self->_isScreenOn = a3;
    self->_needsUpdate = 1;
  }
}

- (void)setIsOurAppActive:(BOOL)a3
{
  if (self->_isOurAppActive != a3)
  {
    self->_isOurAppActive = a3;
    self->_needsUpdate = 1;
  }
}

- (void)setChangeReason:(unint64_t)a3
{
  if (self->_changeReason != a3)
  {
    v5 = sub_10078C884();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 134217984;
      unint64_t v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting changeReason to %lu", (uint8_t *)&v6, 0xCu);
    }

    self->_changeReason = a3;
  }
}

- (void)setLayoutMonitor:(id)a3
{
  v5 = (FBSDisplayLayoutMonitor *)a3;
  layoutMonitor = self->_layoutMonitor;
  p_layoutMonitor = &self->_layoutMonitor;
  int v6 = layoutMonitor;
  if (layoutMonitor != v5)
  {
    v9 = v5;
    [(FBSDisplayLayoutMonitor *)v6 invalidate];
    objc_storeStrong((id *)p_layoutMonitor, a3);
    v5 = v9;
  }
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  layoutMonitor = self->_layoutMonitor;
  if (!layoutMonitor)
  {
    v4 = [(MapsScreenLayoutMonitor *)self configuration];
    v5 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v4];
    int v6 = self->_layoutMonitor;
    self->_layoutMonitor = v5;

    self->_hasFirstUpdate = 0;
    layoutMonitor = self->_layoutMonitor;
  }

  return layoutMonitor;
}

- (FBSDisplayLayoutMonitorConfiguration)configuration
{
  configuration = self->_configuration;
  if (!configuration)
  {
    v4 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10078CA98;
    v9[3] = &unk_1012F8340;
    v9[4] = self;
    v5 = self;
    [v4 setTransitionHandler:v9];
    int v6 = self->_configuration;
    self->_configuration = (FBSDisplayLayoutMonitorConfiguration *)v4;
    id v7 = v4;

    configuration = self->_configuration;
  }

  return configuration;
}

- (void)startMonitoringWithObserver:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  [(GEOObserverHashTable *)v5->_observers registerObserver:v4];
  int v6 = sub_10078C884();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Added observer %@", (uint8_t *)&v7, 0xCu);
  }

  if (v5->_hasFirstUpdate
    && ((objc_opt_respondsToSelector() & 1) == 0
     || [v4 notifyCurrentStateWhenStartMonitoring]))
  {
    [v4 screenLayoutDidChangeWithReason:[v5 changeReason]];
  }
  [(MapsScreenLayoutMonitor *)v5 _prepareLayoutMonitor];
  objc_sync_exit(v5);
}

- (void)stopMonitoringWithObserver:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  [(GEOObserverHashTable *)v5->_observers unregisterObserver:v4];
  int v6 = sub_10078C884();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Removed observer %@", (uint8_t *)&v7, 0xCu);
  }

  if (([(GEOObserverHashTable *)v5->_observers hasObservers] & 1) == 0) {
    [(MapsScreenLayoutMonitor *)v5 setLayoutMonitor:0];
  }
  objc_sync_exit(v5);
}

- (void)_prepareLayoutMonitor
{
  id v2 = [(MapsScreenLayoutMonitor *)self layoutMonitor];
}

- (void)_notifyObserversWithReason:(unint64_t)a3
{
  if (self->_needsUpdate || !self->_hasFirstUpdate)
  {
    *(_WORD *)&self->_hasFirstUpdate = 1;
    v5 = sub_10078C884();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      unint64_t v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notifying observers didChange: %lu", (uint8_t *)&v6, 0xCu);
    }

    [(GEOObserverHashTable *)self->_observers screenLayoutDidChangeWithReason:a3];
  }
}

- (BOOL)_isMapsActiveInLayout:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  [a3 elements];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = MapsAppBundleId;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) bundleIdentifier];
        unsigned __int8 v10 = [v9 isEqualToString:v7];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (unint64_t)_changeReasonWithNewLayout:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 transitionReasons];
  unsigned __int8 v9 = [v8 containsObject:SBDisplayLayoutBacklightTransitionReasonLockButton];

  if ((v9 & 1) == 0)
  {
    if (!self->_hasFirstUpdate)
    {
      unint64_t v10 = 1;
      goto LABEL_13;
    }
    if (self->_lastKnownLayout)
    {
      unsigned int v11 = [(MapsScreenLayoutMonitor *)self _isMapsActiveInLayout:"_isMapsActiveInLayout:"];
      if (v11 != [(MapsScreenLayoutMonitor *)self _isMapsActiveInLayout:v6])
      {
        unint64_t v10 = 2;
        goto LABEL_13;
      }
    }
    v12 = [v7 transitionReasons];
    if (([v12 containsObject:SBDisplayLayoutBacklightTransitionReasonLiftToWake] & 1) == 0)
    {
      long long v13 = [v7 transitionReasons];
      if (![v13 containsObject:SBDisplayLayoutBacklightTransitionReasonTouch])
      {
        long long v15 = [v7 transitionReasons];
        if ([v15 containsObject:SBDisplayLayoutBacklightTransitionReasonIdleTimer])
        {
          unsigned __int8 v16 = [(MapsScreenLayoutMonitor *)self isScreenFullyOn];

          if (v16) {
            goto LABEL_11;
          }
        }
        else
        {
        }
        unint64_t v10 = 0;
        goto LABEL_13;
      }
    }
LABEL_11:
    unint64_t v10 = 4;
    goto LABEL_13;
  }
  unint64_t v10 = 3;
LABEL_13:

  return v10;
}

- (void)_layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    unsigned int v11 = sub_10078C884();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "monitor: %@ layout: %@ context: %@", buf, 0x20u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10078D1F8;
    block[3] = &unk_1012E66E0;
    id v13 = v9;
    long long v14 = self;
    id v15 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (BOOL)isScreenFullyOn
{
  return self->_isScreenFullyOn;
}

- (BOOL)isScreenOn
{
  return self->_isScreenOn;
}

- (BOOL)isOurAppActive
{
  return self->_isOurAppActive;
}

- (unint64_t)changeReason
{
  return self->_changeReason;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_lastKnownLayout, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end