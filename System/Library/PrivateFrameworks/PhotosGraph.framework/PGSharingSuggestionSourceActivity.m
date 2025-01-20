@interface PGSharingSuggestionSourceActivity
- (double)weight;
- (id)details;
- (id)name;
- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4;
@end

@implementation PGSharingSuggestionSourceActivity

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v31 = a4;
  v32 = v5;
  v6 = [v5 momentNodes];
  v35 = [v5 graph];
  [v35 _checkCanRead];
  v7 = [MEMORY[0x1E4F1CA80] set];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = [*(id *)(*((void *)&v51 + 1) + 8 * i) meaningLabels];
        [v7 unionSet:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v9);
  }

  if ([v7 count])
  {
    v30 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Hiking", @"Climbing", @"Beaching", @"Diving", @"WinterSport", @"AmusementPark", @"Performance", @"Concert", @"Festival", @"SportEvent", @"NightOut", @"Museum", 0);
    [v7 intersectSet:v30];
    if ([v7 count])
    {
      v13 = [MEMORY[0x1E4F1CA80] set];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      obuint64_t j = v7;
      uint64_t v14 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (v14)
      {
        uint64_t v34 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v48 != v34) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * j);
            v17 = [MEMORY[0x1E4F28BD0] set];
            uint64_t v43 = 0;
            v44 = &v43;
            uint64_t v45 = 0x2020000000;
            uint64_t v46 = 0;
            unint64_t v18 = +[PGGraph meaningForMeaningLabel:v16];
            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            v40[2] = __74__PGSharingSuggestionSourceActivity_suggestedResultsForInput_withOptions___block_invoke;
            v40[3] = &unk_1E68EE508;
            id v19 = v17;
            id v41 = v19;
            v42 = &v43;
            [v35 enumerateMeaningfulEventsWithMeaning:v18 usingBlock:v40];
            unint64_t v20 = v44[3];
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            id v21 = v19;
            uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v55 count:16];
            if (v22)
            {
              double v23 = (double)v20 * 0.5;
              uint64_t v24 = *(void *)v37;
              do
              {
                for (uint64_t k = 0; k != v22; ++k)
                {
                  if (*(void *)v37 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  v26 = *(void **)(*((void *)&v36 + 1) + 8 * k);
                  if (([v26 isMeNode] & 1) == 0
                    && v23 <= (double)(unint64_t)[v21 countForObject:v26])
                  {
                    [v13 addObject:v26];
                  }
                }
                uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v55 count:16];
              }
              while (v22);
            }

            _Block_object_dispose(&v43, 8);
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
        }
        while (v14);
      }

      if ([v13 count])
      {
        v27 = [(PGSharingSuggestionSource *)self suggestionResultsWithPersons:v13];

        goto LABEL_32;
      }
    }
  }
  v27 = [MEMORY[0x1E4F1CAD0] set];
LABEL_32:

  return v27;
}

void __74__PGSharingSuggestionSourceActivity_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 peopledEvent];
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    id v6 = v3;
    id v5 = [v3 personNodes];
    [v4 unionSet:v5];

    v3 = v6;
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (double)weight
{
  return 0.25;
}

- (id)details
{
  return @"Return people related to activity";
}

- (id)name
{
  return @"Activity";
}

@end