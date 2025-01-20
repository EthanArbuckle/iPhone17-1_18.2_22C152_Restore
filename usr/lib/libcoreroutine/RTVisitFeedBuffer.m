@interface RTVisitFeedBuffer
- (NSDate)lastMaturedLocationDate;
- (NSMutableArray)locations;
- (RTVisitFeedBuffer)init;
- (RTVisitFeedBuffer)initWithMinWaitInterval:(double)a3;
- (double)minWaitInterval;
- (id)maturedLocations;
- (unint64_t)numLocations;
- (void)addLocations:(id)a3;
- (void)setLastMaturedLocationDate:(id)a3;
- (void)setLocations:(id)a3;
@end

@implementation RTVisitFeedBuffer

uint64_t __45__RTVisitFeedBuffer_initWithMinWaitInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 date];
  v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)addLocations:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = [v4 count];
    uint64_t v20 = [(NSMutableArray *)self->_locations count];
    v21 = [(NSDate *)self->_lastMaturedLocationDate stringFromDate];
    double minWaitInterval = self->_minWaitInterval;
    *(_DWORD *)buf = 134218754;
    uint64_t v30 = v19;
    __int16 v31 = 2048;
    uint64_t v32 = v20;
    __int16 v33 = 2112;
    v34 = v21;
    __int16 v35 = 2048;
    double v36 = minWaitInterval;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "adding %lu locations to feedbuffer. numLocations, %lu, _lastMaturedLocationDate, %@, _minWaitInterval, %.2f", buf, 0x2Au);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v25;
    *(void *)&long long v8 = 138412802;
    long long v23 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        if (self->_lastMaturedLocationDate
          && ([*(id *)(*((void *)&v24 + 1) + 8 * v11) date],
              v13 = objc_claimAutoreleasedReturnValue(),
              int v14 = [v13 isOnOrBefore:self->_lastMaturedLocationDate],
              v13,
              v14))
        {
          v15 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = [(NSDate *)self->_lastMaturedLocationDate stringFromDate];
            v17 = [v12 date];
            [v17 timeIntervalSinceDate:self->_lastMaturedLocationDate];
            *(_DWORD *)buf = v23;
            uint64_t v30 = (uint64_t)v12;
            __int16 v31 = 2112;
            uint64_t v32 = (uint64_t)v16;
            __int16 v33 = 2048;
            v34 = v18;
            _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_INFO, "discarding location, %@, predates last matured location with date, %@, by interval, %.2f", buf, 0x20u);
          }
        }
        else
        {
          -[NSMutableArray insertObject:atIndex:](self->_locations, "insertObject:atIndex:", v12, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_locations, "indexOfObject:inSortedRange:options:usingComparator:", v12, 0, [(NSMutableArray *)self->_locations count], 1280, self->_comparator));
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }
}

- (unint64_t)numLocations
{
  return [(NSMutableArray *)self->_locations count];
}

- (double)minWaitInterval
{
  return self->_minWaitInterval;
}

- (id)maturedLocations
{
  if ([(NSMutableArray *)self->_locations count])
  {
    if (self->_minWaitInterval <= 0.0)
    {
      v16 = self->_locations;
      v17 = (NSMutableArray *)objc_opt_new();
      locations = self->_locations;
      self->_locations = v17;
    }
    else
    {
      v3 = [MEMORY[0x1E4F1C9C8] date];
      locations = [v3 dateByAddingTimeInterval:-self->_minWaitInterval];

      id v5 = objc_alloc(MEMORY[0x1E4F5CE00]);
      id v6 = [(NSMutableArray *)self->_locations lastObject];
      [v6 latitude];
      double v8 = v7;
      uint64_t v9 = [(NSMutableArray *)self->_locations lastObject];
      [v9 longitude];
      double v11 = v10;
      v12 = [(NSMutableArray *)self->_locations lastObject];
      [v12 horizontalUncertainty];
      int v14 = (void *)[v5 initWithLatitude:locations longitude:v8 horizontalUncertainty:v11 date:v13];

      uint64_t v15 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_locations, "indexOfObject:inSortedRange:options:usingComparator:", v14, 0, [(NSMutableArray *)self->_locations count], 1280, self->_comparator);
      -[NSMutableArray subarrayWithRange:](self->_locations, "subarrayWithRange:", 0, v15);
      v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectsInRange:](self->_locations, "removeObjectsInRange:", 0, v15);
    }
    if ([(NSMutableArray *)v16 count])
    {
      v18 = [(NSMutableArray *)v16 lastObject];
      uint64_t v19 = [v18 date];
      lastMaturedLocationDate = self->_lastMaturedLocationDate;
      self->_lastMaturedLocationDate = v19;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (RTVisitFeedBuffer)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMinWaitInterval_);
}

- (RTVisitFeedBuffer)initWithMinWaitInterval:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RTVisitFeedBuffer;
  id v4 = [(RTVisitFeedBuffer *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    v4->_double minWaitInterval = a3;
    uint64_t v6 = objc_opt_new();
    locations = v5->_locations;
    v5->_locations = (NSMutableArray *)v6;

    id comparator = v5->_comparator;
    v5->_id comparator = &__block_literal_global_55;
  }
  return v5;
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (NSDate)lastMaturedLocationDate
{
  return self->_lastMaturedLocationDate;
}

- (void)setLastMaturedLocationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMaturedLocationDate, 0);
  objc_storeStrong((id *)&self->_locations, 0);

  objc_storeStrong(&self->_comparator, 0);
}

@end