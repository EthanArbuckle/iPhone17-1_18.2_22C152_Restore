@interface SMTriggerDestination
+ (BOOL)validLocation:(id)a3;
+ (double)crowFliesExpectedTravelTimeForTransportType:(unint64_t)a3 defaultsManager:(id)a4 distance:(double)a5;
+ (double)distanceFromLocation:(id)a3 toLocation:(id)a4 withCalculator:(id)a5;
+ (double)roundingUpTimeInterval:(double)a3 bucketDurationMinute:(int)a4;
+ (id)convertSMDirectionTransportTypeToString:(unint64_t)a3;
+ (id)getSMTriggerDestinationTransportTypeToAvgSpeed;
+ (id)locationRequestOptions;
+ (id)statusToString:(unint64_t)a3;
+ (id)upperBoundEtaForDepartureDate:(id)a3 defaultsManager:(id)a4 mapsExpectedTravelTime:(double)a5 crowFliesExpectedTravelTime:(double)a6 etaScaleFactor:(double)a7;
+ (unint64_t)convertSMDirectionTransportTypeToMKDirectionTransportType:(unint64_t)a3;
+ (void)calculateDistanceToDestination:(id)a3 locationManager:(id)a4 distanceCalculator:(id)a5 queue:(id)a6 handler:(id)a7;
+ (void)checkEligibilityOfDestination:(id)a3 locationManager:(id)a4 distanceCalculator:(id)a5 queue:(id)a6 completionHandler:(id)a7;
+ (void)currentLocationWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5;
+ (void)estimateEtaToDestination:(id)a3 transportType:(unint64_t)a4 locationManager:(id)a5 defaultsManager:(id)a6 distanceCalculator:(id)a7 queue:(id)a8 handler:(id)a9;
+ (void)expectedTravelTimeforTransportType:(unint64_t)a3 source:(id)a4 defaultsManager:(id)a5 destination:(id)a6 departureDate:(id)a7 distanceCalculator:(id)a8 queue:(id)a9 completionHandler:(id)a10;
+ (void)mapsExpectedTravelTimeforTransportType:(unint64_t)a3 source:(id)a4 destination:(id)a5 departureDate:(id)a6 queue:(id)a7 handler:(id)a8;
+ (void)updateSMTriggerDestinationTransportTypeToAvgSpeedWithDefaultsManager:(id)a3;
- (BOOL)_isExceedingUpperBoundEta:(id)a3 mapsExpectedTravelTime:(double)a4 crowFliesExpectedTravelTime:(double)a5;
- (BOOL)_isNoProgressStatus;
- (BOOL)_shouldChangeModeOfTransportStartDate:(id)a3 endDate:(id)a4;
- (BOOL)_shouldUpdateCoarseEta:(id)a3;
- (BOOL)_shouldUpdateUpperBoundEtaWithRemainingDistance:(double)a3 mapsExpectedTravelTime:(double)a4;
- (CLLocation)originLocation;
- (NSDate)coarseEta;
- (NSMutableArray)cachedLocationEvents;
- (NSMutableDictionary)timerIdentifierToTimers;
- (OS_dispatch_queue)queue;
- (RTDataProtectionManager)dataProtectionManager;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTLocationManager)locationManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTPlatform)platform;
- (RTTimerManager)timerManager;
- (SMSessionConfiguration)sessionConfiguration;
- (SMSessionMetricManager)sessionMetricManager;
- (SMSessionStore)sessionStore;
- (SMTriggerDestination)initWithQueue:(id)a3 defaultsManager:(id)a4 dataProtectionManager:(id)a5 locationManager:(id)a6 motionActivityManager:(id)a7 distanceCalculator:(id)a8 platform:(id)a9 sessionStore:(id)a10 timerManager:(id)a11 sessionMetricManager:(id)a12;
- (SMTriggerDestinationState)triggerState;
- (SMTriggerManagerProtocol)sessionMonitorDelegate;
- (double)destinationStatusUpdateTimeInterval;
- (double)etaScaleFactor;
- (double)idleMaxDistanceThreshold;
- (double)idleTimeoutThreshold;
- (double)minDistanceUpdateThreshold;
- (double)noProgressTimeoutThreshold;
- (double)significantMoveThreshold;
- (id)_cachedLocationsDateInterval;
- (id)_locationAtDate:(id)a3 error:(id *)a4;
- (id)_locationsInDateInterval:(id)a3 horizontalAccuracy:(double)a4 error:(id *)a5;
- (id)lastUserResponseSafeDate;
- (unint64_t)_motionActivityTypeToTransportType:(unint64_t)a3 distance:(double)a4;
- (unint64_t)_predominantMotionActicityTypeFromStartDate:(id)a3 toEndDate:(id)a4 outError:(id *)a5;
- (unint64_t)triggerCategory;
- (void)_addObservers;
- (void)_bootstrap;
- (void)_cacheLocations:(id)a3;
- (void)_declareAnomalyForTriggerCategory:(unint64_t)a3;
- (void)_evaluateStatusUsingCurrentLocation:(id)a3;
- (void)_initializeETATimer;
- (void)_initializeTimerWithIdentifier:(id)a3 fireAfterDelay:(double)a4;
- (void)_modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4;
- (void)_onTimerExpiryForTimerIdentifier:(id)a3;
- (void)_onUserTriggerResponse:(int64_t)a3;
- (void)_persistState;
- (void)_postStateChange;
- (void)_processDataProtectionNotification:(id)a3;
- (void)_processLocationNotification:(id)a3;
- (void)_removeObservers;
- (void)_removeTimers;
- (void)_reviseCachedLocations;
- (void)_setup;
- (void)_startMonitoringWithConfiguration:(id)a3 handler:(id)a4;
- (void)_stopMonitoringWithHandler:(id)a3;
- (void)_tearDownTimerWithIdentifier:(id)a3;
- (void)_updateCoarseEtaWithMapsExpectedTravelTime:(double)a3 crowFliesExpectedTravelTime:(double)a4;
- (void)_updateInitiatorStatus;
- (void)_updateInitiatorStatusDestinationBoundWithCompletion:(id)a3;
- (void)_updateInitiatorStatusRoundTrip;
- (void)_updateTimerWithIdentifier:(id)a3 fireAfterDelay:(double)a4;
- (void)modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4;
- (void)onDataProtectionNotification:(id)a3;
- (void)onLocationNotification:(id)a3;
- (void)onUserTriggerResponse:(int64_t)a3;
- (void)postStateChange;
- (void)setCachedLocationEvents:(id)a3;
- (void)setCoarseEta:(id)a3;
- (void)setDataProtectionManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDestinationStatusUpdateTimeInterval:(double)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setEtaScaleFactor:(double)a3;
- (void)setIdleMaxDistanceThreshold:(double)a3;
- (void)setIdleTimeoutThreshold:(double)a3;
- (void)setLocationManager:(id)a3;
- (void)setMinDistanceUpdateThreshold:(double)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setNoProgressTimeoutThreshold:(double)a3;
- (void)setOriginLocation:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSessionConfiguration:(id)a3;
- (void)setSessionMetricManager:(id)a3;
- (void)setSessionMonitorDelegate:(id)a3;
- (void)setSessionStore:(id)a3;
- (void)setSignificantMoveThreshold:(double)a3;
- (void)setTimerIdentifierToTimers:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setTriggerCategory:(unint64_t)a3;
- (void)setTriggerState:(id)a3;
- (void)setup;
- (void)startMonitoringWithConfiguration:(id)a3 handler:(id)a4;
- (void)stopMonitoringWithHandler:(id)a3;
@end

@implementation SMTriggerDestination

- (SMTriggerDestination)initWithQueue:(id)a3 defaultsManager:(id)a4 dataProtectionManager:(id)a5 locationManager:(id)a6 motionActivityManager:(id)a7 distanceCalculator:(id)a8 platform:(id)a9 sessionStore:(id)a10 timerManager:(id)a11 sessionMetricManager:(id)a12
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v37 = a4;
  id v18 = a4;
  id v38 = a5;
  id v43 = a5;
  id v39 = a6;
  id v19 = a6;
  id v40 = a7;
  id v20 = a7;
  id v41 = a8;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v46 = a11;
  id v24 = a12;
  id v42 = v17;
  v44 = v24;
  if (v17)
  {
    if (v18)
    {
      v25 = v43;
      v26 = self;
      if (v43)
      {
        if (v19)
        {
          if (v20)
          {
            if (v21)
            {
              if (v22)
              {
                if (v23)
                {
                  if (v46)
                  {
                    if (v24)
                    {
                      v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315138;
                        v49 = "-[SMTriggerDestination initWithQueue:defaultsManager:dataProtectionManager:locationManager"
                              ":motionActivityManager:distanceCalculator:platform:sessionStore:timerManager:sessionMetricManager:]";
                        _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
                      }

                      v47.receiver = self;
                      v47.super_class = (Class)SMTriggerDestination;
                      v28 = [(SMTriggerDestination *)&v47 init];
                      p_isa = (id *)&v28->super.isa;
                      if (v28)
                      {
                        objc_storeStrong((id *)&v28->_queue, a3);
                        objc_storeStrong(p_isa + 3, v37);
                        objc_storeStrong(p_isa + 4, v38);
                        objc_storeStrong(p_isa + 5, v39);
                        objc_storeStrong(p_isa + 6, v40);
                        objc_storeStrong(p_isa + 7, v41);
                        objc_storeStrong(p_isa + 8, a9);
                        objc_storeStrong(p_isa + 9, a10);
                        objc_storeStrong(p_isa + 12, a11);
                        objc_storeStrong(p_isa + 13, a12);
                        [p_isa setup];
                      }
                      v26 = p_isa;
                      v30 = v26;
                      goto LABEL_39;
                    }
                    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      v34 = "Invalid parameter not satisfying: sessionMetricManager";
                      goto LABEL_37;
                    }
LABEL_38:

                    v30 = 0;
LABEL_39:
                    v32 = v42;
                    goto LABEL_40;
                  }
                  v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_38;
                  }
                  *(_WORD *)buf = 0;
                  v34 = "Invalid parameter not satisfying: timerManager";
                }
                else
                {
                  v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_38;
                  }
                  *(_WORD *)buf = 0;
                  v34 = "Invalid parameter not satisfying: sessionStore";
                }
              }
              else
              {
                v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_38;
                }
                *(_WORD *)buf = 0;
                v34 = "Invalid parameter not satisfying: platform";
              }
            }
            else
            {
              v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                goto LABEL_38;
              }
              *(_WORD *)buf = 0;
              v34 = "Invalid parameter not satisfying: distanceCalculator";
            }
          }
          else
          {
            v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              goto LABEL_38;
            }
            *(_WORD *)buf = 0;
            v34 = "Invalid parameter not satisfying: motionActivityManager";
          }
        }
        else
        {
          v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            goto LABEL_38;
          }
          *(_WORD *)buf = 0;
          v34 = "Invalid parameter not satisfying: locationManager";
        }
      }
      else
      {
        v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          goto LABEL_38;
        }
        *(_WORD *)buf = 0;
        v34 = "Invalid parameter not satisfying: dataProtectionManager";
      }
    }
    else
    {
      v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v25 = v43;
      v26 = self;
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      v34 = "Invalid parameter not satisfying: defaultsManager";
    }
LABEL_37:
    _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, v34, buf, 2u);
    goto LABEL_38;
  }
  v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
  }

  v30 = 0;
  v32 = 0;
  v25 = v43;
  v26 = self;
LABEL_40:

  return v30;
}

+ (void)updateSMTriggerDestinationTransportTypeToAvgSpeedWithDefaultsManager:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKey:@"RTDefaultsSMTriggerDestinationAverageSpeedAnyKey" value:&unk_1F3453DB8];
  [v4 doubleValue];
  double v6 = v5;

  if (v6 != 1.5)
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "+[SMTriggerDestination updateSMTriggerDestinationTransportTypeToAvgSpeedWithDefaultsManager:]";
      __int16 v30 = 2080;
      v31 = "overriding destination average speed any";
      __int16 v32 = 2048;
      uint64_t v33 = 0x3FF8000000000000;
      __int16 v34 = 2048;
      double v35 = v6;
      __int16 v36 = 2112;
      id v37 = @"RTDefaultsSMTriggerDestinationAverageSpeedAnyKey";
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }
  }
  v8 = [v3 objectForKey:@"RTDefaultsSMTriggerDestinationAverageDrivingSpeedKey" value:&unk_1F3453DC8];
  [v8 doubleValue];
  double v10 = v9;

  if (v10 != 8.3)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "+[SMTriggerDestination updateSMTriggerDestinationTransportTypeToAvgSpeedWithDefaultsManager:]";
      __int16 v30 = 2080;
      v31 = "overriding destination average speed automobile";
      __int16 v32 = 2048;
      uint64_t v33 = 0x402099999999999ALL;
      __int16 v34 = 2048;
      double v35 = v10;
      __int16 v36 = 2112;
      id v37 = @"RTDefaultsSMTriggerDestinationAverageDrivingSpeedKey";
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }
  }
  v12 = [v3 objectForKey:@"RTDefaultsSMTriggerDestinationAverageWalkingSpeedKey" value:&unk_1F3453DD8];
  [v12 doubleValue];
  double v14 = v13;

  if (v14 != 0.4)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "+[SMTriggerDestination updateSMTriggerDestinationTransportTypeToAvgSpeedWithDefaultsManager:]";
      __int16 v30 = 2080;
      v31 = "overriding average speed walking";
      __int16 v32 = 2048;
      uint64_t v33 = 0x3FD999999999999ALL;
      __int16 v34 = 2048;
      double v35 = v14;
      __int16 v36 = 2112;
      id v37 = @"RTDefaultsSMTriggerDestinationAverageWalkingSpeedKey";
      _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }
  }
  v16 = [v3 objectForKey:@"RTDefaultsSMTriggerDestinationAverageTransitSpeedKey" value:&unk_1F3453DE8];
  [v16 doubleValue];
  double v18 = v17;

  if (v18 != 6.3)
  {
    id v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "+[SMTriggerDestination updateSMTriggerDestinationTransportTypeToAvgSpeedWithDefaultsManager:]";
      __int16 v30 = 2080;
      v31 = "overriding average speed transit";
      __int16 v32 = 2048;
      uint64_t v33 = 0x4019333333333333;
      __int16 v34 = 2048;
      double v35 = v18;
      __int16 v36 = 2112;
      id v37 = @"RTDefaultsSMTriggerDestinationAverageTransitSpeedKey";
      _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }
  }
  if (!SMTriggerDestinationTransportTypeToAvgSpeed)
  {
    id v20 = [NSNumber numberWithDouble:v6];
    v27[0] = v20;
    v26[1] = &unk_1F34522E0;
    id v21 = [NSNumber numberWithDouble:v10];
    v27[1] = v21;
    v26[2] = &unk_1F34522F8;
    id v22 = [NSNumber numberWithDouble:v14];
    v27[2] = v22;
    v26[3] = &unk_1F3452310;
    id v23 = [NSNumber numberWithDouble:v18];
    v27[3] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
    v25 = (void *)SMTriggerDestinationTransportTypeToAvgSpeed;
    SMTriggerDestinationTransportTypeToAvgSpeed = v24;
  }
}

- (void)setup
{
  id v3 = [(SMTriggerDestination *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__SMTriggerDestination_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __29__SMTriggerDestination_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_setup
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v77 = "-[SMTriggerDestination _setup]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v4 = objc_opt_new();
  [(SMTriggerDestination *)self setTimerIdentifierToTimers:v4];

  [(SMTriggerDestination *)self setTriggerCategory:0];
  double v5 = objc_opt_new();
  [(SMTriggerDestination *)self setCachedLocationEvents:v5];

  [(SMTriggerDestination *)self setCoarseEta:0];
  double v6 = [(SMTriggerDestination *)self platform];
  int v7 = [v6 internalInstall];

  v8 = [(SMTriggerDestination *)self defaultsManager];
  double v9 = v8;
  if (v7)
  {
    double v10 = [v8 objectForKey:@"RTDefaultsSMTriggerDestinationScaleFactorInternalKey" value:&unk_1F3453DF8];
    [v10 doubleValue];
    -[SMTriggerDestination setEtaScaleFactor:](self, "setEtaScaleFactor:");

    [(SMTriggerDestination *)self etaScaleFactor];
    if (v11 == 2.0) {
      goto LABEL_12;
    }
    v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    [(SMTriggerDestination *)self etaScaleFactor];
    *(_DWORD *)buf = 136316162;
    v77 = "-[SMTriggerDestination _setup]";
    __int16 v78 = 2080;
    v79 = "overriding internal eta scale factor";
    __int16 v80 = 2048;
    uint64_t v81 = 0x4000000000000000;
    __int16 v82 = 2048;
    double v83 = v13;
    __int16 v84 = 2112;
    v85 = @"RTDefaultsSMTriggerDestinationScaleFactorInternalKey";
    goto LABEL_10;
  }
  double v14 = [v8 objectForKey:@"RTDefaultsSMTriggerDestinationScaleFactorExternalKey" value:&unk_1F3453DF8];
  [v14 doubleValue];
  -[SMTriggerDestination setEtaScaleFactor:](self, "setEtaScaleFactor:");

  [(SMTriggerDestination *)self etaScaleFactor];
  if (v15 == 2.0) {
    goto LABEL_12;
  }
  v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    [(SMTriggerDestination *)self etaScaleFactor];
    *(_DWORD *)buf = 136316162;
    v77 = "-[SMTriggerDestination _setup]";
    __int16 v78 = 2080;
    v79 = "overriding external eta scale factor";
    __int16 v80 = 2048;
    uint64_t v81 = 0x4000000000000000;
    __int16 v82 = 2048;
    double v83 = v16;
    __int16 v84 = 2112;
    v85 = @"RTDefaultsSMTriggerDestinationScaleFactorExternalKey";
LABEL_10:
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
  }
LABEL_11:

LABEL_12:
  double v17 = [(SMTriggerDestination *)self defaultsManager];
  double v18 = [v17 objectForKey:@"RTDefaultsSMTriggerDestinationSignificantMoveThresholdKey" value:&unk_1F3453E08];
  [v18 doubleValue];
  -[SMTriggerDestination setSignificantMoveThreshold:](self, "setSignificantMoveThreshold:");

  [(SMTriggerDestination *)self significantMoveThreshold];
  if (v19 != 200.0)
  {
    id v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      [(SMTriggerDestination *)self significantMoveThreshold];
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      __int16 v78 = 2080;
      v79 = "overriding significant move threshold";
      __int16 v80 = 2048;
      uint64_t v81 = 0x4069000000000000;
      __int16 v82 = 2048;
      double v83 = v21;
      __int16 v84 = 2112;
      v85 = @"RTDefaultsSMTriggerDestinationSignificantMoveThresholdKey";
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }
  }
  id v22 = [(SMTriggerDestination *)self defaultsManager];
  id v23 = [v22 objectForKey:@"RTDefaultsSMTriggerDestinationIdleMaxDistanceThresholdKey" value:&unk_1F3453E18];
  [v23 doubleValue];
  -[SMTriggerDestination setIdleMaxDistanceThreshold:](self, "setIdleMaxDistanceThreshold:");

  [(SMTriggerDestination *)self idleMaxDistanceThreshold];
  if (v24 != 250.0)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      [(SMTriggerDestination *)self idleMaxDistanceThreshold];
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      __int16 v78 = 2080;
      v79 = "overriding idle to progress transition max distance threshold";
      __int16 v80 = 2048;
      uint64_t v81 = 0x406F400000000000;
      __int16 v82 = 2048;
      double v83 = v26;
      __int16 v84 = 2112;
      v85 = @"RTDefaultsSMTriggerDestinationIdleMaxDistanceThresholdKey";
      _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }
  }
  v27 = [(SMTriggerDestination *)self defaultsManager];
  v28 = [v27 objectForKey:@"RTDefaultsSMTriggerDestinationStatusUpdateTimeIntervalKey" value:&unk_1F3453E28];
  [v28 doubleValue];
  -[SMTriggerDestination setDestinationStatusUpdateTimeInterval:](self, "setDestinationStatusUpdateTimeInterval:");

  [(SMTriggerDestination *)self destinationStatusUpdateTimeInterval];
  if (v29 != 450.0)
  {
    __int16 v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      [(SMTriggerDestination *)self destinationStatusUpdateTimeInterval];
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      __int16 v78 = 2080;
      v79 = "overriding destination status update time interval";
      __int16 v80 = 2048;
      uint64_t v81 = 0x407C200000000000;
      __int16 v82 = 2048;
      double v83 = v31;
      __int16 v84 = 2112;
      v85 = @"RTDefaultsSMTriggerDestinationStatusUpdateTimeIntervalKey";
      _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }
  }
  __int16 v32 = [(SMTriggerDestination *)self defaultsManager];
  uint64_t v33 = [v32 objectForKey:@"RTDefaultsSMTriggerDestinationIdleTimeoutThresholdKey" value:&unk_1F3453E38];
  [v33 doubleValue];
  [(SMTriggerDestination *)self setIdleTimeoutThreshold:"setIdleTimeoutThreshold:"];

  [(SMTriggerDestination *)self idleTimeoutThreshold];
  if (v34 != 900.0)
  {
    double v35 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      [(SMTriggerDestination *)self idleTimeoutThreshold];
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      __int16 v78 = 2080;
      v79 = "overriding idle timeout threshold";
      __int16 v80 = 2048;
      uint64_t v81 = 0x408C200000000000;
      __int16 v82 = 2048;
      double v83 = v36;
      __int16 v84 = 2112;
      v85 = @"RTDefaultsSMTriggerDestinationIdleTimeoutThresholdKey";
      _os_log_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }
  }
  id v37 = [(SMTriggerDestination *)self defaultsManager];
  uint64_t v38 = [v37 objectForKey:@"RTDefaultsSMTriggerDestinationNoProgressTimeoutThresholdKey" value:&unk_1F3453E38];
  [v38 doubleValue];
  [(SMTriggerDestination *)self setNoProgressTimeoutThreshold:"setNoProgressTimeoutThreshold:"];

  [(SMTriggerDestination *)self noProgressTimeoutThreshold];
  if (v39 != 900.0)
  {
    id v40 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      [(SMTriggerDestination *)self noProgressTimeoutThreshold];
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      __int16 v78 = 2080;
      v79 = "overriding no progress timeout threshold";
      __int16 v80 = 2048;
      uint64_t v81 = 0x408C200000000000;
      __int16 v82 = 2048;
      double v83 = v41;
      __int16 v84 = 2112;
      v85 = @"RTDefaultsSMTriggerDestinationNoProgressTimeoutThresholdKey";
      _os_log_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }
  }
  id v42 = [(SMTriggerDestination *)self defaultsManager];
  id v43 = [v42 objectForKey:@"RTDefaultsSMTriggerDestinationMinDistanceThresholdToUpdateEtaKey" value:&unk_1F3453E48];
  [v43 doubleValue];
  -[SMTriggerDestination setMinDistanceUpdateThreshold:](self, "setMinDistanceUpdateThreshold:");

  [(SMTriggerDestination *)self minDistanceUpdateThreshold];
  if (v44 != 2000.0)
  {
    v45 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      [(SMTriggerDestination *)self minDistanceUpdateThreshold];
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      __int16 v78 = 2080;
      v79 = "overriding min distance to update threshold";
      __int16 v80 = 2048;
      uint64_t v81 = 0x409F400000000000;
      __int16 v82 = 2048;
      double v83 = v46;
      __int16 v84 = 2112;
      v85 = @"RTDefaultsSMTriggerDestinationMinDistanceThresholdToUpdateEtaKey";
      _os_log_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }
  }
  objc_super v47 = [(SMTriggerDestination *)self defaultsManager];
  v48 = [v47 objectForKey:@"RTDefaultsSMTriggerDestinationAverageSpeedAnyKey" value:&unk_1F3453DB8];
  [v48 doubleValue];
  double v50 = v49;

  if (v50 != 1.5)
  {
    v51 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      __int16 v78 = 2080;
      v79 = "overriding average speed for any";
      __int16 v80 = 2048;
      uint64_t v81 = 0x3FF8000000000000;
      __int16 v82 = 2048;
      double v83 = v50;
      __int16 v84 = 2112;
      v85 = @"RTDefaultsSMTriggerDestinationAverageSpeedAnyKey";
      _os_log_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }
  }
  v52 = [(SMTriggerDestination *)self defaultsManager];
  v53 = [v52 objectForKey:@"RTDefaultsSMTriggerDestinationAverageWalkingSpeedKey" value:&unk_1F3453DD8];
  [v53 doubleValue];
  double v55 = v54;

  if (v55 != 0.4)
  {
    v56 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      __int16 v78 = 2080;
      v79 = "overriding average speed for walking";
      __int16 v80 = 2048;
      uint64_t v81 = 0x3FD999999999999ALL;
      __int16 v82 = 2048;
      double v83 = v55;
      __int16 v84 = 2112;
      v85 = @"RTDefaultsSMTriggerDestinationAverageWalkingSpeedKey";
      _os_log_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }
  }
  v57 = [(SMTriggerDestination *)self defaultsManager];
  v58 = [v57 objectForKey:@"RTDefaultsSMTriggerDestinationAverageDrivingSpeedKey" value:&unk_1F3453DC8];
  [v58 doubleValue];
  double v60 = v59;

  if (v60 != 8.3)
  {
    v61 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      __int16 v78 = 2080;
      v79 = "overriding average speed for driving";
      __int16 v80 = 2048;
      uint64_t v81 = 0x402099999999999ALL;
      __int16 v82 = 2048;
      double v83 = v60;
      __int16 v84 = 2112;
      v85 = @"RTDefaultsSMTriggerDestinationAverageDrivingSpeedKey";
      _os_log_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }
  }
  v62 = [(SMTriggerDestination *)self defaultsManager];
  v63 = [v62 objectForKey:@"RTDefaultsSMTriggerDestinationAverageTransitSpeedKey" value:&unk_1F3453DE8];
  [v63 doubleValue];
  double v65 = v64;

  if (v65 != 6.3)
  {
    v66 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      __int16 v78 = 2080;
      v79 = "overriding average speed for transit";
      __int16 v80 = 2048;
      uint64_t v81 = 0x4019333333333333;
      __int16 v82 = 2048;
      double v83 = v65;
      __int16 v84 = 2112;
      v85 = @"RTDefaultsSMTriggerDestinationAverageTransitSpeedKey";
      _os_log_impl(&dword_1D9BFA000, v66, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }
  }
  v67 = [NSNumber numberWithDouble:v50];
  v75[0] = v67;
  v74[1] = &unk_1F34522E0;
  v68 = [NSNumber numberWithDouble:v60];
  v75[1] = v68;
  v74[2] = &unk_1F34522F8;
  v69 = [NSNumber numberWithDouble:v55];
  v75[2] = v69;
  v74[3] = &unk_1F3452310;
  v70 = [NSNumber numberWithDouble:v65];
  v75[3] = v70;
  uint64_t v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:4];
  v72 = (void *)SMTriggerDestinationTransportTypeToAvgSpeed;
  SMTriggerDestinationTransportTypeToAvgSpeed = v71;

  v73 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v77 = "-[SMTriggerDestination _setup]";
    __int16 v78 = 2112;
    v79 = (const char *)SMTriggerDestinationTransportTypeToAvgSpeed;
    _os_log_impl(&dword_1D9BFA000, v73, OS_LOG_TYPE_INFO, "%s, transport speed dictionary, %@", buf, 0x16u);
  }
}

- (void)_bootstrap
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(SMTriggerDestination *)self sessionConfiguration];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SMTriggerDestination _bootstrap]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, configuration, %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v58 = __Block_byref_object_copy__138;
  double v59 = __Block_byref_object_dispose__138;
  id v60 = 0;
  uint64_t v46 = 0;
  objc_super v47 = (id *)&v46;
  uint64_t v48 = 0x3032000000;
  double v49 = __Block_byref_object_copy__138;
  double v50 = __Block_byref_object_dispose__138;
  id v51 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  double v6 = [(SMTriggerDestination *)self sessionStore];
  int v7 = [(SMTriggerDestination *)self sessionConfiguration];
  v8 = [v7 sessionID];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __34__SMTriggerDestination__bootstrap__block_invoke;
  v42[3] = &unk_1E6B905F0;
  double v44 = buf;
  v45 = &v46;
  double v9 = v5;
  id v43 = v9;
  [v6 fetchTriggerDestinationStateWithSessionID:v8 handler:v42];

  double v10 = v9;
  double v11 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12)) {
    goto LABEL_8;
  }
  double v13 = [MEMORY[0x1E4F1C9C8] now];
  [v13 timeIntervalSinceDate:v11];
  double v15 = v14;
  double v16 = objc_opt_new();
  double v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_580];
  double v18 = [MEMORY[0x1E4F29060] callStackSymbols];
  double v19 = [v18 filteredArrayUsingPredicate:v17];
  id v20 = [v19 firstObject];

  [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
  double v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v52 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v52, 2u);
  }

  id v22 = (void *)MEMORY[0x1E4F28C58];
  v61[0] = *MEMORY[0x1E4F28568];
  *(void *)v52 = @"semaphore wait timeout";
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v61 count:1];
  double v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

  if (v24)
  {
    id v25 = v24;

    char v26 = 0;
  }
  else
  {
LABEL_8:
    id v25 = 0;
    char v26 = 1;
  }

  id v27 = v25;
  if ((v26 & 1) == 0) {
    objc_storeStrong(v47 + 5, v25);
  }
  if (v47[5])
  {
    v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      double v29 = [(SMTriggerDestination *)self sessionConfiguration];
      __int16 v30 = [v29 sessionID];
      double v31 = [v30 UUIDString];
      id v32 = v47[5];
      *(_DWORD *)v52 = 136315650;
      *(void *)&v52[4] = "-[SMTriggerDestination _bootstrap]";
      __int16 v53 = 2112;
      double v54 = v31;
      __int16 v55 = 2112;
      v56 = v32;
      _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%s, Error while fetching triggerDestination state, session ID, %@, error, %@", v52, 0x20u);
    }
  }
  else
  {
    uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      double v34 = *(void **)(*(void *)&buf[8] + 40);
      double v35 = [(SMTriggerDestination *)self sessionConfiguration];
      double v36 = [v35 sessionID];
      id v37 = [v36 UUIDString];
      *(_DWORD *)v52 = 136315650;
      *(void *)&v52[4] = "-[SMTriggerDestination _bootstrap]";
      __int16 v53 = 2112;
      double v54 = v34;
      __int16 v55 = 2112;
      v56 = v37;
      _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_INFO, "%s, most recent triggerDestination state, %@, sessionID, %@", v52, 0x20u);
    }
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      -[SMTriggerDestination setTriggerState:](self, "setTriggerState:");
    }
    else
    {
      id v38 = objc_alloc(MEMORY[0x1E4F999D0]);
      double v39 = [(SMTriggerDestination *)self sessionConfiguration];
      id v40 = [v39 sessionID];
      double v41 = (void *)[v38 initWithSessionIdentifier:v40];
      [(SMTriggerDestination *)self setTriggerState:v41];

      [(SMTriggerDestination *)self _persistState];
    }
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(buf, 8);
}

void __34__SMTriggerDestination__bootstrap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)locationRequestOptions
{
  v2 = [RTLocationRequestOptions alloc];
  id v3 = [(RTLocationRequestOptions *)v2 initWithDesiredAccuracy:1 horizontalAccuracy:1 maxAge:*MEMORY[0x1E4F1E6D8] yieldLastLocation:100.0 timeout:3.0 fallback:5.0 fallbackHorizontalAccuracy:200.0 fallbackMaxAge:3600.0];

  return v3;
}

- (void)startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SMTriggerDestination *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SMTriggerDestination_startMonitoringWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __65__SMTriggerDestination_startMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startMonitoringWithConfiguration:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  v113[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if ([v6 sessionType] != 2 && objc_msgSend(v6, "sessionType") != 3)
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
      __int16 v106 = 1024;
      LODWORD(v107) = 354;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration.sessionType == SMSessionTypeDestinationBound || configuration.sessionType == SMSessionTypeRoundTrip (in %s:%d)", buf, 0x12u);
    }
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
    __int16 v106 = 2112;
    id v107 = v6;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, configuration, %@", buf, 0x16u);
  }

  if (v7)
  {
    id v10 = +[SMDateUtility date];
    id v11 = [(SMTriggerDestination *)self sessionConfiguration];
    id v12 = [v11 sessionStartDate];
    [v10 timeIntervalSinceDate:v12];
    double v14 = v13;

    if (v14 < 0.0)
    {
      double v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v89 = [(SMTriggerDestination *)self sessionConfiguration];
        v90 = [v89 sessionStartDate];
        v91 = [v90 stringFromDate];
        v92 = [v10 stringFromDate];
        *(_DWORD *)buf = 136315650;
        v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
        __int16 v106 = 2112;
        id v107 = v91;
        __int16 v108 = 2112;
        v109 = v92;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "%s, sessionStartDate, %@, larger than currentDate, %@", buf, 0x20u);
      }
      double v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F5CFE8];
      uint64_t v112 = *MEMORY[0x1E4F28568];
      v113[0] = @"sessionStartDate is larger than currentDate";
      double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:&v112 count:1];
      double v19 = [v16 errorWithDomain:v17 code:7 userInfo:v18];

      v7[2](v7, v19);
LABEL_44:

      goto LABEL_45;
    }
    [(SMTriggerDestination *)self _setup];
    [(SMTriggerDestination *)self setSessionConfiguration:v6];
    [(SMTriggerDestination *)self setOriginLocation:0];
    [(SMTriggerDestination *)self _bootstrap];
    id v20 = [(SMTriggerDestination *)self triggerState];
    uint64_t v21 = [v20 upperBoundEta];
    v100 = v10;
    if (v21)
    {
      id v22 = (void *)v21;
    }
    else
    {
      id v22 = [(SMTriggerDestination *)self sessionConfiguration];
      id v23 = [v22 destination];
      uint64_t v24 = [v23 eta];
      if (v24)
      {
        id v25 = (void *)v24;
        char v26 = [(SMTriggerDestination *)self sessionConfiguration];
        id v27 = [v26 destination];
        v28 = [v27 eta];
        [v28 additionalTravelTime];
        double v30 = v29;

        if (v30 <= 0.0) {
          goto LABEL_23;
        }
        double v31 = [(SMTriggerDestination *)self sessionConfiguration];
        id v32 = [v31 destination];
        uint64_t v33 = [v32 eta];
        [v33 expectedTravelTime];
        double v35 = v34;
        double v36 = [(SMTriggerDestination *)self sessionConfiguration];
        id v37 = [v36 destination];
        id v38 = [v37 eta];
        [v38 additionalTravelTime];
        double v40 = v35 + v39;

        double v41 = objc_opt_class();
        id v42 = [(SMTriggerDestination *)self defaultsManager];
        [(SMTriggerDestination *)self etaScaleFactor];
        id v20 = [v41 upperBoundEtaForDepartureDate:v100 defaultsManager:v42 mapsExpectedTravelTime:v40 crowFliesExpectedTravelTime:v40 etaScaleFactor:v43];

        double v44 = [(SMTriggerDestination *)self triggerState];
        [v44 setUpperBoundEta:v20];

        [(SMTriggerDestination *)self destinationStatusUpdateTimeInterval];
        id v22 = -[NSObject dateByAddingTimeInterval:](v100, "dateByAddingTimeInterval:");
        v45 = [(SMTriggerDestination *)self triggerState];
        [v45 setTimeToUpdateStatus:v22];

        [(SMTriggerDestination *)self _updateCoarseEtaWithMapsExpectedTravelTime:v40 crowFliesExpectedTravelTime:v40];
        id v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v99 = [(SMTriggerDestination *)self sessionConfiguration];
          uint64_t v46 = [v99 destination];
          v98 = [(SMTriggerDestination *)self triggerState];
          objc_super v47 = [v98 upperBoundEta];
          uint64_t v48 = [(SMTriggerDestination *)self triggerState];
          double v49 = [v48 timeToUpdateStatus];
          v97 = [v49 stringFromDate];
          *(_DWORD *)buf = 136315906;
          v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
          __int16 v106 = 2112;
          id v107 = v46;
          __int16 v108 = 2112;
          v109 = v47;
          __int16 v110 = 2112;
          v111 = v97;
          _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "%s, user-specified eta, %@, upperBoundETA, %@, timeToUpdateStatus, %@", buf, 0x2Au);
        }
      }
    }
LABEL_23:
    [(SMTriggerDestination *)self _persistState];
    double v50 = [(SMTriggerDestination *)self sessionConfiguration];
    id v51 = [v50 destination];
    uint64_t v52 = [v51 eta];
    if (v52)
    {
      __int16 v53 = (void *)v52;
      double v54 = [(SMTriggerDestination *)self sessionConfiguration];
      __int16 v55 = [v54 destination];
      v56 = [v55 eta];
      uint64_t v57 = [v56 transportType];

      id v10 = v100;
      if (v57 != 4)
      {
LABEL_29:
        double v59 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
          _os_log_impl(&dword_1D9BFA000, v59, OS_LOG_TYPE_INFO, "%s, start current location fetch, location", buf, 0xCu);
        }

        id v60 = objc_opt_class();
        v61 = [(SMTriggerDestination *)self locationManager];
        v62 = [(SMTriggerDestination *)self queue];
        [v60 currentLocationWithLocationManager:v61 queue:v62 handler:&__block_literal_global_109];

        double v19 = [(SMTriggerDestination *)self _cachedLocationsDateInterval];
        id v101 = 0;
        v63 = [(SMTriggerDestination *)self _locationsInDateInterval:v19 horizontalAccuracy:&v101 error:200.0];
        id v64 = v101;
        if (v64)
        {
          double v65 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            v93 = [v19 startDate];
            v94 = [v93 stringFromDate];
            v95 = [v19 endDate];
            v96 = [v95 stringFromDate];
            *(_DWORD *)buf = 136315650;
            v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
            __int16 v106 = 2112;
            id v107 = v94;
            __int16 v108 = 2112;
            v109 = v96;
            _os_log_error_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_ERROR, "%s, unable to fetch locations for startDate, %@, endDate, %@", buf, 0x20u);

            id v10 = v100;
          }

          v66 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v67 = *MEMORY[0x1E4F5CFE8];
          uint64_t v102 = *MEMORY[0x1E4F28568];
          v103 = @"unable to fetch locations";
          v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
          v69 = [v66 errorWithDomain:v67 code:6 userInfo:v68];

          v7[2](v7, v69);
        }
        else
        {
          [(SMTriggerDestination *)self _cacheLocations:v63];
          [(SMTriggerDestination *)self _addObservers];
          v70 = [(SMTriggerDestination *)self triggerState];
          uint64_t v71 = [v70 timeToUpdateStatus];

          if (!v71)
          {
            v72 = [v10 dateByAddingTimeInterval:1.0];
            v73 = [(SMTriggerDestination *)self triggerState];
            [v73 setTimeToUpdateStatus:v72];
          }
          v74 = [(SMTriggerDestination *)self triggerState];
          v75 = [v74 timeToUpdateStatus];
          [v75 timeIntervalSinceDate:v10];
          double v77 = v76;

          [(SMTriggerDestination *)self _initializeTimerWithIdentifier:@"com.apple.routined.SMTriggerDestination.statusUpdateTimerIdentifier" fireAfterDelay:v77];
          if ([v6 sessionType] == 3)
          {
            __int16 v78 = [(SMTriggerDestination *)self triggerState];
            v79 = [v78 roundTripReminderDate];
            __int16 v80 = [MEMORY[0x1E4F1C9C8] distantPast];
            char v81 = [v79 isEqualToDate:v80];

            if (v81)
            {
              double v82 = 5400.0;
              id v10 = v100;
            }
            else
            {
              double v83 = [(SMTriggerDestination *)self triggerState];
              __int16 v84 = [v83 roundTripReminderDate];
              id v10 = v100;
              [v84 timeIntervalSinceDate:v100];
              double v86 = v85;

              double v82 = fmax(v86, 1.0);
            }
            v87 = [v10 dateByAddingTimeInterval:v82];
            v88 = [(SMTriggerDestination *)self triggerState];
            [v88 setRoundTripReminderDate:v87];

            [(SMTriggerDestination *)self _initializeTimerWithIdentifier:@"com.apple.routined.SMTriggerDestination.roundTripReminderTimerIdentifier" fireAfterDelay:v82];
          }
          [(SMTriggerDestination *)self _persistState];
          v7[2](v7, 0);
        }

        goto LABEL_44;
      }
      v58 = [(SMTriggerDestination *)self triggerState];
      [v58 setPredominantModeOfTransport:4];

      double v50 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
        _os_log_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_INFO, "%s, user specified transport mode is transit", buf, 0xCu);
      }
    }
    else
    {

      id v10 = v100;
    }

    goto LABEL_29;
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%s, invalid handler", buf, 0xCu);
  }
LABEL_45:
}

void __66__SMTriggerDestination__startMonitoringWithConfiguration_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    v8 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, complete current location fetch, location, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SMTriggerDestination *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SMTriggerDestination_modifyMonitoringWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __66__SMTriggerDestination_modifyMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _modifyMonitoringWithConfiguration:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 sessionType] != 2 && objc_msgSend(v6, "sessionType") != 3)
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v29 = 136315394;
      double v30 = "-[SMTriggerDestination _modifyMonitoringWithConfiguration:handler:]";
      __int16 v31 = 1024;
      LODWORD(v32) = 507;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration.sessionType == SMSessionTypeDestinationBound || configuration.sessionType == SMSessionTypeRoundTrip (in %s:%d)", (uint8_t *)&v29, 0x12u);
    }
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v29 = 136315394;
    double v30 = "-[SMTriggerDestination _modifyMonitoringWithConfiguration:handler:]";
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, configuration, %@", (uint8_t *)&v29, 0x16u);
  }

  id v10 = [(SMTriggerDestination *)self sessionConfiguration];
  int v11 = [v10 isEqual:v6];

  if (v11)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v29 = 136315138;
      double v30 = "-[SMTriggerDestination _modifyMonitoringWithConfiguration:handler:]";
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%s, Configuration did not change", (uint8_t *)&v29, 0xCu);
    }
  }
  else
  {
    id v13 = [(SMTriggerDestination *)self sessionConfiguration];
    double v14 = [v13 sessionID];
    double v15 = [v6 sessionID];
    char v16 = [v14 isEqual:v15];

    if (v16)
    {
      id v12 = [(SMTriggerDestination *)self triggerState];
      [(SMTriggerDestination *)self _stopMonitoringWithHandler:v7];
      id v17 = objc_alloc(MEMORY[0x1E4F999D0]);
      double v18 = [v6 sessionID];
      double v19 = (void *)[v17 initWithSessionIdentifier:v18];
      [(SMTriggerDestination *)self setTriggerState:v19];

      id v20 = [v12 lastLockDate];
      uint64_t v21 = [(SMTriggerDestination *)self triggerState];
      [v21 setLastLockDate:v20];

      id v22 = [v12 lastUnlockDate];
      id v23 = [(SMTriggerDestination *)self triggerState];
      [v23 setLastUnlockDate:v22];

      uint64_t v24 = [v12 predominantModeOfTransport];
      id v25 = [(SMTriggerDestination *)self triggerState];
      [v25 setPredominantModeOfTransport:v24];

      [(SMTriggerDestination *)self _persistState];
      [(SMTriggerDestination *)self setOriginLocation:0];
      [(SMTriggerDestination *)self _startMonitoringWithConfiguration:v6 handler:v7];
    }
    else
    {
      id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        char v26 = [(SMTriggerDestination *)self sessionConfiguration];
        id v27 = [v26 sessionID];
        v28 = [v6 sessionID];
        int v29 = 136315650;
        double v30 = "-[SMTriggerDestination _modifyMonitoringWithConfiguration:handler:]";
        __int16 v31 = 2112;
        id v32 = v27;
        __int16 v33 = 2112;
        double v34 = v28;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%s, Configuration modified for wrong session, current config sessionID, %@, modified config sessionID, %@", (uint8_t *)&v29, 0x20u);
      }
    }
  }
}

- (void)stopMonitoringWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SMTriggerDestination *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SMTriggerDestination_stopMonitoringWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__SMTriggerDestination_stopMonitoringWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopMonitoringWithHandler:*(void *)(a1 + 40)];
}

- (void)_stopMonitoringWithHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[SMTriggerDestination _stopMonitoringWithHandler:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }

  [(SMTriggerDestination *)self _removeObservers];
  [(SMTriggerDestination *)self _removeTimers];
  id v6 = [(SMTriggerDestination *)self cachedLocationEvents];
  [v6 removeAllObjects];

  [(SMTriggerDestination *)self setTriggerState:0];
  [(SMTriggerDestination *)self setOriginLocation:0];
  if (v4) {
    v4[2](v4, 0);
  }
}

- (void)onUserTriggerResponse:(int64_t)a3
{
  id v5 = [(SMTriggerDestination *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__SMTriggerDestination_onUserTriggerResponse___block_invoke;
  v6[3] = &unk_1E6B91248;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __46__SMTriggerDestination_onUserTriggerResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onUserTriggerResponse:*(void *)(a1 + 40)];
}

- (void)_onUserTriggerResponse:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [MEMORY[0x1E4F99968] userTriggerResponseToString:a3];
    int v6 = 136315394;
    int v7 = "-[SMTriggerDestination _onUserTriggerResponse:]";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%s, response %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)postStateChange
{
  id v3 = [(SMTriggerDestination *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SMTriggerDestination_postStateChange__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __39__SMTriggerDestination_postStateChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postStateChange];
}

- (void)_postStateChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [[MEMORY[0x1E4F99968] triggerCategoryToString:-[SMTriggerDestination triggerCategory](self, "triggerCategory")];
    int v10 = 136315394;
    int v11 = "-[SMTriggerDestination _postStateChange]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, trigger category, %@", (uint8_t *)&v10, 0x16u);
  }
  id v5 = [SMTriggerNotification alloc];
  unint64_t v6 = [(SMTriggerDestination *)self triggerCategory];
  int v7 = +[SMDateUtility date];
  __int16 v8 = [(SMTriggerNotification *)v5 initWithTriggerCategory:v6 SOSState:1 triggerName:@"SMTriggerDestination" date:v7 details:MEMORY[0x1E4F1CC08]];

  uint64_t v9 = [(SMTriggerDestination *)self sessionMonitorDelegate];
  [v9 onTriggerNotification:v8];
}

- (void)onLocationNotification:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int v10 = __47__SMTriggerDestination_onLocationNotification___block_invoke;
  int v11 = &unk_1E6B90BF0;
  __int16 v12 = self;
  id v13 = v4;
  id v5 = v4;
  unint64_t v6 = (void *)MEMORY[0x1E016DB00](&v8);
  int v7 = [(SMTriggerDestination *)self queue];
  dispatch_async(v7, v6);
}

uint64_t __47__SMTriggerDestination_onLocationNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processLocationNotification:*(void *)(a1 + 40)];
}

- (void)_processLocationNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[SMTriggerDestination _processLocationNotification:]";
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v7, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v6 = [v4 leechedLocations];
    [(SMTriggerDestination *)self _cacheLocations:v6];
  }
  else
  {
    unint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [notification isKindOfClass:[RTLocationManagerNotificationLocationsLeeched class]]", (uint8_t *)&v7, 2u);
    }
  }
}

- (void)onDataProtectionNotification:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int v10 = __53__SMTriggerDestination_onDataProtectionNotification___block_invoke;
  int v11 = &unk_1E6B90BF0;
  __int16 v12 = self;
  id v13 = v4;
  id v5 = v4;
  unint64_t v6 = (void *)MEMORY[0x1E016DB00](&v8);
  int v7 = [(SMTriggerDestination *)self queue];
  dispatch_async(v7, v6);
}

uint64_t __53__SMTriggerDestination_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processDataProtectionNotification:*(void *)(a1 + 40)];
}

- (void)_processDataProtectionNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 availability];
    unint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = +[RTDataProtectionManager encryptedDataAvailabilityToString:v5];
      int v12 = 136315394;
      id v13 = "-[SMTriggerDestination _processDataProtectionNotification:]";
      __int16 v14 = 2112;
      double v15 = v7;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, Received keybag notification, %@", (uint8_t *)&v12, 0x16u);
    }
    if (v5 == 1)
    {
      uint64_t v8 = +[SMDateUtility date];
      uint64_t v9 = [(SMTriggerDestination *)self triggerState];
      [v9 setLastLockDate:v8];
    }
    else
    {
      if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 2)
      {
LABEL_12:
        [(SMTriggerDestination *)self _persistState];
        goto LABEL_13;
      }
      uint64_t v8 = +[SMDateUtility date];
      uint64_t v9 = [(SMTriggerDestination *)self triggerState];
      [v9 setLastUnlockDate:v8];
    }

    goto LABEL_12;
  }
  int v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = [v4 name];
    int v12 = 136315394;
    id v13 = "-[SMTriggerDestination _processDataProtectionNotification:]";
    __int16 v14 = 2112;
    double v15 = v11;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%s, unknown notification name, %@", (uint8_t *)&v12, 0x16u);
  }
LABEL_13:
}

- (void)_initializeTimerWithIdentifier:(id)a3 fireAfterDelay:(double)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v25 = "-[SMTriggerDestination _initializeTimerWithIdentifier:fireAfterDelay:]";
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2048;
    double v29 = a4;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, timerIdentifier, %@, delay, %.1f", buf, 0x20u);
  }

  objc_initWeak(&location, self);
  uint64_t v8 = +[SMDateUtility date];
  timerManager = self->_timerManager;
  int v10 = [(SMTriggerDestination *)self queue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__SMTriggerDestination__initializeTimerWithIdentifier_fireAfterDelay___block_invoke;
  v19[3] = &unk_1E6B9A160;
  id v11 = v6;
  id v20 = v11;
  id v12 = v8;
  id v21 = v12;
  objc_copyWeak(&v22, &location);
  id v13 = [(RTTimerManager *)timerManager xpcTimerAlarmWithIdentifier:v11 queue:v10 handler:v19];

  __int16 v14 = [(SMTriggerDestination *)self timerIdentifierToTimers];
  [v14 setObject:v13 forKey:v11];

  double v15 = [v12 dateByAddingTimeInterval:a4];
  id v18 = 0;
  [v13 fireWithDate:v15 error:&v18];
  id v16 = v18;

  if (v16)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "-[SMTriggerDestination _initializeTimerWithIdentifier:fireAfterDelay:]";
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%s, error in fire timer, %@", buf, 0x16u);
    }
  }
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

void __70__SMTriggerDestination__initializeTimerWithIdentifier_fireAfterDelay___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = +[SMDateUtility date];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    [v2 timeIntervalSinceDate:*(void *)(a1 + 40)];
    int v7 = 136315650;
    uint64_t v8 = "-[SMTriggerDestination _initializeTimerWithIdentifier:fireAfterDelay:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, timer fired, timerIdentifier, %@, %.2f since created", (uint8_t *)&v7, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _onTimerExpiryForTimerIdentifier:*(void *)(a1 + 32)];
}

- (void)_updateTimerWithIdentifier:(id)a3 fireAfterDelay:(double)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    __int16 v9 = "-[SMTriggerDestination _updateTimerWithIdentifier:fireAfterDelay:]";
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2048;
    double v13 = a4;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, timerIdentifier, %@, delay, %.2f", (uint8_t *)&v8, 0x20u);
  }

  [(SMTriggerDestination *)self _tearDownTimerWithIdentifier:v6];
  [(SMTriggerDestination *)self _initializeTimerWithIdentifier:v6 fireAfterDelay:a4];
}

- (void)_onTimerExpiryForTimerIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (__CFString *)a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315394;
    id v25 = "-[SMTriggerDestination _onTimerExpiryForTimerIdentifier:]";
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, %@", (uint8_t *)&v24, 0x16u);
  }

  if (v4 == @"com.apple.routined.SMTriggerDestination.statusUpdateTimerIdentifier"
    || v4 == @"com.apple.routined.SMTriggerDestination.upperBoundETATimerIdentifier")
  {
    [(SMTriggerDestination *)self destinationStatusUpdateTimeInterval];
    -[SMTriggerDestination _updateTimerWithIdentifier:fireAfterDelay:](self, "_updateTimerWithIdentifier:fireAfterDelay:", @"com.apple.routined.SMTriggerDestination.statusUpdateTimerIdentifier");
    id v17 = +[SMDateUtility date];
    [(SMTriggerDestination *)self destinationStatusUpdateTimeInterval];
    id v18 = [v17 dateByAddingTimeInterval:x0];

    double v19 = [(SMTriggerDestination *)self triggerState];
    [v19 setTimeToUpdateStatus:v18];

    [(SMTriggerDestination *)self _persistState];
    [(SMTriggerDestination *)self _updateInitiatorStatus];
  }
  else
  {
    if (v4 == @"com.apple.routined.SMTriggerDestination.roundTripReminderTimerIdentifier")
    {
      id v6 = [(SMTriggerDestination *)self triggerState];
      int v7 = [v6 lastUnlockDate];
      int v8 = [(SMTriggerDestination *)self triggerState];
      __int16 v9 = [v8 roundTripReminderDate];
      __int16 v10 = [v9 dateByAddingTimeInterval:-5400.0];
      id v11 = [v7 laterDate:v10];

      __int16 v12 = [v11 dateByAddingTimeInterval:5400.0];
      double v13 = [(SMTriggerDestination *)self triggerState];
      uint64_t v14 = [v13 roundTripReminderDate];
      [v14 timeIntervalSinceDate:v12];
      double v16 = v15;

      if (v16 < 0.0)
      {
        id v20 = +[SMDateUtility date];
        [v12 timeIntervalSinceDate:v20];
        double v22 = v21;
        id v23 = [(SMTriggerDestination *)self triggerState];
        [v23 setRoundTripReminderDate:v12];

        [(SMTriggerDestination *)self _persistState];
        [(SMTriggerDestination *)self _updateTimerWithIdentifier:@"com.apple.routined.SMTriggerDestination.roundTripReminderTimerIdentifier" fireAfterDelay:v22];

        goto LABEL_10;
      }
      [(SMTriggerDestination *)self _persistState];
      [(SMTriggerDestination *)self _declareAnomalyForTriggerCategory:9];
      [(SMTriggerDestination *)self _tearDownTimerWithIdentifier:@"com.apple.routined.SMTriggerDestination.statusUpdateTimerIdentifier"];
    }
    [(SMTriggerDestination *)self _tearDownTimerWithIdentifier:v4];
  }
LABEL_10:
}

- (void)_tearDownTimerWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    __int16 v12 = "-[SMTriggerDestination _tearDownTimerWithIdentifier:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, %@", (uint8_t *)&v11, 0x16u);
  }

  id v6 = [(SMTriggerDestination *)self timerIdentifierToTimers];
  int v7 = [v6 objectForKey:v4];

  if (v7)
  {
    int v8 = [(SMTriggerDestination *)self timerIdentifierToTimers];
    __int16 v9 = [v8 objectForKey:v4];
    [v9 invalidate];

    __int16 v10 = [(SMTriggerDestination *)self timerIdentifierToTimers];
    [v10 removeObjectForKey:v4];
  }
}

- (void)_removeTimers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "-[SMTriggerDestination _removeTimers]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(SMTriggerDestination *)self timerIdentifierToTimers];
  uint64_t v5 = [v4 allKeys];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        int v11 = [(SMTriggerDestination *)self timerIdentifierToTimers];
        __int16 v12 = [v11 objectForKeyedSubscript:v10];
        [v12 invalidate];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  __int16 v13 = [(SMTriggerDestination *)self timerIdentifierToTimers];
  [v13 removeAllObjects];

  [(SMTriggerDestination *)self setTimerIdentifierToTimers:0];
}

- (void)_addObservers
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[SMTriggerDestination _addObservers]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [(SMTriggerDestination *)self locationManager];
  uint64_t v5 = +[RTNotification notificationName];
  [v4 addObserver:self selector:sel_onLocationNotification_ name:v5];

  uint64_t v6 = [(SMTriggerDestination *)self dataProtectionManager];
  uint64_t v7 = +[RTNotification notificationName];
  [v6 addObserver:self selector:sel_onDataProtectionNotification_ name:v7];
}

- (void)_removeObservers
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[SMTriggerDestination _removeObservers]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [(SMTriggerDestination *)self locationManager];
  [v4 removeObserver:self];

  uint64_t v5 = [(SMTriggerDestination *)self dataProtectionManager];
  [v5 removeObserver:self];
}

+ (void)mapsExpectedTravelTimeforTransportType:(unint64_t)a3 source:(id)a4 destination:(id)a5 departureDate:(id)a6 queue:(id)a7 handler:(id)a8
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  queue = a7;
  id v15 = a8;
  id v38 = a6;
  long long v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    long long v17 = [v13 coordinateToString];
    id v18 = [v14 coordinateToString];
    double v19 = [(id)objc_opt_class() convertSMDirectionTransportTypeToString:a3];
    *(_DWORD *)buf = 136315906;
    __int16 v55 = "+[SMTriggerDestination mapsExpectedTravelTimeforTransportType:source:destination:departureDate:queue:handler:]";
    __int16 v56 = 2112;
    uint64_t v57 = v17;
    __int16 v58 = 2112;
    double v59 = v18;
    __int16 v60 = 2112;
    v61 = v19;
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%s, source, %@, destination, %@, transportType, %@.", buf, 0x2Au);
  }
  double v39 = objc_alloc_init(RTDefaultsManager);
  id v20 = [(RTDefaultsManager *)v39 objectForKey:@"RTDefaultsSMTriggerDestinationForceCrowFliesKey"];
  int v21 = [v20 BOOLValue];

  if (v21)
  {
    double v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "overriding Maps ETA return -1.0", buf, 2u);
    }

    uint64_t v52 = *MEMORY[0x1E4F28568];
    id v23 = [NSString stringWithFormat:@"Disabled due to defaults"];
    __int16 v53 = v23;
    int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];

    id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
    __int16 v26 = (void *)[v25 initWithDomain:*MEMORY[0x1E4F99A48] code:5 userInfo:v24];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __110__SMTriggerDestination_mapsExpectedTravelTimeforTransportType_source_destination_departureDate_queue_handler___block_invoke;
    block[3] = &unk_1E6B90D08;
    id v50 = v26;
    id v51 = v15;
    id v27 = v26;
    dispatch_async(queue, block);
  }
  uint64_t v28 = objc_opt_new();
  double v29 = (void *)[objc_alloc(MEMORY[0x1E4F30FD0]) initWithLocation:v13 addressDictionary:0 region:0 areasOfInterest:0];
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F30FD0]) initWithLocation:v14 addressDictionary:0 region:0 areasOfInterest:0];
  __int16 v31 = (void *)[objc_alloc(MEMORY[0x1E4F30F08]) initWithPlacemark:v29];
  [v28 setSource:v31];

  id v32 = (void *)[objc_alloc(MEMORY[0x1E4F30F08]) initWithPlacemark:v30];
  [v28 setDestination:v32];

  [v28 setTransportType:[SMTriggerDestination convertSMDirectionTransportTypeToMKDirectionTransportType:a3]];
  [v28 setDepartureDate:v38];

  __int16 v33 = (void *)[objc_alloc(MEMORY[0x1E4F30E78]) initWithRequest:v28];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __110__SMTriggerDestination_mapsExpectedTravelTimeforTransportType_source_destination_departureDate_queue_handler___block_invoke_2;
  v42[3] = &unk_1E6B9B4B8;
  double v43 = queue;
  id v44 = v13;
  id v47 = a1;
  unint64_t v48 = a3;
  id v45 = v14;
  id v46 = v15;
  id v34 = v15;
  id v35 = v14;
  id v36 = v13;
  id v37 = queue;
  [v33 calculateETAWithCompletionHandler:v42];
}

uint64_t __110__SMTriggerDestination_mapsExpectedTravelTimeforTransportType_source_destination_departureDate_queue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), -1.0);
}

void __110__SMTriggerDestination_mapsExpectedTravelTimeforTransportType_source_destination_departureDate_queue_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__SMTriggerDestination_mapsExpectedTravelTimeforTransportType_source_destination_departureDate_queue_handler___block_invoke_3;
  block[3] = &unk_1E6B91950;
  id v14 = v6;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 72);
  id v16 = v8;
  id v17 = v5;
  long long v12 = *(_OWORD *)(a1 + 56);
  id v9 = (id)v12;
  long long v18 = v12;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

uint64_t __110__SMTriggerDestination_mapsExpectedTravelTimeforTransportType_source_destination_departureDate_queue_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) coordinateToString];
      id v6 = [*(id *)(a1 + 48) coordinateToString];
      uint64_t v7 = [(id)objc_opt_class() convertSMDirectionTransportTypeToString:*(void *)(a1 + 80)];
      int v8 = [*(id *)(a1 + 32) code];
      int v16 = 136316162;
      id v17 = "+[SMTriggerDestination mapsExpectedTravelTimeforTransportType:source:destination:departureDate:queue:handler"
            ":]_block_invoke_3";
      __int16 v18 = 2112;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      int v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      __int16 v24 = 1024;
      LODWORD(v25) = v8;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, error in ETA request, source, %@, destination, %@, transportType, %@, error, %d", (uint8_t *)&v16, 0x30u);
    }
    v9.n128_u64[0] = -1.0;
  }
  else
  {
    if (v4)
    {
      [*(id *)(a1 + 56) expectedTravelTime];
      id v11 = v10;
      long long v12 = [*(id *)(a1 + 40) coordinateToString];
      id v13 = [*(id *)(a1 + 48) coordinateToString];
      id v14 = [(id)objc_opt_class() convertSMDirectionTransportTypeToString:*(void *)(a1 + 80)];
      int v16 = 136316162;
      id v17 = "+[SMTriggerDestination mapsExpectedTravelTimeforTransportType:source:destination:departureDate:queue:handler:]_block_invoke";
      __int16 v18 = 2048;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      int v21 = v12;
      __int16 v22 = 2112;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v14;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, expectedTravelTime, %f, source, %@, destination, %@, transport type, %@", (uint8_t *)&v16, 0x34u);
    }
    [*(id *)(a1 + 56) expectedTravelTime];
  }
  return (*(uint64_t (**)(__n128))(*(void *)(a1 + 64) + 16))(v9);
}

- (id)_locationsInDateInterval:(id)a3 horizontalAccuracy:(double)a4 error:(id *)a5
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    *(void *)id v46 = 0;
    id v47 = v46;
    uint64_t v48 = 0x3032000000;
    double v49 = __Block_byref_object_copy__138;
    id v50 = __Block_byref_object_dispose__138;
    id v51 = 0;
    uint64_t v40 = 0;
    double v41 = &v40;
    uint64_t v42 = 0x3032000000;
    double v43 = __Block_byref_object_copy__138;
    id v44 = __Block_byref_object_dispose__138;
    id v45 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    id v35 = (void *)[objc_alloc(MEMORY[0x1E4F5CF40]) initWithDateInterval:v8 horizontalAccuracy:1800 batchSize:0 boundingBoxLocation:a4];
    id v10 = [(SMTriggerDestination *)self locationManager];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __74__SMTriggerDestination__locationsInDateInterval_horizontalAccuracy_error___block_invoke;
    v36[3] = &unk_1E6B905F0;
    id v38 = v46;
    double v39 = &v40;
    id v11 = v9;
    id v37 = v11;
    [v10 fetchStoredLocationsWithOptions:v35 handler:v36];

    long long v12 = v11;
    id v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v12, v14)) {
      goto LABEL_7;
    }
    id v15 = [MEMORY[0x1E4F1C9C8] now];
    [v15 timeIntervalSinceDate:v13];
    double v17 = v16;
    __int16 v18 = objc_opt_new();
    uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_580];
    __int16 v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    int v21 = [v20 filteredArrayUsingPredicate:v19];
    __int16 v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    __int16 v24 = (void *)MEMORY[0x1E4F28C58];
    v59[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v59 count:1];
    uint64_t v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

    if (v26)
    {
      id v27 = v26;

      char v28 = 0;
    }
    else
    {
LABEL_7:
      id v27 = 0;
      char v28 = 1;
    }

    id v29 = v27;
    if ((v28 & 1) == 0) {
      objc_storeStrong((id *)v47 + 5, v27);
    }
    uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = [(id)v41[5] count];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[SMTriggerDestination _locationsInDateInterval:horizontalAccuracy:error:]";
      __int16 v53 = 2112;
      id v54 = v8;
      __int16 v55 = 2048;
      double v56 = a4;
      __int16 v57 = 2048;
      uint64_t v58 = v31;
      _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "%s, dateInterval, %@, horizontalAccuracy, %f, locations, %lu", buf, 0x2Au);
    }

    if (a5) {
      *a5 = *((id *)v47 + 5);
    }
    id v32 = (id)v41[5];

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(v46, 8);
  }
  else
  {
    __int16 v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v46 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", v46, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"dateInterval");
      id v32 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v32 = 0;
    }
  }

  return v32;
}

void __74__SMTriggerDestination__locationsInDateInterval_horizontalAccuracy_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_locationAtDate:(id)a3 error:(id *)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v6 stringFromDate];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMTriggerDestination _locationAtDate:error:]";
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, date, %@", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v50 = __Block_byref_object_copy__138;
    id v51 = __Block_byref_object_dispose__138;
    id v52 = 0;
    uint64_t v40 = 0;
    double v41 = &v40;
    uint64_t v42 = 0x3032000000;
    double v43 = __Block_byref_object_copy__138;
    id v44 = __Block_byref_object_dispose__138;
    id v45 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    id v10 = [(SMTriggerDestination *)self locationManager];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __46__SMTriggerDestination__locationAtDate_error___block_invoke;
    v36[3] = &unk_1E6B93B48;
    id v38 = buf;
    double v39 = &v40;
    id v11 = v9;
    id v37 = v11;
    [v10 fetchEstimatedLocationAtDate:v6 options:0 handler:v36];

    long long v12 = v11;
    id v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v12, v14)) {
      goto LABEL_9;
    }
    id v15 = [MEMORY[0x1E4F1C9C8] now];
    [v15 timeIntervalSinceDate:v13];
    double v17 = v16;
    __int16 v18 = objc_opt_new();
    uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_580];
    __int16 v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    int v21 = [v20 filteredArrayUsingPredicate:v19];
    __int16 v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v46 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v46, 2u);
    }

    __int16 v24 = (void *)MEMORY[0x1E4F28C58];
    v53[0] = *MEMORY[0x1E4F28568];
    *(void *)id v46 = @"semaphore wait timeout";
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v53 count:1];
    uint64_t v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

    if (v26)
    {
      id v27 = v26;

      char v28 = 0;
    }
    else
    {
LABEL_9:
      id v27 = 0;
      char v28 = 1;
    }

    id v29 = v27;
    if ((v28 & 1) == 0) {
      objc_storeStrong((id *)(*(void *)&buf[8] + 40), v27);
    }
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v34 = [v6 stringFromDate];
        uint64_t v35 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)id v46 = 138412546;
        *(void *)&v46[4] = v34;
        __int16 v47 = 2112;
        uint64_t v48 = v35;
        _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Unable to fetch location at date, %@, error, %@", v46, 0x16u);
      }
    }
    if (a4) {
      *a4 = *(id *)(*(void *)&buf[8] + 40);
    }
    id v31 = (id)v41[5];

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"date");
      id v31 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v31 = 0;
    }
  }

  return v31;
}

void __46__SMTriggerDestination__locationAtDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_cacheLocations:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * v7);
        if ([(id)objc_opt_class() validLocation:v8])
        {
          id v9 = [(SMTriggerDestination *)self originLocation];

          if (!v9) {
            [(SMTriggerDestination *)self setOriginLocation:v8];
          }
          [(SMTriggerDestination *)self _evaluateStatusUsingCurrentLocation:v8];
          id v10 = objc_opt_class();
          id v11 = [(SMTriggerDestination *)self sessionConfiguration];
          long long v12 = [v11 destination];
          id v13 = [v12 clLocation];
          dispatch_time_t v14 = [(SMTriggerDestination *)self distanceCalculator];
          [v10 distanceFromLocation:v8 toLocation:v13 withCalculator:v14];
          double v16 = v15;

          double v17 = [[SMLocationEvent alloc] initWithLocation:v8 distance:v16];
          __int16 v18 = [(SMTriggerDestination *)self cachedLocationEvents];
          [v18 addObject:v17];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }
  uint64_t v19 = [(SMTriggerDestination *)self sessionMetricManager];
  __int16 v20 = [(SMTriggerDestination *)self cachedLocationEvents];
  int v21 = [v20 lastObject];
  [v21 distance];
  [v19 cacheMostRecentLocationDistance];
}

- (void)_reviseCachedLocations
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = [(SMTriggerDestination *)self cachedLocationEvents];
  uint64_t v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_189];
  uint64_t v5 = (void *)[v4 mutableCopy];
  [(SMTriggerDestination *)self setCachedLocationEvents:v5];

  uint64_t v6 = [(SMTriggerDestination *)self _cachedLocationsDateInterval];
  uint64_t v7 = [(SMTriggerDestination *)self cachedLocationEvents];
  if ([v7 count])
  {
    id v47 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v45 = [(SMTriggerDestination *)self cachedLocationEvents];
    uint64_t v8 = [v45 firstObject];
    id v9 = [v8 location];
    id v10 = [v9 timestamp];
    id v11 = [(SMTriggerDestination *)self cachedLocationEvents];
    long long v12 = [v11 lastObject];
    id v13 = [v12 location];
    dispatch_time_t v14 = [v13 timestamp];
    uint64_t v48 = (void *)[v47 initWithStartDate:v10 endDate:v14];
  }
  else
  {
    uint64_t v48 = 0;
  }

  while (1)
  {
    double v15 = [(SMTriggerDestination *)self cachedLocationEvents];
    if (![v15 count]) {
      break;
    }
    double v16 = [(SMTriggerDestination *)self cachedLocationEvents];
    double v17 = [v16 firstObject];
    __int16 v18 = [v17 location];
    uint64_t v19 = [v18 timestamp];
    __int16 v20 = [v6 startDate];
    [v19 timeIntervalSinceDate:v20];
    double v22 = v21;

    if (v22 >= 0.0) {
      goto LABEL_9;
    }
    long long v23 = [(SMTriggerDestination *)self cachedLocationEvents];
    [v23 removeObjectAtIndex:0];
  }
LABEL_9:
  while (1)
  {
    long long v24 = [(SMTriggerDestination *)self cachedLocationEvents];
    if (![v24 count]) {
      break;
    }
    long long v25 = [(SMTriggerDestination *)self cachedLocationEvents];
    long long v26 = [v25 lastObject];
    id v27 = [v26 location];
    uint64_t v28 = [v27 timestamp];
    id v29 = [v6 endDate];
    [v28 timeIntervalSinceDate:v29];
    double v31 = v30;

    if (v31 <= 0.0) {
      goto LABEL_13;
    }
    id v32 = [(SMTriggerDestination *)self cachedLocationEvents];
    __int16 v33 = [(SMTriggerDestination *)self cachedLocationEvents];
    [v32 removeObjectAtIndex:[v33 count] - 1];
  }
LABEL_13:
  id v34 = [(SMTriggerDestination *)self cachedLocationEvents];
  if ([v34 count])
  {
    id v44 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v46 = [(SMTriggerDestination *)self cachedLocationEvents];
    uint64_t v35 = [v46 firstObject];
    id v36 = [v35 location];
    id v37 = [v36 timestamp];
    id v38 = [(SMTriggerDestination *)self cachedLocationEvents];
    double v39 = [v38 lastObject];
    uint64_t v40 = [v39 location];
    double v41 = [v40 timestamp];
    uint64_t v42 = (void *)[v44 initWithStartDate:v37 endDate:v41];
  }
  else
  {
    uint64_t v42 = 0;
  }

  double v43 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v50 = "-[SMTriggerDestination _reviseCachedLocations]";
    __int16 v51 = 2112;
    id v52 = v48;
    __int16 v53 = 2112;
    id v54 = v6;
    __int16 v55 = 2112;
    double v56 = v42;
    _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "%s, cachedLocations dateInterval pre-filter, %@, dateInterval of interest, %@, cachedLocations dateInterval post-filter, %@", buf, 0x2Au);
  }
}

uint64_t __46__SMTriggerDestination__reviseCachedLocations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 location];
  uint64_t v6 = [v5 timestamp];
  uint64_t v7 = [v4 location];

  uint64_t v8 = [v7 timestamp];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (void)_evaluateStatusUsingCurrentLocation:(id)a3
{
  id v18 = a3;
  id v4 = [(SMTriggerDestination *)self triggerState];
  uint64_t v5 = [v4 currentStatus];

  if (v5 == 1)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [(SMTriggerDestination *)self originLocation];
    uint64_t v8 = [(SMTriggerDestination *)self distanceCalculator];
    [v6 distanceFromLocation:v7 toLocation:v18 withCalculator:v8];
    double v10 = v9;

    if (v10 != 1.79769313e308)
    {
      [(SMTriggerDestination *)self idleMaxDistanceThreshold];
      double v12 = v11;
      id v13 = [(SMTriggerDestination *)self originLocation];
      [v13 horizontalAccuracy];
      double v15 = v14;

      [v18 horizontalAccuracy];
      if (v15 >= v16) {
        double v16 = v15;
      }
      if (v10 > v12 + v16)
      {
        double v17 = [(SMTriggerDestination *)self triggerState];
        [v17 setCurrentStatus:2];

        [(SMTriggerDestination *)self _persistState];
      }
    }
  }
}

+ (BOOL)validLocation:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 horizontalAccuracy], v5 >= 0.0))
  {
    [v4 horizontalAccuracy];
    BOOL v6 = v7 <= 200.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_isNoProgressStatus
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v3 = +[SMDateUtility date];
  id v4 = [(SMTriggerDestination *)self triggerState];
  uint64_t v5 = [v4 currentStatus];

  if (v5 == 1)
  {
    BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_5:
      BOOL v11 = 0;
      goto LABEL_6;
    }
    double v7 = [(SMTriggerDestination *)self originLocation];
    uint64_t v8 = [(SMTriggerDestination *)self cachedLocationEvents];
    double v9 = [v8 lastObject];
    double v10 = [v9 location];
    *(_DWORD *)buf = 136315650;
    v113 = "-[SMTriggerDestination _isNoProgressStatus]";
    __int16 v114 = 2112;
    double v115 = v7;
    __int16 v116 = 2112;
    uint64_t v117 = (uint64_t)v10;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, NO, has not transitioned from idle status yet, origin location, %@, last location, %@", buf, 0x20u);

LABEL_4:
    goto LABEL_5;
  }
  id v13 = [(SMTriggerDestination *)self cachedLocationEvents];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    double v15 = [(SMTriggerDestination *)self cachedLocationEvents];
    double v16 = [v15 lastObject];
    double v17 = [v16 location];
    id v18 = [v17 timestamp];
    [v3 timeIntervalSinceDate:v18];
    double v20 = v19;
    [(SMTriggerDestination *)self noProgressTimeoutThreshold];
    double v22 = v21;

    if (v20 <= v22)
    {
      double v43 = [(SMTriggerDestination *)self cachedLocationEvents];
      id v44 = [v43 firstObject];
      id v45 = [v44 location];
      id v46 = [v45 timestamp];
      [v3 timeIntervalSinceDate:v46];
      double v48 = v47;

      [(SMTriggerDestination *)self noProgressTimeoutThreshold];
      if (v48 < v49)
      {
        BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          id v50 = [(SMTriggerDestination *)self cachedLocationEvents];
          __int16 v51 = [v50 firstObject];
          id v52 = [v51 location];
          __int16 v53 = [v52 timestamp];
          double v54 = [v53 stringFromDate];
          __int16 v55 = [v3 stringFromDate];
          *(_DWORD *)buf = 136315906;
          v113 = "-[SMTriggerDestination _isNoProgressStatus]";
          __int16 v114 = 2112;
          double v115 = v54;
          __int16 v116 = 2112;
          uint64_t v117 = (uint64_t)v55;
          __int16 v118 = 2048;
          double v119 = v48;
          _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, NO, short length cached locations from, %@, now, %@, timeInterval, %f", buf, 0x2Au);
        }
        goto LABEL_5;
      }
      v61 = [(SMTriggerDestination *)self cachedLocationEvents];
      uint64_t v62 = [v61 lastObject];
      v63 = [v62 location];
      id v64 = [v63 timestamp];
      [(SMTriggerDestination *)self noProgressTimeoutThreshold];
      BOOL v6 = [v64 dateByAddingTimeInterval:-v65];

      v66 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K >= %@", @"location", @"timestamp", v6];
      uint64_t v67 = [(SMTriggerDestination *)self cachedLocationEvents];
      v68 = [v67 filteredArrayUsingPredicate:v66];

      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      v103 = v68;
      v69 = [v68 reverseObjectEnumerator];
      uint64_t v99 = [v69 countByEnumeratingWithState:&v108 objects:v123 count:16];
      if (v99)
      {
        uint64_t v101 = *(void *)v109;
        v95 = v66;
        v96 = v3;
        id obj = v69;
        do
        {
          for (uint64_t i = 0; i != v99; ++i)
          {
            if (*(void *)v109 != v101) {
              objc_enumerationMutation(obj);
            }
            uint64_t v71 = *(void **)(*((void *)&v108 + 1) + 8 * i);
            long long v104 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            long long v107 = 0u;
            id v72 = v103;
            uint64_t v73 = [v72 countByEnumeratingWithState:&v104 objects:v122 count:16];
            if (v73)
            {
              uint64_t v74 = v73;
              uint64_t v75 = *(void *)v105;
LABEL_26:
              uint64_t v76 = 0;
              while (1)
              {
                if (*(void *)v105 != v75) {
                  objc_enumerationMutation(v72);
                }
                double v77 = *(void **)(*((void *)&v104 + 1) + 8 * v76);
                if (v71 == v77) {
                  break;
                }
                __int16 v78 = [v71 location];
                v79 = [v77 location];
                [v78 distanceFromLocation:v79];
                double v81 = v80;
                [v78 horizontalAccuracy];
                double v83 = v82;
                [v79 horizontalAccuracy];
                double v85 = v84;
                [(SMTriggerDestination *)self significantMoveThreshold];
                if (v83 >= v85) {
                  double v87 = v83;
                }
                else {
                  double v87 = v85;
                }
                if (v81 > v86 + v87)
                {
                  v91 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
                  {
                    v92 = [v78 toString];
                    double v93 = [v79 toString];
                    [(SMTriggerDestination *)self significantMoveThreshold];
                    *(_DWORD *)buf = 136316162;
                    v113 = "-[SMTriggerDestination _isNoProgressStatus]";
                    __int16 v114 = 2048;
                    double v115 = v81;
                    __int16 v116 = 2112;
                    uint64_t v117 = (uint64_t)v92;
                    __int16 v118 = 2112;
                    double v119 = v93;
                    __int16 v120 = 2048;
                    uint64_t v121 = v94;
                    _os_log_impl(&dword_1D9BFA000, v91, OS_LOG_TYPE_INFO, "%s, NO, distance, %.2f, location_i, %@, location_j, %@, no progress distance threshold, %.2f", buf, 0x34u);
                  }
                  BOOL v11 = 0;
                  v66 = v95;
                  id v3 = v96;
                  v88 = obj;
                  goto LABEL_43;
                }

                if (v74 == ++v76)
                {
                  uint64_t v74 = [v72 countByEnumeratingWithState:&v104 objects:v122 count:16];
                  if (v74) {
                    goto LABEL_26;
                  }
                  break;
                }
              }
            }
          }
          v69 = obj;
          v66 = v95;
          id v3 = v96;
          uint64_t v99 = [obj countByEnumeratingWithState:&v108 objects:v123 count:16];
        }
        while (v99);
      }

      v88 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      BOOL v11 = 1;
      if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
      {
        v89 = [(SMTriggerDestination *)self cachedLocationEvents];
        *(double *)&uint64_t v90 = COERCE_DOUBLE([v89 count]);
        *(_DWORD *)buf = 136315650;
        v113 = "-[SMTriggerDestination _isNoProgressStatus]";
        __int16 v114 = 2048;
        double v115 = *(double *)&v90;
        __int16 v116 = 2048;
        uint64_t v117 = 0x4069000000000000;
        _os_log_impl(&dword_1D9BFA000, v88, OS_LOG_TYPE_INFO, "%s, YES, no significant change detected for cachedLocations count, %lu, no progress distance threshold, %.2f", buf, 0x20u);
      }
LABEL_43:
    }
    else
    {
      BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      BOOL v11 = 1;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v102 = [(SMTriggerDestination *)self cachedLocationEvents];
        v100 = [v102 lastObject];
        v98 = [v100 location];
        long long v23 = [v98 timestamp];
        double v24 = [v23 stringFromDate];
        long long v25 = [v3 stringFromDate];
        long long v26 = [(SMTriggerDestination *)self cachedLocationEvents];
        id v27 = [v26 lastObject];
        uint64_t v28 = [v27 location];
        id v29 = [v28 timestamp];
        [v3 timeIntervalSinceDate:v29];
        *(_DWORD *)buf = 136315906;
        v113 = "-[SMTriggerDestination _isNoProgressStatus]";
        __int16 v114 = 2112;
        double v115 = v24;
        __int16 v116 = 2112;
        uint64_t v117 = (uint64_t)v25;
        __int16 v118 = 2048;
        double v119 = v30;
        BOOL v11 = 1;
        _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, YES, no locations available from, %@, now, %@, timeInterval, %f", buf, 0x2Au);
      }
    }
  }
  else
  {
    double v31 = [(SMTriggerDestination *)self lastUserResponseSafeDate];
    [v3 timeIntervalSinceDate:v31];
    double v33 = v32;
    [(SMTriggerDestination *)self idleTimeoutThreshold];
    double v35 = v34;
    [(SMTriggerDestination *)self noProgressTimeoutThreshold];
    double v37 = v35 + v36;

    BOOL v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    BOOL v38 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v33 < v37)
    {
      if (!v38) {
        goto LABEL_5;
      }
      double v39 = [(SMTriggerDestination *)self lastUserResponseSafeDate];
      double v7 = [v39 stringFromDate];
      uint64_t v40 = [v3 stringFromDate];
      double v41 = [(SMTriggerDestination *)self lastUserResponseSafeDate];
      [v3 timeIntervalSinceDate:v41];
      *(_DWORD *)buf = 136315906;
      v113 = "-[SMTriggerDestination _isNoProgressStatus]";
      __int16 v114 = 2112;
      double v115 = v7;
      __int16 v116 = 2112;
      uint64_t v117 = (uint64_t)v40;
      __int16 v118 = 2048;
      double v119 = v42;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, NO, empty cached locations, lastUserResponseSafeDate, %@, now, %@, timeInterval, %f", buf, 0x2Au);

      goto LABEL_4;
    }
    if (v38)
    {
      double v56 = [(SMTriggerDestination *)self lastUserResponseSafeDate];
      double v57 = [v56 stringFromDate];
      uint64_t v58 = [v3 stringFromDate];
      double v59 = [(SMTriggerDestination *)self lastUserResponseSafeDate];
      [v3 timeIntervalSinceDate:v59];
      *(_DWORD *)buf = 136315906;
      v113 = "-[SMTriggerDestination _isNoProgressStatus]";
      __int16 v114 = 2112;
      double v115 = v57;
      __int16 v116 = 2112;
      uint64_t v117 = (uint64_t)v58;
      __int16 v118 = 2048;
      double v119 = v60;
      BOOL v11 = 1;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, YES, empty cached locations, lastUserResponseSafeDate, %@, now, %@, timeInterval, %f", buf, 0x2Au);
    }
    else
    {
      BOOL v11 = 1;
    }
  }
LABEL_6:

  return v11;
}

- (BOOL)_shouldChangeModeOfTransportStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v29 = a4;
  double v30 = v6;
  id v36 = 0;
  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v6 endDate:v29];
  double v7 = -[SMTriggerDestination _locationsInDateInterval:horizontalAccuracy:error:](self, "_locationsInDateInterval:horizontalAccuracy:error:", 200.0);
  id v26 = v36;
  id v27 = v7;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [v7 reverseObjectEnumerator];
  uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    double v11 = 1.79769313e308;
    double v12 = 2.22507386e-308;
    double v13 = 2.22507386e-308;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        double v16 = objc_opt_class();
        double v17 = [(SMTriggerDestination *)self sessionConfiguration];
        id v18 = [v17 destination];
        double v19 = [v18 clLocation];
        double v20 = [(SMTriggerDestination *)self distanceCalculator];
        [v16 distanceFromLocation:v15 toLocation:v19 withCalculator:v20];
        double v22 = v21;

        if (v13 < v22) {
          double v13 = v22;
        }
        if (v11 >= v22) {
          double v11 = v22;
        }
        [v15 horizontalAccuracy];
        if (v12 < v23) {
          double v12 = v23;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v45 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 1.79769313e308;
    double v12 = 2.22507386e-308;
    double v13 = 2.22507386e-308;
  }

  double v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    BOOL v38 = "-[SMTriggerDestination _shouldChangeModeOfTransportStartDate:endDate:]";
    __int16 v39 = 1024;
    BOOL v40 = v13 - v11 > v12 + 200.0;
    __int16 v41 = 2048;
    double v42 = v13;
    __int16 v43 = 2048;
    double v44 = v11;
    _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%s, %d, maxDistance, %f, minDistance, %f", buf, 0x26u);
  }

  return v13 - v11 > v12 + 750.0;
}

+ (void)currentLocationWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() locationRequestOptions];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__SMTriggerDestination_currentLocationWithLocationManager_queue_handler___block_invoke;
  v14[3] = &unk_1E6B96E88;
  id v15 = v7;
  id v16 = v10;
  id v17 = v8;
  id v11 = v8;
  id v12 = v10;
  id v13 = v7;
  [v9 fetchCurrentLocationWithOptions:v12 handler:v14];
}

void __73__SMTriggerDestination_currentLocationWithLocationManager_queue_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__SMTriggerDestination_currentLocationWithLocationManager_queue_handler___block_invoke_2;
  v10[3] = &unk_1E6B91490;
  id v7 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  id v14 = *(id *)(a1 + 48);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

uint64_t __73__SMTriggerDestination_currentLocationWithLocationManager_queue_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) toString];
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 136315906;
    id v8 = "+[SMTriggerDestination currentLocationWithLocationManager:queue:handler:]_block_invoke_2";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, options, %@, currentLocation, %@, error, %@", (uint8_t *)&v7, 0x2Au);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (void)calculateDistanceToDestination:(id)a3 locationManager:(id)a4 distanceCalculator:(id)a5 queue:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = objc_opt_class();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __104__SMTriggerDestination_calculateDistanceToDestination_locationManager_distanceCalculator_queue_handler___block_invoke;
  v21[3] = &unk_1E6B9B500;
  id v24 = v14;
  id v25 = a1;
  id v22 = v12;
  id v23 = v13;
  id v18 = v13;
  id v19 = v12;
  id v20 = v14;
  [v17 currentLocationWithLocationManager:v16 queue:v15 handler:v21];
}

void __104__SMTriggerDestination_calculateDistanceToDestination_locationManager_distanceCalculator_queue_handler___block_invoke(void *a1, void *a2, uint64_t a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!v5 || a3)
  {
    uint64_t v10 = a1[6];
    uint64_t v11 = a1[4];
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F99A48];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"current location is unavailable";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v15 = [v12 errorWithDomain:v13 code:17 userInfo:v14];
    (*(void (**)(uint64_t, uint64_t, void *, double))(v10 + 16))(v10, v11, v15, 1.79769313e308);
  }
  else
  {
    [(id)objc_opt_class() distanceFromLocation:v5 toLocation:a1[4] withCalculator:a1[5]];
    double v7 = v6;
    id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (v7 == 1.79769313e308)
      {
        __int16 v9 = @"YES";
      }
      else
      {
        [NSString stringWithFormat:@"%.3f", *(void *)&v7];
        __int16 v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 136315394;
      id v17 = "+[SMTriggerDestination calculateDistanceToDestination:locationManager:distanceCalculator:queue:handler:]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, distance, %@", buf, 0x16u);
      if (v7 != 1.79769313e308) {
    }
      }
    (*(void (**)(double))(a1[6] + 16))(v7);
  }
}

- (void)_updateInitiatorStatus
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[SMTriggerDestination _updateInitiatorStatus]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v9, 0xCu);
  }

  id v4 = [(SMTriggerDestination *)self sessionConfiguration];
  uint64_t v5 = [v4 sessionType];

  if (v5 == 2)
  {
    [(SMTriggerDestination *)self _updateInitiatorStatusDestinationBoundWithCompletion:&__block_literal_global_212];
  }
  else
  {
    double v6 = [(SMTriggerDestination *)self sessionConfiguration];
    uint64_t v7 = [v6 sessionType];

    if (v7 == 3)
    {
      [(SMTriggerDestination *)self _updateInitiatorStatusRoundTrip];
    }
    else
    {
      id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315138;
        uint64_t v10 = "-[SMTriggerDestination _updateInitiatorStatus]";
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%s, Invalid session type", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

void __46__SMTriggerDestination__updateInitiatorStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SMTriggerDestination _updateInitiatorStatus]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, finished updating initiator status for destination, error, %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_updateInitiatorStatusRoundTrip
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SMTriggerDestination *)self sessionConfiguration];
  uint64_t v4 = [v3 sessionType];

  if (v4 != 3)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315394;
      double v21 = "-[SMTriggerDestination _updateInitiatorStatusRoundTrip]";
      __int16 v22 = 1024;
      LODWORD(v23) = 1271;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.sessionConfiguration.sessionType == SMSessionTypeRoundTrip (in %s:%d)", (uint8_t *)&v20, 0x12u);
    }
  }
  __int16 v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (void *)MEMORY[0x1E4F999D0];
    uint64_t v8 = [(SMTriggerDestination *)self triggerState];
    int v9 = [v7 statusToString:[v8 currentStatus]];
    int v20 = 136315394;
    double v21 = "-[SMTriggerDestination _updateInitiatorStatusRoundTrip]";
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, initiator current status, %@", (uint8_t *)&v20, 0x16u);
  }
  uint64_t v10 = [(SMTriggerDestination *)self triggerState];
  uint64_t v11 = [v10 currentStatus];

  if (v11 != 3)
  {
    if (v11 == 2)
    {
      id v12 = +[SMDateUtility date];
      uint64_t v13 = [(SMTriggerDestination *)self triggerState];
      id v14 = [v13 roundTripReminderDate];
      [v12 timeIntervalSinceDate:v14];
      double v16 = v15;

      if (v16 > 0.0) {
        [(SMTriggerDestination *)self _declareAnomalyForTriggerCategory:9];
      }
    }
    else
    {
      id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v17 = (void *)MEMORY[0x1E4F999D0];
        __int16 v18 = [(SMTriggerDestination *)self triggerState];
        id v19 = [v17 statusToString:[v18 currentStatus]];
        int v20 = 136315394;
        double v21 = "-[SMTriggerDestination _updateInitiatorStatusRoundTrip]";
        __int16 v22 = 2112;
        id v23 = v19;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%s, Invalid status, %@", (uint8_t *)&v20, 0x16u);
      }
    }
  }
}

- (void)_updateInitiatorStatusDestinationBoundWithCompletion:(id)a3
{
  v98[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  uint64_t v5 = [(SMTriggerDestination *)self sessionConfiguration];
  uint64_t v6 = [v5 sessionType];

  if (v6 != 2)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMTriggerDestination _updateInitiatorStatusDestinationBoundWithCompletion:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1305;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.sessionConfiguration.sessionType == SMSessionTypeDestinationBound (in %s:%d)", buf, 0x12u);
    }
  }
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  int v9 = [(SMTriggerDestination *)self triggerState];
  uint64_t v10 = [v9 currentStatusDate];
  [v8 timeIntervalSinceDate:v10];
  double v12 = v11;

  uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = (void *)MEMORY[0x1E4F999D0];
    double v15 = [(SMTriggerDestination *)self triggerState];
    double v16 = [v14 statusToString:[v15 currentStatus]];
    id v17 = [(SMTriggerDestination *)self sessionConfiguration];
    __int16 v18 = [v17 description];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[SMTriggerDestination _updateInitiatorStatusDestinationBoundWithCompletion:]";
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    v95 = v18;
    LOWORD(v96) = 2048;
    *(double *)((char *)&v96 + 2) = v12;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, current status, %@, session configuration, %@, durationSinceLastStatusChange, %.2f", buf, 0x2Au);
  }
  id v19 = [(SMTriggerDestination *)self triggerState];
  if ([v19 currentStatus] == 1)
  {
    [(SMTriggerDestination *)self idleTimeoutThreshold];
    BOOL v21 = v12 > v20;

    if (v21)
    {
      __int16 v22 = [(SMTriggerDestination *)self triggerState];
      [v22 setCurrentStatus:2];

      [(SMTriggerDestination *)self _persistState];
    }
  }
  else
  {
  }
  [(SMTriggerDestination *)self _reviseCachedLocations];
  id v23 = [(SMTriggerDestination *)self triggerState];
  BOOL v24 = [v23 currentStatus] == 1;

  if (v24)
  {
    id v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[SMTriggerDestination _updateInitiatorStatusDestinationBoundWithCompletion:]";
      _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%s, delaying trigger monitoring until transition to progress state", buf, 0xCu);
    }

    v4[2](v4, 0);
  }
  else
  {
    BOOL v26 = [(SMTriggerDestination *)self _isNoProgressStatus];
    id v27 = [(SMTriggerDestination *)self triggerState];
    if ([v27 currentStatus] == 3) {
      BOOL v26 = 0;
    }

    if (v26) {
      [(SMTriggerDestination *)self _declareAnomalyForTriggerCategory:3];
    }
    uint64_t v28 = [(SMTriggerDestination *)self cachedLocationEvents];
    BOOL v29 = [v28 count] == 0;

    if (v29)
    {
      id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v97 = *MEMORY[0x1E4F28568];
      BOOL v40 = [NSString stringWithFormat:@"%s cannot be completed due to no cached locations", "-[SMTriggerDestination _updateInitiatorStatusDestinationBoundWithCompletion:]"];
      v98[0] = v40;
      __int16 v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:&v97 count:1];
      double v42 = (void *)[v39 initWithDomain:*MEMORY[0x1E4F99A48] code:6 userInfo:v41];

      ((void (**)(id, void *))v4)[2](v4, v42);
    }
    else
    {
      double v30 = +[SMDateUtility date];
      double v31 = [v30 dateByAddingTimeInterval:-300.0];
      long long v32 = [(SMTriggerDestination *)self cachedLocationEvents];
      long long v33 = [v32 lastObject];
      v68 = [v33 location];

      long long v34 = [(SMTriggerDestination *)self cachedLocationEvents];
      uint64_t v35 = [v34 lastObject];
      [(id)v35 distance];
      double v37 = v36;

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v95 = __Block_byref_object_copy__138;
      *(void *)&long long v96 = __Block_byref_object_dispose__138;
      *((void *)&v96 + 1) = 0;
      v88[0] = 0;
      v88[1] = v88;
      v88[2] = 0x3032000000;
      v88[3] = __Block_byref_object_copy__138;
      v88[4] = __Block_byref_object_dispose__138;
      id v89 = 0;
      v87[0] = 0;
      v87[1] = v87;
      v87[2] = 0x2020000000;
      v87[3] = 0xBFF0000000000000;
      v86[0] = 0;
      v86[1] = v86;
      v86[2] = 0x2020000000;
      v86[3] = 0xBFF0000000000000;
      BOOL v38 = [(SMTriggerDestination *)self triggerState];
      LOBYTE(v35) = [v38 predominantModeOfTransport] == 4;

      if (v35)
      {
        id v61 = 0;
        unint64_t v65 = 4;
      }
      else
      {
        id v85 = 0;
        unint64_t v43 = [(SMTriggerDestination *)self _predominantMotionActicityTypeFromStartDate:v31 toEndDate:v30 outError:&v85];
        id v61 = v85;
        unint64_t v65 = [(SMTriggerDestination *)self _motionActivityTypeToTransportType:v43 distance:v37];
      }
      double v44 = [(SMTriggerDestination *)self triggerState];
      BOOL v45 = [v44 predominantModeOfTransport] == 0xFFFFFFF;

      if (v45)
      {
        uint64_t v46 = [(SMTriggerDestination *)self triggerState];
        [v46 setPredominantModeOfTransport:v65];

        [(SMTriggerDestination *)self _persistState];
        double v47 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          double v48 = objc_opt_class();
          double v49 = [(SMTriggerDestination *)self triggerState];
          id v50 = [v48 convertSMDirectionTransportTypeToString:[v49 predominantModeOfTransport]];
          *(_DWORD *)uint64_t v90 = 136315394;
          v91 = "-[SMTriggerDestination _updateInitiatorStatusDestinationBoundWithCompletion:]";
          __int16 v92 = 2112;
          double v93 = v50;
          _os_log_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_INFO, "%s, predominantModeOfTransport, %@", v90, 0x16u);
        }
      }
      id v64 = dispatch_group_create();
      dispatch_group_enter(v64);
      v63 = objc_opt_class();
      __int16 v51 = [(SMTriggerDestination *)self triggerState];
      uint64_t v62 = [v51 predominantModeOfTransport];
      v66 = [(SMTriggerDestination *)self defaultsManager];
      uint64_t v67 = [(SMTriggerDestination *)self sessionConfiguration];
      id v52 = [v67 destination];
      __int16 v53 = [v52 clLocation];
      double v54 = [(SMTriggerDestination *)self distanceCalculator];
      __int16 v55 = [(SMTriggerDestination *)self queue];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke;
      v79[3] = &unk_1E6B9B528;
      double v81 = v87;
      v79[4] = self;
      double v82 = v86;
      double v83 = buf;
      double v84 = v88;
      double v80 = v64;
      double v56 = v51;
      double v57 = v80;
      [v63 expectedTravelTimeforTransportType:v62 source:v68 defaultsManager:v66 destination:v53 departureDate:v30 distanceCalculator:v54 queue:v55 completionHandler:v79];

      uint64_t v58 = [(SMTriggerDestination *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke_220;
      block[3] = &unk_1E6B9B5A0;
      uint64_t v73 = v88;
      void block[4] = self;
      double v77 = v37;
      id v71 = v30;
      id v72 = v4;
      uint64_t v74 = v87;
      unint64_t v78 = v65;
      id v70 = v68;
      uint64_t v75 = v86;
      uint64_t v76 = buf;
      id v59 = v30;
      id v60 = v68;
      dispatch_group_notify(v57, v58, block);

      _Block_object_dispose(v86, 8);
      _Block_object_dispose(v87, 8);
      _Block_object_dispose(v88, 8);

      _Block_object_dispose(buf, 8);
    }
  }
}

void __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a4;
  double v11 = [*(id *)(a1 + 32) platform];
  if ([v11 internalInstall])
  {
    double v12 = [*(id *)(a1 + 32) defaultsManager];
    uint64_t v13 = [v12 objectForKey:@"RTDefaultsSMTriggerDestinationMuteMapsExpectedEtaKey"];

    if (v13)
    {
      id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315138;
        __int16 v22 = "-[SMTriggerDestination _updateInitiatorStatusDestinationBoundWithCompletion:]_block_invoke";
        _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, muting maps expected travel time with user defaults", (uint8_t *)&v21, 0xCu);
      }

      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0xBFF0000000000000;
    }
  }
  else
  {
  }
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a5;
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  double v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
  id v17 = v9;

  uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v10;
  id v20 = v10;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke_220(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v46 = 0;
    double v47 = &v46;
    uint64_t v48 = 0x2020000000;
    char v49 = 0;
    char v49 = [*(id *)(a1 + 32) _shouldUpdateUpperBoundEtaWithRemainingDistance:*(double *)(a1 + 96) mapsExpectedTravelTime:*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    uint64_t v3 = [*(id *)(a1 + 32) sessionMetricManager];
    [v3 onCrowFliesETAUpdate:*(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];

    uint64_t v4 = [*(id *)(a1 + 32) sessionMetricManager];
    [v4 onMapsETAUpdate:*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];

    if (!*((unsigned char *)v47 + 24))
    {
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = [v5 triggerState];
      id v7 = [v6 upperBoundEta];
      LODWORD(v5) = [v5 _isExceedingUpperBoundEta:v7 mapsExpectedTravelTime:*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) crowFliesExpectedTravelTime:*(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];

      if (v5) {
        [*(id *)(a1 + 32) _declareAnomalyForTriggerCategory:4];
      }
    }
    uint64_t v8 = dispatch_group_create();
    uint64_t v42 = 0;
    unint64_t v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 0;
    dispatch_group_enter(v8);
    id v9 = [*(id *)(a1 + 32) triggerState];
    id v10 = [v9 upperBoundEta];
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 104);
      double v12 = [*(id *)(a1 + 32) triggerState];
      uint64_t v13 = [v12 predominantModeOfTransport];

      if (v11 != v13)
      {
        *((unsigned char *)v43 + 24) = 1;
        id v27 = objc_opt_class();
        uint64_t v25 = *(void *)(a1 + 40);
        uint64_t v26 = *(void *)(a1 + 104);
        id v14 = [*(id *)(a1 + 32) defaultsManager];
        uint64_t v15 = [*(id *)(a1 + 32) sessionConfiguration];
        double v16 = [v15 destination];
        id v17 = [v16 clLocation];
        uint64_t v18 = *(void *)(a1 + 48);
        id v19 = [*(id *)(a1 + 32) distanceCalculator];
        id v20 = [*(id *)(a1 + 32) queue];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke_2;
        v37[3] = &unk_1E6B9B550;
        long long v39 = *(_OWORD *)(a1 + 72);
        uint64_t v21 = *(void *)(a1 + 64);
        uint64_t v40 = *(void *)(a1 + 88);
        uint64_t v41 = v21;
        BOOL v38 = v8;
        [v27 expectedTravelTimeforTransportType:v26 source:v25 defaultsManager:v14 destination:v17 departureDate:v18 distanceCalculator:v19 queue:v20 completionHandler:v37];

LABEL_13:
        __int16 v22 = [*(id *)(a1 + 32) queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke_3;
        block[3] = &unk_1E6B9B578;
        uint64_t v23 = *(void *)(a1 + 64);
        uint64_t v24 = *(void *)(a1 + 32);
        double v31 = &v42;
        uint64_t v32 = v23;
        void block[4] = v24;
        uint64_t v35 = *(void *)(a1 + 104);
        long long v33 = &v46;
        id v29 = *(id *)(a1 + 48);
        long long v34 = *(_OWORD *)(a1 + 72);
        uint64_t v36 = *(void *)(a1 + 96);
        id v30 = *(id *)(a1 + 56);
        dispatch_group_notify(v8, v22, block);

        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v46, 8);
        return;
      }
    }
    else
    {
    }
    dispatch_group_leave(v8);
    goto LABEL_13;
  }
  [*(id *)(a1 + 32) _declareAnomalyForTriggerCategory:0];
  id v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);

  v2();
}

void __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  id v9 = a2;
  id v10 = a3;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a5;
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  double v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;
  id v16 = v9;

  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v10;
  id v15 = v10;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
      [*(id *)(a1 + 32) _declareAnomalyForTriggerCategory:0];
    }
    uint64_t v2 = *(void *)(a1 + 96);
    uint64_t v3 = [*(id *)(a1 + 32) triggerState];
    [v3 setPredominantModeOfTransport:v2];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) defaultsManager];
    double v7 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    double v8 = *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    [*(id *)(a1 + 32) etaScaleFactor];
    id v10 = [v4 upperBoundEtaForDepartureDate:v5 defaultsManager:v6 mapsExpectedTravelTime:v7 crowFliesExpectedTravelTime:v8 etaScaleFactor:v9];

    uint64_t v11 = [*(id *)(a1 + 32) triggerState];
    [v11 setUpperBoundEta:v10];

    double v12 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v13 = [*(id *)(a1 + 32) triggerState];
    [v13 setMapsExpectedTravelTime:v12];

    double v14 = *(double *)(a1 + 104);
    id v15 = [*(id *)(a1 + 32) triggerState];
    [v15 setRemainingDistance:v14];

    [*(id *)(a1 + 32) _initializeETATimer];
  }
  [*(id *)(a1 + 32) _updateCoarseEtaWithMapsExpectedTravelTime:*(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) crowFliesExpectedTravelTime:*(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];
  [*(id *)(a1 + 32) _persistState];
  id v16 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v16();
}

- (void)_persistState
{
  v46[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SMTriggerDestination *)self triggerState];
  int v4 = [v3 dirty];

  if (v4)
  {
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x3032000000;
    double v37 = __Block_byref_object_copy__138;
    BOOL v38 = __Block_byref_object_dispose__138;
    id v39 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v6 = [(SMTriggerDestination *)self sessionStore];
    double v7 = [(SMTriggerDestination *)self triggerState];
    char v45 = v7;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __37__SMTriggerDestination__persistState__block_invoke;
    v31[3] = &unk_1E6B90728;
    long long v33 = &v34;
    double v9 = v5;
    uint64_t v32 = v9;
    [v6 storeTriggerDestinationStates:v8 handler:v31];

    id v10 = (id *)(v35 + 5);
    id v11 = (id)v35[5];
    double v12 = v9;
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v12, v14))
    {
      id v30 = [MEMORY[0x1E4F1C9C8] now];
      [v30 timeIntervalSinceDate:v13];
      double v16 = v15;
      id v17 = objc_opt_new();
      uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_580];
      id v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v20 = [v19 filteredArrayUsingPredicate:v18];
      uint64_t v21 = [v20 firstObject];

      [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
      __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      v46[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v46 count:1];
      uint64_t v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

      if (v25)
      {
        id v11 = v25;
      }
    }

    objc_storeStrong(v10, v11);
    uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = [(SMTriggerDestination *)self triggerState];
      uint64_t v28 = v35[5];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[SMTriggerDestination _persistState]";
      __int16 v41 = 2112;
      uint64_t v42 = v27;
      __int16 v43 = 2112;
      uint64_t v44 = v28;
      _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%s, persisted state, %@, error, %@", buf, 0x20u);
    }
    id v29 = [(SMTriggerDestination *)self triggerState];
    [v29 setDirty:0];

    _Block_object_dispose(&v34, 8);
  }
}

void __37__SMTriggerDestination__persistState__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_shouldUpdateUpperBoundEtaWithRemainingDistance:(double)a3 mapsExpectedTravelTime:(double)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (a3 == 1.79769313e308)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    dispatch_semaphore_t v5 = (SMSessionTriggerDestinationETAUpdateState *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v44) = 0;
      uint64_t v6 = "Invalid parameter not satisfying: remainingDistance != DBL_MAX";
LABEL_7:
      _os_log_error_impl(&dword_1D9BFA000, &v5->super, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v44, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (a3 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    dispatch_semaphore_t v5 = (SMSessionTriggerDestinationETAUpdateState *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v44) = 0;
      uint64_t v6 = "Invalid parameter not satisfying: remainingDistance >= 0.0";
      goto LABEL_7;
    }
LABEL_15:
    LOBYTE(v26) = 0;
    goto LABEL_16;
  }
  double v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [(SMTriggerDestination *)self triggerState];
    [v10 remainingDistance];
    double v12 = v11;
    uint64_t v13 = [(SMTriggerDestination *)self triggerState];
    [v13 mapsExpectedTravelTime];
    int v44 = 136316162;
    char v45 = "-[SMTriggerDestination _shouldUpdateUpperBoundEtaWithRemainingDistance:mapsExpectedTravelTime:]";
    __int16 v46 = 2048;
    double v47 = v12;
    __int16 v48 = 2048;
    double v49 = a3;
    __int16 v50 = 2048;
    __int16 v51 = v14;
    __int16 v52 = 2048;
    double v53 = a4;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, previous remainingDistance, %.1f, current remainingDistance, %.1f, previous mapsTravelTime, %.1f, current mapsTravelTime, %.1f", (uint8_t *)&v44, 0x34u);
  }
  double v15 = [(SMTriggerDestination *)self triggerState];
  double v16 = [v15 upperBoundEta];

  if (v16)
  {
    id v17 = [(SMTriggerDestination *)self sessionConfiguration];
    uint64_t v18 = [v17 destination];
    uint64_t v19 = [v18 eta];
    if (v19)
    {
      id v20 = (void *)v19;
      uint64_t v21 = [(SMTriggerDestination *)self sessionConfiguration];
      __int16 v22 = [v21 destination];
      uint64_t v23 = [v22 eta];
      [v23 additionalTravelTime];
      double v25 = v24;

      if (v25 > 0.0)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        dispatch_semaphore_t v5 = (SMSessionTriggerDestinationETAUpdateState *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_INFO))
        {
          int v44 = 136315138;
          char v45 = "-[SMTriggerDestination _shouldUpdateUpperBoundEtaWithRemainingDistance:mapsExpectedTravelTime:]";
          _os_log_impl(&dword_1D9BFA000, &v5->super, OS_LOG_TYPE_INFO, "%s, NO, user has specified the ETA.", (uint8_t *)&v44, 0xCu);
        }
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v28 = [(SMTriggerDestination *)self triggerState];
    [v28 remainingDistance];
    double v30 = v29 - a3;

    double v31 = [(SMTriggerDestination *)self triggerState];
    [v31 mapsExpectedTravelTime];
    double v33 = v32 - a4;

    if (a4 <= 0.0)
    {
      BOOL v36 = 0;
    }
    else
    {
      uint64_t v34 = [(SMTriggerDestination *)self triggerState];
      [v34 mapsExpectedTravelTime];
      BOOL v36 = v33 > 300.0 && v35 > 0.0;
    }
    [(SMTriggerDestination *)self minDistanceUpdateThreshold];
    unsigned int v38 = v30 > 200.0 || v36;
    if (v37 < a3) {
      uint64_t v26 = v38;
    }
    else {
      uint64_t v26 = 1;
    }
    id v39 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      uint64_t v40 = @"NO";
      if (v26) {
        __int16 v41 = @"YES";
      }
      else {
        __int16 v41 = @"NO";
      }
      int v44 = 136316162;
      char v45 = "-[SMTriggerDestination _shouldUpdateUpperBoundEtaWithRemainingDistance:mapsExpectedTravelTime:]";
      __int16 v46 = 2112;
      double v47 = v41;
      if (v30 <= 200.0) {
        uint64_t v42 = @"NO";
      }
      else {
        uint64_t v42 = @"YES";
      }
      __int16 v48 = 2112;
      double v49 = *(double *)&v42;
      if (v36) {
        uint64_t v40 = @"YES";
      }
      __int16 v50 = 2112;
      __int16 v51 = v40;
      __int16 v52 = 2048;
      double v53 = a3;
      _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "%s, shouldUpdateETA, %@, distance shorter, %@, ETA shorter, %@, remainingDistance, %.2f.", (uint8_t *)&v44, 0x34u);
    }

    dispatch_semaphore_t v5 = [[SMSessionTriggerDestinationETAUpdateState alloc] initWithDistanceRemaining:v36 distanceDifference:v30 > 200.0 nominalTravelTimeRemaining:v26 nominalTravelTimeDifference:a3 nominalTravelTimeShorter:v30 remainingDistanceShorter:a4 shouldUpdateETAUpperBound:v33];
    __int16 v43 = [(SMTriggerDestination *)self sessionMetricManager];
    [v43 onShouldUpdateETAUpperBoundWithETAUpdateState:v5];
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    dispatch_semaphore_t v5 = (SMSessionTriggerDestinationETAUpdateState *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = 1;
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_INFO))
    {
      int v44 = 136315138;
      char v45 = "-[SMTriggerDestination _shouldUpdateUpperBoundEtaWithRemainingDistance:mapsExpectedTravelTime:]";
      _os_log_impl(&dword_1D9BFA000, &v5->super, OS_LOG_TYPE_INFO, "%s, YES, threshold has not set yet.", (uint8_t *)&v44, 0xCu);
    }
  }
LABEL_16:

  return v26;
}

- (BOOL)_isExceedingUpperBoundEta:(id)a3 mapsExpectedTravelTime:(double)a4 crowFliesExpectedTravelTime:(double)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = [v8 crowFliesUpperBoundEta];

  if (v9)
  {
    id v10 = +[SMDateUtility date];
    id v11 = [v8 mapsUpperBoundEta];

    if (a4 > 0.0 && v11)
    {
      double v12 = [v10 dateByAddingTimeInterval:a4];
      uint64_t v13 = [v8 mapsUpperBoundEta];
      [v12 timeIntervalSinceDate:v13];
      double v15 = v14;
      BOOL v16 = v14 > 0.0;

      id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [v8 mapsUpperBoundEta];
        uint64_t v19 = [v18 stringFromDate];
        uint64_t v20 = [v12 stringFromDate];
        uint64_t v21 = (void *)v20;
        __int16 v22 = @"NO";
        int v32 = 136316162;
        double v33 = "-[SMTriggerDestination _isExceedingUpperBoundEta:mapsExpectedTravelTime:crowFliesExpectedTravelTime:]";
        __int16 v36 = 2048;
        __int16 v34 = 2112;
        double v35 = v19;
        if (v15 > 0.0) {
          __int16 v22 = @"YES";
        }
        double v37 = a4;
        __int16 v38 = 2112;
        uint64_t v39 = v20;
        __int16 v40 = 2112;
        __int16 v41 = v22;
        uint64_t v23 = "%s, maps upper bound ETA, %@, mapsExpectedTravelTime, %f, newETA, %@, isExceedingUpperBoundEta, %@";
LABEL_15:
        _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, v23, (uint8_t *)&v32, 0x34u);
      }
    }
    else
    {
      double v12 = [v10 dateByAddingTimeInterval:a5];
      double v24 = [v8 crowFliesUpperBoundEta];
      [v12 timeIntervalSinceDate:v24];
      double v26 = v25;
      BOOL v16 = v25 > 0.0;

      id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [v8 crowFliesUpperBoundEta];
        uint64_t v19 = [v18 stringFromDate];
        uint64_t v27 = [v12 stringFromDate];
        uint64_t v21 = (void *)v27;
        uint64_t v28 = @"NO";
        int v32 = 136316162;
        double v33 = "-[SMTriggerDestination _isExceedingUpperBoundEta:mapsExpectedTravelTime:crowFliesExpectedTravelTime:]";
        __int16 v36 = 2048;
        __int16 v34 = 2112;
        double v35 = v19;
        if (v26 > 0.0) {
          uint64_t v28 = @"YES";
        }
        double v37 = a5;
        __int16 v38 = 2112;
        uint64_t v39 = v27;
        __int16 v40 = 2112;
        __int16 v41 = v28;
        uint64_t v23 = "%s, crow flies upper bound ETA, %@, crowFliesExpectedTravelTime, %f, newETA, %@, isExceedingUpperBoundEta, %@";
        goto LABEL_15;
      }
    }

    double v29 = [(SMTriggerDestination *)self sessionMetricManager];
    double v30 = [v8 mapsUpperBoundEta];
    [v12 timeIntervalSinceDate:v30];
    [v29 updateClosestTimeIntervalToExceedingETAWithTimeInterval:];

    goto LABEL_17;
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v32 = 136315138;
    double v33 = "-[SMTriggerDestination _isExceedingUpperBoundEta:mapsExpectedTravelTime:crowFliesExpectedTravelTime:]";
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%s, No initial upper bound ETA to compare with.", (uint8_t *)&v32, 0xCu);
  }
  BOOL v16 = 1;
LABEL_17:

  return v16;
}

+ (id)upperBoundEtaForDepartureDate:(id)a3 defaultsManager:(id)a4 mapsExpectedTravelTime:(double)a5 crowFliesExpectedTravelTime:(double)a6 etaScaleFactor:(double)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = [v12 objectForKey:@"RTDefaultsSMTriggerDestinationMinExpectedTravelDurationThresholdKey" value:&unk_1F3453E38];
  [v13 doubleValue];
  double v15 = v14;

  if (v15 != 900.0)
  {
    BOOL v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v29 = 136316162;
      double v30 = "+[SMTriggerDestination upperBoundEtaForDepartureDate:defaultsManager:mapsExpectedTravelTime:crowFliesExpecte"
            "dTravelTime:etaScaleFactor:]";
      __int16 v31 = 2080;
      int v32 = "overriding min expected travel duration threshold";
      __int16 v33 = 2048;
      double v34 = 900.0;
      __int16 v35 = 2048;
      double v36 = v15;
      __int16 v37 = 2112;
      __int16 v38 = @"RTDefaultsSMTriggerDestinationMinExpectedTravelDurationThresholdKey";
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v29, 0x34u);
    }
  }
  id v17 = [v12 objectForKey:@"RTDefaultsSMTriggerDestinationMaxExceedTravelDurationThresholdKey" value:&unk_1F3453E58];
  [v17 doubleValue];
  double v19 = v18;

  if (v19 != 7200.0)
  {
    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v29 = 136316162;
      double v30 = "+[SMTriggerDestination upperBoundEtaForDepartureDate:defaultsManager:mapsExpectedTravelTime:crowFliesExpecte"
            "dTravelTime:etaScaleFactor:]";
      __int16 v31 = 2080;
      int v32 = "overriding max exceed travel duration threshold";
      __int16 v33 = 2048;
      double v34 = 7200.0;
      __int16 v35 = 2048;
      double v36 = v19;
      __int16 v37 = 2112;
      __int16 v38 = @"RTDefaultsSMTriggerDestinationMaxExceedTravelDurationThresholdKey";
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v29, 0x34u);
    }
  }
  if (a5 <= 0.0)
  {
    __int16 v22 = 0;
  }
  else
  {
    double v21 = a5 * a7;
    if (a5 * a7 < v15) {
      double v21 = v15;
    }
    if (v21 >= v19 + a5) {
      double v21 = v19 + a5;
    }
    __int16 v22 = [v11 dateByAddingTimeInterval:v21];
  }
  double v23 = a6 * a7;
  if (a6 * a7 < v15) {
    double v23 = v15;
  }
  if (v23 >= v19 + a6) {
    double v23 = v19 + a6;
  }
  double v24 = [v11 dateByAddingTimeInterval:v23];
  double v25 = (void *)[objc_alloc(MEMORY[0x1E4F999D8]) initWithMapsUpperBoundEta:v22 crowFliesUpperBoundEta:v24];
  double v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = [v11 stringFromDate];
    int v29 = 136316418;
    double v30 = "+[SMTriggerDestination upperBoundEtaForDepartureDate:defaultsManager:mapsExpectedTravelTime:crowFliesExpectedT"
          "ravelTime:etaScaleFactor:]";
    __int16 v31 = 2112;
    int v32 = v27;
    __int16 v33 = 2048;
    double v34 = a5;
    __int16 v35 = 2048;
    double v36 = a6;
    __int16 v37 = 2048;
    __int16 v38 = *(__CFString **)&a7;
    __int16 v39 = 2112;
    __int16 v40 = v25;
    _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%s, departureDate, %@, mapsExpectedTravelTime, %.2f, crowFliesExpectedTravelTime, %.2f, etaScaleFactor, %.2f, upperBoundETA, %@", (uint8_t *)&v29, 0x3Eu);
  }

  return v25;
}

+ (double)crowFliesExpectedTravelTimeForTransportType:(unint64_t)a3 defaultsManager:(id)a4 distance:(double)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  +[SMTriggerDestination updateSMTriggerDestinationTransportTypeToAvgSpeedWithDefaultsManager:a4];
  double v7 = (void *)SMTriggerDestinationTransportTypeToAvgSpeed;
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v9 = [v7 objectForKey:v8];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = (void *)SMTriggerDestinationTransportTypeToAvgSpeed;
    id v12 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];
    [v13 doubleValue];
    double v15 = v14;

    if (v15 != 0.0)
    {
      BOOL v16 = (void *)SMTriggerDestinationTransportTypeToAvgSpeed;
      id v17 = [NSNumber numberWithUnsignedInteger:a3];
      double v18 = [v16 objectForKeyedSubscript:v17];
      [v18 doubleValue];
      double v20 = a5 / v19;

      return v20;
    }
  }
  else
  {
  }
  double v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v23 = 136315394;
    double v24 = "+[SMTriggerDestination crowFliesExpectedTravelTimeForTransportType:defaultsManager:distance:]";
    __int16 v25 = 2112;
    uint64_t v26 = SMTriggerDestinationTransportTypeToAvgSpeed;
    _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "%s, invalid SMTriggerDestinationTransportTypeToAvgSpeed, %@", (uint8_t *)&v23, 0x16u);
  }

  return -1.0;
}

- (id)_cachedLocationsDateInterval
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[SMDateUtility date];
  id v4 = [(SMTriggerDestination *)self triggerState];
  dispatch_semaphore_t v5 = [v4 lastUnlockDate];
  uint64_t v6 = [(SMTriggerDestination *)self triggerState];
  double v7 = [v6 lastLockDate];
  [v5 timeIntervalSinceDate:v7];
  if (v8 > 0.0)
  {

    goto LABEL_8;
  }
  uint64_t v9 = [(SMTriggerDestination *)self triggerState];
  uint64_t v10 = [v9 currentStatus];

  if (v10 == 1)
  {
LABEL_8:
    [(SMTriggerDestination *)self destinationStatusUpdateTimeInterval];
    double v14 = [v3 dateByAddingTimeInterval:v26 * -0.5];
    goto LABEL_9;
  }
  [(SMTriggerDestination *)self noProgressTimeoutThreshold];
  double v12 = v11;
  [(SMTriggerDestination *)self destinationStatusUpdateTimeInterval];
  double v14 = [v3 dateByAddingTimeInterval:-(v12 + v13)];
  double v15 = [(SMTriggerDestination *)self triggerState];
  BOOL v16 = [v15 currentStatusDate];

  if (v16)
  {
    id v17 = [(SMTriggerDestination *)self triggerState];
    double v18 = [v17 currentStatusDate];
    uint64_t v19 = [v18 laterDate:v14];

    double v14 = (void *)v19;
  }
  double v20 = [(SMTriggerDestination *)self triggerState];
  double v21 = [v20 lastUnlockDate];

  if (v21)
  {
    __int16 v22 = [(SMTriggerDestination *)self triggerState];
    int v23 = [v22 lastUnlockDate];
    double v24 = [v23 dateByAddingTimeInterval:-6.0];
    uint64_t v25 = [v24 laterDate:v14];

    double v14 = (void *)v25;
  }
LABEL_9:
  uint64_t v27 = [(SMTriggerDestination *)self lastUserResponseSafeDate];
  uint64_t v28 = [v27 dateByAddingTimeInterval:-6.0];
  int v29 = [v28 laterDate:v14];

  double v30 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v29 endDate:v3];
  __int16 v31 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    __int16 v40 = [(SMTriggerDestination *)self triggerState];
    int v32 = [v40 lastLockDate];
    __int16 v33 = [v32 stringFromDate];
    double v34 = [(SMTriggerDestination *)self triggerState];
    [v34 lastUnlockDate];
    v35 = uint64_t v41 = v3;
    double v36 = [v35 stringFromDate];
    __int16 v37 = [(SMTriggerDestination *)self lastUserResponseSafeDate];
    __int16 v38 = [v37 stringFromDate];
    *(_DWORD *)buf = 136316162;
    __int16 v43 = "-[SMTriggerDestination _cachedLocationsDateInterval]";
    __int16 v44 = 2112;
    char v45 = v33;
    __int16 v46 = 2112;
    double v47 = v36;
    __int16 v48 = 2112;
    double v49 = v38;
    __int16 v50 = 2112;
    __int16 v51 = v30;
    _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, "%s, lastLockDate, %@, lastUnlockDate, %@, lastUserResponseDate, %@, dateInterval of interest, %@", buf, 0x34u);

    uint64_t v3 = v41;
  }

  return v30;
}

- (void)_declareAnomalyForTriggerCategory:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F999D0];
    double v7 = [(SMTriggerDestination *)self triggerState];
    double v8 = [v6 statusToString:[v7 currentStatus]];
    uint64_t v9 = [MEMORY[0x1E4F99968] triggerCategoryToString:a3];
    int v13 = 136315650;
    double v14 = "-[SMTriggerDestination _declareAnomalyForTriggerCategory:]";
    __int16 v15 = 2112;
    BOOL v16 = v8;
    __int16 v17 = 2112;
    double v18 = v9;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, current status, %@, triggerCategory, %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v10 = [(SMTriggerDestination *)self triggerState];
  uint64_t v11 = [v10 currentStatus];

  if (v11 != 3)
  {
    double v12 = [(SMTriggerDestination *)self triggerState];
    [v12 setCurrentStatus:3];

    [(SMTriggerDestination *)self _persistState];
    [(SMTriggerDestination *)self setTriggerCategory:a3];
    [(SMTriggerDestination *)self postStateChange];
  }
}

- (void)_initializeETATimer
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SMTriggerDestination *)self triggerState];
  id v4 = [v3 upperBoundEta];

  if (v4)
  {
    [(SMTriggerDestination *)self _tearDownTimerWithIdentifier:@"com.apple.routined.SMTriggerDestination.upperBoundETATimerIdentifier"];
    uint64_t v30 = +[SMDateUtility date];
    dispatch_semaphore_t v5 = [(SMTriggerDestination *)self triggerState];
    uint64_t v6 = [v5 upperBoundEta];
    uint64_t v7 = [v6 mapsUpperBoundEta];
    if (v7)
    {
      double v8 = (void *)v7;
      uint64_t v9 = [(SMTriggerDestination *)self triggerState];
      uint64_t v10 = [v9 upperBoundEta];
      uint64_t v11 = [v10 mapsUpperBoundEta];
      double v12 = [MEMORY[0x1E4F1C9C8] distantPast];
      char v13 = [v11 isEqualToDate:v12];

      if ((v13 & 1) == 0)
      {
        double v14 = [(SMTriggerDestination *)self triggerState];
        __int16 v15 = [v14 upperBoundEta];
        uint64_t v16 = [v15 mapsUpperBoundEta];
        goto LABEL_11;
      }
    }
    else
    {
    }
    double v18 = [(SMTriggerDestination *)self triggerState];
    uint64_t v19 = [v18 upperBoundEta];
    uint64_t v20 = [v19 crowFliesUpperBoundEta];
    if (!v20)
    {

      goto LABEL_16;
    }
    double v21 = (void *)v20;
    __int16 v22 = [(SMTriggerDestination *)self triggerState];
    int v23 = [v22 upperBoundEta];
    double v24 = [v23 crowFliesUpperBoundEta];
    uint64_t v25 = [MEMORY[0x1E4F1C9C8] distantPast];
    char v26 = [v24 isEqualToDate:v25];

    if (v26)
    {
LABEL_16:
      uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        int v32 = "-[SMTriggerDestination _initializeETATimer]";
        _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%s, Invalid upper bound ETA", buf, 0xCu);
      }
      __int16 v17 = v30;
      goto LABEL_19;
    }
    double v14 = [(SMTriggerDestination *)self triggerState];
    __int16 v15 = [v14 upperBoundEta];
    uint64_t v16 = [v15 crowFliesUpperBoundEta];
LABEL_11:
    uint64_t v27 = v16;

    if (v27)
    {
      __int16 v17 = v30;
      [v27 timeIntervalSinceDate:v30];
      -[SMTriggerDestination _initializeTimerWithIdentifier:fireAfterDelay:](self, "_initializeTimerWithIdentifier:fireAfterDelay:", @"com.apple.routined.SMTriggerDestination.upperBoundETATimerIdentifier");
      uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        int v29 = [v27 stringFromDate];
        *(_DWORD *)buf = 136315394;
        int v32 = "-[SMTriggerDestination _initializeETATimer]";
        __int16 v33 = 2112;
        double v34 = v29;
        _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "%s, fireDate, %@", buf, 0x16u);
      }
LABEL_19:

      goto LABEL_20;
    }
    goto LABEL_16;
  }
  __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    int v32 = "-[SMTriggerDestination _initializeETATimer]";
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%s, No upper bound ETA is set yet", buf, 0xCu);
  }
LABEL_20:
}

- (unint64_t)_predominantMotionActicityTypeFromStartDate:(id)a3 toEndDate:(id)a4 outError:(id *)a5
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8)
  {
    uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v45 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", v45, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"startDate");
      id v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:
      unint64_t v37 = 0;
      *a5 = v31;
      goto LABEL_26;
    }
LABEL_25:
    unint64_t v37 = 0;
    goto LABEL_26;
  }
  if (!v9)
  {
    __int16 v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v45 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", v45, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"endDate");
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  *(void *)char v45 = 0;
  __int16 v46 = v45;
  uint64_t v47 = 0x3032000000;
  __int16 v48 = __Block_byref_object_copy__138;
  double v49 = __Block_byref_object_dispose__138;
  id v50 = 0;
  double v12 = [(SMTriggerDestination *)self motionActivityManager];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __87__SMTriggerDestination__predominantMotionActicityTypeFromStartDate_toEndDate_outError___block_invoke;
  v41[3] = &unk_1E6B908E0;
  __int16 v43 = &v51;
  __int16 v44 = v45;
  char v13 = v11;
  uint64_t v42 = v13;
  [v12 fetchPredominantMotionActivityTypeFromStartDate:v8 toEndDate:v10 withHandler:v41];

  double v14 = v13;
  __int16 v15 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v14, v16)) {
    goto LABEL_12;
  }
  __int16 v40 = [MEMORY[0x1E4F1C9C8] now];
  [v40 timeIntervalSinceDate:v15];
  double v18 = v17;
  uint64_t v19 = objc_opt_new();
  uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_580];
  double v21 = [MEMORY[0x1E4F29060] callStackSymbols];
  __int16 v22 = [v21 filteredArrayUsingPredicate:v20];
  int v23 = [v22 firstObject];

  [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
  double v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
  v62[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  char v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v62 count:1];
  uint64_t v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v26];

  if (v27)
  {
    id v28 = v27;

    char v29 = 0;
  }
  else
  {
LABEL_12:
    id v28 = 0;
    char v29 = 1;
  }

  id v32 = v28;
  if ((v29 & 1) == 0) {
    objc_storeStrong((id *)v46 + 5, v28);
  }
  __int16 v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    id v34 = [v8 stringFromDate];
    id v35 = [v10 stringFromDate];
    double v36 = [MEMORY[0x1E4F5CE50] motionActivityTypeToString:v52[3]];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[SMTriggerDestination _predominantMotionActicityTypeFromStartDate:toEndDate:outError:]";
    __int16 v56 = 2112;
    id v57 = v34;
    __int16 v58 = 2112;
    id v59 = v35;
    __int16 v60 = 2112;
    id v61 = v36;
    _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_INFO, "%s, start Date, %@, endDate, %@, motionActivityType, %@", buf, 0x2Au);
  }
  if (a5) {
    *a5 = *((id *)v46 + 5);
  }
  unint64_t v37 = v52[3];

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v51, 8);

LABEL_26:
  return v37;
}

void __87__SMTriggerDestination__predominantMotionActicityTypeFromStartDate_toEndDate_outError___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unint64_t)_motionActivityTypeToTransportType:(unint64_t)a3 distance:(double)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    goto LABEL_5;
  }
  if (a4 <= 2000.0) {
    goto LABEL_4;
  }
  uint64_t v6 = [(SMTriggerDestination *)self sessionConfiguration];
  uint64_t v7 = [v6 destination];
  id v8 = [v7 eta];
  uint64_t v9 = [v8 transportType];

  if (v9 == 2)
  {
LABEL_4:
    unint64_t v10 = 2;
  }
  else
  {
LABEL_5:
    dispatch_semaphore_t v11 = [(SMTriggerDestination *)self sessionConfiguration];
    double v12 = [v11 destination];
    char v13 = [v12 eta];
    unint64_t v10 = [v13 transportType];
  }
  double v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = [MEMORY[0x1E4F5CE50] motionActivityTypeToString:a3];
    dispatch_time_t v16 = [(id)objc_opt_class() convertSMDirectionTransportTypeToString:v10];
    int v18 = 136315650;
    uint64_t v19 = "-[SMTriggerDestination _motionActivityTypeToTransportType:distance:]";
    __int16 v20 = 2112;
    double v21 = v15;
    __int16 v22 = 2112;
    int v23 = v16;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, motionActivityType, %@, transportType, %@", (uint8_t *)&v18, 0x20u);
  }
  return v10;
}

+ (void)checkEligibilityOfDestination:(id)a3 locationManager:(id)a4 distanceCalculator:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __113__SMTriggerDestination_checkEligibilityOfDestination_locationManager_distanceCalculator_queue_completionHandler___block_invoke;
  v15[3] = &unk_1E6B9B5C8;
  id v16 = v11;
  id v17 = v12;
  id v13 = v11;
  id v14 = v12;
  +[SMTriggerDestination calculateDistanceToDestination:v13 locationManager:a4 distanceCalculator:a5 queue:a6 handler:v15];
}

void __113__SMTriggerDestination_checkEligibilityOfDestination_locationManager_distanceCalculator_queue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Unable to calculate distance, error, %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    double v10 = *MEMORY[0x1E4F99BB8];
    if (*MEMORY[0x1E4F99BB8] >= a4)
    {
      uint64_t v20 = a1 + 32;
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(v20 + 8);
      if (a4 >= 500.0)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v19 + 16))(v19, 1, v18, 0);
        goto LABEL_11;
      }
      double v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F99A48];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      uint64_t v24 = @"destination is too close";
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v17 = [v21 errorWithDomain:v22 code:19 userInfo:v16];
      (*(void (**)(uint64_t, void, uint64_t, void *))(v19 + 16))(v19, 0, v18, v17);
    }
    else
    {
      uint64_t v13 = a1 + 32;
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v13 + 8);
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F99A48];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      char v26 = @"destination is too far";
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26, &v25, 1, v10];
      id v17 = [v14 errorWithDomain:v15 code:18 userInfo:v16];
      (*(void (**)(uint64_t, void, uint64_t, void *))(v12 + 16))(v12, 0, v11, v17);
    }
  }
LABEL_11:
}

+ (void)estimateEtaToDestination:(id)a3 transportType:(unint64_t)a4 locationManager:(id)a5 defaultsManager:(id)a6 distanceCalculator:(id)a7 queue:(id)a8 handler:(id)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a5;
  double v21 = +[SMDateUtility date];
  uint64_t v22 = objc_opt_class();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __128__SMTriggerDestination_estimateEtaToDestination_transportType_locationManager_defaultsManager_distanceCalculator_queue_handler___block_invoke;
  v29[3] = &unk_1E6B9B618;
  id v30 = v15;
  id v31 = v16;
  id v32 = v21;
  id v33 = v17;
  id v34 = v18;
  id v35 = v19;
  unint64_t v36 = a4;
  id v37 = a1;
  id v23 = v18;
  id v24 = v17;
  id v25 = v21;
  id v26 = v16;
  id v27 = v15;
  id v28 = v19;
  [v22 currentLocationWithLocationManager:v20 queue:v23 handler:v29];
}

void __128__SMTriggerDestination_estimateEtaToDestination_transportType_locationManager_defaultsManager_distanceCalculator_queue_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 72);
    uint64_t v17 = *(void *)(a1 + 80);
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = @"current location is unavailable";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    double v21 = [v19 errorWithDomain:*MEMORY[0x1E4F99A48] code:17 userInfo:v20];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *, double, double))(v18 + 16))(v18, v16, v17, v21, -1.0, -1.0);
  }
  else
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __128__SMTriggerDestination_estimateEtaToDestination_transportType_locationManager_defaultsManager_distanceCalculator_queue_handler___block_invoke_2;
    v22[3] = &unk_1E6B9B5F0;
    id v25 = v30;
    id v26 = v29;
    uint64_t v12 = *(void *)(a1 + 80);
    uint64_t v27 = *(void *)(a1 + 88);
    uint64_t v13 = *(void *)(a1 + 64);
    id v24 = *(id *)(a1 + 72);
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 80);
    id v23 = v14;
    uint64_t v28 = v15;
    +[SMTriggerDestination expectedTravelTimeforTransportType:v12 source:v5 defaultsManager:v8 destination:v9 departureDate:v10 distanceCalculator:v11 queue:v13 completionHandler:v22];

    id v7 = 0;
    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v30, 8);
  }
}

void __128__SMTriggerDestination_estimateEtaToDestination_transportType_locationManager_defaultsManager_distanceCalculator_queue_handler___block_invoke_2(void *a1, void *a2, void *a3, double a4, double a5)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = a4 < 0.0;
  }
  if (v11) {
    double v12 = a5;
  }
  else {
    double v12 = a4;
  }
  *(double *)(*(void *)(a1[6] + 8) + 24) = v12;
  uint64_t v13 = *MEMORY[0x1E4F99A30];
  if ((int)v13 <= 0)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17[0] = 67109634;
      v17[1] = v13;
      __int16 v18 = 2080;
      id v19 = "+[SMTriggerDestination estimateEtaToDestination:transportType:locationManager:defaultsManager:distanceCalcul"
            "ator:queue:handler:]_block_invoke_2";
      __int16 v20 = 1024;
      int v21 = 1922;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "SMCoarseDateBucketsMinutes should be greater than 0, %d (in %s:%d)", (uint8_t *)v17, 0x18u);
    }
  }
  [(id)objc_opt_class() roundingUpTimeInterval:v13 bucketDurationMinute:*(double *)(*(void *)(a1[6] + 8) + 24)];
  *(void *)(*(void *)(a1[7] + 8) + 24) = v16.n128_u64[0];
  v16.n128_u64[0] = *(void *)(*(void *)(a1[6] + 8) + 24);
  if (v16.n128_f64[0] < 0.0
    || v10
    || (v15.n128_u64[0] = *(void *)(*(void *)(a1[7] + 8) + 24), v15.n128_f64[0] < 0.0))
  {
    v16.n128_u64[0] = -1.0;
    v15.n128_u64[0] = -1.0;
    (*(void (**)(__n128, __n128))(a1[5] + 16))(v16, v15);
  }
  else
  {
    (*(void (**)(__n128, __n128))(a1[5] + 16))(v16, v15);
  }
}

+ (void)expectedTravelTimeforTransportType:(unint64_t)a3 source:(id)a4 defaultsManager:(id)a5 destination:(id)a6 departureDate:(id)a7 distanceCalculator:(id)a8 queue:(id)a9 completionHandler:(id)a10
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  [(id)objc_opt_class() distanceFromLocation:v15 toLocation:v17 withCalculator:v21];
  uint64_t v23 = v22;

  id v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    id v25 = +[SMTriggerDestination convertSMDirectionTransportTypeToString:a3];
    id v26 = [v18 stringFromDate];
    *(_DWORD *)buf = 136316418;
    id v35 = "+[SMTriggerDestination expectedTravelTimeforTransportType:source:defaultsManager:destination:departureDate:dis"
          "tanceCalculator:queue:completionHandler:]";
    __int16 v36 = 2112;
    id v37 = v25;
    __int16 v38 = 2112;
    id v39 = v15;
    __int16 v40 = 2112;
    id v41 = v17;
    __int16 v42 = 2112;
    __int16 v43 = v26;
    __int16 v44 = 2048;
    uint64_t v45 = v23;
    _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%s, transportType, %@, source, %@, destination, %@, departureDate, %@, distance, %.3f", buf, 0x3Eu);
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __151__SMTriggerDestination_expectedTravelTimeforTransportType_source_defaultsManager_destination_departureDate_distanceCalculator_queue_completionHandler___block_invoke;
  v29[3] = &unk_1E6B9B640;
  uint64_t v32 = v23;
  unint64_t v33 = a3;
  id v30 = v16;
  id v31 = v19;
  id v27 = v16;
  id v28 = v19;
  +[SMTriggerDestination mapsExpectedTravelTimeforTransportType:a3 source:v15 destination:v17 departureDate:v18 queue:v20 handler:v29];
}

void __151__SMTriggerDestination_expectedTravelTimeforTransportType_source_defaultsManager_destination_departureDate_distanceCalculator_queue_completionHandler___block_invoke(uint64_t a1, void *a2, double a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v25 = "+[SMTriggerDestination expectedTravelTimeforTransportType:source:defaultsManager:destination:departureDate:dis"
          "tanceCalculator:queue:completionHandler:]_block_invoke";
    __int16 v26 = 2048;
    double v27 = a3;
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, Maps expectedTravelTime, %.3f, error, %@", buf, 0x20u);
  }

  if (*(double *)(a1 + 48) == 1.79769313e308)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v25 = "+[SMTriggerDestination expectedTravelTimeforTransportType:source:defaultsManager:destination:departureDate:d"
            "istanceCalculator:queue:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, invalid distance = DBL_MAX", buf, 0xCu);
    }

    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F99A48];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    uint64_t v23 = @"invalid distance";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    BOOL v11 = v8;
    uint64_t v12 = v9;
    uint64_t v13 = 6;
  }
  else
  {
    +[SMTriggerDestination crowFliesExpectedTravelTimeForTransportType:defaultsManager:distance:](SMTriggerDestination, "crowFliesExpectedTravelTimeForTransportType:defaultsManager:distance:", *(void *)(a1 + 56), *(void *)(a1 + 32));
    double v15 = v14;
    id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v25 = "+[SMTriggerDestination expectedTravelTimeforTransportType:source:defaultsManager:destination:departureDate:d"
            "istanceCalculator:queue:completionHandler:]_block_invoke";
      __int16 v26 = 2048;
      double v27 = v15;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%s, CrowFlies expectedTravelTime, %.3f", buf, 0x16u);
    }

    if (v15 >= 0.0)
    {
      (*(void (**)(double, double))(*(void *)(a1 + 40) + 16))(a3, v15);
      goto LABEL_12;
    }
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F99A48];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    id v21 = @"unable to calculate ETA";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    BOOL v11 = v17;
    uint64_t v12 = v18;
    uint64_t v13 = 7;
  }
  id v19 = [v11 errorWithDomain:v12 code:v13 userInfo:v10];

  (*(void (**)(double, double))(*(void *)(a1 + 40) + 16))(a3, -1.0);
LABEL_12:
}

+ (id)statusToString:(unint64_t)a3
{
  if (a3 > 3) {
    return @"InvalidStatus";
  }
  else {
    return off_1E6B9B660[a3];
  }
}

+ (id)convertSMDirectionTransportTypeToString:(unint64_t)a3
{
  id result = @"SMDirectionsTransportTypeWalking";
  switch(a3)
  {
    case 1uLL:
      id result = @"SMDirectionsTransportTypeAutomobile";
      break;
    case 2uLL:
      return result;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 4uLL:
      id result = @"SMDirectionsTransportTypeTransit";
      break;
    case 8uLL:
      id result = @"SMDirectionsTransportTypeBicycle";
      break;
    default:
      if (a3 == 0xFFFFFFF) {
        id result = @"SMDirectionsTransportTypeAny";
      }
      else {
LABEL_5:
      }
        id result = @"UKNOWN";
      break;
  }
  return result;
}

+ (unint64_t)convertSMDirectionTransportTypeToMKDirectionTransportType:(unint64_t)a3
{
  unint64_t result = a3;
  if ((a3 > 8 || ((1 << a3) & 0x116) == 0) && a3 != 0xFFFFFFF) {
    return 0;
  }
  return result;
}

+ (double)roundingUpTimeInterval:(double)a3 bucketDurationMinute:(int)a4
{
  return ceil(a3 / ((double)a4 * 60.0)) * (double)a4 * 60.0;
}

+ (double)distanceFromLocation:(id)a3 toLocation:(id)a4 withCalculator:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = (objc_class *)MEMORY[0x1E4F5CE00];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = (void *)[[v7 alloc] initWithCLLocation:v10];

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v9];
  id v18 = 0;
  [v8 distanceFromLocation:v11 toLocation:v12 error:&v18];
  double v14 = v13;

  id v15 = v18;
  if (v15)
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v15;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "error calculating distance: %@", buf, 0xCu);
    }
  }
  return v14;
}

- (void)_updateCoarseEtaWithMapsExpectedTravelTime:(double)a3 crowFliesExpectedTravelTime:(double)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = +[SMDateUtility date];
  id v8 = v7;
  id v9 = (void *)MEMORY[0x1E4F1C9C8];
  if (a3 > 0.0) {
    a4 = a3;
  }
  id v10 = [v7 dateByAddingTimeInterval:a4];
  BOOL v11 = [v9 roundingUpDate:v10 bucketDurationMinute:*MEMORY[0x1E4F99A30]];

  uint64_t v12 = [v8 dateByAddingTimeInterval:a4];
  if ([(SMTriggerDestination *)self _shouldUpdateCoarseEta:v11])
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      double v14 = [(SMTriggerDestination *)self coarseEta];
      id v15 = [v14 stringFromDate];
      id v16 = [v11 stringFromDate];
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = "-[SMTriggerDestination _updateCoarseEtaWithMapsExpectedTravelTime:crowFliesExpectedTravelTime:]";
      __int16 v23 = 2112;
      id v24 = v15;
      __int16 v25 = 2112;
      __int16 v26 = v16;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%s, update coarseETA from, %@, to, %@", buf, 0x20u);
    }
    [(SMTriggerDestination *)self setCoarseEta:v11];
    id v17 = [SMTriggerEstimatedEndDateUpdateNotification alloc];
    id v18 = +[SMDateUtility date];
    id v19 = [(SMTriggerEstimatedEndDateUpdateNotification *)v17 initWithTriggerCategory:16 SOSState:1 estimatedEndDate:v12 coarseEstimatedEndDate:v11 triggerName:@"SMTriggerDestination" date:v18 details:MEMORY[0x1E4F1CC08]];

    id v20 = [(SMTriggerDestination *)self sessionMonitorDelegate];
    [v20 onTriggerNotification:v19];
  }
}

- (BOOL)_shouldUpdateCoarseEta:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_4;
  }
  id v5 = [(SMTriggerDestination *)self coarseEta];

  if (!v5)
  {
LABEL_7:
    BOOL v8 = 1;
    goto LABEL_8;
  }
  id v6 = [(SMTriggerDestination *)self coarseEta];
  char v7 = [v4 isEqualToDate:v6];

  if ((v7 & 1) == 0)
  {
    id v9 = [(SMTriggerDestination *)self sessionConfiguration];
    id v10 = [v9 destination];
    BOOL v11 = [v10 eta];
    [v11 additionalTravelTime];
    double v13 = v12;

    if (v13 > 0.0)
    {
      double v14 = [(SMTriggerDestination *)self coarseEta];
      BOOL v8 = [v14 compare:v4] == -1;

      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_4:
  BOOL v8 = 0;
LABEL_8:

  return v8;
}

+ (id)getSMTriggerDestinationTransportTypeToAvgSpeed
{
  return (id)SMTriggerDestinationTransportTypeToAvgSpeed;
}

- (id)lastUserResponseSafeDate
{
  uint64_t v3 = [(SMTriggerDestination *)self sessionConfiguration];
  id v4 = [v3 userResponseSafeDate];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    char v7 = [(SMTriggerDestination *)self sessionConfiguration];
    id v6 = [v7 sessionStartDate];
  }

  return v6;
}

- (SMTriggerManagerProtocol)sessionMonitorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->sessionMonitorDelegate);

  return (SMTriggerManagerProtocol *)WeakRetained;
}

- (void)setSessionMonitorDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (void)setDataProtectionManager:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
}

- (SMTriggerDestinationState)triggerState
{
  return self->_triggerState;
}

- (void)setTriggerState:(id)a3
{
}

- (CLLocation)originLocation
{
  return self->_originLocation;
}

- (void)setOriginLocation:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (SMSessionMetricManager)sessionMetricManager
{
  return self->_sessionMetricManager;
}

- (void)setSessionMetricManager:(id)a3
{
}

- (NSMutableDictionary)timerIdentifierToTimers
{
  return self->_timerIdentifierToTimers;
}

- (void)setTimerIdentifierToTimers:(id)a3
{
}

- (unint64_t)triggerCategory
{
  return self->_triggerCategory;
}

- (void)setTriggerCategory:(unint64_t)a3
{
  self->_triggerCategory = a3;
}

- (NSMutableArray)cachedLocationEvents
{
  return self->_cachedLocationEvents;
}

- (void)setCachedLocationEvents:(id)a3
{
}

- (SMSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (void)setSessionConfiguration:(id)a3
{
}

- (double)idleTimeoutThreshold
{
  return self->_idleTimeoutThreshold;
}

- (void)setIdleTimeoutThreshold:(double)a3
{
  self->_idleTimeoutThreshold = a3;
}

- (double)noProgressTimeoutThreshold
{
  return self->_noProgressTimeoutThreshold;
}

- (void)setNoProgressTimeoutThreshold:(double)a3
{
  self->_noProgressTimeoutThreshold = a3;
}

- (NSDate)coarseEta
{
  return self->_coarseEta;
}

- (void)setCoarseEta:(id)a3
{
}

- (double)etaScaleFactor
{
  return self->_etaScaleFactor;
}

- (void)setEtaScaleFactor:(double)a3
{
  self->_etaScaleFactor = a3;
}

- (double)minDistanceUpdateThreshold
{
  return self->_minDistanceUpdateThreshold;
}

- (void)setMinDistanceUpdateThreshold:(double)a3
{
  self->_minDistanceUpdateThreshold = a3;
}

- (double)destinationStatusUpdateTimeInterval
{
  return self->_destinationStatusUpdateTimeInterval;
}

- (void)setDestinationStatusUpdateTimeInterval:(double)a3
{
  self->_destinationStatusUpdateTimeInterval = a3;
}

- (double)significantMoveThreshold
{
  return self->_significantMoveThreshold;
}

- (void)setSignificantMoveThreshold:(double)a3
{
  self->_significantMoveThreshold = a3;
}

- (double)idleMaxDistanceThreshold
{
  return self->_idleMaxDistanceThreshold;
}

- (void)setIdleMaxDistanceThreshold:(double)a3
{
  self->_idleMaxDistanceThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coarseEta, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_cachedLocationEvents, 0);
  objc_storeStrong((id *)&self->_timerIdentifierToTimers, 0);
  objc_storeStrong((id *)&self->_sessionMetricManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_originLocation, 0);
  objc_storeStrong((id *)&self->_triggerState, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->sessionMonitorDelegate);
}

@end