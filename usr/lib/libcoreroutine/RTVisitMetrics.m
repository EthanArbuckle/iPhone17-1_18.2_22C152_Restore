@interface RTVisitMetrics
- (BOOL)collectBatchedMetricsForDateInterval:(id)a3 error:(id *)a4;
- (BOOL)collectMetricsForDateInterval:(id)a3 configurations:(id)a4 error:(id *)a5;
- (BOOL)collectRealtimeMetricsForDateInterval:(id)a3 error:(id *)a4;
- (RTVisitMetrics)init;
- (RTVisitMetrics)initWithDistanceCalculator:(id)a3 learnedLocationStore:(id)a4 locationStore:(id)a5 motionActivityManager:(id)a6 visitManager:(id)a7;
- (id)_associatedLoiFromVisit:(id)a3;
- (id)_closestLoi:(id)a3 location:(id)a4;
- (id)_nearbyLoisFromVisit:(id)a3;
- (id)batchedMetricsForConfiguration:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5;
- (id)locationStoreMetricsForInterval:(id)a3;
- (id)metricForPipelineConfiguration:(unint64_t)a3 previousVisit:(id)a4 visit:(id)a5;
- (id)metricsForConfiguration:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5;
- (id)motionMetricsForDateInterval:(id)a3;
- (id)predominantMotionMetricsForTransitionForVisit:(id)a3 previousVisit:(id)a4;
- (id)predominantMotionMetricsForVisit:(id)a3 isPreviousVisit:(BOOL)a4;
- (id)realtimeMetricsForConfiguration:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5;
@end

@implementation RTVisitMetrics

- (RTVisitMetrics)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_learnedLocationStore_locationStore_motionActivityManager_visitManager_);
}

- (RTVisitMetrics)initWithDistanceCalculator:(id)a3 learnedLocationStore:(id)a4 locationStore:(id)a5 motionActivityManager:(id)a6 visitManager:(id)a7
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
    v23 = "Invalid parameter not satisfying: distanceCalculator";
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
    v23 = "Invalid parameter not satisfying: learnedLocationStore";
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
    v23 = "Invalid parameter not satisfying: locationStore";
    goto LABEL_17;
  }
  if (!v16)
  {
    v21 = v17;
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "Invalid parameter not satisfying: motionActivityManager";
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
    v27.super_class = (Class)RTVisitMetrics;
    v18 = [(RTVisitMetrics *)&v27 init];
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_distanceCalculator, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
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
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitManager", buf, 2u);
    }

    v20 = 0;
  }
  v21 = v26;
LABEL_19:

  return v20;
}

- (id)metricForPipelineConfiguration:(unint64_t)a3 previousVisit:(id)a4 visit:(id)a5
{
  uint64_t v212 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [v9 entry];

  if (v10)
  {
    v11 = objc_opt_new();
    v12 = [v9 exit];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v9 date];
    }
    id v16 = [v9 entry];
    int v17 = [v14 isBeforeDate:v16];

    if (v17)
    {
      v18 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v211 = v9;
        _os_log_fault_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_FAULT, "end date is before entry date for visit, %@", buf, 0xCu);
      }

      id v15 = 0;
      goto LABEL_105;
    }
    v209 = v8;
    id v19 = objc_alloc(MEMORY[0x1E4F28C18]);
    v20 = [v9 entry];
    uint64_t v21 = [v19 initWithStartDate:v20 endDate:v14];

    v207 = (void *)v21;
    v22 = [(RTVisitMetrics *)self locationStoreMetricsForInterval:v21];
    v23 = [NSNumber numberWithUnsignedInteger:[v22 signalEnvironment]];
    [v11 setObject:v23 forKeyedSubscript:@"signal_environment_type"];

    v24 = [NSNumber numberWithUnsignedInteger:[v22 firstFixType]];
    [v11 setObject:v24 forKeyedSubscript:@"entry_fix_type"];

    v25 = NSNumber;
    [v22 firstFixHorizontalUncertainty];
    id v26 = [v25 numberWithDouble:];
    [v11 setObject:v26 forKeyedSubscript:@"entry_fix_horizontal_uncertainty"];

    id v27 = objc_alloc(MEMORY[0x1E4F28C18]);
    v28 = [v14 dateByAddingTimeInterval:60.0];
    uint64_t v29 = [v27 initWithStartDate:v14 endDate:v28];

    v205 = (void *)v29;
    v30 = [(RTVisitMetrics *)self locationStoreMetricsForInterval:v29];
    v31 = [NSNumber numberWithUnsignedInteger:[v30 firstFixType]];
    [v11 setObject:v31 forKeyedSubscript:@"exit_fix_type"];

    v32 = NSNumber;
    v204 = v30;
    [v30 firstFixHorizontalUncertainty];
    v33 = [v32 numberWithDouble:x0];
    [v11 setObject:v33 forKeyedSubscript:@"exit_fix_horizontal_uncertainty"];

    v34 = [(RTVisitMetrics *)self predominantMotionMetricsForVisit:v9 isPreviousVisit:0];
    [v11 addEntriesFromDictionary:v34];

    v35 = [NSNumber numberWithUnsignedInteger:a3];
    [v11 setObject:v35 forKeyedSubscript:@"pipelineConfiguration"];

    v36 = [NSNumber numberWithInteger:[v9 type]];
    [v11 setObject:v36 forKeyedSubscript:@"type"];

    v37 = NSNumber;
    v38 = [v9 location];
    [v38 horizontalUncertainty];
    v39 = [v37 numberWithDouble:x0];
    [v11 setObject:v39 forKeyedSubscript:@"uncertainty"];

    v40 = [NSNumber numberWithUnsignedInteger:[v22 count]];
    [v11 setObject:v40 forKeyedSubscript:@"dataPointCount"];

    v41 = NSNumber;
    [v22 maxIntervalBetweenLocations];
    v42 = [v41 numberWithDouble:x0];
    [v11 setObject:v42 forKeyedSubscript:@"maxIntervalBetweenLocations"];

    v43 = NSNumber;
    [v22 spread];
    v44 = [v43 numberWithDouble:x0];
    [v11 setObject:v44 forKeyedSubscript:@"2dSpread"];

    v45 = NSNumber;
    [v9 confidence];
    v46 = [v45 numberWithDouble:];
    [v11 setObject:v46 forKeyedSubscript:@"confidence"];

    v47 = [v9 entry];
    id v206 = v14;
    if (v47)
    {
      v48 = [v9 exit];
      if (v48)
      {
        v49 = [v9 exit];
        v50 = [v9 entry];
        [v49 timeIntervalSinceDate:v50];
        double v52 = v51;
      }
      else
      {
        double v52 = 1.79769313e308;
      }
    }
    else
    {
      double v52 = 1.79769313e308;
    }

    v53 = [NSNumber numberWithDouble:v52];
    [v11 setObject:v53 forKeyedSubscript:@"dwellInterval"];

    v54 = NSNumber;
    v55 = [v9 date];
    v56 = [v9 exit];
    v57 = v56;
    if (!v56)
    {
      v57 = [v9 entry];
    }
    [v55 timeIntervalSinceDate:v57];
    v58 = [v54 numberWithDouble:x0];
    [v11 setObject:v58 forKeyedSubscript:@"detectionLatency"];

    if (!v56) {
    v59 = [(RTVisitMetrics *)self motionMetricsForDateInterval:v207];
    }
    [v11 addEntriesFromDictionary:v59];

    v60 = [(RTVisitMetrics *)self _nearbyLoisFromVisit:v9];
    v61 = [NSNumber numberWithUnsignedInteger:[v60 count]];
    [v11 setObject:v61 forKeyedSubscript:@"nearbyLoiCount"];

    v203 = v60;
    if ([v60 count])
    {
      v62 = [v9 location];
      v63 = [(RTVisitMetrics *)self _closestLoi:v60 location:v62];

      v64 = NSNumber;
      distanceCalculator = self->_distanceCalculator;
      v66 = [v9 location];
      v67 = [v63 location];
      v68 = [v67 location];
      [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v66 toLocation:v68 error:0];
      v69 = [v64 numberWithDouble:];
      [v11 setObject:v69 forKeyedSubscript:@"distanceFromClosestLoi"];

      v70 = NSNumber;
      v71 = [v63 visits];
      v72 = [v70 numberWithUnsignedInteger:[v71 count]];
      [v11 setObject:v72 forKeyedSubscript:@"visitCountOfClosestLoi"];

      v73 = NSNumber;
      v74 = [v63 place];
      v75 = [v73 numberWithUnsignedInteger:[v74 type]];
      [v11 setObject:v75 forKeyedSubscript:@"closestLoiType"];
    }
    else
    {
      v63 = 0;
    }
    v76 = [(RTVisitMetrics *)self _associatedLoiFromVisit:v9];
    v77 = v209;
    v202 = v63;
    v208 = v76;
    if (v76)
    {
      v78 = self->_distanceCalculator;
      v79 = [v9 location];
      v80 = [v76 location];
      v81 = [v80 location];
      [(RTDistanceCalculator *)v78 distanceFromLocation:v79 toLocation:v81 error:0];
      double v83 = v82;

      v84 = [NSNumber numberWithDouble:v83];
      [v11 setObject:v84 forKeyedSubscript:@"distanceFromAssociatedLoi"];

      v85 = NSNumber;
      v86 = [v76 visits];
      v87 = [v85 numberWithUnsignedInteger:[v86 count]];
      [v11 setObject:v87 forKeyedSubscript:@"visitCountOfAssociatedLoi"];

      v88 = NSNumber;
      v89 = [v76 place];
      v90 = [v88 numberWithUnsignedInteger:[v89 type]];
      [v11 setObject:v90 forKeyedSubscript:@"associatedLoiType"];

      v91 = NSNumber;
      v92 = [v76 location];
      v93 = [v92 location];
      [v93 horizontalUncertainty];
      v94 = [v91 numberWithDouble:x0];
      [v11 setObject:v94 forKeyedSubscript:@"horizontalUncertaintyOfAssociatedLoi"];

      v95 = [v76 location];
      v96 = [v95 location];
      [v96 horizontalUncertainty];
      double v98 = v97;

      if (v98 != 0.0)
      {
        v99 = NSNumber;
        v100 = [v76 location];
        v101 = [v100 location];
        [v101 horizontalUncertainty];
        v103 = [v99 numberWithDouble:v83 / v102];
        [v11 setObject:v103 forKeyedSubscript:@"ratioBetweenDistanceAndHorizontalUncertainty"];
      }
      v77 = v209;
      if (v63)
      {
        v104 = NSNumber;
        v105 = self->_distanceCalculator;
        v106 = [v63 location];
        v107 = [v106 location];
        v108 = [v76 location];
        v109 = [v108 location];
        [(RTDistanceCalculator *)v105 distanceFromLocation:v107 toLocation:v109 error:0];
        v110 = [v104 numberWithDouble:x0];
        [v11 setObject:v110 forKeyedSubscript:@"distanceBetweenAssociatedLoiAndClosestLoi"];

        v76 = v208;
        v77 = v209;
      }
    }
    uint64_t v111 = MEMORY[0x1E4F1CC38];
    uint64_t v112 = MEMORY[0x1E4F1CC28];
    if (v77)
    {
      v113 = [NSNumber numberWithInteger:[v77 type]];
      [v11 setObject:v113 forKeyedSubscript:@"previousVisitType"];

      v114 = NSNumber;
      v115 = self->_distanceCalculator;
      v116 = [v9 location];
      v117 = [v77 location];
      [(RTDistanceCalculator *)v115 distanceFromLocation:v116 toLocation:v117 error:0];
      v118 = [v114 numberWithDouble:x0];
      [v11 setObject:v118 forKeyedSubscript:@"distanceFromPreviousVisit"];

      v119 = NSNumber;
      v120 = [v9 entry];
      v121 = v120;
      if (!v120)
      {
        v121 = [v9 exit];
      }
      v122 = [v77 exit];
      v123 = v122;
      if (!v122)
      {
        v123 = [v209 entry];
      }
      [v121 timeIntervalSinceDate:v123];
      v124 = [v119 numberWithDouble:x0];
      [v11 setObject:v124 forKeyedSubscript:@"timeIntervalSincePreviousVisit"];

      if (!v122) {
      if (!v120)
      }

      v125 = [(RTVisitMetrics *)self _associatedLoiFromVisit:v209];
      v126 = NSNumber;
      v200 = v125;
      v127 = [v125 place];
      v128 = [v126 numberWithUnsignedInteger:[v127 type]];
      [v11 setObject:v128 forKeyedSubscript:@"previousVisit_associated_loi_type"];

      v129 = [v9 exit];
      v130 = v129;
      if (v129)
      {
        id v131 = v129;
      }
      else
      {
        id v131 = [v9 entry];
      }
      v132 = [v209 exit];
      v133 = v132;
      if (v132)
      {
        id v134 = v132;
      }
      else
      {
        id v134 = [v209 entry];
      }
      v198 = v134;
      v199 = v131;
      [v131 timeIntervalSinceDate:v134];
      double v136 = v135;
      v137 = [v9 placeInference];
      v138 = [v137 loiIdentifier];
      v139 = [v209 placeInference];
      v77 = [v139 loiIdentifier];
      int v140 = [v138 isEqual:v77];

      [v11 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"is_reentry"];
      v76 = v208;
      if (v208)
      {
        if (v200)
        {
          if (v140)
          {
            [v9 confidence];
            double v141 = *MEMORY[0x1E4F5D010];
            if (v142 == *MEMORY[0x1E4F5D010] && [v9 type] == 1)
            {
              [v209 confidence];
              if (v143 == v141 && [v209 type] == 3 && v136 < 240.0) {
                [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"is_reentry"];
              }
            }
          }
        }
      }
      v144 = [v209 exit];

      if (v144)
      {
        id v145 = objc_alloc(MEMORY[0x1E4F28C18]);
        v146 = [v209 entry];
        v147 = [v209 exit];
        v197 = (void *)[v145 initWithStartDate:v146 endDate:v147];

        v148 = [(RTVisitMetrics *)self locationStoreMetricsForInterval:v197];
        v149 = [NSNumber numberWithUnsignedInteger:[v148 firstFixType]];
        [v11 setObject:v149 forKeyedSubscript:@"previousVisit_entry_fix_type"];

        v150 = NSNumber;
        [v148 firstFixHorizontalUncertainty];
        v151 = [v150 numberWithDouble:x0];
        [v11 setObject:v151 forKeyedSubscript:@"previousVisit_entry_fix_horizontal_uncertainty"];

        id v152 = objc_alloc(MEMORY[0x1E4F28C18]);
        v153 = [v209 exit];
        v154 = [v209 exit];
        v155 = [v154 dateByAddingTimeInterval:60.0];
        v77 = (void *)[v152 initWithStartDate:v153 endDate:v155];

        v156 = [(RTVisitMetrics *)self locationStoreMetricsForInterval:v77];
        v157 = [NSNumber numberWithUnsignedInteger:[v156 firstFixType]];
        [v11 setObject:v157 forKeyedSubscript:@"previousVisit_exit_fix_type"];

        v158 = NSNumber;
        [v156 firstFixHorizontalUncertainty];
        v159 = [v158 numberWithDouble:];
        [v11 setObject:v159 forKeyedSubscript:@"previousVisit_exit_fix_horizontal_uncertainty"];

        v160 = [NSNumber numberWithUnsignedInteger:[v148 signalEnvironment]];
        [v11 setObject:v160 forKeyedSubscript:@"previousVisit_signal_environment_type"];

        v161 = [(RTVisitMetrics *)self predominantMotionMetricsForVisit:v209 isPreviousVisit:1];
        [v11 addEntriesFromDictionary:v161];

        v76 = v208;
        v162 = [(RTVisitMetrics *)self predominantMotionMetricsForTransitionForVisit:v9 previousVisit:v209];
        [v11 addEntriesFromDictionary:v162];
      }
      uint64_t v111 = MEMORY[0x1E4F1CC38];
      uint64_t v112 = MEMORY[0x1E4F1CC28];
    }
    v163 = [v9 placeInference];
    if (v163) {
      uint64_t v164 = v111;
    }
    else {
      uint64_t v164 = v112;
    }
    [v11 setObject:v164 forKeyedSubscript:@"hasPlaceInference"];

    v165 = (void *)MEMORY[0x1E4F28F60];
    v166 = [v9 entry];
    uint64_t v167 = [v165 predicateWithFormat:@"%K < %@", @"entryDate", v166];

    v168 = [v76 visits];
    v201 = (void *)v167;
    v169 = [v168 filteredArrayUsingPredicate:v167];
    if ([v169 count]) {
      uint64_t v170 = v111;
    }
    else {
      uint64_t v170 = v112;
    }
    [v11 setObject:v170 forKeyedSubscript:@"previouslyVisited"];

    v171 = NSNumber;
    v172 = [v9 placeInference];
    [v172 confidence];
    v173 = [v171 numberWithDouble:];
    [v11 setObject:v173 forKeyedSubscript:@"place_confidence"];

    v174 = [v9 placeInference];
    v175 = [v174 mapItem];

    v176 = [NSNumber numberWithBool:[v175 validMUID]];
    [v11 setObject:v176 forKeyedSubscript:@"place_hasMuid"];

    v177 = NSNumber;
    v178 = [v175 address];
    v179 = [v178 thoroughfare];
    if (v179)
    {
      BOOL v180 = 1;
    }
    else
    {
      v77 = [v175 address];
      v172 = [v77 mergedThoroughfare];
      BOOL v180 = v172 != 0;
    }
    v181 = [v177 numberWithInt:v180];
    [v11 setObject:v181 forKeyedSubscript:@"place_hasStreetAddress"];

    if (!v179)
    {
    }
    v182 = NSNumber;
    v183 = [v175 address];
    v184 = [v183 iso3166SubdivisionCode];
    v185 = [v182 numberWithInt:v184 != 0];
    [v11 setObject:v185 forKeyedSubscript:@"place_hasSubdivision"];

    v186 = NSNumber;
    v187 = [v175 address];
    v188 = [v187 iso3166CountryCode];
    v189 = [v186 numberWithInt:v188 != 0];
    [v11 setObject:v189 forKeyedSubscript:@"place_hasTerritory"];

    uint64_t v190 = MEMORY[0x1E4F1CC28];
    [v11 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"place_source_BluePOI"];
    [v11 setObject:v190 forKeyedSubscript:@"place_source_Contacts"];
    [v11 setObject:v190 forKeyedSubscript:@"place_source_EventKit"];
    [v11 setObject:v190 forKeyedSubscript:@"place_source_ForwardGeocode"];
    [v11 setObject:v190 forKeyedSubscript:@"place_source_LearnedPlace"];
    [v11 setObject:v190 forKeyedSubscript:@"place_source_LocalSearch"];
    [v11 setObject:v190 forKeyedSubscript:@"place_source_MapItemHandle"];
    [v11 setObject:v190 forKeyedSubscript:@"place_source_MapItemURL"];
    [v11 setObject:v190 forKeyedSubscript:@"place_source_MapsSupportFavorite"];
    [v11 setObject:v190 forKeyedSubscript:@"place_source_MapsSupportHistoryEntryPlaceDisplay"];
    [v11 setObject:v190 forKeyedSubscript:@"place_source_MapsSupportHistoryEntryRoute"];
    [v11 setObject:v190 forKeyedSubscript:@"place_source_Portrait"];
    [v11 setObject:v190 forKeyedSubscript:@"place_source_ProactiveExperts"];
    [v11 setObject:v190 forKeyedSubscript:@"place_source_ReverseGeocode"];
    v191 = @"place_source_Unknown";
    [v11 setObject:v190 forKeyedSubscript:@"place_source_Unknown"];
    [v11 setObject:v190 forKeyedSubscript:@"place_source_User"];
    id v8 = v209;
    if ([v175 source])
    {
      v192 = v207;
      if (([v175 source] & 1) != 0 || (objc_msgSend(v175, "source") & 0x40000) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_ReverseGeocode"];
      }
      if (([v175 source] & 2) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_ForwardGeocode"];
      }
      if (([v175 source] & 4) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_Contacts"];
      }
      if (([v175 source] & 8) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_User"];
      }
      if (([v175 source] & 0x10) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_MapsSupportFavorite"];
      }
      if (([v175 source] & 0x40) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_MapsSupportHistoryEntryRoute"];
      }
      if (([v175 source] & 0x80) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_MapsSupportHistoryEntryPlaceDisplay"];
      }
      if (([v175 source] & 0x100) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_EventKit"];
      }
      if (([v175 source] & 0x200) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_LocalSearch"];
      }
      if (([v175 source] & 0x400) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_MapItemHandle"];
      }
      if (([v175 source] & 0x800) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_ProactiveExperts"];
      }
      if (([v175 source] & 0x1000) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_Portrait"];
      }
      if (([v175 source] & 0x2000) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_LearnedPlace"];
      }
      if (([v175 source] & 0x4000) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_BluePOI"];
      }
      if (([v175 source] & 0x8000) != 0) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"place_source_MapItemURL"];
      }
      if (([v175 source] & 0x80000) == 0) {
        goto LABEL_104;
      }
      v191 = @"place_source_POIHistory";
    }
    else
    {
      v192 = v207;
    }
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v191];
LABEL_104:
    v193 = NSNumber;
    v194 = [v9 location];
    v195 = [v193 numberWithUnsignedInteger:[v194 sourceAccuracy]];
    [v11 setObject:v195 forKeyedSubscript:@"sourceAccuracy"];

    id v15 = v11;
    id v14 = v206;
LABEL_105:

    goto LABEL_106;
  }
  v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit.entry", buf, 2u);
  }
  id v15 = 0;
LABEL_106:

  return v15;
}

- (id)locationStoreMetricsForInterval:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    *(void *)v33 = 0;
    v34 = v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__30;
    v37 = __Block_byref_object_dispose__30;
    id v38 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v6 = [[RTLocationStoreMetricOptions alloc] initWithDateInterval:v4 uncertaintyThreshold:1 includeFixMetrics:1 includeSignalEnvironment:235.0];
    locationStore = self->_locationStore;
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    uint64_t v29 = __50__RTVisitMetrics_locationStoreMetricsForInterval___block_invoke;
    v30 = &unk_1E6B93888;
    v32 = v33;
    id v8 = v5;
    v31 = v8;
    [(RTLocationStore *)locationStore fetchMetricsWithOptions:v6 handler:&v27];
    id v9 = v8;
    v10 = [MEMORY[0x1E4F1C9C8] now:v27, v28, v29, v30];
    dispatch_time_t v11 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v9, v11))
    {
      v12 = [MEMORY[0x1E4F1C9C8] now];
      [v12 timeIntervalSinceDate:v10];
      double v14 = v13;
      id v15 = objc_opt_new();
      id v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_24];
      int v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 filteredArrayUsingPredicate:v16];
      id v19 = [v18 firstObject];

      [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
      v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      *(void *)buf = @"semaphore wait timeout";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v39 count:1];
      v23 = [v21 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v22];

      if (v23) {
    }
      }

    id v24 = *((id *)v34 + 5);
    _Block_object_dispose(v33, 8);
  }
  else
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v33 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", v33, 2u);
    }

    id v24 = (id)objc_opt_new();
  }

  return v24;
}

void __50__RTVisitMetrics_locationStoreMetricsForInterval___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)predominantMotionMetricsForVisit:(id)a3 isPreviousVisit:(BOOL)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    *(void *)buf = 0;
    v71 = buf;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__30;
    v74 = __Block_byref_object_dispose__30;
    id v75 = (id)objc_opt_new();
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    if ([v6 type] == 1)
    {
      id v8 = [v6 entry];
      v61 = [v8 dateByAddingTimeInterval:-60.0];

      id v9 = [v6 entry];
      v10 = [v9 dateByAddingTimeInterval:1800.0];

      motionActivityManager = self->_motionActivityManager;
      v12 = [v6 date];
      double v13 = [v10 earlierDate:v12];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __67__RTVisitMetrics_predominantMotionMetricsForVisit_isPreviousVisit___block_invoke;
      v66[3] = &unk_1E6B938B0;
      BOOL v69 = a4;
      v68 = buf;
      double v14 = v7;
      v67 = v14;
      [(RTMotionActivityManager *)motionActivityManager fetchPredominantMotionActivityTypeFromStartDate:v61 toEndDate:v13 withHandler:v66];

      dispatch_semaphore_t v7 = v14;
      id v15 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v16 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v7, v16)) {
        goto LABEL_17;
      }
      int v17 = [MEMORY[0x1E4F1C9C8] now];
      [v17 timeIntervalSinceDate:v15];
      double v19 = v18;
      v20 = objc_opt_new();
      uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_24];
      v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      v23 = [v22 filteredArrayUsingPredicate:v21];
      id v24 = [v23 firstObject];

      [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
      v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v77 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v77, 2u);
      }

      id v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v76 = *MEMORY[0x1E4F28568];
      *(void *)v77 = @"semaphore wait timeout";
      uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
      uint64_t v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

      if (v28)
      {
        id v29 = v28;

        char v30 = 0;
      }
      else
      {
LABEL_17:
        id v29 = 0;
        char v30 = 1;
      }

      id v55 = v29;
      if (v30)
      {
        v56 = v66;
LABEL_27:

        goto LABEL_28;
      }
      v57 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v77 = 0;
        _os_log_error_impl(&dword_1D9BFA000, v57, OS_LOG_TYPE_ERROR, "Could not collect entry time interval of motion metrics", v77, 2u);
      }
    }
    else
    {
      if ([v6 type] != 3)
      {
        id v55 = 0;
LABEL_28:
        id v32 = *((id *)v71 + 5);
LABEL_33:

        _Block_object_dispose(buf, 8);
        goto LABEL_34;
      }
      dispatch_semaphore_t v33 = dispatch_semaphore_create(0);

      v34 = [v6 exit];
      v61 = [v34 dateByAddingTimeInterval:-60.0];

      uint64_t v35 = [v6 exit];
      v10 = [v35 dateByAddingTimeInterval:1800.0];

      v36 = self->_motionActivityManager;
      v37 = [v6 date];
      id v38 = [v10 earlierDate:v37];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __67__RTVisitMetrics_predominantMotionMetricsForVisit_isPreviousVisit___block_invoke_211;
      v62[3] = &unk_1E6B938B0;
      BOOL v65 = a4;
      v64 = buf;
      uint64_t v39 = v33;
      v63 = v39;
      [(RTMotionActivityManager *)v36 fetchPredominantMotionActivityTypeFromStartDate:v61 toEndDate:v38 withHandler:v62];

      dispatch_semaphore_t v7 = v39;
      v40 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v41 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v7, v41)) {
        goto LABEL_24;
      }
      v60 = [MEMORY[0x1E4F1C9C8] now];
      [v60 timeIntervalSinceDate:v40];
      double v43 = v42;
      v44 = objc_opt_new();
      v45 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_24];
      v46 = [MEMORY[0x1E4F29060] callStackSymbols];
      v47 = [v46 filteredArrayUsingPredicate:v45];
      v48 = [v47 firstObject];

      [v44 submitToCoreAnalytics:v48 type:1 duration:v43];
      v49 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v77 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v77, 2u);
      }

      v50 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v76 = *MEMORY[0x1E4F28568];
      *(void *)v77 = @"semaphore wait timeout";
      double v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
      double v52 = [v50 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v51];

      if (v52)
      {
        id v53 = v52;

        char v54 = 0;
      }
      else
      {
LABEL_24:
        id v53 = 0;
        char v54 = 1;
      }

      id v55 = v53;
      if (v54)
      {
        v56 = v62;
        goto LABEL_27;
      }
      v58 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v77 = 0;
        _os_log_error_impl(&dword_1D9BFA000, v58, OS_LOG_TYPE_ERROR, "Could not collect exit time interval of motion metrics", v77, 2u);
      }
    }
    id v32 = 0;
    goto LABEL_33;
  }
  v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
  }

  id v32 = (id)objc_opt_new();
LABEL_34:

  return v32;
}

intptr_t __67__RTVisitMetrics_predominantMotionMetricsForVisit_isPreviousVisit___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = [NSNumber numberWithUnsignedInteger:a2];
  if (v3) {
    dispatch_semaphore_t v5 = @"previousVisit_motion_state_entry";
  }
  else {
    dispatch_semaphore_t v5 = @"motion_state_entry";
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v4 forKeyedSubscript:v5];

  id v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

intptr_t __67__RTVisitMetrics_predominantMotionMetricsForVisit_isPreviousVisit___block_invoke_211(uint64_t a1, uint64_t a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = [NSNumber numberWithUnsignedInteger:a2];
  if (v3) {
    dispatch_semaphore_t v5 = @"previousVisit_motion_state_exit";
  }
  else {
    dispatch_semaphore_t v5 = @"motion_state_exit";
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v4 forKeyedSubscript:v5];

  id v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

- (id)predominantMotionMetricsForTransitionForVisit:(id)a3 previousVisit:(id)a4
{
  aSelector = a2;
  v49[1] = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v6 = a4;
  uint64_t v42 = 0;
  double v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__30;
  v46 = __Block_byref_object_dispose__30;
  id v47 = (id)objc_opt_new();
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = [v6 exit];
  id v9 = [v8 dateByAddingTimeInterval:1800.0];

  motionActivityManager = self->_motionActivityManager;
  dispatch_time_t v11 = [v6 exit];
  v12 = [v38 entry];
  double v13 = [v9 earlierDate:v12];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __78__RTVisitMetrics_predominantMotionMetricsForTransitionForVisit_previousVisit___block_invoke;
  v39[3] = &unk_1E6B938D8;
  dispatch_time_t v41 = &v42;
  double v14 = v7;
  v40 = v14;
  [(RTMotionActivityManager *)motionActivityManager fetchPredominantMotionActivityTypeFromStartDate:v11 toEndDate:v13 withHandler:v39];

  id v15 = v14;
  dispatch_time_t v16 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v17 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v15, v17)) {
    goto LABEL_6;
  }
  double v18 = [MEMORY[0x1E4F1C9C8] now:aSelector];
  [v18 timeIntervalSinceDate:v16];
  double v20 = v19;
  uint64_t v21 = objc_opt_new();
  v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_24];
  v23 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v24 = [v23 filteredArrayUsingPredicate:v22];
  v25 = [v24 firstObject];

  [v21 submitToCoreAnalytics:v25 type:1 duration:v20];
  id v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
  v49[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v49 count:1];
  id v29 = [v27 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v28];

  if (v29)
  {
    id v30 = v29;

    char v31 = 0;
  }
  else
  {
LABEL_6:
    id v30 = 0;
    char v31 = 1;
  }

  id v32 = v30;
  if ((v31 & 1) == 0)
  {
    dispatch_semaphore_t v33 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v36 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v36;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@ timed out", buf, 0xCu);
    }
  }
  id v34 = (id)v43[5];

  _Block_object_dispose(&v42, 8);

  return v34;
}

intptr_t __78__RTVisitMetrics_predominantMotionMetricsForTransitionForVisit_previousVisit___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = [NSNumber numberWithUnsignedInteger:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v3 forKeyedSubscript:@"motion_state_transition"];

  id v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

- (id)motionMetricsForDateInterval:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v52 = (id)objc_opt_new();
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__30;
  v71 = __Block_byref_object_dispose__30;
  id v72 = 0;
  uint64_t v61 = 0;
  v62 = (id *)&v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__30;
  BOOL v65 = __Block_byref_object_dispose__30;
  id v66 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  double v51 = v4;
  id v6 = [v4 startDate];
  v49 = [v6 dateByAddingTimeInterval:3600.0];

  motionActivityManager = self->_motionActivityManager;
  id v8 = [v4 startDate];
  id v9 = [v4 endDate];
  v10 = [v49 earlierDate:v9];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __47__RTVisitMetrics_motionMetricsForDateInterval___block_invoke;
  v57[3] = &unk_1E6B905F0;
  v59 = &v67;
  v60 = &v61;
  dispatch_time_t v11 = v5;
  v58 = v11;
  [(RTMotionActivityManager *)motionActivityManager fetchMotionActivitiesFromStartDate:v8 endDate:v10 handler:v57];

  dsema = v11;
  v12 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v13)) {
    goto LABEL_6;
  }
  double v14 = [MEMORY[0x1E4F1C9C8] now];
  [v14 timeIntervalSinceDate:v12];
  double v16 = v15;
  dispatch_time_t v17 = objc_opt_new();
  double v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_24];
  double v19 = [MEMORY[0x1E4F29060] callStackSymbols];
  double v20 = [v19 filteredArrayUsingPredicate:v18];
  uint64_t v21 = [v20 firstObject];

  [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
  v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v23 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v74 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v74 count:1];
  v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

  if (v25)
  {
    id v26 = v25;

    char v27 = 0;
  }
  else
  {
LABEL_6:
    id v26 = 0;
    char v27 = 1;
  }

  id v48 = v26;
  if ((v27 & 1) == 0) {
    objc_storeStrong(v62 + 5, v26);
  }
  uint64_t v28 = [RTMotionActivityHistogram alloc];
  uint64_t v29 = v68[5];
  id v30 = [v51 startDate];
  char v31 = [v51 endDate];
  id v32 = [(RTMotionActivityHistogram *)v28 initWithActivites:v29 betweenDate:v30 andDate:v31];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v33 = [&unk_1F3452A30 countByEnumeratingWithState:&v53 objects:v73 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v54 != v34) {
          objc_enumerationMutation(&unk_1F3452A30);
        }
        v36 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        unint64_t v37 = [v36 unsignedIntegerValue];
        if (v37 < 7)
        {
          id v38 = off_1E6B938F8[v37];
          [(RTMotionActivityHistogram *)v32 totalInterval];
          if (v39 <= 0.0)
          {
            unint64_t v45 = 0;
          }
          else
          {
            v40 = -[RTMotionActivityHistogram binForType:](v32, "binForType:", [v36 unsignedIntegerValue]);
            [v40 interval];
            double v42 = v41;
            [(RTMotionActivityHistogram *)v32 totalInterval];
            double v44 = v43;

            unint64_t v45 = (unint64_t)(v42 / v44 * 100.0 + 0.5);
          }
          v46 = [NSNumber numberWithInteger:v45];
          [v52 setObject:v46 forKeyedSubscript:v38];
        }
      }
      uint64_t v33 = [&unk_1F3452A30 countByEnumeratingWithState:&v53 objects:v73 count:16];
    }
    while (v33);
  }

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

  return v52;
}

void __47__RTVisitMetrics_motionMetricsForDateInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)metricsForConfiguration:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (a3 - 3 < 2)
  {
    uint64_t v9 = [(RTVisitMetrics *)self batchedMetricsForConfiguration:a3 dateInterval:v8 error:a5];
    goto LABEL_5;
  }
  if (a3 - 1 <= 1)
  {
    uint64_t v9 = [(RTVisitMetrics *)self realtimeMetricsForConfiguration:a3 dateInterval:v8 error:a5];
LABEL_5:
    a5 = v9;
    goto LABEL_6;
  }
  if (a5)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F5CFE8];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @"unsupported configuration";
    dispatch_time_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a5 = [v11 errorWithDomain:v12 code:1 userInfo:v13];

    a5 = 0;
  }
LABEL_6:

  return a5;
}

- (id)batchedMetricsForConfiguration:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v70 = a4;
  if (a3 == 4)
  {
    id v72 = [MEMORY[0x1E4F1CA48] array];
    *(void *)buf = 0;
    v92 = buf;
    uint64_t v93 = 0x3032000000;
    v94 = __Block_byref_object_copy__30;
    v95 = __Block_byref_object_dispose__30;
    id v96 = 0;
    uint64_t v85 = 0;
    v86 = (id *)&v85;
    uint64_t v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__30;
    v89 = __Block_byref_object_dispose__30;
    id v90 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    learnedLocationStore = self->_learnedLocationStore;
    v10 = [(RTLearnedLocationStore *)learnedLocationStore predicateForObjectsFromCurrentDevice];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __68__RTVisitMetrics_batchedMetricsForConfiguration_dateInterval_error___block_invoke;
    v81[3] = &unk_1E6B905F0;
    double v83 = buf;
    v84 = &v85;
    id v11 = v8;
    double v82 = v11;
    [(RTLearnedLocationStore *)learnedLocationStore fetchVisitsWithPredicate:v10 ascending:1 dateInterval:v70 limit:0 handler:v81];

    dsema = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v13 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v13)) {
      goto LABEL_11;
    }
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
    [v14 timeIntervalSinceDate:v12];
    double v16 = v15;
    dispatch_time_t v17 = objc_opt_new();
    double v18 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_24];
    double v19 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v20 = [v19 filteredArrayUsingPredicate:v18];
    uint64_t v21 = [v20 firstObject];

    [v17 submitToCoreAnalytics:v21 type:1 duration:v16];
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v104 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v104, 2u);
    }

    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v98 = *MEMORY[0x1E4F28568];
    *(void *)v104 = @"semaphore wait timeout";
    id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:&v98 count:1];
    v25 = [v23 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v24];

    if (v25)
    {
      id v26 = v25;

      char v27 = 0;
    }
    else
    {
LABEL_11:
      id v26 = 0;
      char v27 = 1;
    }

    id v30 = v26;
    if ((v27 & 1) == 0) {
      objc_storeStrong(v86 + 5, v26);
    }
    if ([*((id *)v92 + 5) count])
    {
      *(void *)v104 = 0;
      v105 = v104;
      uint64_t v106 = 0x3032000000;
      v107 = __Block_byref_object_copy__30;
      v108 = __Block_byref_object_dispose__30;
      id v109 = 0;
      uint64_t v98 = 0;
      v99 = (id *)&v98;
      uint64_t v100 = 0x3032000000;
      v101 = __Block_byref_object_copy__30;
      double v102 = __Block_byref_object_dispose__30;
      id v103 = 0;
      dispatch_semaphore_t v31 = dispatch_semaphore_create(0);

      id v32 = self->_learnedLocationStore;
      uint64_t v33 = [(RTLearnedLocationStore *)v32 predicateForObjectsFromCurrentDevice];
      id v34 = objc_alloc(MEMORY[0x1E4F28C18]);
      uint64_t v35 = [MEMORY[0x1E4F1C9C8] distantPast];
      v36 = [*((id *)v92 + 5) firstObject];
      unint64_t v37 = [v36 entryDate];
      id v38 = (void *)[v34 initWithStartDate:v35 endDate:v37];
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __68__RTVisitMetrics_batchedMetricsForConfiguration_dateInterval_error___block_invoke_270;
      v77[3] = &unk_1E6B905F0;
      v79 = v104;
      v80 = &v98;
      double v39 = v31;
      uint64_t v78 = v39;
      [(RTLearnedLocationStore *)v32 fetchVisitsWithPredicate:v33 ascending:0 dateInterval:v38 limit:&unk_1F3450150 handler:v77];

      dsema = v39;
      v40 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v41 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v41)) {
        goto LABEL_20;
      }
      double v42 = [MEMORY[0x1E4F1C9C8] now];
      [v42 timeIntervalSinceDate:v40];
      double v44 = v43;
      unint64_t v45 = objc_opt_new();
      v46 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_24];
      id v47 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v48 = [v47 filteredArrayUsingPredicate:v46];
      v49 = [v48 firstObject];

      [v45 submitToCoreAnalytics:v49 type:1 duration:v44];
      v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v111 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v111, 2u);
      }

      double v51 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v110 = *MEMORY[0x1E4F28568];
      *(void *)uint64_t v111 = @"semaphore wait timeout";
      id v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:&v110 count:1];
      long long v53 = [v51 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v52];

      if (v53)
      {
        id v54 = v53;

        char v55 = 0;
      }
      else
      {
LABEL_20:
        char v55 = 1;
        id v54 = v30;
      }

      id v68 = v54;
      if ((v55 & 1) == 0) {
        objc_storeStrong(v99 + 5, v54);
      }
      if (objc_msgSend(*((id *)v105 + 5), "count", v68))
      {
        id v56 = objc_alloc(MEMORY[0x1E4F5CFC8]);
        v57 = [*((id *)v105 + 5) firstObject];
        v58 = (void *)[v56 initWithLearnedVisit:v57];
      }
      else
      {
        v58 = 0;
      }
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v59 = *((id *)v92 + 5);
      uint64_t v60 = [v59 countByEnumeratingWithState:&v73 objects:v97 count:16];
      if (v60)
      {
        uint64_t v61 = *(void *)v74;
        do
        {
          uint64_t v62 = 0;
          uint64_t v63 = v58;
          do
          {
            if (*(void *)v74 != v61) {
              objc_enumerationMutation(v59);
            }
            uint64_t v64 = *(void *)(*((void *)&v73 + 1) + 8 * v62);
            BOOL v65 = (void *)MEMORY[0x1E016D870]();
            v58 = (void *)[objc_alloc(MEMORY[0x1E4F5CFC8]) initWithLearnedVisit:v64];
            id v66 = [(RTVisitMetrics *)self metricForPipelineConfiguration:4 previousVisit:v63 visit:v58];
            if (v66) {
              [v72 addObject:v66];
            }

            ++v62;
            uint64_t v63 = v58;
          }
          while (v60 != v62);
          uint64_t v60 = [v59 countByEnumeratingWithState:&v73 objects:v97 count:16];
        }
        while (v60);
      }

      id v29 = v72;
      _Block_object_dispose(&v98, 8);

      _Block_object_dispose(v104, 8);
      id v30 = v69;
    }
    else
    {
      id v29 = 0;
    }

    _Block_object_dispose(&v85, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration == RTVisitMetricsPipelineConfigurationBatchedHighConfidence", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate(@"configuration == RTVisitMetricsPipelineConfigurationBatchedHighConfidence");
      id v29 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v29 = 0;
    }
  }

  return v29;
}

void __68__RTVisitMetrics_batchedMetricsForConfiguration_dateInterval_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __68__RTVisitMetrics_batchedMetricsForConfiguration_dateInterval_error___block_invoke_270(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)realtimeMetricsForConfiguration:(unint64_t)a3 dateInterval:(id)a4 error:(id *)a5
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v71 = a4;
  if (a3 - 1 < 2)
  {
    if (a3 == 1)
    {
      uint64_t v7 = (double *)MEMORY[0x1E4F5D018];
    }
    else
    {
      if (a3 != 2)
      {
        id v70 = 0;
        goto LABEL_13;
      }
      uint64_t v7 = (double *)MEMORY[0x1E4F5D010];
    }
    id v70 = [NSNumber numberWithDouble:*v7];
LABEL_13:
    uint64_t v69 = (void *)[objc_alloc(MEMORY[0x1E4F5CF58]) initWithAscending:1 confidence:v70 dateInterval:v71 labelVisit:1 limit:0];
    v10 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v69;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "visit metrics submission, realtime options, %@", (uint8_t *)&buf, 0xCu);
    }

    id v11 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v71;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "visit metrics submission, dateinterval, %@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v106 = 0x3032000000;
    v107 = __Block_byref_object_copy__30;
    v108 = __Block_byref_object_dispose__30;
    id v109 = 0;
    uint64_t v86 = 0;
    uint64_t v87 = (id *)&v86;
    uint64_t v88 = 0x3032000000;
    v89 = __Block_byref_object_copy__30;
    id v90 = __Block_byref_object_dispose__30;
    id v91 = 0;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    visitManager = self->_visitManager;
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __69__RTVisitMetrics_realtimeMetricsForConfiguration_dateInterval_error___block_invoke;
    v82[3] = &unk_1E6B905F0;
    p_long long buf = &buf;
    uint64_t v85 = &v86;
    uint64_t v14 = v12;
    double v83 = v14;
    [(RTVisitManager *)visitManager fetchStoredVisitsWithOptions:v69 handler:v82];
    dsema = v14;
    double v15 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v16 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v16)) {
      goto LABEL_22;
    }
    dispatch_time_t v17 = [MEMORY[0x1E4F1C9C8] now];
    [v17 timeIntervalSinceDate:v15];
    double v19 = v18;
    double v20 = objc_opt_new();
    uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_24];
    v22 = [MEMORY[0x1E4F29060] callStackSymbols];
    v23 = [v22 filteredArrayUsingPredicate:v21];
    id v24 = [v23 firstObject];

    [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v99 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v99, 2u);
    }

    id v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v93 = *MEMORY[0x1E4F28568];
    *(void *)v99 = @"semaphore wait timeout";
    char v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:&v93 count:1];
    uint64_t v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

    if (v28)
    {
      id v29 = v28;

      char v30 = 0;
    }
    else
    {
LABEL_22:
      id v29 = 0;
      char v30 = 1;
    }

    id v31 = v29;
    if ((v30 & 1) == 0) {
      objc_storeStrong(v87 + 5, v29);
    }
    if ([*(id *)(*((void *)&buf + 1) + 40) count])
    {
      id v32 = objc_alloc(MEMORY[0x1E4F5CF58]);
      id v33 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v34 = [MEMORY[0x1E4F1C9C8] distantPast];
      uint64_t v35 = [*(id *)(*((void *)&buf + 1) + 40) firstObject];
      v36 = [v35 entry];
      unint64_t v37 = (void *)[v33 initWithStartDate:v34 endDate:v36];
      id v68 = (void *)[v32 initWithAscending:0 confidence:v70 dateInterval:v37 labelVisit:1 limit:&unk_1F3450150];

      *(void *)v99 = 0;
      uint64_t v100 = v99;
      uint64_t v101 = 0x3032000000;
      double v102 = __Block_byref_object_copy__30;
      id v103 = __Block_byref_object_dispose__30;
      id v104 = 0;
      uint64_t v93 = 0;
      v94 = (id *)&v93;
      uint64_t v95 = 0x3032000000;
      id v96 = __Block_byref_object_copy__30;
      double v97 = __Block_byref_object_dispose__30;
      id v98 = 0;
      dispatch_semaphore_t v38 = dispatch_semaphore_create(0);

      double v39 = self->_visitManager;
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __69__RTVisitMetrics_realtimeMetricsForConfiguration_dateInterval_error___block_invoke_2;
      v78[3] = &unk_1E6B905F0;
      v80 = v99;
      v81 = &v93;
      v40 = v38;
      v79 = v40;
      [(RTVisitManager *)v39 fetchStoredVisitsWithOptions:v68 handler:v78];
      dsema = v40;
      dispatch_time_t v41 = [MEMORY[0x1E4F1C9C8] now];
      dispatch_time_t v42 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v42)) {
        goto LABEL_31;
      }
      double v43 = [MEMORY[0x1E4F1C9C8] now];
      [v43 timeIntervalSinceDate:v41];
      double v45 = v44;
      v46 = objc_opt_new();
      id v47 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_24];
      id v48 = [MEMORY[0x1E4F29060] callStackSymbols];
      v49 = [v48 filteredArrayUsingPredicate:v47];
      v50 = [v49 firstObject];

      [v46 submitToCoreAnalytics:v50 type:1 duration:v45];
      double v51 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v111 = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v111, 2u);
      }

      id v52 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v110 = *MEMORY[0x1E4F28568];
      *(void *)uint64_t v111 = @"semaphore wait timeout";
      long long v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:&v110 count:1];
      id v54 = [v52 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v53];

      if (v54)
      {
        id v55 = v54;

        char v56 = 0;
      }
      else
      {
LABEL_31:
        char v56 = 1;
        id v55 = v31;
      }

      id v67 = v55;
      if ((v56 & 1) == 0) {
        objc_storeStrong(v94 + 5, v55);
      }
      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      id v57 = [*((id *)v100 + 5) firstObject];
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v58 = *(id *)(*((void *)&buf + 1) + 40);
      uint64_t v59 = [v58 countByEnumeratingWithState:&v74 objects:v92 count:16];
      if (v59)
      {
        uint64_t v60 = *(void *)v75;
        do
        {
          uint64_t v61 = 0;
          uint64_t v62 = v57;
          do
          {
            if (*(void *)v75 != v60) {
              objc_enumerationMutation(v58);
            }
            uint64_t v63 = *(void **)(*((void *)&v74 + 1) + 8 * v61);
            uint64_t v64 = (void *)MEMORY[0x1E016D870]();
            BOOL v65 = [(RTVisitMetrics *)self metricForPipelineConfiguration:a3 previousVisit:v62 visit:v63];
            if (v65) {
              [v9 addObject:v65];
            }
            id v57 = v63;

            ++v61;
            uint64_t v62 = v57;
          }
          while (v59 != v61);
          uint64_t v59 = [v58 countByEnumeratingWithState:&v74 objects:v92 count:16];
        }
        while (v59);
      }

      _Block_object_dispose(&v93, 8);
      _Block_object_dispose(v99, 8);

      id v31 = v67;
    }
    else
    {
      uint64_t v9 = 0;
    }

    _Block_object_dispose(&v86, 8);
    _Block_object_dispose(&buf, 8);

    goto LABEL_46;
  }
  dispatch_semaphore_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration == RTVisitMetricsPipelineConfigurationRealtimeLowConfidence || configuration == RTVisitMetricsPipelineConfigurationRealtimeHighConfidence", (uint8_t *)&buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate(@"configuration == RTVisitMetricsPipelineConfigurationRealtimeLowConfidence || configuration == RTVisitMetricsPipelineConfigurationRealtimeHighConfidence");
    uint64_t v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_46:

  return v9;
}

void __69__RTVisitMetrics_realtimeMetricsForConfiguration_dateInterval_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69__RTVisitMetrics_realtimeMetricsForConfiguration_dateInterval_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)collectRealtimeMetricsForDateInterval:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  dispatch_semaphore_t v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = NSStringFromSelector(a2);
    int v12 = 138412290;
    dispatch_time_t v13 = v9;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v12, 0xCu);
  }
  BOOL v10 = [(RTVisitMetrics *)self collectMetricsForDateInterval:v7 configurations:&unk_1F3452A48 error:a4];

  return v10;
}

- (BOOL)collectBatchedMetricsForDateInterval:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  dispatch_semaphore_t v8 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = NSStringFromSelector(a2);
    int v12 = 138412290;
    dispatch_time_t v13 = v9;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v12, 0xCu);
  }
  BOOL v10 = [(RTVisitMetrics *)self collectMetricsForDateInterval:v7 configurations:&unk_1F3452A60 error:a4];

  return v10;
}

- (BOOL)collectMetricsForDateInterval:(id)a3 configurations:(id)a4 error:(id *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v6 = a4;
  id v33 = [MEMORY[0x1E4F1CA48] array];
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    char v27 = [v36 startDate];
    uint64_t v28 = [v27 stringFromDate];
    id v29 = [v36 endDate];
    char v30 = [v29 stringFromDate];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v52 = (uint64_t)v28;
    __int16 v53 = 2112;
    id v54 = v30;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "collecting metrics, startDate, %@, endDate, %@", buf, 0x16u);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v6;
  uint64_t v37 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v37)
  {
    uint64_t v34 = *(void *)v47;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v47 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = v8;
        uint64_t v9 = *(void **)(*((void *)&v46 + 1) + 8 * v8);
        context = (void *)MEMORY[0x1E016D870]();
        uint64_t v10 = [v9 unsignedIntegerValue];
        id v45 = 0;
        id v11 = [(RTVisitMetrics *)self metricsForConfiguration:v10 dateInterval:v36 error:&v45];
        id v12 = v45;
        dispatch_time_t v13 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v23 = [v11 count];
          *(_DWORD *)long long buf = 134218498;
          uint64_t v52 = v23;
          __int16 v53 = 2112;
          id v54 = v9;
          __int16 v55 = 2112;
          id v56 = v12;
          _os_log_debug_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEBUG, "collected %lu metrics for configuration, %@, error, %@", buf, 0x20u);
        }
        dispatch_semaphore_t v38 = v12;

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v14 = v11;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v42 != v17) {
                objc_enumerationMutation(v14);
              }
              double v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              id v20 = [NSString alloc];
              uint64_t v21 = (void *)[v20 initWithCString:RTAnalyticsEventVisitDetails encoding:1];
              log_analytics_submission(v21, v19);
              v22 = [NSString stringWithFormat:@"com.apple.%@", v21];
              AnalyticsSendEvent();
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }
          while (v16);
        }

        if (v38) {
          [v33 addObject:v38];
        }

        uint64_t v8 = v40 + 1;
      }
      while (v40 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v37);
  }

  uint64_t v24 = [v33 count];
  if (a5 && v24)
  {
    v25 = _RTSafeArray();
    _RTMultiErrorCreate();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 1;
}

- (id)_nearbyLoisFromVisit:(id)a3
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    *(void *)long long v44 = 0;
    id v45 = v44;
    uint64_t v46 = 0x3032000000;
    long long v47 = __Block_byref_object_copy__30;
    long long v48 = __Block_byref_object_dispose__30;
    id v49 = 0;
    uint64_t v38 = 0;
    double v39 = (id *)&v38;
    uint64_t v40 = 0x3032000000;
    long long v41 = __Block_byref_object_copy__30;
    long long v42 = __Block_byref_object_dispose__30;
    id v43 = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    learnedLocationStore = self->_learnedLocationStore;
    uint64_t v8 = [v5 location];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __39__RTVisitMetrics__nearbyLoisFromVisit___block_invoke;
    v34[3] = &unk_1E6B905F0;
    id v36 = v44;
    uint64_t v37 = &v38;
    uint64_t v9 = v6;
    uint64_t v35 = v9;
    [(RTLearnedLocationStore *)learnedLocationStore fetchLocationsOfInterestWithVisitsWithinDistance:v8 location:v34 handler:1000.0];

    uint64_t v10 = v9;
    id v11 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v12 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v10, v12)) {
      goto LABEL_7;
    }
    dispatch_time_t v13 = [MEMORY[0x1E4F1C9C8] now];
    [v13 timeIntervalSinceDate:v11];
    double v15 = v14;
    uint64_t v16 = objc_opt_new();
    uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_24];
    double v18 = [MEMORY[0x1E4F29060] callStackSymbols];
    double v19 = [v18 filteredArrayUsingPredicate:v17];
    id v20 = [v19 firstObject];

    [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
    uint64_t v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v22 = (void *)MEMORY[0x1E4F28C58];
    v53[0] = *MEMORY[0x1E4F28568];
    *(void *)long long buf = @"semaphore wait timeout";
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v53 count:1];
    uint64_t v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v23];

    if (v24)
    {
      id v25 = v24;

      char v26 = 0;
    }
    else
    {
LABEL_7:
      id v25 = 0;
      char v26 = 1;
    }

    id v27 = v25;
    if ((v26 & 1) == 0) {
      objc_storeStrong(v39 + 5, v25);
    }
    if (v39[5])
    {
      uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v32 = NSStringFromSelector(a2);
        id v33 = v39[5];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v32;
        __int16 v51 = 2112;
        id v52 = v33;
        _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
      }
    }
    id v29 = *((id *)v45 + 5);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(v44, 8);
  }
  else
  {
    char v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v44 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", v44, 2u);
    }

    id v29 = 0;
  }

  return v29;
}

void __39__RTVisitMetrics__nearbyLoisFromVisit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_closestLoi:(id)a3 location:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (![v5 count])
  {
    id obj = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v21 = "Invalid parameter not satisfying: lois.count > 0";
LABEL_21:
    _os_log_error_impl(&dword_1D9BFA000, obj, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_16;
  }
  if (!v6)
  {
    id obj = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v21 = "Invalid parameter not satisfying: location";
    goto LABEL_21;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (!v7)
  {
LABEL_16:
    uint64_t v9 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  id v23 = v5;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v26;
  double v11 = INFINITY;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v26 != v10) {
        objc_enumerationMutation(obj);
      }
      dispatch_time_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      [v6 latitude:v23];
      [v6 longitude];
      double v14 = [v13 location];
      double v15 = [v14 location];
      [v15 latitude];
      uint64_t v16 = [v13 location];
      uint64_t v17 = [v16 location];
      [v17 longitude];
      RTCommonCalculateDistanceHighPrecision();
      double v19 = v18;

      if (v19 < v11)
      {
        id v20 = v13;

        uint64_t v9 = v20;
        double v11 = v19;
      }
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  }
  while (v8);
  id v5 = v23;
LABEL_17:

  return v9;
}

- (id)_associatedLoiFromVisit:(id)a3
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    uint64_t v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
    }

    goto LABEL_11;
  }
  uint64_t v7 = [v5 placeInference];
  uint64_t v8 = [v7 mapItem];

  if (!v8)
  {
LABEL_11:
    id v32 = 0;
    goto LABEL_20;
  }
  *(void *)long long buf = 0;
  id v49 = buf;
  uint64_t v50 = 0x3032000000;
  __int16 v51 = __Block_byref_object_copy__30;
  id v52 = __Block_byref_object_dispose__30;
  id v53 = 0;
  uint64_t v42 = 0;
  id v43 = (id *)&v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy__30;
  uint64_t v46 = __Block_byref_object_dispose__30;
  id v47 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  learnedLocationStore = self->_learnedLocationStore;
  double v11 = [v6 placeInference];
  id v12 = [v11 mapItem];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __42__RTVisitMetrics__associatedLoiFromVisit___block_invoke;
  v38[3] = &unk_1E6B90B28;
  uint64_t v40 = buf;
  long long v41 = &v42;
  dispatch_time_t v13 = v9;
  double v39 = v13;
  [(RTLearnedLocationStore *)learnedLocationStore fetchLocationOfInterestWithMapItem:v12 handler:v38];

  double v14 = v13;
  double v15 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v14, v16)) {
    goto LABEL_12;
  }
  uint64_t v17 = [MEMORY[0x1E4F1C9C8] now];
  [v17 timeIntervalSinceDate:v15];
  double v19 = v18;
  id v20 = objc_opt_new();
  uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_24];
  v22 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v23 = [v22 filteredArrayUsingPredicate:v21];
  uint64_t v24 = [v23 firstObject];

  [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
  long long v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v54 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v54, 2u);
  }

  long long v26 = (void *)MEMORY[0x1E4F28C58];
  v57[0] = *MEMORY[0x1E4F28568];
  *(void *)id v54 = @"semaphore wait timeout";
  long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v57 count:1];
  long long v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

  if (v28)
  {
    id v29 = v28;

    char v30 = 0;
  }
  else
  {
LABEL_12:
    id v29 = 0;
    char v30 = 1;
  }

  id v33 = v29;
  if ((v30 & 1) == 0) {
    objc_storeStrong(v43 + 5, v29);
  }
  if (v43[5])
  {
    uint64_t v34 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v36 = NSStringFromSelector(a2);
      id v37 = v43[5];
      *(_DWORD *)id v54 = 138412546;
      *(void *)&v54[4] = v36;
      __int16 v55 = 2112;
      id v56 = v37;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "%@, error, %@", v54, 0x16u);
    }
  }
  id v32 = *((id *)v49 + 5);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(buf, 8);

LABEL_20:

  return v32;
}

void __42__RTVisitMetrics__associatedLoiFromVisit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);

  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end