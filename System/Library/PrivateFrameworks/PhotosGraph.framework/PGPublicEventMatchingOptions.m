@interface PGPublicEventMatchingOptions
- (CLLocationCoordinate2D)coordinates;
- (CLSTimeLocationTuple)timeLocationTuple;
- (NSArray)temporalClusterEvents;
- (NSDateInterval)actualAttendanceDateInterval;
- (NSDateInterval)expandedAttendanceDateInterval;
- (PGGraphMomentNode)momentNode;
- (PGMeaningfulEventMatchingCriteria)matchingCriteria;
- (PGMeaningfulEventProcessorCache)meaningfulEventProcessorCache;
- (PGPublicEventMatchingOptions)initWithTimeLocationTuple:(id)a3 momentNode:(id)a4 meaningfulEventProcessorCache:(id)a5 serviceManager:(id)a6;
- (id)_readTemporalClusterEvents;
- (void)_createAttendanceDateIntervals;
@end

@implementation PGPublicEventMatchingOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporalClusterEvents, 0);
  objc_storeStrong((id *)&self->_matchingCriteria, 0);
  objc_storeStrong((id *)&self->_expandedAttendanceDateInterval, 0);
  objc_storeStrong((id *)&self->_actualAttendanceDateInterval, 0);
  objc_storeStrong((id *)&self->_momentNode, 0);
  objc_storeStrong((id *)&self->_timeLocationTuple, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
}

- (CLLocationCoordinate2D)coordinates
{
  double latitude = self->_coordinates.latitude;
  double longitude = self->_coordinates.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (PGGraphMomentNode)momentNode
{
  return self->_momentNode;
}

- (CLSTimeLocationTuple)timeLocationTuple
{
  return self->_timeLocationTuple;
}

- (PGMeaningfulEventProcessorCache)meaningfulEventProcessorCache
{
  return self->_meaningfulEventProcessorCache;
}

- (id)_readTemporalClusterEvents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(PGGraphMomentNode *)self->_momentNode universalStartDate];
  uint64_t v4 = [(PGGraphMomentNode *)self->_momentNode universalEndDate];
  v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7 = [MEMORY[0x1E4F1C978] array];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F76DC0]);
    id v14 = 0;
    v9 = [v8 eventsBetweenStartDate:v3 endDate:v5 error:&v14];
    id v10 = v14;
    v11 = v10;
    if (v9)
    {
      id v12 = v9;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PublicEvents] Error reading temporal cluster events - %{pubilc}@", buf, 0xCu);
      }
      id v12 = [MEMORY[0x1E4F1C978] array];
    }
    v7 = v12;
  }
  return v7;
}

- (void)_createAttendanceDateIntervals
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [(CLSTimeLocationTuple *)self->_timeLocationTuple startDate];
  uint64_t v4 = [(CLSTimeLocationTuple *)self->_timeLocationTuple endDate];
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v3 endDate:v4];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:self->_coordinates.latitude longitude:self->_coordinates.longitude];
  v29 = (void *)v5;
  BOOL v6 = -[CLSServiceManager fetchLocationOfInterestVisitsAtLocation:inDateInterval:](self->_serviceManager, "fetchLocationOfInterestVisitsAtLocation:inDateInterval:");
  uint64_t v27 = [v6 count];
  id v7 = v3;
  id v8 = v4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  v30 = v8;
  v31 = v7;
  v11 = v7;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v33;
    v11 = v7;
    do
    {
      uint64_t v14 = 0;
      v15 = v11;
      v16 = v8;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = [*(id *)(*((void *)&v32 + 1) + 8 * v14) visitInterval];
        v18 = [v17 startDate];
        v11 = [v15 earlierDate:v18];

        v19 = [v17 endDate];
        id v8 = [v16 laterDate:v19];

        ++v14;
        v15 = v11;
        v16 = v8;
      }
      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v12);
  }

  v20 = (NSDateInterval *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 endDate:v8];
  if (!v27)
  {
    uint64_t v21 = [(CLSTimeLocationTuple *)self->_timeLocationTuple expandedStartDate];

    uint64_t v22 = [(CLSTimeLocationTuple *)self->_timeLocationTuple expandedEndDate];

    v11 = (void *)v21;
    id v8 = (id)v22;
  }
  actualAttendanceDateInterval = self->_actualAttendanceDateInterval;
  self->_actualAttendanceDateInterval = v20;
  v24 = v20;

  v25 = (NSDateInterval *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 endDate:v8];
  expandedAttendanceDateInterval = self->_expandedAttendanceDateInterval;
  self->_expandedAttendanceDateInterval = v25;
}

- (NSArray)temporalClusterEvents
{
  temporalClusterEvents = self->_temporalClusterEvents;
  if (!temporalClusterEvents)
  {
    uint64_t v4 = [(PGPublicEventMatchingOptions *)self _readTemporalClusterEvents];
    uint64_t v5 = self->_temporalClusterEvents;
    self->_temporalClusterEvents = v4;

    temporalClusterEvents = self->_temporalClusterEvents;
  }
  return temporalClusterEvents;
}

- (PGMeaningfulEventMatchingCriteria)matchingCriteria
{
  matchingCriteria = self->_matchingCriteria;
  if (!matchingCriteria)
  {
    uint64_t v4 = [[PGMeaningfulEventMatchingCriteria alloc] initWithMoment:self->_momentNode cache:self->_meaningfulEventProcessorCache serviceManager:self->_serviceManager];
    uint64_t v5 = self->_matchingCriteria;
    self->_matchingCriteria = v4;

    matchingCriteria = self->_matchingCriteria;
  }
  return matchingCriteria;
}

- (NSDateInterval)expandedAttendanceDateInterval
{
  expandedAttendanceDateInterval = self->_expandedAttendanceDateInterval;
  if (!expandedAttendanceDateInterval)
  {
    [(PGPublicEventMatchingOptions *)self _createAttendanceDateIntervals];
    expandedAttendanceDateInterval = self->_expandedAttendanceDateInterval;
  }
  return expandedAttendanceDateInterval;
}

- (NSDateInterval)actualAttendanceDateInterval
{
  actualAttendanceDateInterval = self->_actualAttendanceDateInterval;
  if (!actualAttendanceDateInterval)
  {
    [(PGPublicEventMatchingOptions *)self _createAttendanceDateIntervals];
    actualAttendanceDateInterval = self->_actualAttendanceDateInterval;
  }
  return actualAttendanceDateInterval;
}

- (PGPublicEventMatchingOptions)initWithTimeLocationTuple:(id)a3 momentNode:(id)a4 meaningfulEventProcessorCache:(id)a5 serviceManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = (PGMeaningfulEventProcessorCache *)a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PGPublicEventMatchingOptions;
  v15 = [(PGPublicEventMatchingOptions *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_timeLocationTuple, a3);
    objc_storeStrong((id *)&v16->_momentNode, a4);
    [v11 coordinates];
    v16->_coordinates.double latitude = v17;
    v16->_coordinates.double longitude = v18;
    v16->_meaningfulEventProcessorCache = v13;
    objc_storeStrong((id *)&v16->_serviceManager, a6);
  }

  return v16;
}

@end