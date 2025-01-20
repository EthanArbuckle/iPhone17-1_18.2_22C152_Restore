@interface _UISearchSuggestionControllerIOSBase
- (BOOL)_hasVisibleMenu;
- (BOOL)hasSetUpGeometryChangeResponse;
- (UISearchBar)searchBar;
- (UISearchTextField)searchTextField;
- (_UISearchSuggestionControllerIOSBase)initWithSearchTextField:(id)a3;
- (id)suggestions;
- (void)_dismissMenuWithoutAnimation;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_updateMenuWithSuggestionGroups:(id)a3;
- (void)menuDidCloseWithAnimator:(id)a3;
- (void)searchTextFieldDidGainSearchBar:(id)a3;
- (void)setHasSetUpGeometryChangeResponse:(BOOL)a3;
- (void)setSuggestions:(id)a3;
- (void)updateSuggestions:(id)a3 userInitiated:(BOOL)a4;
@end

@implementation _UISearchSuggestionControllerIOSBase

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  id v6 = a4;
  if ((a3->var0 & 0xE) != 0
    && !self->_hasSetUpGeometryChangeResponse
    && [(_UISearchSuggestionControllerIOSBase *)self hasVisibleMenu])
  {
    v7 = [(_UISearchSuggestionControllerIOSBase *)self searchBar];
    v8 = [v7 _searchController];

    if (v8)
    {
      v9 = [v8 _navigationItemCurrentlyDisplayingSearchController];
      id v10 = [v9 _navigationBar];

      if (!v10)
      {
LABEL_9:

        [(_UISearchSuggestionControllerIOSBase *)self setHasSetUpGeometryChangeResponse:1];
        goto LABEL_10;
      }
      [v8 _updateHasPendingSuggestionMenuRefreshFlagForReason:4];
      [v10 _deferSearchSuggestionsMenuRefreshForGeometryChange];
      [(_UISearchSuggestionControllerIOSBase *)self _dismissMenuWithoutAnimation];
      objc_initWeak(&location, self);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __69___UISearchSuggestionControllerIOSBase__geometryChanged_forAncestor___block_invoke_2;
      v17[3] = &unk_1E52DF168;
      v11 = &v19;
      objc_copyWeak(&v19, &location);
      id v10 = v10;
      id v18 = v10;
      +[UIView animateWithDuration:&__block_literal_global_573 animations:v17 completion:0.0];
      v12 = v18;
    }
    else
    {
      v13 = [(_UISearchSuggestionController *)self suggestionGroups];
      [(_UISearchSuggestionControllerIOSBase *)self _dismissMenuWithoutAnimation];
      objc_initWeak(&location, self);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __69___UISearchSuggestionControllerIOSBase__geometryChanged_forAncestor___block_invoke_4;
      v14[3] = &unk_1E52DF168;
      v11 = &v16;
      objc_copyWeak(&v16, &location);
      id v10 = v13;
      id v15 = v10;
      +[UIView animateWithDuration:&__block_literal_global_16_6 animations:v14 completion:0.0];
      v12 = v15;
    }

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
LABEL_10:
}

- (id)suggestions
{
  v2 = [(_UISearchSuggestionController *)self suggestionGroups];
  v3 = _UISearchSuggestionAllSuggestionsFromGroups(v2);

  return v3;
}

- (void)searchTextFieldDidGainSearchBar:(id)a3
{
  id v7 = a3;
  id v4 = [(_UISearchSuggestionControllerIOSBase *)self searchTextField];

  v5 = v7;
  if (v4 == v7)
  {
    id v6 = [v7 _searchBar];
    objc_storeWeak((id *)&self->_searchBar, v6);

    v5 = v7;
  }
}

- (_UISearchSuggestionControllerIOSBase)initWithSearchTextField:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISearchSuggestionControllerIOSBase;
  v5 = [(_UISearchSuggestionControllerIOSBase *)&v8 init];
  if (v5)
  {
    id v6 = [v4 _searchBar];
    objc_storeWeak((id *)&v5->_searchBar, v6);

    objc_storeWeak((id *)&v5->_searchTextField, v4);
  }

  return v5;
}

- (UISearchTextField)searchTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchTextField);
  return (UISearchTextField *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchBar);
  objc_destroyWeak((id *)&self->_searchTextField);
}

- (void)menuDidCloseWithAnimator:(id)a3
{
  id v7 = a3;
  id v4 = [(_UISearchSuggestionControllerIOSBase *)self searchBar];
  v5 = [v4 _searchController];

  if (v5)
  {
    [v5 _suggestionsMenuInteractionWillEndWithAnimator:v7];
  }
  else
  {
    id v6 = [(_UISearchSuggestionControllerIOSBase *)self searchTextField];
    [v6 _suggestionsMenuInteractionWillEndWithAnimator:v7];
  }
}

- (void)setSuggestions:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [_UISearchSuggestionItemGroup alloc];
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v7 = [(_UISearchSuggestionItemGroup *)v5 initWithHeaderTitle:0 suggestionItems:v6];

  v9[0] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [(_UISearchSuggestionController *)self setSuggestionGroups:v8];
}

- (void)updateSuggestions:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [_UISearchSuggestionItemGroup alloc];
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }
  v9 = [(_UISearchSuggestionItemGroup *)v7 initWithHeaderTitle:0 suggestionItems:v8];

  v11[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [(_UISearchSuggestionController *)self updateSuggestionGroups:v10 userInitiated:v4];
}

- (BOOL)_hasVisibleMenu
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UISearchSuggestionControllerIOSBase.m", 94, @"Subclass failed to implement %s", "-[_UISearchSuggestionControllerIOSBase _hasVisibleMenu]");

  return 0;
}

- (void)_dismissMenuWithoutAnimation
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UISearchSuggestionControllerIOSBase.m", 101, @"Subclass failed to implement %s", "-[_UISearchSuggestionControllerIOSBase _dismissMenuWithoutAnimation]");
}

- (void)_updateMenuWithSuggestionGroups:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UISearchSuggestionControllerIOSBase.m", 107, @"Subclass failed to implement %s", "-[_UISearchSuggestionControllerIOSBase _updateMenuWithSuggestionGroups:]");
}

- (UISearchBar)searchBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  return (UISearchBar *)WeakRetained;
}

- (BOOL)hasSetUpGeometryChangeResponse
{
  return self->_hasSetUpGeometryChangeResponse;
}

- (void)setHasSetUpGeometryChangeResponse:(BOOL)a3
{
  self->_hasSetUpGeometryChangeResponse = a3;
}

@end