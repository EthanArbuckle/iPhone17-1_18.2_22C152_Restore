@interface MOPromptMetrics
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)BOOLeanKeys;
+ (id)bucketedKeys;
+ (id)doubleKeys;
+ (id)getTimeDeltaMetricMap;
+ (id)integerKeys;
+ (id)meanOf:(id)a3;
+ (id)medianOf:(id)a3;
+ (id)standardDeviationOf:(id)a3;
+ (id)supportedMetricKeys;
- (BOOL)doesInterval:(id)a3 overlapWithAnyIntervalFromArray:(id)a4;
- (BOOL)submitMetricsWithError:(id *)a3;
- (MOEventManager)eventManager;
- (MOPromptMetrics)initWithLoggingEnabled:(BOOL)a3;
- (MOPromptMetrics)initWithStartDate:(id)a3 endDate:(id)a4;
- (MOPromptMetrics)initWithStartDate:(id)a3 endDate:(id)a4 EventManager:(id)a5;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)calculateZeroCountsForEvents:(id)a3 withCalendar:(id)a4;
- (void)calculateAndSetMetricsForCorrelatedEvents:(id)a3;
- (void)calculateAndSetMetricsForRawEvents:(id)a3;
- (void)calculateAndSetMetricsForSemanticallyBundledEvents:(id)a3;
- (void)getAndSetAgeGender;
- (void)setAge:(id)a3;
- (void)setBiologicalSex:(id)a3;
- (void)setDerivedMetrics;
- (void)setEndDate:(id)a3;
- (void)setEventManager:(id)a3;
- (void)setIHAState:(BOOL)a3;
- (void)setStartDate:(id)a3;
@end

@implementation MOPromptMetrics

- (MOPromptMetrics)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MOPromptMetrics initWithStartDate:endDate:](v16, v17, v18, v19, v20, v21, v22, v23);
    }

    v24 = +[NSAssertionHandler currentHandler];
    v25 = v24;
    CFStringRef v26 = @"Invalid parameter not satisfying: startDate";
    SEL v27 = a2;
    v28 = self;
    uint64_t v29 = 37;
    goto LABEL_12;
  }
  if (!v9)
  {
    v30 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[MOPromptMetrics initWithStartDate:endDate:](v30, v31, v32, v33, v34, v35, v36, v37);
    }

    v24 = +[NSAssertionHandler currentHandler];
    v25 = v24;
    CFStringRef v26 = @"Invalid parameter not satisfying: endDate";
    SEL v27 = a2;
    v28 = self;
    uint64_t v29 = 38;
LABEL_12:
    [v24 handleFailureInMethod:v27 object:v28 file:@"MOPromptMetrics.m" lineNumber:v29 description:v26];

    v15 = 0;
    goto LABEL_13;
  }
  v11 = [(MOPromptMetrics *)self initWithLoggingEnabled:1];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_storeStrong((id *)&v12->_endDate, a4);
    [(NSDate *)v12->_endDate timeIntervalSinceDate:v12->_startDate];
    v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v14 = [(MOMetric *)v12 metrics];
    [v14 setObject:v13 forKeyedSubscript:@"QueryTimeDuration"];
  }
  self = v12;
  v15 = self;
LABEL_13:

  return v15;
}

- (MOPromptMetrics)initWithStartDate:(id)a3 endDate:(id)a4 EventManager:(id)a5
{
  id v10 = a5;
  if (v10)
  {
    v11 = [(MOPromptMetrics *)self initWithStartDate:a3 endDate:a4];
    v12 = v11;
    if (v11) {
      objc_storeStrong((id *)&v11->_eventManager, a5);
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MOPromptMetrics initWithStartDate:endDate:EventManager:](v14, v15, v16, v17, v18, v19, v20, v21);
    }

    uint64_t v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"MOPromptMetrics.m" lineNumber:53 description:@"Invalid parameter not satisfying: eventManager"];

    v13 = 0;
  }

  return v13;
}

- (MOPromptMetrics)initWithLoggingEnabled:(BOOL)a3
{
  v49.receiver = self;
  v49.super_class = (Class)MOPromptMetrics;
  v3 = [(MOMetric *)&v49 initWithLoggingEnabled:a3];
  if (v3)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v4 = [(id)objc_opt_class() BOOLeanKeys];
    id v5 = [v4 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v46;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v46 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v45 + 1) + 8 * (void)v8);
          id v10 = [(MOMetric *)v3 metrics];
          [v10 setObject:&__kCFBooleanFalse forKeyedSubscript:v9];

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v6);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v11 = [(id)objc_opt_class() integerKeys];
    id v12 = [v11 countByEnumeratingWithState:&v41 objects:v52 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v42;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v42 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v15);
          uint64_t v17 = [(MOMetric *)v3 metrics];
          [v17 setObject:&off_1002F79B8 forKeyedSubscript:v16];

          uint64_t v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v41 objects:v52 count:16];
      }
      while (v13);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v18 = [(id)objc_opt_class() doubleKeys];
    id v19 = [v18 countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v38;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v22);
          v24 = [(MOMetric *)v3 metrics];
          [v24 setObject:&off_1002F9960 forKeyedSubscript:v23];

          uint64_t v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v37 objects:v51 count:16];
      }
      while (v20);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v25 = [objc_opt_class() bucketedKeys];
    id v26 = [v25 countByEnumeratingWithState:&v33 objects:v50 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v34;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v29);
          uint64_t v31 = [(MOMetric *)v3 metrics];
          [v31 setObject:&off_1002F79B8 forKeyedSubscript:v30];

          uint64_t v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v27 = [v25 countByEnumeratingWithState:&v33 objects:v50 count:16];
      }
      while (v27);
    }
  }
  return v3;
}

+ (id)BOOLeanKeys
{
  return +[NSSet setWithObjects:@"IHA_State", 0];
}

+ (id)integerKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", @"Age", @"BiologicalSex", @"ZeroEventDayCount", @"ZeroEventWeekCount", @"ZeroEventDayCountAcrossAllEvents", @"ZeroEventWeekCountAcrossAllEvents", @"Routine_nVisits", @"Routine_nHomeVisits", @"Routine_nWorkVisits", @"Routine_nGymVisits", @"Routine_nSchoolVisits", @"Storytelling_NumMoments", @"Storytelling_NumMomentsWithEvent", @"Storytelling_NumMomentsWithEventAndArtist", @"Storytelling_NumMomentsWithPeople", @"Storytelling_NumMomentsWithFamily", @"Storytelling_MomenetInferenceTag_1_1",
           @"Storytelling_MomenetInferenceTag_1_2",
           @"Storytelling_MomenetInferenceTag_1_3",
           @"Storytelling_MomenetInferenceTag_1_4",
           @"Storytelling_MomenetInferenceTag_2_1",
           @"Storytelling_MomenetInferenceTag_2_2",
           @"Storytelling_MomenetInferenceTag_2_3",
           @"Storytelling_MomenetInferenceTag_2_4",
           @"Storytelling_MomenetInferenceTag_3_1",
           @"Storytelling_MomenetInferenceTag_3_2",
           @"Storytelling_MomenetInferenceTag_3_3",
           @"Storytelling_MomenetInferenceTag_3_4",
           @"Workout_NumWorkouts",
           @"Workout_WorkoutType_1",
           @"Workout_WorkoutType_2",
           @"Workout_WorkoutType_3",
           @"Workout_WorkoutType_4",
           @"Workout_WorkoutType_5",
           @"Workout_WorkoutType_6",
           @"Workout_WorkoutType_7",
           @"Workout_WorkoutType_8",
           @"Workout_WorkoutType_9",
           @"Workout_WorkoutType_10",
           @"Proactive_NumAllEvents",
           @"Proactive_NumMediaOnRepeatEvents",
           @"Proactive_NumTopicEvents",
           @"Proactive_NumTravelEvents",
           @"Proactive_NumSharedWithYouEvents",
           @"Proactive_NumSignificantContactEvents",
           @"Proactive_NumStructuredEvents",
           @"Proactive_NumLeisureMediaEvents",
           @"Proactive_NumNLEvents",
           @"numPreBundles",
           @"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_0",
           @"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_1",
           @"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_0",
           @"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_1",
           @"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_0",
           @"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_1",
           @"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_0",
           @"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_1",
           @"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_0",
           @"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_1",
           @"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_0",
           @"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_1");
}

+ (id)doubleKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", @"QueryTimeDuration", @"Routine_AverageVisitsLatency", @"Routine_AverageVisitsRealLatency", @"Storytelling_AverageMomentsLatency", @"Storytelling_AverageMomentsRealLatency", @"Workout_AverageWorkoutLatency", @"Proactive_EventsAverageLatency", @"Proactive_MediaOnRepeatAverageLatency", @"Proactive_TopicAverageLatency", @"Proactive_TravelAverageLatency", @"Proactive_SharedWithYouAverageLatency", @"Proactive_SignificantContactAverageLatency", @"Proactive_StructuredEventsAverageLatency", @"Proactive_LeisureMediaEventsAverageLatency", @"Proactive_NLEventsAverageLatency", @"Routine_MeanDeltaBetweenVisits", @"Routine_MeanDeltaBetweenVisitsBoundariesIncluded",
           @"Routine_MinDeltaBetweenVisits",
           @"Routine_MinDeltaBetweenVisitsBoundariesIncluded",
           @"Routine_MaxDeltaBetweenVisits",
           @"Routine_MaxDeltaBetweenVisitsBoundariesIncluded",
           @"Routine_SDDeltaBetweenVisits",
           @"Routine_SDDeltaBetweenVisitsBoundariesIncluded",
           @"Storytelling_PercentageOfMomentEventsNoLOI",
           @"Workout_PercentageOfWorkoutEventsNoLOI",
           @"Proactive_PercentageOfMediaOnRepeatEventsNoLOI",
           @"Proactive_PercentageOfTopicEventsNoLOI",
           @"Proactive_PercentageOfTravelEventsNoLOI",
           @"Proactive_PercentageOfSharedWithYouEventsNoLOI",
           @"Proactive_PercentageOfSignificantContactEventsNoLOI",
           @"Proactive_PercentageOfStructuredEventsNoLOI",
           @"Proactive_PercentageOfLeisureMediaEventsNoLOI",
           @"Proactive_PercentageOfNLEventsNoLOI",
           @"Storytelling_MeanDeltaBetweenMoments",
           @"Storytelling_MeanDeltaBetweenMomentsBoundariesIncluded",
           @"Storytelling_MinDeltaBetweenMoments",
           @"Storytelling_MinDeltaBetweenMomentsBoundariesIncluded",
           @"Storytelling_MaxDeltaBetweenMoments",
           @"Storytelling_MaxDeltaBetweenMomentsBoundariesIncluded",
           @"Storytelling_SDDeltaBetweenMoments",
           @"Storytelling_SDDeltaBetweenMomentsBoundariesIncluded",
           @"Workout_MeanDeltaBetweenWorkouts",
           @"Workout_MeanDeltaBetweenWorkoutsBoundariesIncluded",
           @"Workout_MinDeltaBetweenWorkouts",
           @"Workout_MinDeltaBetweenWorkoutsBoundariesIncluded",
           @"Workout_MaxDeltaBetweenWorkouts",
           @"Workout_MaxDeltaBetweenWorkoutsBoundariesIncluded",
           @"Workout_SDDeltaBetweenWorkouts",
           @"Workout_SDDeltaBetweenWorkoutsBoundariesIncluded",
           @"Proactive_MeanDeltaBetweenMediaOnRepeatEvents",
           @"Proactive_MeanDeltaBetweenMediaOnRepeatEventsBoundariesIncluded",
           @"Proactive_MinDeltaBetweenMediaOnRepeatEvents",
           @"Proactive_MinDeltaBetweenMediaOnRepeatEventsBoundariesIncluded",
           @"Proactive_MaxDeltaBetweenMediaOnRepeatEvents",
           @"Proactive_MaxDeltaBetweenMediaOnRepeatEventsBoundariesIncluded",
           @"Proactive_SDDeltaBetweenMediaOnRepeatEvents",
           @"Proactive_SDDeltaBetweenMediaOnRepeatEventsBoundariesIncluded",
           @"Proactive_MeanDeltaBetweenTopicEvents",
           @"Proactive_MeanDeltaBetweenTopicEventsBoundariesIncluded",
           @"Proactive_MinDeltaBetweenTopicEvents",
           @"Proactive_MinDeltaBetweenTopicEventsBoundariesIncluded");
}

+ (id)bucketedKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", @"QueryTimeDuration_Bucketed", @"Age_Bucketed", @"HourIDSubmission", @"DayIDSubmission", @"Routine_nVisits_Bucketed", @"Routine_nHomeVisits_Bucketed", @"Routine_nWorkVisits_Bucketed", @"Routine_nGymVisits_Bucketed", @"Routine_nSchoolVisits_Bucketed", @"Routine_AverageVisitsLatency_Bucketed", @"Routine_AverageVisitsRealLatency_Bucketed", @"Routine_HourIDVisit_Start_1", @"Routine_HourIDVisit_Start_2", @"Routine_HourIDVisit_Start_3", @"Routine_HourIDVisit_Start_4", @"Routine_HourIDVisit_Start_5", @"Routine_HourIDVisit_Start_6",
           @"Routine_HourIDVisit_Start_7",
           @"Routine_HourIDVisit_Start_8",
           @"Routine_HourIDVisit_Start_9",
           @"Routine_HourIDVisit_Start_10",
           @"Routine_HourIDVisit_End_1",
           @"Routine_HourIDVisit_End_2",
           @"Routine_HourIDVisit_End_3",
           @"Routine_HourIDVisit_End_4",
           @"Routine_HourIDVisit_End_5",
           @"Routine_HourIDVisit_End_6",
           @"Routine_HourIDVisit_End_7",
           @"Routine_HourIDVisit_End_8",
           @"Routine_HourIDVisit_End_9",
           @"Routine_HourIDVisit_End_10",
           @"Routine_MeanDeltaBetweenVisits_Bucketed",
           @"Routine_MeanDeltaBetweenVisitsBoundariesIncluded_Bucketed",
           @"Routine_MinDeltaBetweenVisits_Bucketed",
           @"Routine_MinDeltaBetweenVisitsBoundariesIncluded_Bucketed",
           @"Routine_MaxDeltaBetweenVisits_Bucketed",
           @"Routine_MaxDeltaBetweenVisitsBoundariesIncluded_Bucketed",
           @"Routine_SDDeltaBetweenVisits_Bucketed",
           @"Routine_SDDeltaBetweenVisitsBoundariesIncluded_Bucketed",
           @"Storytelling_PercentageOfMomentEventsNoLOI_Bucketed",
           @"Workout_PercentageOfWorkoutEventsNoLOI_Bucketed",
           @"Proactive_PercentageOfMediaOnRepeatEventsNoLOI_Bucketed",
           @"Proactive_PercentageOfTopicEventsNoLOI_Bucketed",
           @"Proactive_PercentageOfTravelEventsNoLOI_Bucketed",
           @"Proactive_PercentageOfSharedWithYouEventsNoLOI_Bucketed",
           @"Proactive_PercentageOfSignificantContactEventsNoLOI_Bucketed",
           @"Proactive_PercentageOfStructuredEventsNoLOI_Bucketed",
           @"Proactive_PercentageOfLeisureMediaEventsNoLOI_Bucketed",
           @"Proactive_PercentageOfNLEventsNoLOI_Bucketed",
           @"Storytelling_NumMoments_Bucketed",
           @"Storytelling_NumMomentsWithEvent_Bucketed",
           @"Storytelling_NumMomentsWithEventAndArtist_Bucketed",
           @"Storytelling_NumMomentsWithPeople_Bucketed",
           @"Storytelling_NumMomentsWithFamily_Bucketed",
           @"Storytelling_MomenetInferenceTag_1_1_Bucketed",
           @"Storytelling_MomenetInferenceTag_1_2_Bucketed",
           @"Storytelling_MomenetInferenceTag_1_3_Bucketed",
           @"Storytelling_MomenetInferenceTag_1_4_Bucketed",
           @"Storytelling_MomenetInferenceTag_2_1_Bucketed",
           @"Storytelling_MomenetInferenceTag_2_2_Bucketed",
           @"Storytelling_MomenetInferenceTag_2_3_Bucketed");
}

+ (id)supportedMetricKeys
{
  v2 = [(id)objc_opt_class() integerKeys];
  v3 = +[NSMutableSet setWithSet:v2];

  v4 = [(id)objc_opt_class() BOOLeanKeys];
  id v5 = [v4 allObjects];
  [v3 addObjectsFromArray:v5];

  id v6 = [(id)objc_opt_class() doubleKeys];
  uint64_t v7 = [v6 allObjects];
  [v3 addObjectsFromArray:v7];

  id v8 = [(id)objc_opt_class() bucketedKeys];
  uint64_t v9 = [v8 allObjects];
  [v3 addObjectsFromArray:v9];

  return v3;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)MOAnalyticsEventPromptMetrics;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  [(MOPromptMetrics *)self setDerivedMetrics];
  v6.receiver = self;
  v6.super_class = (Class)MOPromptMetrics;
  return [(MOMetric *)&v6 submitMetricsWithError:a3];
}

+ (id)medianOf:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == (id)1)
    {
      v4 = [v3 objectAtIndexedSubscript:0];
      [v4 doubleValue];
      +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = [v3 sortedArrayUsingSelector:"compare:"];
      unsigned __int8 v6 = [v3 count];
      unint64_t v7 = (unint64_t)[v4 count] >> 1;
      if (v6)
      {
        id v8 = [v4 objectAtIndex:v7];
        [v8 doubleValue];
        +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        id v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v8 = [v4 objectAtIndex:v7 - 1];
        [v8 doubleValue];
        double v10 = v9;
        v11 = [v4 objectAtIndex:v7];
        [v11 doubleValue];
        id v5 = +[NSNumber numberWithDouble:(v10 + v12) * 0.5];
      }
    }
  }
  else
  {
    id v5 = &off_1002F9960;
  }

  return v5;
}

+ (id)meanOf:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == (id)1)
    {
      v4 = [v3 objectAtIndexedSubscript:0];
      [v4 doubleValue];
      +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v6 = 0.0;
      if ([v3 count])
      {
        unint64_t v7 = 1;
        do
        {
          if ((unint64_t)[v3 count] >= v7)
          {
            id v8 = [v3 objectAtIndexedSubscript:v7 - 1];
            [v8 doubleValue];
            double v6 = v6 + (v9 - v6) / (double)(int)v7;
          }
          else
          {
            double v6 = v6 - v6 / (double)(int)v7;
          }
        }
        while ((unint64_t)[v3 count] > v7++);
      }
      id v5 = +[NSNumber numberWithDouble:v6];
    }
  }
  else
  {
    id v5 = &off_1002F9960;
  }

  return v5;
}

+ (id)standardDeviationOf:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == (id)1)
    {
      v4 = &off_1002F9970;
    }
    else
    {
      id v5 = +[MOPromptMetrics meanOf:v3];
      [v5 doubleValue];
      double v7 = v6;

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = v3;
      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v17;
        double v12 = 0.0;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v16 + 1) + 8 * i) doubleValue:v16];
            double v12 = v12 + (v14 - v7) * (v14 - v7);
          }
          id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }
      else
      {
        double v12 = 0.0;
      }

      +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sqrt(v12 / (double)(unint64_t)[v8 count]));
      v4 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = &off_1002F9960;
  }

  return v4;
}

+ (id)getTimeDeltaMetricMap
{
  v4[0] = @"Routine_MeanDeltaBetweenVisits";
  v4[1] = @"Routine_MeanDeltaBetweenVisitsBoundariesIncluded";
  v5[0] = @"Routine_MeanDeltaBetweenVisits_Bucketed";
  v5[1] = @"Routine_MeanDeltaBetweenVisitsBoundariesIncluded_Bucketed";
  v4[2] = @"Routine_MinDeltaBetweenVisits";
  v4[3] = @"Routine_MinDeltaBetweenVisitsBoundariesIncluded";
  v5[2] = @"Routine_MinDeltaBetweenVisits_Bucketed";
  v5[3] = @"Routine_MinDeltaBetweenVisitsBoundariesIncluded_Bucketed";
  v4[4] = @"Routine_MaxDeltaBetweenVisits";
  v4[5] = @"Routine_MaxDeltaBetweenVisitsBoundariesIncluded";
  v5[4] = @"Routine_MaxDeltaBetweenVisits_Bucketed";
  v5[5] = @"Routine_MaxDeltaBetweenVisitsBoundariesIncluded_Bucketed";
  v4[6] = @"Routine_SDDeltaBetweenVisits";
  v4[7] = @"Routine_SDDeltaBetweenVisitsBoundariesIncluded";
  v5[6] = @"Routine_SDDeltaBetweenVisits_Bucketed";
  v5[7] = @"Routine_SDDeltaBetweenVisitsBoundariesIncluded_Bucketed";
  v4[8] = @"Storytelling_MeanDeltaBetweenMoments";
  v4[9] = @"Storytelling_MeanDeltaBetweenMomentsBoundariesIncluded";
  v5[8] = @"Storytelling_MeanDeltaBetweenMoments_Bucketed";
  v5[9] = @"Storytelling_MeanDeltaBetweenMomentsBoundariesIncluded_Bucketed";
  v4[10] = @"Storytelling_MinDeltaBetweenMoments";
  v4[11] = @"Storytelling_MinDeltaBetweenMomentsBoundariesIncluded";
  v5[10] = @"Storytelling_MinDeltaBetweenMoments_Bucketed";
  v5[11] = @"Storytelling_MinDeltaBetweenMomentsBoundariesIncluded_Bucketed";
  v4[12] = @"Storytelling_MaxDeltaBetweenMoments";
  v4[13] = @"Storytelling_MaxDeltaBetweenMomentsBoundariesIncluded";
  v5[12] = @"Storytelling_MaxDeltaBetweenMoments_Bucketed";
  v5[13] = @"Storytelling_MaxDeltaBetweenMomentsBoundariesIncluded_Bucketed";
  v4[14] = @"Storytelling_SDDeltaBetweenMoments";
  v4[15] = @"Storytelling_SDDeltaBetweenMomentsBoundariesIncluded";
  v5[14] = @"Storytelling_SDDeltaBetweenMoments_Bucketed";
  v5[15] = @"Storytelling_SDDeltaBetweenMomentsBoundariesIncluded_Bucketed";
  v4[16] = @"Workout_MeanDeltaBetweenWorkouts";
  v4[17] = @"Workout_MeanDeltaBetweenWorkoutsBoundariesIncluded";
  v5[16] = @"Workout_MeanDeltaBetweenWorkouts_Bucketed";
  v5[17] = @"Workout_MeanDeltaBetweenWorkoutsBoundariesIncluded_Bucketed";
  v4[18] = @"Workout_MinDeltaBetweenWorkouts";
  v4[19] = @"Workout_MinDeltaBetweenWorkoutsBoundariesIncluded";
  v5[18] = @"Workout_MinDeltaBetweenWorkouts_Bucketed";
  v5[19] = @"Workout_MinDeltaBetweenWorkoutsBoundariesIncluded_Bucketed";
  v4[20] = @"Workout_MaxDeltaBetweenWorkouts";
  v4[21] = @"Workout_MaxDeltaBetweenWorkoutsBoundariesIncluded";
  v5[20] = @"Workout_MaxDeltaBetweenWorkouts_Bucketed";
  v5[21] = @"Workout_MaxDeltaBetweenWorkoutsBoundariesIncluded_Bucketed";
  v4[22] = @"Workout_SDDeltaBetweenWorkouts";
  v4[23] = @"Workout_SDDeltaBetweenWorkoutsBoundariesIncluded";
  v5[22] = @"Workout_SDDeltaBetweenWorkouts_Bucketed";
  v5[23] = @"Workout_SDDeltaBetweenWorkoutsBoundariesIncluded_Bucketed";
  v4[24] = @"Proactive_MeanDeltaBetweenMediaOnRepeatEvents";
  v4[25] = @"Proactive_MeanDeltaBetweenMediaOnRepeatEventsBoundariesIncluded";
  v5[24] = @"Proactive_MeanDeltaBetweenMediaOnRepeatEvents_Bucketed";
  v5[25] = @"Proactive_MeanDeltaBetweenMediaOnRepeatEventsBoundariesIncluded_Bucketed";
  v4[26] = @"Proactive_MinDeltaBetweenMediaOnRepeatEvents";
  v4[27] = @"Proactive_MinDeltaBetweenMediaOnRepeatEventsBoundariesIncluded";
  v5[26] = @"Proactive_MinDeltaBetweenMediaOnRepeatEvents_Bucketed";
  v5[27] = @"Proactive_MinDeltaBetweenMediaOnRepeatEventsBoundariesIncluded_Bucketed";
  v4[28] = @"Proactive_MaxDeltaBetweenMediaOnRepeatEvents";
  v4[29] = @"Proactive_MaxDeltaBetweenMediaOnRepeatEventsBoundariesIncluded";
  v5[28] = @"Proactive_MaxDeltaBetweenMediaOnRepeatEvents_Bucketed";
  v5[29] = @"Proactive_MaxDeltaBetweenMediaOnRepeatEventsBoundariesIncluded_Bucketed";
  v4[30] = @"Proactive_SDDeltaBetweenMediaOnRepeatEvents";
  v4[31] = @"Proactive_SDDeltaBetweenMediaOnRepeatEventsBoundariesIncluded";
  v5[30] = @"Proactive_SDDeltaBetweenMediaOnRepeatEvents_Bucketed";
  v5[31] = @"Proactive_SDDeltaBetweenMediaOnRepeatEventsBoundariesIncluded_Bucketed";
  v4[32] = @"Proactive_MeanDeltaBetweenTopicEvents";
  v4[33] = @"Proactive_MeanDeltaBetweenTopicEventsBoundariesIncluded";
  v5[32] = @"Proactive_MeanDeltaBetweenTopicEvents_Bucketed";
  v5[33] = @"Proactive_MeanDeltaBetweenTopicEventsBoundariesIncluded_Bucketed";
  v4[34] = @"Proactive_MinDeltaBetweenTopicEvents";
  v4[35] = @"Proactive_MinDeltaBetweenTopicEventsBoundariesIncluded";
  v5[34] = @"Proactive_MinDeltaBetweenTopicEvents_Bucketed";
  v5[35] = @"Proactive_MinDeltaBetweenTopicEventsBoundariesIncluded_Bucketed";
  v4[36] = @"Proactive_MaxDeltaBetweenTopicEvents";
  v4[37] = @"Proactive_MaxDeltaBetweenTopicEventsBoundariesIncluded";
  v5[36] = @"Proactive_MaxDeltaBetweenTopicEvents_Bucketed";
  v5[37] = @"Proactive_MaxDeltaBetweenTopicEventsBoundariesIncluded_Bucketed";
  v4[38] = @"Proactive_SDDeltaBetweenTopicEvents";
  v4[39] = @"Proactive_SDDeltaBetweenTopicEventsBoundariesIncluded";
  v5[38] = @"Proactive_SDDeltaBetweenTopicEvents_Bucketed";
  v5[39] = @"Proactive_SDDeltaBetweenTopicEventsBoundariesIncluded_Bucketed";
  v4[40] = @"Proactive_MeanDeltaBetweenTravelEvents";
  v4[41] = @"Proactive_MeanDeltaBetweenTravelEventsBoundariesIncluded";
  v5[40] = @"Proactive_MeanDeltaBetweenTravelEvents_Bucketed";
  v5[41] = @"Proactive_MeanDeltaBetweenTravelEventsBoundariesIncluded_Bucketed";
  v4[42] = @"Proactive_MinDeltaBetweenTravelEvents";
  v4[43] = @"Proactive_MinDeltaBetweenTravelEventsBoundariesIncluded";
  v5[42] = @"Proactive_MinDeltaBetweenTravelEvents_Bucketed";
  v5[43] = @"Proactive_MinDeltaBetweenTravelEventsBoundariesIncluded_Bucketed";
  v4[44] = @"Proactive_MaxDeltaBetweenTravelEvents";
  v4[45] = @"Proactive_MaxDeltaBetweenTravelEventsBoundariesIncluded";
  v5[44] = @"Proactive_MaxDeltaBetweenTravelEvents_Bucketed";
  v5[45] = @"Proactive_MaxDeltaBetweenTravelEventsBoundariesIncluded_Bucketed";
  v4[46] = @"Proactive_SDDeltaBetweenTravelEvents";
  v4[47] = @"Proactive_SDDeltaBetweenTravelEventsBoundariesIncluded";
  v5[46] = @"Proactive_SDDeltaBetweenTravelEvents_Bucketed";
  v5[47] = @"Proactive_SDDeltaBetweenTravelEventsBoundariesIncluded_Bucketed";
  v4[48] = @"Proactive_MeanDeltaBetweenSharedWithYouEvents";
  v4[49] = @"Proactive_MeanDeltaBetweenSharedWithYouEventsBoundariesIncluded";
  v5[48] = @"Proactive_MeanDeltaBetweenSharedWithYouEvents_Bucketed";
  v5[49] = @"Proactive_MeanDeltaBetweenSharedWithYouEventsBoundariesIncluded_Bucketed";
  v4[50] = @"Proactive_MinDeltaBetweenSharedWithYouEvents";
  v4[51] = @"Proactive_MinDeltaBetweenSharedWithYouEventsBoundariesIncluded";
  v5[50] = @"Proactive_MinDeltaBetweenSharedWithYouEvents_Bucketed";
  v5[51] = @"Proactive_MinDeltaBetweenSharedWithYouEventsBoundariesIncluded_Bucketed";
  v4[52] = @"Proactive_MaxDeltaBetweenSharedWithYouEvents";
  v4[53] = @"Proactive_MaxDeltaBetweenSharedWithYouEventsBoundariesIncluded";
  v5[52] = @"Proactive_MaxDeltaBetweenSharedWithYouEvents_Bucketed";
  v5[53] = @"Proactive_MaxDeltaBetweenSharedWithYouEventsBoundariesIncluded_Bucketed";
  v4[54] = @"Proactive_SDDeltaBetweenSharedWithYouEvents";
  v4[55] = @"Proactive_SDDeltaBetweenSharedWithYouEventsBoundariesIncluded";
  v5[54] = @"Proactive_SDDeltaBetweenSharedWithYouEvents_Bucketed";
  v5[55] = @"Proactive_SDDeltaBetweenSharedWithYouEventsBoundariesIncluded_Bucketed";
  v4[56] = @"Proactive_MeanDeltaBetweenSignificantContactEvents";
  v4[57] = @"Proactive_MeanDeltaBetweenSignificantContactEventsBoundariesIncluded";
  v5[56] = @"Proactive_MeanDeltaBetweenSignificantContactEvents_Bucketed";
  v5[57] = @"Proactive_MeanDeltaBetweenSignificantContactEventsBoundariesIncluded_Bucketed";
  v4[58] = @"Proactive_MinDeltaBetweenSignificantContactEvents";
  v4[59] = @"Proactive_MinDeltaBetweenSignificantContactEventsBoundariesIncluded";
  v5[58] = @"Proactive_MinDeltaBetweenSignificantContactEvents_Bucketed";
  v5[59] = @"Proactive_MinDeltaBetweenSignificantContactEventsBoundariesIncluded_Bucketed";
  v4[60] = @"Proactive_MaxDeltaBetweenSignificantContactEvents";
  v4[61] = @"Proactive_MaxDeltaBetweenSignificantContactEventsBoundariesIncluded";
  v5[60] = @"Proactive_MaxDeltaBetweenSignificantContactEvents_Bucketed";
  v5[61] = @"Proactive_MaxDeltaBetweenSignificantContactEventsBoundariesIncluded_Bucketed";
  v4[62] = @"Proactive_SDDeltaBetweenSignificantContactEvents";
  v4[63] = @"Proactive_SDDeltaBetweenSignificantContactEventsBoundariesIncluded";
  v5[62] = @"Proactive_SDDeltaBetweenSignificantContactEvents_Bucketed";
  v5[63] = @"Proactive_SDDeltaBetweenSignificantContactEventsBoundariesIncluded_Bucketed";
  v4[64] = @"Proactive_MeanDeltaBetweenStructuredEvents";
  v5[64] = @"Proactive_MeanDeltaBetweenStructuredEvents_Bucketed";
  v4[65] = @"Proactive_MeanDeltaBetweenStructuredEventsBoundariesIncluded";
  v5[65] = @"Proactive_MeanDeltaBetweenStructuredEventsBoundariesIncluded_Bucketed";
  v4[66] = @"Proactive_MinDeltaBetweenStructuredEvents";
  v5[66] = @"Proactive_MinDeltaBetweenStructuredEvents_Bucketed";
  v4[67] = @"Proactive_MinDeltaBetweenStructuredEventsBoundariesIncluded";
  v5[67] = @"Proactive_MinDeltaBetweenStructuredEventsBoundariesIncluded_Bucketed";
  v4[68] = @"Proactive_MaxDeltaBetweenStructuredEvents";
  v5[68] = @"Proactive_MaxDeltaBetweenStructuredEvents_Bucketed";
  v4[69] = @"Proactive_MaxDeltaBetweenStructuredEventsBoundariesIncluded";
  v5[69] = @"Proactive_MaxDeltaBetweenStructuredEventsBoundariesIncluded_Bucketed";
  v4[70] = @"Proactive_SDDeltaBetweenStructuredEvents";
  v5[70] = @"Proactive_SDDeltaBetweenStructuredEvents_Bucketed";
  v4[71] = @"Proactive_SDDeltaBetweenStructuredEventsBoundariesIncluded";
  v5[71] = @"Proactive_SDDeltaBetweenStructuredEventsBoundariesIncluded_Bucketed";
  v4[72] = @"Proactive_MeanDeltaBetweenLeisureMediaEvents";
  v5[72] = @"Proactive_MeanDeltaBetweenLeisureMediaEvents_Bucketed";
  v4[73] = @"Proactive_MeanDeltaBetweenLeisureMediaEventsBoundariesIncluded";
  v5[73] = @"Proactive_MeanDeltaBetweenLeisureMediaEventsBoundariesIncluded_Bucketed";
  v4[74] = @"Proactive_MinDeltaBetweenLeisureMediaEvents";
  v5[74] = @"Proactive_MinDeltaBetweenLeisureMediaEvents_Bucketed";
  v4[75] = @"Proactive_MinDeltaBetweenLeisureMediaEventsBoundariesIncluded";
  v5[75] = @"Proactive_MinDeltaBetweenLeisureMediaEventsBoundariesIncluded_Bucketed";
  v4[76] = @"Proactive_MaxDeltaBetweenLeisureMediaEvents";
  v5[76] = @"Proactive_MaxDeltaBetweenLeisureMediaEvents_Bucketed";
  v4[77] = @"Proactive_MaxDeltaBetweenLeisureMediaEventsBoundariesIncluded";
  v5[77] = @"Proactive_MaxDeltaBetweenLeisureMediaEventsBoundariesIncluded_Bucketed";
  v4[78] = @"Proactive_SDDeltaBetweenLeisureMediaEvents";
  v5[78] = @"Proactive_SDDeltaBetweenLeisureMediaEvents_Bucketed";
  v4[79] = @"Proactive_SDDeltaBetweenLeisureMediaEventsBoundariesIncluded";
  v5[79] = @"Proactive_SDDeltaBetweenLeisureMediaEventsBoundariesIncluded_Bucketed";
  v4[80] = @"Proactive_MeanDeltaBetweenNLEvents";
  v5[80] = @"Proactive_MeanDeltaBetweenNLEvents_Bucketed";
  v4[81] = @"Proactive_MeanDeltaBetweenNLEventsBoundariesIncluded";
  v5[81] = @"Proactive_MeanDeltaBetweenNLEventsBoundariesIncluded_Bucketed";
  v4[82] = @"Proactive_MinDeltaBetweenNLEvents";
  v5[82] = @"Proactive_MinDeltaBetweenNLEvents_Bucketed";
  v4[83] = @"Proactive_MinDeltaBetweenNLEventsBoundariesIncluded";
  v5[83] = @"Proactive_MinDeltaBetweenNLEventsBoundariesIncluded_Bucketed";
  v4[84] = @"Proactive_MaxDeltaBetweenNLEvents";
  v5[84] = @"Proactive_MaxDeltaBetweenNLEvents_Bucketed";
  v4[85] = @"Proactive_MaxDeltaBetweenNLEventsBoundariesIncluded";
  v5[85] = @"Proactive_MaxDeltaBetweenNLEventsBoundariesIncluded_Bucketed";
  v4[86] = @"Proactive_SDDeltaBetweenNLEvents";
  v5[86] = @"Proactive_SDDeltaBetweenNLEvents_Bucketed";
  v4[87] = @"Proactive_SDDeltaBetweenNLEventsBoundariesIncluded";
  v5[87] = @"Proactive_SDDeltaBetweenNLEventsBoundariesIncluded_Bucketed";
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:88];

  return v2;
}

- (void)setDerivedMetrics
{
  v286 = +[MOMetric binsFromStart:&off_1002F79D0 toEnd:&off_1002F7A60 gap:&off_1002F7A78];
  v285 = +[MOMetric binsFromStart:&off_1002F79D0 toEnd:&off_1002F9980 gap:&off_1002F9990];
  uint64_t v3 = +[MOMetric binsFromStart:&off_1002F79D0 toEnd:&off_1002F99A0 gap:&off_1002F99B0];
  v289 = +[MOMetric binsFromStart:&off_1002F79D0 toEnd:&off_1002F99A0 gap:&off_1002F99C0];
  v283 = +[MOMetric binsFromStart:&off_1002F79D0 toEnd:&off_1002F7A78 gap:&off_1002F99D0];
  v4 = [(MOMetric *)self metrics];
  id v5 = [v4 objectForKeyedSubscript:@"QueryTimeDuration"];
  v284 = (void *)v3;
  double v6 = +[MOMetric binForNumber:v5 bins:v3];
  double v7 = [(MOMetric *)self metrics];
  [v7 setObject:v6 forKeyedSubscript:@"QueryTimeDuration_Bucketed"];

  id v8 = [(MOMetric *)self metrics];
  id v9 = [v8 objectForKeyedSubscript:@"Age"];
  id v10 = +[MOMetric binForNumber:v9 bins:&off_1002F9428];
  uint64_t v11 = [(MOMetric *)self metrics];
  [v11 setObject:v10 forKeyedSubscript:@"Age_Bucketed"];

  +[MOPromptMetrics getTimeDeltaMetricMap];
  long long v294 = 0u;
  long long v295 = 0u;
  long long v296 = 0u;
  v288 = long long v297 = 0u;
  double v12 = [v288 allKeys];
  id v13 = [v12 countByEnumeratingWithState:&v294 objects:v301 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v295;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v295 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v294 + 1) + 8 * i);
        long long v18 = [v288 objectForKey:v17];
        long long v19 = [(MOMetric *)self metrics];
        id v20 = [v19 objectForKeyedSubscript:v17];
        uint64_t v21 = +[MOMetric binForNumber:v20 bins:v289];
        uint64_t v22 = [(MOMetric *)self metrics];
        [v22 setObject:v21 forKeyedSubscript:v18];
      }
      id v14 = [v12 countByEnumeratingWithState:&v294 objects:v301 count:16];
    }
    while (v14);
  }

  uint64_t v23 = [(MOMetric *)self metrics];
  v24 = [v23 objectForKeyedSubscript:@"Routine_nVisits"];
  v25 = +[MOMetric binForNumber:v24 bins:v286];
  id v26 = [(MOMetric *)self metrics];
  [v26 setObject:v25 forKeyedSubscript:@"Routine_nVisits_Bucketed"];

  id v27 = [(MOMetric *)self metrics];
  uint64_t v28 = [v27 objectForKeyedSubscript:@"Routine_nHomeVisits"];
  uint64_t v29 = +[MOMetric binForNumber:v28 bins:v286];
  uint64_t v30 = [(MOMetric *)self metrics];
  [v30 setObject:v29 forKeyedSubscript:@"Routine_nHomeVisits_Bucketed"];

  uint64_t v31 = [(MOMetric *)self metrics];
  uint64_t v32 = [v31 objectForKeyedSubscript:@"Routine_nWorkVisits"];
  long long v33 = +[MOMetric binForNumber:v32 bins:v286];
  long long v34 = [(MOMetric *)self metrics];
  [v34 setObject:v33 forKeyedSubscript:@"Routine_nWorkVisits_Bucketed"];

  long long v35 = [(MOMetric *)self metrics];
  long long v36 = [v35 objectForKeyedSubscript:@"Routine_nGymVisits"];
  long long v37 = +[MOMetric binForNumber:v36 bins:v286];
  long long v38 = [(MOMetric *)self metrics];
  [v38 setObject:v37 forKeyedSubscript:@"Routine_nGymVisits_Bucketed"];

  long long v39 = [(MOMetric *)self metrics];
  long long v40 = [v39 objectForKeyedSubscript:@"Routine_nSchoolVisits"];
  long long v41 = +[MOMetric binForNumber:v40 bins:v286];
  long long v42 = [(MOMetric *)self metrics];
  [v42 setObject:v41 forKeyedSubscript:@"Routine_nSchoolVisits_Bucketed"];

  long long v43 = [(MOMetric *)self metrics];
  long long v44 = [v43 objectForKeyedSubscript:@"Routine_AverageVisitsLatency"];
  long long v45 = +[MOMetric binForNumber:v44 bins:v285];
  long long v46 = [(MOMetric *)self metrics];
  [v46 setObject:v45 forKeyedSubscript:@"Routine_AverageVisitsLatency_Bucketed"];

  long long v47 = [(MOMetric *)self metrics];
  long long v48 = [v47 objectForKeyedSubscript:@"Routine_AverageVisitsRealLatency"];
  objc_super v49 = +[MOMetric binForNumber:v48 bins:v285];
  v50 = [(MOMetric *)self metrics];
  [v50 setObject:v49 forKeyedSubscript:@"Routine_AverageVisitsRealLatency_Bucketed"];

  v51 = [(MOMetric *)self metrics];
  v52 = [v51 objectForKeyedSubscript:@"Storytelling_NumMoments"];
  v53 = +[MOMetric binForNumber:v52 bins:v286];
  v54 = [(MOMetric *)self metrics];
  [v54 setObject:v53 forKeyedSubscript:@"Storytelling_NumMoments_Bucketed"];

  v55 = [(MOMetric *)self metrics];
  v56 = [v55 objectForKeyedSubscript:@"Storytelling_NumMomentsWithEvent"];
  v57 = +[MOMetric binForNumber:v56 bins:v286];
  v58 = [(MOMetric *)self metrics];
  [v58 setObject:v57 forKeyedSubscript:@"Storytelling_NumMomentsWithEvent_Bucketed"];

  v59 = [(MOMetric *)self metrics];
  v60 = [v59 objectForKeyedSubscript:@"Storytelling_NumMomentsWithEventAndArtist"];
  v61 = +[MOMetric binForNumber:v60 bins:v286];
  v62 = [(MOMetric *)self metrics];
  [v62 setObject:v61 forKeyedSubscript:@"Storytelling_NumMomentsWithEventAndArtist_Bucketed"];

  v63 = [(MOMetric *)self metrics];
  v64 = [v63 objectForKeyedSubscript:@"Storytelling_NumMomentsWithFamily"];
  v65 = +[MOMetric binForNumber:v64 bins:v286];
  v66 = [(MOMetric *)self metrics];
  [v66 setObject:v65 forKeyedSubscript:@"Storytelling_NumMomentsWithFamily_Bucketed"];

  v67 = [(MOMetric *)self metrics];
  v68 = [v67 objectForKeyedSubscript:@"Storytelling_NumMomentsWithPeople"];
  v69 = +[MOMetric binForNumber:v68 bins:v286];
  v70 = [(MOMetric *)self metrics];
  [v70 setObject:v69 forKeyedSubscript:@"Storytelling_NumMomentsWithPeople_Bucketed"];

  v71 = [(MOMetric *)self metrics];
  v72 = [v71 objectForKeyedSubscript:@"Storytelling_AverageMomentsLatency"];
  v73 = +[MOMetric binForNumber:v72 bins:v285];
  v74 = [(MOMetric *)self metrics];
  [v74 setObject:v73 forKeyedSubscript:@"Storytelling_AverageMomentsLatency_Bucketed"];

  v75 = [(MOMetric *)self metrics];
  v76 = [v75 objectForKeyedSubscript:@"Storytelling_AverageMomentsRealLatency"];
  v77 = +[MOMetric binForNumber:v76 bins:v285];
  v287 = self;
  v78 = [(MOMetric *)self metrics];
  [v78 setObject:v77 forKeyedSubscript:@"Storytelling_AverageMomentsRealLatency_Bucketed"];

  v299[0] = @"Storytelling_MomenetInferenceTag_1_1";
  v299[1] = @"Storytelling_MomenetInferenceTag_1_2";
  v300[0] = @"Storytelling_MomenetInferenceTag_1_1_Bucketed";
  v300[1] = @"Storytelling_MomenetInferenceTag_1_2_Bucketed";
  v299[2] = @"Storytelling_MomenetInferenceTag_1_3";
  v299[3] = @"Storytelling_MomenetInferenceTag_1_4";
  v300[2] = @"Storytelling_MomenetInferenceTag_1_3_Bucketed";
  v300[3] = @"Storytelling_MomenetInferenceTag_1_4_Bucketed";
  v299[4] = @"Storytelling_MomenetInferenceTag_2_1";
  v299[5] = @"Storytelling_MomenetInferenceTag_2_2";
  v300[4] = @"Storytelling_MomenetInferenceTag_2_1_Bucketed";
  v300[5] = @"Storytelling_MomenetInferenceTag_2_2_Bucketed";
  v299[6] = @"Storytelling_MomenetInferenceTag_2_3";
  v299[7] = @"Storytelling_MomenetInferenceTag_2_4";
  v300[6] = @"Storytelling_MomenetInferenceTag_2_3_Bucketed";
  v300[7] = @"Storytelling_MomenetInferenceTag_2_4_Bucketed";
  v299[8] = @"Storytelling_MomenetInferenceTag_3_1";
  v299[9] = @"Storytelling_MomenetInferenceTag_3_2";
  v300[8] = @"Storytelling_MomenetInferenceTag_3_1_Bucketed";
  v300[9] = @"Storytelling_MomenetInferenceTag_3_2_Bucketed";
  v299[10] = @"Storytelling_MomenetInferenceTag_3_3";
  v299[11] = @"Storytelling_MomenetInferenceTag_3_4";
  v300[10] = @"Storytelling_MomenetInferenceTag_3_3_Bucketed";
  v300[11] = @"Storytelling_MomenetInferenceTag_3_4_Bucketed";
  +[NSDictionary dictionaryWithObjects:v300 forKeys:v299 count:12];
  long long v290 = 0u;
  long long v291 = 0u;
  long long v292 = 0u;
  long long v293 = 0u;
  id v79 = (id)objc_claimAutoreleasedReturnValue();
  id v80 = [v79 countByEnumeratingWithState:&v290 objects:v298 count:16];
  if (v80)
  {
    id v81 = v80;
    uint64_t v82 = *(void *)v291;
    do
    {
      for (j = 0; j != v81; j = (char *)j + 1)
      {
        if (*(void *)v291 != v82) {
          objc_enumerationMutation(v79);
        }
        uint64_t v84 = *(void *)(*((void *)&v290 + 1) + 8 * (void)j);
        v85 = [(MOMetric *)v287 metrics];
        v86 = [v85 objectForKeyedSubscript:v84];
        v87 = +[MOPhotoMomentTags getCoarseInferenceTag:v86];

        if (v87)
        {
          v88 = [v79 objectForKeyedSubscript:v84];
          v89 = [(MOMetric *)v287 metrics];
          [v89 setObject:v87 forKeyedSubscript:v88];
        }
      }
      id v81 = [v79 countByEnumeratingWithState:&v290 objects:v298 count:16];
    }
    while (v81);
  }
  v90 = v79;

  v91 = [(MOMetric *)v287 metrics];
  v92 = [v91 objectForKeyedSubscript:@"Workout_NumWorkouts"];
  v93 = +[MOMetric binForNumber:v92 bins:v286];
  v94 = [(MOMetric *)v287 metrics];
  [v94 setObject:v93 forKeyedSubscript:@"Workout_NumWorkouts_Bucketed"];

  v95 = [(MOMetric *)v287 metrics];
  v96 = [v95 objectForKeyedSubscript:@"Workout_AverageWorkoutLatency"];
  v97 = +[MOMetric binForNumber:v96 bins:v285];
  v98 = [(MOMetric *)v287 metrics];
  [v98 setObject:v97 forKeyedSubscript:@"Workout_AverageWorkoutLatency_Bucketed"];

  v99 = [(MOMetric *)v287 metrics];
  v100 = [v99 objectForKeyedSubscript:@"Proactive_NumAllEvents"];
  v101 = +[MOMetric binForNumber:v100 bins:v286];
  v102 = [(MOMetric *)v287 metrics];
  [v102 setObject:v101 forKeyedSubscript:@"Proactive_NumAllEvents_Bucketed"];

  v103 = [(MOMetric *)v287 metrics];
  v104 = [v103 objectForKeyedSubscript:@"Proactive_NumMediaOnRepeatEvents"];
  v105 = +[MOMetric binForNumber:v104 bins:v286];
  v106 = [(MOMetric *)v287 metrics];
  [v106 setObject:v105 forKeyedSubscript:@"Proactive_NumMediaOnRepeatEvents_Bucketed"];

  v107 = [(MOMetric *)v287 metrics];
  v108 = [v107 objectForKeyedSubscript:@"Proactive_NumTopicEvents"];
  v109 = +[MOMetric binForNumber:v108 bins:v286];
  v110 = [(MOMetric *)v287 metrics];
  [v110 setObject:v109 forKeyedSubscript:@"Proactive_NumTopicEvents_Bucketed"];

  v111 = [(MOMetric *)v287 metrics];
  v112 = [v111 objectForKeyedSubscript:@"Proactive_NumTravelEvents"];
  v113 = +[MOMetric binForNumber:v112 bins:v286];
  v114 = [(MOMetric *)v287 metrics];
  [v114 setObject:v113 forKeyedSubscript:@"Proactive_NumTravelEvents_Bucketed"];

  v115 = [(MOMetric *)v287 metrics];
  v116 = [v115 objectForKeyedSubscript:@"Proactive_NumSharedWithYouEvents"];
  v117 = +[MOMetric binForNumber:v116 bins:v286];
  v118 = [(MOMetric *)v287 metrics];
  [v118 setObject:v117 forKeyedSubscript:@"Proactive_NumSharedWithYouEvents_Bucketed"];

  v119 = [(MOMetric *)v287 metrics];
  v120 = [v119 objectForKeyedSubscript:@"Proactive_NumSignificantContactEvents"];
  v121 = +[MOMetric binForNumber:v120 bins:v286];
  v122 = [(MOMetric *)v287 metrics];
  [v122 setObject:v121 forKeyedSubscript:@"Proactive_NumSignificantContactEvents_Bucketed"];

  v123 = [(MOMetric *)v287 metrics];
  v124 = [v123 objectForKeyedSubscript:@"Proactive_NumStructuredEvents"];
  v125 = +[MOMetric binForNumber:v124 bins:v286];
  v126 = [(MOMetric *)v287 metrics];
  [v126 setObject:v125 forKeyedSubscript:@"Proactive_NumStructuredEvents_Bucketed"];

  v127 = [(MOMetric *)v287 metrics];
  v128 = [v127 objectForKeyedSubscript:@"Proactive_NumLeisureMediaEvents"];
  v129 = +[MOMetric binForNumber:v128 bins:v286];
  v130 = [(MOMetric *)v287 metrics];
  [v130 setObject:v129 forKeyedSubscript:@"Proactive_NumLeisureMediaEvents_Bucketed"];

  v131 = [(MOMetric *)v287 metrics];
  v132 = [v131 objectForKeyedSubscript:@"Proactive_NumNLEvents"];
  v133 = +[MOMetric binForNumber:v132 bins:v286];
  v134 = [(MOMetric *)v287 metrics];
  [v134 setObject:v133 forKeyedSubscript:@"Proactive_NumNLEvents_Bucketed"];

  v135 = [(MOMetric *)v287 metrics];
  v136 = [v135 objectForKeyedSubscript:@"Proactive_EventsAverageLatency"];
  v137 = +[MOMetric binForNumber:v136 bins:v285];
  v138 = [(MOMetric *)v287 metrics];
  [v138 setObject:v137 forKeyedSubscript:@"Proactive_EventsAverageLatency_Bucketed"];

  v139 = [(MOMetric *)v287 metrics];
  v140 = [v139 objectForKeyedSubscript:@"Proactive_MediaOnRepeatAverageLatency"];
  v141 = +[MOMetric binForNumber:v140 bins:v285];
  v142 = [(MOMetric *)v287 metrics];
  [v142 setObject:v141 forKeyedSubscript:@"Proactive_MediaOnRepeatAverageLatency_Bucketed"];

  v143 = [(MOMetric *)v287 metrics];
  v144 = [v143 objectForKeyedSubscript:@"Proactive_TopicAverageLatency"];
  v145 = +[MOMetric binForNumber:v144 bins:v285];
  v146 = [(MOMetric *)v287 metrics];
  [v146 setObject:v145 forKeyedSubscript:@"Proactive_TopicAverageLatency_Bucketed"];

  v147 = [(MOMetric *)v287 metrics];
  v148 = [v147 objectForKeyedSubscript:@"Proactive_TravelAverageLatency"];
  v149 = +[MOMetric binForNumber:v148 bins:v285];
  v150 = [(MOMetric *)v287 metrics];
  [v150 setObject:v149 forKeyedSubscript:@"Proactive_TravelAverageLatency_Bucketed"];

  v151 = [(MOMetric *)v287 metrics];
  v152 = [v151 objectForKeyedSubscript:@"Proactive_SharedWithYouAverageLatency"];
  v153 = +[MOMetric binForNumber:v152 bins:v285];
  v154 = [(MOMetric *)v287 metrics];
  [v154 setObject:v153 forKeyedSubscript:@"Proactive_SharedWithYouAverageLatency_Bucketed"];

  v155 = [(MOMetric *)v287 metrics];
  v156 = [v155 objectForKeyedSubscript:@"Proactive_SignificantContactAverageLatency"];
  v157 = +[MOMetric binForNumber:v156 bins:v285];
  v158 = [(MOMetric *)v287 metrics];
  [v158 setObject:v157 forKeyedSubscript:@"Proactive_SignificantContactAverageLatency_Bucketed"];

  v159 = [(MOMetric *)v287 metrics];
  v160 = [v159 objectForKeyedSubscript:@"Proactive_StructuredEventsAverageLatency"];
  v161 = +[MOMetric binForNumber:v160 bins:v285];
  v162 = [(MOMetric *)v287 metrics];
  [v162 setObject:v161 forKeyedSubscript:@"Proactive_StructuredEventsAverageLatency_Bucketed"];

  v163 = [(MOMetric *)v287 metrics];
  v164 = [v163 objectForKeyedSubscript:@"Proactive_LeisureMediaEventsAverageLatency"];
  v165 = +[MOMetric binForNumber:v164 bins:v285];
  v166 = [(MOMetric *)v287 metrics];
  [v166 setObject:v165 forKeyedSubscript:@"Proactive_LeisureMediaEventsAverageLatency_Bucketed"];

  v167 = [(MOMetric *)v287 metrics];
  v168 = [v167 objectForKeyedSubscript:@"Proactive_NLEventsAverageLatency"];
  v169 = +[MOMetric binForNumber:v168 bins:v285];
  v170 = [(MOMetric *)v287 metrics];
  [v170 setObject:v169 forKeyedSubscript:@"Proactive_NLEventsAverageLatency_Bucketed"];

  v171 = [(MOMetric *)v287 metrics];
  v172 = [v171 objectForKeyedSubscript:@"Storytelling_PercentageOfMomentEventsNoLOI"];
  v173 = +[MOMetric binForNumber:v172 bins:v283];
  v174 = [(MOMetric *)v287 metrics];
  [v174 setObject:v173 forKeyedSubscript:@"Storytelling_PercentageOfMomentEventsNoLOI_Bucketed"];

  v175 = [(MOMetric *)v287 metrics];
  v176 = [v175 objectForKeyedSubscript:@"Workout_PercentageOfWorkoutEventsNoLOI"];
  v177 = +[MOMetric binForNumber:v176 bins:v283];
  v178 = [(MOMetric *)v287 metrics];
  [v178 setObject:v177 forKeyedSubscript:@"Workout_PercentageOfWorkoutEventsNoLOI_Bucketed"];

  v179 = [(MOMetric *)v287 metrics];
  v180 = [v179 objectForKeyedSubscript:@"Proactive_PercentageOfMediaOnRepeatEventsNoLOI"];
  v181 = +[MOMetric binForNumber:v180 bins:v283];
  v182 = [(MOMetric *)v287 metrics];
  [v182 setObject:v181 forKeyedSubscript:@"Proactive_PercentageOfMediaOnRepeatEventsNoLOI_Bucketed"];

  v183 = [(MOMetric *)v287 metrics];
  v184 = [v183 objectForKeyedSubscript:@"Proactive_PercentageOfTopicEventsNoLOI"];
  v185 = +[MOMetric binForNumber:v184 bins:v283];
  v186 = [(MOMetric *)v287 metrics];
  [v186 setObject:v185 forKeyedSubscript:@"Proactive_PercentageOfTopicEventsNoLOI_Bucketed"];

  v187 = [(MOMetric *)v287 metrics];
  v188 = [v187 objectForKeyedSubscript:@"Proactive_PercentageOfTravelEventsNoLOI"];
  v189 = +[MOMetric binForNumber:v188 bins:v283];
  v190 = [(MOMetric *)v287 metrics];
  [v190 setObject:v189 forKeyedSubscript:@"Proactive_PercentageOfTravelEventsNoLOI_Bucketed"];

  v191 = [(MOMetric *)v287 metrics];
  v192 = [v191 objectForKeyedSubscript:@"Proactive_PercentageOfSharedWithYouEventsNoLOI"];
  v193 = +[MOMetric binForNumber:v192 bins:v283];
  v194 = [(MOMetric *)v287 metrics];
  [v194 setObject:v193 forKeyedSubscript:@"Proactive_PercentageOfSharedWithYouEventsNoLOI_Bucketed"];

  v195 = [(MOMetric *)v287 metrics];
  v196 = [v195 objectForKeyedSubscript:@"Proactive_PercentageOfSignificantContactEventsNoLOI"];
  v197 = +[MOMetric binForNumber:v196 bins:v283];
  v198 = [(MOMetric *)v287 metrics];
  [v198 setObject:v197 forKeyedSubscript:@"Proactive_PercentageOfSignificantContactEventsNoLOI_Bucketed"];

  v199 = [(MOMetric *)v287 metrics];
  v200 = [v199 objectForKeyedSubscript:@"Proactive_PercentageOfStructuredEventsNoLOI"];
  v201 = +[MOMetric binForNumber:v200 bins:v283];
  v202 = [(MOMetric *)v287 metrics];
  [v202 setObject:v201 forKeyedSubscript:@"Proactive_PercentageOfStructuredEventsNoLOI_Bucketed"];

  v203 = [(MOMetric *)v287 metrics];
  v204 = [v203 objectForKeyedSubscript:@"Proactive_PercentageOfLeisureMediaEventsNoLOI"];
  v205 = +[MOMetric binForNumber:v204 bins:v283];
  v206 = [(MOMetric *)v287 metrics];
  [v206 setObject:v205 forKeyedSubscript:@"Proactive_PercentageOfLeisureMediaEventsNoLOI_Bucketed"];

  v207 = [(MOMetric *)v287 metrics];
  v208 = [v207 objectForKeyedSubscript:@"Proactive_PercentageOfNLEventsNoLOI"];
  v209 = +[MOMetric binForNumber:v208 bins:v283];
  v210 = [(MOMetric *)v287 metrics];
  [v210 setObject:v209 forKeyedSubscript:@"Proactive_PercentageOfNLEventsNoLOI_Bucketed"];

  v211 = [(MOMetric *)v287 metrics];
  v212 = [v211 objectForKeyedSubscript:@"numPreBundles"];
  v213 = +[MOMetric binForNumber:v212 bins:v286];
  v214 = [(MOMetric *)v287 metrics];
  [v214 setObject:v213 forKeyedSubscript:@"numPreBundles_Bucketed"];

  v215 = [(MOMetric *)v287 metrics];
  v216 = [v215 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_0"];
  v217 = +[MOMetric binForNumber:v216 bins:v286];
  v218 = [(MOMetric *)v287 metrics];
  [v218 setObject:v217 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_0_Bucketed"];

  v219 = [(MOMetric *)v287 metrics];
  v220 = [v219 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_1"];
  v221 = +[MOMetric binForNumber:v220 bins:v286];
  v222 = [(MOMetric *)v287 metrics];
  [v222 setObject:v221 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_1_Bucketed"];

  v223 = [(MOMetric *)v287 metrics];
  v224 = [v223 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_0"];
  v225 = +[MOMetric binForNumber:v224 bins:v286];
  v226 = [(MOMetric *)v287 metrics];
  [v226 setObject:v225 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_0_Bucketed"];

  v227 = [(MOMetric *)v287 metrics];
  v228 = [v227 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_1"];
  v229 = +[MOMetric binForNumber:v228 bins:v286];
  v230 = [(MOMetric *)v287 metrics];
  [v230 setObject:v229 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_1_Bucketed"];

  v231 = [(MOMetric *)v287 metrics];
  v232 = [v231 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_0"];
  v233 = +[MOMetric binForNumber:v232 bins:v286];
  v234 = [(MOMetric *)v287 metrics];
  [v234 setObject:v233 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_0_Bucketed"];

  v235 = [(MOMetric *)v287 metrics];
  v236 = [v235 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_1"];
  v237 = +[MOMetric binForNumber:v236 bins:v286];
  v238 = [(MOMetric *)v287 metrics];
  [v238 setObject:v237 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_1_Bucketed"];

  v239 = [(MOMetric *)v287 metrics];
  v240 = [v239 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_0"];
  v241 = +[MOMetric binForNumber:v240 bins:v286];
  v242 = [(MOMetric *)v287 metrics];
  [v242 setObject:v241 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_0_Bucketed"];

  v243 = [(MOMetric *)v287 metrics];
  v244 = [v243 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_1"];
  v245 = +[MOMetric binForNumber:v244 bins:v286];
  v246 = [(MOMetric *)v287 metrics];
  [v246 setObject:v245 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_1_Bucketed"];

  v247 = [(MOMetric *)v287 metrics];
  v248 = [v247 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_0"];
  v249 = +[MOMetric binForNumber:v248 bins:v286];
  v250 = [(MOMetric *)v287 metrics];
  [v250 setObject:v249 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_0_Bucketed"];

  v251 = [(MOMetric *)v287 metrics];
  v252 = [v251 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_1"];
  v253 = +[MOMetric binForNumber:v252 bins:v286];
  v254 = [(MOMetric *)v287 metrics];
  [v254 setObject:v253 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_1_Bucketed"];

  v255 = [(MOMetric *)v287 metrics];
  v256 = [v255 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_0"];
  v257 = +[MOMetric binForNumber:v256 bins:v286];
  v258 = [(MOMetric *)v287 metrics];
  [v258 setObject:v257 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_0_Bucketed"];

  v259 = [(MOMetric *)v287 metrics];
  v260 = [v259 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_1"];
  v261 = +[MOMetric binForNumber:v260 bins:v286];
  v262 = [(MOMetric *)v287 metrics];
  [v262 setObject:v261 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_1_Bucketed"];

  v263 = [(MOMetric *)v287 metrics];
  v264 = [v263 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_0"];
  v265 = +[MOMetric binForNumber:v264 bins:v286];
  v266 = [(MOMetric *)v287 metrics];
  [v266 setObject:v265 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_0_Bucketed"];

  v267 = [(MOMetric *)v287 metrics];
  v268 = [v267 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_1"];
  v269 = +[MOMetric binForNumber:v268 bins:v286];
  v270 = [(MOMetric *)v287 metrics];
  [v270 setObject:v269 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_1_Bucketed"];

  v271 = [(MOMetric *)v287 metrics];
  v272 = [v271 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_0"];
  v273 = +[MOMetric binForNumber:v272 bins:v286];
  v274 = [(MOMetric *)v287 metrics];
  [v274 setObject:v273 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_0_Bucketed"];

  v275 = [(MOMetric *)v287 metrics];
  v276 = [v275 objectForKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_1"];
  v277 = +[MOMetric binForNumber:v276 bins:v286];
  v278 = [(MOMetric *)v287 metrics];
  [v278 setObject:v277 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_1_Bucketed"];

  v279 = [(MOMetric *)v287 metrics];
  v280 = [v279 objectForKeyedSubscript:@"numBundles"];
  v281 = +[MOMetric binForNumber:v280 bins:v286];
  v282 = [(MOMetric *)v287 metrics];
  [v282 setObject:v281 forKeyedSubscript:@"numBundles_Bucketed"];
}

- (id)calculateZeroCountsForEvents:(id)a3 withCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSDateComponents);
  [v8 setDay:0];
  id v9 = [v7 startOfDayForDate:self->_startDate];
  long long v33 = objc_opt_new();
  id v10 = [v9 earlierDate:self->_endDate];

  if (v10 == v9)
  {
    uint64_t v13 = 0;
    LODWORD(v11) = 0;
    id v14 = v9;
    id v30 = v8;
    id v31 = v7;
    id v29 = v9;
    uint64_t v32 = self;
    do
    {
      uint64_t v35 = (uint64_t)[v8 day:v29, v30, v31] / 7 + 1;
      [v8 setDay:((char *)[v8 day] + 1)];
      double v12 = [v7 dateByAddingComponents:v8 toDate:v9 options:0];
      uint64_t v36 = v13;
      if ((unint64_t)[v6 count] > (int)v13)
      {
        unsigned int v34 = v11;
        uint64_t v15 = 0;
        uint64_t v16 = (int)v13;
        while (1)
        {
          uint64_t v17 = [v6 objectAtIndexedSubscript:v16 + v15];
          long long v18 = [v17 endDate];
          long long v19 = [v18 earlierDate:v12];
          id v20 = [v6 objectAtIndexedSubscript:v16 + v15];
          uint64_t v21 = [v20 endDate];

          if (v19 != v21) {
            break;
          }
          ++v15;
          if ((unint64_t)[v6 count] <= v16 + v15)
          {
            uint64_t v36 = (v36 + v15);
            id v8 = v30;
            id v7 = v31;
            id v9 = v29;
            self = v32;
            uint64_t v11 = v34;
LABEL_11:
            uint64_t v22 = +[NSNumber numberWithLong:v35];
            [v33 addObject:v22];

            goto LABEL_14;
          }
        }
        self = v32;
        uint64_t v11 = v34;
        if (v15)
        {
          uint64_t v36 = v15 + v36;
          id v8 = v30;
          id v7 = v31;
          id v9 = v29;
          goto LABEL_11;
        }
        uint64_t v36 = v15 + v36;
        id v8 = v30;
        id v7 = v31;
        id v9 = v29;
      }
      uint64_t v11 = (v11 + 1);
LABEL_14:

      uint64_t v23 = [v12 earlierDate:self->_endDate];

      id v14 = v12;
      BOOL v24 = v23 == v12;
      uint64_t v13 = v36;
    }
    while (v24);
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v35 = 0;
    double v12 = v9;
  }
  v37[0] = @"CountOfZeroEventDays";
  v25 = +[NSNumber numberWithInt:v11];
  v37[1] = @"CountOfZeroEventWeeks";
  v38[0] = v25;
  id v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v35 - (void)[v33 count]);
  v38[1] = v26;
  id v27 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

  return v27;
}

- (BOOL)doesInterval:(id)a3 overlapWithAnyIntervalFromArray:(id)a4
{
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [v5 intersectionWithDateInterval:*(void *)(*((void *)&v16 + 1) + 8 * i) (void)v16];
        uint64_t v11 = [v10 endDate];
        double v12 = [v10 startDate];
        [v11 timeIntervalSinceDate:v12];
        double v14 = v13;

        if (v14 > 0.0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (void)calculateAndSetMetricsForRawEvents:(id)a3
{
  id v4 = a3;
  id v5 = self->_endDate;
  v1275 = +[NSCalendar currentCalendar];
  v1288 = v5;
  id v6 = [v1275 components:736 fromDate:v5];
  id v7 = [v6 weekday];
  id v8 = [v6 hour];
  id v9 = [v6 minute];
  v1273 = v6;
  uint64_t v10 = (uint64_t)((double)(uint64_t)v9 * 60.0 + (double)(uint64_t)v8 * 3600.0 + (double)(uint64_t)[v6 second]);
  uint64_t v11 = +[NSNumber numberWithInteger:v7];
  double v12 = [(MOMetric *)self metrics];
  [v12 setObject:v11 forKeyedSubscript:@"DayIDSubmission"];

  uint64_t v13 = +[MOMetric binsFromStart:&off_1002F79D0 toEnd:&off_1002F99E0 gap:&off_1002F99F0];
  double v14 = +[NSNumber numberWithLong:v10];
  v1272 = (void *)v13;
  uint64_t v15 = +[MOMetric binForNumber:v14 bins:v13];
  long long v16 = [(MOMetric *)self metrics];
  [v16 setObject:v15 forKeyedSubscript:@"HourIDSubmission"];

  [(NSDate *)self->_endDate timeIntervalSinceDate:self->_startDate];
  long long v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v1290 = +[MOMetric binsFromStart:&off_1002F79D0 toEnd:v17 gap:&off_1002F99F0];

  long long v18 = +[MOEventBundler propertyNameDictionary];
  long long v19 = +[NSPredicate predicateWithFormat:@"endDate >= %@ && endDate <= %@", self->_startDate, self->_endDate];
  v1274 = v4;
  id v20 = [v4 filteredArrayUsingPredicate:v19];
  id v1285 = [v20 mutableCopy];

  uint64_t v21 = +[NSSortDescriptor sortDescriptorWithKey:@"endDate" ascending:1];
  v1373 = v21;
  uint64_t v22 = +[NSArray arrayWithObjects:&v1373 count:1];
  [v1285 sortUsingDescriptors:v22];

  uint64_t v23 = [(MOPromptMetrics *)self calculateZeroCountsForEvents:v1285 withCalendar:v1275];
  BOOL v24 = [v23 objectForKey:@"CountOfZeroEventDays"];
  v25 = [(MOMetric *)self metrics];
  [v25 setObject:v24 forKeyedSubscript:@"ZeroEventDayCountAcrossAllEvents"];

  id v26 = [v23 objectForKey:@"CountOfZeroEventWeeks"];
  id v27 = [(MOMetric *)self metrics];
  [v27 setObject:v26 forKeyedSubscript:@"ZeroEventWeekCountAcrossAllEvents"];

  v1286 = v18;
  uint64_t v28 = [v18 objectForKeyedSubscript:@"strProvider"];
  id v29 = +[NSPredicate predicateWithFormat:@"%K != %i", v28, 4];
  v1372[0] = v29;
  id v30 = [v18 objectForKeyedSubscript:@"strProvider"];
  id v31 = +[NSPredicate predicateWithFormat:@"%K != %i", v30, 5];
  v1372[1] = v31;
  uint64_t v32 = +[NSArray arrayWithObjects:v1372 count:2];
  uint64_t v33 = +[NSCompoundPredicate andPredicateWithSubpredicates:v32];

  unsigned int v34 = self;
  v1271 = (void *)v33;
  v1269 = [v1285 filteredArrayUsingPredicate:v33];
  uint64_t v35 = -[MOPromptMetrics calculateZeroCountsForEvents:withCalendar:](self, "calculateZeroCountsForEvents:withCalendar:");

  uint64_t v36 = [v35 objectForKey:@"CountOfZeroEventDays"];
  long long v37 = [(MOMetric *)self metrics];
  [v37 setObject:v36 forKeyedSubscript:@"ZeroEventDayCount"];

  v1270 = v35;
  long long v38 = [v35 objectForKey:@"CountOfZeroEventWeeks"];
  long long v39 = [(MOMetric *)self metrics];
  [v39 setObject:v38 forKeyedSubscript:@"ZeroEventWeekCount"];

  v1289 = objc_opt_new();
  long long v40 = [v1286 objectForKeyedSubscript:@"strProvider"];
  long long v41 = +[NSPredicate predicateWithFormat:@"%K == %i", v40, 4];
  v1371[0] = v41;
  long long v42 = [v1286 objectForKeyedSubscript:];
  long long v43 = +[NSPredicate predicateWithFormat:@"%K == %i", v42, 1];
  v1371[1] = v43;
  long long v44 = +[NSArray arrayWithObjects:v1371 count:2];
  uint64_t v45 = +[NSCompoundPredicate andPredicateWithSubpredicates:v44];

  v1268 = (void *)v45;
  long long v46 = [v1285 filteredArrayUsingPredicate:v45];
  long long v47 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v46 count]);
  long long v48 = [(MOMetric *)self metrics];
  [v48 setObject:v47 forKeyedSubscript:@"Routine_nVisits"];

  v1309 = objc_opt_new();
  v1287 = objc_opt_new();
  v1283 = objc_opt_new();
  v1329 = self;
  v1277 = v46;
  if ([v46 count])
  {
    uint64_t v49 = 0;
    unsigned int v1324 = 0;
    uint64_t v50 = 0;
    unsigned int v1310 = 0;
    unsigned int v1305 = 0;
    int v51 = 0;
    while (1)
    {
      v52 = [v46 objectAtIndexedSubscript:v49];
      v53 = [v52 placeName];
      v54 = [v53 lowercaseString];

      if ([v54 containsString:@"home"])
      {
        ++v1324;
      }
      else if ([v54 containsString:@"work"])
      {
        uint64_t v50 = (v50 + 1);
      }
      else if ([v54 containsString:@"gym"])
      {
        ++v1310;
      }
      else if ([v54 containsString:@"school"])
      {
        ++v1305;
      }
      else if ([v52 placeDiscovery] != (id)2)
      {
        goto LABEL_15;
      }
      uint64_t v55 = [v52 startDate];
      if (v55)
      {
        v56 = (void *)v55;
        v57 = [v52 endDate];

        if (v57)
        {
          id v58 = objc_alloc((Class)NSDateInterval);
          v59 = [v52 startDate];
          v60 = [v52 endDate];
          id v61 = [v58 initWithStartDate:v59 endDate:v60];

          [v1309 addObject:v61];
        }
      }
LABEL_15:
      v62 = [v52 endDate];

      if (v62)
      {
        if (v49)
        {
          v63 = [v46 objectAtIndexedSubscript:(v49 - 1)];
          v64 = [v63 endDate];

          if (v64)
          {
            v65 = [v52 endDate];
            v66 = [v46 objectAtIndexedSubscript:v49 - 1];
            v67 = [v66 endDate];
            [v65 timeIntervalSinceDate:v67];
            v68 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v1289 addObject:v68];

            unsigned int v34 = v1329;
          }
        }
        v69 = [v52 creationDate];

        if (v69)
        {
          v70 = [v52 creationDate];
          v71 = [v52 endDate];
          [v70 timeIntervalSinceDate:v71];
          double v73 = v72;

          v74 = +[NSNumber numberWithDouble:v73];
          [v1287 addObject:v74];
        }
        v75 = [v52 sourceCreationDate];

        if (v75)
        {
          v76 = [v52 sourceCreationDate];
          v77 = [v52 endDate];
          [v76 timeIntervalSinceDate:v77];
          double v79 = v78;

          id v80 = +[NSNumber numberWithDouble:v79];
          [v1283 addObject:v80];
        }
      }
      uint64_t v81 = [v52 creationDate];
      if (!v81) {
        goto LABEL_32;
      }
      uint64_t v82 = (void *)v81;
      uint64_t v83 = [v52 endDate];
      if (!v83) {
        goto LABEL_31;
      }
      uint64_t v84 = (void *)v83;
      v85 = [v52 endDate];

      if (v85)
      {
        v86 = [v52 creationDate];
        v87 = [v52 endDate];
        [v86 timeIntervalSinceDate:v87];
        double v89 = v88;

        v90 = +[NSNumber numberWithDouble:v89];
        [v1287 addObject:v90];

        if (v51)
        {
          switch(v51)
          {
            case 1:
              v91 = [v52 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v91];
              v92 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v93 = +[MOMetric binForNumber:v92 bins:v1290];
              [(MOMetric *)v34 metrics];
              v95 = v94 = v34;
              [v95 setObject:v93 forKeyedSubscript:@"Routine_HourIDVisit_Start_2"];

              uint64_t v82 = [v52 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v82];
              v96 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v97 = +[MOMetric binForNumber:v96 bins:v1290];
              v98 = [(MOMetric *)v94 metrics];
              [v98 setObject:v97 forKeyedSubscript:@"Routine_HourIDVisit_End_2"];
              int v51 = 2;
              goto LABEL_30;
            case 2:
              v104 = [v52 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v104];
              v105 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v106 = +[MOMetric binForNumber:v105 bins:v1290];
              [(MOMetric *)v34 metrics];
              v108 = v107 = v34;
              [v108 setObject:v106 forKeyedSubscript:@"Routine_HourIDVisit_Start_3"];

              uint64_t v82 = [v52 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v82];
              v96 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v97 = +[MOMetric binForNumber:v96 bins:v1290];
              v98 = [(MOMetric *)v107 metrics];
              [v98 setObject:v97 forKeyedSubscript:@"Routine_HourIDVisit_End_3"];
              int v51 = 3;
              goto LABEL_30;
            case 3:
              v109 = [v52 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v109];
              v110 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v111 = +[MOMetric binForNumber:v110 bins:v1290];
              [(MOMetric *)v34 metrics];
              v113 = v112 = v34;
              [v113 setObject:v111 forKeyedSubscript:@"Routine_HourIDVisit_Start_4"];

              uint64_t v82 = [v52 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v82];
              v96 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v97 = +[MOMetric binForNumber:v96 bins:v1290];
              v98 = [(MOMetric *)v112 metrics];
              [v98 setObject:v97 forKeyedSubscript:@"Routine_HourIDVisit_End_4"];
              int v51 = 4;
              goto LABEL_30;
            case 4:
              v114 = [v52 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v114];
              v115 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v116 = +[MOMetric binForNumber:v115 bins:v1290];
              [(MOMetric *)v34 metrics];
              v118 = v117 = v34;
              [v118 setObject:v116 forKeyedSubscript:@"Routine_HourIDVisit_Start_5"];

              uint64_t v82 = [v52 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v82];
              v96 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v97 = +[MOMetric binForNumber:v96 bins:v1290];
              v98 = [(MOMetric *)v117 metrics];
              [v98 setObject:v97 forKeyedSubscript:@"Routine_HourIDVisit_End_5"];
              int v51 = 5;
              goto LABEL_30;
            case 5:
              v119 = [v52 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v119];
              v120 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v121 = +[MOMetric binForNumber:v120 bins:v1290];
              [(MOMetric *)v34 metrics];
              v123 = v122 = v34;
              [v123 setObject:v121 forKeyedSubscript:@"Routine_HourIDVisit_Start_6"];

              uint64_t v82 = [v52 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v82];
              v96 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v97 = +[MOMetric binForNumber:v96 bins:v1290];
              v98 = [(MOMetric *)v122 metrics];
              [v98 setObject:v97 forKeyedSubscript:@"Routine_HourIDVisit_End_6"];
              int v51 = 6;
              goto LABEL_30;
            case 6:
              v124 = [v52 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v124];
              v125 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v126 = +[MOMetric binForNumber:v125 bins:v1290];
              [(MOMetric *)v34 metrics];
              v128 = v127 = v34;
              [v128 setObject:v126 forKeyedSubscript:@"Routine_HourIDVisit_Start_7"];

              uint64_t v82 = [v52 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v82];
              v96 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v97 = +[MOMetric binForNumber:v96 bins:v1290];
              v98 = [(MOMetric *)v127 metrics];
              [v98 setObject:v97 forKeyedSubscript:@"Routine_HourIDVisit_End_7"];
              int v51 = 7;
              goto LABEL_30;
            case 7:
              v129 = [v52 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v129];
              v130 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v131 = +[MOMetric binForNumber:v130 bins:v1290];
              [(MOMetric *)v34 metrics];
              v133 = v132 = v34;
              [v133 setObject:v131 forKeyedSubscript:@"Routine_HourIDVisit_Start_8"];

              uint64_t v82 = [v52 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v82];
              v96 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v97 = +[MOMetric binForNumber:v96 bins:v1290];
              v98 = [(MOMetric *)v132 metrics];
              [v98 setObject:v97 forKeyedSubscript:@"Routine_HourIDVisit_End_8"];
              int v51 = 8;
              goto LABEL_30;
            case 8:
              v134 = [v52 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v134];
              v135 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v136 = +[MOMetric binForNumber:v135 bins:v1290];
              [(MOMetric *)v34 metrics];
              v138 = v137 = v34;
              [v138 setObject:v136 forKeyedSubscript:@"Routine_HourIDVisit_Start_9"];

              uint64_t v82 = [v52 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v82];
              v96 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v97 = +[MOMetric binForNumber:v96 bins:v1290];
              v98 = [(MOMetric *)v137 metrics];
              [v98 setObject:v97 forKeyedSubscript:@"Routine_HourIDVisit_End_9"];
              int v51 = 9;
              goto LABEL_30;
            case 9:
              v139 = [v52 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v139];
              v140 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v141 = +[MOMetric binForNumber:v140 bins:v1290];
              [(MOMetric *)v34 metrics];
              v143 = v142 = v34;
              [v143 setObject:v141 forKeyedSubscript:@"Routine_HourIDVisit_Start_10"];

              uint64_t v82 = [v52 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v82];
              v96 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v97 = +[MOMetric binForNumber:v96 bins:v1290];
              v98 = [(MOMetric *)v142 metrics];
              [v98 setObject:v97 forKeyedSubscript:@"Routine_HourIDVisit_End_10"];
              int v51 = 10;
              goto LABEL_30;
            default:
              ++v51;
              break;
          }
          goto LABEL_32;
        }
        v99 = [v52 startDate];
        [(NSDate *)v1288 timeIntervalSinceDate:v99];
        v100 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v101 = +[MOMetric binForNumber:v100 bins:v1290];
        [(MOMetric *)v34 metrics];
        v103 = v102 = v34;
        [v103 setObject:v101 forKeyedSubscript:@"Routine_HourIDVisit_Start_1"];

        uint64_t v82 = [v52 endDate];
        [(NSDate *)v1288 timeIntervalSinceDate:v82];
        v96 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v97 = +[MOMetric binForNumber:v96 bins:v1290];
        v98 = [(MOMetric *)v102 metrics];
        [v98 setObject:v97 forKeyedSubscript:@"Routine_HourIDVisit_End_1"];
        int v51 = 1;
LABEL_30:

        unsigned int v34 = v1329;
        long long v46 = v1277;
        uint64_t v50 = v50;
LABEL_31:
      }
LABEL_32:

      if ((unint64_t)[v46 count] <= ++v49) {
        goto LABEL_44;
      }
    }
  }
  unsigned int v1305 = 0;
  unsigned int v1310 = 0;
  uint64_t v50 = 0;
  unsigned int v1324 = 0;
LABEL_44:
  v144 = +[NSNumber numberWithInt:v1324];
  v145 = [(MOMetric *)v34 metrics];
  [v145 setObject:v144 forKeyedSubscript:@"Routine_nHomeVisits"];

  v146 = +[NSNumber numberWithInt:v50];
  v147 = [(MOMetric *)v34 metrics];
  [v147 setObject:v146 forKeyedSubscript:@"Routine_nWorkVisits"];

  v148 = +[NSNumber numberWithInt:v1310];
  v149 = [(MOMetric *)v34 metrics];
  [v149 setObject:v148 forKeyedSubscript:@"Routine_nGymVisits"];

  v150 = +[NSNumber numberWithInt:v1305];
  v151 = [(MOMetric *)v34 metrics];
  [v151 setObject:v150 forKeyedSubscript:@"Routine_nSchoolVisits"];

  v152 = +[MOPromptMetrics meanOf:v1287];
  v153 = [(MOMetric *)v34 metrics];
  [v153 setObject:v152 forKeyedSubscript:@"Routine_AverageVisitsLatency"];

  v154 = +[MOPromptMetrics meanOf:v1283];
  v155 = [(MOMetric *)v34 metrics];
  [v155 setObject:v154 forKeyedSubscript:@"Routine_AverageVisitsRealLatency"];

  if ([v1289 count])
  {
    v156 = +[MOPromptMetrics meanOf:v1289];
    v157 = [(MOMetric *)v34 metrics];
    [v157 setObject:v156 forKeyedSubscript:@"Routine_MeanDeltaBetweenVisits"];

    v158 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v159 = [(MOMetric *)v34 metrics];
    [v159 setObject:v158 forKeyedSubscript:@"Routine_MinDeltaBetweenVisits"];

    v160 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v161 = [(MOMetric *)v34 metrics];
    [v161 setObject:v160 forKeyedSubscript:@"Routine_MaxDeltaBetweenVisits"];

    v162 = +[MOPromptMetrics standardDeviationOf:v1289];
    v163 = [(MOMetric *)v34 metrics];
    [v163 setObject:v162 forKeyedSubscript:@"Routine_SDDeltaBetweenVisits"];
  }
  if ([v1277 count])
  {
    v164 = [v1277 firstObject];
    v165 = [v164 endDate];
    [v165 timeIntervalSinceDate:v34->_startDate];
    v166 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v166];

    endDate = v34->_endDate;
    v168 = [v1277 lastObject];
    v169 = [v168 endDate];
    [(NSDate *)endDate timeIntervalSinceDate:v169];
    v170 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v170];

    v171 = +[MOPromptMetrics meanOf:v1289];
    v172 = [(MOMetric *)v34 metrics];
    [v172 setObject:v171 forKeyedSubscript:@"Routine_MeanDeltaBetweenVisitsBoundariesIncluded"];

    v173 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v174 = [(MOMetric *)v34 metrics];
    [v174 setObject:v173 forKeyedSubscript:@"Routine_MinDeltaBetweenVisitsBoundariesIncluded"];

    v175 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v176 = [(MOMetric *)v34 metrics];
    [v176 setObject:v175 forKeyedSubscript:@"Routine_MaxDeltaBetweenVisitsBoundariesIncluded"];

    v177 = +[MOPromptMetrics standardDeviationOf:v1289];
    v178 = [(MOMetric *)v34 metrics];
    [v178 setObject:v177 forKeyedSubscript:@"Routine_SDDeltaBetweenVisitsBoundariesIncluded"];
  }
  else
  {
    [(NSDate *)v34->_endDate timeIntervalSinceDate:v34->_startDate];
    v179 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v180 = [(MOMetric *)v34 metrics];
    [v180 setObject:v179 forKeyedSubscript:@"Routine_MeanDeltaBetweenVisitsBoundariesIncluded"];

    [(NSDate *)v34->_endDate timeIntervalSinceDate:v34->_startDate];
    v181 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v182 = [(MOMetric *)v34 metrics];
    [v182 setObject:v181 forKeyedSubscript:@"Routine_MinDeltaBetweenVisitsBoundariesIncluded"];

    [(NSDate *)v34->_endDate timeIntervalSinceDate:v34->_startDate];
    v183 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v184 = [(MOMetric *)v34 metrics];
    [v184 setObject:v183 forKeyedSubscript:@"Routine_MaxDeltaBetweenVisitsBoundariesIncluded"];

    v177 = [(MOMetric *)v34 metrics];
    [v177 setObject:&off_1002F9970 forKeyedSubscript:@"Routine_SDDeltaBetweenVisitsBoundariesIncluded"];
  }

  [v1289 removeAllObjects];
  v185 = [v1286 objectForKeyedSubscript:@"strProvider"];
  v186 = +[NSPredicate predicateWithFormat:@"%K == %i", v185, 2];
  v1370[0] = v186;
  v187 = [v1286 objectForKeyedSubscript:@"strCategory"];
  v188 = +[NSPredicate predicateWithFormat:@"%K == %i", v187, 5];
  v1370[1] = v188;
  v189 = +[NSArray arrayWithObjects:v1370 count:2];
  uint64_t v190 = +[NSCompoundPredicate andPredicateWithSubpredicates:v189];

  v1267 = (void *)v190;
  v191 = [v1285 filteredArrayUsingPredicate:v190];
  v192 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v191 count]);
  v193 = [(MOMetric *)v34 metrics];
  [v193 setObject:v192 forKeyedSubscript:@"Storytelling_NumMoments"];

  long long v1352 = 0u;
  long long v1353 = 0u;
  long long v1350 = 0u;
  long long v1351 = 0u;
  id v194 = v191;
  id obj = v194;
  id v1306 = [v194 countByEnumeratingWithState:&v1350 objects:v1369 count:16];
  if (v1306)
  {
    int v1325 = 0;
    unsigned int v1299 = 0;
    unsigned int v1296 = 0;
    unsigned int v1293 = 0;
    unsigned int v1291 = 0;
    uint64_t v1302 = *(void *)v1351;
    do
    {
      for (i = 0; i != v1306; i = (char *)i + 1)
      {
        if (*(void *)v1351 != v1302) {
          objc_enumerationMutation(obj);
        }
        v196 = *(void **)(*((void *)&v1350 + 1) + 8 * i);
        id v197 = objc_alloc((Class)NSDateInterval);
        v198 = [v196 startDate];
        v199 = [v196 endDate];
        id v200 = [v197 initWithStartDate:v198 endDate:v199];

        id v1314 = v200;
        unsigned int v1311 = [(MOPromptMetrics *)v1329 doesInterval:v200 overlapWithAnyIntervalFromArray:v1309];
        v201 = [v196 extendedAttributes];
        v202 = [v201 photoMomentPersons];

        long long v1348 = 0u;
        long long v1349 = 0u;
        long long v1346 = 0u;
        long long v1347 = 0u;
        id v203 = v202;
        id v204 = [v203 countByEnumeratingWithState:&v1346 objects:v1368 count:16];
        if (v204)
        {
          id v205 = v204;
          char v206 = 0;
          char v207 = 0;
          uint64_t v208 = *(void *)v1347;
          do
          {
            for (j = 0; j != v205; j = (char *)j + 1)
            {
              if (*(void *)v1347 != v208) {
                objc_enumerationMutation(v203);
              }
              v210 = *(void **)(*((void *)&v1346 + 1) + 8 * (void)j);
              v211 = [v210 name];
              v207 |= [v211 length] != 0;
              v212 = [v210 family];
              v206 |= [v212 length] != 0;
            }
            id v205 = [v203 countByEnumeratingWithState:&v1346 objects:v1368 count:16];
          }
          while (v205);

          if (v207) {
            ++v1291;
          }
          if (v206) {
            ++v1293;
          }
        }
        else
        {
        }
        v213 = [v196 extendedAttributes];
        v214 = [v213 photoMomentPublicEvents];

        long long v1344 = 0u;
        long long v1345 = 0u;
        long long v1342 = 0u;
        long long v1343 = 0u;
        id v215 = v214;
        id v216 = [v215 countByEnumeratingWithState:&v1342 objects:v1367 count:16];
        if (v216)
        {
          id v217 = v216;
          char v218 = 0;
          char v219 = 0;
          uint64_t v220 = *(void *)v1343;
          do
          {
            for (k = 0; k != v217; k = (char *)k + 1)
            {
              if (*(void *)v1343 != v220) {
                objc_enumerationMutation(v215);
              }
              v222 = *(void **)(*((void *)&v1342 + 1) + 8 * (void)k);
              v223 = [v222 name];
              v224 = [v222 performers];
              v219 |= [v223 length] != 0;
              v218 |= [v224 count] != 0;
            }
            id v217 = [v215 countByEnumeratingWithState:&v1342 objects:v1367 count:16];
          }
          while (v217);

          if (v219) {
            ++v1296;
          }
          int v225 = v1325;
          v226 = v1314;
          if (v218) {
            ++v1299;
          }
        }
        else
        {

          int v225 = v1325;
          v226 = v1314;
        }
        int v1325 = v225 + v1311;
      }
      id v194 = obj;
      id v1306 = [obj countByEnumeratingWithState:&v1350 objects:v1369 count:16];
    }
    while (v1306);
  }
  else
  {
    int v1325 = 0;
    unsigned int v1299 = 0;
    unsigned int v1296 = 0;
    unsigned int v1293 = 0;
    unsigned int v1291 = 0;
  }

  v227 = +[NSNumber numberWithInt:v1291];
  v228 = v1329;
  v229 = [(MOMetric *)v1329 metrics];
  [v229 setObject:v227 forKeyedSubscript:@"Storytelling_NumMomentsWithPeople"];

  v230 = +[NSNumber numberWithInt:v1293];
  v231 = [(MOMetric *)v1329 metrics];
  [v231 setObject:v230 forKeyedSubscript:@"Storytelling_NumMomentsWithFamily"];

  v232 = +[NSNumber numberWithInt:v1296];
  v233 = [(MOMetric *)v1329 metrics];
  [v233 setObject:v232 forKeyedSubscript:@"Storytelling_NumMomentsWithEvent"];

  v234 = +[NSNumber numberWithInt:v1299];
  v235 = [(MOMetric *)v1329 metrics];
  [v235 setObject:v234 forKeyedSubscript:@"Storytelling_NumMomentsWithEventAndArtist"];

  if ([v194 count])
  {
    v236 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 - (double)v1325 / (double)(unint64_t)[v194 count]);
    v237 = [(MOMetric *)v1329 metrics];
    [v237 setObject:v236 forKeyedSubscript:@"Storytelling_PercentageOfMomentEventsNoLOI"];
  }
  v1300 = +[MOPhotoMomentTags getInferenceTagMap];
  v1292 = objc_opt_new();
  v1282 = objc_opt_new();
  v238 = v1289;
  if ([v194 count])
  {
    uint64_t v239 = 0;
    do
    {
      uint64_t v1326 = v239;
      v240 = [v194 objectAtIndexedSubscript:v239];
      uint64_t v241 = [v240 creationDate];
      if (v241)
      {
        v242 = (void *)v241;
        uint64_t v243 = [v240 startDate];
        if (!v243) {
          goto LABEL_96;
        }
        v244 = (void *)v243;
        v245 = [v240 endDate];

        if (v245)
        {
          v246 = [v240 creationDate];
          v247 = [v240 endDate];
          [v246 timeIntervalSinceDate:v247];
          double v249 = v248;

          v250 = +[NSNumber numberWithDouble:v249];
          [v1292 addObject:v250];

          switch(v1326)
          {
            case 2:
              v265 = [v240 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v265];
              v266 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v267 = +[MOMetric binForNumber:v266 bins:v1290];
              v268 = [(MOMetric *)v228 metrics];
              [v268 setObject:v267 forKeyedSubscript:@"Storytelling_HourIDMoment_Start_3"];

              v242 = [v240 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v242];
              v255 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v256 = +[MOMetric binForNumber:v255 bins:v1290];
              v257 = [(MOMetric *)v228 metrics];
              v258 = v257;
              v259 = v256;
              CFStringRef v260 = @"Storytelling_HourIDMoment_End_3";
              goto LABEL_95;
            case 1:
              v261 = [v240 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v261];
              v262 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v263 = +[MOMetric binForNumber:v262 bins:v1290];
              v264 = [(MOMetric *)v228 metrics];
              [v264 setObject:v263 forKeyedSubscript:@"Storytelling_HourIDMoment_Start_2"];

              v242 = [v240 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v242];
              v255 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v256 = +[MOMetric binForNumber:v255 bins:v1290];
              v257 = [(MOMetric *)v228 metrics];
              v258 = v257;
              v259 = v256;
              CFStringRef v260 = @"Storytelling_HourIDMoment_End_2";
              goto LABEL_95;
            case 0:
              v251 = [v240 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v251];
              v252 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v253 = +[MOMetric binForNumber:v252 bins:v1290];
              v254 = [(MOMetric *)v228 metrics];
              [v254 setObject:v253 forKeyedSubscript:@"Storytelling_HourIDMoment_Start_1"];

              v242 = [v240 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v242];
              v255 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v256 = +[MOMetric binForNumber:v255 bins:v1290];
              v257 = [(MOMetric *)v228 metrics];
              v258 = v257;
              v259 = v256;
              CFStringRef v260 = @"Storytelling_HourIDMoment_End_1";
LABEL_95:
              [v257 setObject:v259 forKeyedSubscript:v260];

              id v194 = obj;
              v238 = v1289;
LABEL_96:

              break;
          }
        }
      }
      v269 = [v240 endDate];

      if (v269)
      {
        if (v1326)
        {
          v270 = [v194 objectAtIndexedSubscript:(v1326 - 1)];
          v271 = [v270 endDate];

          if (v271)
          {
            v272 = [v240 endDate];
            v273 = [v194 objectAtIndexedSubscript:v1326 - 1];
            v274 = [v273 endDate];
            [v272 timeIntervalSinceDate:v274];
            v275 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v238 addObject:v275];

            id v194 = obj;
          }
        }
        v276 = [v240 creationDate];

        if (v276)
        {
          v277 = [v240 creationDate];
          v278 = [v240 endDate];
          [v277 timeIntervalSinceDate:v278];
          double v280 = v279;

          v281 = +[NSNumber numberWithDouble:v280];
          [v1292 addObject:v281];
        }
        v282 = [v240 sourceCreationDate];

        if (v282)
        {
          v283 = [v240 sourceCreationDate];
          v284 = [v240 endDate];
          [v283 timeIntervalSinceDate:v284];
          double v286 = v285;

          v287 = +[NSNumber numberWithDouble:v286];
          [v1282 addObject:v287];
        }
      }
      if (v1326 <= 2)
      {
        long long v1340 = 0u;
        long long v1341 = 0u;
        long long v1338 = 0u;
        long long v1339 = 0u;
        v1294 = v240;
        v288 = [v240 extendedAttributes];
        v289 = [v288 photoMomentInferences];

        id v1297 = v289;
        int v290 = v1326;
        id v1307 = [v289 countByEnumeratingWithState:&v1338 objects:v1366 count:16];
        if (v1307)
        {
          int v291 = 0;
          uint64_t v1303 = *(void *)v1339;
          while (2)
          {
            uint64_t v292 = 0;
            if (v291 <= 4) {
              int v293 = 4;
            }
            else {
              int v293 = v291;
            }
            uint64_t v1312 = (v293 - v291);
            do
            {
              if (*(void *)v1339 != v1303) {
                objc_enumerationMutation(v1297);
              }
              long long v294 = [*(id *)(*((void *)&v1338 + 1) + 8 * v292) lowercaseString];
              long long v295 = v294;
              if (v292 == v1312)
              {

                goto LABEL_145;
              }
              uint64_t v1315 = v292;
              long long v1336 = 0u;
              long long v1337 = 0u;
              long long v1334 = 0u;
              long long v1335 = 0u;
              id v296 = v1300;
              id v297 = [v296 countByEnumeratingWithState:&v1334 objects:v1365 count:16];
              if (v297)
              {
                id v298 = v297;
                uint64_t v299 = *(void *)v1335;
                do
                {
                  for (m = 0; m != v298; m = (char *)m + 1)
                  {
                    if (*(void *)v1335 != v299) {
                      objc_enumerationMutation(v296);
                    }
                    uint64_t v301 = *(void *)(*((void *)&v1334 + 1) + 8 * (void)m);
                    v302 = [v296 objectForKeyedSubscript:v301];
                    v303 = [v302 lowercaseString];
                    if ([v295 containsString:v303])
                    {
                      if (v290 == 2)
                      {
                        switch(v291)
                        {
                          case 0:
                            v304 = [(MOMetric *)v1329 metrics];
                            v305 = v304;
                            uint64_t v306 = v301;
                            CFStringRef v307 = @"Storytelling_MomenetInferenceTag_3_1";
                            goto LABEL_138;
                          case 1:
                            v304 = [(MOMetric *)v1329 metrics];
                            v305 = v304;
                            uint64_t v306 = v301;
                            CFStringRef v307 = @"Storytelling_MomenetInferenceTag_3_2";
                            goto LABEL_138;
                          case 2:
                            v304 = [(MOMetric *)v1329 metrics];
                            v305 = v304;
                            uint64_t v306 = v301;
                            CFStringRef v307 = @"Storytelling_MomenetInferenceTag_3_3";
                            goto LABEL_138;
                          case 3:
                            v304 = [(MOMetric *)v1329 metrics];
                            v305 = v304;
                            uint64_t v306 = v301;
                            CFStringRef v307 = @"Storytelling_MomenetInferenceTag_3_4";
LABEL_138:
                            [v304 setObject:v306 forKeyedSubscript:v307];

                            int v290 = v1326;
                            break;
                          default:
                            break;
                        }
                      }
                      else if (v290 == 1)
                      {
                        switch(v291)
                        {
                          case 0:
                            v304 = [(MOMetric *)v1329 metrics];
                            v305 = v304;
                            uint64_t v306 = v301;
                            CFStringRef v307 = @"Storytelling_MomenetInferenceTag_2_1";
                            goto LABEL_138;
                          case 1:
                            v304 = [(MOMetric *)v1329 metrics];
                            v305 = v304;
                            uint64_t v306 = v301;
                            CFStringRef v307 = @"Storytelling_MomenetInferenceTag_2_2";
                            goto LABEL_138;
                          case 2:
                            v304 = [(MOMetric *)v1329 metrics];
                            v305 = v304;
                            uint64_t v306 = v301;
                            CFStringRef v307 = @"Storytelling_MomenetInferenceTag_2_3";
                            goto LABEL_138;
                          case 3:
                            v304 = [(MOMetric *)v1329 metrics];
                            v305 = v304;
                            uint64_t v306 = v301;
                            CFStringRef v307 = @"Storytelling_MomenetInferenceTag_2_4";
                            goto LABEL_138;
                          default:
                            break;
                        }
                      }
                      else
                      {
                        switch(v291)
                        {
                          case 0:
                            v304 = [(MOMetric *)v1329 metrics];
                            v305 = v304;
                            uint64_t v306 = v301;
                            CFStringRef v307 = @"Storytelling_MomenetInferenceTag_1_1";
                            goto LABEL_138;
                          case 1:
                            v304 = [(MOMetric *)v1329 metrics];
                            v305 = v304;
                            uint64_t v306 = v301;
                            CFStringRef v307 = @"Storytelling_MomenetInferenceTag_1_2";
                            goto LABEL_138;
                          case 2:
                            v304 = [(MOMetric *)v1329 metrics];
                            v305 = v304;
                            uint64_t v306 = v301;
                            CFStringRef v307 = @"Storytelling_MomenetInferenceTag_1_3";
                            goto LABEL_138;
                          case 3:
                            v304 = [(MOMetric *)v1329 metrics];
                            v305 = v304;
                            uint64_t v306 = v301;
                            CFStringRef v307 = @"Storytelling_MomenetInferenceTag_1_4";
                            goto LABEL_138;
                          default:
                            break;
                        }
                      }
                    }
                  }
                  id v298 = [v296 countByEnumeratingWithState:&v1334 objects:v1365 count:16];
                }
                while (v298);
              }
              ++v291;

              uint64_t v292 = v1315 + 1;
              id v194 = obj;
            }
            while ((id)(v1315 + 1) != v1307);
            id v1307 = [v1297 countByEnumeratingWithState:&v1338 objects:v1366 count:16];
            if (v1307) {
              continue;
            }
            break;
          }
        }
LABEL_145:

        v228 = v1329;
        v238 = v1289;
        v240 = v1294;
      }
      uint64_t v239 = v1326 + 1;
    }
    while ((unint64_t)[v194 count] > v1326 + 1);
  }
  v308 = +[MOPromptMetrics meanOf:v1292];
  v309 = [(MOMetric *)v228 metrics];
  [v309 setObject:v308 forKeyedSubscript:@"Storytelling_AverageMomentsLatency"];

  v310 = +[MOPromptMetrics meanOf:v1282];
  v311 = [(MOMetric *)v228 metrics];
  [v311 setObject:v310 forKeyedSubscript:@"Storytelling_AverageMomentsRealLatency"];

  if ([v238 count])
  {
    v312 = +[MOPromptMetrics meanOf:v238];
    v313 = [(MOMetric *)v228 metrics];
    [v313 setObject:v312 forKeyedSubscript:@"Storytelling_MeanDeltaBetweenMoments"];

    v314 = [v238 valueForKeyPath:@"@min.doubleValue"];
    v315 = [(MOMetric *)v228 metrics];
    [v315 setObject:v314 forKeyedSubscript:@"Storytelling_MinDeltaBetweenMoments"];

    v316 = [v238 valueForKeyPath:@"@max.doubleValue"];
    v317 = [(MOMetric *)v228 metrics];
    [v317 setObject:v316 forKeyedSubscript:@"Storytelling_MaxDeltaBetweenMoments"];

    v318 = +[MOPromptMetrics standardDeviationOf:v238];
    v319 = [(MOMetric *)v228 metrics];
    [v319 setObject:v318 forKeyedSubscript:@"Storytelling_SDDeltaBetweenMoments"];
  }
  if ([v194 count])
  {
    v320 = [v194 firstObject];
    v321 = [v320 endDate];
    [v321 timeIntervalSinceDate:v228->_startDate];
    v322 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v238 addObject:v322];

    v323 = v228->_endDate;
    v324 = [v194 lastObject];
    v325 = [v324 endDate];
    [(NSDate *)v323 timeIntervalSinceDate:v325];
    v326 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v238 addObject:v326];

    v327 = +[MOPromptMetrics meanOf:v238];
    v328 = [(MOMetric *)v228 metrics];
    [v328 setObject:v327 forKeyedSubscript:@"Storytelling_MeanDeltaBetweenMomentsBoundariesIncluded"];

    v329 = [v238 valueForKeyPath:@"@min.doubleValue"];
    v330 = [(MOMetric *)v228 metrics];
    [v330 setObject:v329 forKeyedSubscript:@"Storytelling_MinDeltaBetweenMomentsBoundariesIncluded"];

    v331 = [v238 valueForKeyPath:@"@max.doubleValue"];
    v332 = [(MOMetric *)v228 metrics];
    [v332 setObject:v331 forKeyedSubscript:@"Storytelling_MaxDeltaBetweenMomentsBoundariesIncluded"];

    v333 = +[MOPromptMetrics standardDeviationOf:v238];
    v334 = [(MOMetric *)v228 metrics];
    [v334 setObject:v333 forKeyedSubscript:@"Storytelling_SDDeltaBetweenMomentsBoundariesIncluded"];
  }
  else
  {
    [(NSDate *)v228->_endDate timeIntervalSinceDate:v228->_startDate];
    v335 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v336 = [(MOMetric *)v228 metrics];
    [v336 setObject:v335 forKeyedSubscript:@"Storytelling_MeanDeltaBetweenMomentsBoundariesIncluded"];

    [(NSDate *)v228->_endDate timeIntervalSinceDate:v228->_startDate];
    v337 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v338 = [(MOMetric *)v228 metrics];
    [v338 setObject:v337 forKeyedSubscript:@"Storytelling_MinDeltaBetweenMomentsBoundariesIncluded"];

    [(NSDate *)v228->_endDate timeIntervalSinceDate:v228->_startDate];
    v339 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v340 = [(MOMetric *)v228 metrics];
    [v340 setObject:v339 forKeyedSubscript:@"Storytelling_MaxDeltaBetweenMomentsBoundariesIncluded"];

    v333 = [(MOMetric *)v228 metrics];
    [v333 setObject:&off_1002F9970 forKeyedSubscript:@"Storytelling_SDDeltaBetweenMomentsBoundariesIncluded"];
  }

  [v238 removeAllObjects];
  v341 = [v1286 objectForKeyedSubscript:@"strProvider"];
  v342 = +[NSPredicate predicateWithFormat:@"%K == %i", v341, 1];
  v1364[0] = v342;
  v343 = [v1286 objectForKeyedSubscript:@"strCategory"];
  v344 = +[NSPredicate predicateWithFormat:@"%K == %i", v343, 2];
  v1364[1] = v344;
  v345 = +[NSArray arrayWithObjects:v1364 count:2];
  uint64_t v346 = +[NSCompoundPredicate andPredicateWithSubpredicates:v345];

  v1266 = (void *)v346;
  v347 = [v1285 filteredArrayUsingPredicate:v346];
  v348 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v347 count]);
  v349 = [(MOMetric *)v228 metrics];
  [v349 setObject:v348 forKeyedSubscript:@"Workout_NumWorkouts"];

  v1278 = objc_opt_new();
  v1276 = v347;
  if ([v347 count])
  {
    unint64_t v350 = 0;
    uint64_t v351 = 0;
    int v352 = 0;
    while (1)
    {
      v353 = [v347 objectAtIndexedSubscript:v350];
      id v354 = objc_alloc((Class)NSDateInterval);
      v355 = [v353 startDate];
      v356 = [v353 endDate];
      id v357 = [v354 initWithStartDate:v355 endDate:v356];

      unsigned int v358 = [(MOPromptMetrics *)v228 doesInterval:v357 overlapWithAnyIntervalFromArray:v1309];
      uint64_t v359 = [v353 creationDate];
      if (v359) {
        break;
      }
      uint64_t v370 = v351;
LABEL_177:
      v352 += v358;

      ++v350;
      uint64_t v351 = v370;
      if ((unint64_t)[v347 count] <= v350) {
        goto LABEL_180;
      }
    }
    v360 = (void *)v359;
    unsigned int v1327 = v358;
    uint64_t v361 = [v353 startDate];
    if (v361)
    {
      v362 = (void *)v361;
      v363 = [v353 endDate];

      if (v363)
      {
        if (v350)
        {
          v364 = [v347 objectAtIndexedSubscript:(v350 - 1)];
          v365 = [v364 endDate];

          if (v365)
          {
            v366 = [v353 endDate];
            v367 = [v347 objectAtIndexedSubscript:v350 - 1];
            v368 = [v367 endDate];
            [v366 timeIntervalSinceDate:v368];
            v369 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v1289 addObject:v369];

            v228 = v1329;
          }
        }
        uint64_t v370 = (v351 + 1);
        v371 = [v353 creationDate];
        v372 = [v353 endDate];
        [v371 timeIntervalSinceDate:v372];
        double v374 = v373;

        v375 = +[NSNumber numberWithDouble:v374];
        [v1278 addObject:v375];

        if ((int)v351 <= 9)
        {
          v376 = [v353 workoutType];
          id v377 = +[HKWorkout _workoutActivityTypeFromString:v376];

          unsigned int v358 = v1327;
          switch((int)v351)
          {
            case 0:
              v378 = +[NSNumber numberWithUnsignedInteger:v377];
              v379 = [(MOMetric *)v228 metrics];
              [v379 setObject:v378 forKeyedSubscript:@"Workout_WorkoutType_1"];

              v380 = [v353 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v380];
              v381 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v382 = +[MOMetric binForNumber:v381 bins:v1290];
              v383 = [(MOMetric *)v228 metrics];
              [v383 setObject:v382 forKeyedSubscript:@"Workout_HourIDWorkout_Start_1"];

              v360 = [v353 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v360];
              v384 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v385 = +[MOMetric binForNumber:v384 bins:v1290];
              v386 = [(MOMetric *)v1329 metrics];
              [v386 setObject:v385 forKeyedSubscript:@"Workout_HourIDWorkout_End_1"];
              uint64_t v351 = 1;
              goto LABEL_173;
            case 1:
              v387 = +[NSNumber numberWithUnsignedInteger:v377];
              v388 = [(MOMetric *)v228 metrics];
              [v388 setObject:v387 forKeyedSubscript:@"Workout_WorkoutType_2"];

              v389 = [v353 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v389];
              v390 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v391 = +[MOMetric binForNumber:v390 bins:v1290];
              v392 = [(MOMetric *)v228 metrics];
              [v392 setObject:v391 forKeyedSubscript:@"Workout_HourIDWorkout_Start_2"];

              v360 = [v353 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v360];
              v384 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v385 = +[MOMetric binForNumber:v384 bins:v1290];
              v386 = [(MOMetric *)v1329 metrics];
              [v386 setObject:v385 forKeyedSubscript:@"Workout_HourIDWorkout_End_2"];
              uint64_t v351 = 2;
              goto LABEL_173;
            case 2:
              v393 = +[NSNumber numberWithUnsignedInteger:v377];
              v394 = [(MOMetric *)v228 metrics];
              [v394 setObject:v393 forKeyedSubscript:@"Workout_WorkoutType_3"];

              v395 = [v353 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v395];
              v396 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v397 = +[MOMetric binForNumber:v396 bins:v1290];
              v398 = [(MOMetric *)v228 metrics];
              [v398 setObject:v397 forKeyedSubscript:@"Workout_HourIDWorkout_Start_3"];

              v360 = [v353 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v360];
              v384 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v385 = +[MOMetric binForNumber:v384 bins:v1290];
              v386 = [(MOMetric *)v1329 metrics];
              [v386 setObject:v385 forKeyedSubscript:@"Workout_HourIDWorkout_End_3"];
              uint64_t v351 = 3;
              goto LABEL_173;
            case 3:
              v399 = +[NSNumber numberWithUnsignedInteger:v377];
              v400 = [(MOMetric *)v228 metrics];
              [v400 setObject:v399 forKeyedSubscript:@"Workout_WorkoutType_4"];

              v401 = [v353 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v401];
              v402 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v403 = +[MOMetric binForNumber:v402 bins:v1290];
              v404 = [(MOMetric *)v228 metrics];
              [v404 setObject:v403 forKeyedSubscript:@"Workout_HourIDWorkout_Start_4"];

              v360 = [v353 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v360];
              v384 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v385 = +[MOMetric binForNumber:v384 bins:v1290];
              v386 = [(MOMetric *)v1329 metrics];
              [v386 setObject:v385 forKeyedSubscript:@"Workout_HourIDWorkout_End_4"];
              uint64_t v351 = 4;
              goto LABEL_173;
            case 4:
              v405 = +[NSNumber numberWithUnsignedInteger:v377];
              v406 = [(MOMetric *)v228 metrics];
              [v406 setObject:v405 forKeyedSubscript:@"Workout_WorkoutType_5"];

              v407 = [v353 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v407];
              v408 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v409 = +[MOMetric binForNumber:v408 bins:v1290];
              v410 = [(MOMetric *)v228 metrics];
              [v410 setObject:v409 forKeyedSubscript:@"Workout_HourIDWorkout_Start_5"];

              v360 = [v353 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v360];
              v384 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v385 = +[MOMetric binForNumber:v384 bins:v1290];
              v386 = [(MOMetric *)v1329 metrics];
              [v386 setObject:v385 forKeyedSubscript:@"Workout_HourIDWorkout_End_5"];
              uint64_t v351 = 5;
              goto LABEL_173;
            case 5:
              v411 = +[NSNumber numberWithUnsignedInteger:v377];
              v412 = [(MOMetric *)v228 metrics];
              [v412 setObject:v411 forKeyedSubscript:@"Workout_WorkoutType_6"];

              v413 = [v353 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v413];
              v414 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v415 = +[MOMetric binForNumber:v414 bins:v1290];
              v416 = [(MOMetric *)v228 metrics];
              [v416 setObject:v415 forKeyedSubscript:@"Workout_HourIDWorkout_Start_6"];

              v360 = [v353 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v360];
              v384 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v385 = +[MOMetric binForNumber:v384 bins:v1290];
              v386 = [(MOMetric *)v1329 metrics];
              [v386 setObject:v385 forKeyedSubscript:@"Workout_HourIDWorkout_End_6"];
              uint64_t v351 = 6;
              goto LABEL_173;
            case 6:
              v417 = +[NSNumber numberWithUnsignedInteger:v377];
              v418 = [(MOMetric *)v228 metrics];
              [v418 setObject:v417 forKeyedSubscript:@"Workout_WorkoutType_7"];

              v419 = [v353 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v419];
              v420 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v421 = +[MOMetric binForNumber:v420 bins:v1290];
              v422 = [(MOMetric *)v228 metrics];
              [v422 setObject:v421 forKeyedSubscript:@"Workout_HourIDWorkout_Start_7"];

              v360 = [v353 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v360];
              v384 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v385 = +[MOMetric binForNumber:v384 bins:v1290];
              v386 = [(MOMetric *)v1329 metrics];
              [v386 setObject:v385 forKeyedSubscript:@"Workout_HourIDWorkout_End_7"];
              uint64_t v351 = 7;
              goto LABEL_173;
            case 7:
              v423 = +[NSNumber numberWithUnsignedInteger:v377];
              v424 = [(MOMetric *)v228 metrics];
              [v424 setObject:v423 forKeyedSubscript:@"Workout_WorkoutType_8"];

              v425 = [v353 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v425];
              v426 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v427 = +[MOMetric binForNumber:v426 bins:v1290];
              v428 = [(MOMetric *)v228 metrics];
              [v428 setObject:v427 forKeyedSubscript:@"Workout_HourIDWorkout_Start_8"];

              v360 = [v353 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v360];
              v384 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v385 = +[MOMetric binForNumber:v384 bins:v1290];
              v386 = [(MOMetric *)v1329 metrics];
              [v386 setObject:v385 forKeyedSubscript:@"Workout_HourIDWorkout_End_8"];
              uint64_t v351 = 8;
              goto LABEL_173;
            case 8:
              v429 = +[NSNumber numberWithUnsignedInteger:v377];
              v430 = [(MOMetric *)v228 metrics];
              [v430 setObject:v429 forKeyedSubscript:@"Workout_WorkoutType_9"];

              v431 = [v353 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v431];
              v432 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v433 = +[MOMetric binForNumber:v432 bins:v1290];
              v434 = [(MOMetric *)v228 metrics];
              [v434 setObject:v433 forKeyedSubscript:@"Workout_HourIDWorkout_Start_9"];

              v360 = [v353 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v360];
              v384 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v385 = +[MOMetric binForNumber:v384 bins:v1290];
              v386 = [(MOMetric *)v1329 metrics];
              [v386 setObject:v385 forKeyedSubscript:@"Workout_HourIDWorkout_End_9"];
              uint64_t v351 = 9;
              goto LABEL_173;
            case 9:
              v435 = +[NSNumber numberWithUnsignedInteger:v377];
              v436 = [(MOMetric *)v228 metrics];
              [v436 setObject:v435 forKeyedSubscript:@"Workout_WorkoutType_10"];

              v437 = [v353 startDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v437];
              v438 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v439 = +[MOMetric binForNumber:v438 bins:v1290];
              v440 = [(MOMetric *)v228 metrics];
              [v440 setObject:v439 forKeyedSubscript:@"Workout_HourIDWorkout_Start_10"];

              v360 = [v353 endDate];
              [(NSDate *)v1288 timeIntervalSinceDate:v360];
              v384 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v385 = +[MOMetric binForNumber:v384 bins:v1290];
              v386 = [(MOMetric *)v1329 metrics];
              [v386 setObject:v385 forKeyedSubscript:@"Workout_HourIDWorkout_End_10"];
              uint64_t v351 = 10;
LABEL_173:

              v228 = v1329;
              v347 = v1276;
              goto LABEL_174;
            default:
              goto LABEL_177;
          }
        }
        goto LABEL_176;
      }
    }
    else
    {
LABEL_174:
    }
    uint64_t v370 = v351;
LABEL_176:
    unsigned int v358 = v1327;
    goto LABEL_177;
  }
  int v352 = 0;
LABEL_180:
  if ([v347 count])
  {
    v441 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 - (double)v352 / (double)(unint64_t)[v347 count]);
    v442 = [(MOMetric *)v228 metrics];
    [v442 setObject:v441 forKeyedSubscript:@"Workout_PercentageOfWorkoutEventsNoLOI"];
  }
  v443 = +[MOPromptMetrics meanOf:v1278];
  v444 = [(MOMetric *)v228 metrics];
  [v444 setObject:v443 forKeyedSubscript:@"Workout_AverageWorkoutLatency"];

  if ([v1289 count])
  {
    v445 = +[MOPromptMetrics meanOf:v1289];
    v446 = [(MOMetric *)v228 metrics];
    [v446 setObject:v445 forKeyedSubscript:@"Workout_MeanDeltaBetweenWorkouts"];

    v447 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v448 = [(MOMetric *)v228 metrics];
    [v448 setObject:v447 forKeyedSubscript:@"Workout_MinDeltaBetweenWorkouts"];

    v449 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v450 = [(MOMetric *)v228 metrics];
    [v450 setObject:v449 forKeyedSubscript:@"Workout_MaxDeltaBetweenWorkouts"];

    v451 = +[MOPromptMetrics standardDeviationOf:v1289];
    v452 = [(MOMetric *)v228 metrics];
    [v452 setObject:v451 forKeyedSubscript:@"Workout_SDDeltaBetweenWorkouts"];
  }
  if ([v347 count])
  {
    v453 = [v347 firstObject];
    v454 = [v453 endDate];
    [v454 timeIntervalSinceDate:v228->_startDate];
    v455 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v455];

    v456 = v228->_endDate;
    v457 = [v347 lastObject];
    v458 = [v457 endDate];
    [(NSDate *)v456 timeIntervalSinceDate:v458];
    v459 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v459];

    v460 = +[MOPromptMetrics meanOf:v1289];
    v461 = [(MOMetric *)v228 metrics];
    [v461 setObject:v460 forKeyedSubscript:@"Workout_MeanDeltaBetweenWorkoutsBoundariesIncluded"];

    v462 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v463 = [(MOMetric *)v228 metrics];
    [v463 setObject:v462 forKeyedSubscript:@"Workout_MinDeltaBetweenWorkoutsBoundariesIncluded"];

    v464 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v465 = [(MOMetric *)v228 metrics];
    [v465 setObject:v464 forKeyedSubscript:@"Workout_MaxDeltaBetweenWorkoutsBoundariesIncluded"];

    v466 = +[MOPromptMetrics standardDeviationOf:v1289];
    v467 = [(MOMetric *)v228 metrics];
    [v467 setObject:v466 forKeyedSubscript:@"Workout_SDDeltaBetweenWorkoutsBoundariesIncluded"];
  }
  else
  {
    [(NSDate *)v228->_endDate timeIntervalSinceDate:v228->_startDate];
    v468 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v469 = [(MOMetric *)v228 metrics];
    [v469 setObject:v468 forKeyedSubscript:@"Workout_MeanDeltaBetweenWorkoutsBoundariesIncluded"];

    [(NSDate *)v228->_endDate timeIntervalSinceDate:v228->_startDate];
    v470 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v471 = [(MOMetric *)v228 metrics];
    [v471 setObject:v470 forKeyedSubscript:@"Workout_MinDeltaBetweenWorkoutsBoundariesIncluded"];

    [(NSDate *)v228->_endDate timeIntervalSinceDate:v228->_startDate];
    v472 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v473 = [(MOMetric *)v228 metrics];
    [v473 setObject:v472 forKeyedSubscript:@"Workout_MaxDeltaBetweenWorkoutsBoundariesIncluded"];

    v466 = [(MOMetric *)v228 metrics];
    [v466 setObject:&off_1002F9970 forKeyedSubscript:@"Workout_SDDeltaBetweenWorkoutsBoundariesIncluded"];
  }

  [v1289 removeAllObjects];
  v474 = [v1286 objectForKeyedSubscript:@"strProvider"];
  v475 = +[NSPredicate predicateWithFormat:@"%K == %i", v474, 3];
  v1363 = v475;
  v476 = +[NSArray arrayWithObjects:&v1363 count:1];
  uint64_t v477 = +[NSCompoundPredicate andPredicateWithSubpredicates:v476];

  v1265 = (void *)v477;
  v478 = [v1285 filteredArrayUsingPredicate:v477];
  v479 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v478 count]);
  v480 = [(MOMetric *)v228 metrics];
  [v480 setObject:v479 forKeyedSubscript:@"Proactive_NumAllEvents"];

  v481 = objc_opt_new();
  long long v1330 = 0u;
  long long v1331 = 0u;
  long long v1332 = 0u;
  long long v1333 = 0u;
  id v482 = v478;
  id v483 = [v482 countByEnumeratingWithState:&v1330 objects:v1362 count:16];
  if (v483)
  {
    id v484 = v483;
    uint64_t v485 = *(void *)v1331;
    do
    {
      for (n = 0; n != v484; n = (char *)n + 1)
      {
        if (*(void *)v1331 != v485) {
          objc_enumerationMutation(v482);
        }
        v487 = *(void **)(*((void *)&v1330 + 1) + 8 * (void)n);
        uint64_t v488 = [v487 creationDate];
        if (v488)
        {
          v489 = (void *)v488;
          v490 = [v487 endDate];

          if (v490)
          {
            v491 = [v487 creationDate];
            v492 = [v487 endDate];
            [v491 timeIntervalSinceDate:v492];
            double v494 = v493;

            v495 = +[NSNumber numberWithDouble:v494];
            [v481 addObject:v495];
          }
        }
      }
      id v484 = [v482 countByEnumeratingWithState:&v1330 objects:v1362 count:16];
    }
    while (v484);
  }

  if ([v481 count])
  {
    v496 = +[MOPromptMetrics meanOf:v481];
    v497 = [(MOMetric *)v228 metrics];
    [v497 setObject:v496 forKeyedSubscript:@"Proactive_EventsAverageLatency"];

    [v481 removeAllObjects];
  }
  v1328 = v481;
  v498 = [v1286 objectForKeyedSubscript:@"strProvider"];
  v499 = +[NSPredicate predicateWithFormat:@"%K == %i", v498, 3];
  v1361[0] = v499;
  v500 = [v1286 objectForKeyedSubscript:@"strCategory"];
  v501 = +[NSPredicate predicateWithFormat:@"%K == %i", v500, 3];
  v1361[1] = v501;
  v502 = +[NSArray arrayWithObjects:v1361 count:2];
  uint64_t v503 = +[NSCompoundPredicate andPredicateWithSubpredicates:v502];

  v1263 = (void *)v503;
  v504 = [v1285 filteredArrayUsingPredicate:v503];
  v505 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v504 count]);
  v506 = [(MOMetric *)v228 metrics];
  [v506 setObject:v505 forKeyedSubscript:@"Proactive_NumMediaOnRepeatEvents"];

  v1264 = v482;
  v1304 = v504;
  if ([v504 count])
  {
    uint64_t v507 = 0;
    int v508 = 0;
    int v509 = 0;
    while (1)
    {
      v510 = [v504 objectAtIndexedSubscript:v507];
      id v511 = objc_alloc((Class)NSDateInterval);
      v512 = [v510 startDate];
      v513 = [v510 endDate];
      id v514 = [v511 initWithStartDate:v512 endDate:v513];

      unsigned int v515 = [(MOPromptMetrics *)v1329 doesInterval:v514 overlapWithAnyIntervalFromArray:v1309];
      uint64_t v516 = [v510 creationDate];
      if (v516)
      {
        v517 = (void *)v516;
        uint64_t v518 = [v510 startDate];
        if (!v518) {
          goto LABEL_216;
        }
        v519 = (void *)v518;
        v520 = [v510 endDate];

        if (v520) {
          break;
        }
      }
LABEL_217:
      v508 += v515;

      if ((unint64_t)[v504 count] <= ++v507) {
        goto LABEL_220;
      }
    }
    unsigned int v1316 = v515;
    if (v507)
    {
      v521 = [v504 objectAtIndexedSubscript:(v507 - 1)];
      v522 = [v521 endDate];

      if (v522)
      {
        v523 = [v510 endDate];
        v524 = [v504 objectAtIndexedSubscript:v507 - 1];
        v525 = [v524 endDate];
        [v523 timeIntervalSinceDate:v525];
        v526 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v1289 addObject:v526];

        v504 = v1304;
      }
    }
    v527 = [v510 creationDate];
    v528 = [v510 endDate];
    [v527 timeIntervalSinceDate:v528];
    double v530 = v529;

    v531 = +[NSNumber numberWithDouble:v530];
    [v1328 addObject:v531];

    if (v509)
    {
      switch(v509)
      {
        case 1:
          v532 = [v510 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v532];
          v533 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v534 = +[MOMetric binForNumber:v533 bins:v1290];
          v535 = [(MOMetric *)v1329 metrics];
          [v535 setObject:v534 forKeyedSubscript:@"Proactive_HourIDMediaOnRepeat_Start_2"];

          v517 = [v510 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v517];
          v536 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v537 = +[MOMetric binForNumber:v536 bins:v1290];
          v538 = [(MOMetric *)v1329 metrics];
          [v538 setObject:v537 forKeyedSubscript:@"Proactive_HourIDMediaOnRepeat_End_2"];
          int v509 = 2;
          goto LABEL_215;
        case 2:
          v543 = [v510 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v543];
          v544 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v545 = +[MOMetric binForNumber:v544 bins:v1290];
          v546 = [(MOMetric *)v1329 metrics];
          [v546 setObject:v545 forKeyedSubscript:@"Proactive_HourIDMediaOnRepeat_Start_3"];

          v517 = [v510 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v517];
          v536 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v537 = +[MOMetric binForNumber:v536 bins:v1290];
          v538 = [(MOMetric *)v1329 metrics];
          [v538 setObject:v537 forKeyedSubscript:@"Proactive_HourIDMediaOnRepeat_End_3"];
          int v509 = 3;
          goto LABEL_215;
        case 3:
          v547 = [v510 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v547];
          v548 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v549 = +[MOMetric binForNumber:v548 bins:v1290];
          v550 = [(MOMetric *)v1329 metrics];
          [v550 setObject:v549 forKeyedSubscript:@"Proactive_HourIDMediaOnRepeat_Start_4"];

          v517 = [v510 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v517];
          v536 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v537 = +[MOMetric binForNumber:v536 bins:v1290];
          v538 = [(MOMetric *)v1329 metrics];
          [v538 setObject:v537 forKeyedSubscript:@"Proactive_HourIDMediaOnRepeat_End_4"];
          int v509 = 4;
          goto LABEL_215;
        case 4:
          v551 = [v510 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v551];
          v552 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v553 = +[MOMetric binForNumber:v552 bins:v1290];
          v554 = [(MOMetric *)v1329 metrics];
          [v554 setObject:v553 forKeyedSubscript:@"Proactive_HourIDMediaOnRepeat_Start_5"];

          v517 = [v510 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v517];
          v536 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v537 = +[MOMetric binForNumber:v536 bins:v1290];
          v538 = [(MOMetric *)v1329 metrics];
          [v538 setObject:v537 forKeyedSubscript:@"Proactive_HourIDMediaOnRepeat_End_5"];
          int v509 = 5;
          goto LABEL_215;
        default:
          ++v509;
          unsigned int v515 = v1316;
          break;
      }
      goto LABEL_217;
    }
    v539 = [v510 startDate];
    [(NSDate *)v1288 timeIntervalSinceDate:v539];
    v540 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v541 = +[MOMetric binForNumber:v540 bins:v1290];
    v542 = [(MOMetric *)v1329 metrics];
    [v542 setObject:v541 forKeyedSubscript:@"Proactive_HourIDMediaOnRepeat_Start_1"];

    v517 = [v510 endDate];
    [(NSDate *)v1288 timeIntervalSinceDate:v517];
    v536 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v537 = +[MOMetric binForNumber:v536 bins:v1290];
    v538 = [(MOMetric *)v1329 metrics];
    [v538 setObject:v537 forKeyedSubscript:@"Proactive_HourIDMediaOnRepeat_End_1"];
    int v509 = 1;
LABEL_215:

    v504 = v1304;
    unsigned int v515 = v1316;
LABEL_216:

    goto LABEL_217;
  }
  int v508 = 0;
LABEL_220:
  if ([v504 count])
  {
    v555 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 - (double)v508 / (double)(unint64_t)[v504 count]);
    v556 = [(MOMetric *)v1329 metrics];
    [v556 setObject:v555 forKeyedSubscript:@"Proactive_PercentageOfMediaOnRepeatEventsNoLOI"];
  }
  if ([v1328 count])
  {
    v557 = +[MOPromptMetrics meanOf:v1328];
    v558 = [(MOMetric *)v1329 metrics];
    [v558 setObject:v557 forKeyedSubscript:@"Proactive_MediaOnRepeatAverageLatency"];

    [v1328 removeAllObjects];
  }
  if ([v1289 count])
  {
    v559 = +[MOPromptMetrics meanOf:v1289];
    v560 = [(MOMetric *)v1329 metrics];
    [v560 setObject:v559 forKeyedSubscript:@"Proactive_MeanDeltaBetweenMediaOnRepeatEvents"];

    v561 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v562 = [(MOMetric *)v1329 metrics];
    [v562 setObject:v561 forKeyedSubscript:@"Proactive_MinDeltaBetweenMediaOnRepeatEvents"];

    v563 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v564 = [(MOMetric *)v1329 metrics];
    [v564 setObject:v563 forKeyedSubscript:@"Proactive_MaxDeltaBetweenMediaOnRepeatEvents"];

    v565 = +[MOPromptMetrics standardDeviationOf:v1289];
    v566 = [(MOMetric *)v1329 metrics];
    [v566 setObject:v565 forKeyedSubscript:@"Proactive_SDDeltaBetweenMediaOnRepeatEvents"];
  }
  if ([v1304 count])
  {
    v567 = [v1304 firstObject];
    v568 = [v567 endDate];
    [v568 timeIntervalSinceDate:v1329->_startDate];
    v569 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v569];

    v570 = v1329->_endDate;
    v571 = [v1304 lastObject];
    v572 = [v571 endDate];
    [(NSDate *)v570 timeIntervalSinceDate:v572];
    v573 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v573];

    v574 = +[MOPromptMetrics meanOf:v1289];
    v575 = [(MOMetric *)v1329 metrics];
    [v575 setObject:v574 forKeyedSubscript:@"Proactive_MeanDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"];

    v576 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v577 = [(MOMetric *)v1329 metrics];
    [v577 setObject:v576 forKeyedSubscript:@"Proactive_MinDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"];

    v578 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v579 = [(MOMetric *)v1329 metrics];
    [v579 setObject:v578 forKeyedSubscript:@"Proactive_MaxDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"];

    v580 = +[MOPromptMetrics standardDeviationOf:v1289];
    v581 = [(MOMetric *)v1329 metrics];
    [v581 setObject:v580 forKeyedSubscript:@"Proactive_SDDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"];
  }
  else
  {
    [(NSDate *)v1329->_endDate timeIntervalSinceDate:v1329->_startDate];
    v582 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v583 = [(MOMetric *)v1329 metrics];
    [v583 setObject:v582 forKeyedSubscript:@"Proactive_MeanDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"];

    [(NSDate *)v1329->_endDate timeIntervalSinceDate:v1329->_startDate];
    v584 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v585 = [(MOMetric *)v1329 metrics];
    [v585 setObject:v584 forKeyedSubscript:@"Proactive_MinDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"];

    [(NSDate *)v1329->_endDate timeIntervalSinceDate:v1329->_startDate];
    v586 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v587 = [(MOMetric *)v1329 metrics];
    [v587 setObject:v586 forKeyedSubscript:@"Proactive_MaxDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"];

    v580 = [(MOMetric *)v1329 metrics];
    [v580 setObject:&off_1002F9970 forKeyedSubscript:@"Proactive_SDDeltaBetweenMediaOnRepeatEventsBoundariesIncluded"];
  }

  [v1289 removeAllObjects];
  v588 = [v1286 objectForKeyedSubscript:@"strProvider"];
  v589 = +[NSPredicate predicateWithFormat:@"%K == %i", v588, 3];
  v1360[0] = v589;
  v590 = [v1286 objectForKeyedSubscript:@"strCategory"];
  v591 = +[NSPredicate predicateWithFormat:@"%K == %i", v590, 7];
  v1360[1] = v591;
  v592 = +[NSArray arrayWithObjects:v1360 count:2];
  uint64_t v593 = +[NSCompoundPredicate andPredicateWithSubpredicates:v592];

  v1262 = (void *)v593;
  v594 = [v1285 filteredArrayUsingPredicate:v593];
  v595 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v594 count]);
  v596 = v594;
  v597 = [(MOMetric *)v1329 metrics];
  [v597 setObject:v595 forKeyedSubscript:@"Proactive_NumTopicEvents"];

  id v1298 = v596;
  if ([v596 count])
  {
    uint64_t v598 = 0;
    int v599 = 0;
    int v600 = 0;
    while (1)
    {
      v601 = [v596 objectAtIndexedSubscript:v598];
      id v602 = objc_alloc((Class)NSDateInterval);
      v603 = [v601 startDate];
      v604 = [v601 endDate];
      id v605 = [v602 initWithStartDate:v603 endDate:v604];

      unsigned int v606 = [(MOPromptMetrics *)v1329 doesInterval:v605 overlapWithAnyIntervalFromArray:v1309];
      uint64_t v607 = [v601 creationDate];
      if (v607)
      {
        v608 = (void *)v607;
        uint64_t v609 = [v601 startDate];
        if (!v609) {
          goto LABEL_246;
        }
        v610 = (void *)v609;
        v611 = [v601 endDate];

        if (v611) {
          break;
        }
      }
LABEL_247:
      v599 += v606;

      if ((unint64_t)[v596 count] <= ++v598) {
        goto LABEL_250;
      }
    }
    unsigned int v1317 = v606;
    if (v598)
    {
      v612 = [v596 objectAtIndexedSubscript:(v598 - 1)];
      v613 = [v612 endDate];

      if (v613)
      {
        v614 = [v601 endDate];
        v615 = [v596 objectAtIndexedSubscript:v598 - 1];
        v616 = [v615 endDate];
        [v614 timeIntervalSinceDate:v616];
        v617 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v1289 addObject:v617];

        v596 = v1298;
      }
    }
    v618 = [v601 creationDate];
    v619 = [v601 endDate];
    [v618 timeIntervalSinceDate:v619];
    double v621 = v620;

    v622 = +[NSNumber numberWithDouble:v621];
    [v1328 addObject:v622];

    if (v600)
    {
      switch(v600)
      {
        case 1:
          v623 = [v601 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v623];
          v624 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v625 = +[MOMetric binForNumber:v624 bins:v1290];
          v626 = [(MOMetric *)v1329 metrics];
          [v626 setObject:v625 forKeyedSubscript:@"Proactive_HourIDTopicEvent_Start_2"];

          v608 = [v601 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v608];
          v627 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v628 = +[MOMetric binForNumber:v627 bins:v1290];
          v629 = [(MOMetric *)v1329 metrics];
          [v629 setObject:v628 forKeyedSubscript:@"Proactive_HourIDTopicEvent_End_2"];
          int v600 = 2;
          goto LABEL_245;
        case 2:
          v634 = [v601 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v634];
          v635 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v636 = +[MOMetric binForNumber:v635 bins:v1290];
          v637 = [(MOMetric *)v1329 metrics];
          [v637 setObject:v636 forKeyedSubscript:@"Proactive_HourIDTopicEvent_Start_3"];

          v608 = [v601 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v608];
          v627 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v628 = +[MOMetric binForNumber:v627 bins:v1290];
          v629 = [(MOMetric *)v1329 metrics];
          [v629 setObject:v628 forKeyedSubscript:@"Proactive_HourIDTopicEvent_End_3"];
          int v600 = 3;
          goto LABEL_245;
        case 3:
          v638 = [v601 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v638];
          v639 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v640 = +[MOMetric binForNumber:v639 bins:v1290];
          v641 = [(MOMetric *)v1329 metrics];
          [v641 setObject:v640 forKeyedSubscript:@"Proactive_HourIDTopicEvent_Start_4"];

          v608 = [v601 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v608];
          v627 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v628 = +[MOMetric binForNumber:v627 bins:v1290];
          v629 = [(MOMetric *)v1329 metrics];
          [v629 setObject:v628 forKeyedSubscript:@"Proactive_HourIDTopicEvent_End_4"];
          int v600 = 4;
          goto LABEL_245;
        case 4:
          v642 = [v601 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v642];
          v643 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v644 = +[MOMetric binForNumber:v643 bins:v1290];
          v645 = [(MOMetric *)v1329 metrics];
          [v645 setObject:v644 forKeyedSubscript:@"Proactive_HourIDTopicEvent_Start_5"];

          v608 = [v601 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v608];
          v627 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v628 = +[MOMetric binForNumber:v627 bins:v1290];
          v629 = [(MOMetric *)v1329 metrics];
          [v629 setObject:v628 forKeyedSubscript:@"Proactive_HourIDTopicEvent_End_5"];
          int v600 = 5;
          goto LABEL_245;
        default:
          ++v600;
          unsigned int v606 = v1317;
          break;
      }
      goto LABEL_247;
    }
    v630 = [v601 startDate];
    [(NSDate *)v1288 timeIntervalSinceDate:v630];
    v631 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v632 = +[MOMetric binForNumber:v631 bins:v1290];
    v633 = [(MOMetric *)v1329 metrics];
    [v633 setObject:v632 forKeyedSubscript:@"Proactive_HourIDTopicEvent_Start_1"];

    v608 = [v601 endDate];
    [(NSDate *)v1288 timeIntervalSinceDate:v608];
    v627 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v628 = +[MOMetric binForNumber:v627 bins:v1290];
    v629 = [(MOMetric *)v1329 metrics];
    [v629 setObject:v628 forKeyedSubscript:@"Proactive_HourIDTopicEvent_End_1"];
    int v600 = 1;
LABEL_245:

    v596 = v1298;
    unsigned int v606 = v1317;
LABEL_246:

    goto LABEL_247;
  }
  int v599 = 0;
LABEL_250:
  if ([v596 count])
  {
    v646 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 - (double)v599 / (double)(unint64_t)[v596 count]);
    v647 = [(MOMetric *)v1329 metrics];
    [v647 setObject:v646 forKeyedSubscript:@"Proactive_PercentageOfTopicEventsNoLOI"];
  }
  if ([v1328 count])
  {
    v648 = +[MOPromptMetrics meanOf:v1328];
    v649 = [(MOMetric *)v1329 metrics];
    [v649 setObject:v648 forKeyedSubscript:@"Proactive_TopicAverageLatency"];

    [v1328 removeAllObjects];
  }
  if ([v1289 count])
  {
    v650 = +[MOPromptMetrics meanOf:v1289];
    v651 = [(MOMetric *)v1329 metrics];
    [v651 setObject:v650 forKeyedSubscript:@"Proactive_MeanDeltaBetweenTopicEvents"];

    v652 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v653 = [(MOMetric *)v1329 metrics];
    [v653 setObject:v652 forKeyedSubscript:@"Proactive_MinDeltaBetweenTopicEvents"];

    v654 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v655 = [(MOMetric *)v1329 metrics];
    [v655 setObject:v654 forKeyedSubscript:@"Proactive_MaxDeltaBetweenTopicEvents"];

    v656 = +[MOPromptMetrics standardDeviationOf:v1289];
    v657 = [(MOMetric *)v1329 metrics];
    [v657 setObject:v656 forKeyedSubscript:@"Proactive_SDDeltaBetweenTopicEvents"];
  }
  if ([v1298 count])
  {
    v658 = [v1298 firstObject];
    v659 = [v658 endDate];
    [v659 timeIntervalSinceDate:v1329->_startDate];
    v660 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v660];

    v661 = v1329->_endDate;
    v662 = [v1298 lastObject];
    v663 = [v662 endDate];
    [(NSDate *)v661 timeIntervalSinceDate:v663];
    v664 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v664];

    v665 = +[MOPromptMetrics meanOf:v1289];
    v666 = [(MOMetric *)v1329 metrics];
    [v666 setObject:v665 forKeyedSubscript:@"Proactive_MeanDeltaBetweenTopicEventsBoundariesIncluded"];

    v667 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v668 = [(MOMetric *)v1329 metrics];
    [v668 setObject:v667 forKeyedSubscript:@"Proactive_MinDeltaBetweenTopicEventsBoundariesIncluded"];

    v669 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v670 = [(MOMetric *)v1329 metrics];
    [v670 setObject:v669 forKeyedSubscript:@"Proactive_MaxDeltaBetweenTopicEventsBoundariesIncluded"];

    v671 = +[MOPromptMetrics standardDeviationOf:v1289];
    v672 = [(MOMetric *)v1329 metrics];
    [v672 setObject:v671 forKeyedSubscript:@"Proactive_SDDeltaBetweenTopicEventsBoundariesIncluded"];
  }
  else
  {
    [(NSDate *)v1329->_endDate timeIntervalSinceDate:v1329->_startDate];
    v673 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v674 = [(MOMetric *)v1329 metrics];
    [v674 setObject:v673 forKeyedSubscript:@"Proactive_MeanDeltaBetweenTopicEventsBoundariesIncluded"];

    [(NSDate *)v1329->_endDate timeIntervalSinceDate:v1329->_startDate];
    v675 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v676 = [(MOMetric *)v1329 metrics];
    [v676 setObject:v675 forKeyedSubscript:@"Proactive_MinDeltaBetweenTopicEventsBoundariesIncluded"];

    [(NSDate *)v1329->_endDate timeIntervalSinceDate:v1329->_startDate];
    v677 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v678 = [(MOMetric *)v1329 metrics];
    [v678 setObject:v677 forKeyedSubscript:@"Proactive_MaxDeltaBetweenTopicEventsBoundariesIncluded"];

    v671 = [(MOMetric *)v1329 metrics];
    [v671 setObject:&off_1002F9970 forKeyedSubscript:@"Proactive_SDDeltaBetweenTopicEventsBoundariesIncluded"];
  }

  [v1289 removeAllObjects];
  v679 = [v1286 objectForKeyedSubscript:@"strProvider"];
  v680 = +[NSPredicate predicateWithFormat:@"%K == %i", v679, 3];
  v1359[0] = v680;
  v681 = [v1286 objectForKeyedSubscript:@"strCategory"];
  v682 = +[NSPredicate predicateWithFormat:@"%K == %i", v681, 8];
  v1359[1] = v682;
  v683 = +[NSArray arrayWithObjects:v1359 count:2];
  uint64_t v684 = +[NSCompoundPredicate andPredicateWithSubpredicates:v683];

  v1261 = (void *)v684;
  v685 = [v1285 filteredArrayUsingPredicate:v684];
  v686 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v685 count]);
  v687 = v685;
  v688 = [(MOMetric *)v1329 metrics];
  [v688 setObject:v686 forKeyedSubscript:@"Proactive_NumTravelEvents"];

  v1295 = v687;
  if ([v687 count])
  {
    uint64_t v689 = 0;
    int v690 = 0;
    int v691 = 0;
    while (1)
    {
      v692 = [v687 objectAtIndexedSubscript:v689];
      id v693 = objc_alloc((Class)NSDateInterval);
      v694 = [v692 startDate];
      v695 = [v692 endDate];
      id v696 = [v693 initWithStartDate:v694 endDate:v695];

      unsigned int v697 = [(MOPromptMetrics *)v1329 doesInterval:v696 overlapWithAnyIntervalFromArray:v1309];
      uint64_t v698 = [v692 creationDate];
      if (v698)
      {
        v699 = (void *)v698;
        uint64_t v700 = [v692 startDate];
        if (!v700) {
          goto LABEL_276;
        }
        v701 = (void *)v700;
        v702 = [v692 endDate];

        if (v702) {
          break;
        }
      }
LABEL_277:
      v690 += v697;

      if ((unint64_t)[v687 count] <= ++v689) {
        goto LABEL_280;
      }
    }
    unsigned int v1318 = v697;
    if (v689)
    {
      v703 = [v687 objectAtIndexedSubscript:(v689 - 1)];
      v704 = [v703 endDate];

      if (v704)
      {
        v705 = [v692 endDate];
        v706 = [v687 objectAtIndexedSubscript:v689 - 1];
        v707 = [v706 endDate];
        [v705 timeIntervalSinceDate:v707];
        v708 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v1289 addObject:v708];

        v687 = v1295;
      }
    }
    v709 = [v692 creationDate];
    v710 = [v692 endDate];
    [v709 timeIntervalSinceDate:v710];
    double v712 = v711;

    v713 = +[NSNumber numberWithDouble:v712];
    [v1328 addObject:v713];

    if (v691)
    {
      switch(v691)
      {
        case 1:
          v714 = [v692 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v714];
          v715 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v716 = +[MOMetric binForNumber:v715 bins:v1290];
          v717 = [(MOMetric *)v1329 metrics];
          [v717 setObject:v716 forKeyedSubscript:@"Proactive_HourIDTravelEvent_Start_2"];

          v699 = [v692 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v699];
          v718 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v719 = +[MOMetric binForNumber:v718 bins:v1290];
          v720 = [(MOMetric *)v1329 metrics];
          [v720 setObject:v719 forKeyedSubscript:@"Proactive_HourIDTravelEvent_End_2"];
          int v691 = 2;
          goto LABEL_275;
        case 2:
          v725 = [v692 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v725];
          v726 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v727 = +[MOMetric binForNumber:v726 bins:v1290];
          v728 = [(MOMetric *)v1329 metrics];
          [v728 setObject:v727 forKeyedSubscript:@"Proactive_HourIDTravelEvent_Start_3"];

          v699 = [v692 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v699];
          v718 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v719 = +[MOMetric binForNumber:v718 bins:v1290];
          v720 = [(MOMetric *)v1329 metrics];
          [v720 setObject:v719 forKeyedSubscript:@"Proactive_HourIDTravelEvent_End_3"];
          int v691 = 3;
          goto LABEL_275;
        case 3:
          v729 = [v692 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v729];
          v730 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v731 = +[MOMetric binForNumber:v730 bins:v1290];
          v732 = [(MOMetric *)v1329 metrics];
          [v732 setObject:v731 forKeyedSubscript:@"Proactive_HourIDTravelEvent_Start_4"];

          v699 = [v692 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v699];
          v718 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v719 = +[MOMetric binForNumber:v718 bins:v1290];
          v720 = [(MOMetric *)v1329 metrics];
          [v720 setObject:v719 forKeyedSubscript:@"Proactive_HourIDTravelEvent_End_4"];
          int v691 = 4;
          goto LABEL_275;
        case 4:
          v733 = [v692 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v733];
          v734 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v735 = +[MOMetric binForNumber:v734 bins:v1290];
          v736 = [(MOMetric *)v1329 metrics];
          [v736 setObject:v735 forKeyedSubscript:@"Proactive_HourIDTravelEvent_Start_5"];

          v699 = [v692 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v699];
          v718 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v719 = +[MOMetric binForNumber:v718 bins:v1290];
          v720 = [(MOMetric *)v1329 metrics];
          [v720 setObject:v719 forKeyedSubscript:@"Proactive_HourIDTravelEvent_End_5"];
          int v691 = 5;
          goto LABEL_275;
        default:
          ++v691;
          unsigned int v697 = v1318;
          break;
      }
      goto LABEL_277;
    }
    v721 = [v692 startDate];
    [(NSDate *)v1288 timeIntervalSinceDate:v721];
    v722 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v723 = +[MOMetric binForNumber:v722 bins:v1290];
    v724 = [(MOMetric *)v1329 metrics];
    [v724 setObject:v723 forKeyedSubscript:@"Proactive_HourIDTravelEvent_Start_1"];

    v699 = [v692 endDate];
    [(NSDate *)v1288 timeIntervalSinceDate:v699];
    v718 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v719 = +[MOMetric binForNumber:v718 bins:v1290];
    v720 = [(MOMetric *)v1329 metrics];
    [v720 setObject:v719 forKeyedSubscript:@"Proactive_HourIDTravelEvent_End_1"];
    int v691 = 1;
LABEL_275:

    v687 = v1295;
    unsigned int v697 = v1318;
LABEL_276:

    goto LABEL_277;
  }
  int v690 = 0;
LABEL_280:
  if ([v687 count])
  {
    v737 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 - (double)v690 / (double)(unint64_t)[v687 count]);
    v738 = [(MOMetric *)v1329 metrics];
    [v738 setObject:v737 forKeyedSubscript:@"Proactive_PercentageOfTravelEventsNoLOI"];
  }
  if ([v1328 count])
  {
    v739 = +[MOPromptMetrics meanOf:v1328];
    v740 = [(MOMetric *)v1329 metrics];
    [v740 setObject:v739 forKeyedSubscript:@"Proactive_TravelAverageLatency"];

    [v1328 removeAllObjects];
  }
  if ([v1289 count])
  {
    v741 = +[MOPromptMetrics meanOf:v1289];
    v742 = [(MOMetric *)v1329 metrics];
    [v742 setObject:v741 forKeyedSubscript:@"Proactive_MeanDeltaBetweenTravelEvents"];

    v743 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v744 = [(MOMetric *)v1329 metrics];
    [v744 setObject:v743 forKeyedSubscript:@"Proactive_MinDeltaBetweenTravelEvents"];

    v745 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v746 = [(MOMetric *)v1329 metrics];
    [v746 setObject:v745 forKeyedSubscript:@"Proactive_MaxDeltaBetweenTravelEvents"];

    v747 = +[MOPromptMetrics standardDeviationOf:v1289];
    v748 = [(MOMetric *)v1329 metrics];
    [v748 setObject:v747 forKeyedSubscript:@"Proactive_SDDeltaBetweenTravelEvents"];
  }
  if ([v1295 count])
  {
    v749 = [v1295 firstObject];
    v750 = [v749 endDate];
    [v750 timeIntervalSinceDate:v1329->_startDate];
    v751 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v751];

    v752 = v1329->_endDate;
    v753 = [v1295 lastObject];
    v754 = [v753 endDate];
    [(NSDate *)v752 timeIntervalSinceDate:v754];
    v755 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v755];

    v756 = +[MOPromptMetrics meanOf:v1289];
    v757 = [(MOMetric *)v1329 metrics];
    [v757 setObject:v756 forKeyedSubscript:@"Proactive_MeanDeltaBetweenTravelEventsBoundariesIncluded"];

    v758 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v759 = [(MOMetric *)v1329 metrics];
    [v759 setObject:v758 forKeyedSubscript:@"Proactive_MinDeltaBetweenTravelEventsBoundariesIncluded"];

    v760 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v761 = [(MOMetric *)v1329 metrics];
    [v761 setObject:v760 forKeyedSubscript:@"Proactive_MaxDeltaBetweenTravelEventsBoundariesIncluded"];

    v762 = +[MOPromptMetrics standardDeviationOf:v1289];
    v763 = [(MOMetric *)v1329 metrics];
    [v763 setObject:v762 forKeyedSubscript:@"Proactive_SDDeltaBetweenTravelEventsBoundariesIncluded"];
  }
  else
  {
    [(NSDate *)v1329->_endDate timeIntervalSinceDate:v1329->_startDate];
    v764 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v765 = [(MOMetric *)v1329 metrics];
    [v765 setObject:v764 forKeyedSubscript:@"Proactive_MeanDeltaBetweenTravelEventsBoundariesIncluded"];

    [(NSDate *)v1329->_endDate timeIntervalSinceDate:v1329->_startDate];
    v766 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v767 = [(MOMetric *)v1329 metrics];
    [v767 setObject:v766 forKeyedSubscript:@"Proactive_MinDeltaBetweenTravelEventsBoundariesIncluded"];

    [(NSDate *)v1329->_endDate timeIntervalSinceDate:v1329->_startDate];
    v768 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v769 = [(MOMetric *)v1329 metrics];
    [v769 setObject:v768 forKeyedSubscript:@"Proactive_MaxDeltaBetweenTravelEventsBoundariesIncluded"];

    v762 = [(MOMetric *)v1329 metrics];
    [v762 setObject:&off_1002F9970 forKeyedSubscript:@"Proactive_SDDeltaBetweenTravelEventsBoundariesIncluded"];
  }

  [v1289 removeAllObjects];
  v770 = [v1286 objectForKeyedSubscript:@"strProvider"];
  v771 = +[NSPredicate predicateWithFormat:@"%K == %i", v770, 3];
  v1358[0] = v771;
  v772 = [v1286 objectForKeyedSubscript:@"strCategory"];
  v773 = +[NSPredicate predicateWithFormat:@"%K == %i", v772, 9];
  v1358[1] = v773;
  v774 = +[NSArray arrayWithObjects:v1358 count:2];
  uint64_t v775 = +[NSCompoundPredicate andPredicateWithSubpredicates:v774];

  v1260 = (void *)v775;
  v776 = [v1285 filteredArrayUsingPredicate:v775];
  v777 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v776 count]);
  v778 = v776;
  v779 = [(MOMetric *)v1329 metrics];
  [v779 setObject:v777 forKeyedSubscript:@"Proactive_NumSharedWithYouEvents"];

  v1281 = v778;
  if ([v778 count])
  {
    uint64_t v780 = 0;
    int v781 = 0;
    int v782 = 0;
    while (1)
    {
      v783 = [v778 objectAtIndexedSubscript:v780];
      id v784 = objc_alloc((Class)NSDateInterval);
      v785 = [v783 startDate];
      v786 = [v783 endDate];
      id v787 = [v784 initWithStartDate:v785 endDate:v786];

      unsigned int v788 = [(MOPromptMetrics *)v1329 doesInterval:v787 overlapWithAnyIntervalFromArray:v1309];
      uint64_t v789 = [v783 creationDate];
      if (v789)
      {
        v790 = (void *)v789;
        uint64_t v791 = [v783 startDate];
        if (!v791) {
          goto LABEL_306;
        }
        v792 = (void *)v791;
        v793 = [v783 endDate];

        if (v793) {
          break;
        }
      }
LABEL_307:
      v781 += v788;

      if ((unint64_t)[v778 count] <= ++v780) {
        goto LABEL_310;
      }
    }
    unsigned int v1319 = v788;
    if (v780)
    {
      v794 = [v778 objectAtIndexedSubscript:(v780 - 1)];
      v795 = [v794 endDate];

      if (v795)
      {
        v796 = [v783 endDate];
        v797 = [v778 objectAtIndexedSubscript:v780 - 1];
        v798 = [v797 endDate];
        [v796 timeIntervalSinceDate:v798];
        v799 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v1289 addObject:v799];

        v778 = v1281;
      }
    }
    v800 = [v783 creationDate];
    v801 = [v783 endDate];
    [v800 timeIntervalSinceDate:v801];
    double v803 = v802;

    v804 = +[NSNumber numberWithDouble:v803];
    [v1328 addObject:v804];

    if (v782)
    {
      switch(v782)
      {
        case 1:
          v805 = [v783 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v805];
          v806 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v807 = +[MOMetric binForNumber:v806 bins:v1290];
          v808 = [(MOMetric *)v1329 metrics];
          [v808 setObject:v807 forKeyedSubscript:@"Proactive_HourIDSharedWithYouEvent_Start_2"];

          v790 = [v783 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v790];
          v809 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v810 = +[MOMetric binForNumber:v809 bins:v1290];
          v811 = [(MOMetric *)v1329 metrics];
          [v811 setObject:v810 forKeyedSubscript:@"Proactive_HourIDSharedWithYouEvent_End_2"];
          int v782 = 2;
          goto LABEL_305;
        case 2:
          v816 = [v783 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v816];
          v817 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v818 = +[MOMetric binForNumber:v817 bins:v1290];
          v819 = [(MOMetric *)v1329 metrics];
          [v819 setObject:v818 forKeyedSubscript:@"Proactive_HourIDSharedWithYouEvent_Start_3"];

          v790 = [v783 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v790];
          v809 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v810 = +[MOMetric binForNumber:v809 bins:v1290];
          v811 = [(MOMetric *)v1329 metrics];
          [v811 setObject:v810 forKeyedSubscript:@"Proactive_HourIDSharedWithYouEvent_End_3"];
          int v782 = 3;
          goto LABEL_305;
        case 3:
          v820 = [v783 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v820];
          v821 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v822 = +[MOMetric binForNumber:v821 bins:v1290];
          v823 = [(MOMetric *)v1329 metrics];
          [v823 setObject:v822 forKeyedSubscript:@"Proactive_HourIDSharedWithYouEvent_Start_4"];

          v790 = [v783 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v790];
          v809 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v810 = +[MOMetric binForNumber:v809 bins:v1290];
          v811 = [(MOMetric *)v1329 metrics];
          [v811 setObject:v810 forKeyedSubscript:@"Proactive_HourIDSharedWithYouEvent_End_4"];
          int v782 = 4;
          goto LABEL_305;
        case 4:
          v824 = [v783 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v824];
          v825 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v826 = +[MOMetric binForNumber:v825 bins:v1290];
          v827 = [(MOMetric *)v1329 metrics];
          [v827 setObject:v826 forKeyedSubscript:@"Proactive_HourIDSharedWithYouEvent_Start_5"];

          v790 = [v783 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v790];
          v809 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v810 = +[MOMetric binForNumber:v809 bins:v1290];
          v811 = [(MOMetric *)v1329 metrics];
          [v811 setObject:v810 forKeyedSubscript:@"Proactive_HourIDSharedWithYouEvent_End_5"];
          int v782 = 5;
          goto LABEL_305;
        default:
          ++v782;
          unsigned int v788 = v1319;
          break;
      }
      goto LABEL_307;
    }
    v812 = [v783 startDate];
    [(NSDate *)v1288 timeIntervalSinceDate:v812];
    v813 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v814 = +[MOMetric binForNumber:v813 bins:v1290];
    v815 = [(MOMetric *)v1329 metrics];
    [v815 setObject:v814 forKeyedSubscript:@"Proactive_HourIDSharedWithYouEvent_Start_1"];

    v790 = [v783 endDate];
    [(NSDate *)v1288 timeIntervalSinceDate:v790];
    v809 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v810 = +[MOMetric binForNumber:v809 bins:v1290];
    v811 = [(MOMetric *)v1329 metrics];
    [v811 setObject:v810 forKeyedSubscript:@"Proactive_HourIDSharedWithYouEvent_End_1"];
    int v782 = 1;
LABEL_305:

    v778 = v1281;
    unsigned int v788 = v1319;
LABEL_306:

    goto LABEL_307;
  }
  int v781 = 0;
LABEL_310:
  if ([v778 count])
  {
    v828 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 - (double)v781 / (double)(unint64_t)[v778 count]);
    v829 = [(MOMetric *)v1329 metrics];
    [v829 setObject:v828 forKeyedSubscript:@"Proactive_PercentageOfSharedWithYouEventsNoLOI"];
  }
  v830 = v1329;
  if ([v1328 count])
  {
    v831 = +[MOPromptMetrics meanOf:v1328];
    v832 = [(MOMetric *)v1329 metrics];
    [v832 setObject:v831 forKeyedSubscript:@"Proactive_SharedWithYouAverageLatency"];

    [v1328 removeAllObjects];
  }
  if ([v1289 count])
  {
    v833 = +[MOPromptMetrics meanOf:v1289];
    v834 = [(MOMetric *)v1329 metrics];
    [v834 setObject:v833 forKeyedSubscript:@"Proactive_MeanDeltaBetweenSharedWithYouEvents"];

    v835 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v836 = [(MOMetric *)v1329 metrics];
    [v836 setObject:v835 forKeyedSubscript:@"Proactive_MinDeltaBetweenSharedWithYouEvents"];

    v837 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v838 = [(MOMetric *)v1329 metrics];
    [v838 setObject:v837 forKeyedSubscript:@"Proactive_MaxDeltaBetweenSharedWithYouEvents"];

    v839 = +[MOPromptMetrics standardDeviationOf:v1289];
    v840 = [(MOMetric *)v1329 metrics];
    [v840 setObject:v839 forKeyedSubscript:@"Proactive_SDDeltaBetweenSharedWithYouEvents"];
  }
  if ([v1281 count])
  {
    v841 = [v1281 firstObject];
    v842 = [v841 endDate];
    [v842 timeIntervalSinceDate:v1329->_startDate];
    v843 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v843];

    v844 = v1329->_endDate;
    v845 = [v1281 lastObject];
    v846 = [v845 endDate];
    [(NSDate *)v844 timeIntervalSinceDate:v846];
    v847 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v847];

    v848 = +[MOPromptMetrics meanOf:v1289];
    v849 = [(MOMetric *)v1329 metrics];
    [v849 setObject:v848 forKeyedSubscript:@"Proactive_MeanDeltaBetweenSharedWithYouEventsBoundariesIncluded"];

    v850 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v851 = [(MOMetric *)v1329 metrics];
    [v851 setObject:v850 forKeyedSubscript:@"Proactive_MinDeltaBetweenSharedWithYouEventsBoundariesIncluded"];

    v852 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v853 = [(MOMetric *)v1329 metrics];
    [v853 setObject:v852 forKeyedSubscript:@"Proactive_MaxDeltaBetweenSharedWithYouEventsBoundariesIncluded"];

    v854 = +[MOPromptMetrics standardDeviationOf:v1289];
    v855 = [(MOMetric *)v1329 metrics];
    [v855 setObject:v854 forKeyedSubscript:@"Proactive_SDDeltaBetweenSharedWithYouEventsBoundariesIncluded"];
  }
  else
  {
    [(NSDate *)v1329->_endDate timeIntervalSinceDate:v1329->_startDate];
    v856 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v857 = [(MOMetric *)v1329 metrics];
    [v857 setObject:v856 forKeyedSubscript:@"Proactive_MeanDeltaBetweenSharedWithYouEventsBoundariesIncluded"];

    [(NSDate *)v1329->_endDate timeIntervalSinceDate:v1329->_startDate];
    v858 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v859 = [(MOMetric *)v1329 metrics];
    [v859 setObject:v858 forKeyedSubscript:@"Proactive_MinDeltaBetweenSharedWithYouEventsBoundariesIncluded"];

    [(NSDate *)v1329->_endDate timeIntervalSinceDate:v1329->_startDate];
    v860 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v861 = [(MOMetric *)v1329 metrics];
    [v861 setObject:v860 forKeyedSubscript:@"Proactive_MaxDeltaBetweenSharedWithYouEventsBoundariesIncluded"];

    v854 = [(MOMetric *)v1329 metrics];
    [v854 setObject:&off_1002F9970 forKeyedSubscript:@"Proactive_SDDeltaBetweenSharedWithYouEventsBoundariesIncluded"];
  }

  [v1289 removeAllObjects];
  v862 = [v1286 objectForKeyedSubscript:@"strProvider"];
  v863 = +[NSPredicate predicateWithFormat:@"%K == %i", v862, 3];
  v1357[0] = v863;
  v864 = [v1286 objectForKeyedSubscript:@"strCategory"];
  v865 = +[NSPredicate predicateWithFormat:@"%K == %i", v864, 10];
  v1357[1] = v865;
  v866 = +[NSArray arrayWithObjects:v1357 count:2];
  uint64_t v867 = +[NSCompoundPredicate andPredicateWithSubpredicates:v866];

  v1259 = (void *)v867;
  v868 = [v1285 filteredArrayUsingPredicate:v867];
  v869 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v868 count]);
  v870 = [(MOMetric *)v1329 metrics];
  [v870 setObject:v869 forKeyedSubscript:@"Proactive_NumSignificantContactEvents"];

  v1280 = v868;
  if ([v868 count])
  {
    uint64_t v871 = 0;
    int v872 = 0;
    int v873 = 0;
    while (1)
    {
      v874 = [v868 objectAtIndexedSubscript:v871];
      id v875 = objc_alloc((Class)NSDateInterval);
      v876 = [v874 startDate];
      v877 = [v874 endDate];
      id v878 = [v875 initWithStartDate:v876 endDate:v877];

      unsigned int v879 = [(MOPromptMetrics *)v830 doesInterval:v878 overlapWithAnyIntervalFromArray:v1309];
      uint64_t v880 = [v874 creationDate];
      if (v880)
      {
        v881 = (void *)v880;
        uint64_t v882 = [v874 startDate];
        if (!v882) {
          goto LABEL_336;
        }
        v883 = (void *)v882;
        v884 = [v874 endDate];

        if (v884) {
          break;
        }
      }
LABEL_337:
      v830 = v1329;
LABEL_338:
      v872 += v879;

      if ((unint64_t)[v868 count] <= ++v871) {
        goto LABEL_341;
      }
    }
    unsigned int v1320 = v879;
    v830 = v1329;
    if (v871)
    {
      v885 = [v868 objectAtIndexedSubscript:(v871 - 1)];
      v886 = [v885 endDate];

      if (v886)
      {
        v887 = [v874 endDate];
        v888 = [v868 objectAtIndexedSubscript:v871 - 1];
        v889 = [v888 endDate];
        [v887 timeIntervalSinceDate:v889];
        v890 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v1289 addObject:v890];

        v868 = v1280;
      }
    }
    v891 = [v874 creationDate];
    v892 = [v874 endDate];
    [v891 timeIntervalSinceDate:v892];
    double v894 = v893;

    v895 = +[NSNumber numberWithDouble:v894];
    [v1328 addObject:v895];

    if (v873)
    {
      switch(v873)
      {
        case 1:
          v896 = [v874 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v896];
          v897 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v898 = +[MOMetric binForNumber:v897 bins:v1290];
          v899 = [(MOMetric *)v1329 metrics];
          [v899 setObject:v898 forKeyedSubscript:@"Proactive_HourIDSignificantContactEvent_Start_2"];

          v881 = [v874 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v881];
          v900 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v901 = +[MOMetric binForNumber:v900 bins:v1290];
          v902 = [(MOMetric *)v1329 metrics];
          [v902 setObject:v901 forKeyedSubscript:@"Proactive_HourIDSignificantContactEvent_End_2"];
          int v873 = 2;
          goto LABEL_335;
        case 2:
          v907 = [v874 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v907];
          v908 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v909 = +[MOMetric binForNumber:v908 bins:v1290];
          v910 = [(MOMetric *)v1329 metrics];
          [v910 setObject:v909 forKeyedSubscript:@"Proactive_HourIDSignificantContactEvent_Start_3"];

          v881 = [v874 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v881];
          v900 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v901 = +[MOMetric binForNumber:v900 bins:v1290];
          v902 = [(MOMetric *)v1329 metrics];
          [v902 setObject:v901 forKeyedSubscript:@"Proactive_HourIDSignificantContactEvent_End_3"];
          int v873 = 3;
          goto LABEL_335;
        case 3:
          v911 = [v874 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v911];
          v912 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v913 = +[MOMetric binForNumber:v912 bins:v1290];
          v914 = [(MOMetric *)v1329 metrics];
          [v914 setObject:v913 forKeyedSubscript:@"Proactive_HourIDSignificantContactEvent_Start_4"];

          v881 = [v874 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v881];
          v900 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v901 = +[MOMetric binForNumber:v900 bins:v1290];
          v902 = [(MOMetric *)v1329 metrics];
          [v902 setObject:v901 forKeyedSubscript:@"Proactive_HourIDSignificantContactEvent_End_4"];
          int v873 = 4;
          goto LABEL_335;
        case 4:
          v915 = [v874 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v915];
          v916 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v917 = +[MOMetric binForNumber:v916 bins:v1290];
          v918 = [(MOMetric *)v1329 metrics];
          [v918 setObject:v917 forKeyedSubscript:@"Proactive_HourIDSignificantContactEvent_Start_5"];

          v881 = [v874 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v881];
          v900 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v901 = +[MOMetric binForNumber:v900 bins:v1290];
          v902 = [(MOMetric *)v1329 metrics];
          [v902 setObject:v901 forKeyedSubscript:@"Proactive_HourIDSignificantContactEvent_End_5"];
          int v873 = 5;
          goto LABEL_335;
        default:
          ++v873;
          unsigned int v879 = v1320;
          break;
      }
      goto LABEL_338;
    }
    v903 = [v874 startDate];
    [(NSDate *)v1288 timeIntervalSinceDate:v903];
    v904 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v905 = +[MOMetric binForNumber:v904 bins:v1290];
    v906 = [(MOMetric *)v1329 metrics];
    [v906 setObject:v905 forKeyedSubscript:@"Proactive_HourIDSignificantContactEvent_Start_1"];

    v881 = [v874 endDate];
    [(NSDate *)v1288 timeIntervalSinceDate:v881];
    v900 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v901 = +[MOMetric binForNumber:v900 bins:v1290];
    v902 = [(MOMetric *)v1329 metrics];
    [v902 setObject:v901 forKeyedSubscript:@"Proactive_HourIDSignificantContactEvent_End_1"];
    int v873 = 1;
LABEL_335:

    v868 = v1280;
    unsigned int v879 = v1320;
LABEL_336:

    goto LABEL_337;
  }
  int v872 = 0;
LABEL_341:
  if ([v868 count])
  {
    v919 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 - (double)v872 / (double)(unint64_t)[v868 count]);
    v920 = [(MOMetric *)v830 metrics];
    [v920 setObject:v919 forKeyedSubscript:@"Proactive_PercentageOfSignificantContactEventsNoLOI"];
  }
  if ([v1328 count])
  {
    v921 = +[MOPromptMetrics meanOf:v1328];
    v922 = [(MOMetric *)v830 metrics];
    [v922 setObject:v921 forKeyedSubscript:@"Proactive_SignificantContactAverageLatency"];

    [v1328 removeAllObjects];
  }
  if ([v1289 count])
  {
    v923 = +[MOPromptMetrics meanOf:v1289];
    v924 = [(MOMetric *)v830 metrics];
    [v924 setObject:v923 forKeyedSubscript:@"Proactive_MeanDeltaBetweenSignificantContactEvents"];

    v925 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v926 = [(MOMetric *)v830 metrics];
    [v926 setObject:v925 forKeyedSubscript:@"Proactive_MinDeltaBetweenSignificantContactEvents"];

    v927 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v928 = [(MOMetric *)v830 metrics];
    [v928 setObject:v927 forKeyedSubscript:@"Proactive_MaxDeltaBetweenSignificantContactEvents"];

    v929 = +[MOPromptMetrics standardDeviationOf:v1289];
    v930 = [(MOMetric *)v830 metrics];
    [v930 setObject:v929 forKeyedSubscript:@"Proactive_SDDeltaBetweenSignificantContactEvents"];
  }
  if ([v1280 count])
  {
    v931 = [v1280 firstObject];
    v932 = [v931 endDate];
    [v932 timeIntervalSinceDate:v830->_startDate];
    v933 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v933];

    v934 = v830->_endDate;
    v935 = [v1280 lastObject];
    v936 = [v935 endDate];
    [(NSDate *)v934 timeIntervalSinceDate:v936];
    v937 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v937];

    v938 = +[MOPromptMetrics meanOf:v1289];
    v939 = [(MOMetric *)v830 metrics];
    [v939 setObject:v938 forKeyedSubscript:@"Proactive_MeanDeltaBetweenSignificantContactEventsBoundariesIncluded"];

    v940 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v941 = [(MOMetric *)v830 metrics];
    [v941 setObject:v940 forKeyedSubscript:@"Proactive_MinDeltaBetweenSignificantContactEventsBoundariesIncluded"];

    v942 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v943 = [(MOMetric *)v830 metrics];
    [v943 setObject:v942 forKeyedSubscript:@"Proactive_MaxDeltaBetweenSignificantContactEventsBoundariesIncluded"];

    v944 = +[MOPromptMetrics standardDeviationOf:v1289];
    v945 = [(MOMetric *)v830 metrics];
    [v945 setObject:v944 forKeyedSubscript:@"Proactive_SDDeltaBetweenSignificantContactEventsBoundariesIncluded"];
  }
  else
  {
    [(NSDate *)v830->_endDate timeIntervalSinceDate:v830->_startDate];
    v946 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v947 = [(MOMetric *)v830 metrics];
    [v947 setObject:v946 forKeyedSubscript:@"Proactive_MeanDeltaBetweenSignificantContactEventsBoundariesIncluded"];

    [(NSDate *)v830->_endDate timeIntervalSinceDate:v830->_startDate];
    v948 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v949 = [(MOMetric *)v830 metrics];
    [v949 setObject:v948 forKeyedSubscript:@"Proactive_MinDeltaBetweenSignificantContactEventsBoundariesIncluded"];

    [(NSDate *)v830->_endDate timeIntervalSinceDate:v830->_startDate];
    v950 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v951 = [(MOMetric *)v830 metrics];
    [v951 setObject:v950 forKeyedSubscript:@"Proactive_MaxDeltaBetweenSignificantContactEventsBoundariesIncluded"];

    v944 = [(MOMetric *)v830 metrics];
    [v944 setObject:&off_1002F9970 forKeyedSubscript:@"Proactive_SDDeltaBetweenSignificantContactEventsBoundariesIncluded"];
  }

  [v1289 removeAllObjects];
  v952 = [v1286 objectForKeyedSubscript:@"strProvider"];
  v953 = +[NSPredicate predicateWithFormat:@"%K == %i", v952, 3];
  v1356[0] = v953;
  v954 = [v1286 objectForKeyedSubscript:@"strCategory"];
  v955 = +[NSPredicate predicateWithFormat:@"%K == %i", v954, 11];
  v1356[1] = v955;
  v956 = +[NSArray arrayWithObjects:v1356 count:2];
  uint64_t v957 = +[NSCompoundPredicate andPredicateWithSubpredicates:v956];

  v1258 = (void *)v957;
  v958 = [v1285 filteredArrayUsingPredicate:v957];
  v959 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v958 count]);
  v960 = [(MOMetric *)v830 metrics];
  [v960 setObject:v959 forKeyedSubscript:@"Proactive_NumStructuredEvents"];

  v1279 = v958;
  if ([v958 count])
  {
    uint64_t v961 = 0;
    int v962 = 0;
    int v963 = 0;
    while (1)
    {
      v964 = [v958 objectAtIndexedSubscript:v961];
      id v965 = objc_alloc((Class)NSDateInterval);
      v966 = [v964 startDate];
      v967 = [v964 endDate];
      id v968 = [v965 initWithStartDate:v966 endDate:v967];

      unsigned int v969 = [(MOPromptMetrics *)v830 doesInterval:v968 overlapWithAnyIntervalFromArray:v1309];
      uint64_t v970 = [v964 creationDate];
      if (v970)
      {
        v971 = (void *)v970;
        uint64_t v972 = [v964 startDate];
        if (!v972) {
          goto LABEL_367;
        }
        v973 = (void *)v972;
        v974 = [v964 endDate];

        if (v974) {
          break;
        }
      }
LABEL_368:
      v830 = v1329;
LABEL_369:
      v962 += v969;

      if ((unint64_t)[v958 count] <= ++v961) {
        goto LABEL_372;
      }
    }
    unsigned int v1321 = v969;
    v830 = v1329;
    if (v961)
    {
      v975 = [v958 objectAtIndexedSubscript:(v961 - 1)];
      v976 = [v975 endDate];

      if (v976)
      {
        v977 = [v964 endDate];
        v978 = [v958 objectAtIndexedSubscript:v961 - 1];
        v979 = [v978 endDate];
        [v977 timeIntervalSinceDate:v979];
        v980 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v1289 addObject:v980];

        v958 = v1279;
      }
    }
    v981 = [v964 creationDate];
    v982 = [v964 endDate];
    [v981 timeIntervalSinceDate:v982];
    double v984 = v983;

    v985 = +[NSNumber numberWithDouble:v984];
    [v1328 addObject:v985];

    if (v963)
    {
      switch(v963)
      {
        case 1:
          v986 = [v964 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v986];
          v987 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v988 = +[MOMetric binForNumber:v987 bins:v1290];
          v989 = [(MOMetric *)v1329 metrics];
          [v989 setObject:v988 forKeyedSubscript:@"Proactive_HourIDStructuredEvent_Start_2"];

          v971 = [v964 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v971];
          v990 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v991 = +[MOMetric binForNumber:v990 bins:v1290];
          v992 = [(MOMetric *)v1329 metrics];
          [v992 setObject:v991 forKeyedSubscript:@"Proactive_HourIDStructuredEvent_End_2"];
          int v963 = 2;
          goto LABEL_366;
        case 2:
          v997 = [v964 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v997];
          v998 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v999 = +[MOMetric binForNumber:v998 bins:v1290];
          v1000 = [(MOMetric *)v1329 metrics];
          [v1000 setObject:v999 forKeyedSubscript:@"Proactive_HourIDStructuredEvent_Start_3"];

          v971 = [v964 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v971];
          v990 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v991 = +[MOMetric binForNumber:v990 bins:v1290];
          v992 = [(MOMetric *)v1329 metrics];
          [v992 setObject:v991 forKeyedSubscript:@"Proactive_HourIDStructuredEvent_End_3"];
          int v963 = 3;
          goto LABEL_366;
        case 3:
          v1001 = [v964 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v1001];
          v1002 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v1003 = +[MOMetric binForNumber:v1002 bins:v1290];
          v1004 = [(MOMetric *)v1329 metrics];
          [v1004 setObject:v1003 forKeyedSubscript:@"Proactive_HourIDStructuredEvent_Start_4"];

          v971 = [v964 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v971];
          v990 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v991 = +[MOMetric binForNumber:v990 bins:v1290];
          v992 = [(MOMetric *)v1329 metrics];
          [v992 setObject:v991 forKeyedSubscript:@"Proactive_HourIDStructuredEvent_End_4"];
          int v963 = 4;
          goto LABEL_366;
        case 4:
          v1005 = [v964 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v1005];
          v1006 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v1007 = +[MOMetric binForNumber:v1006 bins:v1290];
          v1008 = [(MOMetric *)v1329 metrics];
          [v1008 setObject:v1007 forKeyedSubscript:@"Proactive_HourIDStructuredEvent_Start_5"];

          v971 = [v964 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v971];
          v990 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v991 = +[MOMetric binForNumber:v990 bins:v1290];
          v992 = [(MOMetric *)v1329 metrics];
          [v992 setObject:v991 forKeyedSubscript:@"Proactive_HourIDStructuredEvent_End_5"];
          int v963 = 5;
          goto LABEL_366;
        default:
          ++v963;
          unsigned int v969 = v1321;
          break;
      }
      goto LABEL_369;
    }
    v993 = [v964 startDate];
    [(NSDate *)v1288 timeIntervalSinceDate:v993];
    v994 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v995 = +[MOMetric binForNumber:v994 bins:v1290];
    v996 = [(MOMetric *)v1329 metrics];
    [v996 setObject:v995 forKeyedSubscript:@"Proactive_HourIDStructuredEvent_Start_1"];

    v971 = [v964 endDate];
    [(NSDate *)v1288 timeIntervalSinceDate:v971];
    v990 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v991 = +[MOMetric binForNumber:v990 bins:v1290];
    v992 = [(MOMetric *)v1329 metrics];
    [v992 setObject:v991 forKeyedSubscript:@"Proactive_HourIDStructuredEvent_End_1"];
    int v963 = 1;
LABEL_366:

    v958 = v1279;
    unsigned int v969 = v1321;
LABEL_367:

    goto LABEL_368;
  }
  int v962 = 0;
LABEL_372:
  if ([v958 count])
  {
    v1009 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 - (double)v962 / (double)(unint64_t)[v958 count]);
    v1010 = [(MOMetric *)v830 metrics];
    [v1010 setObject:v1009 forKeyedSubscript:@"Proactive_PercentageOfStructuredEventsNoLOI"];
  }
  v1011 = v1276;
  if ([v1328 count])
  {
    v1012 = +[MOPromptMetrics meanOf:v1328];
    v1013 = [(MOMetric *)v830 metrics];
    [v1013 setObject:v1012 forKeyedSubscript:@"Proactive_StructuredEventsAverageLatency"];

    [v1328 removeAllObjects];
  }
  v1014 = NSAssertionHandler_ptr;
  if ([v1289 count])
  {
    v1015 = +[MOPromptMetrics meanOf:v1289];
    v1016 = [(MOMetric *)v830 metrics];
    [v1016 setObject:v1015 forKeyedSubscript:@"Proactive_MeanDeltaBetweenStructuredEvents"];

    v1017 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v1018 = [(MOMetric *)v830 metrics];
    [v1018 setObject:v1017 forKeyedSubscript:@"Proactive_MinDeltaBetweenStructuredEvents"];

    v1019 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v1020 = [(MOMetric *)v830 metrics];
    [v1020 setObject:v1019 forKeyedSubscript:@"Proactive_MaxDeltaBetweenStructuredEvents"];

    v1021 = +[MOPromptMetrics standardDeviationOf:v1289];
    v1022 = [(MOMetric *)v830 metrics];
    [v1022 setObject:v1021 forKeyedSubscript:@"Proactive_SDDeltaBetweenStructuredEvents"];
  }
  if ([v1279 count])
  {
    v1023 = [v1279 firstObject];
    v1024 = [v1023 endDate];
    [v1024 timeIntervalSinceDate:v830->_startDate];
    v1025 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v1026 = v1289;
    [v1289 addObject:v1025];

    v1027 = v830->_endDate;
    v1028 = [v1279 lastObject];
    v1029 = [v1028 endDate];
    [(NSDate *)v1027 timeIntervalSinceDate:v1029];
    v1030 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v1289 addObject:v1030];

    v1031 = +[MOPromptMetrics meanOf:v1289];
    v1032 = [(MOMetric *)v830 metrics];
    [v1032 setObject:v1031 forKeyedSubscript:@"Proactive_MeanDeltaBetweenStructuredEventsBoundariesIncluded"];

    v1033 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v1034 = [(MOMetric *)v830 metrics];
    [v1034 setObject:v1033 forKeyedSubscript:@"Proactive_MinDeltaBetweenStructuredEventsBoundariesIncluded"];

    v1035 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v1036 = [(MOMetric *)v830 metrics];
    [v1036 setObject:v1035 forKeyedSubscript:@"Proactive_MaxDeltaBetweenStructuredEventsBoundariesIncluded"];

    v1037 = +[MOPromptMetrics standardDeviationOf:v1289];
    v1038 = [(MOMetric *)v830 metrics];
    [v1038 setObject:v1037 forKeyedSubscript:@"Proactive_SDDeltaBetweenStructuredEventsBoundariesIncluded"];
  }
  else
  {
    [(NSDate *)v830->_endDate timeIntervalSinceDate:v830->_startDate];
    v1039 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v1040 = [(MOMetric *)v830 metrics];
    [v1040 setObject:v1039 forKeyedSubscript:@"Proactive_MeanDeltaBetweenStructuredEventsBoundariesIncluded"];

    [(NSDate *)v830->_endDate timeIntervalSinceDate:v830->_startDate];
    v1041 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v1042 = [(MOMetric *)v830 metrics];
    [v1042 setObject:v1041 forKeyedSubscript:@"Proactive_MinDeltaBetweenStructuredEventsBoundariesIncluded"];

    [(NSDate *)v830->_endDate timeIntervalSinceDate:v830->_startDate];
    v1043 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v1044 = [(MOMetric *)v830 metrics];
    [v1044 setObject:v1043 forKeyedSubscript:@"Proactive_MaxDeltaBetweenStructuredEventsBoundariesIncluded"];

    v1037 = [(MOMetric *)v830 metrics];
    [v1037 setObject:&off_1002F9970 forKeyedSubscript:@"Proactive_SDDeltaBetweenStructuredEventsBoundariesIncluded"];
    v1026 = v1289;
  }

  [v1026 removeAllObjects];
  v1045 = [v1286 objectForKeyedSubscript:@"strProvider"];
  v1046 = +[NSPredicate predicateWithFormat:@"%K == %i", v1045, 3];
  v1355[0] = v1046;
  v1047 = [v1286 objectForKeyedSubscript:@"strCategory"];
  v1048 = +[NSPredicate predicateWithFormat:@"%K == %i", v1047, 4];
  v1355[1] = v1048;
  v1049 = +[NSArray arrayWithObjects:v1355 count:2];
  uint64_t v1050 = +[NSCompoundPredicate andPredicateWithSubpredicates:v1049];

  v1257 = (void *)v1050;
  v1051 = [v1285 filteredArrayUsingPredicate:v1050];
  v1052 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v1051 count]);
  v1053 = [(MOMetric *)v830 metrics];
  [v1053 setObject:v1052 forKeyedSubscript:@"Proactive_NumLeisureMediaEvents"];

  v1308 = v1051;
  if ([v1051 count])
  {
    uint64_t v1054 = 0;
    int v1055 = 0;
    int v1056 = 0;
    v1057 = v1051;
    while (1)
    {
      v1058 = [v1057 objectAtIndexedSubscript:v1054];
      id v1059 = objc_alloc((Class)NSDateInterval);
      v1060 = [v1058 startDate];
      v1061 = [v1058 endDate];
      id v1062 = [v1059 initWithStartDate:v1060 endDate:v1061];

      unsigned int v1063 = [(MOPromptMetrics *)v830 doesInterval:v1062 overlapWithAnyIntervalFromArray:v1309];
      uint64_t v1064 = [v1058 creationDate];
      if (v1064)
      {
        v1065 = (void *)v1064;
        uint64_t v1066 = [v1058 startDate];
        if (!v1066) {
          goto LABEL_398;
        }
        v1067 = (void *)v1066;
        v1068 = [v1058 endDate];

        if (v1068) {
          break;
        }
      }
LABEL_399:
      v830 = v1329;
LABEL_400:
      v1055 += v1063;

      if ((unint64_t)[v1057 count] <= ++v1054)
      {
        double v1103 = (double)v1055;
        v1014 = NSAssertionHandler_ptr;
        v1011 = v1276;
        goto LABEL_403;
      }
    }
    v830 = v1329;
    if (v1054)
    {
      v1069 = [v1308 objectAtIndexedSubscript:(v1054 - 1)];
      v1070 = [v1069 endDate];

      if (v1070)
      {
        v1071 = [v1058 endDate];
        v1072 = [v1308 objectAtIndexedSubscript:v1054 - 1];
        v1073 = [v1072 endDate];
        [v1071 timeIntervalSinceDate:v1073];
        v1074 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v1289 addObject:v1074];

        v830 = v1329;
      }
    }
    v1075 = [v1058 creationDate];
    v1076 = [v1058 endDate];
    [v1075 timeIntervalSinceDate:v1076];
    double v1078 = v1077;

    v1079 = +[NSNumber numberWithDouble:v1078];
    [v1328 addObject:v1079];

    if (v1056)
    {
      unsigned int v1322 = v1063;
      switch(v1056)
      {
        case 1:
          v1080 = [v1058 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v1080];
          v1081 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v1082 = +[MOMetric binForNumber:v1081 bins:v1290];
          v1083 = [(MOMetric *)v830 metrics];
          [v1083 setObject:v1082 forKeyedSubscript:@"Proactive_HourIDLeisureMediaEvent_Start_2"];

          v1065 = [v1058 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v1065];
          v1084 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v1085 = +[MOMetric binForNumber:v1084 bins:v1290];
          v1086 = [(MOMetric *)v1329 metrics];
          [v1086 setObject:v1085 forKeyedSubscript:@"Proactive_HourIDLeisureMediaEvent_End_2"];
          int v1056 = 2;
          goto LABEL_397;
        case 2:
          v1091 = [v1058 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v1091];
          v1092 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v1093 = +[MOMetric binForNumber:v1092 bins:v1290];
          v1094 = [(MOMetric *)v830 metrics];
          [v1094 setObject:v1093 forKeyedSubscript:@"Proactive_HourIDLeisureMediaEvent_Start_3"];

          v1065 = [v1058 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v1065];
          v1084 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v1085 = +[MOMetric binForNumber:v1084 bins:v1290];
          v1086 = [(MOMetric *)v1329 metrics];
          [v1086 setObject:v1085 forKeyedSubscript:@"Proactive_HourIDLeisureMediaEvent_End_3"];
          int v1056 = 3;
          goto LABEL_397;
        case 3:
          v1095 = [v1058 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v1095];
          v1096 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v1097 = +[MOMetric binForNumber:v1096 bins:v1290];
          v1098 = [(MOMetric *)v830 metrics];
          [v1098 setObject:v1097 forKeyedSubscript:@"Proactive_HourIDLeisureMediaEvent_Start_4"];

          v1065 = [v1058 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v1065];
          v1084 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v1085 = +[MOMetric binForNumber:v1084 bins:v1290];
          v1086 = [(MOMetric *)v1329 metrics];
          [v1086 setObject:v1085 forKeyedSubscript:@"Proactive_HourIDLeisureMediaEvent_End_4"];
          int v1056 = 4;
          goto LABEL_397;
        case 4:
          v1099 = [v1058 startDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v1099];
          v1100 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v1101 = +[MOMetric binForNumber:v1100 bins:v1290];
          v1102 = [(MOMetric *)v830 metrics];
          [v1102 setObject:v1101 forKeyedSubscript:@"Proactive_HourIDLeisureMediaEvent_Start_5"];

          v1065 = [v1058 endDate];
          [(NSDate *)v1288 timeIntervalSinceDate:v1065];
          v1084 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v1085 = +[MOMetric binForNumber:v1084 bins:v1290];
          v1086 = [(MOMetric *)v1329 metrics];
          [v1086 setObject:v1085 forKeyedSubscript:@"Proactive_HourIDLeisureMediaEvent_End_5"];
          int v1056 = 5;
          goto LABEL_397;
        default:
          ++v1056;
          v1057 = v1308;
          break;
      }
      goto LABEL_400;
    }
    unsigned int v1322 = v1063;
    v1087 = [v1058 startDate];
    [(NSDate *)v1288 timeIntervalSinceDate:v1087];
    v1088 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v1089 = +[MOMetric binForNumber:v1088 bins:v1290];
    v1090 = [(MOMetric *)v830 metrics];
    [v1090 setObject:v1089 forKeyedSubscript:@"Proactive_HourIDLeisureMediaEvent_Start_1"];

    v1065 = [v1058 endDate];
    [(NSDate *)v1288 timeIntervalSinceDate:v1065];
    v1084 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v1085 = +[MOMetric binForNumber:v1084 bins:v1290];
    v1086 = [(MOMetric *)v1329 metrics];
    [v1086 setObject:v1085 forKeyedSubscript:@"Proactive_HourIDLeisureMediaEvent_End_1"];
    int v1056 = 1;
LABEL_397:

    v1057 = v1308;
    unsigned int v1063 = v1322;
LABEL_398:

    goto LABEL_399;
  }
  double v1103 = 0.0;
LABEL_403:
  if ([v1308 count])
  {
    v1104 = [v1014[32] numberWithDouble:1.0 - v1103 / (double)(unint64_t)[v1308 count]];
    v1105 = [(MOMetric *)v830 metrics];
    [v1105 setObject:v1104 forKeyedSubscript:@"Proactive_PercentageOfLeisureMediaEventsNoLOI"];
  }
  if ([v1328 count])
  {
    v1106 = +[MOPromptMetrics meanOf:v1328];
    v1107 = [(MOMetric *)v830 metrics];
    [v1107 setObject:v1106 forKeyedSubscript:@"Proactive_LeisureMediaEventsAverageLatency"];

    [v1328 removeAllObjects];
  }
  if ([v1289 count])
  {
    v1108 = +[MOPromptMetrics meanOf:v1289];
    v1109 = [(MOMetric *)v830 metrics];
    [v1109 setObject:v1108 forKeyedSubscript:@"Proactive_MeanDeltaBetweenLeisureMediaEvents"];

    v1110 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v1111 = [(MOMetric *)v830 metrics];
    [v1111 setObject:v1110 forKeyedSubscript:@"Proactive_MinDeltaBetweenLeisureMediaEvents"];

    v1112 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v1113 = [(MOMetric *)v830 metrics];
    [v1113 setObject:v1112 forKeyedSubscript:@"Proactive_MaxDeltaBetweenLeisureMediaEvents"];

    v1114 = +[MOPromptMetrics standardDeviationOf:v1289];
    v1115 = [(MOMetric *)v830 metrics];
    [v1115 setObject:v1114 forKeyedSubscript:@"Proactive_SDDeltaBetweenLeisureMediaEvents"];
  }
  id v1116 = [v1308 count];
  v1117 = v1014[32];
  if (v1116)
  {
    v1118 = [v1308 firstObject];
    v1119 = [v1118 endDate];
    [v1119 timeIntervalSinceDate:v830->_startDate];
    v1120 = [v1117 numberWithDouble:x0];
    v1121 = v1289;
    [v1289 addObject:v1120];

    v1122 = v1014[32];
    v1123 = v830->_endDate;
    v1124 = [v1308 lastObject];
    v1125 = [v1124 endDate];
    [(NSDate *)v1123 timeIntervalSinceDate:v1125];
    v1126 = [v1122 numberWithDouble:];
    [v1289 addObject:v1126];

    v1127 = +[MOPromptMetrics meanOf:v1289];
    v1128 = [(MOMetric *)v830 metrics];
    [v1128 setObject:v1127 forKeyedSubscript:@"Proactive_MeanDeltaBetweenLeisureMediaEventsBoundariesIncluded"];

    v1129 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v1130 = [(MOMetric *)v830 metrics];
    [v1130 setObject:v1129 forKeyedSubscript:@"Proactive_MinDeltaBetweenLeisureMediaEventsBoundariesIncluded"];

    v1131 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v1132 = [(MOMetric *)v830 metrics];
    [v1132 setObject:v1131 forKeyedSubscript:@"Proactive_MaxDeltaBetweenLeisureMediaEventsBoundariesIncluded"];

    v1133 = +[MOPromptMetrics standardDeviationOf:v1289];
    v1134 = [(MOMetric *)v830 metrics];
    [v1134 setObject:v1133 forKeyedSubscript:@"Proactive_SDDeltaBetweenLeisureMediaEventsBoundariesIncluded"];
  }
  else
  {
    [(NSDate *)v830->_endDate timeIntervalSinceDate:v830->_startDate];
    v1135 = [v1117 numberWithDouble:x0];
    v1136 = [(MOMetric *)v830 metrics];
    [v1136 setObject:v1135 forKeyedSubscript:@"Proactive_MeanDeltaBetweenLeisureMediaEventsBoundariesIncluded"];

    v1137 = v1014[32];
    [(NSDate *)v830->_endDate timeIntervalSinceDate:v830->_startDate];
    v1138 = [v1137 numberWithDouble:x0];
    v1139 = [(MOMetric *)v830 metrics];
    [v1139 setObject:v1138 forKeyedSubscript:@"Proactive_MinDeltaBetweenLeisureMediaEventsBoundariesIncluded"];

    v1140 = v1014[32];
    [(NSDate *)v830->_endDate timeIntervalSinceDate:v830->_startDate];
    v1141 = [v1140 numberWithDouble:];
    v1142 = [(MOMetric *)v830 metrics];
    [v1142 setObject:v1141 forKeyedSubscript:@"Proactive_MaxDeltaBetweenLeisureMediaEventsBoundariesIncluded"];

    v1133 = [(MOMetric *)v830 metrics];
    [v1133 setObject:&off_1002F9970 forKeyedSubscript:@"Proactive_SDDeltaBetweenLeisureMediaEventsBoundariesIncluded"];
    v1121 = v1289;
  }

  [v1121 removeAllObjects];
  v1143 = [v1286 objectForKeyedSubscript:@"strProvider"];
  v1144 = +[NSPredicate predicateWithFormat:@"%K == %i", v1143, 3];
  v1354[0] = v1144;
  v1145 = [v1286 objectForKeyedSubscript:@"strCategory"];
  v1146 = +[NSPredicate predicateWithFormat:@"%K == %i", v1145, 12];
  v1354[1] = v1146;
  v1147 = +[NSArray arrayWithObjects:v1354 count:2];
  v1148 = +[NSCompoundPredicate andPredicateWithSubpredicates:v1147];

  v1149 = [v1285 filteredArrayUsingPredicate:v1148];
  v1150 = [v1014[32] numberWithUnsignedInteger:[v1149 count]];
  v1151 = [(MOMetric *)v830 metrics];
  [v1151 setObject:v1150 forKeyedSubscript:@"Proactive_NumNLEvents"];

  v1313 = v1149;
  if ([v1149 count])
  {
    v1284 = v1148;
    uint64_t v1152 = 0;
    int v1153 = 0;
    int v1154 = 0;
    v1155 = v1313;
    while (1)
    {
      v1156 = [v1155 objectAtIndexedSubscript:v1152];
      id v1157 = objc_alloc((Class)NSDateInterval);
      v1158 = [v1156 startDate];
      v1159 = [v1156 endDate];
      id v1160 = [v1157 initWithStartDate:v1158 endDate:v1159];

      unsigned int v1161 = [(MOPromptMetrics *)v830 doesInterval:v1160 overlapWithAnyIntervalFromArray:v1309];
      uint64_t v1162 = [v1156 creationDate];
      if (v1162) {
        break;
      }
LABEL_432:
      v1153 += v1161;

      if ((unint64_t)[v1155 count] <= ++v1152)
      {
        double v1217 = (double)v1153;
        v1011 = v1276;
        v1148 = v1284;
        goto LABEL_435;
      }
    }
    v1163 = (void *)v1162;
    unsigned int v1323 = v1161;
    uint64_t v1164 = [v1156 startDate];
    if (v1164)
    {
      v1165 = (void *)v1164;
      v1166 = [v1156 endDate];

      if (!v1166)
      {
LABEL_425:
        v1155 = v1313;
LABEL_431:
        unsigned int v1161 = v1323;
        goto LABEL_432;
      }
      if (v1152)
      {
        v1167 = [v1313 objectAtIndexedSubscript:(v1152 - 1)];
        v1168 = [v1167 endDate];

        if (v1168)
        {
          v1169 = v1014[32];
          v1170 = [v1156 endDate];
          v1171 = [v1313 objectAtIndexedSubscript:v1152 - 1];
          v1172 = [v1171 endDate];
          [v1170 timeIntervalSinceDate:v1172];
          v1173 = [v1169 numberWithDouble:];
          [v1289 addObject:v1173];

          v1014 = NSAssertionHandler_ptr;
        }
      }
      v1174 = [v1156 creationDate];
      v1175 = [v1156 endDate];
      [v1174 timeIntervalSinceDate:v1175];
      double v1177 = v1176;

      v1178 = [v1014[32] numberWithDouble:v1177];
      [v1328 addObject:v1178];

      if (v1154)
      {
        switch(v1154)
        {
          case 1:
            v1179 = v1014[32];
            v1180 = [v1156 startDate];
            [(NSDate *)v1288 timeIntervalSinceDate:v1180];
            v1181 = [v1179 numberWithDouble:];
            v1182 = +[MOMetric binForNumber:v1181 bins:v1290];
            v830 = v1329;
            [(MOMetric *)v1329 metrics];
            v1184 = v1183 = v1014;
            [v1184 setObject:v1182 forKeyedSubscript:@"Proactive_HourIDNLEvent_Start_2"];

            v1185 = v1183[32];
            v1163 = [v1156 endDate];
            [(NSDate *)v1288 timeIntervalSinceDate:v1163];
            v1186 = [v1185 numberWithDouble:x0];
            v1187 = +[MOMetric binForNumber:v1186 bins:v1290];
            v1188 = [(MOMetric *)v1329 metrics];
            [v1188 setObject:v1187 forKeyedSubscript:@"Proactive_HourIDNLEvent_End_2"];
            int v1154 = 2;
            goto LABEL_429;
          case 2:
            v1196 = v1014[32];
            v1197 = [v1156 startDate];
            [(NSDate *)v1288 timeIntervalSinceDate:v1197];
            v1198 = [v1196 numberWithDouble:x0];
            v1199 = +[MOMetric binForNumber:v1198 bins:v1290];
            v830 = v1329;
            [(MOMetric *)v1329 metrics];
            v1201 = v1200 = v1014;
            [v1201 setObject:v1199 forKeyedSubscript:@"Proactive_HourIDNLEvent_Start_3"];

            v1202 = v1200[32];
            v1163 = [v1156 endDate];
            [(NSDate *)v1288 timeIntervalSinceDate:v1163];
            v1186 = [v1202 numberWithDouble:];
            v1187 = +[MOMetric binForNumber:v1186 bins:v1290];
            v1188 = [(MOMetric *)v1329 metrics];
            [v1188 setObject:v1187 forKeyedSubscript:@"Proactive_HourIDNLEvent_End_3"];
            int v1154 = 3;
            goto LABEL_429;
          case 3:
            v1203 = v1014[32];
            v1204 = [v1156 startDate];
            [(NSDate *)v1288 timeIntervalSinceDate:v1204];
            v1205 = [v1203 numberWithDouble:];
            v1206 = +[MOMetric binForNumber:v1205 bins:v1290];
            v830 = v1329;
            [(MOMetric *)v1329 metrics];
            v1208 = v1207 = v1014;
            [v1208 setObject:v1206 forKeyedSubscript:@"Proactive_HourIDNLEvent_Start_4"];

            v1209 = v1207[32];
            v1163 = [v1156 endDate];
            [(NSDate *)v1288 timeIntervalSinceDate:v1163];
            v1186 = [v1209 numberWithDouble:];
            v1187 = +[MOMetric binForNumber:v1186 bins:v1290];
            v1188 = [(MOMetric *)v1329 metrics];
            [v1188 setObject:v1187 forKeyedSubscript:@"Proactive_HourIDNLEvent_End_4"];
            int v1154 = 4;
            goto LABEL_429;
          case 4:
            v1210 = v1014[32];
            v1211 = [v1156 startDate];
            [(NSDate *)v1288 timeIntervalSinceDate:v1211];
            v1212 = [v1210 numberWithDouble:x0];
            v1213 = +[MOMetric binForNumber:v1212 bins:v1290];
            v830 = v1329;
            [(MOMetric *)v1329 metrics];
            v1215 = v1214 = v1014;
            [v1215 setObject:v1213 forKeyedSubscript:@"Proactive_HourIDNLEvent_Start_5"];

            v1216 = v1214[32];
            v1163 = [v1156 endDate];
            [(NSDate *)v1288 timeIntervalSinceDate:v1163];
            v1186 = [v1216 numberWithDouble:x0];
            v1187 = +[MOMetric binForNumber:v1186 bins:v1290];
            v1188 = [(MOMetric *)v1329 metrics];
            [v1188 setObject:v1187 forKeyedSubscript:@"Proactive_HourIDNLEvent_End_5"];
            int v1154 = 5;
            goto LABEL_429;
          default:
            ++v1154;
            v830 = v1329;
            goto LABEL_425;
        }
      }
      v1189 = v1014[32];
      v1190 = [v1156 startDate];
      [(NSDate *)v1288 timeIntervalSinceDate:v1190];
      v1191 = [v1189 numberWithDouble:x0];
      v1192 = +[MOMetric binForNumber:v1191 bins:v1290];
      v830 = v1329;
      [(MOMetric *)v1329 metrics];
      v1194 = v1193 = v1014;
      [v1194 setObject:v1192 forKeyedSubscript:@"Proactive_HourIDNLEvent_Start_1"];

      v1195 = v1193[32];
      v1163 = [v1156 endDate];
      [(NSDate *)v1288 timeIntervalSinceDate:v1163];
      v1186 = [v1195 numberWithDouble:x0];
      v1187 = +[MOMetric binForNumber:v1186 bins:v1290];
      v1188 = [(MOMetric *)v1329 metrics];
      [v1188 setObject:v1187 forKeyedSubscript:@"Proactive_HourIDNLEvent_End_1"];
      int v1154 = 1;
LABEL_429:

      v1014 = NSAssertionHandler_ptr;
      v1155 = v1313;
    }

    goto LABEL_431;
  }
  double v1217 = 0.0;
LABEL_435:
  if ([v1313 count])
  {
    v1218 = [v1014[32] numberWithDouble:1.0 - v1217 / (double)(unint64_t)[v1313 count]];
    v1219 = [(MOMetric *)v830 metrics];
    [v1219 setObject:v1218 forKeyedSubscript:@"Proactive_PercentageOfNLEventsNoLOI"];
  }
  if ([v1328 count])
  {
    v1220 = +[MOPromptMetrics meanOf:v1328];
    v1221 = [(MOMetric *)v830 metrics];
    [v1221 setObject:v1220 forKeyedSubscript:@"Proactive_NLEventsAverageLatency"];

    [v1328 removeAllObjects];
  }
  if ([v1289 count])
  {
    v1222 = +[MOPromptMetrics meanOf:v1289];
    v1223 = [(MOMetric *)v830 metrics];
    [v1223 setObject:v1222 forKeyedSubscript:@"Proactive_MeanDeltaBetweenNLEvents"];

    v1224 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v1225 = [(MOMetric *)v830 metrics];
    [v1225 setObject:v1224 forKeyedSubscript:@"Proactive_MinDeltaBetweenNLEvents"];

    v1226 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v1227 = [(MOMetric *)v830 metrics];
    [v1227 setObject:v1226 forKeyedSubscript:@"Proactive_MaxDeltaBetweenNLEvents"];

    v1228 = +[MOPromptMetrics standardDeviationOf:v1289];
    v1229 = [(MOMetric *)v830 metrics];
    [v1229 setObject:v1228 forKeyedSubscript:@"Proactive_SDDeltaBetweenNLEvents"];
  }
  id v1230 = [v1313 count];
  v1231 = v1014[32];
  if (v1230)
  {
    v1232 = [v1313 firstObject];
    v1233 = [v1232 endDate];
    [v1233 timeIntervalSinceDate:v830->_startDate];
    v1234 = [v1231 numberWithDouble:x0];
    v1235 = v1289;
    [v1289 addObject:v1234];

    v1236 = v1014[32];
    v1237 = v830->_endDate;
    v1238 = [v1313 lastObject];
    v1239 = [v1238 endDate];
    [(NSDate *)v1237 timeIntervalSinceDate:v1239];
    v1240 = [v1236 numberWithDouble:x0];
    [v1289 addObject:v1240];

    v1241 = +[MOPromptMetrics meanOf:v1289];
    v1242 = [(MOMetric *)v830 metrics];
    [v1242 setObject:v1241 forKeyedSubscript:@"Proactive_MeanDeltaBetweenNLEventsBoundariesIncluded"];

    v1243 = [v1289 valueForKeyPath:@"@min.doubleValue"];
    v1244 = [(MOMetric *)v830 metrics];
    [v1244 setObject:v1243 forKeyedSubscript:@"Proactive_MinDeltaBetweenNLEventsBoundariesIncluded"];

    v1245 = [v1289 valueForKeyPath:@"@max.doubleValue"];
    v1246 = [(MOMetric *)v830 metrics];
    [v1246 setObject:v1245 forKeyedSubscript:@"Proactive_MaxDeltaBetweenNLEventsBoundariesIncluded"];

    v1247 = +[MOPromptMetrics standardDeviationOf:v1289];
    v1248 = [(MOMetric *)v830 metrics];
    [v1248 setObject:v1247 forKeyedSubscript:@"Proactive_SDDeltaBetweenNLEventsBoundariesIncluded"];
  }
  else
  {
    [(NSDate *)v830->_endDate timeIntervalSinceDate:v830->_startDate];
    v1249 = [v1231 numberWithDouble:];
    v1250 = [(MOMetric *)v830 metrics];
    [v1250 setObject:v1249 forKeyedSubscript:@"Proactive_MeanDeltaBetweenNLEventsBoundariesIncluded"];

    v1251 = v1014[32];
    [(NSDate *)v830->_endDate timeIntervalSinceDate:v830->_startDate];
    v1252 = [v1251 numberWithDouble:];
    v1253 = [(MOMetric *)v830 metrics];
    [v1253 setObject:v1252 forKeyedSubscript:@"Proactive_MinDeltaBetweenNLEventsBoundariesIncluded"];

    v1254 = v1014[32];
    [(NSDate *)v830->_endDate timeIntervalSinceDate:v830->_startDate];
    v1255 = [v1254 numberWithDouble:];
    v1256 = [(MOMetric *)v830 metrics];
    [v1256 setObject:v1255 forKeyedSubscript:@"Proactive_MaxDeltaBetweenNLEventsBoundariesIncluded"];

    v1247 = [(MOMetric *)v830 metrics];
    [v1247 setObject:&off_1002F9970 forKeyedSubscript:@"Proactive_SDDeltaBetweenNLEventsBoundariesIncluded"];
    v1235 = v1289;
  }

  [v1235 removeAllObjects];
}

- (void)calculateAndSetMetricsForCorrelatedEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(MOMetric *)self metrics];
  [v5 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundles"];

  id v6 = [(MOMetric *)self metrics];
  [v6 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_0"];

  id v7 = [(MOMetric *)self metrics];
  [v7 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_1"];

  id v8 = [(MOMetric *)self metrics];
  [v8 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_0"];

  id v9 = [(MOMetric *)self metrics];
  [v9 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_1"];

  uint64_t v10 = [(MOMetric *)self metrics];
  [v10 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_0"];

  uint64_t v11 = [(MOMetric *)self metrics];
  [v11 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_1"];

  double v12 = [(MOMetric *)self metrics];
  [v12 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_0"];

  uint64_t v13 = [(MOMetric *)self metrics];
  [v13 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_1"];

  double v14 = [(MOMetric *)self metrics];
  [v14 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_0"];

  uint64_t v15 = [(MOMetric *)self metrics];
  [v15 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_1"];

  long long v16 = [(MOMetric *)self metrics];
  [v16 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_0"];

  long long v17 = [(MOMetric *)self metrics];
  [v17 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_1"];

  long long v18 = [(MOMetric *)self metrics];
  [v18 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_0"];

  long long v19 = [(MOMetric *)self metrics];
  [v19 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_1"];

  id v20 = [(MOMetric *)self metrics];
  [v20 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_0"];

  uint64_t v82 = self;
  uint64_t v21 = [(MOMetric *)self metrics];
  [v21 setObject:&off_1002F79D0 forKeyedSubscript:@"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_1"];

  if (v4 && [v4 count])
  {
    double v79 = v4;
    uint64_t v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
    uint64_t v23 = [(MOMetric *)self metrics];
    [v23 setObject:v22 forKeyedSubscript:@"numPreBundles"];

    BOOL v24 = +[MOEventBundler propertyNameDictionary];
    v25 = [v24 objectForKeyedSubscript:@"strProvider"];
    id v26 = +[NSPredicate predicateWithFormat:@"%K == %i", v25, 1];
    v104[0] = v26;
    id v27 = [v24 objectForKeyedSubscript:@"strCategory"];
    uint64_t v28 = +[NSPredicate predicateWithFormat:@"%K == %i", v27, 2];
    v104[1] = v28;
    id v29 = +[NSArray arrayWithObjects:v104 count:2];
    double v78 = +[NSCompoundPredicate andPredicateWithSubpredicates:v29];

    id v30 = [v24 objectForKeyedSubscript:@"strProvider"];
    id v31 = +[NSPredicate predicateWithFormat:@"%K == %i", v30, 2];
    v103[0] = v31;
    uint64_t v32 = [v24 objectForKeyedSubscript:@"strCategory"];
    uint64_t v33 = +[NSPredicate predicateWithFormat:@"%K == %i", v32, 5];
    v103[1] = v33;
    unsigned int v34 = +[NSArray arrayWithObjects:v103 count:2];
    uint64_t v35 = +[NSCompoundPredicate andPredicateWithSubpredicates:v34];

    uint64_t v36 = [v24 objectForKeyedSubscript:@"strProvider"];
    long long v37 = +[NSPredicate predicateWithFormat:@"%K == %i", v36, 4];
    v102[0] = v37;
    long long v38 = [v24 objectForKeyedSubscript:@"strCategory"];
    long long v39 = +[NSPredicate predicateWithFormat:@"%K == %i", v38, 1];
    v102[1] = v39;
    long long v40 = +[NSArray arrayWithObjects:v102 count:2];
    uint64_t v41 = +[NSCompoundPredicate andPredicateWithSubpredicates:v40];

    v77 = v24;
    long long v42 = [v24 objectForKeyedSubscript:@"strProvider"];
    long long v43 = +[NSPredicate predicateWithFormat:@"%K == %i", v42, 3];
    v101 = v43;
    long long v44 = +[NSArray arrayWithObjects:&v101 count:1];
    uint64_t v45 = +[NSCompoundPredicate andPredicateWithSubpredicates:v44];

    v99[0] = &off_1002F7A90;
    v99[1] = &off_1002F7AA8;
    v100[0] = v78;
    v100[1] = v35;
    v75 = (void *)v41;
    v76 = (void *)v35;
    v99[2] = &off_1002F7AC0;
    v99[3] = &off_1002F7AD8;
    v100[2] = v41;
    v100[3] = v45;
    v74 = (void *)v45;
    uint64_t v81 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:4];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id obj = v79;
    id v83 = [obj countByEnumeratingWithState:&v93 objects:v98 count:16];
    long long v46 = 0;
    if (v83)
    {
      uint64_t v80 = *(void *)v94;
      do
      {
        uint64_t v47 = 0;
        do
        {
          v86 = v46;
          if (*(void *)v94 != v80) {
            objc_enumerationMutation(obj);
          }
          uint64_t v85 = v47;
          long long v48 = [obj objectForKeyedSubscript:*(void *)(*((void *)&v93 + 1) + 8 * v47)];
          long long v89 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          id v49 = v81;
          id v50 = [v49 countByEnumeratingWithState:&v89 objects:v97 count:16];
          if (v50)
          {
            id v51 = v50;
            uint64_t v88 = 0;
            int v87 = 0;
            int v52 = 0;
            uint64_t v53 = *(void *)v90;
            do
            {
              for (i = 0; i != v51; i = (char *)i + 1)
              {
                if (*(void *)v90 != v53) {
                  objc_enumerationMutation(v49);
                }
                uint64_t v55 = *(void **)(*((void *)&v89 + 1) + 8 * i);
                v57 = [v49 objectForKeyedSubscript:v55];
                id v58 = [v48 filteredSetUsingPredicate:v57];
                v59 = v58;
                if (v58 && [v58 count])
                {
                  if ([v55 isEqual:&off_1002F7A90])
                  {
                    int v52 = 1;
                  }
                  else if ([v55 isEqual:&off_1002F7AA8])
                  {
                    LODWORD(v88) = 1;
                  }
                  else if ([v55 isEqual:&off_1002F7AC0])
                  {
                    int v87 = 1;
                  }
                  else
                  {
                    HIDWORD(v88) |= [v55 isEqual:&off_1002F7AD8];
                  }
                }
              }
              id v51 = [v49 countByEnumeratingWithState:&v89 objects:v97 count:16];
            }
            while (v51);
          }
          else
          {
            uint64_t v88 = 0;
            int v87 = 0;
            int v52 = 0;
          }

          int v60 = v52 | v88 | v87;
          if ((v60 & 1) == 0)
          {
            CFStringRef v61 = @"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_0";
            if ((v88 & 0x100000000) == 0) {
              goto LABEL_44;
            }
          }
          int v62 = HIDWORD(v88) ^ 1;
          CFStringRef v61 = @"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_0_proactiveEvent_1";
          if (((v60 | HIDWORD(v88) ^ 1) & 1) == 0) {
            goto LABEL_44;
          }
          int v63 = v87 ^ 1;
          int v64 = v52 | v88 | v87 ^ 1;
          CFStringRef v61 = @"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_0";
          if (((v64 | HIDWORD(v88)) & 1) == 0) {
            goto LABEL_44;
          }
          CFStringRef v61 = @"numPreBundlesWith_workoutEvent_0_storytellingEvent_0_routineEvent_1_proactiveEvent_1";
          if (((v64 | v62) & 1) == 0) {
            goto LABEL_44;
          }
          int v65 = v52 | v88 ^ 1;
          CFStringRef v61 = @"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_0";
          if (((v65 | v87 | HIDWORD(v88)) & 1) == 0) {
            goto LABEL_44;
          }
          CFStringRef v61 = @"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_0_proactiveEvent_1";
          if (((v65 | v87 | v62) & 1) == 0) {
            goto LABEL_44;
          }
          int v66 = v65 | v63;
          CFStringRef v61 = @"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_0";
          if (((v66 | HIDWORD(v88)) & 1) == 0) {
            goto LABEL_44;
          }
          CFStringRef v61 = @"numPreBundlesWith_workoutEvent_0_storytellingEvent_1_routineEvent_1_proactiveEvent_1";
          if (((v66 | v62) & 1) == 0) {
            goto LABEL_44;
          }
          int v67 = v52 ^ 1 | v88;
          CFStringRef v61 = @"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_0";
          if (((v67 | v87 | HIDWORD(v88)) & 1) == 0) {
            goto LABEL_44;
          }
          CFStringRef v61 = @"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_0_proactiveEvent_1";
          if (((v67 | v87 | v62) & 1) == 0) {
            goto LABEL_44;
          }
          int v68 = v67 | v63;
          CFStringRef v61 = @"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_0";
          if (((v68 | HIDWORD(v88)) & 1) == 0) {
            goto LABEL_44;
          }
          CFStringRef v61 = @"numPreBundlesWith_workoutEvent_1_storytellingEvent_0_routineEvent_1_proactiveEvent_1";
          if (((v68 | v62) & 1) != 0
            && (int v69 = v52 ^ 1 | v88 ^ 1,
                CFStringRef v61 = @"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_0",
                ((v69 | v87 | HIDWORD(v88)) & 1) != 0)
            && (CFStringRef v61 = @"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_0_proactiveEvent_1",
                ((v69 | v87 | v62) & 1) != 0)
            && (int v70 = v69 | v63,
                CFStringRef v61 = @"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_0",
                ((v70 | HIDWORD(v88)) & 1) != 0)
            && (CFStringRef v61 = @"numPreBundlesWith_workoutEvent_1_storytellingEvent_1_routineEvent_1_proactiveEvent_1",
                ((v70 | v62) & 1) != 0))
          {
            long long v46 = v86;
          }
          else
          {
LABEL_44:
            v71 = [(MOMetric *)v82 metrics];
            long long v46 = [v71 objectForKeyedSubscript:v61];

            double v72 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v46 intValue] + 1);
            double v73 = [(MOMetric *)v82 metrics];
            [v73 setObject:v72 forKeyedSubscript:v61];
          }
          uint64_t v47 = v85 + 1;
        }
        while ((id)(v85 + 1) != v83);
        id v83 = [obj countByEnumeratingWithState:&v93 objects:v98 count:16];
      }
      while (v83);
    }

    id v4 = v79;
  }
}

- (void)calculateAndSetMetricsForSemanticallyBundledEvents:(id)a3
{
  id v8 = a3;
  id v4 = [(MOMetric *)self metrics];
  [v4 setObject:&off_1002F79D0 forKeyedSubscript:@"numBundles"];

  id v5 = v8;
  if (v8)
  {
    id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
    id v7 = [(MOMetric *)self metrics];
    [v7 setObject:v6 forKeyedSubscript:@"numBundles"];

    id v5 = v8;
  }
}

- (void)getAndSetAgeGender
{
  if (objc_opt_class()
    && (+[MCProfileConnection sharedConnection],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 isHealthDataSubmissionAllowed],
        v3,
        v4))
  {
    [(MOPromptMetrics *)self setIHAState:1];
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Fetching age/biologicalSex for CoreAnalytics, with IHA permission", buf, 2u);
    }

    *(void *)buf = 0;
    long long v40 = buf;
    uint64_t v41 = 0x3032000000;
    long long v42 = __Block_byref_object_copy__39;
    long long v43 = __Block_byref_object_dispose__39;
    id v44 = 0;
    v37[0] = 0;
    v37[1] = v37;
    void v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__39;
    v37[4] = __Block_byref_object_dispose__39;
    id v38 = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = [(MOEventManager *)self->_eventManager getHealthKitManager];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __37__MOPromptMetrics_getAndSetAgeGender__block_invoke;
    v33[3] = &unk_1002CCDE8;
    id v8 = v6;
    unsigned int v34 = v8;
    uint64_t v35 = buf;
    uint64_t v36 = v37;
    [v7 fetchUserBiologicalSexWithHandler:v33];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/Analytics/MOPromptMetrics.m", 2198, "-[MOPromptMetrics getAndSetAgeGender]");
    id v32 = 0;
    BOOL v10 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v8, &v32, v9);
    id v18 = v32;
    if (!v10)
    {
      uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(MOTripAnnotationManager *)(uint64_t)v9 hometownReferenceLocations];
      }
    }
    [(MOPromptMetrics *)self setBiologicalSex:*((void *)v40 + 5)];
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    id v29 = __Block_byref_object_copy__39;
    id v30 = __Block_byref_object_dispose__39;
    id v31 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__39;
    v24[4] = __Block_byref_object_dispose__39;
    id v25 = 0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __37__MOPromptMetrics_getAndSetAgeGender__block_invoke_1906;
    v20[3] = &unk_1002CCE10;
    double v12 = dispatch_semaphore_create(0);
    uint64_t v21 = v12;
    uint64_t v22 = &v26;
    uint64_t v23 = v24;
    [v7 fetchUserAgeWithHandler:v20];
    uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/Analytics/MOPromptMetrics.m", 2215, "-[MOPromptMetrics getAndSetAgeGender]");
    id v19 = 0;
    BOOL v14 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v12, &v19, v13);
    id v15 = v19;
    if (!v14)
    {
      long long v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        [(MOTripAnnotationManager *)(uint64_t)v13 hometownReferenceLocations];
      }
    }
    [(MOPromptMetrics *)self setAge:v27[5]];

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    [(MOPromptMetrics *)self setIHAState:0];
    [(MOPromptMetrics *)self setBiologicalSex:0];
    [(MOPromptMetrics *)self setAge:0];
    long long v17 = _mo_log_facility_get_os_log(&MOLogFacilityMetric);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Not sending age/biologicalSex to CoreAnalytics, no IHA permission", buf, 2u);
    }
  }
}

void __37__MOPromptMetrics_getAndSetAgeGender__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (!a3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __37__MOPromptMetrics_getAndSetAgeGender__block_invoke_1906(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (!a3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setIHAState:(BOOL)a3
{
  id v5 = +[NSNumber numberWithBool:a3];
  unsigned int v4 = [(MOMetric *)self metrics];
  [v4 setObject:v5 forKeyedSubscript:@"IHA_State"];
}

- (void)setBiologicalSex:(id)a3
{
  if (a3)
  {
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 biologicalSex]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v4 = [(MOMetric *)self metrics];
    [v4 setObject:v5 forKeyedSubscript:@"BiologicalSex"];
  }
}

- (void)setAge:(id)a3
{
  if (a3)
  {
    id v5 = [a3 copy];
    unsigned int v4 = [(MOMetric *)self metrics];
    [v4 setObject:v5 forKeyedSubscript:@"Age"];
  }
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (MOEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)initWithStartDate:(uint64_t)a3 endDate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithStartDate:(uint64_t)a3 endDate:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithStartDate:(uint64_t)a3 endDate:(uint64_t)a4 EventManager:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end