@interface _UIContextMenuHeaderView
- (BOOL)_isDisplayingTitleLabel;
- (BOOL)isMenuTitle;
- (NSDirectionalEdgeInsets)unscaledLayoutMargins;
- (NSString)title;
- (UILabel)titleLabel;
- (UIView)bgView;
- (UIView)contentView;
- (UIView)separator;
- (_UIContextMenuHeaderView)initWithFrame:(CGRect)a3;
- (double)_separatorHeight;
- (id)_titleFont;
- (id)_titleLabelFilterForCurrentTraits;
- (int64_t)_labelRenderingMode;
- (unint64_t)_titleLabelNumberOfLines;
- (unint64_t)separatorStyle;
- (void)_setNeedsConstraintRebuild;
- (void)_updateBackgroundView;
- (void)_updateCompositingFilterForCurrentState;
- (void)_updateLayoutMargins;
- (void)setBackgroundMaterialGroupName:(id)a3;
- (void)setBgView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setIsMenuTitle:(BOOL)a3;
- (void)setSeparator:(id)a3;
- (void)setSeparatorStyle:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUnscaledLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)updateConstraints;
@end

@implementation _UIContextMenuHeaderView

- (_UIContextMenuHeaderView)initWithFrame:(CGRect)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_UIContextMenuHeaderView;
  v3 = -[UICollectionReusableView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setInsetsLayoutMarginsFromSafeArea:0];
    [(_UIContextMenuHeaderView *)v4 _updateBackgroundView];
    [(_UIContextMenuHeaderView *)v4 setSeparatorStyle:1];
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    id v6 = [(UIView *)v4 registerForTraitChanges:v5 withHandler:&__block_literal_global_343];

    uint64_t v11 = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    id v8 = [(UIView *)v4 registerForTraitChanges:v7 withHandler:&__block_literal_global_9_2];
  }
  return v4;
}

- (void)_updateBackgroundView
{
  v3 = [(UIView *)self traitCollection];
  v4 = _UIContextMenuGetPlatformMetrics([v3 userInterfaceIdiom]);
  v5 = [v4 gradientMaskingConfiguration];
  int v6 = [v5 backgroundMasksCorners];

  if (v6)
  {
    v7 = [(UIView *)self layer];
    [v7 setAllowsGroupBlending:0];

    id v24 = [(UIView *)self layer];
    [v24 setAllowsGroupOpacity:0];
  }
  else
  {
    id v8 = [(_UIContextMenuHeaderView *)self bgView];

    if (v8)
    {
      v9 = [(_UIContextMenuHeaderView *)self bgView];
      [v9 removeFromSuperview];
    }
    BOOL v10 = [(_UIContextMenuHeaderView *)self isMenuTitle];
    uint64_t v11 = [(UIView *)self traitCollection];
    uint64_t v12 = [v11 userInterfaceIdiom];
    v13 = _UIContextMenuGetPlatformMetrics(v12);
    v14 = v13;
    if (v10)
    {
      v15 = [v13 menuTitleBackgroundProvider];

      if (v15)
      {
        v16 = [v14 menuTitleBackgroundProvider];
        v16[2]();
        v17 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _UIContextMenuGetPlatformMetrics(v12);
        v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v20 = [UIVisualEffectView alloc];
        v21 = [v16 menuBackgroundEffect];
        v17 = [(UIVisualEffectView *)v20 initWithEffect:v21];

        v22 = [v16 menuBackgroundColor];
        [(UIView *)v17 setBackgroundColor:v22];
      }
    }
    else
    {
      v18 = [UIVisualEffectView alloc];
      v19 = [v14 menuBackgroundEffect];
      v17 = [(UIVisualEffectView *)v18 initWithEffect:v19];

      v16 = [v14 menuBackgroundColor];
      [(UIView *)v17 setBackgroundColor:v16];
    }

    [(_UIContextMenuHeaderView *)self setBgView:v17];
    uint64_t v23 = [(_UIContextMenuHeaderView *)self bgView];
    id v24 = (id)v23;
    if (self)
    {
      [(UIView *)self insertSubview:v23 atIndex:0];
      [(UIView *)self _addBoundsMatchingConstraintsForView:v24];
    }
  }
}

- (void)setIsMenuTitle:(BOOL)a3
{
  if (self->_isMenuTitle != a3)
  {
    self->_isMenuTitle = a3;
    [(_UIContextMenuHeaderView *)self _updateBackgroundView];
  }
}

- (void)setTitle:(id)a3
{
  id v22 = a3;
  if (([v22 isEqualToString:self->_title] & 1) == 0)
  {
    v4 = (NSString *)[v22 copy];
    title = self->_title;
    self->_title = v4;

    int v6 = [(_UIContextMenuHeaderView *)self titleLabel];

    if (!v6)
    {
      v7 = objc_opt_new();
      id v8 = [(UIView *)self traitCollection];
      v9 = _UIContextMenuGetPlatformMetrics([v8 userInterfaceIdiom]);
      BOOL v10 = [v9 headerPrimaryColor];

      [v7 setTextColor:v10];
      uint64_t v11 = [(_UIContextMenuHeaderView *)self _titleFont];
      [v7 setFont:v11];

      uint64_t v12 = [(UIView *)self traitCollection];
      uint64_t v13 = [v12 userInterfaceIdiom];
      LODWORD(v10) = [(_UIContextMenuHeaderView *)self isMenuTitle];
      v14 = _UIContextMenuGetPlatformMetrics(v13);
      v15 = v14;
      if (v10) {
        uint64_t v16 = [v14 menuTitleTextAlignment];
      }
      else {
        uint64_t v16 = [v14 headerTextAlignment];
      }
      uint64_t v17 = v16;

      [v7 setTextAlignment:v17];
      objc_msgSend(v7, "setNumberOfLines:", -[_UIContextMenuHeaderView _titleLabelNumberOfLines](self, "_titleLabelNumberOfLines"));
      [v7 setAdjustsFontForContentSizeCategory:1];
      v18 = [(_UIContextMenuHeaderView *)self _titleLabelFilterForCurrentTraits];
      if (v18)
      {
        v19 = [v7 layer];
        [v19 setCompositingFilter:v18];
      }
      objc_msgSend(v7, "_setOverrideUserInterfaceRenderingMode:", -[_UIContextMenuHeaderView _labelRenderingMode](self, "_labelRenderingMode"));
      [(_UIContextMenuHeaderView *)self setTitleLabel:v7];
    }
    v20 = [(_UIContextMenuHeaderView *)self titleLabel];
    [v20 setText:v22];

    v21 = [(_UIContextMenuHeaderView *)self titleLabel];
    [(_UIContextMenuHeaderView *)self setContentView:v21];
  }
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    id v8 = v5;
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    if (*p_contentView)
    {
      [(UIView *)*p_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self addSubview:*p_contentView];
    }
    [(_UIContextMenuHeaderView *)self _setNeedsConstraintRebuild];
    v5 = v8;
  }
}

- (BOOL)_isDisplayingTitleLabel
{
  v2 = self;
  v3 = [(_UIContextMenuHeaderView *)self contentView];
  v4 = [(_UIContextMenuHeaderView *)v2 titleLabel];
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (void)setBackgroundMaterialGroupName:(id)a3
{
  id v7 = a3;
  v4 = [(_UIContextMenuHeaderView *)self bgView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v6 = [(_UIContextMenuHeaderView *)self bgView];
    [v6 _setGroupName:v7];
  }
}

- (void)setSeparatorStyle:(unint64_t)a3
{
  if (self->_separatorStyle == a3) {
    return;
  }
  self->_unint64_t separatorStyle = a3;
  v4 = [(_UIContextMenuHeaderView *)self separator];
  [v4 removeFromSuperview];

  unint64_t separatorStyle = self->_separatorStyle;
  if (separatorStyle != 2)
  {
    if (separatorStyle == 1)
    {
      int v6 = objc_opt_new();
      if (v6) {
        goto LABEL_5;
      }
    }
LABEL_7:
    id v7 = 0;
    goto LABEL_8;
  }
  id v12 = (id)objc_opt_new();
  id v8 = [(UIView *)self traitCollection];
  v9 = _UIContextMenuGetPlatformMetrics([v8 userInterfaceIdiom]);
  BOOL v10 = [v9 sectionSeparatorColor];

  [v12 setBackgroundColor:v10];
  int v6 = v12;
  if (!v12) {
    goto LABEL_7;
  }
LABEL_5:
  id v11 = v6;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self addSubview:v11];
  id v7 = v11;
LABEL_8:
  id v13 = v7;
  [(_UIContextMenuHeaderView *)self setSeparator:v7];
  [(_UIContextMenuHeaderView *)self _setNeedsConstraintRebuild];
}

- (id)_titleFont
{
  v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];
  BOOL v5 = [(_UIContextMenuHeaderView *)self isMenuTitle];
  int v6 = _UIContextMenuGetPlatformMetrics(v4);
  id v7 = v6;
  if (v5) {
    [v6 menuTitleFont];
  }
  else {
  id v8 = [v6 headerFont];
  }
  v9 = [v8 _fontAdjustedForCurrentContentSizeCategory];

  return v9;
}

- (unint64_t)_titleLabelNumberOfLines
{
  v2 = [(UIView *)self traitCollection];
  v3 = [v2 preferredContentSizeCategory];
  int IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v3, v4);

  if (IsAccessibilityContentSizeCategory) {
    return 0;
  }
  else {
    return 20;
  }
}

- (void)_updateCompositingFilterForCurrentState
{
  v3 = [(_UIContextMenuHeaderView *)self _titleLabelFilterForCurrentTraits];
  if (v3)
  {
    id v7 = v3;
    uint64_t v4 = [(_UIContextMenuHeaderView *)self _titleLabelFilterForCurrentTraits];
    BOOL v5 = [(_UIContextMenuHeaderView *)self titleLabel];
    int v6 = [v5 layer];
    [v6 setCompositingFilter:v4];

    v3 = v7;
  }
}

- (id)_titleLabelFilterForCurrentTraits
{
  v3 = [(UIView *)self traitCollection];
  uint64_t v4 = _UIContextMenuGetPlatformMetrics([v3 userInterfaceIdiom]);

  BOOL v5 = [v4 headerPrimaryCompositingFilterProvider];
  if (v5)
  {
    int v6 = [v4 headerPrimaryCompositingFilterProvider];
    id v7 = [(UIView *)self traitCollection];
    id v8 = ((void (**)(void, void *))v6)[2](v6, v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_setNeedsConstraintRebuild
{
  self->_needsConstraintRebuild = 1;
  [(UIView *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v53[4] = *MEMORY[0x1E4F143B8];
  if (self->_needsConstraintRebuild)
  {
    self->_needsConstraintRebuild = 0;
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = [(_UIContextMenuHeaderView *)self separator];
    v49 = (void *)v3;
    if (v4)
    {
      BOOL v5 = [(UIView *)self traitCollection];
      uint64_t v6 = [v5 userInterfaceIdiom];

      id v7 = _UIContextMenuGetPlatformMetrics(v6);
      [v7 sectionSeparatorInsets];
      double v9 = v8;
      double v11 = v10;

      v46 = [v4 leadingAnchor];
      v44 = [(UIView *)self leadingAnchor];
      v42 = [v46 constraintEqualToAnchor:v44 constant:v9];
      v53[0] = v42;
      v40 = [v4 trailingAnchor];
      id v12 = [(UIView *)self trailingAnchor];
      id v13 = [v40 constraintEqualToAnchor:v12 constant:-v11];
      v53[1] = v13;
      v14 = [v4 bottomAnchor];
      v15 = [(UIView *)self bottomAnchor];
      uint64_t v16 = [v14 constraintEqualToAnchor:v15];
      v53[2] = v16;
      uint64_t v17 = [v4 heightAnchor];
      [(_UIContextMenuHeaderView *)self _separatorHeight];
      v18 = objc_msgSend(v17, "constraintEqualToConstant:");
      v53[3] = v18;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];
      [v49 addObjectsFromArray:v19];
    }
    v20 = [(_UIContextMenuHeaderView *)self contentView];
    if (v20)
    {
      v48 = v4;
      if ([(_UIContextMenuHeaderView *)self _isDisplayingTitleLabel])
      {
        v21 = [(UIView *)self layoutMarginsGuide];
        id v22 = [v20 leadingAnchor];
        v43 = [v21 leadingAnchor];
        v45 = v22;
        v41 = [v22 constraintEqualToAnchor:v43];
        v52[0] = v41;
        uint64_t v23 = [v20 trailingAnchor];
        v38 = [v21 trailingAnchor];
        v39 = v23;
        id v24 = [v23 constraintEqualToAnchor:v38];
        v52[1] = v24;
        v25 = [v20 topAnchor];
        v26 = [v21 topAnchor];
        v27 = [v25 constraintEqualToAnchor:v26];
        v52[2] = v27;
        v28 = [v20 lastBaselineAnchor];
        v47 = v21;
        v29 = [v21 bottomAnchor];
        v30 = [v28 constraintEqualToAnchor:v29];
        v52[3] = v30;
        v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:4];
        [v49 addObjectsFromArray:v31];
      }
      else
      {
        v32 = [v4 topAnchor];
        v33 = v32;
        if (v32)
        {
          id v34 = v32;
        }
        else
        {
          id v34 = [(UIView *)self bottomAnchor];
        }
        id v35 = v34;

        v36 = [v20 leadingAnchor];
        v43 = [(UIView *)self leadingAnchor];
        v45 = v36;
        v41 = [v36 constraintEqualToAnchor:v43];
        v51[0] = v41;
        v37 = [v20 trailingAnchor];
        v38 = [(UIView *)self trailingAnchor];
        v39 = v37;
        id v24 = [v37 constraintEqualToAnchor:v38];
        v51[1] = v24;
        v25 = [v20 topAnchor];
        v26 = [(UIView *)self topAnchor];
        v27 = [v25 constraintEqualToAnchor:v26];
        v51[2] = v27;
        v28 = [v20 bottomAnchor];
        v47 = v35;
        v29 = [v28 constraintEqualToAnchor:v35];
        v51[3] = v29;
        v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:4];
        [v49 addObjectsFromArray:v30];
      }

      uint64_t v4 = v48;
    }
    [MEMORY[0x1E4F5B268] activateConstraints:v49];
  }
  v50.receiver = self;
  v50.super_class = (Class)_UIContextMenuHeaderView;
  [(UIView *)&v50 updateConstraints];
}

- (void)setUnscaledLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  if (a3.leading != self->_unscaledLayoutMargins.leading
    || a3.top != self->_unscaledLayoutMargins.top
    || a3.trailing != self->_unscaledLayoutMargins.trailing
    || a3.bottom != self->_unscaledLayoutMargins.bottom)
  {
    self->_unscaledLayoutMargins = a3;
    [(_UIContextMenuHeaderView *)self _updateLayoutMargins];
  }
}

- (void)_updateLayoutMargins
{
  id v14 = [(_UIContextMenuHeaderView *)self _titleFont];
  [(_UIContextMenuHeaderView *)self unscaledLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  objc_msgSend(v14, "_scaledValueForValue:");
  UIRoundToViewScale(self);
  double v10 = v9;
  [v14 _scaledValueForValue:v6];
  UIRoundToViewScale(self);
  double v12 = v11;
  [(_UIContextMenuHeaderView *)self _separatorHeight];
  -[UIView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v10, v4, v12 + v13, v8);
}

- (double)_separatorHeight
{
  unint64_t separatorStyle = self->_separatorStyle;
  if (separatorStyle == 2)
  {
    double v4 = [(UIView *)self traitCollection];
    double v5 = _UIContextMenuGetPlatformMetrics([v4 userInterfaceIdiom]);
    [v5 sectionSeparatorHeight];
    goto LABEL_5;
  }
  double v3 = 0.0;
  if (separatorStyle == 1)
  {
    double v4 = [(UIView *)self traitCollection];
    double v5 = _UIContextMenuGetPlatformMetrics([v4 userInterfaceIdiom]);
    [v5 itemSeparatorHeight];
LABEL_5:
    double v3 = v6;
  }
  return v3;
}

- (int64_t)_labelRenderingMode
{
  v2 = [(UIView *)self traitCollection];
  double v3 = _UIContextMenuGetPlatformMetrics([v2 userInterfaceIdiom]);

  int64_t v4 = [v3 itemSubtitleRenderingMode];
  return v4;
}

- (unint64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (NSString)title
{
  return self->_title;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isMenuTitle
{
  return self->_isMenuTitle;
}

- (NSDirectionalEdgeInsets)unscaledLayoutMargins
{
  double top = self->_unscaledLayoutMargins.top;
  double leading = self->_unscaledLayoutMargins.leading;
  double bottom = self->_unscaledLayoutMargins.bottom;
  double trailing = self->_unscaledLayoutMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (UIView)bgView
{
  return self->_bgView;
}

- (void)setBgView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
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
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bgView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end