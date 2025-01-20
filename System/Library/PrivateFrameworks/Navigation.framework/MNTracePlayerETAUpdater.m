@interface MNTracePlayerETAUpdater
- (void)_updateForETARoute:(id)a3;
- (void)playETAUpdate:(id)a3;
@end

@implementation MNTracePlayerETAUpdater

- (void)playETAUpdate:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MNSessionUpdateManager *)self delegate];
  v6 = [v4 request];
  [v5 updateManager:self willSendETARequest:v6];

  v7 = [v4 request];
  v8 = [v4 response];
  v9 = [v4 error];
  v10 = objc_alloc_init(MNSessionUpdateResponseInfo);
  [(MNSessionUpdateResponseInfo *)v10 setRequest:v7];
  [(MNSessionUpdateResponseInfo *)v10 setResponse:v8];
  [(MNSessionUpdateResponseInfo *)v10 setError:v9];
  v11 = [(MNSessionUpdateManager *)self delegate];
  v12 = [v11 routeInfoForUpdateManager:self reason:1];

  if (v9)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      [v4 requestTimestamp];
      uint64_t v15 = v14;
      [v4 responseTimestamp];
      *(_DWORD *)buf = 134218240;
      uint64_t v33 = v15;
      __int16 v34 = 2048;
      uint64_t v35 = v16;
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_DEFAULT, "Playing ETAU error from trace at timestamp %0.1fs | %0.1fs.", buf, 0x16u);
    }

    [(MNSessionUpdateManager *)self _handleETAResponse:v10 forRouteInfo:v12 etaRoute:0 reason:7];
  }
  else if (v8)
  {
    v31 = v8;
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      [v4 requestTimestamp];
      uint64_t v19 = v18;
      [v4 responseTimestamp];
      *(_DWORD *)buf = 134218240;
      uint64_t v33 = v19;
      __int16 v34 = 2048;
      uint64_t v35 = v20;
      _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_DEFAULT, "Playing ETAU response from trace at timestamp %0.1fs | %0.1fs.", buf, 0x16u);
    }

    v21 = [(MNSessionUpdateManager *)self delegate];
    v30 = [v21 userLocationForUpdateManager:self];

    id v22 = objc_alloc_init(MEMORY[0x1E4F64490]);
    v28 = [v12 route];
    [v30 routeMatch];
    v23 = v29 = v12;
    v24 = [(MNSessionUpdateManager *)self delegate];
    uint64_t v27 = [v24 targetLegIndex];
    v25 = [(MNSessionUpdateManager *)self delegate];
    objc_msgSend(v22, "prepareForRequest:route:routeMatch:targetLegIndex:state:", v7, v28, v23, v27, objc_msgSend(v25, "state"));

    v12 = v29;
    v26 = [(MNSessionUpdateManager *)self _updateWaypointsForRequest:v7 routeInfo:v29 userLocation:v30 etaRoute:v22];
    [(MNSessionUpdateResponseInfo *)v10 setWaypoints:v26];
    [(MNSessionUpdateManager *)self _handleETAResponse:v10 forRouteInfo:v29 etaRoute:v22 reason:7];

    v8 = v31;
  }
}

- (void)_updateForETARoute:(id)a3
{
}

@end