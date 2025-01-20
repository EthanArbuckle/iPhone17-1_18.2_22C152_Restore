@interface MapsRealLocationUpdater
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)startLocationUpdatesForDelegate:(id)a3;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)stopLocationUpdates;
@end

@implementation MapsRealLocationUpdater

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v7 = a3;
  v4 = self->_delegate;
  objc_sync_enter(v4);
  delegate = self->_delegate;
  v6 = [v7 currentLocation];
  [(MapsLocationUpdaterDelegate *)delegate didUpdateLocation:v6];

  objc_sync_exit(v4);
}

- (void)stopLocationUpdates
{
  v4 = sub_100021338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    id v7 = NSStringFromSelector(a2);
    int v11 = 138412546;
    v12 = v5;
    __int16 v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ %@: stopping location updates", (uint8_t *)&v11, 0x16u);
  }
  v8 = self->_delegate;
  objc_sync_enter(v8);
  delegate = self->_delegate;
  self->_delegate = 0;

  v10 = +[MKLocationManager sharedLocationManager];
  [v10 stopLocationUpdateWithObserver:self];

  objc_sync_exit(v8);
}

- (BOOL)startLocationUpdatesForDelegate:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    int v11 = sub_100021338();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v19 = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/MapsRealLocationUpdater.m";
      __int16 v21 = 1024;
      *(_DWORD *)v22 = 24;
      *(_WORD *)&v22[4] = 2082;
      *(void *)&v22[6] = "-[MapsRealLocationUpdater startLocationUpdatesForDelegate:]";
      __int16 v23 = 2082;
      v24 = "nil == delegate";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. delegate cannot be nil", (uint8_t *)&v19, 0x26u);
    }

    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v19 = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/MapsRealLocationUpdater.m";
      __int16 v21 = 1024;
      *(_DWORD *)v22 = 24;
      *(_WORD *)&v22[4] = 2082;
      *(void *)&v22[6] = "-[MapsRealLocationUpdater startLocationUpdatesForDelegate:]";
      __int16 v23 = 2082;
      v24 = "nil == delegate";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. delegate cannot be nil", (uint8_t *)&v19, 0x26u);
    }
    goto LABEL_10;
  }
  id v7 = self->_delegate;
  objc_sync_enter(v7);
  if (self->_delegate)
  {
    v8 = sub_100021338();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (char *)(id)objc_opt_class();
      v10 = NSStringFromSelector(a2);
      int v19 = 138412546;
      v20 = v9;
      __int16 v21 = 2112;
      *(void *)v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@ %@: delegate for location updates is already set", (uint8_t *)&v19, 0x16u);
    }
    objc_sync_exit(v7);
LABEL_10:
    BOOL v12 = 0;
    goto LABEL_14;
  }
  objc_sync_exit(v7);

  __int16 v13 = sub_100021338();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = objc_opt_class();
    id v15 = v14;
    v16 = NSStringFromSelector(a2);
    int v19 = 138412546;
    v20 = (const char *)v14;
    __int16 v21 = 2112;
    *(void *)v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ %@: starting location updates", (uint8_t *)&v19, 0x16u);
  }
  id v7 = self->_delegate;
  objc_sync_enter(v7);
  objc_storeStrong((id *)&self->_delegate, a3);
  v17 = +[MKLocationManager sharedLocationManager];
  [v17 startLocationUpdateWithObserver:self];

  objc_sync_exit(v7);
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end