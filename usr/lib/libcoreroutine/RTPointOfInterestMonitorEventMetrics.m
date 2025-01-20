@interface RTPointOfInterestMonitorEventMetrics
- (NSDate)arrivalEventDate;
- (NSDate)highAccuracyLocationRequestStartDate;
- (NSDate)locationRequestTimerStartDate;
- (NSMutableArray)buildingPolygons;
- (NSMutableDictionary)metrics;
- (RTDistanceCalculator)distanceCalculator;
- (RTLocation)arrivalEventLocation;
- (RTPointOfInterestMonitorEventMetrics)init;
- (RTPointOfInterestMonitorEventMetrics)initWithDistanceCalculator:(id)a3;
- (double)calculateMaximumDistanceFromLocation:(id)a3 toLocations:(id)a4;
- (double)calculateMinimumDistanceFromLocation:(id)a3 toLocations:(id)a4;
- (id)description;
- (id)objectForKey:(id)a3;
- (void)reset;
- (void)saveBuildingPolygons:(id)a3;
- (void)setArrivalEventDate:(id)a3;
- (void)setArrivalEventLocation:(id)a3;
- (void)setHighAccuracyLocationRequestStartDate:(id)a3;
- (void)setLocationRequestTimerStartDate:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)submit;
- (void)updateBuildingPolygonMetricsForRegionIdentifer:(id)a3;
@end

@implementation RTPointOfInterestMonitorEventMetrics

- (RTPointOfInterestMonitorEventMetrics)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_);
}

- (RTPointOfInterestMonitorEventMetrics)initWithDistanceCalculator:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v19.receiver = self;
    v19.super_class = (Class)RTPointOfInterestMonitorEventMetrics;
    v6 = [(RTPointOfInterestMonitorEventMetrics *)&v19 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_distanceCalculator, a3);
      uint64_t v8 = objc_opt_new();
      metrics = v7->_metrics;
      v7->_metrics = (NSMutableDictionary *)v8;

      arrivalEventLocation = v7->_arrivalEventLocation;
      v7->_arrivalEventLocation = 0;

      arrivalEventDate = v7->_arrivalEventDate;
      v7->_arrivalEventDate = 0;

      uint64_t v12 = objc_opt_new();
      buildingPolygons = v7->_buildingPolygons;
      v7->_buildingPolygons = (NSMutableArray *)v12;

      locationRequestTimerStartDate = v7->_locationRequestTimerStartDate;
      v7->_locationRequestTimerStartDate = 0;

      highAccuracyLocationRequestStartDate = v7->_highAccuracyLocationRequestStartDate;
      v7->_highAccuracyLocationRequestStartDate = 0;

      [(RTPointOfInterestMonitorEventMetrics *)v7 reset];
    }
    self = v7;
    v16 = self;
  }
  else
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator", buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

- (void)reset
{
  [(RTPointOfInterestMonitorEventMetrics *)self setArrivalEventLocation:0];
  [(RTPointOfInterestMonitorEventMetrics *)self setArrivalEventDate:0];
  [(RTPointOfInterestMonitorEventMetrics *)self setLocationRequestTimerStartDate:0];
  [(RTPointOfInterestMonitorEventMetrics *)self setHighAccuracyLocationRequestStartDate:0];
  v3 = [(RTPointOfInterestMonitorEventMetrics *)self buildingPolygons];
  [v3 removeAllObjects];

  v4 = [(RTPointOfInterestMonitorEventMetrics *)self metrics];
  [v4 removeAllObjects];

  [(RTPointOfInterestMonitorEventMetrics *)self setObject:&unk_1F344F778 forKey:@"arrivalEvent"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:&unk_1F344F790 forKey:@"nearbyAppClipCount"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:&unk_1F344F790 forKey:@"distanceFromArrivalLocationToClosestAppClipLocation"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:&unk_1F344F790 forKey:@"buildingFenceCount"];
  uint64_t v5 = MEMORY[0x1E4F1CC28];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:MEMORY[0x1E4F1CC28] forKey:@"shouldRequestGPS"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:v5 forKey:@"exceedDailyPowerBudget"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:&unk_1F344F790 forKey:@"highAccuracyLocationRequestLatency"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:&unk_1F344F790 forKey:@"highAccuracyLocationRequestDuration"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:v5 forKey:@"isFenceBreak"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:&unk_1F344F790 forKey:@"buildingPolygonRadius"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:&unk_1F344F790 forKey:@"distanceFromArrivalLocationToBuildingPolygonCentroid"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:&unk_1F344F790 forKey:@"fenceBreakLatency"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:v5 forKey:@"isGPSRunningWhenFenceBreak"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:&unk_1F344F790 forKey:@"BluePOIQueryCount"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:v5 forKey:@"bluePOIHasResult"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:&unk_1F344F7A8 forKey:@"bluePOIConfidenceScore"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:&unk_1F344F790 forKey:@"bluePOILatency"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:v5 forKey:@"pOIHasAppClip"];
  [(RTPointOfInterestMonitorEventMetrics *)self setObject:&unk_1F344F790 forKey:@"pOIVisitDetectionLatency"];

  [(RTPointOfInterestMonitorEventMetrics *)self setObject:&unk_1F344F7A8 forKey:@"signalEnvironment"];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RTPointOfInterestMonitorEventMetrics *)self metrics];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTPointOfInterestMonitorEventMetrics *)self metrics];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)submit
{
  id v3 = [NSString alloc];
  id v4 = (void *)[v3 initWithCString:RTAnalyticsEventPointOfInterestMonitorEvent encoding:1];
  uint64_t v5 = [(RTPointOfInterestMonitorEventMetrics *)self metrics];
  log_analytics_submission(v4, v5);

  id v6 = [NSString stringWithFormat:@"com.apple.%@", v4];
  id v7 = [(RTPointOfInterestMonitorEventMetrics *)self metrics];
  AnalyticsSendEvent();

  [(RTPointOfInterestMonitorEventMetrics *)self reset];
}

- (double)calculateMinimumDistanceFromLocation:(id)a3 toLocations:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v23;
    double v12 = 1.79769313e308;
    do
    {
      uint64_t v13 = 0;
      v14 = v10;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * v13);
        v16 = [(RTPointOfInterestMonitorEventMetrics *)self distanceCalculator];
        id v21 = v14;
        [v16 distanceFromLocation:v6 toLocation:v15 error:&v21];
        double v18 = v17;
        id v10 = v21;

        if (v18 < v12 && v10 == 0) {
          double v12 = v18;
        }
        ++v13;
        v14 = v10;
      }
      while (v9 != v13);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
  else
  {
    double v12 = 1.79769313e308;
  }

  return v12;
}

- (double)calculateMaximumDistanceFromLocation:(id)a3 toLocations:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v23;
    double v12 = 2.22507386e-308;
    do
    {
      uint64_t v13 = 0;
      v14 = v10;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * v13);
        v16 = [(RTPointOfInterestMonitorEventMetrics *)self distanceCalculator];
        id v21 = v14;
        [v16 distanceFromLocation:v6 toLocation:v15 error:&v21];
        double v18 = v17;
        id v10 = v21;

        if (v18 > v12 && v10 == 0) {
          double v12 = v18;
        }
        ++v13;
        v14 = v10;
      }
      while (v9 != v13);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
  else
  {
    double v12 = 2.22507386e-308;
  }

  return v12;
}

- (void)saveBuildingPolygons:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v27 + 1) + 8 * v7);
        id v9 = objc_alloc(MEMORY[0x1E4F5CE00]);
        id v10 = [v8 centroid];
        [v10 latitude];
        double v12 = v11;
        uint64_t v13 = [v8 centroid];
        [v13 longitude];
        uint64_t v15 = (void *)[v9 initWithLatitude:0 longitude:v12 horizontalUncertainty:v14 date:-1.0];

        v16 = [_RTMap alloc];
        double v17 = [v8 vertices];
        double v18 = [(_RTMap *)v16 initWithInput:v17];
        objc_super v19 = [(_RTMap *)v18 withBlock:&__block_literal_global_1];

        [(RTPointOfInterestMonitorEventMetrics *)self calculateMaximumDistanceFromLocation:v15 toLocations:v19];
        double v21 = v20;
        id v22 = objc_alloc(MEMORY[0x1E4F5CE58]);
        long long v23 = [NSNumber numberWithDouble:v21];
        long long v24 = (void *)[v22 initWithFirstObject:v15 secondObject:v23];

        if (v24)
        {
          long long v25 = [(RTPointOfInterestMonitorEventMetrics *)self buildingPolygons];
          [v25 addObject:v24];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }
}

id __61__RTPointOfInterestMonitorEventMetrics_saveBuildingPolygons___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F5CE00];
  id v3 = a2;
  id v4 = [v2 alloc];
  [v3 latitude];
  double v6 = v5;
  [v3 longitude];
  double v8 = v7;

  id v9 = (void *)[v4 initWithLatitude:0 longitude:v6 horizontalUncertainty:v8 date:-1.0];

  return v9;
}

- (void)updateBuildingPolygonMetricsForRegionIdentifer:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 componentsSeparatedByString:@"-"];
  double v5 = [v4 objectAtIndex:1];
  unsigned int v6 = [v5 unsignedIntValue];

  double v7 = [(RTPointOfInterestMonitorEventMetrics *)self buildingPolygons];
  unint64_t v8 = [v7 count];

  if (v8 > v6)
  {
    id v9 = NSNumber;
    id v10 = [(RTPointOfInterestMonitorEventMetrics *)self buildingPolygons];
    double v11 = [v10 objectAtIndexedSubscript:v6];
    double v12 = [v11 secondObject];
    [v12 doubleValue];
    double v14 = [v9 numberWithUnsignedInteger:vcvtad_u64_f64(v13)];
    [(RTPointOfInterestMonitorEventMetrics *)self setObject:v14 forKey:@"buildingPolygonRadius"];

    uint64_t v15 = [(RTPointOfInterestMonitorEventMetrics *)self arrivalEventLocation];
    v16 = [(RTPointOfInterestMonitorEventMetrics *)self buildingPolygons];
    double v17 = [v16 objectAtIndexedSubscript:v6];
    double v18 = [v17 firstObject];
    v23[0] = v18;
    objc_super v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [(RTPointOfInterestMonitorEventMetrics *)self calculateMinimumDistanceFromLocation:v15 toLocations:v19];
    double v21 = v20;

    id v22 = [NSNumber numberWithUnsignedInteger:vcvtad_u64_f64(v21)];
    [(RTPointOfInterestMonitorEventMetrics *)self setObject:v22 forKey:@"distanceFromArrivalLocationToBuildingPolygonCentroid"];
  }
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = [(RTPointOfInterestMonitorEventMetrics *)self metrics];
  double v5 = [v3 stringWithFormat:@"RTPointOfInterestMonitorEventMetrics, %lu, ", [v4 count]];

  unsigned int v6 = [(RTPointOfInterestMonitorEventMetrics *)self metrics];
  double v7 = [v6 allKeys];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__RTPointOfInterestMonitorEventMetrics_description__block_invoke;
  v12[3] = &unk_1E6B90A68;
  v12[4] = self;
  id v8 = v5;
  id v13 = v8;
  [v7 enumerateObjectsUsingBlock:v12];

  id v9 = v13;
  id v10 = v8;

  return v10;
}

void __51__RTPointOfInterestMonitorEventMetrics_description__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 metrics];
  id v8 = [v5 valueForKey:v4];

  unsigned int v6 = *(void **)(a1 + 40);
  double v7 = [NSString stringWithFormat:@"%@, %@, ", v4, v8];

  [v6 appendString:v7];
}

- (NSDate)locationRequestTimerStartDate
{
  return self->_locationRequestTimerStartDate;
}

- (void)setLocationRequestTimerStartDate:(id)a3
{
}

- (NSDate)highAccuracyLocationRequestStartDate
{
  return self->_highAccuracyLocationRequestStartDate;
}

- (void)setHighAccuracyLocationRequestStartDate:(id)a3
{
}

- (RTLocation)arrivalEventLocation
{
  return self->_arrivalEventLocation;
}

- (void)setArrivalEventLocation:(id)a3
{
}

- (NSDate)arrivalEventDate
{
  return self->_arrivalEventDate;
}

- (void)setArrivalEventDate:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (NSMutableArray)buildingPolygons
{
  return self->_buildingPolygons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildingPolygons, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_arrivalEventDate, 0);
  objc_storeStrong((id *)&self->_arrivalEventLocation, 0);
  objc_storeStrong((id *)&self->_highAccuracyLocationRequestStartDate, 0);

  objc_storeStrong((id *)&self->_locationRequestTimerStartDate, 0);
}

@end