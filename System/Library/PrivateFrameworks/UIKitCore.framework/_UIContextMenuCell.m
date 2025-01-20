@interface _UIContextMenuCell
+ (BOOL)_isInternalCell;
+ (BOOL)_wantsLegacyMenuGesture;
+ (Class)_contentViewClass;
- (BOOL)_allowsHorizontalFocusMovement;
- (BOOL)_highlightBackgroundViewNeedsUpdate;
- (BOOL)_selectedBackgroundViewNeedsUpdate;
- (BOOL)_wantsKeyCommandsWhenDeferred;
- (UIShape)_backgroundShape;
- (_UIContextMenuCell)initWithFrame:(CGRect)a3;
- (int64_t)focusItemDeferralMode;
- (void)_configureBackgroundView:(id)a3 withContentShape:(id)a4;
- (void)_configureFocusedFloatingContentView:(id)a3;
- (void)_updateStateWithAnimationCoordinator:(id)a3 animated:(BOOL)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 forHover:(BOOL)a4;
- (void)setSelected:(BOOL)a3;
- (void)set_backgroundShape:(id)a3;
- (void)set_highlightBackgroundViewNeedsUpdate:(BOOL)a3;
- (void)set_selectedBackgroundViewNeedsUpdate:(BOOL)a3;
@end

@implementation _UIContextMenuCell

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_isInternalCell
{
  return 1;
}

- (_UIContextMenuCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setFocusEffect:0];
    v5 = [(UIView *)v4 traitCollection];
    v6 = _UIContextMenuGetPlatformMetrics([v5 userInterfaceIdiom]);

    -[UICollectionViewCell _setFocusStyle:](v4, "_setFocusStyle:", [v6 enableFloatingFocusStyle]);
  }
  return v4;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIContextMenuCell;
  -[UICollectionViewCell setSelected:](&v14, sel_setSelected_);
  [(_UIContextMenuCell *)self _updateStateWithAnimationCoordinator:0 animated:+[UIView _isInAnimationBlock]];
  if (v3)
  {
    v5 = [(UICollectionViewCell *)self selectedBackgroundView];
    if (!v5)
    {
      v5 = objc_alloc_init(UIVisualEffectView);
      [(UICollectionViewCell *)self setSelectedBackgroundView:v5];
    }
    v6 = [(_UIContextMenuCell *)self actionView];
    v7 = [v6 contentShape];
    objc_super v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = +[UIShape rectShape];
    }
    v10 = v9;

    v11 = [(_UIContextMenuCell *)self _backgroundShape];
    uint64_t v12 = [v11 isEqual:v10] ^ 1;

    if ([(_UIContextMenuCell *)self _selectedBackgroundViewNeedsUpdate]
      || v12)
    {
      [(_UIContextMenuCell *)self set_backgroundShape:v10];
      [(_UIContextMenuCell *)self _configureBackgroundView:v5 withContentShape:v10];
      [(_UIContextMenuCell *)self set_highlightBackgroundViewNeedsUpdate:v12];
      [(_UIContextMenuCell *)self set_selectedBackgroundViewNeedsUpdate:0];
    }
  }
  v13 = [(UICollectionViewCell *)self selectedBackgroundView];
  [v13 setHidden:!v3];
}

- (void)setHighlighted:(BOOL)a3 forHover:(BOOL)a4
{
  int v4 = a4;
  BOOL v5 = a3;
  v7 = [(_UIContextMenuCell *)self actionView];
  int v8 = [v7 shouldHighlightOnHover];

  [(_UIContextMenuCell *)self setHighlighted:(v8 | ~v4) & v5];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIContextMenuCell;
  -[UICollectionViewCell setHighlighted:](&v14, sel_setHighlighted_);
  [(_UIContextMenuCell *)self _updateStateWithAnimationCoordinator:0 animated:+[UIView _isInAnimationBlock]];
  if (v3)
  {
    BOOL v5 = [(UICollectionViewCell *)self backgroundView];
    if (!v5)
    {
      BOOL v5 = objc_alloc_init(UIVisualEffectView);
      [(UICollectionViewCell *)self setBackgroundView:v5];
    }
    v6 = [(_UIContextMenuCell *)self actionView];
    v7 = [v6 contentShape];
    int v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = +[UIShape rectShape];
    }
    v10 = v9;

    v11 = [(_UIContextMenuCell *)self _backgroundShape];
    uint64_t v12 = [v11 isEqual:v10] ^ 1;

    if ([(_UIContextMenuCell *)self _highlightBackgroundViewNeedsUpdate]
      || v12)
    {
      [(_UIContextMenuCell *)self set_backgroundShape:v10];
      [(_UIContextMenuCell *)self _configureBackgroundView:v5 withContentShape:v10];
      [(_UIContextMenuCell *)self set_highlightBackgroundViewNeedsUpdate:0];
      [(_UIContextMenuCell *)self set_selectedBackgroundViewNeedsUpdate:v12];
    }
  }
  v13 = [(UICollectionViewCell *)self backgroundView];
  [v13 setHidden:!v3];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)_UIContextMenuCell;
  [(UICollectionViewCell *)&v10 layoutSubviews];
  BOOL v3 = [(_UIContextMenuCell *)self _backgroundShape];
  if (v3)
  {
    id v4 = +[UIShape rectShape];
    id v5 = v3;
    v6 = v5;
    if (v4 == v5)
    {

LABEL_12:
      goto LABEL_13;
    }
    if (v4)
    {
      char v7 = [v4 isEqual:v5];

      if (v7) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    if ([(UICollectionViewCell *)self isHighlighted])
    {
      int v8 = [(UICollectionViewCell *)self backgroundView];
      [(_UIContextMenuCell *)self _configureBackgroundView:v8 withContentShape:v6];
    }
    if ([(UICollectionViewCell *)self isSelected])
    {
      uint64_t v9 = [(UICollectionViewCell *)self selectedBackgroundView];
      [(_UIContextMenuCell *)self _configureBackgroundView:v9 withContentShape:v6];
      v6 = (void *)v9;
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (void)_configureBackgroundView:(id)a3 withContentShape:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(UIView *)self traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];
  id v18 = v6;
  objc_super v10 = _UIContextMenuGetPlatformMetrics(v9);
  v11 = [v10 menuHighlightBackgroundDescriptorProvider];
  uint64_t v12 = ((void (**)(void, id))v11)[2](v11, v18);

  [(UIView *)self bounds];
  objc_msgSend(v7, "setFrame:");
  v13 = [v12 effect];
  [v7 setEffect:v13];

  objc_super v14 = [v12 backgroundColor];
  [v7 setBackgroundColor:v14];

  v15 = [v12 contentBackgroundColor];
  v16 = [v7 contentView];
  [v16 setBackgroundColor:v15];

  v17 = [v12 backgroundShape];
  [v7 _applyShape:v17];
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuCell;
  [(UIView *)&v9 setDirectionalLayoutMargins:sel_setDirectionalLayoutMargins_];
  int v8 = [(UICollectionViewCell *)self contentView];
  objc_msgSend(v8, "setDirectionalLayoutMargins:", top, leading, bottom, trailing);
}

- (void)prepareForReuse
{
  BOOL v3 = [(_UIContextMenuCell *)self actionView];
  [v3 prepareForReuse];

  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuCell;
  [(UICollectionViewCell *)&v4 prepareForReuse];
}

+ (BOOL)_wantsLegacyMenuGesture
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIContextMenuCell;
  id v6 = a4;
  [(UIView *)&v7 didUpdateFocusInContext:a3 withAnimationCoordinator:v6];
  -[_UIContextMenuCell _updateStateWithAnimationCoordinator:animated:](self, "_updateStateWithAnimationCoordinator:animated:", v6, 1, v7.receiver, v7.super_class);
}

- (int64_t)focusItemDeferralMode
{
  if ([(UICollectionViewCell *)self isHighlighted]) {
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

- (BOOL)_allowsHorizontalFocusMovement
{
  v2 = [(_UIContextMenuCell *)self actionView];
  unint64_t v3 = ((unint64_t)[v2 options] >> 7) & 1;

  return v3;
}

- (void)_updateStateWithAnimationCoordinator:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if ([(UICollectionViewCell *)self isFocused]) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = 0;
  }
  if ([(UICollectionViewCell *)self isSelected]) {
    v6 |= 4uLL;
  }
  uint64_t v7 = v6 | [(UICollectionViewCell *)self isHighlighted];
  int v8 = [(_UIContextMenuCell *)self actionView];
  [v8 setControlState:v7 withAnimationCoordinator:v11];

  objc_super v9 = [(UICollectionViewCell *)self _focusedFloatingContentView];
  objc_super v10 = v9;
  if (v11) {
    [v9 setControlState:v7 withAnimationCoordinator:v11];
  }
  else {
    [v9 setControlState:v7 animated:v4];
  }
}

- (void)_configureFocusedFloatingContentView:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_UIFocusAnimationConfiguration configurationWithStyle:2];
  [v3 setFocusAnimationConfiguration:v4];

  [v3 setBackgroundColor:0 forState:0];
  [v3 setBackgroundColor:0 forState:8];
  [v3 setBackgroundColor:0 forState:1];
  [v3 setBackgroundColor:0 forState:4];
  [v3 setRoundContentWhenDeselected:1];
  [v3 setClipsContentToBounds:1];
  [v3 setFocusedSizeIncrease:20.0];
  objc_msgSend(v3, "setShadowExpansion:", 45.0, 25.0);
  [v3 setUnfocusedShadowVerticalOffset:10.0];
  objc_msgSend(v3, "setContentMotionRotation:translation:", 0.0, 0.0, 0.0, 4.0);
  [v3 setCornerRadius:16.0];
  id v5 = [v3 contentView];
  uint64_t v6 = [v5 layer];
  [v6 setAllowsGroupOpacity:0];

  id v8 = [v3 contentView];

  uint64_t v7 = [v8 layer];
  [v7 setAllowsGroupBlending:0];
}

- (UIShape)_backgroundShape
{
  return self->__backgroundShape;
}

- (void)set_backgroundShape:(id)a3
{
}

- (BOOL)_highlightBackgroundViewNeedsUpdate
{
  return *(&self->__selectedBackgroundViewNeedsUpdate + 3);
}

- (void)set_highlightBackgroundViewNeedsUpdate:(BOOL)a3
{
  *(&self->__selectedBackgroundViewNeedsUpdate + 3) = a3;
}

- (BOOL)_selectedBackgroundViewNeedsUpdate
{
  return *(&self->__selectedBackgroundViewNeedsUpdate + 4);
}

- (void)set_selectedBackgroundViewNeedsUpdate:(BOOL)a3
{
  *(&self->__selectedBackgroundViewNeedsUpdate + 4) = a3;
}

- (void).cxx_destruct
{
}

@end