@interface PGSharingSuggestionSourceFamily
- (double)weight;
- (id)details;
- (id)name;
- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4;
@end

@implementation PGSharingSuggestionSourceFamily

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v25 = a4;
  v27 = v5;
  v26 = [v5 momentNodes];
  v28 = [v5 graph];
  v6 = [v28 familyMembers];
  v7 = [v28 partners];
  v8 = [v6 setByAddingObjectsFromSet:v7];

  if ([v8 count])
  {
    v29 = objc_opt_new();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v26;
    uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v49 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v13 = [v12 collection];
          v14 = [v13 birthdayPersonNodes];

          if ([v14 count]
            && ([v14 temporarySet],
                v15 = objc_claimAutoreleasedReturnValue(),
                int v16 = [v15 intersectsSet:v8],
                v15,
                v16))
          {
            [v29 addObject:v12];
          }
          else
          {
            uint64_t v44 = 0;
            v45 = &v44;
            uint64_t v46 = 0x2020000000;
            char v47 = 0;
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __72__PGSharingSuggestionSourceFamily_suggestedResultsForInput_withOptions___block_invoke;
            v43[3] = &unk_1E68EBA98;
            v43[4] = &v44;
            [v12 enumerateCelebratedHolidayNodesUsingBlock:v43];
            if (*((unsigned char *)v45 + 24)) {
              goto LABEL_15;
            }
            v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Wedding", @"Celebration", @"Gathering", 0);
            v18 = [v12 meaningLabels];
            int v19 = [v18 intersectsSet:v17];

            int v20 = *((unsigned char *)v45 + 24) ? 1 : v19;
            if (v20 == 1)
            {
LABEL_15:
              uint64_t v39 = 0;
              v40 = &v39;
              uint64_t v41 = 0x2020000000;
              uint64_t v42 = 0;
              uint64_t v35 = 0;
              v36 = &v35;
              uint64_t v37 = 0x2020000000;
              uint64_t v38 = 0;
              v31[0] = MEMORY[0x1E4F143A8];
              v31[1] = 3221225472;
              v31[2] = __72__PGSharingSuggestionSourceFamily_suggestedResultsForInput_withOptions___block_invoke_2;
              v31[3] = &unk_1E68EAF38;
              id v32 = v8;
              v33 = &v39;
              v34 = &v35;
              [v12 enumeratePersonNodesUsingBlock:v31];
              unint64_t v21 = v40[3];
              if (v21 >= 2 && (double)v21 / (double)(v36[3] + v21) >= 0.25) {
                [v29 addObject:v12];
              }

              _Block_object_dispose(&v35, 8);
              _Block_object_dispose(&v39, 8);
            }
            _Block_object_dispose(&v44, 8);
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v9);
    }

    if ([v29 count]) {
      [(PGSharingSuggestionSource *)self suggestionResultsWithPersons:v8];
    }
    else {
    v22 = [MEMORY[0x1E4F1CAD0] set];
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v22;
}

uint64_t __72__PGSharingSuggestionSourceFamily_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 category];
  if (result == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __72__PGSharingSuggestionSourceFamily_suggestedResultsForInput_withOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  uint64_t v4 = 48;
  if (result) {
    uint64_t v4 = 40;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + v4) + 8) + 24);
  return result;
}

- (double)weight
{
  return 0.6;
}

- (id)details
{
  return @"Return family member suggestions for family related events";
}

- (id)name
{
  return @"Family";
}

@end