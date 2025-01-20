@interface _TVStackingPosterView
- (BOOL)configuresForCollectionViewCell;
- (BOOL)isHighlighted;
- (CGPoint)focusDirection;
- (CGSize)maxBoundsSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)components;
- (NSArray)filteredComponents;
- (NSArray)marqueeLabels;
- (NSArray)visibleLabelWidths;
- (TVCellMetrics)_cellMetricsForMaxSize:(SEL)a3;
- (TVCellMetrics)cellMetrics;
- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3;
- (UIEdgeInsets)tv_alignmentInsetsForExpectedWidth:(double)a3;
- (UIView)mainImageComponent;
- (UIView)overlayView;
- (_TVAnimatedLabel)animatedLabel;
- (_TVStackingPosterView)initWithCoder:(id)a3;
- (_TVStackingPosterView)initWithFrame:(CGRect)a3;
- (double)_labelWidthForWidth:(double)a3 component:(id)a4 expansionAmount:(double)a5;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (void)_commonInit;
- (void)_configureSubviews;
- (void)_resetSubviews;
- (void)_updateComponentConstraints;
- (void)_updateShadowForLabel:(id)a3 inFocus:(BOOL)a4;
- (void)_updateSubviewHeirarchyWithComponents:(id)a3;
- (void)layoutSubviews;
- (void)setAnimatedLabel:(id)a3;
- (void)setCellMetrics:(TVCellMetrics *)a3;
- (void)setComponents:(id)a3;
- (void)setComponents:(id)a3 mainImageComponent:(id)a4;
- (void)setConfiguresForCollectionViewCell:(BOOL)a3;
- (void)setFilteredComponents:(id)a3;
- (void)setFocusDirection:(CGPoint)a3;
- (void)setFocusDirection:(CGPoint)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setMainImageComponent:(id)a3;
- (void)setMarqueeLabels:(id)a3;
- (void)setMaxBoundsSize:(CGSize)a3;
- (void)setNeedsUpdateComponentLayout;
- (void)setOverlayView:(id)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusUpdateContext:(id)a5 withAnimationCoordinator:(id)a6;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)setVisibleLabelWidths:(id)a3;
@end

@implementation _TVStackingPosterView

- (_TVStackingPosterView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVStackingPosterView;
  v3 = -[_TVStackingPosterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_TVStackingPosterView *)v3 _commonInit];
  }
  return v4;
}

- (_TVStackingPosterView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVStackingPosterView;
  v3 = [(_TVStackingPosterView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(_TVStackingPosterView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  id v3 = (id)objc_opt_new();
  [v3 setWantsDimmingOverlay:1];
  [(_TVStackingPosterView *)self _setIdleModeLayoutAttributes:v3];
}

- (void)setMaxBoundsSize:(CGSize)a3
{
  if (self->_maxBoundsSize.width != a3.width || self->_maxBoundsSize.height != a3.height)
  {
    self->_maxBoundsSize = a3;
    long long v4 = *MEMORY[0x263F1D1C0];
    long long v8 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5[2] = v8;
    memset(&v5[3], 0, 96);
    long long v6 = *MEMORY[0x263F001B0];
    long long v7 = v4;
    v5[0] = v6;
    v5[1] = v4;
    [(_TVStackingPosterView *)self setCellMetrics:v5];
  }
}

- (void)setComponents:(id)a3
{
}

- (void)setComponents:(id)a3 mainImageComponent:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = (NSArray *)[v6 copy];
  components = self->_components;
  self->_components = v8;

  [(_TVStackingPosterView *)self _resetSubviews];
  long long v10 = (double *)MEMORY[0x263F001B0];
  long long v11 = *MEMORY[0x263F001B0];
  long long v13 = *MEMORY[0x263F1D1C0];
  long long v12 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  memset(&v51[12], 0, 96);
  v51[9] = v11;
  v51[2] = v12;
  memset(&v51[3], 0, 96);
  v51[10] = v13;
  v51[11] = v12;
  v51[0] = v11;
  v51[1] = v13;
  [(_TVStackingPosterView *)self setCellMetrics:v51];
  v42 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  long long v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
  v41 = v15;
  if (!v16)
  {
    v43 = 0;
LABEL_37:

    goto LABEL_39;
  }
  uint64_t v17 = v16;
  v43 = 0;
  uint64_t v18 = *(void *)v48;
  double v19 = *v10;
  double v20 = v10[1];
  v40 = @"marquee-and-show-on-highlight";
  v21 = v42;
  v44 = v14;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v48 != v18) {
        objc_enumerationMutation(v15);
      }
      v23 = *(void **)(*((void *)&v47 + 1) + 8 * v22);
      if (!v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || [v23 conformsToProtocol:&unk_26E5AEAA8])
        {
          id v7 = v23;
          v32 = v14;
          id v33 = v7;
          goto LABEL_22;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_21;
      }
      id v24 = v23;
      v25 = [v24 valueForTVViewStyle:@"tv-text-highlight-style"];
      if ((objc_msgSend(v24, "tv_marqueeOnHighlight") & 1) == 0)
      {

        long long v14 = v44;
LABEL_21:
        v32 = v14;
        id v33 = v23;
LABEL_22:
        objc_msgSend(v32, "addObject:", v33, v40);
        goto LABEL_23;
      }
      if (!v43)
      {
        v26 = -[_TVAnimatedLabel initWithSize:]([_TVAnimatedLabel alloc], "initWithSize:", v19, v20);
        v27 = objc_msgSend(v24, "tv_layout");

        if (v27)
        {
          v28 = objc_msgSend(v24, "tv_layout");
          [(UIView *)v26 tv_setLayout:v28];
        }
        -[_TVLabel setNumberOfLines:](v26, "setNumberOfLines:", 1, v40);
        [(UIView *)v26 setValue:v25 forTVViewStyle:@"tv-text-highlight-style"];
        [(_TVLabel *)v26 setLineBreakMode:2];
        v29 = [v24 _defaultAttributes];
        v30 = (void *)[v29 copy];
        [(_TVAnimatedLabel *)v26 _setDefaultAttributes:v30];

        if ([v25 isEqualToString:@"marquee-on-highlight"])
        {
          v31 = [v24 highlightedTextColor];
          [(_TVAnimatedLabel *)v26 setHighlightedTextColor:v31];
        }
        else
        {
          [(_TVAnimatedLabel *)v26 setUnderPosterOutset:20.0];
        }
        if (([v25 isEqualToString:@"show-on-highlight"] & 1) != 0
          || [v25 isEqualToString:v40])
        {
          [(_TVStackingPosterView *)self _updateShadowForLabel:v26 inFocus:1];
          [(_TVAnimatedLabel *)v26 setHighlighted:1];
        }
        [v44 addObject:v26];
        v34 = objc_msgSend(v24, "tv_associatedIKViewElement");

        v43 = v26;
        if (v34)
        {
          v35 = objc_msgSend(v24, "tv_associatedIKViewElement");
          [(UIView *)v26 transferLayoutStylesFromElement:v35];
        }
        id v15 = v41;
        v21 = v42;
      }
      objc_msgSend(v21, "addObject:", v24, v40);

      long long v14 = v44;
LABEL_23:
      ++v22;
    }
    while (v17 != v22);
    uint64_t v36 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
    uint64_t v17 = v36;
  }
  while (v36);

  if (v43)
  {
    v37 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __58___TVStackingPosterView_setComponents_mainImageComponent___block_invoke;
    v45[3] = &unk_264BA79A0;
    id v46 = v37;
    id v15 = v37;
    [v21 enumerateObjectsUsingBlock:v45];
    v38 = (void *)[v15 copy];
    [(_TVAnimatedLabel *)v43 setAttributedStrings:v38];

    goto LABEL_37;
  }
  v43 = 0;
LABEL_39:
  -[_TVStackingPosterView setFilteredComponents:](self, "setFilteredComponents:", v14, v40);
  [(_TVStackingPosterView *)self setMainImageComponent:v7];
  [(_TVStackingPosterView *)self _updateFocusSizeIncrease];
  [(_TVStackingPosterView *)self setAnimatedLabel:v43];
  v39 = (void *)[v42 copy];
  [(_TVStackingPosterView *)self setMarqueeLabels:v39];
}

- (void)setOverlayView:(id)a3
{
  v5 = (UIView *)a3;
  overlayView = self->_overlayView;
  id v7 = v5;
  if (overlayView != v5)
  {
    [(UIView *)overlayView removeFromSuperview];
    objc_storeStrong((id *)&self->_overlayView, a3);
  }
  [(_TVStackingPosterView *)self setNeedsLayout];
}

- (void)setConfiguresForCollectionViewCell:(BOOL)a3
{
  if (self->_configuresForCollectionViewCell != a3)
  {
    self->_configuresForCollectionViewCell = a3;
    long long v4 = [(_TVStackingPosterView *)self components];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      [(_TVStackingPosterView *)self _resetSubviews];
      [(_TVStackingPosterView *)self setNeedsLayout];
    }
  }
}

- (TVCellMetrics)cellMetrics
{
  long long v4 = self + 4;
  if (self[4].cellSize.width == *MEMORY[0x263F001B0]
    && self[4].cellSize.height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    id v6 = self;
    [(TVCellMetrics *)self maxBoundsSize];
    if (v7 <= 0.0)
    {
      [(TVCellMetrics *)v6 bounds];
      double v8 = v10;
      double v9 = v11;
    }
    else
    {
      [(TVCellMetrics *)v6 maxBoundsSize];
    }
    self = (TVCellMetrics *)-[TVCellMetrics _cellMetricsForMaxSize:](v6, "_cellMetricsForMaxSize:", v8, v9);
    *(_OWORD *)&v4->cellInsetAlt.bottom = v22;
    *(_OWORD *)&v4->cellMargin.top = v23;
    *(_OWORD *)&v4->cellMargin.bottom = v24;
    *(_OWORD *)&v4->cellPadding.bottom = v18;
    *(_OWORD *)&v4->cellInset.top = v19;
    *(_OWORD *)&v4->cellInset.bottom = v20;
    *(_OWORD *)&v4->cellInsetAlt.top = v21;
    v4->cellSize = v16;
    *(_OWORD *)&v4->cellPadding.top = v17;
    v6[3].cellInset.top = v4->cellMargin.left + v4->cellMargin.right;
  }
  long long v12 = *(_OWORD *)&v4->cellMargin.top;
  *(_OWORD *)&retstr->cellInsetAlt.bottom = *(_OWORD *)&v4->cellInsetAlt.bottom;
  *(_OWORD *)&retstr->cellMargin.top = v12;
  *(_OWORD *)&retstr->cellMargin.bottom = *(_OWORD *)&v4->cellMargin.bottom;
  long long v13 = *(_OWORD *)&v4->cellInset.top;
  *(_OWORD *)&retstr->cellPadding.bottom = *(_OWORD *)&v4->cellPadding.bottom;
  *(_OWORD *)&retstr->cellInset.top = v13;
  long long v14 = *(_OWORD *)&v4->cellInsetAlt.top;
  *(_OWORD *)&retstr->cellInset.bottom = *(_OWORD *)&v4->cellInset.bottom;
  *(_OWORD *)&retstr->cellInsetAlt.top = v14;
  long long v15 = *(_OWORD *)&v4->cellPadding.top;
  retstr->cellSize = v4->cellSize;
  *(_OWORD *)&retstr->cellPadding.top = v15;
  return self;
}

- (void)setNeedsUpdateComponentLayout
{
  long long v3 = *MEMORY[0x263F001B0];
  long long v4 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  long long v22 = *MEMORY[0x263F1D1C0];
  long long v23 = v4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v21[9] = v3;
  v21[2] = v4;
  memset(&v21[3], 0, 96);
  v21[0] = v3;
  v21[1] = v22;
  [(_TVStackingPosterView *)self setCellMetrics:v21];
  uint64_t v5 = (void *)MEMORY[0x263EFF980];
  id v6 = [(_TVStackingPosterView *)self marqueeLabels];
  double v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  double v8 = [(_TVStackingPosterView *)self marqueeLabels];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __54___TVStackingPosterView_setNeedsUpdateComponentLayout__block_invoke;
  v19[3] = &unk_264BA79A0;
  id v20 = v7;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:v19];

  double v10 = [(_TVStackingPosterView *)self marqueeLabels];
  double v11 = [v10 firstObject];

  long long v12 = [(_TVStackingPosterView *)self animatedLabel];
  long long v13 = [v11 _defaultAttributes];
  long long v14 = (void *)[v13 copy];
  [v12 _setDefaultAttributes:v14];

  long long v15 = [(_TVStackingPosterView *)self animatedLabel];
  CGSize v16 = [v11 highlightedTextColor];
  [v15 setHighlightedTextColor:v16];

  long long v17 = [(_TVStackingPosterView *)self animatedLabel];
  long long v18 = (void *)[v9 copy];
  [v17 setAttributedStrings:v18];

  [(_TVStackingPosterView *)self _updateFocusSizeIncrease];
  [(_TVStackingPosterView *)self setNeedsLayout];
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6 = a4;
  double v7 = [(_TVStackingPosterView *)self mainImageComponent];
  double v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 _preferredConfigurationForFocusAnimation:a3 inContext:v6];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_TVStackingPosterView;
    uint64_t v9 = [(_TVStackingPosterView *)&v12 _preferredConfigurationForFocusAnimation:a3 inContext:v6];
  }
  double v10 = (void *)v9;

  return v10;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[_TVStackingPosterView _cellMetricsForMaxSize:](self, "_cellMetricsForMaxSize:", a3.width, a3.height);
  double v3 = v5;
  double v4 = v6;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  if (self->_requiresReconfiguration)
  {
    [(_TVStackingPosterView *)self _configureSubviews];
    self->_requiresReconfiguration = 0;
  }
  else
  {
    [(_TVStackingPosterView *)self _updateComponentConstraints];
  }
  v19.receiver = self;
  v19.super_class = (Class)_TVStackingPosterView;
  [(_TVStackingPosterView *)&v19 layoutSubviews];
  uint64_t v3 = [(_TVStackingPosterView *)self mainImageComponent];
  if (v3)
  {
    double v4 = (void *)v3;
    double v5 = [(_TVStackingPosterView *)self overlayView];

    if (v5)
    {
      [(_TVStackingPosterView *)self bounds];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      if (![(_TVStackingPosterView *)self configuresForCollectionViewCell])
      {
        [(_TVStackingPosterView *)self cellMetrics];
        double v7 = 0.0;
        double v9 = 0.0;
        double v11 = v11 - (0.0 + 0.0);
        double v13 = v13 - (0.0 + 0.0);
      }
      long long v14 = [(_TVStackingPosterView *)self overlayView];
      objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

      long long v15 = [(_TVStackingPosterView *)self overlayView];
      CGSize v16 = [v15 superview];

      if (v16 != self)
      {
        long long v17 = [(_TVStackingPosterView *)self overlayView];
        long long v18 = [(_TVStackingPosterView *)self mainImageComponent];
        [(_TVStackingPosterView *)self insertSubview:v17 above:v18];
      }
    }
  }
}

- (CGPoint)focusDirection
{
  if (objc_opt_respondsToSelector())
  {
    [(UIView *)self->_mainImageComponent focusDirection];
  }
  else
  {
    double v3 = *MEMORY[0x263F00148];
    double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setFocusDirection:(CGPoint)a3
{
}

- (void)setFocusDirection:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if (objc_opt_respondsToSelector())
  {
    mainImageComponent = self->_mainImageComponent;
    -[UIView setFocusDirection:animated:](mainImageComponent, "setFocusDirection:animated:", v4, x, y);
  }
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (objc_opt_respondsToSelector()) {
    [(UIView *)self->_mainImageComponent setPressed:v6 animated:v5 completion:v8];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    mainImageComponent = self->_mainImageComponent;
    [(UIView *)mainImageComponent setHighlighted:v3];
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusUpdateContext:(id)a5 withAnimationCoordinator:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v8)
  {
    if (!v7)
    {
      double v12 = [(_TVStackingPosterView *)self subviews];
      uint64_t v13 = [v12 count];

      if (!v13) {
        [(_TVStackingPosterView *)self layoutIfNeeded];
      }
    }
  }
  else
  {
    [(_TVStackingPosterView *)self bounds];
    if (CGRectEqualToRect(v41, *MEMORY[0x263F001A8])) {
      goto LABEL_27;
    }
  }
  long long v14 = [(_TVStackingPosterView *)self mainImageComponent];
  if ([v14 conformsToProtocol:&unk_26E5AEAA8])
  {
    long long v15 = [(_TVStackingPosterView *)self mainImageComponent];
  }
  else
  {
    long long v15 = 0;
  }

  if (v11) {
    [v15 setSelected:v8 animated:v7 withAnimationCoordinator:v11];
  }
  else {
    [v15 setSelected:v8 animated:v7];
  }
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke;
  v37[3] = &unk_264BA79C8;
  v37[4] = self;
  BOOL v39 = v8;
  BOOL v40 = v7;
  id v38 = v11;
  CGSize v16 = (void (**)(void))MEMORY[0x230FC9DC0](v37);
  v16[2]();
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_2;
  v32[3] = &unk_264BA79C8;
  id v17 = v15;
  id v33 = v17;
  v34 = self;
  BOOL v35 = v8;
  BOOL v36 = v7;
  long long v18 = (void (**)(void))MEMORY[0x230FC9DC0](v32);
  double v19 = 0.0;
  if (v7)
  {
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    double v19 = v8 ? 0.12 : 0.5;
    if (IsReduceMotionEnabled) {
      double v19 = 0.0;
    }
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_4;
  v29[3] = &unk_264BA7A18;
  v29[4] = self;
  BOOL v30 = v8;
  BOOL v31 = v7;
  *(double *)&v29[5] = v19;
  long long v21 = (void (**)(void))MEMORY[0x230FC9DC0](v29);
  if (v7)
  {
    long long v22 = (void *)MEMORY[0x263F1CB60];
    BOOL v23 = UIAccessibilityIsReduceMotionEnabled();
    double v24 = 0.12;
    if (!v8) {
      double v24 = 0.5;
    }
    if (v23) {
      double v25 = 0.0;
    }
    else {
      double v25 = v24;
    }
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_6;
    v26[3] = &unk_264BA7A40;
    long long v27 = v18;
    long long v28 = v21;
    [v22 animateWithDuration:327684 delay:v26 options:0 animations:v25 completion:0.0];
  }
  else
  {
    v18[2](v18);
    v21[2](v21);
  }

LABEL_27:
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
}

- (UIEdgeInsets)tv_alignmentInsetsForExpectedWidth:(double)a3
{
  -[_TVStackingPosterView _cellMetricsForMaxSize:](self, "_cellMetricsForMaxSize:", a3, 0.0);
  double v3 = v7;
  double v4 = v8;
  double v5 = v9;
  double v6 = v10;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(_TVStackingPosterView *)self mainImageComponent];
  int v7 = [v6 conformsToProtocol:&unk_26E5AEAA8];

  if (v7)
  {
    double v8 = [(_TVStackingPosterView *)self mainImageComponent];
    objc_msgSend(v8, "selectionMarginsForSize:", width, height);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    id v17 = [(_TVStackingPosterView *)self mainImageComponent];
    long long v18 = [v17 valueForTVViewStyle:@"tv-focus-align"];
    int v19 = [v18 isEqualToString:@"bottom"];

    if (v19)
    {
      double v20 = v10 + v14;
      double v21 = 0.0;
    }
    else
    {
      long long v22 = [(_TVStackingPosterView *)self mainImageComponent];
      BOOL v23 = [v22 valueForTVViewStyle:@"tv-focus-align"];
      int v24 = [v23 isEqualToString:@"top"];

      double v25 = -0.0;
      if (v24) {
        double v25 = v10;
      }
      double v21 = v14 + v25;
      double v20 = 0.0;
      if (!v24) {
        double v20 = v10;
      }
    }
  }
  else
  {
    double v20 = *MEMORY[0x263F1D1C0];
    double v12 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v21 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v16 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }
  double v26 = v12;
  double v27 = v16;
  result.right = v27;
  result.bottom = v21;
  result.left = v26;
  result.top = v20;
  return result;
}

- (void)_resetSubviews
{
  double v3 = [(_TVStackingPosterView *)self subviews];
  [v3 makeObjectsPerformSelector:sel_removeFromSuperview];

  double v4 = [(_TVStackingPosterView *)self constraints];
  [(_TVStackingPosterView *)self removeConstraints:v4];

  topAnchorConstraint = self->_topAnchorConstraint;
  self->_topAnchorConstraint = 0;

  bottomAnchorConstraint = self->_bottomAnchorConstraint;
  self->_bottomAnchorConstraint = 0;

  topImageConstraint = self->_topImageConstraint;
  self->_topImageConstraint = 0;

  bottomImageConstraint = self->_bottomImageConstraint;
  self->_bottomImageConstraint = 0;

  self->_topAnchorConstant = 0.0;
  self->_bottomAnchorConstant = 0.0;
  self->_topImageConstant = 0.0;
  self->_bottomImageConstant = 0.0;
  self->_requiresReconfiguration = 1;
}

- (void)_updateSubviewHeirarchyWithComponents:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(_TVStackingPosterView *)self subviews];
  double v6 = (void *)[v5 mutableCopy];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (([v4 containsObject:v12] & 1) == 0)
        {
          [v12 removeFromSuperview];
          [v7 removeObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63___TVStackingPosterView__updateSubviewHeirarchyWithComponents___block_invoke;
  v14[3] = &unk_264BA7A68;
  id v15 = v7;
  double v16 = self;
  id v13 = v7;
  [v4 enumerateObjectsWithOptions:2 usingBlock:v14];
}

- (void)_configureSubviews
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  double v3 = [(_TVStackingPosterView *)self filteredComponents];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return;
  }
  double v5 = [(_TVStackingPosterView *)self filteredComponents];
  id v6 = [(_TVStackingPosterView *)self mainImageComponent];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v81 = 0u;
  [(_TVStackingPosterView *)self cellMetrics];
  BOOL v71 = [(_TVStackingPosterView *)self configuresForCollectionViewCell];
  double v73 = *(double *)&v81;
  v68 = [MEMORY[0x263EFF980] array];
  double labelWidthExpansionAmount = self->_labelWidthExpansionAmount;
  [(_TVStackingPosterView *)self _updateSubviewHeirarchyWithComponents:v5];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = v5;
  uint64_t v76 = [obj countByEnumeratingWithState:&v77 objects:v94 count:16];
  id v7 = 0;
  if (!v76)
  {
    id v74 = 0;
    id v69 = 0;
    goto LABEL_33;
  }
  id v74 = 0;
  id v69 = 0;
  double v8 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  uint64_t v75 = *(void *)v78;
  double v9 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v76; ++i)
    {
      if (*(void *)v78 != v75) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(*((void *)&v77 + 1) + 8 * i);
      if (v11 == v6)
      {
        id v12 = v6;
        objc_msgSend(v12, "tv_margin");
        double v14 = v33;
        double v18 = v34;
        double v32 = 0.0;
        if (v71) {
          double v35 = 0.0;
        }
        else {
          double v35 = -(*((double *)&v82 + 1) + *((double *)&v83 + 1));
        }
        double v27 = [MEMORY[0x263F08938] constraintWithItem:v12 attribute:7 relatedBy:0 toItem:self attribute:7 multiplier:1.0 constant:v35];
        BOOL v36 = [MEMORY[0x263F08938] constraintWithItem:v12 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
        v93[0] = v27;
        v93[1] = v36;
        v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:2];
        [(_TVStackingPosterView *)self addConstraints:v37];
      }
      else
      {
        id v12 = v11;
        objc_msgSend(v12, "tv_margin");
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v21 = v73 - (v15 + v19);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v22 = objc_msgSend(v12, "tv_showOnHighlight");
          char v23 = v22;
          double v24 = 0.0;
          if (!v22) {
            double v24 = 1.0;
          }
          [v12 setAlpha:v24];
          [(_TVStackingPosterView *)self _labelWidthForWidth:v12 component:v21 expansionAmount:labelWidthExpansionAmount];
          double v26 = v25;
          double v27 = [MEMORY[0x263F08938] constraintWithItem:v12 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v25];
          if ((v23 & 1) == 0) {
            [v68 addObject:v27];
          }
          id v28 = v12;
          objc_msgSend(v28, "tv_textSizeForWidth:", v26);
          double v30 = v29;
          BOOL v31 = [v28 layer];

          [v31 setZPosition:901.0];
          double v32 = 8.0;
        }
        else
        {
          objc_msgSend(v12, "sizeThatFits:", v21, 3.40282347e38);
          double v30 = v38;
          double v27 = [MEMORY[0x263F08938] constraintWithItem:v12 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v21];
          double v32 = 0.0;
        }
        BOOL v36 = [MEMORY[0x263F08938] constraintWithItem:v12 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v30 + v32 * 2.0];
        v37 = [MEMORY[0x263F08938] constraintWithItem:v12 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:v16 - v20];
        v92[0] = v27;
        v92[1] = v36;
        v92[2] = v37;
        BOOL v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:3];
        [(_TVStackingPosterView *)self addConstraints:v39];
      }
      if (v12)
      {
        if (v7)
        {
          BOOL v40 = objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 3, 0, v7, 4, 1.0, fmax(v14, v8) - v9 - v32);
          [(_TVStackingPosterView *)self addConstraint:v40];
          if (v12 == v6)
          {
            v42 = v69;
            id v43 = v74;
            id v69 = v40;
            goto LABEL_26;
          }
          id v41 = v74;
          v42 = v74;
          id v43 = v40;
          if (v7 == v6)
          {
LABEL_26:
            id v44 = v40;

            id v41 = v43;
          }
          id v74 = v41;
        }
        id v45 = v12;

        id v7 = v45;
        double v9 = v32;
        double v8 = v18;
      }
    }
    uint64_t v76 = [obj countByEnumeratingWithState:&v77 objects:v94 count:16];
  }
  while (v76);
LABEL_33:

  if (v6)
  {
    [(_TVStackingPosterView *)self bringSubviewToFront:v6];
    double v46 = *(double *)&v82;
    if (v71)
    {
      double v46 = 0.0;
      double v47 = 0.0;
    }
    else
    {
      double v47 = -*(double *)&v83;
    }
    long long v48 = [MEMORY[0x263F08938] constraintWithItem:v6 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v46];
    topImageConstraint = self->_topImageConstraint;
    self->_topImageConstraint = v48;

    long long v50 = [MEMORY[0x263F08938] constraintWithItem:v6 attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:v47];
    bottomImageConstraint = self->_bottomImageConstraint;
    self->_bottomImageConstraint = v50;

    v52 = self->_bottomImageConstraint;
    v91[0] = self->_topImageConstraint;
    v91[1] = v52;
    uint64_t v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v91 count:2];
    [(_TVStackingPosterView *)self addConstraints:v53];

    v54 = v69;
    objc_storeStrong((id *)&self->_topAnchorConstraint, v69);
    v55 = v74;
    objc_storeStrong((id *)&self->_bottomAnchorConstraint, v74);
    [(NSLayoutConstraint *)self->_topImageConstraint constant];
    self->_topImageConstant = v56;
    [(NSLayoutConstraint *)self->_bottomImageConstraint constant];
    self->_bottomImageConstant = v57;
    [v69 constant];
    self->_topAnchorConstant = v58;
    [v74 constant];
    self->_bottomAnchorConstant = v59;
    v60 = v68;
    v61 = objc_msgSend(v68, "tv_arrayByMappingObjectsUsingBlock:", &__block_literal_global_27);
    [(_TVStackingPosterView *)self setVisibleLabelWidths:v61];

    v62 = v68;
    labelWidthConstraints = self->_labelWidthConstraints;
    self->_labelWidthConstraints = v62;
  }
  else
  {
    v64 = [(_TVStackingPosterView *)self subviews];
    labelWidthConstraints = [v64 firstObject];

    objc_msgSend(labelWidthConstraints, "tv_margin");
    v66 = [MEMORY[0x263F08938] constraintWithItem:labelWidthConstraints attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v65];
    v90 = v66;
    v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v90 count:1];
    [(_TVStackingPosterView *)self addConstraints:v67];

    v60 = v68;
    v54 = v69;
    v55 = v74;
  }
}

- (void)_updateComponentConstraints
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  double v3 = [(_TVStackingPosterView *)self constraints];
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __52___TVStackingPosterView__updateComponentConstraints__block_invoke;
  v75[3] = &unk_264BA7AB0;
  id v45 = v3;
  id v76 = v45;
  uint64_t v4 = (void (**)(void, void, void, void))MEMORY[0x230FC9DC0](v75);
  double v5 = (double *)MEMORY[0x263F1D1C0];
  long long v6 = *MEMORY[0x263F1D1C0];
  long long v68 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v59 = v68;
  long long v60 = 0u;
  long long v7 = *MEMORY[0x263F001B0];
  long long v65 = 0u;
  long long v66 = v7;
  long long v67 = v6;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v57 = v7;
  long long v58 = v6;
  [(_TVStackingPosterView *)self setCellMetrics:&v57];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v57 = 0u;
  [(_TVStackingPosterView *)self cellMetrics];
  double v50 = *(double *)&v57;
  double v8 = (void *)MEMORY[0x263EFF980];
  double v9 = [(_TVStackingPosterView *)self visibleLabelWidths];
  double v46 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [(_TVStackingPosterView *)self filteredComponents];
  uint64_t v10 = [obj countByEnumeratingWithState:&v53 objects:v77 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    double v13 = v5[2];
    uint64_t v51 = *(void *)v54;
    double v47 = *v5;
    double v52 = 0.0;
    double v48 = v13;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v54 != v51) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        double v16 = [(_TVStackingPosterView *)self mainImageComponent];

        if (v15 == v16)
        {
          BOOL v31 = [(_TVStackingPosterView *)self configuresForCollectionViewCell];
          double v30 = 0.0;
          if (v31) {
            double v32 = 0.0;
          }
          else {
            double v32 = -(*((double *)&v58 + 1) + *((double *)&v59 + 1));
          }
          if (v31) {
            double v33 = 0.0;
          }
          else {
            double v33 = *(double *)&v58;
          }
          if (v31) {
            double v34 = 0.0;
          }
          else {
            double v34 = -*(double *)&v59;
          }
          double v35 = ((void (**)(void, void *, _TVStackingPosterView *, uint64_t))v4)[2](v4, v15, self, 7);
          [v35 setConstant:v32];
          BOOL v36 = ((void (**)(void, void *, _TVStackingPosterView *, uint64_t))v4)[2](v4, v15, self, 3);
          [v36 setConstant:v33];
          v37 = ((void (**)(void, void *, _TVStackingPosterView *, uint64_t))v4)[2](v4, v15, self, 4);
          [v37 setConstant:v34];
          double v18 = v47;
          double v22 = v48;
        }
        else
        {
          objc_msgSend(v15, "tv_margin");
          double v18 = v17;
          double v20 = v19;
          double v22 = v21;
          double v24 = v23;
          double v25 = v50 - (v19 + v23);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(_TVStackingPosterView *)self _labelWidthForWidth:v15 component:v25 expansionAmount:self->_labelWidthExpansionAmount];
            double v25 = v26;
            if ((objc_msgSend(v15, "tv_showOnHighlight") & 1) == 0)
            {
              double v27 = [NSNumber numberWithDouble:v25];
              [v46 addObject:v27];
            }
            objc_msgSend(v15, "tv_textSizeForWidth:", v25);
            double v29 = v28;
            double v30 = 8.0;
          }
          else
          {
            objc_msgSend(v15, "sizeThatFits:", v25, 3.40282347e38);
            double v29 = v38;
            double v30 = 0.0;
          }
          double v35 = ((void (**)(void, void *, void, uint64_t))v4)[2](v4, v15, 0, 7);
          [v35 setConstant:v25];
          BOOL v36 = ((void (**)(void, void *, void, uint64_t))v4)[2](v4, v15, 0, 8);
          [v36 setConstant:v29 + v30 * 2.0];
          v37 = ((void (**)(void, void *, _TVStackingPosterView *, uint64_t))v4)[2](v4, v15, self, 9);
          [v37 setConstant:v20 - v24];
        }

        if (v15)
        {
          if (v12)
          {
            BOOL v39 = ((void (**)(void, void *, void *, uint64_t))v4)[2](v4, v15, v12, 3);
            objc_msgSend(v39, "setConstant:", fmax(v18, v13) - v52 - v30);
          }
          id v40 = v15;

          double v52 = v30;
          id v12 = v40;
          double v13 = v22;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v53 objects:v77 count:16];
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
  }

  [(NSLayoutConstraint *)self->_topImageConstraint constant];
  self->_topImageConstant = v41;
  [(NSLayoutConstraint *)self->_bottomImageConstraint constant];
  self->_bottomImageConstant = v42;
  [(NSLayoutConstraint *)self->_topAnchorConstraint constant];
  self->_topAnchorConstant = v43;
  [(NSLayoutConstraint *)self->_bottomAnchorConstraint constant];
  self->_bottomAnchorConstant = v44;
  [(_TVStackingPosterView *)self setVisibleLabelWidths:v46];
}

- (TVCellMetrics)_cellMetricsForMaxSize:(SEL)a3
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v153 = *MEMORY[0x263EF8340];
  double v5 = [(_TVStackingPosterView *)self filteredComponents];
  long long v6 = [(_TVStackingPosterView *)self mainImageComponent];
  uint64_t v7 = MEMORY[0x263F1D1C0];
  double v8 = *MEMORY[0x263F1D1C0];
  double v9 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  uint64_t v10 = (double *)MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v112 = v11;
  double v110 = v12;
  double v117 = *MEMORY[0x263F1D1C0];
  if ([v6 conformsToProtocol:&unk_26E5AEAA8])
  {
    objc_msgSend(v6, "selectionMarginsForSize:", v12, v11);
    double v14 = v13;
    double v107 = v16;
    double v108 = v15;
    double v18 = v17;
    double v19 = [v6 valueForTVViewStyle:@"tv-focus-align"];
    int v20 = [v19 isEqualToString:@"bottom"];

    if (v20)
    {
      double v101 = v14 + v18;
      CGFloat v102 = 0.0;
    }
    else
    {
      double v21 = [v6 valueForTVViewStyle:@"tv-focus-align"];
      int v22 = [v21 isEqualToString:@"top"];

      double v23 = -0.0;
      if (v22) {
        double v23 = v14;
      }
      double v24 = v18 + v23;
      double v25 = 0.0;
      if (!v22) {
        double v25 = v14;
      }
      double v101 = v25;
      CGFloat v102 = v24;
    }
  }
  else
  {
    double v107 = *(double *)(v7 + 24);
    double v108 = *(double *)(v7 + 8);
    double v101 = v8;
    CGFloat v102 = v9;
  }
  [(UIView *)self tv_padding];
  double v104 = v29;
  double v105 = v28;
  double v30 = v26 + v27;
  BOOL v31 = v26 + v27 < width;
  if (v26 + v27 >= width) {
    double v27 = 0.0;
  }
  double v111 = v27;
  if (!v31) {
    double v26 = 0.0;
  }
  double v113 = v26;
  if (v31) {
    double v32 = v30;
  }
  else {
    double v32 = 0.0;
  }
  double v33 = [(_TVStackingPosterView *)self mainImageComponent];
  double v34 = (double *)MEMORY[0x263F001B0];
  double v35 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v36 = width - v32;

  if (v33)
  {
    double v37 = *v34;
    objc_msgSend(v6, "tv_sizeThatFits:", *v34, v35);
    double v40 = v39;
    double v41 = v38;
    if (v39 == v37 && v38 == v35)
    {
      [v6 frame];
      double v40 = v43;
      double v41 = v44;
    }
    if (v40 > v36 || v41 > height)
    {
      double v46 = v36 / v40;
      double v47 = 1.0;
      if (v36 <= 0.0) {
        double v46 = 1.0;
      }
      if (height > 0.0) {
        double v47 = height / v41;
      }
      double v48 = fmin(v46, v47);
      double v40 = floor(v40 * v48);
      double v41 = floor(v41 * v48);
    }
    objc_msgSend(v6, "tv_margin");
    double v116 = v51;
    double v117 = v50;
    double v53 = v52;
    if (v36 == 0.0)
    {
      double v55 = v40;
    }
    else
    {
      double v54 = v49;
      if ([(_TVStackingPosterView *)self configuresForCollectionViewCell])
      {
        double v49 = v54;
        double v55 = v36 - (v54 + v53);
        if (v40 <= 0.0) {
          double v41 = 0.0;
        }
        else {
          double v41 = floor(v41 * (v55 / v40));
        }
      }
      else
      {
        double v55 = v40;
        double v49 = v54;
      }
    }
    double v103 = v49;
    double v110 = v55;
    double v56 = v49 + v53 + v55;
    double v112 = v41;
    double v35 = v41;
  }
  else
  {
    double v56 = width - v32;
    double v103 = *v10;
    double v116 = v9;
  }
  BOOL v57 = v6 != 0;
  v114 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  id v58 = v5;
  uint64_t v59 = [v58 countByEnumeratingWithState:&v148 objects:v152 count:16];
  double v60 = v10[1];
  if (v59)
  {
    uint64_t v61 = 0;
    uint64_t v62 = *(void *)v149;
    do
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v149 != v62) {
          objc_enumerationMutation(v58);
        }
        long long v64 = *(void **)(*((void *)&v148 + 1) + 8 * i);
        if (v64 == v6)
        {
          BOOL v57 = 0;
          double v82 = fmax(v9, v117);
          double v9 = v116;
          double v83 = v82;
        }
        else
        {
          objc_msgSend(*(id *)(*((void *)&v148 + 1) + 8 * i), "tv_margin");
          double v66 = v65;
          double v68 = v67;
          double v70 = v69;
          double v72 = v71;
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          double v74 = v56 - (v68 + v72);
          if (isKindOfClass)
          {
            [(_TVStackingPosterView *)self _labelWidthForWidth:v64 component:v74 expansionAmount:v107 + v108];
            double v76 = v75;
            id v77 = v64;
            objc_msgSend(v77, "tv_textSizeForWidth:", v76);
            double v79 = v78;
            long long v80 = [NSNumber numberWithDouble:v78];
            long long v81 = [NSNumber numberWithInteger:v61 + i];
            [v114 setObject:v80 forKeyedSubscript:v81];
          }
          else
          {
            objc_msgSend(v64, "sizeThatFits:", v74, 3.40282347e38);
            double v79 = v84;
          }
          double v83 = fmax(v9, v66) + v79;
          double v82 = -0.0;
          if (v57) {
            double v82 = v83;
          }
          double v9 = v70;
        }
        double v60 = v60 + v82;
        double v35 = v35 + v83;
      }
      uint64_t v59 = [v58 countByEnumeratingWithState:&v148 objects:v152 count:16];
      v61 += i;
    }
    while (v59);
  }

  double v85 = v105 + v104 + v9 + v35;
  double v86 = v113 + v103;
  double v87 = v85 - height;
  if (v85 > height && v87 < v112)
  {
    double v89 = floor(v110 / v112 * (v112 - v87));
    double v86 = v86 + floor((v110 - v89) * 0.5);
    double v85 = v85 - v87;
    double v112 = v112 - v87;
    double v110 = v89;
  }
  uint64_t v140 = 0;
  v141 = &v140;
  uint64_t v142 = 0x4010000000;
  v143 = &unk_230C43B61;
  double v144 = v105;
  double v145 = v113;
  double v146 = v104;
  double v147 = v111;
  uint64_t v132 = 0;
  v133 = &v132;
  uint64_t v134 = 0x4010000000;
  v135 = &unk_230C43B61;
  double v136 = v105;
  double v137 = v113;
  double v138 = v104;
  double v139 = v111;
  v125[0] = MEMORY[0x263EF8330];
  v125[1] = 3221225472;
  v125[2] = __48___TVStackingPosterView__cellMetricsForMaxSize___block_invoke;
  v125[3] = &unk_264BA7AD8;
  double v131 = v56;
  v129 = &v132;
  v130 = &v140;
  id v90 = v6;
  id v126 = v90;
  id v91 = v58;
  id v127 = v91;
  id v92 = v114;
  id v128 = v92;
  [v91 enumerateObjectsUsingBlock:v125];
  v118[0] = MEMORY[0x263EF8330];
  v118[1] = 3221225472;
  v118[2] = __48___TVStackingPosterView__cellMetricsForMaxSize___block_invoke_2;
  v118[3] = &unk_264BA7B00;
  double v124 = v56;
  id v93 = v91;
  id v119 = v93;
  v122 = &v132;
  v123 = &v140;
  id v94 = v90;
  id v120 = v94;
  id v95 = v92;
  id v121 = v95;
  [v93 enumerateObjectsWithOptions:2 usingBlock:v118];
  double v96 = v113 + v111 + v56;
  retstr->cellSize.double width = v96;
  retstr->cellSize.double height = v85;
  if (v6)
  {
    retstr->cellPadding.top = v105 + v60;
    retstr->cellPadding.left = v86;
    retstr->cellPadding.bottom = v85 - (v105 + v60 + v112);
    retstr->cellPadding.right = v96 - (v110 + v86);
  }
  else
  {
    long long v97 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
    *(_OWORD *)&retstr->cellPadding.top = *MEMORY[0x263F1D1C0];
    *(_OWORD *)&retstr->cellPadding.bottom = v97;
  }
  long long v98 = *((_OWORD *)v141 + 3);
  *(_OWORD *)&retstr->cellInset.top = *((_OWORD *)v141 + 2);
  *(_OWORD *)&retstr->cellInset.bottom = v98;
  long long v99 = *((_OWORD *)v133 + 3);
  *(_OWORD *)&retstr->cellInsetAlt.top = *((_OWORD *)v133 + 2);
  *(_OWORD *)&retstr->cellInsetAlt.bottom = v99;
  retstr->cellMargin.top = v101;
  retstr->cellMargin.left = v108;
  retstr->cellMargin.bottom = v102;
  retstr->cellMargin.right = v107;

  _Block_object_dispose(&v132, 8);
  _Block_object_dispose(&v140, 8);

  return result;
}

- (double)_labelWidthForWidth:(double)a3 component:(id)a4 expansionAmount:(double)a5
{
  id v7 = a4;
  if (objc_msgSend(v7, "tv_showOnHighlight"))
  {
    int v8 = objc_msgSend(v7, "tv_marqueeOnHighlight");
    double v9 = 40.0;
    if (!v8) {
      double v9 = 0.0;
    }
    a3 = v9 + a5 + a3;
  }

  return a3;
}

- (void)_updateShadowForLabel:(id)a3 inFocus:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v11 = v5;
  if (v4)
  {
    if (!_updateShadowForLabel_inFocus____ShadowColor)
    {
      uint64_t v6 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.4];
      id v7 = (void *)_updateShadowForLabel_inFocus____ShadowColor;
      _updateShadowForLabel_inFocus____ShadowColor = v6;

      id v5 = v11;
    }
    objc_msgSend(v5, "setShadowColor:");
    double v8 = 2.0;
    double v9 = 0.0;
    double v10 = 6.0;
  }
  else
  {
    [v5 setShadowColor:0];
    double v9 = *MEMORY[0x263F001B0];
    double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v10 = 0.0;
  }
  objc_msgSend(v11, "setShadowOffset:", v9, v8);
  [v11 setShadowBlur:v10];
}

- (CGSize)maxBoundsSize
{
  double width = self->_maxBoundsSize.width;
  double height = self->_maxBoundsSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSArray)components
{
  return self->_components;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (BOOL)configuresForCollectionViewCell
{
  return self->_configuresForCollectionViewCell;
}

- (void)setCellMetrics:(TVCellMetrics *)a3
{
  self->_cellMetrics.cellSize = a3->cellSize;
  long long v3 = *(_OWORD *)&a3->cellInset.bottom;
  long long v5 = *(_OWORD *)&a3->cellPadding.top;
  long long v4 = *(_OWORD *)&a3->cellPadding.bottom;
  *(_OWORD *)&self->_cellMetrics.cellInset.top = *(_OWORD *)&a3->cellInset.top;
  *(_OWORD *)&self->_cellMetrics.cellInset.bottom = v3;
  *(_OWORD *)&self->_cellMetrics.cellPadding.top = v5;
  *(_OWORD *)&self->_cellMetrics.cellPadding.bottom = v4;
  long long v6 = *(_OWORD *)&a3->cellMargin.bottom;
  long long v8 = *(_OWORD *)&a3->cellInsetAlt.top;
  long long v7 = *(_OWORD *)&a3->cellInsetAlt.bottom;
  *(_OWORD *)&self->_cellMetrics.cellMargin.top = *(_OWORD *)&a3->cellMargin.top;
  *(_OWORD *)&self->_cellMetrics.cellMargin.bottom = v6;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.top = v8;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.bottom = v7;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (NSArray)filteredComponents
{
  return self->_filteredComponents;
}

- (void)setFilteredComponents:(id)a3
{
}

- (UIView)mainImageComponent
{
  return self->_mainImageComponent;
}

- (void)setMainImageComponent:(id)a3
{
}

- (_TVAnimatedLabel)animatedLabel
{
  return self->_animatedLabel;
}

- (void)setAnimatedLabel:(id)a3
{
}

- (NSArray)marqueeLabels
{
  return self->_marqueeLabels;
}

- (void)setMarqueeLabels:(id)a3
{
}

- (NSArray)visibleLabelWidths
{
  return self->_visibleLabelWidths;
}

- (void)setVisibleLabelWidths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleLabelWidths, 0);
  objc_storeStrong((id *)&self->_marqueeLabels, 0);
  objc_storeStrong((id *)&self->_animatedLabel, 0);
  objc_storeStrong((id *)&self->_mainImageComponent, 0);
  objc_storeStrong((id *)&self->_filteredComponents, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_labelWidthConstraints, 0);
  objc_storeStrong((id *)&self->_bottomImageConstraint, 0);
  objc_storeStrong((id *)&self->_topImageConstraint, 0);
  objc_storeStrong((id *)&self->_bottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_topAnchorConstraint, 0);
}

@end