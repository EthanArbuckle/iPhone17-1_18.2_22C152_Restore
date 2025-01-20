@interface WBSStartPageSuggestionsProviderBroadcaster
- (BOOL)providerSupportsAttributionViews;
- (WBSStartPageSuggestionsProvider)suggestionsProvider;
- (WBSStartPageSuggestionsProviderBroadcaster)initWithSuggestionsProvider:(id)a3;
- (id)createSuggestionProviderProxy;
- (void)startPageSuggestionsProvider:(id)a3 didUpdateSuggestions:(id)a4;
- (void)startPageSuggestionsProvider:(id)a3 forceReloadSuggestions:(id)a4;
@end

@implementation WBSStartPageSuggestionsProviderBroadcaster

- (WBSStartPageSuggestionsProvider)suggestionsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsProvider);
  return (WBSStartPageSuggestionsProvider *)WeakRetained;
}

- (WBSStartPageSuggestionsProviderBroadcaster)initWithSuggestionsProvider:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSStartPageSuggestionsProviderBroadcaster;
  v5 = [(WBSStartPageSuggestionsProviderBroadcaster *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_suggestionsProvider, v4);
    v6->_providerSupportsAttributionViews = objc_opt_respondsToSelector() & 1;
    [v4 setSuggestionsProviderDelegate:v6];
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    proxies = v6->_proxies;
    v6->_proxies = (NSHashTable *)v7;

    v9 = v6;
  }

  return v6;
}

- (id)createSuggestionProviderProxy
{
  v3 = objc_alloc_init(_WBSStartPageSuggestionsProviderProxy);
  [(_WBSStartPageSuggestionsProviderProxy *)v3 setOwner:self];
  [(NSHashTable *)self->_proxies addObject:v3];
  return v3;
}

- (void)startPageSuggestionsProvider:(id)a3 didUpdateSuggestions:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = self->_proxies;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        objc_super v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "suggestionsProviderDelegate", (void)v13);
        [v12 startPageSuggestionsProvider:v11 didUpdateSuggestions:v5];
      }
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)startPageSuggestionsProvider:(id)a3 forceReloadSuggestions:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = self->_proxies;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        objc_super v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "suggestionsProviderDelegate", (void)v13);
        [v12 startPageSuggestionsProvider:v11 forceReloadSuggestions:v5];
      }
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (BOOL)providerSupportsAttributionViews
{
  return self->_providerSupportsAttributionViews;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionsProvider);
  objc_storeStrong((id *)&self->_proxies, 0);
}

@end