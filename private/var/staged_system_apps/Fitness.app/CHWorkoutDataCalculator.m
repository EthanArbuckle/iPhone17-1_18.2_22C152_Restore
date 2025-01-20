@interface CHWorkoutDataCalculator
- (BOOL)_activeDateIntervals:(id)a3 containsDate:(id)a4;
- (BOOL)_workoutSupportsDistanceAndPace:(id)a3;
- (BOOL)shouldUseFakeSegmentMarkers;
- (CHWorkoutDataCalculator)initWithHealthStore:(id)a3 unitManager:(id)a4;
- (FIUIUnitManager)unitManager;
- (HKHealthStore)healthStore;
- (HKQueryAnchor)lastEffortAnchor;
- (HKWorkoutEffortRelationshipQuery)effortObserverQuery;
- (NSCache)cache;
- (double)_activeWorkoutElapsedTimeFromDate:(id)a3 toDate:(id)a4 forWorkout:(id)a5 workoutActivity:(id)a6;
- (id)_activeDateIntervalsForWorkout:(id)a3 during:(id)a4;
- (id)_activeDateIntervalsForWorkout:(id)a3 workoutActivity:(id)a4;
- (id)_activeDateIntervalsForWorkoutActivity:(id)a3 during:(id)a4;
- (id)_averageHeartRateQuantityFromWorkout:(id)a3 workoutActivity:(id)a4;
- (id)_getDistanceAchievedDateForInterval:(id)a3 fromDistanceSamples:(id)a4 withDistanceTarget:(id)a5;
- (id)_getDistanceSamplesForWorkout:(id)a3;
- (id)_predicateForActiveDateIntervals:(id)a3;
- (id)_predicateForObjectsFromWorkout:(id)a3 withinWorkoutActivity:(id)a4;
- (id)_predicateForWorkout:(id)a3 during:(id)a4;
- (id)_queue_downhillRunsForWorkout:(id)a3 error:(id *)a4;
- (id)_queue_intervalsForWorkout:(id)a3 error:(id *)a4;
- (id)_queue_openWaterSwimDistanceByStrokeStyleForWorkout:(id)a3 workoutActivity:(id)a4 error:(id *)a5;
- (id)_queue_segmentsForWorkout:(id)a3 markerEvents:(id)a4 error:(id *)a5;
- (id)_queue_swimDistanceByStrokeStyleForWorkout:(id)a3 workoutActivity:(id)a4 error:(id *)a5;
- (id)_queue_swimmingSetsForWorkout:(id)a3 workoutActivity:(id)a4 error:(id *)a5;
- (id)_queue_swimmingSplitsForWorkout:(id)a3 workoutActivity:(id)a4 error:(id *)a5;
- (id)_queue_trackLapsForWorkout:(id)a3 lapEvents:(id)a4 error:(id *)a5;
- (id)_swimmingSplitsForWorkout:(id)a3 workoutActivity:(id)a4 distanceSamples:(id)a5 strokeSamples:(id)a6 forDelimeterUnit:(id)a7 splitDelimiter:(id)a8;
- (id)_testMarkersForWorkout:(id)a3;
- (id)_testTrackLapsForWorkout:(id)a3;
- (id)_uuidForWorkout:(id)a3 workoutActivity:(id)a4;
- (id)averageHeartRateForWorkout:(id)a3 workoutActivity:(id)a4;
- (id)cacheContainerForWorkout:(id)a3 workoutActivity:(id)a4;
- (id)cachedDownhillRunsForWorkout:(id)a3 workoutActivity:(id)a4;
- (id)cachedEffortForWorkout:(id)a3 workoutActivity:(id)a4;
- (id)cachedEffortSampleCollectionForWorkout:(id)a3 workoutActivity:(id)a4;
- (int64_t)_queue_strokeStyleForLaps:(id)a3;
- (void)_fetchHeartRateDataForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)_handleUpdatedRelationships:(id)a3 withAnchor:(id)a4;
- (void)_seriesSamplesForType:(id)a3 workout:(id)a4 workoutActivity:(id)a5 completion:(id)a6;
- (void)_setDistanceSamples:(id)a3 forWorkout:(id)a4;
- (void)_setStrokeSamples:(id)a3 forWorkout:(id)a4;
- (void)_updateSplits:(id)a3 withDistance:(double)a4 duration:(double)a5 strokeCount:(int64_t)a6 splitDelimiterInUserUnit:(double)a7;
- (void)averageCadenceForWorkout:(id)a3 during:(id)a4 completion:(id)a5;
- (void)averageHeartRateForWorkout:(id)a3 during:(id)a4 completion:(id)a5;
- (void)averagePowerForWorkout:(id)a3 during:(id)a4 completion:(id)a5;
- (void)cadenceSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)customSplitsForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)cyclingSpeedSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)distanceSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)downhillRunsForWorkout:(id)a3 completion:(id)a4;
- (void)effortForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)groundContactTimeSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)heartRateDataForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)intervalsForWorkout:(id)a3 completion:(id)a4;
- (void)openWaterSwimDistanceByStrokeStyleForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)paceSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)powerSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)saveContainerToCache:(id)a3 forWorkout:(id)a4 workoutActivity:(id)a5;
- (void)segmentsForWorkout:(id)a3 completion:(id)a4;
- (void)setCache:(id)a3;
- (void)setEffortObserverQuery:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setLastEffortAnchor:(id)a3;
- (void)setShouldUseFakeSegmentMarkers:(BOOL)a3;
- (void)setUnitManager:(id)a3;
- (void)splitsForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)strideLengthSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)strokeSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)swimDistanceByStrokeStyleForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)swimmingPacePerHundredForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)swimmingSetsForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)swimmingSplitsForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
- (void)totalDistanceForWorkout:(id)a3 workoutActivity:(id)a4 atDate:(id)a5 completion:(id)a6;
- (void)trackLapsForWorkout:(id)a3 completion:(id)a4;
- (void)verticalOscillationSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5;
@end

@implementation CHWorkoutDataCalculator

- (void)setShouldUseFakeSegmentMarkers:(BOOL)a3
{
  self->_shouldUseFakeSegmentMarkers = a3;
}

- (CHWorkoutDataCalculator)initWithHealthStore:(id)a3 unitManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHWorkoutDataCalculator;
  v9 = [(CHWorkoutDataCalculator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    objc_storeStrong((id *)&v10->_unitManager, a4);
    v11 = (NSCache *)objc_alloc_init((Class)NSCache);
    cache = v10->_cache;
    v10->_cache = v11;

    [(NSCache *)v10->_cache setEvictsObjectsWithDiscardedContent:0];
    [(NSCache *)v10->_cache setCountLimit:100];
  }

  return v10;
}

- (void)dealloc
{
  if (self->_effortObserverQuery)
  {
    _HKInitializeLogging();
    v3 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Workout Data Calculator] dealloc Stopping Workout Effort Relationship Query", buf, 2u);
    }
    [(HKHealthStore *)self->_healthStore stopQuery:self->_effortObserverQuery];
  }
  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutDataCalculator;
  [(CHWorkoutDataCalculator *)&v4 dealloc];
}

- (id)cacheContainerForWorkout:(id)a3 workoutActivity:(id)a4
{
  v5 = [(CHWorkoutDataCalculator *)self _uuidForWorkout:a3 workoutActivity:a4];
  v6 = [(CHWorkoutDataCalculator *)self cache];
  id v7 = [v6 objectForKey:v5];

  if (!v7)
  {
    id v7 = objc_alloc_init(CHWorkoutCacheContainer);
    id v8 = [(CHWorkoutDataCalculator *)self cache];
    [v8 setObject:v7 forKey:v5];
  }

  return v7;
}

- (void)saveContainerToCache:(id)a3 forWorkout:(id)a4 workoutActivity:(id)a5
{
  id v8 = a3;
  id v10 = [(CHWorkoutDataCalculator *)self _uuidForWorkout:a4 workoutActivity:a5];
  v9 = [(CHWorkoutDataCalculator *)self cache];
  [v9 setObject:v8 forKey:v10];
}

- (id)averageHeartRateForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v6 workoutActivity:v7];
  v9 = [v8 averageHeartRate];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    v11 = [(CHWorkoutDataCalculator *)self _averageHeartRateQuantityFromWorkout:v6 workoutActivity:v7];
    if (v11)
    {
      v12 = +[HKUnit _countPerMinuteUnit];
      [v11 doubleValueForUnit:v12];
      +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

- (void)heartRateDataForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void *, void *, void))a5;
  v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  v12 = [v11 heartRateReadings];

  if (v12)
  {
    v13 = [v11 heartRateReadings];
    objc_super v14 = [v11 recoveryHeartRateReadings];
    v15 = [v11 averageHeartRate];
    v10[2](v10, v13, v14, v15, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_10010D870;
    v22 = &unk_1008AC428;
    id v23 = v11;
    objc_copyWeak(&v27, &location);
    id v16 = v8;
    id v24 = v16;
    id v17 = v9;
    id v25 = v17;
    v26 = v10;
    v18 = objc_retainBlock(&v19);
    -[CHWorkoutDataCalculator _fetchHeartRateDataForWorkout:workoutActivity:completion:](self, "_fetchHeartRateDataForWorkout:workoutActivity:completion:", v16, v17, v18, v19, v20, v21, v22);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

- (id)_averageHeartRateQuantityFromWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
    id v7 = [v5 statisticsForType:v6];
    id v8 = [v7 averageQuantity];
  }
  else
  {
    id v6 = [a3 metadata];
    id v8 = [v6 objectForKeyedSubscript:NLWorkoutMetadataKeyAverageHeartRate];
  }

  return v8;
}

- (void)_fetchHeartRateDataForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v31 = a5;
  id v10 = dispatch_group_create();
  v33 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
  v11 = [(CHWorkoutDataCalculator *)self _activeDateIntervalsForWorkout:v8 workoutActivity:v9];
  v12 = [(CHWorkoutDataCalculator *)self _averageHeartRateQuantityFromWorkout:v8 workoutActivity:v9];
  v32 = [(CHWorkoutDataCalculator *)self _predicateForActiveDateIntervals:v11];
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = sub_10010DF48;
  v60[4] = sub_10010DF58;
  id v61 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = sub_10010DF48;
  v58[4] = sub_10010DF58;
  id v59 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = sub_10010DF48;
  v56[4] = sub_10010DF58;
  id v57 = 0;
  dispatch_group_enter(v10);
  id v13 = objc_alloc((Class)HKQuantitySeriesSampleQuery);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10010DF60;
  v47[3] = &unk_1008AC450;
  v47[4] = self;
  id v14 = v11;
  id v48 = v14;
  v53 = v58;
  v54 = v60;
  id v15 = v12;
  id v49 = v15;
  v55 = v56;
  id v16 = v9;
  id v50 = v16;
  id v17 = v8;
  id v51 = v17;
  v18 = v10;
  v52 = v18;
  id v19 = [v13 initWithQuantityType:v33 predicate:v32 quantityHandler:v47];
  uint64_t v20 = [(CHWorkoutDataCalculator *)self healthStore];
  [v20 executeQuery:v19];

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = sub_10010DF48;
  v45[4] = sub_10010DF58;
  id v46 = 0;
  if (!v16
    || ([v17 workoutActivities],
        v21 = objc_claimAutoreleasedReturnValue(),
        [v21 lastObject],
        v22 = objc_claimAutoreleasedReturnValue(),
        unsigned int v23 = [v22 isEqual:v16],
        v22,
        v21,
        v23))
  {
    id v24 = +[_HKHeartRateRecoveryQueryUtility recoveryDateIntervalWithWorkout:](_HKHeartRateRecoveryQueryUtility, "recoveryDateIntervalWithWorkout:", v17, v31);
    id v25 = +[_HKHeartRateRecoveryQueryUtility predicateForWorkoutRecoveryTimeWithWorkout:v17];
    dispatch_group_enter(v18);
    id v26 = objc_alloc((Class)HKQuantitySeriesSampleQuery);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10010E304;
    v40[3] = &unk_1008AC478;
    id v27 = v24;
    id v41 = v27;
    v43 = v45;
    v44 = v60;
    v42 = v18;
    id v28 = [v26 initWithQuantityType:v33 predicate:v25 quantityHandler:v40];
    v29 = [(CHWorkoutDataCalculator *)self healthStore];
    [v29 executeQuery:v28];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010E4A0;
  block[3] = &unk_1008AC4A0;
  id v35 = v31;
  v36 = v58;
  v37 = v45;
  v38 = v56;
  v39 = v60;
  id v30 = v31;
  dispatch_group_notify(v18, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v56, 8);

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v60, 8);
}

- (void)distanceSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  v12 = [v11 distanceSamples];

  if (v12)
  {
    id v13 = [v11 distanceSamples];
    v10[2](v10, v13, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10010E6FC;
    v19[3] = &unk_1008AC4C8;
    id v20 = v11;
    objc_copyWeak(&v24, &location);
    id v14 = v8;
    id v21 = v14;
    id v15 = v9;
    id v22 = v15;
    id v16 = v10;
    id v23 = v16;
    id v17 = objc_retainBlock(v19);
    if (v15)
    {
      [v15 distanceType];
    }
    else
    {
      [v14 workoutActivityType];
      _HKWorkoutDistanceTypeForActivityType();
    v18 = };
    if (v18) {
      [(CHWorkoutDataCalculator *)self _seriesSamplesForType:v18 workout:v14 workoutActivity:v15 completion:v17];
    }
    else {
      v16[2](v16, 0, 0);
    }

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

- (void)totalDistanceForWorkout:(id)a3 workoutActivity:(id)a4 atDate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, void))a6;
  id v14 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v10 workoutActivity:v11];
  id v15 = [v14 totalDistance];

  if (!v15)
  {
    id v16 = objc_alloc_init((Class)NSMutableDictionary);
    [v14 setTotalDistance:v16];
  }
  id v17 = [v14 totalDistance];
  v18 = [v17 objectForKeyedSubscript:v12];

  if (v18)
  {
    v13[2](v13, v18, 0);
  }
  else
  {
    objc_initWeak(location, self);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10010EB30;
    v36[3] = &unk_1008AC4F0;
    id v37 = v14;
    id v19 = v12;
    id v38 = v19;
    objc_copyWeak(&v42, location);
    id v30 = v10;
    id v32 = v10;
    id v39 = v32;
    id v20 = v11;
    id v40 = v20;
    id v41 = v13;
    id v31 = objc_retainBlock(v36);
    id v21 = objc_alloc((Class)NSDateInterval);
    if (v20)
    {
      id v22 = [v20 startDate];
      id v23 = [v21 initWithStartDate:v22 endDate:v19];

      id v24 = [(CHWorkoutDataCalculator *)self _activeDateIntervalsForWorkoutActivity:v20 during:v23];
      id v25 = [v20 workoutConfiguration];
      [v25 activityType];
      v29 = _HKWorkoutDistanceTypeForActivityType();
    }
    else
    {
      id v26 = [v32 startDate];
      id v23 = [v21 initWithStartDate:v26 endDate:v19];

      id v24 = [(CHWorkoutDataCalculator *)self _activeDateIntervalsForWorkout:v32 during:v23];
      [v32 workoutActivityType];
      v29 = _HKWorkoutDistanceTypeForActivityType();
    }

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10010EBE8;
    v33[3] = &unk_1008AC518;
    id v27 = v24;
    id v34 = v27;
    id v28 = v31;
    id v35 = v28;
    [(CHWorkoutDataCalculator *)self distanceSamplesForWorkout:v32 workoutActivity:v20 completion:v33];

    objc_destroyWeak(&v42);
    objc_destroyWeak(location);
    id v10 = v30;
  }
}

- (void)_seriesSamplesForType:(id)a3 workout:(id)a4 workoutActivity:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_10010DF48;
  v30[4] = sub_10010DF58;
  id v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_10010DF48;
  v28[4] = sub_10010DF58;
  id v29 = 0;
  id v14 = [(CHWorkoutDataCalculator *)self _predicateForObjectsFromWorkout:v11 withinWorkoutActivity:v12];
  id v15 = objc_alloc((Class)HKQuantitySeriesSampleQuery);
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  id v22 = sub_10010F0F8;
  id v23 = &unk_1008AC540;
  id v26 = v28;
  id v16 = v10;
  id v24 = v16;
  id v27 = v30;
  id v17 = v13;
  id v25 = v17;
  id v18 = [v15 initWithQuantityType:v16 predicate:v14 quantityHandler:&v20];
  id v19 = [(CHWorkoutDataCalculator *)self healthStore];
  [v19 executeQuery:v18];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
}

- (void)cadenceSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  id v12 = [v11 cadenceSamples];

  if (v12)
  {
    id v13 = [v11 cadenceSamples];
    v10[2](v10, v13, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10010F594;
    v22[3] = &unk_1008AC4C8;
    id v23 = v11;
    id v20 = &v27;
    objc_copyWeak(&v27, &location);
    id v14 = v8;
    id v24 = v14;
    id v15 = v9;
    id v25 = v15;
    id v26 = v10;
    uint64_t v21 = objc_retainBlock(v22);
    id v16 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    if ([v14 workoutActivityType] == (id)13
      || (objc_msgSend(v15, "workoutConfiguration", &v27),
          id v17 = objc_claimAutoreleasedReturnValue(),
          id v18 = [v17 activityType],
          v17,
          v18 == (id)13))
    {
      uint64_t v19 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierCyclingCadence, v20);

      id v16 = (void *)v19;
    }
    [(CHWorkoutDataCalculator *)self _seriesSamplesForType:v16 workout:v14 workoutActivity:v15 completion:v21];

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
}

- (void)strokeSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  id v12 = [v11 strokeSamples];

  if (v12)
  {
    id v13 = [v11 strokeSamples];
    v10[2](v10, v13, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10010F9E8;
    v27[3] = &unk_1008AC4C8;
    id v28 = v11;
    objc_copyWeak(&v32, &location);
    id v14 = v8;
    id v29 = v14;
    id v15 = v9;
    id v30 = v15;
    id v31 = v10;
    id v16 = objc_retainBlock(v27);
    id v24 = [(CHWorkoutDataCalculator *)self _predicateForObjectsFromWorkout:v14 withinWorkoutActivity:v15];
    id v17 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierSwimmingStrokeCount];
    id v18 = +[NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:1];
    id v19 = objc_alloc((Class)HKSampleQuery);
    id v34 = v18;
    id v20 = +[NSArray arrayWithObjects:&v34 count:1];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10010FA8C;
    v25[3] = &unk_1008ABC38;
    uint64_t v21 = v16;
    id v26 = v21;
    id v22 = [v19 initWithSampleType:v17 predicate:v24 limit:0 sortDescriptors:v20 resultsHandler:v25];

    id v23 = [(CHWorkoutDataCalculator *)self healthStore];
    [v23 executeQuery:v22];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
}

- (void)paceSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  id v12 = [v11 paceSamples];

  if (v12)
  {
    id v13 = [v11 paceSamples];
    v10[2](v10, v13, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10010FE60;
    v22[3] = &unk_1008AC4C8;
    id v23 = v11;
    objc_copyWeak(&v27, &location);
    id v14 = v8;
    id v24 = v14;
    id v15 = v9;
    id v25 = v15;
    id v16 = v10;
    id v26 = v16;
    uint64_t v21 = objc_retainBlock(v22);
    if (v15)
    {
      id v17 = [v15 workoutConfiguration];
      [v17 activityType];
    }
    else
    {
      [v14 workoutActivityType];
    }
    id v18 = _HKWorkoutSpeedTypeForActivityType();
    if (v18)
    {
      [(CHWorkoutDataCalculator *)self _seriesSamplesForType:v18 workout:v14 workoutActivity:v15 completion:v21];
    }
    else
    {
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      CFStringRef v30 = @"Unable to fetch pace samples because speed HKQuantityType is nil";
      id v19 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      id v20 = +[NSError errorWithDomain:@"com.apple.Fitness" code:44 userInfo:v19];
      ((void (**)(id, void *, void *))v16)[2](v16, &__NSArray0__struct, v20);
    }
    objc_destroyWeak(&v27);

    objc_destroyWeak(&location);
  }
}

- (void)powerSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  id v12 = [v11 powerSamples];

  if (v12)
  {
    id v13 = [v11 powerSamples];
    v10[2](v10, v13, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100110160;
    v23[3] = &unk_1008AC4C8;
    id v24 = v11;
    objc_copyWeak(&v28, &location);
    id v14 = v8;
    id v25 = v14;
    id v15 = v9;
    id v26 = v15;
    id v27 = v10;
    uint64_t v21 = objc_retainBlock(v23);
    id v16 = HKQuantityTypeIdentifierRunningPower;
    if ([v14 workoutActivityType] == (id)13
      || ([v15 workoutConfiguration],
          id v17 = objc_claimAutoreleasedReturnValue(),
          id v18 = [v17 activityType],
          v17,
          v18 == (id)13))
    {
      id v19 = HKQuantityTypeIdentifierCyclingPower;

      id v16 = v19;
    }
    id v20 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", v16, v21);
    [(CHWorkoutDataCalculator *)self _seriesSamplesForType:v20 workout:v14 workoutActivity:v15 completion:v22];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

- (void)cyclingSpeedSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  id v12 = [v11 cyclingSpeedSamples];

  if (v12)
  {
    id v13 = [v11 cyclingSpeedSamples];
    v10[2](v10, v13, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100110408;
    v19[3] = &unk_1008AC4C8;
    id v20 = v11;
    objc_copyWeak(&v24, &location);
    id v14 = v8;
    id v21 = v14;
    id v15 = v9;
    id v22 = v15;
    id v23 = v10;
    id v16 = objc_retainBlock(v19);
    id v17 = HKQuantityTypeIdentifierCyclingSpeed;
    id v18 = +[HKQuantityType quantityTypeForIdentifier:v17];
    [(CHWorkoutDataCalculator *)self _seriesSamplesForType:v18 workout:v14 workoutActivity:v15 completion:v16];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

- (void)strideLengthSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  id v12 = [v11 strideLengthSamples];

  if (v12)
  {
    id v13 = [v11 strideLengthSamples];
    v10[2](v10, v13, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v20 = sub_1001106A0;
    id v21 = &unk_1008AC4C8;
    id v22 = v11;
    objc_copyWeak(&v26, &location);
    id v14 = v8;
    id v23 = v14;
    id v15 = v9;
    id v24 = v15;
    id v25 = v10;
    id v16 = objc_retainBlock(&v18);
    id v17 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierRunningStrideLength, v18, v19, v20, v21);
    [(CHWorkoutDataCalculator *)self _seriesSamplesForType:v17 workout:v14 workoutActivity:v15 completion:v16];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

- (void)verticalOscillationSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  id v12 = [v11 verticalOscillationSamples];

  if (v12)
  {
    id v13 = [v11 verticalOscillationSamples];
    v10[2](v10, v13, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v20 = sub_100110938;
    id v21 = &unk_1008AC4C8;
    id v22 = v11;
    objc_copyWeak(&v26, &location);
    id v14 = v8;
    id v23 = v14;
    id v15 = v9;
    id v24 = v15;
    id v25 = v10;
    id v16 = objc_retainBlock(&v18);
    id v17 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierRunningVerticalOscillation, v18, v19, v20, v21);
    [(CHWorkoutDataCalculator *)self _seriesSamplesForType:v17 workout:v14 workoutActivity:v15 completion:v16];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

- (void)groundContactTimeSamplesForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  id v12 = [v11 groundContactTimeSamples];

  if (v12)
  {
    id v13 = [v11 groundContactTimeSamples];
    v10[2](v10, v13, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v20 = sub_100110BD0;
    id v21 = &unk_1008AC4C8;
    id v22 = v11;
    objc_copyWeak(&v26, &location);
    id v14 = v8;
    id v23 = v14;
    id v15 = v9;
    id v24 = v15;
    id v25 = v10;
    id v16 = objc_retainBlock(&v18);
    id v17 = +[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierRunningGroundContactTime, v18, v19, v20, v21);
    [(CHWorkoutDataCalculator *)self _seriesSamplesForType:v17 workout:v14 workoutActivity:v15 completion:v16];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

- (void)splitsForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(CHWorkoutDataCalculator *)self unitManager];
  if (v9) {
    id v12 = v9;
  }
  else {
    id v12 = v8;
  }
  id v13 = [v12 fiui_activityType];
  id v14 = [v11 userDistanceHKUnitForDistanceType:FIUIDistanceTypeForActivityType()];

  id v15 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  uint64_t v16 = [v15 splits];
  if (v16
    && (id v17 = (void *)v16,
        [v15 userPreferredDistanceUnit],
        id v18 = objc_claimAutoreleasedReturnValue(),
        unsigned int v19 = [v18 isEqual:v14],
        v18,
        v17,
        v19))
  {
    id v20 = [v15 splits];
    v10[2](v10, v20, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100110F44;
    v29[3] = &unk_1008AC4C8;
    id v30 = v15;
    objc_copyWeak(&v34, &location);
    id v21 = v8;
    id v31 = v21;
    id v22 = v9;
    id v32 = v22;
    v33 = v10;
    id v23 = objc_retainBlock(v29);
    if (v9) {
      [v22 fiui_splitsForUserPreferredDistanceUnit:v14];
    }
    else {
      [v21 fiui_workoutSplitsForUserPreferredDistanceUnit:v14];
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100110FE8;
    v26[3] = &unk_1008AC5A8;
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    id v28 = v23;
    id v24 = v27;
    id v25 = v23;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v26);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
}

- (void)customSplitsForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  id v12 = [v11 customSplits];

  if (v12)
  {
    id v13 = [v11 customSplits];
    v10[2](v10, v13, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10011124C;
    v22[3] = &unk_1008AC4C8;
    id v23 = v11;
    objc_copyWeak(&v27, &location);
    id v14 = v8;
    id v24 = v14;
    id v15 = v9;
    id v25 = v15;
    id v26 = v10;
    uint64_t v16 = objc_retainBlock(v22);
    if (v15) {
      [v15 fiui_customSplits];
    }
    else {
      [v14 fiui_workoutCustomSplits];
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001112F0;
    v19[3] = &unk_1008AC5A8;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = v16;
    id v17 = v20;
    id v18 = v16;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

- (void)segmentsForWorkout:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v6 workoutActivity:0];
  id v9 = [v8 segments];

  if (v9)
  {
    id v10 = [v8 segments];
    v7[2](v7, v10, 0);
  }
  else
  {
    objc_initWeak(location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001115D8;
    v22[3] = &unk_1008AC5D0;
    id v23 = v8;
    objc_copyWeak(&v26, location);
    id v11 = v6;
    id v24 = v11;
    id v25 = v7;
    id v12 = objc_retainBlock(v22);
    id v13 = [v11 workoutEvents];
    id v14 = +[NSPredicate predicateWithBlock:&stru_1008AC5F0];
    id v15 = [v13 filteredArrayUsingPredicate:v14];

    if ([(CHWorkoutDataCalculator *)self shouldUseFakeSegmentMarkers])
    {
      uint64_t v16 = [(CHWorkoutDataCalculator *)self _testMarkersForWorkout:v11];

      id v15 = (void *)v16;
    }
    if ([v15 count])
    {
      id v17 = dispatch_get_global_queue(25, 0);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1001116F8;
      v18[3] = &unk_1008AC618;
      v18[4] = self;
      id v19 = v11;
      id v20 = v15;
      id v21 = v12;
      dispatch_async(v17, v18);
    }
    else
    {
      ((void (*)(void *, void *, void))v12[2])(v12, &__NSArray0__struct, 0);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(location);
  }
}

- (void)downhillRunsForWorkout:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v6 workoutActivity:0];
  id v9 = [v8 downhillRuns];

  if (v9)
  {
    id v10 = [v8 downhillRuns];
    v7[2](v7, v10, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001119F8;
    v18[3] = &unk_1008AC5D0;
    id v19 = v8;
    objc_copyWeak(&v22, &location);
    id v11 = v6;
    id v20 = v11;
    id v21 = v7;
    id v12 = objc_retainBlock(v18);
    id v13 = dispatch_get_global_queue(25, 0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100111A84;
    v15[3] = &unk_1008AC350;
    v15[4] = self;
    id v16 = v11;
    id v17 = v12;
    id v14 = v12;
    dispatch_async(v13, v15);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)intervalsForWorkout:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v6 workoutActivity:0];
  id v9 = [v8 intervals];

  if (v9)
  {
    id v10 = [v8 intervals];
    v7[2](v7, v10, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100111D84;
    v18[3] = &unk_1008AC5D0;
    id v19 = v8;
    objc_copyWeak(&v22, &location);
    id v11 = v6;
    id v20 = v11;
    id v21 = v7;
    id v12 = objc_retainBlock(v18);
    id v13 = dispatch_get_global_queue(25, 0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100111E10;
    v15[3] = &unk_1008AC350;
    v15[4] = self;
    id v16 = v11;
    id v17 = v12;
    id v14 = v12;
    dispatch_async(v13, v15);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)trackLapsForWorkout:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v6 workoutActivity:0];
  id v9 = [v8 trackLaps];

  if (v9)
  {
    id v10 = [v8 trackLaps];
    v7[2](v7, v10, 0);
  }
  else
  {
    objc_initWeak(location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100112214;
    v22[3] = &unk_1008AC5D0;
    id v23 = v8;
    objc_copyWeak(&v26, location);
    id v11 = v6;
    id v24 = v11;
    id v25 = v7;
    id v12 = objc_retainBlock(v22);
    if ([v11 supportsTrackWorkout])
    {
      id v13 = [v11 workoutEvents];
      id v14 = +[NSPredicate predicateWithBlock:&stru_1008AC638];
      id v15 = [v13 filteredArrayUsingPredicate:v14];

      if ([(CHWorkoutDataCalculator *)self shouldUseFakeSegmentMarkers])
      {
        uint64_t v16 = [(CHWorkoutDataCalculator *)self _testTrackLapsForWorkout:v11];

        id v15 = (void *)v16;
      }
      if ([v15 count])
      {
        id v17 = dispatch_get_global_queue(25, 0);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1001122C4;
        v18[3] = &unk_1008AC618;
        void v18[4] = self;
        id v19 = v11;
        id v20 = v15;
        id v21 = v12;
        dispatch_async(v17, v18);
      }
      else
      {
        ((void (*)(void *, void *, void))v12[2])(v12, &__NSArray0__struct, 0);
      }
    }
    else
    {
      ((void (*)(void *, void *, void))v12[2])(v12, &__NSArray0__struct, 0);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(location);
  }
}

- (void)swimDistanceByStrokeStyleForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  id v12 = [v11 swimDistanceByStrokeStyle];

  if (v12)
  {
    id v13 = [v11 swimDistanceByStrokeStyle];
    v10[2](v10, v13, 0);
  }
  else
  {
    objc_initWeak(location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100112600;
    v23[3] = &unk_1008AC660;
    id v24 = v11;
    objc_copyWeak(&v28, location);
    id v14 = v8;
    id v25 = v14;
    id v15 = v9;
    id v26 = v15;
    id v27 = v10;
    uint64_t v16 = objc_retainBlock(v23);
    id v17 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001126A4;
    block[3] = &unk_1008AC618;
    void block[4] = self;
    id v20 = v14;
    id v21 = v15;
    id v22 = v16;
    id v18 = v16;
    dispatch_async(v17, block);

    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }
}

- (void)openWaterSwimDistanceByStrokeStyleForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  id v12 = [v11 swimDistanceByStrokeStyle];

  if (v12)
  {
    id v13 = [v11 swimDistanceByStrokeStyle];
    v10[2](v10, v13, 0);
  }
  else
  {
    objc_initWeak(location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001129E0;
    v23[3] = &unk_1008AC660;
    id v24 = v11;
    objc_copyWeak(&v28, location);
    id v14 = v8;
    id v25 = v14;
    id v15 = v9;
    id v26 = v15;
    id v27 = v10;
    uint64_t v16 = objc_retainBlock(v23);
    id v17 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100112A84;
    block[3] = &unk_1008AC618;
    void block[4] = self;
    id v20 = v14;
    id v21 = v15;
    id v22 = v16;
    id v18 = v16;
    dispatch_async(v17, block);

    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }
}

- (void)swimmingSetsForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  id v12 = [v11 swimmingSets];

  if (v12)
  {
    id v13 = [v11 swimmingSets];
    v10[2](v10, v13, 0);
  }
  else
  {
    objc_initWeak(location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100112DC0;
    v23[3] = &unk_1008AC4C8;
    id v24 = v11;
    objc_copyWeak(&v28, location);
    id v14 = v8;
    id v25 = v14;
    id v15 = v9;
    id v26 = v15;
    id v27 = v10;
    uint64_t v16 = objc_retainBlock(v23);
    id v17 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100112E64;
    block[3] = &unk_1008AC618;
    void block[4] = self;
    id v20 = v14;
    id v21 = v15;
    id v22 = v16;
    id v18 = v16;
    dispatch_async(v17, block);

    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }
}

- (void)swimmingSplitsForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
  id v12 = [v11 swimmingSplits];

  if (v12)
  {
    id v13 = [v11 swimmingSplits];
    v10[2](v10, v13, 0);
  }
  else
  {
    objc_initWeak(location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001131A0;
    v23[3] = &unk_1008AC660;
    id v24 = v11;
    objc_copyWeak(&v28, location);
    id v14 = v8;
    id v25 = v14;
    id v15 = v9;
    id v26 = v15;
    id v27 = v10;
    uint64_t v16 = objc_retainBlock(v23);
    id v17 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100113244;
    block[3] = &unk_1008AC618;
    void block[4] = self;
    id v20 = v14;
    id v21 = v15;
    id v22 = v16;
    id v18 = v16;
    dispatch_async(v17, block);

    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }
}

- (void)effortForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = +[WOEffortBridges demoExertionForWorkout:v8];
  if (v11)
  {
    v10[2](v10, v11);
  }
  else
  {
    objc_initWeak(&location, self);
    if (!self->_effortObserverQuery)
    {
      _HKInitializeLogging();
      id v12 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Workout Data Calculator] Kicking off Workout Effort Relationship Query", buf, 2u);
      }
      id v13 = objc_alloc((Class)HKWorkoutEffortRelationshipQuery);
      id v14 = +[HKQueryAnchor latestAnchor];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10011389C;
      v41[3] = &unk_1008AC6B0;
      objc_copyWeak(&v42, &location);
      id v15 = (HKWorkoutEffortRelationshipQuery *)[v13 initWithPredicate:0 anchor:v14 options:0 resultsHandler:v41];
      effortObserverQuery = self->_effortObserverQuery;
      self->_effortObserverQuery = v15;

      id v17 = [(CHWorkoutDataCalculator *)self healthStore];
      [v17 executeQuery:self->_effortObserverQuery];

      objc_destroyWeak(&v42);
    }
    if (v9
      && ([v9 workoutConfiguration],
          id v18 = objc_claimAutoreleasedReturnValue(),
          BOOL v19 = [v18 activityType] == (id)83,
          v18,
          v19))
    {
      v10[2](v10, 0);
    }
    else
    {
      v33 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v8 workoutActivity:v9];
      id v20 = [v33 effortSampleCollection];
      id v21 = [v20 preferredQuantity];

      if (v21)
      {
        _HKInitializeLogging();
        id v22 = HKLogWorkouts;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = [v8 UUID];
          id v24 = [v9 UUID];
          *(_DWORD *)buf = 138412802;
          v45 = v23;
          __int16 v46 = 2112;
          v47 = v24;
          __int16 v48 = 2112;
          id v49 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Effort cache hit for %@ (%@) with quantity %@", buf, 0x20u);
        }
        v10[2](v10, v21);
      }
      else
      {
        _HKInitializeLogging();
        id v25 = HKLogWorkouts;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [v8 UUID];
          id v27 = [v9 UUID];
          *(_DWORD *)buf = 138412546;
          v45 = v26;
          __int16 v46 = 2112;
          v47 = v27;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Effort cache miss for %@ (%@), fetching from database.", buf, 0x16u);
        }
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100113AD8;
        v36[3] = &unk_1008AC6D8;
        objc_copyWeak(&v40, &location);
        id v28 = v8;
        id v37 = v28;
        id v29 = v9;
        id v38 = v29;
        id v39 = v10;
        id v30 = objc_retainBlock(v36);
        id v31 = [(CHWorkoutDataCalculator *)self healthStore];
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_100113BBC;
        v34[3] = &unk_1008AC700;
        id v32 = v30;
        id v35 = v32;
        +[WOEffortBridges fetchExertionForWorkout:v28 workoutActivity:v29 healthStore:v31 completion:v34];

        objc_destroyWeak(&v40);
      }
    }
    objc_destroyWeak(&location);
  }
}

- (void)_handleUpdatedRelationships:(id)a3 withAnchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v8 = [(CHWorkoutDataCalculator *)self lastEffortAnchor];
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    id v29 = v7;
    [(CHWorkoutDataCalculator *)self setLastEffortAnchor:v7];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v30 = v6;
    id obj = v6;
    id v10 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v32 = *(void *)v34;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v34 != v32) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v14 = [v13 workout];
          id v15 = [v13 activity];
          uint64_t v16 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v14 workoutActivity:v15];

          id v17 = [CHEffortSampleCollection alloc];
          id v18 = [v13 samples];
          BOOL v19 = [(CHEffortSampleCollection *)v17 initWithSamples:v18];

          [v16 setEffortSampleCollection:v19];
          id v20 = [v13 workout];
          id v21 = [v13 activity];
          [(CHWorkoutDataCalculator *)self saveContainerToCache:v16 forWorkout:v20 workoutActivity:v21];

          id v22 = [v13 activity];

          if (v22)
          {
            v39[0] = @"WorkoutUUID";
            id v23 = [v13 workout];
            id v24 = [v23 UUID];
            v39[1] = @"ActivityUUID";
            v40[0] = v24;
            id v25 = [v13 activity];
            id v26 = [v25 UUID];
            v40[1] = v26;
            id v27 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
          }
          else
          {
            CFStringRef v37 = @"WorkoutUUID";
            id v23 = [v13 workout];
            id v24 = [v23 UUID];
            id v38 = v24;
            id v27 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          }

          id v28 = +[NSNotificationCenter defaultCenter];
          [v28 postNotificationName:@"CHEffortChangedNotification" object:0 userInfo:v27];
        }
        id v11 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v11);
    }

    id v7 = v29;
    id v6 = v30;
  }
}

- (id)cachedDownhillRunsForWorkout:(id)a3 workoutActivity:(id)a4
{
  objc_super v4 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:a3 workoutActivity:a4];
  id v5 = [v4 downhillRuns];

  return v5;
}

- (id)cachedEffortForWorkout:(id)a3 workoutActivity:(id)a4
{
  objc_super v4 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:a3 workoutActivity:a4];
  id v5 = [v4 effortSampleCollection];
  id v6 = [v5 preferredQuantity];

  return v6;
}

- (id)cachedEffortSampleCollectionForWorkout:(id)a3 workoutActivity:(id)a4
{
  objc_super v4 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:a3 workoutActivity:a4];
  id v5 = [v4 effortSampleCollection];

  return v5;
}

- (void)averageHeartRateForWorkout:(id)a3 during:(id)a4 completion:(id)a5
{
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_1001141BC;
  id v15 = &unk_1008AC728;
  uint64_t v16 = self;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v8 = v19;
  id v9 = v18;
  id v10 = v17;
  id v11 = objc_retainBlock(&v12);
  -[CHWorkoutDataCalculator heartRateDataForWorkout:workoutActivity:completion:](self, "heartRateDataForWorkout:workoutActivity:completion:", v10, 0, v11, v12, v13, v14, v15, v16);
}

- (void)averageCadenceForWorkout:(id)a3 during:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001145B0;
  v10[3] = &unk_1008AC750;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  [(CHWorkoutDataCalculator *)v11 cadenceSamplesForWorkout:v9 workoutActivity:0 completion:v10];
}

- (void)averagePowerForWorkout:(id)a3 during:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100114A18;
  v10[3] = &unk_1008AC750;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  [(CHWorkoutDataCalculator *)v11 powerSamplesForWorkout:v9 workoutActivity:0 completion:v10];
}

- (void)swimmingPacePerHundredForWorkout:(id)a3 workoutActivity:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100114D8C;
  v9[3] = &unk_1008AC778;
  id v10 = a5;
  id v8 = v10;
  [(CHWorkoutDataCalculator *)self swimmingSplitsForWorkout:a3 workoutActivity:a4 completion:v9];
}

- (id)_queue_intervalsForWorkout:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 isIntervalWorkout])
  {
    v74 = a4;
    id v6 = objc_alloc_init((Class)NSMutableArray);
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    v85 = v5;
    id obj = [v5 workoutActivities];
    id v7 = [obj countByEnumeratingWithState:&v121 objects:v130 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v122;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v122 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v121 + 1) + 8 * i);
          id v11 = objc_alloc_init(CHWorkoutInterval);
          id v12 = [v10 startDate];
          [(CHWorkoutSegment *)v11 setStartDate:v12];

          id v13 = [v10 endDate];
          [(CHWorkoutSegment *)v11 setEndDate:v13];

          id v14 = [v10 metadata];
          id v15 = +[HKWorkout kIntervalWorkoutStepMetadataKey];
          uint64_t v16 = [v14 objectForKeyedSubscript:v15];
          [(CHWorkoutInterval *)v11 setStepKeyPath:v16];

          id v17 = [v10 metadata];
          id v18 = +[HKWorkout kIntervalWorkoutStepSuccessful];
          id v19 = [v17 objectForKeyedSubscript:v18];
          -[CHWorkoutInterval setWasSuccessful:](v11, "setWasSuccessful:", [v19 BOOLValue]);

          [v6 addObject:v11];
        }
        id v7 = [obj countByEnumeratingWithState:&v121 objects:v130 count:16];
      }
      while (v7);
    }

    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_100115A68;
    v119[3] = &unk_1008AC7A0;
    id v77 = objc_alloc_init((Class)NSMutableArray);
    id v120 = v77;
    [v85 _enumerateActiveTimePeriods:v119];
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v78 = v6;
    id v20 = [v78 countByEnumeratingWithState:&v115 objects:v129 count:16];
    if (v20)
    {
      id obja = *(id *)v116;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(id *)v116 != obja) {
            objc_enumerationMutation(v78);
          }
          id v22 = *(void **)(*((void *)&v115 + 1) + 8 * (void)j);
          id v23 = [v22 stepKeyPath:v74];
          id v24 = [v85 expectedIntervalDurationForStepKeyPath:v23];

          unsigned int v25 = [v22 wasSuccessful];
          if (v24) {
            unsigned int v26 = v25;
          }
          else {
            unsigned int v26 = 0;
          }
          if (v26 == 1)
          {
            id v27 = +[HKUnit secondUnit];
            [v24 doubleValueForUnit:v27];
            double v29 = v28;
          }
          else
          {
            id v30 = objc_alloc((Class)NSDateInterval);
            id v31 = [v22 startDate];
            uint64_t v32 = [v22 endDate];
            id v27 = [v30 initWithStartDate:v31 endDate:v32];

            long long v113 = 0u;
            long long v114 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            id v33 = v77;
            id v34 = [v33 countByEnumeratingWithState:&v111 objects:v128 count:16];
            if (v34)
            {
              uint64_t v35 = *(void *)v112;
              double v29 = 0.0;
              do
              {
                for (k = 0; k != v34; k = (char *)k + 1)
                {
                  if (*(void *)v112 != v35) {
                    objc_enumerationMutation(v33);
                  }
                  CFStringRef v37 = [v27 intersectionWithDateInterval:*(void *)(*((void *)&v111 + 1) + 8 * (void)k)];
                  [v37 duration];
                  double v39 = v38;

                  double v29 = v29 + v39;
                }
                id v34 = [v33 countByEnumeratingWithState:&v111 objects:v128 count:16];
              }
              while (v34);
            }
            else
            {
              double v29 = 0.0;
            }
          }
          [v22 setElapsedTime:v29];
        }
        id v20 = [v78 countByEnumeratingWithState:&v115 objects:v129 count:16];
      }
      while (v20);
    }

    objb = dispatch_group_create();
    uint64_t v105 = 0;
    v106 = &v105;
    uint64_t v107 = 0x3032000000;
    v108 = sub_10010DF48;
    v109 = sub_10010DF58;
    id v110 = 0;
    id v40 = v85;
    BOOL v41 = [v85 workoutActivityType] == (id)46 && [v85 fiui_swimmingLocationType] == (id)1;
    if (-[CHWorkoutDataCalculator _workoutSupportsDistanceAndPace:](self, "_workoutSupportsDistanceAndPace:", v85, v74))
    {
      BOOL v79 = v41;
      dispatch_group_enter(objb);
      id v43 = objc_alloc_init((Class)NSMutableArray);
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v44 = v78;
      id v45 = [v44 countByEnumeratingWithState:&v101 objects:v127 count:16];
      if (v45)
      {
        uint64_t v46 = *(void *)v102;
        do
        {
          for (m = 0; m != v45; m = (char *)m + 1)
          {
            if (*(void *)v102 != v46) {
              objc_enumerationMutation(v44);
            }
            __int16 v48 = *(void **)(*((void *)&v101 + 1) + 8 * (void)m);
            id v49 = objc_alloc((Class)NSDateInterval);
            id v50 = [v48 startDate];
            id v51 = [v48 endDate];
            id v52 = [v49 initWithStartDate:v50 endDate:v51];
            [v43 addObject:v52];

            v53 = [v48 stepKeyPath];
            v54 = [v85 expectedIntervalDistanceForStepKeyPath:v53];

            unsigned int v55 = [v48 wasSuccessful];
            if (v54) {
              unsigned int v56 = v55;
            }
            else {
              unsigned int v56 = 0;
            }
            if (v56 == 1) {
              [v48 setDistance:v54];
            }
          }
          id v45 = [v44 countByEnumeratingWithState:&v101 objects:v127 count:16];
        }
        while (v45);
      }

      v93[0] = _NSConcreteStackBlock;
      v93[1] = 3221225472;
      v93[2] = sub_100115AF4;
      v93[3] = &unk_1008AC7F0;
      v99 = &v105;
      id v76 = v43;
      id v94 = v76;
      id v95 = v44;
      BOOL v100 = v79;
      id v96 = v85;
      v97 = self;
      v98 = objb;
      [(CHWorkoutDataCalculator *)self distanceSamplesForWorkout:v96 workoutActivity:0 completion:v93];
    }
    else
    {
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v76 = v78;
      id v57 = [v76 countByEnumeratingWithState:&v89 objects:v126 count:16];
      if (v57)
      {
        uint64_t v80 = *(void *)v90;
        do
        {
          for (n = 0; n != v57; n = (char *)n + 1)
          {
            if (*(void *)v90 != v80) {
              objc_enumerationMutation(v76);
            }
            id v59 = *(void **)(*((void *)&v89 + 1) + 8 * (void)n);
            dispatch_group_enter(objb);
            v60 = +[HKQuery predicateForObjectsFromWorkout:v40];
            id v61 = [v59 startDate];
            v62 = [v59 endDate];
            v63 = +[HKQuery predicateForSamplesWithStartDate:v61 endDate:v62 options:1];

            v125[0] = v60;
            v125[1] = v63;
            v64 = +[NSArray arrayWithObjects:v125 count:2];
            v65 = +[NSCompoundPredicate andPredicateWithSubpredicates:v64];

            id v66 = objc_alloc((Class)HKStatisticsQuery);
            v67 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
            v86[0] = _NSConcreteStackBlock;
            v86[1] = 3221225472;
            v86[2] = sub_100115E74;
            v86[3] = &unk_1008AC818;
            v86[4] = v59;
            v88 = &v105;
            v87 = objb;
            id v68 = [v66 initWithQuantityType:v67 quantitySamplePredicate:v65 options:16 completionHandler:v86];

            v69 = [(CHWorkoutDataCalculator *)self healthStore];
            [v69 executeQuery:v68];

            id v40 = v85;
          }
          id v57 = [v76 countByEnumeratingWithState:&v89 objects:v126 count:16];
        }
        while (v57);
      }
    }

    dispatch_time_t v70 = dispatch_time(0, 20000000000);
    dispatch_group_wait(objb, v70);
    id v71 = (id)v106[5];
    v72 = v71;
    if (v71)
    {
      if (v75) {
        void *v75 = v71;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v42 = v78;
    _Block_object_dispose(&v105, 8);

    id v5 = v85;
  }
  else
  {
    id v42 = &__NSArray0__struct;
  }

  return v42;
}

- (id)_queue_segmentsForWorkout:(id)a3 markerEvents:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  id v80 = objc_alloc_init((Class)NSMutableArray);
  v82 = v6;
  uint64_t v8 = [v6 startDate];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v115 objects:v124 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v116;
    dispatch_group_t group = (dispatch_group_t)FIUIPrivateMetadataKeySegmentDistance;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v116 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v115 + 1) + 8 * i);
        id v13 = [v12 dateInterval];
        id v14 = [v13 startDate];
        [v14 timeIntervalSinceDate:v8];
        double v16 = v15;

        if (fabs(round(v16)) >= 2.22044605e-16)
        {
          id v17 = objc_alloc_init(CHWorkoutSegment);
          [(CHWorkoutSegment *)v17 setStartDate:v8];
          id v18 = [v12 dateInterval];
          id v19 = [v18 startDate];
          [(CHWorkoutSegment *)v17 setEndDate:v19];

          [v80 addObject:v17];
          id v20 = [v12 dateInterval];
          uint64_t v21 = [v20 startDate];

          if ([v82 isTrackWorkout])
          {
            id v22 = [v12 metadata];
            id v23 = [v22 objectForKeyedSubscript:group];

            if (v23)
            {
              id v24 = +[HKUnit meterUnit];
              [v23 doubleValue];
              unsigned int v25 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v24);
              [(CHWorkoutSegment *)v17 setDistance:v25];
            }
          }

          uint64_t v8 = (void *)v21;
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v115 objects:v124 count:16];
    }
    while (v9);
  }

  id v71 = objc_alloc_init(CHWorkoutSegment);
  [(CHWorkoutSegment *)v71 setStartDate:v8];
  unsigned int v26 = [v82 endDate];
  [(CHWorkoutSegment *)v71 setEndDate:v26];

  [v80 addObject:v71];
  if ((unint64_t)[v80 count] >= 2)
  {
    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472;
    v113[2] = sub_100116950;
    v113[3] = &unk_1008AC7A0;
    id v76 = objc_alloc_init((Class)NSMutableArray);
    id v114 = v76;
    [v82 _enumerateActiveTimePeriods:v113];
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id v73 = v80;
    id v28 = [v73 countByEnumeratingWithState:&v109 objects:v123 count:16];
    if (v28)
    {
      dispatch_group_t groupa = *(dispatch_group_t *)v110;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(dispatch_group_t *)v110 != groupa) {
            objc_enumerationMutation(v73);
          }
          id v30 = *(void **)(*((void *)&v109 + 1) + 8 * (void)j);
          id v31 = objc_alloc((Class)NSDateInterval);
          uint64_t v32 = [v30 startDate];
          id v33 = [v30 endDate];
          id v34 = [v31 initWithStartDate:v32 endDate:v33];

          long long v107 = 0u;
          long long v108 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          id v35 = v76;
          id v36 = [v35 countByEnumeratingWithState:&v105 objects:v122 count:16];
          if (v36)
          {
            uint64_t v37 = *(void *)v106;
            double v38 = 0.0;
            do
            {
              for (k = 0; k != v36; k = (char *)k + 1)
              {
                if (*(void *)v106 != v37) {
                  objc_enumerationMutation(v35);
                }
                id v40 = [v34 intersectionWithDateInterval:*(void *)(*((void *)&v105 + 1) + 8 * (void)k)];
                [v40 duration];
                double v42 = v41;

                double v38 = v38 + v42;
              }
              id v36 = [v35 countByEnumeratingWithState:&v105 objects:v122 count:16];
            }
            while (v36);
          }
          else
          {
            double v38 = 0.0;
          }

          [v30 setElapsedTime:v38];
        }
        id v28 = [v73 countByEnumeratingWithState:&v109 objects:v123 count:16];
      }
      while (v28);
    }

    groupb = dispatch_group_create();
    uint64_t v99 = 0;
    BOOL v100 = &v99;
    uint64_t v101 = 0x3032000000;
    long long v102 = sub_10010DF48;
    long long v103 = sub_10010DF58;
    id v104 = 0;
    if ([(CHWorkoutDataCalculator *)self _workoutSupportsDistanceAndPace:v82])
    {
      dispatch_group_enter(groupb);
      id v43 = objc_alloc_init((Class)NSMutableArray);
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v44 = v73;
      id v45 = [v44 countByEnumeratingWithState:&v95 objects:v121 count:16];
      if (v45)
      {
        uint64_t v46 = *(void *)v96;
        do
        {
          for (m = 0; m != v45; m = (char *)m + 1)
          {
            if (*(void *)v96 != v46) {
              objc_enumerationMutation(v44);
            }
            __int16 v48 = *(void **)(*((void *)&v95 + 1) + 8 * (void)m);
            id v49 = objc_alloc((Class)NSDateInterval);
            id v50 = [v48 startDate];
            id v51 = [v48 endDate];
            id v52 = [v49 initWithStartDate:v50 endDate:v51];
            [v43 addObject:v52];
          }
          id v45 = [v44 countByEnumeratingWithState:&v95 objects:v121 count:16];
        }
        while (v45);
      }

      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_1001169DC;
      v90[3] = &unk_1008AC868;
      id v94 = &v99;
      id v72 = v43;
      id v91 = v72;
      id v92 = v44;
      v93 = groupb;
      [(CHWorkoutDataCalculator *)self distanceSamplesForWorkout:v82 workoutActivity:0 completion:v90];
    }
    else
    {
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v72 = v73;
      id v53 = [v72 countByEnumeratingWithState:&v86 objects:v120 count:16];
      if (v53)
      {
        uint64_t v74 = *(void *)v87;
        do
        {
          for (n = 0; n != v53; n = (char *)n + 1)
          {
            if (*(void *)v87 != v74) {
              objc_enumerationMutation(v72);
            }
            unsigned int v55 = *(void **)(*((void *)&v86 + 1) + 8 * (void)n);
            dispatch_group_enter(groupb);
            unsigned int v56 = +[HKQuery predicateForObjectsFromWorkout:v82];
            id v57 = [v55 startDate];
            v58 = [v55 endDate];
            id v59 = +[HKQuery predicateForSamplesWithStartDate:v57 endDate:v58 options:1];

            v119[0] = v56;
            v119[1] = v59;
            v60 = +[NSArray arrayWithObjects:v119 count:2];
            id v61 = +[NSCompoundPredicate andPredicateWithSubpredicates:v60];

            id v62 = objc_alloc((Class)HKStatisticsQuery);
            v63 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
            v83[0] = _NSConcreteStackBlock;
            v83[1] = 3221225472;
            v83[2] = sub_100116B4C;
            v83[3] = &unk_1008AC818;
            v83[4] = v55;
            v85 = &v99;
            v84 = groupb;
            id v64 = [v62 initWithQuantityType:v63 quantitySamplePredicate:v61 options:16 completionHandler:v83];

            v65 = [(CHWorkoutDataCalculator *)self healthStore];
            [v65 executeQuery:v64];
          }
          id v53 = [v72 countByEnumeratingWithState:&v86 objects:v120 count:16];
        }
        while (v53);
      }
    }

    dispatch_time_t v66 = dispatch_time(0, 20000000000);
    dispatch_group_wait(groupb, v66);
    id v67 = (id)v100[5];
    id v68 = v67;
    if (v67)
    {
      if (a5) {
        *a5 = v67;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v27 = v73;
    _Block_object_dispose(&v99, 8);
  }
  else
  {
    id v27 = &__NSArray0__struct;
  }

  return v27;
}

- (id)_queue_downhillRunsForWorkout:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = dispatch_group_create();
  uint64_t v25 = 0;
  unsigned int v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_10010DF48;
  double v29 = sub_10010DF58;
  id v30 = 0;
  dispatch_group_enter(v7);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10010DF48;
  id v23 = sub_10010DF58;
  id v24 = 0;
  healthStore = self->_healthStore;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100116DE4;
  v15[3] = &unk_1008AC890;
  id v17 = &v19;
  id v18 = &v25;
  id v9 = v7;
  double v16 = v9;
  [v6 makeDownhillRunBridgesWithHealthStore:healthStore completion:v15];
  dispatch_time_t v10 = dispatch_time(0, 20000000000);
  dispatch_group_wait(v9, v10);
  id v11 = (id)v20[5];
  id v12 = v11;
  if (v11)
  {
    if (a4) {
      *a4 = v11;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v13 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);

  return v13;
}

- (id)_queue_trackLapsForWorkout:(id)a3 lapEvents:(id)a4 error:(id *)a5
{
  __int16 v48 = a5;
  id v6 = a3;
  id v7 = a4;
  id v56 = objc_alloc_init((Class)NSMutableArray);
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_100117598;
  v83[3] = &unk_1008AC7A0;
  id v50 = objc_alloc_init((Class)NSMutableArray);
  id v84 = v50;
  id v53 = v6;
  [v6 _enumerateActiveTimePeriods:v83];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v79 objects:v88 count:16];
  if (v8)
  {
    uint64_t v54 = *(void *)v80;
    uint64_t v9 = FIPrivateMetadataKeyLapDuration;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v80 != v54) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        id v12 = [[CHWorkoutTrackLap alloc] initWithWorkoutEvent:v11];
        id v13 = [v11 metadata];
        id v14 = [v13 allKeys];
        unsigned __int8 v15 = [v14 containsObject:v9];

        if ((v15 & 1) == 0)
        {
          id v16 = objc_alloc((Class)NSDateInterval);
          id v17 = [(CHWorkoutSegment *)v12 startDate];
          id v18 = [(CHWorkoutSegment *)v12 endDate];
          id v19 = [v16 initWithStartDate:v17 endDate:v18];

          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v20 = v50;
          id v21 = [v20 countByEnumeratingWithState:&v75 objects:v87 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v76;
            double v23 = 0.0;
            do
            {
              for (j = 0; j != v21; j = (char *)j + 1)
              {
                if (*(void *)v76 != v22) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v25 = [v19 intersectionWithDateInterval:*(void *)(*((void *)&v75 + 1) + 8 * (void)j) v48];
                [v25 duration];
                double v27 = v26;

                double v23 = v23 + v27;
              }
              id v21 = [v20 countByEnumeratingWithState:&v75 objects:v87 count:16];
            }
            while (v21);
          }
          else
          {
            double v23 = 0.0;
          }

          [(CHWorkoutSegment *)v12 setElapsedTime:v23];
        }
        [v56 addObject:v12, v48];
      }
      id v8 = [obj countByEnumeratingWithState:&v79 objects:v88 count:16];
    }
    while (v8);
  }

  id v28 = dispatch_group_create();
  uint64_t v69 = 0;
  dispatch_time_t v70 = &v69;
  uint64_t v71 = 0x3032000000;
  id v72 = sub_10010DF48;
  id v73 = sub_10010DF58;
  id v74 = 0;
  if ([(CHWorkoutDataCalculator *)self _workoutSupportsDistanceAndPace:v53])
  {
    dispatch_group_enter(v28);
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100117624;
    v64[3] = &unk_1008AC868;
    id v68 = &v69;
    id v65 = v56;
    id v66 = obj;
    id v67 = v28;
    [(CHWorkoutDataCalculator *)self distanceSamplesForWorkout:v53 workoutActivity:0 completion:v64];

    id v29 = v65;
  }
  else
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v29 = v56;
    id v30 = [v29 countByEnumeratingWithState:&v60 objects:v86 count:16];
    if (v30)
    {
      uint64_t v55 = *(void *)v61;
      id v49 = v29;
      do
      {
        for (k = 0; k != v30; k = (char *)k + 1)
        {
          if (*(void *)v61 != v55) {
            objc_enumerationMutation(v49);
          }
          uint64_t v32 = *(void **)(*((void *)&v60 + 1) + 8 * (void)k);
          dispatch_group_enter(v28);
          id v33 = +[HKQuery predicateForObjectsFromWorkout:v53];
          id v34 = [v32 startDate];
          id v35 = [v32 endDate];
          id v36 = +[HKQuery predicateForSamplesWithStartDate:v34 endDate:v35 options:1];

          v85[0] = v33;
          v85[1] = v36;
          uint64_t v37 = +[NSArray arrayWithObjects:v85 count:2];
          double v38 = +[NSCompoundPredicate andPredicateWithSubpredicates:v37];

          id v39 = objc_alloc((Class)HKStatisticsQuery);
          id v40 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_100117934;
          v57[3] = &unk_1008AC818;
          v57[4] = v32;
          id v59 = &v69;
          v58 = v28;
          id v41 = [v39 initWithQuantityType:v40 quantitySamplePredicate:v38 options:16 completionHandler:v57];

          double v42 = [(CHWorkoutDataCalculator *)self healthStore];
          [v42 executeQuery:v41];
        }
        id v29 = v49;
        id v30 = [v49 countByEnumeratingWithState:&v60 objects:v86 count:16];
      }
      while (v30);
    }
  }

  dispatch_time_t v43 = dispatch_time(0, 20000000000);
  dispatch_group_wait(v28, v43);
  id v44 = (id)v70[5];
  id v45 = v44;
  if (v44)
  {
    if (v48) {
      *__int16 v48 = v44;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v46 = v56;
  _Block_object_dispose(&v69, 8);

  return v46;
}

- (id)_queue_openWaterSwimDistanceByStrokeStyleForWorkout:(id)a3 workoutActivity:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v41 = 0;
  double v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = sub_10010DF48;
  id v45 = sub_10010DF58;
  id v46 = [&__NSArray0__struct mutableCopy];
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  double v38 = sub_10010DF48;
  id v39 = sub_10010DF58;
  id v40 = [&__NSArray0__struct mutableCopy];
  uint64_t v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100117DB8;
  v32[3] = &unk_1008AC8E0;
  id v34 = &v41;
  dispatch_time_t v10 = v9;
  id v33 = v10;
  [(CHWorkoutDataCalculator *)self strokeSamplesForWorkout:v7 workoutActivity:v8 completion:v32];
  dispatch_group_enter(v10);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100117E08;
  v29[3] = &unk_1008AC8E0;
  id v31 = &v35;
  id v11 = v10;
  id v30 = v11;
  [(CHWorkoutDataCalculator *)self distanceSamplesForWorkout:v7 workoutActivity:v8 completion:v29];
  dispatch_time_t v12 = dispatch_time(0, 20000000000);
  dispatch_group_wait(v11, v12);
  _HKInitializeLogging();
  id v13 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v42[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v48 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Stroke samples: %@", buf, 0xCu);
  }
  _HKInitializeLogging();
  unsigned __int8 v15 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v36[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v48 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Distance samples: %@", buf, 0xCu);
  }
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  id v18 = (void *)v42[5];
  double v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  uint64_t v25 = sub_100117E58;
  double v26 = &unk_1008AC908;
  id v28 = &v35;
  id v19 = v17;
  id v27 = v19;
  [v18 enumerateObjectsUsingBlock:&v23];
  id v20 = objc_alloc((Class)NSDictionary);
  id v21 = [v20 initWithDictionary:v19, v23, v24, v25, v26];

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v21;
}

- (id)_queue_swimDistanceByStrokeStyleForWorkout:(id)a3 workoutActivity:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v6;
  }
  dispatch_time_t v10 = [v9 workoutEvents];
  id v11 = +[NSPredicate predicateWithBlock:&stru_1008AC928];
  dispatch_time_t v12 = [v10 filteredArrayUsingPredicate:v11];

  if ([v12 count])
  {
    id v30 = v7;
    id v29 = v10;
    if (v7)
    {
      id v13 = [v7 workoutConfiguration];
      [v13 lapLength];
    }
    else
    {
      id v13 = [v6 metadata];
      [v13 objectForKeyedSubscript:HKMetadataKeyLapLength];
    unsigned __int8 v15 = };

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v12;
    id v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = [*(id *)(*((void *)&v32 + 1) + 8 * i) metadata];
          uint64_t v21 = [v20 objectForKeyedSubscript:HKMetadataKeySwimmingStrokeStyle];
          uint64_t v22 = (void *)v21;
          if (v21) {
            double v23 = (_UNKNOWN **)v21;
          }
          else {
            double v23 = &off_1008DE640;
          }
          uint64_t v24 = v23;

          uint64_t v25 = [v8 objectForKeyedSubscript:v24];
          if (v25)
          {
            double v26 = v25;
            id v27 = [v25 _quantityByAddingQuantity:v15];
          }
          else
          {
            id v27 = v15;
          }
          [v8 setObject:v27 forKeyedSubscript:v24];
        }
        id v17 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v17);
    }

    id v14 = [objc_alloc((Class)NSDictionary) initWithDictionary:v8];
    id v7 = v30;
    dispatch_time_t v10 = v29;
  }
  else
  {
    id v14 = &__NSDictionary0__struct;
  }

  return v14;
}

- (id)_queue_swimmingSetsForWorkout:(id)a3 workoutActivity:(id)a4 error:(id *)a5
{
  id v35 = a3;
  id v36 = a4;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = sub_10010DF48;
  void v64[4] = sub_10010DF58;
  id v65 = [&__NSArray0__struct mutableCopy];
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x3032000000;
  long long v61 = sub_10010DF48;
  long long v62 = sub_10010DF58;
  id v63 = [&__NSArray0__struct mutableCopy];
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100118854;
  v55[3] = &unk_1008AC8E0;
  id v57 = v64;
  id v7 = v6;
  id v56 = v7;
  [(CHWorkoutDataCalculator *)self strokeSamplesForWorkout:v35 workoutActivity:v36 completion:v55];
  dispatch_group_enter(v7);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1001188A4;
  v52[3] = &unk_1008AC8E0;
  uint64_t v54 = &v58;
  id v8 = v7;
  id v53 = v8;
  [(CHWorkoutDataCalculator *)self distanceSamplesForWorkout:v35 workoutActivity:v36 completion:v52];
  dispatch_time_t v9 = dispatch_time(0, 20000000000);
  long long v33 = v8;
  dispatch_group_wait(v8, v9);
  dispatch_time_t v10 = +[HKUnit yardUnit];
  id v11 = +[HKQuantity quantityWithUnit:v10 doubleValue:0.0];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v12 = (id)v59[5];
  id v13 = [v12 countByEnumeratingWithState:&v48 objects:v67 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v49;
    do
    {
      unsigned __int8 v15 = 0;
      id v16 = v11;
      do
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)v15) quantity:v33];
        id v11 = [v16 _quantityByAddingQuantity:v17];

        unsigned __int8 v15 = (char *)v15 + 1;
        id v16 = v11;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v48 objects:v67 count:16];
    }
    while (v13);
  }

  id v18 = objc_alloc_init((Class)NSMutableArray);
  if (v36) {
    [v36 workoutEvents];
  }
  else {
    [v35 workoutEvents];
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = [v19 countByEnumeratingWithState:&v44 objects:v66 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v45;
    uint64_t v22 = FIUIPrivateMetadataKeySegmentEventSubtype;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v45 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v24, "type", v33) == (id)7)
        {
          uint64_t v25 = [v24 metadata];
          double v26 = [v25 objectForKey:v22];

          if ([v26 intValue] != 1 && objc_msgSend(v26, "intValue") != 3) {
            [v18 addObject:v24];
          }
        }
      }
      id v20 = [v19 countByEnumeratingWithState:&v44 objects:v66 count:16];
    }
    while (v20);
  }

  id v27 = objc_alloc_init((Class)NSMutableArray);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1001188F4;
  v37[3] = &unk_1008AC9A0;
  id v28 = v18;
  id v38 = v28;
  double v42 = v64;
  uint64_t v43 = &v58;
  id v29 = v19;
  id v39 = v29;
  id v40 = self;
  id v30 = v27;
  id v41 = v30;
  [v28 enumerateObjectsUsingBlock:v37];
  id v31 = [objc_alloc((Class)NSArray) initWithArray:v30];

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(v64, 8);

  return v31;
}

- (int64_t)_queue_strokeStyleForLaps:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v49;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v49 != v7) {
          objc_enumerationMutation(obj);
        }
        dispatch_time_t v9 = [*(id *)(*((void *)&v48 + 1) + 8 * i) metadata];
        uint64_t v10 = [v9 objectForKeyedSubscript:HKMetadataKeySwimmingStrokeStyle];
        id v11 = (void *)v10;
        if (v10) {
          id v12 = (_UNKNOWN **)v10;
        }
        else {
          id v12 = &off_1008DE640;
        }
        id v13 = v12;

        uint64_t v14 = [v4 objectForKeyedSubscript:v13];
        if (v14)
        {
          unsigned __int8 v15 = v14;
          +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v14 integerValue] + 1);
          id v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v16 = &off_1008DE658;
        }
        [v4 setObject:v16 forKeyedSubscript:v13];
      }
      id v6 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v6);
  }

  id v17 = [v4 count];
  int64_t v18 = (int64_t)v17;
  if (v17)
  {
    if (v17 == (id)1)
    {
      id v19 = [v4 allKeys];
      id v20 = [v19 firstObject];
      int64_t v18 = (int64_t)[v20 integerValue];
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      uint64_t v21 = [v4 allValues];
      id v22 = [v21 countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v45;
        float v25 = 0.0;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v45 != v24) {
              objc_enumerationMutation(v21);
            }
            [*(id *)(*((void *)&v44 + 1) + 8 * (void)j) floatValue];
            float v25 = v25 + v27;
          }
          id v23 = [v21 countByEnumeratingWithState:&v44 objects:v53 count:16];
        }
        while (v23);
      }
      else
      {
        float v25 = 0.0;
      }

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v19 = [v4 allKeys];
      id v28 = [v19 countByEnumeratingWithState:&v40 objects:v52 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v41;
        if (v25 >= 10.9999999 || v25 <= 2.00000012) {
          float v32 = v25;
        }
        else {
          float v32 = v25 + -1.0;
        }
        int64_t v18 = 1;
        while (2)
        {
          for (k = 0; k != v29; k = (char *)k + 1)
          {
            if (*(void *)v41 != v30) {
              objc_enumerationMutation(v19);
            }
            long long v34 = *(void **)(*((void *)&v40 + 1) + 8 * (void)k);
            id v35 = [v4 objectForKeyedSubscript:v34];
            [v35 floatValue];
            float v37 = v36;

            if ((float)(v37 / v32) > 0.9)
            {
              int64_t v18 = (int64_t)[v34 integerValue];
              goto LABEL_43;
            }
          }
          id v29 = [v19 countByEnumeratingWithState:&v40 objects:v52 count:16];
          if (v29) {
            continue;
          }
          break;
        }
      }
      else
      {
        int64_t v18 = 1;
      }
    }
LABEL_43:
  }
  return v18;
}

- (void)_updateSplits:(id)a3 withDistance:(double)a4 duration:(double)a5 strokeCount:(int64_t)a6 splitDelimiterInUserUnit:(double)a7
{
  id v11 = a3;
  if ([v11 count])
  {
    id v12 = [v11 lastObject];
  }
  else
  {
    id v12 = [[CHWorkoutSwimmingSplit alloc] initWithSplitDelimiterDistance:(uint64_t)a7 distanceInUserUnit:0 strokeCount:0.0 duration:0.0];
    [v11 addObject:v12];
  }
  [(CHWorkoutSwimmingSplit *)v12 distanceInUserUnit];
  double v14 = a4 - (a7 - v13);
  [(CHWorkoutSwimmingSplit *)v12 distanceInUserUnit];
  if (v14 <= 2.22044605e-16)
  {
    [(CHWorkoutSwimmingSplit *)v12 setDistanceInUserUnit:v15 + a4];
    [(CHWorkoutSwimmingSplit *)v12 duration];
    [(CHWorkoutSwimmingSplit *)v12 setDuration:v25 + a5];
    [(CHWorkoutSwimmingSplit *)v12 setStrokeCount:(char *)[(CHWorkoutSwimmingSplit *)v12 strokeCount] + a6];
  }
  else
  {
    double v16 = (a7 - v15) / a4;
    [(CHWorkoutSwimmingSplit *)v12 distanceInUserUnit];
    [(CHWorkoutSwimmingSplit *)v12 setDistanceInUserUnit:v17 + v16 * a4];
    [(CHWorkoutSwimmingSplit *)v12 duration];
    [(CHWorkoutSwimmingSplit *)v12 setDuration:v18 + v16 * a5];
    double v19 = (double)a6;
    [(CHWorkoutSwimmingSplit *)v12 setStrokeCount:(uint64_t)((double)[(CHWorkoutSwimmingSplit *)v12 strokeCount] + v16 * (double)a6)];
    double v20 = a4 - v16 * a4;
    unint64_t v21 = vcvtmd_u64_f64(v20 / a7);
    if (v21)
    {
      unint64_t v22 = llround(a7 / a4 * v19);
      unint64_t v23 = v21;
      do
      {
        uint64_t v24 = [[CHWorkoutSwimmingSplit alloc] initWithSplitDelimiterDistance:(uint64_t)a7 distanceInUserUnit:v22 strokeCount:a7 duration:a7 / a4 * a5];

        [v11 addObject:v24];
        id v12 = v24;
        --v23;
      }
      while (v23);
    }
    else
    {
      uint64_t v24 = v12;
    }
    double v26 = v20 - (double)v21 * a7;
    if (v26 >= 0.0)
    {
      if (v26 > a7)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
          sub_10071C688();
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_10071C654();
      }
    }
    if (v26 <= 0.01)
    {
      id v12 = v24;
    }
    else
    {
      id v12 = [[CHWorkoutSwimmingSplit alloc] initWithSplitDelimiterDistance:(uint64_t)a7 distanceInUserUnit:llround(v26 / a4 * v19) strokeCount:v26 / a4 * a4 duration:v26 / a4 * a5];

      [v11 addObject:v12];
    }
  }
}

- (double)_activeWorkoutElapsedTimeFromDate:(id)a3 toDate:(id)a4 forWorkout:(id)a5 workoutActivity:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  double v13 = v12;
  uint64_t v17 = 0;
  double v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  if (v12) {
    [v12 workoutEvents];
  }
  else {
  double v14 = [v11 workoutEvents];
  }
  _HKEnumerateActiveWorkoutIntervals();
  double v15 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v15;
}

- (id)_swimmingSplitsForWorkout:(id)a3 workoutActivity:(id)a4 distanceSamples:(id)a5 strokeSamples:(id)a6 forDelimeterUnit:(id)a7 splitDelimiter:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = +[NSMutableArray array];
  if (v16 && v17)
  {
    if ([v16 count])
    {
      long long v46 = v17;
      if (v15) {
        unint64_t v21 = v15;
      }
      else {
        unint64_t v21 = v14;
      }
      uint64_t v22 = [v21 startDate];
      unint64_t v23 = [v16 objectAtIndexedSubscript:0];
      uint64_t v24 = [v23 startDate];
      long long v47 = (void *)v22;
      [(CHWorkoutDataCalculator *)self _activeWorkoutElapsedTimeFromDate:v22 toDate:v24 forWorkout:v14 workoutActivity:v15];
      double v26 = v25;

      if (v26 > 2.22044605e-16)
      {
        [v19 doubleValueForUnit:v18];
        [(CHWorkoutDataCalculator *)self _updateSplits:v20 withDistance:0 duration:0.0 strokeCount:v26 splitDelimiterInUserUnit:v27];
      }
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_100119B68;
      v53[3] = &unk_1008AC9F0;
      long long v48 = self;
      v53[4] = self;
      id v28 = v18;
      id v29 = v16;
      id v54 = v29;
      id v52 = v14;
      id v30 = v14;
      id v55 = v30;
      id v31 = v19;
      id v32 = v15;
      id v56 = v32;
      id v33 = v20;
      id v57 = v33;
      long long v49 = v31;
      id v45 = v31;
      id v58 = v45;
      long long v50 = v28;
      id v43 = v28;
      id v59 = v43;
      id v17 = v46;
      id v60 = v46;
      [v29 enumerateObjectsUsingBlock:v53];
      long long v51 = v20;
      if (v15) {
        long long v34 = v32;
      }
      else {
        long long v34 = v30;
      }
      id v35 = [v34 endDate];
      float v36 = [v29 lastObject];
      float v37 = [v36 endDate];
      [(CHWorkoutDataCalculator *)v48 _activeWorkoutElapsedTimeFromDate:v37 toDate:v35 forWorkout:v30 workoutActivity:v32];
      double v39 = v38;

      if (v39 > 2.22044605e-16)
      {
        [v45 doubleValueForUnit:v44];
        [(CHWorkoutDataCalculator *)v48 _updateSplits:v33 withDistance:0 duration:0.0 strokeCount:v39 splitDelimiterInUserUnit:v40];
      }
      id v41 = v33;

      uint64_t v20 = v51;
      id v14 = v52;
      id v19 = v49;
      id v18 = v50;
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_10071C6F0();
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_10071C6BC();
    }
  }

  return v20;
}

- (id)_queue_swimmingSplitsForWorkout:(id)a3 workoutActivity:(id)a4 error:(id *)a5
{
  id v55 = a3;
  id v56 = a4;
  uint64_t v84 = 0;
  v85 = (id *)&v84;
  uint64_t v86 = 0x3032000000;
  long long v87 = sub_10010DF48;
  long long v88 = sub_10010DF58;
  id v89 = [&__NSArray0__struct mutableCopy];
  uint64_t v78 = 0;
  long long v79 = &v78;
  uint64_t v80 = 0x3032000000;
  long long v81 = sub_10010DF48;
  long long v82 = sub_10010DF58;
  id v83 = [&__NSArray0__struct mutableCopy];
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_10011A618;
  v75[3] = &unk_1008AC8E0;
  long long v77 = &v84;
  uint64_t v7 = v6;
  long long v76 = v7;
  [(CHWorkoutDataCalculator *)self strokeSamplesForWorkout:v55 workoutActivity:v56 completion:v75];
  dispatch_group_enter(v7);
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10011A668;
  v72[3] = &unk_1008AC8E0;
  id v74 = &v78;
  dispatch_group_t group = v7;
  dispatch_group_t v73 = group;
  [(CHWorkoutDataCalculator *)self distanceSamplesForWorkout:v55 workoutActivity:v56 completion:v72];
  dispatch_time_t v8 = dispatch_time(0, 20000000000);
  dispatch_group_wait(group, v8);
  id v9 = [v85[5] count];
  if (v9 == [(id)v79[5] count]) {
    goto LABEL_34;
  }
  if (v56)
  {
    id v10 = [v56 workoutConfiguration];
    id v11 = [v10 swimmingLocationType];
  }
  else
  {
    id v10 = [v55 metadata];
    id v12 = [v10 objectForKeyedSubscript:HKMetadataKeySwimmingLocationType];
    id v11 = [v12 integerValue];
  }
  if (v11 == (id)2)
  {
    _HKInitializeLogging();
    double v13 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v14 = "Open water swim with differing count of distance and stroke count samples. Adding empty stroke samples.";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
  }
  else
  {
    _HKInitializeLogging();
    double v13 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v14 = "Pool swim with differing count of distance and stroke count samples (kickboarding?). Adding empty stroke samples.";
      goto LABEL_10;
    }
  }
  id v59 = objc_alloc_init((Class)NSMutableArray);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = (id)v79[5];
  id v60 = [obj countByEnumeratingWithState:&v67 objects:v95 count:16];
  if (v60)
  {
    uint64_t v58 = *(void *)v68;
    do
    {
      for (i = 0; i != v60; i = (char *)i + 1)
      {
        if (*(void *)v68 != v58) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        id v16 = [v15 fiui_dateInterval];
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v17 = v85[5];
        id v18 = [v17 countByEnumeratingWithState:&v63 objects:v94 count:16];
        long long v61 = v15;
        if (v18)
        {
          uint64_t v19 = *(void *)v64;
LABEL_18:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v64 != v19) {
              objc_enumerationMutation(v17);
            }
            unint64_t v21 = *(void **)(*((void *)&v63 + 1) + 8 * v20);
            uint64_t v22 = [v21 fiui_dateInterval];
            [v16 duration];
            if (v23 > 2.22044605e-16)
            {
              uint64_t v24 = [v22 intersectionWithDateInterval:v16];
              [v24 duration];
              double v26 = v25;
              [v16 duration];
              BOOL v28 = v26 / v27 > 0.9;

              if (v28) {
                break;
              }
            }

            if (v18 == (id)++v20)
            {
              id v18 = [v17 countByEnumeratingWithState:&v63 objects:v94 count:16];
              if (v18) {
                goto LABEL_18;
              }
              goto LABEL_25;
            }
          }
          id v29 = v21;

          if (v29) {
            goto LABEL_28;
          }
        }
        else
        {
LABEL_25:
        }
        id v30 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierSwimmingStrokeCount];
        id v31 = +[HKUnit countUnit];
        id v32 = +[HKQuantity quantityWithUnit:v31 doubleValue:0.0];
        id v33 = [v61 startDate];
        long long v34 = [v61 endDate];
        id v92 = HKMetadataKeySwimmingStrokeStyle;
        v93 = &off_1008DE640;
        id v35 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
        id v29 = +[HKQuantitySample quantitySampleWithType:v30 quantity:v32 startDate:v33 endDate:v34 metadata:v35];

LABEL_28:
        [v59 addObject:v29];
      }
      id v60 = [obj countByEnumeratingWithState:&v67 objects:v95 count:16];
    }
    while (v60);
  }

  objc_storeStrong(v85 + 5, v59);
  id v36 = [v85[5] count];
  if (v36 != [(id)v79[5] count])
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_10071C724();
    }
  }

LABEL_34:
  float v37 = [(CHWorkoutDataCalculator *)self unitManager];
  double v38 = [v37 userDistanceHKUnitForDistanceType:3];

  uint64_t v39 = v79[5];
  id v40 = v85[5];
  id v41 = +[HKQuantity quantityWithUnit:v38 doubleValue:100.0];
  long long v42 = [(CHWorkoutDataCalculator *)self _swimmingSplitsForWorkout:v55 workoutActivity:v56 distanceSamples:v39 strokeSamples:v40 forDelimeterUnit:v38 splitDelimiter:v41];

  uint64_t v43 = v79[5];
  id v44 = v85[5];
  id v45 = +[HKQuantity quantityWithUnit:v38 doubleValue:50.0];
  long long v46 = [(CHWorkoutDataCalculator *)self _swimmingSplitsForWorkout:v55 workoutActivity:v56 distanceSamples:v43 strokeSamples:v44 forDelimeterUnit:v38 splitDelimiter:v45];

  uint64_t v47 = v79[5];
  id v48 = v85[5];
  long long v49 = +[HKQuantity quantityWithUnit:v38 doubleValue:25.0];
  long long v50 = [(CHWorkoutDataCalculator *)self _swimmingSplitsForWorkout:v55 workoutActivity:v56 distanceSamples:v47 strokeSamples:v48 forDelimeterUnit:v38 splitDelimiter:v49];

  v90[0] = &off_1008DE610;
  v90[1] = &off_1008DE670;
  v91[0] = v42;
  v91[1] = v46;
  v90[2] = &off_1008DE688;
  v91[2] = v50;
  long long v51 = +[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:3];

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v84, 8);

  return v51;
}

- (id)_uuidForWorkout:(id)a3 workoutActivity:(id)a4
{
  if (a4) {
    id v4 = a4;
  }
  else {
    id v4 = a3;
  }
  id v5 = [v4 UUID:a3];

  return v5;
}

- (id)_predicateForObjectsFromWorkout:(id)a3 withinWorkoutActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[HKQuery predicateForObjectsFromWorkout:v5];
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = v8;
  if (v6)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10011A940;
    v17[3] = &unk_1008AC7A0;
    id v10 = &v18;
    id v18 = v8;
    id v11 = v17;
    id v12 = v6;
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10011A8D8;
    v19[3] = &unk_1008AC7A0;
    id v10 = &v20;
    id v20 = v8;
    id v11 = v19;
    id v12 = v5;
  }
  [v12 _enumerateActiveTimePeriods:v11];

  double v13 = +[NSCompoundPredicate orPredicateWithSubpredicates:v9];
  v21[0] = v7;
  v21[1] = v13;
  id v14 = +[NSArray arrayWithObjects:v21 count:2];
  id v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v14];

  return v15;
}

- (id)_activeDateIntervalsForWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = v7;
  if (v6)
  {
    double v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_10011AB64;
    id v16 = &unk_1008AC7A0;
    id v9 = &v17;
    id v17 = v7;
    id v10 = &v13;
    id v11 = v6;
  }
  else
  {
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v20 = sub_10011AAD8;
    unint64_t v21 = &unk_1008AC7A0;
    id v9 = &v22;
    id v22 = v7;
    id v10 = &v18;
    id v11 = v5;
  }
  [v11 _enumerateActiveTimePeriods:v10, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22];

  return v8;
}

- (id)_predicateForWorkout:(id)a3 during:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HKQuery predicateForObjectsFromWorkout:v7];
  id v9 = [(CHWorkoutDataCalculator *)self _activeDateIntervalsForWorkout:v7 during:v6];

  id v10 = [(CHWorkoutDataCalculator *)self _predicateForActiveDateIntervals:v9];
  v14[0] = v8;
  v14[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v14 count:2];
  id v12 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];

  return v12;
}

- (id)_predicateForActiveDateIntervals:(id)a3
{
  id v3 = [a3 hk_map:&stru_1008ACA30];
  id v4 = +[NSCompoundPredicate orPredicateWithSubpredicates:v3];

  return v4;
}

- (BOOL)_activeDateIntervals:(id)a3 containsDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v12 = [v11 startDate:v21];
        [v12 timeIntervalSinceReferenceDate];
        double v14 = v13;

        id v15 = [v11 endDate];
        [v15 timeIntervalSinceReferenceDate];
        double v17 = v16;

        [v6 timeIntervalSinceReferenceDate];
        if (v18 >= v14 && v18 < v17)
        {
          LOBYTE(v8) = 1;
          goto LABEL_14;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (char)v8;
}

- (id)_activeDateIntervalsForWorkout:(id)a3 during:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10011B054;
  v12[3] = &unk_1008ACA58;
  id v13 = v5;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v14 = v7;
  id v8 = v5;
  [v6 _enumerateActiveTimePeriods:v12];

  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

- (id)_activeDateIntervalsForWorkoutActivity:(id)a3 during:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10011B2B0;
  v12[3] = &unk_1008ACA58;
  id v13 = v5;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v14 = v7;
  id v8 = v5;
  [v6 _enumerateActiveTimePeriods:v12];

  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

- (id)_testMarkersForWorkout:(id)a3
{
  id v3 = a3;
  id v4 = [v3 endDate];
  id v5 = [v3 startDate];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  double v8 = v7 / 3.0;
  id v9 = objc_alloc((Class)NSDateInterval);
  id v10 = [v3 startDate];
  id v11 = [v10 dateByAddingTimeInterval:v8];
  id v12 = [v9 initWithStartDate:v11 duration:0.0];
  uint64_t v13 = FIUIPrivateMetadataKeyMarkerEventSubtype;
  uint64_t v27 = FIUIPrivateMetadataKeyMarkerEventSubtype;
  BOOL v28 = &off_1008DE6A0;
  id v14 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v15 = +[HKWorkoutEvent workoutEventWithType:4 dateInterval:v12 metadata:v14];

  id v16 = objc_alloc((Class)NSDateInterval);
  double v17 = [v3 startDate];

  double v18 = [v17 dateByAddingTimeInterval:v8 + v8];
  id v19 = [v16 initWithStartDate:v18 duration:0.0];
  uint64_t v25 = v13;
  double v26 = &off_1008DE6A0;
  id v20 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  long long v21 = +[HKWorkoutEvent workoutEventWithType:4 dateInterval:v19 metadata:v20];

  v24[0] = v15;
  v24[1] = v21;
  long long v22 = +[NSArray arrayWithObjects:v24 count:2];

  return v22;
}

- (id)_testTrackLapsForWorkout:(id)a3
{
  id v22 = a3;
  [v22 duration];
  double v4 = v3 * 0.125;
  id v5 = [&__NSArray0__struct mutableCopy];
  uint64_t v21 = FIPrivateMetadataKeyLapIndex;
  uint64_t v20 = FIPrivateMetadataKeyLaneNumber;
  uint64_t v19 = FIPrivateMetadataKeyLapDuration;
  uint64_t v6 = 1;
  uint64_t v18 = FIPrivateMetadataKeyLapDistance;
  double v7 = 0.0;
  do
  {
    id v8 = objc_alloc((Class)NSDateInterval);
    long long v24 = [v22 startDate];
    long long v23 = [v24 dateByAddingTimeInterval:v4 * v7];
    id v9 = [v8 initWithStartDate:v23 duration:v4];
    v25[0] = v21;
    double v7 = v7 + 1.0;
    id v10 = +[NSNumber numberWithInt:v6];
    v26[0] = v10;
    v26[1] = &off_1008DE658;
    v25[1] = v20;
    v25[2] = v19;
    id v11 = +[HKUnit secondUnit];
    id v12 = +[HKQuantity quantityWithUnit:v11 doubleValue:v4];
    v26[2] = v12;
    v25[3] = v18;
    uint64_t v13 = +[HKUnit meterUnit];
    id v14 = +[HKQuantity quantityWithUnit:v13 doubleValue:400.0];
    v26[3] = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
    id v16 = +[HKWorkoutEvent workoutEventWithType:3 dateInterval:v9 metadata:v15];

    [v5 addObject:v16];
    uint64_t v6 = (v6 + 1);
  }
  while (v6 != 9);

  return v5;
}

- (BOOL)_workoutSupportsDistanceAndPace:(id)a3
{
  id v3 = a3;
  double v4 = [v3 fiui_activityType];
  id v5 = +[FIUIWorkoutDefaultMetricsProvider metricsVersionForWorkout:v3];
  id v6 = objc_alloc((Class)FIUIWorkoutDefaultMetricsProvider);
  id v7 = [v3 _activityMoveMode];
  uint64_t v8 = FIUIDeviceSupportsElevationGain();
  id v9 = [v6 initWithMetricsVersion:v5 activityType:v4 activityMoveMode:v7 deviceSupportsElevationMetrics:v8 deviceSupportsGroundElevationMetrics:FIUIDeviceSupportsGroundElevation()];
  id v10 = [v3 fiui_isConnectedGymWorkout];

  LOBYTE(v3) = [v9 isMetricTypeSupported:1 isMachineWorkout:v10 activityType:v4];
  return (char)v3;
}

- (void)_setDistanceSamples:(id)a3 forWorkout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v6 workoutActivity:0];
  [v8 setDistanceSamples:v7];

  [(CHWorkoutDataCalculator *)self saveContainerToCache:v8 forWorkout:v6 workoutActivity:0];
}

- (void)_setStrokeSamples:(id)a3 forWorkout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:v6 workoutActivity:0];
  [v8 setStrokeSamples:v7];

  [(CHWorkoutDataCalculator *)self saveContainerToCache:v8 forWorkout:v6 workoutActivity:0];
}

- (id)_getDistanceSamplesForWorkout:(id)a3
{
  id v3 = [(CHWorkoutDataCalculator *)self cacheContainerForWorkout:a3 workoutActivity:0];
  double v4 = [v3 distanceSamples];

  return v4;
}

- (id)_getDistanceAchievedDateForInterval:(id)a3 fromDistanceSamples:(id)a4 withDistanceTarget:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc((Class)NSDateInterval);
  id v11 = [v7 startDate];
  id v12 = [v7 endDate];
  id v13 = [v10 initWithStartDate:v11 endDate:v12];

  [v13 duration];
  if (fabs(v14) >= 2.22044605e-16)
  {
    id v16 = +[HKUnit meterUnit];
    [v9 doubleValueForUnit:v16];
    double v18 = v17;

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v19 = v8;
    id v15 = [v19 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v15)
    {
      id v38 = v9;
      id v39 = v8;
      uint64_t v20 = *(void *)v41;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(v19);
          }
          id v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          long long v23 = [v22 fiui_dateInterval];
          [v23 duration];
          if (fabs(v24) >= 2.22044605e-16)
          {
            uint64_t v25 = [v23 intersectionWithDateInterval:v13];
            [v25 duration];
            double v27 = v26;
            [v23 duration];
            double v29 = v27 / v28;
            id v30 = [v22 quantity];
            id v31 = +[HKUnit meterUnit];
            [v30 doubleValueForUnit:v31];
            double v33 = v29 * v32;

            if (v18 <= v33)
            {
              [v23 duration];
              double v35 = v18 / v33 * v34;
              id v36 = [v23 startDate];
              id v15 = [v36 dateByAddingTimeInterval:v35];

              goto LABEL_15;
            }
            double v18 = v18 - v33;
          }
        }
        id v15 = [v19 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v15) {
          continue;
        }
        break;
      }
LABEL_15:
      id v8 = v39;
      id v9 = v38;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)shouldUseFakeSegmentMarkers
{
  return self->_shouldUseFakeSegmentMarkers;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (FIUIUnitManager)unitManager
{
  return self->_unitManager;
}

- (void)setUnitManager:(id)a3
{
}

- (HKWorkoutEffortRelationshipQuery)effortObserverQuery
{
  return self->_effortObserverQuery;
}

- (void)setEffortObserverQuery:(id)a3
{
}

- (HKQueryAnchor)lastEffortAnchor
{
  return self->_lastEffortAnchor;
}

- (void)setLastEffortAnchor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEffortAnchor, 0);
  objc_storeStrong((id *)&self->_effortObserverQuery, 0);
  objc_storeStrong((id *)&self->_unitManager, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end