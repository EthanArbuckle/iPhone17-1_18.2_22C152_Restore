@interface _UINavigationControllerManagedSearchPalette
- (BOOL)_shouldUpdateBackground;
- (BOOL)_supportsSpecialSearchBarTransitions;
- (BOOL)ignoreGeometryChanges;
- (UISearchBar)_searchBar;
- (UIView)viewForAsymmetricFade;
- (double)_shadowAlpha;
- (id)_initWithNavigationController:(id)a3 forEdge:(unint64_t)a4;
- (id)resetAfterSearchFieldFade;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_popDisableLayoutFlushingForTransition;
- (void)_propagateBackgroundToContents;
- (void)_pushDisableLayoutFlushingForTransition;
- (void)_setSearchBar:(id)a3;
- (void)_setShadowAlpha:(double)a3;
- (void)_updateLayoutForCurrentConfiguration;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIgnoreGeometryChanges:(BOOL)a3;
- (void)setResetAfterSearchFieldFade:(id)a3;
@end

@implementation _UINavigationControllerManagedSearchPalette

- (id)_initWithNavigationController:(id)a3 forEdge:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UINavigationControllerManagedSearchPalette;
  id v4 = [(_UINavigationControllerPalette *)&v7 _initWithNavigationController:a3 forEdge:a4];
  v5 = v4;
  if (v4) {
    [v4 setPreservesSuperviewLayoutMargins:1];
  }
  return v5;
}

- (BOOL)_supportsSpecialSearchBarTransitions
{
  return 1;
}

- (UIView)viewForAsymmetricFade
{
  v2 = [(_UINavigationControllerManagedSearchPalette *)self _searchBar];
  v3 = [v2 _searchController];
  if (v3)
  {
    id v4 = [v2 _searchController];
    char v5 = [v4 isActive];

    if (v5)
    {
      v3 = 0;
    }
    else
    {
      v3 = [v2 searchField];
      v6 = [v3 layer];
      [v6 setAllowsGroupOpacity:0];
    }
  }

  return (UIView *)v3;
}

- (void)_updateLayoutForCurrentConfiguration
{
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationControllerManagedSearchPalette;
  [(_UINavigationControllerPalette *)&v4 _updateLayoutForCurrentConfiguration];
  v3 = [(_UINavigationControllerManagedSearchPalette *)self _searchBar];
  [v3 _updateInsetsForCurrentContainerViewAndBarPosition];
}

- (BOOL)_shouldUpdateBackground
{
  return 1;
}

- (void)_pushDisableLayoutFlushingForTransition
{
  if (self)
  {
    uint64_t v3 = [(UIView *)self _disableLayoutFlushingCount];
    if (v3 >= 1) {
      uint64_t v4 = v3 + 1;
    }
    else {
      uint64_t v4 = 1;
    }
    [(UIView *)self _setDisableLayoutFlushingCount:v4];
    [(UIView *)self _disableLayoutFlushing];
  }
  id v7 = [(_UINavigationControllerManagedSearchPalette *)self _searchBar];
  if (v7)
  {
    uint64_t v5 = [v7 _disableLayoutFlushingCount];
    if (v5 >= 1) {
      uint64_t v6 = v5 + 1;
    }
    else {
      uint64_t v6 = 1;
    }
    [v7 _setDisableLayoutFlushingCount:v6];
    [v7 _disableLayoutFlushing];
  }
}

- (void)_popDisableLayoutFlushingForTransition
{
  uint64_t v3 = [(_UINavigationControllerManagedSearchPalette *)self _searchBar];
  -[UIView _popDisableLayoutFlushing](v3);

  -[UIView _popDisableLayoutFlushing](self);
}

- (void)setFrame:(CGRect)a3
{
  if (!self->_ignoreGeometryChanges)
  {
    v3.receiver = self;
    v3.super_class = (Class)_UINavigationControllerManagedSearchPalette;
    -[_UINavigationControllerPalette setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
}

- (void)setBounds:(CGRect)a3
{
  if (!self->_ignoreGeometryChanges)
  {
    v3.receiver = self;
    v3.super_class = (Class)_UINavigationControllerManagedSearchPalette;
    -[UIView setBounds:](&v3, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
}

- (void)setCenter:(CGPoint)a3
{
  if (!self->_ignoreGeometryChanges)
  {
    v3.receiver = self;
    v3.super_class = (Class)_UINavigationControllerManagedSearchPalette;
    -[UIView setCenter:](&v3, sel_setCenter_, a3.x, a3.y);
  }
}

- (void)_setShadowAlpha:(double)a3
{
  id v4 = [(_UINavigationControllerPalette *)self _backgroundViewLayout];
  [v4 setShadowAlpha:a3];
}

- (double)_shadowAlpha
{
  v2 = [(_UINavigationControllerPalette *)self _backgroundViewLayout];
  [v2 shadowAlpha];
  double v4 = v3;

  return v4;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UINavigationControllerManagedSearchPalette;
  -[UIView _didMoveFromWindow:toWindow:](&v8, sel__didMoveFromWindow_toWindow_, a3);
  if (!a4)
  {
    uint64_t v6 = [(_UINavigationControllerManagedSearchPalette *)self resetAfterSearchFieldFade];

    if (v6)
    {
      id v7 = [(_UINavigationControllerManagedSearchPalette *)self resetAfterSearchFieldFade];
      v7[2]();

      [(_UINavigationControllerManagedSearchPalette *)self setResetAfterSearchFieldFade:0];
    }
  }
}

- (void)_propagateBackgroundToContents
{
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationControllerManagedSearchPalette;
  [(_UINavigationControllerPalette *)&v5 _propagateBackgroundToContents];
  double v3 = [(_UINavigationControllerPalette *)self navController];
  if (v3)
  {
    double v4 = [(_UINavigationControllerManagedSearchPalette *)self _searchBar];
    [v4 _setBackdropStyle:2005];
  }
}

- (BOOL)ignoreGeometryChanges
{
  return self->_ignoreGeometryChanges;
}

- (void)setIgnoreGeometryChanges:(BOOL)a3
{
  self->_ignoreGeometryChanges = a3;
}

- (id)resetAfterSearchFieldFade
{
  return self->_resetAfterSearchFieldFade;
}

- (void)setResetAfterSearchFieldFade:(id)a3
{
}

- (UISearchBar)_searchBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__searchBar);
  return (UISearchBar *)WeakRetained;
}

- (void)_setSearchBar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__searchBar);
  objc_storeStrong(&self->_resetAfterSearchFieldFade, 0);
}

@end