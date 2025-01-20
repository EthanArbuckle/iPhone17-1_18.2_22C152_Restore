@interface _UISearchBarSearchDismissalTransitioner
- (void)animate;
- (void)cancel;
- (void)complete;
- (void)prepare;
@end

@implementation _UISearchBarSearchDismissalTransitioner

- (void)prepare
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_UISearchBarSearchDismissalTransitioner;
  [(_UISearchBarTransitionerBase *)&v14 prepare];
  v3 = [(_UISearchBarTransitionerBase *)self transitionContext];
  v4 = [v3 fromLayout];
  v5 = [v3 toLayout];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v7 = [v4 representedLayoutState];
  if (has_internal_diagnostics)
  {
    if (v7 != 3 || (unint64_t)([v5 representedLayoutState] - 1) >= 2)
    {
      v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v4;
        __int16 v17 = 2112;
        v18 = v5;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Incorrect transition object for transitioning from layout, %@, to layout, %@. This is a UIKit bug.", buf, 0x16u);
      }
    }
  }
  else if (v7 != 3 || (unint64_t)([v5 representedLayoutState] - 1) >= 2)
  {
    v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_970) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      __int16 v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Incorrect transition object for transitioning from layout, %@, to layout, %@. This is a UIKit bug.", buf, 0x16u);
    }
  }
  int v8 = os_variant_has_internal_diagnostics();
  int v9 = [v5 hasScopeBar];
  if (v8)
  {
    if (v9 && ([v4 hasScopeBar] & 1) == 0)
    {
      v12 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "Unexpectedly transitioning from hidden scope bar to visible scope bar on search dismissal. This is a UIKit bug.", buf, 2u);
      }
    }
  }
  else if (v9)
  {
    if (([v4 hasScopeBar] & 1) == 0)
    {
      v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25F298) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Unexpectedly transitioning from hidden scope bar to visible scope bar on search dismissal. This is a UIKit bug.", buf, 2u);
      }
    }
  }
}

- (void)animate
{
  v18.receiver = self;
  v18.super_class = (Class)_UISearchBarSearchDismissalTransitioner;
  [(_UISearchBarTransitionerBase *)&v18 animate];
  v3 = [(_UISearchBarTransitionerBase *)self transitionContext];
  v4 = [v3 fromLayout];
  v5 = [v3 toLayout];
  int v6 = [v4 hasCancelButton];
  int v7 = [v5 hasCancelButton];
  int v8 = [v4 hasScopeBar];
  int v9 = [v5 hasScopeBar];
  unsigned int v10 = (v8 ^ v9) & ~[v4 isHostedInlineByNavigationBar];
  int v11 = v6 ^ v7;
  if ((v11 & 1) != 0 || v10)
  {
    v12 = [(_UISearchBarTransitionerBase *)self searchBar];
    [v12 setNeedsLayout];

    if (v11)
    {
      v13 = [v5 searchFieldContainer];
      [v13 setNeedsLayout];
    }
    if (v8 != v9)
    {
      objc_super v14 = [v5 scopeBarContainer];
      [v14 setNeedsLayout];
    }
  }
  v15 = [(_UISearchBarTransitionerBase *)self searchBar];
  [v15 layoutIfNeeded];

  if (((v10 & v8 ^ 1 | v9) & 1) == 0)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50___UISearchBarSearchDismissalTransitioner_animate__block_invoke;
    v16[3] = &unk_1E52D9F70;
    id v17 = v5;
    +[UIView animateKeyframesWithDuration:0 delay:v16 options:0 animations:0.0 completion:0.0];
  }
}

- (void)complete
{
  v13.receiver = self;
  v13.super_class = (Class)_UISearchBarSearchDismissalTransitioner;
  [(_UISearchBarTransitionerBase *)&v13 complete];
  v3 = [(_UISearchBarTransitionerBase *)self transitionContext];
  v4 = [v3 toLayout];
  char v5 = [v4 isHostedInlineByNavigationBar];

  if ((v5 & 1) == 0)
  {
    int v6 = [(_UISearchBarTransitionerBase *)self transitionContext];
    int v7 = [v6 toLayout];
    char v8 = [v7 hasScopeBar];
    int v9 = [v6 fromLayout];
    int v10 = [v9 hasScopeBar];

    if (v10)
    {
      if ((v8 & 1) == 0)
      {
        int v11 = [(_UISearchBarTransitionerBase *)self searchBar];
        [v11 setNeedsLayout];

        v12 = [v7 scopeBarContainer];
        [v12 setNeedsLayout];
      }
    }
  }
}

- (void)cancel
{
  v17.receiver = self;
  v17.super_class = (Class)_UISearchBarSearchDismissalTransitioner;
  [(_UISearchBarTransitionerBase *)&v17 cancel];
  v3 = [(_UISearchBarTransitionerBase *)self transitionContext];
  v4 = [v3 fromLayout];
  char v5 = [v3 toLayout];
  int v6 = [v5 hasCancelButton];
  int v7 = [v4 hasCancelButton];
  char v8 = [v3 toLayout];
  int v9 = [v8 hasScopeBar];

  int v10 = [v4 hasScopeBar];
  unsigned int v11 = (v9 ^ v10) & ~[v4 isHostedInlineByNavigationBar];
  int v12 = v6 ^ v7;
  if ((v12 & 1) != 0 || v11)
  {
    objc_super v13 = [(_UISearchBarTransitionerBase *)self searchBar];
    [v13 setNeedsLayout];

    if (v12)
    {
      objc_super v14 = [v5 searchFieldContainer];
      [v14 setNeedsLayout];
    }
    if (v11)
    {
      v15 = [v5 scopeBarContainer];
      [v15 setNeedsLayout];

      if (((v10 ^ 1 | v9) & 1) == 0)
      {
        v16 = [v4 scopeBarContainer];
        [v16 setAlpha:1.0];
      }
    }
  }
}

@end