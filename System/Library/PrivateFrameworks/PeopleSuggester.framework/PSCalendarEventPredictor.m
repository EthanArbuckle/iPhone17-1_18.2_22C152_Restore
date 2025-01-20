@interface PSCalendarEventPredictor
@end

@implementation PSCalendarEventPredictor

uint64_t __78___PSCalendarEventPredictor_eventComparatorWithPredictionContext_contactsMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) seedRecipients];
  if (![v7 count])
  {

LABEL_24:
    BOOL v31 = +[_PSCalendarEventPredictor hasFaceTimeSignalInEvent:v5];
    BOOL v32 = +[_PSCalendarEventPredictor hasFaceTimeSignalInEvent:v6];
    if (!v31 || v32)
    {
      if (v31 || !v32)
      {
        v33 = [v5 startDate];
        [v33 timeIntervalSinceNow];
        double v35 = fabs(v34);

        v36 = [v6 startDate];
        [v36 timeIntervalSinceNow];
        double v38 = fabs(v37);

        if (v35 < v38) {
          uint64_t v30 = -1;
        }
        else {
          uint64_t v30 = v35 > v38;
        }
      }
      else
      {
        uint64_t v30 = 1;
      }
    }
    else
    {
      uint64_t v30 = -1;
    }
    goto LABEL_32;
  }
  int v8 = _os_feature_enabled_impl();

  if (!v8) {
    goto LABEL_24;
  }
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v10 = [*(id *)(a1 + 32) seedRecipients];
  v11 = [v9 setWithArray:v10];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v40 = v6;
  v41 = v5;
  v54[0] = v5;
  v54[1] = v6;
  id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  uint64_t v12 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v50;
    uint64_t v42 = *(void *)v50;
    do
    {
      uint64_t v15 = 0;
      uint64_t v43 = v13;
      do
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v49 + 1) + 8 * v15);
        v17 = [v16 eventIdentifier];
        v18 = [*(id *)(a1 + 40) objectForKeyedSubscript:v17];

        if (!v18)
        {
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          v19 = [v16 attendees];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            LODWORD(v22) = 0;
            uint64_t v23 = *(void *)v46;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v46 != v23) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v22 = v22
                    + +[_PSCalendarEventPredictor isCorecipientParticipant:*(void *)(*((void *)&v45 + 1) + 8 * i) seedRecipients:v11 contactsMap:*(void *)(a1 + 48)];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
            }
            while (v21);
          }
          else
          {
            uint64_t v22 = 0;
          }

          v25 = [NSNumber numberWithInt:v22];
          [*(id *)(a1 + 40) setObject:v25 forKeyedSubscript:v17];

          uint64_t v14 = v42;
          uint64_t v13 = v43;
        }

        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v13);
  }

  id v5 = v41;
  v26 = [v41 eventIdentifier];
  id v6 = v40;
  v27 = [v40 eventIdentifier];
  v28 = [*(id *)(a1 + 40) objectForKeyedSubscript:v27];
  v29 = [*(id *)(a1 + 40) objectForKeyedSubscript:v26];
  uint64_t v30 = [v28 compare:v29];

  if (!v30) {
    goto LABEL_24;
  }
LABEL_32:

  return v30;
}

uint64_t __66___PSCalendarEventPredictor_participantComparatorWithContactsMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  int v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    goto LABEL_10;
  }
  if (!v7 && v8) {
    goto LABEL_7;
  }
  uint64_t v11 = [v5 participantStatus];
  uint64_t v12 = [v6 participantStatus];
  if (v11 == 3 && v12 != 3) {
    goto LABEL_10;
  }
  if (v11 != 3 && v12 == 3)
  {
LABEL_7:
    uint64_t v10 = 1;
    goto LABEL_11;
  }
  if (v11 == 2 && v12 != 2)
  {
LABEL_10:
    uint64_t v10 = -1;
    goto LABEL_11;
  }
  uint64_t v10 = v11 != 2 && v12 == 2;
LABEL_11:

  return v10;
}

void __111___PSCalendarEventPredictor_zkwSuggestionsFromCalendarWithPredictionContext_startDate_endDate_maxParticipants___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:](_PSCalendarEventPredictor, "isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:"))
  {
    [*(id *)(a1 + 48) addObject:v3];
  }
}

@end