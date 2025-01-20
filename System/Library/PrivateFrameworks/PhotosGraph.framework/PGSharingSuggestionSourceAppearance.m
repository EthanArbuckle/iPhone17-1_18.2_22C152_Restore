@interface PGSharingSuggestionSourceAppearance
- (double)weight;
- (id)details;
- (id)name;
- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4;
@end

@implementation PGSharingSuggestionSourceAppearance

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = [a3 momentNodes];
  v6 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v12 numberOfAssets];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __76__PGSharingSuggestionSourceAppearance_suggestedResultsForInput_withOptions___block_invoke;
        v15[3] = &unk_1E68EA7B0;
        uint64_t v18 = v13;
        id v16 = v6;
        v17 = self;
        [v12 enumeratePersonEdgesAndNodesUsingBlock:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  return v6;
}

void __76__PGSharingSuggestionSourceAppearance_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (([v5 isMeNode] & 1) == 0)
  {
    unint64_t v6 = [v9 numberOfAssets];
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [*(id *)(a1 + 40) suggestionResultWithPerson:v5 weight:(double)v6 / (double)*(unint64_t *)(a1 + 48)];
    [v7 addObject:v8];
  }
}

- (double)weight
{
  return 1.0;
}

- (id)details
{
  return @"Return suggestions if the person appears in the photos";
}

- (id)name
{
  return @"Appearance";
}

@end