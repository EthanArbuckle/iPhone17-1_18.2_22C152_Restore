@interface SMCloudKitFunction
- (OS_dispatch_queue)queue;
- (SMCloudKitFunction)initWithEnvironment:(unint64_t)a3 version:(id)a4 queue:(id)a5;
- (_TtC13SafetyMonitor23SMCloudKitFunctionSwift)swiftCKF;
- (void)requestSafetyCacheRecordFromZone:(id)a3 withToken:(id)a4 completion:(id)a5;
- (void)setQueue:(id)a3;
- (void)setSwiftCKF:(id)a3;
@end

@implementation SMCloudKitFunction

- (SMCloudKitFunction)initWithEnvironment:(unint64_t)a3 version:(id)a4 queue:(id)a5
{
  v8 = (__CFString *)a4;
  id v9 = a5;
  if (v9)
  {
    v19.receiver = self;
    v19.super_class = (Class)SMCloudKitFunction;
    v10 = [(SMCloudKitFunction *)&v19 init];
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_queue, a5);
      v12 = @"d";
      if (a3 != 1) {
        v12 = 0;
      }
      if (!a3) {
        v12 = @"p";
      }
      if (!v8) {
        v8 = @"1.0";
      }
      v13 = [NSString stringWithFormat:@"%@_%@_%@", @"SafetyMonitorServer", v12, v8];
      v14 = [[_TtC13SafetyMonitor23SMCloudKitFunctionSwift alloc] initWithServiceName:v13];
      swiftCKF = v11->_swiftCKF;
      v11->_swiftCKF = v14;
    }
    self = v11;
    v16 = self;
  }
  else
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

- (void)requestSafetyCacheRecordFromZone:(id)a3 withToken:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v9)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    LOWORD(location[0]) = 0;
    v18 = "Invalid parameter not satisfying: zoneName";
LABEL_10:
    _os_log_error_impl(&dword_25B6E0000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)location, 2u);
    goto LABEL_7;
  }
  if (!v11)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    LOWORD(location[0]) = 0;
    v18 = "Invalid parameter not satisfying: completion";
    goto LABEL_10;
  }
  objc_initWeak(location, self);
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v15 = [(SMCloudKitFunction *)self swiftCKF];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __76__SMCloudKitFunction_requestSafetyCacheRecordFromZone_withToken_completion___block_invoke;
  v19[3] = &unk_265499410;
  objc_copyWeak(v23, location);
  id v20 = v9;
  id v16 = v14;
  id v21 = v16;
  v23[1] = (id)a2;
  id v22 = v12;
  [v15 requestSafetyCacheRecordFromZone:v20 token:v10 completion:v19];

  objc_destroyWeak(v23);
  objc_destroyWeak(location);
LABEL_8:
}

void __76__SMCloudKitFunction_requestSafetyCacheRecordFromZone_withToken_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__SMCloudKitFunction_requestSafetyCacheRecordFromZone_withToken_completion___block_invoke_17;
    block[3] = &unk_2654993E8;
    objc_super v19 = v8;
    id v20 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 64);
    id v21 = v12;
    uint64_t v24 = v13;
    id v23 = *(id *)(a1 + 48);
    id v22 = v7;
    uint64_t v25 = a2;
    dispatch_async(v11, block);

    v14 = v19;
  }
  else
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      v17 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138413570;
      uint64_t v27 = v15;
      __int16 v28 = 2112;
      uint64_t v29 = v16;
      __int16 v30 = 2112;
      v31 = v17;
      __int16 v32 = 1024;
      int v33 = a2;
      __int16 v34 = 2112;
      id v35 = v8;
      __int16 v36 = 2112;
      id v37 = v7;
      _os_log_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cloud kit function released before safety cache request completed,responseCode,%d,error,%@,record,%@", buf, 0x3Au);
    }
  }
}

void __76__SMCloudKitFunction_requestSafetyCacheRecordFromZone_withToken_completion___block_invoke_17(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      uint64_t v48 = v10;
      __int16 v49 = 2112;
      uint64_t v50 = v11;
      __int16 v51 = 2112;
      v52 = v12;
      __int16 v53 = 2112;
      uint64_t v54 = v13;
      _os_log_error_impl(&dword_25B6E0000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,returning error thrown from server: %@", buf, 0x2Au);
    }
LABEL_8:

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    return;
  }
  if (*(void *)(a1 + 56))
  {
    v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 48);
      v5 = NSStringFromSelector(*(SEL *)(a1 + 72));
      *(_DWORD *)buf = 138412802;
      uint64_t v48 = v3;
      __int16 v49 = 2112;
      uint64_t v50 = v4;
      __int16 v51 = 2112;
      v52 = v5;
      _os_log_impl(&dword_25B6E0000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,returning Safety Cache record", buf, 0x20u);
    }
    goto LABEL_8;
  }
  switch(*(void *)(a1 + 80))
  {
    case 1:
      id v6 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v45 = *MEMORY[0x263F08320];
      v46 = @"Unknown error";
      id v7 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      id v8 = v6;
      uint64_t v9 = 1;
      goto LABEL_19;
    case 2:
      id v21 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v43 = *MEMORY[0x263F08320];
      v44 = @"Access denied";
      id v7 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      id v8 = v21;
      uint64_t v9 = 2;
      goto LABEL_19;
    case 3:
      id v14 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v41 = *MEMORY[0x263F08320];
      v42 = @"Access Data record query failed";
      id v7 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      id v8 = v14;
      uint64_t v9 = 3;
      goto LABEL_19;
    case 4:
      id v15 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v39 = *MEMORY[0x263F08320];
      v40 = @"Safety Cache record query failed";
      id v7 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      id v8 = v15;
      uint64_t v9 = 4;
      goto LABEL_19;
    case 5:
      id v16 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v37 = *MEMORY[0x263F08320];
      uint64_t v38 = @"Token missing from Access Data record";
      id v7 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      id v8 = v16;
      uint64_t v9 = 5;
      goto LABEL_19;
    case 6:
      id v22 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v35 = *MEMORY[0x263F08320];
      __int16 v36 = @"Release time missing from Access Data record";
      id v7 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      id v8 = v22;
      uint64_t v9 = 6;
      goto LABEL_19;
    case 7:
      id v23 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v33 = *MEMORY[0x263F08320];
      __int16 v34 = @"Zone not found";
      id v7 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      id v8 = v23;
      uint64_t v9 = 7;
      goto LABEL_19;
    case 8:
      id v17 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v31 = *MEMORY[0x263F08320];
      __int16 v32 = @"Failed to initialize Record Transport with Safety Cache record";
      id v7 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      id v8 = v17;
      uint64_t v9 = 8;
LABEL_19:
      id v20 = (void *)[v8 initWithDomain:@"SafetyMonitorServerErrorDomain" code:v9 userInfo:v7];
      break;
    default:
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"Unrecognized response code %d", *(void *)(a1 + 80));
      id v18 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v29 = *MEMORY[0x263F08320];
      __int16 v30 = v7;
      objc_super v19 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      id v20 = (void *)[v18 initWithDomain:@"SafetyMonitorServerErrorDomain" code:1 userInfo:v19];

      break;
  }

  uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = *(void *)(a1 + 40);
    uint64_t v26 = *(void *)(a1 + 48);
    uint64_t v27 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v28 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v48 = v25;
    __int16 v49 = 2112;
    uint64_t v50 = v26;
    __int16 v51 = 2112;
    v52 = v27;
    __int16 v53 = 2112;
    uint64_t v54 = v28;
    _os_log_error_impl(&dword_25B6E0000, v24, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,returning error from server: %@", buf, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (_TtC13SafetyMonitor23SMCloudKitFunctionSwift)swiftCKF
{
  return self->_swiftCKF;
}

- (void)setSwiftCKF:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_swiftCKF, 0);
}

@end