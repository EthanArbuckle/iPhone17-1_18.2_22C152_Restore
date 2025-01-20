@interface PGSharingSuggestionSourceHomeWork
- (double)weight;
- (id)details;
- (id)name;
- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4;
@end

@implementation PGSharingSuggestionSourceHomeWork

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 momentNodes];
  v21 = v4;
  v6 = [v4 graph];
  [v6 _checkCanRead];
  id v7 = objc_alloc_init(MEMORY[0x1E4F71E60]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __74__PGSharingSuggestionSourceHomeWork_suggestedResultsForInput_withOptions___block_invoke;
        v22[3] = &unk_1E68EFB10;
        id v23 = v7;
        [v13 enumeratePreciseAddressNodesUsingBlock:v22];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  if ([v7 count]
    && ([v6 meNodeCollection],
        v14 = objc_claimAutoreleasedReturnValue(),
        [v14 elementIdentifiers],
        v15 = objc_claimAutoreleasedReturnValue(),
        [v7 subtractIdentifierSet:v15],
        v15,
        v14,
        [v7 count]))
  {
    v16 = [(MAElementCollection *)[PGGraphPersonNodeCollection alloc] initWithGraph:v6 elementIdentifiers:v7];
    v17 = [(MAElementCollection *)v16 temporarySet];
    v18 = [(PGSharingSuggestionSource *)self suggestionResultsWithPersons:v17];
  }
  else
  {
    v18 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v18;
}

void __74__PGSharingSuggestionSourceHomeWork_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [a2 collection];
  v3 = [v6 homeWorkNodes];
  id v4 = [v3 ownerNodes];
  v5 = [v4 elementIdentifiers];
  [v2 unionWithIdentifierSet:v5];
}

- (double)weight
{
  return 0.6;
}

- (id)details
{
  return @"Return Home/Work owner suggestions";
}

- (id)name
{
  return @"Home/Work";
}

@end