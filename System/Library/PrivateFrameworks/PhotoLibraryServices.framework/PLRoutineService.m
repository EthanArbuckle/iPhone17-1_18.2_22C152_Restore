@interface PLRoutineService
- (BOOL)hasLocationsOfInterestInformation;
- (BOOL)isRemoteLocation:(id)a3 inDateInterval:(id)a4;
- (BOOL)routineIsAvailable;
- (NSDateInterval)fetchDateInterval;
- (NSMutableSet)pendingPinningVisitIdentifiers;
- (NSSet)allLocationsOfInterest;
- (NSSet)homeLocations;
- (NSSet)workLocations;
- (PLLocationOfInterestCache)visitsCache;
- (PLRoutineService)initWithFetchDateInterval:(id)a3;
- (id)_fetchHomeAndWorkLocationsOfInterestWithRoutineManager:(id)a3;
- (id)_fetchLocationsOfInterestWithinDateInterval:(id)a3 routineManager:(id)a4;
- (id)lastLocationOfInterestVisit;
- (id)locationOfInterestAtLocation:(id)a3;
- (id)locationOfInterestCloseToLocation:(id)a3 inDateInterval:(id)a4;
- (id)locationOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4;
- (id)locationsOfInterestOfType:(int64_t)a3;
- (void)_buildLocationsOfInterestCache;
- (void)_invalidateLocationsOfInterest;
- (void)_pinPendingVisits;
- (void)fetchLocationsOfInterestIfNeeded;
- (void)invalidateLocationsOfInterest;
- (void)postProcessLocationsOfInterest;
- (void)setFetchDateInterval:(id)a3;
- (void)setPendingPinningVisitIdentifiers:(id)a3;
- (void)setVisitsCache:(id)a3;
@end

@implementation PLRoutineService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPinningVisitIdentifiers, 0);
  objc_storeStrong((id *)&self->_visitsCache, 0);
  objc_storeStrong((id *)&self->_fetchDateInterval, 0);
}

- (BOOL)routineIsAvailable
{
  return self->_routineIsAvailable;
}

- (void)setPendingPinningVisitIdentifiers:(id)a3
{
}

- (NSMutableSet)pendingPinningVisitIdentifiers
{
  return self->_pendingPinningVisitIdentifiers;
}

- (void)setVisitsCache:(id)a3
{
}

- (void)setFetchDateInterval:(id)a3
{
}

- (NSDateInterval)fetchDateInterval
{
  return self->_fetchDateInterval;
}

- (void)_pinPendingVisits
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableSet *)self->_pendingPinningVisitIdentifiers count];
  if (self->_routineIsAvailable && v3 != 0)
  {
    unint64_t v5 = v3;
    v6 = [(PLRoutineService *)self visitsCache];
    unint64_t v7 = [v6 numberOfLocationsOfInterestVisits];

    double v8 = (double)v5;
    double v9 = (double)v7;
    if ((double)v7 * 0.8 <= (double)v5)
    {
      v10 = [(PLRoutineService *)self visitsCache];
      v11 = [v10 locationsOfInterestOfType:0];

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        unint64_t v15 = 0;
        uint64_t v16 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v45 != v16) {
              objc_enumerationMutation(v12);
            }
            v18 = [*(id *)(*((void *)&v44 + 1) + 8 * i) visits];
            v15 += [v18 count];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
        }
        while (v14);
      }
      else
      {
        unint64_t v15 = 0;
      }

      v19 = [(PLRoutineService *)self visitsCache];
      v20 = [v19 locationsOfInterestOfType:1];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v21 = v20;
      uint64_t v22 = [(PLRoutineServiceResult *)v21 countByEnumeratingWithState:&v40 objects:v52 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v41 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = [*(id *)(*((void *)&v40 + 1) + 8 * j) visits];
            v15 += [v26 count];
          }
          uint64_t v23 = [(PLRoutineServiceResult *)v21 countByEnumeratingWithState:&v40 objects:v52 count:16];
        }
        while (v23);
      }

      if (v9 * 0.9 > (double)v15)
      {
        v27 = PLBackendGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          double v49 = v8 / v9;
          __int16 v50 = 2048;
          double v51 = (double)v15 / v9;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Safeguard Pinning. Not pinning any visits. total %f, homeWork %f", buf, 0x16u);
        }

        v28 = [MEMORY[0x1E4F1CA80] set];
        pendingPinningVisitIdentifiers = self->_pendingPinningVisitIdentifiers;
        self->_pendingPinningVisitIdentifiers = v28;
LABEL_35:

        return;
      }
    }
    id v12 = [getRTRoutineManagerClass() defaultManager];
    v30 = objc_alloc_init(PLRoutineServiceResult);
    v31 = self->_pendingPinningVisitIdentifiers;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __37__PLRoutineService__pinPendingVisits__block_invoke;
    v38[3] = &unk_1E5873440;
    v21 = v30;
    v39 = (NSMutableSet *)v21;
    [v12 extendLifetimeOfVisitsWithIdentifiers:v31 handler:v38];
    if ([(PLRoutineServiceResult *)v21 waitForReplyWithTimeout:2])
    {
      v32 = [(PLRoutineServiceResult *)v21 error];
      if (v32)
      {
        v33 = PLBackendGetLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = self->_pendingPinningVisitIdentifiers;
          double v35 = [v32 localizedDescription];
          *(_DWORD *)buf = 138412546;
          double v49 = *(double *)&v34;
          __int16 v50 = 2112;
          double v51 = v35;
          _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Could not pin visit with UUIDs %@. \"%@\"", buf, 0x16u);
        }
      }
    }
    else
    {
      v32 = PLBackendGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Timeout pinning visits CoreRoutine", buf, 2u);
      }
    }

    v36 = [MEMORY[0x1E4F1CA80] set];
    v37 = self->_pendingPinningVisitIdentifiers;
    self->_pendingPinningVisitIdentifiers = v36;

    pendingPinningVisitIdentifiers = v39;
    goto LABEL_35;
  }
}

uint64_t __37__PLRoutineService__pinPendingVisits__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) receivedReplyWithResult:0 error:a2];
}

- (id)_fetchHomeAndWorkLocationsOfInterestWithRoutineManager:(id)a3
{
  id v4 = a3;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __75__PLRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke;
  uint64_t v14 = &unk_1E586B1A8;
  id v15 = v4;
  uint64_t v16 = self;
  id v5 = v4;
  v6 = (void (**)(void, void))MEMORY[0x19F38D650](&v11);
  unint64_t v7 = v6[2](v6, 0);
  if (self->_routineIsAvailable)
  {
    double v8 = v6[2](v6, 1);
    if (self->_routineIsAvailable)
    {
      double v9 = objc_msgSend(v7, "mutableCopy", v11, v12, v13, v14, v15, v16);
      [v9 addObjectsFromArray:v8];
      goto LABEL_6;
    }
  }
  else
  {
    double v8 = 0;
  }
  double v9 = 0;
LABEL_6:

  return v9;
}

id __75__PLRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(PLRoutineServiceResult);
  id v5 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__PLRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke_2;
  v19[3] = &unk_1E586B180;
  v6 = v4;
  v20 = v6;
  [v5 fetchLocationsOfInterestOfType:a2 withHandler:v19];
  if ([(PLRoutineServiceResult *)v6 waitForReplyWithTimeout:2])
  {
    unint64_t v7 = [(PLRoutineServiceResult *)v6 error];
    if (v7)
    {
      double v8 = PLBackendGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        double v9 = [v7 userInfo];
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = (uint64_t)v7;
        __int16 v23 = 2112;
        uint64_t v24 = v9;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "CoreRoutine error getting lois, error: %@, userInfo: %@", buf, 0x16u);
      }
      v10 = 0;
      *(unsigned char *)(*(void *)(a1 + 40) + 8) = 0;
LABEL_19:

      goto LABEL_20;
    }
    if ((unint64_t)(a2 + 1) >= 5)
    {
      uint64_t v14 = PLBackendGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v22 = a2;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Undefined LocationOfInterestType %ld. File a radar against Photos Media Mining.", buf, 0xCu);
      }

      unint64_t v12 = 0;
    }
    else
    {
      unint64_t v12 = qword_19BA9AE50[a2 + 1] + 1;
      if (v12 > 2)
      {
        uint64_t v13 = 0;
LABEL_16:
        id v15 = v13;
        v10 = [(PLRoutineServiceResult *)v6 result];
        uint64_t v16 = PLBackendGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = [v10 count];
          *(_DWORD *)buf = 134218242;
          uint64_t v22 = v17;
          __int16 v23 = 2112;
          uint64_t v24 = v15;
          _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "CoreRoutine found %lu lois for type %@", buf, 0x16u);
        }

        goto LABEL_19;
      }
    }
    uint64_t v13 = off_1E5876170[v12];
    goto LABEL_16;
  }
  uint64_t v11 = PLBackendGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Timeout getting loi information from CoreRoutine", buf, 2u);
  }

  v10 = 0;
  *(unsigned char *)(*(void *)(a1 + 40) + 8) = 0;
LABEL_20:

  return v10;
}

uint64_t __75__PLRoutineService__fetchHomeAndWorkLocationsOfInterestWithRoutineManager___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) receivedReplyWithResult:a2 error:a3];
}

- (id)_fetchLocationsOfInterestWithinDateInterval:(id)a3 routineManager:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(PLRoutineService *)self _fetchHomeAndWorkLocationsOfInterestWithRoutineManager:v7];
  double v9 = v8;
  if (self->_routineIsAvailable)
  {
    if (v8)
    {
      uint64_t v10 = [v8 mutableCopy];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    }
    uint64_t v11 = (void *)v10;
    if (v6)
    {
      unint64_t v12 = objc_alloc_init(PLRoutineServiceResult);
      uint64_t v13 = [v6 startDate];
      uint64_t v14 = [v6 endDate];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __79__PLRoutineService__fetchLocationsOfInterestWithinDateInterval_routineManager___block_invoke;
      v24[3] = &unk_1E586B180;
      id v15 = v12;
      uint64_t v25 = v15;
      [v7 fetchLocationsOfInterestVisitedBetweenStartDate:v13 endDate:v14 withHandler:v24];

      if ([(PLRoutineServiceResult *)v15 waitForReplyWithTimeout:2])
      {
        uint64_t v16 = [(PLRoutineServiceResult *)v15 result];
        uint64_t v17 = [(PLRoutineServiceResult *)v15 error];
        v18 = PLBackendGetLog();
        v19 = v18;
        if (v17 || !v16)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v22 = [v17 userInfo];
            *(_DWORD *)buf = 138412546;
            uint64_t v27 = (uint64_t)v17;
            __int16 v28 = 2112;
            v29 = v22;
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "CoreRoutine error getting lois, error: %@, userInfo: %@", buf, 0x16u);
          }
          self->_routineIsAvailable = 0;
        }
        else
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            uint64_t v20 = [v16 count];
            *(_DWORD *)buf = 134217984;
            uint64_t v27 = v20;
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_INFO, "CoreRoutine found %lu lois", buf, 0xCu);
          }

          [v11 addObjectsFromArray:v16];
        }
      }
      else
      {
        v21 = PLBackendGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Timeout getting loi information from CoreRoutine", buf, 2u);
        }

        self->_routineIsAvailable = 0;
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __79__PLRoutineService__fetchLocationsOfInterestWithinDateInterval_routineManager___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) receivedReplyWithResult:a2 error:a3];
}

- (void)_buildLocationsOfInterestCache
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (self->_routineIsAvailable)
  {
    v2 = self;
    v59 = objc_alloc_init(PLLocationOfInterestCache);
    uint64_t v3 = (void *)MEMORY[0x19F38D3B0]();
    id v4 = [getRTRoutineManagerClass() defaultManager];
    id v5 = [(PLRoutineService *)v2 _fetchLocationsOfInterestWithinDateInterval:v2->_fetchDateInterval routineManager:v4];
    if (v2->_routineIsAvailable && v5)
    {
      uint64_t v54 = v4;
      v55 = v3;
      v56 = v2;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v53 = v5;
      obuint64_t j = v5;
      uint64_t v60 = [obj countByEnumeratingWithState:&v70 objects:v78 count:16];
      if (v60)
      {
        uint64_t v58 = *(void *)v71;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v71 != v58) {
              objc_enumerationMutation(obj);
            }
            id v7 = *(void **)(*((void *)&v70 + 1) + 8 * v6);
            uint64_t v8 = MEMORY[0x19F38D3B0]();
            id v9 = v7;
            uint64_t v10 = [v9 type];
            uint64_t v11 = v10 + 1;
            context = (void *)v8;
            uint64_t v69 = v6;
            if ((unint64_t)(v10 + 1) >= 5)
            {
              uint64_t v14 = v10;
              id v15 = PLBackendGetLog();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v80 = v14;
                _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Undefined LocationOfInterestType %ld. File a radar against Photos Media Mining.", buf, 0xCu);
              }

              uint64_t v12 = -1;
              uint64_t v13 = &PLRoutineServiceTypeRadiusOther;
            }
            else
            {
              uint64_t v12 = qword_19BA9AE50[v11];
              uint64_t v13 = (&off_1E586B1E0)[v11];
            }
            double v16 = *(double *)v13;
            uint64_t v17 = objc_msgSend(v9, "location", v53, v54, v55, v56);
            id v18 = objc_alloc(MEMORY[0x1E4F1E5F0]);
            [v17 latitude];
            double v20 = v19;
            [v17 longitude];
            uint64_t v22 = [v18 initWithLatitude:v20 longitude:v21];
            __int16 v23 = [PLLocationOfInterestLocation alloc];
            v66 = v17;
            [v17 horizontalUncertainty];
            v65 = (void *)v22;
            uint64_t v24 = -[PLLocationOfInterestLocation initWithLocation:uncertainty:](v23, "initWithLocation:uncertainty:", v22);
            uint64_t v25 = [v9 mapItem];
            v26 = [v25 location];

            id v27 = objc_alloc(MEMORY[0x1E4F1E5F0]);
            [v26 latitude];
            double v29 = v28;
            [v26 longitude];
            uint64_t v31 = [v27 initWithLatitude:v29 longitude:v30];
            v32 = [PLLocationOfInterestLocation alloc];
            v63 = v26;
            [v26 horizontalUncertainty];
            v62 = (void *)v31;
            uint64_t v33 = -[PLLocationOfInterestLocation initWithLocation:uncertainty:](v32, "initWithLocation:uncertainty:", v31);
            v34 = [PLLocationOfInterest alloc];
            double v35 = [v9 identifier];
            v64 = (void *)v24;
            v61 = (void *)v33;
            v36 = [(PLLocationOfInterest *)v34 initWithIdentifier:v35 locationOfInterestType:v12 typeRadius:v24 routineLocation:v33 mapItemLocation:v16];

            long long v76 = 0u;
            long long v77 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            v67 = v9;
            v37 = [v9 visits];
            uint64_t v38 = [v37 countByEnumeratingWithState:&v74 objects:buf count:16];
            if (v38)
            {
              uint64_t v39 = v38;
              uint64_t v40 = *(void *)v75;
              do
              {
                for (uint64_t i = 0; i != v39; ++i)
                {
                  if (*(void *)v75 != v40) {
                    objc_enumerationMutation(v37);
                  }
                  long long v42 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                  id v43 = objc_alloc(MEMORY[0x1E4F28C18]);
                  long long v44 = [v42 entryDate];
                  long long v45 = [v42 exitDate];
                  long long v46 = (void *)[v43 initWithStartDate:v44 endDate:v45];

                  [v42 locationOfInterestConfidence];
                  double v48 = v47;
                  double v49 = [PLLocationOfInterestVisit alloc];
                  __int16 v50 = [v42 identifier];
                  double v51 = [(PLLocationOfInterestVisit *)v49 initWithIdentifier:v50 visitInterval:v46 confidence:v48];

                  [(PLLocationOfInterest *)v36 addVisit:v51];
                }
                uint64_t v39 = [v37 countByEnumeratingWithState:&v74 objects:buf count:16];
              }
              while (v39);
            }

            [(PLLocationOfInterestCache *)v59 addLocationOfInterest:v36];
            uint64_t v6 = v69 + 1;
          }
          while (v69 + 1 != v60);
          uint64_t v60 = [obj countByEnumeratingWithState:&v70 objects:v78 count:16];
        }
        while (v60);
      }

      uint64_t v3 = v55;
      v2 = v56;
      id v5 = v53;
      id v4 = v54;
    }

    visitsCache = v2->_visitsCache;
    v2->_visitsCache = v59;
  }
}

- (void)_invalidateLocationsOfInterest
{
  self->_routineIsAvailable = 1;
  visitsCache = self->_visitsCache;
  self->_visitsCache = 0;

  id v4 = [MEMORY[0x1E4F1CA80] set];
  pendingPinningVisitIdentifiers = self->_pendingPinningVisitIdentifiers;
  self->_pendingPinningVisitIdentifiers = v4;
}

- (id)lastLocationOfInterestVisit
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(PLRoutineService *)v2 visitsCache];
  id v4 = [v3 lastLocationOfInterestVisit];

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)isRemoteLocation:(id)a3 inDateInterval:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  obuint64_t j = v8;
  [(PLRoutineService *)v8 visitsCache];
  uint64_t v33 = v32 = v7;
  uint64_t v31 = [v33 locationsOfInterestVisitsInDateInterval:v7];
  if ([v31 count])
  {
    id v9 = [v33 earliestVisitStartDate];
    uint64_t v10 = [v7 startDate];
    uint64_t v11 = [v9 compare:v10];

    if (v11 != 1)
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v12 = v31;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v13)
      {
        char v14 = 0;
        uint64_t v15 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v36 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            pendingPinningVisitIdentifiers = obj->_pendingPinningVisitIdentifiers;
            uint64_t v19 = [v17 identifier];
            [(NSMutableSet *)pendingPinningVisitIdentifiers addObject:v19];

            double v20 = [v17 locationOfInterest];
            [v20 distanceFromLocation:v6];
            LOBYTE(v19) = v21 <= 50.0;

            v14 |= v19;
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v13);

        if (v14) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      id v24 = v12;
      unint64_t v25 = [v24 count];
      if (!v25)
      {
        BOOL v22 = 0;
        goto LABEL_21;
      }
      if (v25 > 2) {
        goto LABEL_18;
      }
      v26 = [v24 anyObject];
      id v27 = [v26 visitInterval];
      [v27 duration];
      double v29 = v28;

      if (v29 < 43200.0)
      {

LABEL_18:
        double v30 = 50000.0;
LABEL_19:
        id v24 = [v33 closestLocationOfInterestVisitToLocation:v6 withinDistance:v32 inDateInterval:v30];
        BOOL v22 = v24 == 0;
LABEL_21:

        goto LABEL_12;
      }

      if (v29 < 172800.0)
      {
        double v30 = 200000.0;
        goto LABEL_19;
      }
    }
  }
LABEL_11:
  BOOL v22 = 0;
LABEL_12:

  objc_sync_exit(obj);
  return v22;
}

- (id)locationOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  id v9 = [(PLRoutineService *)v8 visitsCache];
  uint64_t v10 = [v9 locationsOfInterestVisitsAtLocation:v6 inDateInterval:v7];

  objc_sync_exit(v8);
  return v10;
}

- (id)locationOfInterestAtLocation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(PLRoutineService *)v5 visitsCache];
  id v7 = [v6 locationOfInterestAtLocation:v4];

  objc_sync_exit(v5);
  return v7;
}

- (id)locationOfInterestCloseToLocation:(id)a3 inDateInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  id v9 = [(PLRoutineService *)v8 visitsCache];
  uint64_t v10 = [v9 closestLocationOfInterestVisitToLocation:v6 withinDistance:v7 inDateInterval:50.0];

  uint64_t v11 = [v10 locationOfInterest];

  objc_sync_exit(v8);
  return v11;
}

- (id)locationsOfInterestOfType:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(PLRoutineService *)v4 visitsCache];
  id v6 = [v5 locationsOfInterestOfType:a3];

  objc_sync_exit(v4);
  return v6;
}

- (NSSet)allLocationsOfInterest
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(PLRoutineService *)v2 visitsCache];
  id v4 = [v3 allLocationsOfInterest];

  objc_sync_exit(v2);
  return (NSSet *)v4;
}

- (NSSet)workLocations
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(PLRoutineService *)v2 visitsCache];
  id v4 = [v3 workLocations];

  objc_sync_exit(v2);
  return (NSSet *)v4;
}

- (NSSet)homeLocations
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(PLRoutineService *)v2 visitsCache];
  id v4 = [v3 homeLocations];

  objc_sync_exit(v2);
  return (NSSet *)v4;
}

- (void)fetchLocationsOfInterestIfNeeded
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  if (!obj->_visitsCache)
  {
    [(PLRoutineService *)obj _invalidateLocationsOfInterest];
    [(PLRoutineService *)obj _buildLocationsOfInterestCache];
  }
  objc_sync_exit(obj);
}

- (PLLocationOfInterestCache)visitsCache
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_visitsCache) {
    [(PLRoutineService *)v2 _buildLocationsOfInterestCache];
  }
  objc_sync_exit(v2);

  visitsCache = v2->_visitsCache;
  return visitsCache;
}

- (BOOL)hasLocationsOfInterestInformation
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(PLRoutineService *)v2 visitsCache];
  BOOL v4 = [v3 numberOfLocationsOfInterest] != 0;

  objc_sync_exit(v2);
  return v4;
}

- (void)postProcessLocationsOfInterest
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  [(PLRoutineService *)obj _pinPendingVisits];
  objc_sync_exit(obj);
}

- (void)invalidateLocationsOfInterest
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  [(PLRoutineService *)obj _invalidateLocationsOfInterest];
  objc_sync_exit(obj);
}

- (PLRoutineService)initWithFetchDateInterval:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLRoutineService;
  id v6 = [(PLRoutineService *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fetchDateInterval, a3);
    [(PLRoutineService *)v7 _invalidateLocationsOfInterest];
  }

  return v7;
}

@end