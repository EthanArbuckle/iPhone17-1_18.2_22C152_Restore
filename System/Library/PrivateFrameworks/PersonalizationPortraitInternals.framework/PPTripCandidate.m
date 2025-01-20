@interface PPTripCandidate
- (BOOL)canBeMergedWithTripCandidate:(id)a3;
- (BOOL)canBeMergedWithTripCandidate:(id)a3 supportsGroundTransportEvents:(BOOL)a4;
- (BOOL)shouldPromoteToTripEvent;
- (NSArray)flights;
- (NSArray)groundTransports;
- (NSArray)hotels;
- (NSArray)others;
- (PPTripCandidate)initWithTripCandidateA:(id)a3 andTripCandidateB:(id)a4;
- (id)allEvents;
- (id)eventsTimeRange;
- (id)partFromEvents:(uint64_t)a3 tripMode:(void *)a4 takingLocationFromEvent:;
- (id)reverseGeocodedLocation:(void *)a1;
- (id)tripEventFromCandidate;
- (void)setFlights:(id)a3;
- (void)setGroundTransports:(id)a3;
- (void)setHotels:(id)a3;
- (void)setOthers:(id)a3;
@end

@implementation PPTripCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groundTransports, 0);
  objc_storeStrong((id *)&self->_others, 0);
  objc_storeStrong((id *)&self->_hotels, 0);
  objc_storeStrong((id *)&self->_flights, 0);
}

- (void)setGroundTransports:(id)a3
{
}

- (NSArray)groundTransports
{
  return self->_groundTransports;
}

- (void)setOthers:(id)a3
{
}

- (NSArray)others
{
  return self->_others;
}

- (void)setHotels:(id)a3
{
}

- (NSArray)hotels
{
  return self->_hotels;
}

- (void)setFlights:(id)a3
{
}

- (NSArray)flights
{
  return self->_flights;
}

- (id)tripEventFromCandidate
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v3 = -[PPTripCandidate allEvents](self);
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    LOBYTE(v9) = 0;
    id v52 = v6;
    uint64_t v53 = *(void *)v55;
    v49 = v5;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v55 != v53) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v54 + 1) + 8 * v10);
        int v12 = objc_msgSend(v11, "pp_suggestedCategory");
        int v13 = v12;
        if ((_BYTE)v9)
        {
          uint64_t v14 = v9;
          if (v9 == 1 && v12 == 1)
          {
            uint64_t v15 = [v6 indexOfObject:v11] - 1;
            if (v15 >= 0)
            {
              v16 = [v6 objectAtIndexedSubscript:v15];
              v17 = v16;
              if (self)
              {
                id v18 = v16;
                v19 = [v11 startDate];
                v20 = [v18 endDate];

                [v19 timeIntervalSinceDate:v20];
                double v22 = v21;
              }
              else
              {
                double v22 = 0.0;
              }
              if (v22 / 60.0 / 60.0 <= 24.0)
              {
                [v4 addObject:v11];
              }
              else
              {
                v51 = -[PPTripCandidate partFromEvents:tripMode:takingLocationFromEvent:]((uint64_t)self, v4, 1, v11);
                objc_msgSend(v5, "addObject:");
                v23 = objc_opt_new();

                v50 = v23;
                [v23 addObject:v11];
                v24 = [v17 endDate];
                v25 = [v11 startDate];
                id v26 = v11;
                id v27 = v24;
                id v28 = v25;
                if (self)
                {
                  v29 = [v26 structuredLocation];
                  v30 = [v29 geoLocation];
                  v31 = -[PPTripCandidate reverseGeocodedLocation:](v30);

                  id v32 = objc_alloc(MEMORY[0x1E4F89FC0]);
                  v33 = v32;
                  if (v31)
                  {
                    v34 = (void *)[v32 initWithStartDate:v27 endDate:v28 eventIdentifiers:MEMORY[0x1E4F1CBF0] mode:2 location:v31 fallbackLocationString:0];
                  }
                  else
                  {
                    v38 = objc_msgSend(v26, "pp_locationString");
                    v34 = (void *)[v33 initWithStartDate:v27 endDate:v28 eventIdentifiers:MEMORY[0x1E4F1CBF0] mode:2 location:0 fallbackLocationString:v38];
                  }
                }
                else
                {
                  v34 = 0;
                }
                v5 = v49;

                [v49 addObject:v34];
                v4 = v50;
              }
              id v6 = v52;
            }
            uint64_t v9 = 1;
          }
          else
          {
            v35 = [v4 lastObject];
            v36 = -[PPTripCandidate partFromEvents:tripMode:takingLocationFromEvent:]((uint64_t)self, v4, v14, v35);

            [v5 addObject:v36];
            v37 = objc_opt_new();

            [v37 addObject:v11];
            if (self && (v13 - 1) <= 9) {
              uint64_t v9 = byte_1CAB7BCC2[(v13 - 1)];
            }
            else {
              uint64_t v9 = 0;
            }

            v4 = v37;
            id v6 = v52;
          }
        }
        else
        {
          if (self && (v12 - 1) <= 9) {
            uint64_t v9 = byte_1CAB7BCC2[(v12 - 1)];
          }
          else {
            uint64_t v9 = 0;
          }
          [v4 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v39 = [v6 countByEnumeratingWithState:&v54 objects:v58 count:16];
      uint64_t v8 = v39;
    }
    while (v39);
  }
  else
  {
    uint64_t v9 = 0;
  }

  if ([v4 count])
  {
    v40 = [v4 lastObject];
    v41 = -[PPTripCandidate partFromEvents:tripMode:takingLocationFromEvent:]((uint64_t)self, v4, v9, v40);

    [v5 addObject:v41];
  }
  id v42 = objc_alloc(MEMORY[0x1E4F89FB0]);
  v43 = [v6 firstObject];
  v44 = [v43 startDate];
  v45 = [v6 lastObject];
  v46 = [v45 endDate];
  v47 = (void *)[v42 initWithStartDate:v44 endDate:v46 tripParts:v5];

  return v47;
}

- (id)allEvents
{
  id v1 = a1;
  if (a1)
  {
    v2 = objc_opt_new();
    v3 = [v1 flights];
    [v2 addObjectsFromArray:v3];

    v4 = [v1 hotels];
    [v2 addObjectsFromArray:v4];

    v5 = [v1 others];
    [v2 addObjectsFromArray:v5];

    id v6 = [v1 groundTransports];
    [v2 addObjectsFromArray:v6];

    id v1 = [v2 sortedArrayUsingSelector:sel_compareStartDateWithEvent_];
  }
  return v1;
}

- (id)partFromEvents:(uint64_t)a3 tripMode:(void *)a4 takingLocationFromEvent:
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a1)
  {
    uint64_t v10 = [v8 structuredLocation];
    v11 = [v10 geoLocation];
    int v12 = -[PPTripCandidate reverseGeocodedLocation:](v11);

    id v13 = objc_alloc(MEMORY[0x1E4F89FC0]);
    uint64_t v14 = [v7 firstObject];
    uint64_t v15 = [v14 startDate];
    v16 = [v7 lastObject];
    v17 = [v16 endDate];
    id v18 = [v7 valueForKey:@"eventIdentifier"];
    if (v12)
    {
      v19 = (void *)[v13 initWithStartDate:v15 endDate:v17 eventIdentifiers:v18 mode:a3 location:v12 fallbackLocationString:0];
    }
    else
    {
      objc_msgSend(v9, "pp_locationString");
      v20 = double v22 = v9;
      v19 = (void *)[v13 initWithStartDate:v15 endDate:v17 eventIdentifiers:v18 mode:a3 location:0 fallbackLocationString:v20];

      uint64_t v9 = v22;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)reverseGeocodedLocation:(void *)a1
{
  id v1 = a1;
  if (v1)
  {
    v3 = objc_opt_new();
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__9135;
    v17 = __Block_byref_object_dispose__9136;
    id v18 = 0;
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    uint64_t v9 = __43__PPTripCandidate_reverseGeocodedLocation___block_invoke;
    uint64_t v10 = &unk_1E65D8E40;
    int v12 = &v13;
    v5 = v4;
    v11 = v5;
    [v3 reverseGeocodeLocation:v1 completionHandler:&v7];
    if (objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:timeoutSeconds:", v5, 1.0, v7, v8, v9, v10) == 1) {
      id v2 = 0;
    }
    else {
      id v2 = (id)v14[5];
    }

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

intptr_t __43__PPTripCandidate_reverseGeocodedLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v6);
}

- (BOOL)shouldPromoteToTripEvent
{
  uint64_t v3 = [(PPTripCandidate *)self flights];
  if ([v3 count] != 1)
  {

    goto LABEL_7;
  }
  uint64_t v4 = [(PPTripCandidate *)self hotels];
  uint64_t v5 = [v4 count];

  if (v5)
  {
LABEL_7:
    uint64_t v8 = [(PPTripCandidate *)self flights];
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = objc_msgSend(v9, "pp_airports");
    id v6 = [v10 first];

    v11 = [(PPTripCandidate *)self flights];
    int v12 = [v11 lastObject];
    uint64_t v13 = objc_msgSend(v12, "pp_airports");
    uint64_t v14 = [v13 second];

    uint64_t v15 = [(PPTripCandidate *)self flights];
    if ((unint64_t)[v15 count] >= 2
      && v6
      && v14
      && ![v6 isEqualToPPFlightAirport:v14])
    {
      v19 = [(PPTripCandidate *)self hotels];
      uint64_t v20 = [v19 count];

      if (!v20)
      {
        v17 = pp_events_log_handle();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_14;
        }
        __int16 v24 = 0;
        double v21 = "[TripCandidate shouldPromoteToTripEvent] discarding candidate: Flight round trip doesn't start and end at the same place.";
        double v22 = (uint8_t *)&v24;
        goto LABEL_22;
      }
    }
    else
    {
    }
    -[PPTripCandidate eventsTimeRange](self);
    if ((double)v16 / 60.0 / 60.0 / 24.0 <= 120.0)
    {
      BOOL v7 = 1;
      goto LABEL_16;
    }
    v17 = pp_events_log_handle();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
LABEL_14:

      BOOL v7 = 0;
LABEL_16:

      goto LABEL_17;
    }
    __int16 v23 = 0;
    double v21 = "[TripCandidate shouldPromoteToTripEvent] discarding candidate: Candidate longer than 2 months";
    double v22 = (uint8_t *)&v23;
LABEL_22:
    _os_log_debug_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEBUG, v21, v22, 2u);
    goto LABEL_14;
  }
  id v6 = pp_events_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "[TripCandidate shouldPromoteToTripEvent] discarding candidate: Single flight with no hotel", buf, 2u);
  }
  BOOL v7 = 0;
LABEL_17:

  return v7;
}

- (id)eventsTimeRange
{
  id v1 = a1;
  if (a1)
  {
    id v2 = -[PPTripCandidate allEvents](a1);
    uint64_t v3 = [v2 firstObject];
    uint64_t v4 = [v3 startDate];

    uint64_t v5 = -[PPTripCandidate allEvents](v1);
    id v6 = [v5 lastObject];
    BOOL v7 = [v6 endDate];

    [v4 timeIntervalSinceReferenceDate];
    id v1 = (id)v8;
    [v7 timeIntervalSinceDate:v4];
  }
  return v1;
}

- (BOOL)canBeMergedWithTripCandidate:(id)a3
{
  return [(PPTripCandidate *)self canBeMergedWithTripCandidate:a3 supportsGroundTransportEvents:0];
}

- (BOOL)canBeMergedWithTripCandidate:(id)a3 supportsGroundTransportEvents:(BOOL)a4
{
  BOOL v6 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(PPTripCandidate *)self flights];
  uint64_t v10 = [v9 count];
  if (v10)
  {
    uint64_t v4 = [v8 hotels];
    uint64_t v11 = [v4 count];
    BOOL v12 = v11 != 0;
    if (v11 || !v6) {
      goto LABEL_11;
    }
  }
  else if (!v6)
  {
    BOOL v12 = 0;
    goto LABEL_12;
  }
  uint64_t v13 = [v8 hotels];
  if (![v13 count])
  {

    BOOL v12 = 0;
    if (!v10) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v5 = [(PPTripCandidate *)self groundTransports];
  BOOL v12 = [v5 count] != 0;

  if (v10) {
LABEL_11:
  }

LABEL_12:
  uint64_t v14 = [(PPTripCandidate *)self flights];
  uint64_t v15 = [v14 count];
  if (v15)
  {
    uint64_t v4 = [v8 others];
    if ([v4 count])
    {

      goto LABEL_32;
    }
    BOOL v50 = v12;
  }
  else
  {
    BOOL v50 = v12;
  }
  unint64_t v16 = [(PPTripCandidate *)self hotels];
  uint64_t v17 = [v16 count];
  if (v17)
  {
    uint64_t v5 = [v8 others];
    uint64_t v18 = [v5 count];
    int v19 = v18 != 0;
    if (v18 || !v6) {
      goto LABEL_27;
    }
  }
  else if (!v6)
  {
    int v19 = 0;
    goto LABEL_28;
  }
  uint64_t v20 = [v8 others];
  if (![v20 count])
  {

    int v19 = 0;
    if (!v17) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  [(PPTripCandidate *)self groundTransports];
  double v21 = v49 = v8;
  int v19 = [v21 count] != 0;

  id v8 = v49;
  if (v17) {
LABEL_27:
  }

LABEL_28:
  if (v15)
  {

    BOOL v12 = v50;
    if ((v19 & 1) == 0)
    {
      int v19 = 0;
      goto LABEL_44;
    }
  }
  else
  {

    BOOL v12 = v50;
    if (!v19) {
      goto LABEL_44;
    }
  }
LABEL_32:
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  double v22 = [v8 others];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v52;
    char v26 = 1;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v52 != v25) {
          objc_enumerationMutation(v22);
        }
        id v28 = [*(id *)(*((void *)&v51 + 1) + 8 * i) structuredLocation];
        v29 = [v28 geoLocation];

        if (!v29) {
          char v26 = 0;
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v24);
    int v19 = v26 & 1;
  }
  else
  {
    int v19 = 1;
  }

LABEL_44:
  if ((v12 | v19) == 1)
  {
    id v30 = v8;
    if (self)
    {
      id v31 = -[PPTripCandidate eventsTimeRange](self);
      NSUInteger v33 = v32;
      v59.location = (NSUInteger)-[PPTripCandidate eventsTimeRange](v30);
      v59.length = v34;
      v58.location = (NSUInteger)v31;
      v58.length = v33;
      if (NSIntersectionRange(v58, v59).length)
      {
        v35 = pp_events_log_handle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CA9A8000, v35, OS_LOG_TYPE_DEBUG, "[TripCandidate canBeMergedWithTripCandidate] Found events that fits into other events", buf, 2u);
        }
        BOOL v36 = 1;
      }
      else
      {
        v37 = -[PPTripCandidate allEvents](self);
        v38 = [v37 firstObject];
        v35 = [v38 startDate];

        uint64_t v39 = -[PPTripCandidate allEvents](self);
        v40 = objc_msgSend(v39, "_pas_leftFoldWithInitialObject:accumulate:", 0, &__block_literal_global_9147);

        v41 = -[PPTripCandidate allEvents](v30);
        id v42 = [v41 firstObject];
        v43 = [v42 startDate];

        v44 = -[PPTripCandidate allEvents](v30);
        v45 = objc_msgSend(v44, "_pas_leftFoldWithInitialObject:accumulate:", 0, &__block_literal_global_9147);

        [v40 timeIntervalSinceDate:v43];
        BOOL v36 = 1;
        if (fabs(v46) >= 28800.0)
        {
          [v35 timeIntervalSinceDate:v45];
          if (fabs(v47) >= 28800.0) {
            BOOL v36 = 0;
          }
        }
      }
    }
    else
    {
      BOOL v36 = 0;
    }
  }
  else
  {
    BOOL v36 = 0;
  }

  return v36;
}

id __37__PPTripCandidate_lastDateForEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  BOOL v6 = v5;
  if (!v4
    || ([v5 endDate],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v4 compare:v7],
        v7,
        v8 == -1))
  {
    id v9 = [v6 endDate];
  }
  else
  {
    id v9 = v4;
  }
  uint64_t v10 = v9;

  return v10;
}

- (PPTripCandidate)initWithTripCandidateA:(id)a3 andTripCandidateB:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PPTripCandidate;
  uint64_t v8 = [(PPTripCandidate *)&v31 init];
  if (v8)
  {
    id v9 = objc_opt_new();
    uint64_t v10 = [v6 flights];

    if (v10)
    {
      uint64_t v11 = [v6 flights];
      [v9 addObjectsFromArray:v11];
    }
    BOOL v12 = [v7 flights];

    if (v12)
    {
      uint64_t v13 = [v7 flights];
      [v9 addObjectsFromArray:v13];
    }
    objc_storeStrong((id *)&v8->_flights, v9);
    uint64_t v14 = objc_opt_new();
    uint64_t v15 = [v6 hotels];

    if (v15)
    {
      unint64_t v16 = [v6 hotels];
      [v14 addObjectsFromArray:v16];
    }
    uint64_t v17 = [v7 hotels];

    if (v17)
    {
      uint64_t v18 = [v7 hotels];
      [v14 addObjectsFromArray:v18];
    }
    objc_storeStrong((id *)&v8->_hotels, v14);
    int v19 = objc_opt_new();
    uint64_t v20 = [v6 others];

    if (v20)
    {
      double v21 = [v6 others];
      [v19 addObjectsFromArray:v21];
    }
    double v22 = [v7 others];

    if (v22)
    {
      uint64_t v23 = [v7 others];
      [v19 addObjectsFromArray:v23];
    }
    objc_storeStrong((id *)&v8->_others, v19);
    uint64_t v24 = (NSArray *)objc_opt_new();
    uint64_t v25 = [v6 groundTransports];

    if (v25)
    {
      char v26 = [v6 groundTransports];
      [(NSArray *)v24 addObjectsFromArray:v26];
    }
    id v27 = [v7 groundTransports];

    if (v27)
    {
      id v28 = [v7 groundTransports];
      [(NSArray *)v24 addObjectsFromArray:v28];
    }
    groundTransports = v8->_groundTransports;
    v8->_groundTransports = v24;
  }
  return v8;
}

@end