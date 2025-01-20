@interface _WBSStartPageSuggestionsProviderProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (NSArray)suggestions;
- (NSString)providerSectionIdentifier;
- (WBSStartPageSuggestionsProviderBroadcaster)owner;
- (WBSStartPageSuggestionsProviderDelegate)suggestionsProviderDelegate;
- (id)attributionViewForSuggestion:(id)a3;
- (void)fetchMetadataForSuggestion:(id)a3 completionHandler:(id)a4;
- (void)setOwner:(id)a3;
- (void)setSuggestionsProviderDelegate:(id)a3;
@end

@implementation _WBSStartPageSuggestionsProviderProxy

- (NSString)providerSectionIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v3 = [WeakRetained suggestionsProvider];
  v4 = [v3 providerSectionIdentifier];

  return (NSString *)v4;
}

- (NSArray)suggestions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v3 = [WeakRetained suggestionsProvider];
  v4 = [v3 suggestions];

  return (NSArray *)v4;
}

- (void)setSuggestionsProviderDelegate:(id)a3
{
}

- (void)setOwner:(id)a3
{
}

- (void)fetchMetadataForSuggestion:(id)a3 completionHandler:(id)a4
{
  p_owner = &self->_owner;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_owner);
  v8 = [WeakRetained suggestionsProvider];
  [v8 fetchMetadataForSuggestion:v7 completionHandler:v6];
}

- (id)attributionViewForSuggestion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  if ([WeakRetained providerSupportsAttributionViews])
  {
    id v6 = [WeakRetained suggestionsProvider];
    id v7 = [v6 attributionViewForSuggestion:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_attributionViewForSuggestion_ == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    char v5 = [WeakRetained providerSupportsAttributionViews];

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_WBSStartPageSuggestionsProviderProxy;
    return -[_WBSStartPageSuggestionsProviderProxy respondsToSelector:](&v6, sel_respondsToSelector_);
  }
}

- (WBSStartPageSuggestionsProviderDelegate)suggestionsProviderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsProviderDelegate);
  return (WBSStartPageSuggestionsProviderDelegate *)WeakRetained;
}

- (WBSStartPageSuggestionsProviderBroadcaster)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (WBSStartPageSuggestionsProviderBroadcaster *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_destroyWeak((id *)&self->_suggestionsProviderDelegate);
}

@end