@interface MOEventPatternDetectorTrendDetectorMannKendall
+ (id)medianOf:(void *)a3;
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorTrendDetectorMannKendall)init;
- (id)extractTrendEventsFrom:(id)a3 withFeatures:(id)a4;
@end

@implementation MOEventPatternDetectorTrendDetectorMannKendall

- (MOEventPatternDetectorTrendDetectorMannKendall)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorTrendDetectorMannKendall;
  v2 = [(MOEventPatternDetectorTrendDetectorMannKendall *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_minimumFeatureNumberForTrend = 0;
    v2->_minimumValueOfFeatureMaximum = 0.0;
    v2->_minimumFeatureSlopeForTrend = 0.0;
    v4 = v2;
  }

  return v3;
}

- (id)extractTrendEventsFrom:(id)a3 withFeatures:(id)a4
{
  id v108 = a3;
  id v105 = a4;
  v106 = self;
  if (self->_minimumFeatureNumberForTrend)
  {
    id v99 = (id)objc_opt_new();
    v98 = [[MOPerformanceMeasurement alloc] initWithName:@"MOEventPatternDetectorTrendDetectorMannKendall" measureRecentPeak:0];
    [(MOPerformanceMeasurement *)v98 startSession];
    unint64_t v110 = 0;
    *(void *)&long long v6 = 134217984;
    long long v97 = v6;
    while (1)
    {
      if ((unint64_t)objc_msgSend(v108, "count", v97) <= v110)
      {
        [(MOPerformanceMeasurement *)v98 endSession];
        goto LABEL_91;
      }
      v7 = [v108 objectAtIndex:v110];
      v8 = [v105 objectAtIndex:v110];
      id v9 = [v8 count];
      v10 = [v8 valueForKeyPath:@"@max.doubleValue"];
      [v10 doubleValue];
      double v12 = v11;

      double v13 = (double)(unint64_t)v9;
      if ((double)(unint64_t)v9 >= (double)v106->_minimumFeatureNumberForTrend
        && v12 >= v106->_minimumValueOfFeatureMaximum)
      {
        break;
      }
LABEL_86:

      ++v110;
    }
    __p = 0;
    v126 = 0;
    v127 = 0;
    double v14 = v13 + -1.0;
    if (v13 + -1.0 <= 0.0)
    {
      int v16 = 0;
    }
    else
    {
      uint64_t v15 = 0;
      int v16 = 0;
      uint64_t v17 = 1;
      do
      {
        double v18 = (double)((int)v15 + 1);
        if (v18 < v13)
        {
          uint64_t v19 = v17;
          do
          {
            v20 = [v8 objectAtIndex:v15];
            [v20 doubleValue];
            double v22 = v21;

            v23 = [v8 objectAtIndex:v19];
            [v23 doubleValue];
            double v25 = v24;

            v26 = [v7 objectAtIndex:v15];
            v27 = [v7 objectAtIndex:v19];
            v28 = [v27 startDate];
            v29 = [v26 startDate];
            [v28 timeIntervalSinceDate:v29];
            double v31 = v30;

            if (v25 - v22 > 0.0) {
              ++v16;
            }
            int v32 = v25 - v22 < 0.0;
            double v33 = (v25 - v22) / (v31 / 60.0 / 60.0 / 24.0);
            v34 = v126;
            if (v126 >= v127)
            {
              v36 = (double *)__p;
              uint64_t v37 = ((char *)v126 - (unsigned char *)__p) >> 3;
              unint64_t v38 = v37 + 1;
              if ((unint64_t)(v37 + 1) >> 61) {
                std::vector<std::vector<double>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v39 = (char *)v127 - (unsigned char *)__p;
              if (((char *)v127 - (unsigned char *)__p) >> 2 > v38) {
                unint64_t v38 = v39 >> 2;
              }
              if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v40 = v38;
              }
              if (v40)
              {
                v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v127, v40);
                v36 = (double *)__p;
                v34 = v126;
              }
              else
              {
                v41 = 0;
              }
              v42 = (double *)&v41[8 * v37];
              double *v42 = v33;
              v35 = v42 + 1;
              while (v34 != v36)
              {
                uint64_t v43 = *((void *)v34-- - 1);
                *((void *)v42-- - 1) = v43;
              }
              __p = v42;
              v126 = v35;
              v127 = (double *)&v41[8 * v40];
              if (v36) {
                operator delete(v36);
              }
            }
            else
            {
              double *v126 = v33;
              v35 = v34 + 1;
            }
            v126 = v35;

            v16 -= v32;
            ++v19;
          }
          while ((double)(int)v19 < v13);
        }
        ++v17;
        ++v15;
      }
      while (v14 > v18);
    }
    v104 = +[MOEventPatternDetectorTrendDetectorMannKendall medianOf:&__p];
    id v103 = [objc_alloc((Class)NSCountedSet) initWithArray:v8];
    if ((double)(unint64_t)[v103 count] == v13)
    {
      double v44 = (v13 * 2.0 + 5.0) * (v14 * v13);
      if (v16)
      {
LABEL_34:
        double v45 = sqrt(v44 / 18.0);
        int v46 = v16 - 1;
        if (v16 < 1) {
          int v46 = v16 + 1;
        }
        double v47 = (double)v46 / v45;
        goto LABEL_50;
      }
    }
    else
    {
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v48 = v103;
      id v49 = [v48 countByEnumeratingWithState:&v121 objects:v132 count:16];
      if (v49)
      {
        uint64_t v50 = *(void *)v122;
        double v51 = 0.0;
        do
        {
          for (i = 0; i != v49; i = (char *)i + 1)
          {
            if (*(void *)v122 != v50) {
              objc_enumerationMutation(v48);
            }
            id v53 = [v48 countForObject:*(void *)(*((void *)&v121 + 1) + 8 * i)];
            if ((unint64_t)v53 >= 2) {
              double v51 = v51
            }
                  + ((double)(unint64_t)v53 + -1.0)
                  * (double)(unint64_t)v53
                  * ((double)(unint64_t)v53 * 2.0 + 5.0);
          }
          id v49 = [v48 countByEnumeratingWithState:&v121 objects:v132 count:16];
        }
        while (v49);
      }
      else
      {
        double v51 = 0.0;
      }

      double v44 = -(v51 - v14 * v13 * (v13 * 2.0 + 5.0));
      if (v16) {
        goto LABEL_34;
      }
    }
    double v47 = 0.0;
LABEL_50:
    double v54 = erfc(fabs(v47) * -0.707106781);
    if (v47 != 0.0 && v54 * -0.5 + 1.0 + v54 * -0.5 + 1.0 < 0.025)
    {
      [v104 doubleValue];
      if (fabs(v55) >= v106->_minimumFeatureSlopeForTrend)
      {
        v101 = [v7 objectAtIndex:[v7 count] - 1];
        v56 = [MOEvent alloc];
        v57 = +[NSUUID UUID];
        v58 = [v101 startDate];
        v59 = [v101 endDate];
        v60 = +[NSDate date];
        v100 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v56, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v57, v58, v59, v60, 5, [v101 category]);

        v61 = [v101 endDate];
        v62 = [v61 dateByAddingTimeInterval:2419200.0];
        [(MOEvent *)v100 setExpirationDate:v62];

        v112 = objc_opt_new();
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        id v63 = v7;
        id v64 = [v63 countByEnumeratingWithState:&v117 objects:v131 count:16];
        if (v64)
        {
          uint64_t v65 = *(void *)v118;
          do
          {
            for (j = 0; j != v64; j = (char *)j + 1)
            {
              if (*(void *)v118 != v65) {
                objc_enumerationMutation(v63);
              }
              v67 = [*(id *)(*((void *)&v117 + 1) + 8 * (void)j) eventIdentifier];
              v68 = [v67 UUIDString];
              [v112 addObject:v68];
            }
            id v64 = [v63 countByEnumeratingWithState:&v117 objects:v131 count:16];
          }
          while (v64);
        }

        v102 = objc_opt_new();
        [v102 setObject:&off_1002F75B0 forKeyedSubscript:@"kEventPatternType"];
        v69 = +[NSNumber numberWithUnsignedInteger:v106->_trendFeatureType];
        [v102 setObject:v69 forKeyedSubscript:@"kEventPatternTrendFeatureType"];

        [v102 setObject:v112 forKeyedSubscript:@"kEventPatternTrendEventIdentifierList"];
        [v104 doubleValue];
        v70 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v102 setObject:v70 forKeyedSubscript:@"kEventPatternTrendSlope"];

        v71 = +[NSNumber numberWithDouble:v13];
        [v102 setObject:v71 forKeyedSubscript:@"kEventPatternTrendNumFeatures"];

        if ([v101 category] == (id)10)
        {
          v72 = [v101 interactionScoredContact];
          v73 = [v72 contact];
          v74 = [v73 identifier];
          [v102 setObject:v74 forKeyedSubscript:@"kEventPatternInteractionScoredContactIdentifier"];
        }
        if ([v101 category] == (id)2)
        {
          v75 = [v101 workoutType];
          [v102 setObject:v75 forKeyedSubscript:@"kEventPatternOverallWorkoutType"];
        }
        v109 = objc_opt_new();
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        id obj = v63;
        id v76 = [obj countByEnumeratingWithState:&v113 objects:v130 count:16];
        if (v76)
        {
          uint64_t v77 = *(void *)v114;
          do
          {
            for (k = 0; k != v76; k = (char *)k + 1)
            {
              if (*(void *)v114 != v77) {
                objc_enumerationMutation(obj);
              }
              v79 = *(void **)(*((void *)&v113 + 1) + 8 * (void)k);
              if ([v79 category] == (id)2)
              {
                v80 = [v79 startDate];
                if (v80)
                {
                  v81 = [v79 endDate];
                  if (v81)
                  {
                    v82 = [v79 workoutType];
                    if (v82)
                    {
                      v83 = [v79 identifierFromProvider];
                      BOOL v84 = v83 == 0;

                      if (v84) {
                        continue;
                      }
                      v80 = objc_opt_new();
                      v85 = [v79 identifierFromProvider];
                      [v80 setObject:v85 forKey:@"kEventResourcePatternWorkoutIdentifierFromProvider"];

                      v86 = [v79 startDate];
                      [v86 timeIntervalSince1970];
                      v87 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                      [v80 setObject:v87 forKey:@"kEventResourcePatternWorkoutStartDate"];

                      v88 = [v79 endDate];
                      [v88 timeIntervalSince1970];
                      v89 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                      [v80 setObject:v89 forKey:@"kEventResourcePatternWorkoutEndDate"];

                      v90 = [v79 workoutEvent];
                      v91 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v90 isIndoors]);
                      [v80 setObject:v91 forKey:@"kEventResourcePatternWorkoutIsIndoors"];

                      v92 = [v79 workoutType];
                      [v80 setObject:v92 forKey:@"kEventResourcePatternWorkoutType"];

                      [v109 addObject:v80];
                    }
                    else
                    {
                    }
                  }
                }
              }
            }
            id v76 = [obj countByEnumeratingWithState:&v113 objects:v130 count:16];
          }
          while (v76);
        }

        if ([v109 count])
        {
          [v102 setObject:v109 forKeyedSubscript:@"kEventResourcePatternWorkoutInfoDictArray"];
          v93 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
          if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
          {
            id v94 = [v109 count];
            *(_DWORD *)buf = v97;
            id v129 = v94;
            _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "Mann Kendall identified %lu workouts", buf, 0xCu);
          }
        }
        [(MOEvent *)v100 setPatterns:v102];
        [v99 addObject:v100];
      }
    }

    if (__p)
    {
      v126 = (double *)__p;
      operator delete(__p);
    }
    goto LABEL_86;
  }
  v95 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  v98 = (MOPerformanceMeasurement *)v95;
  if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
    -[MOEventPatternDetectorTrendDetectorMannKendall extractTrendEventsFrom:withFeatures:](v95);
  }
  id v99 = 0;
LABEL_91:

  return v99;
}

+ (id)medianOf:(void *)a3
{
  v5 = (double *)*((void *)a3 + 1);
  long long v6 = *(double **)a3;
  uint64_t v7 = (uint64_t)v5 - *(void *)a3;
  unint64_t v8 = v7 >> 3;
  if (v7 >> 3)
  {
    if (v8 == 1)
    {
      double v9 = *v6;
    }
    else
    {
      unint64_t v11 = v8 >> 1;
      double v12 = &v6[v8 >> 1];
      if (v12 == v5)
      {
        double v13 = (char *)v5 - *(void *)a3;
      }
      else
      {
        std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(v6, v12, v5, v3);
        long long v6 = *(double **)a3;
        double v13 = (char *)(*((void *)a3 + 1) - *(void *)a3);
      }
      double v9 = v6[v11];
      if ((v13 & 8) == 0)
      {
        if ((unint64_t)v7 >= 0x10 && v11 != 1)
        {
          uint64_t v15 = v6 + 1;
          double v16 = *v6;
          uint64_t v17 = 8 * v11 - 8;
          double v18 = v6 + 1;
          do
          {
            double v19 = *v18++;
            double v20 = v19;
            if (v16 < v19)
            {
              double v16 = v20;
              long long v6 = v15;
            }
            uint64_t v15 = v18;
            v17 -= 8;
          }
          while (v17);
        }
        double v9 = (v9 + *v6) * 0.5;
      }
    }
    v10 = +[NSNumber numberWithDouble:v9];
  }
  else
  {
    v10 = &off_1002F9940;
  }

  return v10;
}

- (BOOL)configure:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5)
  {
    long long v6 = [v4 objectForKey:@"MinimumFeatureNumberForTrend"];

    if (v6)
    {
      uint64_t v7 = [v4 objectForKeyedSubscript:@"MinimumFeatureNumberForTrend"];
      self->_minimumFeatureNumberForTrend = [v7 intValue];
    }
    else
    {
      unint64_t v8 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTrendDetectorMannKendall configure:]();
      }
    }
    double v9 = [v4 objectForKey:@"MinimumValueOfFeatureMaximum"];

    if (v9)
    {
      v10 = [v4 objectForKeyedSubscript:@"MinimumValueOfFeatureMaximum"];
      [v10 doubleValue];
      self->_minimumValueOfFeatureMaximum = v11;
    }
    else
    {
      v10 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTrendDetectorMannKendall configure:]();
      }
    }

    double v12 = [v4 objectForKey:@"MinimumFeatureSlopeForTrend"];

    if (v12)
    {
      double v13 = [v4 objectForKeyedSubscript:@"MinimumFeatureSlopeForTrend"];
      [v13 doubleValue];
      self->_minimumFeatureSlopeForTrend = v14;
    }
    else
    {
      double v13 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTrendDetectorMannKendall configure:]();
      }
    }

    uint64_t v15 = [v4 objectForKey:@"MinimumFeatureSlopeForTrend"];

    if (v15)
    {
      double v16 = [v4 objectForKeyedSubscript:@"MinimumFeatureSlopeForTrend"];
      [v16 doubleValue];
      self->_minimumFeatureSlopeForTrend = v17;
    }
    else
    {
      double v16 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTrendDetectorMannKendall configure:]();
      }
    }

    double v18 = [v4 objectForKey:@"TrendFeatureType"];

    if (v18)
    {
      double v19 = [v4 objectForKeyedSubscript:@"TrendFeatureType"];
      self->_trendFeatureType = (int)[v19 intValue];
    }
    else
    {
      double v19 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[MOEventPatternDetectorTrendDetectorMannKendall configure:]();
      }
    }
  }
  return v5 != 0;
}

- (void)extractTrendEventsFrom:(os_log_t)log withFeatures:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Mann Kendall configuration not set", v1, 2u);
}

- (void)configure:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Configuration property not set for Mann Kendall Trend: %@", v2, v3, v4, v5, v6);
}

@end