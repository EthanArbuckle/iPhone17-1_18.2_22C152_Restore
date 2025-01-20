@interface UISegment
+ (id)_backgroundImageWithStorage:(id)a3 mini:(BOOL)a4 state:(unint64_t)a5 position:(unsigned int)a6 drawMode:(unsigned int *)a7 isCustom:(BOOL *)a8 defaultBlock:(id)a9;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3;
- (BOOL)_effectiveDisableShadow;
- (BOOL)_effectiveUseDynamicShadow;
- (BOOL)_hasSelectedColor;
- (BOOL)_isContainedInHostedFocusSystem;
- (BOOL)isAnimatingSelectionIndicator;
- (BOOL)isHighlighted;
- (BOOL)isHovered;
- (BOOL)isMomentary;
- (BOOL)isRightHighlighted;
- (BOOL)isRightSelected;
- (BOOL)isSelected;
- (BOOL)isSelectionIndicatorDragged;
- (BOOL)showDivider;
- (BOOL)useBlockyMagnificationInClassic;
- (CATransform3D)_highlightSelectionInfoTransform;
- (CGRect)_contentRectForBounds:(CGRect)a3;
- (CGRect)contentRect;
- (CGSize)_maximumTextSize;
- (CGSize)contentSize;
- (Class)_segmentedControlClass;
- (NSArray)_infoConstraints;
- (NSString)badgeValue;
- (UIAction)action;
- (UIEdgeInsets)_paddingInsets;
- (UISegment)initWithCoder:(id)a3;
- (UISegment)initWithInfo:(id)a3 size:(int)a4 barStyle:(int64_t)a5 tintColor:(id)a6 appearanceStorage:(id)a7 position:(unsigned int)a8 autosizeText:(BOOL)a9 adjustsForContentSizeCategory:(BOOL)a10 customInfoView:(id)a11 traitCollection:(id)a12;
- (UIView)badgeView;
- (double)_barHeight;
- (double)_idealWidth;
- (double)requestedScaleFactor;
- (id)_attributedTextForState:(unint64_t)a3 selected:(BOOL)a4 forceSelectedAppearance:(BOOL)a5;
- (id)_contentViewIfNeeded;
- (id)_dividerImage;
- (id)_dividerImageIsCustom:(BOOL *)a3;
- (id)_effectiveBackgroundTintColor;
- (id)_effectiveBackgroundView;
- (id)_effectiveContentView;
- (id)_effectiveSelectedSegmentTintColor;
- (id)_effectiveVisualEffect;
- (id)_encodableSubviews;
- (id)_floatingContentView;
- (id)_parentSegmentedControl;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (id)_stateTextAttibutes:(id)a3 segmentState:(unint64_t)a4;
- (id)_tintColorArchivingKey;
- (id)disabledTextColor;
- (id)focusEffect;
- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)label;
- (id)objectValue;
- (id)parentFocusEnvironment;
- (id)viewForLastBaselineLayout;
- (int)controlSize;
- (unint64_t)_segmentState;
- (unsigned)segmentPosition;
- (void)_finishInitialSegmentSetup;
- (void)_forceInfoDisplay;
- (void)_insertSelectionView;
- (void)_invalidateInfoConstraints;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_positionInfo;
- (void)_positionInfoWithoutAnimation;
- (void)_removeSelectionIndicator;
- (void)_setEnabledAppearance:(BOOL)a3;
- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)_setInfoConstraints:(id)a3;
- (void)_setSelectionIndicatorDragged:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateBackgroundAndContentViews;
- (void)_updateBackgroundAndContentViewsIfNeeded;
- (void)_updateDynamicShadow:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateFloatingContentControlState:(unint64_t)a3 context:(id)a4 withAnimationCoordinator:(id)a5 animated:(BOOL)a6;
- (void)_updateHighlight;
- (void)_updateSelectionIndicator;
- (void)_updateSelectionToTransform:(CATransform3D *)a3 infoTransform:(CATransform3D *)a4 hideSelection:(BOOL)a5 shouldAnimate:(BOOL)a6;
- (void)_updateTextColors;
- (void)animateAdd:(BOOL)a3;
- (void)animateRemoveForWidth:(double)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)insertDividerView;
- (void)layoutSubviews;
- (void)removeFromSuperview;
- (void)setAction:(id)a3;
- (void)setAdjustsForContentSizeCategory:(BOOL)a3;
- (void)setAnimatingSelectionIndicator:(BOOL)a3;
- (void)setAutosizeText:(BOOL)a3;
- (void)setBadgeValue:(id)a3;
- (void)setBarStyle:(int64_t)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentOffset:(CGSize)a3;
- (void)setControlSize:(int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHovered:(BOOL)a3;
- (void)setMomentary:(BOOL)a3;
- (void)setNeedsBackgroundAndContentViewUpdate;
- (void)setObjectValue:(id)a3;
- (void)setRequestedScaleFactor:(double)a3;
- (void)setSegmentPosition:(unsigned int)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 highlighted:(BOOL)a4;
- (void)setSelectionIndicatorDragged:(BOOL)a3;
- (void)setShowDivider:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setUsesAXTextSize:(BOOL)a3;
- (void)setWasSelected:(BOOL)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
- (void)updateDividerViewForChangedSegment:(id)a3;
- (void)updateForAppearance:(id)a3;
- (void)updateMasking;
@end

@implementation UISegment

uint64_t __29__UISegment__updateHighlight__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 504) setAlpha:*(double *)(a1 + 40)];
}

- (void)updateConstraints
{
  v22.receiver = self;
  v22.super_class = (Class)UISegment;
  [(UIView *)&v22 updateConstraints];
  info = self->_info;
  if (info
    && ![(UIView *)info translatesAutoresizingMaskIntoConstraints]
    && !self->_infoConstraints)
  {
    double width = self->_contentOffset.width;
    double height = self->_contentOffset.height;
    v6 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage contentPositionOffsetForSegment:(((unint64_t)self->_segmentFlags >> 6) & 7) + 1 inMiniBar:0];
    v7 = v6;
    if (v6)
    {
      [v6 UIOffsetValue];
      double width = width + v8;
      double height = height + v9;
    }
    -[UISegment _contentRectForBounds:](self, "_contentRectForBounds:", 0.0, 0.0, 100.0, 100.0);
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat v12 = v23.size.width;
    CGFloat v13 = v23.size.height;
    double v21 = height + CGRectGetMinY(v23);
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.double width = v12;
    v24.size.double height = v13;
    double v14 = width + CGRectGetMinX(v24);
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.double width = v12;
    v25.size.double height = v13;
    double v15 = 100.0 - CGRectGetMaxY(v25) - height;
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.double width = v12;
    v26.size.double height = v13;
    CGFloat MaxX = CGRectGetMaxX(v26);
    v17 = (void *)MEMORY[0x1E4F1CA48];
    v18 = [MEMORY[0x1E4F5B268] constraintWithItem:self->_info attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:(v14 - (100.0 - MaxX - width)) * 0.5];
    v19 = [v17 arrayWithObject:v18];

    v20 = [MEMORY[0x1E4F5B268] constraintWithItem:self->_info attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:(v21 - v15) * 0.5];
    [v19 addObject:v20];

    [(UIView *)self addConstraints:v19];
    [(UISegment *)self _setInfoConstraints:v19];
  }
}

- (BOOL)isHighlighted
{
  return (*(unsigned char *)&self->_segmentFlags >> 3) & 1;
}

- (double)_idealWidth
{
  double width = self->_width;
  if (width <= 0.0)
  {
    [(UISegment *)self contentSize];
    double v5 = v4;
    double v6 = self->_contentOffset.width;
    if (v6 <= 0.0)
    {
      [(UISegment *)self _paddingInsets];
      double v6 = v7 + v8;
    }
    double width = v5 + v6;
  }
  double v9 = [(UISegment *)self _segmentedControlClass];
  v10 = [(UIView *)self traitCollection];
  [(objc_class *)v9 _cornerRadiusForTraitCollection:v10 size:[(UISegment *)self controlSize]];
  double v12 = v11;

  return fmax(v12 + v12, width);
}

- (CGSize)contentSize
{
  if ((*((unsigned char *)&self->_segmentFlags + 2) & 4) != 0)
  {
    [(UIView *)self->_info intrinsicContentSize];
LABEL_7:
    double v5 = v6;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v5 = *MEMORY[0x1E4F1DB30];
      goto LABEL_8;
    }
    [(UISegment *)self _maximumTextSize];
    goto LABEL_7;
  }
  v3 = [(UIView *)self->_info image];
  [v3 size];
  double v5 = v4;

LABEL_8:
  [(UISegment *)self _barHeight];
  double v8 = v7;
  double v9 = v5;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (double)_barHeight
{
  if ((*((unsigned char *)&self->_segmentFlags + 1) & 0x80) != 0)
  {
    double v5 = [(UISegment *)self _parentSegmentedControl];
    [v5 _barHeight];
  }
  else
  {
    v3 = [(UISegment *)self _segmentedControlClass];
    appearanceStorage = self->_appearanceStorage;
    double v5 = [(UIView *)self traitCollection];
    double v6 = segmentBarHeight(v3, appearanceStorage, (uint64_t)v5, *(_DWORD *)&self->_segmentFlags & 3);
  }
  double v7 = v6;

  return v7;
}

- (UIEdgeInsets)_paddingInsets
{
  v3 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage backgroundImageForState:0 isMini:0 withFallback:1];
  double v4 = 0.0;
  if (v3
    && ![(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage legacySuppressOptionsBackground])
  {
    double v5 = 0.0;
    if ([v3 _isResizable])
    {
      [v3 capInsets];
      double v5 = v11;
      double v4 = v12;
    }
  }
  else
  {
    double v5 = 0.0;
  }
  double v6 = [(UISegment *)self _segmentedControlClass];
  double v7 = [(UIView *)self traitCollection];
  double v8 = UISegmentedControlStyleProviderForIdiom(v6, [v7 userInterfaceIdiom]);

  [v8 defaultContentPaddingWidth];
  int v10 = (*(_DWORD *)&self->_segmentFlags >> 6) & 7;
  switch(v10)
  {
    case 2:
      goto LABEL_11;
    case 1:
      double v4 = v9;
LABEL_11:
      double v5 = v9;
      break;
    case 0:
      double v4 = v9;
      break;
  }
  if (v9 >= v5) {
    double v5 = v9;
  }
  if (v9 >= v4) {
    double v4 = v9;
  }

  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = v5;
  double v16 = v4;
  result.right = v16;
  result.bottom = v14;
  result.left = v15;
  result.top = v13;
  return result;
}

- (void)_updateSelectionIndicator
{
  v3 = [(UISegment *)self _segmentedControlClass];
  double v4 = [(UIView *)self traitCollection];
  double v5 = UISegmentedControlStyleProviderForIdiom(v3, [v4 userInterfaceIdiom]);

  if (![v5 useSelectionIndicatorStyling]) {
    goto LABEL_45;
  }
  if (!+[UIView areAnimationsEnabled]
    || (*((unsigned char *)&self->_segmentFlags + 1) & 0x20) != 0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [v5 animateSlidingSelectionByDefault];
  }
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
  if ((*(_WORD *)&segmentFlags & 0x4000) != 0) {
    int v8 = 8;
  }
  else {
    int v8 = 4;
  }
  int v9 = v8 & *(_DWORD *)&segmentFlags;
  int v10 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage backgroundImageForState:0 isMini:0 withFallback:1];

  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (v11)
  {
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v60 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v61 = v12;
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v62 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v63 = v13;
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v56 = *MEMORY[0x1E4F39B10];
    long long v57 = v14;
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v58 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v59 = v15;
    long long v52 = v60;
    long long v53 = v12;
    long long v54 = v62;
    long long v55 = v13;
    long long v48 = v56;
    long long v49 = v14;
    long long v50 = v58;
    long long v51 = v15;
    double v16 = self;
    uint64_t v17 = 1;
LABEL_42:
    [(UISegment *)v16 _updateSelectionToTransform:&v56 infoTransform:&v48 hideSelection:v17 shouldAnimate:v6];
    goto LABEL_45;
  }
  BOOL v18 = (*(_DWORD *)&self->_segmentFlags & 0x30000) != 0x10000 && (*(_DWORD *)&self->_segmentFlags & 0x2400) == 0;
  if (v18 && !_AXSReduceMotionEnabled())
  {
    [(UISegment *)self _removeSelectionIndicator];
  }
  else
  {
    if (!self->_selectionIndicatorView)
    {
      [(UISegment *)self _insertSelectionView];
      goto LABEL_38;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v19 = [(UISegment *)self _effectiveDisableShadow];
      BOOL v20 = [(UISegment *)self _effectiveUseDynamicShadow];
      double v21 = [(UIView *)self traitCollection];
      objc_super v22 = [(UISegment *)self _effectiveSelectedSegmentTintColor];
      if ([v5 useGeneratedImages])
      {
        [(UIView *)self->_selectionImageView bounds];
        CGRect v25 = -[objc_class _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](v3, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, v19 | v20, 0, v21, v22, *(_DWORD *)&self->_segmentFlags & 3, v23, v24);
      }
      else
      {
        CGRect v25 = 0;
      }
      [(UIImageView *)self->_selectionImageView setImage:v25];
      if (v20)
      {
        if (!v19
          && [(objc_class *)v3 _useShadowForSelectedTintColor:v22 traitCollection:v21])
        {
          [(UISegment *)self _updateDynamicShadow:1 animated:0];
        }
      }
      else
      {
        v33 = [(UIView *)self->_selectionImageView layer];
        [v33 setShadowOpacity:0.0];
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_38;
      }
      if ([v5 useGeneratedImages])
      {
        CGRect v26 = [(UISegment *)self _segmentedControlClass];
        [(UIView *)self->_selectionImageView bounds];
        double v28 = v27;
        double v30 = v29;
        v31 = [(UIView *)self traitCollection];
        v32 = [(UISegment *)self _effectiveSelectedSegmentTintColor];
        double v21 = -[objc_class _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](v26, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 1, 0, v31, v32, *(_DWORD *)&self->_segmentFlags & 3, v28, v30);
      }
      else
      {
        double v21 = 0;
      }
      [(UIImageView *)self->_selectionImageView setImage:v21];
      v40 = -[UISegment _effectiveContentView]((id *)&self->super.super.super.super.isa);
      objc_super v22 = [v40 viewWithTag:-2030];

      if (v22)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v22 bounds];
          double v42 = v41;
          double v44 = v43;
          v45 = [(UIView *)self traitCollection];
          v46 = [(UISegment *)self _effectiveSelectedSegmentTintColor];
          v47 = -[objc_class _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](v3, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 2, 0, v45, v46, *(_DWORD *)&self->_segmentFlags & 3, v42, v44);

          [v22 setImage:v47];
        }
      }
    }
  }
LABEL_38:
  if ((~*(_DWORD *)&self->_segmentFlags & 0x4008) != 0)
  {
    long long v36 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v60 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v61 = v36;
    long long v37 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v62 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v63 = v37;
    long long v38 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v56 = *MEMORY[0x1E4F39B10];
    long long v57 = v38;
    long long v39 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v58 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v59 = v39;
    long long v52 = v60;
    long long v53 = v36;
    long long v54 = v62;
    long long v55 = v37;
    long long v48 = v56;
    long long v49 = v38;
    long long v50 = v58;
    long long v51 = v39;
    double v16 = self;
    uint64_t v17 = 0;
    goto LABEL_42;
  }
  v34 = [(UISegment *)self _segmentedControlClass];
  v35 = [(UIView *)self traitCollection];
  if (v34) {
    [(objc_class *)v34 _highlightSelectionTransformForTraitCollection:v35];
  }
  else {
    memset(v65, 0, 128);
  }
  [(UISegment *)self _highlightSelectionInfoTransform];
  [(UISegment *)self _updateSelectionToTransform:v65 infoTransform:v64 hideSelection:0 shouldAnimate:v6];

LABEL_45:
}

- (void)_positionInfo
{
  info = self->_info;
  if (!info
    || [(UIView *)info translatesAutoresizingMaskIntoConstraints]
    || !self->_infoConstraints)
  {
    [(UIView *)self->_info sizeToFit];
    [(UISegment *)self contentRect];
    double v5 = v4;
    double v7 = v6;
    -[UIView sizeThatFits:](self->_info, "sizeThatFits:", v4, v6);
    -[UIView setSize:](self->_info, "setSize:");
    [(UIView *)self->_info frame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    double v13 = v12;
    double v15 = v14;
    if ((*((unsigned char *)&self->_segmentFlags + 1) & 0x82) != 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(UIView *)self->_info textSize];
        if (v16 >= v5) {
          double v13 = v5;
        }
        else {
          double v13 = v16;
        }
      }
    }
    if (v13 > v5) {
      double v13 = v5;
    }
    if (v15 > v7) {
      double v15 = v7;
    }
    uint64_t v17 = [(UISegment *)self _segmentedControlClass];
    BOOL v18 = [(UIView *)self traitCollection];
    BOOL v19 = UISegmentedControlStyleProviderForIdiom(v17, [v18 userInterfaceIdiom]);

    if (![v19 useSelectionIndicatorStyling]
      || ![v19 animateSlidingSelectionByDefault]
      || (v39.origin.x = v9, v39.origin.y = v11, v39.size.double width = v13, v39.size.height = v15, CGRectIsEmpty(v39))
      || (~*(_DWORD *)&self->_segmentFlags & 0x4008) != 0)
    {
      int v22 = 0;
    }
    else
    {
      BOOL v20 = [(UISegment *)self _segmentedControlClass];
      double v21 = [(UIView *)self traitCollection];
      if (v20)
      {
        [(objc_class *)v20 _highlightSelectionTransformForTraitCollection:v21];
      }
      else
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
      }
      CA_CGRectApplyTransform();
      double v15 = v30;

      int v22 = 1;
    }
    double v23 = -[_UISegmentedControlAppearanceStorage contentPositionOffsetForSegment:inMiniBar:](self->_appearanceStorage, "contentPositionOffsetForSegment:inMiniBar:", (((unint64_t)self->_segmentFlags >> 6) & 7) + 1, 0, v31, v32, v33, v34, v35, v36, v37, v38);
    double v24 = v23;
    if (v23) {
      [v23 UIOffsetValue];
    }
    if (v22) {
      [(objc_class *)[(UISegment *)self _segmentedControlClass] _selectionOffsetAdjustmentForSegment:self];
    }
    UIRoundToViewScale(self);
    double v26 = v25;
    UIRoundToViewScale(self);
    double v28 = v27;
    UICeilToViewScale(self);
    -[UIView setFrame:](self->_info, "setFrame:", v26, v28, v29, v15);
  }
}

- (CGRect)contentRect
{
  [(UIView *)self bounds];
  -[UISegment _contentRectForBounds:](self, "_contentRectForBounds:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGSize)_maximumTextSize
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((*(_DWORD *)&self->_segmentFlags & 0x2000) != 0) {
    double v3 = 288.0;
  }
  else {
    double v3 = 3.40282347e38;
  }
  double v5 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = [(UISegment *)self _segmentedControlClass];
    double v7 = [(UIView *)self traitCollection];
    double v8 = UISegmentedControlStyleProviderForIdiom(v6, [v7 userInterfaceIdiom]);

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v9 = [&unk_1ED3EF920 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(&unk_1ED3EF920);
          }
          uint64_t v13 = [*(id *)(*((void *)&v23 + 1) + 8 * i) integerValue];
          unsigned int v14 = [v8 useSelectionIndicatorStyling];
          if (v13 == 4) {
            uint64_t v15 = 1;
          }
          else {
            uint64_t v15 = v14;
          }
          double v16 = -[UISegment _attributedTextForState:selected:forceSelectedAppearance:](self, "_attributedTextForState:selected:forceSelectedAppearance:", v13, v15, [v8 useSelectionIndicatorStyling]);
          objc_msgSend(v16, "boundingRectWithSize:options:context:", 1, 0, v3, 3.40282347e38);
          if (v17 >= v5) {
            double v19 = v17;
          }
          else {
            double v19 = v5;
          }
          double v5 = ceil(v19);
          if (v18 >= v4) {
            double v20 = v18;
          }
          else {
            double v20 = v4;
          }
          double v4 = ceil(v20);
          if ([v8 useTVStyleFocusSelection]) {
            double v5 = v5 + 16.0;
          }
        }
        uint64_t v10 = [&unk_1ED3EF920 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }
  }
  double v21 = v5;
  double v22 = v4;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (id)_contentViewIfNeeded
{
  v1 = a1;
  if (a1)
  {
    v2 = -[UISegment _floatingContentView](a1);
    double v3 = v2;
    if (v2)
    {
      v1 = v2;
LABEL_20:

      goto LABEL_21;
    }
    double v4 = (void *)[v1 _segmentedControlClass];
    double v5 = [v1 traitCollection];
    double v6 = UISegmentedControlStyleProviderForIdiom(v4, [v5 userInterfaceIdiom]);

    uint64_t v7 = [v6 selectedSegmentContentDefaultVibrancyEffect];
    uint64_t v8 = [v6 unselectedSegmentContentDefaultVibrancyEffect];
    id v9 = v1[69];
    if (!(v7 | v8))
    {
      if (v9)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v1[69] removeFromSuperview];
          id v10 = v1[69];
          v1[69] = 0;
        }
      }
      v1 = 0;
      goto LABEL_19;
    }
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __24__UISegment__effectView__block_invoke;
        v17[3] = &unk_1E52DCB30;
        v17[4] = v1;
        id v18 = (id)v7;
        id v19 = (id)v8;
        +[UIView performWithoutAnimation:v17];

LABEL_18:
        v1 = (id *)v1[69];
LABEL_19:

        goto LABEL_20;
      }
      id v11 = v1[69];
    }
    else
    {
      id v11 = 0;
    }
    [v11 removeFromSuperview];
    double v12 = [UIVisualEffectView alloc];
    if ((v1[78] & 4) != 0) {
      uint64_t v13 = v7;
    }
    else {
      uint64_t v13 = v8;
    }
    uint64_t v14 = [(UIVisualEffectView *)v12 initWithEffect:v13];
    id v15 = v1[69];
    v1[69] = (id)v14;

    [v1 addSubview:v1[69]];
    goto LABEL_18;
  }
LABEL_21:
  return v1;
}

- (id)_floatingContentView
{
  v1 = a1;
  if (a1)
  {
    v2 = (void *)[a1 _segmentedControlClass];
    double v3 = [v1 traitCollection];
    double v4 = UISegmentedControlStyleProviderForIdiom(v2, [v3 userInterfaceIdiom]);

    if (![v4 useTVStyleFocusSelection])
    {
      v1 = 0;
LABEL_10:

      goto LABEL_11;
    }
    if (v1[69])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_9:
        v1 = (id *)v1[69];
        goto LABEL_10;
      }
      id v5 = v1[69];
    }
    else
    {
      id v5 = 0;
    }
    [v5 removeFromSuperview];
    double v6 = [_UIFloatingContentView alloc];
    uint64_t v7 = -[_UIFloatingContentView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v8 = v1[69];
    v1[69] = (id)v7;

    id v9 = v1[69];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __33__UISegment__floatingContentView__block_invoke;
    v12[3] = &unk_1E52D9F70;
    id v13 = v9;
    id v10 = v9;
    +[UIView _performSystemAppearanceModifications:v12];
    [v1 addSubview:v1[69]];

    goto LABEL_9;
  }
LABEL_11:
  return v1;
}

- (void)updateDividerViewForChangedSegment:(id)a3
{
  double v4 = (UISegment *)a3;
  id v5 = [(UISegment *)self _segmentedControlClass];
  double v6 = [(UIView *)self traitCollection];
  uint64_t v7 = UISegmentedControlStyleProviderForIdiom(v5, [v6 userInterfaceIdiom]);

  objc_msgSend(v7, "dividerWidthForControlSize:", -[UISegment controlSize](self, "controlSize"));
  if (v8 != 0.0 || self->_bezelView)
  {
    if (v4) {
      BOOL v9 = v4 == self;
    }
    else {
      BOOL v9 = 1;
    }
    char v10 = v9;
    if (!v9) {
      self->_unint64_t rightSegmentState = [(UISegment *)v4 _segmentState];
    }
    bezelView = self->_bezelView;
    if (bezelView)
    {
      double v12 = [(UISegment *)self _parentSegmentedControl];
      [(UISegmentBezelView *)bezelView updateForSegment:self inSegmentedControl:v12];
    }
    id v13 = [(UISegment *)self _effectiveBackgroundView];
    uint64_t v14 = [v13 viewWithTag:-1030];

    char v46 = 0;
    id v15 = [(UISegment *)self _dividerImageIsCustom:&v46];
    [v14 frame];
    double v17 = v16;
    id v18 = [v14 subviews];
    id v19 = [v18 firstObject];

    [v14 setImage:v15];
    if (v46 || ([v7 useSelectionIndicatorStyling] & 1) == 0)
    {
      if (!v19)
      {
LABEL_45:
        [(UIView *)self bounds];
        double v39 = v38;
        [v15 size];
        objc_msgSend(v14, "setFrame:", v39, 0.0, v40, v17);

        goto LABEL_46;
      }
      [(UIView *)v19 removeFromSuperview];
    }
    else
    {
      unint64_t rightSegmentState = self->_rightSegmentState;
      $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
      int v22 = (rightSegmentState >> 2) & 1 | ((*(unsigned char *)&segmentFlags & 4) >> 2);
      int v23 = rightSegmentState | ((*(unsigned char *)&segmentFlags & 8) >> 3);
      if ((*(_WORD *)&segmentFlags & 0x4000) == 0) {
        LOBYTE(v23) = v22;
      }
      if (v10) {
        int v24 = 0;
      }
      else {
        int v24 = *((unsigned char *)&v4->_segmentFlags + 2) & 1;
      }
      unsigned int v25 = v24 | ((*(unsigned int *)&segmentFlags & 0x10000) >> 16);
      if (v23) {
        int v26 = 1;
      }
      else {
        int v26 = v25;
      }
      double v27 = [(UISegment *)self _effectiveSelectedSegmentTintColor];
      double v42 = v27;
      if (v27)
      {
        [v27 alphaComponent];
        BOOL v29 = v28 != 0.0;
      }
      else
      {
        BOOL v29 = 1;
      }
      double v30 = [(UISegment *)self _segmentedControlClass];
      if ([v7 useGeneratedImages])
      {
        [(UIView *)self traitCollection];
        v31 = int v41 = v26;
        long long v32 = [(objc_class *)v30 _modernDividerImageBackground:0 traitCollection:v31 tintColor:0 size:*(_DWORD *)&self->_segmentFlags & 3];

        int v26 = v41;
      }
      else
      {
        long long v32 = 0;
      }
      if ((v26 & v29) != 0) {
        double v33 = 0.0;
      }
      else {
        double v33 = 1.0;
      }
      if (v19)
      {
        [(UIImageView *)v19 setImage:v32];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __48__UISegment_updateDividerViewForChangedSegment___block_invoke;
        aBlock[3] = &unk_1E52D9CD0;
        id v19 = v19;
        double v44 = v19;
        double v45 = v33;
        long long v34 = (void (**)(void))_Block_copy(aBlock);
        [(UIView *)v19 alpha];
        if (v33 != v35)
        {
          if ([v7 animateSlidingSelectionByDefault]
            && +[UIView areAnimationsEnabled]
            && ([(UIView *)v19 window],
                long long v36 = objc_claimAutoreleasedReturnValue(),
                v36,
                v36))
          {
            +[UIView animateWithDuration:327716 delay:v34 options:0 animations:0.41 completion:0.0];
          }
          else
          {
            v34[2](v34);
          }
        }
      }
      else
      {
        long long v37 = [UIImageView alloc];
        [v14 bounds];
        id v19 = -[UIImageView initWithFrame:](v37, "initWithFrame:");
        [(UIView *)v19 setAutoresizingMask:18];
        [(UIImageView *)v19 setImage:v32];
        [(UIView *)v19 setAlpha:v33];
        [v14 insertSubview:v19 atIndex:0];
      }
    }
    goto LABEL_45;
  }
LABEL_46:
}

- (id)_effectiveBackgroundView
{
  double v3 = [(UISegment *)self _segmentedControlClass];
  double v4 = [(UIView *)self traitCollection];
  id v5 = UISegmentedControlStyleProviderForIdiom(v3, [v4 userInterfaceIdiom]);

  if (![v5 useSelectionIndicatorStyling]
    || (*((unsigned char *)&self->_segmentFlags + 1) & 0x20) != 0)
  {
    backgroundView = self;
  }
  else
  {
    backgroundView = (UISegment *)self->_backgroundView;
    if (!backgroundView)
    {
      uint64_t v7 = [UIImageView alloc];
      [(UIView *)self frame];
      double v8 = -[UIImageView initWithFrame:](v7, "initWithFrame:");
      BOOL v9 = self->_backgroundView;
      self->_backgroundView = v8;

      backgroundView = (UISegment *)self->_backgroundView;
    }
  }
  char v10 = backgroundView;

  return v10;
}

- (id)_dividerImageIsCustom:(BOOL *)a3
{
  unint64_t v5 = [(UISegment *)self _segmentState];
  if ([(UISegment *)self _effectiveDisableShadow])
  {
    double v6 = 0;
    *a3 = 1;
    goto LABEL_18;
  }
  uint64_t v7 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage anyDividerImageForMini:0];
  double v8 = (void *)v7;
  if (a3) {
    *a3 = v7 != 0;
  }
  if (v7)
  {
    uint64_t v9 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage dividerImageForLeftSegmentState:v5 rightSegmentState:self->_rightSegmentState isMini:0 withFallback:1];
    char v10 = (void *)v9;
    if (v5 && !v9)
    {
      char v10 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage dividerImageForLeftSegmentState:v5 rightSegmentState:v5 isMini:0 withFallback:1];
    }
    if (v10) {
      id v11 = v10;
    }
    else {
      id v11 = v8;
    }
    id v12 = v11;

    id v13 = v12;
    double v6 = v13;
  }
  else
  {
    uint64_t v14 = [(UISegment *)self _segmentedControlClass];
    id v15 = [(UIView *)self traitCollection];
    UISegmentedControlStyleProviderForIdiom(v14, [v15 userInterfaceIdiom]);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (![v13 useGeneratedImages])
    {
      double v6 = 0;
      goto LABEL_17;
    }
    char v10 = [(UIView *)self traitCollection];
    double v16 = [(UISegment *)self _effectiveBackgroundTintColor];
    double v6 = [(objc_class *)v14 _modernDividerImageBackground:1 traitCollection:v10 tintColor:v16 size:*(_DWORD *)&self->_segmentFlags & 3];
  }
LABEL_17:

LABEL_18:
  return v6;
}

- (void)_updateTextColors
{
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
  if ((*(_DWORD *)&segmentFlags & 0x40000) != 0) {
    return;
  }
  if ((*(unsigned char *)&segmentFlags & 0x20) == 0)
  {
    double v4 = self->_info;
    id v7 = [(UISegment *)self _attributedTextForState:[(UISegment *)self _segmentState] selected:(*(_DWORD *)&self->_segmentFlags >> 2) & 1 forceSelectedAppearance:0];
    -[UIView setAttributedText:](v4, "setAttributedText:");

LABEL_7:
    [(UISegment *)self updateMasking];
    goto LABEL_8;
  }
  unint64_t v5 = [(UISegment *)self _segmentedControlClass];
  double v6 = [(UIView *)self traitCollection];
  UISegmentedControlStyleProviderForIdiom(v5, [v6 userInterfaceIdiom]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (([v7 useSelectionIndicatorStyling] & 1) != 0
    || ([v7 useTVStyleFocusSelection] & 1) != 0)
  {
    goto LABEL_7;
  }
LABEL_8:
}

- (CGRect)_contentRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage dividerImageForLeftSegmentState:0 rightSegmentState:0 isMini:0 withFallback:1];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 alignmentRectInsets];
    $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
    double v13 = -0.0;
    if (((*(unsigned int *)&segmentFlags >> 6) & 6) == 0) {
      double v13 = v10;
    }
    double v14 = width + v13;
    if (((*(unsigned int *)&segmentFlags >> 6) & 7) - 1 > 1)
    {
      double width = v14;
    }
    else
    {
      double x = x - v11;
      double width = v11 + v14;
    }
  }
  uint64_t v15 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage backgroundImageForState:0 isMini:0];
  if (v15
    && (double v16 = (void *)v15,
        BOOL v17 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage legacySuppressOptionsBackground], v16, !v17))
  {
    [(UISegment *)self _paddingInsets];
    if ((*(_DWORD *)&self->_segmentFlags & 0x1C0) == 0x40)
    {
      double v24 = 0.0;
      double v22 = 0.0;
    }
    double x = x + v22;
    double v19 = v24 + v22;
    double width = width - v19;
    double y = y + v21;
    double v18 = v21 + v23;
    double height = height - v18;
    char v20 = 1;
  }
  else
  {
    double v18 = x + 1.0;
    double v19 = width + -2.0;
    char v20 = 0;
    if ((*(_DWORD *)&self->_segmentFlags & 0x1C0) == 0xC0)
    {
      double x = x + 1.0;
      double width = width + -2.0;
    }
  }
  unsigned int v25 = [(UISegment *)self _segmentedControlClass];
  int v26 = [(UIView *)self traitCollection];
  double v27 = UISegmentedControlStyleProviderForIdiom(v25, [v26 userInterfaceIdiom]);

  if ([v27 limitInternalLayoutAndInteractionToDefaultHeight])
  {
    uint64_t v28 = [(UISegment *)self controlSize];
    BOOL v29 = [(UIView *)self traitCollection];
    [v27 defaultHeightForControlSize:v28 traitCollection:v29];
    double height = v30;
  }
  uint64_t v31 = [(UISegment *)self controlSize];
  uint64_t v32 = (*(_DWORD *)&self->_segmentFlags >> 6) & 7;
  double v33 = [(UIView *)self traitCollection];
  objc_msgSend(v27, "contentInsetsForControlSize:position:bounds:traitCollection:", v31, v32, v33, x, y, width, height);
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;

  if (v37 == 0.0 && v35 == 0.0 && v41 == 0.0 && v39 == 0.0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !dyld_program_sdk_at_least()) {
      double y = y + -1.0;
    }
    if ((v20 & 1) == 0 && (*(_DWORD *)&self->_segmentFlags & 0x40020) == 0)
    {
      if (dyld_program_sdk_at_least())
      {
        [v27 defaultTextContentPaddingWidth];
        CGFloat v43 = v42;
        v55.origin.double x = x;
        v55.origin.double y = y;
        v55.size.double width = width;
        v55.size.double height = height;
        CGRect v56 = CGRectInset(v55, v43, 0.0);
        double x = v56.origin.x;
        double y = v56.origin.y;
        double width = v56.size.width;
        double height = v56.size.height;
        if (([(objc_class *)[(UISegment *)self _segmentedControlClass] isMemberOfClass:objc_opt_class()] & 1) == 0)
        {
          double v44 = [(UISegment *)self _segmentedControlClass];
          double v45 = [(UIView *)self traitCollection];
          [(objc_class *)v44 _sectionIndicatorInsetForTraitCollection:v45 size:[(UISegment *)self controlSize]];
          double v47 = v46;

          long long v48 = [(UIView *)self traitCollection];
          +[UISegmentedControl _sectionIndicatorInsetForTraitCollection:v48 size:[(UISegment *)self controlSize]];
          double v50 = v49;

          if (v47 > v50)
          {
            v57.origin.double x = x;
            v57.origin.double y = y;
            v57.size.double width = width;
            v57.size.double height = height;
            CGRect v58 = CGRectInset(v57, v47 - v50 + v47 - v50, 0.0);
            double x = v58.origin.x;
            double y = v58.origin.y;
            double width = v58.size.width;
            double height = v58.size.height;
          }
        }
      }
    }
  }
  else
  {
    double x = x + v37;
    double width = width - (v41 + v37);
    double y = y + v35;
    double height = height - (v35 + v39);
  }

  double v51 = x;
  double v52 = y;
  double v53 = width;
  double v54 = height;
  result.size.double height = v54;
  result.size.double width = v53;
  result.origin.double y = v52;
  result.origin.double x = v51;
  return result;
}

- (void)updateMasking
{
  double v3 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage backgroundImageForState:0 isMini:0 withFallback:1];

  double v4 = [(UISegment *)self _segmentedControlClass];
  unint64_t v5 = [(UIView *)self traitCollection];
  UISegmentedControlStyleProviderForIdiom(v4, [v5 userInterfaceIdiom]);
  id v32 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (![(UISegment *)self isSelected])
    {
LABEL_3:
      BOOL v6 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    if ([v32 useSelectionIndicatorStyling])
    {
      int v7 = 0;
      BOOL v6 = 0;
      goto LABEL_13;
    }
    if (![(UISegment *)self isSelected] && (*((unsigned char *)&self->_segmentFlags + 1) & 8) == 0) {
      goto LABEL_3;
    }
  }
  if (![(UISegment *)self isMomentary] || [(UISegment *)self isSelected])
  {
    int v7 = 1;
    BOOL v6 = 1;
    goto LABEL_13;
  }
  BOOL v6 = [(UISegment *)self isHighlighted];
LABEL_12:
  int v7 = 1;
LABEL_13:
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
  if ((*(_DWORD *)&segmentFlags & 0x40000) != 0) {
    goto LABEL_53;
  }
  if ((*(unsigned char *)&segmentFlags & 0x20) != 0)
  {
    double v13 = self->_info;
    id v12 = v13;
    if (v7)
    {
      [(UIView *)v13 _setMasksTemplateImages:v6];
    }
    else
    {
      unint64_t v14 = [(UISegment *)self _segmentState];
      uint64_t v15 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage textAttributesForState:0];
      $EF3B0C3FF7A708BD5C1B93D65F9CAC5C v16 = self->_segmentFlags;
      if ((*(unsigned char *)&v16 & 4) != 0)
      {
        unint64_t v19 = +[UIControl _primaryStateForState:v14];
        $EF3B0C3FF7A708BD5C1B93D65F9CAC5C v20 = self->_segmentFlags;
        int v21 = *(unsigned char *)&v20 & 4;
        if ((*(_WORD *)&v20 & 0x4000) != 0) {
          int v21 = *(unsigned char *)&v20 & 8;
        }
        BOOL v17 = v21 == 0;
        if ((*(unsigned char *)&v20 & 4) != 0) {
          unint64_t v14 = 0;
        }
        else {
          unint64_t v14 = v19;
        }
      }
      else
      {
        BOOL v17 = (~*(_DWORD *)&v16 & 0x4008) != 0;
      }
      if (v17) {
        uint64_t v22 = v14;
      }
      else {
        uint64_t v22 = 4;
      }
      double v23 = [(UISegment *)self _stateTextAttibutes:v15 segmentState:v22];
      uint64_t v24 = *(void *)off_1E52D2048;
      unsigned int v25 = [v23 valueForKey:*(void *)off_1E52D2048];
      if (v25) {
        goto LABEL_41;
      }
      unsigned int v25 = [v15 valueForKey:v24];
      if (v25) {
        goto LABEL_41;
      }
      if ([(UIView *)self isEnabled])
      {
        uint64_t v26 = 1;
      }
      else
      {
        double v27 = [(UISegment *)self _parentSegmentedControl];
        uint64_t v26 = [v27 isEnabled] ^ 1;
      }
      unsigned int v25 = [v32 fontColorForSegment:self enabled:v26 selected:(*(_DWORD *)&self->_segmentFlags >> 2) & 1 state:v22];
      if (v25)
      {
LABEL_41:
        [v12 setTintColor:v25];
      }
      else
      {
        uint64_t v31 = +[UIColor labelColor];
        [v12 setTintColor:v31];
      }
    }
    if ([v32 useTVStyleFocusSelection])
    {
      if ([(UIView *)self isFocused])
      {
        uint64_t v28 = 8;
      }
      else if ([(UISegment *)self _hasSelectedColor])
      {
        if ([(UISegment *)self isSelected]) {
          uint64_t v28 = 4;
        }
        else {
          uint64_t v28 = 0;
        }
      }
      else
      {
        uint64_t v28 = 0;
      }
      BOOL v29 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage textAttributesForState:v28];
      double v30 = [v29 objectForKeyedSubscript:*(void *)off_1E52D2048];
      [v12 setTintColor:v30];
    }
    goto LABEL_52;
  }
  if (v6) {
    LODWORD(v6) = ![(UISegment *)self _hasSelectedColor];
  }
  uint64_t v9 = [(UIView *)self->_info layer];
  double v10 = [v9 compositingFilter];
  BOOL v11 = v10 == 0;

  if (v6 == v11)
  {
    if (v6)
    {
      id v12 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A370]];
    }
    else
    {
      id v12 = 0;
    }
    double v18 = [(UIView *)self->_info layer];
    [v18 setCompositingFilter:v12];

    if (v6) {
LABEL_52:
    }
  }
LABEL_53:
}

- (id)_attributedTextForState:(unint64_t)a3 selected:(BOOL)a4 forceSelectedAppearance:(BOOL)a5
{
  if ((*(_DWORD *)&self->_segmentFlags & 0x40020) != 0)
  {
    unint64_t v5 = 0;
    goto LABEL_36;
  }
  BOOL v7 = a4;
  double v10 = self->_info;
  uint64_t v11 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage textAttributesForState:0];
  double v44 = v10;
  if (v7)
  {
    unint64_t v12 = +[UIControl _primaryStateForState:a3];
    a3 = 0;
  }
  else
  {
    unint64_t v12 = a3;
  }
  double v13 = [(UISegment *)self _segmentedControlClass];
  unint64_t v14 = [(UIView *)self traitCollection];
  uint64_t v15 = UISegmentedControlStyleProviderForIdiom(v13, [v14 userInterfaceIdiom]);

  CGFloat v43 = v15;
  if ([v15 useSelectionIndicatorStyling])
  {
    $EF3B0C3FF7A708BD5C1B93D65F9CAC5C v16 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage backgroundImageForState:4 isMini:0 withFallback:1];

    if (!v16)
    {
      unint64_t v12 = 4;
      if (!a5)
      {
        $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
        if ((*(_WORD *)&segmentFlags & 0x4000) != 0) {
          int v18 = (*(unsigned int *)&segmentFlags >> 3) & 1;
        }
        else {
          int v18 = v7;
        }
        if (v18) {
          unint64_t v12 = 4;
        }
        else {
          unint64_t v12 = a3;
        }
      }
    }
  }
  unint64_t v19 = (void *)v11;
  uint64_t v20 = [(UISegment *)self _stateTextAttibutes:v11 segmentState:v12];
  int v21 = [(UISegment *)self _segmentedControlClass];
  double v42 = (void *)v20;
  if ([(UIView *)self isEnabled])
  {
    uint64_t v22 = 1;
  }
  else
  {
    double v23 = [(UISegment *)self _parentSegmentedControl];
    uint64_t v22 = [v23 isEnabled] ^ 1;
  }
  uint64_t v24 = [(UIView *)self traitCollection];
  uint64_t v25 = [(objc_class *)v21 _fontForTraitCollection:v24 size:[(UISegment *)self controlSize] selected:v12 == 4];

  uint64_t v26 = [v43 fontColorForSegment:self enabled:v22 selected:v7 state:v12];
  uint64_t v27 = [(UIView *)v44 text];
  uint64_t v28 = (void *)v27;
  BOOL v29 = &stru_1ED0E84C0;
  if (v27) {
    BOOL v29 = (__CFString *)v27;
  }
  double v30 = v29;

  unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v30];
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v32 = v31;
  if ((*((unsigned char *)&self->_segmentFlags + 1) & 0x20) != 0)
  {
    double v36 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
    if ([v43 useSelectionIndicatorStyling] && v7)
    {
      uint64_t v37 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];

      double v36 = (void *)v37;
    }
    double v33 = (void *)v25;
    uint64_t v38 = *(void *)off_1E52D2040;
    [v32 setObject:v36 forKey:*(void *)off_1E52D2040];
    double v39 = (void *)[v19 mutableCopy];
    [v39 setObject:v36 forKey:v38];

    double v40 = (void *)[v42 mutableCopy];
    [v40 setObject:v36 forKey:v38];

    double v35 = v40;
    unint64_t v19 = v39;
    double v34 = v43;
    if (!v26) {
      goto LABEL_30;
    }
  }
  else
  {
    double v33 = (void *)v25;
    if (v25) {
      [v31 setObject:v25 forKey:*(void *)off_1E52D2040];
    }
    double v35 = v42;
    double v34 = v43;
    if (!v26) {
      goto LABEL_30;
    }
  }
  [v32 setObject:v26 forKey:*(void *)off_1E52D2048];
LABEL_30:
  objc_msgSend(v5, "setAttributes:range:", v32, 0, -[__CFString length](v30, "length"));
  if (v19) {
    objc_msgSend(v5, "addAttributes:range:", v19, 0, -[__CFString length](v30, "length"));
  }
  if (v35 && ([v35 isEqualToDictionary:v19] & 1) == 0) {
    objc_msgSend(v5, "addAttributes:range:", v35, 0, -[__CFString length](v30, "length"));
  }

LABEL_36:
  return v5;
}

- (int)controlSize
{
  return *(_DWORD *)&self->_segmentFlags & 3;
}

- (unint64_t)_segmentState
{
  unint64_t v3 = *(_DWORD *)&self->_segmentFlags & 4 | (*(_DWORD *)&self->_segmentFlags >> 3) & 1u;
  if ([(UIView *)self isFocused]) {
    v3 |= 8uLL;
  }
  id v4 = [(UISegment *)self _parentSegmentedControl];
  if (v4 && ![v4 isEnabled] || !-[UIView isEnabled](self, "isEnabled")) {
    v3 |= 2uLL;
  }
  return v3;
}

- (Class)_segmentedControlClass
{
  id v2 = [(UISegment *)self _parentSegmentedControl];
  unint64_t v3 = objc_opt_class();
  return (Class)v3;
}

- (id)_parentSegmentedControl
{
  while (1)
  {
    self = [(UIView *)self superview];

    if (!self) {
      break;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v3 = self;
      break;
    }
  }
  return self;
}

- (id)_stateTextAttibutes:(id)a3 segmentState:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (!a4)
  {
    id v10 = v6;
    goto LABEL_6;
  }
  uint64_t v8 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage textAttributesForState:a4];
  uint64_t v9 = (void *)v8;
  if (a4 == 5 && !v8)
  {
    id v10 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage textAttributesForState:4];
LABEL_6:
    uint64_t v9 = v10;
  }

  return v9;
}

- (id)_effectiveBackgroundTintColor
{
  id v2 = [(UISegment *)self _parentSegmentedControl];
  if (v2)
  {
    unint64_t v3 = v2;
    if ([v2 transparentBackground]) {
      +[UIColor clearColor];
    }
    else {
    id v2 = [v3 _backgroundTintColor];
    }
  }
  return v2;
}

- (BOOL)_effectiveDisableShadow
{
  id v2 = [(UISegment *)self _parentSegmentedControl];
  char v3 = [v2 transparentBackground];

  return v3;
}

id __45__UISegment__updateBackgroundAndContentViews__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) useGeneratedImages])
  {
    int v2 = [*(id *)(a1 + 32) useSelectionIndicatorStyling];
    char v3 = *(_DWORD **)(a1 + 40);
    id v4 = *(void **)(a1 + 48);
    if (v2)
    {
      [v3 bounds];
      double v6 = v5;
      double v8 = v7;
      uint64_t v9 = [*(id *)(a1 + 40) traitCollection];
      id v10 = [*(id *)(a1 + 40) _effectiveBackgroundTintColor];
      uint64_t v11 = objc_msgSend(v4, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 0, 0, 0, v9, v10, *(_DWORD *)(*(void *)(a1 + 40) + 624) & 3, v6, v8);
    }
    else
    {
      uint64_t v12 = (v3[156] >> 2) & 1;
      [v3 bounds];
      double v14 = v13;
      double v16 = v15;
      BOOL v17 = *(_DWORD **)(a1 + 40);
      uint64_t v18 = (v17[156] >> 3) & 1;
      uint64_t v9 = [v17 traitCollection];
      uint64_t v11 = objc_msgSend(v4, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", v12, 0, v18, v9, 0, *(_DWORD *)(*(void *)(a1 + 40) + 624) & 3, v14, v16);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (void)_removeSelectionIndicator
{
  selectionIndicatorView = self->_selectionIndicatorView;
  if (selectionIndicatorView)
  {
    [(UIView *)selectionIndicatorView removeFromSuperview];
    id v4 = self->_selectionIndicatorView;
    self->_selectionIndicatorView = 0;

    selectionImageView = self->_selectionImageView;
    self->_selectionImageView = 0;
  }
}

uint64_t __48__UISegment_updateDividerViewForChangedSegment___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

id __92__UISegment__backgroundImageWithStorage_mini_state_position_drawMode_isCustom_defaultBlock___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (![*(id *)(a1 + 32) _isResizable]
    || [*(id *)(a1 + 40) legacySuppressOptionsBackground])
  {
    [*(id *)(a1 + 32) size];
    double v4 = floor((v3 + -1.0) * 0.5);
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_stretchableImageWithCapInsets:", 0.0, v4, 0.0, v4);

    id v2 = (id)v5;
  }
  uint64_t v6 = *(int *)(a1 + 48);
  if v6 <= 4 && ((0x17u >> v6))
  {
    uint64_t v7 = [v2 _resizableImageWithCapMask:dword_186B94AF8[v6]];

    id v2 = (id)v7;
  }
  double v8 = objc_msgSend(v2, "imageWithRenderingMode:", objc_msgSend(*(id *)(a1 + 32), "renderingMode"));

  return v8;
}

+ (id)_backgroundImageWithStorage:(id)a3 mini:(BOOL)a4 state:(unint64_t)a5 position:(unsigned int)a6 drawMode:(unsigned int *)a7 isCustom:(BOOL *)a8 defaultBlock:(id)a9
{
  uint64_t v11 = *(void *)&a6;
  BOOL v13 = a4;
  id v14 = a3;
  double v15 = (void (**)(void))a9;
  uint64_t v16 = [v14 backgroundImageForState:0 isMini:v13 withFallback:1];
  BOOL v17 = (void *)v16;
  if (a8) {
    *a8 = v16 != 0;
  }
  if (v16)
  {
    CGFloat v43 = a7;
    if (a5)
    {
      uint64_t v18 = [v14 backgroundImageForState:a5 isMini:v13 withFallback:1];
      unint64_t v19 = v18;
      if (v18)
      {
        id v20 = v18;

        BOOL v21 = 0;
        unsigned int v22 = 0;
        BOOL v17 = v20;
      }
      else
      {
        unsigned int v22 = a5 == 2;
        BOOL v21 = a5 != 2;
      }
    }
    else
    {
      BOOL v21 = 0;
      unsigned int v22 = 0;
    }
    double v42 = v15;
    id v25 = v17;
    uint64_t v24 = v25;
LABEL_13:
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__UISegment__backgroundImageWithStorage_mini_state_position_drawMode_isCustom_defaultBlock___block_invoke;
    aBlock[3] = &unk_1E52EAF00;
    id v45 = v25;
    id v26 = v14;
    id v46 = v26;
    int v47 = v11;
    id v27 = v25;
    uint64_t v28 = _Block_copy(aBlock);
    BOOL v29 = [NSNumber numberWithInt:v11];
    int v30 = [v26 legacySuppressOptionsBackground];
    uint64_t v38 = MEMORY[0x1E4F1CC28];
    if (v30) {
      uint64_t v38 = MEMORY[0x1E4F1CC38];
    }
    double v39 = __UIImageCacheKeyWithSentinel(v27, v31, v32, v33, v34, v35, v36, v37, v29, v38);
    double v40 = +[UIImage _cachedImageForKey:v39 fromBlock:v28];

    if (v21) {
      unsigned int v22 = 2;
    }

    double v15 = v42;
    a7 = v43;
    if (v43) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v23 = v15[2](v15);
  uint64_t v24 = 0;
  if (v23)
  {
    id v25 = (id)v23;
    double v42 = v15;
    CGFloat v43 = a7;
    unsigned int v22 = 0;
    BOOL v21 = 0;
    goto LABEL_13;
  }
  unsigned int v22 = 0;
  double v40 = 0;
  if (a7) {
LABEL_18:
  }
    *a7 = v22;
LABEL_19:

  return v40;
}

- (void)updateForAppearance:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_appearanceStorage, a3);
  self->_unint64_t rightSegmentState = 0;
  [(UISegment *)self _barHeight];
  -[UISegment setFrame:](self, "setFrame:", 0.0, 0.0, 0.0, v5);
  uint64_t v6 = [(UISegment *)self objectValue];
  [(UISegment *)self setObjectValue:v6];

  if ((*(_DWORD *)&self->_segmentFlags & 0x40020) == 0) {
    [(UIView *)self->_info setEnabled:[(UIView *)self isEnabled]];
  }
  [(UISegment *)self setNeedsBackgroundAndContentViewUpdate];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UISegment;
  [(UIImageView *)&v3 tintColorDidChange];
  [(UISegment *)self setNeedsBackgroundAndContentViewUpdate];
  [(UISegment *)self _updateTextColors];
}

- (void)setSegmentPosition:(unsigned int)a3
{
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
  if (((*(unsigned int *)&segmentFlags >> 6) & 7) != a3)
  {
    self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&segmentFlags & 0xFFFFFE3F | ((a3 & 7) << 6));
    [(UISegment *)self _invalidateInfoConstraints];
    [(UISegment *)self setNeedsBackgroundAndContentViewUpdate];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UISegment;
  -[UIImageView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11) {
    [(UISegment *)self setNeedsBackgroundAndContentViewUpdate];
  }
}

- (void)setNeedsBackgroundAndContentViewUpdate
{
  *(_DWORD *)&self->_segmentFlags |= 0x1000u;
  [(UIView *)self setNeedsLayout];
}

- (void)setShowDivider:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_segmentFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v4 = 16;
    }
    else {
      int v4 = 0;
    }
    self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFFFEF | v4);
    id v8 = [(UISegment *)self _effectiveBackgroundView];
    double v5 = [v8 viewWithTag:-1030];
    uint64_t v6 = v5;
    double v7 = 1.0;
    if ((*(_DWORD *)&self->_segmentFlags & 0x10) == 0) {
      double v7 = 0.0;
    }
    [v5 setAlpha:v7];
  }
}

- (UIView)badgeView
{
  return (UIView *)self->_badgeView;
}

- (id)_effectiveSelectedSegmentTintColor
{
  id v2 = [(UISegment *)self _parentSegmentedControl];
  objc_super v3 = [v2 selectedSegmentTintColor];

  return v3;
}

- (BOOL)isHovered
{
  return *((unsigned char *)&self->_segmentFlags + 2) & 1;
}

- (id)objectValue
{
  return self->_objectValue;
}

- (void)_invalidateInfoConstraints
{
  if ((*(void *)&self->super.super._viewFlags & 0x400000000000000) != 0)
  {
    info = self->_info;
    if (info)
    {
      if (![(UIView *)info translatesAutoresizingMaskIntoConstraints])
      {
        if (self->_infoConstraints) {
          -[UIView removeConstraints:](self, "removeConstraints:");
        }
        [(UISegment *)self _setInfoConstraints:0];
        [(UIView *)self _setNeedsUpdateConstraints];
      }
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIView *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UISegment;
    [(UIView *)&v5 setEnabled:v3];
    [(UISegment *)self _setEnabledAppearance:v3];
  }
}

- (void)_setEnabledAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(UISegment *)self _segmentedControlClass];
  uint64_t v6 = [(UIView *)self traitCollection];
  UISegmentedControlStyleProviderForIdiom(v5, [v6 userInterfaceIdiom]);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  if ((*(_DWORD *)&self->_segmentFlags & 0x40020) != 0)
  {
    if ([v14 useSelectionIndicatorStyling])
    {
      if (!v3) {
        goto LABEL_12;
      }
    }
    else
    {
      double v7 = 0.5;
      if (v3) {
        double v7 = 1.0;
      }
      [(UIView *)self->_info setAlpha:v7];
      if (!v3) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    if (!v3)
    {
LABEL_12:
      info = self->_info;
      double v10 = [(UISegment *)self _parentSegmentedControl];
      uint64_t v12 = [v10 _disabledColor];
      [(UIView *)info setTintColor:v12];

      goto LABEL_13;
    }
    [(UIView *)self->_info setEnabled:1];
  }
  int v8 = [v14 useSelectionIndicatorStyling];
  double v9 = self->_info;
  if (v8)
  {
    double v10 = +[UIColor labelColor];
    [(UIView *)v9 setTintColor:v10];
LABEL_13:

    goto LABEL_15;
  }
  [(UIView *)self->_info setTintColor:0];
LABEL_15:
  [(UISegment *)self _updateTextColors];
  objc_super v13 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage backgroundImageForState:0 isMini:0];

  if (v13) {
    [(UISegment *)self setNeedsBackgroundAndContentViewUpdate];
  }
}

- (void)setMomentary:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_segmentFlags & 0x400) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v3 = 1024;
    }
    else {
      int v3 = 0;
    }
    self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFFBFF | v3);
    [(UISegment *)self _updateTextColors];
  }
}

- (UISegment)initWithInfo:(id)a3 size:(int)a4 barStyle:(int64_t)a5 tintColor:(id)a6 appearanceStorage:(id)a7 position:(unsigned int)a8 autosizeText:(BOOL)a9 adjustsForContentSizeCategory:(BOOL)a10 customInfoView:(id)a11 traitCollection:(id)a12
{
  char v12 = a8;
  uint64_t v15 = *(void *)&a4;
  id v17 = a3;
  id v18 = a7;
  id v19 = a11;
  id v20 = a12;
  double v21 = segmentBarHeight([(UISegment *)self _segmentedControlClass], v18, (uint64_t)v20, v15);

  v31.receiver = self;
  v31.super_class = (Class)UISegment;
  unsigned int v22 = -[UIImageView initWithFrame:](&v31, sel_initWithFrame_, 0.0, 0.0, 0.0, v21);
  uint64_t v23 = v22;
  if (v22)
  {
    v22->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&v22->_segmentFlags & 0xFFFFFFFC | v15 & 3);
    v22->_barStyle = a5;
    objc_storeStrong((id *)&v22->_appearanceStorage, a7);
    if (a9) {
      int v24 = 512;
    }
    else {
      int v24 = 0;
    }
    if (a10) {
      int v25 = 0x8000;
    }
    else {
      int v25 = 0;
    }
    unsigned int v26 = v24 & 0xFFFFFE3F | ((v12 & 7) << 6) | v25 | *(_DWORD *)&v23->_segmentFlags & 0xFFFF7C3F;
    v23->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)v26;
    if (v19)
    {
      v23->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(v26 | 0x40000);
      objc_storeStrong((id *)&v23->_info, a11);
    }
    [(UIView *)v23 setOpaque:0];
    [(UISegment *)v23 setEnabled:1];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(UISegment *)v23 setAction:v17];
      id v27 = [(UIMenuElement *)v23->_action image];
      if (v27)
      {
        [(UISegment *)v23 setObjectValue:v27];
      }
      else
      {
        uint64_t v28 = [(UIMenuElement *)v23->_action title];
        [(UISegment *)v23 setObjectValue:v28];
      }
    }
    else
    {
      [(UISegment *)v23 setAction:0];
      [(UISegment *)v23 setObjectValue:v17];
    }
    BOOL v29 = [(UIView *)v23 layer];
    [v29 setEdgeAntialiasingMask:12];
  }
  return v23;
}

- (void)setAction:(id)a3
{
  id v4 = a3;
  objc_super v5 = self->_action;
  uint64_t v6 = (UIAction *)v4;
  double v11 = v6;
  if (v5 == v6)
  {

    action = v11;
LABEL_9:

    int v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    int v8 = v11;
    goto LABEL_8;
  }
  BOOL v7 = [(UIAction *)v5 isEqual:v6];

  int v8 = v11;
  if (!v7)
  {
LABEL_8:
    double v10 = [(UIAction *)v8 _immutableCopy];
    action = self->_action;
    self->_action = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_finishInitialSegmentSetup
{
  int v3 = [(UISegment *)self _segmentedControlClass];
  id v4 = [(UIView *)self traitCollection];
  objc_super v5 = UISegmentedControlStyleProviderForIdiom(v3, [v4 userInterfaceIdiom]);
  uint64_t v6 = [v5 createSegmentBezelView];
  bezelView = self->_bezelView;
  self->_bezelView = v6;

  int v8 = self->_bezelView;
  if (v8)
  {
    [(UIView *)self insertSubview:v8 atIndex:0];
    [(UISegmentBezelView *)self->_bezelView contentOffsetForSegment:self];
    CGFloat v10 = v9 + self->_contentOffset.height;
    self->_contentOffset.double width = v11 + self->_contentOffset.width;
    self->_contentOffset.double height = v10;
  }
  *(_DWORD *)&self->_segmentFlags |= 0x1000u;
  [(UISegment *)self insertDividerView];
  [(UISegment *)self _updateTextColors];
  [(UIImageView *)self _setAnimatesContents:1];
}

- (void)insertDividerView
{
  char v28 = 0;
  int v3 = [(UISegment *)self _dividerImageIsCustom:&v28];
  if (v3)
  {
    id v4 = [[UIImageView alloc] initWithImage:v3];
    [(UIView *)v4 setTag:-1030];
    double v5 = 1.0;
    if ((*(_DWORD *)&self->_segmentFlags & 0x10) == 0) {
      double v5 = 0.0;
    }
    [(UIView *)v4 setAlpha:v5];
    [(UIView *)v4 setOpaque:0];
    [(UIView *)v4 setEnabled:0];
    [(UIView *)v4 setAutoresizingMask:1];
    uint64_t v6 = [(UIView *)v4 layer];
    [v6 setEdgeAntialiasingMask:12];

    [(UIView *)v4 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(UIView *)self bounds];
    -[UIImageView setFrame:](v4, "setFrame:", v13 + v14, v8, v10, v12);
    uint64_t v15 = [(UISegment *)self _segmentedControlClass];
    uint64_t v16 = [(UIView *)self traitCollection];
    id v17 = UISegmentedControlStyleProviderForIdiom(v15, [v16 userInterfaceIdiom]);

    if (!v28 && [v17 useSelectionIndicatorStyling])
    {
      unint64_t rightSegmentState = self->_rightSegmentState;
      int v19 = (rightSegmentState >> 2) & 1 | ((*(_DWORD *)&self->_segmentFlags & 4u) >> 2);
      int v20 = rightSegmentState | ((*(_DWORD *)&self->_segmentFlags & 8u) >> 3);
      if ((*(_DWORD *)&self->_segmentFlags & 0x4000) != 0) {
        char v21 = v20;
      }
      else {
        char v21 = v19;
      }
      if ([v17 useGeneratedImages])
      {
        unsigned int v22 = [(UIView *)self traitCollection];
        uint64_t v23 = [(objc_class *)v15 _modernDividerImageBackground:0 traitCollection:v22 tintColor:0 size:*(_DWORD *)&self->_segmentFlags & 3];
      }
      else
      {
        uint64_t v23 = 0;
      }
      int v24 = [UIImageView alloc];
      [(UIView *)v4 bounds];
      int v25 = -[UIImageView initWithFrame:](v24, "initWithFrame:");
      [(UIView *)v25 setAutoresizingMask:18];
      [(UIImageView *)v25 setImage:v23];
      double v26 = 1.0;
      if (v21) {
        double v26 = 0.0;
      }
      [(UIView *)v25 setAlpha:v26];
      [(UIView *)v4 insertSubview:v25 atIndex:0];
    }
    id v27 = [(UISegment *)self _effectiveBackgroundView];
    [v27 addSubview:v4];
  }
}

- (void)layoutSubviews
{
  if ((*((unsigned char *)&self->_segmentFlags + 1) & 0x10) == 0) {
    [(UISegment *)self _positionInfo];
  }
  if (self->_bezelView)
  {
    int v3 = [(UISegment *)self _segmentedControlClass];
    id v4 = [(UIView *)self traitCollection];
    double v5 = UISegmentedControlStyleProviderForIdiom(v3, [v4 userInterfaceIdiom]);

    if ([v5 limitInternalLayoutAndInteractionToDefaultHeight])
    {
      uint64_t v6 = [(UISegment *)self controlSize];
      double v7 = [(UIView *)self traitCollection];
      [v5 defaultHeightForControlSize:v6 traitCollection:v7];
    }
    else
    {
      [(UIView *)self bounds];
    }
    [(UIView *)self bounds];
    -[UISegmentBezelView setFrame:](self->_bezelView, "setFrame:", 0.0, 0.0);
  }
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = -[UISegment _contentViewIfNeeded]((id *)&self->super.super.super.super.isa);
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  [(UISegment *)self _updateBackgroundAndContentViewsIfNeeded];
  v17.receiver = self;
  v17.super_class = (Class)UISegment;
  [(UIImageView *)&v17 layoutSubviews];
}

- (void)_updateBackgroundAndContentViewsIfNeeded
{
  if ((*((unsigned char *)&self->_segmentFlags + 1) & 0x10) != 0) {
    [(UISegment *)self _updateBackgroundAndContentViews];
  }
}

- (void)_updateBackgroundAndContentViews
{
  unint64_t v3 = [(UISegment *)self _segmentState];
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
  unsigned int v26 = 0;
  if ((*(_WORD *)&segmentFlags & 0x2000) != 0) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = (*(unsigned int *)&segmentFlags >> 6) & 7;
  }
  char v25 = 0;
  uint64_t v6 = [(UISegment *)self _segmentedControlClass];
  double v7 = [(UIView *)self traitCollection];
  double v8 = UISegmentedControlStyleProviderForIdiom(v6, [v7 userInterfaceIdiom]);

  appearanceStorage = self->_appearanceStorage;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45__UISegment__updateBackgroundAndContentViews__block_invoke;
  v21[3] = &unk_1E52EAF28;
  id v10 = v8;
  uint64_t v23 = self;
  int v24 = v6;
  id v22 = v10;
  double v11 = +[UISegment _backgroundImageWithStorage:appearanceStorage mini:0 state:v3 position:v5 drawMode:&v26 isCustom:&v25 defaultBlock:v21];
  bezelView = self->_bezelView;
  if (bezelView)
  {
    double v13 = [(UISegment *)self _parentSegmentedControl];
    [(UISegmentBezelView *)bezelView updateForSegment:self inSegmentedControl:v13];
  }
  double v14 = [(UISegment *)self _effectiveBackgroundView];
  if ((*((unsigned char *)&self->_segmentFlags + 1) & 0x20) != 0
    && ([v10 useSelectionIndicatorStyling] & 1) != 0)
  {
    double v15 = 0;
  }
  else
  {
    uint64_t v16 = [(UISegment *)self _parentSegmentedControl];
    int v17 = [v16 hasBackdropView];

    if (v17) {
      double v15 = 0;
    }
    else {
      double v15 = v11;
    }
  }
  [v14 setImage:v15];
  if (([v10 useSelectionIndicatorStyling] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      info = self->_info;
      if (v11) {
        uint64_t v19 = [v11 _isInvisibleAndGetIsTranslucent:0];
      }
      else {
        uint64_t v19 = 0;
      }
      [(UIView *)info _setWantsUnderlineForAccessibilityButtonShapesEnabled:v19];
    }
  }
  [(UIImageView *)self setDrawMode:v26];
  [(UISegment *)self updateDividerViewForChangedSegment:self];
  [(UISegment *)self _updateTextColors];
  int v20 = self->_bezelView;
  if (v20) {
    [(UISegmentBezelView *)v20 updateInfoView:self->_info forSegment:self];
  }
  [(UISegment *)self _updateHighlight];
  [(UISegment *)self _updateSelectionIndicator];
  [(UISegment *)self _positionInfo];
  *(_DWORD *)&self->_segmentFlags &= ~0x1000u;
}

- (void)_updateSelectionToTransform:(CATransform3D *)a3 infoTransform:(CATransform3D *)a4 hideSelection:(BOOL)a5 shouldAnimate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  double v11 = [(UIView *)self->_selectionImageView layer];
  double v12 = [v11 presentationLayer];
  double v13 = [(UIView *)self->_selectionImageView layer];
  double v14 = v13;
  if (v12)
  {
    double v15 = [v13 presentationLayer];
    uint64_t v16 = v15;
    if (v15)
    {
      [v15 transform];
    }
    else
    {
      long long v155 = 0u;
      long long v156 = 0u;
      long long v153 = 0u;
      long long v154 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
    }
  }
  else if (v13)
  {
    [v13 transform];
  }
  else
  {
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
  }

  long long v148 = 0u;
  long long v147 = 0u;
  long long v146 = 0u;
  long long v145 = 0u;
  long long v144 = 0u;
  long long v143 = 0u;
  long long v142 = 0u;
  long long v141 = 0u;
  int v17 = [(UIView *)self->_info layer];
  id v18 = [v17 presentationLayer];
  uint64_t v19 = [(UIView *)self->_info layer];
  int v20 = v19;
  if (v18)
  {
    char v21 = [v19 presentationLayer];
    id v22 = v21;
    if (v21)
    {
      [v21 transform];
    }
    else
    {
      long long v148 = 0u;
      long long v147 = 0u;
      long long v146 = 0u;
      long long v145 = 0u;
      long long v144 = 0u;
      long long v143 = 0u;
      long long v142 = 0u;
      long long v141 = 0u;
    }
  }
  else if (v19)
  {
    [v19 transform];
  }
  else
  {
    long long v148 = 0u;
    long long v147 = 0u;
    long long v146 = 0u;
    long long v145 = 0u;
    long long v144 = 0u;
    long long v143 = 0u;
    long long v142 = 0u;
    long long v141 = 0u;
  }

  uint64_t v23 = [(UIView *)self->_selectionImageView layer];
  int v24 = [v23 presentationLayer];
  char v25 = [(UIView *)self->_selectionImageView layer];
  unsigned int v26 = v25;
  if (v24)
  {
    id v27 = [v25 presentationLayer];
    [v27 opacity];
    int v29 = v28;
  }
  else
  {
    [v25 opacity];
    int v29 = v30;
  }

  long long v140 = 0u;
  long long v139 = 0u;
  if (v7) {
    double v31 = 0.0;
  }
  else {
    double v31 = 1.0;
  }
  long long v138 = 0uLL;
  long long v137 = 0uLL;
  long long v136 = 0uLL;
  long long v135 = 0uLL;
  long long v134 = 0uLL;
  long long v133 = 0uLL;
  if (v7)
  {
    uint64_t v32 = [(UISegment *)self _segmentedControlClass];
    uint64_t v33 = [(UIView *)self traitCollection];
    if (v32)
    {
      [(objc_class *)v32 _hiddenSelectionTransformForTraitCollection:v33];
    }
    else
    {
      long long v140 = 0u;
      long long v139 = 0u;
      long long v138 = 0u;
      long long v137 = 0u;
      long long v136 = 0u;
      long long v135 = 0u;
      long long v134 = 0u;
      long long v133 = 0u;
    }
  }
  else
  {
    long long v34 = *(_OWORD *)&a3->m33;
    long long v137 = *(_OWORD *)&a3->m31;
    long long v138 = v34;
    long long v35 = *(_OWORD *)&a3->m43;
    long long v139 = *(_OWORD *)&a3->m41;
    long long v140 = v35;
    long long v36 = *(_OWORD *)&a3->m13;
    long long v133 = *(_OWORD *)&a3->m11;
    long long v134 = v36;
    long long v37 = *(_OWORD *)&a3->m23;
    long long v135 = *(_OWORD *)&a3->m21;
    long long v136 = v37;
  }
  uint64_t v38 = -[UISegment _effectiveContentView]((id *)&self->super.super.super.super.isa);
  double v39 = [v38 viewWithTag:-2030];

  if (!v6) {
    goto LABEL_33;
  }
  double v40 = [(UIView *)self->_info layer];
  double v41 = v40;
  if (v40) {
    [v40 transform];
  }
  else {
    memset(&a, 0, sizeof(a));
  }
  long long v42 = *(_OWORD *)&a4->m33;
  *(_OWORD *)&b.m31 = *(_OWORD *)&a4->m31;
  *(_OWORD *)&b.m33 = v42;
  long long v43 = *(_OWORD *)&a4->m43;
  *(_OWORD *)&b.m41 = *(_OWORD *)&a4->m41;
  *(_OWORD *)&b.m43 = v43;
  long long v44 = *(_OWORD *)&a4->m13;
  *(_OWORD *)&b.m11 = *(_OWORD *)&a4->m11;
  *(_OWORD *)&b.m13 = v44;
  long long v45 = *(_OWORD *)&a4->m23;
  *(_OWORD *)&b.m21 = *(_OWORD *)&a4->m21;
  *(_OWORD *)&b.m23 = v45;
  BOOL v46 = CATransform3DEqualToTransform(&a, &b);

  if (!v46)
  {
    CGRect v55 = [(UISegment *)self _segmentedControlClass];
    v130[4] = v145;
    v130[5] = v146;
    v130[6] = v147;
    v130[7] = v148;
    v130[0] = v141;
    v130[1] = v142;
    v130[2] = v143;
    v130[3] = v144;
    CGRect v56 = [MEMORY[0x1E4F29238] valueWithBytes:v130 objCType:"{CATransform3D=dddddddddddddddd}"];
    long long v57 = *(_OWORD *)&a4->m33;
    v129[4] = *(_OWORD *)&a4->m31;
    v129[5] = v57;
    long long v58 = *(_OWORD *)&a4->m43;
    v129[6] = *(_OWORD *)&a4->m41;
    v129[7] = v58;
    long long v59 = *(_OWORD *)&a4->m13;
    v129[0] = *(_OWORD *)&a4->m11;
    v129[1] = v59;
    long long v60 = *(_OWORD *)&a4->m23;
    v129[2] = *(_OWORD *)&a4->m21;
    v129[3] = v60;
    long long v61 = [MEMORY[0x1E4F29238] valueWithBytes:v129 objCType:"{CATransform3D=dddddddddddddddd}"];
    long long v62 = [(objc_class *)v55 _selectionPopAnimationForKey:@"transform" fromValue:v56 toValue:v61];

    [v62 setDelegate:self];
    long long v63 = [(UIView *)self->_selectionImageView layer];
    v64 = [(UISegment *)self _segmentedControlClass];
    v128[4] = v153;
    v128[5] = v154;
    v128[6] = v155;
    v128[7] = v156;
    v128[0] = v149;
    v128[1] = v150;
    v128[2] = v151;
    v128[3] = v152;
    v65 = [MEMORY[0x1E4F29238] valueWithBytes:v128 objCType:"{CATransform3D=dddddddddddddddd}"];
    long long v66 = *(_OWORD *)&a3->m33;
    v127[4] = *(_OWORD *)&a3->m31;
    v127[5] = v66;
    long long v67 = *(_OWORD *)&a3->m43;
    v127[6] = *(_OWORD *)&a3->m41;
    v127[7] = v67;
    long long v68 = *(_OWORD *)&a3->m13;
    v127[0] = *(_OWORD *)&a3->m11;
    v127[1] = v68;
    long long v69 = *(_OWORD *)&a3->m23;
    v127[2] = *(_OWORD *)&a3->m21;
    v127[3] = v69;
    v70 = [MEMORY[0x1E4F29238] valueWithBytes:v127 objCType:"{CATransform3D=dddddddddddddddd}"];
    v71 = [(objc_class *)v64 _selectionPopAnimationForKey:@"transform" fromValue:v65 toValue:v70];
    [v63 addAnimation:v71 forKey:@"SelectionScale"];

    v72 = [(UISegment *)self _segmentedControlClass];
    float v54 = v31;
    LODWORD(v73) = v29;
    *(float *)&double v74 = v54;
    v75 = [(objc_class *)v72 _selectionOpacityAnimationFromValue:v73 toValue:v74];
    v76 = v75;
    if (v7) {
      [v75 setDelegate:self];
    }
    v77 = [(UIView *)self->_info layer];
    [v77 addAnimation:v62 forKey:@"InfoScale"];

    v78 = [(UIView *)self->_selectionImageView layer];
    [v78 addAnimation:v76 forKey:@"SelectionOpacity"];

    if (v39)
    {
      v79 = [v39 layer];
      [v79 addAnimation:v76 forKey:@"SelectionOpacity"];
    }
  }
  else
  {
LABEL_33:
    if (self->_selectionIndicatorView && v7)
    {
      long long v47 = *(_OWORD *)&a3->m33;
      long long v123 = *(_OWORD *)&a3->m31;
      long long v124 = v47;
      long long v48 = *(_OWORD *)&a3->m43;
      long long v125 = *(_OWORD *)&a3->m41;
      long long v126 = v48;
      long long v49 = *(_OWORD *)&a3->m13;
      long long v119 = *(_OWORD *)&a3->m11;
      long long v120 = v49;
      long long v50 = *(_OWORD *)&a3->m23;
      long long v121 = *(_OWORD *)&a3->m21;
      long long v122 = v50;
      double v51 = [(UIView *)self->_info layer];
      v118[4] = v123;
      v118[5] = v124;
      v118[6] = v125;
      v118[7] = v126;
      v118[0] = v119;
      v118[1] = v120;
      v118[2] = v121;
      v118[3] = v122;
      [v51 setTransform:v118];

      [(UIView *)self->_selectionIndicatorView removeFromSuperview];
      selectionIndicatorView = self->_selectionIndicatorView;
      self->_selectionIndicatorView = 0;

      selectionImageView = self->_selectionImageView;
      self->_selectionImageView = 0;

      if (v39) {
        [v39 removeFromSuperview];
      }
      goto LABEL_44;
    }
    float v54 = v31;
  }
  long long v80 = *(_OWORD *)&a4->m33;
  long long v114 = *(_OWORD *)&a4->m31;
  long long v115 = v80;
  long long v81 = *(_OWORD *)&a4->m43;
  long long v116 = *(_OWORD *)&a4->m41;
  long long v117 = v81;
  long long v82 = *(_OWORD *)&a4->m13;
  long long v110 = *(_OWORD *)&a4->m11;
  long long v111 = v82;
  long long v83 = *(_OWORD *)&a4->m23;
  long long v112 = *(_OWORD *)&a4->m21;
  long long v113 = v83;
  v84 = [(UIView *)self->_info layer];
  v109[4] = v114;
  v109[5] = v115;
  v109[6] = v116;
  v109[7] = v117;
  v109[0] = v110;
  v109[1] = v111;
  v109[2] = v112;
  v109[3] = v113;
  [v84 setTransform:v109];

  long long v105 = v137;
  long long v106 = v138;
  long long v107 = v139;
  long long v108 = v140;
  long long v101 = v133;
  long long v102 = v134;
  long long v103 = v135;
  long long v104 = v136;
  v85 = [(UIView *)self->_selectionImageView layer];
  v100[4] = v105;
  v100[5] = v106;
  v100[6] = v107;
  v100[7] = v108;
  v100[0] = v101;
  v100[1] = v102;
  v100[2] = v103;
  v100[3] = v104;
  [v85 setTransform:v100];

  v86 = [(UIView *)self->_selectionImageView layer];
  *(float *)&double v87 = v54;
  [v86 setOpacity:v87];

  if (v39)
  {
    long long v96 = v137;
    long long v97 = v138;
    long long v98 = v139;
    long long v99 = v140;
    long long v92 = v133;
    long long v93 = v134;
    long long v94 = v135;
    long long v95 = v136;
    v88 = [v39 layer];
    v91[4] = v96;
    v91[5] = v97;
    v91[6] = v98;
    v91[7] = v99;
    v91[0] = v92;
    v91[1] = v93;
    v91[2] = v94;
    v91[3] = v95;
    [v88 setTransform:v91];

    v89 = [v39 layer];
    *(float *)&double v90 = v54;
    [v89 setOpacity:v90];
  }
LABEL_44:
}

- (void)setObjectValue:(id)a3
{
  id v3 = a3;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (unint64_t)a3;
  info = self->_info;
  if (!(v5 | (unint64_t)info) || ![(UIView *)info _wantsAutolayout])
  {
    id v59 = 0;
    id v60 = 0;
    goto LABEL_41;
  }
  [(UISegment *)self _invalidateInfoConstraints];
  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = objc_msgSend(-[UISegment _parentSegmentedControl](self, "_parentSegmentedControl"), "superview");
  if (v7)
  {
    double v8 = (void *)v7;
    id v56 = v3;
    long long v57 = (void *)v5;
    while (1)
    {
      double v9 = [(UIView *)self _layoutEngine];
      id v10 = [v9 delegate];
      char v11 = [v8 isDescendantOfView:v10];

      if ((v11 & 1) == 0) {
        goto LABEL_39;
      }
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v58 = v8;
      double v12 = [v8 constraints];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v67 objects:v75 count:16];
      if (!v13) {
        goto LABEL_38;
      }
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v68;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v68 != v15) {
            objc_enumerationMutation(v12);
          }
          int v17 = *(void **)(*((void *)&v67 + 1) + 8 * v16);
          uint64_t v18 = [v17 firstAttribute];
          if ((v18 - 11) > 1)
          {
            char v21 = 0;
LABEL_18:
            uint64_t v23 = [v17 secondAttribute];
            if ((v23 - 11) > 1)
            {
              id v22 = 0;
            }
            else
            {
              if (v17) {
                int v24 = objc_msgSend((id)objc_msgSend(v17, "secondItem"), "_referenceView");
              }
              else {
                int v24 = 0;
              }
              char v25 = v24;
              id v22 = [(UIView *)v25 _viewForLoweringBaselineLayoutAttribute:v23];

              char v21 = v25;
            }

            if (v22 != self->_info) {
              goto LABEL_27;
            }
            goto LABEL_24;
          }
          if (v17) {
            uint64_t v19 = objc_msgSend((id)objc_msgSend(v17, "firstItem"), "_referenceView");
          }
          else {
            uint64_t v19 = 0;
          }
          id v20 = v19;
          char v21 = [v20 _viewForLoweringBaselineLayoutAttribute:v18];

          if (!v21) {
            goto LABEL_18;
          }
          id v22 = v21;
          if (v21 != self->_info) {
            goto LABEL_18;
          }
LABEL_24:
          [v60 addObject:v17];
          unsigned int v26 = [v17 container];
          if (os_variant_has_internal_diagnostics())
          {
            if (!v26)
            {
              id v27 = __UIFaultDebugAssertLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                v72 = v58;
                __int16 v73 = 2112;
                double v74 = v17;
                _os_log_fault_impl(&dword_1853B0000, v27, OS_LOG_TYPE_FAULT, "Impossible! Constraint from view's constraints list that doesn't have a container. view = %@; constraint = %@",
                  buf,
                  0x16u);
              }
            }
          }
          else if (!v26)
          {
            int v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setObjectValue____s_category) + 8);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v72 = v58;
              __int16 v73 = 2112;
              double v74 = v17;
              _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "Impossible! Constraint from view's constraints list that doesn't have a container. view = %@; constraint = %@",
                buf,
                0x16u);
            }
          }
          [v59 addObject:v26];
          [v17 setActive:0];

LABEL_27:
          ++v16;
        }
        while (v14 != v16);
        uint64_t v29 = [v12 countByEnumeratingWithState:&v67 objects:v75 count:16];
        uint64_t v14 = v29;
      }
      while (v29);
LABEL_38:

      uint64_t v30 = [v58 superview];

      double v8 = (void *)v30;
      if (!v30)
      {
LABEL_39:

        id v3 = v56;
        unint64_t v5 = (unint64_t)v57;
        break;
      }
    }
  }
LABEL_41:
  [(UIView *)self->_info removeFromSuperview];
  if (!v5 || (*(_DWORD *)&self->_segmentFlags & 0x40000) == 0)
  {
    double v31 = self->_info;
    self->_info = 0;
  }
  p_objectValue = &self->_objectValue;
  if (self->_objectValue != (id)v5) {
    objc_storeStrong(&self->_objectValue, v3);
  }
  if (v5)
  {
    $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
    if ((*(_DWORD *)&segmentFlags & 0x40000) != 0)
    {
      self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&segmentFlags & 0xFFFFFFDF);
      double v41 = self->_info;
      BOOL v42 = [(UIView *)self isEnabled];
      double v43 = 0.5;
      if (v42) {
        double v43 = 1.0;
      }
      [(UIView *)v41 setAlpha:v43];
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        int v35 = 32;
      }
      else {
        int v35 = 0;
      }
      self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFFFDF | v35);
      if ((isKindOfClass & 1) == 0)
      {
        BOOL v46 = objc_alloc_init(UISegmentLabel);
        long long v47 = self->_info;
        self->_info = &v46->super.super;

        [(UIView *)self->_info setContentMode:0];
        objc_opt_class();
        char v48 = objc_opt_isKindOfClass();
        long long v49 = self->_info;
        id v50 = *p_objectValue;
        if (v48) {
          [(UIView *)v49 setAttributedText:v50];
        }
        else {
          [(UIView *)v49 setText:v50];
        }
        [(UISegment *)self _updateTextColors];
        [(UIView *)self->_info setEnabled:[(UIView *)self isEnabled]];
        [(UIView *)self->_info sizeToFit];
        [(UIView *)self->_info setAdjustsFontSizeToFitWidth:(*(_DWORD *)&self->_segmentFlags & 0x8200) != 0];
        $EF3B0C3FF7A708BD5C1B93D65F9CAC5C v55 = self->_segmentFlags;
        if ((*(unsigned char *)&v55 & 4) != 0)
        {
          self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&v55 & 0xFFFFFFFB);
          [(UISegment *)self setSelected:1];
        }
LABEL_59:
        long long v44 = -[UISegment _effectiveContentView]((id *)&self->super.super.super.super.isa);
        [v44 addSubview:self->_info];

        if ([v60 count])
        {
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          long long v63 = __28__UISegment_setObjectValue___block_invoke;
          v64 = &unk_1E52D9F98;
          id v65 = v60;
          id v66 = v59;
          id v45 = [(UIView *)self _layoutEngineCreateIfNecessary];
          if (v45) {
            [v45 withAutomaticOptimizationDisabled:v62];
          }
          else {
            v63((uint64_t)v62);
          }
        }
        double v51 = [(UISegment *)self _segmentedControlClass];
        double v52 = [(UIView *)self traitCollection];
        double v53 = UISegmentedControlStyleProviderForIdiom(v51, [v52 userInterfaceIdiom]);
        if ([v53 useSelectionIndicatorStyling]
          && ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C v54 = self->_segmentFlags, (*(unsigned char *)&v54 & 8) != 0))
        {

          if ((*(_WORD *)&v54 & 0x4000) == 0) {
            goto LABEL_70;
          }
          [(UISegment *)self _highlightSelectionInfoTransform];
          double v52 = [(UIView *)self->_info layer];
          v61[4] = v61[12];
          v61[5] = v61[13];
          v61[6] = v61[14];
          v61[7] = v61[15];
          v61[0] = v61[8];
          v61[1] = v61[9];
          v61[2] = v61[10];
          v61[3] = v61[11];
          [v52 setTransform:v61];
        }
        else
        {
        }
LABEL_70:
        [(UIView *)self setNeedsLayout];
        goto LABEL_71;
      }
      long long v36 = [[UIImageView alloc] initWithImage:*p_objectValue];
      long long v37 = self->_info;
      self->_info = &v36->super;

      uint64_t v38 = self->_info;
      BOOL v39 = [(UIView *)self isEnabled];
      double v40 = 0.5;
      if (v39) {
        double v40 = 1.0;
      }
      [(UIView *)v38 setAlpha:v40];
      [(UIView *)self->_info _setDefaultRenderingMode:2];
    }
    [(UISegment *)self updateMasking];
    goto LABEL_59;
  }
LABEL_71:
}

- (id)_effectiveContentView
{
  v1 = a1;
  if (a1)
  {
    id v2 = -[UISegment _contentViewIfNeeded](a1);
    uint64_t v3 = [v2 contentView];
    id v4 = (void *)v3;
    if (v3) {
      unint64_t v5 = (void *)v3;
    }
    else {
      unint64_t v5 = v1;
    }
    v1 = v5;
  }
  return v1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UISegment;
  [(UIImageView *)&v4 traitCollectionDidChange:a3];
  [(UISegment *)self _updateTextColors];
}

- (void)_updateHighlight
{
  uint64_t v3 = [(UISegment *)self _segmentedControlClass];
  objc_super v4 = [(UIView *)self traitCollection];
  unint64_t v5 = UISegmentedControlStyleProviderForIdiom(v3, [v4 userInterfaceIdiom]);

  if ([v5 useSelectionIndicatorStyling]
    && [v5 animateSlidingSelectionByDefault])
  {
    BOOL v6 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage backgroundImageForState:1 isMini:0 withFallback:1];
    if (v6)
    {
    }
    else
    {
      uint64_t v7 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage textAttributesForState:1];

      if (!v7)
      {
        int v8 = *(_DWORD *)&self->_segmentFlags & 0x400C;
        double v9 = [(UIView *)self traitCollection];
        BOOL v10 = [v9 userInterfaceStyle] == 2;

        double v11 = dbl_186B935B0[v10];
        uint64_t v14 = 3221225472;
        uint64_t v13 = MEMORY[0x1E4F143A8];
        uint64_t v15 = __29__UISegment__updateHighlight__block_invoke;
        uint64_t v16 = &unk_1E52D9CD0;
        if (v8 != 8) {
          double v11 = 1.0;
        }
        int v17 = self;
        double v18 = v11;
        double v12 = (void (**)(void))_Block_copy(&v13);
        if (+[UIView areAnimationsEnabled]) {
          +[UIView animateWithDuration:327684 delay:v12 options:0 animations:0.47 completion:0.0];
        }
        else {
          v12[2](v12);
        }
      }
    }
  }
}

- (void)setSelectionIndicatorDragged:(BOOL)a3
{
}

- (void)_setSelectionIndicatorDragged:(BOOL)a3 animated:(BOOL)a4
{
  if (((((*(_DWORD *)&self->_segmentFlags & 0x4000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v5 = 0x4000;
    }
    else {
      int v5 = 0;
    }
    self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFBFFF | v5);
    BOOL v6 = [(UISegment *)self _segmentedControlClass];
    uint64_t v7 = [(UIView *)self traitCollection];
    UISegmentedControlStyleProviderForIdiom(v6, [v7 userInterfaceIdiom]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if ([v8 useSelectionIndicatorStyling]) {
      [(UISegment *)self setNeedsBackgroundAndContentViewUpdate];
    }
  }
}

- (void)setSelected:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_segmentFlags & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v4 = 4;
    }
    else {
      int v4 = 0;
    }
    self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFFFFB | v4);
    [(UISegment *)self _evaluateHighlight];
    [(UISegment *)self setNeedsBackgroundAndContentViewUpdate];
    [(UISegment *)self updateMasking];
  }
}

- (UISegment)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UISegment;
  int v5 = [(UIImageView *)&v13 initWithCoder:v4];
  BOOL v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(UIView *)v5 layer];
    objc_msgSend(v7, "setContentsCenter:", 0.0, 0.0, 1.0, 1.0);

    id v8 = [v4 decodeObjectForKey:@"UISegmentInfo"];
    [(UISegment *)v6 setObjectValue:v8];

    [v4 decodeFloatForKey:@"UISegmentWidth"];
    v6->_double width = v9;
    [v4 decodeCGSizeForKey:@"UISegmentContentOffset"];
    v6->_contentOffset.double width = v10;
    v6->_contentOffset.double height = v11;
    v6->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&v6->_segmentFlags & 0xFFFFFFFC | [v4 decodeIntegerForKey:@"UISegmentSize"] & 3);
    v6->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&v6->_segmentFlags & 0xFFFFFE3F | (([v4 decodeIntegerForKey:@"UISegmentPosition"] & 7) << 6));
    [(UISegment *)v6 _finishInitialSegmentSetup];
  }

  return v6;
}

- (BOOL)_effectiveUseDynamicShadow
{
  id v2 = [(UISegment *)self _parentSegmentedControl];
  char v3 = [v2 _useDynamicShadow];

  return v3;
}

- (id)_effectiveVisualEffect
{
  id v2 = [(UISegment *)self _parentSegmentedControl];
  char v3 = objc_msgSend(v2, "__selectedSegmentVisualEffect");

  return v3;
}

- (id)_tintColorArchivingKey
{
  return @"UISegmentTintColor";
}

- (id)_encodableSubviews
{
  id v2 = -[UISegment _effectiveContentView]((id *)&self->super.super.super.super.isa);
  char v3 = [v2 subviews];

  return v3;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UISegment;
  [(UIView *)&v7 _populateArchivedSubviews:v4];
  if (self->_info) {
    objc_msgSend(v4, "removeObject:");
  }
  int v5 = [(UISegment *)self _effectiveBackgroundView];
  BOOL v6 = [v5 viewWithTag:-1030];

  if (v6) {
    [v4 removeObject:v6];
  }
  if (self->_infoContentView) {
    objc_msgSend(v4, "removeObject:");
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [(UIImageView *)self image];
  BOOL v6 = [(UIImageView *)self highlightedImage];
  [(UIView *)self->_selectionIndicatorView removeFromSuperview];
  [(UIImageView *)self setImage:0];
  [(UIImageView *)self setHighlightedImage:0];
  v13.receiver = self;
  v13.super_class = (Class)UISegment;
  [(UIImageView *)&v13 encodeWithCoder:v4];
  [(UIImageView *)self setImage:v5];
  [(UIImageView *)self setHighlightedImage:v6];
  objc_super v7 = -[UISegment _effectiveContentView]((id *)&self->super.super.super.super.isa);
  [v7 insertSubview:self->_selectionIndicatorView below:self->_info];

  id v8 = [(UISegment *)self objectValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 string];

    id v8 = (void *)v9;
  }
  [v4 encodeObject:v8 forKey:@"UISegmentInfo"];
  double width = self->_width;
  if (width != 0.0)
  {
    *(float *)&double width = width;
    [v4 encodeFloat:@"UISegmentWidth" forKey:width];
  }
  if (self->_contentOffset.width != 0.0 || self->_contentOffset.height != 0.0) {
    objc_msgSend(v4, "encodeCGSize:forKey:", @"UISegmentContentOffset");
  }
  [v4 encodeInteger:5 forKey:@"UISegmentStyle"];
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
  if ((*(unsigned char *)&segmentFlags & 3) != 0)
  {
    objc_msgSend(v4, "encodeInteger:forKey:");
    $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
  }
  uint64_t v12 = (*(unsigned int *)&segmentFlags >> 6) & 7;
  if (v12) {
    [v4 encodeInteger:v12 forKey:@"UISegmentPosition"];
  }
}

- (void)dealloc
{
  [(UISegment *)self setObjectValue:0];
  [(UIView *)self->_badgeView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)UISegment;
  [(UIImageView *)&v3 dealloc];
}

- (id)_dividerImage
{
  return [(UISegment *)self _dividerImageIsCustom:0];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((*(unsigned char *)&self->_segmentFlags & 0xC) != 0)
  {
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  id v11 = v6;
  [(UIView *)self->_selectionIndicatorView removeFromSuperview];
  selectionImageView = self->_selectionImageView;
  self->_selectionImageView = 0;

  selectionIndicatorView = self->_selectionIndicatorView;
  self->_selectionIndicatorView = 0;

  uint64_t v9 = -[UISegment _effectiveContentView]((id *)&self->super.super.super.super.isa);
  CGFloat v10 = [v9 viewWithTag:-2030];

  if (v10) {
    [v10 removeFromSuperview];
  }

  id v6 = v11;
  if (v4)
  {
LABEL_7:
    if ((*(unsigned char *)&self->_segmentFlags & 8) == 0)
    {
      id v12 = v6;
      [(UIView *)self setNeedsLayout];
      id v6 = v12;
    }
  }
LABEL_9:
}

- (void)_updateDynamicShadow:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v4 = a4;
  BOOL v5 = a3;
  objc_super v7 = [(UISegment *)self _segmentedControlClass];
  selectionIndicatorView = self->_selectionIndicatorView;
  uint64_t v9 = [(UISegment *)self _parentSegmentedControl];
  LODWORD(v4) = [(objc_class *)v7 _updateDynamicShadowView:selectionIndicatorView withAnimationDelegate:v9 useDynamicShadow:v5 animated:v4];

  if (v4)
  {
    id v10 = [(UISegment *)self _parentSegmentedControl];
    [v10 _setAnimatingOutDynamicShdaow:1];
  }
}

- (void)_insertSelectionView
{
  objc_super v3 = [(UISegment *)self _segmentedControlClass];
  [(UIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = *(_DWORD *)&self->_segmentFlags & 3;
  objc_super v13 = [(UIView *)self traitCollection];
  -[objc_class _selectionFrameForBounds:size:traitCollection:accessibilityView:](v3, "_selectionFrameForBounds:size:traitCollection:accessibilityView:", v12, v13, (*(_DWORD *)&self->_segmentFlags >> 13) & 1, v5, v7, v9, v11);
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  double v19 = v18;
  double v21 = v20;

  id v22 = [(UISegment *)self _segmentedControlClass];
  uint64_t v23 = [(UISegment *)self _effectiveVisualEffect];
  int v24 = [(UIView *)self traitCollection];
  char v25 = UISegmentedControlStyleProviderForIdiom(v22, [v24 userInterfaceIdiom]);

  if (!v23)
  {
    BOOL v31 = [(UISegment *)self _effectiveDisableShadow];
    BOOL v32 = [(UISegment *)self _effectiveUseDynamicShadow];
    uint64_t v30 = [(UIView *)self traitCollection];
    uint64_t v33 = [(UISegment *)self _effectiveSelectedSegmentTintColor];
    if ([v25 useGeneratedImages])
    {
      long long v34 = -[objc_class _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](v22, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, v31 | v32, 0, v30, v33, *(_DWORD *)&self->_segmentFlags & 3, v19, v21);
    }
    else
    {
      long long v34 = 0;
    }
    double v41 = [[UIImageView alloc] initWithImage:v34];
    selectionImageView = self->_selectionImageView;
    self->_selectionImageView = v41;

    objc_storeStrong((id *)&self->_selectionIndicatorView, self->_selectionImageView);
    if (!v31
      && [(objc_class *)v22 _useShadowForSelectedTintColor:v33 traitCollection:v30])
    {
      [(UISegment *)self _updateDynamicShadow:1 animated:0];
    }

    goto LABEL_20;
  }
  unsigned int v26 = [[UIVisualEffectView alloc] initWithEffect:v23];
  selectionIndicatorView = self->_selectionIndicatorView;
  self->_selectionIndicatorView = &v26->super;

  [(UIView *)self->_selectionIndicatorView setAutoresizingMask:18];
  if ([v25 useGeneratedImages])
  {
    int v28 = [(UIView *)self traitCollection];
    uint64_t v29 = [(UISegment *)self _effectiveSelectedSegmentTintColor];
    uint64_t v30 = -[objc_class _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](v22, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 1, 0, v28, v29, *(_DWORD *)&self->_segmentFlags & 3, v19, v21);
  }
  else
  {
    uint64_t v30 = 0;
  }
  int v35 = [[UIImageView alloc] initWithImage:v30];
  long long v36 = self->_selectionImageView;
  self->_selectionImageView = v35;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v37 = [(UIView *)self->_selectionIndicatorView contentView];
    [v37 addSubview:self->_selectionImageView];
  }
  else
  {
    [(UIView *)self->_selectionIndicatorView setMaskView:self->_selectionImageView];
  }
  if ([v25 hasShadowWithSelectedSegmentEffect]
    && [v25 useGeneratedImages])
  {
    uint64_t v33 = [v25 createSelectedSegmentEffectShadowView];
    if (!v33)
    {
      uint64_t v38 = [(UIView *)self traitCollection];
      BOOL v39 = [(UISegment *)self _effectiveSelectedSegmentTintColor];
      double v40 = -[objc_class _modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:](v22, "_modernBackgroundSelected:shadow:maximumSize:highlighted:traitCollection:tintColor:size:", 1, 2, 0, v38, v39, *(_DWORD *)&self->_segmentFlags & 3, v19, v21);

      uint64_t v33 = [[UIImageView alloc] initWithImage:v30];
    }
    [(UIView *)v33 setTag:-2030];
    [(UIView *)v33 setAutoresizingMask:18];
LABEL_20:
  }
  [(UIView *)self->_selectionImageView setAutoresizingMask:18];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __33__UISegment__insertSelectionView__block_invoke;
  v44[3] = &unk_1E52E6160;
  uint64_t v48 = v15;
  uint64_t v49 = v17;
  double v50 = v19;
  double v51 = v21;
  id v45 = 0;
  BOOL v46 = self;
  id v47 = v23;
  id v43 = v23;
  +[UIView performWithoutAnimation:v44];
}

void __33__UISegment__insertSelectionView__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    objc_super v3 = (void *)[*(id *)(a1 + 40) _segmentedControlClass];
    double v4 = [*(id *)(a1 + 40) traitCollection];
    if (v3)
    {
      [v3 _hiddenSelectionTransformForTraitCollection:v4];
    }
    else
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
    }
    double v5 = [*(id *)(a1 + 32) layer];
    v22[4] = v27;
    v22[5] = v28;
    v22[6] = v29;
    v22[7] = v30;
    v22[0] = v23;
    v22[1] = v24;
    v22[2] = v25;
    v22[3] = v26;
    [v5 setTransform:v22];

    double v6 = [*(id *)(a1 + 32) layer];
    [v6 setOpacity:0.0];

    double v7 = -[UISegment _effectiveContentView](*(id **)(a1 + 40));
    [v7 insertSubview:*(void *)(a1 + 32) below:*(void *)(*(void *)(a1 + 40) + 504)];
  }
  if (*(void *)(a1 + 48))
  {
    [*(id *)(a1 + 40) bounds];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 520), "setFrame:");
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 528), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  double v8 = (void *)[*(id *)(a1 + 40) _segmentedControlClass];
  double v9 = [*(id *)(a1 + 40) traitCollection];
  if (v8)
  {
    [v8 _hiddenSelectionTransformForTraitCollection:v9];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
  }
  double v10 = [*(id *)(*(void *)(a1 + 40) + 528) layer];
  v13[4] = v18;
  v13[5] = v19;
  v13[6] = v20;
  v13[7] = v21;
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  v13[3] = v17;
  [v10 setTransform:v13];

  double v11 = [*(id *)(*(void *)(a1 + 40) + 528) layer];
  [v11 setOpacity:0.0];

  uint64_t v12 = -[UISegment _effectiveContentView](*(id **)(a1 + 40));
  [v12 insertSubview:*(void *)(*(void *)(a1 + 40) + 520) below:*(void *)(*(void *)(a1 + 40) + 504)];
}

- (CATransform3D)_highlightSelectionInfoTransform
{
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  double v5 = [(UISegment *)self _segmentedControlClass];
  double v6 = [(UIView *)self traitCollection];
  if (v5)
  {
    [(objc_class *)v5 _highlightSelectionTransformForTraitCollection:v6];
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  if ((*((unsigned char *)&self->_segmentFlags + 1) & 0x20) == 0)
  {
    [(objc_class *)[(UISegment *)self _segmentedControlClass] _selectionOffsetAdjustmentForSegment:self];
    long long v8 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&v17.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&v17.m33 = v8;
    long long v9 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&v17.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&v17.m43 = v9;
    long long v10 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&v17.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&v17.m13 = v10;
    long long v11 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&v17.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&v17.m23 = v11;
    CGRect result = CATransform3DTranslate(&v18, &v17, v12, 0.0, 0.0);
    long long v13 = *(_OWORD *)&v18.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v18.m31;
    *(_OWORD *)&retstr->m33 = v13;
    long long v14 = *(_OWORD *)&v18.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v18.m41;
    *(_OWORD *)&retstr->m43 = v14;
    long long v15 = *(_OWORD *)&v18.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v18.m11;
    *(_OWORD *)&retstr->m13 = v15;
    long long v16 = *(_OWORD *)&v18.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v18.m21;
    *(_OWORD *)&retstr->m23 = v16;
  }
  return result;
}

- (BOOL)_hasSelectedColor
{
  id v2 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage textAttributesForState:4];
  objc_super v3 = [v2 objectForKey:*(void *)off_1E52D2048];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setWasSelected:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_segmentFlags & 0x800) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v3 = 2048;
    }
    else {
      int v3 = 0;
    }
    self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFF7FF | v3);
    [(UISegment *)self updateMasking];
  }
}

- (void)setUsesAXTextSize:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFDFFF | v3);
}

- (id)disabledTextColor
{
  id v2 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage textAttributesForState:2];
  int v3 = [v2 allKeys];
  uint64_t v4 = *(void *)off_1E52D2048;
  int v5 = [v3 containsObject:*(void *)off_1E52D2048];

  if (v5)
  {
    double v6 = [v2 objectForKey:v4];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)setBarStyle:(int64_t)a3
{
  if (self->_barStyle != a3)
  {
    self->_barStyle = a3;
    [(UISegment *)self setNeedsBackgroundAndContentViewUpdate];
  }
}

- (void)setTintColor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UISegment;
  [(UIView *)&v3 setTintColor:a3];
}

- (void)setAutosizeText:(BOOL)a3
{
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
  if (a3) {
    int v4 = 512;
  }
  else {
    int v4 = 0;
  }
  self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&segmentFlags & 0xFFFFFDFF | v4);
  if ((*(_DWORD *)&segmentFlags & 0x40020) == 0)
  {
    uint64_t v6 = a3 | ((unsigned __int16)(*(_WORD *)&segmentFlags & 0x8000) >> 15);
    double v7 = self->_info;
    [(UIView *)v7 setAdjustsFontSizeToFitWidth:v6];
    [(UISegment *)self _positionInfo];
  }
}

- (void)setAdjustsForContentSizeCategory:(BOOL)a3
{
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
  if (a3) {
    int v4 = 0x8000;
  }
  else {
    int v4 = 0;
  }
  self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&segmentFlags & 0xFFFF7FFF | v4);
  if ((*(_DWORD *)&segmentFlags & 0x40020) == 0)
  {
    uint64_t v6 = a3 | ((unsigned __int16)(*(_WORD *)&segmentFlags & 0x200) >> 9);
    double v7 = self->_info;
    [(UIView *)v7 setAdjustsFontSizeToFitWidth:v6];
    [(UISegment *)self _positionInfo];
  }
}

- (BOOL)isSelected
{
  return (*(unsigned char *)&self->_segmentFlags >> 2) & 1;
}

- (void)setSelected:(BOOL)a3 highlighted:(BOOL)a4
{
  if (((((*(_DWORD *)&self->_segmentFlags & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a4) {
      int v5 = 8;
    }
    else {
      int v5 = 0;
    }
    if (a3) {
      int v6 = 4;
    }
    else {
      int v6 = 0;
    }
    self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(v5 | v6 | *(_DWORD *)&self->_segmentFlags & 0xFFFFFFF3);
    [(UISegment *)self setNeedsBackgroundAndContentViewUpdate];
    [(UISegment *)self updateMasking];
  }
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)_setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  if (((((*(_DWORD *)&self->_segmentFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    if (a3) {
      int v7 = 8;
    }
    else {
      int v7 = 0;
    }
    self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFFFF7 | v7);
    long long v8 = [(UISegment *)self _segmentedControlClass];
    long long v9 = [(UIView *)self traitCollection];
    UISegmentedControlStyleProviderForIdiom(v8, [v9 userInterfaceIdiom]);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if ([v12 useTVStyleFocusSelection])
    {
      if (v5) {
        uint64_t v10 = 9;
      }
      else {
        uint64_t v10 = 8;
      }
      long long v11 = -[UISegment _floatingContentView]((id *)&self->super.super.super.super.isa);
      [v11 setControlState:v10 animated:v4];
    }
    [(UISegment *)self _evaluateHighlight];
    [(UISegment *)self setNeedsBackgroundAndContentViewUpdate];
  }
}

- (BOOL)isSelectionIndicatorDragged
{
  return (*((unsigned __int8 *)&self->_segmentFlags + 1) >> 6) & 1;
}

- (void)setHovered:(BOOL)a3
{
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
  if (((((*(_DWORD *)&segmentFlags & 0x10000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v4 = 0x10000;
    }
    else {
      int v4 = 0;
    }
    self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&segmentFlags & 0xFFFEFFFF | v4);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __24__UISegment_setHovered___block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    +[UIView performWithoutAnimation:v5];
  }
}

uint64_t __24__UISegment_setHovered___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSelectionIndicator];
}

- (BOOL)isAnimatingSelectionIndicator
{
  return (*((unsigned __int8 *)&self->_segmentFlags + 2) >> 1) & 1;
}

- (void)setAnimatingSelectionIndicator:(BOOL)a3
{
  $EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = self->_segmentFlags;
  if (((((*(_DWORD *)&segmentFlags & 0x20000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v5 = 0x20000;
    }
    else {
      int v5 = 0;
    }
    self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&segmentFlags & 0xFFFDFFFF | v5);
    int v6 = [(UISegment *)self _segmentedControlClass];
    int v7 = [(UIView *)self traitCollection];
    UISegmentedControlStyleProviderForIdiom(v6, [v7 userInterfaceIdiom]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if ([v8 useSelectionIndicatorStyling]) {
      [(UISegment *)self setNeedsBackgroundAndContentViewUpdate];
    }
  }
}

- (NSString)badgeValue
{
  return self->_badgeValue;
}

- (void)setBadgeValue:(id)a3
{
  int v4 = (NSString *)a3;
  int v5 = v4;
  if (self->_badgeValue != v4)
  {
    long long v11 = v4;
    int v6 = (NSString *)[(NSString *)v4 copy];
    badgeValue = self->_badgeValue;
    self->_badgeValue = v6;

    badgeView = self->_badgeView;
    if (self->_badgeValue)
    {
      if (badgeView)
      {
        -[_UIBadgeView setText:](badgeView, "setText:");
LABEL_9:
        int v5 = v11;
        goto LABEL_10;
      }
      uint64_t v10 = [[_UIBadgeView alloc] initWithText:self->_badgeValue];
      long long v9 = self->_badgeView;
      self->_badgeView = v10;
    }
    else
    {
      int v5 = v11;
      if (!badgeView) {
        goto LABEL_10;
      }
      [(UIView *)badgeView removeFromSuperview];
      long long v9 = self->_badgeView;
      self->_badgeView = 0;
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (BOOL)_isContainedInHostedFocusSystem
{
  return 1;
}

- (BOOL)isRightSelected
{
  return (LOBYTE(self->_rightSegmentState) >> 2) & 1;
}

- (BOOL)isRightHighlighted
{
  return self->_rightSegmentState & 1;
}

- (BOOL)isMomentary
{
  return (*((unsigned __int8 *)&self->_segmentFlags + 1) >> 2) & 1;
}

- (void)setControlSize:(int)a3
{
  if ((*(_DWORD *)&self->_segmentFlags & 3) != a3)
  {
    self->_$EF3B0C3FF7A708BD5C1B93D65F9CAC5C segmentFlags = ($EF3B0C3FF7A708BD5C1B93D65F9CAC5C)(*(_DWORD *)&self->_segmentFlags & 0xFFFFFFFC | a3 & 3);
    [(UISegment *)self setNeedsBackgroundAndContentViewUpdate];
    [(UISegment *)self _invalidateInfoConstraints];
  }
}

- (BOOL)showDivider
{
  return (*(unsigned char *)&self->_segmentFlags >> 4) & 1;
}

- (void)animateAdd:(BOOL)a3
{
  info = self->_info;
  double v4 = 1.0;
  if (a3) {
    double v4 = 0.0;
  }
  [(UIView *)info setAlpha:v4];
}

- (void)animateRemoveForWidth:(double)a3
{
  [(UIView *)self->_info frame];
  [(UIView *)self->_info setFrame:v5 + a3];
  [(UIView *)self->_info setAlpha:0.0];
  if ((*(unsigned char *)&self->_segmentFlags & 0x10) != 0)
  {
    int v6 = [(UISegment *)self _effectiveBackgroundView];
    id v15 = [v6 viewWithTag:-1030];

    [v15 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(UIView *)self bounds];
    objc_msgSend(v15, "setFrame:", v14 + v13 * 0.5 + a3, v8, v10, v12);
  }
}

- (void)removeFromSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)UISegment;
  [(UIView *)&v3 removeFromSuperview];
  [(UIView *)self->_backgroundView removeFromSuperview];
}

- (void)_positionInfoWithoutAnimation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__UISegment__positionInfoWithoutAnimation__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

uint64_t __42__UISegment__positionInfoWithoutAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _positionInfo];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UISegment;
  -[UIImageView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11) {
    [(UISegment *)self setNeedsBackgroundAndContentViewUpdate];
  }
}

- (unsigned)segmentPosition
{
  return (*(_DWORD *)&self->_segmentFlags >> 6) & 7;
}

- (id)label
{
  if ((*(_DWORD *)&self->_segmentFlags & 0x40020) != 0 || (info = self->_info) == 0) {
    id v2 = 0;
  }
  else {
    id v2 = info;
  }
  return v2;
}

- (void)setContentOffset:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  p_contentOffset = &self->_contentOffset;
  if (a3.width != self->_contentOffset.width || a3.height != self->_contentOffset.height) {
    [(UISegment *)self _invalidateInfoConstraints];
  }
  p_contentOffset->CGFloat width = width;
  p_contentOffset->CGFloat height = height;
  bezelView = self->_bezelView;
  if (bezelView)
  {
    [(UISegmentBezelView *)bezelView contentOffsetForSegment:self];
    p_contentOffset->CGFloat height = v10 + p_contentOffset->height + v9;
  }
  if (self->_info)
  {
    [(UISegment *)self _positionInfo];
  }
}

- (void)setRequestedScaleFactor:(double)a3
{
  if (self->_requestedScaleFactor != a3)
  {
    self->_requestedScaleFactor = a3;
    if (self->_info)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(UISegment *)self _positionInfo];
      }
    }
  }
}

unint64_t __28__UISegment_setObjectValue___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    unint64_t v4 = 0;
    *(void *)&long long v3 = 138412290;
    long long v9 = v3;
    do
    {
      double v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4, v9);
      if ([v5 isActive])
      {
        if (os_variant_has_internal_diagnostics())
        {
          double v8 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v9;
            double v11 = v5;
            _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "This is a UIKit bug. Constraint should have been deactivated when baseline view was removed from superview. cn = %@", buf, 0xCu);
          }
        }
        else
        {
          double v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &__segmentedControlIdiomsToStyleProviders_block_invoke___s_category)+ 8);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v9;
            double v11 = v5;
            _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "This is a UIKit bug. Constraint should have been deactivated when baseline view was removed from superview. cn = %@", buf, 0xCu);
          }
        }
      }
      if ([v5 isActive])
      {
        [v5 _containerGeometryDidChange];
      }
      else
      {
        int v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v4];
        [v6 addConstraint:v5];
      }
      ++v4;
      unint64_t result = [*(id *)(a1 + 32) count];
    }
    while (v4 < result);
  }
  return result;
}

- (void)_forceInfoDisplay
{
  [(UISegment *)self _updateBackgroundAndContentViews];
  id v3 = [(UIView *)self->_info layer];
  [v3 displayIfNeeded];
}

uint64_t __24__UISegment__effectView__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = 40;
  if ((*(_DWORD *)(v1 + 624) & 4) == 0) {
    uint64_t v2 = 48;
  }
  return [*(id *)(v1 + 552) setEffect:*(void *)(a1 + v2)];
}

void __33__UISegment__floatingContentView__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setFocusedSizeIncrease:4.0];
  [*(id *)(a1 + 32) setShadowRadius:16.0];
  objc_msgSend(*(id *)(a1 + 32), "setShadowExpansion:", 35.0, 25.0);
  id v2 = [*(id *)(a1 + 32) focusAnimationConfiguration];
  [v2 setUnfocusingBaseDuration:0.1];
}

- (void)_updateFloatingContentControlState:(unint64_t)a3 context:(id)a4 withAnimationCoordinator:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v13 = a5;
  long long v9 = [(UISegment *)self _segmentedControlClass];
  double v10 = [(UIView *)self traitCollection];
  double v11 = UISegmentedControlStyleProviderForIdiom(v9, [v10 userInterfaceIdiom]);

  if ([v11 useTVStyleFocusSelection])
  {
    infoContentView = self->_infoContentView;
    if (infoContentView)
    {
      if (v13) {
        [(_UISegmentedControlContentView *)infoContentView setControlState:a3 withAnimationCoordinator:v13];
      }
      else {
        [(_UISegmentedControlContentView *)infoContentView setControlState:a3 animated:v6];
      }
    }
  }
}

- (id)parentFocusEnvironment
{
  id v2 = [(UISegment *)self _parentSegmentedControl];
  id v3 = [v2 _internalFocusSystem];

  return v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UISegment;
  [(UIView *)&v17 didUpdateFocusInContext:v6 withAnimationCoordinator:v7];
  double v8 = [(UIView *)self traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  double v10 = UISegmentedControlStyleProviderForIdiom([(UISegment *)self _segmentedControlClass], v9);
  double v11 = v10;
  if (v9 == 3 || [v10 useTVStyleFocusSelection])
  {
    if ([v11 useTVStyleFocusSelection])
    {
      uint64_t v12 = [v6 nextFocusedItem];
      if (v12 == self)
      {
      }
      else
      {
        id v13 = v12;
        BOOL v14 = [(UISegment *)self isHighlighted];

        if (v14) {
          [(UISegment *)self setHighlighted:0];
        }
      }
      id v15 = [v6 nextFocusedItem];
      uint64_t v16 = 8 * (v15 == self);

      [(UISegment *)self _updateFloatingContentControlState:v16 context:v6 withAnimationCoordinator:v7 animated:1];
    }
    [(UISegment *)self _updateTextColors];
    [(UISegment *)self _updateBackgroundAndContentViews];
  }
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6 = a4;
  id v7 = -[UISegment _floatingContentView]((id *)&self->super.super.super.super.isa);

  if (v7)
  {
    double v8 = -[UISegment _floatingContentView]((id *)&self->super.super.super.super.isa);
    uint64_t v9 = [v8 _preferredConfigurationForFocusAnimation:a3 inContext:v6];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UISegment;
    uint64_t v9 = [(UIView *)&v11 _preferredConfigurationForFocusAnimation:a3 inContext:v6];
  }

  return v9;
}

- (id)focusEffect
{
  id v3 = [(UISegment *)self _parentSegmentedControl];
  unint64_t v4 = objc_opt_class();
  double v5 = [(UIView *)self traitCollection];
  objc_msgSend(v4, "_cornerRadiusForTraitCollection:size:", v5, -[UISegment controlSize](self, "controlSize"));
  double v7 = v6;

  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [v3 layer];
  objc_super v17 = [v16 cornerCurve];
  CATransform3D v18 = +[UIFocusHaloEffect effectWithRoundedRect:cornerRadius:curve:](UIFocusHaloEffect, "effectWithRoundedRect:cornerRadius:curve:", v17, v9, v11, v13, v15, v7);

  [v18 setReferenceView:v3];
  return v18;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5 = a4;
  double v6 = self;
  double v7 = v6;
  if (v6)
  {
    double v8 = v6;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v9 = [(UIView *)v8 superview];

      double v8 = (UISegment *)v9;
      if (!v9) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    double v8 = v7;
  }

  return v8;
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  unint64_t v4 = self;
  id v5 = v4;
  if (v4)
  {
    double v6 = v4;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v7 = [(UIView *)v6 superview];

      double v6 = (UISegment *)v7;
      if (!v7) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    double v6 = v5;
  }
  return v6;
}

- (BOOL)useBlockyMagnificationInClassic
{
  return 0;
}

- (id)viewForLastBaselineLayout
{
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x800) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)UISegment;
    id v2 = [(UIView *)&v4 viewForLastBaselineLayout];
  }
  else
  {
    id v2 = self->_info;
  }
  return v2;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double height = a3.height;
  [(UIView *)self->_info sizeThatFits:a3.width];
  -[UIView _baselineOffsetsAtSize:](self->_info, "_baselineOffsetsAtSize:");
  double v6 = v5;
  uint64_t v7 = [(_UISegmentedControlAppearanceStorage *)self->_appearanceStorage contentPositionOffsetForSegment:(((unint64_t)self->_segmentFlags >> 6) & 7) + 1 inMiniBar:0];
  double v8 = v7;
  if (v7) {
    [v7 UIOffsetValue];
  }
  UIRoundToViewScale(self);
  double v10 = v9;
  [(UIView *)self->_info alignmentRectInsets];
  double v12 = v6 + v10 + v11;

  double v13 = v12;
  double v14 = height - v12;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (NSArray)_infoConstraints
{
  return self->_infoConstraints;
}

- (void)_setInfoConstraints:(id)a3
{
}

- (UIAction)action
{
  return self->_action;
}

- (double)requestedScaleFactor
{
  return self->_requestedScaleFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_infoConstraints, 0);
  objc_storeStrong(&self->_objectValue, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_badgeValue, 0);
  objc_storeStrong((id *)&self->_infoContentView, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_bezelView, 0);
  objc_storeStrong((id *)&self->_selectionImageView, 0);
  objc_storeStrong((id *)&self->_selectionIndicatorView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end