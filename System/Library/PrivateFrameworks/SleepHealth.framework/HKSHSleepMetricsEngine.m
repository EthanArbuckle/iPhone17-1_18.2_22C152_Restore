@interface HKSHSleepMetricsEngine
+ (double)_timeIntervalForDate:(id)a3 sinceDate:(id)a4 calendar:(id)a5;
+ (id)_computeStandardDeviationFor:(id)a3;
+ (id)_dateComponentsForInterval:(double)a3 sinceDate:(id)a4 calendar:(id)a5;
+ (id)_firstAsleepSegment:(id)a3;
+ (id)_firstInBedSegment:(id)a3;
+ (id)_firstSegmentMatchingSleepValues:(id)a3 inPeriods:(id)a4;
+ (id)_lastAsleepSegment:(id)a3;
+ (id)_lastInBedSegment:(id)a3;
+ (id)_lastSegmentMatchingSleepValues:(id)a3 inPeriods:(id)a4;
+ (id)sleepMetricsForDaySummaries:(id)a3;
+ (id)sleepMetricsForDaySummaries:(id)a3 inMorningIndexRange:(id)a4;
- (HKSHSleepMetricsEngine)initWithHealthStore:(id)a3;
- (void)fetchSleepMetricsForMorningIndexRange:(id)a3 completion:(id)a4;
@end

@implementation HKSHSleepMetricsEngine

- (HKSHSleepMetricsEngine)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSHSleepMetricsEngine;
  v6 = [(HKSHSleepMetricsEngine *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_healthStore, a3);
  }

  return v7;
}

- (void)fetchSleepMetricsForMorningIndexRange:(id)a3 completion:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263F0A778]);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __75__HKSHSleepMetricsEngine_fetchSleepMetricsForMorningIndexRange_completion___block_invoke;
  v16 = &unk_264227F90;
  v17 = self;
  id v18 = v7;
  int64_t v19 = var0;
  int64_t v20 = var1;
  id v9 = v7;
  v10 = objc_msgSend(v8, "initWithMorningIndexRange:ascending:limit:options:resultsHandler:", var0, var1, 1, 0, 1, &v13);
  id v11 = objc_alloc(MEMORY[0x263F0A770]);
  v12 = objc_msgSend(v11, "initWithIdentifier:mode:", @"SleepMetricsEngine", 0, v13, v14, v15, v16, v17);
  [v10 setCacheSettings:v12];

  [v10 setDebugIdentifier:@"SleepMetricsEngine"];
  [(HKHealthStore *)self->_healthStore executeQuery:v10];
}

void __75__HKSHSleepMetricsEngine_fetchSleepMetricsForMorningIndexRange_completion___block_invoke(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  uint64_t v7 = a1[5];
  id v9 = v6;
  if (v6)
  {
    id v8 = objc_msgSend((id)objc_opt_class(), "sleepMetricsForDaySummaries:inMorningIndexRange:", v6, a1[6], a1[7]);
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 16))(v7, 0, a4);
  }
}

+ (id)sleepMetricsForDaySummaries:(id)a3
{
  return (id)objc_msgSend(a1, "sleepMetricsForDaySummaries:inMorningIndexRange:", a3, *MEMORY[0x263F094E8], *(void *)(MEMORY[0x263F094E8] + 8));
}

+ (id)sleepMetricsForDaySummaries:(id)a3 inMorningIndexRange:(id)a4
{
  uint64_t v241 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v161 = objc_alloc_init(MEMORY[0x263F089C8]);
  id v167 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v163 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v162 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v235 = 0u;
  long long v236 = 0u;
  long long v237 = 0u;
  long long v238 = 0u;
  obuint64_t j = v4;
  uint64_t v210 = [obj countByEnumeratingWithState:&v235 objects:v240 count:16];
  if (!v210)
  {
    uint64_t v205 = 0;
    v207 = 0;
    uint64_t v177 = 0;
    uint64_t v178 = 0;
    uint64_t v179 = 0;
    uint64_t v180 = 0;
    uint64_t v166 = 0;
    v185 = 0;
    uint64_t v186 = 0;
    uint64_t v195 = 0;
    uint64_t v197 = 0;
    uint64_t v201 = 0;
    uint64_t v203 = 0;
    uint64_t v199 = 0;
    double v170 = 0.0;
    double v171 = 0.0;
    double v172 = 0.0;
    double v173 = 0.0;
    double v174 = 0.0;
    double v175 = 0.0;
    double v187 = 0.0;
    double v188 = 0.0;
    v131 = obj;
    double v191 = 0.0;
    double v193 = 0.0;
    double v189 = 0.0;
    double v190 = 0.0;
    double v176 = 0.0;
    goto LABEL_103;
  }
  uint64_t v177 = 0;
  uint64_t v178 = 0;
  uint64_t v179 = 0;
  uint64_t v180 = 0;
  uint64_t v169 = 0;
  uint64_t v165 = 0;
  uint64_t v166 = 0;
  uint64_t v186 = 0;
  uint64_t v195 = 0;
  uint64_t v197 = 0;
  uint64_t v201 = 0;
  uint64_t v203 = 0;
  uint64_t v199 = 0;
  uint64_t v205 = 0;
  uint64_t v208 = *(void *)v236;
  double v170 = 0.0;
  double v171 = 0.0;
  double v172 = 0.0;
  double v173 = 0.0;
  double v174 = 0.0;
  double v175 = 0.0;
  BOOL v6 = a4.var0 == *MEMORY[0x263F094E8] && a4.var1 == *(void *)(MEMORY[0x263F094E8] + 8);
  BOOL v206 = v6;
  double v168 = 0.0;
  double v164 = 0.0;
  double v187 = 0.0;
  double v188 = 0.0;
  double v191 = 0.0;
  double v193 = 0.0;
  double v189 = 0.0;
  double v190 = 0.0;
  double v176 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v210; ++i)
    {
      if (*(void *)v236 != v208) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v235 + 1) + 8 * i);
      v223 = v7;
      if (!v206)
      {
        int64_t v8 = [v7 morningIndex];
        BOOL v9 = v8 >= a4.var0 && v8 - a4.var0 < a4.var1;
        uint64_t v7 = v223;
        if (!v9) {
          continue;
        }
      }
      [v7 sleepDuration];
      double v11 = v10;
      [v223 inBedDuration];
      double v13 = v12;
      [v223 remSleepDuration];
      double v15 = v14;
      [v223 coreSleepDuration];
      double v17 = v16;
      [v223 deepSleepDuration];
      double v19 = v18;
      [v223 unspecifiedSleepDuration];
      double v21 = v20;
      [v223 awakeDuration];
      double v23 = v22;
      if (v11 >= 2.22044605e-16 || v13 >= 2.22044605e-16)
      {
        if (v11 > 2.22044605e-16)
        {
          v25 = NSNumber;
          double v26 = __exp10(3.0);
          v27 = [v25 numberWithDouble:round(v11 * v26) / v26];
          [v167 addObject:v27];

          ++v180;
          double v176 = v176 + v11;
        }
        if (v13 <= 2.22044605e-16) {
          double v28 = -0.0;
        }
        else {
          double v28 = v13;
        }
        uint64_t v29 = v205;
        if (v13 > 2.22044605e-16) {
          uint64_t v29 = v205 + 1;
        }
        uint64_t v205 = v29;
        if (v15 <= 2.22044605e-16) {
          double v30 = -0.0;
        }
        else {
          double v30 = v15;
        }
        double v183 = v30;
        double v184 = v28;
        if (v15 <= 2.22044605e-16) {
          uint64_t v31 = v197;
        }
        else {
          uint64_t v31 = v197 + 1;
        }
        if (v17 <= 2.22044605e-16) {
          double v32 = -0.0;
        }
        else {
          double v32 = v17;
        }
        uint64_t v33 = v199;
        if (v17 > 2.22044605e-16) {
          uint64_t v33 = v199 + 1;
        }
        uint64_t v197 = v31;
        uint64_t v199 = v33;
        if (v19 > 2.22044605e-16)
        {
          uint64_t v34 = v201 + 1;
        }
        else
        {
          double v19 = -0.0;
          uint64_t v34 = v201;
        }
        BOOL v35 = v21 <= 2.22044605e-16;
        if (v21 <= 2.22044605e-16) {
          double v21 = -0.0;
        }
        uint64_t v36 = v203;
        if (!v35) {
          uint64_t v36 = v203 + 1;
        }
        uint64_t v201 = v34;
        uint64_t v203 = v36;
        BOOL v37 = v23 <= 2.22044605e-16;
        if (v23 <= 2.22044605e-16) {
          double v23 = -0.0;
        }
        uint64_t v38 = v195;
        if (!v37) {
          uint64_t v38 = v195 + 1;
        }
        uint64_t v195 = v38;
        v215 = [v223 primarySchedule];
        if (v215)
        {
          uint64_t v39 = [v223 morningIndex];
          v40 = [v223 calendar];
          v212 = [v215 bedtimeDateIntervalForMorningIndex:v39 calendar:v40];

          v220 = [v212 startDate];
          if (v220)
          {
            v41 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v220 duration:900.0];
            long long v234 = 0u;
            long long v232 = 0u;
            long long v233 = 0u;
            long long v231 = 0u;
            v42 = [v223 periods];
            uint64_t v43 = [v42 countByEnumeratingWithState:&v231 objects:v239 count:16];
            if (v43)
            {
              id v44 = 0;
              uint64_t v45 = *(void *)v232;
              while (2)
              {
                for (uint64_t j = 0; j != v43; ++j)
                {
                  if (*(void *)v232 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  v47 = *(void **)(*((void *)&v231 + 1) + 8 * j);
                  v48 = [v47 dateInterval];
                  int v49 = [v48 intersectsDateInterval:v41];

                  if (v49)
                  {
                    id v54 = v47;

                    ++v166;
                    id v44 = v54;
                    goto LABEL_68;
                  }
                  v50 = [v47 dateInterval];
                  v51 = [v50 startDate];
                  int v52 = objc_msgSend(v51, "hk_isAfterOrEqualToDate:", v220);
                  if (v44) {
                    int v53 = 0;
                  }
                  else {
                    int v53 = v52;
                  }

                  if (v53) {
                    id v44 = v47;
                  }
                }
                uint64_t v43 = [v42 countByEnumeratingWithState:&v231 objects:v239 count:16];
                if (v43) {
                  continue;
                }
                break;
              }
LABEL_68:

              if (v44)
              {
                v55 = [v44 dateInterval];
                v56 = [v55 startDate];
                [v56 timeIntervalSinceDate:v220];
                double v58 = v57;

                ++v165;
                double v164 = v164 + v58;
                goto LABEL_71;
              }
            }
            else
            {
              id v44 = v42;
LABEL_71:
            }
          }
          if (v212)
          {
            [v212 duration];
            if (v59 > 2.22044605e-16)
            {
              [v212 duration];
              double v61 = v60;
              double v62 = __exp10(3.0);
              double v63 = 0.0;
              if (v11 > 2.22044605e-16)
              {
                double v64 = __exp10(3.0);
                double v63 = round(v11 * v64) / v64;
              }
              double v65 = round(v61 * v62) / v62;
              double v66 = __exp10(3.0);
              v67 = [NSNumber numberWithDouble:v65];
              [v163 addObject:v67];

              v68 = [NSNumber numberWithDouble:round((v63 - v65) * v66) / v66];
              [v162 addObject:v68];
            }
          }
        }
        v69 = v223;
        if (v11 > 2.22044605e-16)
        {
          v70 = [v223 sleepDurationGoal];
          BOOL v71 = v70 == 0;

          if (!v71)
          {
            v72 = [v223 sleepDurationGoal];
            v73 = [MEMORY[0x263F0A830] secondUnit];
            [v72 doubleValueForUnit:v73];
            double v75 = v74;

            double v76 = v75 - v11;
            if (v76 < *(double *)&HKSHSleepDurationGoalLeeway) {
              objc_msgSend(v161, "hk_addDayIndex:", objc_msgSend(v223, "morningIndex"));
            }
            ++v169;
            double v168 = v168 + v76;
          }
          v69 = v223;
        }
        v77 = [v69 periods];
        v221 = [v77 firstObject];

        v78 = [v223 periods];
        v213 = [v78 lastObject];

        if (v221 && v213)
        {
          v79 = [v221 dateInterval];
          v80 = [v79 startDate];
          v81 = [v223 dateInterval];
          v82 = [v81 startDate];
          v83 = [v223 calendar];
          [a1 _timeIntervalForDate:v80 sinceDate:v82 calendar:v83];
          double v85 = v84;

          v86 = [v213 dateInterval];
          v87 = [v86 endDate];
          v88 = [v223 dateInterval];
          v89 = [v88 startDate];
          v90 = [v223 calendar];
          [a1 _timeIntervalForDate:v87 sinceDate:v89 calendar:v90];
          double v92 = v91;

          double v174 = v174 + v85;
          double v175 = v175 + v92;
          ++v179;
        }
        v93 = [v223 periods];
        v94 = [a1 _firstInBedSegment:v93];

        v95 = [v223 periods];
        v96 = [a1 _lastInBedSegment:v95];

        if (v94 && v96)
        {
          v97 = [v94 dateInterval];
          v98 = [v97 startDate];
          v99 = [v223 dateInterval];
          v100 = [v99 startDate];
          v101 = [v223 calendar];
          [a1 _timeIntervalForDate:v98 sinceDate:v100 calendar:v101];
          double v103 = v102;

          v104 = [v96 dateInterval];
          v105 = [v104 endDate];
          v106 = [v223 dateInterval];
          v107 = [v106 startDate];
          v108 = [v223 calendar];
          [a1 _timeIntervalForDate:v105 sinceDate:v107 calendar:v108];
          double v110 = v109;

          double v172 = v172 + v103;
          double v173 = v173 + v110;
          ++v178;
        }
        v111 = [v223 periods];
        v112 = [a1 _firstAsleepSegment:v111];

        v113 = [v223 periods];
        v114 = [a1 _lastAsleepSegment:v113];

        if (v112 && v114)
        {
          v115 = [v112 dateInterval];
          v116 = [v115 startDate];
          v117 = [v223 dateInterval];
          v118 = [v117 startDate];
          v119 = [v223 calendar];
          [a1 _timeIntervalForDate:v116 sinceDate:v118 calendar:v119];
          double v121 = v120;

          v122 = [v114 dateInterval];
          v123 = [v122 endDate];
          v124 = [v223 dateInterval];
          v125 = [v124 startDate];
          v126 = [v223 calendar];
          [a1 _timeIntervalForDate:v123 sinceDate:v125 calendar:v126];
          double v128 = v127;

          double v170 = v170 + v121;
          double v171 = v171 + v128;
          ++v177;
        }

        ++v186;
        double v188 = v188 + v184;
        double v189 = v189 + v183;
        double v190 = v190 + v32;
        double v191 = v191 + v19;
        double v193 = v193 + v21;
        double v187 = v187 + v23;
        continue;
      }
    }
    uint64_t v210 = [obj countByEnumeratingWithState:&v235 objects:v240 count:16];
  }
  while (v210);

  if (v165 < 1)
  {
    v207 = 0;
  }
  else
  {
    v129 = (void *)MEMORY[0x263F0A630];
    v130 = [NSNumber numberWithDouble:v164 / (double)v165];
    v207 = objc_msgSend(v129, "hk_quantityWithSeconds:", v130);
  }
  if (v169 < 1)
  {
    v185 = 0;
  }
  else
  {
    v132 = (void *)MEMORY[0x263F0A630];
    v131 = [NSNumber numberWithDouble:v168 / (double)v169];
    v185 = objc_msgSend(v132, "hk_quantityWithSeconds:", v131);
LABEL_103:
  }
  v224 = _HKSHSafeAverageDurationRoundedToNearestMinute(v180, v176);
  v222 = _HKSHSafeAverageDurationRoundedToNearestMinute(v205, v188);
  v219 = _HKSHSafeAverageDurationRoundedToNearestMinute(v197, v189);
  v216 = _HKSHSafeAverageDurationRoundedToNearestMinute(v199, v190);
  v214 = _HKSHSafeAverageDurationRoundedToNearestMinute(v201, v191);
  v211 = _HKSHSafeAverageDurationRoundedToNearestMinute(v203, v193);
  v209 = _HKSHSafeAverageDurationRoundedToNearestMinute(v195, v187);
  v204 = objc_msgSend(MEMORY[0x263F0A630], "hk_quantityWithSeconds:", v224);
  v202 = objc_msgSend(MEMORY[0x263F0A630], "hk_quantityWithSeconds:", v222);
  v200 = objc_msgSend(MEMORY[0x263F0A630], "hk_quantityWithSeconds:", v219);
  v198 = objc_msgSend(MEMORY[0x263F0A630], "hk_quantityWithSeconds:", v216);
  v196 = objc_msgSend(MEMORY[0x263F0A630], "hk_quantityWithSeconds:", v214);
  v194 = objc_msgSend(MEMORY[0x263F0A630], "hk_quantityWithSeconds:", v211);
  v192 = objc_msgSend(MEMORY[0x263F0A630], "hk_quantityWithSeconds:", v209);
  uint64_t v227 = 0;
  v228 = &v227;
  uint64_t v229 = 0x2020000000;
  uint64_t v230 = 0;
  v225[0] = MEMORY[0x263EF8330];
  v225[1] = 3221225472;
  v225[2] = __74__HKSHSleepMetricsEngine_sleepMetricsForDaySummaries_inMorningIndexRange___block_invoke;
  v225[3] = &unk_264227FB8;
  $0AC6E346AE4835514AAA8AC86D8F4844 v226 = a4;
  v225[4] = &v227;
  objc_msgSend(v161, "hk_enumerateDayIndexRangesWithOptions:usingBlock:", 2, v225);
  id v133 = a1;
  if (v179 < 1)
  {
    v139 = 0;
    v140 = 0;
  }
  else
  {
    v134 = [obj lastObject];
    v135 = [v134 calendar];

    v136 = [obj lastObject];
    v137 = [v136 dateInterval];
    v138 = [v137 startDate];

    v139 = [a1 _dateComponentsForInterval:v138 sinceDate:v135 calendar:v174 / (double)v179];
    v140 = [a1 _dateComponentsForInterval:v138 sinceDate:v135 calendar:v175 / (double)v179];

    id v133 = a1;
  }
  if (v178 < 1)
  {
    v146 = 0;
    v147 = 0;
  }
  else
  {
    v141 = [obj lastObject];
    v142 = [v141 calendar];

    v143 = [obj lastObject];
    v144 = [v143 dateInterval];
    v145 = [v144 startDate];

    v146 = [a1 _dateComponentsForInterval:v145 sinceDate:v142 calendar:v172 / (double)v178];
    v147 = [a1 _dateComponentsForInterval:v145 sinceDate:v142 calendar:v173 / (double)v178];

    id v133 = a1;
  }
  if (v177 < 1)
  {
    v153 = 0;
    v154 = 0;
  }
  else
  {
    v148 = [obj lastObject];
    v149 = [v148 calendar];

    v150 = [obj lastObject];
    v151 = [v150 dateInterval];
    v152 = [v151 startDate];

    v153 = [a1 _dateComponentsForInterval:v152 sinceDate:v149 calendar:v170 / (double)v177];
    v154 = [a1 _dateComponentsForInterval:v152 sinceDate:v149 calendar:v171 / (double)v177];

    id v133 = a1;
  }
  v155 = [v133 _computeStandardDeviationFor:v167];
  v156 = [v133 _computeStandardDeviationFor:v163];
  v157 = [v133 _computeStandardDeviationFor:v162];
  uint64_t v158 = [v161 count];
  +[HKSHSleepMetrics sleepMetricsWithMorningIndexRange:sleepAnalysisAsleepCount:sleepAnalysisInBedCount:sleepAnalysisCount:averageSleepDuration:averageInBedDuration:averageREMSleepDuration:averageCoreSleepDuration:averageDeepSleepDuration:averageUnspecifiedSleepDuration:averageAwakeDuration:bedtimeAchievedCount:sleepDurationGoalAchievedCount:sleepDurationGoalStreakCount:averageBedtimeMiss:averageSleepDurationGoalMiss:averageBedtime:averageWakeTime:averageInBedStartTime:averageInBedEndTime:averageSleepStartTime:averageSleepEndTime:standardDeviationActualTimeAsleep:standardDeviationScheduledTimeAsleep:standardDeviationActualVsScheduledTimeAsleep:](HKSHSleepMetrics, "sleepMetricsWithMorningIndexRange:sleepAnalysisAsleepCount:sleepAnalysisInBedCount:sleepAnalysisCount:averageSleepDuration:averageInBedDuration:averageREMSleepDuration:averageCoreSleepDuration:averageDeepSleepDuration:averageUnspecifiedSleepDuration:averageAwakeDuration:bedtimeAchievedCount:sleepDurationGoalAchievedCount:sleepDurationGoalStreakCount:averageBedtimeMiss:averageSleepDurationGoalMiss:averageBedtime:averageWakeTime:averageInBedStartTime:averageInBedEndTime:averageSleepStartTime:averageSleepEndTime:standardDeviationActualTimeAsleep:standardDeviationScheduledTimeAsleep:standardDeviationActualVsScheduledTimeAsleep:", a4.var0, a4.var1, v180, v205, v186, v204, v202, v200, v198, v196, v194, v192,
    v166,
    v158,
    v228[3],
    v207,
    v185,
    v139,
    v140,
    v146,
    v147,
    v153,
    v154,
    v155,
    v156,
  v159 = v157);

  _Block_object_dispose(&v227, 8);
  return v159;
}

void *__74__HKSHSleepMetricsEngine_sleepMetricsForDaySummaries_inMorningIndexRange___block_invoke(void *result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
  uint64_t v5 = result[5];
  uint64_t v4 = result[6];
  if (v5 == *MEMORY[0x263F094E8] && v4 == *(void *)(MEMORY[0x263F094E8] + 8)) {
    goto LABEL_11;
  }
  uint64_t v7 = a3 + a2 - 1;
  if (a3 <= 0) {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v8 = v5 + v4 - 1;
  uint64_t v9 = v4 <= 0 ? 0x7FFFFFFFFFFFFFFFLL : v8;
  if (v7 == v9) {
LABEL_11:
  }
    *(void *)(*(void *)(result[4] + 8) + 24) = a3;
  return result;
}

+ (double)_timeIntervalForDate:(id)a3 sinceDate:(id)a4 calendar:(id)a5
{
  id v6 = a4;
  [a3 timeIntervalSinceReferenceDate];
  double v8 = v7;
  [v6 timeIntervalSinceReferenceDate];
  double v10 = v9;

  return v8 - v10;
}

+ (id)_dateComponentsForInterval:(double)a3 sinceDate:(id)a4 calendar:(id)a5
{
  uint64_t v6 = (uint64_t)a3;
  id v7 = a5;
  double v8 = [v7 dateByAddingUnit:128 value:v6 toDate:a4 options:0];
  double v9 = [v7 components:224 fromDate:v8];

  return v9;
}

+ (id)_firstInBedSegment:(id)a3
{
  return (id)[a1 _firstSegmentMatchingSleepValues:&unk_26C599028 inPeriods:a3];
}

+ (id)_lastInBedSegment:(id)a3
{
  return (id)[a1 _lastSegmentMatchingSleepValues:&unk_26C599040 inPeriods:a3];
}

+ (id)_firstAsleepSegment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _HKCategoryValueSleepAnalysisAsleepValues();
  uint64_t v6 = [a1 _firstSegmentMatchingSleepValues:v5 inPeriods:v4];

  return v6;
}

+ (id)_lastAsleepSegment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _HKCategoryValueSleepAnalysisAsleepValues();
  uint64_t v6 = [a1 _lastSegmentMatchingSleepValues:v5 inPeriods:v4];

  return v6;
}

+ (id)_firstSegmentMatchingSleepValues:(id)a3 inPeriods:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = a4;
  uint64_t v21 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v7 = *(void *)v28;
    double v22 = v6;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v6);
        }
        double v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        double v10 = [v9 segments];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v24;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v10);
              }
              double v15 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              double v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "category"));
              char v17 = [v5 containsObject:v16];

              if (v17)
              {
                id v18 = v15;

                id v6 = v22;
                goto LABEL_19;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        id v6 = v22;
        uint64_t v7 = v20;
      }
      id v18 = 0;
      uint64_t v21 = [v22 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }
  else
  {
    id v18 = 0;
  }
LABEL_19:

  return v18;
}

+ (id)_lastSegmentMatchingSleepValues:(id)a3 inPeriods:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = a4;
  uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  id v6 = 0;
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v7;
        double v8 = *(void **)(*((void *)&v27 + 1) + 8 * v7);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        double v9 = [v8 segments];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v9);
              }
              double v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              double v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "category"));
              int v16 = [v5 containsObject:v15];

              if (v16)
              {
                id v17 = v14;

                id v6 = v17;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v11);
        }

        uint64_t v7 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }

  return v6;
}

+ (id)_computeStandardDeviationFor:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    unint64_t v4 = [v3 count];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    double v7 = 0.0;
    double v8 = 0.0;
    if (v6)
    {
      uint64_t v9 = v6;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * i) doubleValue];
          double v8 = v8 + v12;
        }
        uint64_t v9 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }
    double v13 = (double)v4;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v5;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      double v7 = 0.0;
      double v18 = v8 / v13;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "doubleValue", (void)v23);
          double v7 = v7 + (v18 - v20) * (v18 - v20);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v16);
    }

    uint64_t v21 = [NSNumber numberWithDouble:sqrt(v7 / (v13 + -1.0))];
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
}

@end