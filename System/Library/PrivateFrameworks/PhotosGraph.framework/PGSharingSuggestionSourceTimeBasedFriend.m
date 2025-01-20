@interface PGSharingSuggestionSourceTimeBasedFriend
- (double)weight;
- (id)details;
- (id)name;
- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4;
@end

@implementation PGSharingSuggestionSourceTimeBasedFriend

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 graph];
  v6 = [PGGraphMomentNodeCollection alloc];
  v7 = [v4 momentNodes];
  v8 = [(MAElementCollection *)v6 initWithArray:v7 graph:v5];

  v25 = v8;
  v9 = [(PGGraphMomentNodeCollection *)v8 dateNodes];
  v10 = [v9 yearNodes];

  v24 = v10;
  v11 = [v10 dateNodes];
  v12 = [v11 momentNodes];

  v13 = [v5 sortedSocialGroupNodesWithMomentNodes:v12];
  v14 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    char v18 = 0;
    uint64_t v19 = *(void *)v28;
LABEL_3:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v28 != v19) {
        objc_enumerationMutation(v15);
      }
      v21 = [*(id *)(*((void *)&v27 + 1) + 8 * v20) personNodes];
      [v14 unionSet:v21];

      if (v18) {
        break;
      }
      ++v20;
      char v18 = 1;
      if (v17 == v20)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v17) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v22 = [(PGSharingSuggestionSource *)self suggestionResultsWithPersons:v14];

  return v22;
}

- (double)weight
{
  return 0.25;
}

- (id)details
{
  return @"Return suggestions based on the top friends at the time";
}

- (id)name
{
  return @"Top Friends Time";
}

@end