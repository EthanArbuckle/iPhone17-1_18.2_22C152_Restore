@interface _UIEditMenuListViewCell
+ (CGSize)layoutSizeForItem:(id)a3 traitCollection:(id)a4 containerSize:(CGSize)a5;
- (BOOL)_wantsPasteSlotView;
- (NSArray)contentConstraints;
- (NSLayoutConstraint)maximumWidthConstraint;
- (NSLayoutConstraint)minimumWidthConstraint;
- (NSLayoutConstraint)slotViewCenterXConstraint;
- (NSLayoutConstraint)slotViewCenterYConstraint;
- (UIEdgeInsets)arrowEdgeInsets;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UIStackView)contentStackView;
- (UIView)customView;
- (_UIEditMenuListItem)item;
- (_UIEditMenuListViewCell)initWithCoder:(id)a3;
- (_UIEditMenuListViewCell)initWithFrame:(CGRect)a3;
- (_UISlotView)securePasteButtonSlotView;
- (double)maximumContentWidth;
- (unsigned)_secureName;
- (void)_contentSizeCategoryDidChange;
- (void)_createViewHierarchy;
- (void)_hideContents;
- (void)_overlaySlotView:(id)a3;
- (void)_setupSlotView;
- (void)_updateConstraints;
- (void)_updateFont;
- (void)_updateLayoutMargins;
- (void)didMoveToWindow;
- (void)prepareForReuse;
- (void)setArrowEdgeInsets:(UIEdgeInsets)a3;
- (void)setBounds:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setMaximumContentWidth:(double)a3;
@end

@implementation _UIEditMenuListViewCell

+ (CGSize)layoutSizeForItem:(id)a3 traitCollection:(id)a4 containerSize:(CGSize)a5
{
  double width = a5.width;
  v85[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = a4;
  v9 = _UIEditMenuGetPlatformMetrics([v8 userInterfaceIdiom]);
  v10 = [v7 title];
  v11 = [v7 image];
  v12 = [v7 customView];
  v13 = [v8 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

  [v9 menuItemMargins];
  double v18 = v17;
  double v19 = v15;
  double v21 = v20;
  double v22 = v16;
  if (IsAccessibilityCategory) {
    double v23 = width - v15 - v16;
  }
  else {
    double v23 = 1.79769313e308;
  }
  v24 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleSubhead" compatibleWithTraitCollection:v8];
  if (v12)
  {
    v25 = [v12 traitCollection];
    if (v8)
    {
      if (v25 && v8[13] == v25[13])
      {
        uint64_t v26 = v8[15];
        uint64_t v27 = v25[15];

        if (v26 == v27)
        {
LABEL_9:
          objc_msgSend(v12, "systemLayoutSizeFittingSize:", v23, 1.79769313e308);
          double v29 = v28;
          double v31 = v30;
LABEL_12:
          [v8 displayScale];
          double v41 = v40;
          goto LABEL_33;
        }
      }
      else
      {
      }
      v32 = [v8 preferredContentSizeCategory];
      v33 = -[UIView _internalTraitOverrides](v12);
      [v33 setPreferredContentSizeCategory:v32];

      uint64_t v34 = [v8 legibilityWeight];
      v35 = -[UIView _internalTraitOverrides](v12);
      [v35 setLegibilityWeight:v34];

      [v12 setNeedsLayout];
      [v12 layoutIfNeeded];
      objc_msgSend(v12, "systemLayoutSizeFittingSize:", v23, 1.79769313e308);
      double v29 = v36;
      double v31 = v37;
      v38 = -[UIView _internalTraitOverrides](v12);
      [v38 removeTrait:objc_opt_class()];

      v39 = -[UIView _internalTraitOverrides](v12);
      [v39 removeTrait:objc_opt_class()];

      goto LABEL_12;
    }

    goto LABEL_9;
  }
  double v82 = v18;
  double v43 = *MEMORY[0x1E4F1DB30];
  double v42 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v83 = v42;
  double v44 = *MEMORY[0x1E4F1DB30];
  if (([v7 hidesTitleForTraitCollection:v8] & 1) == 0)
  {
    uint64_t v84 = *(void *)off_1E52D2040;
    v85[0] = v24;
    v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:&v84 count:1];
    objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v45, 0, v23, 1.79769313e308);
    double v44 = v46;
    double v83 = v47;
  }
  if (([v7 hidesImageForTraitCollection:v8] & 1) == 0)
  {
    v48 = +[UIImageSymbolConfiguration configurationWithFont:v24];
    v49 = [v48 configurationWithTraitCollection:v8];

    v50 = (void *)_layoutImageView;
    if (!_layoutImageView)
    {
      uint64_t v51 = objc_opt_new();
      v52 = (void *)_layoutImageView;
      _layoutImageView = v51;

      [(id)_layoutImageView setPreferredSymbolConfiguration:v49];
      v50 = (void *)_layoutImageView;
    }
    v53 = [v50 traitCollection];
    v80 = v10;
    if (v8)
    {
      if (v53 && v8[13] == v53[13])
      {
        uint64_t v54 = v8[15];
        v55 = v49;
        uint64_t v56 = v53[15];

        BOOL v57 = v54 == v56;
        v49 = v55;
        if (v57) {
          goto LABEL_26;
        }
      }
      else
      {
      }
      v58 = objc_msgSend(v8, "preferredContentSizeCategory", v80);
      [(id)_layoutImageView traitOverrides];
      v60 = v59 = v49;
      [v60 setPreferredContentSizeCategory:v58];

      uint64_t v61 = [v8 legibilityWeight];
      v62 = [(id)_layoutImageView traitOverrides];
      [v62 setLegibilityWeight:v61];

      v49 = v59;
      [(id)_layoutImageView setPreferredSymbolConfiguration:v59];
      [(id)_layoutImageView updateTraitsIfNeeded];
    }
    else
    {
    }
LABEL_26:
    objc_msgSend((id)_layoutImageView, "setImage:", v11, v80);
    [(id)_layoutImageView sizeToFit];
    [(id)_layoutImageView bounds];
    double v64 = v63;
    double v66 = v65;
    [(id)_layoutImageView alignmentRectInsets];
    double v43 = v64 - (v67 + v68);
    double v42 = v66 - (v69 + v70);

    v10 = v81;
  }
  [v8 displayScale];
  double v41 = v71;
  double v72 = 0.0;
  if (v44 > 0.0 && v43 > 0.0) {
    double v72 = 6.0;
  }
  double v29 = v19 + v22 + v43 + v44 + v72;
  double v31 = fmax(v83, v42) - (-v21 - v82);
LABEL_33:
  UICeilToScale(v29, v41);
  double v75 = v74;
  UICeilToScale(v31, v41);
  double v77 = v76;

  double v78 = v75;
  double v79 = v77;
  result.height = v79;
  result.double width = v78;
  return result;
}

- (_UIEditMenuListViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIEditMenuListViewCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_UIEditMenuListViewCell *)v3 _createViewHierarchy];
  }
  return v4;
}

- (_UIEditMenuListViewCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIEditMenuListViewCell;
  v3 = [(UICollectionViewCell *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(_UIEditMenuListViewCell *)v3 _createViewHierarchy];
  }
  return v4;
}

- (void)setMaximumContentWidth:(double)a3
{
  if (self->_maximumContentWidth != a3)
  {
    if (a3 == 0.0)
    {
      maximumWidthConstraint = self->_maximumWidthConstraint;
      if (maximumWidthConstraint)
      {
        [(NSLayoutConstraint *)maximumWidthConstraint setActive:0];
        objc_super v6 = self->_maximumWidthConstraint;
        self->_maximumWidthConstraint = 0;
      }
    }
    self->_maximumContentWidth = a3;
    if (a3 != 0.0)
    {
      id v7 = self->_maximumWidthConstraint;
      if (v7)
      {
        [(NSLayoutConstraint *)v7 setConstant:a3];
      }
      else
      {
        v8 = [(UICollectionViewCell *)self contentView];
        v9 = [v8 widthAnchor];
        v10 = [v9 constraintLessThanOrEqualToConstant:a3];
        v11 = self->_maximumWidthConstraint;
        self->_maximumWidthConstraint = v10;

        v12 = self->_maximumWidthConstraint;
        [(NSLayoutConstraint *)v12 setActive:1];
      }
    }
  }
}

- (void)setArrowEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_arrowEdgeInsets.left
    || a3.top != self->_arrowEdgeInsets.top
    || a3.right != self->_arrowEdgeInsets.right
    || a3.bottom != self->_arrowEdgeInsets.bottom)
  {
    self->_arrowEdgeInsets = a3;
    [(_UIEditMenuListViewCell *)self _updateLayoutMargins];
    [(_UIEditMenuListViewCell *)self _setupSlotView];
    [(_UIEditMenuListViewCell *)self _updateConstraints];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  LODWORD(v3) = a3;
  v5 = [(_UIEditMenuListViewCell *)self item];
  char v6 = [v5 options];

  if (v6) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v3;
  }
  v30.receiver = self;
  v30.super_class = (Class)_UIEditMenuListViewCell;
  [(UICollectionViewCell *)&v30 setHighlighted:v3];
  id v7 = [(UIView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v3)
  {
    v9 = [(UICollectionViewCell *)self backgroundView];

    if (!v9)
    {
      v10 = _UIEditMenuGetPlatformMetrics(v8);
      v11 = [UIVisualEffectView alloc];
      v12 = [v10 menuHighlightBackgroundEffect];
      v13 = [(UIVisualEffectView *)v11 initWithEffect:v12];

      v14 = [v10 menuHighlightBackgroundColor];
      double v15 = [(UIVisualEffectView *)v13 contentView];
      [v15 setBackgroundColor:v14];

      [(UICollectionViewCell *)self setBackgroundView:v13];
    }
  }
  double v16 = [(UIView *)self traitCollection];
  double v17 = _UIEditMenuGetPlatformMetrics([v16 userInterfaceIdiom]);
  double v18 = [v17 cellBackgroundShape];

  [(UIView *)self bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  uint64_t v27 = [(UICollectionViewCell *)self backgroundView];
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  double v28 = [(UICollectionViewCell *)self backgroundView];
  [v28 _applyShape:v18];

  double v29 = [(UICollectionViewCell *)self backgroundView];
  [v29 setHidden:v3 ^ 1];
}

- (void)setItem:(id)a3
{
  id v30 = a3;
  char v6 = [v30 title];
  if (v6) {
    goto LABEL_2;
  }
  id v7 = [v30 image];

  if (!v7)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UIEditMenuListViewCell.m" lineNumber:195 description:@"One of title or image must be non-null"];
LABEL_2:
  }
  objc_storeStrong((id *)&self->_item, a3);
  uint64_t v8 = [v30 title];
  [(UILabel *)self->_titleLabel setText:v8];

  v9 = [v30 image];
  [(UIImageView *)self->_imageView setImage:v9];

  v10 = [(UIView *)self traitCollection];
  -[UIView setHidden:](self->_titleLabel, "setHidden:", [v30 hidesTitleForTraitCollection:v10]);

  v11 = [(UIView *)self traitCollection];
  -[UIImageView setHidden:](self->_imageView, "setHidden:", [v30 hidesImageForTraitCollection:v11]);

  v12 = +[UIColor labelColor];
  if ([v30 options])
  {
    uint64_t v14 = +[UIColor secondaryLabelColor];
  }
  else
  {
    if (([v30 options] & 2) == 0) {
      goto LABEL_9;
    }
    v13 = _UIEditMenuGetPlatformMetrics([(UIView *)self _userInterfaceIdiom]);
    uint64_t v14 = [v13 destructiveColor];

    v12 = v13;
  }

  v12 = (void *)v14;
LABEL_9:
  [(UILabel *)self->_titleLabel setTextColor:v12];
  [(UIView *)self->_imageView setTintColor:v12];
  double v15 = [v30 menuElement];
  double v16 = [v15 accessibilityIdentifier];
  [self setAccessibilityIdentifier:v16];

  double v17 = [v30 customView];
  p_customView = (id *)&self->_customView;
  customView = self->_customView;
  self->_customView = v17;

  contentStackView = self->_contentStackView;
  if (self->_customView)
  {
    [(UIView *)contentStackView removeFromSuperview];
    [*p_customView setTranslatesAutoresizingMaskIntoConstraints:0];
LABEL_11:
    double v21 = [(UICollectionViewCell *)self contentView];
    [v21 addSubview:*p_customView];

    [(_UIEditMenuListViewCell *)self _updateConstraints];
    goto LABEL_13;
  }
  double v22 = [(UIView *)contentStackView superview];

  if (!v22)
  {
    p_customView = (id *)&self->_contentStackView;
    goto LABEL_11;
  }
LABEL_13:
  [v30 overrideMinimumWidth];
  if (v23 <= 0.0)
  {
    double v24 = [(_UIEditMenuListViewCell *)self minimumWidthConstraint];

    if (v24)
    {
      [(NSLayoutConstraint *)self->_minimumWidthConstraint setActive:0];
      minimumWidthConstraint = self->_minimumWidthConstraint;
      self->_minimumWidthConstraint = 0;
    }
  }
  else if (self->_minimumWidthConstraint)
  {
    [v30 overrideMinimumWidth];
    -[NSLayoutConstraint setConstant:](self->_minimumWidthConstraint, "setConstant:");
  }
  else
  {
    double v26 = [(UICollectionViewCell *)self contentView];
    uint64_t v27 = [v26 widthAnchor];
    [v30 overrideMinimumWidth];
    objc_msgSend(v27, "constraintGreaterThanOrEqualToConstant:");
    double v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    double v29 = self->_minimumWidthConstraint;
    self->_minimumWidthConstraint = v28;

    [(NSLayoutConstraint *)self->_minimumWidthConstraint setActive:1];
  }
  [(_UIEditMenuListViewCell *)self _setupSlotView];
  [(UIView *)self setNeedsLayout];
}

- (void)_createViewHierarchy
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UICollectionViewCell *)self contentView];
  [v3 setInsetsLayoutMarginsFromSafeArea:0];

  v4 = (UILabel *)objc_opt_new();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  char v6 = (UIImageView *)objc_opt_new();
  imageView = self->_imageView;
  self->_imageView = v6;

  uint64_t v8 = [UIStackView alloc];
  v9 = self->_titleLabel;
  v16[0] = self->_imageView;
  v16[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v11 = [(UIStackView *)v8 initWithArrangedSubviews:v10];

  [(UIStackView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)v11 setSpacing:6.0];
  [(UIStackView *)v11 setAxis:0];
  objc_storeStrong((id *)&self->_contentStackView, v11);
  v12 = [(UICollectionViewCell *)self contentView];
  [v12 addSubview:v11];

  [(_UIEditMenuListViewCell *)self _updateLayoutMargins];
  [(_UIEditMenuListViewCell *)self _updateConstraints];
  [(_UIEditMenuListViewCell *)self _updateFont];
  [(UIView *)self _setDisableDictationTouchCancellation:1];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v14 = [(UIView *)self registerForTraitChanges:v13 withAction:sel__contentSizeCategoryDidChange];
}

- (void)_contentSizeCategoryDidChange
{
  [(_UIEditMenuListViewCell *)self _updateFont];
  item = self->_item;
  v4 = [(UIView *)self traitCollection];
  [(UIView *)self->_titleLabel setHidden:[(_UIEditMenuListItem *)item hidesTitleForTraitCollection:v4]];

  v5 = self->_item;
  id v6 = [(UIView *)self traitCollection];
  [(UIImageView *)self->_imageView setHidden:[(_UIEditMenuListItem *)v5 hidesImageForTraitCollection:v6]];
}

- (void)_updateConstraints
{
  v35[4] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F5B000uLL;
  if (self->_contentConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
  }
  customView = self->_customView;
  if (customView)
  {
    double v25 = [(UIView *)customView leftAnchor];
    v33 = [(UICollectionViewCell *)self contentView];
    uint64_t v5 = [v33 leftAnchor];
    [(_UIEditMenuListViewCell *)self arrowEdgeInsets];
    v32 = (void *)v5;
    double v31 = [v25 constraintEqualToAnchor:v5 constant:v6];
    v35[0] = v31;
    id v7 = [(UIView *)self->_customView topAnchor];
    double v29 = [(UICollectionViewCell *)self contentView];
    uint64_t v8 = [v29 topAnchor];
    [(_UIEditMenuListViewCell *)self arrowEdgeInsets];
    id v30 = v7;
    double v28 = (void *)v8;
    uint64_t v27 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8);
    v35[1] = v27;
    double v26 = [(UICollectionViewCell *)self contentView];
    v9 = [v26 rightAnchor];
    v10 = [(UIView *)self->_customView rightAnchor];
    [(_UIEditMenuListViewCell *)self arrowEdgeInsets];
    v12 = [v9 constraintEqualToAnchor:v10 constant:v11];
    v35[2] = v12;
    v13 = [(UICollectionViewCell *)self contentView];
    id v14 = [v13 bottomAnchor];
    double v15 = [(UIView *)self->_customView bottomAnchor];
    [(_UIEditMenuListViewCell *)self arrowEdgeInsets];
    double v17 = [v14 constraintEqualToAnchor:v15 constant:v16];
    v35[3] = v17;
    double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];

    unint64_t v3 = 0x1E4F5B000;
    double v19 = v25;
  }
  else
  {
    double v20 = [(UICollectionViewCell *)self contentView];
    double v19 = [v20 layoutMarginsGuide];

    double v21 = [(UIView *)self->_contentStackView leadingAnchor];
    v32 = [v19 leadingAnchor];
    v33 = v21;
    double v31 = [v21 constraintEqualToAnchor:v32];
    v34[0] = v31;
    double v22 = [(UIView *)self->_contentStackView trailingAnchor];
    double v29 = [v19 trailingAnchor];
    id v30 = v22;
    double v28 = [v22 constraintEqualToAnchor:v29];
    v34[1] = v28;
    double v23 = [(UIView *)self->_contentStackView topAnchor];
    double v26 = [v19 topAnchor];
    uint64_t v27 = v23;
    v9 = [v23 constraintEqualToAnchor:v26];
    v34[2] = v9;
    v10 = [(UIView *)self->_contentStackView bottomAnchor];
    v12 = [v19 bottomAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    v34[3] = v13;
    double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
  }

  [*(id *)(v3 + 616) activateConstraints:v18];
  contentConstraints = self->_contentConstraints;
  self->_contentConstraints = v18;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_UIEditMenuListViewCell;
  [(UIView *)&v4 didMoveToWindow];
  unint64_t v3 = [(UIView *)self window];

  if (v3) {
    [(_UIEditMenuListViewCell *)self _updateFont];
  }
}

- (void)_updateFont
{
  unint64_t v3 = [(UIView *)self traitCollection];
  id v10 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleSubhead" compatibleWithTraitCollection:v3];

  [(UILabel *)self->_titleLabel setFont:v10];
  objc_super v4 = +[UIImageSymbolConfiguration configurationWithFont:v10];
  [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v4];

  uint64_t v5 = [(UIView *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 1;
  }
  if (IsAccessibilityCategory) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 4;
  }
  [(UILabel *)self->_titleLabel setNumberOfLines:!IsAccessibilityCategory];
  [(UILabel *)self->_titleLabel setTextAlignment:v8];
  [(UIImageView *)self->_imageView setContentMode:v9];
}

- (void)_updateLayoutMargins
{
  unint64_t v3 = [(UIView *)self traitCollection];
  _UIEditMenuGetPlatformMetrics([v3 userInterfaceIdiom]);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  [v21 menuItemMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(_UIEditMenuListViewCell *)self arrowEdgeInsets];
  double v13 = v5 + v12;
  double v15 = v7 + v14;
  double v17 = v9 + v16;
  double v19 = v11 + v18;
  double v20 = [(UICollectionViewCell *)self contentView];
  objc_msgSend(v20, "setLayoutMargins:", v13, v15, v17, v19);
}

- (void)setBounds:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIEditMenuListViewCell;
  -[UIView setBounds:](&v5, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = [(_UIEditMenuListViewCell *)self securePasteButtonSlotView];

  if (v4) {
    [(_UIEditMenuListViewCell *)self _setupSlotView];
  }
}

- (void)_setupSlotView
{
  if ([(_UIEditMenuListViewCell *)self _wantsPasteSlotView]
    && ([(_UIEditMenuListItem *)self->_item options] & 1) == 0)
  {
    securePasteButtonSlotView = self->_securePasteButtonSlotView;
    if (securePasteButtonSlotView)
    {
      double v4 = securePasteButtonSlotView;
    }
    else
    {
      double v4 = objc_alloc_init(_UISlotView);
      objc_storeStrong((id *)&self->_securePasteButtonSlotView, v4);
    }
    objc_super v5 = [(UIView *)self traitCollection];
    double v6 = _UIEditMenuGetPlatformMetrics([v5 userInterfaceIdiom]);

    [v6 menuItemMargins];
    double v8 = v7;
    double v10 = v9;
    [(UIView *)self bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [(_UIEditMenuListViewCell *)self arrowEdgeInsets];
    CGFloat v20 = v14 + v19;
    CGFloat v23 = v16 - (v21 + v22);
    v48.size.double height = v18 - (v19 + v24);
    v48.origin.x = v12 + v21;
    v48.origin.y = v20;
    v48.size.double width = v23;
    CGRect v49 = CGRectInset(v48, 2.0, 0.0);
    double width = v49.size.width;
    double height = v49.size.height;
    double v27 = v10 + -2.0;
    double v28 = [(UIView *)self traitCollection];
    double v29 = [v28 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v29);

    if (IsAccessibilityCategory)
    {
      uint64_t v31 = 0;
    }
    else
    {
      v32 = [(_UIEditMenuListViewCell *)self item];
      uint64_t v31 = [v32 displayMode];
    }
    v33 = (void *)MEMORY[0x1E4F881E0];
    uint64_t v34 = [(_UIEditMenuListViewCell *)self item];
    v35 = [v34 pasteVariant];
    double v36 = objc_msgSend(v33, "editMenuPasteButtonTagWithSecureName:size:contentOrigin:displayMode:", objc_msgSend(v35, "secureName"), v31, width, height, v27, v8);

    objc_initWeak(&location, self);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __41___UIEditMenuListViewCell__setupSlotView__block_invoke;
    v45[3] = &unk_1E52DDC40;
    id v37 = v36;
    id v46 = v37;
    [(_UISlotView *)v4 _setSlotStyleResolver:v45];
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    double v41 = __41___UIEditMenuListViewCell__setupSlotView__block_invoke_2;
    double v42 = &unk_1E52DDCB8;
    id v38 = v37;
    id v43 = v38;
    objc_copyWeak(&v44, &location);
    [(_UISlotView *)v4 _setSlotAnyContentProvider:&v39];
    -[_UIEditMenuListViewCell _overlaySlotView:](self, "_overlaySlotView:", v4, v39, v40, v41, v42);
    objc_destroyWeak(&v44);

    objc_destroyWeak(&location);
  }
}

- (BOOL)_wantsPasteSlotView
{
  unint64_t v3 = [(_UIEditMenuListViewCell *)self item];
  double v4 = [v3 pasteVariant];
  if (v4)
  {
    objc_super v5 = [(_UIEditMenuListViewCell *)self item];
    char v6 = [v5 wantsPasteSlotView];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unsigned)_secureName
{
  v2 = [(_UIEditMenuListViewCell *)self item];
  unint64_t v3 = [v2 pasteVariant];

  if (v3) {
    unsigned int v4 = [v3 secureName];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (void)_overlaySlotView:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 superview];
  char v6 = [(UICollectionViewCell *)self contentView];

  if (v5 != v6)
  {
    [v4 setUserInteractionEnabled:0];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v7 = [(UICollectionViewCell *)self contentView];
    [v7 addSubview:v4];

    double v8 = [v4 centerXAnchor];
    double v9 = [(UICollectionViewCell *)self contentView];
    double v10 = [v9 centerXAnchor];
    double v11 = [v8 constraintEqualToAnchor:v10];
    slotViewCenterXConstraint = self->_slotViewCenterXConstraint;
    self->_slotViewCenterXConstraint = v11;

    double v13 = [v4 centerYAnchor];
    double v14 = [(UICollectionViewCell *)self contentView];
    double v15 = [v14 centerYAnchor];
    double v16 = [v13 constraintEqualToAnchor:v15];
    slotViewCenterYConstraint = self->_slotViewCenterYConstraint;
    self->_slotViewCenterYConstraint = v16;

    double v18 = (void *)MEMORY[0x1E4F5B268];
    double v19 = [(_UIEditMenuListViewCell *)self slotViewCenterXConstraint];
    v28[0] = v19;
    CGFloat v20 = [(_UIEditMenuListViewCell *)self slotViewCenterYConstraint];
    v28[1] = v20;
    double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    [v18 activateConstraints:v21];
  }
  if (self->_slotViewCenterXConstraint)
  {
    [(_UIEditMenuListViewCell *)self arrowEdgeInsets];
    double v23 = v22;
    [(_UIEditMenuListViewCell *)self arrowEdgeInsets];
    [(NSLayoutConstraint *)self->_slotViewCenterXConstraint setConstant:(v23 - v24) * 0.5];
  }
  if (self->_slotViewCenterYConstraint)
  {
    [(_UIEditMenuListViewCell *)self arrowEdgeInsets];
    double v26 = v25;
    [(_UIEditMenuListViewCell *)self arrowEdgeInsets];
    [(NSLayoutConstraint *)self->_slotViewCenterYConstraint setConstant:(v26 - v27) * 0.5];
  }
}

- (void)_hideContents
{
  id v2 = [(_UIEditMenuListViewCell *)self contentStackView];
  [v2 setAlpha:0.0];
}

- (void)prepareForReuse
{
  v10.receiver = self;
  v10.super_class = (Class)_UIEditMenuListViewCell;
  [(UICollectionViewCell *)&v10 prepareForReuse];
  if ([(_UIEditMenuListViewCell *)self _wantsPasteSlotView])
  {
    unint64_t v3 = [(_UIEditMenuListViewCell *)self contentStackView];
    [v3 setAlpha:1.0];

    [(UIView *)self->_securePasteButtonSlotView removeFromSuperview];
    securePasteButtonSlotView = self->_securePasteButtonSlotView;
    self->_securePasteButtonSlotView = 0;

    slotViewCenterYConstraint = self->_slotViewCenterYConstraint;
    self->_slotViewCenterYConstraint = 0;
  }
  char v6 = [(UIView *)self->_customView superview];
  double v7 = [(UICollectionViewCell *)self contentView];

  if (v6 == v7) {
    [(UIView *)self->_customView removeFromSuperview];
  }
  customView = self->_customView;
  self->_customView = 0;

  item = self->_item;
  self->_item = 0;
}

- (_UIEditMenuListItem)item
{
  return self->_item;
}

- (double)maximumContentWidth
{
  return self->_maximumContentWidth;
}

- (UIEdgeInsets)arrowEdgeInsets
{
  double top = self->_arrowEdgeInsets.top;
  double left = self->_arrowEdgeInsets.left;
  double bottom = self->_arrowEdgeInsets.bottom;
  double right = self->_arrowEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (_UISlotView)securePasteButtonSlotView
{
  return self->_securePasteButtonSlotView;
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIView)customView
{
  return self->_customView;
}

- (NSArray)contentConstraints
{
  return self->_contentConstraints;
}

- (NSLayoutConstraint)minimumWidthConstraint
{
  return self->_minimumWidthConstraint;
}

- (NSLayoutConstraint)maximumWidthConstraint
{
  return self->_maximumWidthConstraint;
}

- (NSLayoutConstraint)slotViewCenterXConstraint
{
  return self->_slotViewCenterXConstraint;
}

- (NSLayoutConstraint)slotViewCenterYConstraint
{
  return self->_slotViewCenterYConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_slotViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_maximumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_minimumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentConstraints, 0);
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_securePasteButtonSlotView, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end