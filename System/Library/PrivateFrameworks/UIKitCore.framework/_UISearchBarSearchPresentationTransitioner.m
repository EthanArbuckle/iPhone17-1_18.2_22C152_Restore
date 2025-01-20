@interface _UISearchBarSearchPresentationTransitioner
- (void)animate;
- (void)cancel;
- (void)prepare;
@end

@implementation _UISearchBarSearchPresentationTransitioner

- (void)prepare
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)_UISearchBarSearchPresentationTransitioner;
  [(_UISearchBarTransitionerBase *)&v16 prepare];
  v3 = [(_UISearchBarTransitionerBase *)self transitionContext];
  v4 = [v3 fromLayout];
  v5 = [v3 toLayout];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v7 = [v4 representedLayoutState];
  if (has_internal_diagnostics)
  {
    if ((unint64_t)(v7 - 1) > 1 || [v5 representedLayoutState] != 3)
    {
      v13 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v4;
        __int16 v19 = 2112;
        v20 = v5;
        _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "Incorrect transition object for transitioning from layout, %@, to layout, %@. This is a UIKit bug.", buf, 0x16u);
      }
    }
  }
  else if ((unint64_t)(v7 - 1) > 1 || [v5 representedLayoutState] != 3)
  {
    v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_971) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v4;
      __int16 v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Incorrect transition object for transitioning from layout, %@, to layout, %@. This is a UIKit bug.", buf, 0x16u);
    }
  }
  v8 = [(_UISearchBarTransitionerBase *)self searchBar];
  [v8 layoutIfNeeded];

  int v9 = [v4 hasScopeBar];
  int v10 = [v5 hasScopeBar];
  if (os_variant_has_internal_diagnostics())
  {
    if (((v9 ^ 1 | v10) & 1) == 0)
    {
      v14 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Unexpectedly transitioning from visible scope bar to hidden scope bar on search presentation. This is a UIKit bug.", buf, 2u);
      }
    }
  }
  else if (((v9 ^ 1 | v10) & 1) == 0)
  {
    v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25F2A8) + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Unexpectedly transitioning from visible scope bar to hidden scope bar on search presentation. This is a UIKit bug.", buf, 2u);
    }
  }
  if ((([v4 isHostedInlineByNavigationBar] | v9 | v10 ^ 1) & 1) == 0)
  {
    v11 = [v5 scopeBarContainer];
    [v11 setAlpha:0.0];
    [v11 setHidden:0];
    [v5 applyScopeContainerSublayout];
  }
}

- (void)animate
{
  v18.receiver = self;
  v18.super_class = (Class)_UISearchBarSearchPresentationTransitioner;
  [(_UISearchBarTransitionerBase *)&v18 animate];
  v3 = [(_UISearchBarTransitionerBase *)self transitionContext];
  v4 = [v3 fromLayout];
  v5 = [v3 toLayout];
  int v6 = [v4 hasCancelButton];
  int v7 = [v5 hasCancelButton];
  int v8 = [v4 hasScopeBar];
  int v9 = [v5 hasScopeBar];
  int v10 = v6 ^ v7;
  int v11 = v8 ^ v9;
  if ((v10 & 1) != 0 || v11)
  {
    v12 = [(_UISearchBarTransitionerBase *)self searchBar];
    [v12 setNeedsLayout];

    if (v10)
    {
      v13 = [v5 searchFieldContainer];
      [v13 setNeedsLayout];
    }
    if (v11)
    {
      v14 = [v5 scopeBarContainer];
      [v14 setNeedsLayout];
    }
  }
  v15 = [(_UISearchBarTransitionerBase *)self searchBar];
  [v15 _updateEffectiveContentInset];
  [v15 _effectiveContentInset];
  objc_msgSend(v5, "setContentInset:");
  [v15 layoutIfNeeded];
  if ((v9 & ~([v4 isHostedInlineByNavigationBar] | v8)) == 1)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __53___UISearchBarSearchPresentationTransitioner_animate__block_invoke;
    v16[3] = &unk_1E52D9F70;
    id v17 = v5;
    +[UIView animateKeyframesWithDuration:0 delay:v16 options:0 animations:0.0 completion:0.0];
  }
}

- (void)cancel
{
  v12.receiver = self;
  v12.super_class = (Class)_UISearchBarSearchPresentationTransitioner;
  [(_UISearchBarTransitionerBase *)&v12 cancel];
  v3 = [(_UISearchBarTransitionerBase *)self transitionContext];
  v4 = [v3 fromLayout];
  char v5 = [v4 isHostedInlineByNavigationBar];

  if ((v5 & 1) == 0)
  {
    int v6 = [(_UISearchBarTransitionerBase *)self transitionContext];
    int v7 = [v6 fromLayout];
    char v8 = [v7 hasScopeBar];
    int v9 = [v6 toLayout];
    int v10 = [v9 hasScopeBar];

    if (v10)
    {
      if ((v8 & 1) == 0)
      {
        int v11 = [v7 scopeBarContainer];
        [v11 setAlpha:0.0];
      }
    }
  }
}

@end