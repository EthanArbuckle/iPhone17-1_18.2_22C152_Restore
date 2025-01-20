@interface RTTripSegmentInertialDataManager
+ (id)vendedClasses;
+ (int64_t)periodicPurgePolicy;
- (CLLocationManagerRoutine)routineLocationManager;
- (RTTripSegmentInertialDataManager)init;
- (RTTripSegmentInertialDataManager)initWithInertialDataStore:(id)a3 routineLocationManager:(id)a4;
- (RTTripSegmentInertialDataStore)inertialDataStore;
- (void)_addTripSegmentInertialData:(id)a3 handler:(id)a4;
- (void)_fetchTripSegmentInertialDataWithOptions:(id)a3 handler:(id)a4;
- (void)addTripSegmentInertialData:(id)a3 handler:(id)a4;
- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5;
- (void)fetchTripSegmentInertialDataWithOptions:(id)a3 handler:(id)a4;
- (void)inertialDataManager:(id)a3 didUpdateInertialData:(id)a4;
- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5;
- (void)setInertialDataStore:(id)a3;
- (void)setRoutineLocationManager:(id)a3;
@end

@implementation RTTripSegmentInertialDataManager

- (RTTripSegmentInertialDataManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithInertialDataStore_routineLocationManager_);
}

- (RTTripSegmentInertialDataManager)initWithInertialDataStore:(id)a3 routineLocationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: inertialDataStore";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: routineLocationManager";
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTTripSegmentInertialDataManager;
  v10 = [(RTNotifier *)&v16 init];
  p_isa = (id *)&v10->super.super.super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_inertialDataStore, a3);
    objc_storeStrong(p_isa + 4, a4);
    [p_isa[4] setInertialDelegate:p_isa];
  }
  self = p_isa;
  v12 = self;
LABEL_10:

  return v12;
}

- (void)_fetchTripSegmentInertialDataWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentInertialDataManager: invoking RTTripSegmentInertialDataStore fetchTripSegmentInertialDataWithOptions", v10, 2u);
  }

  v9 = [(RTTripSegmentInertialDataManager *)self inertialDataStore];
  [v9 fetchStoredTripSegmentInertialDataWithOptions:v7 handler:v6];
}

- (void)fetchTripSegmentInertialDataWithOptions:(id)a3 handler:(id)a4
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
    v18 = "-[RTTripSegmentInertialDataManager fetchTripSegmentInertialDataWithOptions:handler:]";
    __int16 v19 = 1024;
    int v20 = 62;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTTripSegmentInertialDataManager fetchTripSegmentInertialDataWithOptions:handler:]";
      __int16 v19 = 1024;
      int v20 = 63;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__RTTripSegmentInertialDataManager_fetchTripSegmentInertialDataWithOptions_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

uint64_t __84__RTTripSegmentInertialDataManager_fetchTripSegmentInertialDataWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchTripSegmentInertialDataWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_addTripSegmentInertialData:(id)a3 handler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    v9 = [(RTTripSegmentInertialDataManager *)self inertialDataStore];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__RTTripSegmentInertialDataManager__addTripSegmentInertialData_handler___block_invoke;
    v14[3] = &unk_1E6B90890;
    SEL v16 = a2;
    id v15 = v8;
    [v9 storeWritableObjects:v7 handler:v14];

    v10 = v15;
LABEL_5:

    goto LABEL_6;
  }
  if (v8)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F5CFE8];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"requires valid locations.";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v13 = [v11 errorWithDomain:v12 code:7 userInfo:v10];
    (*((void (**)(id, void *))v8 + 2))(v8, v13);

    goto LABEL_5;
  }
LABEL_6:
}

void __72__RTTripSegmentInertialDataManager__addTripSegmentInertialData_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v7 = 138412546;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "RTTripSegmentInertialDataStore,%@,error,%@", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)addTripSegmentInertialData:(id)a3 handler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
  __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "-[RTTripSegmentInertialDataManager addTripSegmentInertialData:handler:]";
    __int16 v20 = 1024;
    int v21 = 105;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: samples (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "-[RTTripSegmentInertialDataManager addTripSegmentInertialData:handler:]";
      __int16 v20 = 1024;
      int v21 = 106;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  uint64_t v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__RTTripSegmentInertialDataManager_addTripSegmentInertialData_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  id v15 = v6;
  SEL v16 = self;
  id v17 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

void __71__RTTripSegmentInertialDataManager_addTripSegmentInertialData_handler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_33];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__RTTripSegmentInertialDataManager_addTripSegmentInertialData_handler___block_invoke_23;
  v5[3] = &unk_1E6B94978;
  id v6 = v2;
  id v4 = v2;
  [v3 enumerateObjectsUsingBlock:v5];
  [*(id *)(a1 + 40) _addTripSegmentInertialData:v4 handler:*(void *)(a1 + 48)];
}

void __71__RTTripSegmentInertialDataManager_addTripSegmentInertialData_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [v2 timestamp];
    [v4 timeIntervalSinceReferenceDate];
    uint64_t v6 = v5;
    [v2 deltaCourse_rad];
    uint64_t v8 = v7;
    [v2 deltaSpeed_mps];
    uint64_t v10 = v9;
    [v2 dataPeriod_s];
    uint64_t v12 = v11;
    [v2 deltaCourseVar_rad2];
    uint64_t v14 = v13;
    [v2 deltaSpeedVar_mps2];
    uint64_t v16 = v15;
    [v2 deltaCourseSpeedCovar_radmps];
    int v18 = 134219521;
    uint64_t v19 = v6;
    __int16 v20 = 2049;
    uint64_t v21 = v8;
    __int16 v22 = 2049;
    uint64_t v23 = v10;
    __int16 v24 = 2049;
    uint64_t v25 = v12;
    __int16 v26 = 2049;
    uint64_t v27 = v14;
    __int16 v28 = 2049;
    uint64_t v29 = v16;
    __int16 v30 = 2049;
    uint64_t v31 = v17;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "RTInertialDataManager,CLTripSegmentInertialData,gpsTime,%.3lf,deltaCourse_rad,%{private}.3lf,deltaSpeed_mps,%{private}.3lf,dataPeriod_s,%{private}.3lf,deltaCourseVar_rad2,%{private}8lf,deltaSpeedVar_mps2,%{private}8lf,deltaCourseSpeedCovar_radmps,%{private}8lf", (uint8_t *)&v18, 0x48u);
  }
}

void __71__RTTripSegmentInertialDataManager_addTripSegmentInertialData_handler___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isValid])
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "invalid CLTripSegmentInertialData,%@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)inertialDataManager:(id)a3 didUpdateInertialData:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__RTTripSegmentInertialDataManager_inertialDataManager_didUpdateInertialData___block_invoke;
  v8[3] = &unk_1E6B90CB8;
  id v9 = v6;
  SEL v10 = a2;
  id v7 = v6;
  [(RTTripSegmentInertialDataManager *)self addTripSegmentInertialData:v7 handler:v8];
}

void __78__RTTripSegmentInertialDataManager_inertialDataManager_didUpdateInertialData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%@, addTripSegmentInertialData, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__RTTripSegmentInertialDataManager_performPurgeOfType_referenceDate_completion___block_invoke;
  block[3] = &unk_1E6B908B8;
  id v17 = v10;
  int64_t v18 = a3;
  id v15 = v9;
  uint64_t v16 = self;
  SEL v19 = a2;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, block);
}

void __80__RTTripSegmentInertialDataManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56) <= 2uLL && (id v2 = *(id *)(a1 + 32)) != 0)
  {
    id v3 = v2;
    id v4 = [*(id *)(a1 + 40) inertialDataStore];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80__RTTripSegmentInertialDataManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v6[3] = &unk_1E6B90890;
    uint64_t v8 = *(void *)(a1 + 64);
    id v7 = *(id *)(a1 + 48);
    [v4 purgeTripSegmentInertialDataPredating:v3 handler:v6];
  }
  else
  {
    int v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __80__RTTripSegmentInertialDataManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
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
  id v2 = (void *)vendedClasses_vendedClasses_0;
  if (!vendedClasses_vendedClasses_0)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:objc_opt_class(), 0];
    id v4 = (void *)vendedClasses_vendedClasses_0;
    vendedClasses_vendedClasses_0 = v3;

    id v2 = (void *)vendedClasses_vendedClasses_0;
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
    v12[2] = __85__RTTripSegmentInertialDataManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
    v12[3] = &unk_1E6B927F8;
    id v13 = v8;
    uint64_t v14 = self;
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

void __85__RTTripSegmentInertialDataManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(uint64_t a1)
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
  id v4 = [(id)objc_opt_class() vendedClasses];
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
  id v13 = [*(id *)(a1 + 40) inertialDataStore];
  [v13 fetchEnumerableObjectsWithOptions:*(void *)(a1 + 32) offset:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (CLLocationManagerRoutine)routineLocationManager
{
  return self->_routineLocationManager;
}

- (void)setRoutineLocationManager:(id)a3
{
}

- (RTTripSegmentInertialDataStore)inertialDataStore
{
  return self->_inertialDataStore;
}

- (void)setInertialDataStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inertialDataStore, 0);

  objc_storeStrong((id *)&self->_routineLocationManager, 0);
}

@end