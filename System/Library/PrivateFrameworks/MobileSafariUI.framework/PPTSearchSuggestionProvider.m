@interface PPTSearchSuggestionProvider
- (id)_generateResultsForQuery:(id)a3;
- (void)setQueryToComplete:(id)a3;
@end

@implementation PPTSearchSuggestionProvider

- (void)setQueryToComplete:(id)a3
{
  id v4 = a3;
  v5 = [v4 queryString];
  char v6 = [v5 isEqualToString:self->querySimulated];

  if ((v6 & 1) == 0)
  {
    v7 = [v4 queryString];
    v8 = (NSString *)[v7 copy];
    querySimulated = self->querySimulated;
    self->querySimulated = v8;

    v10 = (void *)MEMORY[0x1E4F1CB00];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__PPTSearchSuggestionProvider_setQueryToComplete___block_invoke;
    v13[3] = &unk_1E6D7C038;
    v13[4] = self;
    id v14 = v4;
    v11 = [v10 scheduledTimerWithTimeInterval:0 repeats:v13 block:0.1];
    networkDelaySimulatorTimer = self->networkDelaySimulatorTimer;
    self->networkDelaySimulatorTimer = v11;
  }
}

void __50__PPTSearchSuggestionProvider_setQueryToComplete___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 _generateResultsForQuery:*(void *)(a1 + 40)];
  [v2 setCompletions:v3 forString:*(void *)(*(void *)(a1 + 32) + 96)];
}

- (id)_generateResultsForQuery:(id)a3
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 queryString];
  v5 = [[SearchSuggestion alloc] initWithSearchEngineSuggestion:v4 userQuery:v3 forPrivateBrowsing:0 isOfflineSearchSuggestion:0];
  char v6 = [SearchSuggestion alloc];
  v7 = [NSString stringWithFormat:@"%@a", v4];
  v8 = [(SearchSuggestion *)v6 initWithSearchEngineSuggestion:v7 userQuery:v3 forPrivateBrowsing:0 isOfflineSearchSuggestion:0];

  v9 = [SearchSuggestion alloc];
  v10 = [NSString stringWithFormat:@"%@ab", v4];
  v11 = [(SearchSuggestion *)v9 initWithSearchEngineSuggestion:v10 userQuery:v3 forPrivateBrowsing:0 isOfflineSearchSuggestion:0];

  v12 = [SearchSuggestion alloc];
  v13 = [NSString stringWithFormat:@"%@abc", v4];
  id v14 = [(SearchSuggestion *)v12 initWithSearchEngineSuggestion:v13 userQuery:v3 forPrivateBrowsing:0 isOfflineSearchSuggestion:0];

  v17[0] = v5;
  v17[1] = v8;
  v17[2] = v11;
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->querySimulated, 0);
  objc_storeStrong((id *)&self->networkDelaySimulatorTimer, 0);
}

@end