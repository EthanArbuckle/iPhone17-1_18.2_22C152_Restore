@interface OfflineSearchSuggestionsCompletionProvider
- (BOOL)areOfflineSearchSuggestionsAvailable;
- (OfflineSearchSuggestionsCompletionProvider)initWithMaximumNumberOfSuggestions:(unint64_t)a3 forPrivateBrowsing:(BOOL)a4;
- (void)offlineSearchSuggestionsFetcher:(id)a3 didFindSuggestions:(id)a4 forQuery:(id)a5;
- (void)setQueryToComplete:(id)a3;
- (void)updateOfflineSearchSuggestionAvailability;
@end

@implementation OfflineSearchSuggestionsCompletionProvider

- (OfflineSearchSuggestionsCompletionProvider)initWithMaximumNumberOfSuggestions:(unint64_t)a3 forPrivateBrowsing:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)OfflineSearchSuggestionsCompletionProvider;
  v6 = [(CompletionProvider *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F98C38]) initWithMaximumSuggestionsToFetch:a3];
    offlineSearchSuggestionsFetcher = v6->_offlineSearchSuggestionsFetcher;
    v6->_offlineSearchSuggestionsFetcher = (WBSOfflineSearchSuggestionsFetcher *)v7;

    [(WBSOfflineSearchSuggestionsFetcher *)v6->_offlineSearchSuggestionsFetcher setDelegate:v6];
    v6->_forPrivateBrowsing = a4;
    v9 = v6;
  }

  return v6;
}

- (BOOL)areOfflineSearchSuggestionsAvailable
{
  return [(WBSOfflineSearchSuggestionsFetcher *)self->_offlineSearchSuggestionsFetcher areOfflineSearchSuggestionsAvailable];
}

- (void)updateOfflineSearchSuggestionAvailability
{
}

- (void)setQueryToComplete:(id)a3
{
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentCompletionQuery, a3);
    [(WBSOfflineSearchSuggestionsFetcher *)self->_offlineSearchSuggestionsFetcher setCurrentQuery:v5];
  }
}

- (void)offlineSearchSuggestionsFetcher:(id)a3 didFindSuggestions:(id)a4 forQuery:(id)a5
{
  id v7 = a5;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __106__OfflineSearchSuggestionsCompletionProvider_offlineSearchSuggestionsFetcher_didFindSuggestions_forQuery___block_invoke;
  v14 = &unk_1E6D7BE60;
  id v15 = v7;
  v16 = self;
  id v8 = v7;
  v9 = objc_msgSend(a4, "safari_mapObjectsUsingBlock:", &v11);
  v10 = objc_msgSend(v8, "queryString", v11, v12, v13, v14);
  [(CompletionProvider *)self setCompletions:v9 forString:v10];
}

SearchSuggestion *__106__OfflineSearchSuggestionsCompletionProvider_offlineSearchSuggestionsFetcher_didFindSuggestions_forQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[SearchSuggestion alloc] initWithSearchEngineSuggestion:v3 userQuery:*(void *)(a1 + 32) forPrivateBrowsing:*(unsigned __int8 *)(*(void *)(a1 + 40) + 56) isOfflineSearchSuggestion:1];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineSearchSuggestionsFetcher, 0);
  objc_storeStrong((id *)&self->_currentCompletionQuery, 0);
}

@end