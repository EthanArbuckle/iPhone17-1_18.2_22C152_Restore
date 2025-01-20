@interface RTBiomeManager
+ (id)biomeStreamTypeToBiomeStream:(int64_t)a3;
+ (id)streamTypeToString:(int64_t)a3;
- (BMBiomeScheduler)scheduler;
- (BOOL)_isValidEvent:(id)a3 streamType:(int64_t)a4;
- (BOOL)routineEnabled;
- (BPSSink)sink;
- (RTAuthorizationManager)authorizationManager;
- (RTBiomeManager)init;
- (RTBiomeManager)initWithAuthorizationManager:(id)a3 dataProtectionManager:(id)a4 defaultsManager:(id)a5 learnedLocationManager:(id)a6 platform:(id)a7;
- (RTDataProtectionManager)dataProtectionManager;
- (RTDefaultsManager)defaultsManager;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTPlatform)platform;
- (id)_extractDateIntervalFromBiomeEvent1:(id)a3 event2:(id)a4 streamType:(int64_t)a5;
- (id)_getLatestBiomeDataForStreamType:(int64_t)a3 error:(id *)a4;
- (id)_translateRTVisitToBiomeObject:(id)a3;
- (id)_translateToBiomeMapItem:(id)a3;
- (id)_translateToBiomePlaceInference:(id)a3;
- (id)_translateToBiomeVisitLocation:(id)a3;
- (int)_translateToBiomePlaceType:(unint64_t)a3;
- (int)_translateToBiomeUserSpecificPlaceType:(unint64_t)a3;
- (int)_translateToBiomeUserSpecificPlaceTypeSource:(unint64_t)a3;
- (int)_translateToBiomeVisitLocationReferenceFrame:(int)a3;
- (int)_translateToBiomeVisitLocationSourceAccuracy:(unint64_t)a3;
- (int)_translateToBiomeVisitSource:(int64_t)a3;
- (int)_translateToBiomeVisitType:(int64_t)a3;
- (int64_t)_compareEvent1:(id)a3 event2:(id)a4 streamType:(int64_t)a5;
- (int64_t)encryptedDataAvailability;
- (void)_cancelSubscriptionBiomeConnectionCompanion;
- (void)_clearBiomeStreamForStreamType:(int64_t)a3 error:(id *)a4;
- (void)_onAuthorizationNotification:(id)a3;
- (void)_onDataProtectionNotification:(id)a3;
- (void)_onLearnedLocationManagerAvailabilityDidChangeNotification:(id)a3;
- (void)_onLearnedLocationManagerDidUpdateNotification:(id)a3;
- (void)_publishNewHindsightVisitsToBiomeWithError:(id *)a3;
- (void)_setup;
- (void)_startSubscriptionBiomeConnectionCompanion;
- (void)cancelSubscriptionBiomeConnectionCompanion;
- (void)enumerateEventsWithinDateInterval:(id)a3 streamType:(int64_t)a4 handler:(id)a5;
- (void)onAuthorizationNotification:(id)a3;
- (void)onDataProtectionNotification:(id)a3;
- (void)onLearnedLocationManagerAvailabilityDidChangeNotification:(id)a3;
- (void)onLearnedLocationManagerDidUpdateNotification:(id)a3;
- (void)setEncryptedDataAvailability:(int64_t)a3;
- (void)setRoutineEnabled:(BOOL)a3;
- (void)setScheduler:(id)a3;
- (void)setSink:(id)a3;
- (void)startSubscriptionBiomeConnectionCompanion;
@end

@implementation RTBiomeManager

- (RTBiomeManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAuthorizationManager_dataProtectionManager_defaultsManager_learnedLocationManager_platform_);
}

- (RTBiomeManager)initWithAuthorizationManager:(id)a3 dataProtectionManager:(id)a4 defaultsManager:(id)a5 learnedLocationManager:(id)a6 platform:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13)
  {
    v21 = v17;
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: authorizationManager";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_18;
  }
  if (!v14)
  {
    v21 = v17;
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: dataProtectionManager";
    goto LABEL_17;
  }
  if (!v15)
  {
    v21 = v17;
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_17;
  }
  if (!v16)
  {
    v21 = v17;
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "Invalid parameter not satisfying: learnedLocationManager";
      goto LABEL_17;
    }
LABEL_18:

    v20 = 0;
    goto LABEL_19;
  }
  id v26 = v17;
  if (v17)
  {
    v27.receiver = self;
    v27.super_class = (Class)RTBiomeManager;
    v18 = [(RTNotifier *)&v27 init];
    p_isa = (id *)&v18->super.super.super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_authorizationManager, a3);
      objc_storeStrong(p_isa + 8, a4);
      objc_storeStrong(p_isa + 9, a5);
      objc_storeStrong(p_isa + 11, a6);
      objc_storeStrong(p_isa + 12, a7);
      [p_isa setup];
    }
    self = p_isa;
    v20 = self;
  }
  else
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: platform", buf, 2u);
    }

    v20 = 0;
  }
  v21 = v26;
LABEL_19:

  return v20;
}

- (void)_setup
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    v4 = [(RTBiomeManager *)self authorizationManager];
    v5 = +[RTNotification notificationName];
    [v4 addObserver:self selector:sel_onAuthorizationNotification_ name:v5];

    v6 = [(RTBiomeManager *)self dataProtectionManager];
    v7 = +[RTNotification notificationName];
    [v6 addObserver:self selector:sel_onDataProtectionNotification_ name:v7];

    v8 = [(RTBiomeManager *)self learnedLocationManager];
    v9 = +[RTNotification notificationName];
    [v8 addObserver:self selector:sel_onLearnedLocationManagerAvailabilityDidChangeNotification_ name:v9];

    id v15 = [(RTBiomeManager *)self learnedLocationManager];
    v10 = +[RTNotification notificationName];
    [v15 addObserver:self selector:sel_onLearnedLocationManagerDidUpdateNotification_ name:v10];
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      id v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v17 = v13;
      __int16 v18 = 2112;
      v19 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, %@, feature not enabled", buf, 0x16u);
    }
  }
}

- (void)startSubscriptionBiomeConnectionCompanion
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTBiomeManager_startSubscriptionBiomeConnectionCompanion__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __59__RTBiomeManager_startSubscriptionBiomeConnectionCompanion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSubscriptionBiomeConnectionCompanion];
}

- (void)_startSubscriptionBiomeConnectionCompanion
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = NSStringFromSelector(a2);
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v7 = 138412546;
    v8 = v4;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, %@, BMCarouselCompanion Currently unavailable in platforms other than watch_os", (uint8_t *)&v7, 0x16u);
  }
}

- (void)cancelSubscriptionBiomeConnectionCompanion
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__RTBiomeManager_cancelSubscriptionBiomeConnectionCompanion__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __60__RTBiomeManager_cancelSubscriptionBiomeConnectionCompanion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelSubscriptionBiomeConnectionCompanion];
}

- (void)_cancelSubscriptionBiomeConnectionCompanion
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = NSStringFromSelector(a2);
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v7 = 138412546;
    v8 = v4;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, %@, BMCarouselCompanion Currently unavailable in platforms other than watch_os", (uint8_t *)&v7, 0x16u);
  }
}

- (void)enumerateEventsWithinDateInterval:(id)a3 streamType:(int64_t)a4 handler:(id)a5
{
  v107[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v69 = (void (**)(id, void, id))a5;
  if ((unint64_t)(a4 - 1) >= 4)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: RT_BIOME_STREAM_STREAM_TYPE_VALID(streamType)";
LABEL_18:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v38, buf, 2u);
    goto LABEL_41;
  }
  if (!v9)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: dateInterval";
    goto LABEL_18;
  }
  if (!v69)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: handler";
    goto LABEL_18;
  }
  aSelector = a2;
  v68 = self;
  v10 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = NSStringFromSelector(a2);
    v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    id v14 = [(id)objc_opt_class() streamTypeToString:a4];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v11;
    __int16 v97 = 2112;
    id v98 = v13;
    __int16 v99 = 2112;
    id v100 = v14;
    __int16 v101 = 2112;
    id v102 = v9;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, %@, streamType, %@, date interval, %@", buf, 0x2Au);
  }
  id v15 = [(id)objc_opt_class() biomeStreamTypeToBiomeStream:a4];
  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F503E8]);
    id v17 = [v9 startDate];
    __int16 v18 = [v9 endDate];
    v66 = (void *)[v16 initWithStartDate:v17 endDate:v18 maxEvents:0 lastN:0 reversed:0];

    uint64_t v90 = 0;
    v91 = (id *)&v90;
    uint64_t v92 = 0x3032000000;
    v93 = __Block_byref_object_copy__139;
    v94 = __Block_byref_object_dispose__139;
    id v95 = 0;
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x3032000000;
    v88[3] = __Block_byref_object_copy__139;
    v88[4] = __Block_byref_object_dispose__139;
    id v89 = 0;
    v86[0] = 0;
    v86[1] = v86;
    v86[2] = 0x3032000000;
    v86[3] = __Block_byref_object_copy__139;
    v86[4] = __Block_byref_object_dispose__139;
    id v87 = 0;
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x2020000000;
    v85[3] = -1;
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__139;
    v83 = __Block_byref_object_dispose__139;
    id v84 = (id)objc_opt_new();
    v19 = [v15 publisherWithOptions:v66];
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __71__RTBiomeManager_enumerateEventsWithinDateInterval_streamType_handler___block_invoke;
    v71[3] = &unk_1E6B9B688;
    v71[4] = v68;
    v73 = &v90;
    v74 = v88;
    v77 = aSelector;
    int64_t v78 = a4;
    v75 = v86;
    v76 = &v79;
    v21 = v20;
    v72 = v21;
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __71__RTBiomeManager_enumerateEventsWithinDateInterval_streamType_handler___block_invoke_31;
    v70[3] = &unk_1E6B9B6B0;
    v70[9] = aSelector;
    v70[10] = a4;
    v70[4] = v68;
    v70[5] = v86;
    v70[6] = v88;
    v70[7] = v85;
    v70[8] = &v79;
    v64 = v19;
    id v22 = (id)[v19 sinkWithCompletion:v71 receiveInput:v70];
    dsema = v21;
    v23 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v24 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v24)) {
      goto LABEL_19;
    }
    v25 = [MEMORY[0x1E4F1C9C8] now];
    [v25 timeIntervalSinceDate:v23];
    double v27 = v26;
    v28 = objc_opt_new();
    v29 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_110];
    v30 = [MEMORY[0x1E4F29060] callStackSymbols];
    v31 = [v30 filteredArrayUsingPredicate:v29];
    v32 = [v31 firstObject];

    [v28 submitToCoreAnalytics:v32 type:1 duration:v27];
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v34 = (void *)MEMORY[0x1E4F28C58];
    v107[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v107 count:1];
    v36 = [v34 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v35];

    if (v36)
    {
      id v37 = v36;
    }
    else
    {
LABEL_19:
      id v37 = 0;
    }

    id v63 = v37;
    if (v63) {
      objc_storeStrong(v91 + 5, v37);
    }
    if (v91[5])
    {
      v39 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        id v59 = (id)objc_claimAutoreleasedReturnValue();
        v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        id v61 = (id)objc_claimAutoreleasedReturnValue();
        v62 = [(id)objc_opt_class() streamTypeToString:a4];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v59;
        __int16 v97 = 2112;
        id v98 = v61;
        __int16 v99 = 2112;
        id v100 = v62;
        __int16 v101 = 2112;
        id v102 = v9;
        _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "%@, %@, streamType, %@, date interval, %@", buf, 0x2Au);
      }
      uint64_t v40 = 0;
    }
    else
    {
      v43 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(aSelector);
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        id v47 = [(id)objc_opt_class() streamTypeToString:a4];
        uint64_t v48 = [(id)v80[5] count];
        *(_DWORD *)buf = 138413314;
        *(void *)&uint8_t buf[4] = v44;
        __int16 v97 = 2112;
        id v98 = v46;
        __int16 v99 = 2112;
        id v100 = v47;
        __int16 v101 = 2112;
        id v102 = v9;
        __int16 v103 = 2048;
        uint64_t v104 = v48;
        _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "%@, %@, streamType, %@, date interval, %@, outputDateIntervals count, %lu", buf, 0x34u);
      }
      uint64_t v49 = 0;
      char v50 = 1;
      v51 = MEMORY[0x1E4F14500];
      while (1)
      {
        BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG);
        if ((v50 & 1) == 0 || !v52 || ![(id)v80[5] count]) {
          break;
        }
        v53 = (void *)MEMORY[0x1E016D870]();
        v54 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(aSelector);
          id v55 = (id)objc_claimAutoreleasedReturnValue();
          v56 = (objc_class *)objc_opt_class();
          NSStringFromClass(v56);
          id v57 = (id)objc_claimAutoreleasedReturnValue();
          v58 = [(id)v80[5] objectAtIndexedSubscript:v49];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v55;
          __int16 v97 = 2112;
          id v98 = v57;
          __int16 v99 = 2048;
          id v100 = (id)(v49 + 1);
          __int16 v101 = 2112;
          id v102 = v58;
          _os_log_debug_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_DEBUG, "%@, %@, %lu output date interval, %@", buf, 0x2Au);
        }
        char v50 = 0;
        uint64_t v49 = 1;
      }
      uint64_t v40 = v80[5];
    }
    v69[2](v69, v40, v91[5]);

    _Block_object_dispose(&v79, 8);
    _Block_object_dispose(v85, 8);
    _Block_object_dispose(v86, 8);

    _Block_object_dispose(v88, 8);
    _Block_object_dispose(&v90, 8);
  }
  else
  {
    uint64_t v105 = *MEMORY[0x1E4F28568];
    v106 = @"Invalid biome stream type.";
    v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
    v41 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTBiomeStreamErrorDomain" code:1 userInfo:v66];
    v42 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a4;
      _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "Invalid biome stream type, %lu", buf, 0xCu);
    }

    v69[2](v69, 0, v41);
  }

LABEL_41:
}

void __71__RTBiomeManager_enumerateEventsWithinDateInterval_streamType_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = NSStringFromSelector(*(SEL *)(a1 + 80));
    v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    int v19 = 138412802;
    dispatch_semaphore_t v20 = v5;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, completion, %@", (uint8_t *)&v19, 0x20u);
  }
  if ([v3 state])
  {
    uint64_t v8 = [v3 error];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
LABEL_5:

    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    goto LABEL_6;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  if (v12 && *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v10 = [*(id *)(a1 + 32) _extractDateIntervalFromBiomeEvent1:event2:streamType:];
    if (v10)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v10];
      id v15 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = NSStringFromSelector(*(SEL *)(a1 + 80));
        id v17 = (objc_class *)objc_opt_class();
        __int16 v18 = NSStringFromClass(v17);
        int v19 = 138412802;
        dispatch_semaphore_t v20 = v16;
        __int16 v21 = 2112;
        id v22 = v18;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%@, %@, output date interval, %@", (uint8_t *)&v19, 0x20u);
      }
    }
    goto LABEL_5;
  }
LABEL_6:
  *(void *)(v11 + 40) = 0;

  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __71__RTBiomeManager_enumerateEventsWithinDateInterval_streamType_handler___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v15 = NSStringFromSelector(*(SEL *)(a1 + 72));
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    __int16 v18 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 timestamp];
    int v19 = [v18 dateWithTimeIntervalSinceReferenceDate:];
    int v23 = 138412802;
    id v24 = v15;
    __int16 v25 = 2112;
    double v26 = v17;
    __int16 v27 = 2112;
    v28 = v19;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@, %@, received event, %@", (uint8_t *)&v23, 0x20u);
  }
  if ([*(id *)(a1 + 32) _isValidEvent:v4 streamType:*(void *)(a1 + 80)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void *)(v6 + 40);
    if (!v7)
    {
      id v13 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      v12 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v13;
      goto LABEL_14;
    }
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _compareEvent1:v7 event2:*(void *)(*(void *)(*(void *)(a1 + 40) + 8)+ 40) streamType:*(void *)(a1 + 80)];
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v8 == 1)
    {
      v12 = [*(id *)(a1 + 32) _extractDateIntervalFromBiomeEvent1:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) event2:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) streamType:*(void *)(a1 + 80)];
      if (v12)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v12];
        id v14 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          dispatch_semaphore_t v20 = NSStringFromSelector(*(SEL *)(a1 + 72));
          __int16 v21 = (objc_class *)objc_opt_class();
          id v22 = NSStringFromClass(v21);
          int v23 = 138412802;
          id v24 = v20;
          __int16 v25 = 2112;
          double v26 = v22;
          __int16 v27 = 2112;
          v28 = v12;
          _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "%@, %@, final output date interval, %@", (uint8_t *)&v23, 0x20u);
        }
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      goto LABEL_14;
    }
    if (v8 == -1)
    {
      uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      id v11 = v9;
      v12 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v11;
LABEL_14:
    }
  }
}

- (BOOL)_isValidEvent:(id)a3 streamType:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    __int16 v15 = 0;
    uint64_t v10 = "Invalid parameter not satisfying: event";
    id v11 = (uint8_t *)&v15;
    goto LABEL_14;
  }
  if ((unint64_t)(a4 - 1) >= 4)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    __int16 v14 = 0;
    uint64_t v10 = "Invalid parameter not satisfying: RT_BIOME_STREAM_STREAM_TYPE_VALID(streamType)";
    id v11 = (uint8_t *)&v14;
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
LABEL_8:

LABEL_9:
    BOOL v12 = 0;
    goto LABEL_12;
  }
  switch(a4)
  {
    case 1:
    case 2:
    case 4:
      uint64_t v7 = [v5 eventBody];
      char v8 = [v7 hasStarting];
      break;
    case 3:
      uint64_t v7 = [v5 eventBody];
      char v8 = [v7 hasStationary];
      break;
    default:
      goto LABEL_9;
  }
  BOOL v12 = v8;

LABEL_12:
  return v12;
}

- (int64_t)_compareEvent1:(id)a3 event2:(id)a4 streamType:(int64_t)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8)
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(v28) = 0;
    id v16 = "Invalid parameter not satisfying: event1";
    goto LABEL_14;
  }
  if (!v9)
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(v28) = 0;
    id v16 = "Invalid parameter not satisfying: event2";
    goto LABEL_14;
  }
  if ((unint64_t)(a5 - 1) >= 4)
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(v28) = 0;
    id v16 = "Invalid parameter not satisfying: RT_BIOME_STREAM_STREAM_TYPE_VALID(streamType)";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v28, 2u);
LABEL_15:

LABEL_16:
    int64_t v17 = -1;
    goto LABEL_17;
  }
  switch(a5)
  {
    case 1:
    case 2:
    case 4:
      id v11 = v8;
      id v12 = v10;
      id v13 = [v11 eventBody];
      if ([v13 starting])
      {
        id v5 = [v12 eventBody];
        int v14 = [v5 starting];

        if (!v14) {
          goto LABEL_25;
        }
      }
      else
      {
      }
      int v19 = [v11 eventBody];
      char v20 = [v19 starting];
      if ((v20 & 1) == 0)
      {
        id v5 = [v12 eventBody];
        if ([v5 starting]) {
          goto LABEL_32;
        }
      }
      __int16 v21 = [v11 eventBody];
      if ([v21 starting]) {
        goto LABEL_34;
      }
      id v22 = [v12 eventBody];
      int v23 = [v22 starting];
      goto LABEL_36;
    case 3:
      id v11 = v8;
      id v12 = v10;
      id v24 = [v11 eventBody];
      if ([v24 stationary])
      {
        id v5 = [v12 eventBody];
        int v25 = [v5 stationary];

        if (!v25)
        {
LABEL_25:
          int64_t v17 = 1;
          goto LABEL_40;
        }
      }
      else
      {
      }
      int v19 = [v11 eventBody];
      char v20 = [v19 stationary];
      if ((v20 & 1) == 0)
      {
        id v5 = [v12 eventBody];
        if ([v5 stationary])
        {
LABEL_32:
          uint64_t v27 = 1;
LABEL_38:

          goto LABEL_39;
        }
      }
      __int16 v21 = [v11 eventBody];
      if ([v21 stationary])
      {
LABEL_34:
        uint64_t v27 = 0;
      }
      else
      {
        id v22 = [v12 eventBody];
        int v23 = [v22 stationary];
LABEL_36:
        uint64_t v27 = v23 ^ 1u;
      }
      if ((v20 & 1) == 0) {
        goto LABEL_38;
      }
LABEL_39:

      int64_t v17 = v27 << 63 >> 63;
LABEL_40:

      break;
    default:
      double v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        int v28 = 134218498;
        int64_t v29 = a5;
        __int16 v30 = 2080;
        v31 = "-[RTBiomeManager _compareEvent1:event2:streamType:]";
        __int16 v32 = 1024;
        int v33 = 453;
        _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Unhandled stream type, %lu (in %s:%d)", (uint8_t *)&v28, 0x1Cu);
      }

      goto LABEL_16;
  }
LABEL_17:

  return v17;
}

- (id)_extractDateIntervalFromBiomeEvent1:(id)a3 event2:(id)a4 streamType:(int64_t)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    LOWORD(v23) = 0;
    int64_t v17 = "Invalid parameter not satisfying: event1";
LABEL_15:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v23, 2u);
    goto LABEL_16;
  }
  if (!v9)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    LOWORD(v23) = 0;
    int64_t v17 = "Invalid parameter not satisfying: event2";
    goto LABEL_15;
  }
  if ((unint64_t)(a5 - 1) >= 4)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      int64_t v17 = "Invalid parameter not satisfying: RT_BIOME_STREAM_STREAM_TYPE_VALID(streamType)";
      goto LABEL_15;
    }
LABEL_16:
    id v16 = 0;
    goto LABEL_17;
  }
  if (v8 == v9)
  {
    __int16 v15 = 0;
    id v12 = 0;
LABEL_21:
    int v19 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      char v20 = (objc_class *)objc_opt_class();
      __int16 v21 = NSStringFromClass(v20);
      id v22 = NSStringFromSelector(a2);
      int v23 = 138413058;
      id v24 = v21;
      __int16 v25 = 2112;
      double v26 = v22;
      __int16 v27 = 2112;
      int v28 = v12;
      __int16 v29 = 2112;
      __int16 v30 = v15;
      _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "%@, %@, start date, %@, end date, %@", (uint8_t *)&v23, 0x2Au);
    }
    id v16 = 0;
    goto LABEL_24;
  }
  id v11 = (void *)MEMORY[0x1E4F1C9C8];
  [v8 timestamp];
  id v12 = [v11 dateWithTimeIntervalSinceReferenceDate:];
  id v13 = (void *)MEMORY[0x1E4F1C9C8];
  [v10 timestamp];
  uint64_t v14 = [v13 dateWithTimeIntervalSinceReferenceDate:];
  __int16 v15 = (void *)v14;
  if (!v12 || !v14 || [v12 compare:v14] == 1) {
    goto LABEL_21;
  }
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v12 endDate:v15];
LABEL_24:

LABEL_17:

  return v16;
}

- (void)onAuthorizationNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__RTBiomeManager_onAuthorizationNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __46__RTBiomeManager_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onAuthorizationNotification:*(void *)(a1 + 40)];
}

- (void)_onAuthorizationNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[RTBiomeManager setRoutineEnabled:](self, "setRoutineEnabled:", [v5 enabled]);
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = [(RTBiomeManager *)self routineEnabled];
      id v8 = @"NO";
      if (v7) {
        id v8 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Updated routine enabled %@", buf, 0xCu);
    }

    if ([(RTBiomeManager *)self routineEnabled])
    {
      uint64_t v14 = 0;
      id v9 = (id *)&v14;
      [(RTBiomeManager *)self _publishNewHindsightVisitsToBiomeWithError:&v14];
    }
    else
    {
      uint64_t v13 = 0;
      id v9 = (id *)&v13;
      [(RTBiomeManager *)self _clearBiomeStreamForStreamType:5 error:&v13];
    }
    uint64_t v10 = *v9;
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v12 = [v5 name];
      *(_DWORD *)buf = 138412546;
      id v16 = v11;
      __int16 v17 = 2112;
      __int16 v18 = v12;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", buf, 0x16u);
    }
  }
}

- (void)onDataProtectionNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__RTBiomeManager_onDataProtectionNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __47__RTBiomeManager_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDataProtectionNotification:*(void *)(a1 + 40)];
}

- (void)_onDataProtectionNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138412802;
      id v12 = v9;
      __int16 v13 = 2080;
      uint64_t v14 = "-[RTBiomeManager _onDataProtectionNotification:]";
      __int16 v15 = 1024;
      int v16 = 544;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unknown notification class, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
  -[RTBiomeManager setEncryptedDataAvailability:](self, "setEncryptedDataAvailability:", [v4 availability]);
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = +[RTDataProtectionManager encryptedDataAvailabilityToString:[(RTBiomeManager *)self encryptedDataAvailability]];
    *(_DWORD *)buf = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "Received keybag notification, %@", buf, 0xCu);
  }
  uint64_t v10 = 0;
  [(RTBiomeManager *)self _publishNewHindsightVisitsToBiomeWithError:&v10];
}

- (void)onLearnedLocationManagerAvailabilityDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__RTBiomeManager_onLearnedLocationManagerAvailabilityDidChangeNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __76__RTBiomeManager_onLearnedLocationManagerAvailabilityDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onLearnedLocationManagerAvailabilityDidChangeNotification:*(void *)(a1 + 40)];
}

- (void)_onLearnedLocationManagerAvailabilityDidChangeNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      NSStringFromSelector(a2);
      id v9 = (char *)objc_claimAutoreleasedReturnValue();
      int v10 = [v5 available];
      id v11 = @"NO";
      int v12 = 138412802;
      id v13 = v8;
      __int16 v14 = 2112;
      if (v10) {
        id v11 = @"YES";
      }
      __int16 v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, learned location manager available, %@", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412802;
      id v13 = v4;
      __int16 v14 = 2080;
      __int16 v15 = "-[RTBiomeManager _onLearnedLocationManagerAvailabilityDidChangeNotification:]";
      __int16 v16 = 1024;
      LODWORD(v17) = 575;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

- (void)onLearnedLocationManagerDidUpdateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__RTBiomeManager_onLearnedLocationManagerDidUpdateNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__RTBiomeManager_onLearnedLocationManagerDidUpdateNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onLearnedLocationManagerDidUpdateNotification:*(void *)(a1 + 40)];
}

- (void)_onLearnedLocationManagerDidUpdateNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    BOOL v7 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      NSStringFromSelector(a2);
      int v10 = (char *)objc_claimAutoreleasedReturnValue();
      [v6 intervalSinceLastUpdate];
      *(_DWORD *)buf = 138412802;
      id v14 = v9;
      __int16 v15 = 2112;
      __int16 v16 = v10;
      __int16 v17 = 2048;
      uint64_t v18 = v11;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, learned location manager did update, %f", buf, 0x20u);
    }
    uint64_t v12 = 0;
    [(RTBiomeManager *)self _publishNewHindsightVisitsToBiomeWithError:&v12];
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v14 = v5;
      __int16 v15 = 2080;
      __int16 v16 = "-[RTBiomeManager _onLearnedLocationManagerDidUpdateNotification:]";
      __int16 v17 = 1024;
      LODWORD(v18) = 603;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
}

- (int)_translateToBiomeVisitLocationReferenceFrame:(int)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

- (int)_translateToBiomeVisitLocationSourceAccuracy:(unint64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

- (id)_translateToBiomeVisitLocation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F4FEC0]);
    id v6 = NSNumber;
    [v4 latitude];
    BOOL v7 = [v6 numberWithDouble:];
    id v8 = NSNumber;
    [v4 longitude];
    id v9 = [v8 numberWithDouble:];
    int v10 = NSNumber;
    [v4 horizontalUncertainty];
    uint64_t v11 = [v10 numberWithDouble:];
    uint64_t v12 = NSNumber;
    [v4 altitude];
    id v13 = [v12 numberWithDouble:];
    id v14 = NSNumber;
    [v4 verticalUncertainty];
    __int16 v15 = [v14 numberWithDouble:];
    __int16 v16 = [v4 date];
    __int16 v17 = [v5 initWithLatitude:v7 longitude:v9 horizontalUncertainty:v11 altitude:v13 verticalUncertainty:v15 date:v16 referenceFrame:[self _translateToBiomeVisitLocationReferenceFrame:objc_msgSend(v4, "referenceFrame")] sourceAccuracy:[self _translateToBiomeVisitLocationSourceAccuracy:objc_msgSend(v4, "sourceAccuracy")]];
  }
  else
  {
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }

    __int16 v17 = 0;
  }

  return v17;
}

- (int)_translateToBiomePlaceType:(unint64_t)a3
{
  if (a3 - 1 < 4) {
    return a3;
  }
  else {
    return 0;
  }
}

- (int)_translateToBiomeUserSpecificPlaceType:(unint64_t)a3
{
  if (a3 - 1 < 4) {
    return a3;
  }
  else {
    return 0;
  }
}

- (int)_translateToBiomeUserSpecificPlaceTypeSource:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return dword_1DA100580[a3 - 1];
  }
}

- (id)_translateToBiomeMapItem:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F4FFC8]);
    id v5 = [v3 identifier];
    id v6 = [v3 name];
    BOOL v7 = [v3 address];
    id v8 = [v7 description];
    id v9 = [v3 category];
    int v10 = (void *)[v4 initWithIdentifier:v5 name:v6 address:v8 category:v9];
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem", v13, 2u);
    }

    int v10 = 0;
  }

  return v10;
}

- (id)_translateToBiomePlaceInference:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F4FFC0]);
    id v6 = [v4 loiIdentifier];
    uint64_t v7 = -[RTBiomeManager _translateToBiomePlaceType:](self, "_translateToBiomePlaceType:", [v4 placeType]);
    uint64_t v8 = -[RTBiomeManager _translateToBiomeUserSpecificPlaceType:](self, "_translateToBiomeUserSpecificPlaceType:", [v4 userType]);
    uint64_t v9 = -[RTBiomeManager _translateToBiomeUserSpecificPlaceTypeSource:](self, "_translateToBiomeUserSpecificPlaceTypeSource:", [v4 userTypeSource]);
    int v10 = [v4 mapItem];
    uint64_t v11 = [(RTBiomeManager *)self _translateToBiomeMapItem:v10];
    uint64_t v12 = (void *)[v5 initWithIdentifier:v6 placeType:v7 userSpecificPlaceType:v8 userSpecificPlaceTypeSource:v9 mapItem:v11];
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v15 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeInference", v15, 2u);
    }

    uint64_t v12 = 0;
  }

  return v12;
}

- (int)_translateToBiomeVisitType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

- (int)_translateToBiomeVisitSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

- (id)_translateRTVisitToBiomeObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F4FEB8]);
    uint64_t v19 = [v4 date];
    unsigned int v18 = -[RTBiomeManager _translateToBiomeVisitType:](self, "_translateToBiomeVisitType:", [v4 type]);
    id v5 = [v4 location];
    id v6 = [(RTBiomeManager *)self _translateToBiomeVisitLocation:v5];
    uint64_t v7 = [v4 entry];
    uint64_t v8 = [v4 exit];
    uint64_t v9 = NSNumber;
    [v4 confidence];
    int v10 = [v9 numberWithDouble:];
    int v11 = -[RTBiomeManager _translateToBiomeVisitSource:](self, "_translateToBiomeVisitSource:", [v4 source]);
    uint64_t v12 = [v4 placeInference];
    id v13 = [(RTBiomeManager *)self _translateToBiomePlaceInference:v12];
    LODWORD(v17) = v11;
    id v14 = (void *)[v20 initWithDetectionDate:v19 type:v18 location:v6 entryDate:v7 exitDate:v8 confidence:v10 source:v17 placeInference:v13];
  }
  else
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
    }

    id v14 = 0;
  }

  return v14;
}

- (void)_publishNewHindsightVisitsToBiomeWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x3032000000;
  __int16 v29 = __Block_byref_object_copy__139;
  __int16 v30 = __Block_byref_object_dispose__139;
  id v31 = 0;
  if ([(RTBiomeManager *)self routineEnabled])
  {
    if ([(RTBiomeManager *)self encryptedDataAvailability] == 2)
    {
      id v6 = (id *)(v27 + 5);
      id obj = (id)v27[5];
      uint64_t v7 = [(RTBiomeManager *)self _getLatestBiomeDataForStreamType:5 error:&obj];
      objc_storeStrong(v6, obj);
      uint64_t v8 = (void *)v27[5];
      if (v8)
      {
        *a3 = v8;
      }
      else
      {
        __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          int v33 = v7;
          _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "Latest visit in Biome %@", buf, 0xCu);
        }

        __int16 v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
        uint64_t v17 = [v7 exitDate];
        if (v17)
        {
          unsigned int v18 = [v7 exitDate];
          BOOL v19 = [v18 compare:v16] == 1;

          if (v19)
          {
            uint64_t v20 = [v7 exitDate];

            __int16 v16 = (void *)v20;
          }
        }
        __int16 v21 = [(RTBiomeManager *)self learnedLocationManager];
        id v22 = [MEMORY[0x1E4F1C9C8] date];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __61__RTBiomeManager__publishNewHindsightVisitsToBiomeWithError___block_invoke;
        v24[3] = &unk_1E6B9B6D8;
        v24[4] = self;
        v24[5] = &v26;
        v24[6] = a2;
        [v21 fetchHindsightVisitsBetweenStartDate:v16 endDate:v22 ascending:1 handler:v24];

        int v23 = (void *)v27[5];
        if (v23) {
          *a3 = v23;
        }
      }
    }
    else
    {
      uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v14 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        int v33 = v13;
        __int16 v34 = 2112;
        v35 = v14;
        _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, %@, Encrypted data not available, data is not published", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      int v10 = (id)objc_claimAutoreleasedReturnValue();
      int v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      int v33 = v10;
      __int16 v34 = 2112;
      v35 = v11;
      _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, %@, Significant Locations disabled, data is not published", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v26, 8);
}

void __61__RTBiomeManager__publishNewHindsightVisitsToBiomeWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Fetch hindsight visits error, %@", buf, 0xCu);
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = v6;
    int v10 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    int v11 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__RTBiomeManager__publishNewHindsightVisitsToBiomeWithError___block_invoke_47;
    block[3] = &unk_1E6B91220;
    id v12 = v5;
    uint64_t v13 = *(void *)(a1 + 32);
    id v15 = v12;
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)(a1 + 48);
    dispatch_async(v11, block);

    int v10 = v15;
  }
}

void __61__RTBiomeManager__publishNewHindsightVisitsToBiomeWithError___block_invoke_47(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "New hindsight visits count %lu", buf, 0xCu);
  }

  uint64_t v16 = [(id)objc_opt_class() biomeStreamTypeToBiomeStream:5];
  id v4 = [v16 source];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    id v17 = v5;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = [*(id *)(a1 + 40) _translateRTVisitToBiomeObject:*(void *)(*((void *)&v18 + 1) + 8 * v9)];
        [v4 sendEvent:v10];
        int v11 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          id v12 = (objc_class *)objc_opt_class();
          uint64_t v13 = NSStringFromClass(v12);
          id v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
          id v15 = [(id)objc_opt_class() streamTypeToString:5];
          *(_DWORD *)buf = 138413058;
          uint64_t v23 = (uint64_t)v13;
          __int16 v24 = 2112;
          __int16 v25 = v14;
          __int16 v26 = 2112;
          __int16 v27 = v10;
          __int16 v28 = 2112;
          __int16 v29 = v15;
          _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, sent event, %@, streamType, %@", buf, 0x2Au);

          id v5 = v17;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v30 count:16];
    }
    while (v7);
  }
}

- (void)_clearBiomeStreamForStreamType:(int64_t)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 5)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v5 = v4;
    uint64_t v6 = [(id)objc_opt_class() biomeStreamTypeToBiomeStream:5];
    id v7 = [v6 pruner];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __55__RTBiomeManager__clearBiomeStreamForStreamType_error___block_invoke;
    v16[3] = &__block_descriptor_40_e26_B24__0__BMStoreEvent_8_B16l;
    v16[4] = v5;
    [v7 deleteEventsPassingTest:v16];
  }
  else
  {
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = @"Unsupported stream type";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v6];
    *a4 = v7;
    int v11 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      id v14 = NSStringFromSelector(a2);
      id v15 = [(id)objc_opt_class() streamTypeToString:a3];
      *(_DWORD *)buf = 138413058;
      long long v18 = v13;
      __int16 v19 = 2112;
      long long v20 = v14;
      __int16 v21 = 2112;
      id v22 = v15;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "%@, %@, streamType, %@, error, %@", buf, 0x2Au);
    }
  }
}

BOOL __55__RTBiomeManager__clearBiomeStreamForStreamType_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    [v3 timestamp];
    uint64_t v9 = v8;
    int v10 = [v3 eventBody];
    int v11 = 134218242;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "Pruned Biome Event %f, %@", (uint8_t *)&v11, 0x16u);
  }
  [v3 timestamp];
  BOOL v6 = v5 < *(double *)(a1 + 32);

  return v6;
}

- (id)_getLatestBiomeDataForStreamType:(int64_t)a3 error:(id *)a4
{
  v65[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 5)
  {
    uint64_t v4 = [(id)objc_opt_class() biomeStreamTypeToBiomeStream:5];
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:0 endDate:0 maxEvents:1 lastN:1 reversed:0];
    id v6 = [v4 publisherWithOptions:v5];

    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v63 = __Block_byref_object_copy__139;
    *(void *)&long long v64 = __Block_byref_object_dispose__139;
    *((void *)&v64 + 1) = 0;
    uint64_t v47 = 0;
    uint64_t v48 = (id *)&v47;
    uint64_t v49 = 0x3032000000;
    char v50 = __Block_byref_object_copy__139;
    v51 = __Block_byref_object_dispose__139;
    id v52 = 0;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __57__RTBiomeManager__getLatestBiomeDataForStreamType_error___block_invoke;
    v44[3] = &unk_1E6B9B720;
    id v46 = &v47;
    uint64_t v8 = v7;
    v45 = v8;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __57__RTBiomeManager__getLatestBiomeDataForStreamType_error___block_invoke_2;
    v43[3] = &unk_1E6B9B748;
    v43[4] = buf;
    id v9 = (id)[v6 sinkWithCompletion:v44 receiveInput:v43];
    int v10 = v8;
    int v11 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v12 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v10, v12)) {
      goto LABEL_10;
    }
    __int16 v13 = [MEMORY[0x1E4F1C9C8] now];
    [v13 timeIntervalSinceDate:v11];
    double v15 = v14;
    uint64_t v16 = objc_opt_new();
    id v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_110];
    long long v18 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v19 = [v18 filteredArrayUsingPredicate:v17];
    long long v20 = [v19 firstObject];

    [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
    __int16 v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v55 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v55, 2u);
    }

    id v22 = (void *)MEMORY[0x1E4F28C58];
    v65[0] = *MEMORY[0x1E4F28568];
    *(void *)id v55 = @"semaphore wait timeout";
    __int16 v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v65 count:1];
    id v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

    if (v24)
    {
      id v25 = v24;
    }
    else
    {
LABEL_10:
      id v25 = 0;
    }

    id v28 = v25;
    if (v28) {
      objc_storeStrong(v48 + 5, v25);
    }
    id v29 = v48[5];
    if (v29)
    {
      *a4 = v29;
      __int16 v30 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        v39 = [(id)objc_opt_class() streamTypeToString:5];
        id v40 = v48[5];
        *(_DWORD *)id v55 = 138413058;
        *(void *)&v55[4] = v37;
        __int16 v56 = 2112;
        id v57 = v38;
        __int16 v58 = 2112;
        id v59 = v39;
        __int16 v60 = 2112;
        id v61 = v40;
        _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "%@, %@, streamType, %@, error, %@", v55, 0x2Au);
      }
    }
    id v27 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v53 = *MEMORY[0x1E4F28568];
    v54 = @"Unsupported stream type";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v4];
    *a4 = v6;
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityBiome);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = (objc_class *)objc_opt_class();
      int v33 = NSStringFromClass(v32);
      __int16 v34 = NSStringFromSelector(a2);
      v35 = [(id)objc_opt_class() streamTypeToString:a3];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v33;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v34;
      *(_WORD *)&buf[22] = 2112;
      id v63 = v35;
      LOWORD(v64) = 2112;
      *(void *)((char *)&v64 + 2) = v6;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%@, %@, streamType, %@, error, %@", buf, 0x2Au);
    }
    id v27 = 0;
  }

  return v27;
}

void __57__RTBiomeManager__getLatestBiomeDataForStreamType_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 state])
  {
    uint64_t v3 = [v6 error];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    double v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__RTBiomeManager__getLatestBiomeDataForStreamType_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [v8 eventBody];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    dispatch_semaphore_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

+ (id)biomeStreamTypeToBiomeStream:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v3 = BiomeLibrary();
      uint64_t v4 = [v3 Device];
      uint64_t v5 = [v4 Power];
      uint64_t v6 = [v5 PluggedIn];
      goto LABEL_7;
    case 2:
      uint64_t v3 = BiomeLibrary();
      uint64_t v4 = [v3 Device];
      uint64_t v8 = [v4 ScreenLocked];
      goto LABEL_9;
    case 3:
      uint64_t v3 = BiomeLibrary();
      uint64_t v4 = [v3 Motion];
      uint64_t v8 = [v4 Activity];
      goto LABEL_9;
    case 4:
      uint64_t v3 = BiomeLibrary();
      uint64_t v4 = [v3 Device];
      uint64_t v5 = [v4 Wireless];
      uint64_t v6 = [v5 WiFi];
LABEL_7:
      dispatch_semaphore_t v7 = (void *)v6;

      goto LABEL_10;
    case 5:
      uint64_t v3 = BiomeLibrary();
      uint64_t v4 = [v3 Location];
      uint64_t v8 = [v4 Visit];
LABEL_9:
      dispatch_semaphore_t v7 = (void *)v8;
LABEL_10:

      break;
    default:
      dispatch_semaphore_t v7 = 0;
      break;
  }

  return v7;
}

+ (id)streamTypeToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return @"Unknown";
  }
  else {
    return off_1E6B9B768[a3 - 1];
  }
}

- (BMBiomeScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (BPSSink)sink
{
  return self->_sink;
}

- (void)setSink:(id)a3
{
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (int64_t)encryptedDataAvailability
{
  return self->_encryptedDataAvailability;
}

- (void)setEncryptedDataAvailability:(int64_t)a3
{
  self->_encryptedDataAvailability = a3;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (BOOL)routineEnabled
{
  return self->_routineEnabled;
}

- (void)setRoutineEnabled:(BOOL)a3
{
  self->_routineEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_sink, 0);

  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end