@interface TUISearchController
- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)searchBarShouldClear:(id)a3;
- (TUIRenderModelNavigationItem)renderModel;
- (TUISearchController)init;
- (TUIViewFactory)factory;
- (UISearchController)searchController;
- (void)_callActionHandlerForTrigger:(id)a3 arguments:(id)a4;
- (void)configureSubviews;
- (void)configureWithModel:(id)a3;
- (void)didUpdateWithTrigger:(id)a3 text:(id)a4;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)setFactory:(id)a3;
- (void)setRenderModel:(id)a3;
@end

@implementation TUISearchController

- (TUISearchController)init
{
  v7.receiver = self;
  v7.super_class = (Class)TUISearchController;
  v2 = [(TUISearchController *)&v7 init];
  if (v2)
  {
    v3 = [[_TUISearchController alloc] initWithSearchResultsController:0];
    searchController = v2->_searchController;
    v2->_searchController = v3;

    v5 = [(_TUISearchController *)v2->_searchController searchBar];
    [v5 setDelegate:v2];
  }
  return v2;
}

- (void)configureWithModel:(id)a3
{
  id v4 = a3;
  [(TUISearchController *)self setRenderModel:v4];
  v5 = [(TUISearchController *)self searchController];
  [v5 setHidesNavigationBarDuringPresentation:1];

  v6 = [(TUISearchController *)self searchController];
  [v6 setObscuresBackgroundDuringPresentation:0];

  objc_super v7 = [(TUISearchController *)self searchController];
  v8 = [v7 searchBar];

  v9 = [v8 searchField];
  v10 = [v4 placeholderText];
  uint64_t v32 = 0;
  id v33 = [v10 length];

  v11 = [v4 placeholderText];
  v12 = [v11 attribute:NSParagraphStyleAttributeName atIndex:0 effectiveRange:&v32];

  if (v12)
  {
    id v13 = [v12 mutableCopy];
  }
  else
  {
    v14 = +[NSParagraphStyle defaultParagraphStyle];
    id v13 = [v14 mutableCopy];
  }
  [v13 setMaximumLineHeight:0.0 v32, v33];
  [v13 setMinimumLineHeight:0.0];
  id v15 = objc_alloc((Class)NSMutableAttributedString);
  v16 = [v4 placeholderText];
  id v17 = [v15 initWithAttributedString:v16];

  [v17 addAttribute:NSParagraphStyleAttributeName value:v13 range:v32, v33];
  [v9 setAttributedPlaceholder:v17];
  v18 = [v8 text];
  id v19 = [v18 length];

  if (!v19)
  {
    v20 = [v4 text];
    [v8 setText:v20];
  }
  v21 = [v8 text];
  id v22 = [v21 length];

  if (v22)
  {
    uint64_t v23 = objc_opt_class();
    v24 = [(TUISearchController *)self searchController];
    v25 = [v24 delegate];
    v26 = TUIDynamicCast(v23, v25);

    v27 = [v26 presentedViewController];

    if (!v27)
    {
      v28 = [(TUISearchController *)self searchController];
      [v28 setActive:1];
    }
  }
  BOOL v29 = TUIPlatformKeyboardAppearanceFromKeyboardAppearance((BOOL)[v4 keyboardAppearance]);
  if ((id)v29 != [v8 keyboardAppearance])
  {
    [v8 setKeyboardAppearance:v29];
    [v8 reloadInputViewsWithoutReset];
  }
  v30 = +[UIColor blackColor];
  if ([v4 keyboardAppearance] == (char *)&def_141F14 + 1)
  {
    uint64_t v31 = +[UIColor whiteColor];

    v30 = (void *)v31;
  }
  [v8 setTintColor:v30];
  [(TUISearchController *)self configureSubviews];
}

- (void)didUpdateWithTrigger:(id)a3 text:(id)a4
{
  CFStringRef v9 = @"value";
  id v10 = a4;
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  [(TUISearchController *)self _callActionHandlerForTrigger:v7 arguments:v8];
}

- (void)_callActionHandlerForTrigger:(id)a3 arguments:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TUISearchController *)self renderModel];
  v8 = [v9 actionHandler];
  [v8 invoke:v7 arguments:v6];
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v6 = [(TUISearchController *)self searchController];
  id v4 = [v6 searchBar];
  v5 = [v4 text];
  [(TUISearchController *)self didUpdateWithTrigger:@"beginInput" text:v5];
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v6 = [(TUISearchController *)self searchController];
  id v4 = [v6 searchBar];
  v5 = [v4 text];
  [(TUISearchController *)self didUpdateWithTrigger:@"endInput" text:v5];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v7 = [(TUISearchController *)self searchController];
  v5 = [v7 searchBar];
  id v6 = [v5 text];
  [(TUISearchController *)self didUpdateWithTrigger:@"changedInput" text:v6];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v6 = [(TUISearchController *)self searchController];
  id v4 = [v6 searchBar];
  v5 = [v4 text];
  [(TUISearchController *)self didUpdateWithTrigger:@"returnPressed" text:v5];
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = [(TUISearchController *)self searchController];
  v5 = [v4 searchBar];
  [v5 setText:&stru_257BF0];

  id v8 = [(TUISearchController *)self searchController];
  id v6 = [v8 searchBar];
  id v7 = [v6 text];
  [(TUISearchController *)self didUpdateWithTrigger:@"cancelPressed" text:v7];
}

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  id v8 = a5;
  id v9 = [a3 text];
  id v10 = [v9 length];
  id v11 = [v8 length];

  unint64_t v12 = (unint64_t)v10 + (void)v11 - length;
  id v13 = [(TUISearchController *)self renderModel];
  LOBYTE(self) = v12 <= (unint64_t)[v13 searchTextMaxLength];

  return (char)self;
}

- (BOOL)searchBarShouldClear:(id)a3
{
  id v4 = [(TUISearchController *)self searchController];
  v5 = [v4 searchBar];
  id v6 = [v5 text];
  [(TUISearchController *)self didUpdateWithTrigger:@"clearPressed" text:v6];

  return 1;
}

- (void)configureSubviews
{
  v3 = [(_TUISearchController *)self->_searchController _searchBar];
  uint64_t v4 = objc_opt_class();
  v5 = [v3 scopeBarContentView];
  id v6 = [v5 subviews];
  id v7 = [v6 firstObject];
  id v8 = TUIDynamicCast(v4, v7);

  id v9 = [v8 viewStateSave];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
  id v11 = [v3 scopeBarContentView];
  [WeakRetained viewFactoryPrepareToReuseHost:v11];

  unint64_t v12 = [(TUIRenderModelNavigationItem *)self->_renderModel subviewsModel];
  if (v12 && (id v13 = objc_loadWeakRetained((id *)&self->_factory), v30 = v13 != 0, v13, v13))
  {
    [v12 prepare];
    char v38 = 0;
    id v14 = objc_loadWeakRetained((id *)&self->_factory);
    id v15 = [v3 scopeBarContentView];
    v16 = [v12 configureSubviewsWithFactory:v14 outsets:v15 host:0 overrides:&v38 UUID:0 uid:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v17 = v16;
    id v18 = [v17 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v35;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v17);
          }
          [(TUISearchController *)self verifyHierarchyForSubview:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        }
        id v19 = [v17 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v19);
    }

    uint64_t v22 = 1;
  }
  else
  {
    BOOL v30 = 0;
    uint64_t v22 = 0;
  }
  [v12 size];
  [v3 setScopeBarContentSize:];
  uint64_t v23 = objc_opt_class();
  v24 = [v3 scopeBarContentView];
  v25 = [v24 subviews];
  v26 = [v25 firstObject];
  v27 = TUIDynamicCast(v23, v26);

  if (v9)
  {
    uint64_t v28 = objc_opt_class();
    if (v28 == objc_opt_class()) {
      [v27 viewStateRestore:v9];
    }
  }
  BOOL v29 = [(_TUISearchController *)self->_searchController transitionCoordinator];
  if (v29)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_163AD8;
    v31[3] = &unk_256B68;
    id v32 = v3;
    BOOL v33 = v30;
    [v29 animateAlongsideTransition:0 completion:v31];
  }
  else
  {
    [v3 setShowsScopeBar:v22 animated:1];
  }
}

- (TUIViewFactory)factory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);

  return (TUIViewFactory *)WeakRetained;
}

- (void)setFactory:(id)a3
{
}

- (UISearchController)searchController
{
  return &self->_searchController->super;
}

- (TUIRenderModelNavigationItem)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_destroyWeak((id *)&self->_factory);

  objc_storeStrong((id *)&self->_searchController, 0);
}

@end