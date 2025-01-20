@interface RTBackgroundInertialOdometryManager
+ (id)vendedClasses;
+ (int64_t)periodicPurgePolicy;
- (CLLocationManagerRoutine)routineLocationManager;
- (RTBackgroundInertialOdometryManager)init;
- (RTBackgroundInertialOdometryManager)initWithBackgroundInertialOdometryStore:(id)a3;
- (RTBackgroundInertialOdometryStore)inertialOdometryStore;
- (void)_addBackgroundInertialOdometrySamples:(id)a3 handler:(id)a4;
- (void)_fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4;
- (void)addBackgroundInertialOdometrySamples:(id)a3 handler:(id)a4;
- (void)fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4;
- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)setInertialOdometryStore:(id)a3;
- (void)setRoutineLocationManager:(id)a3;
@end

@implementation RTBackgroundInertialOdometryManager

- (RTBackgroundInertialOdometryManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBackgroundInertialOdometryStore_);
}

- (RTBackgroundInertialOdometryManager)initWithBackgroundInertialOdometryStore:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTBackgroundInertialOdometryManager;
    v6 = [(RTNotifier *)&v11 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_inertialOdometryStore, a3);
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
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inertialOdometryStore", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)_fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RTBackgroundInertialOdometryManager *)self inertialOdometryStore];
  [v8 fetchStoredBackgroundInertialOdometrySamplesWithOptions:v7 handler:v6];
}

- (void)fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTBackgroundInertialOdometryManager fetchBackgroundInertialOdometrySamplesWithOptions:handler:]";
    __int16 v19 = 1024;
    int v20 = 53;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTBackgroundInertialOdometryManager fetchBackgroundInertialOdometrySamplesWithOptions:handler:]";
      __int16 v19 = 1024;
      int v20 = 54;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  objc_super v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__RTBackgroundInertialOdometryManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

uint64_t __97__RTBackgroundInertialOdometryManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchBackgroundInertialOdometrySamplesWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_addBackgroundInertialOdometrySamples:(id)a3 handler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    v9 = [(RTBackgroundInertialOdometryManager *)self inertialOdometryStore];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__RTBackgroundInertialOdometryManager__addBackgroundInertialOdometrySamples_handler___block_invoke;
    v14[3] = &unk_1E6B916B8;
    v14[4] = self;
    SEL v16 = a2;
    id v15 = v8;
    [v9 storeWritableObjects:v7 handler:v14];
  }
  else if (v8)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F5CFE8];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"requires valid inertial odometry samples.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v13 = [v10 errorWithDomain:v11 code:7 userInfo:v12];
    (*((void (**)(id, void *))v8 + 2))(v8, v13);
  }
}

void __85__RTBackgroundInertialOdometryManager__addBackgroundInertialOdometrySamples_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v9 = 138412802;
      v10 = v7;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%@:%@,error,%@", (uint8_t *)&v9, 0x20u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)addBackgroundInertialOdometrySamples:(id)a3 handler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = "-[RTBackgroundInertialOdometryManager addBackgroundInertialOdometrySamples:handler:]";
    __int16 v22 = 1024;
    int v23 = 91;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: samples (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "-[RTBackgroundInertialOdometryManager addBackgroundInertialOdometrySamples:handler:]";
      __int16 v22 = 1024;
      int v23 = 92;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  id v12 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__RTBackgroundInertialOdometryManager_addBackgroundInertialOdometrySamples_handler___block_invoke;
  v15[3] = &unk_1E6B90C40;
  id v16 = v7;
  uint64_t v17 = self;
  id v18 = v9;
  SEL v19 = a2;
  id v13 = v9;
  id v14 = v7;
  dispatch_async(v12, v15);
}

uint64_t __84__RTBackgroundInertialOdometryManager_addBackgroundInertialOdometrySamples_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__RTBackgroundInertialOdometryManager_addBackgroundInertialOdometrySamples_handler___block_invoke_2;
  v5[3] = &unk_1E6B971C0;
  uint64_t v3 = *(void *)(a1 + 56);
  v5[4] = *(void *)(a1 + 40);
  v5[5] = v3;
  [v2 enumerateObjectsUsingBlock:v5];
  return [*(id *)(a1 + 40) _addBackgroundInertialOdometrySamples:*(void *)(a1 + 32) handler:*(void *)(a1 + 48)];
}

void __84__RTBackgroundInertialOdometryManager_addBackgroundInertialOdometrySamples_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    int v10 = 138413058;
    __int16 v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%@:%@, %@: %@", (uint8_t *)&v10, 0x2Au);
  }
}

+ (int64_t)periodicPurgePolicy
{
  return 1;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__RTBackgroundInertialOdometryManager_performPurgeOfType_referenceDate_completion___block_invoke;
  block[3] = &unk_1E6B908B8;
  id v17 = v10;
  int64_t v18 = a3;
  id v15 = v9;
  __int16 v16 = self;
  SEL v19 = a2;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, block);
}

void __83__RTBackgroundInertialOdometryManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56) <= 2uLL && (id v2 = *(id *)(a1 + 32)) != 0)
  {
    id v3 = v2;
    v4 = [*(id *)(a1 + 40) inertialOdometryStore];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __83__RTBackgroundInertialOdometryManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v6[3] = &unk_1E6B90890;
    uint64_t v8 = *(void *)(a1 + 64);
    id v7 = *(id *)(a1 + 48);
    [v4 purgeBackgroundInertialOdometrySamplesPredating:v3 handler:v6];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __83__RTBackgroundInertialOdometryManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%@, performPurgeOfType, error, %@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)vendedClasses
{
  id v2 = (void *)vendedClasses_vendedClasses_2;
  if (!vendedClasses_vendedClasses_2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:objc_opt_class(), 0];
    v4 = (void *)vendedClasses_vendedClasses_2;
    vendedClasses_vendedClasses_2 = v3;

    id v2 = (void *)vendedClasses_vendedClasses_2;
  }

  return v2;
}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = [(RTNotifier *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__RTBackgroundInertialOdometryManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
    v12[3] = &unk_1E6B927F8;
    id v13 = v8;
    __int16 v14 = self;
    id v15 = v9;
    unint64_t v16 = a4;
    dispatch_async(v10, v12);

    __int16 v11 = v13;
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

void __88__RTBackgroundInertialOdometryManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    int v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F5CFE8];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"options cannot be nil";
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = (__CFString **)v17;
    uint64_t v10 = &v16;
LABEL_8:
    __int16 v11 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
    id v12 = [v6 errorWithDomain:v7 code:7 userInfo:v11];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    return;
  }
  uint64_t v3 = [v2 enumeratedType];
  v4 = [(id)objc_opt_class() vendedClasses];
  uint64_t v5 = [v4 member:v3];

  if (!v5)
  {
    int v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F5CFE8];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v15 = @"the type specified by options is not vended by this manager";
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = &v15;
    uint64_t v10 = &v14;
    goto LABEL_8;
  }
  id v13 = [*(id *)(a1 + 40) inertialOdometryStore];
  [v13 fetchEnumerableObjectsWithOptions:*(void *)(a1 + 32) offset:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (CLLocationManagerRoutine)routineLocationManager
{
  return self->_routineLocationManager;
}

- (void)setRoutineLocationManager:(id)a3
{
}

- (RTBackgroundInertialOdometryStore)inertialOdometryStore
{
  return self->_inertialOdometryStore;
}

- (void)setInertialOdometryStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inertialOdometryStore, 0);

  objc_storeStrong((id *)&self->_routineLocationManager, 0);
}

@end