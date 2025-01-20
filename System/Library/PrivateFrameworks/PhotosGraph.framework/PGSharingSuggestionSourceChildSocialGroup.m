@interface PGSharingSuggestionSourceChildSocialGroup
- (double)weight;
- (id)details;
- (id)name;
- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4;
@end

@implementation PGSharingSuggestionSourceChildSocialGroup

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v29 = a4;
  v31 = v5;
  v6 = [v5 momentNodes];
  v32 = [v5 graph];
  v7 = objc_opt_new();
  v30 = [v32 meNode];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __82__PGSharingSuggestionSourceChildSocialGroup_suggestedResultsForInput_withOptions___block_invoke;
        v37[3] = &unk_1E68EF708;
        id v38 = v7;
        v39 = &v44;
        [v12 enumeratePersonNodesUsingBlock:v37];
        if (*((unsigned char *)v45 + 24))
        {
          v21 = [MEMORY[0x1E4F1CAD0] set];
          id v15 = v38;
          v14 = v8;
          goto LABEL_24;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if ((unint64_t)[v7 count] <= 2 && objc_msgSend(v7, "count"))
  {
    if (v30) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2;
    }
    v14 = [MEMORY[0x1E4F1CA80] set];
    [v32 socialGroupNodesSortedByImportance];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v48 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v34;
LABEL_16:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = [*(id *)(*((void *)&v33 + 1) + 8 * v18) personNodes];
        unint64_t v20 = [v19 count];
        if (v20 != v13) {
          break;
        }
        [v14 unionSet:v19];

        if (v16 == ++v18)
        {
          uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v48 count:16];
          if (v16) {
            goto LABEL_16;
          }
          goto LABEL_36;
        }
      }
      if ([v14 count] && !objc_msgSend(v14, "intersectsSet:", v19)
        || ![v19 intersectsSet:v7])
      {

        goto LABEL_36;
      }
      if (v20 >= 6)
      {
        v23 = +[PGGraphPersonNode personScoreSortDescriptors];
        v24 = [v19 sortedArrayUsingDescriptors:v23];

        v25 = (void *)MEMORY[0x1E4F1CAD0];
        v26 = objc_msgSend(v24, "subarrayWithRange:", 0, 5);
        uint64_t v27 = [v25 setWithArray:v26];

        v19 = (void *)v27;
      }
      v21 = [(PGSharingSuggestionSource *)self suggestionResultsWithPersons:v19];
    }
    else
    {
LABEL_36:

      v21 = [MEMORY[0x1E4F1CAD0] set];
    }
LABEL_24:
  }
  else
  {
    v21 = [MEMORY[0x1E4F1CAD0] set];
  }
  _Block_object_dispose(&v44, 8);

  return v21;
}

void __82__PGSharingSuggestionSourceChildSocialGroup_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  if (([v7 isMeNode] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v7];
    uint64_t v5 = [v7 ageCategory];
    v6 = [v7 contactIdentifier];
    if ([v6 length])
    {

      if ((unint64_t)(v5 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a3 = 1;
      }
    }
    else
    {
    }
  }
}

- (double)weight
{
  return 0.25;
}

- (id)details
{
  return @"Return social group suggestions including a present detected child";
}

- (id)name
{
  return @"Child Social Group";
}

@end