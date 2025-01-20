@interface PPTripAggregator
+ (id)_eventsFromCategory:(unsigned __int8)a3 inPool:(id)a4;
+ (id)_tripCandidatesFromCategory:(unsigned __int8)a3 andEvents:(id)a4;
+ (id)keyForCategory:(unsigned __int8)a3;
+ (id)mergeTripCandidates:(id)a3;
+ (id)mergeTripCandidates:(id)a3 supportsGroundTransportEvents:(BOOL)a4;
+ (id)tripCandidatesWithEvents:(id)a3;
+ (id)tripCandidatesWithEvents:(id)a3 supportsGroundTransportEvents:(BOOL)a4;
+ (id)tripEventsFromCandidates:(id)a3;
+ (id)tripEventsWithEvents:(id)a3 from:(id)a4 to:(id)a5;
@end

@implementation PPTripAggregator

+ (id)tripCandidatesWithEvents:(id)a3 supportsGroundTransportEvents:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [a1 _tripCandidatesFromCategory:1 andEvents:v6];
  [v7 addObjectsFromArray:v8];
  v9 = [a1 _tripCandidatesFromCategory:10 andEvents:v6];

  [v7 addObjectsFromArray:v9];
  v10 = [a1 _tripCandidatesFromCategory:2 andEvents:v6];

  [v7 addObjectsFromArray:v10];
  if (v4)
  {
    v11 = [a1 _tripCandidatesFromCategory:4 andEvents:v6];

    [v7 addObjectsFromArray:v11];
    v12 = [a1 _tripCandidatesFromCategory:5 andEvents:v6];

    [v7 addObjectsFromArray:v12];
    v13 = [a1 _tripCandidatesFromCategory:3 andEvents:v6];

    [v7 addObjectsFromArray:v13];
    v14 = [a1 _tripCandidatesFromCategory:6 andEvents:v6];

    [v7 addObjectsFromArray:v14];
    v10 = [a1 _tripCandidatesFromCategory:7 andEvents:v6];

    [v7 addObjectsFromArray:v10];
  }
  v15 = pp_events_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 134217984;
    uint64_t v21 = [v7 count];
    _os_log_debug_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEBUG, "[TripAggregator] Attempting to merge %lu trip candidates", (uint8_t *)&v20, 0xCu);
  }

  v16 = [a1 mergeTripCandidates:v7 supportsGroundTransportEvents:v4];
  v17 = pp_events_log_handle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = [v7 count];
    int v20 = 134217984;
    uint64_t v21 = v19;
    _os_log_debug_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEBUG, "[TripAggregator] Post merge: %lu trip candidates", (uint8_t *)&v20, 0xCu);
  }

  return v16;
}

+ (id)_tripCandidatesFromCategory:(unsigned __int8)a3 andEvents:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a1 _eventsFromCategory:v4 inPool:v6];
  if ([v7 count])
  {
    if (v4 - 1) < 0xA && ((0x27Fu >> (v4 - 1)))
    {
      v10 = (void *)[objc_alloc(*off_1E65D7920[(v4 - 1)]) initWithEventsPool:v7];
      v9 = [v10 tripCandidatesFromEventsPool];

      v8 = pp_events_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = [v9 count];
        uint64_t v14 = [v6 count];
        v15 = [MEMORY[0x1E4F89E00] descriptionForSuggestedEventCategory:v4];
        int v16 = 134218498;
        uint64_t v17 = v13;
        __int16 v18 = 2048;
        uint64_t v19 = v14;
        __int16 v20 = 2112;
        uint64_t v21 = v15;
        _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "[TripAggregator] Found %lu trip candidates out of %lu %@ events", (uint8_t *)&v16, 0x20u);
      }
    }
    else
    {
      v8 = pp_events_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v12 = [MEMORY[0x1E4F89E00] descriptionForSuggestedEventCategory:v4];
        int v16 = 138412290;
        uint64_t v17 = (uint64_t)v12;
        _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "[TripAggregator] Unsupported event category %@ while retrieving trip candidates", (uint8_t *)&v16, 0xCu);
      }
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_eventsFromCategory:(unsigned __int8)a3 inPool:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = [a1 keyForCategory:v4];
  if (v7
    && ([v6 objectForKeyedSubscript:v7],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v9))
  {
    v10 = [v6 objectForKeyedSubscript:v7];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

+ (id)keyForCategory:(unsigned __int8)a3
{
  v3 = [MEMORY[0x1E4F89E00] descriptionForSuggestedEventCategory:a3];
  uint64_t v4 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  v5 = [v4 invertedSet];
  id v6 = [v3 componentsSeparatedByCharactersInSet:v5];
  v7 = objc_msgSend(v6, "_pas_componentsJoinedByString:", &stru_1F253DF18);
  v8 = [v7 lowercaseString];

  if ([v8 length]) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

+ (id)tripEventsWithEvents:(id)a3 from:(id)a4 to:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v24 = [a1 tripCandidatesWithEvents:a3];
  v10 = objc_msgSend(a1, "tripEventsFromCandidates:");
  v11 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        __int16 v18 = [v17 startDate];
        [v18 timeIntervalSinceDate:v9];
        if (v19 <= 0.0)
        {
          __int16 v20 = [v17 endDate];
          [v8 timeIntervalSinceDate:v20];
          double v22 = v21;

          if (v22 <= 0.0) {
            [v11 addObject:v17];
          }
        }
        else
        {
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  return v11;
}

+ (id)tripEventsFromCandidates:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "shouldPromoteToTripEvent", (void)v13))
        {
          v11 = [v10 tripEventFromCandidate];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)tripCandidatesWithEvents:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() tripCandidatesWithEvents:v3 supportsGroundTransportEvents:0];

  return v4;
}

+ (id)mergeTripCandidates:(id)a3 supportsGroundTransportEvents:(BOOL)a4
{
  BOOL v4 = a4;
  id v22 = a1;
  id v5 = a3;
  if ([v5 count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      unint64_t v23 = v6 + 1;
      if (v6 + 1 < (unint64_t)objc_msgSend(v5, "count", v22)) {
        break;
      }
LABEL_8:
      ++v6;
      if (v23 >= [v5 count]) {
        goto LABEL_9;
      }
    }
    uint64_t v7 = v6 + 1;
    while (1)
    {
      uint64_t v8 = (void *)MEMORY[0x1CB79D060]();
      id v9 = [v5 objectAtIndexedSubscript:v6];
      v10 = [v5 objectAtIndexedSubscript:v7];
      if ([v9 canBeMergedWithTripCandidate:v10 supportsGroundTransportEvents:v4]) {
        break;
      }
      v11 = [v5 objectAtIndexedSubscript:v7];
      id v12 = [v5 objectAtIndexedSubscript:v6];
      char v13 = [v11 canBeMergedWithTripCandidate:v12 supportsGroundTransportEvents:v4];

      if (v13) {
        goto LABEL_11;
      }
      if (++v7 >= (unint64_t)[v5 count]) {
        goto LABEL_8;
      }
    }

LABEL_11:
    long long v15 = [MEMORY[0x1E4F1CA48] arrayWithArray:v5];
    long long v16 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v6];
    [v16 addIndex:v7];
    [v15 removeObjectsAtIndexes:v16];
    uint64_t v17 = [PPTripCandidate alloc];
    uint64_t v18 = [v5 objectAtIndexedSubscript:v6];
    double v19 = [v5 objectAtIndexedSubscript:v7];
    __int16 v20 = [(PPTripCandidate *)v17 initWithTripCandidateA:v18 andTripCandidateB:v19];

    [v15 insertObject:v20 atIndex:0];
    id v14 = [v22 mergeTripCandidates:v15 supportsGroundTransportEvents:v4];
  }
  else
  {
LABEL_9:
    id v14 = v5;
  }

  return v14;
}

+ (id)mergeTripCandidates:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(id)objc_opt_class() mergeTripCandidates:v3 supportsGroundTransportEvents:0];

  return v4;
}

@end