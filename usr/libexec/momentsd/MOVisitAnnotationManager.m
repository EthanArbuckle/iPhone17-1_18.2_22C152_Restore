@interface MOVisitAnnotationManager
+ (void)scoreVisitBundleAssets:(id)a3;
- (BOOL)containTargetAOIInGroup:(id)a3;
- (BOOL)isGroupingEligibleForEvent:(id)a3;
- (BOOL)likelySamePlaceCheckForEvent:(id)a3 otherEvent:(id)a4;
- (BOOL)likelySamePlaceCheckForEvent:(id)a3 otherEvents:(id)a4;
- (BOOL)samePlaceCheckForEvent:(id)a3 otherEvent:(id)a4;
- (BOOL)snapableEvent:(id)a3;
- (MOConfigurationManager)configurationManager;
- (MOVisitAnnotationManager)initWithUniverse:(id)a3;
- (RTRoutineManager)routineManager;
- (double)aoiMergingRangeMinimumThreshold;
- (double)aoiRangeWeight;
- (double)aoiVisitLabelConfidentThreshold;
- (double)distanceThresholdDefault;
- (double)distanceThresholdForCoarseGroup;
- (double)distanceThresholdWithSamePlaceName;
- (double)emotionAttachmentBundleDurationThreshold;
- (double)largeAoiMergingRangeMinimumThreshold;
- (double)recommendedTabVisitFIThreshold;
- (double)timeIntervalThresholdDefault;
- (double)timeIntervalThresholdForCoarseGroup;
- (double)timeIntervalThresholdWithSamePlaceName;
- (double)visitLabelHighConfidenceThreshold;
- (double)visitLabelMediumConfidenceThreshold;
- (id)actionFromBaseEvents:(id)a3;
- (id)annotateBaseEvents:(id)a3 contextEvents:(id)a4;
- (id)applyAOIBasedGroupingOnEvents:(id)a3;
- (id)applyNameBasedGroupingOnEvents:(id)a3;
- (id)buildPromptDescriptionForEventBundle:(id)a3;
- (id)getBaseEvents:(id)a3;
- (id)getContextEventsForBaseEvents:(id)a3 events:(id)a4 withPatternEvents:(id)a5;
- (id)groupBaseEvents:(id)a3;
- (id)placeFromBaseEvents:(id)a3 action:(id)a4;
- (id)postprocessGroupedEvents:(id)a3;
- (id)predominantWeatherFromBaseEvents:(id)a3;
- (id)preprocessEvents:(id)a3;
- (id)resourcesFromBaseEvents:(id)a3;
- (void)printGroupedEvents:(id)a3 tag:(id)a4;
- (void)readParametersWithConfigurationManager:(id)a3;
- (void)setAoiMergingRangeMinimumThreshold:(double)a3;
- (void)setAoiRangeWeight:(double)a3;
- (void)setAoiVisitLabelConfidentThreshold:(double)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setDistanceThresholdDefault:(double)a3;
- (void)setDistanceThresholdForCoarseGroup:(double)a3;
- (void)setDistanceThresholdWithSamePlaceName:(double)a3;
- (void)setEmotionAttachmentBundleDurationThreshold:(double)a3;
- (void)setLargeAoiMergingRangeMinimumThreshold:(double)a3;
- (void)setRecommendedTabVisitFIThreshold:(double)a3;
- (void)setRoutineManager:(id)a3;
- (void)setTimeIntervalThresholdDefault:(double)a3;
- (void)setTimeIntervalThresholdForCoarseGroup:(double)a3;
- (void)setTimeIntervalThresholdWithSamePlaceName:(double)a3;
- (void)setVisitLabelHighConfidenceThreshold:(double)a3;
- (void)setVisitLabelMediumConfidenceThreshold:(double)a3;
- (void)transferPlaceForEvent:(id)a3 landmarkEvent:(id)a4;
- (void)updateActionWithBaseEvents:(id)a3 contextEvents:(id)a4 eventBundle:(id)a5;
@end

@implementation MOVisitAnnotationManager

- (MOVisitAnnotationManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MOVisitAnnotationManager;
  v5 = [(MOTimeContextAnnotationManager *)&v38 initWithUniverse:v4];
  if (v5)
  {
    v43[0] = GEOPOICategoryATM;
    v43[1] = GEOPOICategoryEVCharger;
    v43[2] = GEOPOICategoryParking;
    v43[3] = GEOPOICategoryPublicTransport;
    v43[4] = GEOPOICategoryRestroom;
    v6 = +[NSArray arrayWithObjects:v43 count:5];
    uint64_t v7 = +[NSSet setWithArray:v6];
    lessInterestingPoiCategories = v5->_lessInterestingPoiCategories;
    v5->_lessInterestingPoiCategories = (NSSet *)v7;

    uint64_t v37 = GEOPOICategoryAirport;
    v42[0] = GEOPOICategoryAirport;
    v42[1] = GEOPOICategoryAirportGate;
    v42[2] = GEOPOICategoryAirportTerminal;
    v9 = +[NSArray arrayWithObjects:v42 count:3];
    uint64_t v10 = +[NSSet setWithArray:v9];
    flightPoiCategories = v5->_flightPoiCategories;
    v5->_flightPoiCategories = (NSSet *)v10;

    uint64_t v12 = GEOPOICategoryAmusementPark;
    uint64_t v13 = GEOPOICategoryAquarium;
    v41[0] = GEOPOICategoryAmusementPark;
    v41[1] = GEOPOICategoryAquarium;
    uint64_t v14 = GEOPOICategoryBeach;
    v41[2] = GEOPOICategoryBakery;
    v41[3] = GEOPOICategoryBeach;
    v41[4] = GEOPOICategoryBrewery;
    v41[5] = GEOPOICategoryCafe;
    v41[6] = GEOPOICategoryMarina;
    v41[7] = GEOPOICategoryMovieTheater;
    v41[8] = GEOPOICategoryMuseum;
    v41[9] = GEOPOICategoryNationalPark;
    uint64_t v15 = GEOPOICategoryPark;
    v41[10] = GEOPOICategoryNightlife;
    v41[11] = GEOPOICategoryPark;
    v41[12] = GEOPOICategoryPlayground;
    v41[13] = GEOPOICategoryRestaurant;
    v41[14] = GEOPOICategoryStadium;
    v41[15] = GEOPOICategoryTheater;
    uint64_t v16 = GEOPOICategoryWinery;
    uint64_t v17 = GEOPOICategoryZoo;
    v41[16] = GEOPOICategoryWinery;
    v41[17] = GEOPOICategoryZoo;
    v18 = +[NSArray arrayWithObjects:v41 count:18];
    uint64_t v19 = +[NSSet setWithArray:v18];
    outingEligiblePoiCategories = v5->_outingEligiblePoiCategories;
    v5->_outingEligiblePoiCategories = (NSSet *)v19;

    v40[0] = v37;
    v40[1] = v12;
    v40[2] = v13;
    v40[3] = v14;
    v40[4] = GEOPOICategoryGolf;
    v40[5] = v15;
    v40[6] = GEOPOICategorySkiing;
    v40[7] = v16;
    v40[8] = v17;
    v21 = +[NSArray arrayWithObjects:v40 count:9];
    uint64_t v22 = +[NSSet setWithArray:v21];
    AOIGroupingEligiblePoiCategories = v5->_AOIGroupingEligiblePoiCategories;
    v5->_AOIGroupingEligiblePoiCategories = (NSSet *)v22;

    uint64_t v39 = v14;
    v24 = +[NSArray arrayWithObjects:&v39 count:1];
    uint64_t v25 = +[NSSet setWithArray:v24];
    largeAOICategories = v5->_largeAOICategories;
    v5->_largeAOICategories = (NSSet *)v25;

    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    v29 = [v4 getService:v28];

    uint64_t v30 = [v29 routineManager];
    routineManager = v5->_routineManager;
    v5->_routineManager = (RTRoutineManager *)v30;

    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    uint64_t v34 = [v4 getService:v33];
    configurationManager = v5->_configurationManager;
    v5->_configurationManager = (MOConfigurationManager *)v34;

    [(MOVisitAnnotationManager *)v5 readParametersWithConfigurationManager:v5->_configurationManager];
  }

  return v5;
}

- (void)readParametersWithConfigurationManager:(id)a3
{
  id v4 = a3;
  *(float *)&double v5 = 0.9;
  [v4 getFloatSettingForKey:@"VA_VisitLabelMediumConfidenceThreshold" withFallback:v5];
  self->_visitLabelMediumConfidenceThreshold = v6;
  HIDWORD(v7) = 1072588390;
  *(float *)&double v7 = 0.95;
  [v4 getFloatSettingForKey:@"VA_VisitLabelHighConfidenceThreshold" withFallback:v7];
  self->_visitLabelHighConfidenceThreshold = v8;
  HIDWORD(v9) = 1071644672;
  *(float *)&double v9 = 0.5;
  [v4 getFloatSettingForKey:@"VA_AOIVisitLabelConfidentThreshold" withFallback:v9];
  double v11 = v10;
  self->_aoiVisitLabelConfidentThreshold = v11;
  LODWORD(v11) = 1133903872;
  [v4 getFloatSettingForKey:@"VA_AdjacentVisitEventInterval" withFallback:v11];
  double v13 = v12;
  self->_timeIntervalThresholdDefault = v13;
  LODWORD(v13) = 1109393408;
  [v4 getFloatSettingForKey:@"VA_AdjacentVisitEventMaximumDistanceKeyword" withFallback:v13];
  double v15 = v14;
  self->_distanceThresholdDefault = v15;
  LODWORD(v15) = 1163984896;
  [v4 getFloatSettingForKey:@"VA_AdjacentVisitEventWithTheSamePlaceNameInterval" withFallback:v15];
  double v17 = v16;
  self->_timeIntervalThresholdWithSamePlaceName = v17;
  LODWORD(v17) = -1.0;
  [v4 getFloatSettingForKey:@"VA_AdjacentVisitEventWithTheSamePlaceNameMaximumDistance" withFallback:v17];
  double v19 = v18;
  self->_distanceThresholdWithSamePlaceName = v19;
  LODWORD(v19) = 1177075712;
  [v4 getFloatSettingForKey:@"VA_kMOCoarseGroupingTimeIntervalKeyword" withFallback:v19];
  double v21 = v20;
  self->_timeIntervalThresholdForCoarseGroup = v21;
  LODWORD(v21) = 1161527296;
  [v4 getFloatSettingForKey:@"VA_kMOCoarseGroupingDistanceKeyword" withFallback:v21];
  double v23 = v22;
  self->_distanceThresholdForCoarseGroup = v23;
  LODWORD(v23) = 1.5;
  [v4 getFloatSettingForKey:@"VA_kMOAOIRangeWeightKeyword" withFallback:v23];
  double v25 = v24;
  self->_aoiRangeWeight = v25;
  LODWORD(v25) = 1142292480;
  [v4 getFloatSettingForKey:@"VA_kMOAOIMergingRangeMinimumThresholdKeyword" withFallback:v25];
  double v27 = v26;
  self->_aoiMergingRangeMinimumThreshold = v27;
  LODWORD(v27) = 1150681088;
  [v4 getFloatSettingForKey:@"VA_kMOLargeAOIMergingRangeMinimumThresholdKeyword" withFallback:v27];
  self->_largeAoiMergingRangeMinimumThreshold = v28;
  HIDWORD(v29) = 1072483532;
  *(float *)&double v29 = 0.9;
  [v4 getFloatSettingForKey:@"VA_RecommendedTabVisitFIThreshold" withFallback:v29];
  double v31 = v30;
  self->_recommendedTabVisitFIThreshold = v31;
  LODWORD(v31) = 1180762112;
  [v4 getFloatSettingForKey:@"EmotionAttachmentOutingBundleDurationThreshold" withFallback:v31];
  float v33 = v32;

  self->_emotionAttachmentBundleDurationThreshold = v33;
}

- (id)getBaseEvents:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 1];
  double v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (id)groupBaseEvents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    double v5 = [(MOVisitAnnotationManager *)self preprocessEvents:v4];
    float v6 = [(MOVisitAnnotationManager *)self postprocessGroupedEvents:v5];
  }
  else
  {
    float v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)preprocessEvents:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    id v55 = &__NSArray0__struct;
    goto LABEL_41;
  }
  double v5 = [(MOAnnotationManager *)self fUniverse];
  float v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  float v8 = [v5 getService:v7];

  id v84 = v4;
  double v9 = +[NSArray arrayWithObjects:&v84 count:1];
  [(MOVisitAnnotationManager *)self printGroupedEvents:v9 tag:@"input events"];

  v63 = objc_opt_new();
  float v10 = objc_opt_new();
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v61 = v4;
  id obj = v4;
  id v66 = [obj countByEnumeratingWithState:&v67 objects:v83 count:16];
  id v11 = 0;
  if (!v66) {
    goto LABEL_35;
  }
  uint64_t v65 = *(void *)v68;
  v62 = v8;
  do
  {
    float v12 = 0;
    do
    {
      if (*(void *)v68 != v65) {
        objc_enumerationMutation(obj);
      }
      double v13 = *(void **)(*((void *)&v67 + 1) + 8 * (void)v12);
      [(MOVisitAnnotationManager *)self timeIntervalThresholdForCoarseGroup];
      double v15 = v14;
      [(MOVisitAnnotationManager *)self distanceThresholdForCoarseGroup];
      double v17 = v16;
      uint64_t v18 = [v11 endDate];
      double v19 = 0.0;
      double v20 = 0.0;
      if (v18)
      {
        double v21 = (void *)v18;
        float v22 = [v13 startDate];

        if (v22)
        {
          double v23 = [v13 startDate];
          float v24 = [v11 endDate];
          [v23 timeIntervalSinceDate:v24];
          double v20 = v25;

          if (v20 < 0.0) {
            double v20 = -v20;
          }
        }
      }
      float v26 = [v11 routineEvent];
      uint64_t v27 = [v26 location];
      if (!v27) {
        goto LABEL_14;
      }
      float v28 = (void *)v27;
      double v29 = [v13 routineEvent];
      float v30 = [v29 location];

      if (v30)
      {
        float v26 = [v11 routineEvent];
        double v31 = [v26 location];
        float v32 = [v13 routineEvent];
        float v33 = [v32 location];
        [v31 distanceFromLocation:v33];
        double v19 = v34;

LABEL_14:
      }
      if (v20 > v15 || v19 > v17)
      {
        if ([v10 count]) {
          [v63 addObject:v10];
        }
        v47 = objc_opt_new();

        [v47 addObject:v13];
        uint64_t v39 = v11;
        id v11 = v13;
        float v10 = v47;
      }
      else
      {
        uint64_t v35 = [v11 endDate];
        if (!v35) {
          goto LABEL_23;
        }
        v36 = (void *)v35;
        uint64_t v37 = [v13 startDate];

        if (!v37 || !v8) {
          goto LABEL_23;
        }
        objc_super v38 = [v11 endDate];
        uint64_t v39 = [v8 timeZoneAtDate:v38];

        v40 = [v13 startDate];
        v41 = [v8 timeZoneAtDate:v40];

        id v42 = [v39 secondsFromGMT];
        if (v42 == [v41 secondsFromGMT])
        {
          v43 = [v13 startDate];
          v44 = [v11 endDate];
          unsigned __int8 v45 = [v43 isSameDayWithDate:v44 timeZone:v39];

          if (v45)
          {

            float v8 = v62;
LABEL_23:
            [v10 addObject:v13];
            v46 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              v50 = (objc_class *)objc_opt_class();
              v51 = NSStringFromClass(v50);
              v52 = [v13 eventIdentifier];
              *(_DWORD *)buf = 138413570;
              v72 = v51;
              __int16 v73 = 2112;
              id v74 = v52;
              __int16 v75 = 2048;
              double v76 = v20;
              __int16 v77 = 2048;
              double v78 = v19;
              __int16 v79 = 2048;
              double v80 = v15;
              __int16 v81 = 2048;
              double v82 = v17;
              _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%@: Coarse grouping the base events, add event, %@, interval, %f, distacne, %f, intervalThreshold, %f, distanceThreshold, %f", buf, 0x3Eu);
            }
            uint64_t v39 = v11;
            id v11 = v13;
            goto LABEL_29;
          }
        }
        if ([v10 count]) {
          [v63 addObject:v10];
        }
        v48 = +[NSMutableArray arrayWithObject:v13];
        [v63 addObject:v48];

        uint64_t v49 = objc_opt_new();
        id v11 = 0;
        float v10 = (void *)v49;
        float v8 = v62;
      }
LABEL_29:

      float v12 = (char *)v12 + 1;
    }
    while (v66 != v12);
    id v53 = [obj countByEnumeratingWithState:&v67 objects:v83 count:16];
    id v66 = v53;
  }
  while (v53);
LABEL_35:

  if ([v10 count]) {
    [v63 addObject:v10];
  }
  v54 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    v57 = (objc_class *)objc_opt_class();
    v58 = NSStringFromClass(v57);
    id v59 = [obj count];
    id v60 = [v63 count];
    *(_DWORD *)buf = 138412802;
    v72 = v58;
    __int16 v73 = 2048;
    id v74 = v59;
    __int16 v75 = 2048;
    double v76 = *(double *)&v60;
    _os_log_debug_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "%@: preprocessEvents, input events, %lu, output groups, %lu", buf, 0x20u);
  }
  [(MOVisitAnnotationManager *)self printGroupedEvents:v63 tag:@"preprocessed events"];
  id v55 = v63;

  id v4 = v61;
LABEL_41:

  return v55;
}

- (void)printGroupedEvents:(id)a3 tag:(id)a4
{
  id v5 = a3;
  id v28 = a4;
  float v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[MOVisitAnnotationManager printGroupedEvents:tag:]((uint64_t)v28, v5, v6);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v5;
  id v25 = [obj countByEnumeratingWithState:&v33 objects:v48 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v34;
    uint64_t v7 = 1;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v8;
        double v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
        float v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          id v22 = [v9 count];
          *(_DWORD *)buf = 138413058;
          id v38 = v28;
          __int16 v39 = 2112;
          CFStringRef v40 = &stru_1002D2AC8;
          __int16 v41 = 2048;
          uint64_t v42 = v7;
          __int16 v43 = 2048;
          id v44 = v22;
          _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@: %@ group-%lu, count, %lu", buf, 0x2Au);
        }
        uint64_t v27 = v7;

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v11 = v9;
        id v12 = [v11 countByEnumeratingWithState:&v29 objects:v47 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v30;
          do
          {
            double v15 = 0;
            do
            {
              if (*(void *)v30 != v14) {
                objc_enumerationMutation(v11);
              }
              double v16 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v15);
              double v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v18 = [v16 routineEvent];
                double v19 = [v18 placeName];
                double v20 = [v16 startDate];
                double v21 = [v16 endDate];
                *(_DWORD *)buf = 138413314;
                id v38 = v28;
                __int16 v39 = 2112;
                CFStringRef v40 = @"   ";
                __int16 v41 = 2112;
                uint64_t v42 = (uint64_t)v19;
                __int16 v43 = 2112;
                id v44 = v20;
                __int16 v45 = 2112;
                v46 = v21;
                _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@: %@ placeName, %@, start, %@, end, %@, ", buf, 0x34u);
              }
              double v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            id v13 = [v11 countByEnumeratingWithState:&v29 objects:v47 count:16];
          }
          while (v13);
        }

        uint64_t v7 = v27 + 1;
        uint64_t v8 = v26 + 1;
      }
      while ((id)(v26 + 1) != v25);
      id v25 = [obj countByEnumeratingWithState:&v33 objects:v48 count:16];
    }
    while (v25);
  }
}

- (id)postprocessGroupedEvents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v33 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (!v7) {
      goto LABEL_25;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v41;
    while (1)
    {
      float v10 = 0;
      do
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v10);
        if (objc_msgSend(v11, "count", v33))
        {
          if ([(MOVisitAnnotationManager *)self containTargetAOIInGroup:v11])
          {
            id v12 = [(MOVisitAnnotationManager *)self applyAOIBasedGroupingOnEvents:v11];
            if ([v12 count])
            {
              [v5 addObjectsFromArray:v12];
              id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v14 = (objc_class *)objc_opt_class();
                uint64_t v38 = NSStringFromClass(v14);
                id v36 = [v11 count];
                id v34 = [v12 count];
                id v15 = [v12 count];
                id v16 = [v11 count];
                *(_DWORD *)buf = 138413058;
                CFStringRef v17 = @"NO";
                if (v15 < v16) {
                  CFStringRef v17 = @"YES";
                }
                uint64_t v18 = (void *)v38;
                uint64_t v45 = v38;
                __int16 v46 = 2048;
                id v47 = v36;
                __int16 v48 = 2048;
                id v49 = v34;
                __int16 v50 = 2112;
                CFStringRef v51 = v17;
                double v19 = v13;
                double v20 = "%@: applyAOIBasedGroupingOnEvents: input events, %lu, output groups, %lu, isGrouped, %@";
                goto LABEL_23;
              }
              goto LABEL_16;
            }
          }
          else
          {
            id v12 = [(MOVisitAnnotationManager *)self applyNameBasedGroupingOnEvents:v11];
            if ([v12 count])
            {
              [v5 addObjectsFromArray:v12];
              id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                double v21 = (objc_class *)objc_opt_class();
                uint64_t v39 = NSStringFromClass(v21);
                id v37 = [v11 count];
                id v35 = [v12 count];
                id v22 = [v12 count];
                id v23 = [v11 count];
                *(_DWORD *)buf = 138413058;
                CFStringRef v24 = @"NO";
                if (v22 < v23) {
                  CFStringRef v24 = @"YES";
                }
                uint64_t v18 = (void *)v39;
                uint64_t v45 = v39;
                __int16 v46 = 2048;
                id v47 = v37;
                __int16 v48 = 2048;
                id v49 = v35;
                __int16 v50 = 2112;
                CFStringRef v51 = v24;
                double v19 = v13;
                double v20 = "%@: applyNameBasedGroupingOnEvents: input events, %lu, output groups, %lu, isGrouped, %@";
LABEL_23:
                _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v20, buf, 0x2Au);
              }
LABEL_16:
            }
          }
        }
        float v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v25 = [v6 countByEnumeratingWithState:&v40 objects:v52 count:16];
      id v8 = v25;
      if (!v25)
      {
LABEL_25:

        uint64_t v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          long long v29 = (objc_class *)objc_opt_class();
          long long v30 = NSStringFromClass(v29);
          id v31 = [v6 count];
          id v32 = [v5 count];
          *(_DWORD *)buf = 138412802;
          uint64_t v45 = (uint64_t)v30;
          __int16 v46 = 2048;
          id v47 = v31;
          __int16 v48 = 2048;
          id v49 = v32;
          _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%@: input groups, %lu, output groups, %lu", buf, 0x20u);
        }
        id v4 = v33;
        goto LABEL_31;
      }
    }
  }
  uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    [(MOVisitAnnotationManager *)(uint64_t)self postprocessGroupedEvents:v27];
  }

  [(MOVisitAnnotationManager *)self printGroupedEvents:v4 tag:@"postprocessed events"];
  id v5 = &__NSArray0__struct;
LABEL_31:

  return v5;
}

- (BOOL)isGroupingEligibleForEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 routineEvent];
  id v6 = [v5 placeName];

  if (!v6) {
    goto LABEL_6;
  }
  AOIGroupingEligiblePoiCategories = self->_AOIGroupingEligiblePoiCategories;
  id v8 = [v4 routineEvent];
  uint64_t v9 = [v8 poiCategory];
  unsigned int v10 = [(NSSet *)AOIGroupingEligiblePoiCategories containsObject:v9];

  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = (objc_class *)objc_opt_class();
    long long v30 = NSStringFromClass(v18);
    id v33 = [v4 routineEvent];
    id v32 = [v33 placeName];
    double v19 = [v32 mask];
    if (v10) {
      CFStringRef v20 = @"YES";
    }
    else {
      CFStringRef v20 = @"NO";
    }
    CFStringRef v29 = v20;
    if ([(MOVisitAnnotationManager *)self snapableEvent:v4]) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    id v31 = [v4 routineEvent:v21];
    id v22 = [v31 poiCategory];
    id v23 = [v4 routineEvent];
    CFStringRef v24 = [v23 mapItemLocation];
    id v25 = [v4 routineEvent];
    uint64_t v26 = [v25 mapItemLocation];
    [v26 horizontalUncertainty];
    *(_DWORD *)buf = 138414082;
    id v35 = v30;
    __int16 v36 = 2112;
    id v37 = v19;
    __int16 v38 = 2112;
    CFStringRef v39 = v29;
    __int16 v40 = 2112;
    uint64_t v41 = v28;
    __int16 v42 = 2112;
    long long v43 = v22;
    __int16 v44 = 2112;
    uint64_t v45 = v24;
    __int16 v46 = 2048;
    uint64_t v47 = v27;
    __int16 v48 = 2112;
    id v49 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@: placeName, %@, isAOIGroupingEligible, %@, isSnappable, %@, category, %@, location, %@, mapItem.range, %f, event, %@", buf, 0x52u);
  }
  if (!v10) {
    goto LABEL_6;
  }
  id v12 = [v4 routineEvent];
  id v13 = [v12 mapItemLocation];
  [v13 horizontalUncertainty];
  double v15 = v14;

  if (v15 > 100.0) {
    BOOL v16 = 1;
  }
  else {
LABEL_6:
  }
    BOOL v16 = 0;

  return v16;
}

- (BOOL)containTargetAOIInGroup:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[MOVisitAnnotationManager isGroupingEligibleForEvent:](self, "isGroupingEligibleForEvent:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)samePlaceCheckForEvent:(id)a3 otherEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 routineEvent];
  if (![v7 mapItemID]) {
    goto LABEL_6;
  }
  id v8 = [v6 routineEvent];
  if (![v8 mapItemID])
  {

LABEL_6:
    goto LABEL_7;
  }
  BOOL v9 = [v5 routineEvent];
  id v10 = [v9 mapItemID];
  long long v11 = [v6 routineEvent];
  id v12 = [v11 mapItemID];

  if (v10 == v12)
  {
LABEL_10:
    unsigned __int8 v24 = 1;
    goto LABEL_40;
  }
LABEL_7:
  long long v13 = [v5 routineEvent];
  uint64_t v14 = [v13 location];
  if (v14)
  {
    double v15 = (void *)v14;
    BOOL v16 = [v6 routineEvent];
    CFStringRef v17 = [v16 location];

    if (v17)
    {
      uint64_t v18 = [v5 routineEvent];
      double v19 = [v18 location];
      CFStringRef v20 = [v6 routineEvent];
      CFStringRef v21 = [v20 location];
      [v19 distanceFromLocation:v21];
      double v23 = v22;

      if (v23 < 1.0) {
        goto LABEL_10;
      }
    }
  }
  else
  {
  }
  id v25 = [v5 routineEvent];
  uint64_t v26 = [v25 placeName];
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    uint64_t v28 = [v6 routineEvent];
    uint64_t v29 = [v28 placeName];
    if (v29)
    {
      long long v30 = (void *)v29;
      id v31 = [v5 routineEvent];
      id v32 = [v31 placeName];
      id v33 = v6;
      id v34 = [v6 routineEvent];
      id v35 = [v34 placeName];
      unsigned __int8 v80 = [v32 isEqualToString:v35];

      if (v80)
      {
        unsigned __int8 v24 = 1;
        id v6 = v33;
        goto LABEL_40;
      }
      goto LABEL_18;
    }
  }
  id v33 = v6;

LABEL_18:
  __int16 v36 = [v5 routineEvent];
  id v37 = [v36 geoAddressObject];
  if (v37)
  {
    id v6 = v33;
    __int16 v38 = [v33 routineEvent];
    CFStringRef v39 = [v38 geoAddressObject];
    if (v39)
    {
      __int16 v40 = [v5 routineEvent];
      uint64_t v41 = [v40 geoAddressObject];
      __int16 v42 = [v41 address];
      long long v43 = [v42 structuredAddress];
      __int16 v79 = v5;
      __int16 v81 = v40;
      if ([v43 hasLocality])
      {
        __int16 v44 = [v5 routineEvent];
        double v78 = [v44 geoAddressObject];
        __int16 v77 = [v78 address];
        double v76 = [v77 structuredAddress];
        if ([v76 hasThoroughfare])
        {
          __int16 v75 = [v6 routineEvent];
          id v74 = [v75 geoAddressObject];
          __int16 v73 = [v74 address];
          v72 = [v73 structuredAddress];
          if ([v72 hasLocality])
          {
            v71 = [v6 routineEvent];
            long long v70 = [v71 geoAddressObject];
            long long v69 = [v70 address];
            long long v68 = [v69 structuredAddress];
            if ([v68 hasThoroughfare])
            {
              long long v67 = v44;
              id v66 = [v79 routineEvent];
              uint64_t v65 = [v66 geoAddressObject];
              v64 = [v65 address];
              v63 = [v64 structuredAddress];
              uint64_t v45 = [v63 locality];
              id v61 = [v6 routineEvent];
              id v60 = [v61 geoAddressObject];
              id v59 = [v60 address];
              v58 = [v59 structuredAddress];
              [v58 locality];
              v57 = v62 = v45;
              if (objc_msgSend(v45, "isEqualToString:"))
              {
                v56 = [v79 routineEvent];
                id v55 = [v56 geoAddressObject];
                v54 = [v55 address];
                id v53 = [v54 structuredAddress];
                __int16 v50 = [v53 thoroughfare];
                v52 = [v6 routineEvent];
                CFStringRef v51 = [v52 geoAddressObject];
                id v49 = [v51 address];
                __int16 v48 = [v49 structuredAddress];
                __int16 v46 = [v48 thoroughfare];
                unsigned __int8 v24 = [v50 isEqualToString:v46];
              }
              else
              {
                unsigned __int8 v24 = 0;
              }

              __int16 v44 = v67;
            }
            else
            {
              unsigned __int8 v24 = 0;
            }
          }
          else
          {
            unsigned __int8 v24 = 0;
          }
        }
        else
        {
          unsigned __int8 v24 = 0;
        }
      }
      else
      {
        unsigned __int8 v24 = 0;
      }

      id v5 = v79;
    }
    else
    {
      unsigned __int8 v24 = 0;
    }
  }
  else
  {
    unsigned __int8 v24 = 0;
    id v6 = v33;
  }

LABEL_40:
  return v24;
}

- (BOOL)snapableEvent:(id)a3
{
  id v5 = a3;
  id v6 = [v5 routineEvent];
  id v7 = [v6 placeUserType];

  if (!v7)
  {
    BOOL v9 = [v5 routineEvent];
    if ([v9 placeType] == (id)4)
    {
      BOOL v8 = 1;
LABEL_17:

      goto LABEL_18;
    }
    id v10 = [v5 routineEvent];
    if ([v10 placeType] == (id)5)
    {
      BOOL v8 = 1;
LABEL_16:

      goto LABEL_17;
    }
    long long v11 = [v5 routineEvent];
    id v12 = [v11 placeType];
    if (v12 == (id)3
      && ([v5 routineEvent],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v3 placeNameConfidence],
          double v14 = v13,
          [(MOVisitAnnotationManager *)self visitLabelMediumConfidenceThreshold],
          v14 < v15))
    {
      BOOL v8 = 1;
    }
    else
    {
      BOOL v16 = [v5 routineEvent];
      if ([v16 placeType] == (id)2)
      {
        CFStringRef v17 = [v5 routineEvent];
        [v17 placeNameConfidence];
        double v19 = v18;
        [(MOVisitAnnotationManager *)self aoiVisitLabelConfidentThreshold];
        BOOL v8 = v19 < v20;
      }
      else
      {

        BOOL v8 = 0;
      }
      if (v12 != (id)3) {
        goto LABEL_15;
      }
    }

LABEL_15:
    goto LABEL_16;
  }
  BOOL v8 = 0;
LABEL_18:

  return v8;
}

- (BOOL)likelySamePlaceCheckForEvent:(id)a3 otherEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MOVisitAnnotationManager *)self samePlaceCheckForEvent:v6 otherEvent:v7])
  {
    goto LABEL_20;
  }
  if ([(MOVisitAnnotationManager *)self snapableEvent:v6])
  {
    BOOL v8 = [v6 routineEvent];
    uint64_t v9 = [v8 location];
    if (v9)
    {
      id v10 = (void *)v9;
      long long v11 = [v7 routineEvent];
      id v12 = [v11 location];

      if (v12)
      {
        double v13 = [v6 routineEvent];
        double v14 = [v13 location];
        double v15 = [v7 routineEvent];
        BOOL v16 = [v15 location];
        [v14 distanceFromLocation:v16];
        double v18 = v17;

        double v19 = [v7 routineEvent];
        double v20 = [v19 mapItemLocation];

        if (v20)
        {
          CFStringRef v21 = [v6 routineEvent];
          double v22 = [v21 location];
          double v23 = [v7 routineEvent];
          unsigned __int8 v24 = [v23 mapItemLocation];
          [v22 distanceFromLocation:v24];
          double v26 = v25;

          if (v18 >= v26) {
            double v18 = v26;
          }
        }
LABEL_11:
        uint64_t v27 = [v7 routineEvent];
        uint64_t v28 = [v27 mapItemLocation];
        [v28 horizontalUncertainty];
        double v30 = v29;
        [(MOVisitAnnotationManager *)self aoiRangeWeight];
        double v32 = v30 * v31;

        [(MOVisitAnnotationManager *)self aoiMergingRangeMinimumThreshold];
        if (v32 >= v33) {
          double v34 = v32;
        }
        else {
          double v34 = v33;
        }
        largeAOICategories = self->_largeAOICategories;
        __int16 v36 = [v7 routineEvent];
        id v37 = [v36 poiCategory];
        LODWORD(largeAOICategories) = [(NSSet *)largeAOICategories containsObject:v37];

        if (largeAOICategories)
        {
          [(MOVisitAnnotationManager *)self largeAoiMergingRangeMinimumThreshold];
          if (v34 < v38) {
            double v34 = v38;
          }
        }
        CFStringRef v39 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          __int16 v42 = (objc_class *)objc_opt_class();
          long long v43 = NSStringFromClass(v42);
          __int16 v44 = [v7 routineEvent];
          uint64_t v45 = [v44 mapItemLocation];
          [v45 horizontalUncertainty];
          uint64_t v47 = v46;
          if (v18 >= v34) {
            CFStringRef v48 = @"NO";
          }
          else {
            CFStringRef v48 = @"YES";
          }
          id v49 = [v7 routineEvent];
          __int16 v50 = [v49 placeName];
          int v51 = 138413570;
          v52 = v43;
          __int16 v53 = 2048;
          uint64_t v54 = v47;
          __int16 v55 = 2048;
          double v56 = v18;
          __int16 v57 = 2048;
          double v58 = v34;
          __int16 v59 = 2112;
          CFStringRef v60 = v48;
          __int16 v61 = 2112;
          v62 = v50;
          _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%@: visit vs. landmark, landmark.size, %f, distance, %f, threshold, %f, results, %@, place name, %@", (uint8_t *)&v51, 0x3Eu);
        }
        if (v18 >= v34) {
          goto LABEL_19;
        }
LABEL_20:
        BOOL v40 = 1;
        goto LABEL_21;
      }
    }
    else
    {
    }
    double v18 = 0.0;
    goto LABEL_11;
  }
LABEL_19:
  BOOL v40 = 0;
LABEL_21:

  return v40;
}

- (BOOL)likelySamePlaceCheckForEvent:(id)a3 otherEvents:(id)a4
{
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[MOVisitAnnotationManager likelySamePlaceCheckForEvent:otherEvent:](self, "likelySamePlaceCheckForEvent:otherEvent:", v6, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)transferPlaceForEvent:(id)a3 landmarkEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = (objc_class *)objc_opt_class();
    uint64_t v28 = NSStringFromClass(v27);
    double v29 = [v5 eventIdentifier];
    double v30 = [v6 eventIdentifier];
    __int16 v36 = [v5 routineEvent];
    id v35 = [v36 placeName];
    double v31 = [v35 mask];
    double v32 = [v6 routineEvent];
    double v33 = [v32 placeName];
    double v34 = [v33 mask];
    *(_DWORD *)buf = 138413314;
    double v38 = v28;
    __int16 v39 = 2112;
    BOOL v40 = v29;
    __int16 v41 = 2112;
    __int16 v42 = v30;
    __int16 v43 = 2112;
    __int16 v44 = v31;
    __int16 v45 = 2112;
    uint64_t v46 = v34;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@: merge (transfer) a visit (%@) to other (%@), %@ -> %@", buf, 0x34u);
  }
  id v8 = [v6 routineEvent];
  id v9 = [v8 placeName];
  uint64_t v10 = [v5 routineEvent];
  [v10 setPlaceName:v9];

  long long v11 = [v6 routineEvent];
  [v11 placeNameConfidence];
  double v13 = v12;
  long long v14 = [v5 routineEvent];
  [v14 setPlaceNameConfidence:v13];

  long long v15 = [v6 routineEvent];
  id v16 = [v15 mapItemID];
  long long v17 = [v5 routineEvent];
  [v17 setMapItemID:v16];

  double v18 = [v6 routineEvent];
  double v19 = [v18 mapItemLocation];
  double v20 = [v5 routineEvent];
  [v20 setMapItemLocation:v19];

  CFStringRef v21 = [v6 routineEvent];
  id v22 = [v21 mapItemPlaceType];
  double v23 = [v5 routineEvent];
  [v23 setMapItemPlaceType:v22];

  unsigned __int8 v24 = [v6 routineEvent];
  double v25 = [v24 placeMapItem];
  double v26 = [v5 routineEvent];
  [v26 setPlaceMapItem:v25];
}

- (id)applyAOIBasedGroupingOnEvents:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v135 = objc_opt_new();
  v139 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v154 objects:v168 count:16];
  id v133 = v7;
  if (!v8)
  {
    uint64_t v10 = 0;
    long long v11 = 0;
    goto LABEL_85;
  }
  id v9 = v8;
  uint64_t v10 = 0;
  long long v11 = 0;
  uint64_t v136 = *(void *)v155;
  v138 = v5;
  v141 = self;
  do
  {
    uint64_t v12 = 0;
    id v134 = v9;
    do
    {
      if (*(void *)v155 != v136) {
        objc_enumerationMutation(v7);
      }
      double v13 = *(void **)(*((void *)&v154 + 1) + 8 * v12);
      if (v10 == 2)
      {
        uint64_t v137 = v12;
        uint64_t v159 = *(void *)(*((void *)&v154 + 1) + 8 * v12);
        BOOL v40 = +[NSArray arrayWithObjects:&v159 count:1];
        unsigned int v41 = [(MOVisitAnnotationManager *)self containTargetAOIInGroup:v40];

        if (v41)
        {
          [v135 addObject:v13];
          if ([(MOVisitAnnotationManager *)self samePlaceCheckForEvent:v11 otherEvent:v13])
          {
            id v16 = v11;
          }
          else
          {
            id v16 = v13;
          }
          -[NSObject addObject:](v139, "addObject:", v13, v133);
          log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            v105 = (objc_class *)objc_opt_class();
            v106 = NSStringFromClass(v105);
            v107 = [v13 routineEvent];
            v108 = [v107 placeName];
            [v108 mask];
            v110 = v109 = v6;
            *(_DWORD *)buf = 138412546;
            v164 = v106;
            __int16 v165 = 2112;
            v166 = v110;
            _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, AOI", buf, 0x16u);

            id v6 = v109;
          }
          uint64_t v10 = 2;
          goto LABEL_71;
        }
        if ([(MOVisitAnnotationManager *)self likelySamePlaceCheckForEvent:v13 otherEvents:v139])
        {
          [(MOVisitAnnotationManager *)self transferPlaceForEvent:v13 landmarkEvent:v11];
          [v135 addObject:v13];
          log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            v116 = (objc_class *)objc_opt_class();
            v117 = NSStringFromClass(v116);
            v118 = [v13 routineEvent];
            v119 = [v118 placeName];
            v120 = [v119 mask];
            *(_DWORD *)buf = 138412546;
            v164 = v117;
            __int16 v165 = 2112;
            v166 = v120;
            _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, Merging", buf, 0x16u);
          }
          uint64_t v10 = 2;
          goto LABEL_68;
        }
        [v5 addObject:v135];
        id v74 = [v13 routineEvent];
        id v75 = [v74 placeUserType];

        if (v75 == (id)1)
        {
          double v76 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          {
            __int16 v77 = (objc_class *)objc_opt_class();
            double v78 = NSStringFromClass(v77);
            __int16 v79 = [v13 routineEvent];
            unsigned __int8 v80 = [v79 placeName];
            [v80 mask];
            v82 = __int16 v81 = v6;
            *(_DWORD *)buf = 138412546;
            v164 = v78;
            __int16 v165 = 2112;
            v166 = v82;
            v83 = v76;
            id v84 = "%@: drop, place name, %@, Reset";
            goto LABEL_81;
          }
        }
        else
        {
          v89 = +[NSMutableArray arrayWithObject:v13];
          [v5 addObject:v89];

          double v76 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          {
            v123 = (objc_class *)objc_opt_class();
            double v78 = NSStringFromClass(v123);
            __int16 v79 = [v13 routineEvent];
            unsigned __int8 v80 = [v79 placeName];
            [v80 mask];
            v82 = __int16 v81 = v6;
            *(_DWORD *)buf = 138412546;
            v164 = v78;
            __int16 v165 = 2112;
            v166 = v82;
            v83 = v76;
            id v84 = "%@: Merging, place name, %@, Reset";
LABEL_81:
            _os_log_debug_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEBUG, v84, buf, 0x16u);

            id v6 = v81;
          }
        }

        uint64_t v90 = objc_opt_new();
        uint64_t v91 = objc_opt_new();
        uint64_t v10 = 0;
        id v16 = 0;
        v92 = v139;
        v139 = v91;
        log = v92;
        v135 = (void *)v90;
LABEL_71:
        id v9 = v134;
        goto LABEL_72;
      }
      if (v10 == 1)
      {
        uint64_t v137 = v12;
        uint64_t v162 = *(void *)(*((void *)&v154 + 1) + 8 * v12);
        long long v17 = +[NSArray arrayWithObjects:&v162 count:1];
        unsigned int v18 = [(MOVisitAnnotationManager *)self containTargetAOIInGroup:v17];

        if (v18)
        {
          id v16 = v13;

          double v19 = v139;
          [v139 addObject:v16];
          log = objc_opt_new();
          long long v150 = 0u;
          long long v151 = 0u;
          long long v152 = 0u;
          long long v153 = 0u;
          id v20 = v6;
          id v21 = [v20 countByEnumeratingWithState:&v150 objects:v161 count:16];
          if (v21)
          {
            id v22 = v21;
            char v23 = 0;
            uint64_t v24 = *(void *)v151;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v151 != v24) {
                  objc_enumerationMutation(v20);
                }
                double v26 = *(void **)(*((void *)&v150 + 1) + 8 * i);
                if ((v23 & 1) != 0
                  || [(MOVisitAnnotationManager *)self likelySamePlaceCheckForEvent:*(void *)(*((void *)&v150 + 1) + 8 * i) otherEvents:v19])
                {
                  -[MOVisitAnnotationManager transferPlaceForEvent:landmarkEvent:](self, "transferPlaceForEvent:landmarkEvent:", v26, v16, v133);
                  uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                  {
                    double v29 = (objc_class *)objc_opt_class();
                    double v30 = NSStringFromClass(v29);
                    double v31 = [v26 routineEvent];
                    double v32 = [v31 placeName];
                    double v33 = [v32 mask];
                    *(_DWORD *)buf = 138412546;
                    v164 = v30;
                    __int16 v165 = 2112;
                    v166 = v33;
                    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, Merging the cached visit", buf, 0x16u);

                    double v19 = v139;
                    id v5 = v138;
                  }
                  char v23 = 1;
                }
                else
                {
                  [log addObject:v26];
                  uint64_t v28 = +[NSMutableArray arrayWithObject:v26];
                  [v5 addObject:v28];

                  uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                  {
                    double v34 = (objc_class *)objc_opt_class();
                    id v35 = NSStringFromClass(v34);
                    __int16 v36 = [v26 routineEvent];
                    id v37 = [v36 placeName];
                    double v38 = [v37 mask];
                    *(_DWORD *)buf = 138412546;
                    v164 = v35;
                    __int16 v165 = 2112;
                    v166 = v38;
                    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, Split the cached visit", buf, 0x16u);

                    id v5 = v138;
                    double v19 = v139;
                  }
                  char v23 = 0;
                }

                self = v141;
              }
              id v22 = [v20 countByEnumeratingWithState:&v150 objects:v161 count:16];
            }
            while (v22);
          }

          [v135 removeObjectsInArray:log];
          id v6 = objc_opt_new();

          [v135 addObject:v16];
          __int16 v39 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            v99 = (objc_class *)objc_opt_class();
            v100 = NSStringFromClass(v99);
            v101 = [v16 routineEvent];
            [v101 placeName];
            v103 = v102 = v6;
            v104 = [v103 mask];
            *(_DWORD *)buf = 138412546;
            v164 = v100;
            __int16 v165 = 2112;
            v166 = v104;
            _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, AOI", buf, 0x16u);

            id v5 = v138;
            id v6 = v102;
          }
          uint64_t v10 = 2;
          id v7 = v133;
          goto LABEL_71;
        }
        if ([(MOVisitAnnotationManager *)self snapableEvent:v13])
        {
          [v6 addObject:v13];
          [v135 addObject:v13];
          log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            __int16 v42 = (objc_class *)objc_opt_class();
            __int16 v43 = NSStringFromClass(v42);
            __int16 v44 = [v13 routineEvent];
            __int16 v45 = [v44 placeName];
            uint64_t v46 = [v45 mask];
            *(_DWORD *)buf = 138412546;
            v164 = v43;
            __int16 v165 = 2112;
            v166 = v46;
            _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, Caching", buf, 0x16u);

            goto LABEL_75;
          }
LABEL_39:
          uint64_t v10 = 1;
LABEL_68:
          id v16 = v11;
          goto LABEL_72;
        }
        long long v148 = 0u;
        long long v149 = 0u;
        long long v146 = 0u;
        long long v147 = 0u;
        id v47 = v135;
        id v48 = [v47 countByEnumeratingWithState:&v146 objects:v160 count:16];
        if (v48)
        {
          id v49 = v48;
          uint64_t v50 = *(void *)v147;
          do
          {
            for (j = 0; j != v49; j = (char *)j + 1)
            {
              if (*(void *)v147 != v50) {
                objc_enumerationMutation(v47);
              }
              v52 = +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", *(void *)(*((void *)&v146 + 1) + 8 * (void)j), v133);
              [v5 addObject:v52];
            }
            id v49 = [v47 countByEnumeratingWithState:&v146 objects:v160 count:16];
          }
          while (v49);
        }

        __int16 v53 = [v13 routineEvent];
        id v54 = [v53 placeUserType];

        if (v54 == (id)1)
        {
          __int16 v55 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          id v7 = v133;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            double v56 = (objc_class *)objc_opt_class();
            __int16 v57 = NSStringFromClass(v56);
            double v58 = [v13 routineEvent];
            [v58 placeName];
            v60 = __int16 v59 = v6;
            __int16 v61 = [v60 mask];
            *(_DWORD *)buf = 138412546;
            v164 = v57;
            __int16 v165 = 2112;
            v166 = v61;
            v62 = v55;
            v63 = "%@: drop, place name, %@, Reset";
            goto LABEL_77;
          }
        }
        else
        {
          v85 = +[NSMutableArray arrayWithObject:v13];
          [v5 addObject:v85];

          __int16 v55 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          id v7 = v133;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            v121 = (objc_class *)objc_opt_class();
            __int16 v57 = NSStringFromClass(v121);
            double v58 = [v13 routineEvent];
            [v58 placeName];
            v60 = __int16 v59 = v6;
            __int16 v61 = [v60 mask];
            *(_DWORD *)buf = 138412546;
            v164 = v57;
            __int16 v165 = 2112;
            v166 = v61;
            v62 = v55;
            v63 = "%@: Merging, place name, %@, Reset";
LABEL_77:
            _os_log_debug_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, v63, buf, 0x16u);

            id v5 = v138;
            id v6 = v59;
          }
        }

        v135 = objc_opt_new();
        uint64_t v86 = objc_opt_new();
        uint64_t v10 = 0;
        id v16 = 0;
        v87 = v139;
        v139 = v86;
        log = v87;
        goto LABEL_71;
      }
      uint64_t v137 = v12;
      uint64_t v167 = *(void *)(*((void *)&v154 + 1) + 8 * v12);
      long long v14 = +[NSArray arrayWithObjects:&v167 count:1];
      unsigned int v15 = [(MOVisitAnnotationManager *)self containTargetAOIInGroup:v14];

      if (!v15)
      {
        if ([(MOVisitAnnotationManager *)self snapableEvent:v13])
        {
          [v6 addObject:v13];
          [v135 addObject:v13];
          log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            v111 = (objc_class *)objc_opt_class();
            __int16 v43 = NSStringFromClass(v111);
            v112 = [v13 routineEvent];
            [v112 placeName];
            v114 = v113 = v6;
            v115 = [v114 mask];
            *(_DWORD *)buf = 138412546;
            v164 = v43;
            __int16 v165 = 2112;
            v166 = v115;
            _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, Caching", buf, 0x16u);

            self = v141;
            id v6 = v113;

LABEL_75:
          }
          goto LABEL_39;
        }
        v64 = [v13 routineEvent];
        id v65 = [v64 placeUserType];

        if (v65 == (id)1)
        {
          log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            id v66 = (objc_class *)objc_opt_class();
            long long v67 = NSStringFromClass(v66);
            long long v68 = [v13 routineEvent];
            [v68 placeName];
            v70 = long long v69 = v6;
            v71 = [v70 mask];
            *(_DWORD *)buf = 138412546;
            v164 = v67;
            __int16 v165 = 2112;
            v166 = v71;
            v72 = log;
            __int16 v73 = "%@: drop, place name, %@, Passing";
            goto LABEL_79;
          }
        }
        else
        {
          v88 = +[NSMutableArray arrayWithObject:v13];
          [v5 addObject:v88];

          log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            v122 = (objc_class *)objc_opt_class();
            long long v67 = NSStringFromClass(v122);
            long long v68 = [v13 routineEvent];
            [v68 placeName];
            v70 = long long v69 = v6;
            v71 = [v70 mask];
            *(_DWORD *)buf = 138412546;
            v164 = v67;
            __int16 v165 = 2112;
            v166 = v71;
            v72 = log;
            __int16 v73 = "%@: Merging, place name, %@, Passing";
LABEL_79:
            _os_log_debug_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, v73, buf, 0x16u);

            self = v141;
            id v6 = v69;
          }
        }
        uint64_t v10 = 0;
        goto LABEL_68;
      }
      id v16 = v13;

      [v139 addObject:v16];
      [v135 addObject:v16];
      log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        v93 = (objc_class *)objc_opt_class();
        v94 = NSStringFromClass(v93);
        [v16 routineEvent];
        v96 = v95 = v6;
        v97 = [v96 placeName];
        v98 = [v97 mask];
        *(_DWORD *)buf = 138412546;
        v164 = v94;
        __int16 v165 = 2112;
        v166 = v98;
        _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@: Merging, place name, %@, AOI", buf, 0x16u);

        self = v141;
        id v6 = v95;
      }
      uint64_t v10 = 2;
LABEL_72:

      long long v11 = v16;
      uint64_t v12 = v137 + 1;
    }
    while ((id)(v137 + 1) != v9);
    id v124 = [v7 countByEnumeratingWithState:&v154 objects:v168 count:16];
    id v9 = v124;
  }
  while (v124);
LABEL_85:

  if ([v135 count])
  {
    if (v10 == 2)
    {
      [v5 addObject:v135];
    }
    else
    {
      long long v144 = 0u;
      long long v145 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      id v125 = v135;
      id v126 = [v125 countByEnumeratingWithState:&v142 objects:v158 count:16];
      if (v126)
      {
        id v127 = v126;
        uint64_t v128 = *(void *)v143;
        do
        {
          for (k = 0; k != v127; k = (char *)k + 1)
          {
            if (*(void *)v143 != v128) {
              objc_enumerationMutation(v125);
            }
            v130 = +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", *(void *)(*((void *)&v142 + 1) + 8 * (void)k), v133);
            [v5 addObject:v130];
          }
          id v127 = [v125 countByEnumeratingWithState:&v142 objects:v158 count:16];
        }
        while (v127);
      }

      id v7 = v133;
    }
  }
  id v131 = v5;

  return v131;
}

- (id)applyNameBasedGroupingOnEvents:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    id v55 = &__NSArray0__struct;
    goto LABEL_49;
  }
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v57 = v4;
  id obj = v4;
  id v63 = [obj countByEnumeratingWithState:&v64 objects:v80 count:16];
  id v7 = 0;
  if (!v63) {
    goto LABEL_45;
  }
  uint64_t v8 = *(void *)v65;
  uint64_t v61 = *(void *)v65;
  double v58 = self;
  __int16 v59 = v5;
  do
  {
    for (i = 0; i != v63; i = (char *)i + 1)
    {
      if (*(void *)v65 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      if ([v10 placeUserType] == (id)1)
      {
        if ([v6 count])
        {
          id v11 = [v6 copy];
          [v5 addObject:v11];

          uint64_t v12 = objc_opt_new();
          double v13 = v7;
          id v6 = (void *)v12;
        }
        else
        {
          double v13 = v7;
        }
        id v7 = 0;
        goto LABEL_43;
      }
      if (v7)
      {
        [(MOVisitAnnotationManager *)self timeIntervalThresholdDefault];
        double v15 = v14;
        [(MOVisitAnnotationManager *)self distanceThresholdDefault];
        double v17 = v16;
        unsigned int v18 = [v7 placeName];
        if (!v18)
        {
          CFStringRef v60 = [v10 placeName];
          if (!v60)
          {
            CFStringRef v60 = 0;
            goto LABEL_27;
          }
        }
        uint64_t v19 = [v7 placeName];
        if (v19)
        {
          id v20 = (void *)v19;
          uint64_t v21 = [v10 placeName];
          if (v21)
          {
            id v22 = (void *)v21;
            char v23 = [v7 placeName];
            uint64_t v24 = [v10 placeName];
            unsigned int v25 = [v23 isEqualToString:v24];

            if (v18)
            {

              self = v58;
              id v5 = v59;
              if (!v25)
              {
LABEL_30:
                double v31 = [v10 startDate];
                double v32 = [v7 endDate];
                [v31 timeIntervalSinceDate:v32];
                double v34 = v33;

                uint64_t v35 = [v7 location];
                double v36 = 0.0;
                if (v35)
                {
                  id v37 = (void *)v35;
                  double v38 = [v10 location];

                  if (v38)
                  {
                    __int16 v39 = [v7 location];
                    BOOL v40 = [v10 location];
                    [v39 distanceFromLocation:v40];
                    double v36 = v41;
                  }
                }
                uint64_t v8 = v61;
                if (v34 > v15 || v36 > v17)
                {
                  if ([v6 count])
                  {
                    id v42 = [v6 copy];
                    [v5 addObject:v42];

                    uint64_t v43 = objc_opt_new();
                    id v6 = (void *)v43;
                  }
                  __int16 v44 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    id v49 = (objc_class *)objc_opt_class();
                    uint64_t v50 = NSStringFromClass(v49);
                    *(_DWORD *)buf = 138413314;
                    long long v69 = v50;
                    __int16 v70 = 2048;
                    double v71 = v34;
                    __int16 v72 = 2048;
                    double v73 = v36;
                    __int16 v74 = 2048;
                    double v75 = v15;
                    __int16 v76 = 2048;
                    double v77 = v17;
                    _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%@: Grouping the base events, new group (distance/interval check), interval, %f, distacne, %f, intervalThreshold, %f, distanceThreshold, %f", buf, 0x34u);
                  }
                }
                [v6 addObject:v10];
                __int16 v45 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v46 = (objc_class *)objc_opt_class();
                  id v47 = NSStringFromClass(v46);
                  id v48 = [v10 eventIdentifier];
                  *(_DWORD *)buf = 138413570;
                  long long v69 = v47;
                  __int16 v70 = 2112;
                  double v71 = *(double *)&v48;
                  __int16 v72 = 2048;
                  double v73 = v34;
                  __int16 v74 = 2048;
                  double v75 = v36;
                  __int16 v76 = 2048;
                  double v77 = v15;
                  __int16 v78 = 2048;
                  double v79 = v17;
                  _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "%@: Grouping the base events, add event, %@, interval, %f, distacne, %f, intervalThreshold, %f, distanceThreshold, %f", buf, 0x3Eu);
                }
                double v13 = v7;
                id v7 = v10;
                goto LABEL_43;
              }
            }
            else
            {

              self = v58;
              id v5 = v59;
              if ((v25 & 1) == 0) {
                goto LABEL_30;
              }
            }
LABEL_27:
            [(MOVisitAnnotationManager *)self timeIntervalThresholdWithSamePlaceName];
            double v15 = v29;
            [(MOVisitAnnotationManager *)self distanceThresholdWithSamePlaceName];
            double v17 = v30;
            unsigned int v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              int v51 = (objc_class *)objc_opt_class();
              v52 = NSStringFromClass(v51);
              __int16 v53 = [v10 eventIdentifier];
              *(_DWORD *)buf = 138412546;
              long long v69 = v52;
              __int16 v70 = 2112;
              double v71 = *(double *)&v53;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@: Grouping the base events, the same place name, %@", buf, 0x16u);
            }
LABEL_29:

            goto LABEL_30;
          }
        }
        if (!v18) {

        }
        goto LABEL_29;
      }
      [v6 addObject:v10];
      id v7 = v10;
      double v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        double v26 = (objc_class *)objc_opt_class();
        uint64_t v27 = NSStringFromClass(v26);
        uint64_t v28 = [v7 eventIdentifier];
        *(_DWORD *)buf = 138412546;
        long long v69 = v27;
        __int16 v70 = 2112;
        double v71 = *(double *)&v28;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@: Grouping the base events, add event, %@", buf, 0x16u);
      }
LABEL_43:
    }
    id v63 = [obj countByEnumeratingWithState:&v64 objects:v80 count:16];
  }
  while (v63);
LABEL_45:

  if ([v6 count])
  {
    id v54 = [v6 copy];
    [v5 addObject:v54];
  }
  id v55 = [v5 copy];

  id v4 = v57;
LABEL_49:

  return v55;
}

- (id)getContextEventsForBaseEvents:(id)a3 events:(id)a4 withPatternEvents:(id)a5
{
  id v7 = a3;
  id v99 = a4;
  id v102 = a5;
  id v97 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"endDate" ascending:1];
  v96 = +[NSString stringWithFormat:@"%@%@", @"%K = %lu", @" AND %K != %lu"];
  uint64_t v8 = +[NSPredicate predicateWithFormat:@"category", 22, @"lifeEventCategory", 4];
  id v9 = [v7 firstObject];
  uint64_t v10 = [v9 startDate];
  id v11 = [v7 lastObject];
  uint64_t v12 = [v11 endDate];
  uint64_t v13 = +[MOContextAnnotationUtilities predicateWithStartDate:v10 endDate:v12];

  v94 = (void *)v13;
  v95 = (void *)v8;
  v136[0] = v8;
  v136[1] = v13;
  double v14 = +[NSArray arrayWithObjects:v136 count:2];
  uint64_t v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v14];

  double v16 = [v7 firstObject];
  double v17 = [v16 startDate];
  unsigned int v18 = [v7 lastObject];
  uint64_t v19 = [v18 endDate];
  uint64_t v20 = +[MOContextAnnotationUtilities predicateOfSocialContextEventWithStartDate:v17 endData:v19];

  uint64_t v21 = [v7 firstObject];
  id v22 = [v21 startDate];
  char v23 = [v7 lastObject];
  uint64_t v24 = [v23 endDate];
  uint64_t v25 = +[MOContextAnnotationUtilities predicateOfEventsWithPlaySessionsWithStartDate:v22 endData:v24];

  double v26 = [v7 firstObject];
  uint64_t v27 = [v26 startDate];
  uint64_t v28 = [v7 lastObject];
  double v29 = [v28 endDate];
  uint64_t v30 = +[MOContextAnnotationUtilities predicateOfEmotionLogsWithStartDate:v27 endDate:v29];

  v92 = (void *)v20;
  v93 = (void *)v15;
  v135[0] = v15;
  v135[1] = v20;
  uint64_t v90 = (void *)v30;
  uint64_t v91 = (void *)v25;
  v135[2] = v25;
  v135[3] = v30;
  double v31 = +[NSArray arrayWithObjects:v135 count:4];
  uint64_t v32 = +[NSCompoundPredicate orPredicateWithSubpredicates:v31];

  v89 = (void *)v32;
  double v33 = [v99 filteredArrayUsingPredicate:v32];
  double v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    uint64_t v35 = (objc_class *)objc_opt_class();
    double v36 = NSStringFromClass(v35);
    id v37 = [v33 count];
    double v38 = [v7 firstObject];
    __int16 v39 = [v38 startDate];
    BOOL v40 = [v7 lastObject];
    double v41 = [v40 endDate];
    *(_DWORD *)buf = 138413058;
    uint64_t v128 = v36;
    __int16 v129 = 2048;
    id v130 = v37;
    __int16 v131 = 2112;
    id v132 = v39;
    __int16 v133 = 2112;
    id v134 = v41;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%@: filtered context event count, %lu, startDate, %@, endDate, %@", buf, 0x2Au);
  }
  id v42 = v33;
  v105 = v42;
  v98 = v7;
  if ([v102 count])
  {
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id obj = v7;
    id v103 = [obj countByEnumeratingWithState:&v118 objects:v126 count:16];
    if (!v103) {
      goto LABEL_25;
    }
    uint64_t v101 = *(void *)v119;
    while (1)
    {
      uint64_t v43 = 0;
      do
      {
        if (*(void *)v119 != v101) {
          objc_enumerationMutation(obj);
        }
        uint64_t v104 = v43;
        v107 = *(void **)(*((void *)&v118 + 1) + 8 * v43);
        uint64_t v108 = (uint64_t)v42;
        long long v114 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        id v112 = v102;
        id v44 = [v112 countByEnumeratingWithState:&v114 objects:v125 count:16];
        if (v44)
        {
          id v45 = v44;
          uint64_t v46 = *(void *)v115;
          uint64_t v106 = *(void *)v115;
          do
          {
            id v47 = 0;
            id v110 = v45;
            do
            {
              if (*(void *)v115 != v46) {
                objc_enumerationMutation(v112);
              }
              id v48 = *(void **)(*((void *)&v114 + 1) + 8 * (void)v47);
              id v49 = [v48 patterns];
              uint64_t v50 = [v49 objectForKeyedSubscript:@"kEventPatternType"];
              if ([v50 intValue])
              {

LABEL_18:
                goto LABEL_19;
              }
              int v51 = [v107 eventIdentifier];
              v52 = [v51 UUIDString];
              __int16 v53 = [v48 patterns];
              id v54 = [v53 objectForKeyedSubscript:@"kEventPatternAnomalousEventIdentifier"];
              unsigned int v55 = [v52 isEqualToString:v54];

              if (v55)
              {
                [v105 arrayByAddingObject:v48];
                id v49 = (void *)v108;
                v108 = id v45 = v110;
                uint64_t v46 = v106;
                goto LABEL_18;
              }
              uint64_t v46 = v106;
              id v45 = v110;
LABEL_19:
              id v47 = (char *)v47 + 1;
            }
            while (v45 != v47);
            id v56 = [v112 countByEnumeratingWithState:&v114 objects:v125 count:16];
            id v45 = v56;
          }
          while (v56);
        }

        uint64_t v43 = v104 + 1;
        id v42 = (id)v108;
      }
      while ((id)(v104 + 1) != v103);
      id v103 = [obj countByEnumeratingWithState:&v118 objects:v126 count:16];
      if (!v103)
      {
LABEL_25:

        id v7 = v98;
        break;
      }
    }
  }
  id v57 = +[NSString stringWithFormat:@"%@%@", @"%K = %lu", @" AND %K = %lu"];
  uint64_t v58 = +[NSPredicate predicateWithFormat:v57, @"category", 22, @"lifeEventCategory", 4];
  [v7 firstObject];
  v60 = __int16 v59 = v42;
  uint64_t v61 = [v60 startDate];
  uint64_t v62 = [v61 dateByAddingTimeInterval:-300.0];

  id v63 = [v7 lastObject];
  long long v64 = [v63 endDate];

  id v113 = (id)v62;
  v109 = +[MOContextAnnotationUtilities predicateWithStartDate:v62 endDate:v64];
  v111 = (void *)v58;
  v124[0] = v58;
  v124[1] = v109;
  long long v65 = +[NSArray arrayWithObjects:v124 count:2];
  long long v66 = +[NSCompoundPredicate andPredicateWithSubpredicates:v65];

  long long v67 = [v99 filteredArrayUsingPredicate:v66];
  id v123 = v97;
  long long v68 = +[NSArray arrayWithObjects:&v123 count:1];
  long long v69 = [v67 sortedArrayUsingDescriptors:v68];

  id v70 = v59;
  double v71 = [v69 lastObject];

  __int16 v72 = v70;
  if (v71)
  {
    double v73 = [v69 lastObject];
    __int16 v74 = [v73 endDate];

    __int16 v72 = v70;
    if (v74)
    {
      double v75 = [v73 endDate];
      __int16 v76 = [v98 firstObject];
      [v76 startDate];
      v78 = double v77 = v57;
      [v75 timeIntervalSinceDate:v78];
      double v80 = fabs(v79);

      id v57 = v77;
      __int16 v72 = v70;
      if (v80 < 300.0)
      {
        __int16 v81 = [v69 lastObject];
        __int16 v72 = [v70 arrayByAddingObject:v81];
      }
    }
  }
  double v82 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
  {
    v83 = (objc_class *)objc_opt_class();
    id v84 = NSStringFromClass(v83);
    id v85 = [v67 count];
    *(_DWORD *)buf = 138413058;
    uint64_t v128 = v84;
    __int16 v129 = 2048;
    id v130 = v85;
    __int16 v131 = 2112;
    id v132 = v113;
    __int16 v133 = 2112;
    id v134 = v64;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "%@: flightEvents count, %lu, startDate, %@, endDate, %@", buf, 0x2Au);
  }
  id v122 = v97;
  uint64_t v86 = +[NSArray arrayWithObjects:&v122 count:1];
  v87 = [v72 sortedArrayUsingDescriptors:v86];

  return v87;
}

- (id)annotateBaseEvents:(id)a3 contextEvents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    uint64_t v12 = 0;
    goto LABEL_43;
  }
  id v9 = [MOEventBundle alloc];
  uint64_t v10 = +[NSUUID UUID];
  id v11 = +[NSDate date];
  uint64_t v12 = [(MOEventBundle *)v9 initWithBundleIdentifier:v10 creationDate:v11];

  [(MOEventBundle *)v12 setInterfaceType:2];
  [(MOEventBundle *)v12 setBundleSuperType:1];
  [(MOEventBundle *)v12 setBundleSubType:101];
  uint64_t v13 = [v7 lastObject];
  double v14 = [v13 endDate];
  uint64_t v15 = [(MOAnnotationManager *)self timeZoneManager];
  double v16 = +[MOTime timeForDate:v14 timeZoneManager:v15];
  [(MOEventBundle *)v12 setTime:v16];

  double v17 = [(MOVisitAnnotationManager *)self predominantWeatherFromBaseEvents:v7];
  [(MOEventBundle *)v12 setPredominantWeather:v17];

  [(MOEventBundle *)v12 setPropertiesBasedOnEvents];
  unsigned int v18 = [v7 firstObject];
  uint64_t v19 = [v18 startDate];
  [(MOEventBundle *)v12 setStartDate:v19];

  uint64_t v20 = [v7 lastObject];
  uint64_t v21 = [v20 endDate];
  [(MOEventBundle *)v12 setEndDate:v21];

  id v22 = [(MOVisitAnnotationManager *)self resourcesFromBaseEvents:v7];
  [(MOEventBundle *)v12 setResources:v22];

  char v23 = [(MOEventBundle *)v12 events];
  double v80 = +[NSMutableArray arrayWithArray:v23];

  __int16 v81 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 5];
  double v82 = [v8 filteredArrayUsingPredicate:v81];
  if ([v82 count]) {
    [v80 addObjectsFromArray:v82];
  }
  id v24 = [v80 copy];
  [(MOEventBundle *)v12 setEvents:v24];

  [(MOVisitAnnotationManager *)self updateActionWithBaseEvents:v7 contextEvents:v8 eventBundle:v12];
  uint64_t v25 = [(MOEventBundle *)v12 action];
  double v26 = [(MOVisitAnnotationManager *)self placeFromBaseEvents:v7 action:v25];
  [(MOEventBundle *)v12 setPlace:v26];

  uint64_t v27 = [(MOEventBundle *)v12 action];
  if ([v27 actionType] == (id)10)
  {
  }
  else
  {
    uint64_t v28 = [(MOEventBundle *)v12 action];
    id v4 = [v28 actionType];

    if (v4 != (id)9) {
      goto LABEL_19;
    }
  }
  double v29 = [(MOEventBundle *)v12 place];
  id v30 = [v29 placeType];
  if (v30 == (id)3)
  {
    id v4 = [(MOEventBundle *)v12 place];
    [v4 placeNameConfidence];
    if (v31 < 0.95)
    {

      goto LABEL_15;
    }
  }
  uint64_t v32 = [(MOEventBundle *)v12 place];
  if ([v32 placeType] != (id)2)
  {

    if (v30 == (id)3) {
    goto LABEL_18;
    }
  }
  BOOL v33 = v30 == (id)3;
  double v34 = [(MOEventBundle *)v12 place];
  [v34 placeNameConfidence];
  double v36 = v35;

  if (v33) {
  if (v36 < 0.95)
  }
  {
LABEL_15:
    double v29 = [(MOVisitAnnotationManager *)self actionFromBaseEvents:v7];
    [(MOEventBundle *)v12 setAction:v29];
LABEL_18:
  }
LABEL_19:
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x3032000000;
  v98 = __Block_byref_object_copy_;
  id v99 = __Block_byref_object_dispose_;
  id v100 = (id)objc_opt_new();
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2020000000;
  uint64_t v94 = 0;
  uint64_t v85 = 0;
  uint64_t v86 = &v85;
  uint64_t v87 = 0x3032000000;
  v88 = __Block_byref_object_copy_;
  v89 = __Block_byref_object_dispose_;
  id v90 = (id)objc_opt_new();
  v84.receiver = self;
  v84.super_class = (Class)MOVisitAnnotationManager;
  id v37 = [(MOAnnotationManager *)&v84 fUniverse];
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = __61__MOVisitAnnotationManager_annotateBaseEvents_contextEvents___block_invoke;
  v83[3] = &unk_1002C99D0;
  v83[4] = &v95;
  v83[5] = &v91;
  v83[6] = &v85;
  +[MOContextAnnotationUtilities addPhotoResources:v12 universe:v37 handler:v83];

  double v38 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    __int16 v39 = (objc_class *)objc_opt_class();
    BOOL v40 = NSStringFromClass(v39);
    uint64_t v41 = v92[3];
    *(_DWORD *)buf = 138412546;
    id v102 = v40;
    __int16 v103 = 2048;
    uint64_t v104 = v41;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%@: visit, photoSource, %lu", buf, 0x16u);
  }
  [(MOEventBundle *)v12 setResources:v96[5]];
  [(MOEventBundle *)v12 setPhotoSource:v92[3]];
  id v42 = [(id)v86[5] copy];
  [(MOEventBundle *)v12 setPhotoTraits:v42];

  if ([(id)v96[5] count])
  {
    uint64_t v43 = [(MOEventBundle *)v12 place];
    [v43 placeNameConfidence];
    BOOL v45 = v44 < 0.0;

    if (v45)
    {
      uint64_t v46 = [(MOEventBundle *)v12 place];
      [v46 setPlaceNameConfidence:0.0];
    }
  }
  id v47 = [(MOEventBundle *)v12 place];
  id v48 = [v47 placeUserType];
  if (v48 != (id)2)
  {
    id v4 = [(MOEventBundle *)v12 place];
    [v4 familiarityIndexLOI];
    if (v49 <= self->_recommendedTabVisitFIThreshold) {
      goto LABEL_28;
    }
  }
  if ([(MOEventBundle *)v12 photoSource])
  {
    if (v48 == (id)2)
    {
LABEL_29:

      goto LABEL_30;
    }
LABEL_28:

    goto LABEL_29;
  }
  id v77 = [v82 count];
  if (v48 == (id)2)
  {
    BOOL v78 = v77 == 0;

    if (!v78) {
      goto LABEL_30;
    }
  }
  else
  {
    BOOL v79 = v77 == 0;

    if (!v79) {
      goto LABEL_30;
    }
  }
  [(MOEventBundle *)v12 setSummarizationGranularity:1];
LABEL_30:
  uint64_t v50 = [(MOEventBundle *)v12 place];
  [v50 distanceToHomeInMiles];
  int v51 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(MOEventBundle *)v12 addMetaDataForRankForKey:@"DistanceToHome" value:v51];

  v52 = [(MOEventBundle *)v12 place];
  [v52 placeNameConfidence];
  if (v53 >= 0.9)
  {
    uint64_t v54 = nonInterestingPOIcategories;
    unsigned int v55 = [(MOEventBundle *)v12 place];
    id v56 = [v55 poiCategory];
    LOBYTE(v54) = [(id)v54 containsObject:v56];

    if (v54)
    {
      id v57 = &off_1002F9470;
      goto LABEL_38;
    }
  }
  else
  {
  }
  uint64_t v58 = [(MOEventBundle *)v12 place];
  [v58 placeNameConfidence];
  if (v59 < 0.9)
  {

LABEL_39:
    id v63 = +[NSNull null];
    [(MOEventBundle *)v12 addMetaDataForRankForKey:@"PoiCategory" value:v63];

    goto LABEL_40;
  }
  CFStringRef v60 = (void *)interestingPOIcategories;
  uint64_t v61 = [(MOEventBundle *)v12 place];
  uint64_t v62 = [v61 poiCategory];
  LODWORD(v60) = [v60 containsObject:v62];

  if (!v60) {
    goto LABEL_39;
  }
  id v57 = &off_1002F9480;
LABEL_38:
  [(MOEventBundle *)v12 addMetaDataForRankForKey:@"PoiCategory" value:v57];
LABEL_40:
  long long v64 = [(MOEventBundle *)v12 place];
  long long v65 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v64 locationMode] == (id)2);
  [(MOEventBundle *)v12 addMetaDataForRankForKey:@"LocationModeTourist" value:v65];

  long long v66 = [(MOEventBundle *)v12 endDate];
  long long v67 = [(MOEventBundle *)v12 startDate];
  [v66 timeIntervalSinceDate:v67];
  double v69 = v68;

  id v70 = +[NSNumber numberWithDouble:v69];
  [(MOEventBundle *)v12 addMetaDataForRankForKey:@"VisitDuration" value:v70];

  double v71 = [(MOEventBundle *)v12 place];
  [v71 familiarityIndexLOI];
  __int16 v72 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(MOEventBundle *)v12 addMetaDataForRankForKey:@"FamiliarityIndex" value:v72];

  double v73 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 24];
  __int16 v74 = [(MOEventBundle *)v12 events];
  double v75 = [v74 filteredArrayUsingPredicate:v73];

  if ([v75 count])
  {
    +[MOContextAnnotationUtilities addStateOfMindResourceForBundle:v12 withEmotionEvents:v75];
    +[MOContextAnnotationUtilities addStateOfMindMetaDataForRankForBundle:v12 withEmotionEvents:v75];
  }
  +[MOVisitAnnotationManager scoreVisitBundleAssets:v12];

  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v95, 8);

LABEL_43:

  return v12;
}

void __61__MOVisitAnnotationManager_annotateBaseEvents_contextEvents___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1[4] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v13 = v7;

  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  uint64_t v11 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

+ (void)scoreVisitBundleAssets:(id)a3
{
  id v3 = a3;
  long long v66 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  id v5 = objc_opt_new();
  double v75 = objc_opt_new();
  double v73 = objc_opt_new();
  v96[0] = GEOPOICategoryAirport;
  v96[1] = GEOPOICategoryAirportGate;
  v96[2] = GEOPOICategoryAirportTerminal;
  id v6 = +[NSArray arrayWithObjects:v96 count:3];
  double v68 = +[NSSet setWithArray:v6];

  id v7 = (void *)v4;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v8 = [v3 resources];
  id v9 = [v8 countByEnumeratingWithState:&v88 objects:v95 count:16];
  double v69 = (void *)v4;
  __int16 v74 = v5;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v89;
    id v67 = v3;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v89 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v88 + 1) + 8 * (void)v12);
        if (objc_msgSend(v13, "type", v66) == (id)2)
        {
          id v14 = [v13 copy];
          uint64_t v15 = v7;
LABEL_10:
          [v15 addObject:v14];

          goto LABEL_11;
        }
        if ([v13 type] == (id)3)
        {
          id v14 = [v13 copy];
          uint64_t v15 = v5;
          goto LABEL_10;
        }
        if ([v13 type] == (id)6)
        {
          uint64_t v16 = [v3 action];
          if (!v16) {
            goto LABEL_23;
          }
          double v17 = (void *)v16;
          unsigned int v18 = [v3 action];
          if ([v18 actionType] != (id)11) {
            goto LABEL_22;
          }
          uint64_t v19 = [v3 place];
          if (!v19) {
            goto LABEL_22;
          }
          uint64_t v20 = (void *)v19;
          __int16 v72 = [v3 place];
          uint64_t v21 = [v72 poiCategory];
          if (!v21)
          {

            id v7 = v69;
LABEL_22:

            id v5 = v74;
LABEL_23:
            [v75 addObject:v13];
            goto LABEL_11;
          }
          id v70 = [v3 place];
          id v22 = [v70 poiCategory];
          unsigned __int8 v71 = [v68 containsObject:v22];

          id v3 = v67;
          id v7 = v69;
          id v5 = v74;
          if (v71) {
            goto LABEL_23;
          }
        }
        if ([v13 type] == (id)16)
        {
          id v23 = [v13 copy];
          [v73 addObject:v23];
        }
LABEL_11:
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v24 = [v8 countByEnumeratingWithState:&v88 objects:v95 count:16];
      id v10 = v24;
    }
    while (v24);
  }

  if (![v7 count] && !v5)
  {
    uint64_t v25 = [v3 place];
    [v25 setPriorityScore:100.0];

    double v26 = v66;
    uint64_t v27 = v75;
    uint64_t v28 = v73;
    goto LABEL_62;
  }
  id v29 = [v7 count:v66];
  double v26 = v66;
  uint64_t v28 = v73;
  if (v29 && [v5 count])
  {
    id v30 = [v7 firstObject];
    [v30 setPriorityScore:100.0];

    double v31 = [v3 place];
    [v31 setPriorityScore:200.0];

    uint64_t v32 = [v5 firstObject];
    [v32 setPriorityScore:201.0];

    BOOL v33 = [v7 firstObject];
    [v66 addObject:v33];

    double v34 = [v5 firstObject];
    [v66 addObject:v34];

    [v7 removeObjectAtIndex:0];
    [v5 removeObjectAtIndex:0];
    if ([v73 count])
    {
      double v35 = [v73 firstObject];
      [v35 setPriorityScore:202.0];

LABEL_37:
      uint64_t v43 = [v73 firstObject];
      [v66 addObject:v43];

      [v73 removeObjectAtIndex:0];
    }
  }
  else
  {
    if ([v7 count])
    {
      double v36 = [v7 firstObject];
      [v36 setPriorityScore:100.0];

      id v37 = [v3 place];
      [v37 setPriorityScore:200.0];

      double v38 = [v7 firstObject];
      [v66 addObject:v38];

      __int16 v39 = v7;
    }
    else
    {
      if (![v5 count]) {
        goto LABEL_38;
      }
      BOOL v40 = [v3 place];
      [v40 setPriorityScore:100.0];

      uint64_t v41 = [v5 firstObject];
      [v41 setPriorityScore:200.0];

      id v42 = [v5 firstObject];
      [v66 addObject:v42];

      __int16 v39 = v5;
    }
    [v39 removeObjectAtIndex:0];
    if ([v73 count]) {
      goto LABEL_37;
    }
  }
LABEL_38:
  id v44 = v3;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v45 = v7;
  id v46 = [v45 countByEnumeratingWithState:&v84 objects:v94 count:16];
  if (v46)
  {
    id v47 = v46;
    int v48 = 0;
    uint64_t v49 = *(void *)v85;
    do
    {
      uint64_t v50 = 0;
      int v51 = v48;
      uint64_t v52 = v48;
      do
      {
        if (*(void *)v85 != v49) {
          objc_enumerationMutation(v45);
        }
        [*(id *)(*((void *)&v84 + 1) + 8 * (void)v50) setPriorityScore:(double)((unint64_t)v50 + v52 + 300)];
        uint64_t v50 = (char *)v50 + 1;
      }
      while (v47 != v50);
      id v47 = [v45 countByEnumeratingWithState:&v84 objects:v94 count:16];
      int v48 = v52 + v50;
    }
    while (v47);
    int v53 = v50 + v51;
    uint64_t v28 = v73;
  }
  else
  {
    int v53 = 0;
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v54 = v74;
  id v55 = [v54 countByEnumeratingWithState:&v80 objects:v93 count:16];
  if (v55)
  {
    id v56 = v55;
    uint64_t v57 = *(void *)v81;
    do
    {
      for (i = 0; i != v56; i = (char *)i + 1)
      {
        if (*(void *)v81 != v57) {
          objc_enumerationMutation(v54);
        }
        [*(id *)(*((void *)&v80 + 1) + 8 * i) setPriorityScore:(double)((unint64_t)i + v53 + 300)];
      }
      id v56 = [v54 countByEnumeratingWithState:&v80 objects:v93 count:16];
      v53 += (int)i;
    }
    while (v56);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v59 = v28;
  id v60 = [v59 countByEnumeratingWithState:&v76 objects:v92 count:16];
  id v7 = v69;
  if (v60)
  {
    id v61 = v60;
    uint64_t v62 = *(void *)v77;
    double v63 = 401.0;
    do
    {
      long long v64 = 0;
      double v65 = v63;
      do
      {
        if (*(void *)v77 != v62) {
          objc_enumerationMutation(v59);
        }
        double v63 = v65 + 1.0;
        [*(id *)(*((void *)&v76 + 1) + 8 * (void)v64) setPriorityScore:v65];
        long long v64 = (char *)v64 + 1;
        double v65 = v65 + 1.0;
      }
      while (v61 != v64);
      id v61 = [v59 countByEnumeratingWithState:&v76 objects:v92 count:16];
    }
    while (v61);
  }

  [v66 addObjectsFromArray:v45];
  [v66 addObjectsFromArray:v54];
  uint64_t v27 = v75;
  [v66 addObjectsFromArray:v75];
  [v66 addObjectsFromArray:v59];
  id v3 = v44;
  id v5 = v74;
LABEL_62:
  [v3 setResources:v26, v66];
}

- (id)actionFromBaseEvents:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[MOAction alloc] initWithActionName:@"visit" actionType:2];
  id v5 = [v3 firstObject];

  id v6 = [v5 eventIdentifier];
  [(MOAction *)v4 setSourceEventIdentifier:v6];

  return v4;
}

- (void)updateActionWithBaseEvents:(id)a3 contextEvents:(id)a4 eventBundle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v62 = a5;
  id v10 = [v8 firstObject];
  uint64_t v11 = [v10 poiCategory];

  uint64_t v12 = [v8 firstObject];
  [v12 confidenceScore];
  double v14 = v13;
  [(MOVisitAnnotationManager *)self visitLabelMediumConfidenceThreshold];
  double v16 = v15;

  double v65 = objc_opt_new();
  double v63 = v8;
  [v65 addObjectsFromArray:v8];
  double v68 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", GEOPOICategoryFoodMarket, GEOPOICategoryStore, 0);
  id v67 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", GEOPOICategoryRestaurant, GEOPOICategoryCafe, GEOPOICategoryBakery, 0);
  long long v66 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", GEOPOICategoryAirport, GEOPOICategoryAirportGate, GEOPOICategoryAirportTerminal, 0);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v17 = v9;
  id v18 = [v17 countByEnumeratingWithState:&v73 objects:v79 count:16];
  uint64_t v19 = "";
  id obj = v17;
  if (!v18)
  {
    double v69 = 0;
    double v35 = 0;
    double v36 = v17;
LABEL_33:

    goto LABEL_35;
  }
  id v20 = v18;
  double v69 = 0;
  unint64_t v70 = 0;
  uint64_t v21 = *(void *)v74;
  do
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v74 != v21) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(void **)(*((void *)&v73 + 1) + 8 * i);
      uint64_t v25 = [(MOVisitAnnotationManager *)self configurationManager];

      if (v25)
      {
        double v26 = [(MOVisitAnnotationManager *)self configurationManager];
        unsigned int v27 = [v26 getBoolSettingForKey:@"EventBundleManagerOverrideEnableLifeEvent" withFallback:1];
      }
      else
      {
        unsigned int v27 = 1;
      }
      uint64_t v28 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v78 = v27;
        _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "eventBundle enable life events (visit annotation manager), %lu", buf, 0xCu);
      }

      if (v27 && [v23 category] == (id)22 && objc_msgSend(v23, "lifeEventCategory") != (id)3)
      {
        [v65 addObject:v23];
        if (v14 >= v16) {
          goto LABEL_28;
        }
        id v34 = [v23 lifeEventCategory];
        if (v34 != (id)4 && v34 != (id)2 && v34 != (id)1) {
          goto LABEL_28;
        }
LABEL_22:
        [v23 confidenceScore];
        if (v31 > (double)v70)
        {
          id v32 = v23;

          [v32 confidenceScore];
          double v69 = v32;
          unint64_t v70 = (unint64_t)v33;
        }
        goto LABEL_28;
      }
      if (!v11) {
        goto LABEL_28;
      }
      id v29 = [v23 lifeEventCategory];
      if (v29 == (id)4)
      {
        id v30 = v66;
      }
      else if (v29 == (id)2)
      {
        id v30 = v67;
      }
      else
      {
        if (v29 != (id)1) {
          goto LABEL_28;
        }
        id v30 = v68;
      }
      if ([v30 containsObject:v11]) {
        goto LABEL_22;
      }
LABEL_28:
    }
    id v17 = obj;
    id v20 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
  }
  while (v20);

  if (v69)
  {
    double v35 = [[MOAction alloc] initWithLifeEvent:v69];
    double v36 = [v69 eventIdentifier];
    [(MOAction *)v35 setSourceEventIdentifier:v36];
    uint64_t v19 = "no stored events to check for creating new workout events" + 57;
    goto LABEL_33;
  }
  double v69 = 0;
  double v35 = 0;
  uint64_t v19 = "";
LABEL_35:
  unsigned __int8 v71 = v35;
  long long v64 = +[MOContextAnnotationUtilities predicateOfEventsWithPlaySessions];
  id v37 = [v17 filteredArrayUsingPredicate:];
  double v38 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    id v39 = [v37 count];
    *(_DWORD *)buf = *((void *)v19 + 291);
    unint64_t v78 = (unint64_t)v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "annotateEventBundle Media Events (Playback), %lu", buf, 0xCu);
  }

  BOOL v40 = +[NSNumber numberWithUnsignedInt:2];
  uint64_t v41 = +[NSArray arrayWithObject:v40];

  id v60 = (void *)v41;
  id v61 = v37;
  id v42 = +[MOContextAnnotationUtilities annotateEventBundle:v62 playbackMediaEvents:v37 lessSignificantPlaySessionMediaTypes:v41];
  [v65 addObjectsFromArray:v42];
  uint64_t v43 = [v62 startDate];
  id v44 = [v62 endDate];
  id v45 = +[MOContextAnnotationUtilities predicateOfEmotionLogsWithStartDate:v43 endDate:v44];

  id v46 = [obj filteredArrayUsingPredicate:v45];
  [(MOVisitAnnotationManager *)self emotionAttachmentBundleDurationThreshold];
  *(float *)&double v47 = v47;
  int v48 = +[MOContextAnnotationUtilities annotateEventBundle:v62 dateIntervalEvents:v63 emotionEvents:v46 bundleDurationThreshold:v47];
  [v65 addObjectsFromArray:v48];
  uint64_t v49 = v71;
  if (v71)
  {
    [v62 setAction:v71];
    uint64_t v50 = [v62 action];
    id v51 = [v50 actionType];

    uint64_t v52 = v62;
    if (v51 == (id)9)
    {
      uint64_t v53 = 104;
      goto LABEL_43;
    }
    id v55 = [v62 action];
    id v56 = [v55 actionType];

    if (v56 == (id)10)
    {
      uint64_t v53 = 103;
LABEL_43:
      uint64_t v49 = v71;
LABEL_44:
      [v62 setBundleSubType:v53];
    }
    else
    {
      uint64_t v57 = [v62 action];
      id v58 = [v57 actionType];

      BOOL v59 = v58 == (id)11;
      uint64_t v49 = v71;
      if (v59)
      {
        uint64_t v53 = 102;
        goto LABEL_44;
      }
    }
    id v54 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
      -[MOVisitAnnotationManager updateActionWithBaseEvents:contextEvents:eventBundle:](v62, v54);
    }
  }
  else
  {
    id v54 = [(MOVisitAnnotationManager *)self actionFromBaseEvents:v63];
    [v62 setAction:v54];
    uint64_t v52 = v62;
  }

  [v52 addEvents:v65];
}

- (id)placeFromBaseEvents:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MOContextAnnotationUtilities majorityGroupFromEvents:v6 propertyPath:@"placeName" valuePath:@"duration"];
  if (v7 && [v7 actionType] == (id)11) {
    id v9 = self->_flightPoiCategories;
  }
  else {
    id v9 = 0;
  }
  lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
  [(MOVisitAnnotationManager *)self visitLabelMediumConfidenceThreshold];
  double v12 = v11;
  [(MOVisitAnnotationManager *)self visitLabelHighConfidenceThreshold];
  double v14 = v13;
  [(MOVisitAnnotationManager *)self aoiVisitLabelConfidentThreshold];
  double v16 = v15;
  id v17 = [(MOAnnotationManager *)self fUniverse];
  id v18 = +[MOContextAnnotationUtilities placeFromVisitEvents:v8 preferredCategories:v9 poiCategoryBlocklist:lessInterestingPoiCategories mediumConfidenceThreshold:v17 highConfidenceThreshold:v12 aoiConfidenceThreshold:v14 universe:v16];

  if ([v18 placeUserType] == (id)2 || objc_msgSend(v18, "placeUserType") == (id)1) {
    [v18 setPlaceNameConfidence:-1.0];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v19 = v6;
  id v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v20)
  {

LABEL_18:
    [v18 setPlaceNameConfidence:-1.0];
    goto LABEL_19;
  }
  id v21 = v20;
  id v35 = v7;
  id v22 = v9;
  id v23 = v8;
  uint64_t v24 = *(void *)v37;
  double v25 = 0.0;
  do
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v37 != v24) {
        objc_enumerationMutation(v19);
      }
      unsigned int v27 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      uint64_t v28 = [v27 endDate];
      id v29 = [v27 startDate];
      [v28 timeIntervalSinceDate:v29];
      double v25 = v25 + v30;
    }
    id v21 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v21);

  id v8 = v23;
  id v9 = v22;
  id v7 = v35;
  if (v25 < 480.0) {
    goto LABEL_18;
  }
LABEL_19:
  if (![v18 placeUserType])
  {
    outingEligiblePoiCategories = self->_outingEligiblePoiCategories;
    id v32 = [v18 poiCategory];
    LODWORD(outingEligiblePoiCategories) = [(NSSet *)outingEligiblePoiCategories containsObject:v32];

    if (outingEligiblePoiCategories) {
      [v18 setPlaceUserType:100];
    }
    double v33 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[MOVisitAnnotationManager placeFromBaseEvents:action:]((uint64_t)v18, v33);
    }
  }

  return v18;
}

- (id)resourcesFromBaseEvents:(id)a3
{
  uint64_t v4 = +[MOContextAnnotationUtilities majorityGroupFromEvents:a3 propertyPath:@"placeName" valuePath:@"duration"];
  id v5 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v36 = *(void *)v38;
    *(void *)&long long v7 = 138412802;
    long long v33 = v7;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v38 != v36) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v9);
        lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
        [(MOVisitAnnotationManager *)self visitLabelMediumConfidenceThreshold];
        double v13 = v12;
        [(MOVisitAnnotationManager *)self visitLabelHighConfidenceThreshold];
        double v15 = v14;
        [(MOVisitAnnotationManager *)self aoiVisitLabelConfidentThreshold];
        double v17 = v16;
        id v18 = [(MOAnnotationManager *)self fUniverse];
        id v19 = +[MOContextAnnotationUtilities placeFromVisitEvent:v10 preferredCategories:0 poiCategoryBlocklist:lessInterestingPoiCategories mediumConfidenceThreshold:v18 highConfidenceThreshold:v13 aoiConfidenceThreshold:v15 universe:v17];

        id v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          double v26 = (objc_class *)objc_opt_class();
          unsigned int v27 = NSStringFromClass(v26);
          id v34 = [v19 placeName];
          uint64_t v28 = [v34 mask];
          id v29 = [v10 placeMapItem];
          id v30 = [v29 length];
          *(_DWORD *)buf = v33;
          id v42 = v27;
          __int16 v43 = 2112;
          id v44 = v28;
          __int16 v45 = 2048;
          id v46 = v30;
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@: resourcesFromBaseEvents, place, %@, mapItem.length, %lu", buf, 0x20u);
        }
        id v21 = [MOResource alloc];
        id v22 = [v19 placeName];
        id v23 = [v10 placeMapItem];
        uint64_t v24 = [(MOResource *)v21 initWithName:v22 mapItemHandle:v23 priorityScore:-1.0];

        double v25 = [v10 eventIdentifier];
        [(MOResource *)v24 setSourceEventIdentifier:v25];

        [v5 addObject:v24];
        id v9 = (char *)v9 + 1;
      }
      while (v8 != v9);
      id v8 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    id v31 = [v5 copy];
  }
  else {
    id v31 = 0;
  }

  return v31;
}

- (id)predominantWeatherFromBaseEvents:(id)a3
{
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v18;
    double v8 = -1.79769313e308;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v11 = [v10 endDate];
        double v12 = [v10 startDate];
        [v11 timeIntervalSinceDate:v12];
        double v14 = v13;

        if (v14 > v8)
        {
          uint64_t v15 = [v10 predominantWeather];

          id v6 = (void *)v15;
          double v8 = v14;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)buildPromptDescriptionForEventBundle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 action];
  id v5 = [v4 actionName];

  uint64_t v6 = [v3 actions];
  if (v6
    && (uint64_t v7 = (void *)v6,
        [v3 actions],
        double v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 count],
        v8,
        v7,
        v9))
  {
    id v10 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"actionType", 2];
    double v11 = [v3 actions];
    double v12 = [v11 filteredArrayUsingPredicate:v10];

    id v13 = [v12 count];
    BOOL v14 = v13 != 0;
    if (v13)
    {
      uint64_t v15 = [v12 firstObject];
      uint64_t v16 = [v15 actionName];

      id v5 = (__CFString *)v16;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  long long v17 = [v3 place];
  if (v17)
  {
    long long v18 = [v3 place];
    long long v19 = [v18 placeName];

    if (v19)
    {
      long long v20 = [v3 place];
      id v21 = [v20 promptDescription];
      long long v17 = +[NSString stringWithFormat:@" %@", v21];
    }
    else
    {
      long long v17 = 0;
    }
  }
  id v22 = [v3 persons];
  if (v22)
  {
    id v23 = [v3 persons];
    id v24 = [v23 count];

    if (!v24)
    {
      id v22 = 0;
      if (v14) {
        goto LABEL_34;
      }
      goto LABEL_24;
    }
    double v25 = [v3 persons];
    id v22 = +[MOContextAnnotationUtilities andStringFromArray:v25 propertyPath:@"name" maxCount:3];

    if (v22) {
      char v26 = 1;
    }
    else {
      char v26 = v14;
    }
    if (v22) {
      int v27 = v14;
    }
    else {
      int v27 = 1;
    }
    if (v27 != 1)
    {
      long long v37 = [v3 persons];
      id v38 = [v37 count];

      if ((unint64_t)v38 <= 3) {
        goto LABEL_34;
      }
      id v34 = v5;
      id v5 = @"Social Time";
      uint64_t v32 = (uint64_t)v22;
      id v22 = 0;
      goto LABEL_31;
    }
    LOBYTE(v14) = v26;
  }
  if (v14) {
    goto LABEL_34;
  }
LABEL_24:
  if (!v17)
  {
    CFStringRef v39 = @"Outing";
    goto LABEL_33;
  }
  uint64_t v28 = [v3 actions];
  if (v28)
  {
    id v29 = (void *)v28;
    id v30 = [v3 actions];
    id v31 = [v30 count];

    if (v31)
    {
      uint64_t v32 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"actionType", 3];
      long long v33 = [v3 actions];
      id v34 = [v33 filteredArrayUsingPredicate:v32];

      if ([v34 count])
      {
        id v35 = [v34 firstObject];
        uint64_t v36 = [v35 actionName];

        id v5 = (__CFString *)v36;
      }
LABEL_31:
      CFStringRef v39 = v5;

      id v5 = (__CFString *)v32;
LABEL_33:

      id v5 = (__CFString *)v39;
    }
  }
LABEL_34:
  long long v40 = objc_opt_new();
  [v40 appendString:v5];
  if (v17) {
    [v40 appendString:v17];
  }
  if (v22) {
    [v40 appendString:v22];
  }
  id v41 = [v40 copy];

  return v41;
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (double)visitLabelMediumConfidenceThreshold
{
  return self->_visitLabelMediumConfidenceThreshold;
}

- (void)setVisitLabelMediumConfidenceThreshold:(double)a3
{
  self->_visitLabelMediumConfidenceThreshold = a3;
}

- (double)visitLabelHighConfidenceThreshold
{
  return self->_visitLabelHighConfidenceThreshold;
}

- (void)setVisitLabelHighConfidenceThreshold:(double)a3
{
  self->_visitLabelHighConfidenceThreshold = a3;
}

- (double)aoiVisitLabelConfidentThreshold
{
  return self->_aoiVisitLabelConfidentThreshold;
}

- (void)setAoiVisitLabelConfidentThreshold:(double)a3
{
  self->_aoiVisitLabelConfidentThreshold = a3;
}

- (double)timeIntervalThresholdDefault
{
  return self->_timeIntervalThresholdDefault;
}

- (void)setTimeIntervalThresholdDefault:(double)a3
{
  self->_timeIntervalThresholdDefault = a3;
}

- (double)distanceThresholdDefault
{
  return self->_distanceThresholdDefault;
}

- (void)setDistanceThresholdDefault:(double)a3
{
  self->_distanceThresholdDefault = a3;
}

- (double)timeIntervalThresholdWithSamePlaceName
{
  return self->_timeIntervalThresholdWithSamePlaceName;
}

- (void)setTimeIntervalThresholdWithSamePlaceName:(double)a3
{
  self->_timeIntervalThresholdWithSamePlaceName = a3;
}

- (double)distanceThresholdWithSamePlaceName
{
  return self->_distanceThresholdWithSamePlaceName;
}

- (void)setDistanceThresholdWithSamePlaceName:(double)a3
{
  self->_distanceThresholdWithSamePlaceName = a3;
}

- (double)timeIntervalThresholdForCoarseGroup
{
  return self->_timeIntervalThresholdForCoarseGroup;
}

- (void)setTimeIntervalThresholdForCoarseGroup:(double)a3
{
  self->_timeIntervalThresholdForCoarseGroup = a3;
}

- (double)distanceThresholdForCoarseGroup
{
  return self->_distanceThresholdForCoarseGroup;
}

- (void)setDistanceThresholdForCoarseGroup:(double)a3
{
  self->_distanceThresholdForCoarseGroup = a3;
}

- (double)aoiRangeWeight
{
  return self->_aoiRangeWeight;
}

- (void)setAoiRangeWeight:(double)a3
{
  self->_aoiRangeWeight = a3;
}

- (double)aoiMergingRangeMinimumThreshold
{
  return self->_aoiMergingRangeMinimumThreshold;
}

- (void)setAoiMergingRangeMinimumThreshold:(double)a3
{
  self->_aoiMergingRangeMinimumThreshold = a3;
}

- (double)largeAoiMergingRangeMinimumThreshold
{
  return self->_largeAoiMergingRangeMinimumThreshold;
}

- (void)setLargeAoiMergingRangeMinimumThreshold:(double)a3
{
  self->_largeAoiMergingRangeMinimumThreshold = a3;
}

- (double)recommendedTabVisitFIThreshold
{
  return self->_recommendedTabVisitFIThreshold;
}

- (void)setRecommendedTabVisitFIThreshold:(double)a3
{
  self->_recommendedTabVisitFIThreshold = a3;
}

- (double)emotionAttachmentBundleDurationThreshold
{
  return self->_emotionAttachmentBundleDurationThreshold;
}

- (void)setEmotionAttachmentBundleDurationThreshold:(double)a3
{
  self->_emotionAttachmentBundleDurationThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_largeAOICategories, 0);
  objc_storeStrong((id *)&self->_AOIGroupingEligiblePoiCategories, 0);
  objc_storeStrong((id *)&self->_outingEligiblePoiCategories, 0);
  objc_storeStrong((id *)&self->_flightPoiCategories, 0);

  objc_storeStrong((id *)&self->_lessInterestingPoiCategories, 0);
}

- (void)printGroupedEvents:(NSObject *)a3 tag:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4 = 138412802;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  CFStringRef v7 = &stru_1002D2AC8;
  __int16 v8 = 2048;
  id v9 = [a2 count];
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@: %@ groupedEvents, total count, %lu", (uint8_t *)&v4, 0x20u);
}

- (void)postprocessGroupedEvents:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  __int16 v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  __int16 v8 = v6;
  __int16 v9 = 2048;
  id v10 = [a2 count];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@: input groups, %lu, output groups, 0", (uint8_t *)&v7, 0x16u);
}

- (void)updateActionWithBaseEvents:(void *)a1 contextEvents:(NSObject *)a2 eventBundle:.cold.1(void *a1, NSObject *a2)
{
  id v3 = [a1 action];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "eventBundle life event action, %@", (uint8_t *)&v4, 0xCu);
}

- (void)placeFromBaseEvents:(uint64_t)a1 action:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "eventBundle place is an outing worth place, %@", (uint8_t *)&v2, 0xCu);
}

@end