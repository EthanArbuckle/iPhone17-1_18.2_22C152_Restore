@interface _UIContextMenuLoadingCellContentView
- (BOOL)_ignoreRemoveAllAnimations;
- (UIActivityIndicatorView)activityIndicatorView;
- (_UIContextMenuLoadingCellContentView)initWithFrame:(CGRect)a3;
- (id)_contentsCompositingFilter;
- (id)_contentsTintColor;
- (id)iconView;
- (void)_updateContentAppearance;
- (void)setActivityIndicatorView:(id)a3;
@end

@implementation _UIContextMenuLoadingCellContentView

- (_UIContextMenuLoadingCellContentView)initWithFrame:(CGRect)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuLoadingCellContentView;
  v3 = -[_UIContextMenuCellContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = _UINSLocalizedStringWithDefaultValue(@"CONTEXT_MENU_LOADING", @"Loading…");
    [(_UIContextMenuCellContentView *)v3 setTitle:v4];

    [(_UIContextMenuLoadingCellContentView *)v3 _updateContentAppearance];
    v9[0] = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v6 = [(UIView *)v3 registerForTraitChanges:v5 withAction:sel__updateContentAppearance];
  }
  return v3;
}

- (id)iconView
{
  v3 = [(_UIContextMenuLoadingCellContentView *)self activityIndicatorView];

  if (!v3)
  {
    v4 = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:100];
    [(_UIContextMenuLoadingCellContentView *)self setActivityIndicatorView:v4];

    v5 = [(_UIContextMenuLoadingCellContentView *)self activityIndicatorView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v6 = [(_UIContextMenuLoadingCellContentView *)self activityIndicatorView];
    [v6 startAnimating];
  }
  return [(_UIContextMenuLoadingCellContentView *)self activityIndicatorView];
}

- (void)_updateContentAppearance
{
  v3 = [(_UIContextMenuLoadingCellContentView *)self _contentsTintColor];
  v4 = [(_UIContextMenuCellContentView *)self titleLabel];
  [v4 setTextColor:v3];

  v5 = [(_UIContextMenuLoadingCellContentView *)self _contentsCompositingFilter];
  id v6 = [(_UIContextMenuCellContentView *)self titleLabel];
  v7 = [v6 layer];
  [v7 setCompositingFilter:v5];

  objc_super v8 = [(_UIContextMenuLoadingCellContentView *)self _contentsTintColor];
  v9 = [(_UIContextMenuLoadingCellContentView *)self activityIndicatorView];
  [v9 setColor:v8];

  id v12 = [(_UIContextMenuLoadingCellContentView *)self _contentsCompositingFilter];
  v10 = [(_UIContextMenuLoadingCellContentView *)self activityIndicatorView];
  v11 = [v10 layer];
  [v11 setCompositingFilter:v12];
}

- (id)_contentsTintColor
{
  objc_initWeak(&location, self);
  v2 = +[UIColor colorWithDynamicProvider:&__block_literal_global_553];
  objc_destroyWeak(&location);
  return v2;
}

- (id)_contentsCompositingFilter
{
  v2 = [(UIView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  v4 = (void **)MEMORY[0x1E4F3A2E0];
  if (v3 == 2) {
    v4 = (void **)MEMORY[0x1E4F3A2E8];
  }
  v5 = *v4;
  return v5;
}

- (BOOL)_ignoreRemoveAllAnimations
{
  return 1;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end