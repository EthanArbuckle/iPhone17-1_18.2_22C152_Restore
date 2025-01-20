@interface RTStateTransition
+ (BOOL)supportsSecureCoding;
- (NSMutableArray)listTransitions;
- (RTStateTransition)init;
- (RTStateTransition)initWithCoder:(id)a3;
- (id)getPredTrans:(double)a3 duration:(double)a4 numOfWeeks:(int)a5 uniqueID:(id)a6;
- (int64_t)count;
- (void)addStateTransitionOneTimeTransFromStateTransition:(id)a3;
- (void)cleanTransition:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setListTransitions:(id)a3;
- (void)showTransition;
- (void)submitTransition:(id)a3;
@end

@implementation RTStateTransition

- (RTStateTransition)init
{
  v5.receiver = self;
  v5.super_class = (Class)RTStateTransition;
  v2 = [(RTStateTransition *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(RTStateTransition *)v2 setListTransitions:v3];
  }
  return v2;
}

- (void)addStateTransitionOneTimeTransFromStateTransition:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(RTStateTransition *)self listTransitions];
  v6 = [v4 listTransitions];

  [v5 addObjectsFromArray:v6];
  v7 = [(RTStateTransition *)self listTransitions];
  [v7 sortUsingComparator:&__block_literal_global_211];

  if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v8 = [(RTStateTransition *)self listTransitions];
    [v8 enumerateObjectsUsingBlock:&__block_literal_global_213];
  }
}

uint64_t __71__RTStateTransition_addStateTransitionOneTimeTransFromStateTransition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 start_s];
  double v6 = v5;
  [v4 start_s];
  double v8 = v7;

  if (v6 >= v8) {
    return 1;
  }
  else {
    return -1;
  }
}

void __71__RTStateTransition_addStateTransitionOneTimeTransFromStateTransition___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    [v2 start_s];
    double v5 = [v4 stringFromTimestamp:x0];
    double v6 = (void *)MEMORY[0x1E4F1C9C8];
    [v2 stop_s];
    double v7 = [v6 stringFromTimestamp:x0];
    [v2 stop_s];
    double v9 = v8;
    [v2 start_s];
    double v11 = (v9 - v10) / 60.0;
    v12 = [MEMORY[0x1E4F5CE50] motionActivityTypeToString:[v2 motionActivityType]];
    int v13 = 138413059;
    v14 = v5;
    __int16 v15 = 2112;
    v16 = v7;
    __int16 v17 = 2049;
    double v18 = v11;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "Redirecting transitions: Start, %@, Stop, %@, Commute time, %{private}.2f [min], motionActivityType, %@", (uint8_t *)&v13, 0x2Au);
  }
}

- (void)submitTransition:(id)a3
{
  id v4 = a3;
  id v5 = [(RTStateTransition *)self listTransitions];
  [v5 addObject:v4];
}

- (void)showTransition
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v3 = [(RTStateTransition *)self listTransitions];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      id v6 = [(RTStateTransition *)self listTransitions];
      [v6 enumerateObjectsUsingBlock:&__block_literal_global_215_0];
    }
    else
    {
      id v5 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "No Transition Data ", buf, 2u);
      }
    }
  }
}

void __35__RTStateTransition_showTransition__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = a3 + 1;
    double v7 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 start_s];
    double v8 = [v7 stringFromTimestamp:x0];
    double v9 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 stop_s];
    double v10 = [v9 stringFromTimestamp:v9];
    [v4 stop_s];
    double v12 = v11;
    [v4 start_s];
    double v14 = (v12 - v13) / 60.0;
    __int16 v15 = [MEMORY[0x1E4F5CE50] motionActivityTypeToString:[v4 motionActivityType]];
    int v16 = 134219010;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    __int16 v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    __int16 v22 = 2048;
    double v23 = v14;
    __int16 v24 = 2112;
    v25 = v15;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "transition %lu, start, %@, stop, %@, duration, %.2f [min], motionActivityType, %@", (uint8_t *)&v16, 0x34u);
  }
}

- (void)cleanTransition:(double)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(RTStateTransition *)self listTransitions];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __37__RTStateTransition_cleanTransition___block_invoke;
  double v11 = &unk_1E6B9A0D0;
  double v13 = a3;
  id v12 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:&v8];

  -[RTStateTransition setListTransitions:](self, "setListTransitions:", v7, v8, v9, v10, v11);
}

void __37__RTStateTransition_cleanTransition___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 stop_s];
  if (v3 >= *(double *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (id)getPredTrans:(double)a3 duration:(double)a4 numOfWeeks:(int)a5 uniqueID:(id)a6
{
  id v10 = a6;
  uint64_t v213 = 0;
  v214 = &v213;
  uint64_t v215 = 0x3032000000;
  v216 = __Block_byref_object_copy__112;
  v217 = __Block_byref_object_dispose__112;
  id v218 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v207 = 0;
  v208 = &v207;
  uint64_t v209 = 0x3032000000;
  v210 = __Block_byref_object_copy__112;
  v211 = __Block_byref_object_dispose__112;
  id v212 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v201 = 0;
  v202 = &v201;
  uint64_t v203 = 0x3032000000;
  v204 = __Block_byref_object_copy__112;
  v205 = __Block_byref_object_dispose__112;
  id v206 = (id)objc_opt_new();
  uint64_t v195 = 0;
  v196 = &v195;
  uint64_t v197 = 0x3032000000;
  v198 = __Block_byref_object_copy__112;
  v199 = __Block_byref_object_dispose__112;
  id v200 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v189 = 0;
  v190 = &v189;
  uint64_t v191 = 0x3032000000;
  v192 = __Block_byref_object_copy__112;
  v193 = __Block_byref_object_dispose__112;
  id v100 = v10;
  id v194 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v183 = 0;
  v184 = &v183;
  uint64_t v185 = 0x3032000000;
  v186 = __Block_byref_object_copy__112;
  v187 = __Block_byref_object_dispose__112;
  id v188 = (id)objc_opt_new();
  double v11 = objc_alloc_init(RTStateTransitionMotionActivityTypeHistogram);
  id v12 = objc_alloc_init(RTStateTransitionMotionActivityTypeHistogram);
  v101 = objc_alloc_init(RTStateTransitionOneTransPred);
  uint64_t v179 = 0;
  v180 = (double *)&v179;
  uint64_t v181 = 0x2020000000;
  unint64_t v182 = 0xC26D1A94A2000000;
  uint64_t v175 = 0;
  v176 = (double *)&v175;
  uint64_t v177 = 0x2020000000;
  uint64_t v178 = 0x426D1A94A2000000;
  uint64_t v171 = 0;
  v172 = (double *)&v171;
  uint64_t v173 = 0x2020000000;
  unint64_t v174 = 0xC26D1A94A2000000;
  uint64_t v167 = 0;
  v168 = (double *)&v167;
  uint64_t v169 = 0x2020000000;
  uint64_t v170 = 0x426D1A94A2000000;
  double v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3 + -7200.0];
  double v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3 + a4];
  [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  v97 = v11;
  uint64_t v161 = 0;
  v162 = &v161;
  uint64_t v163 = 0x3032000000;
  v164 = __Block_byref_object_copy__112;
  __int16 v15 = v165 = __Block_byref_object_dispose__112;
  v96 = v12;
  id v166 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v155 = 0;
  v156 = &v155;
  uint64_t v157 = 0x3032000000;
  v158 = __Block_byref_object_copy__112;
  v159 = __Block_byref_object_dispose__112;
  id v160 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a5 >= 1)
  {
    int v16 = 0;
    do
    {
      uint64_t v17 = (void *)v162[5];
      __int16 v18 = [NSNumber numberWithInt:0];
      [v17 addObject:v18];

      uint64_t v19 = 7;
      do
      {
        __int16 v20 = (void *)v156[5];
        uint64_t v21 = [NSNumber numberWithInt:0];
        [v20 addObject:v21];

        --v19;
      }
      while (v19);
      ++v16;
    }
    while (v16 != a5);
  }
  [(RTStateTransition *)self listTransitions];
  v23 = __int16 v22 = v100;
  double v24 = (double)a5;
  v135[0] = MEMORY[0x1E4F143A8];
  v135[1] = 3221225472;
  v135[2] = __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke;
  v135[3] = &unk_1E6B9A0F8;
  double v153 = a3 + -7200.0 + (double)a5 * -604800.0;
  double v154 = a3;
  id v25 = v13;
  id v136 = v25;
  id v26 = v14;
  id v137 = v26;
  v141 = &v195;
  v142 = &v189;
  v143 = &v179;
  v144 = &v175;
  id v27 = v15;
  id v138 = v27;
  v145 = &v183;
  v28 = v97;
  v139 = v28;
  v146 = &v161;
  v147 = &v213;
  v148 = &v207;
  v149 = &v171;
  v150 = &v167;
  v151 = &v201;
  v29 = v96;
  v140 = v29;
  v152 = &v155;
  [v23 enumerateObjectsUsingBlock:v135];

  if ([(id)v196[5] count] && objc_msgSend((id)v190[5], "count"))
  {
    uint64_t v131 = 0;
    v132 = (double *)&v131;
    uint64_t v133 = 0x2020000000;
    uint64_t v134 = 0;
    uint64_t v127 = 0;
    v128 = (double *)&v127;
    uint64_t v129 = 0x2020000000;
    uint64_t v130 = 0;
    v30 = (void *)v196[5];
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_220;
    v126[3] = &unk_1E6B9A120;
    v126[4] = &v131;
    v126[5] = &v127;
    [v30 enumerateObjectsUsingBlock:v126];
    uint64_t v122 = 0;
    v123 = (double *)&v122;
    uint64_t v124 = 0x2020000000;
    uint64_t v125 = 0;
    uint64_t v118 = 0;
    v119 = (double *)&v118;
    uint64_t v120 = 0x2020000000;
    uint64_t v121 = 0;
    v31 = (void *)v190[5];
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_2;
    v117[3] = &unk_1E6B9A120;
    v117[4] = &v122;
    v117[5] = &v118;
    [v31 enumerateObjectsUsingBlock:v117];
    uint64_t v113 = 0;
    v114 = (int *)&v113;
    uint64_t v115 = 0x2020000000;
    LODWORD(v116) = 0;
    uint64_t v109 = 0;
    v110 = (int *)&v109;
    uint64_t v111 = 0x2020000000;
    int v112 = 0;
    v32 = (void *)v162[5];
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_3;
    v108[3] = &unk_1E6B9A120;
    v108[4] = &v113;
    v108[5] = &v109;
    [v32 enumerateObjectsUsingBlock:v108];
    v33 = [(RTStateTransitionOneTransPred *)v101 weekly];
    [v33 setYield:((double)(unint64_t)objc_msgSend((id)v196[5], "count")) / v24];

    double v34 = v132[3];
    double v35 = v34 / (double)(unint64_t)[(id)v196[5] count];
    if (v35 + -7200.0 >= 0.0) {
      double v36 = v35 + -7200.0;
    }
    else {
      double v36 = 0.0;
    }
    if ((unint64_t)[(id)v196[5] count] >= 3)
    {
      double v37 = sqrt(v128[3] / (double)(unint64_t)[(id)v196[5] count] - v35 * v35);
      if (v37 < 2700.0)
      {
        v38 = [(RTStateTransitionOneTransPred *)v101 weekly];
        [v38 setPredResidualStart_s:v36];

        v39 = [(RTStateTransitionOneTransPred *)v101 weekly];
        [v39 setResUncStart_s:v37];
      }
    }
    double v40 = v123[3];
    double v41 = v40 / (double)(unint64_t)[(id)v190[5] count];
    if (v41 + -7200.0 >= 0.0) {
      double v42 = v41 + -7200.0;
    }
    else {
      double v42 = 0.0;
    }
    if ((unint64_t)[(id)v190[5] count] >= 3)
    {
      double v43 = sqrt(v119[3] / (double)(unint64_t)[(id)v190[5] count] - v41 * v41);
      if (v43 < 2700.0)
      {
        v44 = [(RTStateTransitionOneTransPred *)v101 weekly];
        [v44 setPredResidualStop_s:v42];

        v45 = [(RTStateTransitionOneTransPred *)v101 weekly];
        [v45 setResUncStop_s:v43];
      }
    }
    v46 = [(RTStateTransitionOneTransPred *)v101 weekly];
    [v46 setNumOfTrans:[v196[5] count]];

    v47 = [(RTStateTransitionOneTransPred *)v101 weekly];
    [v47 setEarliestTransTimeStart_s:v176[3]];

    v48 = [(RTStateTransitionOneTransPred *)v101 weekly];
    [v48 setLatestTransTimeStart_s:v180[3]];

    v49 = [(RTStateTransitionOneTransPred *)v101 weekly];
    [v49 setDensity:(double)v114[6] / (double)v110[6]];

    v50 = [(RTStateTransitionOneTransPred *)v101 weekly];
    [v50 setMotionActivityType:-[RTStateTransitionMotionActivityTypeHistogram getDominantMotionActivityType](v28, "getDominantMotionActivityType")];
    v98 = v29;
    v51 = v28;
    id v52 = v27;
    id v53 = v26;
    id v54 = v25;

    v55 = [(id)v184[5] valueForKeyPath:@"@max.self"];
    v56 = +[RTStateModelAlgorithms bucketizeDates:v184[5] bucketInterval:v55 latestDate:7200.0];
    v57 = [v56 allValues];
    v58 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"numOfDates", &unk_1F3451C38];
    v59 = [v57 filteredArrayUsingPredicate:v58];

    v60 = [v59 valueForKeyPath:@"@min.averageDate"];
    v61 = [(RTStateTransitionOneTransPred *)v101 weekly];
    [v61 setPrimaryStopDate:v60];

    _Block_object_dispose(&v109, 8);
    _Block_object_dispose(&v113, 8);
    _Block_object_dispose(&v118, 8);
    _Block_object_dispose(&v122, 8);
    _Block_object_dispose(&v127, 8);
    _Block_object_dispose(&v131, 8);
    id v25 = v54;
    __int16 v22 = v100;
    id v26 = v53;
    id v27 = v52;
    v28 = v51;
    v29 = v98;
  }
  if ([(id)v214[5] count] && objc_msgSend((id)v208[5], "count"))
  {
    uint64_t v131 = 0;
    v132 = (double *)&v131;
    uint64_t v133 = 0x2020000000;
    uint64_t v134 = 0;
    uint64_t v127 = 0;
    v128 = (double *)&v127;
    uint64_t v129 = 0x2020000000;
    uint64_t v130 = 0;
    v62 = (void *)v214[5];
    v107[0] = MEMORY[0x1E4F143A8];
    v107[1] = 3221225472;
    v107[2] = __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_235;
    v107[3] = &unk_1E6B9A120;
    v107[4] = &v131;
    v107[5] = &v127;
    [v62 enumerateObjectsUsingBlock:v107];
    uint64_t v122 = 0;
    v123 = (double *)&v122;
    uint64_t v124 = 0x2020000000;
    uint64_t v125 = 0;
    uint64_t v118 = 0;
    v119 = (double *)&v118;
    uint64_t v120 = 0x2020000000;
    uint64_t v121 = 0;
    v63 = (void *)v208[5];
    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_2_236;
    v106[3] = &unk_1E6B9A120;
    v106[4] = &v122;
    v106[5] = &v118;
    [v63 enumerateObjectsUsingBlock:v106];
    uint64_t v113 = 0;
    v114 = (int *)&v113;
    uint64_t v115 = 0x2020000000;
    uint64_t v116 = 0;
    uint64_t v109 = 0;
    v110 = (int *)&v109;
    uint64_t v111 = 0x2020000000;
    int v112 = 0;
    v105[0] = 0;
    v105[1] = v105;
    v105[2] = 0x2020000000;
    v105[3] = 1;
    v103[0] = 0;
    v103[1] = v103;
    v103[2] = 0x2020000000;
    int v104 = 0;
    v64 = (void *)v156[5];
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_3_237;
    v102[3] = &unk_1E6B95950;
    v102[4] = v103;
    v102[5] = v105;
    v102[6] = &v113;
    v102[7] = &v109;
    [v64 enumerateObjectsUsingBlock:v102];
    v65 = [(RTStateTransitionOneTransPred *)v101 daily];
    [v65 setYield:((double)(unint64_t)[v214[5] count]) / v24 * 7.0];

    double v66 = v132[3];
    double v67 = v66 / (double)(unint64_t)[(id)v214[5] count];
    if (v67 + -7200.0 >= 0.0) {
      double v68 = v67 + -7200.0;
    }
    else {
      double v68 = 0.0;
    }
    if ((unint64_t)[(id)v214[5] count] >= 3)
    {
      double v69 = sqrt(v128[3] / (double)(unint64_t)[(id)v214[5] count] - v67 * v67);
      if (v69 < 2700.0)
      {
        v70 = [(RTStateTransitionOneTransPred *)v101 daily];
        [v70 setPredResidualStart_s:v68];

        v71 = [(RTStateTransitionOneTransPred *)v101 daily];
        [v71 setResUncStart_s:v69];
      }
    }
    double v72 = v123[3];
    double v73 = v72 / (double)(unint64_t)[(id)v208[5] count];
    if (v73 + -7200.0 >= 0.0) {
      double v74 = v73 + -7200.0;
    }
    else {
      double v74 = 0.0;
    }
    if ((unint64_t)[(id)v208[5] count] >= 3)
    {
      double v75 = sqrt(v119[3] / (double)(unint64_t)[(id)v208[5] count] - v73 * v73);
      if (v75 < 2700.0)
      {
        v76 = [(RTStateTransitionOneTransPred *)v101 daily];
        [v76 setPredResidualStop_s:v74];

        v77 = [(RTStateTransitionOneTransPred *)v101 daily];
        [v77 setResUncStop_s:v75];
      }
    }
    v78 = [(RTStateTransitionOneTransPred *)v101 daily];
    [v78 setNumOfTrans:[v214[5] count]];

    v79 = [(RTStateTransitionOneTransPred *)v101 daily];
    [v79 setEarliestTransTimeStart_s:v168[3]];

    v80 = [(RTStateTransitionOneTransPred *)v101 daily];
    [v80 setLatestTransTimeStart_s:v172[3]];

    v81 = [(RTStateTransitionOneTransPred *)v101 daily];
    [v81 setDensity:*((double *)v114 + 3) / (double)v110[6]];

    v82 = [(RTStateTransitionOneTransPred *)v101 daily];
    [v82 setMotionActivityType:-[RTStateTransitionMotionActivityTypeHistogram getDominantMotionActivityType](v29, "getDominantMotionActivityType")];
    v99 = v29;
    v83 = v28;
    id v84 = v27;
    id v85 = v26;
    v86 = v22;
    id v87 = v25;

    v88 = [(id)v202[5] valueForKeyPath:@"@max.self"];
    v89 = +[RTStateModelAlgorithms bucketizeDates:v202[5] bucketInterval:v88 latestDate:7200.0];
    v90 = [v89 allValues];
    v91 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"numOfDates", &unk_1F3451C38];
    v92 = [v90 filteredArrayUsingPredicate:v91];

    v93 = [v92 valueForKeyPath:@"@min.averageDate"];
    v94 = [(RTStateTransitionOneTransPred *)v101 daily];
    [v94 setPrimaryStopDate:v93];

    _Block_object_dispose(v103, 8);
    _Block_object_dispose(v105, 8);
    _Block_object_dispose(&v109, 8);
    _Block_object_dispose(&v113, 8);
    _Block_object_dispose(&v118, 8);
    _Block_object_dispose(&v122, 8);
    _Block_object_dispose(&v127, 8);
    _Block_object_dispose(&v131, 8);
    id v25 = v87;
    __int16 v22 = v86;
    id v26 = v85;
    id v27 = v84;
    v28 = v83;
    v29 = v99;
  }
  [(RTStateTransitionOneTransPred *)v101 setStateUUID:v22];

  _Block_object_dispose(&v155, 8);
  _Block_object_dispose(&v161, 8);

  _Block_object_dispose(&v167, 8);
  _Block_object_dispose(&v171, 8);
  _Block_object_dispose(&v175, 8);
  _Block_object_dispose(&v179, 8);

  _Block_object_dispose(&v183, 8);
  _Block_object_dispose(&v189, 8);

  _Block_object_dispose(&v195, 8);
  _Block_object_dispose(&v201, 8);

  _Block_object_dispose(&v207, 8);
  _Block_object_dispose(&v213, 8);

  return v101;
}

void __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 start_s];
  if (v4 > *(double *)(a1 + 168))
  {
    [v3 stop_s];
    if (v5 <= *(double *)(a1 + 176) + -7200.0)
    {
      [v3 start_s];
      double v7 = v6 - *(double *)(a1 + 168);
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9C8];
      [v3 start_s];
      uint64_t v9 = [v8 dateWithTimeIntervalSinceReferenceDate:];
      id v10 = (void *)MEMORY[0x1E4F1C9C8];
      [v3 stop_s];
      double v11 = [v10 dateWithTimeIntervalSinceReferenceDate:];
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v11];
      double v13 = +[RTStateModelAlgorithms adjustedDateInterval:v12 betweenMinDate:*(void *)(a1 + 32) maxDate:*(void *)(a1 + 40) strideDays:7];
      double v14 = v13;
      unint64_t v15 = 0x1E4F28000uLL;
      if (v13)
      {
        int v16 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        uint64_t v17 = NSNumber;
        __int16 v18 = [v13 startDate];
        [v18 timeIntervalSinceDate:*(void *)(a1 + 32)];
        uint64_t v19 = [v17 numberWithDouble:];
        [v16 addObject:v19];

        __int16 v20 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        uint64_t v21 = NSNumber;
        __int16 v22 = [v14 endDate];
        [v22 timeIntervalSinceDate:*(void *)(a1 + 32)];
        double v23 = [v21 numberWithDouble:];
        [v20 addObject:v23];

        double v24 = *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
        [v3 start_s];
        if (v24 < v25)
        {
          [v3 start_s];
          *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v26;
        }
        double v27 = *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
        [v3 start_s];
        if (v27 > v28)
        {
          [v3 start_s];
          *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v29;
        }
        v30 = [v14 endDate];
        int v31 = [v30 isOnOrAfter:*(void *)(a1 + 48)];

        if (v31)
        {
          v32 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
          v33 = [v14 endDate];
          [v32 addObject:v33];
        }
        [*(id *)(a1 + 56) addMotionActivityType:[v3 motionActivityType]];
        int v34 = (int)(v7 / 604800.0);
        if ([*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) count] <= (unint64_t)v34)
        {
          double v40 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            double v69 = "-[RTStateTransition getPredTrans:duration:numOfWeeks:uniqueID:]_block_invoke";
            __int16 v70 = 1024;
            int v71 = 587;
            _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "weekNum is out of bound - should not happen (in %s:%d)", buf, 0x12u);
          }
        }
        else
        {
          double v35 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
          double v36 = NSNumber;
          [v35 objectAtIndex:v34];
          v38 = double v37 = v9;
          v39 = [v36 numberWithInteger:[v38 integerValue] + 1];
          [v35 setObject:v39 atIndexedSubscript:v34];

          uint64_t v9 = v37;
          unint64_t v15 = 0x1E4F28000;
        }
      }
      double v41 = +[RTStateModelAlgorithms adjustedDateInterval:v12 betweenMinDate:*(void *)(a1 + 32) maxDate:*(void *)(a1 + 40) strideDays:1];
      double v42 = v41;
      if (v41)
      {
        double v67 = v9;
        double v43 = *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
        v44 = *(void **)(v15 + 3792);
        v45 = [v41 startDate];
        [v45 timeIntervalSinceDate:*(void *)(a1 + 32)];
        v46 = [v44 numberWithDouble:x0];
        [v43 addObject:v46];

        v47 = *(void **)(*(void *)(*(void *)(a1 + 128) + 8) + 40);
        v48 = *(void **)(v15 + 3792);
        v49 = [v42 endDate];
        [v49 timeIntervalSinceDate:*(void *)(a1 + 32)];
        v50 = [v48 numberWithDouble:x0];
        [v47 addObject:v50];

        double v51 = *(double *)(*(void *)(*(void *)(a1 + 136) + 8) + 24);
        [v3 start_s];
        if (v51 < v52)
        {
          [v3 start_s];
          *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = v53;
        }
        double v54 = *(double *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
        [v3 start_s];
        if (v54 > v55)
        {
          [v3 start_s];
          *(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) = v56;
        }
        unint64_t v57 = v15;
        v58 = [v42 endDate];
        int v59 = [v58 isOnOrAfter:*(void *)(a1 + 48)];

        if (v59)
        {
          v60 = *(void **)(*(void *)(*(void *)(a1 + 152) + 8) + 40);
          v61 = [v42 endDate];
          [v60 addObject:v61];
        }
        [*(id *)(a1 + 64) addMotionActivityType:[v3 motionActivityType]];
        int v62 = (int)(v7 / 86400.0);
        if ([*(id *)(*(void *)(*(void *)(a1 + 160) + 8) + 40) count] <= (unint64_t)v62)
        {
          v65 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            double v69 = "-[RTStateTransition getPredTrans:duration:numOfWeeks:uniqueID:]_block_invoke";
            __int16 v70 = 1024;
            int v71 = 622;
            _os_log_error_impl(&dword_1D9BFA000, v65, OS_LOG_TYPE_ERROR, "dayNum is out of bound - should not happen (in %s:%d)", buf, 0x12u);
          }
        }
        else
        {
          v63 = *(void **)(*(void *)(*(void *)(a1 + 160) + 8) + 40);
          v64 = *(void **)(v57 + 3792);
          v65 = [v63 objectAtIndex:v62];
          double v66 = [v64 numberWithInteger:-[NSObject integerValue](v65, "integerValue") + 1];
          [v63 setObject:v66 atIndexedSubscript:v62];
        }
        uint64_t v9 = v67;
      }
    }
  }
}

double __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_220(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  [v3 doubleValue];
  double v6 = v5;
  [v3 doubleValue];
  double v8 = v7;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)(v9 + 24) + v6 * v8;
  *(double *)(v9 + 24) = result;
  return result;
}

double __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  [v3 doubleValue];
  double v6 = v5;
  [v3 doubleValue];
  double v8 = v7;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)(v9 + 24) + v6 * v8;
  *(double *)(v9 + 24) = result;
  return result;
}

uint64_t __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = [a2 integerValue];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

double __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_235(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  [v3 doubleValue];
  double v6 = v5;
  [v3 doubleValue];
  double v8 = v7;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)(v9 + 24) + v6 * v8;
  *(double *)(v9 + 24) = result;
  return result;
}

double __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_2_236(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  [v3 doubleValue];
  double v6 = v5;
  [v3 doubleValue];
  double v8 = v7;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)(v9 + 24) + v6 * v8;
  *(double *)(v9 + 24) = result;
  return result;
}

uint64_t __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_3_237(void *a1, void *a2)
{
  uint64_t result = [a2 integerValue];
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) += result;
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * v5 + 0x1249249249249249) <= 0x2492492492492492)
  {
    *(double *)(*(void *)(a1[6] + 8) + 24) = (double)*(int *)(*(void *)(a1[4] + 8) + 24) / 7.0
                                                 + *(double *)(*(void *)(a1[6] + 8) + 24);
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = 0;
    ++*(_DWORD *)(*(void *)(a1[7] + 8) + 24);
    uint64_t v4 = *(void *)(a1[5] + 8);
    uint64_t v5 = *(void *)(v4 + 24);
  }
  *(void *)(v4 + 24) = v5 + 1;
  return result;
}

- (int64_t)count
{
  id v2 = [(RTStateTransition *)self listTransitions];
  int64_t v3 = [v2 count];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RTStateTransition *)self listTransitions];
  [v4 encodeObject:v5 forKey:@"listTransitions"];
}

- (RTStateTransition)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTStateTransition;
  id v5 = [(RTStateTransition *)&v11 init];
  if (v5)
  {
    double v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    double v8 = [v6 setWithObjects:v7, objc_opt_class(), 0];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"listTransitions"];
    [(RTStateTransition *)v5 setListTransitions:v9];
  }
  return v5;
}

- (NSMutableArray)listTransitions
{
  return self->_listTransitions;
}

- (void)setListTransitions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end