@interface PGSharingSuggestionSourceCoworker
- (double)weight;
- (id)details;
- (id)name;
- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4;
@end

@implementation PGSharingSuggestionSourceCoworker

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v17 = a4;
  v18 = [v5 momentNodes];
  v19 = [v5 graph];
  v6 = [v19 coworkers];
  if ([v6 count])
  {
    v22 = [v19 meNodeCollection];
    v20 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v18;
    uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v36 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v31 = 0;
          v32 = &v31;
          uint64_t v33 = 0x2020000000;
          uint64_t v34 = 0;
          uint64_t v27 = 0;
          v28 = &v27;
          uint64_t v29 = 0x2020000000;
          uint64_t v30 = 0;
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __74__PGSharingSuggestionSourceCoworker_suggestedResultsForInput_withOptions___block_invoke;
          v23[3] = &unk_1E68EAF38;
          id v24 = v6;
          v25 = &v31;
          v26 = &v27;
          [v10 enumeratePersonNodesUsingBlock:v23];
          if (v32[3])
          {
            if ([v10 happensPartiallyAtWorkOfPersonNodes:v22]
              || (unint64_t v11 = v32[3], v11 >= 3) && (double)v11 / (double)(v28[3] + v11) >= 0.75)
            {
              [v20 addObject:v10];
            }
          }

          _Block_object_dispose(&v27, 8);
          _Block_object_dispose(&v31, 8);
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v7);
    }

    if ([v20 count])
    {
      v12 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_49260];
      v13 = [v6 filteredSetUsingPredicate:v12];

      v14 = [(PGSharingSuggestionSource *)self suggestionResultsWithPersons:v13];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CAD0] set];
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v14;
}

uint64_t __74__PGSharingSuggestionSourceCoworker_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  uint64_t v4 = 48;
  if (result) {
    uint64_t v4 = 40;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + v4) + 8) + 24);
  return result;
}

BOOL __74__PGSharingSuggestionSourceCoworker_suggestedResultsForInput_withOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__49263;
  v16 = __Block_byref_object_dispose__49264;
  id v17 = [MEMORY[0x1E4F1C9C8] distantPast];
  v6 = [v4 collection];
  uint64_t v7 = [v6 momentNodes];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__PGSharingSuggestionSourceCoworker_suggestedResultsForInput_withOptions___block_invoke_267;
  v11[3] = &unk_1E68EB798;
  v11[4] = &v12;
  [v7 enumerateNodesUsingBlock:v11];

  [(id)v13[5] timeIntervalSinceNow];
  BOOL v9 = fabs(v8) < 15778800.0;
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __74__PGSharingSuggestionSourceCoworker_suggestedResultsForInput_withOptions___block_invoke_267(uint64_t a1, void *a2)
{
  id v6 = [a2 universalStartDate];
  uint64_t v3 = [v6 laterDate:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (double)weight
{
  return 0.6;
}

- (id)details
{
  return @"Return coworker suggestions for work events";
}

- (id)name
{
  return @"Coworker";
}

@end