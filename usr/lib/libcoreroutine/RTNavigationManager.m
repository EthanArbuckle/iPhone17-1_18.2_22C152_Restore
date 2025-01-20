@interface RTNavigationManager
+ (id)RTGEOTransportTypeToString:(unint64_t)a3;
- (BOOL)monitorNavigationState;
- (BOOL)monitorRouteSummary;
- (BOOL)routineEnabled;
- (GEONavigationListener)navigationListener;
- (GEONavigationRouteSummary)routeSummary;
- (RTAuthorizationManager)authorizationManager;
- (RTMapServiceManager)mapServiceManager;
- (RTNavigationManager)init;
- (RTNavigationManager)initWithAuthorizationManager:(id)a3 mapServiceManager:(id)a4;
- (void)_fetchNavigationRouteSummaryWithHandler:(id)a3;
- (void)_setup;
- (void)_shouldSetMonitorNavigationState;
- (void)_shouldSetMonitorRouteSummary;
- (void)_shouldSetNavigationListenerDelegate;
- (void)_shutdownWithHandler:(id)a3;
- (void)_updateNavigationState:(id)a3;
- (void)dealloc;
- (void)fetchNavigationRouteSummaryWithHandler:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5;
- (void)navigationListener:(id)a3 didUpdateGuidanceState:(id)a4;
- (void)navigationListener:(id)a3 didUpdateRouteSummary:(id)a4;
- (void)onAuthorizationNotification:(id)a3;
- (void)setAuthorizationManager:(id)a3;
- (void)setMapServiceManager:(id)a3;
- (void)setMonitorNavigationState:(BOOL)a3;
- (void)setMonitorRouteSummary:(BOOL)a3;
- (void)setNavigationListener:(id)a3;
- (void)setRouteSummary:(id)a3;
- (void)setRoutineEnabled:(BOOL)a3;
- (void)setup;
@end

@implementation RTNavigationManager

- (RTNavigationManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAuthorizationManager_mapServiceManager_);
}

- (RTNavigationManager)initWithAuthorizationManager:(id)a3 mapServiceManager:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTNavigationManager;
    v9 = [(RTNotifier *)&v17 init];
    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F64770]);
      v11 = [(RTNotifier *)v9 queue];
      uint64_t v12 = [v10 initWithQueue:v11];
      navigationListener = v9->_navigationListener;
      v9->_navigationListener = (GEONavigationListener *)v12;

      objc_storeStrong((id *)&v9->_authorizationManager, a3);
      objc_storeStrong((id *)&v9->_mapServiceManager, a4);
      v9->_monitorRouteSummary = 0;
      v9->_monitorNavigationState = 0;
      v9->_routineEnabled = 1;
      [(RTNavigationManager *)v9 setup];
    }
    self = v9;
    v14 = self;
  }
  else
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTNavigationManager initWithAuthorizationManager:mapServiceManager:]";
      __int16 v20 = 1024;
      int v21 = 137;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: authorizationManager (in %s:%d)", buf, 0x12u);
    }

    v14 = 0;
  }

  return v14;
}

- (void)setup
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__RTNavigationManager_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __28__RTNavigationManager_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_setup
{
  authorizationManager = self->_authorizationManager;
  id v4 = +[RTNotification notificationName];
  [(RTNotifier *)authorizationManager addObserver:self selector:sel_onAuthorizationNotification_ name:v4];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v5 = a3;
  [(GEONavigationListener *)self->_navigationListener setDelegate:0];
  [(RTNotifier *)self->_authorizationManager removeObserver:self];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    id v4 = v5;
  }
}

- (void)dealloc
{
  [(GEONavigationListener *)self->_navigationListener setDelegate:0];
  [(RTNotifier *)self->_authorizationManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)RTNavigationManager;
  [(RTNavigationManager *)&v3 dealloc];
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = +[RTNotification notificationName];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    [(RTNavigationManager *)self _shouldSetMonitorRouteSummary];
  }
  else
  {
    v11 = +[RTNotification notificationName];
    int v12 = [v8 isEqualToString:v11];

    if (v12)
    {
      [(RTNavigationManager *)self _shouldSetMonitorNavigationState];
    }
    else
    {
      v13 = _rt_log_facility_get_os_log(RTLogFacilityNavigation);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = NSStringFromSelector(a2);
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        int v17 = 138412802;
        v18 = v14;
        __int16 v19 = 2112;
        id v20 = v8;
        __int16 v21 = 2112;
        uint64_t v22 = v16;
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@, observer, %@", (uint8_t *)&v17, 0x20u);
      }
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = +[RTNotification notificationName];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    [(RTNavigationManager *)self _shouldSetMonitorRouteSummary];
  }
  else
  {
    v11 = +[RTNotification notificationName];
    int v12 = [v8 isEqualToString:v11];

    if (v12)
    {
      [(RTNavigationManager *)self _shouldSetMonitorNavigationState];
    }
    else
    {
      v13 = _rt_log_facility_get_os_log(RTLogFacilityNavigation);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = NSStringFromSelector(a2);
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        int v17 = 138412802;
        v18 = v14;
        __int16 v19 = 2112;
        id v20 = v8;
        __int16 v21 = 2112;
        uint64_t v22 = v16;
        _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@, observer, %@", (uint8_t *)&v17, 0x20u);
      }
    }
  }
}

+ (id)RTGEOTransportTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return @"Automobile";
  }
  else {
    return off_1E6B9B868[a3 - 1];
  }
}

- (void)_shouldSetMonitorRouteSummary
{
  objc_super v3 = +[RTNotification notificationName];
  BOOL v4 = [(RTNotifier *)self getNumberOfObservers:v3] != 0;

  [(RTNavigationManager *)self setMonitorRouteSummary:v4];
}

- (void)_shouldSetMonitorNavigationState
{
  objc_super v3 = +[RTNotification notificationName];
  BOOL v4 = [(RTNotifier *)self getNumberOfObservers:v3] != 0;

  [(RTNavigationManager *)self setMonitorNavigationState:v4];
}

- (void)_shouldSetNavigationListenerDelegate
{
  if (self->_routineEnabled && (self->_monitorRouteSummary || self->_monitorNavigationState))
  {
    objc_super v3 = [(RTNavigationManager *)self navigationListener];
    BOOL v4 = [v3 delegate];

    if (v4) {
      return;
    }
    id v5 = [(RTNavigationManager *)self navigationListener];
    id v7 = v5;
    v6 = self;
  }
  else
  {
    id v5 = [(RTNavigationManager *)self navigationListener];
    id v7 = v5;
    v6 = 0;
  }
  [v5 setDelegate:v6];
}

- (void)setMonitorRouteSummary:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_monitorRouteSummary != a3)
  {
    self->_monitorRouteSummary = a3;
    [(RTNavigationManager *)self _shouldSetNavigationListenerDelegate];
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityNavigation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = NSStringFromSelector(a2);
      id v7 = (void *)v6;
      if (self->_monitorRouteSummary) {
        id v8 = @"YES";
      }
      else {
        id v8 = @"NO";
      }
      int v9 = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      int v12 = v8;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, monitor navigation route summary, %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)setMonitorNavigationState:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_monitorNavigationState != a3)
  {
    self->_monitorNavigationState = a3;
    [(RTNavigationManager *)self _shouldSetNavigationListenerDelegate];
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityNavigation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = NSStringFromSelector(a2);
      id v7 = (void *)v6;
      if (self->_monitorRouteSummary) {
        id v8 = @"YES";
      }
      else {
        id v8 = @"NO";
      }
      int v9 = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      int v12 = v8;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, monitor navigation state, %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)setRoutineEnabled:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_routineEnabled != a3)
  {
    self->_routineEnabled = a3;
    [(RTNavigationManager *)self _shouldSetNavigationListenerDelegate];
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityNavigation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = NSStringFromSelector(a2);
      id v7 = (void *)v6;
      if (self->_routineEnabled) {
        id v8 = @"YES";
      }
      else {
        id v8 = @"NO";
      }
      int v9 = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      int v12 = v8;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, routine enabled, %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)setRouteSummary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_routeSummary = &self->_routeSummary;
  if ([(GEONavigationRouteSummary *)self->_routeSummary isEqual:v6])
  {
    _rt_log_facility_get_os_log(RTLogFacilityNavigation);
    id v8 = (RTNavigationManagerRouteSummaryNotification *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_INFO))
    {
      int v9 = NSStringFromSelector(a2);
      uint64_t v10 = *p_routeSummary;
      int v13 = 138412802;
      v14 = v9;
      __int16 v15 = 2112;
      v16 = v10;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D9BFA000, &v8->super.super, OS_LOG_TYPE_INFO, "%@, self.routeSummary, %@, routeSummary, %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_routeSummary, a3);
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityNavigation);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = NSStringFromSelector(a2);
      int v13 = 138412546;
      v14 = v12;
      __int16 v15 = 2112;
      v16 = (GEONavigationRouteSummary *)v6;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, route summary, %@", (uint8_t *)&v13, 0x16u);
    }
    id v8 = [[RTNavigationManagerRouteSummaryNotification alloc] initWithRouteSummary:v6];
    if (v8) {
      [(RTNotifier *)self postNotification:v8];
    }
  }
}

- (void)onAuthorizationNotification:(id)a3
{
  id v5 = a3;
  id v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__RTNavigationManager_onAuthorizationNotification___block_invoke;
  block[3] = &unk_1E6B91220;
  uint64_t v10 = self;
  SEL v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __51__RTNavigationManager_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityNavigation);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_super v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    BOOL v4 = [*(id *)(a1 + 32) name];
    int v9 = 138412546;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    int v12 = v4;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%@, received authorization notification, %@", (uint8_t *)&v9, 0x16u);
  }
  id v5 = [*(id *)(a1 + 32) name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = *(id *)(a1 + 32);
    [*(id *)(a1 + 40) setRoutineEnabled:[v8 enabled]];
  }
}

- (void)_updateNavigationState:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityNavigation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = NSStringFromSelector(a2);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, navigation state, %@", (uint8_t *)&v9, 0x16u);
  }
  if ([v5 hasNavigationState])
  {
    id v8 = -[RTNavigationManagerNavigationStateNotification initWithNavigationState:]([RTNavigationManagerNavigationStateNotification alloc], "initWithNavigationState:", [v5 navigationState]);
    if (v8) {
      [(RTNotifier *)self postNotification:v8];
    }
  }
}

- (void)navigationListener:(id)a3 didUpdateRouteSummary:(id)a4
{
}

- (void)navigationListener:(id)a3 didUpdateGuidanceState:(id)a4
{
}

- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5
{
  if (!a4) {
    -[RTNavigationManager setRouteSummary:](self, "setRouteSummary:", 0, 0, *(void *)&a5);
  }
}

- (void)fetchNavigationRouteSummaryWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__RTNavigationManager_fetchNavigationRouteSummaryWithHandler___block_invoke;
    v6[3] = &unk_1E6B90CE0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __62__RTNavigationManager_fetchNavigationRouteSummaryWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchNavigationRouteSummaryWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchNavigationRouteSummaryWithHandler:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *, id))a3;
  if (v5)
  {
    id v6 = [(RTNavigationManager *)self routeSummary];

    if (v6)
    {
      aSelector = a2;
      id v7 = [(RTNavigationManager *)self mapServiceManager];
      id v8 = [MEMORY[0x1E4F29128] UUID];
      int v9 = [(RTNavigationManager *)self routeSummary];
      uint64_t v10 = [v9 origin];
      __int16 v11 = [v10 mapItemStorage];
      id v12 = [MEMORY[0x1E4F1C9C8] date];
      id v32 = 0;
      uint64_t v30 = [v7 mapItemWithIdentifier:v8 geoMapItemStorage:v11 source:64 creationDate:v12 error:&v32];
      id v13 = v32;

      if (v13)
      {
        v14 = [MEMORY[0x1E4F1C978] array];
        v5[2](v5, v14, v13);
        __int16 v15 = (void *)v30;
      }
      else
      {
        __int16 v17 = [(RTNavigationManager *)self mapServiceManager];
        id v18 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v19 = [(RTNavigationManager *)self routeSummary];
        id v20 = [v19 destination];
        __int16 v21 = [v20 mapItemStorage];
        uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
        id v31 = 0;
        v14 = [v17 mapItemWithIdentifier:v18 geoMapItemStorage:v21 source:64 creationDate:v22 error:&v31];
        id v13 = v31;

        if (v13)
        {
          uint64_t v23 = [MEMORY[0x1E4F1C978] array];
          v5[2](v5, v23, v13);
          __int16 v15 = (void *)v30;
        }
        else
        {
          __int16 v15 = (void *)v30;
          uint64_t v23 = [[RTNavigationRouteSummary alloc] initWithOriginMapItem:v30 destinationMapItem:v14];
          v24 = _rt_log_facility_get_os_log(RTLogFacilityNavigation);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = (objc_class *)objc_opt_class();
            v26 = NSStringFromClass(v25);
            v27 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412802;
            v35 = v26;
            __int16 v36 = 2112;
            v37 = v27;
            __int16 v38 = 2112;
            v39 = v23;
            _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, %@, navigation route summary, %@", buf, 0x20u);
          }
          v33 = v23;
          v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
          v5[2](v5, v28, 0);
        }
      }
    }
    else
    {
      v16 = [MEMORY[0x1E4F1C978] array];
      v5[2](v5, v16, 0);
    }
  }
}

- (GEONavigationListener)navigationListener
{
  return self->_navigationListener;
}

- (void)setNavigationListener:(id)a3
{
}

- (BOOL)monitorRouteSummary
{
  return self->_monitorRouteSummary;
}

- (BOOL)monitorNavigationState
{
  return self->_monitorNavigationState;
}

- (BOOL)routineEnabled
{
  return self->_routineEnabled;
}

- (GEONavigationRouteSummary)routeSummary
{
  return self->_routeSummary;
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_routeSummary, 0);

  objc_storeStrong((id *)&self->_navigationListener, 0);
}

@end