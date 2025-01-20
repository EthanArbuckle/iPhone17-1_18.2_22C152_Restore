@interface MOWorkoutAnnotationManager
+ (double)maxDistanceSpanFromStartUsingSparseLocations:(id)a3;
+ (unint64_t)subTypeFromBaseEvents:(id)a3;
- (BOOL)allowDuplicatedWorkouts;
- (BOOL)isDominantPlaceForVisits:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (MOConfigurationManager)configurationManager;
- (MOWorkoutAnnotationManager)initWithUniverse:(id)a3;
- (double)aoiVisitLabelConfidentThreshold;
- (double)emotionAttachmentBundleDurationThreshold;
- (double)maximumWatchPhoneVisitDistance;
- (double)motionActivityMixedRunningWalkingDistanceThreshold;
- (double)motionActivityMixedRunningWalkingDurationThreshold;
- (double)motionActivityMixedRunningWalkingSpanThreshold;
- (double)motionActivityReferencePointRatio;
- (double)motionActivityRunDistanceThreshold;
- (double)motionActivityRunDurationThreshold;
- (double)motionActivityRunSpanThreshold;
- (double)motionActivityWalkCadenceThreshold;
- (double)motionActivityWalkDurationThreshold;
- (double)motionActivityWalkMinimumLocationUncertainty;
- (double)motionActivityWalkSpanThreshold;
- (double)visitLabelHighConfidenceThreshold;
- (double)visitLabelMediumConfidenceThreshold;
- (double)visitMinimumIntersectionWithActivityAbsoluteTime;
- (id)annotateBaseEvents:(id)a3 contextEvents:(id)a4;
- (id)annotateEventBundle:(id)a3 withContextEvents:(id)a4 andBaseEventReference:(id)a5;
- (id)buildPromptDescriptionForEventBundle:(id)a3;
- (id)buildRankingMetaDataDict:(id)a3 withBaseEvents:(id)a4 andContextEvents:(id)a5;
- (id)filterPhoneVisits:(id)a3 farFromWorkoutEvents:(id)a4 forEventBundle:(id)a5;
- (id)getBaseEvents:(id)a3;
- (id)getContextEventsForBaseEvents:(id)a3 events:(id)a4 withPatternEvents:(id)a5;
- (id)groupedEventsFromEvents:(id)a3;
- (id)majorVisitsFromVisits:(id)a3 referenceDate:(id)a4;
- (id)referenceDateFromStartDate:(id)a3 endDate:(id)a4 index:(double)a5;
- (id)removeDuplicateWorkouts:(id)a3;
- (id)removePhoneActivitiesOverlappingWorkouts:(id)a3;
- (void)setAllowDuplicatedWorkouts:(BOOL)a3;
- (void)setAoiVisitLabelConfidentThreshold:(double)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setEmotionAttachmentBundleDurationThreshold:(double)a3;
- (void)setMaximumWatchPhoneVisitDistance:(double)a3;
- (void)setMotionActivityMixedRunningWalkingDistanceThreshold:(double)a3;
- (void)setMotionActivityMixedRunningWalkingDurationThreshold:(double)a3;
- (void)setMotionActivityMixedRunningWalkingSpanThreshold:(double)a3;
- (void)setMotionActivityReferencePointRatio:(double)a3;
- (void)setMotionActivityRunDistanceThreshold:(double)a3;
- (void)setMotionActivityRunDurationThreshold:(double)a3;
- (void)setMotionActivityRunSpanThreshold:(double)a3;
- (void)setMotionActivityWalkCadenceThreshold:(double)a3;
- (void)setMotionActivityWalkDurationThreshold:(double)a3;
- (void)setMotionActivityWalkMinimumLocationUncertainty:(double)a3;
- (void)setMotionActivityWalkSpanThreshold:(double)a3;
- (void)setVisitLabelHighConfidenceThreshold:(double)a3;
- (void)setVisitLabelMediumConfidenceThreshold:(double)a3;
- (void)setVisitMinimumIntersectionWithActivityAbsoluteTime:(double)a3;
@end

@implementation MOWorkoutAnnotationManager

- (MOWorkoutAnnotationManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)MOWorkoutAnnotationManager;
  v5 = [(MOTimeContextAnnotationManager *)&v47 initWithUniverse:v4];
  if (v5)
  {
    v48[0] = GEOPOICategoryATM;
    v48[1] = GEOPOICategoryEVCharger;
    v48[2] = GEOPOICategoryParking;
    v48[3] = GEOPOICategoryPublicTransport;
    v48[4] = GEOPOICategoryRestroom;
    v6 = +[NSArray arrayWithObjects:v48 count:5];
    uint64_t v7 = +[NSSet setWithArray:v6];
    lessInterestingPoiCategories = v5->_lessInterestingPoiCategories;
    v5->_lessInterestingPoiCategories = (NSSet *)v7;

    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    uint64_t v11 = [v4 getService:v10];
    configurationManager = v5->_configurationManager;
    v5->_configurationManager = (MOConfigurationManager *)v11;

    HIDWORD(v13) = 1072483532;
    *(float *)&double v13 = 0.9;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VA_VisitLabelMediumConfidenceThreshold" withFallback:v13];
    v5->_visitLabelMediumConfidenceThreshold = v14;
    HIDWORD(v15) = 1072588390;
    *(float *)&double v15 = 0.95;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VA_VisitLabelHighConfidenceThreshold" withFallback:v15];
    v5->_visitLabelHighConfidenceThreshold = v16;
    HIDWORD(v17) = 1071644672;
    *(float *)&double v17 = 0.5;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VA_AOIVisitLabelConfidentThreshold" withFallback:v17];
    double v19 = v18;
    v5->_aoiVisitLabelConfidentThreshold = v19;
    LODWORD(v19) = 1128792064;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"MaximumWatchPhoneVisitDistanceKey" withFallback:v19];
    double v21 = v20;
    v5->_maximumWatchPhoneVisitDistance = v21;
    LODWORD(v21) = 15.0;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"MotionActivityWalkDurationThresholdKey" withFallback:v21];
    double v23 = v22;
    v5->_motionActivityWalkDurationThreshold = v23;
    LODWORD(v23) = 5.0;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"MotionActivityRunDurationThresholdKey" withFallback:v23];
    double v25 = v24;
    v5->_motionActivityRunDurationThreshold = v25;
    LODWORD(v25) = 10.0;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"MotionActivityMixedRunningWalkingDurationThresholdKey" withFallback:v25];
    v5->_motionActivityMixedRunningWalkingDurationThreshold = v26;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"MotionActivityWalkCadenceThresholdKey" withFallback:0.0];
    double v28 = v27;
    v5->_motionActivityWalkCadenceThreshold = v28;
    LODWORD(v28) = 1128792064;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"MotionActivityWalkSpanThresholdKey" withFallback:v28];
    double v30 = v29;
    v5->_motionActivityWalkSpanThreshold = v30;
    LODWORD(v30) = 1128792064;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"MotionActivityRunSpanThresholdKey" withFallback:v30];
    double v32 = v31;
    v5->_motionActivityRunSpanThreshold = v32;
    LODWORD(v32) = 1128792064;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"MotionActivityMixedRunningWalkingSpanThresholdKey" withFallback:v32];
    double v34 = v33;
    v5->_motionActivityMixedRunningWalkingSpanThreshold = v34;
    LODWORD(v34) = 1140457472;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"MotionActivityRunDistanceThresholdKey" withFallback:v34];
    double v36 = v35;
    v5->_motionActivityRunDistanceThreshold = v36;
    LODWORD(v36) = 1140457472;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"MotionActivityMixedRunningWalkingDistanceThresholdKey" withFallback:v36];
    double v38 = v37;
    v5->_motionActivityMixedRunningWalkingDistanceThreshold = v38;
    LODWORD(v38) = 1137180672;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"MotionActivityWalkMinimumLocationUncertaintyKey" withFallback:v38];
    double v40 = v39;
    v5->_motionActivityWalkMinimumLocationUncertainty = v40;
    LODWORD(v40) = 1067030938;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"kMotionActivityReferencePointRatioKey" withFallback:v40];
    double v42 = v41;
    v5->_motionActivityReferencePointRatio = v42;
    LODWORD(v42) = 1155596288;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"VisitMinimumIntersectionWithActivityAbsoluteTime" withFallback:v42];
    v5->_visitMinimumIntersectionWithActivityAbsoluteTime = v43;
    v5->_allowDuplicatedWorkouts = [(MOConfigurationManagerBase *)v5->_configurationManager getBoolSettingForKey:@"AllowDuplicatedWorkoutsKey" withFallback:0];
    LODWORD(v44) = 1180762112;
    [(MOConfigurationManagerBase *)v5->_configurationManager getFloatSettingForKey:@"EmotionAttachmentActivityBundleDurationThreshold" withFallback:v44];
    v5->_emotionAttachmentBundleDurationThreshold = v45;
  }

  return v5;
}

- (id)getBaseEvents:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithFormat:@"%K IN %@ AND %K !=[c] %@", @"category", &off_1002F9338, @"workoutType", @"HKWorkoutActivityTypeCooldown"];
  v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (id)groupedEventsFromEvents:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    id v28 = &__NSArray0__struct;
    goto LABEL_24;
  }
  double v30 = self;
  float v39 = objc_opt_new();
  [v4 valueForKeyPath:@"@distinctUnionOfObjects.workoutType"];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v34 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (!v34) {
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)v41;
  v6 = NSAssertionHandler_ptr;
  uint64_t v31 = *(void *)v41;
  id v32 = v4;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v41 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v38 = v7;
      float v37 = [v6[37] predicateWithFormat:@"%K = %@", @"workoutType", *(void *)(*((void *)&v40 + 1) + 8 * v7)];
      v8 = [v4 filteredArrayUsingPredicate:];
      id v35 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
      id v44 = v35;
      v9 = +[NSArray arrayWithObjects:&v44 count:1];
      double v36 = v8;
      v10 = [v8 sortedArrayUsingDescriptors:v9];

      uint64_t v11 = objc_opt_new();
      v12 = [v10 firstObject];
      [v11 addObject:v12];

      if ((unint64_t)[v10 count] < 2) {
        goto LABEL_17;
      }
      if ((unint64_t)[v10 count] >= 2)
      {
        uint64_t v13 = 1;
        while (1)
        {
          float v14 = [v10 objectAtIndex:v13 - 1];
          double v15 = [v10 objectAtIndex:v13];
          float v16 = [v15 startDate];
          double v17 = [v14 endDate];
          [v16 timeIntervalSinceDate:v17];
          if (v18 <= 300.0) {
            break;
          }
          double v19 = [v15 startDate];
          float v20 = [v14 endDate];
          unsigned __int8 v21 = [v19 isBeforeDate:v20];

          if ((v21 & 1) == 0)
          {
            id v22 = [v11 copy];
            [v39 addObject:v22];

            float v16 = v11;
            uint64_t v11 = objc_opt_new();
LABEL_14:
          }
          [v11 addObject:v15];

          if ((unint64_t)[v10 count] <= ++v13) {
            goto LABEL_16;
          }
        }

        goto LABEL_14;
      }
LABEL_16:
      uint64_t v5 = v31;
      id v4 = v32;
      v6 = NSAssertionHandler_ptr;
      if ([v11 count])
      {
LABEL_17:
        id v23 = [v11 copy];
        [v39 addObject:v23];
      }
      uint64_t v7 = v38 + 1;
    }
    while ((id)(v38 + 1) != v34);
    id v34 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  }
  while (v34);
LABEL_20:
  id v24 = v39;
  double v25 = v24;
  if (![(MOWorkoutAnnotationManager *)v30 allowDuplicatedWorkouts])
  {
    float v26 = [(MOWorkoutAnnotationManager *)v30 removePhoneActivitiesOverlappingWorkouts:v24];
    double v25 = [(MOWorkoutAnnotationManager *)v30 removeDuplicateWorkouts:v26];
  }
  float v27 = [v25 sortedArrayUsingComparator:&__block_literal_global_42];
  id v28 = [v27 copy];

LABEL_24:

  return v28;
}

int64_t __54__MOWorkoutAnnotationManager_groupedEventsFromEvents___block_invoke(id a1, NSArray *a2, NSArray *a3)
{
  id v4 = a3;
  uint64_t v5 = [(NSArray *)a2 firstObject];
  v6 = [v5 startDate];
  uint64_t v7 = [(NSArray *)v4 firstObject];

  v8 = [v7 startDate];
  id v9 = [v6 compare:v8];

  return (int64_t)v9;
}

- (id)removePhoneActivitiesOverlappingWorkouts:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v35 = objc_opt_new();
    id v4 = objc_opt_new();
    uint64_t v5 = objc_opt_new();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v33 = v3;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v52;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v52 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          v12 = [v11 firstObject:v33];
          id v13 = [v12 category];

          float v14 = v4;
          if (v13 != (id)2)
          {
            double v15 = [v11 firstObject];
            id v16 = [v15 category];

            float v14 = v5;
            if (v16 != (id)16) {
              continue;
            }
          }
          [v14 addObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v8);
    }

    [v35 addObjectsFromArray:v4];
    if ([v5 count])
    {
      id v3 = v33;
      if ([v4 count])
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id obj = v5;
        id v39 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (!v39) {
          goto LABEL_34;
        }
        float v37 = v4;
        uint64_t v38 = *(void *)v48;
        double v36 = v5;
        while (1)
        {
          for (j = 0; j != v39; j = (char *)j + 1)
          {
            if (*(void *)v48 != v38) {
              objc_enumerationMutation(obj);
            }
            double v18 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            id v19 = v4;
            id v20 = [v19 countByEnumeratingWithState:&v43 objects:v55 count:16];
            if (!v20)
            {

LABEL_31:
              [v35 addObject:v18, v33];
              continue;
            }
            id v21 = v20;
            long long v40 = j;
            id v41 = v19;
            int v22 = 0;
            uint64_t v42 = *(void *)v44;
            do
            {
              for (k = 0; k != v21; k = (char *)k + 1)
              {
                if (*(void *)v44 != v42) {
                  objc_enumerationMutation(v41);
                }
                id v24 = *(void **)(*((void *)&v43 + 1) + 8 * (void)k);
                double v25 = [v18 firstObject:v33];
                float v26 = [v25 startDate];
                float v27 = [v18 lastObject];
                id v28 = [v27 endDate];
                float v29 = +[MOContextAnnotationUtilities predicateWithStartDate:v26 endDate:v28];

                double v30 = [v24 filteredArrayUsingPredicate:v29];
                if ([v30 count]) {
                  ++v22;
                }
              }
              id v21 = [v41 countByEnumeratingWithState:&v43 objects:v55 count:16];
            }
            while (v21);

            uint64_t v5 = v36;
            id v4 = v37;
            j = v40;
            if (!v22) {
              goto LABEL_31;
            }
          }
          id v39 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
          if (!v39)
          {
LABEL_34:

            id v6 = v35;
            goto LABEL_35;
          }
        }
      }
    }
    else
    {
LABEL_35:
      id v3 = v33;
    }
    id v31 = v6;
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

- (id)removeDuplicateWorkouts:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_opt_new();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v3;
    id v5 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v47;
      long long v40 = v4;
      id v41 = v3;
      uint64_t v39 = *(void *)v47;
      do
      {
        id v8 = 0;
        id v42 = v6;
        do
        {
          if (*(void *)v47 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v8);
          if ((unint64_t)[v9 count] > 1)
          {
            long long v45 = v8;
            v10 = objc_opt_new();
            id v11 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
            id v50 = v11;
            v12 = +[NSArray arrayWithObjects:&v50 count:1];
            id v13 = [v9 sortedArrayUsingDescriptors:v12];

            float v14 = [v13 firstObject];
            long long v44 = v11;
            if ((unint64_t)[v13 count] < 2)
            {
              id v37 = v14;
            }
            else
            {
              unint64_t v15 = 1;
              do
              {
                id v16 = [v13 objectAtIndex:v15];
                id v17 = objc_alloc((Class)NSDateInterval);
                double v18 = [v14 startDate];
                id v19 = [v14 endDate];
                id v20 = [v17 initWithStartDate:v18 endDate:v19];

                id v21 = objc_alloc((Class)NSDateInterval);
                int v22 = [v16 startDate];
                id v23 = [v16 endDate];
                id v24 = [v21 initWithStartDate:v22 endDate:v23];

                double v25 = [v24 intersectionWithDateInterval:v20];
                [v20 duration];
                double v27 = v26;
                id v28 = v16;
                [v20 duration];
                double v30 = v29;
                [v24 duration];
                if (v30 <= v31)
                {
                  id v33 = v28;
                }
                else
                {
                  [v24 duration];
                  double v27 = v32;
                  id v33 = v14;
                }
                if (v27 <= 0.0 || ([v25 duration], v34 / v27 <= 0.5))
                {
                  [v10 addObject:v14];
                  id v35 = (char *)[v13 count] - 1;
                  double v36 = v28;
                }
                else
                {
                  id v35 = (char *)[v13 count] - 1;
                  double v36 = v33;
                }
                if ((char *)v15 == v35) {
                  [v10 addObject:v36];
                }
                id v37 = v36;

                ++v15;
                float v14 = v37;
              }
              while ((unint64_t)[v13 count] > v15);
            }
            id v4 = v40;
            [v40 addObject:v10];

            id v3 = v41;
            id v6 = v42;
            uint64_t v7 = v39;
            id v8 = v45;
          }
          else
          {
            [v4 addObject:v9];
          }
          id v8 = (char *)v8 + 1;
        }
        while (v8 != v6);
        id v6 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)getContextEventsForBaseEvents:(id)a3 events:(id)a4 withPatternEvents:(id)a5
{
  id v7 = a3;
  id v83 = a4;
  id v89 = a5;
  uint64_t v8 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"category", &off_1002F9350];
  uint64_t v9 = [v7 firstObject];
  v10 = [v9 startDate];
  id v11 = [v7 lastObject];
  v12 = [v11 endDate];
  uint64_t v13 = +[MOContextAnnotationUtilities predicateWithStartDate:v10 endDate:v12];

  float v14 = [v7 firstObject];
  unint64_t v15 = [v14 startDate];
  id v16 = [v7 lastObject];
  id v17 = [v16 endDate];
  uint64_t v18 = +[MOContextAnnotationUtilities predicateWithStartDate:v15 endDate:v17 distanceThreshold:0.5];

  v80 = (void *)v13;
  v81 = (void *)v8;
  v122[0] = v8;
  v122[1] = v13;
  v79 = (void *)v18;
  v122[2] = v18;
  id v19 = +[NSArray arrayWithObjects:v122 count:3];
  uint64_t v20 = +[NSCompoundPredicate andPredicateWithSubpredicates:v19];

  id v21 = [v7 firstObject];
  int v22 = [v21 startDate];
  id v23 = [v7 lastObject];
  id v24 = [v23 endDate];
  uint64_t v25 = +[MOContextAnnotationUtilities predicateOfEventsWithPlaySessionsWithStartDate:v22 endData:v24 distanceThreshold:0.5];

  double v26 = v7;
  v77 = (void *)v25;
  v78 = (void *)v20;
  v121[0] = v25;
  v121[1] = v20;
  p_cache = MOGraph.cache;
  id v28 = +[NSArray arrayWithObjects:v121 count:2];
  uint64_t v29 = +[NSCompoundPredicate orPredicateWithSubpredicates:v28];

  v76 = (void *)v29;
  v82 = [v83 filteredArrayUsingPredicate:v29];
  double v30 = [v7 firstObject];
  double v31 = [v30 startDate];
  double v32 = [v7 lastObject];
  id v33 = [v32 endDate];
  uint64_t v34 = +[MOContextAnnotationUtilities predicateOfSocialContextEventWithStartDate:v31 endData:v33];

  v75 = (void *)v34;
  uint64_t v86 = [v83 filteredArrayUsingPredicate:v34];
  id v35 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  id v87 = v7;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    double v36 = (objc_class *)objc_opt_class();
    id v37 = NSStringFromClass(v36);
    id v38 = [v82 count];
    uint64_t v39 = [v7 firstObject];
    long long v40 = [v39 startDate];
    id v41 = [v7 lastObject];
    id v42 = [v41 endDate];
    *(_DWORD *)buf = 138413058;
    v114 = v37;
    __int16 v115 = 2048;
    id v116 = v38;
    __int16 v117 = 2112;
    v118 = v40;
    __int16 v119 = 2112;
    v120 = v42;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%@: filtered social context event count, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

    double v26 = v7;
  }

  long long v43 = [v26 firstObject];
  long long v44 = [v43 startDate];
  id v45 = [v26 lastObject];
  long long v46 = [v45 endDate];
  uint64_t v47 = +[MOContextAnnotationUtilities predicateOfEmotionLogsWithStartDate:v44 endDate:v46];

  v74 = (void *)v47;
  v88 = [v83 filteredArrayUsingPredicate:v47];
  long long v48 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    long long v49 = (objc_class *)objc_opt_class();
    id v50 = NSStringFromClass(v49);
    id v45 = [v88 count];
    long long v51 = [v26 firstObject];
    long long v52 = [v51 startDate];
    long long v53 = [v26 lastObject];
    long long v54 = [v53 endDate];
    *(_DWORD *)buf = 138413058;
    v114 = v50;
    __int16 v115 = 2048;
    id v116 = v45;
    __int16 v117 = 2112;
    v118 = v52;
    __int16 v119 = 2112;
    v120 = v54;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%@: filtered emotion event count, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

    double v26 = v7;
  }

  id v92 = (id)objc_opt_new();
  [v92 addObjectsFromArray:v82];
  v55 = (void *)v86;
  v56 = v88;
  if ([v89 count])
  {
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id obj = v26;
    id v90 = [obj countByEnumeratingWithState:&v107 objects:v112 count:16];
    if (!v90) {
      goto LABEL_33;
    }
    uint64_t v85 = *(void *)v108;
    while (1)
    {
      uint64_t v57 = 0;
      do
      {
        if (*(void *)v108 != v85) {
          objc_enumerationMutation(obj);
        }
        uint64_t v91 = v57;
        v94 = *(void **)(*((void *)&v107 + 1) + 8 * v57);
        long long v103 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id v93 = v89;
        id v100 = [v93 countByEnumeratingWithState:&v103 objects:v111 count:16];
        if (v100)
        {
          uint64_t v99 = *(void *)v104;
          do
          {
            v58 = 0;
            do
            {
              if (*(void *)v104 != v99) {
                objc_enumerationMutation(v93);
              }
              v59 = *(void **)(*((void *)&v103 + 1) + 8 * (void)v58);
              v60 = [v59 patterns];
              v61 = [v60 objectForKeyedSubscript:@"kEventPatternType"];
              unsigned int v62 = [v61 intValue];
              if (v62) {
                goto LABEL_19;
              }
              v98 = [v94 eventIdentifier];
              v63 = [v98 UUIDString];
              p_cache = [v59 patterns];
              id v45 = [p_cache objectForKeyedSubscript:@"kEventPatternAnomalousEventIdentifier"];
              v97 = v63;
              if (([v63 isEqualToString:v45] & 1) == 0)
              {
LABEL_19:
                v101 = v61;
                v102 = v60;
                v65 = [v59 patterns];
                v66 = [v65 objectForKeyedSubscript:@"kEventPatternType"];
                v67 = v59;
                if ([v66 intValue] == 2)
                {
                  v68 = [v59 patterns];
                  [v68 objectForKeyedSubscript:@"kEventPatternRoutineEventIdentifierList"];
                  v69 = v96 = p_cache;
                  [v94 eventIdentifier];
                  v70 = id v95 = v45;
                  v71 = [v70 UUIDString];
                  unsigned int v64 = [v69 containsObject:v71];

                  id v45 = v95;
                  p_cache = v96;
                }
                else
                {
                  unsigned int v64 = 0;
                }

                if (v62)
                {

                  v59 = v67;
                  if (!v64) {
                    goto LABEL_25;
                  }
LABEL_24:
                  [v92 addObject:v59];
                  goto LABEL_25;
                }
                v59 = v67;
                v61 = v101;
                v60 = v102;
              }
              else
              {
                LOBYTE(v64) = 1;
              }

              if (v64) {
                goto LABEL_24;
              }
LABEL_25:
              v58 = (char *)v58 + 1;
            }
            while (v100 != v58);
            id v72 = [v93 countByEnumeratingWithState:&v103 objects:v111 count:16];
            id v100 = v72;
          }
          while (v72);
        }

        uint64_t v57 = v91 + 1;
        v55 = (void *)v86;
        double v26 = v87;
        v56 = v88;
      }
      while ((id)(v91 + 1) != v90);
      id v90 = [obj countByEnumeratingWithState:&v107 objects:v112 count:16];
      if (!v90)
      {
LABEL_33:

        break;
      }
    }
  }
  if ([v55 count]) {
    [v92 addObjectsFromArray:v55];
  }
  if ([v56 count]) {
    [v92 addObjectsFromArray:v56];
  }

  return v92;
}

+ (unint64_t)subTypeFromBaseEvents:(id)a3
{
  id v3 = [a3 firstObject];
  if ([v3 category] == (id)16
    && ([v3 motionActivityEvent],
        id v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = (char *)[v4 motionType],
        v4,
        (unint64_t)(v5 - 2) <= 4))
  {
    unint64_t v6 = qword_1002BB2E8[(void)(v5 - 2)];
  }
  else
  {
    unint64_t v6 = 201;
  }

  return v6;
}

- (id)annotateBaseEvents:(id)a3 contextEvents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v173 = v5;
  if (![v5 count])
  {
    uint64_t v29 = 0;
    goto LABEL_126;
  }
  id v169 = v6;
  unint64_t v7 = +[MOWorkoutAnnotationManager subTypeFromBaseEvents:v5];
  if (v7 - 204 > 4 || ((1 << (v7 + 52)) & 0x19) == 0)
  {
    uint64_t v39 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[MOWorkoutAnnotationManager.annotateBaseEvents] annotating regular workout activity", buf, 2u);
    }

    goto LABEL_28;
  }
  uint64_t v9 = [v5 lastObject];
  v10 = [v9 endDate];
  id v11 = [v5 firstObject];
  v12 = [v11 startDate];
  [v10 timeIntervalSinceDate:v12];
  double v14 = v13;

  long long v194 = 0u;
  long long v195 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  id v15 = v5;
  int v16 = 0;
  id v17 = [v15 countByEnumeratingWithState:&v192 objects:v204 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v193;
    double v19 = 0.0;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v193 != v18) {
          objc_enumerationMutation(v15);
        }
        id v21 = *(void **)(*((void *)&v192 + 1) + 8 * i);
        int v22 = [v21 motionActivityEvent];
        id v23 = [v22 motionStepCount];
        unsigned int v24 = [v23 intValue];

        uint64_t v25 = [v21 motionActivityEvent];
        double v26 = [v25 motionDistance];
        [v26 doubleValue];
        double v28 = v27;

        v16 += v24;
        double v19 = v19 + v28;
      }
      id v17 = [v15 countByEnumeratingWithState:&v192 objects:v204 count:16];
    }
    while (v17);
  }
  else
  {
    double v19 = 0.0;
  }

  +[MOWorkoutAnnotationManager maxDistanceSpanFromStartUsingSparseLocations:v15];
  double v31 = v30;
  unsigned int v32 = [(MOConfigurationManager *)self->_configurationManager isAllowedToPromptEventCategory:1];
  double v33 = v14 / 60.0;
  switch(v7)
  {
    case 0xD0uLL:
      uint64_t v57 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "[MOWorkoutAnnotationManager.annotateBaseEvents] annotating motion activity - mixed running & walking", buf, 2u);
      }

      [(MOWorkoutAnnotationManager *)self motionActivityMixedRunningWalkingDurationThreshold];
      if (v33 >= v58)
      {
        [(MOWorkoutAnnotationManager *)self motionActivityMixedRunningWalkingDistanceThreshold];
        if (v19 >= v59)
        {
          if (!v32) {
            goto LABEL_28;
          }
          [(MOWorkoutAnnotationManager *)self motionActivityMixedRunningWalkingSpanThreshold];
          if (v31 >= v153) {
            goto LABEL_28;
          }
        }
      }
      id v37 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
        goto LABEL_45;
      }
      goto LABEL_43;
    case 0xCFuLL:
      v60 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "[MOWorkoutAnnotationManager.annotateBaseEvents] annotating motion activity - running", buf, 2u);
      }

      [(MOWorkoutAnnotationManager *)self motionActivityRunDurationThreshold];
      if (v33 >= v61)
      {
        [(MOWorkoutAnnotationManager *)self motionActivityRunDistanceThreshold];
        if (v19 >= v62)
        {
          if (!v32) {
            goto LABEL_28;
          }
          [(MOWorkoutAnnotationManager *)self motionActivityRunSpanThreshold];
          if (v31 >= v154) {
            goto LABEL_28;
          }
        }
      }
      id v37 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
        goto LABEL_45;
      }
LABEL_43:
      *(_DWORD *)buf = 134218752;
      *(double *)&uint8_t buf[4] = v33;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v201) = v32;
      WORD2(v201) = 2048;
      *(double *)((char *)&v201 + 6) = v31;
      id v38 = "[MOWorkoutAnnotationManager.annotateBaseEvents] Failed to meet bundling criteria, duration=%fl, totalDistanc"
            "e=%fl, allowedToUseLocation=%d, boutsSpan=%fl";
      goto LABEL_44;
    case 0xCCuLL:
      uint64_t v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[MOWorkoutAnnotationManager.annotateBaseEvents] annotating motion activity - walking", buf, 2u);
      }

      [(MOWorkoutAnnotationManager *)self motionActivityWalkDurationThreshold];
      if (v33 >= v35)
      {
        [(MOWorkoutAnnotationManager *)self motionActivityWalkCadenceThreshold];
        if ((double)v16 / v33 >= v36)
        {
          if (!v32
            || ([(MOWorkoutAnnotationManager *)self motionActivityWalkSpanThreshold],
                v31 >= v152))
          {
LABEL_28:
            long long v40 = [MOEventBundle alloc];
            id v41 = +[NSUUID UUID];
            id v42 = +[NSDate date];
            long long v43 = [(MOEventBundle *)v40 initWithBundleIdentifier:v41 creationDate:v42];

            [(MOEventBundle *)v43 setInterfaceType:1];
            [(MOEventBundle *)v43 setBundleSuperType:2];
            [(MOEventBundle *)v43 setBundleSubType:v7];
            long long v44 = [v173 firstObject];
            id v45 = [v44 startDate];
            [(MOEventBundle *)v43 setStartDate:v45];

            long long v46 = [v173 lastObject];
            uint64_t v47 = [v46 endDate];
            [(MOEventBundle *)v43 setEndDate:v47];

            v167 = objc_opt_new();
            [v167 addObjectsFromArray:v173];
            long long v48 = +[MOContextAnnotationUtilities setActionForActivityBundle:v173];
            [(MOEventBundle *)v43 setAction:v48];

            long long v49 = [v173 firstObject];
            id v50 = [v49 startDate];
            long long v51 = [(MOAnnotationManager *)self timeZoneManager];
            long long v52 = +[MOTime timeForDate:v50 timeZoneManager:v51];
            [(MOEventBundle *)v43 setTime:v52];

            long long v53 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              long long v54 = [(MOEventBundle *)v43 action];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v54;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "base Action, %@", buf, 0xCu);
            }
            v160 = [(MOWorkoutAnnotationManager *)self annotateEventBundle:v43 withContextEvents:v169 andBaseEventReference:v173];
            [v167 addObjectsFromArray:v160];
            v55 = [(MOEventBundle *)v43 resources];
            if (v55)
            {
              v56 = [(MOEventBundle *)v43 resources];
              id v168 = [v56 mutableCopy];
            }
            else
            {
              id v168 = (id)objc_opt_new();
            }

            long long v190 = 0u;
            long long v191 = 0u;
            long long v188 = 0u;
            long long v189 = 0u;
            id obj = v173;
            id v63 = [obj countByEnumeratingWithState:&v188 objects:v203 count:16];
            if (v63)
            {
              char v171 = 0;
              uint64_t v64 = *(void *)v189;
              double v65 = 100.0;
LABEL_50:
              uint64_t v66 = 0;
              while (1)
              {
                if (*(void *)v189 != v64) {
                  objc_enumerationMutation(obj);
                }
                v67 = *(void **)(*((void *)&v188 + 1) + 8 * v66);
                if ([v67 category] != (id)2) {
                  goto LABEL_66;
                }
                v68 = [v67 startDate];
                if (!v68) {
                  goto LABEL_66;
                }
                v69 = [v67 endDate];
                if (!v69) {
                  goto LABEL_65;
                }
                v70 = [v67 workoutEvent];
                v71 = [v70 workoutType];
                if (!v71)
                {

LABEL_65:
LABEL_66:
                  if ([v67 category] == (id)16 && objc_msgSend(v67, "provider") == (id)7)
                  {

                    v98 = objc_opt_new();
                    uint64_t v99 = [(MOEventBundle *)v43 startDate];
                    [v99 timeIntervalSince1970];
                    id v100 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                    [v98 setObject:v100 forKey:@"MOActivityMetaDataKeyStartDate"];

                    v101 = [(MOEventBundle *)v43 endDate];
                    [v101 timeIntervalSince1970];
                    v102 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                    [v98 setObject:v102 forKey:@"MOActivityMetaDataKeyEndDate"];

                    long long v103 = [(MOEventBundle *)v43 action];
                    long long v104 = [v103 actionMetaData];

                    v172 = [v104 objectForKeyedSubscript:@"ActivityActionMetaDataValue"];
                    v165 = [v104 objectForKeyedSubscript:@"ActivityActionMetaDataUnit"];
                    long long v105 = [(MOEventBundle *)v43 action];
                    v163 = [v105 actionName];

                    if (v172 && v165)
                    {
                      [v98 setObject:v172 forKey:@"MOActivityMetaDataKeyStepCount"];
                      [v98 setObject:v165 forKey:@"MOActivityMetaDataKeyUnit"];
                    }
                    [v98 setObject:v163 forKey:@"MOActivityMetaDataMotionType"];
                    long long v106 = [[MOResource alloc] initWithName:@"MotionActivity" type:13 dict:v98 value:0.0];
                    long long v107 = [obj firstObject];
                    long long v108 = [v107 eventIdentifier];
                    [(MOResource *)v106 setSourceEventIdentifier:v108];

                    [(MOResource *)v106 setPriorityScore:v65];
                    long long v109 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                    if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_INFO, "Activity: Primary MOResource created for phone walk bundle", buf, 2u);
                    }

                    [v168 addObject:v106];
                    long long v110 = objc_opt_new();
                    v111 = [(MOEventBundle *)v43 place];

                    if (v111)
                    {
                      v112 = [(MOEventBundle *)v43 place];
                      if ([v112 placeUserType] == (id)1) {
                        goto LABEL_92;
                      }
                      v113 = [(MOEventBundle *)v43 place];
                      BOOL v114 = [v113 placeUserType] == (id)2;

                      if (!v114)
                      {
                        v155 = [(MOEventBundle *)v43 place];
                        [v110 addObject:v155];

                        v156 = [v110 firstObject];
                        [v156 setPriorityScore:20000.0];

                        v112 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                        if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
                        {
                          v157 = [(MOEventBundle *)v43 place];
                          *(_DWORD *)buf = 138412290;
                          *(void *)&uint8_t buf[4] = v157;
                          _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "Activity, visit based location is available for motion activity, place, %@", buf, 0xCu);
                        }
LABEL_92:
                      }
                    }
                    __int16 v115 = +[MOContextAnnotationUtilities locationsFromMotionEvents:obj];
                    [(MOWorkoutAnnotationManager *)self motionActivityReferencePointRatio];
                    double v117 = v116;
                    [(MOWorkoutAnnotationManager *)self motionActivityWalkMinimumLocationUncertainty];
                    __int16 v119 = +[MOContextAnnotationUtilities placeFromRoutes:v115 referencePointRatio:v117 minimumRangeOfLocation:v118];
                    [(MOEventBundle *)v43 setPlace:v119];

                    v120 = [(MOEventBundle *)v43 place];

                    if (v120)
                    {
                      v121 = [obj firstObject];
                      v122 = [v121 eventIdentifier];
                      v123 = [(MOEventBundle *)v43 place];
                      [v123 setSourceEventIdentifier:v122];

                      v124 = [(MOEventBundle *)v43 place];
                      [v124 setPriorityScore:200.0];

                      v125 = [(MOEventBundle *)v43 place];
                      [v110 addObject:v125];

                      v126 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                      if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
                      {
                        v127 = [(MOEventBundle *)v43 place];
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v127;
                        _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_INFO, "Activity, walk area map created for motion activity, place, %@", buf, 0xCu);
                      }
                    }
                    if (v110) {
                      [(MOEventBundle *)v43 setPlaces:v110];
                    }

                    int v159 = 1;
                    goto LABEL_101;
                  }
                  goto LABEL_68;
                }
                BOOL v72 = [v67 provider] == (id)1;

                if (!v72) {
                  goto LABEL_66;
                }
                v73 = objc_opt_new();
                v74 = [v67 startDate];
                [v74 timeIntervalSince1970];
                v75 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                [v73 setObject:v75 forKey:@"MOWorkoutMetaDataKeyStartDate"];

                v76 = [v67 endDate];
                [v76 timeIntervalSince1970];
                v77 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                [v73 setObject:v77 forKey:@"MOWorkoutMetaDataKeyEndDate"];

                v78 = [v67 workoutEvent];
                v79 = [v78 workoutType];
                [v73 setObject:v79 forKey:@"MOWorkoutMetaDataKeyActivityType"];

                uint64_t v80 = [v67 workoutEvent];
                v81 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [(id)v80 isIndoors]);
                [v73 setObject:v81 forKey:@"MOWorkoutMetaDataKeyIsIndoors"];

                v82 = [v67 identifierFromProvider];
                LOBYTE(v80) = v82 == 0;

                if ((v80 & 1) == 0)
                {
                  id v83 = [v67 identifierFromProvider];
                  [v73 setObject:v83 forKey:@"MOWorkoutMetaDataKeyWorkoutID"];
                }
                v84 = [[MOResource alloc] initWithName:@"Workout" type:10 dict:v73 value:0.0];
                uint64_t v85 = [v67 eventIdentifier];
                [(MOResource *)v84 setSourceEventIdentifier:v85];

                if (v65 == 100.0)
                {
                  [(MOResource *)v84 setPriorityScore:100.0];
                  uint64_t v86 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v67;
                    _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "Activity: Primary MOResource created for workout event, %@", buf, 0xCu);
                  }

                  id v87 = [v67 workoutEvent];
                  v88 = [v87 workoutLocationRoute];

                  v171 |= v88 != 0;
                  double v65 = 500.0;
                }
                else
                {
                  [(MOResource *)v84 setPriorityScore:v65];
                  id v89 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v67;
                    _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "Activity: Additional MOResource created for workout event, %@", buf, 0xCu);
                  }

                  double v65 = v65 + 1.0;
                }
                [v168 addObject:v84];
                id v90 = [(MOEventBundle *)v43 place];

                if (v90) {
                  break;
                }
LABEL_80:

LABEL_68:
                if (v63 == (id)++v66)
                {
                  id v97 = [obj countByEnumeratingWithState:&v188 objects:v203 count:16];
                  id v63 = v97;
                  if (v97) {
                    goto LABEL_50;
                  }
                  goto LABEL_84;
                }
              }
              uint64_t v91 = [(MOEventBundle *)v43 place];
              id v92 = v91;
              if (v171)
              {
                id v93 = [v91 copy];

                [v93 setPriorityScore:20000.0];
              }
              else
              {
                if ([v91 placeUserType] == (id)1)
                {
                  id v93 = v92;
                  goto LABEL_79;
                }
                v94 = [(MOEventBundle *)v43 place];
                BOOL v95 = [v94 placeUserType] == (id)2;

                if (v95) {
                  goto LABEL_80;
                }
                v96 = [(MOEventBundle *)v43 place];
                id v93 = [v96 copy];

                [v93 setPriorityScore:200.0];
              }
              [(MOEventBundle *)v43 setPlace:v93];
LABEL_79:

              goto LABEL_80;
            }
LABEL_84:
            int v159 = 0;
            v98 = obj;
LABEL_101:

            id v128 = [v167 copy];
            [(MOEventBundle *)v43 setEvents:v128];

            [(MOEventBundle *)v43 setPropertiesBasedOnEvents];
            v129 = [obj firstObject];
            v130 = [v129 startDate];
            [(MOEventBundle *)v43 setStartDate:v130];

            v131 = [obj lastObject];
            v132 = [v131 endDate];
            [(MOEventBundle *)v43 setEndDate:v132];

            [(MOEventBundle *)v43 setResources:v168];
            v133 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 24];
            v166 = [v167 filteredArrayUsingPredicate:v133];
            if ([v166 count])
            {
              +[MOContextAnnotationUtilities addStateOfMindResourceForBundle:v43 withEmotionEvents:v166];
              double v134 = 203.0;
            }
            else
            {
              double v134 = 202.0;
            }
            uint64_t v184 = 0;
            v185 = (double *)&v184;
            uint64_t v186 = 0x2020000000;
            uint64_t v187 = 0;
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            *(void *)&long long v201 = __Block_byref_object_copy__33;
            *((void *)&v201 + 1) = __Block_byref_object_dispose__33;
            id v202 = (id)objc_opt_new();
            v183.receiver = self;
            v183.super_class = (Class)MOWorkoutAnnotationManager;
            v135 = [(MOAnnotationManager *)&v183 fUniverse];
            v179[0] = _NSConcreteStackBlock;
            v179[1] = 3221225472;
            v179[2] = __63__MOWorkoutAnnotationManager_annotateBaseEvents_contextEvents___block_invoke;
            v179[3] = &unk_1002D11D0;
            v136 = v43;
            v180 = v136;
            v181 = &v184;
            v182 = buf;
            +[MOContextAnnotationUtilities addPhotoResources:v136 universe:v135 handler:v179];

            v137 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
            {
              double v138 = v185[3];
              *(_DWORD *)v198 = 134217984;
              double v199 = v138;
              _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_INFO, "activity,photoSource,%lu", v198, 0xCu);
            }

            if (*((void *)v185 + 3))
            {
              v162 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"type", 2];
              v139 = [(MOEventBundle *)v136 resources];
              v161 = [v139 filteredArrayUsingPredicate:v162];

              id v158 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"photoCurationScore" ascending:0];
              id v197 = v158;
              v140 = +[NSArray arrayWithObjects:&v197 count:1];
              v164 = [v161 sortedArrayUsingDescriptors:v140];

              v141 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
              {
                double v142 = COERCE_DOUBLE([v164 count]);
                *(_DWORD *)v198 = 134217984;
                double v199 = v142;
                _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_INFO, "activity, %lu photo resources available for asset scoring", v198, 0xCu);
              }

              if ([v164 count])
              {
                long long v177 = 0u;
                long long v178 = 0u;
                long long v175 = 0u;
                long long v176 = 0u;
                id v143 = v164;
                id v144 = [v143 countByEnumeratingWithState:&v175 objects:v196 count:16];
                if (v144)
                {
                  uint64_t v145 = *(void *)v176;
                  do
                  {
                    for (j = 0; j != v144; j = (char *)j + 1)
                    {
                      if (*(void *)v176 != v145) {
                        objc_enumerationMutation(v143);
                      }
                      [*(id *)(*((void *)&v175 + 1) + 8 * (void)j) setPriorityScore:v134];
                      v147 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                      if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)v198 = 134217984;
                        double v199 = v134;
                        _os_log_debug_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEBUG, "activity, priority score %f set for photo asset", v198, 0xCu);
                      }

                      double v134 = v134 + 1.0;
                    }
                    id v144 = [v143 countByEnumeratingWithState:&v175 objects:v196 count:16];
                  }
                  while (v144);
                }

                if (v159)
                {
                  v148 = [v143 firstObject];
                  [v148 setPriorityScore:99.0];
                }
              }

              uint64_t v149 = *((void *)v185 + 3);
            }
            else
            {
              uint64_t v149 = 0;
            }
            [(MOEventBundle *)v136 setPhotoSource:v149];
            id v150 = [*(id *)(*(void *)&buf[8] + 40) copy];
            [(MOEventBundle *)v136 setPhotoTraits:v150];

            uint64_t v29 = [(MOWorkoutAnnotationManager *)self buildRankingMetaDataDict:v136 withBaseEvents:obj andContextEvents:v169];

            _Block_object_dispose(buf, 8);
            _Block_object_dispose(&v184, 8);

            id v37 = v167;
            goto LABEL_124;
          }
        }
      }
      id v37 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218752;
        *(double *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)v16 / v33;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v201) = v32;
        WORD2(v201) = 2048;
        *(double *)((char *)&v201 + 6) = v31;
        id v38 = "[MOWorkoutAnnotationManager.annotateBaseEvents] Failed to meet bundling criteria, duration=%fl, cadence=%f"
              "l, allowedToUseLocation=%d, boutsSpan=%fl";
LABEL_44:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, v38, buf, 0x26u);
      }
LABEL_45:
      uint64_t v29 = 0;
LABEL_124:

      goto LABEL_125;
  }
  uint64_t v29 = 0;
LABEL_125:
  id v6 = v169;
LABEL_126:

  return v29;
}

void __63__MOWorkoutAnnotationManager_annotateBaseEvents_contextEvents___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  [*(id *)(a1 + 32) setResources:a2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)annotateEventBundle:(id)a3 withContextEvents:(id)a4 andBaseEventReference:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  v56 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 5];
  v12 = [v9 filteredArrayUsingPredicate:];
  if ([v12 count]) {
    [v11 addObjectsFromArray:v12];
  }
  v55 = v12;
  long long v54 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 24];
  double v13 = [v9 filteredArrayUsingPredicate:];
  long long v52 = +[NSPredicate predicateWithFormat:@"stateOfMindEvent.reflectiveInterval = %d", 1];
  long long v53 = v13;
  uint64_t v14 = [v13 filteredArrayUsingPredicate:];
  [(MOWorkoutAnnotationManager *)self emotionAttachmentBundleDurationThreshold];
  *(float *)&double v15 = v15;
  long long v51 = (void *)v14;
  int v16 = +[MOContextAnnotationUtilities annotateEventBundle:v8 dateIntervalEvents:v10 emotionEvents:v14 bundleDurationThreshold:v15];
  [v11 addObjectsFromArray:v16];
  id v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v61 = [v16 count];
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "annotateEventBundle emotion events, %lu", buf, 0xCu);
  }
  id v50 = v16;

  long long v49 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 6];
  uint64_t v18 = [v9 filteredArrayUsingPredicate:];
  double v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = [v18 count];
    *(_DWORD *)buf = 134217984;
    id v61 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "annotateEventBundle Media Events (Playback), %lu", buf, 0xCu);
  }

  long long v48 = v18;
  id v21 = +[MOContextAnnotationUtilities annotateEventBundle:v8 playbackMediaEvents:v18];
  uint64_t v57 = v11;
  [v11 addObjectsFromArray:v21];
  +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 1];
  uint64_t v47 = v59 = v9;
  int v22 = [v9 filteredArrayUsingPredicate:];
  double v58 = v10;
  id v23 = [(MOWorkoutAnnotationManager *)self filterPhoneVisits:v22 farFromWorkoutEvents:v10 forEventBundle:v8];
  unsigned int v24 = [v8 startDate];
  uint64_t v25 = [v8 endDate];
  double v26 = [(MOWorkoutAnnotationManager *)self referenceDateFromStartDate:v24 endDate:v25 index:0.3];

  double v27 = [(MOWorkoutAnnotationManager *)self majorVisitsFromVisits:v23 referenceDate:v26];
  if ([v27 count])
  {
    double v28 = [v8 startDate];
    uint64_t v29 = [v8 endDate];
    unsigned __int8 v30 = [(MOWorkoutAnnotationManager *)self isDominantPlaceForVisits:v27 startDate:v28 endDate:v29];

    if ((v30 & 1) == 0)
    {

      double v27 = 0;
    }
  }
  double v31 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    id v32 = [v22 count];
    id v33 = [v23 count];
    id v34 = [v27 count];
    *(_DWORD *)buf = 134218496;
    id v61 = v32;
    __int16 v62 = 2048;
    id v63 = v33;
    __int16 v64 = 2048;
    id v65 = v34;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "annotateEventBundle, visit Events, %lu, valid visits, %lu, majorVisits, %lu", buf, 0x20u);
  }

  if (v27 && [v27 count])
  {
    lessInterestingPoiCategories = self->_lessInterestingPoiCategories;
    [(MOWorkoutAnnotationManager *)self visitLabelMediumConfidenceThreshold];
    double v37 = v36;
    [(MOWorkoutAnnotationManager *)self visitLabelHighConfidenceThreshold];
    double v39 = v38;
    [(MOWorkoutAnnotationManager *)self aoiVisitLabelConfidentThreshold];
    double v41 = v40;
    id v42 = [(MOAnnotationManager *)self fUniverse];
    uint64_t v43 = +[MOContextAnnotationUtilities annotateEventBundle:v8 visitEvents:v27 poiCategoryBlocklist:lessInterestingPoiCategories mediumConfidenceThreshold:v42 highConfidenceThreshold:v37 aoiConfidenceThreshold:v39 universe:v41];

    long long v44 = v57;
    [v57 addObjectsFromArray:v43];
    id v21 = (void *)v43;
  }
  else
  {
    long long v44 = v57;
  }
  id v45 = [v44 copy];

  return v45;
}

- (id)majorVisitsFromVisits:(id)a3 referenceDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 count])
  {
    id v7 = +[MOContextAnnotationUtilities groupedEventsFromEvents:v5 propertyPath:@"placeName"];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = __66__MOWorkoutAnnotationManager_majorVisitsFromVisits_referenceDate___block_invoke;
    v42[3] = &unk_1002CF868;
    id v29 = v6;
    id v28 = v6;
    id v43 = v28;
    id v8 = objc_retainBlock(v42);
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[MOWorkoutAnnotationManager majorVisitsFromVisits:referenceDate:](v7);
    }
    id v30 = v5;

    id v10 = [v7 allValues];
    id v33 = [v10 firstObject];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = [v7 allKeys];
    id v11 = [obj countByEnumeratingWithState:&v38 objects:v51 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v32 = *(void *)v39;
      double v13 = 1.79769313e308;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v39 != v32) {
            objc_enumerationMutation(obj);
          }
          double v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          int v16 = v7;
          id v17 = [v7 objectForKey:v15];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v18 = [v17 countByEnumeratingWithState:&v34 objects:v50 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v35;
            double v21 = 1.79769313e308;
            do
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v35 != v20) {
                  objc_enumerationMutation(v17);
                }
                double v21 = fmin(((double (*)(void *, void))v8[2])(v8, *(void *)(*((void *)&v34 + 1) + 8 * (void)j)), v21);
              }
              id v19 = [v17 countByEnumeratingWithState:&v34 objects:v50 count:16];
            }
            while (v19);
          }
          else
          {
            double v21 = 1.79769313e308;
          }
          id v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v45 = v15;
            __int16 v46 = 2048;
            double v47 = v21;
            _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "majorVisitsFromVisits, group, %@, distance, %f", buf, 0x16u);
          }

          if (v21 < v13)
          {
            id v24 = v17;

            id v33 = v24;
            double v13 = v21;
          }
          id v7 = v16;
        }
        id v12 = [obj countByEnumeratingWithState:&v38 objects:v51 count:16];
      }
      while (v12);
    }
    else
    {
      double v13 = 1.79769313e308;
    }

    double v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    uint64_t v25 = v33;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v45 = v28;
      __int16 v46 = 2048;
      double v47 = v13;
      __int16 v48 = 2112;
      long long v49 = v33;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "annotateEventBundle Visit Events, reference date, %@, time distance, %f, visits, %@", buf, 0x20u);
    }

    id v6 = v29;
    id v5 = v30;
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

double __66__MOWorkoutAnnotationManager_majorVisitsFromVisits_referenceDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 startDate];
  [v4 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v6 = fabs(v5);
  id v7 = [v3 endDate];

  [v7 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v9 = fmin(v6, fabs(v8));

  return v9;
}

- (BOOL)isDominantPlaceForVisits:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v30 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"endDate" ascending:1];
    id v39 = v30;
    id v11 = +[NSArray arrayWithObjects:&v39 count:1];
    id v12 = [v8 sortedArrayUsingDescriptors:v11];

    id v13 = objc_alloc((Class)NSDateInterval);
    uint64_t v14 = [v12 firstObject];
    double v15 = [v14 startDate];
    int v16 = [v12 lastObject];
    id v17 = [v16 endDate];
    id v18 = [v13 initWithStartDate:v15 endDate:v17];

    id v19 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v9 endDate:v10];
    [v19 duration];
    double v21 = v20;
    int v22 = [v18 intersectionWithDateInterval:v19];
    [v22 duration];
    double v24 = v23;

    if (v21 != 0.0)
    {
      double v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218752;
        id v32 = [v8 count];
        __int16 v33 = 2048;
        double v34 = v24;
        __int16 v35 = 2048;
        double v36 = v21;
        __int16 v37 = 2048;
        double v38 = v24 / v21;
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "isDominantPlaceForVisits, visits.count, %lu, interaction, %f, workoutDuration, %f, overlap, %f", buf, 0x2Au);
      }

      if (v24 / v21 > 0.5)
      {
        BOOL v25 = 1;
        goto LABEL_11;
      }
      [(MOWorkoutAnnotationManager *)self visitMinimumIntersectionWithActivityAbsoluteTime];
      if (v24 > v27)
      {
        id v28 = [v12 firstObject];
        BOOL v25 = [v28 placeUserType] != (id)1;

        goto LABEL_11;
      }
    }
    BOOL v25 = 0;
LABEL_11:

    goto LABEL_12;
  }
  BOOL v25 = 0;
LABEL_12:

  return v25;
}

- (id)referenceDateFromStartDate:(id)a3 endDate:(id)a4 index:(double)a5
{
  id v7 = a3;
  [a4 timeIntervalSinceDate:v7];
  if (v8 == 0.0)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v7 dateByAddingTimeInterval:v8 * a5];
  }
  id v10 = v9;

  return v10;
}

- (id)buildRankingMetaDataDict:(id)a3 withBaseEvents:(id)a4 andContextEvents:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v84 = objc_opt_new();
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v97 objects:v103 count:16];
  id v11 = v9;
  if (!v10) {
    goto LABEL_10;
  }
  id v12 = v10;
  uint64_t v13 = *(void *)v98;
  double v14 = 0.0;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v98 != v13) {
        objc_enumerationMutation(v9);
      }
      int v16 = [*(id *)(*((void *)&v97 + 1) + 8 * i) workoutDuration];
      [v16 doubleValue];
      double v14 = v14 + v17;
    }
    id v12 = [v9 countByEnumeratingWithState:&v97 objects:v103 count:16];
  }
  while (v12);

  if (v14 > 0.0)
  {
    id v11 = +[NSNumber numberWithDouble:v14];
    [v84 setObject:v11 forKey:@"WorkoutDuration"];
LABEL_10:
  }
  id v18 = [v9 firstObject];
  double v19 = 0.0;
  if ([v18 category] == (id)2)
  {
    double v20 = [v9 firstObject];
    double v21 = [v20 workoutLocationStart];

    if (!v21) {
      goto LABEL_15;
    }
    id v18 = [v9 firstObject];
    int v22 = [v18 workoutLocationStart];
    double v23 = [(MOAnnotationManager *)self fUniverse];
    +[MOContextAnnotationUtilities distanceFromHomeToCLLocation:v22 universe:v23];
    double v19 = v24;
  }
LABEL_15:
  BOOL v25 = [v9 firstObject];
  if ([v25 category] == (id)16)
  {
    double v26 = [v7 place];

    if (!v26) {
      goto LABEL_19;
    }
    BOOL v25 = [v7 place];
    [v25 distanceToHomeInMiles];
    double v19 = v27;
  }

LABEL_19:
  if (v19 > 0.0)
  {
    id v28 = +[NSNumber numberWithDouble:v19];
    [v84 setObject:v28 forKey:@"DistanceToHome"];
  }
  [v7 setMetaDataForRank:v84];
  id v29 = objc_opt_new();
  id v30 = [v7 place];

  if (v30)
  {
    double v31 = [v7 place];
    [v29 addObject:v31];
  }
  id v32 = [v7 places];

  if (v32)
  {
    __int16 v33 = [v7 places];
    [v29 addObjectsFromArray:v33];
  }
  id v88 = v9;
  id v83 = v29;
  if ([v29 count])
  {
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id obj = v29;
    id v34 = [obj countByEnumeratingWithState:&v93 objects:v102 count:16];
    if (!v34) {
      goto LABEL_53;
    }
    id v35 = v34;
    uint64_t v36 = *(void *)v94;
    while (1)
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(void *)v94 != v36) {
          objc_enumerationMutation(obj);
        }
        double v38 = *(void **)(*((void *)&v93 + 1) + 8 * (void)j);
        id v39 = [v7 place];
        uint64_t v40 = [v39 placeName];
        if (!v40) {
          goto LABEL_45;
        }
        long long v41 = (void *)v40;
        id v42 = [v7 place];
        if ([v42 placeType])
        {
          id v43 = [v7 place];
          long long v44 = [v43 poiCategory];

          id v9 = v88;
          if (v44)
          {
            id v45 = [v7 place];
            [v45 placeNameConfidence];
            if (v46 < 0.9)
            {

              goto LABEL_39;
            }
            double v47 = (void *)nonInterestingPOIcategories;
            __int16 v48 = [v7 place];
            long long v49 = [v48 poiCategory];
            LODWORD(v47) = [v47 containsObject:v49];

            if (v47)
            {
              id v50 = v7;
              long long v51 = &off_1002F96B0;
            }
            else
            {
LABEL_39:
              long long v52 = [v7 place];
              [v52 placeNameConfidence];
              if (v53 < 0.9)
              {

LABEL_44:
                id v39 = +[NSNull null];
                [v7 addMetaDataForRankForKey:@"PoiCategory" value:v39];
LABEL_45:

                goto LABEL_46;
              }
              long long v54 = (void *)interestingPOIcategories;
              v55 = [v7 place];
              v56 = [v55 poiCategory];
              LODWORD(v54) = [v54 containsObject:v56];

              if (!v54) {
                goto LABEL_44;
              }
              id v50 = v7;
              long long v51 = &off_1002F96C0;
            }
            [v50 addMetaDataForRankForKey:@"PoiCategory" value:v51];
          }
        }
        else
        {

          id v9 = v88;
        }
LABEL_46:
        uint64_t v57 = [v38 placeName];
        if (v57 && [v38 placeType])
        {
          [v38 familiarityIndexLOI];
          double v59 = v58;

          if (v59 == -1.0) {
            continue;
          }
          [v38 familiarityIndexLOI];
          uint64_t v57 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v7 addMetaDataForRankForKey:@"FamiliarityIndex" value:v57];
        }
      }
      id v35 = [obj countByEnumeratingWithState:&v93 objects:v102 count:16];
      if (!v35)
      {
LABEL_53:

        id v29 = v83;
        break;
      }
    }
  }
  v60 = [v9 firstObject];
  id v61 = [v60 category];

  if (v61 == (id)16)
  {
    +[MOWorkoutAnnotationManager maxDistanceSpanFromStartUsingSparseLocations:v9];
    __int16 v62 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v7 addMetaDataForRankForKey:@"MotionActivityWalkSpan" value:v62];
  }
  id v63 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 24];
  __int16 v64 = [v7 events];
  id v65 = [v64 filteredArrayUsingPredicate:v63];

  if ([v65 count])
  {
    id obja = v63;
    uint64_t v66 = objc_opt_new();
    v67 = objc_opt_new();
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    uint64_t v85 = v65;
    id v68 = v65;
    id v69 = [v68 countByEnumeratingWithState:&v89 objects:v101 count:16];
    if (v69)
    {
      id v70 = v69;
      uint64_t v71 = *(void *)v90;
      do
      {
        for (k = 0; k != v70; k = (char *)k + 1)
        {
          if (*(void *)v90 != v71) {
            objc_enumerationMutation(v68);
          }
          v73 = *(void **)(*((void *)&v89 + 1) + 8 * (void)k);
          v74 = [v73 stateOfMindEvent];
          v75 = [v74 labels];
          [v66 addObjectsFromArray:v75];

          v76 = [v73 stateOfMindEvent];
          v77 = [v76 domains];
          [v67 addObjectsFromArray:v77];
        }
        id v70 = [v68 countByEnumeratingWithState:&v89 objects:v101 count:16];
      }
      while (v70);
    }

    v78 = +[NSSet setWithArray:v66];
    v79 = [v78 allObjects];
    [v7 addMetaDataForRankForKey:@"StateOfMindLabels" value:v79];

    uint64_t v80 = +[NSSet setWithArray:v67];
    v81 = [v80 allObjects];
    [v7 addMetaDataForRankForKey:@"StateOfMindDomains" value:v81];

    id v63 = obja;
    id v9 = v88;
    id v29 = v83;
    id v65 = v85;
  }

  return v7;
}

- (id)filterPhoneVisits:(id)a3 farFromWorkoutEvents:(id)a4 forEventBundle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[MOWorkoutAnnotationManager filterPhoneVisits:farFromWorkoutEvents:forEventBundle:](v8);
  }

  id v61 = objc_opt_new();
  id v63 = objc_opt_new();
  id v12 = [v9 firstObject];
  id v13 = [v12 category];

  if (v13 == (id)16)
  {
    double v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[MOWorkoutAnnotationManager filterPhoneVisits:farFromWorkoutEvents:forEventBundle:](v14);
    }

    id v15 = v8;
    int v16 = v63;
    goto LABEL_56;
  }
  double v58 = v10;
  v60 = v8;
  double v17 = objc_opt_new();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v59 = v9;
  id v18 = v9;
  id v19 = [v18 countByEnumeratingWithState:&v76 objects:v84 count:16];
  if (!v19)
  {
    char v67 = 0;
    goto LABEL_21;
  }
  id v20 = v19;
  char v67 = 0;
  uint64_t v21 = *(void *)v77;
  do
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v77 != v21) {
        objc_enumerationMutation(v18);
      }
      double v23 = *(void **)(*((void *)&v76 + 1) + 8 * i);
      double v24 = [v23 workoutLocationRoute];
      id v25 = [v24 count];

      if (v25)
      {
        double v26 = [v23 workoutLocationRoute];
        [v17 addObjectsFromArray:v26];
        char v67 = 1;
      }
      else
      {
        double v27 = [v23 workoutLocationStart];

        if (!v27) {
          continue;
        }
        double v26 = [v23 workoutLocationStart];
        [v17 addObject:v26];
      }
    }
    id v20 = [v18 countByEnumeratingWithState:&v76 objects:v84 count:16];
  }
  while (v20);
LABEL_21:

  if ([v17 count])
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id obj = v60;
    id v66 = [obj countByEnumeratingWithState:&v72 objects:v83 count:16];
    if (!v66) {
      goto LABEL_49;
    }
    uint64_t v65 = *(void *)v73;
    id v28 = &MOLogFacilityEventBundleManager;
    __int16 v64 = v17;
    while (1)
    {
      id v29 = 0;
      do
      {
        if (*(void *)v73 != v65) {
          objc_enumerationMutation(obj);
        }
        id v30 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v29);
        double v31 = v28;
        id v32 = _mo_log_facility_get_os_log(v28);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v82 = v30;
          _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Filter phone visits: compare watch locations to visit: %@", buf, 0xCu);
        }

        id v33 = objc_alloc((Class)CLLocation);
        id v34 = [v30 location];
        [v34 latitude];
        double v36 = v35;
        __int16 v37 = [v30 location];
        [v37 longitude];
        id v39 = [v33 initWithLatitude:v36 longitude:v38];

        id v40 = [v30 placeUserType];
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v41 = v17;
        id v42 = [v41 countByEnumeratingWithState:&v68 objects:v80 count:16];
        if (v42)
        {
          id v43 = v42;
          uint64_t v44 = *(void *)v69;
LABEL_31:
          uint64_t v45 = 0;
          while (1)
          {
            if (*(void *)v69 != v44) {
              objc_enumerationMutation(v41);
            }
            [v39 distanceFromLocation:*(void *)(*((void *)&v68 + 1) + 8 * v45)];
            double v47 = v46;
            [(MOWorkoutAnnotationManager *)self maximumWatchPhoneVisitDistance];
            if (v47 <= v48) {
              break;
            }
            if (v43 == (id)++v45)
            {
              id v43 = [v41 countByEnumeratingWithState:&v68 objects:v80 count:16];
              if (v43) {
                goto LABEL_31;
              }
              goto LABEL_37;
            }
          }
          id v28 = v31;
          long long v49 = _mo_log_facility_get_os_log(v31);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v82 = v30;
            _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Filter phone visits: watch location distance from visit within threshold, visit: %@", buf, 0xCu);
          }

          if (((v40 == (id)1) & v67) != 0) {
            goto LABEL_41;
          }
          [v61 addObject:v30];
          long long v52 = _mo_log_facility_get_os_log(v31);
          if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_44;
          }
          *(_DWORD *)buf = 138412290;
          v82 = v30;
          double v53 = v52;
          long long v54 = "Filter phone visits: At least 1 watch location within visit distance threshold so adding to return array, visit: %@";
          goto LABEL_47;
        }
LABEL_37:

        id v28 = v31;
LABEL_41:
        id v50 = [v30 eventIdentifier];
        long long v51 = [v50 UUIDString];
        [v63 addObject:v51];

        long long v52 = _mo_log_facility_get_os_log(v28);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v82 = v30;
          double v53 = v52;
          long long v54 = "Filter phone visits: adding visit event ID to list of visit events excluded by location check, visit: %@";
LABEL_47:
          _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, v54, buf, 0xCu);
        }
LABEL_44:
        double v17 = v64;

        id v29 = (char *)v29 + 1;
      }
      while (v29 != v66);
      id v55 = [obj countByEnumeratingWithState:&v72 objects:v83 count:16];
      id v66 = v55;
      if (!v55)
      {
LABEL_49:

        int v16 = v63;
        id v10 = v58;
        if ([v63 count]) {
          [v58 setVisitEventsRejectedByWatchLocation:v63];
        }
        id v15 = v61;
        id v9 = v59;
        goto LABEL_55;
      }
    }
  }
  v56 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  id v9 = v59;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
    -[MOWorkoutAnnotationManager filterPhoneVisits:farFromWorkoutEvents:forEventBundle:](v56);
  }

  id v15 = 0;
  id v10 = v58;
  int v16 = v63;
LABEL_55:

  id v8 = v60;
LABEL_56:

  return v15;
}

+ (double)maxDistanceSpanFromStartUsingSparseLocations:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
    id v45 = v4;
    double v5 = +[NSArray arrayWithObjects:&v45 count:1];
    double v6 = [v3 sortedArrayUsingDescriptors:v5];

    id v7 = [v6 firstObject];
    id v8 = [v7 workoutEvent];
    id v9 = [v8 workoutLocationRoute];
    id v10 = [v9 count];

    if (v10)
    {
      id v34 = v4;
      id v11 = [v6 firstObject];
      id v12 = [v11 workoutEvent];
      id v13 = [v12 workoutLocationRoute];
      double v14 = [v13 firstObject];

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v33 = v6;
      id v15 = v6;
      id v16 = [v15 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v40;
        double v19 = 0.0;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v40 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            int v22 = [v21 workoutEvent:v33];
            double v23 = [v22 workoutLocationRoute];
            id v24 = [v23 count];

            if (v24)
            {
              long long v37 = 0u;
              long long v38 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              id v25 = [v21 workoutEvent];
              double v26 = [v25 workoutLocationRoute];

              id v27 = [v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v27)
              {
                id v28 = v27;
                uint64_t v29 = *(void *)v36;
                do
                {
                  for (j = 0; j != v28; j = (char *)j + 1)
                  {
                    if (*(void *)v36 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    [*(id *)(*((void *)&v35 + 1) + 8 * (void)j) distanceFromLocation:v14];
                    if (v31 > v19) {
                      double v19 = v31;
                    }
                  }
                  id v28 = [v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
                }
                while (v28);
              }
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v17);
      }
      else
      {
        double v19 = 0.0;
      }

      double v6 = v33;
      id v4 = v34;
    }
    else
    {
      double v19 = 0.0;
    }
  }
  else
  {
    double v19 = 0.0;
  }

  return v19;
}

- (id)buildPromptDescriptionForEventBundle:(id)a3
{
  return 0;
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

- (double)maximumWatchPhoneVisitDistance
{
  return self->_maximumWatchPhoneVisitDistance;
}

- (void)setMaximumWatchPhoneVisitDistance:(double)a3
{
  self->_maximumWatchPhoneVisitDistance = a3;
}

- (double)motionActivityWalkDurationThreshold
{
  return self->_motionActivityWalkDurationThreshold;
}

- (void)setMotionActivityWalkDurationThreshold:(double)a3
{
  self->_motionActivityWalkDurationThreshold = a3;
}

- (double)motionActivityRunDurationThreshold
{
  return self->_motionActivityRunDurationThreshold;
}

- (void)setMotionActivityRunDurationThreshold:(double)a3
{
  self->_motionActivityRunDurationThreshold = a3;
}

- (double)motionActivityMixedRunningWalkingDurationThreshold
{
  return self->_motionActivityMixedRunningWalkingDurationThreshold;
}

- (void)setMotionActivityMixedRunningWalkingDurationThreshold:(double)a3
{
  self->_motionActivityMixedRunningWalkingDurationThreshold = a3;
}

- (double)motionActivityWalkCadenceThreshold
{
  return self->_motionActivityWalkCadenceThreshold;
}

- (void)setMotionActivityWalkCadenceThreshold:(double)a3
{
  self->_motionActivityWalkCadenceThreshold = a3;
}

- (double)motionActivityWalkSpanThreshold
{
  return self->_motionActivityWalkSpanThreshold;
}

- (void)setMotionActivityWalkSpanThreshold:(double)a3
{
  self->_motionActivityWalkSpanThreshold = a3;
}

- (double)motionActivityRunSpanThreshold
{
  return self->_motionActivityRunSpanThreshold;
}

- (void)setMotionActivityRunSpanThreshold:(double)a3
{
  self->_motionActivityRunSpanThreshold = a3;
}

- (double)motionActivityMixedRunningWalkingSpanThreshold
{
  return self->_motionActivityMixedRunningWalkingSpanThreshold;
}

- (void)setMotionActivityMixedRunningWalkingSpanThreshold:(double)a3
{
  self->_motionActivityMixedRunningWalkingSpanThreshold = a3;
}

- (double)motionActivityRunDistanceThreshold
{
  return self->_motionActivityRunDistanceThreshold;
}

- (void)setMotionActivityRunDistanceThreshold:(double)a3
{
  self->_motionActivityRunDistanceThreshold = a3;
}

- (double)motionActivityMixedRunningWalkingDistanceThreshold
{
  return self->_motionActivityMixedRunningWalkingDistanceThreshold;
}

- (void)setMotionActivityMixedRunningWalkingDistanceThreshold:(double)a3
{
  self->_motionActivityMixedRunningWalkingDistanceThreshold = a3;
}

- (double)motionActivityWalkMinimumLocationUncertainty
{
  return self->_motionActivityWalkMinimumLocationUncertainty;
}

- (void)setMotionActivityWalkMinimumLocationUncertainty:(double)a3
{
  self->_motionActivityWalkMinimumLocationUncertainty = a3;
}

- (double)motionActivityReferencePointRatio
{
  return self->_motionActivityReferencePointRatio;
}

- (void)setMotionActivityReferencePointRatio:(double)a3
{
  self->_motionActivityReferencePointRatio = a3;
}

- (double)visitMinimumIntersectionWithActivityAbsoluteTime
{
  return self->_visitMinimumIntersectionWithActivityAbsoluteTime;
}

- (void)setVisitMinimumIntersectionWithActivityAbsoluteTime:(double)a3
{
  self->_visitMinimumIntersectionWithActivityAbsoluteTime = a3;
}

- (BOOL)allowDuplicatedWorkouts
{
  return self->_allowDuplicatedWorkouts;
}

- (void)setAllowDuplicatedWorkouts:(BOOL)a3
{
  self->_allowDuplicatedWorkouts = a3;
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

  objc_storeStrong((id *)&self->_lessInterestingPoiCategories, 0);
}

- (void)majorVisitsFromVisits:(void *)a1 referenceDate:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "majorVisitsFromVisits, group count, %lu", v3, v4, v5, v6, 0);
}

- (void)filterPhoneVisits:(os_log_t)log farFromWorkoutEvents:forEventBundle:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Filter phone visits: activity events are phone-based so return all visit events", v1, 2u);
}

- (void)filterPhoneVisits:(os_log_t)log farFromWorkoutEvents:forEventBundle:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Filter phone visits: no watch-based locations available for workouts in set so return nil", v1, 2u);
}

- (void)filterPhoneVisits:(void *)a1 farFromWorkoutEvents:forEventBundle:.cold.3(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "Filter phone visits: candidate visit event count is %lu", v3, v4, v5, v6, 0);
}

@end