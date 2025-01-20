@interface _UIContextMenuSubmenuTitleView
- (BOOL)_wantsKeyCommandsWhenDeferred;
- (BOOL)allowsFocus;
- (BOOL)highlighted;
- (UIView)bgView;
- (UIView)highlightedBgView;
- (UIView)separator;
- (UIVisualEffectView)obscuringMaterialView;
- (_UIContextMenuCellContentView)contentView;
- (_UIContextMenuSubmenuTitleView)initWithFrame:(CGRect)a3;
- (int64_t)focusItemDeferralMode;
- (void)addObscuringMaterialViewWithGroupName:(id)a3;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setAllowsFocus:(BOOL)a3;
- (void)setBackgroundMaterialGroupName:(id)a3;
- (void)setBgView:(id)a3;
- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedBgView:(id)a3;
- (void)setObscuringMaterialView:(id)a3;
- (void)setSeparator:(id)a3;
@end

@implementation _UIContextMenuSubmenuTitleView

- (_UIContextMenuSubmenuTitleView)initWithFrame:(CGRect)a3
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)_UIContextMenuSubmenuTitleView;
  v3 = -[UICollectionReusableView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setFocusEffect:0];
    v5 = [(UIView *)v4 traitCollection];
    v6 = _UIContextMenuGetPlatformMetrics([v5 userInterfaceIdiom]);
    v7 = [UIVisualEffectView alloc];
    v8 = [v6 menuBackgroundEffect];
    v9 = [(UIVisualEffectView *)v7 initWithEffect:v8];

    v10 = [v6 menuBackgroundColor];
    [(UIView *)v9 setBackgroundColor:v10];

    [(_UIContextMenuSubmenuTitleView *)v4 setBgView:v9];
    v11 = [(_UIContextMenuSubmenuTitleView *)v4 bgView];
    [(UIView *)v4 addSubview:v11];
    [(UIView *)v4 _addBoundsMatchingConstraintsForView:v11];

    uint64_t v12 = objc_opt_new();
    contentView = v4->_contentView;
    v4->_contentView = (_UIContextMenuCellContentView *)v12;

    [(_UIContextMenuCellContentView *)v4->_contentView setLayoutClass:objc_opt_class()];
    v14 = v4->_contentView;
    [(UIView *)v4 addSubview:v14];
    [(UIView *)v4 _addBoundsMatchingConstraintsForView:v14];
    v15 = [_UIContextMenuSeparatorView alloc];
    v16 = -[_UIContextMenuSeparatorView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4 addSubview:v16];
    [(_UIContextMenuSubmenuTitleView *)v4 setSeparator:v16];
    v27 = [(UIView *)v16 leadingAnchor];
    v26 = [(UIView *)v4 leadingAnchor];
    v17 = [v27 constraintEqualToAnchor:v26];
    v29[0] = v17;
    v18 = [(UIView *)v16 trailingAnchor];
    v19 = [(UIView *)v4 trailingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v29[1] = v20;
    v21 = [(UIView *)v16 topAnchor];
    v22 = [(UIView *)v4 bottomAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v29[2] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];

    [MEMORY[0x1E4F5B268] activateConstraints:v24];
  }
  return v4;
}

- (void)didMoveToWindow
{
  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuSubmenuTitleView;
  [(UIView *)&v8 didMoveToWindow];
  v3 = [(_UIContextMenuSubmenuTitleView *)self separator];
  v4 = [v3 heightAnchor];
  v5 = [(UIView *)self _screen];
  [v5 scale];
  v7 = [v4 constraintEqualToConstant:1.0 / v6];
  [v7 setActive:1];
}

- (void)setBackgroundMaterialGroupName:(id)a3
{
  id v7 = a3;
  v4 = [(_UIContextMenuSubmenuTitleView *)self bgView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v6 = [(_UIContextMenuSubmenuTitleView *)self bgView];
    [v6 _setGroupName:v7];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    BOOL v3 = a3;
    self->_highlighted = a3;
    if (a3)
    {
      v5 = [(_UIContextMenuSubmenuTitleView *)self highlightedBgView];

      if (!v5)
      {
        double v6 = [(UIView *)self traitCollection];
        uint64_t v7 = [v6 userInterfaceIdiom];
        objc_super v8 = +[UIShape rectShape];
        v9 = _UIContextMenuGetPlatformMetrics(v7);
        v10 = [v9 menuHighlightBackgroundDescriptorProvider];
        v11 = ((void (**)(void, void *))v10)[2](v10, v8);

        uint64_t v12 = [UIVisualEffectView alloc];
        v13 = [v11 effect];
        v14 = [(UIVisualEffectView *)v12 initWithEffect:v13];

        [(UIView *)self bounds];
        -[UIView setFrame:](v14, "setFrame:");
        v15 = [v11 backgroundColor];
        [(UIView *)v14 setBackgroundColor:v15];

        v16 = [v11 contentBackgroundColor];
        v17 = [(UIVisualEffectView *)v14 contentView];
        [v17 setBackgroundColor:v16];

        v18 = [v11 backgroundShape];
        [(UIView *)v14 _applyShape:v18];

        v19 = [(_UIContextMenuSubmenuTitleView *)self bgView];
        [(UIView *)self insertSubview:v14 aboveSubview:v19];
        [(UIView *)self _addBoundsMatchingConstraintsForView:v14];

        [(_UIContextMenuSubmenuTitleView *)self setHighlightedBgView:v14];
      }
    }
    id v20 = [(_UIContextMenuSubmenuTitleView *)self highlightedBgView];
    [v20 setHidden:!v3];
  }
}

- (void)addObscuringMaterialViewWithGroupName:(id)a3
{
  id v4 = a3;
  v5 = [(_UIContextMenuSubmenuTitleView *)self obscuringMaterialView];

  if (!v5)
  {
    double v6 = [(UIView *)self traitCollection];
    uint64_t v7 = _UIContextMenuGetPlatformMetrics([v6 userInterfaceIdiom]);
    objc_super v8 = [UIVisualEffectView alloc];
    v9 = [v7 menuBackgroundEffect];
    v10 = [(UIVisualEffectView *)v8 initWithEffect:v9];

    v11 = [v7 menuBackgroundColor];
    [(UIView *)v10 setBackgroundColor:v11];

    uint64_t v12 = [(_UIContextMenuSubmenuTitleView *)self bgView];
    if (self)
    {
      [(UIView *)self insertSubview:v10 aboveSubview:v12];
      [(UIView *)self _addBoundsMatchingConstraintsForView:v10];
    }

    [(_UIContextMenuSubmenuTitleView *)self setObscuringMaterialView:v10];
  }
  id v13 = [(_UIContextMenuSubmenuTitleView *)self obscuringMaterialView];
  [v13 _setGroupName:v4];
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuSubmenuTitleView;
  [(UIView *)&v9 setDirectionalLayoutMargins:sel_setDirectionalLayoutMargins_];
  objc_super v8 = [(_UIContextMenuSubmenuTitleView *)self contentView];
  objc_msgSend(v8, "setDirectionalLayoutMargins:", top, leading, bottom, trailing);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuSubmenuTitleView;
  id v6 = a3;
  [(UIView *)&v8 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  objc_msgSend(v6, "nextFocusedItem", v8.receiver, v8.super_class);
  uint64_t v7 = (_UIContextMenuSubmenuTitleView *)objc_claimAutoreleasedReturnValue();

  [(_UIContextMenuSubmenuTitleView *)self setHighlighted:v7 == self];
}

- (int64_t)focusItemDeferralMode
{
  if ([(_UIContextMenuSubmenuTitleView *)self highlighted]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)_wantsKeyCommandsWhenDeferred
{
  return 1;
}

- (_UIContextMenuCellContentView)contentView
{
  return self->_contentView;
}

- (UIVisualEffectView)obscuringMaterialView
{
  return self->_obscuringMaterialView;
}

- (void)setObscuringMaterialView:(id)a3
{
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (void)setAllowsFocus:(BOOL)a3
{
  self->_allowsFocus = a3;
}

- (UIView)bgView
{
  return self->_bgView;
}

- (void)setBgView:(id)a3
{
}

- (UIView)highlightedBgView
{
  return self->_highlightedBgView;
}

- (void)setHighlightedBgView:(id)a3
{
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_highlightedBgView, 0);
  objc_storeStrong((id *)&self->_bgView, 0);
  objc_storeStrong((id *)&self->_obscuringMaterialView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end