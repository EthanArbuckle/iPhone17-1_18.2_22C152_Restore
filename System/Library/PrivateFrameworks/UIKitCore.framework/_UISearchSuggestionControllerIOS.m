@interface _UISearchSuggestionControllerIOS
- (BOOL)__shouldUseMenu;
- (BOOL)_hasVisibleMenu;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UIContextMenuInteraction)menuInteraction;
- (UITapGestureRecognizer)suggestionsRecoveryGesture;
- (_UISearchSuggestionControllerIOS)initWithSearchTextField:(id)a3;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)_suggestionsMenu;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)_dismissMenuWithoutAnimation;
- (void)_suggestionsRecoveryGestureRecognized;
- (void)_updateMenuWithSuggestionGroups:(id)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)setMenuInteraction:(id)a3;
- (void)setSuggestionsRecoveryGesture:(id)a3;
- (void)updateSuggestionGroups:(id)a3 userInitiated:(BOOL)a4;
@end

@implementation _UISearchSuggestionControllerIOS

- (BOOL)_hasVisibleMenu
{
  v3 = [(_UISearchSuggestionControllerIOSBase *)self suggestions];
  uint64_t v4 = [v3 count];

  v5 = [(_UISearchSuggestionControllerIOS *)self menuInteraction];
  char v6 = [v5 _hasVisibleMenu];
  if (v4) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (UIContextMenuInteraction)menuInteraction
{
  return self->_menuInteraction;
}

- (_UISearchSuggestionControllerIOS)initWithSearchTextField:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UISearchSuggestionControllerIOS;
  v3 = [(_UISearchSuggestionControllerIOSBase *)&v8 initWithSearchTextField:a3];
  if (v3)
  {
    uint64_t v4 = [[UITapGestureRecognizer alloc] initWithTarget:v3 action:sel__suggestionsRecoveryGestureRecognized];
    suggestionsRecoveryGesture = v3->_suggestionsRecoveryGesture;
    v3->_suggestionsRecoveryGesture = v4;

    [(UIGestureRecognizer *)v3->_suggestionsRecoveryGesture setDelegate:v3];
    char v6 = [(_UISearchSuggestionControllerIOSBase *)v3 searchTextField];
    [v6 addGestureRecognizer:v3->_suggestionsRecoveryGesture];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsRecoveryGesture, 0);
  objc_storeStrong((id *)&self->_menuInteraction, 0);
}

- (id)_suggestionsMenu
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v26 = [(_UISearchSuggestionController *)self suggestionGroups];
  unint64_t v3 = [v26 count];
  if (v3 < 2)
  {
    v25 = &stru_1ED0E84C0;
    if (v3 == 1)
    {
      v5 = [v26 objectAtIndexedSubscript:0];
      uint64_t v6 = [v5 headerTitle];
      BOOL v7 = (void *)v6;
      objc_super v8 = &stru_1ED0E84C0;
      if (v6) {
        objc_super v8 = (__CFString *)v6;
      }
      v25 = v8;

      v24 = 0;
      int v4 = 1;
    }
    else
    {
      v24 = 0;
      int v4 = 0;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F1CA48] array];
    int v4 = 0;
    v25 = &stru_1ED0E84C0;
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v33 = __52___UISearchSuggestionControllerIOS__suggestionsMenu__block_invoke;
  v34 = &unk_1E52DD330;
  objc_copyWeak(&v35, &location);
  v9 = [MEMORY[0x1E4F1CA48] array];
  if (v4)
  {
    id obj = [v26 objectAtIndexedSubscript:0];
    v10 = [obj suggestionItems];
    v11 = v33((uint64_t)v32, v10);
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v26;
    v11 = (void *)[obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v29;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v15 = [v14 headerTitle];
          v16 = (void *)v15;
          if (v15) {
            v17 = (__CFString *)v15;
          }
          else {
            v17 = &stru_1ED0E84C0;
          }
          v18 = [v14 suggestionItems];
          v19 = v33((uint64_t)v32, v18);
          v20 = +[UIMenu menuWithTitle:v17 image:0 identifier:0 options:1 children:v19];

          [v9 addObject:v20];
        }
        v11 = (void *)[obj countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v11);
    }
  }

  if (v11) {
    v21 = v11;
  }
  else {
    v21 = v9;
  }
  v22 = +[UIMenu menuWithTitle:v25 image:0 identifier:0 options:16 children:v21];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
  return v22;
}

- (void)_dismissMenuWithoutAnimation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64___UISearchSuggestionControllerIOS__dismissMenuWithoutAnimation__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)_updateMenuWithSuggestionGroups:(id)a3
{
  id v4 = a3;
  [(_UISearchSuggestionController *)self setSuggestionGroups:v4];
  v5 = [(_UISearchSuggestionControllerIOS *)self menuInteraction];
  uint64_t v6 = _UISearchSuggestionNumberOfSuggestionsFromGroups(v4);

  if (!v5 && v6)
  {
    v5 = [[UIContextMenuInteraction alloc] initWithDelegate:self];
    [(UIContextMenuInteraction *)v5 _setFallbackDriverStyle:1];
    [(_UISearchSuggestionControllerIOS *)self setMenuInteraction:v5];
    [(UIContextMenuInteraction *)v5 setDrivers:MEMORY[0x1E4F1CBF0]];
    BOOL v7 = [(_UISearchSuggestionControllerIOSBase *)self searchTextField];
    [v7 addInteraction:v5];
  }
  if ([(UIContextMenuInteraction *)v5 _hasVisibleMenu] || !v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68___UISearchSuggestionControllerIOS__updateMenuWithSuggestionGroups___block_invoke;
    v8[3] = &unk_1E52DD358;
    v8[4] = self;
    [(UIContextMenuInteraction *)v5 updateVisibleMenuWithBlock:v8];
  }
  else
  {
    -[UIContextMenuInteraction _presentMenuAtLocation:](v5, "_presentMenuAtLocation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
}

- (BOOL)__shouldUseMenu
{
  if (!a1) {
    return 0;
  }
  v2 = [a1 searchBar];
  unint64_t v3 = [v2 _searchController];
  id v4 = [a1 searchTextField];
  v5 = [v4 window];

  if (v3)
  {
    int v6 = [v3 _usesSearchSuggestionsMenuForStackedSearch];
    int v7 = [v2 _isHostedInlineByNavigationBar] | v6;
    if (!v6)
    {
      objc_super v8 = [v2 traitCollection];
      goto LABEL_7;
    }
  }
  else
  {
    int v7 = 1;
  }
  objc_super v8 = +[UITraitCollection traitCollectionWithUserInterfaceIdiom:1];
LABEL_7:
  v9 = v8;
  BOOL v10 = 0;
  if (v7 && v5) {
    BOOL v10 = _UIBarsUseDesktopNavigationBar(v8);
  }

  return v10;
}

- (void)updateSuggestionGroups:(id)a3 userInitiated:(BOOL)a4
{
  id v9 = a3;
  if (_UISearchSuggestionNumberOfSuggestionsFromGroups(v9)
    || ([(_UISearchSuggestionController *)self suggestionGroups],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = _UISearchSuggestionNumberOfSuggestionsFromGroups(v5),
        v5,
        v6))
  {
    if (-[_UISearchSuggestionControllerIOS __shouldUseMenu](self))
    {
      [(_UISearchSuggestionControllerIOS *)self _updateMenuWithSuggestionGroups:v9];
    }
    else
    {
      int v7 = [(_UISearchSuggestionControllerIOSBase *)self searchBar];
      objc_super v8 = [v7 _searchController];

      if (v8) {
        [(_UISearchSuggestionController *)self setSuggestionGroups:v9];
      }
    }
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90___UISearchSuggestionControllerIOS_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v6[3] = &unk_1E52DD380;
  v6[4] = self;
  id v4 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v6];
  return v4;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v4 = [(_UISearchSuggestionControllerIOSBase *)self searchTextField];
  v5 = +[_UIContextMenuStyle defaultStyle];
  [v5 setPreferredLayout:3];
  long long v7 = xmmword_186B88D60;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = 0x4018000000000000;
  objc_msgSend(v5, "set_preferredAnchor:", &v7);
  [v4 bounds];
  objc_msgSend(v5, "set_preferredMenuWidth:", fmin(CGRectGetWidth(v12), 343.0));
  objc_msgSend(v5, "set_backgroundInteractionStyle:", 1);

  return v5;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (UITapGestureRecognizer *)a3;
  if (self->_suggestionsRecoveryGesture != v4)
  {
    if (os_variant_has_internal_diagnostics())
    {
      CGRect v12 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v13 = 138412290;
        v14 = v4;
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "unexpected gesture: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &gestureRecognizerShouldBegin____s_category) + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        v14 = v4;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "unexpected gesture: %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  if (self->_suggestionsRecoveryGesture == v4)
  {
    if (-[_UISearchSuggestionControllerIOS __shouldUseMenu](self))
    {
      uint64_t v6 = [(_UISearchSuggestionControllerIOS *)self menuInteraction];
      if (v6)
      {
        long long v7 = [(_UISearchSuggestionControllerIOS *)self menuInteraction];
        if ([v7 _hasVisibleMenu])
        {
          BOOL v5 = 0;
        }
        else
        {
          uint64_t v8 = [(_UISearchSuggestionControllerIOSBase *)self searchTextField];
          if ([v8 isEditing])
          {
            uint64_t v9 = [(_UISearchSuggestionControllerIOSBase *)self suggestions];
            BOOL v5 = [v9 count] != 0;
          }
          else
          {
            BOOL v5 = 0;
          }
        }
      }
      else
      {
        BOOL v5 = 0;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)_suggestionsRecoveryGestureRecognized
{
  unint64_t v3 = [(_UISearchSuggestionControllerIOSBase *)self searchBar];
  id v4 = [v3 _searchController];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73___UISearchSuggestionControllerIOS__suggestionsRecoveryGestureRecognized__block_invoke;
  v6[3] = &unk_1E52D9F98;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)setMenuInteraction:(id)a3
{
}

- (UITapGestureRecognizer)suggestionsRecoveryGesture
{
  return self->_suggestionsRecoveryGesture;
}

- (void)setSuggestionsRecoveryGesture:(id)a3
{
}

@end