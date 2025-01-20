@interface PLLocationOfInterestCache
- (NSDate)earliestVisitStartDate;
- (NSMutableDictionary)visitsCache;
- (NSMutableSet)allLocationsOfInterest;
- (NSMutableSet)homeLocations;
- (NSMutableSet)workLocations;
- (PLLocationOfInterestCache)init;
- (PLLocationOfInterestVisit)lastLocationOfInterestVisit;
- (id)closestLocationOfInterestVisitToLocation:(id)a3 withinDistance:(double)a4 inDateInterval:(id)a5;
- (id)locationOfInterestAtLocation:(id)a3;
- (id)locationsOfInterestOfType:(int64_t)a3;
- (id)locationsOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4;
- (id)locationsOfInterestVisitsInDateInterval:(id)a3;
- (unint64_t)numberOfLocationsOfInterest;
- (unint64_t)numberOfLocationsOfInterestTransitions;
- (unint64_t)numberOfLocationsOfInterestVisits;
- (void)addLocationOfInterest:(id)a3;
- (void)setAllLocationsOfInterest:(id)a3;
- (void)setHomeLocations:(id)a3;
- (void)setVisitsCache:(id)a3;
- (void)setWorkLocations:(id)a3;
@end

@implementation PLLocationOfInterestCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocationOfInterestVisit, 0);
  objc_storeStrong((id *)&self->_earliestVisitStartDate, 0);
  objc_storeStrong((id *)&self->_workLocations, 0);
  objc_storeStrong((id *)&self->_homeLocations, 0);
  objc_storeStrong((id *)&self->_allLocationsOfInterest, 0);
  objc_storeStrong((id *)&self->_visitsCache, 0);
}

- (unint64_t)numberOfLocationsOfInterestTransitions
{
  return self->_numberOfLocationsOfInterestTransitions;
}

- (PLLocationOfInterestVisit)lastLocationOfInterestVisit
{
  return (PLLocationOfInterestVisit *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)earliestVisitStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)numberOfLocationsOfInterestVisits
{
  return self->_numberOfLocationsOfInterestVisits;
}

- (void)setWorkLocations:(id)a3
{
}

- (NSMutableSet)workLocations
{
  return self->_workLocations;
}

- (void)setHomeLocations:(id)a3
{
}

- (NSMutableSet)homeLocations
{
  return self->_homeLocations;
}

- (void)setAllLocationsOfInterest:(id)a3
{
}

- (NSMutableSet)allLocationsOfInterest
{
  return self->_allLocationsOfInterest;
}

- (void)setVisitsCache:(id)a3
{
}

- (NSMutableDictionary)visitsCache
{
  return self->_visitsCache;
}

- (unint64_t)numberOfLocationsOfInterest
{
  v2 = [(PLLocationOfInterestCache *)self allLocationsOfInterest];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)locationsOfInterestVisitsInDateInterval:(id)a3
{
  return [(PLLocationOfInterestCache *)self locationsOfInterestVisitsAtLocation:0 inDateInterval:a3];
}

- (id)locationsOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = v6;
  v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v10 = [v8 startDate];
  uint64_t v11 = objc_msgSend(v9, "pl_validDateForDate:", v10);

  v12 = [v8 endDate];
  v13 = objc_msgSend(v9, "pl_validDateForDate:", v12);

  v37 = (void *)v11;
  v14 = objc_msgSend(v9, "pl_startOfDayForDate:", v11);
  v15 = [MEMORY[0x1E4F1CA48] array];
  if ([v14 compare:v13] == -1)
  {
    v39 = v13;
    do
    {
      v17 = [v9 components:28 fromDate:v14];
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"%ld-%ld-%ld", objc_msgSend(v17, "year"), objc_msgSend(v17, "month"), objc_msgSend(v17, "day"));
      [v15 addObject:v18];
      v16 = [v9 dateByAddingUnit:16 value:1 toDate:v14 options:0];

      v13 = v39;
      v14 = v16;
    }
    while ([v16 compare:v39] == -1);
  }
  else
  {
    v16 = v14;
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v15;
  uint64_t v36 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v45;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v19;
        v20 = [(NSMutableDictionary *)self->_visitsCache objectForKeyedSubscript:*(void *)(*((void *)&v44 + 1) + 8 * v19)];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v41 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              v26 = [v25 visitInterval];
              int v27 = [v26 intersectsDateInterval:v8];

              if (v27)
              {
                if (v5)
                {
                  v28 = [v25 locationOfInterest];
                  v29 = v28;
                  if (v28)
                  {
                    [v28 centerDistanceFromLocation:v5];
                    if (v30 <= 2.22044605e-16) {
                      [v7 addObject:v25];
                    }
                  }
                  else
                  {
                    v31 = PLBackendGetLog();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138477827;
                      v49 = v25;
                      _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "LOI nil for visit %{private}@", buf, 0xCu);
                    }
                  }
                }
                else
                {
                  [v7 addObject:v25];
                }
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v50 count:16];
          }
          while (v22);
        }

        uint64_t v19 = v38 + 1;
      }
      while (v38 + 1 != v36);
      uint64_t v36 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v36);
  }

  return v7;
}

- (id)locationOfInterestAtLocation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLLocationOfInterestCache.m", 163, @"Invalid parameter not satisfying: %@", @"location != nil" object file lineNumber description];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(PLLocationOfInterestCache *)self allLocationsOfInterest];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v12 centerDistanceFromLocation:v5];
        if (v13 <= 2.22044605e-16)
        {
          id v14 = v12;

          v9 = v14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)closestLocationOfInterestVisitToLocation:(id)a3 withinDistance:(double)a4 inDateInterval:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PLLocationOfInterestCache.m", 133, @"Invalid parameter not satisfying: %@", @"location != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"PLLocationOfInterestCache.m", 134, @"Invalid parameter not satisfying: %@", @"dateInterval != nil" object file lineNumber description];

LABEL_3:
  v12 = [(PLLocationOfInterestCache *)self locationsOfInterestVisitsInDateInterval:v11];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v13 = (void *)[v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  id v14 = 0;
  if (v13)
  {
    uint64_t v15 = *(void *)v27;
    double v16 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v19 = [v18 locationOfInterest];
        [v19 distanceFromLocation:v9];
        if (v20 < v16)
        {
          double v21 = v20;
          id v22 = v18;

          double v16 = v21;
          id v14 = v22;
        }
      }
      double v13 = (void *)[v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
    if (v14 && v16 - a4 <= 2.22044605e-16)
    {
      id v14 = v14;
      double v13 = v14;
    }
  }

  return v13;
}

- (id)locationsOfInterestOfType:(int64_t)a3
{
  if (a3 == -1)
  {
    unint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
  }
  else if (a3 == 1)
  {
    unint64_t v3 = [(PLLocationOfInterestCache *)self workLocations];
  }
  else if (a3)
  {
    unint64_t v3 = 0;
  }
  else
  {
    unint64_t v3 = [(PLLocationOfInterestCache *)self homeLocations];
  }
  return v3;
}

- (void)addLocationOfInterest:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PLLocationOfInterestCache.m", 56, @"Invalid parameter not satisfying: %@", @"locationOfInterest != nil" object file lineNumber description];
  }
  id v6 = [v5 visits];
  if ([(NSMutableSet *)self->_allLocationsOfInterest containsObject:v5])
  {
    uint64_t v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v58 = v5;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "[RoutineCache] LOI already existing in cache. %@", buf, 0xCu);
    }
    goto LABEL_38;
  }
  self->_numberOfLocationsOfInterestVisits += [v6 count];
  [(NSMutableSet *)self->_allLocationsOfInterest addObject:v5];
  if (![v5 type])
  {
    uint64_t v8 = 24;
    goto LABEL_10;
  }
  if ([v5 type] == 1)
  {
    uint64_t v8 = 32;
LABEL_10:
    [*(id *)((char *)&self->super.isa + v8) addObject:v5];
  }
  v33 = v6;
  id v34 = v5;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v6;
  uint64_t v37 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  uint64_t v7 = 0;
  if (v37)
  {
    uint64_t v36 = *(void *)v52;
    p_lastLocationOfInterestVisit = (id *)&self->_lastLocationOfInterestVisit;
    location = (id *)&self->_earliestVisitStartDate;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v51 + 1) + 8 * v9);
        uint64_t v11 = [v10 visitInterval];
        v12 = [v11 startDate];
        double v13 = [v11 endDate];
        if (!*location || [*location compare:v12] == 1) {
          objc_storeStrong(location, v12);
        }
        long long v43 = v11;
        uint64_t v44 = v9;
        long long v41 = v13;
        long long v42 = v12;
        if (!*p_lastLocationOfInterestVisit || [v7 compare:v13] == -1)
        {
          objc_storeStrong(p_lastLocationOfInterestVisit, v10);
          id v14 = v13;

          long long v45 = v14;
        }
        else
        {
          long long v45 = v7;
        }
        uint64_t v15 = [v10 visitInterval];
        double v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        long long v17 = [v15 startDate];
        uint64_t v18 = objc_msgSend(v16, "pl_validDateForDate:", v17);

        long long v19 = [v15 endDate];
        double v20 = objc_msgSend(v16, "pl_validDateForDate:", v19);

        double v21 = objc_msgSend(v16, "pl_startOfDayForDate:", v18);
        [MEMORY[0x1E4F1CA48] array];
        v46 = long long v40 = (void *)v18;
        if ([v21 compare:v20] == -1)
        {
          do
          {
            uint64_t v23 = [v16 components:28 fromDate:v21];
            v24 = objc_msgSend(NSString, "stringWithFormat:", @"%ld-%ld-%ld", objc_msgSend(v23, "year"), objc_msgSend(v23, "month"), objc_msgSend(v23, "day"));
            [v46 addObject:v24];
            id v22 = [v16 dateByAddingUnit:16 value:1 toDate:v21 options:0];

            double v21 = v22;
          }
          while ([v22 compare:v20] == -1);
        }
        else
        {
          id v22 = v21;
        }

        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v25 = v46;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v48 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v47 + 1) + 8 * i);
              uint64_t v31 = [(NSMutableDictionary *)self->_visitsCache objectForKeyedSubscript:v30];
              if (!v31)
              {
                uint64_t v31 = [MEMORY[0x1E4F1CA48] array];
                [(NSMutableDictionary *)self->_visitsCache setObject:v31 forKeyedSubscript:v30];
              }
              [v31 addObject:v10];
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v47 objects:v55 count:16];
          }
          while (v27);
        }

        uint64_t v7 = v45;
        uint64_t v9 = v44 + 1;
      }
      while (v44 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v37);
  }

  id v6 = v33;
  id v5 = v34;
LABEL_38:
}

- (PLLocationOfInterestCache)init
{
  v12.receiver = self;
  v12.super_class = (Class)PLLocationOfInterestCache;
  v2 = [(PLLocationOfInterestCache *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    visitsCache = v2->_visitsCache;
    v2->_visitsCache = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    allLocationsOfInterest = v2->_allLocationsOfInterest;
    v2->_allLocationsOfInterest = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    homeLocations = v2->_homeLocations;
    v2->_homeLocations = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    workLocations = v2->_workLocations;
    v2->_workLocations = (NSMutableSet *)v9;
  }
  return v2;
}

@end