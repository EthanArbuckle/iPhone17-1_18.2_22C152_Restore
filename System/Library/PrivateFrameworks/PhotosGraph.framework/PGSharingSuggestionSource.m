@interface PGSharingSuggestionSource
- (BOOL)canRunWithInput:(id)a3;
- (BOOL)canRunWithOptions:(id)a3;
- (NSString)details;
- (NSString)name;
- (double)weight;
- (id)description;
- (id)sourceDescription;
- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4;
- (id)suggestionResultWithPerson:(id)a3;
- (id)suggestionResultWithPerson:(id)a3 weight:(double)a4;
- (id)suggestionResultsWithPersons:(id)a3;
@end

@implementation PGSharingSuggestionSource

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  abort();
}

- (BOOL)canRunWithInput:(id)a3
{
  return 1;
}

- (BOOL)canRunWithOptions:(id)a3
{
  return 1;
}

- (double)weight
{
}

- (NSString)details
{
}

- (NSString)name
{
}

- (id)suggestionResultsWithPersons:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[PGSharingSuggestionSource suggestionResultWithPerson:](self, "suggestionResultWithPerson:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)suggestionResultWithPerson:(id)a3 weight:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [PGSharingSuggestionResult alloc];
  [(PGSharingSuggestionSource *)self weight];
  double v9 = v8;
  v10 = [(PGSharingSuggestionSource *)self name];
  v11 = [(PGSharingSuggestionResult *)v7 initWithPerson:v6 weight:v10 sourceWeight:a4 sourceName:v9];

  return v11;
}

- (id)suggestionResultWithPerson:(id)a3
{
  return [(PGSharingSuggestionSource *)self suggestionResultWithPerson:a3 weight:0.0];
}

- (id)sourceDescription
{
  v3 = NSString;
  id v4 = [(PGSharingSuggestionSource *)self name];
  [(PGSharingSuggestionSource *)self weight];
  id v6 = [v3 stringWithFormat:@"%@ (weight %.2f)", v4, v5];

  return v6;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PGSharingSuggestionSource;
  id v4 = [(PGSharingSuggestionSource *)&v9 description];
  uint64_t v5 = [(PGSharingSuggestionSource *)self name];
  [(PGSharingSuggestionSource *)self weight];
  uint64_t v7 = [v3 stringWithFormat:@"%@ - name:%@, weight:%.2f", v4, v5, v6];

  return v7;
}

@end