@interface RTLearnedLocationEngineTrainingMetrics
- (BOOL)trainedVisits;
- (NSDate)trainVisitsStart;
- (NSDate)trainVisitsStop;
- (NSMutableArray)awdPlaces;
- (NSMutableArray)awdVisits;
- (NSMutableArray)places;
- (NSMutableArray)visits;
- (RTLearnedLocationEngineTrainingMetrics)init;
- (double)intervalSinceLastAttempt;
- (double)latency;
- (double)maxIntervalBetweenLocations;
- (id)collectCoreAnalyticsMetrics;
- (id)description;
- (unint64_t)locationsProcessed;
- (unint64_t)mode;
- (unint64_t)placeCountDevice;
- (unint64_t)placeCountTotal;
- (unint64_t)reason;
- (unint64_t)visitCountDevice;
- (unint64_t)visitCountTotal;
- (unint64_t)visitCountUnlabeled;
- (unint64_t)wasDeferred;
- (void)setIntervalSinceLastAttempt:(double)a3;
- (void)setLocationsProcessed:(unint64_t)a3;
- (void)setMaxIntervalBetweenLocations:(double)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPlaceCountDevice:(unint64_t)a3;
- (void)setPlaceCountTotal:(unint64_t)a3;
- (void)setPlaces:(id)a3;
- (void)setReason:(unint64_t)a3;
- (void)setTrainedVisits:(BOOL)a3;
- (void)setVisitCountDevice:(unint64_t)a3;
- (void)setVisitCountTotal:(unint64_t)a3;
- (void)setVisitCountUnlabeled:(unint64_t)a3;
- (void)setVisits:(id)a3;
- (void)setWasDeferred:(unint64_t)a3;
- (void)startTrainingVisits;
- (void)stopTrainingVisits;
- (void)submitPlace:(id)a3 nearbyPlaces:(id)a4;
- (void)submitToCoreAnalytics;
- (void)submitVisit:(id)a3 possibleMapItems:(id)a4 selectedMapItem:(id)a5;
@end

@implementation RTLearnedLocationEngineTrainingMetrics

- (RTLearnedLocationEngineTrainingMetrics)init
{
  v12.receiver = self;
  v12.super_class = (Class)RTLearnedLocationEngineTrainingMetrics;
  v2 = [(RTLearnedLocationEngineTrainingMetrics *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    awdVisits = v2->_awdVisits;
    v2->_awdVisits = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    awdPlaces = v2->_awdPlaces;
    v2->_awdPlaces = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    visits = v2->_visits;
    v2->_visits = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    places = v2->_places;
    v2->_places = (NSMutableArray *)v9;
  }
  return v2;
}

- (void)submitVisit:(id)a3 possibleMapItems:(id)a4 selectedMapItem:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v23 = self;
    v11 = objc_opt_new();
    objc_super v12 = [v8 exitDate];
    v13 = [v8 entryDate];
    [v12 timeIntervalSinceDate:v13];
    [v11 setDwellTime:(unint64_t)v14];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = (void *)[objc_alloc(MEMORY[0x1E4FB8CD0]) initWithMapItem:*(void *)(*((void *)&v24 + 1) + 8 * v19)];
          if (v20) {
            [v11 addPossibleMapItems:v20];
          }

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }

    if (v10)
    {
      v21 = (void *)[objc_alloc(MEMORY[0x1E4FB8CD0]) initWithMapItem:v10];
      [v11 setSelectedMapItem:v21];
    }
    v22 = [(RTLearnedLocationEngineTrainingMetrics *)v23 awdVisits];
    [v22 addObject:v11];
  }
}

- (void)submitPlace:(id)a3 nearbyPlaces:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  id v8 = objc_alloc(MEMORY[0x1E4FB8CD0]);
  v33 = v5;
  id v9 = [v5 mapItem];
  id v10 = (void *)[v8 initWithMapItem:v9];
  v30 = v7;
  [v7 setMapItem:v10];

  v11 = [MEMORY[0x1E4F28BD0] set];
  objc_super v12 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v6;
  uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = 0;
    uint64_t v16 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);

        uint64_t v19 = [v18 mapItem];
        v20 = [v19 location];
        v21 = [v33 mapItem];
        v22 = [v21 location];
        id v37 = 0;
        [v12 distanceFromLocation:v20 toLocation:v22 error:&v37];
        double v24 = v23;
        id v15 = v37;

        if (v15)
        {
          long long v25 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v43 = v15;
            _os_log_debug_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
          }
        }
        long long v26 = [NSNumber numberWithDouble:ceil(floor(v24) / 10.0) * 10.0];
        [v11 addObject:v26];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v14);
  }
  else
  {
    id v15 = 0;
  }

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __67__RTLearnedLocationEngineTrainingMetrics_submitPlace_nearbyPlaces___block_invoke;
  v34[3] = &unk_1E6B99498;
  id v35 = v11;
  id v36 = v30;
  id v27 = v30;
  id v28 = v11;
  [v28 enumerateObjectsUsingBlock:v34];
  uint64_t v29 = [(RTLearnedLocationEngineTrainingMetrics *)self awdPlaces];
  [v29 addObject:v27];
}

void __67__RTLearnedLocationEngineTrainingMetrics_submitPlace_nearbyPlaces___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = (id)objc_opt_new();
  [v7 setValue:[v3 unsignedIntValue]];
  v4 = NSNumber;
  uint64_t v5 = [*(id *)(a1 + 32) countForObject:v3];

  id v6 = [v4 numberWithUnsignedInteger:v5];
  [v7 setCount:[v6 unsignedIntValue]];

  [*(id *)(a1 + 40) addDistanceToOtherPlaces:v7];
}

- (void)startTrainingVisits
{
  self->_trainedVisits = 1;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  trainVisitsStart = self->_trainVisitsStart;
  self->_trainVisitsStart = v3;

  self->_wasDeferred = 0;
}

- (void)stopTrainingVisits
{
  self->_trainVisitsStop = [MEMORY[0x1E4F1C9C8] date];

  MEMORY[0x1F41817F8]();
}

- (double)latency
{
  if (!self->_trainVisitsStart) {
    return 0.0;
  }
  trainVisitsStop = self->_trainVisitsStop;
  if (!trainVisitsStop) {
    return 0.0;
  }
  -[NSDate timeIntervalSinceDate:](trainVisitsStop, "timeIntervalSinceDate:");
  return result;
}

- (id)description
{
  v20 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v19 = NSStringFromClass(v3);
  BOOL v4 = [(RTLearnedLocationEngineTrainingMetrics *)self trainedVisits];
  uint64_t v5 = @"NO";
  if (v4) {
    uint64_t v5 = @"YES";
  }
  uint64_t v18 = v5;
  [(RTLearnedLocationEngineTrainingMetrics *)self latency];
  uint64_t v7 = v6;
  [(RTLearnedLocationEngineTrainingMetrics *)self intervalSinceLastAttempt];
  uint64_t v9 = v8;
  unint64_t v17 = [(RTLearnedLocationEngineTrainingMetrics *)self locationsProcessed];
  [(RTLearnedLocationEngineTrainingMetrics *)self maxIntervalBetweenLocations];
  uint64_t v11 = v10;
  objc_super v12 = [(RTLearnedLocationEngineTrainingMetrics *)self awdVisits];
  uint64_t v13 = [v12 count];
  uint64_t v14 = [(RTLearnedLocationEngineTrainingMetrics *)self awdPlaces];
  id v15 = [v20 stringWithFormat:@"%@, trainedVisits, %@, latency, %.2f, intervalSinceLastAttempt, %.2f, locationsProcessed, %u, maxIntervalBetweenLocations, %.2f, new visits, %lu, places from visits, %lu, visitCountDevice, %lu, visitCountTotal, %lu, placeCountDevice, %lu, placeCountTotal, %lu, mode, %lu, reason, %lu", v19, v18, v7, v9, v17, v11, v13, [v14 count], [self visitCountDevice], [self visitCountTotal], [self placeCountDevice], [self placeCountTotal], [self mode], [self reason]];

  return v15;
}

- (id)collectCoreAnalyticsMetrics
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  BOOL v4 = [NSNumber numberWithUnsignedInteger:-[RTLearnedLocationEngineTrainingMetrics wasDeferred](self, "wasDeferred")];
  [v3 setObject:v4 forKeyedSubscript:@"_deferralReason"];

  uint64_t v5 = NSNumber;
  [(RTLearnedLocationEngineTrainingMetrics *)self intervalSinceLastAttempt];
  uint64_t v6 = [v5 numberWithDouble:];
  [v3 setObject:v6 forKeyedSubscript:@"_intervalSinceLastAttempt"];

  uint64_t v7 = NSNumber;
  [(RTLearnedLocationEngineTrainingMetrics *)self latency];
  uint64_t v8 = [v7 numberWithDouble:x0];
  [v3 setObject:v8 forKeyedSubscript:@"_duration"];

  uint64_t v9 = NSNumber;
  uint64_t v10 = [(RTLearnedLocationEngineTrainingMetrics *)self visits];
  uint64_t v11 = [v9 numberWithUnsignedInteger:[v10 count]];
  [v3 setObject:v11 forKeyedSubscript:@"_visitCountTrainingEvent"];

  objc_super v12 = NSNumber;
  uint64_t v13 = [(RTLearnedLocationEngineTrainingMetrics *)self places];
  uint64_t v14 = [v12 numberWithUnsignedInteger:[v13 count]];
  [v3 setObject:v14 forKeyedSubscript:@"_placeCountTrainingEvent"];

  id v15 = [NSNumber numberWithUnsignedInteger:-[RTLearnedLocationEngineTrainingMetrics visitCountDevice](self, "visitCountDevice")];
  [v3 setObject:v15 forKeyedSubscript:@"_visitCountDevice"];

  uint64_t v16 = [NSNumber numberWithUnsignedInteger:-[RTLearnedLocationEngineTrainingMetrics placeCountDevice](self, "placeCountDevice")];
  [v3 setObject:v16 forKeyedSubscript:@"_placeCountDevice"];

  unint64_t v17 = [[NSNumber numberWithUnsignedInteger:-[RTLearnedLocationEngineTrainingMetrics placeCountTotal](self, "placeCountTotal")];
  [v3 setObject:v17 forKeyedSubscript:@"_placeCountTotal"];

  uint64_t v18 = [NSNumber numberWithUnsignedInteger:-[RTLearnedLocationEngineTrainingMetrics visitCountTotal](self, "visitCountTotal")];
  [v3 setObject:v18 forKeyedSubscript:@"_visitCountTotal"];

  uint64_t v19 = [[NSNumber numberWithUnsignedInteger:-[RTLearnedLocationEngineTrainingMetrics mode](self, "mode")];
  [v3 setObject:v19 forKeyedSubscript:@"_trainMode"];

  v20 = [NSNumber numberWithUnsignedInteger:-[RTLearnedLocationEngineTrainingMetrics reason](self, "reason")];
  [v3 setObject:v20 forKeyedSubscript:@"_trainReason"];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v21 = self->_visits;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = 0;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v21);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "placeSource", (void)v29)) {
          ++v24;
        }
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v23);
  }
  else
  {
    uint64_t v24 = 0;
  }

  id v27 = [NSNumber numberWithUnsignedInteger:v24];
  [v3 setObject:v27 forKeyedSubscript:@"_unlabeledVisitCountTrainingEvent"];

  return v3;
}

- (void)submitToCoreAnalytics
{
  id v5 = [(RTLearnedLocationEngineTrainingMetrics *)self collectCoreAnalyticsMetrics];
  id v2 = [NSString alloc];
  id v3 = (void *)[v2 initWithCString:RTAnalyticsEventTraining encoding:1];
  log_analytics_submission(v3, v5);
  BOOL v4 = [NSString stringWithFormat:@"com.apple.%@", v3];
  AnalyticsSendEvent();
}

- (NSDate)trainVisitsStart
{
  return self->_trainVisitsStart;
}

- (NSDate)trainVisitsStop
{
  return self->_trainVisitsStop;
}

- (double)intervalSinceLastAttempt
{
  return self->_intervalSinceLastAttempt;
}

- (void)setIntervalSinceLastAttempt:(double)a3
{
  self->_intervalSinceLastAttempt = a3;
}

- (unint64_t)visitCountDevice
{
  return self->_visitCountDevice;
}

- (void)setVisitCountDevice:(unint64_t)a3
{
  self->_visitCountDevice = a3;
}

- (unint64_t)visitCountTotal
{
  return self->_visitCountTotal;
}

- (void)setVisitCountTotal:(unint64_t)a3
{
  self->_visitCountTotal = a3;
}

- (unint64_t)placeCountDevice
{
  return self->_placeCountDevice;
}

- (void)setPlaceCountDevice:(unint64_t)a3
{
  self->_placeCountDevice = a3;
}

- (unint64_t)placeCountTotal
{
  return self->_placeCountTotal;
}

- (void)setPlaceCountTotal:(unint64_t)a3
{
  self->_placeCountTotal = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (BOOL)trainedVisits
{
  return self->_trainedVisits;
}

- (void)setTrainedVisits:(BOOL)a3
{
  self->_trainedVisits = a3;
}

- (unint64_t)locationsProcessed
{
  return self->_locationsProcessed;
}

- (void)setLocationsProcessed:(unint64_t)a3
{
  self->_locationsProcessed = a3;
}

- (double)maxIntervalBetweenLocations
{
  return self->_maxIntervalBetweenLocations;
}

- (void)setMaxIntervalBetweenLocations:(double)a3
{
  self->_maxIntervalBetweenLocations = a3;
}

- (NSMutableArray)awdVisits
{
  return self->_awdVisits;
}

- (NSMutableArray)awdPlaces
{
  return self->_awdPlaces;
}

- (NSMutableArray)visits
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setVisits:(id)a3
{
}

- (NSMutableArray)places
{
  return (NSMutableArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPlaces:(id)a3
{
}

- (unint64_t)visitCountUnlabeled
{
  return self->_visitCountUnlabeled;
}

- (void)setVisitCountUnlabeled:(unint64_t)a3
{
  self->_visitCountUnlabeled = a3;
}

- (unint64_t)wasDeferred
{
  return self->_wasDeferred;
}

- (void)setWasDeferred:(unint64_t)a3
{
  self->_wasDeferred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_awdPlaces, 0);
  objc_storeStrong((id *)&self->_awdVisits, 0);
  objc_storeStrong((id *)&self->_trainVisitsStop, 0);

  objc_storeStrong((id *)&self->_trainVisitsStart, 0);
}

@end