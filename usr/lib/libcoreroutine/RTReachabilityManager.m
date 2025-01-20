@interface RTReachabilityManager
+ (id)reachabilityToString:(unint64_t)a3;
- (NWPathEvaluator)pathEvaluator;
- (RTReachabilityManager)init;
- (RTReachabilityManager)initWithPathEvaluator:(id)a3;
- (id)currentReachabilityString;
- (unint64_t)currentReachability;
- (unint64_t)reachability;
- (void)_fetchCurrentReachability:(id)a3;
- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)_processReachabilityChange:(id)a3;
- (void)_shutdownWithHandler:(id)a3;
- (void)dealloc;
- (void)fetchCurrentReachability:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCurrentReachability:(unint64_t)a3;
- (void)setPathEvaluator:(id)a3;
@end

@implementation RTReachabilityManager

- (RTReachabilityManager)init
{
  v3 = [MEMORY[0x1E4F38C20] sharedDefaultEvaluator];
  v4 = [(RTReachabilityManager *)self initWithPathEvaluator:v3];

  return v4;
}

- (RTReachabilityManager)initWithPathEvaluator:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTReachabilityManager;
    v6 = [(RTNotifier *)&v11 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_pathEvaluator, a3);
      v7->_currentReachability = 0;
      [(NWPathEvaluator *)v7->_pathEvaluator addObserver:v7 forKeyPath:@"path" options:5 context:0];
      v7->_observingReachabilityChanges = 1;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: pathEvaluator", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = +[RTNotification notificationName];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    v10 = [[RTReachabilityMonitorNotificationReachabilityChanged alloc] initWithReachability:self->_currentReachability];
    [(RTNotifier *)self postNotification:v10 toObserver:v6];
  }
  else
  {
    objc_super v11 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v13, 0xCu);
    }

    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412802;
      id v14 = v7;
      __int16 v15 = 2080;
      v16 = "-[RTReachabilityManager internalAddObserver:name:]";
      __int16 v17 = 1024;
      int v18 = 75;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "unsupported notification, %@ (in %s:%d)", (uint8_t *)&v13, 0x1Cu);
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = +[RTNotification notificationName];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v9, 0xCu);
    }

    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412802;
      id v10 = v4;
      __int16 v11 = 2080;
      v12 = "-[RTReachabilityManager internalRemoveObserver:name:]";
      __int16 v13 = 1024;
      int v14 = 87;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "unsupported notification, %@ (in %s:%d)", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

- (void)dealloc
{
  if (self->_observingReachabilityChanges)
  {
    [(NWPathEvaluator *)self->_pathEvaluator removeObserver:self forKeyPath:@"path" context:0];
    self->_observingReachabilityChanges = 0;
  }
  self->_currentReachability = 0;
  v3.receiver = self;
  v3.super_class = (Class)RTReachabilityManager;
  [(RTReachabilityManager *)&v3 dealloc];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_observingReachabilityChanges)
  {
    [(NWPathEvaluator *)self->_pathEvaluator removeObserver:self forKeyPath:@"path" context:0];
    id v4 = v5;
    self->_observingReachabilityChanges = 0;
  }
  self->_currentReachability = 0;
  if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v5, 0);
    id v4 = v5;
  }
}

- (void)_processReachabilityChange:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 path];
  uint64_t v6 = [v5 status];

  unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFDLL;
  if ((v6 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    if (v7 != 1)
    {
      v25 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "unhandled reachability case", (uint8_t *)&v26, 2u);
      }

      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v21 = (RTReachabilityMonitorNotificationReachabilityChanged *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v21->super.super, OS_LOG_TYPE_ERROR))
      {
        int v26 = 136315394;
        v27 = "-[RTReachabilityManager _processReachabilityChange:]";
        __int16 v28 = 1024;
        LODWORD(v29) = 149;
        _os_log_error_impl(&dword_1D9BFA000, &v21->super.super, OS_LOG_TYPE_ERROR, "unhandled reachability case (in %s:%d)", (uint8_t *)&v26, 0x12u);
      }
      goto LABEL_17;
    }
    v8 = [v4 path];
    unsigned int v9 = [v8 usesInterfaceType:1];

    uint64_t v10 = v9;
    __int16 v11 = [v4 path];
    int v12 = [v11 usesInterfaceType:2];

    if (v12) {
      uint64_t v13 = v10 | 2;
    }
    else {
      uint64_t v13 = v10;
    }
    int v14 = [v4 path];
    int v15 = [v14 usesInterfaceType:0];

    v16 = [v4 path];
    int v17 = [v16 usesInterfaceType:3];

    int v18 = [v4 path];
    int v19 = [v18 usesInterfaceType:4];

    if (v19 | v17 | v15) {
      unint64_t v7 = v13 | 4;
    }
    else {
      unint64_t v7 = v13;
    }
  }
  unint64_t currentReachability = self->_currentReachability;
  if (currentReachability != v7)
  {
    self->_unint64_t currentReachability = v7;
    v21 = [[RTReachabilityMonitorNotificationReachabilityChanged alloc] initWithReachability:self->_currentReachability];
    [(RTNotifier *)self postNotification:v21];
    v22 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = [(id)objc_opt_class() reachabilityToString:v7];
      v24 = [(id)objc_opt_class() reachabilityToString:currentReachability];
      int v26 = 138412546;
      v27 = v23;
      __int16 v28 = 2112;
      v29 = v24;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "reachability changed to, %@, from, %@", (uint8_t *)&v26, 0x16u);
    }
LABEL_17:
  }
}

+ (id)reachabilityToString:(unint64_t)a3
{
  if (a3)
  {
    char v3 = a3;
    id v4 = objc_opt_new();
    id v5 = v4;
    if (v3)
    {
      [v4 addObject:@"WiFi"];
      if ((v3 & 2) == 0)
      {
LABEL_4:
        if ((v3 & 4) == 0)
        {
LABEL_6:
          uint64_t v6 = [v5 componentsJoinedByString:@", "];

          goto LABEL_8;
        }
LABEL_5:
        [v5 addObject:@"Other"];
        goto LABEL_6;
      }
    }
    else if ((v3 & 2) == 0)
    {
      goto LABEL_4;
    }
    [v5 addObject:@"Cellular"];
    if ((v3 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v6 = @"No Connection";
LABEL_8:

  return v6;
}

- (id)currentReachabilityString
{
  return +[RTReachabilityManager reachabilityToString:self->_currentReachability];
}

- (void)fetchCurrentReachability:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__RTReachabilityManager_fetchCurrentReachability___block_invoke;
    v6[3] = &unk_1E6B90CE0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __50__RTReachabilityManager_fetchCurrentReachability___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCurrentReachability:*(void *)(a1 + 40)];
}

- (void)_fetchCurrentReachability:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  if (v4)
  {
    if (self->_pathEvaluator)
    {
      (*((void (**)(id, unint64_t))v4 + 2))(v4, self->_currentReachability);
    }
    else
    {
      id v7 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "attempted to fetch current reachability with nil path evaluator", (uint8_t *)&v9, 2u);
      }

      v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315394;
        uint64_t v10 = "-[RTReachabilityManager _fetchCurrentReachability:]";
        __int16 v11 = 1024;
        int v12 = 212;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "attempted to fetch current reachability with nil path evaluator (in %s:%d)", (uint8_t *)&v9, 0x12u);
      }

      v5[2](v5, 0);
    }
  }
  else
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&v9, 2u);
    }
  }
}

- (unint64_t)reachability
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  char v3 = [(RTNotifier *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__RTReachabilityManager_reachability__block_invoke;
  v6[3] = &unk_1E6B93860;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __37__RTReachabilityManager_reachability__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48);
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__RTReachabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6B90F80;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __72__RTReachabilityManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _observeValueForKeyPath:*(void *)(a1 + 40) ofObject:*(void *)(a1 + 48) change:*(void *)(a1 + 56) context:*(void *)(a1 + 64)];
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a4;
  if ([a3 isEqualToString:@"path"]
    && [(NWPathEvaluator *)self->_pathEvaluator isEqual:v8])
  {
    [(RTReachabilityManager *)self _processReachabilityChange:v8];
  }
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
}

- (unint64_t)currentReachability
{
  return self->_currentReachability;
}

- (void)setCurrentReachability:(unint64_t)a3
{
  self->_unint64_t currentReachability = a3;
}

- (void).cxx_destruct
{
}

@end