@interface RTStateModel
+ (double)deriveClusterThresholdFromUncClustAplha:(double)a3 andUncClustBeta:(double)a4;
+ (double)getOutOfStateConfidenceWithOneStatePred:(id)a3;
- (BOOL)anyClusterOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 andEnteredEarlierThan:(double)a5;
- (CLLocationCoordinate2D)getEndingCoordinateWithStartingLocation:(id)a3 distance:(double)a4;
- (NSMutableDictionary)stateModelLut;
- (OS_dispatch_queue)queue;
- (RTMetricManager)metricManager;
- (RTStateModel)init;
- (RTStateModel)initWithLearnedLocationsOfInterest:(id)a3 metricManager:(id)a4 queue:(id)a5;
- (RTStateModelEarliestLatestEl)earliestLatestStateModelEl;
- (double)getMaxDistFromInterval:(double)a3 withVelocity:(double)a4;
- (double)getNumberOfWeeksInStateModel;
- (id)_getNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5;
- (id)_getRecursivelyAllLOIsWithinDistance:(double)a3 ofLocation:(id)a4 previouslyFoundLocationsOfInterest:(id)a5;
- (id)findClusterWithLocation:(id)a3;
- (id)getAllLOIsWithinDistance:(double)a3 ofLocation:(id)a4;
- (id)getLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4;
- (id)getMostRecentLocationForDate:(id)a3;
- (id)getOOStClusterData:(double)a3 predictionWindow:(double)a4 numOfWeeks:(int)a5 refLoc:(id)a6;
- (id)getPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4;
- (id)getPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4;
- (id)getPredictedLocationsOfInterestWithCriteria:(id)a3;
- (unsigned)calculateStateModelAvailabilityPrecisionRecallOnDate:(id)a3 predictedLocations:(id)a4 isHighConfidenceOnly:(BOOL)a5;
- (void)collectMetricsWithIntervalSinceLastUpdate:(double)a3;
- (void)logStateModelAvailabilityMetricWithIntervalSinceLastUpdate:(double)a3 untilNow:(id)a4;
- (void)setEarliestLatestStateModelEl:(id)a3;
- (void)setMetricManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStateModelLut:(id)a3;
- (void)updateInternalState;
@end

@implementation RTStateModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateModelLut, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_earliestLatestStateModelEl, 0);
}

- (void)updateInternalState
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x426D1A94A2000000;
  uint64_t v15 = 0;
  v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  unint64_t v18 = 0xC26D1A94A2000000;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__123;
  v13[4] = __Block_byref_object_dispose__123;
  id v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__123;
  v11[4] = __Block_byref_object_dispose__123;
  id v12 = 0;
  v3 = [(RTStateModel *)self stateModelLut];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__RTStateModel_updateInternalState__block_invoke;
  v10[3] = &unk_1E6B9A768;
  v10[4] = &v19;
  v10[5] = &v15;
  v10[6] = v11;
  v10[7] = v13;
  [v3 enumerateKeysAndObjectsUsingBlock:v10];

  v4 = [RTStateModelEarliestLatestEl alloc];
  v5 = [(RTStateModelEarliestLatestEl *)v4 initWithEarliest:v20[3] andLatest:v16[3]];
  [(RTStateModel *)self setEarliestLatestStateModelEl:v5];

  v6 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [MEMORY[0x1E4F1C9C8] stringFromTimestamp:v20[3]];
    v8 = [MEMORY[0x1E4F1C9C8] stringFromTimestamp:v16[3]];
    double v9 = v16[3] - v20[3];
    *(_DWORD *)buf = 138412802;
    id v24 = v7;
    __int16 v25 = 2112;
    v26 = v8;
    __int16 v27 = 2048;
    double v28 = v9 / 604800.0;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "earliest entry %@, latest entry %@, total duration, %f wks", buf, 0x20u);
  }
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

- (id)_getNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v93 = a3;
  id v90 = a4;
  [v90 timeIntervalSinceReferenceDate];
  double v10 = v9;
  double v11 = 3600.0;
  if (a5 >= 3600.0)
  {
    double v11 = 86400.0;
    if (a5 <= 86400.0) {
      goto LABEL_7;
    }
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = 0x40F5180000000000;
      v13 = "Forcing maximum prediction window %fs";
      goto LABEL_86;
    }
  }
  else
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = 0x40AC200000000000;
      v13 = "Forcing minimum prediction window %fs";
LABEL_86:
      _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, v13, buf, 0xCu);
    }
  }

  a5 = v11;
LABEL_7:
  [(RTStateModel *)self getMaxDistFromInterval:a5 withVelocity:20.0];
  double v15 = v14;
  v95 = [[RTStateModelLocation alloc] initWithRTLocation:v93];
  v91 = objc_opt_new();
  v16 = [(RTStateModel *)self earliestLatestStateModelEl];

  if (v16)
  {
    [(RTStateModel *)self getNumberOfWeeksInStateModel];
    double v18 = v17;
    unsigned int v19 = vcvtmd_s64_f64(v17);
    if (v17 <= 6.0) {
      LODWORD(v16) = v19;
    }
    else {
      LODWORD(v16) = 6;
    }
  }
  else
  {
    double v18 = 0.0;
  }
  if (v95)
  {
    v94 = -[RTStateModel findClusterWithLocation:](self, "findClusterWithLocation:");
  }
  else
  {
    v94 = 0;
  }
  BOOL v20 = [(RTStateModel *)self anyClusterOfInterestWithinDistance:v93 ofLocation:v15 andEnteredEarlierThan:v10 + -1209600.0];
  BOOL v21 = v20;
  double v22 = 0.0;
  if (v18 >= 2.0) {
    double v22 = 1.0;
  }
  if (v20) {
    double v23 = 1.0;
  }
  else {
    double v23 = v22;
  }
  if (v20) {
    uint64_t v24 = v16;
  }
  else {
    uint64_t v24 = 1;
  }
  __int16 v25 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = NSStringFromSelector(a2);
    uint64_t v27 = [v90 stringFromDate];
    double v28 = (void *)v27;
    uint64_t v29 = @"YES";
    *(_DWORD *)buf = 138413827;
    *(void *)&uint8_t buf[4] = v26;
    *(_WORD *)&buf[12] = 2112;
    if (v21) {
      uint64_t v29 = @"NO";
    }
    *(void *)&buf[14] = v95;
    *(_WORD *)&buf[22] = 2112;
    v133 = (uint64_t (*)(uint64_t, uint64_t))v27;
    *(_WORD *)v134 = 2048;
    *(double *)&v134[2] = a5;
    *(_WORD *)&v134[10] = 2049;
    *(double *)&v134[12] = v18;
    __int16 v135 = 1025;
    int v136 = v24;
    __int16 v137 = 2112;
    v138 = v29;
    _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@, location, %@, startDate, %@, predictionWindow, %.2f, number of weeks in State Model, %{private}f, number of weeks for prediciton, %{private}d, sparse mode, %@", buf, 0x44u);
  }
  v92 = [(RTStateModel *)self getOOStClusterData:v24 predictionWindow:v95 numOfWeeks:v10 refLoc:a5];
  int v30 = !v21;
  if (v94) {
    char v31 = !v21;
  }
  else {
    char v31 = 1;
  }
  if (v31)
  {
    int v32 = 0;
    id v33 = 0;
    goto LABEL_57;
  }
  v34 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v94;
    _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "reference location resolves to inside the state model, %@", buf, 0xCu);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v133 = __Block_byref_object_copy__123;
  *(void *)v134 = __Block_byref_object_dispose__123;
  *(void *)&v134[8] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v35 = [v94 stateTransitions];
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke;
  v130[3] = &unk_1E6B9A790;
  *(double *)&v130[5] = v10;
  *(double *)&v130[6] = a5;
  int v131 = v24;
  v130[4] = buf;
  [v35 enumerateKeysAndObjectsUsingBlock:v130];

  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v89 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v18 <= 2.0)
  {
    id v33 = v36;
    v41 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v119 = 0;
      _os_log_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_INFO, "Selecting Daily Intervals - IN-STATE-OP", v119, 2u);
    }

    [v33 sortUsingComparator:&__block_literal_global_73];
    BOOL v40 = 0;
  }
  else
  {
    v37 = *(void **)(*(void *)&buf[8] + 40);
    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_2;
    v123[3] = &unk_1E6B9A7B8;
    v123[4] = self;
    v124 = v95;
    double v128 = v10;
    id v125 = v92;
    double v129 = v15;
    id v38 = v89;
    id v126 = v38;
    id v127 = v36;
    [v37 enumerateObjectsUsingBlock:v123];

    id v33 = v38;
    v39 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v119 = 0;
      _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "Selecting Weekly Intervals - IN-STATE-OP", v119, 2u);
    }

    [v33 sortUsingComparator:&__block_literal_global_97];
    BOOL v40 = [v33 count] == 0;
  }
  v42 = [v33 firstObject];
  v43 = [v42 stateUUID];
  v44 = [v94 uniqueId];
  BOOL v45 = v43 == v44;

  if (v45)
  {

    v46 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v119 = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_DEBUG, "We are staying home and not really going anywhere - reverting into out of state model to verify!!", v119, 2u);
    }

    id v33 = 0;
    BOOL v40 = 1;
  }
  else
  {
    *(void *)v119 = 0;
    v120 = v119;
    uint64_t v121 = 0x2020000000;
    uint64_t v122 = -1;
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_74;
    v116[3] = &unk_1E6B958D8;
    id v117 = v94;
    v118 = v119;
    [v33 enumerateObjectsUsingBlock:v116];
    if ((*((void *)v120 + 3) & 0x8000000000000000) == 0) {
      [v33 removeObjectAtIndex:];
    }

    _Block_object_dispose(v119, 8);
  }
  v47 = [(RTStateModel *)self stateModelLut];
  v48 = [v33 firstObject];
  v49 = [v48 stateUUID];
  v50 = [v47 objectForKey:v49];

  if (!v50) {
    goto LABEL_53;
  }
  v51 = [v50 stateDepiction];
  v52 = [v51 location];
  [v52 Latitude_deg];
  v53 = [v50 stateDepiction];
  v54 = [v53 location];
  [v54 Longitude_deg];
  [(RTStateModelLocation *)v95 Latitude_deg];
  [(RTStateModelLocation *)v95 Longitude_deg];
  RTCommonCalculateDistanceHighPrecision();
  double v56 = v55;

  if (v56 < 700.0)
  {

    v57 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v119 = 0;
      _os_log_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_INFO, "in-state recommendation is too close in distance - reverting to out of State estimate", v119, 2u);
    }

    id v33 = 0;
  }
  else
  {
LABEL_53:
    if (!v40)
    {
      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_75;
      v112[3] = &unk_1E6B9A7E0;
      v112[4] = self;
      id v113 = v89;
      double v115 = v23;
      id v114 = v91;
      [v33 enumerateObjectsUsingBlock:v112];

      int v32 = 0;
      goto LABEL_56;
    }
  }
  int v32 = 1;
LABEL_56:
  v58 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = 0;

  _Block_object_dispose(buf, 8);
  int v30 = !v21;
LABEL_57:
  if (v94) {
    int v59 = v32;
  }
  else {
    int v59 = 1;
  }
  if ((v59 | v30) == 1)
  {
    v60 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      v61 = @"YES";
      if (v94) {
        v62 = @"YES";
      }
      else {
        v62 = @"NO";
      }
      if (v32) {
        v63 = @"YES";
      }
      else {
        v63 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v62;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v63;
      if (v21) {
        v61 = @"NO";
      }
      *(_WORD *)&buf[22] = 2112;
      v133 = (uint64_t (*)(uint64_t, uint64_t))v61;
      _os_log_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_INFO, "Entering OutOfState: state at reference location, %@, revertToOutOfStateLogic requested, %@, sparseData, %@", buf, 0x20u);
    }

    id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v66 = [v92 selectOOStStates];
    v104[0] = MEMORY[0x1E4F143A8];
    v104[1] = 3221225472;
    v104[2] = __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_76;
    v104[3] = &unk_1E6B9A808;
    v104[4] = self;
    v105 = v95;
    double v109 = v10;
    char v111 = v30;
    id v67 = v92;
    id v106 = v67;
    double v110 = v15;
    id v68 = v65;
    id v107 = v68;
    id v69 = v64;
    id v108 = v69;
    [v66 enumerateObjectsUsingBlock:v104];

    if (v21)
    {
      id v70 = v68;
      v71 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v71, OS_LOG_TYPE_INFO, "Selecting Weekly Intervals - OUT-OF-STATE-OP", buf, 2u);
      }

      [v70 sortUsingComparator:&__block_literal_global_79];
    }
    else
    {
      id v70 = v69;
      v72 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v72, OS_LOG_TYPE_INFO, "Selecting Daily Intervals - OUT-OF-STATE-OP", buf, 2u);
      }

      [v70 sortUsingComparator:&__block_literal_global_82];
    }

    v73 = v70;
    if (v32)
    {
      v74 = [v70 firstObject];
      v75 = [v74 weekly];
      [v75 density];
      double v77 = v76;
      v78 = [v33 firstObject];
      v79 = [v78 weekly];
      [v79 density];
      BOOL v81 = v77 > v80;

      if (v81) {
        v73 = v70;
      }
      else {
        v73 = v33;
      }
    }
    id v82 = v73;
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_2_83;
    v101[3] = &unk_1E6B9A468;
    v101[4] = self;
    double v103 = v23;
    id v102 = v91;
    [v82 enumerateObjectsUsingBlock:v101];
    [v67 setSelectOOStStates:0];
  }
  else
  {
    LOBYTE(v30) = 0;
    id v70 = 0;
  }
  v83 = [(RTStateModel *)self stateModelLut];
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_3;
  v96[3] = &unk_1E6B9A830;
  char v100 = v30;
  v97 = v95;
  double v99 = v15;
  id v84 = v91;
  id v98 = v84;
  v85 = v95;
  [v83 enumerateKeysAndObjectsUsingBlock:v96];

  v86 = v98;
  id v87 = v84;

  return v87;
}

- (id)getOOStClusterData:(double)a3 predictionWindow:(double)a4 numOfWeeks:(int)a5 refLoc:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v14 = [(RTStateModel *)self stateModelLut];
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  char v31 = __70__RTStateModel_getOOStClusterData_predictionWindow_numOfWeeks_refLoc___block_invoke;
  int v32 = &unk_1E6B9A8F8;
  double v38 = a3;
  double v39 = a4;
  int v40 = a5;
  id v33 = v13;
  id v34 = v10;
  v35 = self;
  id v15 = v11;
  id v36 = v15;
  id v16 = v12;
  id v37 = v16;
  id v17 = v10;
  id v18 = v13;
  [v14 enumerateKeysAndObjectsUsingBlock:&v29];

  uint64_t v19 = a5;
  double v20 = 1.0;
  double v21 = (double)a5;
  double v22 = 1.0;
  if (objc_msgSend(v15, "count", v29, v30, v31, v32) < (unint64_t)a5) {
    double v22 = v21 / (double)(unint64_t)(a5 - [v15 count]);
  }
  uint64_t v23 = 7 * a5;
  if ([v16 count] < (unint64_t)(7 * v19)) {
    double v20 = v21 * 7.0 / (double)(unint64_t)(v23 - [v15 count]);
  }
  uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    int v27 = [v15 count];
    int v28 = [v16 count];
    *(_DWORD *)buf = 67175425;
    int v42 = v27;
    __int16 v43 = 1025;
    int v44 = v28;
    __int16 v45 = 2049;
    double v46 = v22;
    __int16 v47 = 2049;
    double v48 = v20;
    _os_log_debug_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEBUG, "Number of weeks out of region %{private}d, number of days of region %{private}d, weekly correction factor %{private}f, daily correction factor %{private}f", buf, 0x22u);
  }

  __int16 v25 = [[RTStateModelAggOutOfStateSelection alloc] initWithSelectOOStStates:v18 dailyDensityCorrection:v20 weeklyDensityCorrection:v22];

  return v25;
}

- (NSMutableDictionary)stateModelLut
{
  return self->_stateModelLut;
}

- (double)getNumberOfWeeksInStateModel
{
  v3 = [(RTStateModel *)self earliestLatestStateModelEl];
  [v3 latestEl_s];
  double v5 = v4;

  v6 = [(RTStateModel *)self earliestLatestStateModelEl];
  [v6 earliestEl_s];
  double v8 = v7;

  double result = (v5 - v8) / 604800.0;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (RTStateModelEarliestLatestEl)earliestLatestStateModelEl
{
  return self->_earliestLatestStateModelEl;
}

- (double)getMaxDistFromInterval:(double)a3 withVelocity:(double)a4
{
  BOOL v4 = a4 <= 0.0 || a3 <= 0.0;
  double result = a3 * a4;
  if (v4) {
    return 72000.0;
  }
  return result;
}

- (id)findClusterWithLocation:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__123;
  id v18 = __Block_byref_object_dispose__123;
  id v19 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0x7FF0000000000000;
  double v5 = [(RTStateModel *)self stateModelLut];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__RTStateModel_findClusterWithLocation___block_invoke;
  v9[3] = &unk_1E6B9A880;
  id v6 = v4;
  id v10 = v6;
  id v11 = v13;
  id v12 = &v14;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (id)v15[5];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (BOOL)anyClusterOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 andEnteredEarlierThan:(double)a5
{
  id v8 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  double v9 = [[RTStateModelLocation alloc] initWithRTLocation:v8];
  if (a3 > 0.0 && a5 > 0.0)
  {
    id v10 = [(RTStateModel *)self stateModelLut];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__RTStateModel_anyClusterOfInterestWithinDistance_ofLocation_andEnteredEarlierThan___block_invoke;
    v13[3] = &unk_1E6B9A8D0;
    double v16 = a3;
    double v17 = a5;
    uint64_t v14 = v9;
    id v15 = &v18;
    [v10 enumerateKeysAndObjectsUsingBlock:v13];
  }
  char v11 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)setEarliestLatestStateModelEl:(id)a3
{
}

- (RTStateModel)initWithLearnedLocationsOfInterest:(id)a3 metricManager:(id)a4 queue:(id)a5
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    v123.receiver = self;
    v123.super_class = (Class)RTStateModel;
    id v12 = [(RTStateModel *)&v123 init];
    id v13 = v12;
    if (v12)
    {
      id v88 = v11;
      id v89 = v10;
      objc_storeStrong((id *)&v12->_metricManager, a4);
      objc_storeStrong((id *)&v13->_queue, a5);
      uint64_t v14 = objc_opt_new();
      stateModelLut = v13->_stateModelLut;
      v95 = v13;
      v13->_stateModelLut = (NSMutableDictionary *)v14;

      v104 = [MEMORY[0x1E4F1CA60] dictionary];
      double v16 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v90 = v9;
      obuint64_t j = v9;
      uint64_t v96 = [obj countByEnumeratingWithState:&v119 objects:v135 count:16];
      if (v96)
      {
        uint64_t v93 = *(void *)v120;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v120 != v93) {
              objc_enumerationMutation(obj);
            }
            uint64_t v105 = v17;
            uint64_t v18 = *(void **)(*((void *)&v119 + 1) + 8 * v17);
            id v19 = [RTStateModelLocation alloc];
            uint64_t v20 = [v18 location];
            char v21 = [v20 location];
            uint64_t v22 = [(RTStateModelLocation *)v19 initWithRTLocation:v21];

            uint64_t v23 = (void *)MEMORY[0x1E4F5CE10];
            uint64_t v24 = [v18 place];
            uint64_t v25 = [v23 typeFromPlaceType:[v24 type]];

            v26 = (void *)MEMORY[0x1E4F5CE10];
            int v27 = [v18 place];
            uint64_t v28 = [v26 typeSourceFromPlaceTypeSource:[v27 typeSource]];

            uint64_t v29 = [v18 place];
            uint64_t v30 = [v29 customLabel];

            char v31 = [RTStateDepiction alloc];
            int v32 = [v18 place];
            id v33 = [v32 mapItem];
            id v102 = (id)v22;
            char v100 = (void *)v30;
            id v34 = [(RTStateDepiction *)v31 initWithLocation:v22 type:v25 typeSource:v28 customLabel:v30 mapItem:v33];

            v35 = objc_opt_new();
            id v36 = [v18 identifier];
            [v35 setUniqueId:v36];

            [v35 setStateDepiction:v34];
            id v37 = [(RTStateModel *)v95 stateModelLut];
            double v38 = [v35 uniqueId];
            [v37 setObject:v35 forKey:v38];

            double v39 = [v18 identifier];
            id v98 = v35;
            [v104 setObject:v35 forKey:v39];

            long long v117 = 0u;
            long long v118 = 0u;
            long long v115 = 0u;
            long long v116 = 0u;
            int v40 = [v18 visits];
            uint64_t v41 = [v40 countByEnumeratingWithState:&v115 objects:v134 count:16];
            if (v41)
            {
              uint64_t v42 = v41;
              uint64_t v43 = *(void *)v116;
              do
              {
                for (uint64_t i = 0; i != v42; ++i)
                {
                  if (*(void *)v116 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  __int16 v45 = *(void **)(*((void *)&v115 + 1) + 8 * i);
                  double v46 = [v45 entryDate:v88, v89];
                  [v46 timeIntervalSinceReferenceDate];
                  double v48 = v47;
                  uint64_t v49 = [v45 exitDate];
                  [v49 timeIntervalSinceReferenceDate];
                  [(RTStateDepiction *)v34 submitEntry:v48 exit:v50];

                  v51 = [v45 identifier];
                  [v16 setObject:v18 forKey:v51];
                }
                uint64_t v42 = [v40 countByEnumeratingWithState:&v115 objects:v134 count:16];
              }
              while (v42);
            }

            uint64_t v17 = v105 + 1;
          }
          while (v105 + 1 != v96);
          uint64_t v96 = [obj countByEnumeratingWithState:&v119 objects:v135 count:16];
        }
        while (v96);
      }

      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      id obja = obj;
      uint64_t v97 = [obja countByEnumeratingWithState:&v111 objects:v133 count:16];
      if (v97)
      {
        uint64_t v94 = *(void *)v112;
        v101 = v16;
        do
        {
          uint64_t v52 = 0;
          do
          {
            if (*(void *)v112 != v94) {
              objc_enumerationMutation(obja);
            }
            uint64_t v99 = v52;
            v53 = *(void **)(*((void *)&v111 + 1) + 8 * v52);
            long long v107 = 0u;
            long long v108 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            [v53 transitions:v88, v89];
            id v103 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v106 = [v103 countByEnumeratingWithState:&v107 objects:v132 count:16];
            if (v106)
            {
              uint64_t v54 = *(void *)v108;
              do
              {
                for (uint64_t j = 0; j != v106; ++j)
                {
                  if (*(void *)v108 != v54) {
                    objc_enumerationMutation(v103);
                  }
                  double v56 = *(void **)(*((void *)&v107 + 1) + 8 * j);
                  v57 = [v56 visitIdentifierOrigin];
                  v58 = [v16 objectForKey:v57];

                  int v59 = [v56 visitIdentifierDestination];
                  v60 = [v16 objectForKey:v59];

                  v61 = [v58 identifier];
                  v62 = [v104 objectForKey:v61];

                  v63 = [v60 identifier];
                  id v64 = [v104 objectForKey:v63];

                  if (v62) {
                    BOOL v65 = v64 == 0;
                  }
                  else {
                    BOOL v65 = 1;
                  }
                  if (v65)
                  {
                    v73 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138413058;
                      id v125 = (const char *)v58;
                      __int16 v126 = 2112;
                      id v127 = v62;
                      __int16 v128 = 2112;
                      double v129 = v60;
                      __int16 v130 = 2112;
                      int v131 = v64;
                      _os_log_debug_impl(&dword_1D9BFA000, v73, OS_LOG_TYPE_DEBUG, "transition missing endpoint. origin locationOfInterest, %@, state, %@, destination locationOfInterest, %@, state, %@", buf, 0x2Au);
                    }
                  }
                  else
                  {
                    uint64_t v66 = v54;
                    id v67 = [RTStateTransitionOneTimeTrans alloc];
                    id v68 = [v56 startDate];
                    [v68 timeIntervalSinceReferenceDate];
                    double v70 = v69;
                    v71 = [v56 stopDate];
                    [v71 timeIntervalSinceReferenceDate];
                    v73 = [(RTStateTransitionOneTimeTrans *)v67 initWithStart:0 stop:v70 motionActivityType:v72];

                    v74 = [v62 stateTransitions];
                    v75 = [v64 uniqueId];
                    double v76 = [v74 objectForKey:v75];

                    if (!v76)
                    {
                      double v77 = [v62 stateTransitions];
                      v78 = objc_opt_new();
                      v79 = [v64 uniqueId];
                      [v77 setObject:v78 forKey:v79];
                    }
                    double v80 = [v62 stateTransitions];
                    BOOL v81 = [v64 uniqueId];
                    id v82 = [v80 objectForKey:v81];
                    [v82 submitTransition:v73];

                    uint64_t v54 = v66;
                    double v16 = v101;
                  }
                }
                uint64_t v106 = [v103 countByEnumeratingWithState:&v107 objects:v132 count:16];
              }
              while (v106);
            }

            uint64_t v52 = v99 + 1;
          }
          while (v99 + 1 != v97);
          uint64_t v97 = [obja countByEnumeratingWithState:&v111 objects:v133 count:16];
        }
        while (v97);
      }

      id v13 = v95;
      [(RTStateModel *)v95 updateInternalState];

      id v10 = v89;
      id v9 = v90;
      id v11 = v88;
    }
    self = v13;
    v83 = self;
  }
  else
  {
    id v84 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v125 = "-[RTStateModel initWithLearnedLocationsOfInterest:metricManager:queue:]";
      __int16 v126 = 1024;
      LODWORD(v127) = 199;
      _os_log_error_impl(&dword_1D9BFA000, v84, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }

    v85 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v87 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      id v125 = v87;
      _os_log_error_impl(&dword_1D9BFA000, v85, OS_LOG_TYPE_ERROR, "%@ failed due to null parameter", buf, 0xCu);
    }
    v83 = 0;
  }

  return v83;
}

- (RTStateModel)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLearnedLocationsOfInterest_metricManager_queue_);
}

void __35__RTStateModel_updateInternalState__block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v19 = a3;
  double v5 = [v19 stateDepiction];
  id v6 = [v5 lastEntyExit];

  id v7 = [v19 stateDepiction];
  id v8 = [v7 getEarliestLatestEntry];

  double v9 = *(double *)(*(void *)(a1[4] + 8) + 24);
  [v8 earliestEl_s];
  if (v9 > v10)
  {
    [v8 earliestEl_s];
    *(void *)(*(void *)(a1[4] + 8) + 24) = v11;
  }
  double v12 = *(double *)(*(void *)(a1[5] + 8) + 24);
  [v8 latestEl_s];
  if (v12 < v13)
  {
    [v8 latestEl_s];
    *(void *)(*(void *)(a1[5] + 8) + 24) = v14;
  }
  id v15 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v15 || (objc_msgSend(v15, "exit_s"), double v17 = v16, objc_msgSend(v6, "exit_s"), v17 < v18))
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v6);
  }
}

void __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 getPredTrans:*(unsigned int *)(a1 + 56) duration:a2 numOfWeeks:*(double *)(a1 + 40) uniqueID:*(double *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
}

void __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) stateModelLut];
  double v5 = [v3 stateUUID];
  id v6 = [v4 objectForKey:v5];

  id v7 = [v6 stateDepiction];
  id v8 = [v7 location];
  [v8 Latitude_deg];
  double v9 = [v6 stateDepiction];
  double v10 = [v9 location];
  [v10 Longitude_deg];
  [*(id *)(a1 + 40) Latitude_deg];
  [*(id *)(a1 + 40) Longitude_deg];
  RTCommonCalculateDistanceHighPrecision();
  double v12 = v11;

  double v13 = [v3 weekly];
  [v13 latestTransTimeStart_s];
  double v15 = v14;

  if (v15 <= -1.0)
  {
    double v19 = 1.0e12;
  }
  else
  {
    double v16 = *(double *)(a1 + 72);
    double v17 = [v3 weekly];
    [v17 latestTransTimeStart_s];
    double v19 = v16 - v18;
  }
  uint64_t v20 = [v3 weekly];
  [v20 density];
  double v22 = v21;
  [*(id *)(a1 + 48) weeklyDensityCorrection];
  if (v22 * v23 <= 0.3) {
    goto LABEL_12;
  }
  uint64_t v24 = [v3 weekly];
  if ((int)[v24 numOfTrans] < 2 || v12 <= 700.0 || v12 >= *(double *)(a1 + 80))
  {

LABEL_12:
    goto LABEL_13;
  }

  if (v19 < 1900800.0)
  {
    [*(id *)(a1 + 56) addObject:v3];
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    long long v110 = [v3 weekly];
    [v110 predResidualStart_s];
    double v27 = v26 / 3600.0;
    long long v108 = [v3 weekly];
    [v108 resUncStart_s];
    double v29 = v28 / 3600.0;
    uint64_t v106 = [v3 weekly];
    [v106 predResidualStop_s];
    double v31 = v30 / 3600.0;
    v104 = [v3 weekly];
    [v104 resUncStop_s];
    double v33 = v32 / 3600.0;
    id v102 = [v3 weekly];
    v101 = [v102 primaryStopDate];
    id v34 = [v101 stringFromDate];
    v35 = [v3 weekly];
    int v36 = [v35 numOfTrans];
    id v37 = [v3 weekly];
    [v37 density];
    double v39 = v38;
    [*(id *)(a1 + 48) weeklyDensityCorrection];
    double v41 = v39 * v40;
    uint64_t v42 = [v3 daily];
    [v42 density];
    double v44 = v43;
    [*(id *)(a1 + 48) dailyDensityCorrection];
    *(_DWORD *)buf = 138414339;
    long long v113 = v6;
    __int16 v114 = 2049;
    *(double *)long long v115 = v27;
    *(_WORD *)&v115[8] = 2048;
    *(double *)&v115[10] = v29;
    *(_WORD *)&v115[18] = 2049;
    *(double *)&v115[20] = v31;
    *(_WORD *)&v115[28] = 2048;
    *(double *)&v115[30] = v33;
    *(_WORD *)&v115[38] = 2112;
    *(void *)&v115[40] = v34;
    __int16 v116 = 1025;
    int v117 = v36;
    __int16 v118 = 2049;
    double v119 = v41;
    __int16 v120 = 2049;
    double v121 = v44 * v45;
    _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "Recommending WEEKLY INTERVAL, state, %@, start Trans %{private}f [h], unc Res %f [h], stop Trans %{private}f [h], unc Res %f [h], primaryStopDate, %@, num Of Trans %{private}d, weeklyDens %{private}f, dailyDens %{private}f", buf, 0x58u);

    goto LABEL_15;
  }
LABEL_13:
  uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
    goto LABEL_16;
  }
  id v34 = [v3 weekly];
  int v46 = [v34 numOfTrans];
  double v47 = [v3 weekly];
  [v47 density];
  double v49 = v48;
  [*(id *)(a1 + 48) weeklyDensityCorrection];
  double v51 = v49 * v50;
  uint64_t v52 = [v3 daily];
  [v52 density];
  double v54 = v53;
  [*(id *)(a1 + 48) dailyDensityCorrection];
  *(_DWORD *)buf = 138413571;
  long long v113 = v6;
  __int16 v114 = 1025;
  *(_DWORD *)long long v115 = v46;
  *(_WORD *)&v115[4] = 2049;
  *(double *)&v115[6] = v19;
  *(_WORD *)&v115[14] = 2049;
  *(double *)&v115[16] = v51;
  *(_WORD *)&v115[24] = 2049;
  *(double *)&v115[26] = v54 * v55;
  *(_WORD *)&v115[34] = 2049;
  *(double *)&v115[36] = v12;
  _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "Dropping WEEKLY INTERVAL, state, %@, numOfTrans %{private}d, ageOfTrans %{private}f, weeklyDens %{private}f, dailyDens %{private}f, dist %{private}f", buf, 0x3Au);

LABEL_15:
LABEL_16:

  double v56 = [v3 daily];
  [v56 latestTransTimeStart_s];
  double v58 = v57;

  if (v58 <= -1.0)
  {
    double v62 = 1.0e12;
  }
  else
  {
    double v59 = *(double *)(a1 + 72);
    v60 = [v3 daily];
    [v60 latestTransTimeStart_s];
    double v62 = v59 - v61;
  }
  v63 = [v3 daily];
  [v63 density];
  double v65 = v64;
  [*(id *)(a1 + 48) dailyDensityCorrection];
  if (v65 * v66 <= 0.2) {
    goto LABEL_27;
  }
  id v67 = [v3 daily];
  if ((int)[v67 numOfTrans] < 3 || v12 <= 700.0 || v12 >= *(double *)(a1 + 80))
  {

LABEL_27:
    goto LABEL_28;
  }

  if (v62 < 432000.0)
  {
    [*(id *)(a1 + 64) addObject:v3];
    id v68 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      long long v111 = [v3 daily];
      [v111 predResidualStart_s];
      double v70 = v69 / 3600.0;
      long long v109 = [v3 daily];
      [v109 resUncStart_s];
      double v72 = v71 / 3600.0;
      long long v107 = [v3 daily];
      [v107 predResidualStop_s];
      double v74 = v73 / 3600.0;
      uint64_t v105 = [v3 daily];
      [v105 resUncStop_s];
      double v76 = v75 / 3600.0;
      id v103 = [v3 daily];
      double v77 = [v103 primaryStopDate];
      v78 = [v77 stringFromDate];
      v79 = [v3 daily];
      int v80 = [v79 numOfTrans];
      BOOL v81 = [v3 daily];
      [v81 density];
      double v83 = v82;
      [*(id *)(a1 + 48) dailyDensityCorrection];
      double v85 = v83 * v84;
      v86 = [v3 weekly];
      [v86 density];
      double v88 = v87;
      [*(id *)(a1 + 48) weeklyDensityCorrection];
      *(_DWORD *)buf = 138414339;
      long long v113 = v6;
      __int16 v114 = 2049;
      *(double *)long long v115 = v70;
      *(_WORD *)&v115[8] = 2049;
      *(double *)&v115[10] = v72;
      *(_WORD *)&v115[18] = 2049;
      *(double *)&v115[20] = v74;
      *(_WORD *)&v115[28] = 2048;
      *(double *)&v115[30] = v76;
      *(_WORD *)&v115[38] = 2112;
      *(void *)&v115[40] = v78;
      __int16 v116 = 1025;
      int v117 = v80;
      __int16 v118 = 2049;
      double v119 = v85;
      __int16 v120 = 2049;
      double v121 = v88 * v89;
      _os_log_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_INFO, "Recommending DAILY INTERVAL, state, %@, start Trans %{private}f [h], unc Res %{private}f [h], stop Trans %{private}f [h], unc Res %f [h], primaryStopDate, %@, num Of Trans %{private}d, dailyDens %{private}f, weeklyDens %{private}f", buf, 0x58u);
    }
    goto LABEL_30;
  }
LABEL_28:
  id v68 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    id v90 = [v3 daily];
    int v91 = [v90 numOfTrans];
    v92 = [v3 daily];
    [v92 density];
    double v94 = v93;
    [*(id *)(a1 + 48) dailyDensityCorrection];
    double v96 = v94 * v95;
    uint64_t v97 = [v3 weekly];
    [v97 density];
    double v99 = v98;
    [*(id *)(a1 + 48) weeklyDensityCorrection];
    *(_DWORD *)buf = 138413571;
    long long v113 = v6;
    __int16 v114 = 1024;
    *(_DWORD *)long long v115 = v91;
    *(_WORD *)&v115[4] = 2049;
    *(double *)&v115[6] = v62;
    *(_WORD *)&v115[14] = 2049;
    *(double *)&v115[16] = v96;
    *(_WORD *)&v115[24] = 2049;
    *(double *)&v115[26] = v99 * v100;
    *(_WORD *)&v115[34] = 2049;
    *(double *)&v115[36] = v12;
    _os_log_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_INFO, "Dropping DAILY INTERVAL, state, %@, numOfTrans %d, ageOfTrans %{private}f, dailyDens %{private}f, weeklyDens %{private}f, dist %{private}f", buf, 0x3Au);
  }
LABEL_30:
}

uint64_t __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 weekly];
  [v5 density];
  double v7 = v6;
  id v8 = [v4 weekly];

  [v8 density];
  double v10 = v9;

  if (v7 <= v10) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 daily];
  [v5 density];
  double v7 = v6;
  id v8 = [v4 daily];

  [v8 density];
  double v10 = v9;

  if (v7 <= v10) {
    return 1;
  }
  else {
    return -1;
  }
}

void __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_74(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = [a2 stateUUID];
  double v6 = [*(id *)(a1 + 32) uniqueId];

  if (v5 == v6)
  {
    double v7 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v8 = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "Remove transition into itself!!", v8, 2u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

void __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_75(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [*(id *)(a1 + 32) stateModelLut];
  id v4 = [v13 stateUUID];
  double v5 = [v3 objectForKey:v4];

  if ([*(id *)(a1 + 40) count])
  {
    double v6 = [v13 weekly];
    double v7 = [v6 primaryStopDate];

    [v13 weekly];
  }
  else
  {
    id v8 = [v13 daily];
    double v7 = [v8 primaryStopDate];

    [v13 daily];
  double v9 = };
  uint64_t v10 = [v9 motionActivityType];

  double v11 = (void *)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithOneState:v5];
  double v12 = (void *)[objc_alloc(MEMORY[0x1E4F5CEA0]) initWithLocationOfInterest:v11 confidence:v7 nextEntryTime:v10 motionActivityType:*(double *)(a1 + 56)];
  [*(id *)(a1 + 48) addObject:v12];
}

void __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) stateModelLut];
  double v5 = [v3 stateUUID];
  double v6 = [v4 objectForKey:v5];

  double v7 = [v6 stateDepiction];
  id v8 = [v7 location];
  [v8 Latitude_deg];
  double v9 = [v6 stateDepiction];
  uint64_t v10 = [v9 location];
  [v10 Longitude_deg];
  [*(id *)(a1 + 40) Latitude_deg];
  [*(id *)(a1 + 40) Longitude_deg];
  RTCommonCalculateDistanceHighPrecision();
  double v12 = v11;

  id v13 = [v3 weekly];
  [v13 latestVisitTime_s];
  double v15 = v14;

  if (v15 <= -1.0)
  {
    double v19 = 1.0e12;
  }
  else
  {
    double v16 = *(double *)(a1 + 72);
    double v17 = [v3 weekly];
    [v17 latestVisitTime_s];
    double v19 = v16 - v18;
  }
  if (*(unsigned char *)(a1 + 88)) {
    goto LABEL_16;
  }
  uint64_t v20 = [v3 weekly];
  [v20 density];
  double v22 = v21;
  [*(id *)(a1 + 48) weeklyDensityCorrection];
  if (v22 * v23 <= 0.4)
  {
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v24 = [v3 weekly];
  if ((int)[v24 numOfClustEntries] < 2
    || v12 <= 700.0
    || (objc_msgSend(*(id *)(a1 + 40), "uncertainty_m"), v25 <= 0.0)
    || v12 >= *(double *)(a1 + 80)
    || (objc_msgSend(*(id *)(a1 + 40), "uncertainty_m"), v26 <= 0.0))
  {

    goto LABEL_15;
  }

  if (v19 < 1900800.0)
  {
    [*(id *)(a1 + 56) addObject:v3];
    double v27 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      double v99 = [v3 weekly];
      [v99 aggregateTime_s];
      double v29 = v28 / 3600.0;
      double v30 = [v3 weekly];
      int v31 = [v30 numOfClustEntries];
      uint64_t v32 = *(void *)(a1 + 80);
      double v33 = [v3 weekly];
      [v33 density];
      double v35 = v34;
      [*(id *)(a1 + 48) weeklyDensityCorrection];
      double v37 = v35 * v36;
      double v38 = [v3 daily];
      [v38 density];
      double v40 = v39;
      [*(id *)(a1 + 48) dailyDensityCorrection];
      *(_DWORD *)buf = 138414083;
      v101 = v6;
      __int16 v102 = 2049;
      double v103 = v29;
      __int16 v104 = 1025;
      int v105 = v31;
      __int16 v106 = 2049;
      double v107 = v12;
      __int16 v108 = 2049;
      double v109 = v19 / 3600.0;
      __int16 v110 = 2049;
      uint64_t v111 = v32;
      __int16 v112 = 2049;
      double v113 = v37;
      __int16 v114 = 2049;
      double v115 = v40 * v41;
      _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "Recommending WEEKLY INTERVAL, state, %@, lifespan %{private}f, numOfClustEntries %{private}d, LastLoc Dist to Clust %{private}f, ageLatestClust visit %{private}f, Max Cluster Dist %{private}f, weeklyDens %{private}f, dailyDens %{private}f ", buf, 0x4Eu);
    }
    goto LABEL_18;
  }
LABEL_16:
  double v27 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    uint64_t v42 = [v3 weekly];
    [v42 aggregateTime_s];
    double v44 = v43 / 3600.0;
    double v45 = [v3 weekly];
    int v46 = [v45 numOfClustEntries];
    uint64_t v47 = *(void *)(a1 + 80);
    double v48 = [v3 weekly];
    [v48 density];
    double v50 = v49;
    [*(id *)(a1 + 48) weeklyDensityCorrection];
    double v52 = v50 * v51;
    double v53 = [v3 daily];
    [v53 density];
    double v55 = v54;
    [*(id *)(a1 + 48) dailyDensityCorrection];
    *(_DWORD *)buf = 138414083;
    v101 = v6;
    __int16 v102 = 2049;
    double v103 = v44;
    __int16 v104 = 1025;
    int v105 = v46;
    __int16 v106 = 2049;
    double v107 = v12;
    __int16 v108 = 2049;
    double v109 = v19 / 3600.0;
    __int16 v110 = 2049;
    uint64_t v111 = v47;
    __int16 v112 = 2049;
    double v113 = v52;
    __int16 v114 = 2049;
    double v115 = v55 * v56;
    _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "Dropping WEEKLY INTERVAL, state, %@, lifespan %{private}f, numOfClustEntries %{private}d, LastLoc Dist to Clust %{private}f, ageLatestClust visit %{private}f, Max Cluster Dist %{private}f, weeklyDens %{private}f, dailyDens %{private}f", buf, 0x4Eu);
  }
LABEL_18:

  double v57 = [v3 daily];
  [v57 latestVisitTime_s];
  double v59 = v58;

  if (v59 <= -1.0)
  {
    double v63 = 1.0e12;
  }
  else
  {
    double v60 = *(double *)(a1 + 72);
    double v61 = [v3 daily];
    [v61 latestVisitTime_s];
    double v63 = v60 - v62;
  }
  double v64 = [v3 daily];
  [v64 density];
  double v66 = v65;
  [*(id *)(a1 + 48) dailyDensityCorrection];
  if (v66 * v67 <= 0.2) {
    goto LABEL_31;
  }
  id v68 = [v3 daily];
  if ((int)[v68 numOfClustEntries] < 3
    || v12 <= 700.0
    || (objc_msgSend(*(id *)(a1 + 40), "uncertainty_m"), v69 <= 0.0)
    || v12 >= *(double *)(a1 + 80)
    || (objc_msgSend(*(id *)(a1 + 40), "uncertainty_m"), v70 <= 0.0))
  {

LABEL_31:
    goto LABEL_32;
  }

  if (v63 < 432000.0)
  {
    [*(id *)(a1 + 64) addObject:v3];
    double v71 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      double v72 = [v3 daily];
      [v72 aggregateTime_s];
      double v74 = v73 / 3600.0;
      double v75 = [v3 daily];
      int v76 = [v75 numOfClustEntries];
      uint64_t v77 = *(void *)(a1 + 80);
      v78 = [v3 daily];
      [v78 density];
      double v80 = v79;
      [*(id *)(a1 + 48) dailyDensityCorrection];
      double v82 = v80 * v81;
      double v83 = [v3 weekly];
      [v83 density];
      double v85 = v84;
      [*(id *)(a1 + 48) weeklyDensityCorrection];
      *(_DWORD *)buf = 138414083;
      v101 = v6;
      __int16 v102 = 2049;
      double v103 = v74;
      __int16 v104 = 1025;
      int v105 = v76;
      __int16 v106 = 2049;
      double v107 = v12;
      __int16 v108 = 2049;
      double v109 = v63 / 3600.0;
      __int16 v110 = 2049;
      uint64_t v111 = v77;
      __int16 v112 = 2049;
      double v113 = v82;
      __int16 v114 = 2049;
      double v115 = v85 * v86;
      double v87 = "Recommending DAILY INTERVAL, state, %@, lifespan %{private}f, numOfClustEntries %{private}d, LastLoc Dist to"
            " Clust %{private}f, ageLatestClust visit %{private}f, Max Cluster Dist %{private}f, dailyDens %{private}f, w"
            "eeklyDens %{private}f";
LABEL_34:
      _os_log_impl(&dword_1D9BFA000, v71, OS_LOG_TYPE_INFO, v87, buf, 0x4Eu);

      goto LABEL_35;
    }
    goto LABEL_35;
  }
LABEL_32:
  double v71 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
  {
    double v72 = [v3 daily];
    [v72 aggregateTime_s];
    double v89 = v88 / 3600.0;
    double v75 = [v3 daily];
    int v90 = [v75 numOfClustEntries];
    uint64_t v91 = *(void *)(a1 + 80);
    v78 = [v3 daily];
    [v78 density];
    double v93 = v92;
    [*(id *)(a1 + 48) dailyDensityCorrection];
    double v95 = v93 * v94;
    double v83 = [v3 weekly];
    [v83 density];
    double v97 = v96;
    [*(id *)(a1 + 48) weeklyDensityCorrection];
    *(_DWORD *)buf = 138414083;
    v101 = v6;
    __int16 v102 = 2049;
    double v103 = v89;
    __int16 v104 = 1025;
    int v105 = v90;
    __int16 v106 = 2049;
    double v107 = v12;
    __int16 v108 = 2049;
    double v109 = v63 / 3600.0;
    __int16 v110 = 2049;
    uint64_t v111 = v91;
    __int16 v112 = 2049;
    double v113 = v95;
    __int16 v114 = 2049;
    double v115 = v97 * v98;
    double v87 = "Dropping DAILY INTERVAL, state, %@, lifespan %{private}f, numOfClustEntries %{private}d, LastLoc Dist to Clust"
          " %{private}f, ageLatestClust visit %{private}f, Max Cluster Dist %{private}f, dailyDens %{private}f, weeklyDens %{private}f";
    goto LABEL_34;
  }
LABEL_35:
}

uint64_t __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 weekly];
  [v5 density];
  double v7 = v6;
  id v8 = [v4 weekly];

  [v8 density];
  double v10 = v9;

  if (v7 <= v10) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 daily];
  [v5 density];
  double v7 = v6;
  id v8 = [v4 daily];

  [v8 density];
  double v10 = v9;

  if (v7 <= v10) {
    return 1;
  }
  else {
    return -1;
  }
}

void __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_2_83(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 stateModelLut];
  double v6 = [v4 stateUUID];

  id v9 = [v5 objectForKey:v6];

  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithOneState:v9];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F5CEA0]) initWithLocationOfInterest:v7 confidence:0 nextEntryTime:0 motionActivityType:*(double *)(a1 + 48)];
  [*(id *)(a1 + 40) addObject:v8];
}

void __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v21 = a3;
  id v4 = [v21 stateDepiction];
  if ([v4 type])
  {
    if (!*(unsigned char *)(a1 + 56))
    {
LABEL_10:

      double v7 = v21;
      goto LABEL_11;
    }
    double v5 = [v21 stateDepiction];
    uint64_t v6 = [v5 type];

    double v7 = v21;
    if (v6 != 1) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v8 = [v21 stateDepiction];
  id v9 = [v8 location];
  [v9 Latitude_deg];
  double v10 = [v21 stateDepiction];
  double v11 = [v10 location];
  [v11 Longitude_deg];
  [*(id *)(a1 + 32) Latitude_deg];
  [*(id *)(a1 + 32) Longitude_deg];
  RTCommonCalculateDistanceHighPrecision();
  double v13 = v12;

  double v7 = v21;
  if (v13 > 700.0 && v13 < *(double *)(a1 + 48))
  {
    double v14 = *(void **)(a1 + 40);
    double v15 = (void *)MEMORY[0x1E4F28F60];
    double v16 = [v21 uniqueId];
    double v17 = [v15 predicateWithFormat:@"%K == %@", @"locationOfInterest.identifier", v16];
    double v18 = [v14 filteredArrayUsingPredicate:v17];
    uint64_t v19 = [v18 count];

    double v7 = v21;
    if (!v19)
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithOneState:v21];
      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F5CEA0]) initWithLocationOfInterest:v4 confidence:0 nextEntryTime:0 motionActivityType:0.0];
      [*(id *)(a1 + 40) addObject:v20];

      goto LABEL_10;
    }
  }
LABEL_11:
}

- (id)getPredictedLocationsOfInterestWithCriteria:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v7 = [v5 referenceDate];
  [v7 timeIntervalSinceReferenceDate];
  uint64_t v9 = v8;

  [(RTStateModel *)self getNumberOfWeeksInStateModel];
  int v11 = (int)v10;
  double v12 = [(RTStateModel *)self stateModelLut];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __60__RTStateModel_getPredictedLocationsOfInterestWithCriteria___block_invoke;
  v25[3] = &unk_1E6B9A858;
  uint64_t v28 = v9;
  id v13 = v5;
  id v26 = v13;
  int v29 = v11;
  id v14 = v6;
  id v27 = v14;
  [v12 enumerateKeysAndObjectsUsingBlock:v25];

  [v14 sortUsingComparator:&__block_literal_global_94];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __60__RTStateModel_getPredictedLocationsOfInterestWithCriteria___block_invoke_3;
  v23[3] = &unk_1E6B90B78;
  id v16 = v15;
  id v24 = v16;
  [v14 enumerateObjectsUsingBlock:v23];
  double v17 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = NSStringFromSelector(a2);
    uint64_t v20 = [v13 referenceDate];
    id v21 = [v20 stringFromDate];
    uint64_t v22 = [v16 count];
    *(_DWORD *)buf = 138412802;
    int v31 = v19;
    __int16 v32 = 2112;
    double v33 = v21;
    __int16 v34 = 2048;
    uint64_t v35 = v22;
    _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "%@%@ found %lu PLOIs", buf, 0x20u);
  }

  return v16;
}

void __60__RTStateModel_getPredictedLocationsOfInterestWithCriteria___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = a2;
  id v6 = [v11 stateDepiction];
  double v7 = *(double *)(a1 + 48);
  [*(id *)(a1 + 32) windowDuration];
  uint64_t v9 = [v6 getPredState:*(unsigned int *)(a1 + 56) predictionWindow:v5 numOfWeeks:v7 uniqueID:v8];

  +[RTStateModel getOutOfStateConfidenceWithOneStatePred:v9];
  if (v10 >= 1.0) {
    [*(id *)(a1 + 40) addObject:v11];
  }
}

uint64_t __60__RTStateModel_getPredictedLocationsOfInterestWithCriteria___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 stateDepiction];
  [v5 getLastVisit];
  double v7 = v6;
  double v8 = [v4 stateDepiction];

  [v8 getLastVisit];
  double v10 = v9;

  if (v7 <= v10) {
    return 1;
  }
  else {
    return -1;
  }
}

void __60__RTStateModel_getPredictedLocationsOfInterestWithCriteria___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F5CE10];
  id v4 = a2;
  id v6 = (id)[[v3 alloc] initWithOneState:v4];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F5CEA0]) initWithLocationOfInterest:v6 confidence:0 nextEntryTime:0 motionActivityType:1.0];
  [*(id *)(a1 + 32) addObject:v5];
}

void __40__RTStateModel_findClusterWithLocation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [v5 stateDepiction];
  double v7 = [v6 location];

  [v7 Longitude_deg];
  double v9 = v8;
  [*(id *)(a1 + 32) Longitude_deg];
  if (vabdd_f64(v9, v10) >= 180.0)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)double v25 = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEBUG, "Cluster aggregation falls into DateLine ", v25, 2u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) Latitude_deg];
    double v12 = v11;
    [*(id *)(a1 + 32) Longitude_deg];
    double v14 = v13;
    [v7 Latitude_deg];
    double v16 = v15;
    [v7 Longitude_deg];
    +[RTStateModel getDistfromLat:v12 fromLon:v14 toLat:v16 toLon:v17];
    double v19 = v18;
    [*(id *)(a1 + 32) uncertainty_m];
    double v21 = v20;
    [v7 uncertainty_m];
    +[RTStateModel deriveClusterThresholdFromUncClustAplha:v21 andUncClustBeta:v22];
    if (v19 <= v23 && v19 < *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v19;
    }
  }
}

- (id)getLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4
{
  id v6 = a4;
  double v7 = [[RTStateModelLocation alloc] initWithCLLocation:v6];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3 > 0.0)
  {
    double v9 = [(RTStateModel *)self stateModelLut];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__RTStateModel_getLocationsOfInterestWithinDistance_ofLocation___block_invoke;
    v11[3] = &unk_1E6B9A8A8;
    double v14 = a3;
    double v12 = v7;
    id v13 = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v11];
  }
  [v8 sortUsingComparator:&__block_literal_global_97_0];

  return v8;
}

void __64__RTStateModel_getLocationsOfInterestWithinDistance_ofLocation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 stateDepiction];
  id v6 = [v5 location];

  if (v6)
  {
    double v7 = *(double *)(a1 + 48);
    [*(id *)(a1 + 32) Latitude_deg];
    double v9 = v8;
    [*(id *)(a1 + 32) Longitude_deg];
    double v11 = v10;
    [v6 Latitude_deg];
    double v13 = v12;
    [v6 Longitude_deg];
    +[RTStateModel getDistfromLat:v9 fromLon:v11 toLat:v13 toLon:v14];
    if (v7 > v15)
    {
      double v16 = (void *)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithOneState:v4];
      [*(id *)(a1 + 40) addObject:v16];
      double v17 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = *(void *)(a1 + 48);
        uint64_t v19 = *(void *)(a1 + 32);
        int v20 = 134218498;
        uint64_t v21 = v18;
        __int16 v22 = 2112;
        uint64_t v23 = v19;
        __int16 v24 = 2112;
        id v25 = v4;
        _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "Found an LOI within %.2fm of %@, loi, %@", (uint8_t *)&v20, 0x20u);
      }
    }
  }
}

uint64_t __64__RTStateModel_getLocationsOfInterestWithinDistance_ofLocation___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 visits];
  unint64_t v6 = [v5 count];
  double v7 = [v4 visits];

  unint64_t v8 = [v7 count];
  if (v6 > v8) {
    return -1;
  }
  else {
    return 1;
  }
}

void __84__RTStateModel_anyClusterOfInterestWithinDistance_ofLocation_andEnteredEarlierThan___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v20 = a3;
  unint64_t v6 = [v20 stateDepiction];
  double v7 = [v6 location];

  if (v7)
  {
    double v8 = *(double *)(a1 + 48);
    [*(id *)(a1 + 32) Latitude_deg];
    double v10 = v9;
    [*(id *)(a1 + 32) Longitude_deg];
    double v12 = v11;
    [v7 Latitude_deg];
    double v14 = v13;
    [v7 Longitude_deg];
    +[RTStateModel getDistfromLat:v10 fromLon:v12 toLat:v14 toLon:v15];
    if (v8 > v16)
    {
      double v17 = [v20 stateDepiction];
      uint64_t v18 = [v17 getEarliestLatestEntry];

      [v18 earliestEl_s];
      if (v19 < *(double *)(a1 + 56))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }
}

void __70__RTStateModel_getOOStClusterData_predictionWindow_numOfWeeks_refLoc___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  double v7 = [v5 stateDepiction];
  double v8 = [v7 getPredState:*(unsigned int *)(a1 + 88) predictionWindow:v6 numOfWeeks:*(double *)(a1 + 72) + 3600.0 uniqueID:*(double *)(a1 + 80)];

  double v9 = [v8 daily];
  if ((int)[v9 numOfClustEntries] < 1)
  {
    double v10 = [v8 weekly];
    int v11 = [v10 numOfClustEntries];

    if (v11 < 1)
    {
      double v13 = 0;
      goto LABEL_11;
    }
  }
  else
  {
  }
  double v12 = [v5 stateDepiction];
  double v13 = [v12 location];

  double v14 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = [v8 daily];
    int v23 = [v35 numOfClustEntries];
    __int16 v24 = [v8 daily];
    [v24 aggregateTime_s];
    double v26 = v25 / 3600.0;
    id v27 = [v8 daily];
    [v27 latestVisitTime_s];
    double v29 = v28 / 3600.0;
    double v30 = [v8 daily];
    [v30 density];
    uint64_t v32 = v31;
    double v33 = [v8 weekly];
    [v33 density];
    *(_DWORD *)buf = 138413571;
    double v41 = v13;
    __int16 v42 = 1025;
    int v43 = v23;
    __int16 v44 = 2049;
    double v45 = v26;
    __int16 v46 = 2049;
    double v47 = v29;
    __int16 v48 = 2049;
    uint64_t v49 = v32;
    __int16 v50 = 2049;
    uint64_t v51 = v34;
    _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "Out of state data aggregation, location, %@, in %{private}d, aggregateTime %{private}f [h], latestVisit %{private}f, density Daily %{private}f, density Weekly %{private}f ", buf, 0x3Au);
  }
  [*(id *)(a1 + 32) addObject:v8];
  [v13 Latitude_deg];
  [v13 Longitude_deg];
  [*(id *)(a1 + 40) Latitude_deg];
  [*(id *)(a1 + 40) Longitude_deg];
  RTCommonCalculateDistanceHighPrecision();
  double v16 = v15;
  [*(id *)(a1 + 48) getMaxDistFromInterval:*(double *)(a1 + 80) withVelocity:20.0];
  if (v16 > v17)
  {
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      double v41 = v13;
      _os_log_debug_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEBUG, "Out of region state at location, %@", buf, 0xCu);
    }

    double v19 = [v8 weekly];
    id v20 = [v19 visitHist];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __70__RTStateModel_getOOStClusterData_predictionWindow_numOfWeeks_refLoc___block_invoke_98;
    v38[3] = &unk_1E6B9A620;
    id v39 = *(id *)(a1 + 56);
    [v20 enumerateObjectsUsingBlock:v38];

    uint64_t v21 = [v8 daily];
    __int16 v22 = [v21 visitHist];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __70__RTStateModel_getOOStClusterData_predictionWindow_numOfWeeks_refLoc___block_invoke_2;
    v36[3] = &unk_1E6B9A620;
    id v37 = *(id *)(a1 + 64);
    [v22 enumerateObjectsUsingBlock:v36];
  }
LABEL_11:
}

void __70__RTStateModel_getOOStClusterData_predictionWindow_numOfWeeks_refLoc___block_invoke_98(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) objectForKey:];

  if (!v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [NSNumber numberWithBool:1];
    [v4 setObject:v5 forKey:v6];
  }
}

void __70__RTStateModel_getOOStClusterData_predictionWindow_numOfWeeks_refLoc___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [[*(id *)(a1 + 32) objectForKey:];

  if (!v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [NSNumber numberWithBool:1];
    [v4 setObject:v5 forKey:v6];
  }
}

+ (double)getOutOfStateConfidenceWithOneStatePred:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 daily];
  if ((int)[v4 numOfClustEntries] <= 0)
  {

    double v8 = 0.0;
  }
  else
  {
    id v5 = [v3 daily];
    [v5 aggregateTime_s];
    double v7 = v6;

    double v8 = 0.0;
    if (v7 <= 0.0) {
      goto LABEL_6;
    }
    double v9 = [v3 daily];
    [v9 aggregateTime_s];
    double v11 = v10;

    if (v11 > 1800.0) {
      goto LABEL_4;
    }
    double v14 = [v3 weekly];
    if ((int)[v14 numOfClustEntries] <= 0)
    {
    }
    else
    {
      double v15 = [v3 weekly];
      [v15 aggregateTime_s];
      double v17 = v16;

      if (v17 > 0.0)
      {
        uint64_t v18 = [v3 weekly];
        [v18 aggregateTime_s];
        double v20 = v19;

        if (v20 > 1800.0) {
LABEL_4:
        }
          double v8 = 1.0;
      }
    }
  }
LABEL_6:
  double v12 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = [v3 daily];
    int v22 = [v21 numOfClustEntries];
    int v23 = [v3 daily];
    [v23 aggregateTime_s];
    uint64_t v25 = v24;
    double v26 = [v3 weekly];
    int v27 = [v26 numOfClustEntries];
    double v28 = [v3 weekly];
    [v28 aggregateTime_s];
    v30[0] = 67175681;
    v30[1] = v22;
    __int16 v31 = 2049;
    uint64_t v32 = v25;
    __int16 v33 = 1025;
    int v34 = v27;
    __int16 v35 = 2049;
    uint64_t v36 = v29;
    __int16 v37 = 2048;
    double v38 = v8;
    _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "Evaluating Confidence for OOST: numOfDailyEntries %{private}d, aggTimeDaily %{private}f, numOfWeeklyEntries %{private}d, aggTimeWeekly %{private}f, Confidence %f", (uint8_t *)v30, 0x2Cu);
  }
  return v8;
}

+ (double)deriveClusterThresholdFromUncClustAplha:(double)a3 andUncClustBeta:(double)a4
{
  double v4 = a3 + a4;
  double result = 250.0;
  if (v4 <= 250.0)
  {
    double result = v4;
    if (v4 < 200.0) {
      return 200.0;
    }
  }
  return result;
}

- (id)getPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  id v65 = 0;
  if (v6 && v7)
  {
    double v9 = [RTStateModelLocation alloc];
    [v6 latitude];
    double v11 = v10;
    [v6 longitude];
    double v13 = v12;
    [v6 horizontalUncertainty];
    double v15 = v14;
    double v16 = [v6 date];
    [v16 timeIntervalSinceReferenceDate];
    uint64_t v18 = [(RTStateModelLocation *)v9 initWithLat:v11 Lon:v13 Uncertainty:v15 confidence:0.0 andTimestamp_s:v17];

    double v19 = [(RTStateModel *)self findClusterWithLocation:v18];
    double v20 = [v19 stateDepiction];
    uint64_t v21 = [v20 getRecentVisits:0.0];

    if ([v21 count])
    {
      double v61 = v19;
      double v62 = v18;
      id v64 = v6;
      int v22 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      int v23 = [v22 components:764 fromDate:v8];

      uint64_t v24 = objc_opt_new();
      uint64_t v25 = objc_opt_new();
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __57__RTStateModel_getPredictedExitDatesFromLocation_onDate___block_invoke;
      v70[3] = &unk_1E6B9A920;
      id v59 = v23;
      id v71 = v59;
      double v63 = v8;
      id v72 = v8;
      id v26 = v24;
      id v73 = v26;
      id v27 = v25;
      id v74 = v27;
      double v60 = v21;
      [v21 enumerateObjectsUsingBlock:v70];
      double v28 = [v26 valueForKeyPath:@"@max.self"];
      uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        double v55 = [v28 stringFromDate];
        *(_DWORD *)buf = 138412290;
        uint64_t v77 = v55;
        _os_log_debug_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEBUG, "latest exit date, %@", buf, 0xCu);
      }
      double v58 = v26;
      double v30 = +[RTStateModelAlgorithms bucketizeDates:v26 bucketInterval:v28 latestDate:7200.0];
      double v56 = v28;
      double v57 = v27;
      __int16 v31 = +[RTStateModelAlgorithms bucketizeDates:v27 bucketInterval:v28 latestDate:7200.0];
      id v65 = (id)objc_opt_new();
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v32 = v30;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v66 objects:v82 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v67;
        do
        {
          uint64_t v36 = 0;
          do
          {
            if (*(void *)v67 != v35) {
              objc_enumerationMutation(v32);
            }
            __int16 v37 = *(void **)(*((void *)&v66 + 1) + 8 * v36);
            double v38 = [v32 objectForKeyedSubscript:v37];
            uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              int v47 = [v38 numOfDates];
              *(_DWORD *)buf = 134218242;
              uint64_t v77 = (void *)v47;
              __int16 v78 = 2112;
              double v79 = v37;
              _os_log_debug_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_DEBUG, "%lu exit dates in bucket %@", buf, 0x16u);
            }

            if ((int)[v38 numOfDates] <= 2)
            {
              double v40 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
              if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_21;
              }
              *(_DWORD *)buf = 138412290;
              uint64_t v77 = v37;
              double v41 = v40;
              __int16 v42 = "device does not have enough exits in this bucket, %@";
LABEL_24:
              _os_log_debug_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_DEBUG, v42, buf, 0xCu);
              goto LABEL_21;
            }
            int v43 = [v31 objectForKey:v37];

            if (!v43)
            {
              double v40 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
              if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_21;
              }
              *(_DWORD *)buf = 138412290;
              uint64_t v77 = v37;
              double v41 = v40;
              __int16 v42 = "device does not have any weekly exits during this bucket, %@";
              goto LABEL_24;
            }
            fmin((double)(int)[v38 numOfDates] / 7.0, 1.0);
            id v44 = objc_alloc(MEMORY[0x1E4F5CE98]);
            double v45 = [v38 averageDate];
            [v38 stdDeviation];
            double v40 = [v44 initWithDate:v45];

            [v65 addObject:v40];
            __int16 v46 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              __int16 v48 = [v38 averageDate];
              [v38 stdDeviation];
              *(_DWORD *)buf = 138412802;
              uint64_t v77 = v48;
              __int16 v78 = 2048;
              double v79 = v49;
              __int16 v80 = 2112;
              double v81 = v40;
              _os_log_debug_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_DEBUG, "bucketExitAverage, %@, bucketExitStdDeviation, %.4f, predictedExitDate, %@", buf, 0x20u);
            }
LABEL_21:

            ++v36;
          }
          while (v34 != v36);
          uint64_t v50 = [v32 countByEnumeratingWithState:&v66 objects:v82 count:16];
          uint64_t v34 = v50;
        }
        while (v50);
      }

      uint64_t v51 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"confidence" ascending:0];
      uint64_t v52 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:1];
      v75[0] = v51;
      v75[1] = v52;
      double v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
      [v65 sortUsingDescriptors:v53];

      double v8 = v63;
      id v6 = v64;
      double v19 = v61;
      uint64_t v18 = v62;
      uint64_t v21 = v60;
    }
    else
    {
      id v65 = 0;
    }
  }

  return v65;
}

void __57__RTStateModel_getPredictedExitDatesFromLocation_onDate___block_invoke(id *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 EntryExit_s];
  double v4 = (void *)MEMORY[0x1E4F1C9C8];
  [v3 entry_s];
  uint64_t v5 = [v4 dateWithTimeIntervalSinceReferenceDate:];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  [v3 exit_s];
  uint64_t v7 = [v6 dateWithTimeIntervalSinceReferenceDate:];
  double v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v28 = (void *)v5;
  double v9 = [v8 components:764 fromDate:v5];

  double v10 = (void *)[v9 copy];
  [v10 setYear:[a1[4] year]];
  [v10 setMonth:[a1[4] month]];
  [v10 setDay:[a1[4] day]];
  double v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v12 = [v11 dateFromComponents:v10];

  if ([a1[5] compare:v12] == -1)
  {
    [v10 setDay:[v10 day] - 1];
    double v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v14 = [v13 dateFromComponents:v10];

    double v12 = (void *)v14;
  }
  double v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v16 = [v15 components:764 fromDateComponents:v9 toDateComponents:v10 options:0];

  double v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v27 = (void *)v7;
  uint64_t v18 = [v17 dateByAddingComponents:v16 toDate:v7 options:0];

  double v19 = [a1[5] laterDate:v12];
  if ([v19 isEqualToDate:a1[5]])
  {
    double v20 = [a1[5] earlierDate:v18];
    int v21 = [v20 isEqualToDate:a1[5]];

    if (v21)
    {
      [a1[6] addObject:v18];
      int v22 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        id v26 = [v18 stringFromDate];
        uint64_t v24 = [v28 stringFromDate];
        [v27 stringFromDate];
        *(_DWORD *)buf = 138412802;
        double v30 = v26;
        __int16 v31 = 2112;
        id v32 = v24;
        v34 = __int16 v33 = 2112;
        uint64_t v25 = (void *)v34;
        _os_log_debug_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEBUG, "potential exit date, %@ (%@ - %@)", buf, 0x20u);
      }
      uint64_t v23 = [v9 weekday];
      if (v23 == [v10 weekday]) {
        [a1[7] addObject:v18];
      }
    }
  }
  else
  {
  }
}

- (id)getPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = v8;
  id v10 = 0;
  if (v7 && v8)
  {
    double v11 = [v8 earlierDate:v7];

    if (v11 == v9)
    {
      id v10 = 0;
    }
    else
    {
      double v12 = objc_opt_new();
      [v7 timeIntervalSinceReferenceDate];
      uint64_t v14 = v13;
      [(RTStateModel *)self getNumberOfWeeksInStateModel];
      int v16 = (int)v15;
      [v9 timeIntervalSinceDate:v7];
      uint64_t v18 = v17;
      double v19 = [(RTStateModel *)self stateModelLut];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __72__RTStateModel_getPredictedLocationsOfInterestBetweenStartDate_endDate___block_invoke;
      v33[3] = &unk_1E6B9A948;
      uint64_t v35 = v14;
      uint64_t v36 = v18;
      int v37 = v16;
      id v20 = v12;
      id v34 = v20;
      [v19 enumerateKeysAndObjectsUsingBlock:v33];

      int v21 = objc_opt_new();
      int v22 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"stateDepiction.getNumOfVisitsOverall" ascending:1];
      v46[0] = v22;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
      uint64_t v24 = [v20 sortedArrayUsingDescriptors:v23];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __72__RTStateModel_getPredictedLocationsOfInterestBetweenStartDate_endDate___block_invoke_2;
      v31[3] = &unk_1E6B90B78;
      id v10 = v21;
      id v32 = v10;
      [v24 enumerateObjectsUsingBlock:v31];

      uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = NSStringFromSelector(a2);
        uint64_t v27 = [v10 count];
        double v28 = [v7 stringFromDate];
        uint64_t v29 = [v9 stringFromDate];
        *(_DWORD *)buf = 138413058;
        uint64_t v39 = v26;
        __int16 v40 = 2048;
        uint64_t v41 = v27;
        __int16 v42 = 2112;
        int v43 = v28;
        __int16 v44 = 2112;
        double v45 = v29;
        _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "%@ found %lu PLOIs the device may travel to between startDate, %@, endDate, %@", buf, 0x2Au);
      }
    }
  }

  return v10;
}

void __72__RTStateModel_getPredictedLocationsOfInterestBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = a2;
  id v6 = [v9 stateDepiction];
  id v7 = [v6 getPredState:*(unsigned int *)(a1 + 56) predictionWindow:v5 numOfWeeks:*(double *)(a1 + 40) uniqueID:*(double *)(a1 + 48)];

  +[RTStateModel getOutOfStateConfidenceWithOneStatePred:v7];
  if (v8 >= 1.0) {
    [*(id *)(a1 + 32) addObject:v9];
  }
}

void __72__RTStateModel_getPredictedLocationsOfInterestBetweenStartDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F5CE10];
  id v4 = a2;
  id v6 = (id)[[v3 alloc] initWithOneState:v4];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F5CEA0]) initWithLocationOfInterest:v6 confidence:0 nextEntryTime:0 motionActivityType:1.0];
  [*(id *)(a1 + 32) addObject:v5];
}

- (void)collectMetricsWithIntervalSinceLastUpdate:(double)a3
{
  id v5 = [(RTStateModel *)self metricManager];

  if (v5)
  {
    id v6 = [(RTStateModel *)self metricManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__RTStateModel_collectMetricsWithIntervalSinceLastUpdate___block_invoke;
    v7[3] = &unk_1E6B9A970;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    [v6 fetchDiagnosticsEnabled:v7];
  }
}

void __58__RTStateModel_collectMetricsWithIntervalSinceLastUpdate___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) queue];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __58__RTStateModel_collectMetricsWithIntervalSinceLastUpdate___block_invoke_2;
    v4[3] = &unk_1E6B91248;
    v4[4] = *(void *)(a1 + 32);
    v4[5] = *(void *)(a1 + 40);
    dispatch_async(v3, v4);
  }
}

void __58__RTStateModel_collectMetricsWithIntervalSinceLastUpdate___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  [*(id *)(a1 + 32) logStateModelAvailabilityMetricWithIntervalSinceLastUpdate:v2 untilNow:*(double *)(a1 + 40)];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
}

- (void)setStateModelLut:(id)a3
{
}

- (void)logStateModelAvailabilityMetricWithIntervalSinceLastUpdate:(double)a3 untilNow:(id)a4
{
  id v19 = a4;
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:-fmin(a3 sinceDate:4233600.0)];
  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v8 = [v7 components:124 fromDate:v6];

  [v8 setMinute:0];
  [v8 setSecond:0];
  id v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v10 = [v9 dateFromComponents:v8];

  if (v10)
  {
    double v11 = [v10 earlierDate:v19];

    if (v11 == v10)
    {
      do
      {
        uint64_t v13 = [(RTStateModel *)self getMostRecentLocationForDate:v10];
        if (v13)
        {
          uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v13];
          double v15 = [(RTStateModel *)self _getNextPredictedLocationsOfInterestFromLocation:v14 startDate:v10 timeInterval:3600.0];
          [(RTStateModel *)self calculateStateModelAvailabilityPrecisionRecallOnDate:v10 predictedLocations:v15 isHighConfidenceOnly:0];
          int v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF.confidence > 0"];
          uint64_t v17 = [v15 filteredArrayUsingPredicate:v16];

          [(RTStateModel *)self calculateStateModelAvailabilityPrecisionRecallOnDate:v10 predictedLocations:v17 isHighConfidenceOnly:1];
        }
        double v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v10 sinceDate:3600.0];

        uint64_t v18 = [v12 earlierDate:v19];

        id v10 = v12;
      }
      while (v18 == v12);
    }
    else
    {
      double v12 = v10;
    }
  }
  else
  {
    double v12 = 0;
  }
}

- (unsigned)calculateStateModelAvailabilityPrecisionRecallOnDate:(id)a3 predictedLocations:(id)a4 isHighConfidenceOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  if ([v9 count])
  {
    if (v5) {
      int v10 = 6;
    }
    else {
      int v10 = 2;
    }
    *((_DWORD *)v23 + 6) = v10;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __126__RTStateModel_RTMetricManager__calculateStateModelAvailabilityPrecisionRecallOnDate_predictedLocations_isHighConfidenceOnly___block_invoke;
    v19[3] = &unk_1E6B9A9C0;
    v20[0] = v8;
    v20[1] = &v22;
    BOOL v21 = v5;
    [v9 enumerateObjectsUsingBlock:v19];
    double v11 = (id *)v20;
  }
  else
  {
    if (v5) {
      int v12 = 7;
    }
    else {
      int v12 = 3;
    }
    *((_DWORD *)v23 + 6) = v12;
    uint64_t v13 = [(RTStateModel *)self stateModelLut];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __126__RTStateModel_RTMetricManager__calculateStateModelAvailabilityPrecisionRecallOnDate_predictedLocations_isHighConfidenceOnly___block_invoke_3;
    v16[3] = &unk_1E6B9A9E8;
    v17[0] = v8;
    v17[1] = &v22;
    BOOL v18 = v5;
    [v13 enumerateKeysAndObjectsUsingBlock:v16];
    double v11 = (id *)v17;
  }
  unsigned int v14 = *((_DWORD *)v23 + 6);

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __126__RTStateModel_RTMetricManager__calculateStateModelAvailabilityPrecisionRecallOnDate_predictedLocations_isHighConfidenceOnly___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = [a2 locationOfInterest];
  id v7 = [v6 visits];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __126__RTStateModel_RTMetricManager__calculateStateModelAvailabilityPrecisionRecallOnDate_predictedLocations_isHighConfidenceOnly___block_invoke_2;
  v10[3] = &unk_1E6B9A998;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = v8;
  uint64_t v12 = v9;
  char v14 = *(unsigned char *)(a1 + 48);
  uint64_t v13 = a4;
  [v7 enumerateObjectsUsingBlock:v10];
}

void __126__RTStateModel_RTMetricManager__calculateStateModelAvailabilityPrecisionRecallOnDate_predictedLocations_isHighConfidenceOnly___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = a2;
  id v11 = [v6 dateWithTimeInterval:v7 sinceDate:3600.0];
  uint64_t v9 = [v8 entryDate];

  LODWORD(v7) = [v9 betweenDate:*(void *)(a1 + 32) andDate:v11];
  if (v7)
  {
    if (*(unsigned char *)(a1 + 56)) {
      int v10 = 5;
    }
    else {
      int v10 = 1;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
    *a4 = 1;
    **(unsigned char **)(a1 + 48) = 1;
  }
}

void __126__RTStateModel_RTMetricManager__calculateStateModelAvailabilityPrecisionRecallOnDate_predictedLocations_isHighConfidenceOnly___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  uint64_t v7 = [v6 stateDepiction];
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  [v7 getRecentVisits:];
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [v6 stateDepiction];

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:*(void *)(a1 + 32) sinceDate:3600.0];
  [v9 timeIntervalSinceReferenceDate];
  int v10 = [v8 getRecentVisits:];

  id v11 = [MEMORY[0x1E4F1CA80] setWithArray:v15];
  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
  [v11 minusSet:v12];
  uint64_t v13 = [v11 allObjects];
  if ([v13 count])
  {
    if (*(unsigned char *)(a1 + 48)) {
      int v14 = 8;
    }
    else {
      int v14 = 4;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v14;
    *a4 = 1;
  }
}

- (id)getMostRecentLocationForDate:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v54 = 0;
  double v55 = &v54;
  uint64_t v56 = 0x3032000000;
  double v57 = __Block_byref_object_copy__123;
  double v58 = __Block_byref_object_dispose__123;
  id v59 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v49[3] = 0x7FF0000000000000;
  BOOL v5 = [(RTStateModel *)self stateModelLut];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke;
  v45[3] = &unk_1E6B9A880;
  id v40 = v4;
  id v46 = v40;
  int v47 = &v54;
  __int16 v48 = &v50;
  [v5 enumerateKeysAndObjectsUsingBlock:v45];

  if (v55[5]) {
    goto LABEL_3;
  }
  id v6 = [(RTStateModel *)self stateModelLut];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke_3;
  v41[3] = &unk_1E6B9A880;
  id v42 = v40;
  int v43 = v49;
  __int16 v44 = &v54;
  [v6 enumerateKeysAndObjectsUsingBlock:v41];

  if (v55[5])
  {
LABEL_3:
    id v7 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    id v8 = [(id)v55[5] stateDepiction];
    uint64_t v9 = [v8 location];
    [v9 Latitude_deg];
    CLLocationDegrees v11 = v10;
    uint64_t v12 = [(id)v55[5] stateDepiction];
    uint64_t v13 = [v12 location];
    [v13 Longitude_deg];
    CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(v11, v14);
    int v16 = [(id)v55[5] stateDepiction];
    uint64_t v17 = [v16 location];
    [v17 uncertainty_m];
    double v19 = v18;
    id v20 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v21 = [v7 initWithCoordinate:v20 altitude:v15.latitude horizontalAccuracy:v15.longitude verticalAccuracy:0.0 course:v19 speed:0.0 timestamp:0.0];

    if (*((unsigned char *)v51 + 24))
    {
      uint64_t v22 = v21;
    }
    else
    {
      [(RTStateModel *)self getEndingCoordinateWithStartingLocation:v21 distance:1000.0];
      double v24 = v23;
      double v26 = v25;
      id v27 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      double v28 = [(id)v55[5] stateDepiction];
      uint64_t v29 = [v28 location];
      [v29 uncertainty_m];
      double v31 = v30;
      id v32 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v22 = [v27 initWithCoordinate:v32 altitude:v24 horizontalAccuracy:v26 verticalAccuracy:0.0 timestamp:v31];

      __int16 v33 = [[RTStateModelLocation alloc] initWithCLLocation:v22];
      id v34 = [(RTStateModel *)self findClusterWithLocation:v33];

      if (v34)
      {
        uint64_t v35 = _rt_log_facility_get_os_log(RTLogFacilityMetric);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          [v22 coordinate];
          uint64_t v38 = v37;
          [v22 coordinate];
          *(_DWORD *)buf = 134283777;
          uint64_t v61 = v38;
          __int16 v62 = 2049;
          uint64_t v63 = v39;
          _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Attempted to move user out of state by estimation but ended up inside a location of interest at %{private}f, %{private}f.", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    uint64_t v22 = 0;
  }

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  return v22;
}

void __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = [v6 stateDepiction];
  id v8 = [v7 getRecentVisits:0.0];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke_2;
  v10[3] = &unk_1E6B9AA10;
  id v11 = *(id *)(a1 + 32);
  id v12 = v6;
  uint64_t v14 = a4;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:v10];
}

void __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a2;
  id v8 = [v7 EntryExit_s];
  [v8 entry_s];
  [v6 dateWithTimeIntervalSinceReferenceDate:];
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = (void *)MEMORY[0x1E4F1C9C8];
  double v10 = [v7 EntryExit_s];

  [v10 exit_s];
  id v11 = [v9 dateWithTimeIntervalSinceReferenceDate:];

  if ([*(id *)(a1 + 32) betweenDate:v12 andDate:v11])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    *a4 = 1;
    **(unsigned char **)(a1 + 64) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [v4 stateDepiction];
  id v6 = [v5 getRecentVisits:0.0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke_4;
  v9[3] = &unk_1E6B9AA38;
  id v7 = *(id *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 40);
  id v10 = v7;
  id v11 = v4;
  id v8 = v4;
  [v6 enumerateObjectsUsingBlock:v9];
}

void __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 EntryExit_s];
  [v3 entry_s];
  double v5 = v4;
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  double v7 = vabdd_f64(v5, v6);

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  double v9 = *(double *)(v8 + 24);
  if (v7 < v9) {
    double v9 = v7;
  }
  if (v9 == v7)
  {
    *(double *)(v8 + 24) = v7;
    id v10 = *(void **)(a1 + 40);
    id v11 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    objc_storeStrong(v11, v10);
  }
}

- (CLLocationCoordinate2D)getEndingCoordinateWithStartingLocation:(id)a3 distance:(double)a4
{
  id v6 = a3;
  double v7 = [[RTStateModelLocation alloc] initWithCLLocation:v6];
  uint64_t v8 = [(RTStateModel *)self getAllLOIsWithinDistance:v7 ofLocation:a4];
  uint64_t v24 = 0;
  double v25 = (double *)&v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __82__RTStateModel_RTMetricManager__getEndingCoordinateWithStartingLocation_distance___block_invoke;
  v23[3] = &unk_1E6B958B0;
  void v23[4] = &v24;
  [v8 enumerateObjectsUsingBlock:v23];
  [v6 coordinate];
  double v10 = v9;
  [v6 coordinate];
  double v11 = v10 * 0.0174532925;
  double v13 = v12 * 0.0174532925;
  double v14 = (v25[3] + 1000.0) / 1000.0 / 6371.0;
  __double2 v15 = __sincos_stret(v11);
  __double2 v16 = __sincos_stret(v14);
  long double v17 = asin(v15.__cosval * v16.__sinval * 6.123234e-17 + v15.__sinval * v16.__cosval);
  long double v18 = sin(v17);
  long double v19 = atan2(v15.__cosval * v16.__sinval, v16.__cosval - v15.__sinval * v18);
  CLLocationCoordinate2D v20 = CLLocationCoordinate2DMake(v17 * 57.2957795, (v13 + v19) * 57.2957795);
  _Block_object_dispose(&v24, 8);

  double latitude = v20.latitude;
  double longitude = v20.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

void __82__RTStateModel_RTMetricManager__getEndingCoordinateWithStartingLocation_distance___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 stateDepiction];
  id v3 = [v5 location];
  [v3 uncertainty_m];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
}

- (id)getAllLOIsWithinDistance:(double)a3 ofLocation:(id)a4
{
  id v6 = a4;
  double v7 = objc_opt_new();
  uint64_t v8 = [(RTStateModel *)self _getRecursivelyAllLOIsWithinDistance:v6 ofLocation:v7 previouslyFoundLocationsOfInterest:a3];

  double v9 = [v8 allObjects];

  return v9;
}

- (id)_getRecursivelyAllLOIsWithinDistance:(double)a3 ofLocation:(id)a4 previouslyFoundLocationsOfInterest:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = objc_opt_new();
  double v11 = [(RTStateModel *)self stateModelLut];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __116__RTStateModel_RTMetricManager___getRecursivelyAllLOIsWithinDistance_ofLocation_previouslyFoundLocationsOfInterest___block_invoke;
  v23[3] = &unk_1E6B9A8A8;
  id v12 = v8;
  id v24 = v12;
  double v26 = a3;
  id v13 = v10;
  id v25 = v13;
  [v11 enumerateKeysAndObjectsUsingBlock:v23];

  [v13 minusSet:v9];
  if ([v13 count])
  {
    double v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v9];
    [v14 unionSet:v13];
    __double2 v15 = [v13 allObjects];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __116__RTStateModel_RTMetricManager___getRecursivelyAllLOIsWithinDistance_ofLocation_previouslyFoundLocationsOfInterest___block_invoke_2;
    v19[3] = &unk_1E6B9A468;
    id v16 = v14;
    id v20 = v16;
    BOOL v21 = self;
    double v22 = a3;
    [v15 enumerateObjectsUsingBlock:v19];

    id v17 = v16;
  }
  else
  {
    id v17 = v13;
  }

  return v17;
}

void __116__RTStateModel_RTMetricManager___getRecursivelyAllLOIsWithinDistance_ofLocation_previouslyFoundLocationsOfInterest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v17 = a3;
  [*(id *)(a1 + 32) Latitude_deg];
  double v5 = v4;
  [*(id *)(a1 + 32) Longitude_deg];
  double v7 = v6;
  id v8 = [v17 stateDepiction];
  id v9 = [v8 location];
  [v9 Latitude_deg];
  double v11 = v10;
  id v12 = [v17 stateDepiction];
  id v13 = [v12 location];
  [v13 Longitude_deg];
  +[RTStateModel getDistfromLat:v5 fromLon:v7 toLat:v11 toLon:v14];
  double v16 = v15;

  if (v16 <= *(double *)(a1 + 48)) {
    [*(id *)(a1 + 40) addObject:v17];
  }
}

void __116__RTStateModel_RTMetricManager___getRecursivelyAllLOIsWithinDistance_ofLocation_previouslyFoundLocationsOfInterest___block_invoke_2(double *a1, void *a2)
{
  id v3 = (void *)*((void *)a1 + 4);
  double v4 = (void *)*((void *)a1 + 5);
  double v5 = a1[6];
  id v8 = [a2 stateDepiction];
  double v6 = [v8 location];
  double v7 = [v4 _getRecursivelyAllLOIsWithinDistance:v6 ofLocation:*((void *)a1 + 4) previouslyFoundLocationsOfInterest:v5];
  [v3 unionSet:v7];
}

@end