@interface PPFlightEventsAggregator
- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4;
- (id)_multiDestinationsFlights;
- (id)_returningFlightForFlight:(id)a3 inPool:(id)a4;
- (id)_simpleRoundTripFlights;
- (id)tripCandidatesFromEventsPool;
@end

@implementation PPFlightEventsAggregator

- (id)_returningFlightForFlight:(id)a3 inPool:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(v5, "pp_airports");
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    id v26 = v8;
    do
    {
      uint64_t v12 = 0;
      uint64_t v27 = v10;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v29 + 1) + 8 * v12);
        if (v13 != v5)
        {
          v14 = [*(id *)(*((void *)&v29 + 1) + 8 * v12) startDate];
          v15 = [v5 startDate];

          if (v14 >= v15)
          {
            v16 = objc_msgSend(v13, "pp_airports");
            v17 = [v16 first];
            v18 = [v7 second];
            if ([v17 isEqualToPPFlightAirport:v18])
            {
              v19 = [v16 second];
              [v7 first];
              uint64_t v20 = v11;
              id v21 = v5;
              v23 = v22 = v7;
              char v28 = [v19 isEqualToPPFlightAirport:v23];

              v7 = v22;
              id v5 = v21;
              uint64_t v11 = v20;
              uint64_t v10 = v27;

              id v8 = v26;
              if (v28)
              {
                id v24 = v13;

                goto LABEL_16;
              }
            }
            else
            {
            }
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v10);
  }
  id v24 = 0;
LABEL_16:

  return v24;
}

- (id)_multiDestinationsFlights
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    v2 = [(PPEventsAggregator *)self eventsPool];
    v3 = [v2 sortedArrayUsingSelector:sel_compareStartDateWithEvent_];
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_opt_new();
  id v5 = [v3 firstObject];
  id v6 = objc_msgSend(v5, "pp_airports");
  v7 = [v6 first];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        id v13 = v10;
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (![v4 count]
          || v7 && [v13 isEqualToPPFlightAirport:v7]
          || ([v4 lastObject],
              v15 = objc_claimAutoreleasedReturnValue(),
              [v15 lastObject],
              v16 = objc_claimAutoreleasedReturnValue(),
              int v17 = objc_msgSend(v16, "pp_isConnectionFromFlight:", v14),
              v16,
              v15,
              !v17))
        {
          v19 = [MEMORY[0x1E4F1CA48] arrayWithObject:v14];
          [v4 addObject:v19];

          v18 = objc_msgSend(v14, "pp_airports");
          uint64_t v20 = [v18 first];

          v7 = (void *)v20;
        }
        else
        {
          v18 = [v4 lastObject];
          [v18 addObject:v14];
        }

        id v21 = objc_msgSend(v14, "pp_airports");
        uint64_t v10 = [v21 second];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }
  return v4;
}

- (id)_simpleRoundTripFlights
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(PPEventsAggregator *)self eventsPool];
  id v6 = [v5 sortedArrayUsingSelector:sel_compareStartDateWithEvent_];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (([v4 containsObject:v11] & 1) == 0)
        {
          uint64_t v12 = [(PPEventsAggregator *)self eventsPool];
          id v13 = [(PPFlightEventsAggregator *)self _returningFlightForFlight:v11 inPool:v12];

          if (v13)
          {
            [v4 addObject:v13];
            v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v11, v13, 0);
            [v3 addObject:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v3;
}

- (BOOL)isEvent:(id)a3 dupeOfEvent:(id)a4
{
  return objc_msgSend(a3, "pp_isDupeOfFlightEvent:", a4);
}

- (id)tripCandidatesFromEventsPool
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self) {
    -[PPEventsAggregator dedupeEventsInPoolForCategory:](self, 1);
  }
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  id v5 = [(PPFlightEventsAggregator *)self _multiDestinationsFlights];
  id v6 = [v4 arrayByAddingObjectsFromArray:v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v13 = objc_opt_new();
        objc_msgSend(v13, "setFlights:", v12, (void)v15);
        [v3 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v3;
}

@end