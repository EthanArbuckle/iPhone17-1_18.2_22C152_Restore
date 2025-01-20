@interface MOPreOnboardedVisitAnnotationManager
+ (void)scoreVisitBundleAssets:(id)a3;
- (MOConfigurationManager)configurationManager;
- (MOPreOnboardedVisitAnnotationManager)initWithUniverse:(id)a3;
- (RTRoutineManager)routineManager;
- (double)aoiVisitLabelConfidentThreshold;
- (double)distanceThresholdDefault;
- (double)distanceThresholdWithSamePlaceName;
- (double)recommendedTabVisitFIThreshold;
- (double)timeIntervalThresholdDefault;
- (double)timeIntervalThresholdWithSamePlaceName;
- (double)visitLabelHighConfidenceThreshold;
- (double)visitLabelMediumConfidenceThreshold;
- (id)actionFromBaseEvents:(id)a3;
- (id)annotateBaseEvents:(id)a3 contextEvents:(id)a4;
- (id)buildPromptDescriptionForEventBundle:(id)a3;
- (id)getBaseEvents:(id)a3;
- (id)getContextEventsForBaseEvents:(id)a3 events:(id)a4 withPatternEvents:(id)a5;
- (id)groupBaseEvents:(id)a3;
- (id)placeFromBaseEvents:(id)a3 action:(id)a4;
- (id)resourcesFromBaseEvents:(id)a3;
- (void)setAoiVisitLabelConfidentThreshold:(double)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setDistanceThresholdDefault:(double)a3;
- (void)setDistanceThresholdWithSamePlaceName:(double)a3;
- (void)setRecommendedTabVisitFIThreshold:(double)a3;
- (void)setRoutineManager:(id)a3;
- (void)setTimeIntervalThresholdDefault:(double)a3;
- (void)setTimeIntervalThresholdWithSamePlaceName:(double)a3;
- (void)setVisitLabelHighConfidenceThreshold:(double)a3;
- (void)setVisitLabelMediumConfidenceThreshold:(double)a3;
@end

@implementation MOPreOnboardedVisitAnnotationManager

- (MOPreOnboardedVisitAnnotationManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)MOPreOnboardedVisitAnnotationManager;
  v5 = [(MOTimeContextAnnotationManager *)&v41 initWithUniverse:v4];
  if (v5)
  {
    v44[0] = GEOPOICategoryATM;
    v44[1] = GEOPOICategoryEVCharger;
    v44[2] = GEOPOICategoryParking;
    v44[3] = GEOPOICategoryPublicTransport;
    v44[4] = GEOPOICategoryRestroom;
    v6 = +[NSArray arrayWithObjects:v44 count:5];
    uint64_t v7 = +[NSSet setWithArray:v6];
    lessInterestingPoiCategories = v5->_lessInterestingPoiCategories;
    v5->_lessInterestingPoiCategories = (NSSet *)v7;

    v43[0] = GEOPOICategoryAirport;
    v43[1] = GEOPOICategoryAirportGate;
    v43[2] = GEOPOICategoryAirportTerminal;
    v9 = +[NSArray arrayWithObjects:v43 count:3];
    uint64_t v10 = +[NSSet setWithArray:v9];
    flightPoiCategories = v5->_flightPoiCategories;
    v5->_flightPoiCategories = (NSSet *)v10;

    v42[0] = GEOPOICategoryAmusementPark;
    v42[1] = GEOPOICategoryAquarium;
    v42[2] = GEOPOICategoryBakery;
    v42[3] = GEOPOICategoryBeach;
    v42[4] = GEOPOICategoryBrewery;
    v42[5] = GEOPOICategoryCafe;
    v42[6] = GEOPOICategoryMarina;
    v42[7] = GEOPOICategoryMovieTheater;
    v42[8] = GEOPOICategoryMuseum;
    v42[9] = GEOPOICategoryNationalPark;
    v42[10] = GEOPOICategoryNightlife;
    v42[11] = GEOPOICategoryPark;
    v42[12] = GEOPOICategoryPlayground;
    v42[13] = GEOPOICategoryRestaurant;
    v42[14] = GEOPOICategoryStadium;
    v42[15] = GEOPOICategoryTheater;
    v42[16] = GEOPOICategoryWinery;
    v42[17] = GEOPOICategoryZoo;
    v12 = +[NSArray arrayWithObjects:v42 count:18];
    uint64_t v13 = +[NSSet setWithArray:v12];
    outingEligiblePoiCategories = v5->_outingEligiblePoiCategories;
    v5->_outingEligiblePoiCategories = (NSSet *)v13;

    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = [v4 getService:v16];

    uint64_t v18 = [v17 routineManager];
    routineManager = v5->_routineManager;
    v5->_routineManager = (RTRoutineManager *)v18;

    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    uint64_t v22 = [v4 getService:v21];
    configurationManager = v5->_configurationManager;
    v5->_configurationManager = (MOConfigurationManager *)v22;

    HIDWORD(v24) = 1072483532;
    *(float *)&double v24 = 0.9;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VA_VisitLabelMediumConfidenceThreshold" withFallback:v24];
    v5->_visitLabelMediumConfidenceThreshold = v25;
    HIDWORD(v26) = 1072588390;
    *(float *)&double v26 = 0.95;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VA_VisitLabelHighConfidenceThreshold" withFallback:v26];
    v5->_visitLabelHighConfidenceThreshold = v27;
    HIDWORD(v28) = 1071644672;
    *(float *)&double v28 = 0.5;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VA_AOIVisitLabelConfidentThreshold" withFallback:v28];
    double v30 = v29;
    v5->_aoiVisitLabelConfidentThreshold = v30;
    LODWORD(v30) = 1133903872;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VA_AdjacentVisitEventInterval" withFallback:v30];
    double v32 = v31;
    v5->_timeIntervalThresholdDefault = v32;
    LODWORD(v32) = 1109393408;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VA_AdjacentVisitEventMaximumDistanceKeyword" withFallback:v32];
    double v34 = v33;
    v5->_distanceThresholdDefault = v34;
    LODWORD(v34) = 1163984896;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VA_AdjacentVisitEventWithTheSamePlaceNameInterval" withFallback:v34];
    double v36 = v35;
    v5->_timeIntervalThresholdWithSamePlaceName = v36;
    LODWORD(v36) = -1.0;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VA_AdjacentVisitEventWithTheSamePlaceNameMaximumDistance" withFallback:v36];
    v5->_distanceThresholdWithSamePlaceName = v37;
    HIDWORD(v38) = 1072483532;
    *(float *)&double v38 = 0.9;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VA_RecommendedTabVisitFIThreshold" withFallback:v38];
    v5->_recommendedTabVisitFIThreshold = v39;
  }
  return v5;
}

- (id)getBaseEvents:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 1];
  v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (id)groupBaseEvents:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    id v55 = &__NSArray0__struct;
    goto LABEL_49;
  }
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v57 = v4;
  id obj = v4;
  id v63 = [obj countByEnumeratingWithState:&v64 objects:v80 count:16];
  uint64_t v7 = 0;
  if (!v63) {
    goto LABEL_45;
  }
  uint64_t v8 = *(void *)v65;
  uint64_t v61 = *(void *)v65;
  v58 = self;
  v59 = v5;
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
          uint64_t v13 = v7;
          v6 = (void *)v12;
        }
        else
        {
          uint64_t v13 = v7;
        }
        uint64_t v7 = 0;
        goto LABEL_43;
      }
      if (v7)
      {
        [(MOPreOnboardedVisitAnnotationManager *)self timeIntervalThresholdDefault];
        double v15 = v14;
        [(MOPreOnboardedVisitAnnotationManager *)self distanceThresholdDefault];
        double v17 = v16;
        uint64_t v18 = [v7 placeName];
        if (!v18)
        {
          v60 = [v10 placeName];
          if (!v60)
          {
            v60 = 0;
            goto LABEL_27;
          }
        }
        uint64_t v19 = [v7 placeName];
        if (v19)
        {
          v20 = (void *)v19;
          uint64_t v21 = [v10 placeName];
          if (v21)
          {
            uint64_t v22 = (void *)v21;
            v23 = [v7 placeName];
            double v24 = [v10 placeName];
            unsigned int v25 = [v23 isEqualToString:v24];

            if (v18)
            {

              self = v58;
              v5 = v59;
              if (!v25)
              {
LABEL_30:
                float v31 = [v10 startDate];
                double v32 = [v7 endDate];
                [v31 timeIntervalSinceDate:v32];
                double v34 = v33;

                uint64_t v35 = [v7 location];
                double v36 = 0.0;
                if (v35)
                {
                  float v37 = (void *)v35;
                  double v38 = [v10 location];

                  if (v38)
                  {
                    float v39 = [v7 location];
                    v40 = [v10 location];
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
                    v6 = (void *)v43;
                  }
                  v44 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    v49 = (objc_class *)objc_opt_class();
                    v50 = NSStringFromClass(v49);
                    *(_DWORD *)buf = 138413314;
                    v69 = v50;
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
                v45 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                {
                  v46 = (objc_class *)objc_opt_class();
                  v47 = NSStringFromClass(v46);
                  v48 = [v10 eventIdentifier];
                  *(_DWORD *)buf = 138413570;
                  v69 = v47;
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
                uint64_t v13 = v7;
                uint64_t v7 = v10;
                goto LABEL_43;
              }
            }
            else
            {

              self = v58;
              v5 = v59;
              if ((v25 & 1) == 0) {
                goto LABEL_30;
              }
            }
LABEL_27:
            [(MOPreOnboardedVisitAnnotationManager *)self timeIntervalThresholdWithSamePlaceName];
            double v15 = v29;
            [(MOPreOnboardedVisitAnnotationManager *)self distanceThresholdWithSamePlaceName];
            double v17 = v30;
            uint64_t v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              v51 = (objc_class *)objc_opt_class();
              v52 = NSStringFromClass(v51);
              v53 = [v10 eventIdentifier];
              *(_DWORD *)buf = 138412546;
              v69 = v52;
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
      uint64_t v7 = v10;
      uint64_t v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        double v26 = (objc_class *)objc_opt_class();
        float v27 = NSStringFromClass(v26);
        double v28 = [v7 eventIdentifier];
        *(_DWORD *)buf = 138412546;
        v69 = v27;
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
  return 0;
}

- (id)annotateBaseEvents:(id)a3 contextEvents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 count])
  {
    id v11 = 0;
    goto LABEL_27;
  }
  uint64_t v8 = [MOEventBundle alloc];
  v9 = +[NSUUID UUID];
  uint64_t v10 = +[NSDate date];
  id v11 = [(MOEventBundle *)v8 initWithBundleIdentifier:v9 creationDate:v10];

  [(MOEventBundle *)v11 setInterfaceType:2];
  [(MOEventBundle *)v11 setBundleSuperType:1];
  [(MOEventBundle *)v11 setBundleSubType:106];
  uint64_t v12 = [v6 lastObject];
  uint64_t v13 = [v12 endDate];
  double v14 = [(MOAnnotationManager *)self timeZoneManager];
  double v15 = +[MOTime timeForDate:v13 timeZoneManager:v14];
  [(MOEventBundle *)v11 setTime:v15];

  [(MOEventBundle *)v11 setPropertiesBasedOnEvents];
  double v16 = [v6 firstObject];
  double v17 = [v16 startDate];
  [(MOEventBundle *)v11 setStartDate:v17];

  uint64_t v18 = [v6 lastObject];
  uint64_t v19 = [v18 endDate];
  [(MOEventBundle *)v11 setEndDate:v19];

  v20 = [(MOPreOnboardedVisitAnnotationManager *)self resourcesFromBaseEvents:v6];
  [(MOEventBundle *)v11 setResources:v20];

  id v21 = [v6 copy];
  [(MOEventBundle *)v11 setEvents:v21];

  uint64_t v22 = [(MOPreOnboardedVisitAnnotationManager *)self actionFromBaseEvents:v6];
  [(MOEventBundle *)v11 setAction:v22];

  v23 = [(MOEventBundle *)v11 action];
  double v24 = [(MOPreOnboardedVisitAnnotationManager *)self placeFromBaseEvents:v6 action:v23];
  [(MOEventBundle *)v11 setPlace:v24];

  uint64_t v75 = 0;
  __int16 v76 = &v75;
  uint64_t v77 = 0x3032000000;
  __int16 v78 = __Block_byref_object_copy__35;
  double v79 = __Block_byref_object_dispose__35;
  id v80 = (id)objc_opt_new();
  uint64_t v71 = 0;
  __int16 v72 = &v71;
  uint64_t v73 = 0x2020000000;
  uint64_t v74 = 0;
  uint64_t v65 = 0;
  long long v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__35;
  v69 = __Block_byref_object_dispose__35;
  id v70 = (id)objc_opt_new();
  v64.receiver = self;
  v64.super_class = (Class)MOPreOnboardedVisitAnnotationManager;
  uint64_t v25 = [(MOAnnotationManager *)&v64 fUniverse];
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = __73__MOPreOnboardedVisitAnnotationManager_annotateBaseEvents_contextEvents___block_invoke;
  v63[3] = &unk_1002C99D0;
  v63[4] = &v75;
  v63[5] = &v71;
  v63[6] = &v65;
  +[MOContextAnnotationUtilities addPhotoResources:v11 universe:v25 handler:v63];

  double v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    float v27 = (objc_class *)objc_opt_class();
    uint64_t v25 = NSStringFromClass(v27);
    uint64_t v28 = v72[3];
    *(_DWORD *)buf = 138412546;
    uint64_t v82 = v25;
    __int16 v83 = 2048;
    uint64_t v84 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%@: visit, photoSource, %lu", buf, 0x16u);
  }
  [(MOEventBundle *)v11 setResources:v76[5]];
  [(MOEventBundle *)v11 setPhotoSource:v72[3]];
  id v29 = [(id)v66[5] copy];
  [(MOEventBundle *)v11 setPhotoTraits:v29];

  if ([(id)v76[5] count])
  {
    double v30 = [(MOEventBundle *)v11 place];
    [v30 placeNameConfidence];
    uint64_t v25 = v31 < 0.0;

    if (v25)
    {
      double v32 = [(MOEventBundle *)v11 place];
      [v32 setPlaceNameConfidence:0.0];
    }
  }
  double v33 = [(MOEventBundle *)v11 place];
  id v34 = [v33 placeUserType];
  if (v34 == (id)2
    || ([(MOEventBundle *)v11 place],
        uint64_t v25 = objc_claimAutoreleasedReturnValue(),
        [(id)v25 familiarityIndexLOI],
        v35 > self->_recommendedTabVisitFIThreshold))
  {
    unint64_t v36 = [(MOEventBundle *)v11 photoSource];
    if (v34 == (id)2)
    {
      BOOL v37 = v36 == 0;

      if (!v37) {
        goto LABEL_16;
      }
    }
    else
    {
      BOOL v38 = v36 == 0;

      if (!v38) {
        goto LABEL_16;
      }
    }
    [(MOEventBundle *)v11 setSummarizationGranularity:1];
  }
  else
  {
  }
LABEL_16:
  float v39 = [(MOEventBundle *)v11 place];
  [v39 distanceToHomeInMiles];
  v40 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(MOEventBundle *)v11 addMetaDataForRankForKey:@"DistanceToHome" value:v40];

  double v41 = [(MOEventBundle *)v11 place];
  [v41 placeNameConfidence];
  if (v42 <= 0.95)
  {

LABEL_20:
    v47 = [(MOEventBundle *)v11 place];
    [v47 placeNameConfidence];
    if (v48 <= 0.95)
    {
    }
    else
    {
      v49 = (void *)interestingPOIcategories;
      v50 = [(MOEventBundle *)v11 place];
      v51 = [v50 poiCategory];
      LODWORD(v49) = [v49 containsObject:v51];

      if (v49)
      {
        v46 = &off_1002F96E0;
        goto LABEL_23;
      }
    }
    v52 = +[NSNull null];
    [(MOEventBundle *)v11 addMetaDataForRankForKey:@"PoiCategory" value:v52];

    goto LABEL_26;
  }
  uint64_t v43 = nonInterestingPOIcategories;
  v44 = [(MOEventBundle *)v11 place];
  v45 = [v44 poiCategory];
  LOBYTE(v43) = [(id)v43 containsObject:v45];

  if ((v43 & 1) == 0) {
    goto LABEL_20;
  }
  v46 = &off_1002F96D0;
LABEL_23:
  [(MOEventBundle *)v11 addMetaDataForRankForKey:@"PoiCategory" value:v46];
LABEL_26:
  v53 = [(MOEventBundle *)v11 place];
  id v54 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v53 locationMode] == (id)2);
  [(MOEventBundle *)v11 addMetaDataForRankForKey:@"LocationModeTourist" value:v54];

  id v55 = [(MOEventBundle *)v11 endDate];
  v56 = [(MOEventBundle *)v11 startDate];
  [v55 timeIntervalSinceDate:v56];
  double v58 = v57;

  v59 = +[NSNumber numberWithDouble:v58];
  [(MOEventBundle *)v11 addMetaDataForRankForKey:@"VisitDuration" value:v59];

  v60 = [(MOEventBundle *)v11 place];
  [v60 familiarityIndexLOI];
  uint64_t v61 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(MOEventBundle *)v11 addMetaDataForRankForKey:@"FamiliarityIndex" value:v61];

  +[MOPreOnboardedVisitAnnotationManager scoreVisitBundleAssets:v11];
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);

LABEL_27:

  return v11;
}

void __73__MOPreOnboardedVisitAnnotationManager_annotateBaseEvents_contextEvents___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
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
  id v4 = objc_opt_new();
  v5 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = [v3 resources];
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v12 type] == (id)2)
        {
          id v13 = [v12 copy];
          [v5 addObject:v13];
        }
        else if ([v12 type] == (id)6)
        {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  if ([v5 count])
  {
    if ([v5 count])
    {
      double v14 = [v5 firstObject];
      [v14 setPriorityScore:100.0];

      double v15 = [v3 place];
      [v15 setPriorityScore:200.0];

      double v16 = [v5 firstObject];
      [v4 addObject:v16];

      [v5 removeObjectAtIndex:0];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v17 = v5;
      id v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v18)
      {
        id v19 = v18;
        int v20 = 0;
        uint64_t v21 = *(void *)v26;
        do
        {
          uint64_t v22 = 0;
          uint64_t v23 = v20;
          do
          {
            if (*(void *)v26 != v21) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v25 + 1) + 8 * (void)v22) setPriorityScore:(double)((unint64_t)v22 + v23 + 300) v25];
            uint64_t v22 = (char *)v22 + 1;
          }
          while (v19 != v22);
          id v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
          int v20 = v23 + v22;
        }
        while (v19);
      }

      [v4 addObjectsFromArray:v17];
      [v4 addObjectsFromArray:v6];
    }
    [v3 setResources:v4, v25];
  }
  else
  {
    double v24 = [v3 place];
    [v24 setPriorityScore:100.0];
  }
}

- (id)actionFromBaseEvents:(id)a3
{
  id v3 = a3;
  id v4 = [[MOAction alloc] initWithActionName:@"visit" actionType:2];
  v5 = [v3 firstObject];

  id v6 = [v5 eventIdentifier];
  [(MOAction *)v4 setSourceEventIdentifier:v6];

  return v4;
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
  [(MOPreOnboardedVisitAnnotationManager *)self visitLabelMediumConfidenceThreshold];
  double v12 = v11;
  [(MOPreOnboardedVisitAnnotationManager *)self visitLabelHighConfidenceThreshold];
  double v14 = v13;
  [(MOPreOnboardedVisitAnnotationManager *)self aoiVisitLabelConfidentThreshold];
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
  uint64_t v22 = v9;
  uint64_t v23 = v8;
  uint64_t v24 = *(void *)v37;
  double v25 = 0.0;
  do
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v37 != v24) {
        objc_enumerationMutation(v19);
      }
      long long v27 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      long long v28 = [v27 endDate];
      long long v29 = [v27 startDate];
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
    long long v32 = [v18 poiCategory];
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
  p_cache = MOGraph.cache;
  v5 = +[MOContextAnnotationUtilities majorityGroupFromEvents:a3 propertyPath:@"placeName" valuePath:@"duration"];
  long long v39 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v42;
    uint64_t v10 = &OBJC_IVAR___MOPhotoManager__visualIdentifierView;
    *(void *)&long long v7 = 138412802;
    long long v37 = v7;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v11);
        uint64_t v13 = *(uint64_t *)((char *)&self->super.super.super.isa + v10[2]);
        [(MOPreOnboardedVisitAnnotationManager *)self visitLabelMediumConfidenceThreshold];
        double v15 = v14;
        [(MOPreOnboardedVisitAnnotationManager *)self visitLabelHighConfidenceThreshold];
        double v17 = v16;
        [(MOPreOnboardedVisitAnnotationManager *)self aoiVisitLabelConfidentThreshold];
        double v19 = v18;
        id v20 = [(MOAnnotationManager *)self fUniverse];
        id v21 = [p_cache + 138 placeFromVisitEvent:v12 preferredCategories:0 poiCategoryBlocklist:v13 mediumConfidenceThreshold:v20 highConfidenceThreshold:v15 aoiConfidenceThreshold:v17 universe:v19];

        uint64_t v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          double v30 = (objc_class *)objc_opt_class();
          long long v31 = NSStringFromClass(v30);
          long long v38 = [v21 placeName];
          long long v32 = [v38 mask];
          double v33 = [v12 placeMapItem];
          id v34 = [v33 length];
          *(_DWORD *)buf = v37;
          v46 = v31;
          __int16 v47 = 2112;
          double v48 = v32;
          __int16 v49 = 2048;
          id v50 = v34;
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@: resourcesFromBaseEvents, place, %@, mapItem.length, %lu", buf, 0x20u);

          uint64_t v10 = &OBJC_IVAR___MOPhotoManager__visualIdentifierView;
          p_cache = (void **)(MOGraph + 16);
        }
        if ([v21 placeType] == (id)3 && (objc_msgSend(v21, "placeNameConfidence"), v23 >= 0.9)
          || [v21 placeType] == (id)2 && (objc_msgSend(v21, "placeNameConfidence"), v24 >= 0.5))
        {
          double v25 = [MOResource alloc];
          long long v26 = [v21 placeName];
          long long v27 = [v12 placeMapItem];
          long long v28 = [(MOResource *)v25 initWithName:v26 mapItemHandle:v27 priorityScore:-1.0];

          long long v29 = [v12 eventIdentifier];
          [(MOResource *)v28 setSourceEventIdentifier:v29];

          uint64_t v10 = &OBJC_IVAR___MOPhotoManager__visualIdentifierView;
          [v39 addObject:v28];

          p_cache = (void **)(MOGraph + 16);
        }

        double v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v8);
  }

  if ([v39 count]) {
    id v35 = [v39 copy];
  }
  else {
    id v35 = 0;
  }

  return v35;
}

- (id)buildPromptDescriptionForEventBundle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 action];
  v5 = [v4 actionName];

  uint64_t v6 = [v3 actions];
  if (v6
    && (long long v7 = (void *)v6,
        [v3 actions],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 count],
        v8,
        v7,
        v9))
  {
    uint64_t v10 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"actionType", 2];
    double v11 = [v3 actions];
    double v12 = [v11 filteredArrayUsingPredicate:v10];

    id v13 = [v12 count];
    BOOL v14 = v13 != 0;
    if (v13)
    {
      double v15 = [v12 firstObject];
      uint64_t v16 = [v15 actionName];

      v5 = (__CFString *)v16;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  double v17 = [v3 place];
  if (v17)
  {
    double v18 = [v3 place];
    double v19 = [v18 placeName];

    if (!v19)
    {
      double v17 = 0;
      if (v14) {
        goto LABEL_21;
      }
      goto LABEL_11;
    }
    id v20 = [v3 place];
    id v21 = [v20 promptDescription];
    double v17 = +[NSString stringWithFormat:@" %@", v21];
  }
  if (v14) {
    goto LABEL_21;
  }
LABEL_11:
  if (!v17)
  {
    CFStringRef v31 = @"Outing";
LABEL_20:

    v5 = (__CFString *)v31;
    goto LABEL_21;
  }
  uint64_t v22 = [v3 actions];
  if (v22)
  {
    double v23 = (void *)v22;
    double v24 = [v3 actions];
    id v25 = [v24 count];

    if (v25)
    {
      uint64_t v26 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"actionType", 3];
      long long v27 = [v3 actions];
      long long v28 = [v27 filteredArrayUsingPredicate:v26];

      if ([v28 count])
      {
        long long v29 = [v28 firstObject];
        uint64_t v30 = [v29 actionName];

        v5 = (__CFString *)v30;
      }
      CFStringRef v31 = v5;

      v5 = (__CFString *)v26;
      goto LABEL_20;
    }
  }
LABEL_21:
  long long v32 = objc_opt_new();
  [v32 appendString:v5];
  if (v17) {
    [v32 appendString:v17];
  }
  id v33 = [v32 copy];

  return v33;
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

- (double)recommendedTabVisitFIThreshold
{
  return self->_recommendedTabVisitFIThreshold;
}

- (void)setRecommendedTabVisitFIThreshold:(double)a3
{
  self->_recommendedTabVisitFIThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_outingEligiblePoiCategories, 0);
  objc_storeStrong((id *)&self->_flightPoiCategories, 0);

  objc_storeStrong((id *)&self->_lessInterestingPoiCategories, 0);
}

@end