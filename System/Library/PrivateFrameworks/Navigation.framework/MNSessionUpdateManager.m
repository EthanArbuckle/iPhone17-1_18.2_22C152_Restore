@interface MNSessionUpdateManager
- (BOOL)_hasAtLeastOneActiveSubscriber;
- (GEOApplicationAuditToken)auditToken;
- (GEODataRequestThrottlerToken)throttleToken;
- (GEOLatLng)tripOrigin;
- (MNSessionUpdateManager)init;
- (MNSessionUpdateManagerDelegate)delegate;
- (NSString)requestingAppIdentifier;
- (id)_baseETARequest;
- (id)_updateETARequest:(id)a3 withRouteInfo:(id)a4 andUserLocation:(id)a5;
- (id)_updateWaypointsForRequest:(id)a3 routeInfo:(id)a4 userLocation:(id)a5 etaRoute:(id)a6;
- (int)_purposeForReason:(unint64_t)a3;
- (unint64_t)maxAlternateRoutesCount;
- (void)_cancelPendingETARequest;
- (void)_continueETARequests;
- (void)_handleETAResponse:(id)a3 forRouteInfo:(id)a4 etaRoute:(id)a5 reason:(unint64_t)a6;
- (void)_scheduleETATimerWithInterval:(double)a3;
- (void)_sendETARequestWithParameters:(id)a3;
- (void)_sendETARequestWithReason:(unint64_t)a3;
- (void)_terminateETARequests;
- (void)_updateRouteAttributesFor:(id)a3 route:(id)a4 updatedLocation:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)pauseUpdateRequestsForSubscriber:(id)a3;
- (void)requestImmediateUpdateWithReason:(unint64_t)a3;
- (void)requestUpdateForETAUPosition:(id)a3;
- (void)restartUpdateTimer;
- (void)resumeUpdateRequestsForSubscriber:(id)a3;
- (void)sendFinalETAURequestWithReason:(unint64_t)a3;
- (void)setAuditToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaxAlternateRoutesCount:(unint64_t)a3;
- (void)setRequestingAppIdentifier:(id)a3;
- (void)setThrottleToken:(id)a3;
- (void)setTripOrigin:(id)a3;
- (void)startUpdateRequestsForRoutes:(id)a3 andNavigationType:(int64_t)a4;
- (void)stopUpdateRequests;
- (void)transitRouteUpdater:(id)a3 didFailUpdateForRouteIDs:(id)a4 withError:(id)a5;
- (void)transitRouteUpdater:(id)a3 didReceiveResponse:(id)a4;
- (void)transitRouteUpdater:(id)a3 didUpdateTransitRoutes:(id)a4;
- (void)transitRouteUpdater:(id)a3 willSendRequests:(id)a4;
- (void)transitRouteUpdater:(id)a3 willUpdateTransitForRouteIDs:(id)a4;
@end

@implementation MNSessionUpdateManager

- (MNSessionUpdateManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)MNSessionUpdateManager;
  v2 = [(MNSessionUpdateManager *)&v11 init];
  if (v2)
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 0;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "Initializing.", (uint8_t *)v10, 2u);
    }

    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    subscribers = v2->_subscribers;
    v2->_subscribers = v4;

    v2->_isPaused = 1;
    GEOConfigGetDouble();
    if (v6 < 5.0) {
      double v6 = 5.0;
    }
    v2->_double etaRequestInterval = v6;
    GEOConfigGetDouble();
    if (etaRequestInterval <= 0.0) {
      double etaRequestInterval = v2->_etaRequestInterval;
    }
    v2->_initialRequestDelay = etaRequestInterval;
    v2->_opportunisticRequestTimeWindow = 150.0;
    v2->_maxAlternateRoutesCount = 2;
    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(NSTimer *)self->_etaTimer invalidate];
  [(GEOTransitRouteUpdater *)self->_transitUpdater setActive:0];
  pendingETARequest = self->_pendingETARequest;
  if (pendingETARequest && [(GEOETATrafficUpdateRequest *)pendingETARequest hasXpcUuid])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F64560]);
    [v4 cancelRequest:self->_pendingETARequest];
  }
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Deallocated.", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)MNSessionUpdateManager;
  [(MNSessionUpdateManager *)&v6 dealloc];
}

- (void)startUpdateRequestsForRoutes:(id)a3 andNavigationType:(int64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__MNSessionUpdateManager_startUpdateRequestsForRoutes_andNavigationType___block_invoke;
    v7[3] = &unk_1E60F7138;
    int64_t v9 = a4;
    v7[4] = self;
    id v8 = v6;
    MNRunAsynchronouslyOnMainThread(v7);
  }
  else
  {
    [(MNSessionUpdateManager *)self stopUpdateRequests];
  }
}

void __73__MNSessionUpdateManager_startUpdateRequestsForRoutes_andNavigationType___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48) == 3)
  {
    if (*(void *)(*(void *)(a1 + 32) + 64))
    {
      v31 = [NSString stringWithFormat:@"ETA updates already started."];
      v32 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v40 = "-[MNSessionUpdateManager startUpdateRequestsForRoutes:andNavigationType:]_block_invoke";
        __int16 v41 = 2080;
        v42 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNSessionUpdateManager.m";
        __int16 v43 = 1024;
        int v44 = 157;
        __int16 v45 = 2080;
        v46 = "_etaTimer == nil";
        __int16 v47 = 2112;
        v48 = v31;
        _os_log_impl(&dword_1B542B000, v32, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }
    }
    uint64_t v2 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = v2;

    [*(id *)(a1 + 32) _scheduleETATimerWithInterval:*(double *)(*(void *)(a1 + 32) + 80)];
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v33 = a1;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v13 = [v12 transitRouteUpdateRequest];
        if (v13)
        {
          v14 = [v12 route];
          v15 = [v14 suggestedRoute];
          int v16 = [v15 supportsRouteUpdates];

          if (v16)
          {
            if (fabs(v10) < 0.000001)
            {
              v17 = [v12 route];
              [v17 transitUpdateInitialDelay];
              double v10 = v18;
            }
            [v5 addObject:v13];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  uint64_t v19 = [v5 count];
  v20 = *(void **)(*(void *)(v33 + 32) + 48);
  if (v19)
  {
    if (!v20)
    {
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F64B18]) initWithDelegate:*(void *)(v33 + 32) andInitialTTL:v10];
      uint64_t v22 = *(void *)(v33 + 32);
      v23 = *(void **)(v22 + 48);
      *(void *)(v22 + 48) = v21;

      v24 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(const char **)(*(void *)(v33 + 32) + 48);
        uint64_t v26 = [v5 count];
        *(_DWORD *)buf = 138412546;
        v40 = v25;
        __int16 v41 = 2048;
        v42 = (const char *)v26;
        _os_log_impl(&dword_1B542B000, v24, OS_LOG_TYPE_DEFAULT, "creating transit updater %@ for %lu requests", buf, 0x16u);
      }

      v20 = *(void **)(*(void *)(v33 + 32) + 48);
    }
    [v20 setRequests:v5];
    [*(id *)(*(void *)(v33 + 32) + 48) setActive:*(unsigned char *)(*(void *)(v33 + 32) + 120) == 0];
  }
  else if (v20)
  {
    v27 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(const char **)(*(void *)(v33 + 32) + 48);
      *(_DWORD *)buf = 138412290;
      v40 = v28;
      _os_log_impl(&dword_1B542B000, v27, OS_LOG_TYPE_DEFAULT, "tearing down transit updater %@ because we have no requests", buf, 0xCu);
    }

    [*(id *)(*(void *)(v33 + 32) + 48) setActive:0];
    uint64_t v29 = *(void *)(v33 + 32);
    v30 = *(void **)(v29 + 48);
    *(void *)(v29 + 48) = 0;
  }
}

- (void)stopUpdateRequests
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__MNSessionUpdateManager_stopUpdateRequests__block_invoke;
  v2[3] = &unk_1E60F6B98;
  v2[4] = self;
  MNRunAsynchronouslyOnMainThread(v2);
}

uint64_t __44__MNSessionUpdateManager_stopUpdateRequests__block_invoke(uint64_t a1)
{
  uint64_t v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEFAULT, "stopping transit/ETA updates", v6, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 48) setActive:0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = 0;

  return [*(id *)(a1 + 32) _terminateETARequests];
}

- (void)restartUpdateTimer
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__MNSessionUpdateManager_restartUpdateTimer__block_invoke;
  v2[3] = &unk_1E60F6B98;
  v2[4] = self;
  MNRunAsynchronouslyOnMainThread(v2);
}

uint64_t __44__MNSessionUpdateManager_restartUpdateTimer__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 64))
  {
    uint64_t v1 = result;
    uint64_t v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEFAULT, "restarting ETA updates", v5, 2u);
    }

    [*(id *)(*(void *)(v1 + 32) + 64) invalidate];
    uint64_t v3 = *(void *)(v1 + 32);
    id v4 = *(void **)(v3 + 64);
    *(void *)(v3 + 64) = 0;

    return [*(id *)(v1 + 32) _continueETARequests];
  }
  return result;
}

- (void)sendFinalETAURequestWithReason:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v6 = [WeakRetained wantsETAUpdates];

  if (v6)
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "Sending final ETA update.", v9, 2u);
    }

    uint64_t v8 = objc_opt_new();
    [v8 setReason:a3];
    [v8 setShouldUseConditionalRequest:0];
    [v8 setShouldRepeatAfterCompletion:0];
    [v8 setShouldRetryImmediatelyOnError:0];
    [v8 setShouldTrackPendingRequest:0];
    [(MNSessionUpdateManager *)self _sendETARequestWithParameters:v8];
  }
}

- (void)requestImmediateUpdateWithReason:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__MNSessionUpdateManager_requestImmediateUpdateWithReason___block_invoke;
  v3[3] = &unk_1E60F6BC0;
  v3[4] = self;
  v3[5] = a3;
  MNRunAsynchronouslyOnMainThread(v3);
}

uint64_t __59__MNSessionUpdateManager_requestImmediateUpdateWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEFAULT, "Requesting immediate ETAU update.", v4, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 104) = 0;
  [*(id *)(a1 + 32) _cancelPendingETARequest];
  return [*(id *)(a1 + 32) _sendETARequestWithReason:*(void *)(a1 + 40)];
}

- (void)requestUpdateForETAUPosition:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__MNSessionUpdateManager_requestUpdateForETAUPosition___block_invoke;
  v6[3] = &unk_1E60F6668;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  MNRunAsynchronouslyOnMainThread(v6);
}

void __55__MNSessionUpdateManager_requestUpdateForETAUPosition___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 64) isValid])
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 104))
    {
      uint64_t v2 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEFAULT, "Last request was server-driven. Skipping server update.", (uint8_t *)&v17, 2u);
      }
    }
    else
    {
      uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v2 = v3;
      uint64_t v4 = *(void *)(a1 + 32);
      if (*(void *)(v4 + 96))
      {
        -[NSObject timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
        double v6 = v5;
        [*(id *)(a1 + 40) timeSinceLastUpdate];
        if (v6 < v7)
        {
          v15 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            [*(id *)(a1 + 40) timeSinceLastUpdate];
            int v17 = 134218240;
            double v18 = v6;
            __int16 v19 = 2048;
            double v20 = v16;
            _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_DEFAULT, "Time since last update (%f seconds ago) is within minimum (%f seconds). Skipping server update.", (uint8_t *)&v17, 0x16u);
          }

          goto LABEL_14;
        }
        uint64_t v4 = *(void *)(a1 + 32);
      }
      uint64_t v8 = [*(id *)(v4 + 64) fireDate];
      [v8 timeIntervalSinceDate:v2];
      double v10 = v9;

      double v11 = v10 + *(double *)(*(void *)(a1 + 32) + 72);
      v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v11];
      [*(id *)(*(void *)(a1 + 32) + 64) setFireDate:v12];

      v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        [*(id *)(a1 + 40) routeCoordinate];
        GEOPolylineCoordinateAsShortString();
        double v14 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        int v17 = 138412546;
        double v18 = v14;
        __int16 v19 = 2048;
        double v20 = v11;
        _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_DEFAULT, "Request ETA update for server provided position at [%@]. Scheduling the next update for %f seconds from now", (uint8_t *)&v17, 0x16u);
      }
      [*(id *)(a1 + 32) _sendETARequestWithReason:2];
      *(unsigned char *)(*(void *)(a1 + 32) + 104) = 1;
    }
LABEL_14:
  }
}

- (void)pauseUpdateRequestsForSubscriber:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__MNSessionUpdateManager_pauseUpdateRequestsForSubscriber___block_invoke;
    v7[3] = &unk_1E60F6668;
    v7[4] = self;
    id v8 = v4;
    MNRunAsynchronouslyOnMainThread(v7);
  }
  else
  {
    double v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      double v10 = "-[MNSessionUpdateManager pauseUpdateRequestsForSubscriber:]";
      __int16 v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNSessionUpdateManager.m";
      __int16 v13 = 1024;
      int v14 = 277;
      __int16 v15 = 2080;
      double v16 = "subscriber != nil";
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }
  }
}

uint64_t __59__MNSessionUpdateManager_pauseUpdateRequestsForSubscriber___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v5 = v2;
    uint64_t v2 = [(id)v2 unsignedIntegerValue];
    uint64_t v3 = v5;
    if (v2)
    {
      [*(id *)(*(void *)(a1 + 32) + 56) setObject:&unk_1F0E356B8 forKey:*(void *)(a1 + 40)];
      uint64_t v2 = [*(id *)(a1 + 32) _hasAtLeastOneActiveSubscriber];
      uint64_t v3 = v5;
      if ((v2 & 1) == 0)
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 120) = 1;
        uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) setActive:*(unsigned char *)(*(void *)(a1 + 32) + 120) == 0];
        uint64_t v3 = v5;
      }
    }
  }
  return MEMORY[0x1F41817F8](v2, v3);
}

- (void)resumeUpdateRequestsForSubscriber:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__MNSessionUpdateManager_resumeUpdateRequestsForSubscriber___block_invoke;
    v7[3] = &unk_1E60F6668;
    v7[4] = self;
    id v8 = v4;
    MNRunAsynchronouslyOnMainThread(v7);
  }
  else
  {
    double v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      double v10 = "-[MNSessionUpdateManager resumeUpdateRequestsForSubscriber:]";
      __int16 v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNSessionUpdateManager.m";
      __int16 v13 = 1024;
      int v14 = 300;
      __int16 v15 = 2080;
      double v16 = "subscriber != nil";
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }
  }
}

void __60__MNSessionUpdateManager_resumeUpdateRequestsForSubscriber___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if ([v2 unsignedIntegerValue] != 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 56) setObject:&unk_1F0E356D0 forKey:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
    [*(id *)(*(void *)(a1 + 32) + 48) setActive:*(unsigned char *)(*(void *)(a1 + 32) + 120) == 0];
  }
}

- (void)_scheduleETATimerWithInterval:(double)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    __int16 v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315906;
      *(void *)&location[4] = "-[MNSessionUpdateManager _scheduleETATimerWithInterval:]";
      __int16 v15 = 2080;
      double v16 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNSessionUpdateManager.m";
      __int16 v17 = 1024;
      int v18 = 323;
      __int16 v19 = 2080;
      double v20 = "[NSThread isMainThread]";
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", location, 0x26u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = [WeakRetained wantsETAUpdates];

  if (v6)
  {
    [(NSTimer *)self->_etaTimer invalidate];
    objc_initWeak((id *)location, self);
    double v7 = (void *)MEMORY[0x1E4F1CB00];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__MNSessionUpdateManager__scheduleETATimerWithInterval___block_invoke;
    v12[3] = &unk_1E60FBDE0;
    v12[4] = self;
    objc_copyWeak(&v13, (id *)location);
    id v8 = [v7 scheduledTimerWithTimeInterval:0 repeats:v12 block:a3];
    etaTimer = self->_etaTimer;
    self->_etaTimer = v8;

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }
  else
  {
    double v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
    }
  }
}

void __56__MNSessionUpdateManager__scheduleETATimerWithInterval___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 104) = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _sendETARequestWithReason:1];
}

- (void)_continueETARequests
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = [WeakRetained wantsETAUpdates];

  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__MNSessionUpdateManager__continueETARequests__block_invoke;
    v6[3] = &unk_1E60F6B98;
    v6[4] = self;
    MNRunAsynchronouslyOnMainThread(v6);
  }
  else
  {
    uint64_t v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }
  }
}

uint64_t __46__MNSessionUpdateManager__continueETARequests__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleETATimerWithInterval:*(double *)(*(void *)(a1 + 32) + 72)];
}

- (void)_terminateETARequests
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315906;
      uint64_t v5 = "-[MNSessionUpdateManager _terminateETARequests]";
      __int16 v6 = 2080;
      double v7 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNSessionUpdateManager.m";
      __int16 v8 = 1024;
      int v9 = 354;
      __int16 v10 = 2080;
      __int16 v11 = "[NSThread isMainThread]";
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v4, 0x26u);
    }
  }
  [(NSTimer *)self->_etaTimer invalidate];
  [(MNSessionUpdateManager *)self _cancelPendingETARequest];
}

- (void)_cancelPendingETARequest
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315906;
      int v9 = "-[MNSessionUpdateManager _cancelPendingETARequest]";
      __int16 v10 = 2080;
      __int16 v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNSessionUpdateManager.m";
      __int16 v12 = 1024;
      int v13 = 362;
      __int16 v14 = 2080;
      __int16 v15 = "[NSThread isMainThread]";
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v8, 0x26u);
    }
  }
  pendingETARequest = self->_pendingETARequest;
  if (pendingETARequest)
  {
    if ([(GEOETATrafficUpdateRequest *)pendingETARequest hasXpcUuid])
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F64560]);
      [v4 cancelRequest:self->_pendingETARequest];
    }
    uint64_t v5 = self->_pendingETARequest;
    self->_pendingETARequest = 0;

    pendingETARoute = self->_pendingETARoute;
    self->_pendingETARoute = 0;
  }
}

- (void)_updateRouteAttributesFor:(id)a3 route:(id)a4 updatedLocation:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v37 = a6;
  __int16 v12 = objc_msgSend(v11, "_navigation_geoLocation");
  int v13 = [v12 latLng];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  __int16 v15 = v14;
  if (v13)
  {
    [v14 addObject:v13];
  }
  else
  {
    uint64_t v16 = [v10 origin];
    __int16 v17 = [v16 latLng];
    [v15 addObject:v17];
  }
  int v18 = [v11 routeMatch];
  unint64_t v19 = [v18 legIndex];

  double v20 = [v10 legs];
  unint64_t v21 = [v20 count];

  if (v19 < v21)
  {
    do
    {
      uint64_t v22 = [v10 legs];
      v23 = [v22 objectAtIndexedSubscript:v19];
      v24 = [v23 destination];
      v25 = [v24 latLng];
      [v15 addObject:v25];

      ++v19;
      uint64_t v26 = [v10 legs];
      unint64_t v27 = [v26 count];
    }
    while (v19 < v27);
  }
  v28 = [v9 routeAttributes];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v30 = v9;
  }
  else
  {
    v31 = [v10 routeAttributes];
    objc_opt_class();
    char v32 = objc_opt_isKindOfClass();

    if ((v32 & 1) == 0)
    {
      long long v34 = [MNRouteAttributes alloc];
      long long v35 = [v10 routeAttributes];
      uint64_t v33 = [(MNRouteAttributes *)v34 initWithAttributes:v35 latLngs:v15];

      goto LABEL_12;
    }
    v30 = v10;
  }
  uint64_t v33 = [v30 routeAttributes];
LABEL_12:
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __85__MNSessionUpdateManager__updateRouteAttributesFor_route_updatedLocation_completion___block_invoke;
  v38[3] = &unk_1E60FBE08;
  id v39 = v37;
  id v36 = v37;
  [(MNRouteAttributes *)v33 buildRouteAttributesForETAUpdateRequest:v9 queue:MEMORY[0x1E4F14428] result:v38];
}

void __85__MNSessionUpdateManager__updateRouteAttributesFor_route_updatedLocation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "Error updating route attributes with LPR/Vehicle info: %@. Continuing ETA update anyway", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_sendETARequestWithReason:(unint64_t)a3
{
  id v5 = (id)objc_opt_new();
  [v5 setReason:a3];
  [v5 setShouldUseConditionalRequest:self->_opportunisticRequestTimeWindow > 0.0];
  [v5 setShouldRepeatAfterCompletion:1];
  [v5 setShouldRetryImmediatelyOnError:1];
  [v5 setShouldTrackPendingRequest:1];
  [(MNSessionUpdateManager *)self _sendETARequestWithParameters:v5];
}

- (void)_sendETARequestWithParameters:(id)a3
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = [WeakRetained wantsETAUpdates];

  double v7 = GEOFindOrCreateLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = [v4 reason];
      if ((unint64_t)(v9 - 1) > 6) {
        uint64_t v10 = @"Unknown";
      }
      else {
        uint64_t v10 = off_1E60FBF18[v9 - 1];
      }
      *(_DWORD *)buf = 138412290;
      v115 = v10;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to make ETATrafficUpdate request for reason: %@", buf, 0xCu);
    }

    if (self->_pendingETARequest)
    {
      id v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "Not sending ETAU request because one is already in progress.", buf, 2u);
      }

      goto LABEL_53;
    }
    uint64_t v108 = 0;
    v109 = &v108;
    uint64_t v110 = 0x3032000000;
    v111 = __Block_byref_object_copy__18;
    v112 = __Block_byref_object_dispose__18;
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "routeInfoForUpdateManager:reason:", self, objc_msgSend(v4, "reason"));
    id v113 = (id)objc_claimAutoreleasedReturnValue();

    if (!v109[5])
    {
      v38 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v38, OS_LOG_TYPE_DEFAULT, "No route provided to ETATrafficUpdate request. Skipping update.", buf, 2u);
      }

      if ([v4 shouldRepeatAfterCompletion]) {
        [(MNSessionUpdateManager *)self _continueETARequests];
      }
      goto LABEL_52;
    }
    uint64_t v102 = 0;
    v103 = &v102;
    uint64_t v104 = 0x3032000000;
    v105 = __Block_byref_object_copy__18;
    v106 = __Block_byref_object_dispose__18;
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    id v107 = [v13 userLocationForUpdateManager:self];

    id v14 = (void *)v103[5];
    if (v14)
    {
      __int16 v15 = [v14 routeMatch];
      unsigned int v16 = [v15 routeCoordinate];
      __int16 v17 = [(id)v109[5] route];
      LOBYTE(v16) = [v17 pointCount] > v16;

      if (v16)
      {
        int v18 = [(MNSessionUpdateManager *)self _baseETARequest];
        unint64_t v19 = [v4 routeAttributes];
        [v18 setRouteAttributes:v19];

        objc_msgSend(v18, "setPurpose:", -[MNSessionUpdateManager _purposeForReason:](self, "_purposeForReason:", objc_msgSend(v4, "reason")));
        uint64_t v96 = 0;
        v97 = &v96;
        uint64_t v98 = 0x3032000000;
        v99 = __Block_byref_object_copy__18;
        v100 = __Block_byref_object_dispose__18;
        id v101 = [(MNSessionUpdateManager *)self _updateETARequest:v18 withRouteInfo:v109[5] andUserLocation:v103[5]];
        if (v97[5])
        {
          if ([v4 shouldTrackPendingRequest]) {
            objc_storeStrong((id *)&self->_pendingETARequest, v18);
          }
          v94[0] = 0;
          v94[1] = v94;
          v94[2] = 0x3032000000;
          v94[3] = __Block_byref_object_copy__18;
          v94[4] = __Block_byref_object_dispose__18;
          id v95 = [(MNSessionUpdateManager *)self _updateWaypointsForRequest:v18 routeInfo:v109[5] userLocation:v103[5] etaRoute:v97[5]];
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          unint64_t v21 = v20;
          objc_initWeak(&location, self);
          v86[0] = MEMORY[0x1E4F143A8];
          v86[1] = 3221225472;
          v86[2] = __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke;
          v86[3] = &unk_1E60FBE30;
          id v22 = v4;
          id v87 = v22;
          v89 = &v108;
          objc_copyWeak(v92, &location);
          id v23 = v18;
          id v88 = v23;
          v90 = v94;
          v92[1] = v21;
          v91 = &v96;
          v64 = (void *)MEMORY[0x1BA99B3A0](v86);
          id v24 = objc_alloc_init(MEMORY[0x1E4F64560]);
          if ([v22 shouldUseConditionalRequest])
          {
            v71[0] = MEMORY[0x1E4F143A8];
            v71[1] = 3221225472;
            v71[2] = __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_2;
            v71[3] = &unk_1E60FBEA8;
            objc_copyWeak(&v80, &location);
            id v63 = v24;
            id v72 = v63;
            id v25 = v23;
            id v73 = v25;
            v76 = &v108;
            id v26 = v22;
            v77 = &v102;
            v78 = &v96;
            v79 = v94;
            id v74 = v26;
            v75 = self;
            v62 = (void *)MEMORY[0x1BA99B3A0](v71);
            unint64_t v27 = [MEMORY[0x1E4F1C9C8] now];
            dateOfLastUpdate = self->_dateOfLastUpdate;
            self->_dateOfLastUpdate = v27;

            GEOFindOrCreateLog();
            uint64_t v29 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              id v61 = v24;
              [(id)v103[5] coordinate];
              v31 = v30;
              [(id)v103[5] coordinate];
              uint64_t v33 = v32;
              long long v34 = [(id)v103[5] routeMatch];
              [v34 routeCoordinate];
              GEOPolylineCoordinateAsShortString();
              long long v35 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
              uint64_t v36 = [v26 reason];
              if ((unint64_t)(v36 - 1) > 6) {
                id v37 = @"Unknown";
              }
              else {
                id v37 = off_1E60FBF18[v36 - 1];
              }
              v57 = [(id)v109[5] routeID];
              *(_DWORD *)buf = 134284547;
              v115 = v31;
              __int16 v116 = 2049;
              uint64_t v117 = v33;
              __int16 v118 = 2112;
              v119 = v35;
              __int16 v120 = 2112;
              v121 = v37;
              __int16 v122 = 2112;
              v123 = v57;
              _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_DEFAULT, "Starting conditional ETATrafficUpdate request from location: %{private}f, %{private}f (%@) | reason: %@ | routeID: %@", buf, 0x34u);

              id v24 = v61;
            }

            v58 = [(id)v109[5] route];
            uint64_t v59 = v103[5];
            v65[0] = MEMORY[0x1E4F143A8];
            v65[1] = 3221225472;
            v65[2] = __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_43;
            v65[3] = &unk_1E60FBED0;
            objc_copyWeak(&v70, &location);
            id v66 = v25;
            id v67 = v63;
            id v60 = v62;
            id v68 = v60;
            id v69 = v64;
            [(MNSessionUpdateManager *)self _updateRouteAttributesFor:v66 route:v58 updatedLocation:v59 completion:v65];

            objc_destroyWeak(&v70);
            objc_destroyWeak(&v80);
          }
          else
          {
            id v46 = objc_loadWeakRetained((id *)&self->_delegate);
            [v46 updateManager:self willSendETARequest:v23];

            GEOFindOrCreateLog();
            __int16 v47 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              [(id)v103[5] coordinate];
              uint64_t v49 = v48;
              [(id)v103[5] coordinate];
              uint64_t v51 = v50;
              uint64_t v52 = [v22 reason];
              if ((unint64_t)(v52 - 1) > 6) {
                v53 = @"Unknown";
              }
              else {
                v53 = off_1E60FBF18[v52 - 1];
              }
              v54 = [(id)v109[5] routeID];
              *(_DWORD *)buf = 134284291;
              v115 = v49;
              __int16 v116 = 2049;
              uint64_t v117 = v51;
              __int16 v118 = 2112;
              v119 = v53;
              __int16 v120 = 2112;
              v121 = v54;
              _os_log_impl(&dword_1B542B000, v47, OS_LOG_TYPE_DEFAULT, "Sending immediate ETATrafficUpdate request from location: %{private}f, %{private}f | reason: %@ | routeID: %@", buf, 0x2Au);
            }
            v55 = [(id)v109[5] route];
            uint64_t v56 = v103[5];
            v81[0] = MEMORY[0x1E4F143A8];
            v81[1] = 3221225472;
            v81[2] = __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_40;
            v81[3] = &unk_1E60FBE58;
            id v82 = v23;
            v83 = self;
            id v84 = v24;
            id v85 = v64;
            [(MNSessionUpdateManager *)self _updateRouteAttributesFor:v82 route:v55 updatedLocation:v56 completion:v81];
          }
          objc_destroyWeak(v92);

          objc_destroyWeak(&location);
          _Block_object_dispose(v94, 8);
        }
        else
        {
          __int16 v45 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B542B000, v45, OS_LOG_TYPE_ERROR, "Error creating ETATrafficUpdate request.", buf, 2u);
          }

          if ([v4 shouldRepeatAfterCompletion]) {
            [(MNSessionUpdateManager *)self _continueETARequests];
          }
        }
        _Block_object_dispose(&v96, 8);

        goto LABEL_51;
      }
      GEOFindOrCreateLog();
      v40 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v41 = [(id)v103[5] routeMatch];
        [v41 routeCoordinate];
        GEOPolylineCoordinateAsShortString();
        v42 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        __int16 v43 = [(id)v109[5] route];
        int v44 = [v43 pointCount];
        *(_DWORD *)buf = 138412546;
        v115 = v42;
        __int16 v116 = 1024;
        LODWORD(v117) = v44;
        _os_log_impl(&dword_1B542B000, v40, OS_LOG_TYPE_DEFAULT, "User location [%@] is at or past end of route (%d). Skipping update.", buf, 0x12u);
      }
      if (![v4 shouldRepeatAfterCompletion]) {
        goto LABEL_51;
      }
    }
    else
    {
      id v39 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v39, OS_LOG_TYPE_ERROR, "Error creating ETATrafficUpdate request because userLocation is nil.", buf, 2u);
      }

      if (([v4 shouldRepeatAfterCompletion] & 1) == 0) {
        goto LABEL_51;
      }
    }
    [(MNSessionUpdateManager *)self _continueETARequests];
LABEL_51:
    _Block_object_dispose(&v102, 8);

LABEL_52:
    _Block_object_dispose(&v108, 8);

    goto LABEL_53;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
  }

LABEL_53:
}

void __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v8 = v7;
  uint64_t v9 = GEOFindOrCreateLog();
  uint64_t v10 = v9;
  if (!v6)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    uint64_t v13 = [*(id *)(a1 + 32) reason];
    if ((unint64_t)(v13 - 1) > 6) {
      id v14 = @"Unknown";
    }
    else {
      id v14 = off_1E60FBF18[v13 - 1];
    }
    unsigned int v16 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) routeID];
    uint64_t v17 = [v5 status];
    if ((int)v17 <= 29)
    {
      int v18 = @"STATUS_SUCCESS";
      switch((int)v17)
      {
        case 0:
          goto LABEL_28;
        case 1:
          int v18 = @"STATUS_FAILED";
          break;
        case 2:
          int v18 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_23;
        case 5:
          int v18 = @"INVALID_REQUEST";
          break;
        default:
          if (v17 != 20) {
            goto LABEL_23;
          }
          int v18 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_28;
    }
    if ((int)v17 > 49)
    {
      if (v17 == 50)
      {
        int v18 = @"STATUS_DEDUPED";
        goto LABEL_28;
      }
      if (v17 == 60)
      {
        int v18 = @"VERSION_MISMATCH";
        goto LABEL_28;
      }
    }
    else
    {
      if (v17 == 30)
      {
        int v18 = @"NEEDS_REFINEMENT";
        goto LABEL_28;
      }
      if (v17 == 40)
      {
        int v18 = @"FAILED_NOT_AUTHORIZED";
LABEL_28:
        *(_DWORD *)buf = 138412802;
        v31 = (const char *)v14;
        __int16 v32 = 2112;
        uint64_t v33 = v16;
        __int16 v34 = 2112;
        v35[0] = v18;
        _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEFAULT, "Received ETATrafficUpdate response for reason: %@ | route: %@ | Status: %@", buf, 0x20u);

        goto LABEL_29;
      }
    }
LABEL_23:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
    int v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = [*(id *)(a1 + 32) reason];
    if ((unint64_t)(v11 - 1) > 6) {
      id v12 = @"Unknown";
    }
    else {
      id v12 = off_1E60FBF18[v11 - 1];
    }
    __int16 v15 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) routeID];
    *(_DWORD *)buf = 138412802;
    v31 = (const char *)v12;
    __int16 v32 = 2112;
    uint64_t v33 = v15;
    __int16 v34 = 2112;
    v35[0] = v6;
    _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Received ETATrafficUpdate error for reason: %@ | route: %@ | Error: %@", buf, 0x20u);
  }
LABEL_29:

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v31 = "-[MNSessionUpdateManager _sendETARequestWithParameters:]_block_invoke";
      __int16 v32 = 2080;
      uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNSessionUpdateManager.m";
      __int16 v34 = 1024;
      LODWORD(v35[0]) = 480;
      WORD2(v35[0]) = 2080;
      *(void *)((char *)v35 + 6) = "[NSThread isMainThread]";
      _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    double v20 = [v6 domain];
    unint64_t v21 = GEOErrorDomain();
    if ([v20 isEqualToString:v21])
    {
      uint64_t v22 = [v6 code];

      if (v22 == -2)
      {
        if ([*(id *)(a1 + 32) shouldRepeatAfterCompletion]) {
          [WeakRetained _continueETARequests];
        }
        goto LABEL_47;
      }
    }
    else
    {
    }
    if (v6
      && [*(id *)(a1 + 32) shouldRetryImmediatelyOnError]
      && ([*(id *)(a1 + 40) routeAttributes],
          id v23 = objc_claimAutoreleasedReturnValue(),
          int v24 = [v23 shouldRetryForError:v6],
          v23,
          v24))
    {
      [*(id *)(a1 + 32) setShouldRetryImmediatelyOnError:0];
      if ([*(id *)(a1 + 32) shouldTrackPendingRequest])
      {
        id v25 = (void *)WeakRetained[16];
        WeakRetained[16] = 0;
      }
      id v26 = [*(id *)(a1 + 40) routeAttributes];
      [*(id *)(a1 + 32) setRouteAttributes:v26];

      [WeakRetained _sendETARequestWithParameters:*(void *)(a1 + 32)];
    }
    else
    {
      unint64_t v27 = objc_alloc_init(MNSessionUpdateResponseInfo);
      [(MNSessionUpdateResponseInfo *)v27 setWaypoints:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      [(MNSessionUpdateResponseInfo *)v27 setRequest:*(void *)(a1 + 40)];
      [(MNSessionUpdateResponseInfo *)v27 setResponse:v5];
      [(MNSessionUpdateResponseInfo *)v27 setError:v6];
      [(MNSessionUpdateResponseInfo *)v27 setResponseTime:v8 - *(double *)(a1 + 80)];
      if ([*(id *)(a1 + 32) shouldTrackPendingRequest])
      {
        v28 = (void *)WeakRetained[16];
        WeakRetained[16] = 0;
      }
      objc_msgSend(WeakRetained, "_handleETAResponse:forRouteInfo:etaRoute:reason:", v27, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), objc_msgSend(*(id *)(a1 + 32), "reason"));
      if ([*(id *)(a1 + 32) shouldRepeatAfterCompletion]) {
        [WeakRetained _continueETARequests];
      }
    }
  }
LABEL_47:
}

uint64_t __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_40(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setRouteAttributes:a2];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v3;

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(v7 + 24);
  uint64_t v9 = *(void *)(v7 + 32);
  uint64_t v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  return [v10 sendETATrafficUpdateRequest:v6 auditToken:v8 throttleToken:v9 finishedHandler:v11];
}

void __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 96));
  uint64_t v8 = WeakRetained;
  if (!WeakRetained)
  {
    [*(id *)(a1 + 32) cancelRequest:*(void *)(a1 + 40)];
    goto LABEL_13;
  }
  id v9 = objc_loadWeakRetained(WeakRetained + 1);
  uint64_t v10 = objc_msgSend(v9, "routeInfoForUpdateManager:reason:", v8, objc_msgSend(*(id *)(a1 + 48), "reason"));
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v31 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    __int16 v32 = "No route provided to ETATrafficUpdate request. Skipping update.";
    uint64_t v33 = v31;
    os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_10;
  }
  id v13 = objc_loadWeakRetained(v8 + 1);
  uint64_t v14 = [v13 userLocationForUpdateManager:v8];
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  unsigned int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  uint64_t v17 = [v8 _updateETARequest:*(void *)(a1 + 40) withRouteInfo:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) andUserLocation:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  uint64_t v18 = *(void *)(*(void *)(a1 + 80) + 8);
  unint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    uint64_t v20 = objc_msgSend(*(id *)(a1 + 56), "_updateWaypointsForRequest:routeInfo:userLocation:etaRoute:", *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    uint64_t v21 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    id v23 = objc_loadWeakRetained(v8 + 1);
    [v23 updateManager:v8 willSendETARequest:*(void *)(a1 + 40)];

    uint64_t v24 = *(void *)(a1 + 40);
    id v25 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) route];
    uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_41;
    void v35[3] = &unk_1E60FBE80;
    id v36 = v5;
    id v39 = v6;
    id v27 = *(id *)(a1 + 40);
    uint64_t v28 = *(void *)(a1 + 72);
    id v37 = v27;
    uint64_t v40 = v28;
    id v29 = *(id *)(a1 + 48);
    uint64_t v30 = *(void *)(a1 + 64);
    id v38 = v29;
    uint64_t v41 = v30;
    [v8 _updateRouteAttributesFor:v24 route:v25 updatedLocation:v26 completion:v35];

    goto LABEL_13;
  }
  v31 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    __int16 v32 = "Error creating ETATrafficUpdate request.";
    uint64_t v33 = v31;
    os_log_type_t v34 = OS_LOG_TYPE_ERROR;
LABEL_10:
    _os_log_impl(&dword_1B542B000, v33, v34, v32, buf, 2u);
  }
LABEL_11:

  [*(id *)(a1 + 32) cancelRequest:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) shouldRepeatAfterCompletion]) {
    [v8 _continueETARequests];
  }
LABEL_13:
}

void __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_41(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setRouteAttributes:a2];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void **)(a1 + 40);
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) coordinate];
    uint64_t v6 = v5;
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) coordinate];
    uint64_t v8 = v7;
    id v9 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) routeMatch];
    [v9 routeCoordinate];
    uint64_t v10 = GEOPolylineCoordinateAsShortString();
    uint64_t v11 = [*(id *)(a1 + 48) reason];
    if ((unint64_t)(v11 - 1) > 6) {
      id v12 = @"Unknown";
    }
    else {
      id v12 = off_1E60FBF18[v11 - 1];
    }
    id v13 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) routeID];
    int v16 = 134219267;
    uint64_t v17 = v4;
    __int16 v18 = 2049;
    uint64_t v19 = v6;
    __int16 v20 = 2049;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "Sending conditional ETATrafficUpdate request %p from location: %{private}f, %{private}f (%@) | reason: %@ | routeID: %@", (uint8_t *)&v16, 0x3Eu);
  }
  uint64_t v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [*(id *)(a1 + 40) formattedText];
    int v16 = 138477827;
    uint64_t v17 = v15;
    _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_DEBUG, "Full request: %{private}@", (uint8_t *)&v16, 0xCu);
  }
}

void __56__MNSessionUpdateManager__sendETARequestWithParameters___block_invoke_43(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) setRouteAttributes:v4];
    [*(id *)(a1 + 40) sendConditionalETATrafficUpdateRequest:*(void *)(a1 + 32) timeWindowDuration:*((void *)WeakRetained + 3) auditToken:*((void *)WeakRetained + 4) throttleToken:*(void *)(a1 + 48) willSendRequestHandler:*(void *)(a1 + 56) finishedHandler:WeakRetained[11]];
  }
}

- (id)_baseETARequest
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F64558]);
  id v4 = [MEMORY[0x1E4F64B90] sharedInstance];
  uint64_t v5 = [v4 mapsUserSessionEntity];
  uint64_t v6 = [v5 sessionID];
  objc_msgSend(v3, "setSessionID:", v6, v7);

  uint64_t v8 = [MEMORY[0x1E4F64B90] sharedInstance];
  id v9 = [v8 mapsUserSessionEntity];
  [v9 sessionRelativeTimestamp];
  objc_msgSend(v3, "setSessionRelativeTimestamp:");

  uint64_t v10 = [MEMORY[0x1E4F64860] sharedPlatform];
  uint64_t v11 = [v10 clientCapabilities];
  [v3 setClientCapabilities:v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4F64468]);
  [v12 setIncludeTravelTimeAggressive:1];
  [v12 setIncludeTravelTimeConservative:1];
  [v12 setIncludeTravelTimeEstimate:1];
  [v12 setExcludeGuidance:1];
  [v3 setCommonOptions:v12];
  [v3 setRequestingAppId:self->_requestingAppIdentifier];
  [v3 setMaxAlternateRouteCount:LODWORD(self->_maxAlternateRoutesCount)];
  id v13 = objc_alloc_init(MEMORY[0x1E4F64660]);
  [v3 setTripOrigin:v13];

  tripOrigin = self->_tripOrigin;
  uint64_t v15 = [v3 tripOrigin];
  [v15 setLatLng:tripOrigin];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v17 = [WeakRetained recentLocationHistoryForUpdateManager:self];
  [v3 setRecentLocationHistory:v17];

  return v3;
}

- (id)_updateETARequest:(id)a3 withRouteInfo:(id)a4 andUserLocation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v40 = 0;
      __int16 v18 = "Unable to create ETATrafficUpdateRequest because routeInfo is nil.";
      uint64_t v19 = (uint8_t *)&v40;
LABEL_12:
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, v18, v19, 2u);
    }
LABEL_13:
    uint64_t v17 = 0;
    goto LABEL_24;
  }
  uint64_t v11 = [v9 route];

  if (!v11)
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v39 = 0;
      __int16 v18 = "Unable to create ETATrafficUpdateRequest because routeInfo has no route.";
      uint64_t v19 = v39;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v12 = [objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:v10];
  [v8 setCurrentUserLocation:v12];
  id v13 = [v10 routeMatch];
  if (!v13)
  {
LABEL_15:
    id v35 = v10;
    int v16 = objc_alloc_init(MEMORY[0x1E4F64490]);
    __int16 v20 = [v9 route];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v22 = [WeakRetained targetLegIndex];
    id v23 = objc_loadWeakRetained((id *)&self->_delegate);
    id v36 = v13;
    char v24 = -[NSObject prepareForRequest:route:routeMatch:targetLegIndex:state:](v16, "prepareForRequest:route:routeMatch:targetLegIndex:state:", v8, v20, v13, v22, [v23 state]);

    if (v24)
    {
      objc_storeStrong((id *)&self->_pendingETARoute, v16);
      id v25 = [v9 route];
      __int16 v26 = [v25 directionsResponseID];
      [v8 setDirectionsResponseID:v26];

      [v8 setEtauResponseID:0];
      id v27 = [v8 directionsResponseID];

      if (!v27)
      {
        uint64_t v28 = [v9 route];
        id v29 = [v28 etauResponseID];
        [v8 setEtauResponseID:v29];
      }
      uint64_t v30 = objc_msgSend(v9, "displayETAInfo", v35);
      v31 = [v30 displayETAToEndOfLeg];
      [v31 timeIntervalSinceReferenceDate];
      [v8 setDisplayedEta:v32];

      int v16 = v16;
      uint64_t v17 = v16;
    }
    else
    {
      uint64_t v33 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v37 = 0;
        _os_log_impl(&dword_1B542B000, v33, OS_LOG_TYPE_ERROR, "Unable to create ETA route for ETATrafficUpdateRequest.", v37, 2u);
      }

      uint64_t v17 = 0;
    }
    id v10 = v35;
    id v13 = v36;
    goto LABEL_23;
  }
  uint64_t v14 = [v9 route];
  uint64_t v15 = [v13 route];

  if (v14 == v15)
  {
    [v13 routeCoordinate];
    goto LABEL_15;
  }
  int v16 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_ERROR, "Route match's route does not match route parameter.", buf, 2u);
  }
  uint64_t v17 = 0;
LABEL_23:

LABEL_24:
  return v17;
}

- (id)_updateWaypointsForRequest:(id)a3 routeInfo:(id)a4 userLocation:(id)a5 etaRoute:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:v10];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F644F0]) initWithLocation:v12 isCurrentLocation:1];
  [v11 addObject:v13];
  if (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes())
  {
    v42 = v12;
    id v43 = v10;
    int v44 = v11;
    [v8 clearWaypointTypeds];
    uint64_t v14 = [v9 route];
    uint64_t v15 = [v14 waypoints];

    uint64_t v16 = [v15 count];
    uint64_t v17 = [v8 waypointRoute];
    __int16 v18 = [v17 routeLegs];
    uint64_t v19 = v16 - [v18 count];

    uint64_t v41 = v15;
    uint64_t v20 = [v15 count] - v19;
    id v45 = v9;
    uint64_t v21 = [v9 route];
    uint64_t v22 = [v21 waypoints];
    id v23 = objc_msgSend(v22, "subarrayWithRange:", v19, v20);

    char v24 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v19, v20);
      *(_DWORD *)buf = 138412290;
      uint64_t v52 = v25;
      _os_log_impl(&dword_1B542B000, v24, OS_LOG_TYPE_DEFAULT, "Creating ETAU request using waypoints from index set: %@.", buf, 0xCu);
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v26 = v23;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v47 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          double v32 = [v31 geoWaypointTyped];
          if (v32)
          {
            [v8 addWaypointTyped:v32];
          }
          else
          {
            uint64_t v33 = [v31 chargingInfo];

            if (!v33)
            {
              os_log_type_t v34 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v52 = v31;
                _os_log_impl(&dword_1B542B000, v34, OS_LOG_TYPE_FAULT, "Unable to create GEOWaypointTyped from GEOComposedWaypoint for a non-EV waypoint. %@", buf, 0xCu);
              }
            }
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v28);
    }

    uint64_t v11 = v44;
    [v44 addObjectsFromArray:v26];

    id v9 = v45;
    id v12 = v42;
    id v10 = v43;
  }
  else
  {
    [v8 clearDestinationWaypointTypeds];
    id v35 = [v9 route];
    id v36 = [v35 destination];
    id v37 = [v36 geoWaypointTyped];

    [v8 addDestinationWaypointTyped:v37];
    id v38 = [v9 route];
    id v39 = [v38 destination];
    [v11 addObject:v39];
  }
  return v11;
}

- (int)_purposeForReason:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return 0;
  }
  else {
    return dword_1B5542D88[a3 - 1];
  }
}

- (void)_handleETAResponse:(id)a3 forRouteInfo:(id)a4 etaRoute:(id)a5 reason:(unint64_t)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (__CFString *)a5;
  id v13 = [v10 error];
  if (v13)
  {
    uint64_t v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = v13;
      _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_ERROR, "Error in ETATrafficUpdate response: %@", buf, 0xCu);
    }

    if (GEOConfigGetBOOL())
    {
      sfxController = self->_sfxController;
      if (!sfxController)
      {
        uint64_t v16 = objc_alloc_init(MNSoundEffectResourceController);
        uint64_t v17 = self->_sfxController;
        self->_sfxController = v16;

        sfxController = self->_sfxController;
      }
      [(MNSoundEffectResourceController *)sfxController playSound:0 andReport:0];
    }
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v20 = [WeakRetained routeInfoForUpdateManager:self reason:a6];
    uint64_t v51 = [v20 route];

    id v21 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v50 = self;
    id v22 = [v21 userLocationForUpdateManager:self];

    id v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      long long v47 = [v10 request];
      long long v46 = [v47 waypointRoute];
      id v45 = [v46 routeLegs];
      long long v48 = v12;
      id v24 = v11;
      uint64_t v25 = [v45 count];
      [v22 routeMatch];
      id v26 = v49 = v10;
      uint64_t v27 = objc_msgSend(v51, "waypointsFromRouteCoordinate:", objc_msgSend(v26, "routeCoordinate"));
      uint64_t v28 = [v27 count];
      int v29 = [v51 isEVRoute];
      *(_DWORD *)buf = 138413058;
      uint64_t v53 = v13;
      __int16 v54 = 2048;
      uint64_t v55 = v25;
      id v11 = v24;
      id v12 = v48;
      __int16 v56 = 2048;
      uint64_t v57 = v28;
      __int16 v58 = 1024;
      int v59 = v29;
      _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_DEBUG, "ETA Update failed. error: %@ | etaRequestLegsCount: %lu | remainingWaypointsCount: %lu | isEVRoute: %d", buf, 0x26u);

      id v10 = v49;
    }

    uint64_t v30 = [v11 etaRoute];
    [v30 invalidateServerDisplayETA];

    v31 = objc_loadWeakRetained((id *)p_delegate);
    [v31 updateManager:v50 didReceiveETAResponse:v10];
    double v32 = v51;
    goto LABEL_11;
  }
  double v32 = [v10 response];
  if ([v32 status])
  {
    uint64_t v33 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
LABEL_32:

      goto LABEL_33;
    }
    uint64_t v34 = [v32 status];
    if ((int)v34 <= 29)
    {
      id v35 = @"STATUS_SUCCESS";
      switch((int)v34)
      {
        case 0:
          goto LABEL_31;
        case 1:
          id v35 = @"STATUS_FAILED";
          break;
        case 2:
          id v35 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_26;
        case 5:
          id v35 = @"INVALID_REQUEST";
          break;
        default:
          if (v34 != 20) {
            goto LABEL_26;
          }
          id v35 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_31;
    }
    if ((int)v34 > 49)
    {
      if (v34 == 50)
      {
        id v35 = @"STATUS_DEDUPED";
        goto LABEL_31;
      }
      if (v34 == 60)
      {
        id v35 = @"VERSION_MISMATCH";
        goto LABEL_31;
      }
    }
    else
    {
      if (v34 == 30)
      {
        id v35 = @"NEEDS_REFINEMENT";
        goto LABEL_31;
      }
      if (v34 == 40)
      {
        id v35 = @"FAILED_NOT_AUTHORIZED";
LABEL_31:
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = v35;
        _os_log_impl(&dword_1B542B000, v33, OS_LOG_TYPE_ERROR, "Error in ETATrafficUpdate response but attempting to continue: %@", buf, 0xCu);

        goto LABEL_32;
      }
    }
LABEL_26:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v34);
    id v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
LABEL_33:
  id v36 = &self->_delegate;
  id v37 = self;
  id v38 = objc_loadWeakRetained((id *)&self->_delegate);
  id v22 = [v38 routeInfoForUpdateManager:v37 reason:a6];

  if (v22 == v11)
  {
    uint64_t v41 = v37;
    v42 = [v11 route];
    char v43 = [(__CFString *)v12 updateForResponse:v32 route:v42];

    int v44 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      uint64_t v53 = v12;
      _os_log_impl(&dword_1B542B000, v44, OS_LOG_TYPE_DEFAULT, "ETA route: %{private}@", buf, 0xCu);
    }

    if (v43)
    {
      [(MNSessionUpdateManager *)v41 _updateForETARoute:v12];
      [v11 setEtaRoute:v12];
      v31 = objc_loadWeakRetained((id *)v36);
      [v31 updateManager:v41 didReceiveETAResponse:v10];
    }
    else
    {
      v31 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v31, OS_LOG_TYPE_ERROR, "Error updating GEOComposedETARoute with ETAU response.", buf, 2u);
      }
    }
    id v22 = v11;
  }
  else
  {
    v31 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = [v11 routeID];
      __int16 v40 = [v22 routeID];
      *(_DWORD *)buf = 138412546;
      uint64_t v53 = v39;
      __int16 v54 = 2112;
      uint64_t v55 = (uint64_t)v40;
      _os_log_impl(&dword_1B542B000, v31, OS_LOG_TYPE_DEFAULT, "ETA request was made for route %@, but current route is now %@. Ignoring response.", buf, 0x16u);
    }
  }
LABEL_11:
}

- (void)transitRouteUpdater:(id)a3 willSendRequests:(id)a4
{
  if (!self->_isPaused)
  {
    p_delegate = &self->_delegate;
    id v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained updateManager:self willSendTransitUpdateRequests:v6];
  }
}

- (void)transitRouteUpdater:(id)a3 didReceiveResponse:(id)a4
{
  if (!self->_isPaused)
  {
    p_delegate = &self->_delegate;
    id v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained updateManager:self didReceiveTransitUpdateResponse:v6];
  }
}

- (void)transitRouteUpdater:(id)a3 willUpdateTransitForRouteIDs:(id)a4
{
  if (!self->_isPaused)
  {
    p_delegate = &self->_delegate;
    id v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained updateManager:self willSendTransitUpdateRequestForRouteIDs:v6];
  }
}

- (void)transitRouteUpdater:(id)a3 didUpdateTransitRoutes:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (!self->_isPaused)
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
          id v13 = [MNRealtimeTransitUpdate alloc];
          uint64_t v14 = -[MNRealtimeTransitUpdate initWithTransitRouteUpdate:](v13, "initWithTransitRouteUpdate:", v12, (void)v16);
          [v6 addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained updateManager:self didReceiveTransitUpdates:v6];
  }
}

- (void)transitRouteUpdater:(id)a3 didFailUpdateForRouteIDs:(id)a4 withError:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = v6;
  if (!self->_isPaused)
  {
    uint64_t v8 = [v6 domain];
    uint64_t v9 = GEOErrorDomain();
    int v10 = [v8 isEqualToString:v9];

    uint64_t v11 = GEOFindOrCreateLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v12)
      {
        [v7 code];
        id v13 = GEOStringForError();
        uint64_t v14 = [v7 userInfo];
        uint64_t v15 = GEOErrorReasonKey();
        long long v16 = [v14 objectForKeyedSubscript:v15];
        int v18 = 138412546;
        long long v19 = v13;
        __int16 v20 = 2112;
        uint64_t v21 = v16;
        _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "Received error from transit route updater: (%@) \"%@\"", (uint8_t *)&v18, 0x16u);
      }
    }
    else if (v12)
    {
      int v18 = 138412290;
      long long v19 = v7;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "Received error from transit route updater: %@", (uint8_t *)&v18, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained updateManager:self didReceiveTransitError:v7];
  }
}

- (BOOL)_hasAtLeastOneActiveSubscriber
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  subscribers = self->_subscribers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__MNSessionUpdateManager__hasAtLeastOneActiveSubscriber__block_invoke;
  v5[3] = &unk_1E60FBEF8;
  v5[4] = &v6;
  [(NSMutableDictionary *)subscribers enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__MNSessionUpdateManager__hasAtLeastOneActiveSubscriber__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 unsignedIntegerValue];
  if (result == 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (MNSessionUpdateManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNSessionUpdateManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)requestingAppIdentifier
{
  return self->_requestingAppIdentifier;
}

- (void)setRequestingAppIdentifier:(id)a3
{
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (GEODataRequestThrottlerToken)throttleToken
{
  return self->_throttleToken;
}

- (void)setThrottleToken:(id)a3
{
}

- (unint64_t)maxAlternateRoutesCount
{
  return self->_maxAlternateRoutesCount;
}

- (void)setMaxAlternateRoutesCount:(unint64_t)a3
{
  self->_maxAlternateRoutesCount = a3;
}

- (GEOLatLng)tripOrigin
{
  return self->_tripOrigin;
}

- (void)setTripOrigin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfxController, 0);
  objc_storeStrong((id *)&self->_pendingETARoute, 0);
  objc_storeStrong((id *)&self->_pendingETARequest, 0);
  objc_storeStrong((id *)&self->_dateOfLastUpdate, 0);
  objc_storeStrong((id *)&self->_etaTimer, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_transitUpdater, 0);
  objc_storeStrong((id *)&self->_tripOrigin, 0);
  objc_storeStrong((id *)&self->_throttleToken, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end