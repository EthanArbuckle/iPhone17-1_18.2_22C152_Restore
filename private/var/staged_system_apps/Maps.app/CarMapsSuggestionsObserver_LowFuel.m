@interface CarMapsSuggestionsObserver_LowFuel
- (BOOL)active;
- (BOOL)hasLowFuelSuggestion;
- (BOOL)updateShownFuelAlerts:(id)a3;
- (CarMapsSuggestionsController)controller;
- (CarMapsSuggestionsObserver_LowFuel)init;
- (NSMutableDictionary)shownFuelAlerts;
- (id)dismissalBlock;
- (id)lowFuelSuggestions;
- (id)unshownFuelAlerts:(id)a3;
- (void)addShownFuelAlert:(id)a3;
- (void)carMapsSuggestionControllerDidRefresh:(id)a3;
- (void)removeAllShownFuelAlerts;
- (void)setActive:(BOOL)a3;
- (void)setDismissalBlock:(id)a3;
- (void)setShownFuelAlerts:(id)a3;
@end

@implementation CarMapsSuggestionsObserver_LowFuel

- (CarMapsSuggestionsObserver_LowFuel)init
{
  v6.receiver = self;
  v6.super_class = (Class)CarMapsSuggestionsObserver_LowFuel;
  v2 = [(CarMapsSuggestionsObserver_LowFuel *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    shownFuelAlerts = v2->_shownFuelAlerts;
    v2->_shownFuelAlerts = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)removeAllShownFuelAlerts
{
  id obj = [(CarMapsSuggestionsObserver_LowFuel *)self shownFuelAlerts];
  objc_sync_enter(obj);
  uint64_t v3 = [(CarMapsSuggestionsObserver_LowFuel *)self shownFuelAlerts];
  [v3 removeAllObjects];

  objc_sync_exit(obj);
}

- (void)addShownFuelAlert:(id)a3
{
  id v7 = a3;
  v4 = [(CarMapsSuggestionsObserver_LowFuel *)self shownFuelAlerts];
  objc_sync_enter(v4);
  v5 = [(CarMapsSuggestionsObserver_LowFuel *)self shownFuelAlerts];
  objc_super v6 = [v7 uniqueIdentifier];
  [v5 setObject:v7 forKeyedSubscript:v6];

  objc_sync_exit(v4);
}

- (BOOL)updateShownFuelAlerts:(id)a3
{
  id v4 = a3;
  id obj = [(CarMapsSuggestionsObserver_LowFuel *)self shownFuelAlerts];
  objc_sync_enter(obj);
  v5 = [(CarMapsSuggestionsObserver_LowFuel *)self shownFuelAlerts];
  objc_super v6 = [v5 allKeys];
  id v7 = +[NSMutableSet setWithArray:v6];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v29;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)v11) uniqueIdentifier];
        [v7 removeObject:v12];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v7;
  char v14 = 0;
  id v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v17);
        v19 = [(CarMapsSuggestionsObserver_LowFuel *)self shownFuelAlerts];
        v20 = [v19 objectForKeyedSubscript:v18];

        if (v20)
        {
          v21 = [(CarMapsSuggestionsObserver_LowFuel *)self shownFuelAlerts];
          [v21 removeObjectForKey:v18];

          char v14 = 1;
        }
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v15);
  }

  objc_sync_exit(obj);
  return v14 & 1;
}

- (id)unshownFuelAlerts:(id)a3
{
  id v4 = a3;
  id obj = [(CarMapsSuggestionsObserver_LowFuel *)self shownFuelAlerts];
  objc_sync_enter(obj);
  v5 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [(CarMapsSuggestionsObserver_LowFuel *)self shownFuelAlerts];
        v12 = [v10 uniqueIdentifier];
        id v13 = [v11 objectForKeyedSubscript:v12];
        BOOL v14 = v13 == 0;

        if (v14) {
          [v5 addObject:v10];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  objc_sync_exit(obj);

  return v5;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    v5 = sub_100015DB4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_active) {
        id v6 = @"YES";
      }
      else {
        id v6 = @"NO";
      }
      id v7 = v6;
      if (v3) {
        uint64_t v8 = @"YES";
      }
      else {
        uint64_t v8 = @"NO";
      }
      id v9 = v8;
      *(_DWORD *)buf = 138543618;
      id v13 = v7;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[CarMapsSuggestionsController] LowFuel monitor _active=%{public}@ active=%{public}@", buf, 0x16u);
    }
    self->_active = v3;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100A3D13C;
    v10[3] = &unk_1012E6300;
    BOOL v11 = v3;
    v10[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
}

- (CarMapsSuggestionsController)controller
{
  v2 = +[CarDisplayController sharedInstance];
  BOOL v3 = [v2 mapsSuggestionsController];

  return (CarMapsSuggestionsController *)v3;
}

- (BOOL)hasLowFuelSuggestion
{
  v2 = [(CarMapsSuggestionsObserver_LowFuel *)self lowFuelSuggestions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)lowFuelSuggestions
{
  BOOL v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CarMapsSuggestionsObserver_LowFuel *)self controller];
  v5 = [v4 suggestions];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 type] == (id)10) {
          [v3 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)carMapsSuggestionControllerDidRefresh:(id)a3
{
  id v4 = a3;
  if ([(CarMapsSuggestionsObserver_LowFuel *)self hasLowFuelSuggestion])
  {
    v5 = [(CarMapsSuggestionsObserver_LowFuel *)self controller];
    unsigned __int8 v6 = [v5 allowLowFuelAlert];

    if (v6)
    {
      id v7 = [(CarMapsSuggestionsObserver_LowFuel *)self lowFuelSuggestions];
      if ([(CarMapsSuggestionsObserver_LowFuel *)self updateShownFuelAlerts:v7])
      {
        uint64_t v8 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
        [v8 clearLowFuelAlertBulletin];
      }
      id v9 = [(CarMapsSuggestionsObserver_LowFuel *)self unshownFuelAlerts:v7];
      if ([v9 count])
      {
        uint64_t v10 = [v9 firstObject];
        id v11 = [objc_alloc((Class)MSPLowFuelDetails) initWithMapsSuggestionsEntry:v10];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v12 = v9;
        id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v23;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v12);
              }
              -[CarMapsSuggestionsObserver_LowFuel addShownFuelAlert:](self, "addShownFuelAlert:", *(void *)(*((void *)&v22 + 1) + 8 * (void)v16), (void)v22);
              uint64_t v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v14);
        }

        long long v17 = sub_100015DB4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v28 = (unint64_t)v12;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Sending low fuel details to MSPMapsPushDaemon. Unshown Fuel Alert Details: %@", buf, 0xCu);
        }

        long long v18 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
        [v18 showLowFuelAlertBulletinForLowFuelDetails:v11];
      }
      else
      {
        uint64_t v10 = sub_100015DB4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "There are no unshown fuel alerts to display", buf, 2u);
        }
      }

      [v4 setHoldProcessAssertion:0];
    }
    else
    {
      id v7 = sub_100015DB4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v21 = [(CarMapsSuggestionsObserver_LowFuel *)self controller];
        *(_DWORD *)buf = 134217984;
        unint64_t v28 = [v21 allowLowFuelAlert];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CarMapsSuggestionController Did Refresh with allowLowFuelAlert as :%ld", buf, 0xCu);
      }
    }
  }
  else
  {
    long long v19 = +[MSPMapsPushDaemonRemoteProxy sharedInstance];
    [v19 clearLowFuelAlertBulletin];

    long long v20 = [(CarMapsSuggestionsObserver_LowFuel *)self controller];
    [v20 setAllowLowFuelAlert:1];

    [(CarMapsSuggestionsObserver_LowFuel *)self removeAllShownFuelAlerts];
  }
}

- (BOOL)active
{
  return self->_active;
}

- (id)dismissalBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setDismissalBlock:(id)a3
{
}

- (NSMutableDictionary)shownFuelAlerts
{
  return self->_shownFuelAlerts;
}

- (void)setShownFuelAlerts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shownFuelAlerts, 0);

  objc_storeStrong(&self->_dismissalBlock, 0);
}

@end