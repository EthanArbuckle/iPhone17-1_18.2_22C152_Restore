@interface UIFindSession
- (BOOL)allowsReplacement;
- (BOOL)supportsReplacement;
- (NSInteger)highlightedResultIndex;
- (NSInteger)resultCount;
- (NSString)replacementText;
- (NSString)searchText;
- (UIFindInteraction)parentInteraction;
- (UIFindSessionSearchResultDisplayStyle)searchResultDisplayStyle;
- (UIResponder)divergentResponder;
- (UIResponder)searchableResponder;
- (UITextSearchOptions)configuredSearchOptions;
- (UIView)searchableResponderAsView;
- (void)setConfiguredSearchOptions:(id)a3;
- (void)setParentInteraction:(id)a3;
- (void)setReplacementText:(id)a3;
- (void)setSearchResultDisplayStyle:(UIFindSessionSearchResultDisplayStyle)searchResultDisplayStyle;
- (void)setSearchText:(id)a3;
- (void)setSearchableResponder:(id)a3;
@end

@implementation UIFindSession

- (BOOL)supportsReplacement
{
  return 0;
}

- (NSInteger)highlightedResultIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (UIFindSessionSearchResultDisplayStyle)searchResultDisplayStyle
{
  return 0;
}

- (UITextSearchOptions)configuredSearchOptions
{
  configuredSearchOptions = self->_configuredSearchOptions;
  if (!configuredSearchOptions)
  {
    v4 = +[UITextSearchOptions defaultSearchOptions];
    v5 = self->_configuredSearchOptions;
    self->_configuredSearchOptions = v4;

    configuredSearchOptions = self->_configuredSearchOptions;
  }
  return configuredSearchOptions;
}

- (UIView)searchableResponderAsView
{
  p_searchableResponder = &self->_searchableResponder;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableResponder);
  int v4 = objc_msgSend(WeakRetained, "__isKindOfUIView");

  if (v4) {
    id v5 = objc_loadWeakRetained((id *)p_searchableResponder);
  }
  else {
    id v5 = 0;
  }
  return (UIView *)v5;
}

- (UIResponder)divergentResponder
{
  p_divergentResponderForSession = &self->_divergentResponderForSession;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_divergentResponderForSession);

  if (!WeakRetained)
  {
    id v5 = [(UIFindSession *)self searchableResponder];
    v6 = [v5 _window];
    v7 = [v6 _deepestActionResponder];
    objc_storeWeak((id *)p_divergentResponderForSession, v7);
  }
  id v8 = objc_loadWeakRetained((id *)p_divergentResponderForSession);
  return (UIResponder *)v8;
}

- (NSInteger)resultCount
{
  return self->_resultCount;
}

- (void)setSearchResultDisplayStyle:(UIFindSessionSearchResultDisplayStyle)searchResultDisplayStyle
{
  self->_searchResultDisplayStyle = searchResultDisplayStyle;
}

- (BOOL)allowsReplacement
{
  return self->_allowsReplacement;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
}

- (NSString)replacementText
{
  return self->_replacementText;
}

- (void)setReplacementText:(id)a3
{
}

- (void)setConfiguredSearchOptions:(id)a3
{
}

- (UIFindInteraction)parentInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentInteraction);
  return (UIFindInteraction *)WeakRetained;
}

- (void)setParentInteraction:(id)a3
{
}

- (UIResponder)searchableResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableResponder);
  return (UIResponder *)WeakRetained;
}

- (void)setSearchableResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchableResponder);
  objc_destroyWeak((id *)&self->_parentInteraction);
  objc_storeStrong((id *)&self->_configuredSearchOptions, 0);
  objc_storeStrong((id *)&self->_replacementText, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_destroyWeak((id *)&self->_divergentResponderForSession);
}

@end