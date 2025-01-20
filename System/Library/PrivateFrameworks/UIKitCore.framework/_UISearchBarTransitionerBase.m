@interface _UISearchBarTransitionerBase
- (UIView)searchBar;
- (_UISearchBarLayout)activeLayout;
- (_UISearchBarTransitionContext)transitionContext;
- (_UISearchBarTransitionerBase)init;
- (_UISearchBarTransitionerBase)initWithNewTransitionContextForSearchBar:(id)a3;
- (_UISearchBarTransitionerBase)initWithTransitionContext:(id)a3 forSearchBar:(id)a4;
- (void)animate;
- (void)cancel;
- (void)prepare;
- (void)setTransitionContext:(id)a3;
@end

@implementation _UISearchBarTransitionerBase

- (_UISearchBarTransitionerBase)initWithTransitionContext:(id)a3 forSearchBar:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UISearchBarTransitionerBase;
  v9 = [(_UISearchBarTransitionerBase *)&v17 init];
  if (v9)
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (v7) {
      BOOL v11 = v8 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    int v12 = v11;
    if (has_internal_diagnostics)
    {
      if (v12)
      {
        v14 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "_UISearchBarTransitioner is useless without a transitionContext and a search bar", v16, 2u);
        }
      }
    }
    else if (v12)
    {
      v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &initWithTransitionContext_forSearchBar____s_category)
                         + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "_UISearchBarTransitioner is useless without a transitionContext and a search bar", v16, 2u);
      }
    }
    objc_storeStrong((id *)&v9->_transitionContext, a3);
    objc_storeWeak((id *)&v9->_searchBar, v8);
  }

  return v9;
}

- (_UISearchBarTransitionerBase)init
{
  if (os_variant_has_internal_diagnostics())
  {
    v5 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "init not allowed on a _UISearchBarTransitioner", buf, 2u);
    }
  }
  else
  {
    v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &init___s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "init not allowed on a _UISearchBarTransitioner", v6, 2u);
    }
  }

  return 0;
}

- (_UISearchBarTransitionerBase)initWithNewTransitionContextForSearchBar:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(_UISearchBarTransitionContext);
  v6 = [(_UISearchBarTransitionerBase *)self initWithTransitionContext:v5 forSearchBar:v4];

  return v6;
}

- (void)prepare
{
  v3 = [(_UISearchBarTransitionContext *)self->_transitionContext fromLayout];
  activeLayout = self->_activeLayout;
  self->_activeLayout = v3;
}

- (void)animate
{
  v3 = [(_UISearchBarTransitionContext *)self->_transitionContext toLayout];
  activeLayout = self->_activeLayout;
  self->_activeLayout = v3;
}

- (void)cancel
{
  v3 = [(_UISearchBarTransitionContext *)self->_transitionContext fromLayout];
  activeLayout = self->_activeLayout;
  self->_activeLayout = v3;
}

- (_UISearchBarLayout)activeLayout
{
  return self->_activeLayout;
}

- (UIView)searchBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  return (UIView *)WeakRetained;
}

- (_UISearchBarTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_storeStrong((id *)&self->_activeLayout, 0);
}

@end