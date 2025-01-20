@interface RTVisitMonitor
+ (double)LocationHeartbeatWhileAwake;
+ (id)bucketLocations:(id)a3 interval:(double)a4;
+ (id)hyperParameterForPipelineType:(unint64_t)a3;
+ (id)regionMonitoringClientIdentifierForPipelineType:(unint64_t)a3;
+ (id)regionWithRegionIdentifier:(id)a3 location:(id)a4 shouldNotifyForEntry:(BOOL)a5;
+ (int64_t)hintSourceForRegionCallbackType:(int64_t)a3;
- (BOOL)_setupGeoFencesForVisit:(id)a3 pipelineType:(unint64_t)a4 error:(id *)a5;
- (BOOL)monitoringLeechedVisitIncidents;
- (BOOL)monitoringLowConfidenceVisitIncidents;
- (BOOL)monitoringVisitIncidents;
- (NSMutableDictionary)pipelines;
- (NSMutableSet)pipelinesMonitoringRegion;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTDeviceLocationPredictor)deviceLocationPredictor;
- (RTDistanceCalculator)distanceCalculator;
- (RTHintManager)hintManager;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocationAwarenessManager)locationAwarenessManager;
- (RTLocationManager)locationManager;
- (RTMetricManager)metricManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTPlatform)platform;
- (RTTimerManager)timerManager;
- (RTVisitLabeler)visitLabeler;
- (RTVisitMonitor)init;
- (RTVisitMonitor)initWithDefaultsManager:(id)a3 deviceLocationPredictor:(id)a4 distanceCalculator:(id)a5 hintManager:(id)a6 learnedLocationManager:(id)a7 locationAwarenessManager:(id)a8 locationManager:(id)a9 metricManager:(id)a10 motionActivityManager:(id)a11 platform:(id)a12 queue:(id)a13 state:(id)a14 timerManager:(id)a15 visitLabeler:(id)a16;
- (RTVisitMonitor)initWithDefaultsManager:(id)a3 deviceLocationPredictor:(id)a4 hintManager:(id)a5 learnedLocationManager:(id)a6 locationAwarenessManager:(id)a7 locationManager:(id)a8 metricManager:(id)a9 motionActivityManager:(id)a10 platform:(id)a11 queue:(id)a12 state:(id)a13 visitLabeler:(id)a14;
- (RTVisitMonitorDelegate)delegate;
- (RTVisitMonitorState)state;
- (double)maxHorizontalAccuracyOverride;
- (id)_configurationForPipelineType:(unint64_t)a3;
- (id)_createPipelineWithType:(unint64_t)a3 name:(id)a4 lastVisit:(id)a5;
- (id)_moduleWithName:(id)a3 pipelineType:(unint64_t)a4 hyperParameter:(id)a5;
- (id)_modulesForPipelineType:(unint64_t)a3 hyperParameter:(id)a4;
- (id)_updateSourceForVisit:(id)a3;
- (unint64_t)feedBufferReferenceCounter;
- (unint64_t)highConfidencePipelineReferenceCounter;
- (unint64_t)lowConfidencePipelineReferenceCounter;
- (unint64_t)visitPipelineTypeOverride;
- (void)_batchProcess:(id)a3 fromDate:(id)a4 toDate:(id)a5 handler:(id)a6;
- (void)_bootstrapPipeline:(id)a3 handler:(id)a4;
- (void)_compareVisit:(id)a3 previousVisit:(id)a4;
- (void)_processLeechedLocations:(id)a3;
- (void)_processMatureLocations;
- (void)_processRealtimeVisits:(id)a3 pipeline:(id)a4;
- (void)_registerVisitMonitorForRegionEventsForPipelineType:(unint64_t)a3;
- (void)_setupRealtimePipelineWithType:(unint64_t)a3 handler:(id)a4;
- (void)_shutdown;
- (void)_startFeedBuffer;
- (void)_startFeedBufferTimer;
- (void)_stopFeedBuffer;
- (void)_stopMonitoringAllRegionsForPipelineType:(unint64_t)a3;
- (void)_unregisterVisitMonitorForRegionEventsForPipelineType:(unint64_t)a3;
- (void)compareVisit:(id)a3 previousVisit:(id)a4;
- (void)fetchVisitMonitorState:(id)a3;
- (void)fetchVisitMonitorStatusWithHandler:(id)a3;
- (void)fetchVisitsFromDate:(id)a3 toDate:(id)a4 handler:(id)a5;
- (void)handleLowConfidenceVisitIncident:(id)a3;
- (void)handleRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5;
- (void)handleVisitIncident:(id)a3;
- (void)onLeechedLocationsNotification:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceLocationPredictor:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setFeedBufferReferenceCounter:(unint64_t)a3;
- (void)setHighConfidencePipelineReferenceCounter:(unint64_t)a3;
- (void)setHintManager:(id)a3;
- (void)setLearnedLocationManager:(id)a3;
- (void)setLocationAwarenessManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLowConfidencePipelineReferenceCounter:(unint64_t)a3;
- (void)setMetricManager:(id)a3;
- (void)setMonitoringLeechedVisitIncidents:(BOOL)a3;
- (void)setMonitoringLowConfidenceVisitIncidents:(BOOL)a3;
- (void)setMonitoringVisitIncidents:(BOOL)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setPipelines:(id)a3;
- (void)setPipelinesMonitoringRegion:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setQueue:(id)a3;
- (void)setState:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setVisitLabeler:(id)a3;
- (void)setupGeoFencesForVisit:(id)a3 pipelineType:(unint64_t)a4 handler:(id)a5;
- (void)showVisitReentryDetectionUI;
- (void)shutdownWithHandler:(id)a3;
- (void)startMonitoringLeechedVisitIncidents;
- (void)startMonitoringLowConfidenceVisitIncidents;
- (void)startMonitoringVisitIncidents;
- (void)stopMonitoringLeechedVisitIncidents;
- (void)stopMonitoringLowConfidenceVisitIncidents;
- (void)stopMonitoringVisitIncidents;
@end

@implementation RTVisitMonitor

- (void)onLeechedLocationsNotification:(id)a3
{
  id v5 = a3;
  v6 = [(RTVisitMonitor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__RTVisitMonitor_onLeechedLocationsNotification___block_invoke;
  block[3] = &unk_1E6B91220;
  id v9 = v5;
  v10 = self;
  SEL v11 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

id __49__RTVisitMonitor_onLeechedLocationsNotification___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F5CE00];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithCLLocation:v3];

  return v4;
}

void __49__RTVisitMonitor_onLeechedLocationsNotification___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) name];
  id v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    id v5 = *(id *)(a1 + 32);
    v6 = [_RTMap alloc];
    id v7 = [v5 leechedLocations];
    v8 = [(_RTMap *)v6 initWithInput:v7];
    id v14 = [(_RTMap *)v8 withBlock:&__block_literal_global_145];

    [*(id *)(a1 + 40) _processLeechedLocations:v14];
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      SEL v11 = NSStringFromClass(v10);
      v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
      v13 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138413314;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v12;
      __int16 v19 = 2112;
      __int16 v21 = 2080;
      v20 = v13;
      v22 = "-[RTVisitMonitor onLeechedLocationsNotification:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 1181;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, %@, unhandled notification, %@ (in %s:%d)", buf, 0x30u);
    }
  }
}

- (void)_processLeechedLocations:(id)a3
{
  feedBuffer = self->_feedBuffer;
  if (feedBuffer)
  {
    [(RTVisitFeedBuffer *)feedBuffer addLocations:a3];
    [(RTVisitMonitor *)self _startFeedBufferTimer];
  }
}

void __39__RTVisitMonitor__startFeedBufferTimer__block_invoke(uint64_t a1)
{
  v2 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "feedBuffer timer expiry", v5, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[2] invalidate];
  id v4 = WeakRetained[2];
  WeakRetained[2] = 0;

  [WeakRetained _processMatureLocations];
  [WeakRetained _startFeedBufferTimer];
}

- (void)_startFeedBufferTimer
{
  if (!self->_feedBufferTimer)
  {
    if ([(RTVisitFeedBuffer *)self->_feedBuffer numLocations])
    {
      objc_initWeak(&location, self);
      timerManager = self->_timerManager;
      id v4 = [(RTVisitMonitor *)self queue];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      SEL v11 = __39__RTVisitMonitor__startFeedBufferTimer__block_invoke;
      v12 = &unk_1E6B91900;
      objc_copyWeak(&v13, &location);
      id v5 = [(RTTimerManager *)timerManager timerWithIdentifier:@"com.apple.routined.visit.feedbuffer.timer" queue:v4 handler:&v9];
      feedBufferTimer = self->_feedBufferTimer;
      self->_feedBufferTimer = v5;

      id v7 = self->_feedBufferTimer;
      [(RTVisitFeedBuffer *)self->_feedBuffer minWaitInterval];
      [(RTTimer *)v7 fireAfterDelay:v8 * 0.5];
      [(RTTimer *)self->_feedBufferTimer resume];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_processMatureLocations
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(RTVisitFeedBuffer *)self->_feedBuffer numLocations];
  if (v4)
  {
    unint64_t v5 = v4;
    v6 = [(RTVisitFeedBuffer *)self->_feedBuffer maturedLocations];
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = [v6 count];
      __int16 v17 = 2048;
      unint64_t v18 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, processing %lu/%lu matured locations from feedBuffer", buf, 0x20u);
    }
    if ([v6 count])
    {
      pipelines = self->_pipelines;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __41__RTVisitMonitor__processMatureLocations__block_invoke;
      v10[3] = &unk_1E6B956B8;
      id v11 = v6;
      v12 = self;
      [(NSMutableDictionary *)pipelines enumerateKeysAndObjectsUsingBlock:v10];
    }
  }
}

+ (double)LocationHeartbeatWhileAwake
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"VisitMonitorLocationHeartbeatIntervalWhileAwake"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
    v6 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412546;
      uint64_t v9 = @"VisitMonitorLocationHeartbeatIntervalWhileAwake";
      __int16 v10 = 2048;
      double v11 = v5;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@ overridden to %.1fs", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    double v5 = 300.0;
  }

  return v5;
}

+ (id)regionMonitoringClientIdentifierForPipelineType:(unint64_t)a3
{
  double v4 = NSString;
  double v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  id v7 = +[RTVisitPipeline typeToString:a3];
  int v8 = [v4 stringWithFormat:@"%@.%@", v6, v7];

  return v8;
}

- (RTVisitMonitor)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_deviceLocationPredictor_distanceCalculator_hintManager_learnedLocationManager_locationAwarenessManager_locationManager_metricManager_motionActivityManager_platform_queue_state_timerManager_visitLabeler_);
}

- (RTVisitMonitor)initWithDefaultsManager:(id)a3 deviceLocationPredictor:(id)a4 hintManager:(id)a5 learnedLocationManager:(id)a6 locationAwarenessManager:(id)a7 locationManager:(id)a8 metricManager:(id)a9 motionActivityManager:(id)a10 platform:(id)a11 queue:(id)a12 state:(id)a13 visitLabeler:(id)a14
{
  id v35 = a14;
  id v32 = a13;
  id v31 = a12;
  id v25 = a11;
  id v18 = a10;
  id v27 = a9;
  id v37 = a8;
  id v26 = a7;
  id v19 = a6;
  id v20 = a5;
  id v29 = a4;
  id v21 = a3;
  v30 = objc_opt_new();
  v34 = objc_opt_new();
  v22 = v19;
  __int16 v23 = [(RTVisitMonitor *)self initWithDefaultsManager:v21 deviceLocationPredictor:v29 distanceCalculator:v30 hintManager:v20 learnedLocationManager:v19 locationAwarenessManager:v26 locationManager:v37 metricManager:v27 motionActivityManager:v18 platform:v25 queue:v31 state:v32 timerManager:v34 visitLabeler:v35];

  return v23;
}

- (RTVisitMonitor)initWithDefaultsManager:(id)a3 deviceLocationPredictor:(id)a4 distanceCalculator:(id)a5 hintManager:(id)a6 learnedLocationManager:(id)a7 locationAwarenessManager:(id)a8 locationManager:(id)a9 metricManager:(id)a10 motionActivityManager:(id)a11 platform:(id)a12 queue:(id)a13 state:(id)a14 timerManager:(id)a15 visitLabeler:(id)a16
{
  id v60 = a3;
  id v49 = a4;
  id v59 = a5;
  id v46 = a6;
  id v58 = a6;
  id v47 = a7;
  id v51 = a7;
  id v48 = a8;
  id v50 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v57 = a12;
  id v56 = a13;
  id v55 = a14;
  id v54 = a15;
  id v24 = a16;
  v52 = v24;
  if (!v60)
  {
    id v25 = v49;
    id v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v34 = 0;
    v36 = v59;
    id v37 = v60;
    v38 = v58;
    id v27 = v50;
    id v26 = v51;
    goto LABEL_50;
  }
  id v25 = v49;
  if (!v49)
  {
    v39 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = v58;
    v36 = v59;
    id v27 = v50;
    id v26 = v51;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: deviceLocationPredictor", buf, 2u);
    }

    v34 = 0;
    id v37 = v60;
    goto LABEL_50;
  }
  id v27 = v50;
  id v26 = v51;
  if (!v59)
  {
    v38 = v58;
    v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator", buf, 2u);
    }

    v34 = 0;
    v36 = v59;
    id v37 = v60;
    goto LABEL_50;
  }
  if (!v58)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: hintManager";
LABEL_47:
    _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, v42, buf, 2u);
    goto LABEL_48;
  }
  if (!v51)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_47;
  }
  if (!v50)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: locationAwarenessManager";
    goto LABEL_47;
  }
  if (!v21)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_47;
  }
  if (!v22)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: metricManager";
    goto LABEL_47;
  }
  if (!v23)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_47;
  }
  if (!v57)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: platform";
    goto LABEL_47;
  }
  if (!v56)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: queue";
    goto LABEL_47;
  }
  if (!v55)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: state";
    goto LABEL_47;
  }
  if (!v54)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v42 = "Invalid parameter not satisfying: timerManager";
      goto LABEL_47;
    }
LABEL_48:

    v34 = 0;
LABEL_49:
    v36 = v59;
    id v37 = v60;
    v38 = v58;
    goto LABEL_50;
  }
  if (v24)
  {
    v61.receiver = self;
    v61.super_class = (Class)RTVisitMonitor;
    v28 = [(RTVisitMonitor *)&v61 init];
    id v29 = v28;
    if (v28)
    {
      objc_storeStrong((id *)&v28->_defaultsManager, a3);
      objc_storeStrong((id *)&v29->_deviceLocationPredictor, a4);
      objc_storeStrong((id *)&v29->_distanceCalculator, a5);
      objc_storeStrong((id *)&v29->_hintManager, v46);
      objc_storeStrong((id *)&v29->_learnedLocationManager, v47);
      objc_storeStrong((id *)&v29->_locationAwarenessManager, v48);
      objc_storeStrong((id *)&v29->_locationManager, a9);
      objc_storeStrong((id *)&v29->_metricManager, a10);
      objc_storeStrong((id *)&v29->_motionActivityManager, a11);
      objc_storeStrong((id *)&v29->_platform, a12);
      objc_storeStrong((id *)&v29->_timerManager, a15);
      objc_storeStrong((id *)&v29->_state, a14);
      objc_storeStrong((id *)&v29->_queue, a13);
      uint64_t v30 = objc_opt_new();
      pipelines = v29->_pipelines;
      v29->_pipelines = (NSMutableDictionary *)v30;

      uint64_t v32 = objc_opt_new();
      pipelinesMonitoringRegion = v29->_pipelinesMonitoringRegion;
      v29->_pipelinesMonitoringRegion = (NSMutableSet *)v32;

      objc_storeStrong((id *)&v29->_visitLabeler, a16);
    }
    v34 = v29;
    self = v34;
    goto LABEL_49;
  }
  v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v36 = v59;
  id v37 = v60;
  v38 = v58;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitLabeler", buf, 2u);
  }

  v34 = 0;
LABEL_50:

  return v34;
}

- (void)shutdownWithHandler:(id)a3
{
  id v4 = a3;
  double v5 = [(RTVisitMonitor *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__RTVisitMonitor_shutdownWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __38__RTVisitMonitor_shutdownWithHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _shutdown];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_shutdown
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    double v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v20 = v5;
    __int16 v21 = 2112;
    id v22 = self;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);
  }
  id v6 = [(RTVisitMonitor *)self locationManager];
  [v6 removeObserver:self];

  id v7 = [(RTVisitMonitor *)self locationAwarenessManager];
  [v7 removeLocationHeartbeatRequester:self];

  [(RTVisitMonitor *)self _unregisterVisitMonitorForRegionEventsForPipelineType:2];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(RTVisitMonitor *)self pipelines];
  uint64_t v9 = [v8 allValues];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) shutdown];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (double)maxHorizontalAccuracyOverride
{
  uint64_t v2 = [(RTVisitMonitor *)self defaultsManager];
  id v3 = [v2 objectForKey:@"MaxHorizontalAccuracy"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = -1.0;
  }

  return v5;
}

- (unint64_t)visitPipelineTypeOverride
{
  uint64_t v2 = [(RTVisitMonitor *)self defaultsManager];
  id v3 = [v2 objectForKey:@"PlaybackVisitPipelineType"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = v3;
    unint64_t v5 = 1;
    id v6 = [(id)objc_opt_class() typeToString:1];
    char v7 = [v4 isEqualToString:v6];

    if ((v7 & 1) == 0)
    {
      unint64_t v5 = 2;
      id v8 = [(id)objc_opt_class() typeToString:2];
      char v9 = [v4 isEqualToString:v8];

      if ((v9 & 1) == 0)
      {
        uint64_t v10 = [(id)objc_opt_class() typeToString:4];
        int v11 = [v4 isEqualToString:v10];

        if (v11) {
          unint64_t v5 = 4;
        }
        else {
          unint64_t v5 = 0;
        }
      }
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)setFeedBufferReferenceCounter:(unint64_t)a3
{
  unint64_t feedBufferReferenceCounter = self->_feedBufferReferenceCounter;
  if (feedBufferReferenceCounter != a3)
  {
    if (feedBufferReferenceCounter)
    {
      if (a3)
      {
LABEL_4:
        self->_unint64_t feedBufferReferenceCounter = a3;
        return;
      }
    }
    else
    {
      [(RTVisitMonitor *)self _startFeedBuffer];
      if (a3) {
        goto LABEL_4;
      }
    }
    [(RTVisitMonitor *)self _stopFeedBuffer];
    goto LABEL_4;
  }
}

- (id)_moduleWithName:(id)a3 pipelineType:(unint64_t)a4 hyperParameter:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (objc_class *)objc_opt_class();
  int v11 = NSStringFromClass(v10);
  int v12 = [v8 isEqualToString:v11];

  if (v12)
  {
    if (a4 == 2)
    {
      uint64_t v13 = [RTDelayedLocationRequester alloc];
      long long v14 = [(RTVisitMonitor *)self locationManager];
      [v9 maxHorizontalAccuracy];
      double v16 = v15;
      long long v17 = [(RTVisitMonitor *)self queue];
      id v18 = [(RTDelayedLocationRequester *)v13 initWithLocationManager:v14 maxHorizontalAccuracy:v17 queue:v16];
    }
    else
    {
      id v18 = 0;
    }
    uint64_t v23 = [RTVisitPipelineModuleSCI alloc];
    id v24 = [(RTVisitMonitor *)self defaultsManager];
    id v25 = [(RTVisitMonitor *)self hintManager];
    id v26 = [(RTVisitMonitor *)self queue];
    id v27 = [(RTVisitPipelineModuleSCI *)v23 initWithDefaultsManager:v24 delayedLocationRequester:v18 hintManager:v25 queue:v26 hyperParameter:v9 useLowConfidence:a4 == 1];

    goto LABEL_8;
  }
  id v19 = (objc_class *)objc_opt_class();
  id v20 = NSStringFromClass(v19);
  int v21 = [v8 isEqualToString:v20];

  if (v21)
  {
    id v22 = RTVisitPipelineModuleBurstNoiseFilter;
LABEL_11:
    uint64_t v31 = [[v22 alloc] initWithHyperParameter:v9];
LABEL_12:
    id v27 = (RTVisitPipelineModuleSCI *)v31;
    goto LABEL_13;
  }
  v28 = (objc_class *)objc_opt_class();
  id v29 = NSStringFromClass(v28);
  int v30 = [v8 isEqualToString:v29];

  if (v30)
  {
    id v22 = RTVisitPipelineModuleSpeedCluster;
    goto LABEL_11;
  }
  v33 = (objc_class *)objc_opt_class();
  v34 = NSStringFromClass(v33);
  int v35 = [v8 isEqualToString:v34];

  if (v35)
  {
    v36 = [RTVisitPipelineModuleSmoother alloc];
    double v37 = (double)(unint64_t)[v9 timeIntervalBetweenSmoothedPoints];
    double v38 = (double)(unint64_t)[v9 smootherKernelWidth];
    [v9 maxGapInVisit];
    uint64_t v31 = [(RTVisitPipelineModuleSmoother *)v36 initWithTimeIntervalBetweenSmoothedPoints:v37 kernelWidth:v38 smallestSignificantWeightExponent:-10.0 maxGapWithinVisit:v39];
    goto LABEL_12;
  }
  v40 = (objc_class *)objc_opt_class();
  v41 = NSStringFromClass(v40);
  int v42 = [v8 isEqualToString:v41];

  if (v42)
  {
    v43 = [RTVisitPipelineModuleTrajectorySequenceCluster alloc];
    v44 = [[RTVisitModelControllerBatchMode alloc] initWithHyperParameter:v9];
    id v27 = [(RTVisitPipelineModuleTrajectorySequenceCluster *)v43 initWithVisitTrajectorySequenceClassifier:v44 hyperParameter:v9];

    goto LABEL_13;
  }
  v45 = (objc_class *)objc_opt_class();
  id v46 = NSStringFromClass(v45);
  int v47 = [v8 isEqualToString:v46];

  if (v47)
  {
    id v48 = [RTVisitPipelineModuleVisitCentroidUpdater alloc];
    id v18 = [(RTVisitMonitor *)self locationManager];
    id v49 = objc_opt_new();
    uint64_t v50 = [(RTVisitPipelineModuleVisitCentroidUpdater *)v48 initWithHyperParameter:v9 locationManager:v18 distanceCalculator:v49];
LABEL_26:
    id v27 = (RTVisitPipelineModuleSCI *)v50;

    goto LABEL_8;
  }
  id v51 = (objc_class *)objc_opt_class();
  v52 = NSStringFromClass(v51);
  int v53 = [v8 isEqualToString:v52];

  if (v53)
  {
    id v54 = [RTVisitPipelineModuleAltitudeEstimator alloc];
    [v9 maxHorizontalAccuracy];
    double v56 = v55;
    id v18 = [(RTVisitMonitor *)self locationManager];
    id v27 = [(RTVisitPipelineModuleAltitudeEstimator *)v54 initWithMaxHorizontalAccuracy:v18 locationManager:v56];
LABEL_8:

    goto LABEL_13;
  }
  id v57 = (objc_class *)objc_opt_class();
  id v58 = NSStringFromClass(v57);
  int v59 = [v8 isEqualToString:v58];

  if (v59)
  {
    id v60 = [RTVisitPipelineModuleMotionStateTrimmer alloc];
    id v18 = [(RTVisitMonitor *)self motionActivityManager];
    id v49 = [(RTVisitMonitor *)self defaultsManager];
    uint64_t v50 = [(RTVisitPipelineModuleMotionStateTrimmer *)v60 initWithMotionActivityManager:v18 defaultsManager:v49];
    goto LABEL_26;
  }
  objc_super v61 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    int v63 = 138412802;
    id v64 = v8;
    __int16 v65 = 2080;
    v66 = "-[RTVisitMonitor _moduleWithName:pipelineType:hyperParameter:]";
    __int16 v67 = 1024;
    int v68 = 431;
    _os_log_error_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_ERROR, "unsupported module, name, %@ (in %s:%d)", (uint8_t *)&v63, 0x1Cu);
  }

  v62 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
  {
    int v63 = 138412290;
    id v64 = v8;
    _os_log_fault_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_FAULT, "unsupported module, name, %@", (uint8_t *)&v63, 0xCu);
  }

  id v27 = 0;
LABEL_13:

  return v27;
}

- (id)_configurationForPipelineType:(unint64_t)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (a3 > 4 || ((1 << a3) & 0x16) == 0)
  {
    long long v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: VALID_PIPELINE(pipelineType)", buf, 2u);
    }

    if (a3 != 4)
    {
      id v18 = 0;
      goto LABEL_27;
    }
  }
  id v6 = [(RTVisitMonitor *)self platform];
  if (([v6 internalInstall] & 1) == 0)
  {

LABEL_8:
    switch(a3)
    {
      case 1uLL:
        double v15 = (objc_class *)objc_opt_class();
        int v12 = NSStringFromClass(v15);
        v43[0] = v12;
        double v16 = (objc_class *)objc_opt_class();
        uint64_t v13 = NSStringFromClass(v16);
        v43[1] = v13;
        int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
        goto LABEL_24;
      case 2uLL:
        id v19 = (objc_class *)objc_opt_class();
        int v12 = NSStringFromClass(v19);
        v42[0] = v12;
        id v20 = (objc_class *)objc_opt_class();
        uint64_t v13 = NSStringFromClass(v20);
        v42[1] = v13;
        int v21 = (objc_class *)objc_opt_class();
        long long v14 = NSStringFromClass(v21);
        v42[2] = v14;
        id v22 = (objc_class *)objc_opt_class();
        uint64_t v23 = NSStringFromClass(v22);
        v42[3] = v23;
        int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
        goto LABEL_21;
      case 3uLL:
        int v12 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          double v38 = NSStringFromSelector(a2);
          double v39 = +[RTVisitPipeline typeToString:3];
          *(_DWORD *)buf = 138412546;
          v45 = v38;
          __int16 v46 = 2112;
          int v47 = v39;
          _os_log_fault_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_FAULT, "%@, unsupported type, %@", buf, 0x16u);
        }
        int v11 = 0;
        goto LABEL_25;
      case 4uLL:
        id v24 = [(RTVisitMonitor *)self platform];
        int v25 = [v24 usesTSCForClustering];

        id v26 = (objc_class *)objc_opt_class();
        uint64_t v27 = NSStringFromClass(v26);
        int v12 = v27;
        if (v25)
        {
          v41[0] = v27;
          v28 = (objc_class *)objc_opt_class();
          uint64_t v13 = NSStringFromClass(v28);
          v41[1] = v13;
          id v29 = (objc_class *)objc_opt_class();
          long long v14 = NSStringFromClass(v29);
          v41[2] = v14;
          int v30 = (objc_class *)objc_opt_class();
          uint64_t v23 = NSStringFromClass(v30);
          v41[3] = v23;
          uint64_t v31 = (objc_class *)objc_opt_class();
          uint64_t v32 = NSStringFromClass(v31);
          v41[4] = v32;
          v33 = (objc_class *)objc_opt_class();
          v34 = NSStringFromClass(v33);
          v41[5] = v34;
          int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:6];

LABEL_21:
        }
        else
        {
          v40[0] = v27;
          int v35 = (objc_class *)objc_opt_class();
          uint64_t v13 = NSStringFromClass(v35);
          v40[1] = v13;
          v36 = (objc_class *)objc_opt_class();
          long long v14 = NSStringFromClass(v36);
          v40[2] = v14;
          int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
        }
        break;
      default:
        int v11 = 0;
        goto LABEL_26;
    }
    goto LABEL_23;
  }
  char v7 = [(RTVisitMonitor *)self defaultsManager];
  id v8 = NSString;
  id v9 = +[RTVisitPipeline typeToString:a3];
  uint64_t v10 = [v8 stringWithFormat:@"RTVisitPiplelineType%@", v9];
  int v11 = [v7 objectForKey:v10];

  if (!v11) {
    goto LABEL_8;
  }
  int v12 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    goto LABEL_25;
  }
  uint64_t v13 = +[RTVisitPipeline typeToString:a3];
  long long v14 = [v11 componentsJoinedByString:@", "];
  *(_DWORD *)buf = 138412546;
  v45 = v13;
  __int16 v46 = 2112;
  int v47 = v14;
  _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "pipeline configuration overidden by defaults, pipelineType, %@, configuration, %@", buf, 0x16u);
LABEL_23:

LABEL_24:
LABEL_25:

LABEL_26:
  id v18 = v11;

LABEL_27:

  return v18;
}

- (id)_modulesForPipelineType:(unint64_t)a3 hyperParameter:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (a3 <= 4 && ((1 << a3) & 0x16) != 0) {
    goto LABEL_3;
  }
  int v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: VALID_PIPELINE(type)", buf, 2u);
  }

  if (a3 == 4)
  {
LABEL_3:
    if (v7)
    {
      id v8 = objc_opt_new();
      id v9 = [(RTVisitMonitor *)self _configurationForPipelineType:a3];
      uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = NSStringFromSelector(a2);
        int v12 = +[RTVisitPipeline typeToString:a3];
        uint64_t v13 = [v9 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412802;
        v28 = v11;
        __int16 v29 = 2112;
        int v30 = v12;
        __int16 v31 = 2112;
        uint64_t v32 = v13;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, pipelineType, %@, configuration, %@", buf, 0x20u);
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v14 = v9;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = -[RTVisitMonitor _moduleWithName:pipelineType:hyperParameter:](self, "_moduleWithName:pipelineType:hyperParameter:", *(void *)(*((void *)&v22 + 1) + 8 * i), a3, v7, (void)v22);
            if (v19) {
              [v8 addObject:v19];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v16);
      }
    }
    else
    {
      long long v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hyperParameter", buf, 2u);
      }
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)hyperParameterForPipelineType:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      unint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        id v8 = NSStringFromSelector(a2);
        id v9 = +[RTVisitPipeline typeToString:a3];
        int v10 = 138412546;
        int v11 = v8;
        __int16 v12 = 2112;
        uint64_t v13 = v9;
        _os_log_fault_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_FAULT, "%@, unsupported type, %@", (uint8_t *)&v10, 0x16u);
      }
      goto LABEL_5;
    case 1uLL:
    case 2uLL:
    case 4uLL:
      id v6 = objc_opt_new();
      break;
    default:
LABEL_5:
      id v6 = 0;
      break;
  }

  return v6;
}

- (id)_createPipelineWithType:(unint64_t)a3 name:(id)a4 lastVisit:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a3 <= 4 && ((1 << a3) & 0x16) != 0) {
    goto LABEL_3;
  }
  id v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v21) = 0;
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: VALID_PIPELINE(type)", (uint8_t *)&v21, 2u);
  }

  if (a3 == 4)
  {
LABEL_3:
    if (v8)
    {
      int v10 = [(id)objc_opt_class() hyperParameterForPipelineType:a3];
      int v11 = [(RTVisitMonitor *)self platform];
      int v12 = [v11 internalInstall];

      if (v12)
      {
        [(RTVisitMonitor *)self maxHorizontalAccuracyOverride];
        if (v13 > 0.0)
        {
          double v14 = v13;
          uint64_t v15 = [NSNumber numberWithDouble:];
          [v10 setValue:v15 forKey:@"maxHorizontalAccuracy"];

          uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            int v21 = 138412546;
            long long v22 = @"MaxHorizontalAccuracy";
            __int16 v23 = 2048;
            double v24 = v14;
            _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@ overridden to %.2f", (uint8_t *)&v21, 0x16u);
          }
        }
      }
      uint64_t v17 = [(RTVisitMonitor *)self _modulesForPipelineType:a3 hyperParameter:v10];
      id v18 = [[RTVisitPipeline alloc] initWithModules:v17 name:v8 type:a3 lastVisit:v9 hyperParameter:v10];
    }
    else
    {
      int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v21) = 0;
        _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name", (uint8_t *)&v21, 2u);
      }
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (void)_setupRealtimePipelineWithType:(unint64_t)a3 handler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void))a4;
  if (a3 - 1 >= 2)
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315394;
      double v24 = "-[RTVisitMonitor _setupRealtimePipelineWithType:handler:]";
      __int16 v25 = 1024;
      LODWORD(v26) = 594;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: VALID_REALTIME_PIPELINE(type) (in %s:%d)", (uint8_t *)&v23, 0x12u);
    }

    int v11 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    NSStringFromSelector(a2);
    int v12 = (char *)objc_claimAutoreleasedReturnValue();
    double v13 = +[RTVisitPipeline typeToString:a3];
    int v23 = 138412546;
    double v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    double v14 = "%@, unsupported type, %@";
    goto LABEL_22;
  }
  pipelines = self->_pipelines;
  id v9 = [NSNumber numberWithUnsignedInteger:a3];
  int v10 = [(NSMutableDictionary *)pipelines objectForKeyedSubscript:v9];

  if (v10)
  {
    int v11 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      v7[2](v7, 0);
      goto LABEL_9;
    }
    NSStringFromSelector(a2);
    int v12 = (char *)objc_claimAutoreleasedReturnValue();
    double v13 = +[RTVisitPipeline typeToString:a3];
    int v23 = 138412546;
    double v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    double v14 = "%@, pipline already setup, type, %@";
LABEL_22:
    _os_log_fault_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v23, 0x16u);

    goto LABEL_8;
  }
  if (a3 == 2)
  {
    uint64_t v16 = [(RTVisitMonitor *)self state];
    uint64_t v17 = [v16 lastVisitIncident];
    id v18 = @"com.apple.routined.visit.pipeline.realtime-high-confidence";
  }
  else
  {
    if (a3 != 1)
    {
      uint64_t v17 = 0;
      id v18 = 0;
      goto LABEL_16;
    }
    uint64_t v16 = [(RTVisitMonitor *)self state];
    uint64_t v17 = [v16 lastLowConfidenceVisitIncident];
    id v18 = @"com.apple.routined.visit.pipeline.realtime-low-confidence";
  }

LABEL_16:
  id v19 = [(RTVisitMonitor *)self _createPipelineWithType:a3 name:v18 lastVisit:v17];
  if (!v19)
  {
    id v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315394;
      double v24 = "-[RTVisitMonitor _setupRealtimePipelineWithType:handler:]";
      __int16 v25 = 1024;
      LODWORD(v26) = 641;
      _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: pipeline (in %s:%d)", (uint8_t *)&v23, 0x12u);
    }
  }
  int v21 = self->_pipelines;
  long long v22 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)v21 setObject:v19 forKeyedSubscript:v22];

  [(RTVisitMonitor *)self _bootstrapPipeline:v19 handler:v7];
LABEL_9:
}

- (void)_registerVisitMonitorForRegionEventsForPipelineType:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = [(id)objc_opt_class() regionMonitoringClientIdentifierForPipelineType:a3];
  locationManager = self->_locationManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__RTVisitMonitor__registerVisitMonitorForRegionEventsForPipelineType___block_invoke;
  v14[3] = &unk_1E6B95578;
  SEL v16 = a2;
  v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  [(RTLocationManager *)locationManager registerForRegionEventsWithClientIdentifier:v8 handler:v14];
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = NSStringFromSelector(a2);
    int v11 = +[RTVisitPipeline typeToString:a3];
    *(_DWORD *)buf = 138412546;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, Registration for pipeline, %@", buf, 0x16u);
  }
  pipelinesMonitoringRegion = self->_pipelinesMonitoringRegion;
  double v13 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableSet *)pipelinesMonitoringRegion addObject:v13];
}

void __70__RTVisitMonitor__registerVisitMonitorForRegionEventsForPipelineType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = v8;
  if (a3 == 4)
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v12 = +[RTLocationManager stringForRegionCallbackType:4];
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 176);
      int v19 = 138413058;
      id v20 = v11;
      __int16 v21 = 2112;
      long long v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      id v26 = v9;
      double v14 = "%@, regionMonitoring failure, %@, pipelinesMonitoringRegion, %@, error, %@";
      goto LABEL_7;
    }
  }
  else if (a3 == 3)
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v12 = +[RTLocationManager stringForRegionCallbackType:3];
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 176);
      int v19 = 138413058;
      id v20 = v11;
      __int16 v21 = 2112;
      long long v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      id v26 = v9;
      double v14 = "%@, regionMonitoring client registration failure, %@, pipelinesMonitoringRegion, %@, error, %@";
LABEL_7:
      _os_log_fault_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v19, 0x2Au);
    }
  }
  else
  {
    if (!v8)
    {
      [*(id *)(a1 + 32) handleRegionCallback:a3 region:v7 clientIdentifier:*(void *)(a1 + 40)];
      goto LABEL_12;
    }
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      SEL v16 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v17 = +[RTLocationManager stringForRegionCallbackType:a3];
      uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 176);
      int v19 = 138413058;
      id v20 = v16;
      __int16 v21 = 2112;
      long long v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_fault_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_FAULT, "%@, regionMonitoring %@, pipelinesMonitoringRegion, %@, error, %@", (uint8_t *)&v19, 0x2Au);
    }
  }

LABEL_12:
}

- (void)_unregisterVisitMonitorForRegionEventsForPipelineType:(unint64_t)a3
{
  pipelinesMonitoringRegion = self->_pipelinesMonitoringRegion;
  id v7 = [NSNumber numberWithUnsignedInteger:];
  LODWORD(pipelinesMonitoringRegion) = [(NSMutableSet *)pipelinesMonitoringRegion containsObject:v7];

  if (pipelinesMonitoringRegion)
  {
    locationManager = self->_locationManager;
    id v9 = [(id)objc_opt_class() regionMonitoringClientIdentifierForPipelineType:a3];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__RTVisitMonitor__unregisterVisitMonitorForRegionEventsForPipelineType___block_invoke;
    v12[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v12[4] = a2;
    [(RTLocationManager *)locationManager unregisterForRegionEventsWithClientIdentifier:v9 handler:v12];

    int v10 = self->_pipelinesMonitoringRegion;
    int v11 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableSet *)v10 removeObject:v11];
  }
}

void __72__RTVisitMonitor__unregisterVisitMonitorForRegionEventsForPipelineType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  unint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      id v6 = NSStringFromSelector(*(SEL *)(a1 + 32));
      int v7 = 138412546;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_fault_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_FAULT, "%@, regionMonitoring client unregistration failure, error, %@", (uint8_t *)&v7, 0x16u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 2112;
    id v10 = 0;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, error, %@", (uint8_t *)&v7, 0x16u);
    goto LABEL_6;
  }
}

- (void)handleRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = NSStringFromSelector(a2);
    uint64_t v13 = +[RTLocationManager stringForRegionCallbackType:a3];
    *(_DWORD *)buf = 138413058;
    int v30 = v12;
    __int16 v31 = 2112;
    uint64_t v32 = v13;
    __int16 v33 = 2112;
    id v34 = v9;
    __int16 v35 = 2112;
    id v36 = v10;
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, callbackType, %@, region, %@, clientIdentifier, %@", buf, 0x2Au);
  }
  if ((unint64_t)(a3 - 1) <= 1)
  {
    uint64_t v14 = [(id)objc_opt_class() hintSourceForRegionCallbackType:a3];
    id v15 = objc_alloc(MEMORY[0x1E4F5CE00]);
    [v9 center];
    double v17 = v16;
    [v9 center];
    double v19 = v18;
    [v9 radius];
    double v21 = v20;
    long long v22 = [MEMORY[0x1E4F1C9C8] now];
    __int16 v23 = (void *)[v15 initWithLatitude:v22 longitude:v17 horizontalUncertainty:v19 date:v21];

    uint64_t v24 = [(RTVisitMonitor *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__RTVisitMonitor_handleRegionCallback_region_clientIdentifier___block_invoke;
    block[3] = &unk_1E6B91220;
    id v27 = v23;
    uint64_t v28 = v14;
    void block[4] = self;
    id v25 = v23;
    dispatch_async(v24, block);
  }
}

uint64_t __63__RTVisitMonitor_handleRegionCallback_region_clientIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 64) submitHintFromSource:a1[6] location:a1[5]];
}

+ (int64_t)hintSourceForRegionCallbackType:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return 7;
  }
  if (a3 == 2) {
    return 8;
  }
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = NSStringFromSelector(a2);
    id v8 = +[RTLocationManager stringForRegionCallbackType:a3];
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    int v12 = v8;
    _os_log_fault_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_FAULT, "%@, unsupported type, %@", (uint8_t *)&v9, 0x16u);
  }
  return -1;
}

- (void)_bootstrapPipeline:(id)a3 handler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  int v9 = [v6 lastVisit];
  id v10 = [v9 exit];

  __int16 v11 = [v6 lastVisit];
  int v12 = v11;
  if (v10)
  {
    uint64_t v13 = [v11 exit];
  }
  else
  {
    uint64_t v14 = [v11 entry];

    if (!v14) {
      goto LABEL_6;
    }
    int v12 = [v6 lastVisit];
    uint64_t v13 = [v12 entry];
  }
  id v15 = v13;
  uint64_t v16 = [v13 dateByAddingTimeInterval:1.0];

  id v8 = (void *)v16;
LABEL_6:
  double v17 = [MEMORY[0x1E4F1C9C8] date];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  double v18 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    double v19 = [v8 stringFromDate];
    *(_DWORD *)buf = 138412546;
    id v31 = v6;
    __int16 v32 = 2112;
    __int16 v33 = v19;
    _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "start bootstraping pipeline, %@, with locations since %@", buf, 0x16u);
  }
  double v20 = [MEMORY[0x1E4F1C9C8] date];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __45__RTVisitMonitor__bootstrapPipeline_handler___block_invoke;
  v24[3] = &unk_1E6B955A0;
  v24[4] = self;
  id v21 = v6;
  id v25 = v21;
  uint64_t v28 = v29;
  id v22 = v17;
  id v26 = v22;
  id v23 = v7;
  id v27 = v23;
  [(RTVisitMonitor *)self _batchProcess:v21 fromDate:v8 toDate:v20 handler:v24];

  _Block_object_dispose(v29, 8);
}

void __45__RTVisitMonitor__bootstrapPipeline_handler___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a2;
  uint64_t v9 = [v7 code];
  id v10 = v7;
  __int16 v11 = v10;
  int v12 = v10;
  if (v9 == 2)
  {

    int v12 = 0;
  }
  [*(id *)(a1 + 32) _processRealtimeVisits:v8 pipeline:*(void *)(a1 + 40)];
  uint64_t v13 = [v8 count];

  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += v13;
  if (a3)
  {
    [*(id *)(a1 + 40) setBootStrappingDone:1];
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      double v17 = [MEMORY[0x1E4F1C9C8] date];
      [v17 timeIntervalSinceDate:*(void *)(a1 + 48)];
      int v21 = 138413314;
      double v19 = @"NO";
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      if (v9 == 2) {
        double v19 = @"YES";
      }
      uint64_t v24 = v16;
      __int16 v25 = 2048;
      uint64_t v26 = v18;
      __int16 v27 = 2112;
      uint64_t v28 = v19;
      __int16 v29 = 2112;
      int v30 = v11;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "finished bootstrapping pipeline, %@, visits processed, %lu, latency, %.2f, diminishedMode, %@, error, %@", (uint8_t *)&v21, 0x34u);
    }
    uint64_t v20 = *(void *)(a1 + 56);
    if (v20) {
      (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v12);
    }
  }
}

+ (id)bucketLocations:(id)a3 interval:(double)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = [MEMORY[0x1E4F1CA48] array];
    [v6 addObject:v7];
    id v8 = [v5 firstObject];
    uint64_t v9 = [v8 date];
    id v10 = [v9 dateByAddingTimeInterval:a4];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v24 = v5;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          double v17 = [v16 date];
          uint64_t v18 = [v17 compare:v10];

          if (v18 != -1)
          {
            uint64_t v19 = [MEMORY[0x1E4F1CA48] array];

            [v6 addObject:v19];
            uint64_t v20 = [v16 date];
            uint64_t v21 = [v20 dateByAddingTimeInterval:a4];

            id v7 = (void *)v19;
            id v10 = (void *)v21;
          }
          [v7 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }

    id v22 = v6;
    id v5 = v24;
  }
  else
  {
    id v22 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v22;
}

- (void)_batchProcess:(id)a3 fromDate:(id)a4 toDate:(id)a5 handler:(id)a6
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v10 = (char *)a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, uint64_t, void *))a6;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    id v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v50 = "-[RTVisitMonitor _batchProcess:fromDate:toDate:handler:]";
      __int16 v51 = 1024;
      LODWORD(v52) = 837;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: pipeline (in %s:%d)", buf, 0x12u);
    }

    if (v11)
    {
LABEL_3:
      if (v12) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  __int16 v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v50 = "-[RTVisitMonitor _batchProcess:fromDate:toDate:handler:]";
    __int16 v51 = 1024;
    LODWORD(v52) = 838;
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromDate (in %s:%d)", buf, 0x12u);
  }

  if (v12)
  {
LABEL_4:
    if (v13) {
      goto LABEL_5;
    }
LABEL_19:
    double v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v50 = "-[RTVisitMonitor _batchProcess:fromDate:toDate:handler:]";
      __int16 v51 = 1024;
      LODWORD(v52) = 840;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_21;
  }
LABEL_16:
  id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v50 = "-[RTVisitMonitor _batchProcess:fromDate:toDate:handler:]";
    __int16 v51 = 1024;
    LODWORD(v52) = 839;
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toDate (in %s:%d)", buf, 0x12u);
  }

  if (!v13) {
    goto LABEL_19;
  }
LABEL_5:
  if (!v10)
  {
    long long v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F5CFE8];
    uint64_t v59 = *MEMORY[0x1E4F28568];
    v60[0] = @"requires pipeline";
    long long v27 = (void *)MEMORY[0x1E4F1C9E8];
    long long v28 = (__CFString **)v60;
    __int16 v29 = &v59;
LABEL_24:
    uint64_t v30 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:1];
    uint64_t v31 = [v25 errorWithDomain:v26 code:7 userInfo:v30];
    v13[2](v13, 0, 1, v31);

    goto LABEL_25;
  }
  if (!v11 || !v12)
  {
    long long v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F5CFE8];
    uint64_t v57 = *MEMORY[0x1E4F28568];
    id v58 = @"requires valid dates.";
    long long v27 = (void *)MEMORY[0x1E4F1C9E8];
    long long v28 = &v58;
    __int16 v29 = &v57;
    goto LABEL_24;
  }
  if ([v11 isAfterDate:v12])
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F5CFE8];
    uint64_t v55 = *MEMORY[0x1E4F28568];
    uint64_t v16 = NSString;
    double v17 = [v11 stringFromDate];
    uint64_t v18 = [v12 stringFromDate];
    uint64_t v19 = [v16 stringWithFormat:@"fromDate, %@, postdates toDate, %@", v17, v18];
    double v56 = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    uint64_t v21 = [v14 errorWithDomain:v15 code:7 userInfo:v20];
    v13[2](v13, 0, 1, v21);

LABEL_21:
    goto LABEL_25;
  }
  __int16 v32 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    __int16 v33 = [v11 stringFromDate];
    uint64_t v34 = [v12 stringFromDate];
    *(_DWORD *)buf = 138412802;
    uint64_t v50 = v10;
    __int16 v51 = 2112;
    v52 = v33;
    __int16 v53 = 2112;
    id v54 = v34;
    _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "batch processing pipeline %@ between, %@, to, %@", buf, 0x20u);
  }
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __56__RTVisitMonitor__batchProcess_fromDate_toDate_handler___block_invoke;
  v44[3] = &unk_1E6B955F0;
  v44[4] = self;
  uint64_t v48 = v13;
  id v35 = v11;
  id v45 = v35;
  id v36 = v12;
  id v46 = v36;
  uint64_t v37 = v10;
  int v47 = v37;
  double v38 = (void *)MEMORY[0x1E016DB00](v44);
  double v39 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v35 endDate:v36];
  id v40 = objc_alloc(MEMORY[0x1E4F5CF40]);
  v41 = [v37 hyperParameter];
  [v41 maxHorizontalAccuracy];
  int v42 = [v40 initWithDateInterval:v39 horizontalAccuracy:3600 batchSize:0 boundingBoxLocation:];

  v43 = [(RTVisitMonitor *)self locationManager];
  [v43 fetchStoredLocationsWithOptions:v42 handler:v38];

LABEL_25:
}

void __56__RTVisitMonitor__batchProcess_fromDate_toDate_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[_RTMap alloc] initWithInput:v6];

  id v8 = [(_RTMap *)v7 withBlock:&__block_literal_global_40];

  uint64_t v9 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RTVisitMonitor__batchProcess_fromDate_toDate_handler___block_invoke_3;
  block[3] = &unk_1E6B955C8;
  id v15 = v5;
  id v21 = a1[8];
  id v16 = v8;
  id v17 = a1[5];
  id v18 = a1[6];
  id v10 = a1[7];
  id v11 = a1[4];
  id v19 = v10;
  id v20 = v11;
  id v12 = v8;
  id v13 = v5;
  dispatch_async(v9, block);
}

id __56__RTVisitMonitor__batchProcess_fromDate_toDate_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F5CE00];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithCLLocation:v3];

  return v4;
}

void __56__RTVisitMonitor__batchProcess_fromDate_toDate_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
    v2();
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) firstObject];
    id v4 = [v3 date];

    id v5 = [*(id *)(v1 + 40) lastObject];
    id v6 = [v5 date];

    if (![*(id *)(v1 + 40) count]
      || ([v6 isBeforeDate:*(void *)(v1 + 48)] & 1) != 0
      || [v4 isAfterDate:*(void *)(v1 + 56)])
    {
      id v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [*(id *)(v1 + 48) stringFromDate];
        uint64_t v9 = [*(id *)(v1 + 56) stringFromDate];
        id v10 = [v4 stringFromDate];
        id v11 = [v6 stringFromDate];
        *(_DWORD *)buf = 138413058;
        id v49 = v8;
        __int16 v50 = 2112;
        uint64_t v51 = (uint64_t)v9;
        __int16 v52 = 2112;
        __int16 v53 = v10;
        __int16 v54 = 2112;
        uint64_t v55 = v11;
        _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "no valid locations are fetched between, %@, and, %@, first location date, %@, last location date, %@", buf, 0x2Au);
      }
      (*(void (**)(void))(*(void *)(v1 + 80) + 16))();
    }
    else
    {
      double v38 = v4;
      double v39 = v6;
      id v12 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = *(void **)(v1 + 64);
        uint64_t v14 = [*(id *)(v1 + 40) count];
        id v15 = [*(id *)(v1 + 40) firstObject];
        id v16 = [*(id *)(v1 + 40) lastObject];
        *(_DWORD *)buf = 138413058;
        id v49 = v13;
        __int16 v50 = 2048;
        uint64_t v51 = v14;
        __int16 v52 = 2112;
        __int16 v53 = v15;
        __int16 v54 = 2112;
        uint64_t v55 = v16;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "batch processing pipeline %@ with %lu locations, first, %@, last, %@", buf, 0x2Au);
      }
      id v17 = [MEMORY[0x1E4F1CA48] array];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = [(id)objc_opt_class() bucketLocations:*(void *)(v1 + 40) interval:43200.0];
      uint64_t v18 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v44;
        uint64_t v41 = v1;
        uint64_t v40 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v44 != v20) {
              objc_enumerationMutation(obj);
            }
            id v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            __int16 v23 = (void *)MEMORY[0x1E016D870]();
            id v24 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              long long v25 = v17;
              uint64_t v26 = *(void **)(v1 + 64);
              long long v27 = v23;
              uint64_t v28 = [v22 count];
              __int16 v29 = [v22 firstObject];
              uint64_t v30 = [v22 lastObject];
              *(_DWORD *)buf = 138413058;
              id v49 = v26;
              id v17 = v25;
              __int16 v50 = 2048;
              uint64_t v51 = v28;
              __int16 v23 = v27;
              __int16 v52 = 2112;
              __int16 v53 = v29;
              __int16 v54 = 2112;
              uint64_t v55 = v30;
              _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "batch processing pipeline %@ with %lu bucketed locations, first, %@, last, %@", buf, 0x2Au);

              uint64_t v20 = v40;
              uint64_t v1 = v41;
            }

            uint64_t v31 = [*(id *)(v1 + 64) processLocations:v22];
            [v17 addObjectsFromArray:v31];
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
        }
        while (v19);
      }

      id v6 = v39;
      int v32 = [v39 isOnOrAfter:*(void *)(v1 + 56)];
      __int16 v33 = *(void (**)(void))(*(void *)(v1 + 80) + 16);
      if (v32)
      {
        v33();
      }
      else
      {
        v33();
        uint64_t v35 = *(void *)(v1 + 64);
        uint64_t v34 = *(void **)(v1 + 72);
        id v36 = [v39 dateByAddingTimeInterval:1.0];
        uint64_t v37 = [v36 earlierDate:*(void *)(v1 + 56)];
        [v34 _batchProcess:v35 fromDate:v37 toDate:*(void *)(v1 + 56) handler:*(void *)(v1 + 80)];
      }
      id v4 = v38;
    }
  }
}

- (void)fetchVisitsFromDate:(id)a3 toDate:(id)a4 handler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v26 = "-[RTVisitMonitor fetchVisitsFromDate:toDate:handler:]";
      __int16 v27 = 1024;
      int v28 = 931;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromDate (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v10) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v26 = "-[RTVisitMonitor fetchVisitsFromDate:toDate:handler:]";
    __int16 v27 = 1024;
    int v28 = 932;
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toDate (in %s:%d)", buf, 0x12u);
  }

  if (!v10)
  {
LABEL_11:
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v26 = "-[RTVisitMonitor fetchVisitsFromDate:toDate:handler:]";
      __int16 v27 = 1024;
      int v28 = 933;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_14:
  uint64_t v14 = objc_opt_new();
  id v15 = [(RTVisitMonitor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__RTVisitMonitor_fetchVisitsFromDate_toDate_handler___block_invoke;
  block[3] = &unk_1E6B95640;
  void block[4] = self;
  id v21 = v8;
  id v23 = v14;
  id v24 = v10;
  id v22 = v9;
  id v16 = v14;
  id v17 = v10;
  id v18 = v9;
  id v19 = v8;
  dispatch_async(v15, block);
}

void __53__RTVisitMonitor_fetchVisitsFromDate_toDate_handler___block_invoke(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] platform];
  int v3 = [v2 internalInstall];

  if (v3 && (uint64_t v4 = [a1[4] visitPipelineTypeOverride]) != 0)
  {
    uint64_t v5 = v4;
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(id)objc_opt_class() typeToString:v5];
      *(_DWORD *)buf = 138412546;
      id v21 = @"PlaybackVisitPipelineType";
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@ overridden to %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v5 = 4;
  }
  id v8 = [a1[4] _createPipelineWithType:v5 name:@"com.apple.routined.visit.pipeline.batch-from-date" lastVisit:0];
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v8;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "creating pipeline %@", buf, 0xCu);
  }

  id v10 = a1[4];
  id v11 = a1[5];
  id v12 = a1[6];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__RTVisitMonitor_fetchVisitsFromDate_toDate_handler___block_invoke_132;
  v14[3] = &unk_1E6B95618;
  id v19 = a1[8];
  id v15 = a1[7];
  id v16 = v8;
  id v17 = a1[5];
  id v18 = a1[6];
  id v13 = v8;
  [v10 _batchProcess:v13 fromDate:v11 toDate:v12 handler:v14];
}

uint64_t __53__RTVisitMonitor_fetchVisitsFromDate_toDate_handler___block_invoke_132(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
    return v5();
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) addObjectsFromArray:a2];
    if (a3)
    {
      id v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        id v10 = [*(id *)(a1 + 48) stringFromDate];
        id v11 = [*(id *)(a1 + 56) stringFromDate];
        int v12 = 138412802;
        uint64_t v13 = v9;
        __int16 v14 = 2112;
        id v15 = v10;
        __int16 v16 = 2112;
        id v17 = v11;
        _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "pipeline %@ completes batch processing from %@, to %@", (uint8_t *)&v12, 0x20u);
      }
      return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  return result;
}

- (void)setHighConfidencePipelineReferenceCounter:(unint64_t)a3
{
  unint64_t highConfidencePipelineReferenceCounter = self->_highConfidencePipelineReferenceCounter;
  if (highConfidencePipelineReferenceCounter != a3)
  {
    if (highConfidencePipelineReferenceCounter)
    {
      if (a3)
      {
LABEL_4:
        self->_unint64_t highConfidencePipelineReferenceCounter = a3;
        return;
      }
    }
    else
    {
      [(RTVisitMonitor *)self _setupRealtimePipelineWithType:2 handler:&__block_literal_global_134];
      if (a3) {
        goto LABEL_4;
      }
    }
    [(RTVisitMonitor *)self _stopMonitoringAllRegionsForPipelineType:2];
    [(NSMutableDictionary *)self->_pipelines setObject:0 forKeyedSubscript:&unk_1F3450F00];
    goto LABEL_4;
  }
}

void __60__RTVisitMonitor_setHighConfidencePipelineReferenceCounter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = +[RTVisitPipeline typeToString:2];
    int v5 = 138412546;
    id v6 = v4;
    __int16 v7 = 2112;
    id v8 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "setup complete, pipeline, %@, error, %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_stopMonitoringAllRegionsForPipelineType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  pipelinesMonitoringRegion = self->_pipelinesMonitoringRegion;
  id v6 = [NSNumber numberWithUnsignedInteger:];
  LODWORD(pipelinesMonitoringRegion) = [(NSMutableSet *)pipelinesMonitoringRegion containsObject:v6];

  if (pipelinesMonitoringRegion)
  {
    __int16 v7 = [(RTVisitMonitor *)self locationManager];
    id v8 = [(id)objc_opt_class() regionMonitoringClientIdentifierForPipelineType:a3];
    id v12 = 0;
    [v7 stopMonitoringAllRegionsForClientIdentifier:v8 error:&v12];
    id v9 = v12;

    id v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = +[RTVisitPipeline typeToString:2];
      *(_DWORD *)buf = 138412546;
      __int16 v14 = v11;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "stopMonitoringAllRegionsForClientIdentifier complete, pipeline, %@, error, %@", buf, 0x16u);
    }
  }
}

- (void)setLowConfidencePipelineReferenceCounter:(unint64_t)a3
{
  unint64_t lowConfidencePipelineReferenceCounter = self->_lowConfidencePipelineReferenceCounter;
  if (lowConfidencePipelineReferenceCounter != a3)
  {
    if (lowConfidencePipelineReferenceCounter)
    {
      if (a3)
      {
LABEL_4:
        self->_unint64_t lowConfidencePipelineReferenceCounter = a3;
        return;
      }
    }
    else
    {
      [(RTVisitMonitor *)self _setupRealtimePipelineWithType:1 handler:&__block_literal_global_137];
      if (a3) {
        goto LABEL_4;
      }
    }
    [(NSMutableDictionary *)self->_pipelines setObject:0 forKeyedSubscript:&unk_1F3450F18];
    goto LABEL_4;
  }
}

void __59__RTVisitMonitor_setLowConfidencePipelineReferenceCounter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = +[RTVisitPipeline typeToString:1];
    int v5 = 138412546;
    id v6 = v4;
    __int16 v7 = 2112;
    id v8 = v2;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "setup complete, pipeline, %@, error, %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)setMonitoringVisitIncidents:(BOOL)a3
{
  if (self->_monitoringVisitIncidents != a3)
  {
    BOOL v3 = a3;
    self->_monitoringVisitIncidents = a3;
    int v5 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "start monitoring visit incidents", buf, 2u);
      }

      [(RTVisitMonitor *)self _registerVisitMonitorForRegionEventsForPipelineType:2];
      [(RTVisitMonitor *)self setHighConfidencePipelineReferenceCounter:[(RTVisitMonitor *)self highConfidencePipelineReferenceCounter] + 1];
      [(RTVisitMonitor *)self setFeedBufferReferenceCounter:[(RTVisitMonitor *)self feedBufferReferenceCounter] + 1];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)__int16 v7 = 0;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "stop monitoring visit incidents", v7, 2u);
      }

      [(RTVisitMonitor *)self setFeedBufferReferenceCounter:[(RTVisitMonitor *)self feedBufferReferenceCounter] - 1];
      [(RTVisitMonitor *)self setHighConfidencePipelineReferenceCounter:[(RTVisitMonitor *)self highConfidencePipelineReferenceCounter] - 1];
      [(RTVisitMonitor *)self _unregisterVisitMonitorForRegionEventsForPipelineType:2];
    }
  }
}

- (void)setMonitoringLeechedVisitIncidents:(BOOL)a3
{
  if (self->_monitoringLeechedVisitIncidents != a3)
  {
    BOOL v3 = a3;
    self->_monitoringLeechedVisitIncidents = a3;
    int v5 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "start monitoring leeched visit incidents", buf, 2u);
      }

      [(RTVisitMonitor *)self setHighConfidencePipelineReferenceCounter:[(RTVisitMonitor *)self highConfidencePipelineReferenceCounter] + 1];
      [(RTVisitMonitor *)self setFeedBufferReferenceCounter:[(RTVisitMonitor *)self feedBufferReferenceCounter] + 1];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)__int16 v7 = 0;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "stop monitoring leeched visit incidents", v7, 2u);
      }

      [(RTVisitMonitor *)self setFeedBufferReferenceCounter:[(RTVisitMonitor *)self feedBufferReferenceCounter] - 1];
      [(RTVisitMonitor *)self setHighConfidencePipelineReferenceCounter:[(RTVisitMonitor *)self highConfidencePipelineReferenceCounter] - 1];
    }
  }
}

- (void)setMonitoringLowConfidenceVisitIncidents:(BOOL)a3
{
  if (self->_monitoringLowConfidenceVisitIncidents != a3)
  {
    BOOL v3 = a3;
    self->_monitoringLowConfidenceVisitIncidents = a3;
    int v5 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "start monitoring low-confidence visit incidents.", buf, 2u);
      }

      [(RTVisitMonitor *)self setLowConfidencePipelineReferenceCounter:[(RTVisitMonitor *)self lowConfidencePipelineReferenceCounter] + 1];
      [(RTVisitMonitor *)self setFeedBufferReferenceCounter:[(RTVisitMonitor *)self feedBufferReferenceCounter] + 1];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)__int16 v7 = 0;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "stop monitoring low-confidence visit incidents.", v7, 2u);
      }

      [(RTVisitMonitor *)self setFeedBufferReferenceCounter:[(RTVisitMonitor *)self feedBufferReferenceCounter] - 1];
      [(RTVisitMonitor *)self setLowConfidencePipelineReferenceCounter:[(RTVisitMonitor *)self lowConfidencePipelineReferenceCounter] - 1];
    }
  }
}

- (void)startMonitoringVisitIncidents
{
  BOOL v3 = [(RTVisitMonitor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RTVisitMonitor_startMonitoringVisitIncidents__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __47__RTVisitMonitor_startMonitoringVisitIncidents__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMonitoringVisitIncidents:1];
}

- (void)stopMonitoringVisitIncidents
{
  BOOL v3 = [(RTVisitMonitor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__RTVisitMonitor_stopMonitoringVisitIncidents__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __46__RTVisitMonitor_stopMonitoringVisitIncidents__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMonitoringVisitIncidents:0];
}

- (void)startMonitoringLeechedVisitIncidents
{
  BOOL v3 = [(RTVisitMonitor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__RTVisitMonitor_startMonitoringLeechedVisitIncidents__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __54__RTVisitMonitor_startMonitoringLeechedVisitIncidents__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMonitoringLeechedVisitIncidents:1];
}

- (void)stopMonitoringLeechedVisitIncidents
{
  BOOL v3 = [(RTVisitMonitor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__RTVisitMonitor_stopMonitoringLeechedVisitIncidents__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __53__RTVisitMonitor_stopMonitoringLeechedVisitIncidents__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMonitoringLeechedVisitIncidents:0];
}

- (void)startMonitoringLowConfidenceVisitIncidents
{
  BOOL v3 = [(RTVisitMonitor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__RTVisitMonitor_startMonitoringLowConfidenceVisitIncidents__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __60__RTVisitMonitor_startMonitoringLowConfidenceVisitIncidents__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMonitoringLowConfidenceVisitIncidents:1];
}

- (void)stopMonitoringLowConfidenceVisitIncidents
{
  BOOL v3 = [(RTVisitMonitor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__RTVisitMonitor_stopMonitoringLowConfidenceVisitIncidents__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __59__RTVisitMonitor_stopMonitoringLowConfidenceVisitIncidents__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMonitoringLowConfidenceVisitIncidents:0];
}

- (void)_startFeedBuffer
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "starting feed buffer", buf, 2u);
  }

  uint64_t v4 = [[RTVisitFeedBuffer alloc] initWithMinWaitInterval:15.0];
  feedBuffer = self->_feedBuffer;
  self->_feedBuffer = v4;

  BOOL v6 = [(RTVisitMonitor *)self state];
  [v6 dump];

  __int16 v7 = [(RTVisitMonitor *)self locationManager];
  id v8 = +[RTNotification notificationName];
  [v7 addObserver:self selector:sel_onLeechedLocationsNotification_ name:v8];

  uint64_t v9 = [(RTVisitMonitor *)self locationAwarenessManager];
  [(id)objc_opt_class() LocationHeartbeatWhileAwake];
  id v14 = 0;
  [v9 addLocationHeartbeatRequester:self interval:&v14 error:nil];
  id v10 = v14;

  if (v10)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v10 code];
      uint64_t v13 = [v10 localizedDescription];
      *(_DWORD *)buf = 134218754;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      __int16 v19 = 2080;
      uint64_t v20 = "-[RTVisitMonitor _startFeedBuffer]";
      __int16 v21 = 1024;
      int v22 = 1150;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Request location heartbeat error, code, %ld, description, %@ (in %s:%d)", buf, 0x26u);
    }
  }
}

- (void)_stopFeedBuffer
{
  BOOL v3 = [(RTVisitMonitor *)self locationManager];
  uint64_t v4 = +[RTNotification notificationName];
  [v3 removeObserver:self fromNotification:v4];

  int v5 = [(RTVisitMonitor *)self locationAwarenessManager];
  [v5 removeLocationHeartbeatRequester:self];

  [(RTTimer *)self->_feedBufferTimer invalidate];
  feedBufferTimer = self->_feedBufferTimer;
  self->_feedBufferTimer = 0;

  feedBuffer = self->_feedBuffer;
  self->_feedBuffer = 0;
}

+ (id)regionWithRegionIdentifier:(id)a3 location:(id)a4 shouldNotifyForEntry:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v5)
  {
    [v8 horizontalUncertainty];
    if (v10 < 5.0) {
      double v10 = 5.0;
    }
    double v11 = fmin(v10, 100.0);
  }
  else
  {
    double v11 = 500.0;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  [v9 latitude];
  CLLocationDegrees v14 = v13;
  [v9 longitude];
  CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(v14, v15);
  __int16 v17 = [v12 initForLowPowerWithCenter:v7 radius:v16.latitude identifier:v11];
  [v17 setNotifyOnEntry:v5];
  [v17 setNotifyOnExit:v5 ^ 1];

  return v17;
}

- (void)setupGeoFencesForVisit:(id)a3 pipelineType:(unint64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [(RTVisitMonitor *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__RTVisitMonitor_setupGeoFencesForVisit_pipelineType_handler___block_invoke;
  v13[3] = &unk_1E6B90C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __62__RTVisitMonitor_setupGeoFencesForVisit_pipelineType_handler___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[7];
  id v6 = 0;
  [v2 _setupGeoFencesForVisit:v3 pipelineType:v4 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(a1[6] + 16))();
}

- (BOOL)_setupGeoFencesForVisit:(id)a3 pipelineType:(unint64_t)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    double v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v35 = "-[RTVisitMonitor _setupGeoFencesForVisit:pipelineType:error:]";
      __int16 v36 = 1024;
      LODWORD(v37) = 1273;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit (in %s:%d)", buf, 0x12u);
    }
  }
  pipelinesMonitoringRegion = self->_pipelinesMonitoringRegion;
  id v12 = [NSNumber numberWithUnsignedInteger:a4];
  LODWORD(pipelinesMonitoringRegion) = [(NSMutableSet *)pipelinesMonitoringRegion containsObject:v12];

  if (pipelinesMonitoringRegion)
  {
    double v13 = [(id)objc_opt_class() regionMonitoringClientIdentifierForPipelineType:a4];
    id v14 = [(RTVisitMonitor *)self locationManager];
    id v33 = 0;
    [v14 stopMonitoringAllRegionsForClientIdentifier:v13 error:&v33];
    id v15 = v33;

    if (v15)
    {
      if (a5)
      {
        id v15 = v15;
        BOOL v16 = 0;
        *a5 = v15;
      }
      else
      {
        BOOL v16 = 0;
      }
      goto LABEL_24;
    }
    if ([v9 type] == 1)
    {
      __int16 v17 = objc_opt_class();
      uint64_t v18 = [v9 location];
      __int16 v19 = [v17 regionWithRegionIdentifier:@"ExitForCurrentVisit" location:v18 shouldNotifyForEntry:0];

      uint64_t v20 = [(RTVisitMonitor *)self locationManager];
      id v32 = 0;
      [v20 startMonitoringForRegion:v19 clientIdentifier:v13 error:&v32];
      id v15 = v32;

      __int16 v21 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        int v22 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        uint64_t v35 = v22;
        __int16 v36 = 2112;
        uint64_t v37 = v13;
        __int16 v38 = 2112;
        double v39 = v19;
        __int16 v40 = 2112;
        id v41 = v15;
        _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "%@, clientIdentifier, %@, start monitoring for region, %@, error, %@", buf, 0x2Au);
      }
      if (!a5) {
        goto LABEL_23;
      }
    }
    else
    {
      if ([v9 type] == 3)
      {
        deviceLocationPredictor = self->_deviceLocationPredictor;
        uint64_t v24 = [v9 location];
        long long v25 = [v9 exit];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke;
        v28[3] = &unk_1E6B95690;
        v28[4] = self;
        id v29 = v13;
        SEL v31 = a2;
        id v30 = v9;
        [(RTDeviceLocationPredictor *)deviceLocationPredictor fetchNextPredictedLocationsOfInterestFromLocation:v24 startDate:v25 timeInterval:v28 handler:7200.0];
      }
      else
      {
        uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v35 = (const char *)v9;
          _os_log_debug_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_DEBUG, "Invalid type received on visit, %@", buf, 0xCu);
        }
      }
      id v15 = 0;
      if (!a5) {
        goto LABEL_23;
      }
    }
    *a5 = v15;
LABEL_23:
    BOOL v16 = v15 == 0;
LABEL_24:

    goto LABEL_25;
  }
  BOOL v16 = 0;
LABEL_25:

  return v16;
}

void __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke_2;
  block[3] = &unk_1E6B90F80;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v5;
  id v13 = v6;
  long long v9 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v9;
  long long v14 = v9;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke_2(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v39 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v8 = objc_opt_class();
        long long v9 = [NSString stringWithFormat:@"%@-%ld", @"EntryForNextPredictedLocationOfInterest", v4 + i + 1];
        double v10 = [v7 locationOfInterest];
        id v11 = [v10 location];
        uint64_t v12 = [v8 regionWithRegionIdentifier:v9 location:v11 shouldNotifyForEntry:1];

        id v13 = [*(id *)(a1 + 40) locationManager];
        uint64_t v14 = *(void *)(a1 + 48);
        id v37 = 0;
        [v13 startMonitoringForRegion:v12 clientIdentifier:v14 error:&v37];
        id v15 = v37;

        BOOL v16 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          __int16 v17 = NSStringFromSelector(*(SEL *)(a1 + 64));
          uint64_t v18 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138413058;
          long long v43 = v17;
          __int16 v44 = 2112;
          uint64_t v45 = v18;
          __int16 v46 = 2112;
          int v47 = v12;
          __int16 v48 = 2112;
          id v49 = v15;
          _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, clientIdentifier, %@, start monitoring for region, %@, error, %@", buf, 0x2Au);
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
      v4 += i;
    }
    while (v3);
  }

  __int16 v19 = [*(id *)(a1 + 32) valueForKeyPath:@"locationOfInterest"];
  uint64_t v20 = [v19 valueForKeyPath:@"identifier"];
  __int16 v21 = [*(id *)(a1 + 56) placeInference];
  uint64_t v22 = [v21 loiIdentifier];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [*(id *)(a1 + 56) placeInference];
    long long v25 = [v24 loiIdentifier];
    char v26 = [v20 containsObject:v25];

    if ((v26 & 1) == 0)
    {
      __int16 v27 = *(void **)(*(void *)(a1 + 40) + 72);
      int v28 = [*(id *)(a1 + 56) placeInference];
      id v29 = [v28 loiIdentifier];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke_156;
      v34[3] = &unk_1E6B95668;
      id v30 = *(void **)(a1 + 48);
      v34[4] = *(void *)(a1 + 40);
      id v31 = v30;
      uint64_t v32 = *(void *)(a1 + 64);
      id v35 = v31;
      uint64_t v36 = v32;
      [v27 fetchLocationOfInterestWithIdentifier:v29 handler:v34];
    }
  }
  else
  {
  }
}

void __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke_156(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke_2_157;
    v7[3] = &unk_1E6B917F0;
    v7[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    id v9 = v5;
    uint64_t v10 = v6;
    dispatch_async(v4, v7);
  }
}

void __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke_2_157(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_class();
  id v3 = [*(id *)(a1 + 40) location];
  uint64_t v4 = [v3 location];
  id v5 = [v2 regionWithRegionIdentifier:@"EntryForLastVisitExit" location:v4 shouldNotifyForEntry:1];

  uint64_t v6 = [*(id *)(a1 + 32) locationManager];
  uint64_t v7 = *(void *)(a1 + 48);
  id v12 = 0;
  [v6 startMonitoringForRegion:v5 clientIdentifier:v7 error:&v12];
  id v8 = v12;

  id v9 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v11 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, clientIdentifier, %@, start monitoring for region, %@, error, %@", buf, 0x2Au);
  }
}

void __41__RTVisitMonitor__processMatureLocations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([v5 bootStrappingDone])
  {
    uint64_t v4 = [v5 processLocations:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) _processRealtimeVisits:v4 pipeline:v5];
  }
}

- (id)_updateSourceForVisit:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5CFC8]);
    id v5 = [v3 date];
    uint64_t v6 = [v3 type];
    uint64_t v7 = [v3 location];
    id v8 = [v3 entry];
    id v9 = [v3 exit];
    uint64_t v10 = [v3 dataPointCount];
    [v3 confidence];
    double v12 = v11;
    id v13 = [v3 placeInference];
    uint64_t v14 = (void *)[v4 initWithDate:v5 type:v6 location:v7 entry:v8 exit:v9 dataPointCount:v10 confidence:v12 placeInference:v13 source:1];
  }
  else
  {
    __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
    }

    uint64_t v14 = 0;
  }

  return v14;
}

- (void)_processRealtimeVisits:(id)a3 pipeline:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if ([v7 count])
    {
      id v9 = [[_RTMap alloc] initWithInput:v7];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __50__RTVisitMonitor__processRealtimeVisits_pipeline___block_invoke;
      v57[3] = &unk_1E6B956E0;
      v57[4] = self;
      uint64_t v10 = [(_RTMap *)v9 withBlock:v57];

      if ([v8 type] == 2)
      {
        uint64_t v42 = a2;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id obj = v10;
        uint64_t v11 = [obj countByEnumeratingWithState:&v53 objects:v67 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          long long v40 = v10;
          id v41 = v7;
          long long v43 = v8;
          uint64_t v13 = 0;
          uint64_t v14 = *(void *)v54;
          while (1)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v54 != v14) {
                objc_enumerationMutation(obj);
              }
              uint64_t v16 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              __int16 v17 = [(RTVisitMonitor *)self visitLabeler];
              uint64_t v18 = [MEMORY[0x1E4F28B50] _coreroutineBundle];
              __int16 v19 = [v18 bundleIdentifier];
              id v52 = 0;
              [v17 labelVisit:v16 clientIdentifier:v19 error:&v52];
              id v20 = v52;

              [(RTVisitMonitor *)self handleVisitIncident:v16];
              if ([v16 type] == 1)
              {
                uint64_t v21 = [(RTVisitMonitor *)self locationAwarenessManager];
                uint64_t v51 = 0;
                [v21 addHighAccuracyLocationRequester:self error:&v51];
              }
              else
              {
                if ([v16 type] != 3) {
                  goto LABEL_14;
                }
                uint64_t v21 = [(RTVisitMonitor *)self locationAwarenessManager];
                uint64_t v50 = 0;
                [v21 removeHighAccuracyLocationRequester:self error:&v50];
              }

LABEL_14:
              uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                uint64_t v23 = [v43 name];
                *(_DWORD *)buf = 138412802;
                uint64_t v59 = v23;
                __int16 v60 = 2048;
                uint64_t v61 = v13 + i + 1;
                __int16 v62 = 2112;
                id v63 = v16;
                _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "pipeline, %@, visit %lu, %@", buf, 0x20u);
              }
            }
            uint64_t v12 = [obj countByEnumeratingWithState:&v53 objects:v67 count:16];
            v13 += i;
            if (!v12) {
              goto LABEL_32;
            }
          }
        }
      }
      else if ([v8 type] == 1)
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id obj = v10;
        uint64_t v25 = [obj countByEnumeratingWithState:&v46 objects:v66 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          long long v40 = v10;
          id v41 = v7;
          uint64_t v42 = a2;
          long long v43 = v8;
          uint64_t v27 = 0;
          uint64_t v28 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v47 != v28) {
                objc_enumerationMutation(obj);
              }
              id v30 = *(void **)(*((void *)&v46 + 1) + 8 * j);
              [(RTVisitMonitor *)self handleLowConfidenceVisitIncident:v30];
              id v31 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                uint64_t v32 = [v43 name];
                *(_DWORD *)buf = 138412802;
                uint64_t v59 = v32;
                __int16 v60 = 2048;
                uint64_t v61 = v27 + j + 1;
                __int16 v62 = 2112;
                id v63 = v30;
                _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, "pipeline, %@, visit %lu, %@", buf, 0x20u);
              }
            }
            uint64_t v26 = [obj countByEnumeratingWithState:&v46 objects:v66 count:16];
            v27 += j;
          }
          while (v26);
LABEL_32:
          id v7 = v41;
          a2 = v42;
          id v8 = v43;
          uint64_t v10 = v40;
        }
      }
      else
      {
        id obj = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
        {
          id v33 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          uint64_t v59 = v33;
          __int16 v60 = 2112;
          uint64_t v61 = (uint64_t)v8;
          _os_log_fault_impl(&dword_1D9BFA000, obj, OS_LOG_TYPE_FAULT, "%@, pipline does not support realtime visits, %@", buf, 0x16u);
        }
      }

      uint64_t v34 = [v10 lastObject];

      if (v34)
      {
        id v35 = v10;
        uint64_t v36 = [v10 lastObject];
        id v45 = 0;
        -[RTVisitMonitor _setupGeoFencesForVisit:pipelineType:error:](self, "_setupGeoFencesForVisit:pipelineType:error:", v36, [v8 type], &v45);
        id v37 = v45;
        long long v38 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          long long v39 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413058;
          uint64_t v59 = v39;
          __int16 v60 = 2112;
          uint64_t v61 = (uint64_t)v36;
          __int16 v62 = 2112;
          id v63 = v8;
          __int16 v64 = 2112;
          id v65 = v37;
          _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, setupGeoFences for visit, %@, pipeline, %@, error %@", buf, 0x2Au);
        }
        uint64_t v10 = v35;
      }
    }
  }
  else
  {
    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: pipeline", buf, 2u);
    }
  }
}

uint64_t __50__RTVisitMonitor__processRealtimeVisits_pipeline___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateSourceForVisit:a2];
}

- (void)fetchVisitMonitorStatusWithHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[RTVisitMonitor fetchVisitMonitorStatusWithHandler:]";
      __int16 v12 = 1024;
      int v13 = 1496;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  uint64_t v6 = [(RTVisitMonitor *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__RTVisitMonitor_fetchVisitMonitorStatusWithHandler___block_invoke;
  v8[3] = &unk_1E6B90D08;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __53__RTVisitMonitor_fetchVisitMonitorStatusWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [[RTVisitMonitorStatus alloc] initWithMonitoringVisitIncidents:[*(id *)(a1 + 32) monitoringVisitIncidents] monitoringLeechedVisitIncidents:[*(id *)(a1 + 32) monitoringLeechedVisitIncidents] monitoringLowConfidenceVisitIncidents:[*(id *)(a1 + 32) monitoringLowConfidenceVisitIncidents] feedBufferReferenceCounter:[*(id *)(a1 + 32) feedBufferReferenceCounter]];
  (*(void (**)(uint64_t, RTVisitMonitorStatus *))(v1 + 16))(v1, v2);
}

- (void)fetchVisitMonitorState:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[RTVisitMonitor fetchVisitMonitorState:]";
      __int16 v12 = 1024;
      int v13 = 1507;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  uint64_t v6 = [(RTVisitMonitor *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__RTVisitMonitor_fetchVisitMonitorState___block_invoke;
  v8[3] = &unk_1E6B90D08;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __41__RTVisitMonitor_fetchVisitMonitorState___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) state];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)showVisitReentryDetectionUI
{
  id v3 = [(RTVisitMonitor *)self platform];
  int v4 = [v3 internalInstall];

  if (v4)
  {
    id v5 = [(RTVisitMonitor *)self platform];
    int v6 = [v5 iPhoneDevice];

    if (v6)
    {
      id v7 = [(RTVisitMonitor *)self defaultsManager];
      id v8 = [v7 objectForKey:@"VisitReentryDetection"];
      int v9 = [v8 BOOLValue];

      if (v9)
      {
        CFDictionaryRef dictionary = (CFDictionaryRef)objc_opt_new();
        [(__CFDictionary *)dictionary setObject:@"Detected Reentry to Home LOI" forKeyedSubscript:*MEMORY[0x1E4F1D990]];
        [(__CFDictionary *)dictionary setObject:@"Please file a radar if you did not intend to exit and re-enter home" forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];
        [(__CFDictionary *)dictionary setObject:@"Tap-to-Radar" forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];
        [(__CFDictionary *)dictionary setObject:@"Dismiss" forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
        CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        uint64_t v11 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, 0, dictionary);
        if (v11)
        {
          __int16 v12 = v11;
          CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(v10, v11, (CFUserNotificationCallBack)_engineeringUIResponseHandler, 0);
          if (RunLoopSource)
          {
            uint64_t v14 = RunLoopSource;
            Main = CFRunLoopGetMain();
            CFRunLoopAddSource(Main, v14, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
            __int16 v12 = v14;
          }
          CFRelease(v12);
        }
      }
    }
  }
}

- (void)_compareVisit:(id)a3 previousVisit:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = v8;
  if (v7 && v8)
  {
    CFAllocatorRef v10 = [v7 exit];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v7 entry];
    }
    int v13 = v12;

    uint64_t v14 = [v9 exit];
    __int16 v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [v9 entry];
    }
    __int16 v17 = v16;

    [v13 timeIntervalSinceDate:v17];
    double v19 = v18;
    id v20 = [v9 exit];
    uint64_t v21 = v20;
    if (!v20)
    {
      uint64_t v21 = [v9 date];
    }
    uint64_t v22 = [v9 entry];
    if (v22)
    {
      [v21 timeIntervalSinceDate:v22];
      double v24 = v23;
    }
    else
    {
      uint64_t v25 = [v9 date];
      [v21 timeIntervalSinceDate:v25];
      double v24 = v26;
    }
    if (!v20) {

    }
    uint64_t v27 = [(RTVisitMonitor *)self distanceCalculator];
    uint64_t v28 = [v7 location];
    id v29 = [v9 location];
    id v63 = 0;
    [v27 distanceFromLocation:v28 toLocation:v29 error:&v63];
    double v31 = v30;
    id v62 = v63;

    uint64_t v32 = [v7 placeInference];
    id v33 = [v32 loiIdentifier];
    uint64_t v34 = [v9 placeInference];
    id v35 = [v34 loiIdentifier];
    int v61 = [v33 isEqual:v35];

    uint64_t v36 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      id v37 = (objc_class *)objc_opt_class();
      long long v38 = NSStringFromClass(v37);
      long long v39 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v65 = v38;
      __int16 v66 = 2112;
      uint64_t v67 = (uint64_t)v39;
      __int16 v68 = 2112;
      double v69 = *(double *)&v7;
      _os_log_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_INFO, "%@, %@, visit, %@", buf, 0x20u);
    }
    long long v40 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      id v41 = (objc_class *)objc_opt_class();
      uint64_t v42 = NSStringFromClass(v41);
      long long v43 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v65 = v42;
      __int16 v66 = 2112;
      uint64_t v67 = (uint64_t)v43;
      __int16 v68 = 2112;
      double v69 = *(double *)&v9;
      _os_log_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_INFO, "%@, %@, previous visit, %@", buf, 0x20u);
    }
    __int16 v44 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      id v45 = (objc_class *)objc_opt_class();
      long long v46 = NSStringFromClass(v45);
      uint64_t v47 = NSStringFromSelector(a2);
      long long v48 = (void *)v47;
      long long v49 = @"NO";
      *(_DWORD *)buf = 138413570;
      id v65 = v46;
      __int16 v66 = 2112;
      if (v61) {
        long long v49 = @"YES";
      }
      uint64_t v67 = v47;
      __int16 v68 = 2048;
      double v69 = v24;
      __int16 v70 = 2048;
      double v71 = v19;
      __int16 v72 = 2048;
      double v73 = v31;
      __int16 v74 = 2112;
      v75 = v49;
      _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_INFO, "%@, %@, durationOfPreviousVisit, %.2f, intervalSincePreviousVisit, %.2f, distanceFromPreviousVisit, %.2f, visits to same LOI, %@", buf, 0x3Eu);
    }
    [v7 confidence];
    double v50 = *MEMORY[0x1E4F5D010];
    if (v51 != *MEMORY[0x1E4F5D010] || [v7 type] != 1) {
      goto LABEL_43;
    }
    id v52 = [v7 placeInference];
    if ([v52 userType] == 1)
    {
      [v9 confidence];
      if (v53 == v50 && [v9 type] == 3)
      {
        long long v54 = [v7 placeInference];
        if ([v54 userType] == 1)
        {
          long long v55 = [v9 placeInference];
          if ([v55 userType] == 1)
          {
            if (v24 > 1800.0) {
              int v56 = v61;
            }
            else {
              int v56 = 0;
            }

            if (v56 == 1 && v19 < 240.0 && v31 < 300.0)
            {
              uint64_t v57 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
              if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
              {
                id v58 = (objc_class *)objc_opt_class();
                uint64_t v59 = NSStringFromClass(v58);
                __int16 v60 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412546;
                id v65 = v59;
                __int16 v66 = 2112;
                uint64_t v67 = (uint64_t)v60;
                _os_log_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_INFO, "%@, %@, observed exit and re-entry to home", buf, 0x16u);
              }
              [(RTVisitMonitor *)self showVisitReentryDetectionUI];
            }
            goto LABEL_43;
          }
        }
      }
    }

LABEL_43:
  }
}

- (void)compareVisit:(id)a3 previousVisit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTVisitMonitor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__RTVisitMonitor_compareVisit_previousVisit___block_invoke;
  block[3] = &unk_1E6B92F80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __45__RTVisitMonitor_compareVisit_previousVisit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _compareVisit:*(void *)(a1 + 40) previousVisit:*(void *)(a1 + 48)];
}

- (void)handleVisitIncident:(id)a3
{
  id v8 = a3;
  int v4 = [(RTVisitMonitor *)self state];
  id v5 = [v4 lastVisitIncident];

  id v6 = [(RTVisitMonitor *)self state];
  [v6 setLastVisitIncident:v8];

  if ([(RTVisitMonitor *)self monitoringVisitIncidents]
    || [(RTVisitMonitor *)self monitoringLeechedVisitIncidents])
  {
    id v7 = [(RTVisitMonitor *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 onVisitIncident:v8 error:0];
    }
    [(RTVisitMonitor *)self _compareVisit:v8 previousVisit:v5];
  }
}

- (void)handleLowConfidenceVisitIncident:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "low confidence visit, %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(RTVisitMonitor *)self state];
  [v6 setLastLowConfidenceVisitIncident:v4];

  if ([(RTVisitMonitor *)self monitoringLowConfidenceVisitIncidents])
  {
    id v7 = [(RTVisitMonitor *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 onLowConfidenceVisitIncident:v4 error:0];
    }
  }
}

- (RTVisitMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RTVisitMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (void)setDeviceLocationPredictor:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTHintManager)hintManager
{
  return self->_hintManager;
}

- (void)setHintManager:(id)a3
{
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
}

- (RTLocationAwarenessManager)locationAwarenessManager
{
  return self->_locationAwarenessManager;
}

- (void)setLocationAwarenessManager:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (RTVisitLabeler)visitLabeler
{
  return self->_visitLabeler;
}

- (void)setVisitLabeler:(id)a3
{
}

- (RTVisitMonitorState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)feedBufferReferenceCounter
{
  return self->_feedBufferReferenceCounter;
}

- (unint64_t)lowConfidencePipelineReferenceCounter
{
  return self->_lowConfidencePipelineReferenceCounter;
}

- (unint64_t)highConfidencePipelineReferenceCounter
{
  return self->_highConfidencePipelineReferenceCounter;
}

- (NSMutableSet)pipelinesMonitoringRegion
{
  return self->_pipelinesMonitoringRegion;
}

- (void)setPipelinesMonitoringRegion:(id)a3
{
}

- (NSMutableDictionary)pipelines
{
  return self->_pipelines;
}

- (void)setPipelines:(id)a3
{
}

- (BOOL)monitoringVisitIncidents
{
  return self->_monitoringVisitIncidents;
}

- (BOOL)monitoringLeechedVisitIncidents
{
  return self->_monitoringLeechedVisitIncidents;
}

- (BOOL)monitoringLowConfidenceVisitIncidents
{
  return self->_monitoringLowConfidenceVisitIncidents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelines, 0);
  objc_storeStrong((id *)&self->_pipelinesMonitoringRegion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_visitLabeler, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_locationAwarenessManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_hintManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedBufferTimer, 0);

  objc_storeStrong((id *)&self->_feedBuffer, 0);
}

@end