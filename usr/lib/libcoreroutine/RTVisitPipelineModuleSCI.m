@interface RTVisitPipelineModuleSCI
+ (BOOL)filterHint:(id)a3 sourceFilter:(id)a4 inverseFilter:(BOOL)a5;
+ (id)FSMEventToString:(unint64_t)a3;
+ (id)FSMStateToString:(unint64_t)a3;
+ (id)LCFSMStateToString:(unint64_t)a3;
- (BOOL)isDwellTimeSatisfiedForLocation:(id)a3;
- (BOOL)isHint:(id)a3 withinDistance:(double)a4 location:(id)a5;
- (BOOL)isHintConsistentWithLocation:(id)a3 hint:(id)a4;
- (BOOL)isHintNearLocation:(id)a3;
- (BOOL)isInWorkingHypothesis;
- (BOOL)isLastRegionHintNearLocation:(id)a3 hintSource:(int64_t)a4;
- (BOOL)isTimeOutsideClusterSatisfiedForOutlierCount:(unint64_t)a3 location:(id)a4;
- (BOOL)isValidLatestRegionHintSource:(int64_t)a3 date:(id)a4;
- (BOOL)isVisitInFlight;
- (BOOL)latestGeofenceHintChecked;
- (BOOL)latestSignificantRegionHintChecked;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTDelayedLocationRequester)delayedLocationRequester;
- (RTHint)latestGeofenceHint;
- (RTHint)latestSignificantRegionHint;
- (RTHintManager)hintManager;
- (RTVisitHyperParameter)hyperParameter;
- (RTVisitPipelineModuleSCI)init;
- (RTVisitPipelineModuleSCI)initWithDefaultsManager:(id)a3 delayedLocationRequester:(id)a4 hintManager:(id)a5 queue:(id)a6 hyperParameter:(id)a7 useLowConfidence:(BOOL)a8;
- (RTVisitSCIStayCluster)workingHypothesis;
- (double)minStaticIntervalForSLVArrival;
- (double)minStaticIntervalForSLVArrivalWithHint;
- (double)requiredDwellTimeForLocation:(id)a3;
- (double)requiredTimeOutsideClusterForOutlierCount:(unint64_t)a3 location:(id)a4;
- (id)filterHints:(id)a3 existingHints:(id)a4;
- (id)getHintConsistentWithLocation:(id)a3 sourceFilter:(id)a4 inverseFilter:(BOOL)a5;
- (id)getHintWithinDistance:(double)a3 ofLocation:(id)a4 sourceFilter:(id)a5 inverseFilter:(BOOL)a6;
- (id)getHintsNearLocation:(id)a3 withinDistance:(double)a4 sourceFilter:(id)a5 fromDate:(id)a6 limit:(unint64_t)a7;
- (id)getLastHintUsingSourceFilter:(id)a3;
- (id)handleFSM:(unint64_t)a3 point:(id)a4;
- (id)hintsNearLocation:(id)a3;
- (id)latestCachedHintOfSource:(int64_t)a3;
- (id)process:(id)a3;
- (id)relevantDateForHintSource:(int64_t)a3 date:(id)a4;
- (id)retrieveNonLOIHintsNearLocation:(id)a3 withinDistance:(double)a4;
- (id)stateMachineConfidenceString;
- (unint64_t)fsmState;
- (unint64_t)lcFSMState;
- (void)_onHintNotification:(id)a3;
- (void)addToClusters:(id)a3;
- (void)addVisitFromWorkingHypothesis:(int64_t)a3 confidence:(double)a4;
- (void)exitFromWorkingHypothesis;
- (void)exitUntilNotInWorkingHypotheisWithBlock:(id)a3;
- (void)onHintNotification:(id)a3;
- (void)populateHintCacheNearLocation:(id)a3 withinDistance:(double)a4;
- (void)processContextChangeWithSource:(int64_t)a3;
- (void)processContextOnGeofenceEntry;
- (void)processPoints:(id)a3;
- (void)refreshCachedHintOfSource:(int64_t)a3;
- (void)refreshLatestGeofenceHintCache;
- (void)refreshLatestSignificantRegionHintCache;
- (void)resetWorkingHypothesis;
- (void)setDefaultsManager:(id)a3;
- (void)setDelayedLocationRequester:(id)a3;
- (void)setHintManager:(id)a3;
- (void)setHyperParameter:(id)a3;
- (void)setLatestGeofenceHint:(id)a3;
- (void)setLatestGeofenceHintChecked:(BOOL)a3;
- (void)setLatestSignificantRegionHint:(id)a3;
- (void)setLatestSignificantRegionHintChecked:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)shutdown;
@end

@implementation RTVisitPipelineModuleSCI

- (void)onHintNotification:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__RTVisitPipelineModuleSCI_onHintNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __47__RTVisitPipelineModuleSCI_onHintNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onHintNotification:*(void *)(a1 + 40)];
}

- (void)_onHintNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = (char *)a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    id v8 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
    int v16 = 138412802;
    v17 = v7;
    __int16 v18 = 2112;
    v19 = v5;
    __int16 v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, received hint notification, %@, %@", (uint8_t *)&v16, 0x20u);
  }
  v9 = [v5 name];
  v10 = +[RTNotification notificationName];
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    hintCache = self->_hintCache;
    self->_hintCache = 0;

    v13 = [v5 hintSourcesUpdated];
    __int16 v14 = [v13 integerValue];

    if ((v14 & 0x300) != 0) {
      self->_latestGeofenceHintChecked = 0;
    }
    if ((v14 & 0xC00) != 0) {
      self->_latestSignificantRegionHintChecked = 0;
    }
    if ((v14 & 0x100) != 0) {
      [(RTVisitPipelineModuleSCI *)self processContextChangeWithSource:7];
    }
    if ((v14 & 0x400) != 0) {
      [(RTVisitPipelineModuleSCI *)self processContextChangeWithSource:9];
    }
  }
  else
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412802;
      v17 = v5;
      __int16 v18 = 2080;
      v19 = "-[RTVisitPipelineModuleSCI _onHintNotification:]";
      __int16 v20 = 1024;
      LODWORD(v21) = 1068;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v16, 0x1Cu);
    }
  }
}

- (id)stateMachineConfidenceString
{
  if (self->_useLowConfidence) {
    return @"lowConfidence";
  }
  else {
    return @"highConfidence";
  }
}

- (double)minStaticIntervalForSLVArrival
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"MinStaticIntervalForSLVArrival"];
  v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    double v7 = v6;
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = NSStringFromSelector(a2);
      v10 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
      int v12 = 138413058;
      v13 = v9;
      __int16 v14 = 2112;
      v15 = @"MinStaticIntervalForSLVArrival";
      __int16 v16 = 2048;
      double v17 = v7;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@ overridden to %.1fs, %@", (uint8_t *)&v12, 0x2Au);
    }
  }
  else
  {
    double v7 = 900.0;
  }

  return v7;
}

- (double)minStaticIntervalForSLVArrivalWithHint
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"MinStaticIntervalForSLVArrivalWithHint"];
  v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    double v7 = v6;
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = NSStringFromSelector(a2);
      v10 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
      int v12 = 138413058;
      v13 = v9;
      __int16 v14 = 2112;
      v15 = @"MinStaticIntervalForSLVArrivalWithHint";
      __int16 v16 = 2048;
      double v17 = v7;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, %@ overridden to %.1fs, %@", (uint8_t *)&v12, 0x2Au);
    }
  }
  else
  {
    double v7 = 240.0;
  }

  return v7;
}

+ (id)FSMStateToString:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([&unk_1F34533F0 count] != 4)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "+[RTVisitPipelineModuleSCI FSMStateToString:]";
      __int16 v9 = 1024;
      int v10 = 105;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: stateNames.count == RTVisitSCIFSMStateMax + 1 (in %s:%d)", (uint8_t *)&v7, 0x12u);
    }
  }
  v5 = [&unk_1F34533F0 objectAtIndexedSubscript:a3];

  return v5;
}

+ (id)LCFSMStateToString:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([&unk_1F3453408 count] != 2)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "+[RTVisitPipelineModuleSCI LCFSMStateToString:]";
      __int16 v9 = 1024;
      int v10 = 113;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: stateNames.count == RTVisitSCIFSMLCStateMax + 1 (in %s:%d)", (uint8_t *)&v7, 0x12u);
    }
  }
  v5 = [&unk_1F3453408 objectAtIndexedSubscript:a3];

  return v5;
}

+ (id)FSMEventToString:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([&unk_1F3453420 count] != 11)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "+[RTVisitPipelineModuleSCI FSMEventToString:]";
      __int16 v9 = 1024;
      int v10 = 130;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventNames.count == RTVisitSCIFSMEventMax + 1 (in %s:%d)", (uint8_t *)&v7, 0x12u);
    }
  }
  v5 = [&unk_1F3453420 objectAtIndexedSubscript:a3];

  return v5;
}

- (RTVisitPipelineModuleSCI)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_delayedLocationRequester_hintManager_queue_hyperParameter_useLowConfidence_);
}

- (RTVisitPipelineModuleSCI)initWithDefaultsManager:(id)a3 delayedLocationRequester:(id)a4 hintManager:(id)a5 queue:(id)a6 hyperParameter:(id)a7 useLowConfidence:(BOOL)a8
{
  id v15 = a3;
  id v39 = a4;
  id v16 = a5;
  id v38 = a6;
  id v17 = a7;
  __int16 v18 = v17;
  if (!v15)
  {
    v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v31 = 0;
LABEL_11:
      v35 = v38;
      v34 = v39;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v33 = "Invalid parameter not satisfying: defaultsManager";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, v33, buf, 2u);
    goto LABEL_10;
  }
  if (!v16)
  {
    v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v33 = "Invalid parameter not satisfying: hintManager";
    goto LABEL_17;
  }
  if (v17)
  {
    v40.receiver = self;
    v40.super_class = (Class)RTVisitPipelineModuleSCI;
    v19 = [(RTVisitPipelineModuleSCI *)&v40 init];
    uint64_t v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_defaultsManager, a3);
      objc_storeStrong((id *)&v20->_delayedLocationRequester, a4);
      objc_storeStrong((id *)&v20->_hintManager, a5);
      objc_storeStrong((id *)&v20->_hyperParameter, a7);
      v20->_useLowConfidence = a8;
      uint64_t v21 = objc_opt_new();
      clusters = v20->_clusters;
      v20->_clusters = (NSMutableArray *)v21;

      v20->_fsmState = 0;
      v20->_lcFSMState = 0;
      lastPointProcessed = v20->_lastPointProcessed;
      v20->_lastPointProcessed = 0;

      uint64_t v24 = objc_opt_new();
      distanceCalculator = v20->_distanceCalculator;
      v20->_distanceCalculator = (RTDistanceCalculator *)v24;

      objc_storeStrong((id *)&v20->_queue, a6);
      *(_WORD *)&v20->_latestGeofenceHintChecked = 0;
      uint64_t v26 = [MEMORY[0x1E4F1C9C8] distantPast];
      requiredDwellTimeCacheDateToUpdate = v20->_requiredDwellTimeCacheDateToUpdate;
      v20->_requiredDwellTimeCacheDateToUpdate = (NSDate *)v26;

      [(RTVisitPipelineModuleSCI *)v20 minStaticIntervalForSLVArrival];
      v20->_requiredDwellTimeCache = v28;
      hintManager = v20->_hintManager;
      v30 = +[RTNotification notificationName];
      [(RTNotifier *)hintManager addObserver:v20 selector:sel_onHintNotification_ name:v30];

      [(RTVisitPipelineModuleSCI *)v20 resetWorkingHypothesis];
    }
    self = v20;
    v31 = self;
    goto LABEL_11;
  }
  v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v35 = v38;
  v34 = v39;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hyperParameter", buf, 2u);
  }

  v31 = 0;
LABEL_12:

  return v31;
}

- (void)shutdown
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = NSStringFromSelector(a2);
    double v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    id v8 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
    int v10 = 138412802;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, %@, %@", (uint8_t *)&v10, 0x20u);
  }
  [(RTDelayedLocationRequester *)self->_delayedLocationRequester shutdown];
  delayedLocationRequester = self->_delayedLocationRequester;
  self->_delayedLocationRequester = 0;
}

- (void)resetWorkingHypothesis
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = NSStringFromSelector(a2);
    int v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    __int16 v12 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
    int v13 = 138412802;
    __int16 v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    __int16 v18 = v12;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%@, %@, %@", (uint8_t *)&v13, 0x20u);
  }
  v5 = (RTVisitSCIStayCluster *)objc_opt_new();
  workingHypothesis = self->_workingHypothesis;
  self->_workingHypothesis = v5;

  delayedLocationRequester = self->_delayedLocationRequester;
  id v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(RTDelayedLocationRequester *)delayedLocationRequester updateFireDate:v8];
}

- (void)exitFromWorkingHypothesis
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(RTVisitSCIStayCluster *)self->_workingHypothesis numOfOutliers];
  v5 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(a2);
    workingHypothesis = self->_workingHypothesis;
    int v10 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
    int v12 = 138412802;
    unint64_t v13 = (unint64_t)v8;
    __int16 v14 = 2112;
    __int16 v15 = workingHypothesis;
    __int16 v16 = 2112;
    __int16 v17 = v10;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@, exit from working hypothesis, %@, %@", (uint8_t *)&v12, 0x20u);
  }
  double v6 = [(RTVisitPipelineModuleSCI *)self handleFSM:5 point:0];
  if ([v6 count]) {
    [(RTVisitPipelineModuleSCI *)self processPoints:v6];
  }
  if (v4 && v4 <= [(RTVisitSCIStayCluster *)self->_workingHypothesis numOfOutliers])
  {
    int v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = self->_workingHypothesis;
      int v12 = 134218754;
      unint64_t v13 = v4;
      __int16 v14 = 2112;
      __int16 v15 = v11;
      __int16 v16 = 2080;
      __int16 v17 = "-[RTVisitPipelineModuleSCI exitFromWorkingHypothesis]";
      __int16 v18 = 1024;
      int v19 = 207;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "outliers number is increasing. before, %lu, current working hypothesis, %@ (in %s:%d)", (uint8_t *)&v12, 0x26u);
    }
  }
}

- (void)processContextOnGeofenceEntry
{
}

- (void)refreshCachedHintOfSource:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 9) > 1)
  {
    if ((unint64_t)(a3 - 7) > 1)
    {
      double v6 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = NSStringFromSelector(a2);
        id v8 = [MEMORY[0x1E4F5CDF0] hintSourceToString:a3];
        __int16 v9 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
        int v10 = 138412802;
        uint64_t v11 = v7;
        __int16 v12 = 2112;
        unint64_t v13 = v8;
        __int16 v14 = 2112;
        __int16 v15 = v9;
        _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, no cache to refresh for hint source %@, %@", (uint8_t *)&v10, 0x20u);
      }
    }
    else
    {
      [(RTVisitPipelineModuleSCI *)self refreshLatestGeofenceHintCache];
    }
  }
  else
  {
    [(RTVisitPipelineModuleSCI *)self refreshLatestSignificantRegionHintCache];
  }
}

- (id)latestCachedHintOfSource:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 9) <= 1)
  {
    latestSignificantRegionHint = self->_latestSignificantRegionHint;
LABEL_5:
    double v6 = latestSignificantRegionHint;
    goto LABEL_9;
  }
  if ((unint64_t)(a3 - 7) <= 1)
  {
    latestSignificantRegionHint = self->_latestGeofenceHint;
    goto LABEL_5;
  }
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = NSStringFromSelector(a2);
    int v10 = [MEMORY[0x1E4F5CDF0] hintSourceToString:a3];
    uint64_t v11 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
    int v13 = 138412802;
    __int16 v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    __int16 v18 = v11;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, no cache to retrieve for hint source %@, %@", (uint8_t *)&v13, 0x20u);
  }
  double v6 = 0;
LABEL_9:

  return v6;
}

- (void)processContextChangeWithSource:(int64_t)a3
{
  int64_t v3 = a3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a3 == 7 || a3 == 9) {
    goto LABEL_6;
  }
  v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hintSource == RTHintSourceGeoFenceEntry || hintSource == RTHintSourceSignificantRegionEntry", buf, 2u);
  }

  if (v3 == 9)
  {
LABEL_6:
    unint64_t v6 = [(RTVisitSCIStayCluster *)self->_workingHypothesis numOfOutliers];
    int v7 = [(RTVisitPipelineModuleSCI *)self handleFSM:6 point:0];
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v34 = self;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v9 = NSStringFromSelector(a2);
      int v10 = [MEMORY[0x1E4F5CDF0] hintSourceToString:v3];
      workingHypothesis = self->_workingHypothesis;
      __int16 v12 = [(id)objc_opt_class() FSMStateToString:self->_fsmState];
      int v13 = [(id)objc_opt_class() LCFSMStateToString:self->_lcFSMState];
      __int16 v14 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
      *(_DWORD *)buf = 138413826;
      unint64_t v43 = (unint64_t)v9;
      __int16 v44 = 2112;
      v45 = v10;
      __int16 v46 = 2112;
      v47 = (const char *)workingHypothesis;
      __int16 v48 = 2112;
      v49 = v12;
      __int16 v50 = 2112;
      v51 = v13;
      __int16 v52 = 2048;
      unint64_t v53 = v6;
      __int16 v54 = 2112;
      v55 = v14;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, entry hint of source, %@, detected. Will exit any existing hypothesis, %@, if not in visit HC FSM inState, %@, LC FSM inState, %@, number points left, %lu, %@", buf, 0x48u);

      self = v34;
    }

    if ([v7 count])
    {
      unint64_t v31 = v6;
      [(RTVisitPipelineModuleSCI *)self refreshCachedHintOfSource:v3];
      v35 = [(RTVisitPipelineModuleSCI *)self latestCachedHintOfSource:v3];
      __int16 v15 = [MEMORY[0x1E4F1CA48] array];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v32 = v7;
      id obj = v7;
      uint64_t v16 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (!v16) {
        goto LABEL_23;
      }
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v38;
      while (1)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v21 = [v20 date];
          if (![(RTVisitPipelineModuleSCI *)self isValidLatestRegionHintSource:v3 date:v21])
          {

LABEL_20:
            [v15 addObject:v20];
            continue;
          }
          [v20 date];
          v23 = int64_t v22 = v3;
          uint64_t v24 = [(RTVisitSCIStayCluster *)v35 date];
          int v25 = [v23 isBeforeDate:v24];

          self = v34;
          int64_t v3 = v22;

          if (!v25) {
            goto LABEL_20;
          }
          uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v27 = NSStringFromSelector(a2);
            double v28 = [(RTVisitPipelineModuleSCI *)v34 stateMachineConfidenceString];
            *(_DWORD *)buf = 138413058;
            unint64_t v43 = (unint64_t)v27;
            __int16 v44 = 2112;
            v45 = v35;
            __int16 v46 = 2112;
            v47 = (const char *)v20;
            __int16 v48 = 2112;
            v49 = v28;
            _os_log_debug_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_DEBUG, "%@, skipping irrelevant location. hint, %@, is after location, %@, %@", buf, 0x2Au);

            int64_t v3 = v22;
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (!v17)
        {
LABEL_23:

          [(RTVisitPipelineModuleSCI *)self processPoints:v15];
          unint64_t v6 = v31;
          int v7 = v32;
          break;
        }
      }
    }
    if (v6 && v6 <= [(RTVisitSCIStayCluster *)self->_workingHypothesis numOfOutliers])
    {
      v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = self->_workingHypothesis;
        *(_DWORD *)buf = 134218754;
        unint64_t v43 = v6;
        __int16 v44 = 2112;
        v45 = v30;
        __int16 v46 = 2080;
        v47 = "-[RTVisitPipelineModuleSCI processContextChangeWithSource:]";
        __int16 v48 = 1024;
        LODWORD(v49) = 282;
        _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "outliers number is increasing. before, %lu, current working hypothesis, %@ (in %s:%d)", buf, 0x26u);
      }
    }
  }
}

- (void)exitUntilNotInWorkingHypotheisWithBlock:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = (uint64_t (**)(void))a3;
  unint64_t v6 = [(RTVisitSCIStayCluster *)self->_workingHypothesis numOfOutliers];
  if ([(RTVisitPipelineModuleSCI *)self isInWorkingHypothesis])
  {
    unint64_t v8 = 0;
    __int16 v9 = @"with";
    if (!v5) {
      __int16 v9 = @"without";
    }
    uint64_t v19 = v9;
    *(void *)&long long v7 = 136315394;
    long long v18 = v7;
    while (1)
    {
      if (v8 > v6)
      {
        int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v18;
          uint64_t v21 = "-[RTVisitPipelineModuleSCI exitUntilNotInWorkingHypotheisWithBlock:]";
          __int16 v22 = 1024;
          LODWORD(v23) = 290;
          _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "run out of loops while exiting (in %s:%d)", buf, 0x12u);
        }
      }
      if (v5 && (v5[2](v5) & 1) != 0) {
        break;
      }
      uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        __int16 v12 = a2;
        int v13 = (char *)objc_claimAutoreleasedReturnValue();
        __int16 v14 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
        *(_DWORD *)buf = 138412802;
        uint64_t v21 = v13;
        __int16 v22 = 2112;
        v23 = v19;
        __int16 v24 = 2112;
        int v25 = v14;
        _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "%@, exit from working hypothesis and clear outliers %@ block, %@", buf, 0x20u);

        a2 = v12;
      }

      [(RTVisitPipelineModuleSCI *)self exitFromWorkingHypothesis];
      ++v8;
      if (![(RTVisitPipelineModuleSCI *)self isInWorkingHypothesis]) {
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    if (!v5)
    {
      if ([(RTVisitSCIStayCluster *)self->_workingHypothesis numOfOutliers])
      {
        __int16 v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v21 = "-[RTVisitPipelineModuleSCI exitUntilNotInWorkingHypotheisWithBlock:]";
          __int16 v22 = 1024;
          LODWORD(v23) = 302;
          _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "nonzero outliers afterwards (in %s:%d)", buf, 0x12u);
        }
      }
      if ([(RTVisitSCIStayCluster *)self->_workingHypothesis numOfDataPoints])
      {
        uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v21 = "-[RTVisitPipelineModuleSCI exitUntilNotInWorkingHypotheisWithBlock:]";
          __int16 v22 = 1024;
          LODWORD(v23) = 303;
          _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "nonzero data points (in %s:%d)", buf, 0x12u);
        }
      }
      if (self->_fsmState)
      {
        uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v21 = "-[RTVisitPipelineModuleSCI exitUntilNotInWorkingHypotheisWithBlock:]";
          __int16 v22 = 1024;
          LODWORD(v23) = 304;
          _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "state is not correct (in %s:%d)", buf, 0x12u);
        }
      }
    }
  }
}

- (void)addToClusters:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 visit];
  unint64_t v6 = [v5 entry];

  if (!v6)
  {
    long long v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v44 = 136315394;
      v45 = "-[RTVisitPipelineModuleSCI addToClusters:]";
      __int16 v46 = 1024;
      LODWORD(v47) = 310;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "no entry ts (in %s:%d)", (uint8_t *)&v44, 0x12u);
    }
  }
  unint64_t v8 = [v4 visit];
  __int16 v9 = [v8 location];

  if (!v9)
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v44 = 136315394;
      v45 = "-[RTVisitPipelineModuleSCI addToClusters:]";
      __int16 v46 = 1024;
      LODWORD(v47) = 311;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "no location (in %s:%d)", (uint8_t *)&v44, 0x12u);
    }
  }
  uint64_t v11 = [v4 visit];
  __int16 v12 = [v11 exit];

  if (!v12)
  {
    int v13 = [v4 points];

    if (!v13)
    {
      __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v44 = 136315394;
        v45 = "-[RTVisitPipelineModuleSCI addToClusters:]";
        __int16 v46 = 1024;
        LODWORD(v47) = 313;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "no points for entry visit (in %s:%d)", (uint8_t *)&v44, 0x12u);
      }
    }
  }
  __int16 v15 = [v4 visit];
  uint64_t v16 = [v15 entry];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    long long v18 = [v4 visit];
    uint64_t v19 = [v18 location];

    if (v19)
    {
      uint64_t v20 = [v4 visit];
      uint64_t v21 = [v20 exit];
      if (v21)
      {

        if (![(NSMutableArray *)self->_clusters count]) {
          goto LABEL_35;
        }
LABEL_20:
        v23 = [(NSMutableArray *)self->_clusters lastObject];
        __int16 v24 = [v23 visit];
        int v25 = [v24 exit];

        if (!v25)
        {
          long long v38 = [(NSMutableArray *)self->_clusters lastObject];
          long long v39 = [v38 visit];
          long long v40 = [v39 entry];
          v41 = [v4 visit];
          v42 = [v41 entry];
          char v43 = [v40 isEqualToDate:v42];

          if (v43)
          {
LABEL_31:
            [(NSMutableArray *)self->_clusters addObject:v4];
            goto LABEL_32;
          }
          v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            int v44 = 136315394;
            v45 = "-[RTVisitPipelineModuleSCI addToClusters:]";
            __int16 v46 = 1024;
            LODWORD(v47) = 323;
            _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "entry time of partial visit does not match (in %s:%d)", (uint8_t *)&v44, 0x12u);
          }
        }
        else
        {
LABEL_35:
          if (![(NSMutableArray *)self->_clusters count]) {
            goto LABEL_31;
          }
          if (self->_useLowConfidence) {
            goto LABEL_31;
          }
          uint64_t v26 = [(NSMutableArray *)self->_clusters lastObject];
          v27 = [v26 visit];
          double v28 = [v27 exit];
          v29 = [v4 visit];
          v30 = [v29 entry];
          char v31 = [v28 isBeforeDate:v30];

          if (v31) {
            goto LABEL_31;
          }
          v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = [(NSMutableArray *)self->_clusters lastObject];
            v34 = [v33 visit];
            v35 = [v34 exit];
            v36 = [v4 visit];
            long long v37 = [v36 entry];
            int v44 = 138413058;
            v45 = v35;
            __int16 v46 = 2112;
            __int16 v48 = 2080;
            v47 = v37;
            v49 = "-[RTVisitPipelineModuleSCI addToClusters:]";
            __int16 v50 = 1024;
            int v51 = 329;
            _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "overlap! last visit, %@, on or after new visit, %@ (in %s:%d)", (uint8_t *)&v44, 0x26u);
          }
        }

        goto LABEL_31;
      }
      __int16 v22 = [v4 points];

      if (v22) {
        goto LABEL_20;
      }
    }
  }
  else
  {
  }
LABEL_32:
}

- (void)addVisitFromWorkingHypothesis:(int64_t)a3 confidence:(double)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(RTVisitPipelineModuleSCI *)self isVisitInFlight])
  {
    unint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      __int16 v15 = "-[RTVisitPipelineModuleSCI addVisitFromWorkingHypothesis:confidence:]";
      __int16 v16 = 1024;
      LODWORD(v17) = 338;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "adding visit while FSM is not in correct state (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }
  }
  __int16 v9 = [(RTVisitSCIStayCluster *)self->_workingHypothesis createVisit:a3 confidence:a4];
  int v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    uint64_t v11 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v12 = [v9 visit];
    int v13 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
    int v14 = 138412802;
    __int16 v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@, detected visit, %@, %@", (uint8_t *)&v14, 0x20u);
  }
  [(RTVisitPipelineModuleSCI *)self addToClusters:v9];
}

- (id)getHintsNearLocation:(id)a3 withinDistance:(double)a4 sourceFilter:(id)a5 fromDate:(id)a6 limit:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if (!v15)
  {
    id v15 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v16 = objc_alloc(MEMORY[0x1E4F5CF30]);
  uint64_t v17 = [NSNumber numberWithDouble:a4];
  id v18 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
  uint64_t v20 = (void *)[v18 initWithStartDate:v15 endDate:v19];
  uint64_t v21 = (void *)[v16 initWithReferenceLocation:v13 sourceFilter:v14 ascending:0 distance:v17 dateInterval:v20 limit:a7 batchSize:a7];

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__147;
  v35 = __Block_byref_object_dispose__147;
  id v36 = [MEMORY[0x1E4F1CA48] array];
  __int16 v22 = [(RTHintManager *)self->_hintManager hintStore];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __92__RTVisitPipelineModuleSCI_getHintsNearLocation_withinDistance_sourceFilter_fromDate_limit___block_invoke;
  v26[3] = &unk_1E6B9BF18;
  v29 = &v31;
  SEL v30 = a2;
  id v23 = v13;
  id v27 = v23;
  double v28 = self;
  [v22 enumerateStoredHintsWithOptions:v21 usingBlock:v26];

  id v24 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v24;
}

void __92__RTVisitPipelineModuleSCI_getHintsNearLocation_withinDistance_sourceFilter_fromDate_limit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v5];
  }
  long long v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v9 = [v5 count];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    __int16 v12 = [*(id *)(a1 + 40) stateMachineConfidenceString];
    int v13 = 138413570;
    id v14 = v8;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%@, retrieved %ld hints near location, %@, total number of hints retrieved %ld, error %@, %@", (uint8_t *)&v13, 0x3Eu);
  }
}

- (BOOL)isHint:(id)a3 withinDistance:(double)a4 location:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  distanceCalculator = self->_distanceCalculator;
  __int16 v12 = [v9 location];
  id v21 = 0;
  [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v10 toLocation:v12 error:&v21];
  double v14 = v13;
  id v15 = v21;

  if (v15)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = NSStringFromSelector(a2);
      uint64_t v18 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
      *(_DWORD *)buf = 138413314;
      __int16 v23 = v17;
      __int16 v24 = 2112;
      id v25 = v10;
      __int16 v26 = 2112;
      id v27 = v9;
      __int16 v28 = 2112;
      id v29 = v15;
      __int16 v30 = 2112;
      uint64_t v31 = v18;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, While Computing distance between location, %@, and hint, %@, an error, %@ was observed, %@", buf, 0x34u);
    }
    BOOL v19 = 0;
  }
  else
  {
    BOOL v19 = v14 <= a4;
  }

  return v19;
}

- (id)filterHints:(id)a3 existingHints:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v13 = v6;
  if ([v7 count])
  {
    id v15 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v17 = 0;
          uint64_t v18 = &v17;
          uint64_t v19 = 0x2020000000;
          char v20 = 1;
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __54__RTVisitPipelineModuleSCI_filterHints_existingHints___block_invoke;
          v16[3] = &unk_1E6B9BF40;
          v16[4] = self;
          v16[5] = v11;
          v16[6] = &v17;
          [v7 enumerateObjectsUsingBlock:v16, v13];
          if (*((unsigned char *)v18 + 24)) {
            [v15 addObject:v11];
          }
          _Block_object_dispose(&v17, 8);
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v15 = v6;
  }

  return v15;
}

void __54__RTVisitPipelineModuleSCI_filterHints_existingHints___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v7 location];
  [v8 horizontalUncertainty];
  double v10 = v9;
  uint64_t v11 = [*(id *)(a1 + 40) location];
  [v11 horizontalUncertainty];
  double v13 = v10 + v12;
  double v14 = [*(id *)(a1 + 40) location];
  LODWORD(v6) = [v6 isHint:v7 withinDistance:v14 location:v13];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (id)retrieveNonLOIHintsNearLocation:(id)a3 withinDistance:(double)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [NSNumber numberWithInt:247];
  uint64_t v8 = [v6 date];
  double v9 = [(RTVisitPipelineModuleSCI *)self relevantDateForHintSource:1 date:v8];

  char v20 = (void *)v7;
  double v10 = [(RTVisitPipelineModuleSCI *)self getHintsNearLocation:v6 withinDistance:v7 sourceFilter:v9 fromDate:1000 limit:a4];
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    unsigned int v15 = 0;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (((v15 >> ([v18 source] + 1)) & 1) == 0)
        {
          v15 |= 1 << ([v18 source] + 1);
          [v11 addObject:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  return v11;
}

- (void)populateHintCacheNearLocation:(id)a3 withinDistance:(double)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (RTLocation *)a3;
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double v9 = NSStringFromSelector(a2);
    [(RTDistanceCalculator *)self->_distanceCalculator distanceFromLocation:v7 toLocation:self->_hintCacheUpdateLocation error:0];
    uint64_t v11 = v10;
    id v12 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
    int v29 = 138413314;
    __int16 v30 = v9;
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v7;
    __int16 v33 = 2048;
    double v34 = a4;
    __int16 v35 = 2048;
    uint64_t v36 = v11;
    __int16 v37 = 2112;
    long long v38 = v12;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, location, %@, distance, %.2f, distance to last cache update, %.2f, %@", (uint8_t *)&v29, 0x34u);
  }
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v14 = [NSNumber numberWithInt:8];
  unsigned int v15 = [(RTVisitPipelineModuleSCI *)self getHintsNearLocation:v7 withinDistance:v14 sourceFilter:0 fromDate:0 limit:a4];

  [v13 addObjectsFromArray:v15];
  uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = NSStringFromSelector(a2);
    uint64_t v18 = [v15 count];
    uint64_t v19 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
    int v29 = 138412802;
    __int16 v30 = v17;
    __int16 v31 = 2048;
    uint64_t v32 = v18;
    __int16 v33 = 2112;
    double v34 = *(double *)&v19;
    _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, retrieved LOI hints, %lu, %@", (uint8_t *)&v29, 0x20u);
  }
  if (!self->_useLowConfidence)
  {
    char v20 = [(RTVisitPipelineModuleSCI *)self retrieveNonLOIHintsNearLocation:v7 withinDistance:a4];
    long long v21 = [(RTVisitPipelineModuleSCI *)self filterHints:v20 existingHints:v15];
    [v13 addObjectsFromArray:v21];

    long long v22 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      long long v23 = NSStringFromSelector(a2);
      uint64_t v24 = [v20 count];
      id v25 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
      int v29 = 138412802;
      __int16 v30 = v23;
      __int16 v31 = 2048;
      uint64_t v32 = v24;
      __int16 v33 = 2112;
      double v34 = *(double *)&v25;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, retrieved NON-LOI hints, %lu, %@", (uint8_t *)&v29, 0x20u);
    }
  }
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithArray:v13];
  hintCache = self->_hintCache;
  self->_hintCache = v26;

  hintCacheUpdateLocation = self->_hintCacheUpdateLocation;
  self->_hintCacheUpdateLocation = v7;
}

- (id)hintsNearLocation:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  distanceCalculator = self->_distanceCalculator;
  hintCacheUpdateLocation = self->_hintCacheUpdateLocation;
  id v19 = 0;
  [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v5 toLocation:hintCacheUpdateLocation error:&v19];
  double v9 = v8;
  id v10 = v19;
  if (v10)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = NSStringFromSelector(a2);
      uint64_t v13 = self->_hintCacheUpdateLocation;
      uint64_t v14 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
      *(_DWORD *)buf = 138413314;
      long long v21 = v12;
      __int16 v22 = 2112;
      id v23 = v5;
      __int16 v24 = 2112;
      id v25 = v13;
      __int16 v26 = 2112;
      id v27 = v10;
      __int16 v28 = 2112;
      int v29 = v14;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, While Computing distance between location, %@, and location, %@, an error, %@ was observed setting distance to 0, %@", buf, 0x34u);
    }
  }
  else
  {
    if (v9 <= 1320.0) {
      goto LABEL_7;
    }
    hintCache = self->_hintCache;
    self->_hintCache = 0;

    uint64_t v11 = self->_hintCacheUpdateLocation;
    self->_hintCacheUpdateLocation = 0;
  }

LABEL_7:
  uint64_t v16 = self->_hintCache;
  if (!v16)
  {
    [(RTVisitPipelineModuleSCI *)self populateHintCacheNearLocation:v5 withinDistance:1500.0];
    uint64_t v16 = self->_hintCache;
  }
  uint64_t v17 = v16;

  return v17;
}

+ (BOOL)filterHint:(id)a3 sourceFilter:(id)a4 inverseFilter:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = v8;
  if (v7)
  {
    if (v8)
    {
      uint64_t v10 = [v8 integerValue];
      BOOL v11 = ((v10 & (1 << ([v7 source] + 1))) != 0) ^ a5;
    }
    else
    {
      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unsigned int v15 = 0;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sourceFilter", v15, 2u);
      }

      BOOL v11 = 1;
    }
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hint", buf, 2u);
    }

    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isHintConsistentWithLocation:(id)a3 hint:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = v8;
  if (v8)
  {
    distanceCalculator = self->_distanceCalculator;
    BOOL v11 = [v8 location];
    id v22 = 0;
    BOOL v12 = [(RTDistanceCalculator *)distanceCalculator checkConsistencyBetweenLocation:v11 otherLocation:v7 error:&v22];
    uint64_t v13 = v22;

    if (v13)
    {
      uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        unsigned int v15 = NSStringFromSelector(a2);
        uint64_t v16 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
        *(_DWORD *)buf = 138413314;
        __int16 v24 = v15;
        __int16 v25 = 2112;
        __int16 v26 = v9;
        __int16 v27 = 2112;
        id v28 = v7;
        __int16 v29 = 2112;
        uint64_t v30 = v13;
        __int16 v31 = 2112;
        uint64_t v32 = v16;
        _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, While processing hint, %@, near location, %@, an error, %@ was observed, %@", buf, 0x34u);
      }
    }
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v19 = NSStringFromSelector(a2);
      if (v12) {
        char v20 = @"YES";
      }
      else {
        char v20 = @"NO";
      }
      long long v21 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
      *(_DWORD *)buf = 138413314;
      __int16 v24 = v19;
      __int16 v25 = 2112;
      __int16 v26 = v9;
      __int16 v27 = 2112;
      id v28 = v7;
      __int16 v29 = 2112;
      uint64_t v30 = v20;
      __int16 v31 = 2112;
      uint64_t v32 = v21;
      _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "%@, Processing hint, %@, near location, %@, consistent, %@, %@", buf, 0x34u);
    }
  }
  else
  {
    uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hint", buf, 2u);
    }
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (id)getHintConsistentWithLocation:(id)a3 sourceFilter:(id)a4 inverseFilter:(BOOL)a5
{
  uint64_t v5 = a5;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v10 = [(RTVisitPipelineModuleSCI *)self hintsNearLocation:v8];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v37;
    double v15 = 1.79769313e308;
    id v32 = v9;
    uint64_t v33 = *(void *)v37;
    unsigned int v30 = v5;
    double v34 = v10;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([(id)objc_opt_class() filterHint:v17 sourceFilter:v9 inverseFilter:v5]
          && [(RTVisitPipelineModuleSCI *)self isHintConsistentWithLocation:v8 hint:v17])
        {
          uint64_t v18 = v13;
          distanceCalculator = self->_distanceCalculator;
          char v20 = [v17 location];
          id v35 = 0;
          [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v8 toLocation:v20 error:&v35];
          double v22 = v21;
          id v23 = v35;

          if (v23)
          {
            __int16 v24 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              __int16 v26 = v25 = v8;
              __int16 v27 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
              *(_DWORD *)buf = 138413314;
              v41 = v26;
              __int16 v42 = 2112;
              char v43 = v17;
              __int16 v44 = 2112;
              id v45 = v25;
              __int16 v46 = 2112;
              id v47 = v23;
              __int16 v48 = 2112;
              v49 = v27;
              _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, While processing hint, %@, near location, %@, an error, %@ was observed, %@", buf, 0x34u);

              id v9 = v32;
              id v8 = v25;
              uint64_t v5 = v30;
            }
          }
          uint64_t v13 = v18;
          if (!v18 || v15 > v22)
          {
            id v28 = v17;

            uint64_t v13 = v28;
            id v9 = v32;
            double v15 = v22;
          }
          uint64_t v14 = v33;

          uint64_t v10 = v34;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v50 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)getHintWithinDistance:(double)a3 ofLocation:(id)a4 sourceFilter:(id)a5 inverseFilter:(BOOL)a6
{
  uint64_t v6 = a6;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v40 = v10;
  id obj = [(RTVisitPipelineModuleSCI *)self hintsNearLocation:v10];
  uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v58 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    id v38 = 0;
    uint64_t v15 = *(void *)v43;
    double v16 = 1.79769313e308;
    *(void *)&long long v13 = 138413570;
    long long v34 = v13;
    unsigned int v36 = v6;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v42 + 1) + 8 * v17);
        if ([(id)objc_opt_class() filterHint:v18 sourceFilter:v11 inverseFilter:v6])
        {
          distanceCalculator = self->_distanceCalculator;
          char v20 = [v18 location];
          id v41 = 0;
          [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v40 toLocation:v20 error:&v41];
          double v22 = v21;
          id v23 = v41;

          if (v23)
          {
            __int16 v24 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              id v25 = NSStringFromSelector(a2);
              __int16 v26 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
              *(_DWORD *)buf = 138413314;
              id v47 = v25;
              __int16 v48 = 2112;
              v49 = v18;
              __int16 v50 = 2112;
              uint64_t v51 = v40;
              __int16 v52 = 2112;
              double v53 = *(double *)&v23;
              __int16 v54 = 2112;
              v55 = v26;
              _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%@, While processing hint, %@, near location, %@, an error, %@ was observed, %@", buf, 0x34u);

              uint64_t v6 = v36;
            }
          }
          __int16 v27 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            __int16 v29 = NSStringFromSelector(a2);
            unsigned int v30 = @"NO";
            if (v22 < a3) {
              unsigned int v30 = @"YES";
            }
            id v35 = v30;
            __int16 v31 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
            *(_DWORD *)buf = v34;
            id v47 = v29;
            __int16 v48 = 2112;
            v49 = v18;
            __int16 v50 = 2112;
            uint64_t v51 = v40;
            __int16 v52 = 2048;
            double v53 = a3;
            __int16 v54 = 2112;
            v55 = v35;
            __int16 v56 = 2112;
            v57 = v31;
            _os_log_debug_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEBUG, "%@, hint, %@, location, %@, distance %f, nearby, %@, %@", buf, 0x3Eu);

            uint64_t v6 = v36;
          }

          if (v22 < a3 && (!v38 || v16 > v22))
          {
            id v28 = v18;

            id v38 = v28;
            double v16 = v22;
          }
        }
        ++v17;
      }
      while (v14 != v17);
      uint64_t v32 = [obj countByEnumeratingWithState:&v42 objects:v58 count:16];
      uint64_t v14 = v32;
    }
    while (v32);
  }
  else
  {
    id v38 = 0;
  }

  return v38;
}

- (BOOL)isHintNearLocation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [NSNumber numberWithInt:8];
  id v7 = [(RTVisitPipelineModuleSCI *)self getHintConsistentWithLocation:v5 sourceFilter:v6 inverseFilter:0];

  if (!v7)
  {
    uint64_t v12 = [NSNumber numberWithInt:8];
    id v8 = [(RTVisitPipelineModuleSCI *)self getHintWithinDistance:v5 ofLocation:v12 sourceFilter:0 inverseFilter:180.0];

    if (v8)
    {
      id v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        long long v13 = NSStringFromSelector(a2);
        uint64_t v14 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
        int v20 = 138413058;
        double v21 = v13;
        __int16 v22 = 2112;
        id v23 = v8;
        __int16 v24 = 2112;
        id v25 = v5;
        __int16 v26 = 2112;
        __int16 v27 = v14;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, LOI Hint, %@, detected near location, %@, but not consistent, %@", (uint8_t *)&v20, 0x2Au);
      }
    }
    else
    {
      uint64_t v15 = [NSNumber numberWithInt:8];
      id v10 = [(RTVisitPipelineModuleSCI *)self getHintWithinDistance:v5 ofLocation:v15 sourceFilter:1 inverseFilter:180.0];

      if (v10)
      {
        double v16 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = NSStringFromSelector(a2);
          uint64_t v18 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
          int v20 = 138413058;
          double v21 = v17;
          __int16 v22 = 2112;
          id v23 = v10;
          __int16 v24 = 2112;
          id v25 = v5;
          __int16 v26 = 2112;
          __int16 v27 = v18;
          _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%@, Hint, %@, detected near location, %@, %@", (uint8_t *)&v20, 0x2Au);
        }
        BOOL v9 = 1;
        goto LABEL_12;
      }
    }
    BOOL v9 = 0;
LABEL_12:

    goto LABEL_13;
  }
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  BOOL v9 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
    int v20 = 138413058;
    double v21 = v10;
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v5;
    __int16 v26 = 2112;
    __int16 v27 = v11;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, LOI Hint, %@, detected near location, %@, %@", (uint8_t *)&v20, 0x2Au);

    goto LABEL_12;
  }
LABEL_13:

  return v9;
}

- (BOOL)isInWorkingHypothesis
{
  return self->_fsmState != 0;
}

- (BOOL)isVisitInFlight
{
  if (self->_useLowConfidence)
  {
    if (self->_lcFSMState == 1) {
      return 1;
    }
  }
  else if (self->_fsmState == 3)
  {
    return 1;
  }
  return 0;
}

- (id)handleFSM:(unint64_t)a3 point:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [(id)objc_opt_class() FSMStateToString:self->_fsmState];
  BOOL v9 = [(id)objc_opt_class() LCFSMStateToString:self->_lcFSMState];
  if (!self->_useLowConfidence) {
    goto LABEL_7;
  }
  unint64_t lcFSMState = self->_lcFSMState;
  if (lcFSMState != 1)
  {
    if (!lcFSMState)
    {
      char v11 = 0;
      if (a3 <= 0xA && ((1 << a3) & 0x510) != 0)
      {
        char v11 = 1;
        self->_unint64_t lcFSMState = 1;
        [(RTVisitPipelineModuleSCI *)self addVisitFromWorkingHypothesis:1 confidence:*MEMORY[0x1E4F5D018]];
      }
      goto LABEL_11;
    }
LABEL_7:
    char v11 = 0;
    goto LABEL_11;
  }
  char v11 = 0;
  if (a3 <= 7 && ((1 << a3) & 0xA8) != 0)
  {
    [(RTVisitPipelineModuleSCI *)self addVisitFromWorkingHypothesis:3 confidence:*MEMORY[0x1E4F5D018]];
    self->_unint64_t lcFSMState = 0;
    char v11 = 1;
  }
LABEL_11:
  unint64_t fsmState = self->_fsmState;
  if (fsmState - 2 < 2)
  {
    if (a3 != 1)
    {
      if (a3 == 2)
      {
        if (!v7)
        {
          uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            long long v34 = "-[RTVisitPipelineModuleSCI handleFSM:point:]";
            __int16 v35 = 1024;
            LODWORD(v36) = 774;
            _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "point is nil (in %s:%d)", buf, 0x12u);
          }
        }
        [(RTVisitSCIStayCluster *)self->_workingHypothesis addOutlier:v7];
        goto LABEL_37;
      }
      if (fsmState == 2)
      {
        if (a3 - 5 >= 2 && a3 != 3)
        {
          if (a3 != 4) {
            goto LABEL_61;
          }
          self->_unint64_t fsmState = 3;
          if (self->_useLowConfidence) {
            goto LABEL_37;
          }
          char v16 = 1;
          [(RTVisitPipelineModuleSCI *)self addVisitFromWorkingHypothesis:1 confidence:*MEMORY[0x1E4F5D010]];
LABEL_46:
          uint64_t v15 = 0;
          goto LABEL_63;
        }
      }
      else
      {
        if (a3 != 3)
        {
          if (a3 == 6)
          {
LABEL_37:
            uint64_t v15 = 0;
LABEL_60:
            char v16 = 1;
            goto LABEL_63;
          }
          if (a3 != 5) {
            goto LABEL_61;
          }
        }
        if (!self->_useLowConfidence) {
          [(RTVisitPipelineModuleSCI *)self addVisitFromWorkingHypothesis:3 confidence:*MEMORY[0x1E4F5D010]];
        }
      }
      uint64_t v15 = [(RTVisitSCIStayCluster *)self->_workingHypothesis outliers];
      [(RTVisitPipelineModuleSCI *)self resetWorkingHypothesis];
LABEL_59:
      self->_unint64_t fsmState = 0;
      goto LABEL_60;
    }
    if (!v7)
    {
      id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v34 = "-[RTVisitPipelineModuleSCI handleFSM:point:]";
        __int16 v35 = 1024;
        LODWORD(v36) = 778;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "point is nil (in %s:%d)", buf, 0x12u);
      }

      unint64_t fsmState = self->_fsmState;
    }
    char v16 = 1;
    [(RTVisitSCIStayCluster *)self->_workingHypothesis addNewPoint:v7 event:1 lcFSMState:self->_lcFSMState fsmState:fsmState];
    goto LABEL_46;
  }
  if (fsmState == 1)
  {
    uint64_t v15 = 0;
    if (a3 > 6)
    {
LABEL_62:
      char v16 = v11;
      goto LABEL_63;
    }
    if (((1 << a3) & 0x6C) == 0)
    {
      char v16 = v11;
      if (a3 == 1)
      {
        if (v7)
        {
          unint64_t v28 = 1;
        }
        else
        {
          __int16 v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            long long v34 = "-[RTVisitPipelineModuleSCI handleFSM:point:]";
            __int16 v35 = 1024;
            LODWORD(v36) = 761;
            _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "point is nil (in %s:%d)", buf, 0x12u);
          }

          unint64_t v28 = self->_fsmState;
        }
        char v16 = 1;
        [(RTVisitSCIStayCluster *)self->_workingHypothesis addNewPoint:v7 event:1 lcFSMState:self->_lcFSMState fsmState:v28];
        uint64_t v15 = 0;
        self->_unint64_t fsmState = 2;
      }
      goto LABEL_63;
    }
    [(RTVisitPipelineModuleSCI *)self resetWorkingHypothesis];
    uint64_t v15 = 0;
    goto LABEL_59;
  }
  if (fsmState)
  {
LABEL_61:
    uint64_t v15 = 0;
    goto LABEL_62;
  }
  if ([(RTVisitSCIStayCluster *)self->_workingHypothesis numOfDataPoints])
  {
    long long v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v34 = "-[RTVisitPipelineModuleSCI handleFSM:point:]";
      __int16 v35 = 1024;
      LODWORD(v36) = 736;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "nonzero data points outside working hypothesis (in %s:%d)", buf, 0x12u);
    }
  }
  if ([(RTVisitSCIStayCluster *)self->_workingHypothesis numOfOutliers])
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v34 = "-[RTVisitPipelineModuleSCI handleFSM:point:]";
      __int16 v35 = 1024;
      LODWORD(v36) = 737;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "unexpected outliers outside working hypothesis (in %s:%d)", buf, 0x12u);
    }
  }
  uint64_t v15 = 0;
  char v16 = 1;
  if (a3 - 5 >= 2 && a3 != 3)
  {
    if (a3 == 9)
    {
      if (!v7)
      {
        uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          long long v34 = "-[RTVisitPipelineModuleSCI handleFSM:point:]";
          __int16 v35 = 1024;
          LODWORD(v36) = 743;
          _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "point is nil (in %s:%d)", buf, 0x12u);
        }
      }
      [(RTVisitSCIStayCluster *)self->_workingHypothesis addNewPoint:v7 event:9 lcFSMState:self->_lcFSMState fsmState:self->_fsmState];
      uint64_t v15 = 0;
      char v16 = 1;
      self->_unint64_t fsmState = 1;
      goto LABEL_63;
    }
    goto LABEL_61;
  }
LABEL_63:
  int v20 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    uint64_t v32 = v8;
    unsigned int v30 = (char *)objc_claimAutoreleasedReturnValue();
    [(id)objc_opt_class() FSMEventToString:a3];
    __int16 v31 = v9;
    id v23 = (char *)objc_claimAutoreleasedReturnValue();
    __int16 v24 = [(id)objc_opt_class() FSMStateToString:self->_fsmState];
    id v25 = [(id)objc_opt_class() LCFSMStateToString:self->_lcFSMState];
    uint64_t v26 = [v15 count];
    __int16 v27 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
    *(_DWORD *)buf = 138414082;
    long long v34 = v30;
    __int16 v35 = 2112;
    unsigned int v36 = v23;
    __int16 v37 = 2112;
    id v38 = v32;
    __int16 v39 = 2112;
    long long v40 = v24;
    __int16 v41 = 2112;
    long long v42 = v31;
    __int16 v43 = 2112;
    long long v44 = v25;
    __int16 v45 = 2048;
    uint64_t v46 = v26;
    __int16 v47 = 2112;
    __int16 v48 = v27;
    _os_log_debug_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEBUG, "%@, event, %@, HC FSM inState, %@, HC FSM outState, %@, LC FSM inState, %@, LC FSM outState, %@, points left, %lu, %@", buf, 0x52u);

    BOOL v9 = v31;
    id v8 = v32;
  }

  if ((v16 & 1) == 0)
  {
    double v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      long long v34 = (const char *)a3;
      __int16 v35 = 2080;
      unsigned int v36 = "-[RTVisitPipelineModuleSCI handleFSM:point:]";
      __int16 v37 = 1024;
      LODWORD(v38) = 833;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "unhandled event, %lu (in %s:%d)", buf, 0x1Cu);
    }
  }

  return v15;
}

- (void)processPoints:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v84 = "-[RTVisitPipelineModuleSCI processPoints:]";
      __int16 v85 = 1024;
      LODWORD(v86) = 839;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "empty points (in %s:%d)", buf, 0x12u);
    }
  }
  if ([v4 count])
  {
    uint64_t v6 = [v4 count];
    unint64_t v7 = [(RTVisitSCIStayCluster *)self->_workingHypothesis numOfOutliers];
    if ([v4 count])
    {
      unint64_t v8 = 0;
      unint64_t v9 = (240 * (v7 + v6)) >> 1;
      unint64_t v10 = 0x1E4F1C000uLL;
      while (1)
      {
        char v11 = (void *)MEMORY[0x1E016D870]();
        if (v8 > v9)
        {
          uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v84 = "-[RTVisitPipelineModuleSCI processPoints:]";
            __int16 v85 = 1024;
            LODWORD(v86) = 847;
            _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "run out of loop while processing (in %s:%d)", buf, 0x12u);
          }
        }
        unint64_t v13 = v10;
        uint64_t v14 = [v4 firstObject];
        [v4 removeObjectAtIndex:0];
        uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          __int16 v54 = (char *)objc_claimAutoreleasedReturnValue();
          v55 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
          *(_DWORD *)buf = 138412802;
          v84 = v54;
          __int16 v85 = 2112;
          double v86 = *(double *)&v14;
          __int16 v87 = 2112;
          double v88 = *(double *)&v55;
          _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "%@, processing point, %@, %@", buf, 0x20u);
        }
        char v16 = [v14 date];
        uint64_t v17 = [(RTVisitSCIStayCluster *)self->_workingHypothesis lastProcessedSample];
        char v18 = [v16 isOnOrAfter:v17];

        if ((v18 & 1) == 0)
        {
          id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v84 = "-[RTVisitPipelineModuleSCI processPoints:]";
            __int16 v85 = 1024;
            LODWORD(v86) = 858;
            _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "new sample is out of order (in %s:%d)", buf, 0x12u);
          }
        }
        [v14 horizontalUncertainty];
        double v21 = v20;
        [(RTVisitHyperParameter *)self->_hyperParameter maxHorizontalAccuracy];
        unint64_t v10 = v13;
        if (v21 > v22 || ([v14 horizontalUncertainty], v23 < 0.0))
        {
          __int16 v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v84 = "-[RTVisitPipelineModuleSCI processPoints:]";
            __int16 v85 = 1024;
            LODWORD(v86) = 860;
            _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "uncertainty is out of range (in %s:%d)", buf, 0x12u);
          }
        }
        if ([(RTVisitSCIStayCluster *)self->_workingHypothesis numOfDataPoints]) {
          break;
        }
        uint64_t v33 = self;
        uint64_t v34 = 9;
LABEL_28:
        id v35 = [(RTVisitPipelineModuleSCI *)v33 handleFSM:v34 point:v14];
LABEL_46:

        ++v8;
        if (![v4 count]) {
          goto LABEL_58;
        }
      }
      id v25 = [v14 date];
      uint64_t v26 = [(RTVisitSCIStayCluster *)self->_workingHypothesis lastProcessedSample];
      [v25 timeIntervalSinceDate:v26];
      double v28 = v27;
      [(RTVisitHyperParameter *)self->_hyperParameter maxGapInVisit];
      double v30 = v29;

      if (v28 > v30)
      {
        __int16 v31 = [(RTVisitPipelineModuleSCI *)self handleFSM:3 point:0];
        [v4 insertObject:v14 atIndex:0];
        if ([v31 count])
        {
          [v31 addObjectsFromArray:v4];
          id v32 = v31;

          id v4 = v32;
        }
LABEL_45:

        goto LABEL_46;
      }
      [v14 latitude];
      [v14 longitude];
      unsigned int v36 = [(RTVisitSCIStayCluster *)self->_workingHypothesis centroid];
      [v36 latitude];
      __int16 v37 = [(RTVisitSCIStayCluster *)self->_workingHypothesis centroid];
      [v37 longitude];
      RTCommonCalculateDistance();
      double v39 = v38;

      workingHypothesis = self->_workingHypothesis;
      __int16 v41 = [v14 date];
      [(RTVisitSCIStayCluster *)workingHypothesis getRadiusForDate:v41];
      double v43 = v42;

      long long v44 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        __int16 v56 = (char *)objc_claimAutoreleasedReturnValue();
        v57 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
        *(_DWORD *)buf = 138413058;
        v84 = v56;
        __int16 v85 = 2048;
        double v86 = v39;
        __int16 v87 = 2048;
        double v88 = v43;
        __int16 v89 = 2112;
        v90 = v57;
        _os_log_debug_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_DEBUG, "%@, distance from working hypothesis, %.1fm, radius, %.1fm, %@", buf, 0x2Au);

        unint64_t v10 = v13;
      }

      if (v39 >= v43)
      {
        id v49 = [(RTVisitPipelineModuleSCI *)self handleFSM:2 point:v14];
        unint64_t v50 = [(RTVisitSCIStayCluster *)self->_workingHypothesis numOfOutliers];
        unint64_t v51 = v50;
        if (self->_useLowConfidence && self->_lcFSMState == 1 && (v50 > 3 || v39 >= 300.0)) {
          id v52 = [(RTVisitPipelineModuleSCI *)self handleFSM:7 point:v14];
        }
        if (![(RTVisitPipelineModuleSCI *)self isTimeOutsideClusterSatisfiedForOutlierCount:v51 location:v14])goto LABEL_46; {
        __int16 v31 = [(RTVisitPipelineModuleSCI *)self handleFSM:5 point:v14];
        }
        if ([v31 count])
        {
          [v31 addObjectsFromArray:v4];
          id v53 = v31;

          id v4 = v53;
        }
        goto LABEL_45;
      }
      id v45 = [(RTVisitPipelineModuleSCI *)self handleFSM:1 point:v14];
      if (self->_useLowConfidence
        && !self->_lcFSMState
        && [(RTVisitSCIStayCluster *)self->_workingHypothesis numOfDataPoints] >= 2)
      {
        uint64_t v46 = [(RTVisitSCIStayCluster *)self->_workingHypothesis centroid];
        BOOL v47 = [(RTVisitPipelineModuleSCI *)self isHintNearLocation:v46];

        if (v47)
        {
          uint64_t v48 = 8;
        }
        else
        {
          if (self->_fsmState != 3)
          {
LABEL_52:
            if (![(RTVisitPipelineModuleSCI *)self isDwellTimeSatisfiedForLocation:v14])
            {
              uint64_t v59 = [*(id *)(v10 + 2504) date];
              v60 = [v14 date];
              [v59 timeIntervalSinceDate:v60];
              double v62 = v61;
              [(RTVisitPipelineModuleSCI *)self minStaticIntervalForSLVArrival];
              double v64 = v63;

              if (v62 < v64)
              {
                v65 = self->_workingHypothesis;
                v66 = [v14 date];
                [(RTVisitSCIStayCluster *)v65 dwellTimeIntervalWithDate:v66];
                double v68 = v67;

                [(RTVisitPipelineModuleSCI *)self requiredDwellTimeForLocation:v14];
                double v70 = v69;
                double v71 = v69 - v68;
                v72 = *(void **)(v10 + 2504);
                v73 = [v14 date];
                v74 = [v72 dateWithTimeInterval:v73 sinceDate:v71];

                v75 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
                if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
                {
                  NSStringFromSelector(a2);
                  v81 = (char *)objc_claimAutoreleasedReturnValue();
                  v80 = [v74 stringFromDate];
                  uint64_t v76 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
                  *(_DWORD *)buf = 138413314;
                  v84 = v81;
                  __int16 v85 = 2048;
                  double v86 = v70;
                  __int16 v87 = 2048;
                  double v88 = v71;
                  __int16 v89 = 2112;
                  v90 = v80;
                  __int16 v91 = 2112;
                  uint64_t v92 = v76;
                  v77 = (void *)v76;
                  _os_log_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_INFO, "%@, requiredDwellTime, %.2f, remainingDwellTime, %.2f, nextPotentialEntryDate, %@, %@", buf, 0x34u);
                }
                [(RTDelayedLocationRequester *)self->_delayedLocationRequester updateFireDate:v74];

                unint64_t v10 = v13;
              }
              goto LABEL_46;
            }
            uint64_t v33 = self;
            uint64_t v34 = 4;
            goto LABEL_28;
          }
          uint64_t v48 = 10;
        }
        id v58 = [(RTVisitPipelineModuleSCI *)self handleFSM:v48 point:v14];
      }
      if (self->_fsmState == 3) {
        goto LABEL_46;
      }
      goto LABEL_52;
    }
LABEL_58:
    v78 = [v4 lastObject];
    lastPointProcessed = self->_lastPointProcessed;
    self->_lastPointProcessed = v78;
  }
}

- (double)requiredTimeOutsideClusterForOutlierCount:(unint64_t)a3 location:(id)a4
{
  id v6 = a4;
  unint64_t v7 = v6;
  double v8 = 0.0;
  if (a3 <= 0xF0)
  {
    if (a3 < 4)
    {
      uint64_t v12 = 0x7FEFFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t v9 = [v6 date];
      if ([(RTVisitPipelineModuleSCI *)self isValidLatestRegionHintSource:8 date:v9]&& ![(RTVisitPipelineModuleSCI *)self isLastRegionHintNearLocation:v7 hintSource:8])
      {

        goto LABEL_12;
      }
      unint64_t v10 = [v7 date];
      if ([(RTVisitPipelineModuleSCI *)self isValidLatestRegionHintSource:10 date:v10])
      {
        BOOL v11 = [(RTVisitPipelineModuleSCI *)self isLastRegionHintNearLocation:v7 hintSource:10];

        if (!v11) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      uint64_t v12 = 0x406E000000000000;
    }
    double v8 = *(double *)&v12;
  }
LABEL_12:

  return v8;
}

- (BOOL)isTimeOutsideClusterSatisfiedForOutlierCount:(unint64_t)a3 location:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  double v8 = [v7 date];
  unint64_t v9 = [(RTVisitSCIStayCluster *)self->_workingHypothesis potentialExit];
  [v8 timeIntervalSinceDate:v9];
  double v11 = v10;

  [(RTVisitPipelineModuleSCI *)self requiredTimeOutsideClusterForOutlierCount:a3 location:v7];
  double v13 = v12;

  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = NSStringFromSelector(a2);
    if (v11 < v13) {
      char v16 = @"NO";
    }
    else {
      char v16 = @"YES";
    }
    uint64_t v17 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
    int v19 = 138413314;
    double v20 = v15;
    __int16 v21 = 2048;
    double v22 = v13;
    __int16 v23 = 2048;
    double v24 = v11;
    __int16 v25 = 2112;
    uint64_t v26 = v16;
    __int16 v27 = 2112;
    double v28 = v17;
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, requiredTimeOutsideCluster, %f, timeOutsideCluster, %f, satisified, %@, %@", (uint8_t *)&v19, 0x34u);
  }
  return v11 >= v13;
}

- (double)requiredDwellTimeForLocation:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = (NSDate *)a3;
  requiredDwellTimeCacheDateToUpdate = self->_requiredDwellTimeCacheDateToUpdate;
  id v7 = [(NSDate *)v5 date];
  LODWORD(requiredDwellTimeCacheDateToUpdate) = [(NSDate *)requiredDwellTimeCacheDateToUpdate isBeforeDate:v7];

  if (requiredDwellTimeCacheDateToUpdate)
  {
    double v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = NSStringFromSelector(a2);
      double v10 = [(NSDate *)v5 date];
      double v11 = self->_requiredDwellTimeCacheDateToUpdate;
      double v12 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
      int v26 = 138413058;
      __int16 v27 = v9;
      __int16 v28 = 2112;
      double v29 = *(double *)&v10;
      __int16 v30 = 2112;
      __int16 v31 = v11;
      __int16 v32 = 2112;
      uint64_t v33 = v12;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, recomputing dwell time, location date, %@, cache time to update, %@, %@", (uint8_t *)&v26, 0x2Au);
    }
    double v13 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v14 = [(NSDate *)v5 date];
    uint64_t v15 = [v13 dateWithTimeInterval:v14 sinceDate:1.0];
    char v16 = self->_requiredDwellTimeCacheDateToUpdate;
    self->_requiredDwellTimeCacheDateToUpdate = v15;

    [(RTVisitPipelineModuleSCI *)self minStaticIntervalForSLVArrival];
    double v18 = v17;
    if ([(RTVisitPipelineModuleSCI *)self isHintNearLocation:v5])
    {
      [(RTVisitPipelineModuleSCI *)self minStaticIntervalForSLVArrivalWithHint];
      double v18 = v19;
    }
    if ([(RTVisitPipelineModuleSCI *)self isLastRegionHintNearLocation:v5 hintSource:9]|| [(RTVisitPipelineModuleSCI *)self isLastRegionHintNearLocation:v5 hintSource:7])
    {
      double v18 = 0.0;
    }
    self->_double requiredDwellTimeCache = v18;
  }
  double v20 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    __int16 v21 = NSStringFromSelector(a2);
    double requiredDwellTimeCache = self->_requiredDwellTimeCache;
    __int16 v23 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
    int v26 = 138413058;
    __int16 v27 = v21;
    __int16 v28 = 2048;
    double v29 = requiredDwellTimeCache;
    __int16 v30 = 2112;
    __int16 v31 = v5;
    __int16 v32 = 2112;
    uint64_t v33 = v23;
    _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, requiredDwellTime, %f, location, %@, %@", (uint8_t *)&v26, 0x2Au);
  }
  double v24 = self->_requiredDwellTimeCache;

  return v24;
}

- (BOOL)isDwellTimeSatisfiedForLocation:(id)a3
{
  workingHypothesis = self->_workingHypothesis;
  id v5 = a3;
  id v6 = [v5 date];
  [(RTVisitSCIStayCluster *)workingHypothesis dwellTimeIntervalWithDate:v6];
  double v8 = v7;

  [(RTVisitPipelineModuleSCI *)self requiredDwellTimeForLocation:v5];
  double v10 = v9;

  return v8 >= v10;
}

- (id)getLastHintUsingSourceFilter:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F5CF30]);
  id v7 = objc_alloc(MEMORY[0x1E4F28C18]);
  double v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  double v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
  double v10 = (void *)[v7 initWithStartDate:v8 endDate:v9];
  double v11 = (void *)[v6 initWithReferenceLocation:0 sourceFilter:v5 ascending:0 distance:0 dateInterval:v10 limit:1 batchSize:1];

  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x3032000000;
  double v24 = __Block_byref_object_copy__147;
  __int16 v25 = __Block_byref_object_dispose__147;
  id v26 = 0;
  double v12 = [(RTHintManager *)self->_hintManager hintStore];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__RTVisitPipelineModuleSCI_getLastHintUsingSourceFilter___block_invoke;
  v16[3] = &unk_1E6B9BF18;
  double v19 = &v21;
  SEL v20 = a2;
  id v13 = v5;
  id v17 = v13;
  double v18 = self;
  [v12 enumerateStoredHintsWithOptions:v11 usingBlock:v16];

  id v14 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v14;
}

void __57__RTVisitPipelineModuleSCI_getLastHintUsingSourceFilter___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = [v3 firstObject];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    double v11 = [*(id *)(a1 + 40) stateMachineConfidenceString];
    int v12 = 138413058;
    id v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    double v19 = v11;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, sourceFilter, %@, hint, %@, %@", (uint8_t *)&v12, 0x2Au);
  }
}

- (void)refreshLatestGeofenceHintCache
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_latestGeofenceHintChecked)
  {
    uint64_t v4 = [NSNumber numberWithInt:768];
    uint64_t v5 = [(RTVisitPipelineModuleSCI *)self getLastHintUsingSourceFilter:v4];
    latestGeofenceHint = self->_latestGeofenceHint;
    self->_latestGeofenceHint = v5;

    self->_latestGeofenceHintChecked = 1;
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v8 = NSStringFromSelector(a2);
      uint64_t v9 = self->_latestGeofenceHint;
      uint64_t v10 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
      int v11 = 138412802;
      int v12 = v8;
      __int16 v13 = 2112;
      __int16 v14 = v9;
      __int16 v15 = 2112;
      __int16 v16 = v10;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, lastGeofenceHint, %@, %@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)refreshLatestSignificantRegionHintCache
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_latestSignificantRegionHintChecked)
  {
    uint64_t v4 = [NSNumber numberWithInt:3072];
    uint64_t v5 = [(RTVisitPipelineModuleSCI *)self getLastHintUsingSourceFilter:v4];
    latestSignificantRegionHint = self->_latestSignificantRegionHint;
    self->_latestSignificantRegionHint = v5;

    self->_latestSignificantRegionHintChecked = 1;
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v8 = NSStringFromSelector(a2);
      uint64_t v9 = self->_latestSignificantRegionHint;
      uint64_t v10 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
      int v11 = 138412802;
      int v12 = v8;
      __int16 v13 = 2112;
      __int16 v14 = v9;
      __int16 v15 = 2112;
      __int16 v16 = v10;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, latestSignificantRegionHint, %@, %@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (id)relevantDateForHintSource:(int64_t)a3 date:(id)a4
{
  id v6 = a4;
  if (a3 == 9 || a3 == 7)
  {
    id v7 = (void *)MEMORY[0x1E4F1C9C8];
    [(RTVisitPipelineModuleSCI *)self minStaticIntervalForSLVArrival];
    double v9 = -v8;
    uint64_t v10 = v7;
  }
  else if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 8)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1C9C8];
    double v9 = -240.0;
  }
  else
  {
    int v11 = (void *)MEMORY[0x1E4F1C9C8];
    if (a3 == 1)
    {
      double v9 = -43200.0;
    }
    else
    {
      [(RTVisitPipelineModuleSCI *)self minStaticIntervalForSLVArrival];
      double v9 = -v12;
    }
    uint64_t v10 = v11;
  }
  __int16 v13 = [v10 dateWithTimeInterval:v6 sinceDate:v9];

  return v13;
}

- (BOOL)isValidLatestRegionHintSource:(int64_t)a3 date:(id)a4
{
  id v6 = a4;
  [(RTVisitPipelineModuleSCI *)self refreshCachedHintOfSource:a3];
  id v7 = [(RTVisitPipelineModuleSCI *)self latestCachedHintOfSource:a3];
  double v8 = v7;
  if (!v7 || (BOOL v9 = (unint64_t)(a3 - 7) < 4, [v7 source] != a3)) {
    BOOL v9 = 0;
  }
  uint64_t v10 = [(RTVisitPipelineModuleSCI *)self relevantDateForHintSource:a3 date:v6];
  int v11 = [v8 date];
  char v12 = [v11 isBeforeDate:v10];

  return v9 & (v12 ^ 1);
}

- (BOOL)isLastRegionHintNearLocation:(id)a3 hintSource:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = v7;
  if ((unint64_t)(a4 - 7) >= 4)
  {
    char v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hintSource == RTHintSourceGeoFenceEntry || hintSource == RTHintSourceGeoFenceExit || hintSource == RTHintSourceSignificantRegionEntry || hintSource == RTHintSourceSignificantRegionExit", (uint8_t *)&v19, 2u);
    }
    LOBYTE(v11) = 0;
    goto LABEL_9;
  }
  BOOL v9 = [v7 date];

  if (!v9)
  {
    LOBYTE(v11) = 0;
    goto LABEL_11;
  }
  uint64_t v10 = [v8 date];
  BOOL v11 = [(RTVisitPipelineModuleSCI *)self isValidLatestRegionHintSource:a4 date:v10];

  if (v11)
  {
    char v12 = [(RTVisitPipelineModuleSCI *)self latestCachedHintOfSource:a4];
    BOOL v11 = [(RTVisitPipelineModuleSCI *)self isHintConsistentWithLocation:v8 hint:v12];
    __int16 v13 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      __int16 v15 = NSStringFromSelector(a2);
      __int16 v16 = [MEMORY[0x1E4F5CDF0] hintSourceToString:a4];
      if (v11) {
        uint64_t v17 = @"YES";
      }
      else {
        uint64_t v17 = @"NO";
      }
      __int16 v18 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
      int v19 = 138413570;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      double v22 = v8;
      __int16 v23 = 2112;
      double v24 = v16;
      __int16 v25 = 2112;
      id v26 = v12;
      __int16 v27 = 2112;
      __int16 v28 = v17;
      __int16 v29 = 2112;
      __int16 v30 = v18;
      _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "%@, location, %@, hintSource, %@, lastRegionHint, %@, consistent, %@, %@", (uint8_t *)&v19, 0x3Eu);
    }
LABEL_9:
  }
LABEL_11:

  return v11;
}

- (id)process:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v76 = "-[RTVisitPipelineModuleSCI process:]";
      __int16 v77 = 1024;
      LODWORD(v78) = 1220;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "empty in clustesr or nil (in %s:%d)", buf, 0x12u);
    }
  }
  if (![v4 count])
  {
    long long v44 = 0;
    goto LABEL_54;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v61 = v4;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v70 objects:v83 count:16];
  if (!v6) {
    goto LABEL_31;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v71;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v71 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v70 + 1) + 8 * v9);
      BOOL v11 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        uint64_t v34 = (char *)objc_claimAutoreleasedReturnValue();
        id v35 = (objc_class *)objc_opt_class();
        unsigned int v36 = NSStringFromClass(v35);
        __int16 v37 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
        *(_DWORD *)buf = 138413058;
        uint64_t v76 = v34;
        __int16 v77 = 2112;
        unint64_t v78 = (unint64_t)v36;
        __int16 v79 = 2112;
        v80 = v10;
        __int16 v81 = 2112;
        v82 = v37;
        _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "%@, %@ working on cluster, %@, %@", buf, 0x2Au);
      }
      char v12 = [v10 points];
      __int16 v13 = [v12 locations];

      __int16 v14 = [v10 points];

      if (!v14)
      {
        __int16 v29 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
LABEL_24:

          [(RTVisitPipelineModuleSCI *)self exitUntilNotInWorkingHypotheisWithBlock:0];
          goto LABEL_25;
        }
        NSStringFromSelector(a2);
        __int16 v30 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v31 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
        *(_DWORD *)buf = 138412546;
        uint64_t v76 = v30;
        __int16 v77 = 2112;
        unint64_t v78 = (unint64_t)v31;
        __int16 v32 = v29;
        uint64_t v33 = "%@, received forced exit signal, %@";
LABEL_29:
        _os_log_debug_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_DEBUG, v33, buf, 0x16u);

        goto LABEL_24;
      }
      __int16 v15 = [v13 firstObject];
      __int16 v16 = [v15 date];
      uint64_t v17 = [(RTVisitSCIStayCluster *)self->_workingHypothesis lastProcessedSample];
      char v18 = [v16 isOnOrAfter:v17];

      if ((v18 & 1) == 0)
      {
        int v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v76 = "-[RTVisitPipelineModuleSCI process:]";
          __int16 v77 = 1024;
          LODWORD(v78) = 1238;
          _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "new point is out of order (in %s:%d)", buf, 0x12u);
        }
      }
      uint64_t v20 = [v13 firstObject];
      __int16 v21 = [v20 date];
      double v22 = [(RTVisitSCIStayCluster *)self->_workingHypothesis lastProcessedSample];
      int v23 = [v21 isOnOrAfter:v22];

      if (v23)
      {
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __36__RTVisitPipelineModuleSCI_process___block_invoke;
        v69[3] = &unk_1E6B9BF68;
        v69[4] = v10;
        v69[5] = self;
        [(RTVisitPipelineModuleSCI *)self exitUntilNotInWorkingHypotheisWithBlock:v69];
        double v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v13 copyItems:0];
        [(RTVisitPipelineModuleSCI *)self processPoints:v24];

        __int16 v25 = [v10 visit];
        uint64_t v26 = [v25 exit];
        if (v26)
        {
          __int16 v27 = (void *)v26;
          BOOL v28 = [(RTVisitPipelineModuleSCI *)self isInWorkingHypothesis];

          if (!v28) {
            goto LABEL_25;
          }
          __int16 v29 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_24;
          }
          NSStringFromSelector(a2);
          __int16 v30 = (char *)objc_claimAutoreleasedReturnValue();
          uint64_t v31 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
          *(_DWORD *)buf = 138412546;
          uint64_t v76 = v30;
          __int16 v77 = 2112;
          unint64_t v78 = (unint64_t)v31;
          __int16 v32 = v29;
          uint64_t v33 = "%@, in cluster is terminated and we are still in working hypothesis, %@";
          goto LABEL_29;
        }
      }
LABEL_25:

      ++v9;
    }
    while (v7 != v9);
    uint64_t v38 = [obj countByEnumeratingWithState:&v70 objects:v83 count:16];
    uint64_t v7 = v38;
  }
  while (v38);
LABEL_31:

  if ([(RTVisitSCIStayCluster *)self->_workingHypothesis numOfResiduePoints]
    && [(RTVisitPipelineModuleSCI *)self isVisitInFlight])
  {
    if ([(NSMutableArray *)self->_clusters count])
    {
      double v39 = [(NSMutableArray *)self->_clusters lastObject];
      long long v40 = [v39 visit];
      __int16 v41 = [v40 exit];

      if (v41)
      {
        double v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v76 = "-[RTVisitPipelineModuleSCI process:]";
          __int16 v77 = 1024;
          LODWORD(v78) = 1260;
          _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "unexpected in flight points (in %s:%d)", buf, 0x12u);
        }
      }
    }
    double v43 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      id v58 = (char *)objc_claimAutoreleasedReturnValue();
      unint64_t v59 = [(RTVisitSCIStayCluster *)self->_workingHypothesis numOfResiduePoints];
      v60 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
      *(_DWORD *)buf = 138412802;
      uint64_t v76 = v58;
      __int16 v77 = 2048;
      unint64_t v78 = v59;
      __int16 v79 = 2112;
      v80 = v60;
      _os_log_debug_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_DEBUG, "%@, add partial visit to capture %lu in flight points, %@", buf, 0x20u);
    }
    [(RTVisitPipelineModuleSCI *)self addVisitFromWorkingHypothesis:1 confidence:*MEMORY[0x1E4F5D010]];
  }
  long long v44 = self->_clusters;
  id v45 = (NSMutableArray *)objc_opt_new();
  clusters = self->_clusters;
  self->_clusters = v45;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v44 = v44;
    uint64_t v47 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v65 objects:v74 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v66;
      obja = v44;
      do
      {
        uint64_t v50 = 0;
        do
        {
          if (*(void *)v66 != v49) {
            objc_enumerationMutation(v44);
          }
          unint64_t v51 = *(void **)(*((void *)&v65 + 1) + 8 * v50);
          id v52 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            id v53 = (char *)objc_claimAutoreleasedReturnValue();
            __int16 v54 = (objc_class *)objc_opt_class();
            v55 = NSStringFromClass(v54);
            __int16 v56 = [(RTVisitPipelineModuleSCI *)self stateMachineConfidenceString];
            *(_DWORD *)buf = 138413058;
            uint64_t v76 = v53;
            __int16 v77 = 2112;
            unint64_t v78 = (unint64_t)v55;
            __int16 v79 = 2112;
            v80 = v51;
            __int16 v81 = 2112;
            v82 = v56;
            _os_log_debug_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_DEBUG, "%@, %@ adding to output clusters, %@, %@", buf, 0x2Au);

            long long v44 = obja;
          }

          ++v50;
        }
        while (v48 != v50);
        uint64_t v48 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v65 objects:v74 count:16];
      }
      while (v48);
    }
  }
  id v4 = v61;
LABEL_54:

  return v44;
}

uint64_t __36__RTVisitPipelineModuleSCI_process___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 80) potentialEntry];
  LODWORD(v2) = [v2 isExitDateBeforeDate:v3];

  if (v2)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[RTVisitPipelineModuleSCI process:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 1244;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "working hypothesis is in the future (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }
  }
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 80) potentialEntry];
  uint64_t v7 = [v5 isDateInside:v6];

  return v7;
}

- (RTVisitSCIStayCluster)workingHypothesis
{
  return self->_workingHypothesis;
}

- (unint64_t)fsmState
{
  return self->_fsmState;
}

- (unint64_t)lcFSMState
{
  return self->_lcFSMState;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDelayedLocationRequester)delayedLocationRequester
{
  return self->_delayedLocationRequester;
}

- (void)setDelayedLocationRequester:(id)a3
{
}

- (RTHintManager)hintManager
{
  return self->_hintManager;
}

- (void)setHintManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RTVisitHyperParameter)hyperParameter
{
  return self->_hyperParameter;
}

- (void)setHyperParameter:(id)a3
{
}

- (BOOL)latestGeofenceHintChecked
{
  return self->_latestGeofenceHintChecked;
}

- (void)setLatestGeofenceHintChecked:(BOOL)a3
{
  self->_latestGeofenceHintChecked = a3;
}

- (RTHint)latestGeofenceHint
{
  return self->_latestGeofenceHint;
}

- (void)setLatestGeofenceHint:(id)a3
{
}

- (BOOL)latestSignificantRegionHintChecked
{
  return self->_latestSignificantRegionHintChecked;
}

- (void)setLatestSignificantRegionHintChecked:(BOOL)a3
{
  self->_latestSignificantRegionHintChecked = a3;
}

- (RTHint)latestSignificantRegionHint
{
  return self->_latestSignificantRegionHint;
}

- (void)setLatestSignificantRegionHint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSignificantRegionHint, 0);
  objc_storeStrong((id *)&self->_latestGeofenceHint, 0);
  objc_storeStrong((id *)&self->_hyperParameter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_hintManager, 0);
  objc_storeStrong((id *)&self->_delayedLocationRequester, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_workingHypothesis, 0);
  objc_storeStrong((id *)&self->_requiredDwellTimeCacheDateToUpdate, 0);
  objc_storeStrong((id *)&self->_hintCacheUpdateLocation, 0);
  objc_storeStrong((id *)&self->_hintCache, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_lastPointProcessed, 0);

  objc_storeStrong((id *)&self->_clusters, 0);
}

@end