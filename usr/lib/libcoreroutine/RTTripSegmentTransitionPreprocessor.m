@interface RTTripSegmentTransitionPreprocessor
- (BOOL)applyElevationAdjustmentToLoiLocations;
- (NSMutableArray)tripSegmentTransitionStatus;
- (NSMutableArray)tripSegmentTransitions;
- (NSMutableArray)tripSegmentVisitStatus;
- (NSMutableDictionary)transitionStartStopLocations;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTElevationAdjuster)elevationAdjuster;
- (RTLearnedLocationManager)learnedLocationManager;
- (RTLocationManager)locationManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTTripSegmentTransitionPreprocessor)initWithMotionActivityManager:(id)a3 locationManager:(id)a4 learnedLocationManager:(id)a5 vehicleStore:(id)a6 distanceCalculator:(id)a7 visitManager:(id)a8 elevationAdjuster:(id)a9 defaultsManager:(id)a10;
- (RTVehicleStore)vehicleStore;
- (RTVisitManager)visitManager;
- (id)applyRule_LoiVisitsAreValid_ForVisitAtIndex:(id)a3;
- (id)applyRule_LongVisitsAreValid_ForVisitAtIndex:(id)a3;
- (id)applyRule_ShortVisitsAreInvalid_ForVisitAtIndex:(id)a3;
- (id)applyRule_VehicleConnectionCannotSpanVisits_ForVisitAtIndex:(id)a3;
- (id)applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex:(id)a3;
- (id)applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex:(id)a3;
- (id)applyRule_longTransitionsAreInvalid_ForTransitionAtIndex:(id)a3;
- (id)applyRule_shortTransitionsAreInvalid_ForTransitionAtIndex:(id)a3;
- (id)fetchEndpointCLLocationForTransition:(id)a3 atOrigin:(BOOL)a4;
- (id)fetchLearnedLocationOfInterestForVisitIdentifier:(id)a3;
- (id)fetchLearnedLocationOfInterestWithinDistance:(double)a3 location:(id)a4;
- (id)mergeTransition:(id)a3 withSecond:(id)a4;
- (id)processTransitions:(id)a3;
- (void)adjustTransitionEndpoints;
- (void)appendTransitionToCurrentVisit;
- (void)setLocationManager:(id)a3;
- (void)setTripSegmentTransitionStatus:(id)a3;
- (void)setTripSegmentTransitions:(id)a3;
- (void)setTripSegmentVisitStatus:(id)a3;
- (void)tryDeleteTransitions;
- (void)tryMergeTransitions;
@end

@implementation RTTripSegmentTransitionPreprocessor

- (RTTripSegmentTransitionPreprocessor)initWithMotionActivityManager:(id)a3 locationManager:(id)a4 learnedLocationManager:(id)a5 vehicleStore:(id)a6 distanceCalculator:(id)a7 visitManager:(id)a8 elevationAdjuster:(id)a9 defaultsManager:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v45 = a5;
  id v44 = a6;
  id v43 = a7;
  id v42 = a8;
  id v41 = a9;
  id v18 = a10;
  if (!v16)
  {
    v32 = v17;
    v31 = v18;
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: motionActivityManager", buf, 2u);
    }

    v30 = 0;
    goto LABEL_15;
  }
  id v39 = v17;
  if (!v17)
  {
    v31 = v18;
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: locationManager";
LABEL_28:
    _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, v35, buf, 2u);
    goto LABEL_29;
  }
  if (!v45)
  {
    v31 = v18;
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_28;
  }
  if (!v44)
  {
    v31 = v18;
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: vehicleStore";
    goto LABEL_28;
  }
  if (!v43)
  {
    v31 = v18;
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_28;
  }
  if (!v42)
  {
    v31 = v18;
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: visitManager";
    goto LABEL_28;
  }
  if (!v41)
  {
    v31 = v18;
    v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v35 = "Invalid parameter not satisfying: elevationAdjuster";
      goto LABEL_28;
    }
LABEL_29:

    v30 = 0;
    v29 = self;
LABEL_30:
    v32 = v39;
    goto LABEL_31;
  }
  id v38 = v18;
  if (v18)
  {
    v46.receiver = self;
    v46.super_class = (Class)RTTripSegmentTransitionPreprocessor;
    v19 = [(RTTripSegmentTransitionPreprocessor *)&v46 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_motionActivityManager, a3);
      objc_storeStrong((id *)&v20->_locationManager, a4);
      objc_storeStrong((id *)&v20->_learnedLocationManager, a5);
      objc_storeStrong((id *)&v20->_vehicleStore, a6);
      objc_storeStrong((id *)&v20->_distanceCalculator, a7);
      objc_storeStrong((id *)&v20->_visitManager, a8);
      objc_storeStrong((id *)&v20->_elevationAdjuster, a9);
      objc_storeStrong((id *)&v20->_defaultsManager, a10);
      uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
      tripSegmentTransitions = v20->_tripSegmentTransitions;
      v20->_tripSegmentTransitions = (NSMutableArray *)v21;

      uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
      tripSegmentVisitStatus = v20->_tripSegmentVisitStatus;
      v20->_tripSegmentVisitStatus = (NSMutableArray *)v23;

      uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
      tripSegmentTransitionStatus = v20->_tripSegmentTransitionStatus;
      v20->_tripSegmentTransitionStatus = (NSMutableArray *)v25;

      uint64_t v27 = [MEMORY[0x1E4F1CA60] dictionary];
      transitionStartStopLocations = v20->_transitionStartStopLocations;
      v20->_transitionStartStopLocations = (NSMutableDictionary *)v27;
    }
    v29 = v20;
    v30 = v29;
    v31 = v38;
    goto LABEL_30;
  }
  v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v32 = v17;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
  }

  v30 = 0;
  v31 = 0;
LABEL_15:
  v29 = self;
LABEL_31:

  return v30;
}

- (id)processTransitions:(id)a3
{
  v70[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (NSMutableArray *)[v4 mutableCopy];
  tripSegmentTransitions = self->_tripSegmentTransitions;
  self->_tripSegmentTransitions = v5;

  v7 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v55 = [(NSMutableArray *)self->_tripSegmentTransitions count];
    *(_DWORD *)buf = 134217984;
    unint64_t v63 = v55;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: processing %tu input transitions", buf, 0xCu);
  }

  if ([v4 count])
  {
    unint64_t v8 = 0;
    do
    {
      v9 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = [v4 objectAtIndexedSubscript:v8];
        *(_DWORD *)buf = 134218242;
        unint64_t v63 = v8;
        __int16 v64 = 2112;
        v65 = v10;
        _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor, input transition, %ld, %@", buf, 0x16u);
      }
      ++v8;
    }
    while (v8 < [v4 count]);
  }
  if ((unint64_t)[(NSMutableArray *)self->_tripSegmentTransitions count] >= 2)
  {
    id v60 = v4;
    v13 = NSStringFromSelector(sel_applyRule_LoiVisitsAreValid_ForVisitAtIndex_);
    v70[0] = v13;
    v14 = NSStringFromSelector(sel_applyRule_LongVisitsAreValid_ForVisitAtIndex_);
    v70[1] = v14;
    v15 = NSStringFromSelector(sel_applyRule_ShortVisitsAreInvalid_ForVisitAtIndex_);
    v70[2] = v15;
    id v16 = NSStringFromSelector(sel_applyRule_VehicleConnectionCannotSpanVisits_ForVisitAtIndex_);
    v70[3] = v16;
    id v17 = NSStringFromSelector(sel_applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex_);
    v70[4] = v17;
    unint64_t v18 = 0x1E4F1C000uLL;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:5];

    [(NSMutableArray *)self->_tripSegmentVisitStatus removeAllObjects];
    if ([(NSMutableArray *)self->_tripSegmentTransitions count] != 1)
    {
      unint64_t v40 = 0;
      *(void *)&long long v20 = 138413058;
      long long v58 = v20;
      do
      {
        id v41 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          v59 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v40];
          v50 = [v59 stopDate];
          v51 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v40 + 1];
          v52 = [v51 startDate];
          v53 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v40];
          v54 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v40 + 1];
          *(_DWORD *)buf = v58;
          unint64_t v63 = (unint64_t)v50;
          __int16 v64 = 2112;
          v65 = v52;
          __int16 v66 = 2112;
          v67 = v53;
          __int16 v68 = 2112;
          v69 = v54;
          _os_log_debug_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: examining visit between dates: %@ and %@, for transitions, %@ and %@", buf, 0x2Au);

          unint64_t v18 = 0x1E4F1C000;
        }

        tripSegmentVisitStatus = self->_tripSegmentVisitStatus;
        id v43 = [NSNumber numberWithInteger:0];
        [(NSMutableArray *)tripSegmentVisitStatus addObject:v43];

        if ([v19 count])
        {
          uint64_t v44 = 0;
          while (1)
          {
            [v19 objectAtIndexedSubscript:v44, v58];
            id v45 = (NSString *)objc_claimAutoreleasedReturnValue();
            SEL v46 = NSSelectorFromString(v45);
            v47 = [NSNumber numberWithInteger:v40];
            v48 = [(RTTripSegmentTransitionPreprocessor *)self performSelector:v46 withObject:v47];

            v49 = [NSNumber numberWithInteger:0];

            if (v48 != v49) {
              break;
            }

            if (++v44 >= (unint64_t)[v19 count]) {
              goto LABEL_44;
            }
          }
          [(NSMutableArray *)self->_tripSegmentVisitStatus setObject:v48 atIndexedSubscript:v40];
        }
LABEL_44:
        ++v40;
      }
      while (v40 < [(NSMutableArray *)self->_tripSegmentTransitions count] - 1);
    }
    [(RTTripSegmentTransitionPreprocessor *)self tryMergeTransitions];
    [(RTTripSegmentTransitionPreprocessor *)self appendTransitionToCurrentVisit];
    [(RTTripSegmentTransitionPreprocessor *)self adjustTransitionEndpoints];
    uint64_t v21 = NSStringFromSelector(sel_applyRule_shortTransitionsAreInvalid_ForTransitionAtIndex_);
    v61[0] = v21;
    v22 = NSStringFromSelector(sel_applyRule_longTransitionsAreInvalid_ForTransitionAtIndex_);
    v61[1] = v22;
    uint64_t v23 = [*(id *)(v18 + 2424) arrayWithObjects:v61 count:2];

    [(NSMutableArray *)self->_tripSegmentTransitionStatus removeAllObjects];
    if ([(NSMutableArray *)self->_tripSegmentTransitions count])
    {
      unint64_t v24 = 0;
      do
      {
        uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v34 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v24];
          *(_DWORD *)buf = 138412290;
          unint64_t v63 = (unint64_t)v34;
          _os_log_debug_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: examining transition %@", buf, 0xCu);
        }
        tripSegmentTransitionStatus = self->_tripSegmentTransitionStatus;
        uint64_t v27 = [NSNumber numberWithInteger:0];
        [(NSMutableArray *)tripSegmentTransitionStatus addObject:v27];

        if ([v23 count])
        {
          uint64_t v28 = 0;
          while (1)
          {
            v29 = [v23 objectAtIndexedSubscript:v28];
            SEL v30 = NSSelectorFromString(v29);
            v31 = [NSNumber numberWithInteger:v24];
            v32 = [(RTTripSegmentTransitionPreprocessor *)self performSelector:v30 withObject:v31];

            v33 = [NSNumber numberWithInteger:0];

            if (v32 != v33) {
              break;
            }

            if (++v28 >= (unint64_t)[v23 count]) {
              goto LABEL_23;
            }
          }
          [(NSMutableArray *)self->_tripSegmentTransitionStatus setObject:v32 atIndexedSubscript:v24];
        }
LABEL_23:
        ++v24;
      }
      while (v24 < [(NSMutableArray *)self->_tripSegmentTransitions count]);
    }
    [(RTTripSegmentTransitionPreprocessor *)self tryDeleteTransitions];
    v35 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v57 = [(NSMutableArray *)self->_tripSegmentTransitions count];
      *(_DWORD *)buf = 134217984;
      unint64_t v63 = v57;
      _os_log_debug_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: produced %tu output transitions", buf, 0xCu);
    }

    if ([(NSMutableArray *)self->_tripSegmentTransitions count])
    {
      unint64_t v36 = 0;
      do
      {
        v37 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          id v38 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v36];
          *(_DWORD *)buf = 134218242;
          unint64_t v63 = v36;
          __int16 v64 = 2112;
          v65 = v38;
          _os_log_debug_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor, output transition, %ld, %@", buf, 0x16u);
        }
        ++v36;
      }
      while (v36 < [(NSMutableArray *)self->_tripSegmentTransitions count]);
    }
    v12 = self->_tripSegmentTransitions;

    id v4 = v60;
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v56 = [(NSMutableArray *)self->_tripSegmentTransitions count];
      *(_DWORD *)buf = 134217984;
      unint64_t v63 = v56;
      _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: _tripSegmentTransitions.count == %tu, returning", buf, 0xCu);
    }

    v12 = self->_tripSegmentTransitions;
  }

  return v12;
}

- (void)tryMergeTransitions
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableArray *)self->_tripSegmentTransitions copy];
  uint64_t v4 = [(NSMutableArray *)self->_tripSegmentVisitStatus count];
  if (v4 != [v3 count] - 1)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [(NSMutableArray *)self->_tripSegmentVisitStatus count];
      *(_DWORD *)buf = 134218240;
      uint64_t v30 = v26;
      __int16 v31 = 2048;
      uint64_t v32 = [v3 count];
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:updateTransitions, unexpected size for _tripSegmentVisitStatus, %tu, and transitions, %tu", buf, 0x16u);
    }
    goto LABEL_19;
  }
  if (!v3)
  {
    unint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:updateTransitions, transitions nil, returning", buf, 2u);
    }

    uint64_t v23 = 0;
    goto LABEL_23;
  }
  if (![v3 count])
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = [v3 count];
      _os_log_debug_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:updateTransitions, size %tu < 1", buf, 0xCu);
    }
LABEL_19:

    uint64_t v23 = (NSMutableArray *)[v3 mutableCopy];
LABEL_23:
    tripSegmentTransitions = self->_tripSegmentTransitions;
    self->_tripSegmentTransitions = v23;

    goto LABEL_24;
  }
  [(NSMutableArray *)self->_tripSegmentTransitions removeAllObjects];
  v5 = self->_tripSegmentTransitions;
  v6 = [v3 objectAtIndexedSubscript:0];
  [(NSMutableArray *)v5 addObject:v6];

  v7 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = [(NSMutableArray *)self->_tripSegmentTransitions lastObject];
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = (uint64_t)v27;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: initializing with transition %@", buf, 0xCu);
  }
  if ((unint64_t)[v3 count] >= 2)
  {
    unint64_t v9 = 1;
    *(void *)&long long v8 = 138412290;
    long long v28 = v8;
    do
    {
      v10 = -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentVisitStatus, "objectAtIndexedSubscript:", v9 - 1, v28);
      uint64_t v11 = [v10 integerValue];

      v12 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11 == 2)
      {
        if (v13)
        {
          v19 = [(NSMutableArray *)self->_tripSegmentTransitions lastObject];
          long long v20 = [v3 objectAtIndexedSubscript:v9];
          *(_DWORD *)buf = 138412546;
          uint64_t v30 = (uint64_t)v19;
          __int16 v31 = 2112;
          uint64_t v32 = (uint64_t)v20;
          _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: merging transition %@ with %@", buf, 0x16u);
        }
        v14 = [(NSMutableArray *)self->_tripSegmentTransitions lastObject];
        v15 = [v3 objectAtIndexedSubscript:v9];
        id v16 = [(RTTripSegmentTransitionPreprocessor *)self mergeTransition:v14 withSecond:v15];

        [(NSMutableArray *)self->_tripSegmentTransitions removeLastObject];
        id v17 = self->_tripSegmentTransitions;
      }
      else
      {
        if (v13)
        {
          uint64_t v21 = [v3 objectAtIndexedSubscript:v9];
          *(_DWORD *)buf = v28;
          uint64_t v30 = (uint64_t)v21;
          _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: retaining transition %@", buf, 0xCu);
        }
        unint64_t v18 = self->_tripSegmentTransitions;
        id v16 = [v3 objectAtIndexedSubscript:v9];
        id v17 = v18;
      }
      [(NSMutableArray *)v17 addObject:v16];

      ++v9;
    }
    while (v9 < [v3 count]);
  }
LABEL_24:
}

- (void)tryDeleteTransitions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableArray *)self->_tripSegmentTransitions copy];
  uint64_t v4 = [(NSMutableArray *)self->_tripSegmentTransitionStatus count];
  if (v4 != [v3 count])
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [(NSMutableArray *)self->_tripSegmentTransitionStatus count];
      *(_DWORD *)buf = 134218240;
      uint64_t v21 = v18;
      __int16 v22 = 2048;
      uint64_t v23 = [v3 count];
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:updateTransitions, unexpected size for _tripSegmentTransitionStatus, %tu, and transitions, %tu", buf, 0x16u);
    }

    v15 = (NSMutableArray *)[v3 mutableCopy];
    goto LABEL_19;
  }
  if (!v3)
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:updateTransitions, transitions nil, returning", buf, 2u);
    }

    v15 = 0;
LABEL_19:
    tripSegmentTransitions = self->_tripSegmentTransitions;
    self->_tripSegmentTransitions = v15;

    goto LABEL_20;
  }
  [(NSMutableArray *)self->_tripSegmentTransitions removeAllObjects];
  if ([v3 count])
  {
    unint64_t v6 = 0;
    *(void *)&long long v5 = 138412290;
    long long v19 = v5;
    do
    {
      v7 = -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitionStatus, "objectAtIndexedSubscript:", v6, v19);
      uint64_t v8 = [v7 integerValue];

      unint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
      if (v8 == 2)
      {
        if (v10)
        {
          uint64_t v11 = [v3 objectAtIndexedSubscript:v6];
          *(_DWORD *)buf = v19;
          uint64_t v21 = (uint64_t)v11;
          _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: rejecting transition %@", buf, 0xCu);
        }
      }
      else
      {
        if (v10)
        {
          BOOL v13 = [v3 objectAtIndexedSubscript:v6];
          *(_DWORD *)buf = v19;
          uint64_t v21 = (uint64_t)v13;
          _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: retaining transition %@", buf, 0xCu);
        }
        v12 = self->_tripSegmentTransitions;
        unint64_t v9 = [v3 objectAtIndexedSubscript:v6];
        [(NSMutableArray *)v12 addObject:v9];
      }

      ++v6;
    }
    while (v6 < [v3 count]);
  }
LABEL_20:
}

- (id)mergeTransition:(id)a3 withSecond:(id)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v40 = a4;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  uint64_t v45 = 0;
  SEL v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__120;
  v49 = __Block_byref_object_dispose__120;
  id v50 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  motionActivityManager = self->_motionActivityManager;
  unint64_t v9 = [v6 startDate];
  BOOL v10 = [v40 stopDate];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __66__RTTripSegmentTransitionPreprocessor_mergeTransition_withSecond___block_invoke;
  v41[3] = &unk_1E6B908E0;
  id v43 = &v51;
  uint64_t v44 = &v45;
  uint64_t v11 = v7;
  id v42 = v11;
  [(RTMotionActivityManager *)motionActivityManager fetchPredominantMotionActivityTypeFromStartDate:v9 toEndDate:v10 withHandler:v41];

  v12 = (id *)(v46 + 5);
  id v13 = (id)v46[5];
  v14 = v11;
  v15 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v16 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v14, v16))
  {
    id v39 = [MEMORY[0x1E4F1C9C8] now];
    [v39 timeIntervalSinceDate:v15];
    double v18 = v17;
    long long v19 = objc_opt_new();
    long long v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
    uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v22 = [v21 filteredArrayUsingPredicate:v20];
    uint64_t v23 = [v22 firstObject];

    [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    v56[0] = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v56 count:1];
    uint64_t v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v26];

    if (v27)
    {
      id v13 = v27;
    }
  }

  objc_storeStrong(v12, v13);
  long long v28 = [RTLearnedTransition alloc];
  id v29 = objc_alloc_init(MEMORY[0x1E4F29128]);
  uint64_t v30 = [v6 startDate];
  __int16 v31 = [v40 stopDate];
  uint64_t v32 = [v6 visitIdentifierOrigin];
  uint64_t v33 = [v40 visitIdentifierDestination];
  v34 = [v6 creationDate];
  v35 = [v6 expirationDate];
  unint64_t v36 = [(RTLearnedTransition *)v28 initWithIdentifier:v29 startDate:v30 stopDate:v31 visitIdentifierOrigin:v32 visitIdentifierDestination:v33 creationDate:v34 expirationDate:v35 predominantMotionActivityType:v52[3]];

  v37 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v36;
    _os_log_debug_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: merging transitions into, %@", buf, 0xCu);
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v36;
}

void __66__RTTripSegmentTransitionPreprocessor_mergeTransition_withSecond___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  dispatch_semaphore_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: Failed to fetch motion activities, error, %@, using RTMotionActivityTypeUnknown", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      id v12 = a2;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "RTTripSegmentTransitionPreprocessor: Predominant motion activity, %lu", (uint8_t *)&v11, 0xCu);
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)applyRule_LongVisitsAreValid_ForVisitAtIndex:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a3 integerValue];
  if (v5 >= [(NSMutableArray *)self->_tripSegmentTransitions count] - 1)
  {
    __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [(NSMutableArray *)self->_tripSegmentTransitions count];
      int v34 = 134218240;
      unint64_t v35 = v5;
      __int16 v36 = 2048;
      uint64_t v37 = v26 - 2;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: visitIndex, %ld, out of range [0, %tu]. Passthrough", (uint8_t *)&v34, 0x16u);
    }

    goto LABEL_13;
  }
  id v6 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  dispatch_semaphore_t v7 = [v6 stopDate];
  uint64_t v8 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5 + 1];
  unint64_t v9 = [v8 startDate];
  char v10 = [v7 isBeforeDate:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = (objc_class *)objc_opt_class();
      long long v28 = NSStringFromClass(v27);
      id v29 = NSStringFromSelector(a2);
      uint64_t v30 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
      __int16 v31 = [v30 stopDate];
      uint64_t v32 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5 + 1];
      uint64_t v33 = [v32 startDate];
      int v34 = 138413314;
      unint64_t v35 = (unint64_t)v28;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v29;
      __int16 v38 = 2048;
      unint64_t v39 = v5;
      __int16 v40 = 2112;
      id v41 = v31;
      __int16 v42 = 2112;
      id v43 = v33;
      _os_log_debug_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_DEBUG, "%@:%@, malformed transition, tripSegmentVisitStatus[%ld], start/stop dates: %@, %@, Passthrough", (uint8_t *)&v34, 0x34u);
    }
LABEL_13:
    uint64_t v24 = [NSNumber numberWithInteger:0];
    goto LABEL_18;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v12 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  uint64_t v13 = [v12 stopDate];
  v14 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5 + 1];
  v15 = [v14 startDate];
  dispatch_time_t v16 = (void *)[v11 initWithStartDate:v13 endDate:v15];

  [v16 duration];
  double v18 = v17;
  long long v19 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v18 <= 7200.0)
  {
    if (v20)
    {
      int v34 = 134217984;
      unint64_t v35 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_LongVisitsAreValid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Passthrough", (uint8_t *)&v34, 0xCu);
    }
    uint64_t v21 = 0;
  }
  else
  {
    if (v20)
    {
      int v34 = 134217984;
      unint64_t v35 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_LongVisitsAreValid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Accept", (uint8_t *)&v34, 0xCu);
    }
    uint64_t v21 = 1;
  }

  uint64_t v24 = [NSNumber numberWithInteger:v21];

LABEL_18:

  return v24;
}

- (id)applyRule_ShortVisitsAreInvalid_ForVisitAtIndex:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a3 integerValue];
  if (v5 >= [(NSMutableArray *)self->_tripSegmentTransitions count] - 1)
  {
    __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [(NSMutableArray *)self->_tripSegmentTransitions count];
      int v34 = 134218240;
      unint64_t v35 = v5;
      __int16 v36 = 2048;
      uint64_t v37 = v26 - 2;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: visitIndex, %ld, out of range [0, %tu]. Passthrough", (uint8_t *)&v34, 0x16u);
    }

    goto LABEL_12;
  }
  id v6 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  dispatch_semaphore_t v7 = [v6 stopDate];
  uint64_t v8 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5 + 1];
  unint64_t v9 = [v8 startDate];
  char v10 = [v7 isBeforeDate:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = (objc_class *)objc_opt_class();
      long long v28 = NSStringFromClass(v27);
      id v29 = NSStringFromSelector(a2);
      uint64_t v30 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
      __int16 v31 = [v30 stopDate];
      uint64_t v32 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5 + 1];
      uint64_t v33 = [v32 startDate];
      int v34 = 138413314;
      unint64_t v35 = (unint64_t)v28;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v29;
      __int16 v38 = 2048;
      unint64_t v39 = v5;
      __int16 v40 = 2112;
      id v41 = v31;
      __int16 v42 = 2112;
      id v43 = v33;
      _os_log_debug_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_DEBUG, "%@:%@, malformed transition, tripSegmentVisitStatus[%ld], start/stop dates: %@, %@, Passthrough", (uint8_t *)&v34, 0x34u);
    }
LABEL_12:
    uint64_t v24 = [NSNumber numberWithInteger:0];
    goto LABEL_17;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v12 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  uint64_t v13 = [v12 stopDate];
  v14 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5 + 1];
  v15 = [v14 startDate];
  dispatch_time_t v16 = (void *)[v11 initWithStartDate:v13 endDate:v15];

  [v16 duration];
  double v18 = v17;
  long long v19 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v18 >= 120.0)
  {
    if (v20)
    {
      int v34 = 134217984;
      unint64_t v35 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_ShortVisitsAreInvalid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Passthrough", (uint8_t *)&v34, 0xCu);
    }
    uint64_t v21 = 0;
  }
  else if (v20)
  {
    int v34 = 134217984;
    unint64_t v35 = v5;
    uint64_t v21 = 2;
    _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_ShortVisitsAreInvalid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Reject", (uint8_t *)&v34, 0xCu);
  }
  else
  {
    uint64_t v21 = 2;
  }

  uint64_t v24 = [NSNumber numberWithInteger:v21];

LABEL_17:

  return v24;
}

- (id)applyRule_VehicleConnectionCannotSpanVisits_ForVisitAtIndex:(id)a3
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v71 = a3;
  unint64_t v5 = [v71 integerValue];
  if (v5 >= [(NSMutableArray *)self->_tripSegmentTransitions count] - 1)
  {
    unint64_t v37 = v5;
    __int16 v38 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uint64_t v59 = [(NSMutableArray *)self->_tripSegmentTransitions count];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v37;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v59 - 2;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: visitIndex, %ld, out of range [0, %tu]. Passthrough", buf, 0x16u);
    }

    uint64_t v39 = [NSNumber numberWithInteger:0];
    goto LABEL_14;
  }
  v69 = (uint64_t (*)(uint64_t, uint64_t))v5;
  id v6 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  dispatch_semaphore_t v7 = [v6 stopDate];
  uint64_t v8 = (char *)v69 + 1;
  unint64_t v9 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:(char *)v69 + 1];
  char v10 = [v9 startDate];
  char v11 = [v7 isBeforeDate:v10];

  if ((v11 & 1) == 0)
  {
    __int16 v40 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      id v60 = (objc_class *)objc_opt_class();
      v61 = NSStringFromClass(v60);
      v62 = NSStringFromSelector(a2);
      unint64_t v63 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v69];
      __int16 v64 = [v63 stopDate];
      v65 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v8];
      __int16 v66 = [v65 startDate];
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v61;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v62;
      *(_WORD *)&buf[22] = 2048;
      v78 = v69;
      *(_WORD *)v79 = 2112;
      *(void *)&v79[2] = v64;
      *(_WORD *)&v79[10] = 2112;
      *(void *)&v79[12] = v66;
      _os_log_debug_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_DEBUG, "%@:%@, malformed transition, tripSegmentVisitStatus[%ld], start/stop dates: %@, %@, Passthrough", buf, 0x34u);
    }
    uint64_t v39 = [NSNumber numberWithInteger:0];
LABEL_14:
    id v41 = (void *)v39;
    goto LABEL_32;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v13 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v69];
  v14 = [v13 stopDate];
  v15 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v8];
  dispatch_time_t v16 = [v15 startDate];
  uint64_t v17 = [v12 initWithStartDate:v14 endDate:v16];

  v72 = (void *)v17;
  uint64_t v18 = [objc_alloc(MEMORY[0x1E4F5CF50]) initWithDateInterval:v17 limit:0];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v78 = __Block_byref_object_copy__120;
  *(void *)v79 = __Block_byref_object_dispose__120;
  *(void *)&v79[8] = 0;
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  vehicleStore = self->_vehicleStore;
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __99__RTTripSegmentTransitionPreprocessor_applyRule_VehicleConnectionCannotSpanVisits_ForVisitAtIndex___block_invoke;
  v73[3] = &unk_1E6B90700;
  v75 = buf;
  uint64_t v21 = v19;
  v74 = v21;
  __int16 v68 = (void *)v18;
  [(RTVehicleStore *)vehicleStore fetchVehiclesWithOptions:v18 handler:v73];
  dsema = v21;
  __int16 v22 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v23 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v23)) {
    goto LABEL_15;
  }
  uint64_t v24 = [MEMORY[0x1E4F1C9C8] now];
  [v24 timeIntervalSinceDate:v22];
  double v26 = v25;
  uint64_t v27 = objc_opt_new();
  long long v28 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
  id v29 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v30 = [v29 filteredArrayUsingPredicate:v28];
  __int16 v31 = [v30 firstObject];

  [v27 submitToCoreAnalytics:v31 type:1 duration:v26];
  uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v76 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v76, 2u);
  }

  uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
  v80[0] = *MEMORY[0x1E4F28568];
  *(void *)v76 = @"semaphore wait timeout";
  int v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v80 count:1];
  unint64_t v35 = [v33 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v34];

  if (v35)
  {
    id v36 = v35;
  }
  else
  {
LABEL_15:
    id v36 = 0;
  }

  id v67 = v36;
  __int16 v42 = *(void **)(*(void *)&buf[8] + 40);
  if (v42)
  {
    for (unint64_t i = 0; i < [v42 count:v67]; ++i)
    {
      uint64_t v44 = [*(id *)(*(void *)&buf[8] + 40) objectAtIndexedSubscript:i];
      uint64_t v45 = [v44 dateInterval];
      SEL v46 = [v45 startDate];
      uint64_t v47 = [v72 startDate];
      if ([v46 isBeforeDate:v47])
      {
        v48 = [*(id *)(*(void *)&buf[8] + 40) objectAtIndexedSubscript:i];
        v49 = [v48 dateInterval];
        id v50 = [v49 endDate];
        uint64_t v51 = [v72 endDate];
        int v52 = [v50 isAfterDate:v51];

        if (v52)
        {
          uint64_t v56 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v76 = 134217984;
            *(void *)&v76[4] = v69;
            _os_log_debug_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_ShortVisitsAreInvalid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Reject", v76, 0xCu);
          }

          uint64_t v55 = [NSNumber numberWithInteger:2];
          goto LABEL_31;
        }
      }
      else
      {
      }
      __int16 v42 = *(void **)(*(void *)&buf[8] + 40);
    }
    uint64_t v53 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_27;
    }
    *(_DWORD *)v76 = 134217984;
    *(void *)&v76[4] = v69;
    uint64_t v54 = "RTTripSegmentTransitionPreprocessor: applyRule_VehicleConnectionCannotSpanVisits_ForVisitAtIndex, tripSegmentV"
          "isitStatus[%ld], Passthrough";
  }
  else
  {
    uint64_t v53 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_27;
    }
    *(_DWORD *)v76 = 134217984;
    *(void *)&v76[4] = v69;
    uint64_t v54 = "RTTripSegmentTransitionPreprocessor: applyRule_VehicleConnectionCannotSpanVisits_ForVisitAtIndex, no vehicles "
          "found for tripSegmentVisitStatus[%ld], Passthrough";
  }
  _os_log_debug_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_DEBUG, v54, v76, 0xCu);
LABEL_27:

  uint64_t v55 = [NSNumber numberWithInteger:0];
LABEL_31:
  id v41 = (void *)v55;

  _Block_object_dispose(buf, 8);
LABEL_32:

  return v41;
}

void __99__RTTripSegmentTransitionPreprocessor_applyRule_VehicleConnectionCannotSpanVisits_ForVisitAtIndex___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex:(id)a3
{
  v97[1] = *MEMORY[0x1E4F143B8];
  id v75 = a3;
  unint64_t v5 = [v75 integerValue];
  if (v5 >= [(NSMutableArray *)self->_tripSegmentTransitions count] - 1)
  {
    uint64_t v54 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      uint64_t v59 = [(NSMutableArray *)self->_tripSegmentTransitions count];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v59 - 2;
      _os_log_error_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: visitIndex, %ld, out of range [0, %tu]. Passthrough", buf, 0x16u);
    }
    goto LABEL_16;
  }
  id v6 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  dispatch_semaphore_t v7 = [v6 stopDate];
  unint64_t v72 = v5 + 1;
  uint64_t v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:");
  unint64_t v9 = [v8 startDate];
  char v10 = [v7 isBeforeDate:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v54 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      __int16 v64 = (objc_class *)objc_opt_class();
      v65 = NSStringFromClass(v64);
      __int16 v66 = NSStringFromSelector(a2);
      id v67 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
      __int16 v68 = [v67 stopDate];
      v69 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v72];
      v70 = [v69 startDate];
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v65;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v66;
      *(_WORD *)&buf[22] = 2048;
      v95 = (uint64_t (*)(uint64_t, uint64_t))v5;
      *(_WORD *)v96 = 2112;
      *(void *)&v96[2] = v68;
      *(_WORD *)&v96[10] = 2112;
      *(void *)&v96[12] = v70;
      _os_log_debug_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_DEBUG, "%@:%@, malformed transition, tripSegmentVisitStatus[%ld], start/stop dates: %@, %@, Passthrough", buf, 0x34u);
    }
LABEL_16:

    uint64_t v55 = [NSNumber numberWithInteger:0];
    goto LABEL_36;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v12 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  uint64_t v13 = [v12 stopDate];
  v14 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v72];
  v15 = [v14 startDate];
  dispatch_time_t v16 = (void *)[v11 initWithStartDate:v13 endDate:v15];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v95 = __Block_byref_object_copy__120;
  *(void *)v96 = __Block_byref_object_dispose__120;
  *(void *)&v96[8] = 0;
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__120;
  v85 = __Block_byref_object_dispose__120;
  id v86 = 0;
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  motionActivityManager = self->_motionActivityManager;
  dispatch_semaphore_t v19 = [v16 startDate];
  BOOL v20 = [v16 endDate];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __102__RTTripSegmentTransitionPreprocessor_applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex___block_invoke;
  v76[3] = &unk_1E6B928A8;
  id v73 = v16;
  id v77 = v73;
  v79 = buf;
  v80 = &v81;
  uint64_t v21 = v17;
  v78 = v21;
  [(RTMotionActivityManager *)motionActivityManager fetchMotionActivitiesFromStartDate:v19 endDate:v20 handler:v76];

  __int16 v22 = (id *)(v82 + 5);
  id v23 = (id)v82[5];
  dsema = v21;
  uint64_t v24 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v25 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(dsema, v25))
  {
    id v71 = [MEMORY[0x1E4F1C9C8] now];
    [v71 timeIntervalSinceDate:v24];
    double v27 = v26;
    long long v28 = objc_opt_new();
    id v29 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
    uint64_t v30 = [MEMORY[0x1E4F29060] callStackSymbols];
    __int16 v31 = [v30 filteredArrayUsingPredicate:v29];
    uint64_t v32 = [v31 firstObject];

    [v28 submitToCoreAnalytics:v32 type:1 duration:v27];
    uint64_t v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v87 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v87, 2u);
    }

    int v34 = (void *)MEMORY[0x1E4F28C58];
    v97[0] = *MEMORY[0x1E4F28568];
    *(void *)v87 = @"semaphore wait timeout";
    unint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v97 count:1];
    id v36 = [v34 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v35];

    if (v36)
    {
      id v23 = v36;
    }
  }

  objc_storeStrong(v22, v23);
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    unint64_t v37 = [RTMotionActivityHistogram alloc];
    uint64_t v38 = *(void *)(*(void *)&buf[8] + 40);
    uint64_t v39 = [v73 startDate];
    __int16 v40 = [v73 endDate];
    id v41 = [(RTMotionActivityHistogram *)v37 initWithActivites:v38 betweenDate:v39 andDate:v40];

    __int16 v42 = [(RTMotionActivityHistogram *)v41 binsSortedByInterval];
    id v43 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
    uint64_t v44 = [v43 predominantMotionActivityType];

    uint64_t v45 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v72];
    uint64_t v46 = [v45 predominantMotionActivityType];

    uint64_t v47 = [(RTMotionActivityHistogram *)v41 binForType:2];
    [v47 interval];
    double v49 = v48;

    [v73 duration];
    double v51 = v50;
    int v52 = [v42 firstObject];
    LOBYTE(v39) = [v52 type] == 4;

    if (v39)
    {
      BOOL v53 = 1;
    }
    else if ((unint64_t)[v42 count] < 3)
    {
      BOOL v53 = 0;
    }
    else
    {
      uint64_t v57 = [v42 objectAtIndexedSubscript:0];
      if ([v57 type] == 1)
      {
        long long v58 = [v42 objectAtIndexedSubscript:1];
        BOOL v53 = [v58 type] == 4;
      }
      else
      {
        BOOL v53 = 0;
      }
    }
    id v60 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v87 = 67110144;
      *(_DWORD *)&v87[4] = v44 == 4;
      *(_WORD *)&v87[8] = 1024;
      *(_DWORD *)&v87[10] = v46 == 4;
      __int16 v88 = 1024;
      BOOL v89 = v49 == 0.0;
      __int16 v90 = 1024;
      BOOL v91 = v51 < 2400.0;
      __int16 v92 = 1024;
      BOOL v93 = v53;
      _os_log_debug_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: previousTransitionIsDriving, %d, subsequentTransitionIsDriving, %d, visitHasNoWalkingActivity, %d, visitDurationIsCandidateForDrivingCheck, %d, visitHasDrivingPredominantActivity, %d", v87, 0x20u);
    }

    if (v51 < 2400.0 && v44 == 4 && v46 == 4 && v53 && v49 == 0.0)
    {
      v61 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      uint64_t v62 = 2;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v87 = 134217984;
        *(void *)&v87[4] = v5;
        uint64_t v62 = 2;
        _os_log_debug_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Reject", v87, 0xCu);
      }
    }
    else
    {
      v61 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v87 = 134217984;
        *(void *)&v87[4] = v5;
        _os_log_debug_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Passthrough", v87, 0xCu);
      }
      uint64_t v62 = 0;
    }

    uint64_t v55 = [NSNumber numberWithInteger:v62];
  }
  else
  {
    uint64_t v56 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v87 = 134217984;
      *(void *)&v87[4] = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v56, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Passthrough", v87, 0xCu);
    }

    uint64_t v55 = [NSNumber numberWithInteger:0];
  }

  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(buf, 8);

LABEL_36:

  return v55;
}

void __102__RTTripSegmentTransitionPreprocessor_applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_semaphore_t v7 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v17 = 138412546;
      uint64_t v18 = (uint64_t)v6;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: Failed to fetch motion activities, error, %@, for visitInterval %@", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = [v5 count];
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = 134218242;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: Fetched %tu motion activities, for visitInterval %@", (uint8_t *)&v17, 0x16u);
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = v5;
    uint64_t v8 = *(NSObject **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
  id v14 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)applyRule_LoiVisitsAreValid_ForVisitAtIndex:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [a3 integerValue];
  if (v4 >= [(NSMutableArray *)self->_tripSegmentTransitions count])
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [(NSMutableArray *)self->_tripSegmentTransitions count];
      int v21 = 134218240;
      unint64_t v22 = v4;
      __int16 v23 = 2048;
      uint64_t v24 = v18 - 1;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: visitIndex, %ld, out of range [0, %tu]. Passthrough", (uint8_t *)&v21, 0x16u);
    }

    uint64_t v16 = [NSNumber numberWithInteger:0];
  }
  else
  {
    id v5 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v4];
    id v6 = [v5 visitIdentifierDestination];

    dispatch_semaphore_t v7 = [(RTTripSegmentTransitionPreprocessor *)self fetchLearnedLocationOfInterestForVisitIdentifier:v6];
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v21 = 138412290;
      unint64_t v22 = (unint64_t)v7;
      _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_LoiVisitsAreValid_ForVisitAtIndex fetched learnedLocationOfInterest: %@", (uint8_t *)&v21, 0xCu);
    }

    if (v7
      && ([v7 place], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, v9)
      && ([v7 place],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 type],
          v10,
          v11))
    {
      uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        __int16 v19 = [v7 place];
        uint64_t v20 = +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", [v19 type]);
        int v21 = 138412290;
        unint64_t v22 = (unint64_t)v20;
        _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_LoiVisitsAreValid_ForVisitAtIndex fetched learnedLocationOfInterest.place.type: %@", (uint8_t *)&v21, 0xCu);
      }
      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v21 = 134217984;
        unint64_t v22 = v4;
        _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_LoiVisitsAreValid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Accept", (uint8_t *)&v21, 0xCu);
      }
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v21 = 134217984;
        unint64_t v22 = v4;
        _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_LoiVisitsAreValid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Passthrough", (uint8_t *)&v21, 0xCu);
      }
      uint64_t v14 = 0;
    }

    uint64_t v16 = [NSNumber numberWithInteger:v14];
  }

  return v16;
}

- (id)applyRule_shortTransitionsAreInvalid_ForTransitionAtIndex:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a3 integerValue];
  if (v5 >= [(NSMutableArray *)self->_tripSegmentTransitions count])
  {
    unint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = [(NSMutableArray *)self->_tripSegmentTransitions count];
      int v33 = 134218240;
      unint64_t v34 = v5;
      __int16 v35 = 2048;
      uint64_t v36 = v23 - 1;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: transitionIndex, %ld, out of range [0, %tu]. Passthrough", (uint8_t *)&v33, 0x16u);
    }
    goto LABEL_10;
  }
  id v6 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  dispatch_semaphore_t v7 = [v6 startDate];
  uint64_t v8 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  uint64_t v9 = [v8 stopDate];
  char v10 = [v7 isBeforeDate:v9];

  if ((v10 & 1) == 0)
  {
    unint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      double v26 = (objc_class *)objc_opt_class();
      double v27 = NSStringFromClass(v26);
      long long v28 = NSStringFromSelector(a2);
      id v29 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
      uint64_t v30 = [v29 startDate];
      __int16 v31 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
      uint64_t v32 = [v31 stopDate];
      int v33 = 138413314;
      unint64_t v34 = (unint64_t)v27;
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v28;
      __int16 v37 = 2048;
      unint64_t v38 = v5;
      __int16 v39 = 2112;
      __int16 v40 = v30;
      __int16 v41 = 2112;
      __int16 v42 = v32;
      _os_log_debug_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEBUG, "%@:%@, malformed transition, tripSegmentVisitStatus[%ld], start/stop dates: %@, %@, Passthrough", (uint8_t *)&v33, 0x34u);
    }
LABEL_10:

    uint64_t v24 = [NSNumber numberWithInteger:0];
    goto LABEL_15;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v12 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  uint64_t v13 = [v12 startDate];
  uint64_t v14 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  uint64_t v15 = [v14 stopDate];
  uint64_t v16 = (void *)[v11 initWithStartDate:v13 endDate:v15];

  [v16 duration];
  double v18 = v17;
  __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v18 >= 120.0)
  {
    if (v20)
    {
      int v33 = 134217984;
      unint64_t v34 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_shortTransitionsAreInvalid_ForTransitionAtIndex, tripSegmentTransitionStatus[%ld], Passthrough", (uint8_t *)&v33, 0xCu);
    }
    uint64_t v21 = 0;
  }
  else if (v20)
  {
    int v33 = 134217984;
    unint64_t v34 = v5;
    uint64_t v21 = 2;
    _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_shortTransitionsAreInvalid_ForTransitionAtIndex, tripSegmentTransitionStatus[%ld], Reject", (uint8_t *)&v33, 0xCu);
  }
  else
  {
    uint64_t v21 = 2;
  }

  uint64_t v24 = [NSNumber numberWithInteger:v21];

LABEL_15:

  return v24;
}

- (id)applyRule_longTransitionsAreInvalid_ForTransitionAtIndex:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a3 integerValue];
  if (v5 >= [(NSMutableArray *)self->_tripSegmentTransitions count])
  {
    unint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = [(NSMutableArray *)self->_tripSegmentTransitions count];
      int v33 = 134218240;
      unint64_t v34 = v5;
      __int16 v35 = 2048;
      uint64_t v36 = v23 - 1;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: transitionIndex, %ld, out of range [0, %tu]. Passthrough", (uint8_t *)&v33, 0x16u);
    }
    goto LABEL_10;
  }
  id v6 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  dispatch_semaphore_t v7 = [v6 startDate];
  uint64_t v8 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  uint64_t v9 = [v8 stopDate];
  char v10 = [v7 isBeforeDate:v9];

  if ((v10 & 1) == 0)
  {
    unint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      double v26 = (objc_class *)objc_opt_class();
      double v27 = NSStringFromClass(v26);
      long long v28 = NSStringFromSelector(a2);
      id v29 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
      uint64_t v30 = [v29 startDate];
      __int16 v31 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
      uint64_t v32 = [v31 stopDate];
      int v33 = 138413314;
      unint64_t v34 = (unint64_t)v27;
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v28;
      __int16 v37 = 2048;
      unint64_t v38 = v5;
      __int16 v39 = 2112;
      __int16 v40 = v30;
      __int16 v41 = 2112;
      __int16 v42 = v32;
      _os_log_debug_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEBUG, "%@:%@, malformed transition, tripSegmentVisitStatus[%ld], start/stop dates: %@, %@, Passthrough", (uint8_t *)&v33, 0x34u);
    }
LABEL_10:

    uint64_t v24 = [NSNumber numberWithInteger:0];
    goto LABEL_15;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v12 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  uint64_t v13 = [v12 startDate];
  uint64_t v14 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
  uint64_t v15 = [v14 stopDate];
  uint64_t v16 = (void *)[v11 initWithStartDate:v13 endDate:v15];

  [v16 duration];
  double v18 = v17;
  __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v18 <= 43200.0)
  {
    if (v20)
    {
      int v33 = 134217984;
      unint64_t v34 = v5;
      _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_longTransitionsAreInvalid_ForTransitionAtIndex, tripSegmentTransitionStatus[%ld], Passthrough", (uint8_t *)&v33, 0xCu);
    }
    uint64_t v21 = 0;
  }
  else if (v20)
  {
    int v33 = 134217984;
    unint64_t v34 = v5;
    uint64_t v21 = 2;
    _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_longTransitionsAreInvalid_ForTransitionAtIndex, tripSegmentTransitionStatus[%ld], Reject", (uint8_t *)&v33, 0xCu);
  }
  else
  {
    uint64_t v21 = 2;
  }

  uint64_t v24 = [NSNumber numberWithInteger:v21];

LABEL_15:

  return v24;
}

- (id)applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex:(id)a3
{
  v138[1] = *MEMORY[0x1E4F143B8];
  id v93 = a3;
  unint64_t v5 = [v93 integerValue];
  if (v5 < [(NSMutableArray *)self->_tripSegmentTransitions count])
  {
    aSelector = a2;
    unint64_t v92 = v5;
    id v6 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v5];
    BOOL v91 = [v6 visitIdentifierOrigin];

    dispatch_semaphore_t v7 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v92];
    __int16 v90 = [v7 visitIdentifierDestination];

    uint64_t v117 = 0;
    v118 = &v117;
    uint64_t v119 = 0x3032000000;
    v120 = __Block_byref_object_copy__120;
    v121 = __Block_byref_object_dispose__120;
    id v122 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v111 = 0;
    v112 = &v111;
    uint64_t v113 = 0x3032000000;
    v114 = __Block_byref_object_copy__120;
    v115 = __Block_byref_object_dispose__120;
    id v116 = 0;
    uint64_t v9 = [(RTTripSegmentTransitionPreprocessor *)self learnedLocationManager];
    char v10 = [v9 learnedLocationStore];
    v107[0] = MEMORY[0x1E4F143A8];
    v107[1] = 3221225472;
    v107[2] = __108__RTTripSegmentTransitionPreprocessor_applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex___block_invoke;
    v107[3] = &unk_1E6B920C8;
    v109 = &v117;
    v110 = &v111;
    id v11 = v8;
    v108 = v11;
    [v10 fetchVisitWithIdentifier:v91 handler:v107];

    uint64_t v12 = (id *)(v112 + 5);
    id v13 = (id)v112[5];
    dsema = v11;
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v15 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v15))
    {
      uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
      [v16 timeIntervalSinceDate:v14];
      double v18 = v17;
      __int16 v19 = objc_opt_new();
      BOOL v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
      uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      unint64_t v22 = [v21 filteredArrayUsingPredicate:v20];
      uint64_t v23 = [v22 firstObject];

      [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
      uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v132 = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      double v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v132 count:1];
      double v27 = [v25 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v26];

      if (v27)
      {
        id v13 = v27;
      }
    }

    objc_storeStrong(v12, v13);
    uint64_t v132 = 0;
    v133 = &v132;
    uint64_t v134 = 0x3032000000;
    v135 = __Block_byref_object_copy__120;
    v136 = __Block_byref_object_dispose__120;
    id v137 = 0;
    dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
    uint64_t v101 = 0;
    v102 = &v101;
    uint64_t v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__120;
    v105 = __Block_byref_object_dispose__120;
    id v106 = 0;
    id v29 = [(RTTripSegmentTransitionPreprocessor *)self learnedLocationManager];
    uint64_t v30 = [v29 learnedLocationStore];
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __108__RTTripSegmentTransitionPreprocessor_applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex___block_invoke_2;
    v97[3] = &unk_1E6B920C8;
    v99 = &v132;
    v100 = &v101;
    __int16 v31 = v28;
    v98 = v31;
    [v30 fetchVisitWithIdentifier:v90 handler:v97];

    uint64_t v32 = (id *)(v102 + 5);
    id v33 = (id)v102[5];
    v94 = v31;
    unint64_t v34 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v35 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v94, v35))
    {
      uint64_t v36 = [MEMORY[0x1E4F1C9C8] now];
      [v36 timeIntervalSinceDate:v34];
      double v38 = v37;
      __int16 v39 = objc_opt_new();
      __int16 v40 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
      __int16 v41 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v42 = [v41 filteredArrayUsingPredicate:v40];
      uint64_t v43 = [v42 firstObject];

      [v39 submitToCoreAnalytics:v43 type:1 duration:v38];
      uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v45 = (void *)MEMORY[0x1E4F28C58];
      v138[0] = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v138 count:1];
      uint64_t v47 = [v45 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v46];

      if (v47)
      {
        id v33 = v47;
      }
    }

    objc_storeStrong(v32, v33);
    if (v118[5] && v133[5])
    {
      double v48 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v92];
      double v49 = [v48 stopDate];
      double v50 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v92 + 1];
      double v51 = [v50 startDate];
      char v52 = [v49 isBeforeDate:v51];

      if (v52)
      {
        id v53 = objc_alloc(MEMORY[0x1E4F28C18]);
        uint64_t v54 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v92];
        uint64_t v55 = [v54 startDate];
        uint64_t v56 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v92];
        uint64_t v57 = [v56 stopDate];
        long long v58 = (void *)[v53 initWithStartDate:v55 endDate:v57];

        [v58 duration];
        if (v59 >= 3600.0)
        {
          distanceCalculator = self->_distanceCalculator;
          id v67 = [(id)v118[5] location];
          __int16 v68 = [(id)v133[5] location];
          id v96 = 0;
          [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v67 toLocation:v68 error:&v96];
          double v70 = v69;
          id v71 = v96;

          if (v71)
          {
            unint64_t v72 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              v87 = [(id)v118[5] location];
              __int16 v88 = [(id)v133[5] location];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v87;
              __int16 v124 = 2112;
              double v125 = *(double *)&v88;
              _os_log_error_impl(&dword_1D9BFA000, v72, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex: failed to compute distance from %@ to %@. Passthrough.", buf, 0x16u);
            }
            uint64_t v73 = [NSNumber numberWithInteger:0];
          }
          else
          {
            [v58 duration];
            double v76 = v70 / v75;
            if (v76 <= 60.0)
            {
              id v77 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                *(void *)&uint8_t buf[4] = v92;
                _os_log_debug_impl(&dword_1D9BFA000, v77, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex, tripSegmentTransitionStatus[%ld]. Passthrough.", buf, 0xCu);
              }
              uint64_t v78 = 0;
            }
            else
            {
              id v77 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              uint64_t v78 = 2;
              if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218496;
                *(void *)&uint8_t buf[4] = v92;
                __int16 v124 = 2048;
                double v125 = v76;
                __int16 v126 = 2048;
                uint64_t v127 = 0x404E000000000000;
                uint64_t v78 = 2;
                _os_log_debug_impl(&dword_1D9BFA000, v77, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_longTransitionsAreInvalid_ForTransitionAtIndex, tripSegmentTransitionStatus[%ld], average speed %f msps above threshold %f mps. Reject.", buf, 0x20u);
              }
            }

            uint64_t v73 = [NSNumber numberWithInteger:v78];
          }
          v61 = (void *)v73;
        }
        else
        {
          id v60 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            [v58 duration];
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v86;
            _os_log_debug_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex: transition duration %f s too short for average speed check. Passthrough.", buf, 0xCu);
          }

          v61 = [NSNumber numberWithInteger:0];
        }

        goto LABEL_27;
      }
      __int16 v64 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        v79 = (objc_class *)objc_opt_class();
        NSStringFromClass(v79);
        id v80 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        id v81 = (id)objc_claimAutoreleasedReturnValue();
        v82 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v92];
        uint64_t v83 = [v82 stopDate];
        v84 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v92 + 1];
        v85 = [v84 startDate];
        *(_DWORD *)buf = 138413314;
        *(void *)&uint8_t buf[4] = v80;
        __int16 v124 = 2112;
        double v125 = *(double *)&v81;
        __int16 v126 = 2048;
        uint64_t v127 = v92;
        __int16 v128 = 2112;
        v129 = v83;
        __int16 v130 = 2112;
        v131 = v85;
        _os_log_debug_impl(&dword_1D9BFA000, v64, OS_LOG_TYPE_DEBUG, "%@:%@, malformed transition, tripSegmentVisitStatus[%ld], start/stop dates: %@, %@, Passthrough", buf, 0x34u);
      }
    }
    else
    {
      __int16 v64 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v91;
        __int16 v124 = 2112;
        double v125 = *(double *)&v90;
        _os_log_error_impl(&dword_1D9BFA000, v64, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex: failed to fetch visit location for identifiers %@ and %@. Passthrough.", buf, 0x16u);
      }
    }

    v61 = [NSNumber numberWithInteger:0];
LABEL_27:

    _Block_object_dispose(&v101, 8);
    _Block_object_dispose(&v132, 8);

    _Block_object_dispose(&v111, 8);
    _Block_object_dispose(&v117, 8);

    goto LABEL_28;
  }
  unint64_t v62 = v5;
  unint64_t v63 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    uint64_t v74 = [(NSMutableArray *)self->_tripSegmentTransitions count];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v62;
    __int16 v124 = 2048;
    *(void *)&double v125 = v74 - 1;
    _os_log_error_impl(&dword_1D9BFA000, v63, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: transitionIndex, %ld, out of range [0, %tu]. Passthrough", buf, 0x16u);
  }

  v61 = [NSNumber numberWithInteger:0];
LABEL_28:

  return v61;
}

void __108__RTTripSegmentTransitionPreprocessor_applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 && !v5)
  {
    uint64_t v7 = [a2 location];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __108__RTTripSegmentTransitionPreprocessor_applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 && !v5)
  {
    uint64_t v7 = [a2 location];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)fetchLearnedLocationOfInterestForVisitIdentifier:(id)a3
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  if (v55)
  {
    *(void *)double v70 = 0;
    id v71 = v70;
    uint64_t v72 = 0x3032000000;
    uint64_t v73 = __Block_byref_object_copy__120;
    uint64_t v74 = __Block_byref_object_dispose__120;
    id v75 = 0;
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x3032000000;
    id v67 = __Block_byref_object_copy__120;
    __int16 v68 = __Block_byref_object_dispose__120;
    id v69 = 0;
    id v53 = self;
    id v5 = [(RTTripSegmentTransitionPreprocessor *)self learnedLocationManager];
    id v6 = [v5 learnedLocationStore];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __88__RTTripSegmentTransitionPreprocessor_fetchLearnedLocationOfInterestForVisitIdentifier___block_invoke;
    v60[3] = &unk_1E6B920C8;
    unint64_t v62 = v70;
    unint64_t v63 = &v64;
    uint64_t v7 = v4;
    v61 = v7;
    [v6 fetchVisitWithIdentifier:v55 handler:v60];

    uint64_t v8 = (id *)(v65 + 5);
    id v9 = (id)v65[5];
    uint64_t v10 = v7;
    id v11 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v12 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v10, v12))
    {
      id v13 = [MEMORY[0x1E4F1C9C8] now];
      [v13 timeIntervalSinceDate:v11];
      double v15 = v14;
      uint64_t v16 = objc_opt_new();
      double v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
      double v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v19 = [v18 filteredArrayUsingPredicate:v17];
      BOOL v20 = [v19 firstObject];

      [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
      uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)&buf, 2u);
      }

      unint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v77 = *MEMORY[0x1E4F28568];
      *(void *)&long long buf = @"semaphore wait timeout";
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v77 count:1];
      uint64_t v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

      if (v24)
      {
        id v9 = v24;
      }
    }

    objc_storeStrong(v8, v9);
    if (*((void *)v71 + 5))
    {
      uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v51 = *((void *)v71 + 5);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v51;
        _os_log_debug_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: fetchLearnedLocationOfInterestForVisitIdentifier fetched learnedLocation: %@", (uint8_t *)&buf, 0xCu);
      }

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v84 = 0x3032000000;
      v85 = __Block_byref_object_copy__120;
      uint64_t v86 = __Block_byref_object_dispose__120;
      id v87 = 0;
      dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
      uint64_t v77 = 0;
      uint64_t v78 = &v77;
      uint64_t v79 = 0x3032000000;
      id v80 = __Block_byref_object_copy__120;
      id v81 = __Block_byref_object_dispose__120;
      id v82 = 0;
      double v27 = [(RTTripSegmentTransitionPreprocessor *)v53 learnedLocationManager];
      dispatch_semaphore_t v28 = [*((id *)v71 + 5) location];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __88__RTTripSegmentTransitionPreprocessor_fetchLearnedLocationOfInterestForVisitIdentifier___block_invoke_96;
      void v56[3] = &unk_1E6B90B28;
      p_long long buf = &buf;
      double v59 = &v77;
      id v29 = v26;
      uint64_t v57 = v29;
      [v27 fetchLocationOfInterestAtLocation:v28 handler:v56];

      uint64_t v30 = (id *)(v78 + 5);
      id v31 = (id)v78[5];
      uint64_t v32 = v29;
      id v33 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v34 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v32, v34))
      {
        uint64_t v54 = [MEMORY[0x1E4F1C9C8] now];
        [v54 timeIntervalSinceDate:v33];
        double v36 = v35;
        double v37 = objc_opt_new();
        double v38 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
        __int16 v39 = [MEMORY[0x1E4F29060] callStackSymbols];
        __int16 v40 = [v39 filteredArrayUsingPredicate:v38];
        __int16 v41 = [v40 firstObject];

        [v37 submitToCoreAnalytics:v41 type:1 duration:v36];
        __int16 v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)double v76 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v76, 2u);
        }

        uint64_t v43 = (void *)MEMORY[0x1E4F28C58];
        v88[0] = *MEMORY[0x1E4F28568];
        *(void *)double v76 = @"semaphore wait timeout";
        uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v88 count:1];
        uint64_t v45 = [v43 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v44];

        if (v45)
        {
          id v31 = v45;
        }
      }

      objc_storeStrong(v30, v31);
      uint64_t v46 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v52 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)double v76 = 138412290;
        *(void *)&void v76[4] = v52;
        _os_log_debug_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: fetchLearnedLocationOfInterestForVisitIdentifier fetched learnedLocationOfInterest: %@", v76, 0xCu);
      }

      id v47 = *(id *)(*((void *)&buf + 1) + 40);
      _Block_object_dispose(&v77, 8);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      double v49 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v55;
        _os_log_error_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:fetchLearnedLocationOfInterestForVisitIdentifier: failed to fetch visit for identifier %@", (uint8_t *)&buf, 0xCu);
      }

      id v47 = 0;
    }

    _Block_object_dispose(&v64, 8);
    _Block_object_dispose(v70, 8);
  }
  else
  {
    double v48 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v70 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:fetchLearnedLocationOfInterestForVisitIdentifier no visit identifier provided, returning.", v70, 2u);
    }

    id v47 = 0;
  }

  return v47;
}

void __88__RTTripSegmentTransitionPreprocessor_fetchLearnedLocationOfInterestForVisitIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 && !v5)
  {
    uint64_t v7 = [a2 location];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __88__RTTripSegmentTransitionPreprocessor_fetchLearnedLocationOfInterestForVisitIdentifier___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  if (v10 && !v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
  id v9 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)fetchLearnedLocationOfInterestWithinDistance:(double)a3 location:(id)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    *(void *)uint64_t v43 = 0;
    uint64_t v44 = v43;
    uint64_t v45 = 0x3032000000;
    uint64_t v46 = __Block_byref_object_copy__120;
    id v47 = __Block_byref_object_dispose__120;
    id v48 = 0;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    uint64_t v37 = 0;
    double v38 = &v37;
    uint64_t v39 = 0x3032000000;
    __int16 v40 = __Block_byref_object_copy__120;
    __int16 v41 = __Block_byref_object_dispose__120;
    id v42 = 0;
    uint64_t v8 = [(RTTripSegmentTransitionPreprocessor *)self learnedLocationManager];
    id v9 = [v8 learnedLocationStore];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __93__RTTripSegmentTransitionPreprocessor_fetchLearnedLocationOfInterestWithinDistance_location___block_invoke;
    v33[3] = &unk_1E6B905F0;
    double v35 = v43;
    double v36 = &v37;
    id v10 = v7;
    dispatch_time_t v34 = v10;
    [v9 fetchLocationsOfInterestWithinDistance:v6 location:v33 handler:a3];

    id v11 = (id *)(v38 + 5);
    id v12 = (id)v38[5];
    id v13 = v10;
    double v14 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v15 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v13, v15))
    {
      uint64_t v32 = [MEMORY[0x1E4F1C9C8] now];
      [v32 timeIntervalSinceDate:v14];
      double v17 = v16;
      double v18 = objc_opt_new();
      __int16 v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
      BOOL v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v21 = [v20 filteredArrayUsingPredicate:v19];
      unint64_t v22 = [v21 firstObject];

      [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
      uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      v50[0] = *MEMORY[0x1E4F28568];
      *(void *)long long buf = @"semaphore wait timeout";
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v50 count:1];
      dispatch_semaphore_t v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

      if (v26)
      {
        id v12 = v26;
      }
    }

    objc_storeStrong(v11, v12);
    double v27 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = *((void *)v44 + 5);
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v31;
      _os_log_debug_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: fetchLearnedLocationOfInterestForVisitIdentifier fetched learnedLocationOfInterest: %@", buf, 0xCu);
    }

    id v28 = *((id *)v44 + 5);
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(v43, 8);
  }
  else
  {
    id v29 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v43 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:fetchLearnedLocationOfInterestWithinDistance no location provided, returning.", v43, 2u);
    }

    id v28 = 0;
  }

  return v28;
}

void __93__RTTripSegmentTransitionPreprocessor_fetchLearnedLocationOfInterestWithinDistance_location___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v5 && *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v6 = [v12 firstObject];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)appendTransitionToCurrentVisit
{
  v161[1] = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit - start.", buf, 2u);
  }

  if ([(NSMutableArray *)self->_tripSegmentTransitions count])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F5CF58]);
    dispatch_semaphore_t v4 = [NSNumber numberWithDouble:*MEMORY[0x1E4F5D010]];
    id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F3451C80];
    oslog = [v3 initWithAscending:0 confidence:v4 dateInterval:0 labelVisit:0 limit:&unk_1F3451C68 sources:v5];

    *(void *)long long buf = 0;
    v136 = buf;
    uint64_t v137 = 0x3032000000;
    v138 = __Block_byref_object_copy__120;
    v139 = __Block_byref_object_dispose__120;
    id v140 = 0;
    uint64_t v129 = 0;
    __int16 v130 = &v129;
    uint64_t v131 = 0x3032000000;
    uint64_t v132 = __Block_byref_object_copy__120;
    v133 = __Block_byref_object_dispose__120;
    id v134 = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    uint64_t v7 = [(RTTripSegmentTransitionPreprocessor *)self visitManager];
    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    v125[2] = __69__RTTripSegmentTransitionPreprocessor_appendTransitionToCurrentVisit__block_invoke;
    v125[3] = &unk_1E6B905F0;
    uint64_t v127 = buf;
    __int16 v128 = &v129;
    uint64_t v8 = v6;
    __int16 v126 = v8;
    [v7 fetchStoredVisitsWithOptions:oslog handler:v125];

    uint64_t v9 = (id *)(v136 + 40);
    id v10 = (id)*((void *)v136 + 5);
    id v11 = v8;
    id v12 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v13 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v11, v13))
    {
      double v14 = [MEMORY[0x1E4F1C9C8] now];
      [v14 timeIntervalSinceDate:v12];
      double v16 = v15;
      double v17 = objc_opt_new();
      double v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
      __int16 v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v20 = [v19 filteredArrayUsingPredicate:v18];
      uint64_t v21 = [v20 firstObject];

      [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
      unint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v156) = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)&v156, 2u);
      }

      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v150 = *MEMORY[0x1E4F28568];
      *(void *)&long long v156 = @"semaphore wait timeout";
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v156 forKeys:&v150 count:1];
      uint64_t v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

      if (v25)
      {
        id v10 = v25;
      }
    }

    objc_storeStrong(v9, v10);
    if (*((void *)v136 + 5))
    {
      dispatch_semaphore_t v26 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = *((void *)v136 + 5);
        LODWORD(v156) = 138412290;
        *(void *)((char *)&v156 + 4) = v27;
        id v28 = "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit, failed to fetch visit: %@, not adding "
              "transition to current location.";
        id v29 = v26;
        uint32_t v30 = 12;
LABEL_19:
        _os_log_debug_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_DEBUG, v28, (uint8_t *)&v156, v30);
        goto LABEL_60;
      }
      goto LABEL_60;
    }
    uint64_t v31 = (void *)v130[5];
    if (!v31 || ![v31 type] || objc_msgSend((id)v130[5], "type") == 3)
    {
      dispatch_semaphore_t v26 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v156) = 0;
        id v28 = "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit not currently in a visit, not adding tr"
              "ansition to current location.";
        id v29 = v26;
        uint32_t v30 = 2;
        goto LABEL_19;
      }
LABEL_60:

      _Block_object_dispose(&v129, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_61;
    }
    uint64_t v32 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v76 = v130[5];
      LODWORD(v156) = 138412290;
      *(void *)((char *)&v156 + 4) = v76;
      _os_log_debug_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit, found current (destination) visit: %@", (uint8_t *)&v156, 0xCu);
    }

    id v33 = [(NSMutableArray *)self->_tripSegmentTransitions lastObject];
    dispatch_semaphore_t v26 = [v33 visitIdentifierDestination];

    *(void *)&long long v156 = 0;
    *((void *)&v156 + 1) = &v156;
    uint64_t v157 = 0x3032000000;
    v158 = __Block_byref_object_copy__120;
    v159 = __Block_byref_object_dispose__120;
    id v160 = 0;
    dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
    uint64_t v150 = 0;
    v151 = &v150;
    uint64_t v152 = 0x3032000000;
    v153 = __Block_byref_object_copy__120;
    v154 = __Block_byref_object_dispose__120;
    id v155 = 0;
    double v35 = [(RTTripSegmentTransitionPreprocessor *)self learnedLocationManager];
    double v36 = [v35 learnedLocationStore];
    v121[0] = MEMORY[0x1E4F143A8];
    v121[1] = 3221225472;
    v121[2] = __69__RTTripSegmentTransitionPreprocessor_appendTransitionToCurrentVisit__block_invoke_104;
    v121[3] = &unk_1E6B920C8;
    v123 = &v156;
    __int16 v124 = &v150;
    uint64_t v37 = v34;
    id v122 = v37;
    [v36 fetchVisitWithIdentifier:v26 handler:v121];

    double v38 = (id *)(v151 + 5);
    id v39 = (id)v151[5];
    dsema = v37;
    __int16 v40 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v41 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v41))
    {
      dispatch_semaphore_t v111 = [MEMORY[0x1E4F1C9C8] now];
      [v111 timeIntervalSinceDate:v40];
      double v43 = v42;
      uint64_t v44 = objc_opt_new();
      uint64_t v45 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
      uint64_t v46 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v47 = [v46 filteredArrayUsingPredicate:v45];
      id v48 = [v47 firstObject];

      [v44 submitToCoreAnalytics:v48 type:1 duration:v43];
      double v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v142 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v142, 2u);
      }

      double v50 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v146 = *MEMORY[0x1E4F28568];
      *(void *)v142 = @"semaphore wait timeout";
      uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v142 forKeys:&v146 count:1];
      uint64_t v52 = [v50 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v51];

      if (v52)
      {
        id v39 = v52;
      }
    }

    objc_storeStrong(v38, v39);
    if (!*(void *)(*((void *)&v156 + 1) + 40))
    {
      id v60 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v142 = 138412290;
        *(void *)&v142[4] = v26;
        _os_log_debug_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit cannot find origin visit with identifier %@, not adding transition to current location", v142, 0xCu);
      }
      goto LABEL_59;
    }
    id v53 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v77 = *(void *)(*((void *)&v156 + 1) + 40);
      *(_DWORD *)v142 = 138412290;
      *(void *)&v142[4] = v77;
      _os_log_debug_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit, found origin visit: %@", v142, 0xCu);
    }

    distanceCalculator = self->_distanceCalculator;
    id v55 = [*(id *)(*((void *)&v156 + 1) + 40) location];
    uint64_t v56 = [v55 location];
    uint64_t v57 = [(id)v130[5] location];
    id v120 = 0;
    [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v56 toLocation:v57 error:&v120];
    double v59 = v58;
    id v60 = v120;

    if (v60)
    {
      v61 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v62 = [*(id *)(*((void *)&v156 + 1) + 40) location];
        unint64_t v63 = [v62 location];
        uint64_t v64 = [(id)v130[5] location];
        *(_DWORD *)v142 = 138412546;
        *(void *)&v142[4] = v63;
        *(_WORD *)&v142[12] = 2112;
        *(void *)&v142[14] = v64;
        _os_log_debug_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit: failed to compute distance from %@ to %@, not adding transition to current location.", v142, 0x16u);
      }
    }
    else
    {
      v65 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v142 = 134217984;
        *(double *)&v142[4] = v59;
        _os_log_debug_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit: computed distanceFromLastVisit %.3f m.", v142, 0xCu);
      }

      uint64_t v66 = [*(id *)(*((void *)&v156 + 1) + 40) exitDate];
      id v67 = [(id)v130[5] entry];
      int v68 = [v66 isOnOrAfter:v67];

      if (v68)
      {
        v61 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          uint64_t v69 = *(void *)(*((void *)&v156 + 1) + 40);
          uint64_t v70 = v130[5];
          *(_DWORD *)v142 = 138412546;
          *(void *)&v142[4] = v69;
          *(_WORD *)&v142[12] = 2112;
          *(void *)&v142[14] = v70;
          _os_log_error_impl(&dword_1D9BFA000, v61, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit: originVisit.exitDate, %@, is on or after, destinationVisit.entry, %@, not adding transition to current location.", v142, 0x16u);
        }
      }
      else
      {
        id v71 = objc_alloc(MEMORY[0x1E4F28C18]);
        uint64_t v72 = [*(id *)(*((void *)&v156 + 1) + 40) exitDate];
        uint64_t v73 = [(id)v130[5] entry];
        v61 = [v71 initWithStartDate:v72 endDate:v73];

        [v61 duration];
        if (v74 >= 120.0)
        {
          if (v59 >= 500.0)
          {
            uint64_t v78 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v142 = 138412546;
              *(void *)&v142[4] = v61;
              *(_WORD *)&v142[12] = 2048;
              *(double *)&v142[14] = v59;
              _os_log_debug_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit: transition interval %@, distance %f m.", v142, 0x16u);
            }

            uint64_t v146 = 0;
            v147 = &v146;
            uint64_t v148 = 0x2020000000;
            uint64_t v149 = 0;
            *(void *)v142 = 0;
            *(void *)&v142[8] = v142;
            *(void *)&v142[16] = 0x3032000000;
            v143 = __Block_byref_object_copy__120;
            v144 = __Block_byref_object_dispose__120;
            id v145 = 0;
            dispatch_semaphore_t v79 = dispatch_semaphore_create(0);
            motionActivityManager = self->_motionActivityManager;
            id v81 = [v61 startDate];
            id v82 = [v61 endDate];
            v116[0] = MEMORY[0x1E4F143A8];
            v116[1] = 3221225472;
            v116[2] = __69__RTTripSegmentTransitionPreprocessor_appendTransitionToCurrentVisit__block_invoke_105;
            v116[3] = &unk_1E6B908E0;
            v118 = &v146;
            uint64_t v119 = v142;
            uint64_t v83 = v79;
            uint64_t v117 = v83;
            [(RTMotionActivityManager *)motionActivityManager fetchPredominantMotionActivityTypeFromStartDate:v81 toEndDate:v82 withHandler:v116];

            v85 = (id *)(*(void *)&v142[8] + 40);
            id v84 = *(id *)(*(void *)&v142[8] + 40);
            v112 = v83;
            v108 = [MEMORY[0x1E4F1C9C8] now];
            dispatch_time_t v86 = dispatch_time(0, 3600000000000);
            if (dispatch_semaphore_wait(v112, v86))
            {
              id v106 = [MEMORY[0x1E4F1C9C8] now];
              [v106 timeIntervalSinceDate:v108];
              double v88 = v87;
              v104 = objc_opt_new();
              BOOL v89 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
              __int16 v90 = [MEMORY[0x1E4F29060] callStackSymbols];
              BOOL v91 = [v90 filteredArrayUsingPredicate:v89];
              unint64_t v92 = [v91 firstObject];

              [v104 submitToCoreAnalytics:v92 type:1 duration:v88];
              id v93 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)v141 = 0;
                _os_log_fault_impl(&dword_1D9BFA000, v93, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v141, 2u);
              }

              v94 = (void *)MEMORY[0x1E4F28C58];
              v161[0] = *MEMORY[0x1E4F28568];
              *(void *)v141 = @"semaphore wait timeout";
              v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v141 forKeys:v161 count:1];
              id v96 = [v94 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v95];

              if (v96)
              {
                id v84 = v96;
              }
            }

            objc_storeStrong(v85, v84);
            v109 = [RTLearnedTransition alloc];
            v97 = +[RTTripSegmentManager uuidForTripSegmentOfType:1];
            v107 = [v61 startDate];
            v105 = [v61 endDate];
            v98 = [(NSMutableArray *)self->_tripSegmentTransitions lastObject];
            v99 = [v98 visitIdentifierDestination];
            v100 = +[RTTripSegmentManager uuidForTripSegmentOfType:1];
            uint64_t v101 = [MEMORY[0x1E4F1C9C8] now];
            v102 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:86400.0];
            v110 = [(RTLearnedTransition *)v109 initWithIdentifier:v97 startDate:v107 stopDate:v105 visitIdentifierOrigin:v99 visitIdentifierDestination:v100 creationDate:v101 expirationDate:v102 predominantMotionActivityType:v147[3]];

            [(NSMutableArray *)self->_tripSegmentTransitions addObject:v110];
            uint64_t v103 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v141 = 138412290;
              *(void *)&v141[4] = v110;
              _os_log_debug_impl(&dword_1D9BFA000, v103, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: adding transition to current visit %@", v141, 0xCu);
            }

            _Block_object_dispose(v142, 8);
            _Block_object_dispose(&v146, 8);
            goto LABEL_58;
          }
          id v75 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v142 = 134218240;
            *(double *)&v142[4] = v59;
            *(_WORD *)&v142[12] = 2048;
            *(void *)&v142[14] = 0x407F400000000000;
            _os_log_debug_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit: transition distance from last visit %f less than threshold %f, not adding transition to current location.", v142, 0x16u);
          }
        }
        else
        {
          id v75 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v142 = 138412546;
            *(void *)&v142[4] = v61;
            *(_WORD *)&v142[12] = 2048;
            *(void *)&v142[14] = 0x405E000000000000;
            _os_log_debug_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit: transition interval %@ less than threshold %f, not adding transition to current location.", v142, 0x16u);
          }
        }
      }
    }
LABEL_58:

LABEL_59:
    _Block_object_dispose(&v150, 8);

    _Block_object_dispose(&v156, 8);
    goto LABEL_60;
  }
  oslog = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1D9BFA000, oslog, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit no previous transitions, not adding transition to current visit.", buf, 2u);
  }
LABEL_61:
}

void __69__RTTripSegmentTransitionPreprocessor_appendTransitionToCurrentVisit__block_invoke(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v10 = obj;
  id v6 = a2;
  uint64_t v7 = [v6 firstObject];

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69__RTTripSegmentTransitionPreprocessor_appendTransitionToCurrentVisit__block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  if (v10 && !v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
  id v9 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69__RTTripSegmentTransitionPreprocessor_appendTransitionToCurrentVisit__block_invoke_105(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: Failed to fetch motion activities, error, %@, using RTMotionActivityTypeUnknown", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      id v12 = a2;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "RTTripSegmentTransitionPreprocessor: Predominant motion activity, %lu", (uint8_t *)&v11, 0xCu);
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)applyElevationAdjustmentToLoiLocations
{
  v2 = [(RTTripSegmentTransitionPreprocessor *)self defaultsManager];
  id v3 = [v2 objectForKey:@"RTDefaultsTripSegmentAdjustElevationForBreadcrumbs"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)fetchEndpointCLLocationForTransition:(id)a3 atOrigin:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v64 = v4;
  v65 = v5;
  if (v4) {
    [v5 visitIdentifierOrigin];
  }
  else {
  int v68 = [v5 visitIdentifierDestination];
  }
  uint64_t v89 = 0;
  __int16 v90 = &v89;
  uint64_t v91 = 0x3032000000;
  unint64_t v92 = __Block_byref_object_copy__120;
  id v93 = __Block_byref_object_dispose__120;
  id v94 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v83 = 0;
  id v84 = &v83;
  uint64_t v85 = 0x3032000000;
  dispatch_time_t v86 = __Block_byref_object_copy__120;
  double v87 = __Block_byref_object_dispose__120;
  id v88 = 0;
  uint64_t v7 = [(RTTripSegmentTransitionPreprocessor *)self learnedLocationManager];
  uint64_t v8 = [v7 learnedLocationStore];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __85__RTTripSegmentTransitionPreprocessor_fetchEndpointCLLocationForTransition_atOrigin___block_invoke;
  v79[3] = &unk_1E6B920C8;
  id v81 = &v89;
  id v82 = &v83;
  id v9 = v6;
  id v80 = v9;
  [v8 fetchVisitWithIdentifier:v68 handler:v79];

  id v10 = (id *)(v84 + 5);
  id v11 = (id)v84[5];
  id v12 = v9;
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v12, v14))
  {
    double v15 = [MEMORY[0x1E4F1C9C8] now];
    [v15 timeIntervalSinceDate:v13];
    double v17 = v16;
    double v18 = objc_opt_new();
    __int16 v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
    BOOL v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v21 = [v20 filteredArrayUsingPredicate:v19];
    unint64_t v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    uint64_t v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    *(void *)id v96 = *MEMORY[0x1E4F28568];
    *(void *)long long buf = @"semaphore wait timeout";
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v96 count:1];
    dispatch_semaphore_t v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

    if (v26)
    {
      id v11 = v26;
    }
  }

  objc_storeStrong(v10, v11);
  if (v90[5])
  {
    uint64_t v27 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v56 = v90[5];
      uint64_t v57 = "destination";
      if (v64) {
        uint64_t v57 = "origin";
      }
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = v56;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v68;
      *(_WORD *)&buf[22] = 2080;
      *(void *)&uint8_t buf[24] = v57;
      _os_log_debug_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: fetchEndpointCLLocationForTransition: fetched visit, %@, for identifier, %@, at %s", buf, 0x20u);
    }

    if (v64) {
      [v65 startDate];
    }
    else {
    id v28 = [v65 stopDate];
    }
    long long v108 = 0u;
    memset(v109, 0, 28);
    long long v107 = 0u;
    memset(v106, 0, sizeof(v106));
    memset(v105, 0, sizeof(v105));
    memset(buf, 0, sizeof(buf));
    id v30 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    uint64_t v31 = [(id)v90[5] location];
    uint64_t v32 = (void *)[v30 initWithRTLocation:v31];
    id v33 = v32;
    if (v32)
    {
      [v32 clientLocation];
    }
    else
    {
      long long v108 = 0u;
      memset(v109, 0, 28);
      long long v107 = 0u;
      memset(v106, 0, sizeof(v106));
      memset(v105, 0, sizeof(v105));
      memset(buf, 0, sizeof(buf));
    }

    *(_OWORD *)((char *)v105 + 12) = xmmword_1DA0FFD80;
    LODWORD(v107) = 13;
    [v28 timeIntervalSinceReferenceDate];
    *(void *)((char *)v106 + 12) = v34;
    uint64_t v73 = 0;
    double v74 = &v73;
    uint64_t v75 = 0x3032000000;
    uint64_t v76 = __Block_byref_object_copy__120;
    uint64_t v77 = __Block_byref_object_dispose__120;
    id v35 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    long long v101 = v107;
    long long v102 = v108;
    v103[0] = v109[0];
    *(_OWORD *)((char *)v103 + 12) = *(_OWORD *)((char *)v109 + 12);
    long long v97 = v105[0];
    long long v98 = v105[1];
    long long v99 = v106[0];
    long long v100 = v106[1];
    *(_OWORD *)id v96 = *(_OWORD *)buf;
    *(_OWORD *)&v96[16] = *(_OWORD *)&buf[16];
    id v78 = (id)[v35 initWithClientLocation:v96];
    if ([(RTTripSegmentTransitionPreprocessor *)self applyElevationAdjustmentToLoiLocations])
    {
      dispatch_semaphore_t v36 = dispatch_semaphore_create(0);
      *(void *)id v96 = 0;
      *(void *)&v96[8] = v96;
      *(void *)&v96[16] = 0x3032000000;
      *(void *)&v96[24] = __Block_byref_object_copy__120;
      *(void *)&long long v97 = __Block_byref_object_dispose__120;
      *((void *)&v97 + 1) = 0;
      uint64_t v37 = [(RTTripSegmentTransitionPreprocessor *)self elevationAdjuster];
      uint64_t v95 = v74[5];
      double v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __85__RTTripSegmentTransitionPreprocessor_fetchEndpointCLLocationForTransition_atOrigin___block_invoke_114;
      v69[3] = &unk_1E6B905F0;
      id v71 = &v73;
      uint64_t v72 = v96;
      id v39 = v36;
      uint64_t v70 = v39;
      [v37 adjustElevationForLocations:v38 handler:v69];

      __int16 v40 = (id *)(*(void *)&v96[8] + 40);
      id obja = *(id *)(*(void *)&v96[8] + 40);
      dispatch_time_t v41 = v39;
      unint64_t v63 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v42 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v41, v42))
      {
        unint64_t v62 = [MEMORY[0x1E4F1C9C8] now];
        [v62 timeIntervalSinceDate:v63];
        double v44 = v43;
        uint64_t v45 = objc_opt_new();
        uint64_t v46 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
        id v47 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v48 = [v47 filteredArrayUsingPredicate:v46];
        double v49 = [v48 firstObject];

        [v45 submitToCoreAnalytics:v49 type:1 duration:v44];
        double v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)dispatch_semaphore_t v111 = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v111, 2u);
        }

        uint64_t v51 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v110 = *MEMORY[0x1E4F28568];
        *(void *)dispatch_semaphore_t v111 = @"semaphore wait timeout";
        uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:&v110 count:1];
        id v53 = [v51 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v52];

        if (v53)
        {
          id obja = v53;
        }
      }

      objc_storeStrong(v40, obja);
      _Block_object_dispose(v96, 8);
    }
    uint64_t v54 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v58 = v74[5];
      [v28 timeIntervalSinceReferenceDate];
      id v60 = "destination";
      *(_DWORD *)id v96 = 138413058;
      *(void *)&v96[4] = v68;
      *(_WORD *)&v96[12] = 2080;
      if (v64) {
        id v60 = "origin";
      }
      *(void *)&v96[14] = v60;
      *(_WORD *)&v96[22] = 2112;
      *(void *)&v96[24] = v58;
      LOWORD(v97) = 2048;
      *(void *)((char *)&v97 + 2) = v59;
      _os_log_debug_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: fetchEndpointCLLocationForTransition: identifier, %@, %s, LOI CLLocation, %@, timestamp, %.6f", v96, 0x2Au);
    }

    id v29 = (id)v74[5];
    _Block_object_dispose(&v73, 8);
  }
  else
  {
    id v28 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v61 = "destination";
      if (v64) {
        v61 = "origin";
      }
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v68;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = v61;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: fetchEndpointCLLocationForTransition: failed to fetch visit for identifier %@ at %s", buf, 0x16u);
    }
    id v29 = 0;
  }

  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v89, 8);

  return v29;
}

void __85__RTTripSegmentTransitionPreprocessor_fetchEndpointCLLocationForTransition_atOrigin___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [a2 location];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __85__RTTripSegmentTransitionPreprocessor_fetchEndpointCLLocationForTransition_atOrigin___block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v5 && [v12 count] == 1)
  {
    uint64_t v6 = [v12 firstObject];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)adjustTransitionEndpoints
{
  uint64_t v204 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  transitionStartStopLocations = self->_transitionStartStopLocations;
  self->_transitionStartStopLocations = v2;

  if ([(NSMutableArray *)self->_tripSegmentTransitions count])
  {
    uint64_t v4 = 0;
    uint64_t v154 = *MEMORY[0x1E4F5CFE8];
    uint64_t v155 = *MEMORY[0x1E4F28568];
    do
    {
      uint64_t v163 = v4;
      id v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:");
      uint64_t v6 = [(RTTripSegmentTransitionPreprocessor *)self fetchEndpointCLLocationForTransition:v5 atOrigin:1];
      uint64_t v7 = [(RTTripSegmentTransitionPreprocessor *)self fetchEndpointCLLocationForTransition:v5 atOrigin:0];
      id v8 = objc_alloc(MEMORY[0x1E4F5CF40]);
      id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v10 = [v5 startDate];
      id v11 = [v5 stopDate];
      id v12 = (void *)[v9 initWithStartDate:v10 endDate:v11];
      v162 = (void *)[v8 initWithDateInterval:v12 horizontalAccuracy:1 batchSize:0 boundingBoxLocation:1.79769313e308];

      uint64_t v182 = 0;
      v183 = &v182;
      uint64_t v184 = 0x3032000000;
      v185 = __Block_byref_object_copy__120;
      v186 = __Block_byref_object_dispose__120;
      id v187 = 0;
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
      dispatch_time_t v14 = [(RTTripSegmentTransitionPreprocessor *)self locationManager];
      v179[0] = MEMORY[0x1E4F143A8];
      v179[1] = 3221225472;
      v179[2] = __64__RTTripSegmentTransitionPreprocessor_adjustTransitionEndpoints__block_invoke;
      v179[3] = &unk_1E6B90700;
      v181 = &v182;
      double v15 = v13;
      v180 = v15;
      [v14 fetchStoredLocationsWithOptions:v162 handler:v179];

      dsema = v15;
      double v16 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v17 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(dsema, v17))
      {
        double v18 = [MEMORY[0x1E4F1C9C8] now];
        [v18 timeIntervalSinceDate:v16];
        double v20 = v19;
        uint64_t v21 = objc_opt_new();
        unint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
        uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v24 = [v23 filteredArrayUsingPredicate:v22];
        uint64_t v25 = [v24 firstObject];

        [v21 submitToCoreAnalytics:v25 type:1 duration:v20];
        dispatch_semaphore_t v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
        *(void *)&long long v188 = v155;
        *(void *)long long buf = @"semaphore wait timeout";
        id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v188 count:1];
        id v29 = [v27 errorWithDomain:v154 code:15 userInfo:v28];

        if (v29)
        {
          id v29 = v29;
        }
      }
      else
      {
        id v29 = 0;
      }

      id v30 = v29;
      id v31 = objc_alloc(MEMORY[0x1E4F5CF40]);
      id v32 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v33 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      uint64_t v34 = [v5 stopDate];
      id v35 = (void *)[v33 initWithTimeInterval:v34 sinceDate:-3600.0];
      dispatch_semaphore_t v36 = [v5 stopDate];
      uint64_t v37 = (void *)[v32 initWithStartDate:v35 endDate:v36];
      v161 = (void *)[v31 initWithDateInterval:v37 horizontalAccuracy:-1 batchSize:0 boundingBoxLocation:1.79769313e308];

      uint64_t v173 = 0;
      v174 = &v173;
      uint64_t v175 = 0x3032000000;
      v176 = __Block_byref_object_copy__120;
      v177 = __Block_byref_object_dispose__120;
      id v178 = 0;

      dispatch_semaphore_t v38 = dispatch_semaphore_create(0);
      id v39 = [(RTTripSegmentTransitionPreprocessor *)self locationManager];
      v170[0] = MEMORY[0x1E4F143A8];
      v170[1] = 3221225472;
      v170[2] = __64__RTTripSegmentTransitionPreprocessor_adjustTransitionEndpoints__block_invoke_2;
      v170[3] = &unk_1E6B90700;
      v172 = &v173;
      __int16 v40 = v38;
      v171 = v40;
      [v39 fetchStoredLocationsWithOptions:v161 handler:v170];

      v165 = v40;
      dispatch_time_t v41 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v42 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v165, v42)) {
        goto LABEL_14;
      }
      double v43 = [MEMORY[0x1E4F1C9C8] now];
      [v43 timeIntervalSinceDate:v41];
      double v45 = v44;
      uint64_t v46 = objc_opt_new();
      id v47 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_92];
      id v48 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v49 = [v48 filteredArrayUsingPredicate:v47];
      double v50 = [v49 firstObject];

      [v46 submitToCoreAnalytics:v50 type:1 duration:v45];
      uint64_t v51 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v52 = (void *)MEMORY[0x1E4F28C58];
      *(void *)&long long v188 = v155;
      *(void *)long long buf = @"semaphore wait timeout";
      id v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v188 count:1];
      uint64_t v54 = [v52 errorWithDomain:v154 code:15 userInfo:v53];

      if (v54)
      {
        id v55 = v54;
      }
      else
      {
LABEL_14:
        id v55 = 0;
      }

      id v160 = v55;
      double v57 = -1.0;
      if (v183[5] && v6)
      {
        distanceCalculator = self->_distanceCalculator;
        id v59 = objc_alloc(MEMORY[0x1E4F5CE00]);
        [v6 coordinate];
        double v61 = v60;
        [v6 coordinate];
        double v63 = v62;
        [v6 horizontalAccuracy];
        double v65 = v64;
        uint64_t v66 = [v6 timestamp];
        id v67 = (void *)[v59 initWithLatitude:v66 longitude:v61 horizontalUncertainty:v63 date:v65];
        id v68 = objc_alloc(MEMORY[0x1E4F5CE00]);
        [(id)v183[5] coordinate];
        double v70 = v69;
        [(id)v183[5] coordinate];
        double v72 = v71;
        [(id)v183[5] horizontalAccuracy];
        double v74 = v73;
        uint64_t v75 = [(id)v183[5] timestamp];
        uint64_t v76 = (void *)[v68 initWithLatitude:v75 longitude:v70 horizontalUncertainty:v72 date:v74];
        id v169 = 0;
        [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v67 toLocation:v76 error:&v169];
        double v78 = v77;
        id v79 = v169;

        if (v78 < 150.0 && !v79)
        {
          id v80 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v148 = v183[5];
            *(_DWORD *)long long buf = 138412802;
            *(void *)&uint8_t buf[4] = v6;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v148;
            *(_WORD *)&buf[22] = 2048;
            *(double *)&uint8_t buf[24] = v78;
            _os_log_debug_impl(&dword_1D9BFA000, v80, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: startLoiLocation %@ and startBreadcrumb %@ are within %f m, not adding start LOI", buf, 0x20u);
          }

          uint64_t v6 = 0;
        }
      }
      else
      {
        double v78 = -1.0;
      }
      if (v174[5] && v7)
      {
        id v81 = self->_distanceCalculator;
        id v82 = objc_alloc(MEMORY[0x1E4F5CE00]);
        [v7 coordinate];
        double v84 = v83;
        [v7 coordinate];
        double v86 = v85;
        [v7 horizontalAccuracy];
        double v88 = v87;
        uint64_t v89 = [v7 timestamp];
        __int16 v90 = (void *)[v82 initWithLatitude:v89 longitude:v84 horizontalUncertainty:v86 date:v88];
        id v91 = objc_alloc(MEMORY[0x1E4F5CE00]);
        [(id)v174[5] coordinate];
        double v93 = v92;
        [(id)v174[5] coordinate];
        double v95 = v94;
        [(id)v174[5] horizontalAccuracy];
        double v97 = v96;
        long long v98 = [(id)v174[5] timestamp];
        long long v99 = (void *)[v91 initWithLatitude:v98 longitude:v93 horizontalUncertainty:v95 date:v97];
        id v168 = 0;
        [(RTDistanceCalculator *)v81 distanceFromLocation:v90 toLocation:v99 error:&v168];
        double v57 = v100;
        id v101 = v168;

        if (v57 < 150.0 && !v101)
        {
          long long v102 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v150 = v174[5];
            *(_DWORD *)long long buf = 138412802;
            *(void *)&uint8_t buf[4] = v7;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v150;
            *(_WORD *)&buf[22] = 2048;
            *(double *)&uint8_t buf[24] = v57;
            _os_log_debug_impl(&dword_1D9BFA000, v102, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: stopLoiLocation %@ and stopBreadcrumb %@ are within %f m, not adding start LOI", buf, 0x20u);
          }

          uint64_t v7 = 0;
        }
      }
      uint64_t v103 = (void *)v183[5];
      if (v103 && v6 && v78 > 0.0)
      {
        v104 = [v103 timestamp];
        v105 = [v6 timestamp];
        [v104 timeIntervalSinceDate:v105];
        double v107 = v106;

        if (v107 <= 0.0)
        {
          uint64_t v112 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v149 = v183[5];
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v6;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v149;
            _os_log_debug_impl(&dword_1D9BFA000, v112, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: startLoiLocation %@ is at or after time of startBreadcrumb %@, not adding start LOI", buf, 0x16u);
          }
          v164 = 0;
          goto LABEL_52;
        }
        double v56 = v78 / v107;
        if (v78 / v107 > 25.0)
        {
          id v108 = objc_alloc(MEMORY[0x1E4F1C9C8]);
          v109 = [(id)v183[5] timestamp];
          uint64_t v110 = (void *)[v108 initWithTimeInterval:v109 sinceDate:v78 / -25.0];

          if (v163)
          {
            dispatch_semaphore_t v111 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v163 - 1];
            uint64_t v112 = [v111 stopDate];
          }
          else
          {
            uint64_t v112 = [MEMORY[0x1E4F1C9C8] distantPast];
          }
          if ([v110 isOnOrBefore:v112])
          {
            uint64_t v113 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412546;
              *(void *)&uint8_t buf[4] = v110;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v6;
              _os_log_debug_impl(&dword_1D9BFA000, v113, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: cannot find plausible start date (candidate %@) for startLoiLocation %@ that satisfies reasonable speed, not adding LOI", buf, 0x16u);
            }

            v164 = 0;
          }
          else
          {
            v114 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v152 = [v6 timestamp];
              *(_DWORD *)long long buf = 138412546;
              *(void *)&uint8_t buf[4] = v152;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v110;
              _os_log_debug_impl(&dword_1D9BFA000, v114, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: adjusting startLoiLocation time from %@  to %@", buf, 0x16u);
            }
            long long v202 = 0u;
            memset(v203, 0, 28);
            long long v201 = 0u;
            long long v199 = 0u;
            memset(v200, 0, sizeof(v200));
            long long v198 = 0u;
            memset(buf, 0, sizeof(buf));
            [v6 clientLocation];
            [v110 timeIntervalSinceReferenceDate];
            *(void *)((char *)v200 + 12) = v115;
            id v116 = objc_alloc(MEMORY[0x1E4F1E5F0]);
            long long v194 = v201;
            long long v195 = v202;
            v196[0] = v203[0];
            *(_OWORD *)((char *)v196 + 12) = *(_OWORD *)((char *)v203 + 12);
            long long v190 = v198;
            long long v191 = v199;
            long long v192 = v200[0];
            long long v193 = v200[1];
            long long v188 = *(_OWORD *)buf;
            long long v189 = *(_OWORD *)&buf[16];
            v164 = (void *)[v116 initWithClientLocation:&v188];
          }
          uint64_t v6 = v110;
LABEL_52:

          goto LABEL_53;
        }
      }
      v164 = v6;
LABEL_53:
      if (!v174[5] || !v7 || v57 <= 0.0)
      {
LABEL_60:
        double v125 = v7;
        goto LABEL_74;
      }
      uint64_t v117 = [v7 timestamp:v56];
      v118 = [(id)v174[5] timestamp];
      [v117 timeIntervalSinceDate:v118];
      double v120 = v119;

      if (v120 <= 0.0)
      {
        __int16 v124 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v151 = v174[5];
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v151;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v7;
          _os_log_debug_impl(&dword_1D9BFA000, v124, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: stopBreadcrumb %@ is at or after time of stopLoiLocation %@, not adding start LOI", buf, 0x16u);
        }
        double v125 = 0;
      }
      else
      {
        if (v57 / v120 <= 25.0) {
          goto LABEL_60;
        }
        id v121 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        id v122 = [(id)v174[5] timestamp];
        v123 = (void *)[v121 initWithTimeInterval:v122 sinceDate:v57 / 25.0];

        if (v163 == [(NSMutableArray *)self->_tripSegmentTransitions count] - 1)
        {
          __int16 v124 = [MEMORY[0x1E4F1C9C8] now];
        }
        else
        {
          __int16 v126 = [(NSMutableArray *)self->_tripSegmentTransitions objectAtIndexedSubscript:v163 + 1];
          __int16 v124 = [v126 startDate];
        }
        if ([v123 isOnOrAfter:v124])
        {
          uint64_t v127 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v123;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v7;
            _os_log_debug_impl(&dword_1D9BFA000, v127, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: cannot find plausible stop date (candidate %@) for startLoiLocation %@ that satisfies reasonable speed, not adding LOI", buf, 0x16u);
          }

          double v125 = 0;
        }
        else
        {
          __int16 v128 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
          {
            v153 = [v7 timestamp];
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v153;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v123;
            _os_log_debug_impl(&dword_1D9BFA000, v128, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: adjusting stopLoiLocation time from %@  to %@", buf, 0x16u);
          }
          long long v202 = 0u;
          memset(v203, 0, 28);
          long long v201 = 0u;
          long long v199 = 0u;
          memset(v200, 0, sizeof(v200));
          long long v198 = 0u;
          memset(buf, 0, sizeof(buf));
          [v7 clientLocation];
          [v123 timeIntervalSinceReferenceDate];
          *(void *)((char *)v200 + 12) = v129;
          id v130 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          long long v194 = v201;
          long long v195 = v202;
          v196[0] = v203[0];
          *(_OWORD *)((char *)v196 + 12) = *(_OWORD *)((char *)v203 + 12);
          long long v190 = v198;
          long long v191 = v199;
          long long v192 = v200[0];
          long long v193 = v200[1];
          long long v188 = *(_OWORD *)buf;
          long long v189 = *(_OWORD *)&buf[16];
          double v125 = (void *)[v130 initWithClientLocation:&v188];
        }
        uint64_t v7 = v123;
      }

LABEL_74:
      uint64_t v131 = [RTLearnedTransition alloc];
      uint64_t v132 = [v5 identifier];
      if (v164)
      {
        uint64_t v133 = [v164 timestamp];
        v158 = (void *)v133;
        if (!v125) {
          goto LABEL_78;
        }
      }
      else
      {
        uint64_t v133 = [v5 startDate];
        long long v156 = (void *)v133;
        if (!v125)
        {
LABEL_78:
          uint64_t v134 = [v5 stopDate];
          uint64_t v157 = (void *)v134;
          goto LABEL_79;
        }
      }
      uint64_t v134 = [v125 timestamp];
      v159 = (void *)v134;
LABEL_79:
      v135 = [v5 visitIdentifierOrigin];
      v136 = [v5 visitIdentifierDestination];
      uint64_t v137 = [v5 creationDate];
      v138 = [v5 expirationDate];
      v139 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v131, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v132, v133, v134, v135, v136, v137, v138, [v5 predominantMotionActivityType]);

      id v140 = v159;
      if (!v125) {
        id v140 = v157;
      }

      v141 = v158;
      if (!v164) {
        v141 = v156;
      }

      v142 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134218242;
        *(void *)&uint8_t buf[4] = v163;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v139;
        _os_log_debug_impl(&dword_1D9BFA000, v142, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: updated _tripSegmentTransitions[%tu] to, %@", buf, 0x16u);
      }

      [(NSMutableArray *)self->_tripSegmentTransitions setObject:v139 atIndexedSubscript:v163];
      v143 = [[TransitionStartStopLocations alloc] initWithStartLocation:v164 stopLocation:v125];
      v144 = self->_transitionStartStopLocations;
      id v145 = [v5 identifier];
      uint64_t v146 = [v145 UUIDString];
      [(NSMutableDictionary *)v144 setValue:v143 forKey:v146];

      _Block_object_dispose(&v173, 8);
      _Block_object_dispose(&v182, 8);

      unint64_t v147 = [(NSMutableArray *)self->_tripSegmentTransitions count];
      uint64_t v4 = v163 + 1;
    }
    while (v163 + 1 < v147);
  }
}

void __64__RTTripSegmentTransitionPreprocessor_adjustTransitionEndpoints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (!a3 && [v8 count])
  {
    uint64_t v5 = [v8 firstObject];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__RTTripSegmentTransitionPreprocessor_adjustTransitionEndpoints__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (!a3 && [v8 count])
  {
    uint64_t v5 = [v8 lastObject];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSMutableDictionary)transitionStartStopLocations
{
  return self->_transitionStartStopLocations;
}

- (NSMutableArray)tripSegmentTransitions
{
  return self->_tripSegmentTransitions;
}

- (void)setTripSegmentTransitions:(id)a3
{
}

- (NSMutableArray)tripSegmentVisitStatus
{
  return self->_tripSegmentVisitStatus;
}

- (void)setTripSegmentVisitStatus:(id)a3
{
}

- (NSMutableArray)tripSegmentTransitionStatus
{
  return self->_tripSegmentTransitionStatus;
}

- (void)setTripSegmentTransitionStatus:(id)a3
{
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (RTVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (RTElevationAdjuster)elevationAdjuster
{
  return self->_elevationAdjuster;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_elevationAdjuster, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_tripSegmentTransitionStatus, 0);
  objc_storeStrong((id *)&self->_tripSegmentVisitStatus, 0);
  objc_storeStrong((id *)&self->_tripSegmentTransitions, 0);

  objc_storeStrong((id *)&self->_transitionStartStopLocations, 0);
}

@end