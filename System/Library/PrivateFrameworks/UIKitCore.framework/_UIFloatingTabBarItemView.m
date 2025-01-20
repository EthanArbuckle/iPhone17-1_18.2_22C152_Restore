@interface _UIFloatingTabBarItemView
+ (id)_jitterRotationAnimationWithAmount:(double)a3;
+ (id)_jitterRotationAnimationWithStrength:(double)a3;
+ (id)_jitterXTranslationAnimationWithAmount:(double)a3;
+ (id)_jitterXTranslationAnimationWithStrength:(double)a3;
+ (id)_jitterYTranslationAnimationWithAmount:(double)a3;
+ (id)_jitterYTranslationAnimationWithStrength:(double)a3;
+ (id)dragPreviewForItem:(id)a3 userInterfaceStyle:(int64_t)a4;
- (BOOL)_hasValidCompactRepresentation;
- (BOOL)_isEffectivelyEditing;
- (BOOL)_showsImageView;
- (BOOL)_showsTitleLabel;
- (BOOL)_wantsBackground;
- (BOOL)hasSelectionHighlight;
- (BOOL)isCustomizableItem;
- (BOOL)isDisabled;
- (BOOL)isDragged;
- (BOOL)isEditing;
- (BOOL)isHighlighted;
- (BOOL)suppressEditing;
- (BOOL)suppressJiggleAnimation;
- (CGSize)_imageFittingSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UITab)item;
- (UIView)backgroundView;
- (_UIFloatingTabBarItemBadgeView)badgeView;
- (_UIFloatingTabBarItemView)initWithCoder:(id)a3;
- (_UIFloatingTabBarItemView)initWithFrame:(CGRect)a3;
- (double)baselineOffsetFromTop;
- (double)titleOpacity;
- (id)_currentPlatformMetrics;
- (id)accessibilityAttributedHint;
- (id)accessibilityAttributedLabel;
- (id)accessibilityAttributedValue;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)preferredDisplayMode;
- (unint64_t)accessibilityTraits;
- (void)_createViewHierarchy;
- (void)_updateFontAndColors;
- (void)_updateJigglingState;
- (void)layoutSubviews;
- (void)reloadItemView;
- (void)setDragged:(BOOL)a3;
- (void)setEditing:(BOOL)a3;
- (void)setHasSelectionHighlight:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setPreferredDisplayMode:(int64_t)a3;
- (void)setSuppressEditing:(BOOL)a3;
- (void)setSuppressJiggleAnimation:(BOOL)a3;
- (void)setTitleOpacity:(double)a3;
@end

@implementation _UIFloatingTabBarItemView

+ (id)dragPreviewForItem:(id)a3 userInterfaceStyle:(int64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(_UIFloatingTabBarItemView);
  v7 = [(UIView *)v6 traitOverrides];
  [v7 setUserInterfaceStyle:a4];

  [(_UIFloatingTabBarItemView *)v6 setDragged:1];
  [(_UIFloatingTabBarItemView *)v6 setEditing:1];
  [(_UIFloatingTabBarItemView *)v6 setItem:v5];

  [(UIView *)v6 sizeToFit];
  [(UIView *)v6 updateTraitsIfNeeded];
  v8 = objc_alloc_init(UIDragPreviewParameters);
  v9 = +[UIColor secondarySystemBackgroundColor];
  v10 = [(UIView *)v6 traitCollection];
  v11 = [v9 resolvedColorWithTraitCollection:v10];
  [(UIPreviewParameters *)v8 setBackgroundColor:v11];

  [(UIView *)v6 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(UIView *)v6 bounds];
  v21 = +[UIBezierPath _bezierPathWithPillRect:cornerRadius:](UIBezierPath, "_bezierPathWithPillRect:cornerRadius:", v13, v15, v17, v19, v20 * 0.5);
  [(UIPreviewParameters *)v8 setVisiblePath:v21];

  v22 = [[UIDragPreview alloc] initWithView:v6 parameters:v8];
  return v22;
}

- (_UIFloatingTabBarItemView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingTabBarItemView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_UIFloatingTabBarItemView *)v3 _createViewHierarchy];
  }
  return v4;
}

- (_UIFloatingTabBarItemView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingTabBarItemView;
  v3 = [(UIView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(_UIFloatingTabBarItemView *)v3 _createViewHierarchy];
  }
  return v4;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
  [(_UIFloatingTabBarItemView *)self reloadItemView];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(_UIFloatingTabBarItemView *)self _updateFontAndColors];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    [(_UIFloatingTabBarItemView *)self _updateFontAndColors];
  }
}

- (void)setSuppressJiggleAnimation:(BOOL)a3
{
  if (self->_suppressJiggleAnimation != a3)
  {
    self->_suppressJiggleAnimation = a3;
    [(_UIFloatingTabBarItemView *)self _updateJigglingState];
  }
}

- (void)setDragged:(BOOL)a3
{
  if (self->_dragged != a3)
  {
    self->_dragged = a3;
    [(_UIFloatingTabBarItemView *)self _updateJigglingState];
  }
}

- (void)setHasSelectionHighlight:(BOOL)a3
{
  if (self->_hasSelectionHighlight != a3)
  {
    self->_hasSelectionHighlight = a3;
    [(_UIFloatingTabBarItemView *)self _updateFontAndColors];
  }
}

- (void)setPreferredDisplayMode:(int64_t)a3
{
  if (self->_preferredDisplayMode != a3)
  {
    self->_preferredDisplayMode = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (double)titleOpacity
{
  v2 = [(_UIFloatingTabBarItemView *)self titleLabel];
  [v2 alpha];
  double v4 = v3;

  return v4;
}

- (void)setTitleOpacity:(double)a3
{
  id v4 = [(_UIFloatingTabBarItemView *)self titleLabel];
  [v4 setAlpha:a3];
}

- (double)baselineOffsetFromTop
{
  [(UILabel *)self->_titleLabel _firstBaselineOffsetFromTop];
  return result;
}

- (void)reloadItemView
{
  double v3 = [(UIView *)self layer];
  [v3 setAllowsGroupOpacity:0];

  BOOL v4 = [(_UIFloatingTabBarItemView *)self _hasValidCompactRepresentation];
  id v5 = [(_UIFloatingTabBarItemView *)self item];
  objc_super v6 = v5;
  if (v4)
  {
    v7 = [v5 _compactRepresentation];
    v8 = [v7 title];
    p_titleLabel = &self->_titleLabel;
    [(UILabel *)self->_titleLabel setText:v8];

    v10 = [(_UIFloatingTabBarItemView *)self item];
    v11 = [v10 _compactRepresentation];
    double v12 = [v11 image];
    p_imageView = &self->_imageView;
    [(UIImageView *)self->_imageView setImage:v12];
  }
  else
  {
    double v14 = [v5 title];
    p_titleLabel = &self->_titleLabel;
    [(UILabel *)self->_titleLabel setText:v14];

    v10 = [(_UIFloatingTabBarItemView *)self item];
    v11 = [v10 image];
    p_imageView = &self->_imageView;
    [(UIImageView *)self->_imageView setImage:v11];
  }

  double v15 = [(_UIFloatingTabBarItemView *)self item];
  double v16 = [v15 _clusterIdentifier];
  if (v16) {
    +[UIColor tintColor];
  }
  else {
  double v17 = +[UIColor clearColor];
  }
  [(UIImageView *)*p_imageView setBackgroundColor:v17];

  LODWORD(v17) = [(_UIFloatingTabBarItemView *)self _showsTitleLabel];
  BOOL v18 = [(_UIFloatingTabBarItemView *)self _showsImageView];
  double v19 = [(UIView *)*p_titleLabel superview];

  if (v17)
  {
    if (!v19) {
      [(UIView *)self addSubview:*p_titleLabel];
    }
  }
  else if (v19)
  {
    [(UIView *)*p_titleLabel removeFromSuperview];
  }
  double v20 = [(UIView *)*p_imageView superview];

  if (v18)
  {
    if (!v20) {
      [(UIView *)self addSubview:*p_imageView];
    }
  }
  else if (v20)
  {
    [(UIView *)*p_imageView removeFromSuperview];
  }
  v21 = [(_UIFloatingTabBarItemView *)self item];
  id v27 = [v21 badgeValue];

  uint64_t v22 = [v27 length];
  badgeView = self->_badgeView;
  if (v22)
  {
    if (!badgeView)
    {
      v24 = (_UIFloatingTabBarItemBadgeView *)objc_opt_new();
      v25 = self->_badgeView;
      self->_badgeView = v24;

      [(UIView *)self addSubview:self->_badgeView];
      badgeView = self->_badgeView;
    }
    [(_UIFloatingTabBarItemBadgeView *)badgeView setText:v27];
  }
  else if (badgeView)
  {
    [(UIView *)badgeView removeFromSuperview];
    v26 = self->_badgeView;
    self->_badgeView = 0;
  }
  [(UIView *)self setNeedsLayout];
  [(_UIFloatingTabBarItemView *)self _updateFontAndColors];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v51[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(_UIFloatingTabBarItemView *)self _showsTitleLabel];
  BOOL v5 = [(_UIFloatingTabBarItemView *)self _showsImageView];
  objc_super v6 = [(UIView *)self traitCollection];
  v7 = [(_UIFloatingTabBarItemView *)self _currentPlatformMetrics];
  [v7 imageMargins];
  double v9 = v8;
  double v11 = v10;
  [v7 titleMargins];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [v7 contentFont];
  v21 = [v20 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v6];

  uint64_t v22 = [(_UIFloatingTabBarItemView *)self titleLabel];
  v23 = [v22 text];
  if ([v23 length])
  {
    v24 = [(_UIFloatingTabBarItemView *)self titleLabel];
    v25 = [v24 text];
  }
  else
  {
    v25 = @" ";
  }

  id v26 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v50 = *(void *)off_1E52D2040;
  v51[0] = v21;
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
  v28 = (void *)[v26 initWithString:v25 attributes:v27];

  objc_msgSend(v28, "boundingRectWithSize:options:context:", 1, 0, 1.79769313e308, 1.79769313e308);
  double v30 = v29;
  double v32 = v31 - (-v19 - v15);
  if (v5)
  {
    [(_UIFloatingTabBarItemView *)self _imageFittingSize];
    double v34 = v33 - (-v11 - v9);
    if (v4)
    {
      double v35 = v34 - v11;
      [v7 imageAndTitleSpacing];
      double v37 = v32 - v15 + v35 + v36;
      goto LABEL_13;
    }
  }
  else
  {
    double v34 = *MEMORY[0x1E4F1DB30];
  }
  double v38 = 0.0;
  if (v4) {
    double v38 = v32;
  }
  if (v5) {
    double v37 = v34;
  }
  else {
    double v37 = v38;
  }
LABEL_13:
  [v7 maximumContentWidth];
  if (v37 > v39)
  {
    [v7 maximumContentWidth];
    double v37 = v40;
  }
  double v41 = v30 - (-v17 - v13);
  [v6 displayScale];
  double v43 = v42;
  UICeilToScale(v37, v42);
  double v45 = v44;
  UICeilToScale(v41, v43);
  double v47 = v46;

  double v48 = v45;
  double v49 = v47;
  result.height = v49;
  result.width = v48;
  return result;
}

- (void)layoutSubviews
{
  v120.receiver = self;
  v120.super_class = (Class)_UIFloatingTabBarItemView;
  [(UIView *)&v120 layoutSubviews];
  double v3 = [(_UIFloatingTabBarItemView *)self _currentPlatformMetrics];
  [v3 imageMargins];
  double v5 = v4;
  [v3 titleMargins];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(UIView *)self->_titleLabel superview];
  if (v14)
  {
    titleLabel = self->_titleLabel;
    [(UIView *)self bounds];
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v16, v17);
    double v112 = v18;
    double v113 = v19;
  }
  else
  {
    double v112 = *MEMORY[0x1E4F1DB30];
    double v113 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v20 = [(UIView *)self->_imageView superview];
  if (v20)
  {
    imageView = self->_imageView;
    [(UIView *)self bounds];
    -[UIImageView sizeThatFits:](imageView, "sizeThatFits:", v22, v23);
    double v117 = v25;
    double v118 = v24;
  }
  else
  {
    double v117 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v118 = *MEMORY[0x1E4F1DB30];
  }

  id v26 = [(_UIFloatingTabBarItemView *)self imageView];
  id v27 = [v26 image];
  char v28 = [v27 _isSymbolImage];

  double v29 = [(UIView *)self->_imageView superview];
  if (v29)
  {
    [(_UIFloatingTabBarItemView *)self _imageFittingSize];
    double rect = v30;
    double v32 = v31;
  }
  else
  {
    double v32 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double rect = *MEMORY[0x1E4F1DB30];
  }

  [(UIView *)self bounds];
  double v35 = round(v34 + (v33 - v32) * 0.5);
  double v116 = v35;
  if (v28)
  {
    double v36 = [(_UIFloatingTabBarItemView *)self imageView];
    [v36 _setCornerRadius:0.0];
  }
  else
  {
    double v37 = v5;
    double v38 = rect;
    double v39 = v32;
    CGRect v121 = CGRectInset(*(CGRect *)(&v35 - 1), -2.0, -2.0);
    double v114 = v5;
    double width = v121.size.width;
    double v110 = v13;
    double v41 = v9;
    double v42 = v11;
    double v43 = v7;
    double height = v121.size.height;
    if (v117 < v32 && v118 < rect) {
      uint64_t v46 = 4;
    }
    else {
      uint64_t v46 = 1;
    }
    double v47 = [(_UIFloatingTabBarItemView *)self imageView];
    [v47 setContentMode:v46];

    double v36 = [(_UIFloatingTabBarItemView *)self imageView];
    objc_msgSend(v36, "_setCornerRadius:", fmin(width, height) * 0.5);
    double v117 = height;
    double v118 = width;
    double v7 = v43;
    double v11 = v42;
    double v9 = v41;
    double v13 = v111;
    double v5 = v114;
  }

  [(UIView *)self bounds];
  double v49 = v9 + v48;
  double v115 = v7 + v50;
  double v52 = v51 - (v9 + v13);
  double v54 = v53 - (v7 + v11);
  uint64_t v55 = [(UIView *)self->_imageView superview];
  if (v55)
  {
    v56 = (void *)v55;
    v57 = [(UIView *)self->_titleLabel superview];

    if (v57)
    {
      v122.origin.x = v5;
      v122.origin.y = v116;
      v122.size.double width = rect;
      v122.size.double height = v32;
      double MaxX = CGRectGetMaxX(v122);
      [v3 imageAndTitleSpacing];
      double v59 = v5;
      double v61 = MaxX + v60;
      v123.origin.x = v49;
      v123.origin.y = v115;
      v123.size.double width = v52;
      v123.size.double height = v54;
      double v52 = CGRectGetMaxX(v123) - v61;
      double v49 = v61;
      double v5 = v59;
    }
  }
  if (v112 <= v52 + 8.0) {
    double v62 = v112;
  }
  else {
    double v62 = v52 + 8.0;
  }
  v63 = [(_UIFloatingTabBarItemView *)self imageView];
  int v64 = [v63 _hasBaseline];

  v65 = [(_UIFloatingTabBarItemView *)self imageView];
  if (v64)
  {
    objc_msgSend(v65, "frameForAlignmentRect:", v5, v116, rect, v32);
    double v67 = v66;
    double v69 = v68;
    double v71 = v70;
    double v73 = v72;
    v74 = [(_UIFloatingTabBarItemView *)self imageView];
    objc_msgSend(v74, "setFrame:", v67, v69, v71, v73);
  }
  else
  {
    objc_msgSend(v65, "setFrame:", v5 + (rect - v118) * 0.5, v116 + (v32 - v117) * 0.5, v118, v117);
  }

  v75 = [(_UIFloatingTabBarItemView *)self titleLabel];
  objc_msgSend(v75, "setFrame:", v49 + (v52 - v62) * 0.5, v115 + (v54 - v113) * 0.5, v62, v113);

  [(UIView *)self bounds];
  double v78 = v77 + v76 * 0.5;
  double v81 = v80 + v79 * 0.5;
  v82 = [(_UIFloatingTabBarItemView *)self backgroundView];
  objc_msgSend(v82, "setCenter:", v78, v81);

  [(UIView *)self bounds];
  double v84 = v83;
  double v86 = v85;
  double v88 = v87;
  double v90 = v89;
  v91 = [(_UIFloatingTabBarItemView *)self backgroundView];
  objc_msgSend(v91, "setBounds:", v84, v86, v88, v90);

  [(UIView *)self bounds];
  double v93 = v92;
  [(UIView *)self bounds];
  double v95 = fmin(v93, v94) * 0.5;
  v96 = [(_UIFloatingTabBarItemView *)self backgroundView];
  [v96 _setContinuousCornerRadius:v95];

  v97 = [(_UIFloatingTabBarItemView *)self badgeView];
  v98 = v97;
  if (v97)
  {
    [v97 sizeToFit];
    BOOL v99 = [(UIView *)self _shouldReverseLayoutDirection];
    [v3 badgeOffset];
    double v101 = v100;
    double v103 = v102;
    [v98 bounds];
    double v105 = v104;
    double v107 = v106;
    if (v99)
    {
      double v108 = -v101;
    }
    else
    {
      [(UIView *)self bounds];
      double v109 = CGRectGetWidth(v124);
      v125.origin.x = 0.0;
      v125.origin.y = 0.0;
      v125.size.double width = v105;
      v125.size.double height = v107;
      double v108 = v101 + v109 - CGRectGetWidth(v125);
    }
    objc_msgSend(v98, "setFrame:", v108, v103, v105, v107);
  }
}

- (BOOL)_hasValidCompactRepresentation
{
  v2 = [(_UIFloatingTabBarItemView *)self item];
  double v3 = [v2 _compactRepresentation];

  double v4 = [v3 title];
  if ([v4 length])
  {
    BOOL v5 = 1;
  }
  else
  {
    double v6 = [v3 image];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (BOOL)_showsTitleLabel
{
  BOOL v3 = [(_UIFloatingTabBarItemView *)self _hasValidCompactRepresentation];
  double v4 = [(_UIFloatingTabBarItemView *)self item];
  BOOL v5 = v4;
  if (v3)
  {
    double v6 = [v4 _compactRepresentation];
    double v7 = [v6 title];
  }
  else
  {
    double v7 = [v4 title];
  }

  BOOL v8 = [(_UIFloatingTabBarItemView *)self preferredDisplayMode] != 2
    && [v7 length] != 0;

  return v8;
}

- (BOOL)_showsImageView
{
  if (![(_UIFloatingTabBarItemView *)self _showsTitleLabel]) {
    return 1;
  }
  BOOL v3 = [(_UIFloatingTabBarItemView *)self item];
  double v4 = [v3 _clusterIdentifier];
  BOOL v5 = v4 != 0;

  return v5;
}

- (CGSize)_imageFittingSize
{
  BOOL v3 = [(_UIFloatingTabBarItemView *)self _currentPlatformMetrics];
  double v4 = [(_UIFloatingTabBarItemView *)self imageView];
  BOOL v5 = [v4 image];
  int v6 = [v5 _isSymbolImage];

  if (v6)
  {
    double v7 = [(_UIFloatingTabBarItemView *)self imageView];
    [v7 intrinsicContentSize];
  }
  else
  {
    double v7 = [(UIView *)self traitCollection];
    [v3 scaledImageSizeForTraitCollection:v7];
  }
  double v10 = v8;
  double v11 = v9;

  [(UIView *)self _currentScreenScale];
  double v13 = UISizeRoundToScale(v10, v11, v12);
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)_createViewHierarchy
{
  v18[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (UILabel *)objc_opt_new();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setAdjustsFontForContentSizeCategory:1];
  BOOL v5 = (UIImageView *)objc_opt_new();
  imageView = self->_imageView;
  self->_imageView = v5;

  [(UIView *)self->_imageView setClipsToBounds:1];
  [(UIImageView *)self->_imageView setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  double v7 = (UIView *)objc_opt_new();
  backgroundView = self->_backgroundView;
  self->_backgroundView = v7;

  double v9 = [(UIView *)self->_backgroundView layer];
  [v9 setShadowPathIsBounds:1];

  [(UIView *)self addSubview:self->_backgroundView];
  [(_UIFloatingTabBarItemView *)self _updateFontAndColors];
  v18[0] = 0x1ED3F5A48;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v11 = [(UIView *)self _registerForTraitTokenChanges:v10 withHandler:&__block_literal_global_626];

  uint64_t v17 = objc_opt_class();
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  id v13 = [(UIView *)self registerForTraitChanges:v12 withHandler:&__block_literal_global_19_3];

  uint64_t v16 = objc_opt_class();
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  id v15 = [(UIView *)self registerForTraitChanges:v14 withHandler:&__block_literal_global_22_5];
}

- (BOOL)_isEffectivelyEditing
{
  BOOL v3 = [(_UIFloatingTabBarItemView *)self isEditing];
  if (v3) {
    LOBYTE(v3) = ![(_UIFloatingTabBarItemView *)self suppressEditing];
  }
  return v3;
}

- (BOOL)isCustomizableItem
{
  v2 = [(_UIFloatingTabBarItemView *)self item];
  char v3 = [v2 _hasCustomizablePlacement];

  return v3;
}

- (BOOL)isDisabled
{
  v2 = [(_UIFloatingTabBarItemView *)self item];
  char v3 = [v2 isDisabled];

  return v3;
}

- (BOOL)_wantsBackground
{
  if ([(_UIFloatingTabBarItemView *)self isEditing])
  {
    if ([(_UIFloatingTabBarItemView *)self suppressEditing])
    {
      return 0;
    }
    else
    {
      return [(_UIFloatingTabBarItemView *)self isCustomizableItem];
    }
  }
  else
  {
    double v4 = [(UIView *)self traitCollection];
    uint64_t v5 = [v4 valueForNSIntegerTrait:objc_opt_class()];

    BOOL result = [(_UIFloatingTabBarItemView *)self hasSelectionHighlight];
    if (v5) {
      return 0;
    }
  }
  return result;
}

- (void)_updateFontAndColors
{
  char v3 = [(_UIFloatingTabBarItemView *)self _currentPlatformMetrics];
  double v4 = [v3 contentPaletteProvider];
  uint64_t v5 = [(UIView *)self traitCollection];
  int v6 = v4[2](v4, [v5 userInterfaceStyle]);

  double v7 = [v6 resolvedColorFromProvider:self];
  if ([(_UIFloatingTabBarItemView *)self _isEffectivelyEditing]
    || ![(_UIFloatingTabBarItemView *)self hasSelectionHighlight])
  {
    uint64_t v8 = [v3 contentFont];
  }
  else
  {
    uint64_t v8 = [v3 selectedContentFont];
  }
  double v9 = (void *)v8;
  if ([(_UIFloatingTabBarItemView *)self _isEffectivelyEditing]
    || ![(_UIFloatingTabBarItemView *)self hasSelectionHighlight])
  {
    uint64_t v10 = [v3 symbolConfiguration];
  }
  else
  {
    uint64_t v10 = [v3 selectedSymbolConfiguration];
  }
  id v11 = (void *)v10;
  double v12 = [v3 selectionBackgroundColor];
  id v13 = [(_UIFloatingTabBarItemView *)self backgroundView];
  [v13 setBackgroundColor:v12];

  uint64_t v14 = [(_UIFloatingTabBarItemView *)self _wantsBackground] ^ 1;
  id v15 = [(_UIFloatingTabBarItemView *)self backgroundView];
  [v15 setHidden:v14];

  uint64_t v16 = [v3 selectionShadow];
  uint64_t v17 = [(_UIFloatingTabBarItemView *)self backgroundView];
  [v16 applyToView:v17];

  [(_UIFloatingTabBarItemView *)self _updateJigglingState];
  BOOL v18 = [(_UIFloatingTabBarItemView *)self _isEffectivelyEditing];
  double v19 = [(_UIFloatingTabBarItemView *)self badgeView];
  [v19 setHidden:v18];

  double v20 = [(_UIFloatingTabBarItemView *)self imageView];
  v21 = [v20 tintColor];
  if ([v21 isEqual:v7])
  {
    [(_UIFloatingTabBarItemView *)self titleLabel];
    char v28 = v11;
    v23 = double v22 = v6;
    double v24 = [v23 font];
    char v25 = [v24 isEqual:v9];

    int v6 = v22;
    id v11 = v28;

    if (v25) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __49___UIFloatingTabBarItemView__updateFontAndColors__block_invoke;
  v29[3] = &unk_1E52D9F98;
  v29[4] = self;
  id v30 = v7;
  +[UIView performWithoutAnimation:v29];
  id v26 = [(_UIFloatingTabBarItemView *)self titleLabel];
  [v26 setFont:v9];

  id v27 = [(_UIFloatingTabBarItemView *)self imageView];
  [v27 setPreferredSymbolConfiguration:v11];

  [(UIView *)self setNeedsLayout];
LABEL_14:
}

- (id)_currentPlatformMetrics
{
  v2 = [(UIView *)self traitCollection];
  char v3 = _UIFloatingTabBarGetPlatformMetrics([v2 userInterfaceIdiom]);

  return v3;
}

- (void)_updateJigglingState
{
  if (![(_UIFloatingTabBarItemView *)self _wantsBackground]
    || ![(_UIFloatingTabBarItemView *)self _isEffectivelyEditing]
    || [(_UIFloatingTabBarItemView *)self isDragged])
  {
    char v3 = [(UIView *)self layer];
LABEL_5:
    id v12 = v3;
    [v3 removeAllAnimations];
    goto LABEL_6;
  }
  BOOL v4 = [(_UIFloatingTabBarItemView *)self suppressJiggleAnimation];
  char v3 = [(UIView *)self layer];
  if (v4) {
    goto LABEL_5;
  }
  id v12 = v3;
  uint64_t v5 = [v3 animationKeys];
  char v6 = [v5 containsObject:@"RotationJitterAnimation"];

  if ((v6 & 1) == 0)
  {
    [(UIView *)self bounds];
    double v7 = 80.0 / CGRectGetWidth(v14);
    if (v7 <= 1.0) {
      double v8 = v7;
    }
    else {
      double v8 = 1.0;
    }
    double v9 = [(id)objc_opt_class() _jitterRotationAnimationWithStrength:v8];
    uint64_t v10 = [(id)objc_opt_class() _jitterXTranslationAnimationWithStrength:1.0];
    id v11 = [(id)objc_opt_class() _jitterYTranslationAnimationWithStrength:1.0];
    [v12 addAnimation:v9 forKey:@"RotationJitterAnimation"];
    [v12 addAnimation:v10 forKey:@"XTranslationJitterAnimation"];
    [v12 addAnimation:v11 forKey:@"YTranslationJitterAnimation"];
  }
LABEL_6:
}

+ (id)_jitterXTranslationAnimationWithStrength:(double)a3
{
  return (id)[a1 _jitterXTranslationAnimationWithAmount:a3 * 0.4];
}

+ (id)_jitterXTranslationAnimationWithAmount:(double)a3
{
  BOOL v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.x"];
  [v4 setDuration:0.134];
  [v4 setBeginTime:(double)arc4random_uniform(0x64u) / 100.0];
  uint64_t v5 = [NSNumber numberWithDouble:a3];
  [v4 setFromValue:v5];

  char v6 = [NSNumber numberWithDouble:-a3];
  [v4 setToValue:v6];

  LODWORD(v7) = 1052266988;
  LODWORD(v8) = 1059145646;
  LODWORD(v9) = 1.0;
  uint64_t v10 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v7 :0.0 :v8 :v9];
  [v4 setTimingFunction:v10];

  LODWORD(v11) = 2139095040;
  [v4 setRepeatCount:v11];
  [v4 setAutoreverses:1];
  [v4 setRemovedOnCompletion:0];
  return v4;
}

+ (id)_jitterYTranslationAnimationWithStrength:(double)a3
{
  return (id)[a1 _jitterYTranslationAnimationWithAmount:a3 * 0.4];
}

+ (id)_jitterYTranslationAnimationWithAmount:(double)a3
{
  BOOL v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.y"];
  [v4 setDuration:0.142];
  [v4 setBeginTime:(double)arc4random_uniform(0x64u) / 100.0];
  uint64_t v5 = [NSNumber numberWithDouble:a3];
  [v4 setFromValue:v5];

  char v6 = [NSNumber numberWithDouble:-a3];
  [v4 setToValue:v6];

  LODWORD(v7) = 1052266988;
  LODWORD(v8) = 1059145646;
  LODWORD(v9) = 1.0;
  uint64_t v10 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v7 :0.0 :v8 :v9];
  [v4 setTimingFunction:v10];

  LODWORD(v11) = 2139095040;
  [v4 setRepeatCount:v11];
  [v4 setAutoreverses:1];
  [v4 setRemovedOnCompletion:0];
  return v4;
}

+ (id)_jitterRotationAnimationWithStrength:(double)a3
{
  return (id)[a1 _jitterRotationAnimationWithAmount:a3 * 0.03];
}

+ (id)_jitterRotationAnimationWithAmount:(double)a3
{
  BOOL v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation"];
  [v4 setDuration:0.128];
  [v4 setBeginTime:(double)arc4random_uniform(0x64u) / 100.0];
  uint64_t v5 = [NSNumber numberWithDouble:-a3];
  [v4 setFromValue:v5];

  char v6 = [NSNumber numberWithDouble:a3];
  [v4 setToValue:v6];

  LODWORD(v7) = 1052266988;
  LODWORD(v8) = 1059145646;
  LODWORD(v9) = 1.0;
  uint64_t v10 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v7 :0.0 :v8 :v9];
  [v4 setTimingFunction:v10];

  LODWORD(v11) = 2139095040;
  [v4 setRepeatCount:v11];
  [v4 setAutoreverses:1];
  [v4 setRemovedOnCompletion:0];
  return v4;
}

- (id)accessibilityIdentifier
{
  return [(UITab *)self->_item accessibilityIdentifier];
}

- (id)accessibilityLabel
{
  return [self->_item accessibilityLabel];
}

- (id)accessibilityAttributedLabel
{
  return [self->_item accessibilityAttributedLabel];
}

- (id)accessibilityValue
{
  return [self->_item accessibilityValue];
}

- (id)accessibilityAttributedValue
{
  return [self->_item accessibilityAttributedValue];
}

- (id)accessibilityHint
{
  return [self->_item accessibilityHint];
}

- (id)accessibilityAttributedHint
{
  return [self->_item accessibilityAttributedHint];
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFloatingTabBarItemView;
  unint64_t v3 = [&v7 accessibilityTraits];
  BOOL v4 = [(_UIFloatingTabBarItemView *)self isHighlighted];
  uint64_t v5 = 8;
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5 | 1;
}

- (UITab)item
{
  return self->_item;
}

- (int64_t)preferredDisplayMode
{
  return self->_preferredDisplayMode;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)hasSelectionHighlight
{
  return self->_hasSelectionHighlight;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)suppressEditing
{
  return self->_suppressEditing;
}

- (void)setSuppressEditing:(BOOL)a3
{
  self->_suppressEditing = a3;
}

- (BOOL)suppressJiggleAnimation
{
  return self->_suppressJiggleAnimation;
}

- (BOOL)isDragged
{
  return self->_dragged;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (_UIFloatingTabBarItemBadgeView)badgeView
{
  return self->_badgeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end