@interface PGSharingSuggestionSourceChild
- (double)weight;
- (id)details;
- (id)name;
- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4;
@end

@implementation PGSharingSuggestionSourceChild

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v17 = a4;
  v19 = [v5 momentNodes];
  v20 = [v5 graph];
  v6 = [v20 children];
  if ([v6 count])
  {
    v7 = [v20 parents];
    v8 = [v20 partners];
    v18 = [v7 setByAddingObjectsFromSet:v8];

    if ([v18 count])
    {
      v21 = objc_opt_new();
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v9 = v19;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v30 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v25 = 0;
            v26 = &v25;
            uint64_t v27 = 0x2020000000;
            char v28 = 0;
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __71__PGSharingSuggestionSourceChild_suggestedResultsForInput_withOptions___block_invoke;
            v22[3] = &unk_1E68EF708;
            id v23 = v6;
            v24 = &v25;
            [v13 enumeratePersonNodesUsingBlock:v22];
            if (*((unsigned char *)v26 + 24)) {
              [v21 addObject:v13];
            }

            _Block_object_dispose(&v25, 8);
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v10);
      }

      if ([v21 count]) {
        [(PGSharingSuggestionSource *)self suggestionResultsWithPersons:v18];
      }
      else {
      v14 = [MEMORY[0x1E4F1CAD0] set];
      }
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

uint64_t __71__PGSharingSuggestionSourceChild_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (double)weight
{
  return 0.6;
}

- (id)details
{
  return @"Return close family member suggestions for moments with the user's children";
}

- (id)name
{
  return @"Child";
}

@end