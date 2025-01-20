@interface TUIKeyPopupView
+ (int64_t)hitTestingMode;
- (BOOL)drawsBackground;
- (BOOL)drawsShadows;
- (BOOL)hasConstrainedBackground;
- (BOOL)highlightCellAtLocation:(CGPoint)a3;
- (BOOL)needsPopup;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldProvideDefaultSelection;
- (BOOL)wantsUserInteractionEnabled;
- (NSArray)subclassAdditionalConstraints;
- (NSMutableArray)arrangedVariantCells;
- (NSMutableArray)arrangedVariantRows;
- (TUIDrawingView)backgroundMaskView;
- (TUIDrawingView)borderView;
- (TUIKeyPopupDelegate)popupDelegate;
- (TUIKeyPopupView)initWithKey:(id)a3 renderTraits:(id)a4;
- (UIEdgeInsets)stackLayoutMargins;
- (UIKBRenderTraits)renderTraits;
- (UIKBTree)associatedTree;
- (UIKBTree)backingTree;
- (UIKBVisualEffectView)backdropView;
- (UILayoutGuide)baseKeyLayoutGuide;
- (UIStackView)variantView;
- (UIView)deepShadowView;
- (UIView)keyShadowView;
- (UIView)touchesForwardingView;
- (double)borderViewLineWidth;
- (double)itemSpacing;
- (double)roundRectRadius;
- (double)variantViewBottomSpacing;
- (id)alignmentConstraintsForKey:(id)a3;
- (id)backgroundBezierPath;
- (id)constraintsToMatchInnerView:(id)a3 toOuterView:(id)a4 withInsets:(UIEdgeInsets)a5;
- (id)constraintsToMatchView:(id)a3 toLayoutGuide:(id)a4 withInsets:(UIEdgeInsets)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)variantCellAtLocation:(CGPoint)a3;
- (int64_t)layoutStyle;
- (int64_t)variantViewAlignment;
- (unint64_t)indexOfHighlightedVariant;
- (unint64_t)maxRows;
- (unint64_t)maxVariantsPerRowForKey:(id)a3;
- (unint64_t)selectedVariant;
- (unint64_t)variantRowLimitForLayout;
- (unint64_t)variantViewRows;
- (void)_addShadowsAndBackgroundsIfNeeded;
- (void)finishVariantSelection;
- (void)layoutSubviews;
- (void)popupConstructorForKey:(id)a3;
- (void)setArrangedVariantCells:(id)a3;
- (void)setArrangedVariantRows:(id)a3;
- (void)setBackdropView:(id)a3;
- (void)setBackgroundMaskView:(id)a3;
- (void)setBackingTree:(id)a3;
- (void)setBorderView:(id)a3;
- (void)setDeepShadowView:(id)a3;
- (void)setHasConstrainedBackground:(BOOL)a3;
- (void)setInitialHighlight;
- (void)setKeyShadowView:(id)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setNeedsPopup:(BOOL)a3;
- (void)setPopupDelegate:(id)a3;
- (void)setRenderTraits:(id)a3;
- (void)setSubclassAdditionalConstraints:(id)a3;
- (void)setTouchesForwardingView:(id)a3;
- (void)setVariantView:(id)a3;
- (void)setVariantViewRows:(unint64_t)a3;
- (void)unhighlightAllViews;
- (void)updateBackgroundMaterialsForRenderConfig:(id)a3;
- (void)updateConstraints;
- (void)updateSelectorForPoint:(CGPoint)a3;
- (void)updateSelectorForTouch:(id)a3 event:(id)a4;
- (void)updateVariantViewPropertiesForKey:(id)a3 isNonVariantPaddle:(BOOL)a4;
- (void)updateVariantsIfNeededForKey:(id)a3;
@end

@implementation TUIKeyPopupView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subclassAdditionalConstraints, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_backgroundMaskView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_keyShadowView, 0);
  objc_storeStrong((id *)&self->_deepShadowView, 0);
  objc_storeStrong((id *)&self->_backingTree, 0);
  objc_storeStrong((id *)&self->_arrangedVariantCells, 0);
  objc_storeStrong((id *)&self->_arrangedVariantRows, 0);
  objc_storeStrong((id *)&self->_variantView, 0);
  objc_destroyWeak((id *)&self->_touchesForwardingView);
  objc_storeStrong((id *)&self->_baseKeyLayoutGuide, 0);
  objc_storeStrong((id *)&self->_renderTraits, 0);
  objc_destroyWeak((id *)&self->_popupDelegate);
}

- (void)setSubclassAdditionalConstraints:(id)a3
{
}

- (NSArray)subclassAdditionalConstraints
{
  return self->_subclassAdditionalConstraints;
}

- (void)setHasConstrainedBackground:(BOOL)a3
{
  self->_hasConstrainedBackground = a3;
}

- (BOOL)hasConstrainedBackground
{
  return self->_hasConstrainedBackground;
}

- (unint64_t)selectedVariant
{
  return self->_selectedVariant;
}

- (void)setBorderView:(id)a3
{
}

- (TUIDrawingView)borderView
{
  return self->_borderView;
}

- (void)setBackgroundMaskView:(id)a3
{
}

- (TUIDrawingView)backgroundMaskView
{
  return self->_backgroundMaskView;
}

- (void)setBackdropView:(id)a3
{
}

- (UIKBVisualEffectView)backdropView
{
  return self->_backdropView;
}

- (void)setKeyShadowView:(id)a3
{
}

- (UIView)keyShadowView
{
  return self->_keyShadowView;
}

- (void)setDeepShadowView:(id)a3
{
}

- (UIView)deepShadowView
{
  return self->_deepShadowView;
}

- (void)setBackingTree:(id)a3
{
}

- (UIKBTree)backingTree
{
  return self->_backingTree;
}

- (void)setArrangedVariantCells:(id)a3
{
}

- (NSMutableArray)arrangedVariantCells
{
  return self->_arrangedVariantCells;
}

- (void)setArrangedVariantRows:(id)a3
{
}

- (NSMutableArray)arrangedVariantRows
{
  return self->_arrangedVariantRows;
}

- (void)setVariantView:(id)a3
{
}

- (UIStackView)variantView
{
  return self->_variantView;
}

- (void)setNeedsPopup:(BOOL)a3
{
  self->_needsPopup = a3;
}

- (BOOL)needsPopup
{
  return self->_needsPopup;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setVariantViewRows:(unint64_t)a3
{
  self->_variantViewRows = a3;
}

- (unint64_t)variantViewRows
{
  return self->_variantViewRows;
}

- (void)setTouchesForwardingView:(id)a3
{
}

- (UIView)touchesForwardingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchesForwardingView);
  return (UIView *)WeakRetained;
}

- (UILayoutGuide)baseKeyLayoutGuide
{
  return self->_baseKeyLayoutGuide;
}

- (UIKBRenderTraits)renderTraits
{
  return self->_renderTraits;
}

- (void)setPopupDelegate:(id)a3
{
}

- (TUIKeyPopupDelegate)popupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popupDelegate);
  return (TUIKeyPopupDelegate *)WeakRetained;
}

- (void)updateVariantViewPropertiesForKey:(id)a3 isNonVariantPaddle:(BOOL)a4
{
  id v6 = a3;
  id v11 = v6;
  if (a4)
  {
    unint64_t v7 = 1;
  }
  else
  {
    unint64_t v8 = [(TUIKeyPopupView *)self maxVariantsPerRowForKey:v6];
    v9 = [v11 subtrees];
    unint64_t v10 = [v9 count];

    unint64_t v7 = vcvtps_u32_f32((float)v10 / (float)v8);
  }
  [(TUIKeyPopupView *)self setVariantViewRows:v7];
}

- (unint64_t)maxRows
{
  v2 = [(TUIKeyPopupView *)self associatedTree];
  int v3 = [v2 displayType];

  if (v3 == 27) {
    return 4;
  }
  else {
    return 2;
  }
}

- (unint64_t)maxVariantsPerRowForKey:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUIKeyPopupView *)self variantRowLimitForLayout];
  if (v4)
  {
    id v6 = [v4 subtrees];
    if ([v6 count] <= v5)
    {
LABEL_5:

      goto LABEL_6;
    }
    int64_t layoutStyle = self->_layoutStyle;

    if (layoutStyle == 1)
    {
      id v6 = [v4 subtrees];
      unint64_t v5 = vcvtpd_u64_f64((double)(unint64_t)[v6 count] / (double)-[TUIKeyPopupView maxRows](self, "maxRows"));
      goto LABEL_5;
    }
  }
LABEL_6:

  return v5;
}

- (unint64_t)variantRowLimitForLayout
{
  if (self->_layoutStyle != 1) {
    return 5;
  }
  v2 = [(TUIKeyPopupView *)self associatedTree];
  int v3 = [v2 displayType];

  if (v3 == 27) {
    return 6;
  }
  else {
    return 10;
  }
}

- (int64_t)variantViewAlignment
{
  return 3;
}

- (UIEdgeInsets)stackLayoutMargins
{
  double v2 = 0.0;
  double v3 = 10.0;
  double v4 = 0.0;
  double v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)borderViewLineWidth
{
  return 1.0;
}

- (BOOL)drawsShadows
{
  return 1;
}

- (BOOL)drawsBackground
{
  return 1;
}

- (id)constraintsToMatchInnerView:(id)a3 toOuterView:(id)a4 withInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  v26[4] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a3;
  v25 = [v11 topAnchor];
  v24 = [v10 topAnchor];
  v23 = [v25 constraintEqualToAnchor:v24 constant:top];
  v26[0] = v23;
  v12 = [v11 leadingAnchor];
  v13 = [v10 leadingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 constant:left];
  v26[1] = v14;
  v15 = [v10 bottomAnchor];
  v16 = [v11 bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:bottom];
  v26[2] = v17;
  v18 = [v10 trailingAnchor];

  v19 = [v11 trailingAnchor];

  v20 = [v18 constraintEqualToAnchor:v19 constant:right];
  v26[3] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];

  return v21;
}

- (id)constraintsToMatchView:(id)a3 toLayoutGuide:(id)a4 withInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  v26[4] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a3;
  v25 = [v11 topAnchor];
  v24 = [v10 topAnchor];
  v23 = [v25 constraintEqualToAnchor:v24 constant:top];
  v26[0] = v23;
  v12 = [v11 leadingAnchor];
  v13 = [v10 leadingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 constant:left];
  v26[1] = v14;
  v15 = [v10 bottomAnchor];
  v16 = [v11 bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:bottom];
  v26[2] = v17;
  v18 = [v10 trailingAnchor];

  v19 = [v11 trailingAnchor];

  v20 = [v18 constraintEqualToAnchor:v19 constant:right];
  v26[3] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];

  return v21;
}

- (double)roundRectRadius
{
  double v2 = [(TUIKeyPopupView *)self renderTraits];
  double v3 = [v2 geometry];
  [v3 roundRectRadius];
  double v5 = v4;

  return v5;
}

- (double)variantViewBottomSpacing
{
  return 4.0;
}

- (double)itemSpacing
{
  return 0.0;
}

- (BOOL)shouldProvideDefaultSelection
{
  return 1;
}

- (BOOL)wantsUserInteractionEnabled
{
  return 0;
}

- (BOOL)highlightCellAtLocation:(CGPoint)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v4 = -[TUIKeyPopupView variantCellAtLocation:](self, "variantCellAtLocation:", a3.x, a3.y);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v5 = [(TUIKeyPopupView *)self arrangedVariantCells];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) setHighlighted:*(void *)(*((void *)&v12 + 1) + 8 * i) == (void)v4];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    unint64_t v10 = [v4 indexNumber];
  }
  else
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  self->_selectedVariant = v10;

  return v4 != 0;
}

- (id)variantCellAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(TUIKeyPopupView *)self variantView];
  -[TUIKeyPopupView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  uint64_t v12 = [(id)objc_opt_class() hitTestingMode];
  if (v12 == 1)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v14 = [(TUIKeyPopupView *)self arrangedVariantCells];
    uint64_t v18 = [v14 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      id v3 = 0;
      uint64_t v20 = *(void *)v41;
      double v21 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(v14);
          }
          v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v24 = [v23 superview];
          [v23 center];
          double v26 = v25;
          double v28 = v27;
          v29 = [(TUIKeyPopupView *)self variantView];
          objc_msgSend(v24, "convertPoint:toView:", v29, v26, v28);

          UIDistanceBetweenPoints();
          if (v30 < v21)
          {
            double v31 = v30;
            id v32 = v23;

            id v3 = v32;
            double v21 = v31;
          }
        }
        uint64_t v19 = [v14 countByEnumeratingWithState:&v40 objects:v52 count:16];
      }
      while (v19);
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    if (v12) {
      goto LABEL_36;
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v13 = [(TUIKeyPopupView *)self arrangedVariantRows];
    id v14 = (id)[v13 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v49;
      while (2)
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v49 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
          [v17 frame];
          v57.double x = v9;
          v57.double y = v11;
          if (CGRectContainsPoint(v59, v57))
          {
            -[TUIKeyPopupView convertPoint:toView:](self, "convertPoint:toView:", v17, x, y);
            double x = v33;
            double y = v34;
            [v17 frame];
            UIRectGetCenter();
            id v14 = v17;
            goto LABEL_23;
          }
        }
        id v14 = (id)[v13 countByEnumeratingWithState:&v48 objects:v54 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_23:

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v35 = [v14 arrangedSubviews];
    id v3 = (id)[v35 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v3)
    {
      uint64_t v36 = *(void *)v45;
      while (2)
      {
        for (k = 0; k != v3; k = (char *)k + 1)
        {
          if (*(void *)v45 != v36) {
            objc_enumerationMutation(v35);
          }
          v38 = *(void **)(*((void *)&v44 + 1) + 8 * (void)k);
          [v38 frame];
          v58.double x = x;
          v58.double y = y;
          if (CGRectContainsPoint(v60, v58))
          {
            id v3 = v38;
            goto LABEL_33;
          }
        }
        id v3 = (id)[v35 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_33:
  }
LABEL_36:
  return v3;
}

- (void)setInitialHighlight
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(TUIKeyPopupView *)self arrangedVariantCells];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v5 = [(TUIKeyPopupView *)self arrangedVariantCells];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v9++) setHighlighted:0];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    self->_selectedVariant = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    self->_selectedVariant = 0x7FFFFFFFFFFFFFFFLL;
    double v10 = [(TUIKeyPopupView *)self arrangedVariantCells];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      unint64_t v12 = 0;
      do
      {
        long long v13 = [(TUIKeyPopupView *)self arrangedVariantCells];
        id v14 = [v13 objectAtIndex:v12];

        objc_msgSend(v14, "setHighlighted:", objc_msgSend(v14, "isPrimaryVariant"));
        if ([v14 isPrimaryVariant]) {
          self->_selectedVariant = [v14 indexNumber];
        }

        ++v12;
        uint64_t v15 = [(TUIKeyPopupView *)self arrangedVariantCells];
        unint64_t v16 = [v15 count];
      }
      while (v12 < v16);
    }
  }
}

- (void)unhighlightAllViews
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(TUIKeyPopupView *)self arrangedVariantCells];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setHighlighted:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  self->_selectedVariant = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)finishVariantSelection
{
  unint64_t v3 = [(TUIKeyPopupView *)self indexOfHighlightedVariant];
  backingTree = self->_backingTree;
  [(UIKBTree *)backingTree setSelectedVariantIndex:v3];
}

- (void)updateSelectorForTouch:(id)a3 event:(id)a4
{
  objc_msgSend(a3, "locationInView:", self, a4);
  -[TUIKeyPopupView highlightCellAtLocation:](self, "highlightCellAtLocation:");
}

- (void)updateSelectorForPoint:(CGPoint)a3
{
  -[TUIKeyPopupView highlightCellAtLocation:](self, "highlightCellAtLocation:", a3.x, a3.y);
  unint64_t v4 = [(TUIKeyPopupView *)self indexOfHighlightedVariant];
  backingTree = self->_backingTree;
  [(UIKBTree *)backingTree setSelectedVariantIndex:v4];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  [(TUIKeyPopupView *)self finishVariantSelection];
  return [(TUIKeyPopupView *)self touchesForwardingView];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TUIKeyPopupView;
  unsigned __int8 v8 = -[TUIKeyPopupView pointInside:withEvent:](&v13, sel_pointInside_withEvent_, v7, x, y);
  long long v9 = [(TUIKeyPopupView *)self backingTree];
  if ([v9 interactionType] != 9) {
    goto LABEL_4;
  }
  long long v10 = [(TUIKeyPopupView *)self backingTree];
  int v11 = [v10 state];

  if (v11 == 16)
  {
    long long v9 = [(TUIKeyPopupView *)self variantView];
    unsigned __int8 v8 = objc_msgSend(v9, "pointInside:withEvent:", v7, x, y);
LABEL_4:
  }
  return v8;
}

- (unint64_t)indexOfHighlightedVariant
{
  return self->_selectedVariant;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)TUIKeyPopupView;
  [(TUIKeyPopupView *)&v13 layoutSubviews];
  if ([(TUIKeyPopupView *)self layoutStyle] == 1 && [(TUIKeyPopupView *)self drawsShadows])
  {
    unint64_t v3 = [(TUIKeyPopupView *)self keyShadowView];
    [v3 bounds];
    CGPathRef v4 = CGPathCreateWithRoundedRect(v14, 6.0, 6.0, 0);
    uint64_t v5 = [(TUIKeyPopupView *)self keyShadowView];
    uint64_t v6 = [v5 layer];
    [v6 setShadowPath:v4];
  }
  if (self->_needsPopup)
  {
    id v7 = [(TUIKeyPopupView *)self backgroundBezierPath];
    if (v7)
    {
      if ([(TUIKeyPopupView *)self drawsBackground])
      {
        unsigned __int8 v8 = [(TUIKeyPopupView *)self backgroundMaskView];
        [v8 setPath:v7];

        long long v9 = [(TUIKeyPopupView *)self borderView];
        [v9 setPath:v7];
      }
      if ([(TUIKeyPopupView *)self drawsShadows])
      {
        uint64_t v10 = [v7 CGPath];
        int v11 = [(TUIKeyPopupView *)self deepShadowView];
        unint64_t v12 = [v11 layer];
        [v12 setShadowPath:v10];
      }
    }
  }
}

- (id)backgroundBezierPath
{
  double v2 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
  [v2 layoutFrame];
  double v4 = v3;
  double v6 = v5;

  id v7 = (void *)MEMORY[0x1E4FB14C0];
  return (id)objc_msgSend(v7, "bezierPathWithRect:", 0.0, 0.0, v4, v6);
}

- (void)updateVariantsIfNeededForKey:(id)a3
{
  objc_storeStrong((id *)&self->_backingTree, a3);
  id v5 = a3;
  [(TUIKeyPopupView *)self popupConstructorForKey:v5];
}

- (id)alignmentConstraintsForKey:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)popupConstructorForKey:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 subtrees];
  if ([v5 count] && objc_msgSend(v4, "state") == 16) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = [v4 interactionType] == 2
  }
      || [v4 interactionType] == 16;

  [(TUIKeyPopupView *)self updateVariantViewPropertiesForKey:v4 isNonVariantPaddle:v6];
  id v7 = [(TUIKeyPopupView *)self variantView];

  if (v7)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    unsigned __int8 v8 = [(TUIKeyPopupView *)self variantView];
    long long v9 = [v8 arrangedSubviews];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v66 objects:v70 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v67 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v66 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v66 objects:v70 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    [(TUIKeyPopupView *)self setVariantView:v14];

    uint64_t v15 = [(TUIKeyPopupView *)self variantView];
    [v15 setAxis:1];

    unint64_t v16 = [(TUIKeyPopupView *)self variantView];
    [v16 setDistribution:1];

    int64_t v17 = [(TUIKeyPopupView *)self variantViewAlignment];
    long long v18 = [(TUIKeyPopupView *)self variantView];
    [v18 setAlignment:v17];

    long long v19 = [(TUIKeyPopupView *)self variantView];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

    BOOL v20 = [(TUIKeyPopupView *)self wantsUserInteractionEnabled];
    double v21 = [(TUIKeyPopupView *)self variantView];
    [v21 setUserInteractionEnabled:v20];

    uint64_t v22 = [(TUIKeyPopupView *)self variantView];
    [v22 setLayoutMarginsRelativeArrangement:1];

    [(TUIKeyPopupView *)self stackLayoutMargins];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v31 = [(TUIKeyPopupView *)self variantView];
    objc_msgSend(v31, "setLayoutMargins:", v24, v26, v28, v30);

    [(TUIKeyPopupView *)self itemSpacing];
    double v33 = v32;
    double v34 = [(TUIKeyPopupView *)self variantView];
    [v34 setSpacing:v33];

    [(TUIKeyPopupView *)self decorateVariantView];
    long long v9 = [(TUIKeyPopupView *)self variantView];
    [(TUIKeyPopupView *)self addSubview:v9];
  }

  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v36 = [(TUIKeyPopupView *)self arrangedVariantRows];
  if (v36
    && (v37 = (void *)v36,
        [(TUIKeyPopupView *)self arrangedVariantCells],
        v38 = objc_claimAutoreleasedReturnValue(),
        v38,
        v37,
        v38))
  {
    v39 = [(TUIKeyPopupView *)self arrangedVariantRows];
    [v39 removeAllObjects];

    id v40 = [(TUIKeyPopupView *)self arrangedVariantCells];
    [v40 removeAllObjects];
  }
  else
  {
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(TUIKeyPopupView *)self setArrangedVariantRows:v41];

    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(TUIKeyPopupView *)self setArrangedVariantCells:v40];
  }

  if ([(TUIKeyPopupView *)self variantViewRows])
  {
    unint64_t v42 = 0;
    do
    {
      id v43 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
      [v43 setAxis:0];
      [v43 setDistribution:1];
      [v43 setAlignment:5];
      [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
      objc_msgSend(v43, "setUserInteractionEnabled:", -[TUIKeyPopupView wantsUserInteractionEnabled](self, "wantsUserInteractionEnabled"));
      [(TUIKeyPopupView *)self itemSpacing];
      objc_msgSend(v43, "setSpacing:");
      long long v44 = [(TUIKeyPopupView *)self variantView];
      [v44 addArrangedSubview:v43];

      long long v45 = [(TUIKeyPopupView *)self arrangedVariantRows];
      [v45 addObject:v43];

      ++v42;
    }
    while ([(TUIKeyPopupView *)self variantViewRows] > v42);
  }
  if ([(TUIKeyPopupView *)self drawsBackground]
    && ![(TUIKeyPopupView *)self hasConstrainedBackground])
  {
    long long v46 = [(TUIKeyPopupView *)self backdropView];
    double v47 = *MEMORY[0x1E4FB2848];
    double v48 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v49 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v50 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    long long v51 = -[TUIKeyPopupView constraintsToMatchInnerView:toOuterView:withInsets:](self, "constraintsToMatchInnerView:toOuterView:withInsets:", v46, self, *MEMORY[0x1E4FB2848], v48, v49, v50);
    [v35 addObjectsFromArray:v51];

    v52 = [(TUIKeyPopupView *)self borderView];
    v53 = -[TUIKeyPopupView constraintsToMatchInnerView:toOuterView:withInsets:](self, "constraintsToMatchInnerView:toOuterView:withInsets:", v52, self, v47, v48, v49, v50);
    [v35 addObjectsFromArray:v53];
  }
  if ([(TUIKeyPopupView *)self drawsShadows]
    && ![(TUIKeyPopupView *)self hasConstrainedBackground])
  {
    v54 = [(TUIKeyPopupView *)self deepShadowView];
    uint64_t v55 = [(TUIKeyPopupView *)self variantView];
    v56 = -[TUIKeyPopupView constraintsToMatchInnerView:toOuterView:withInsets:](self, "constraintsToMatchInnerView:toOuterView:withInsets:", v54, v55, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [v35 addObjectsFromArray:v56];

    CGPoint v57 = [(TUIKeyPopupView *)self keyShadowView];
    CGPoint v58 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
    CGRect v59 = -[TUIKeyPopupView constraintsToMatchView:toLayoutGuide:withInsets:](self, "constraintsToMatchView:toLayoutGuide:withInsets:", v57, v58, 0.0, 3.0, 3.0, 3.0);
    [v35 addObjectsFromArray:v59];
  }
  CGRect v60 = [(TUIKeyPopupView *)self alignmentConstraintsForKey:v4];
  if ([v60 count])
  {
    v61 = [(TUIKeyPopupView *)self subclassAdditionalConstraints];

    if (v61)
    {
      v62 = (void *)MEMORY[0x1E4F28DC8];
      v63 = [(TUIKeyPopupView *)self subclassAdditionalConstraints];
      [v62 deactivateConstraints:v63];
    }
    [v35 addObjectsFromArray:v60];
    [(TUIKeyPopupView *)self setSubclassAdditionalConstraints:v60];
  }
  if ([v35 count]) {
    [MEMORY[0x1E4F28DC8] activateConstraints:v35];
  }
  v64 = [(TUIKeyPopupView *)self backingTree];
  v65 = [(TUIKeyPopupView *)self variantView];
  [(TUIKeyPopupView *)self addVariantsForKey:v64 toView:v65 isNonVariantPaddle:v6];
}

- (void)updateConstraints
{
  if (self->_needsPopup)
  {
    double v3 = [(TUIKeyPopupView *)self variantView];

    if (!v3)
    {
      id v4 = [(TUIKeyPopupView *)self backingTree];
      [(TUIKeyPopupView *)self popupConstructorForKey:v4];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)TUIKeyPopupView;
  [(TUIKeyPopupView *)&v5 updateConstraints];
}

- (void)setRenderTraits:(id)a3
{
  objc_super v5 = (UIKBRenderTraits *)a3;
  p_renderTraits = &self->_renderTraits;
  if (self->_renderTraits != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_renderTraits, a3);
    objc_super v5 = v7;
  }
  MEMORY[0x1F41817F8](p_renderTraits, v5);
}

- (void)updateBackgroundMaterialsForRenderConfig:(id)a3
{
  id v32 = a3;
  id v4 = [(TUIKeyPopupView *)self renderTraits];
  objc_super v5 = [v4 layeredBackgroundGradient];
  BOOL v6 = [(TUIKeyPopupView *)self renderTraits];
  id v7 = v6;
  if (v5) {
    [v6 layeredBackgroundGradient];
  }
  else {
  unsigned __int8 v8 = [v6 backgroundGradient];
  }
  long long v9 = [v8 flatColorName];

  if (v9)
  {
    uint64_t v10 = UIKBGetNamedColor();
    id v11 = [(TUIKeyPopupView *)self borderView];
    uint64_t v12 = [v11 shapeLayer];
    [v12 setFillColor:v10];
  }
  else
  {
    if ([v32 lightKeyboard]) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    id v11 = [MEMORY[0x1E4FB1618] blackColor];
    }
    uint64_t v13 = [v11 CGColor];
    uint64_t v12 = [(TUIKeyPopupView *)self borderView];
    id v14 = [v12 shapeLayer];
    [v14 setFillColor:v13];
  }
  char v15 = objc_opt_respondsToSelector();
  unint64_t v16 = [(TUIKeyPopupView *)self backdropView];
  if (v15)
  {
    uint64_t v17 = [v32 keyBackdropStyle];
  }
  else
  {
    if ([v32 animatedBackground])
    {
      uint64_t v18 = 3905;
      goto LABEL_16;
    }
    uint64_t v17 = [v32 backdropStyle];
  }
  uint64_t v18 = v17;
LABEL_16:
  [v16 transitionToStyle:v18];

  if ([v32 animatedBackground])
  {
    long long v19 = [(TUIKeyPopupView *)self renderTraits];
    [v19 setControlOpacities:1];

    BOOL v20 = [(TUIKeyPopupView *)self borderView];
    double v21 = [v20 layer];
    [v21 setCompositingFilter:0];

    uint64_t v22 = [(TUIKeyPopupView *)self borderView];
    double v23 = [v22 layer];
    double v24 = [(TUIKeyPopupView *)self renderTraits];
    double v25 = [v24 extraFiltersForType:*MEMORY[0x1E4F3A350]];
    [v23 setFilters:v25];

    if (![v32 lightKeyboard]) {
      goto LABEL_22;
    }
    double v26 = [(TUIKeyPopupView *)self keyShadowView];
    double v27 = [v26 layer];
    uint64_t v28 = *MEMORY[0x1E4F3A2E0];
    [v27 setCompositingFilter:*MEMORY[0x1E4F3A2E0]];

    double v29 = [(TUIKeyPopupView *)self deepShadowView];
    double v30 = [v29 layer];
    [v30 setCompositingFilter:v28];
  }
  else
  {
    if (![v32 lightKeyboard]) {
      goto LABEL_22;
    }
    double v29 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A008]];
    double v30 = [(TUIKeyPopupView *)self backdropView];
    double v31 = [v30 layer];
    [v31 setCompositingFilter:v29];
  }
LABEL_22:
}

- (UIKBTree)associatedTree
{
  return self->_backingTree;
}

- (void)_addShadowsAndBackgroundsIfNeeded
{
  BOOL v3 = [(TUIKeyPopupView *)self drawsShadows];
  id v4 = (double *)MEMORY[0x1E4F1DB28];
  if (v3)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v6 = *v4;
    double v7 = v4[1];
    double v8 = v4[2];
    double v9 = v4[3];
    uint64_t v10 = (UIView *)objc_msgSend(v5, "initWithFrame:", *v4, v7, v8, v9);
    deepShadowView = self->_deepShadowView;
    self->_deepShadowView = v10;

    [(UIView *)self->_deepShadowView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_deepShadowView setUserInteractionEnabled:0];
    uint64_t v12 = [(UIView *)self->_deepShadowView layer];
    LODWORD(v13) = 1045220557;
    [v12 setShadowOpacity:v13];

    id v14 = [(UIView *)self->_deepShadowView layer];
    [v14 setShadowRadius:7.0];

    char v15 = [(UIView *)self->_deepShadowView layer];
    objc_msgSend(v15, "setShadowOffset:", 0.0, 6.0);

    unint64_t v16 = [(UIView *)self->_deepShadowView layer];
    [v16 setMasksToBounds:0];

    id v17 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v18 = [v17 CGColor];
    long long v19 = [(UIView *)self->_deepShadowView layer];
    [v19 setShadowColor:v18];

    [(TUIKeyPopupView *)self addSubview:self->_deepShadowView];
    BOOL v20 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v7, v8, v9);
    keyShadowView = self->_keyShadowView;
    self->_keyShadowView = v20;

    [(UIView *)self->_keyShadowView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_keyShadowView setUserInteractionEnabled:0];
    uint64_t v22 = [(UIView *)self->_keyShadowView layer];
    LODWORD(v23) = 1045220557;
    [v22 setShadowOpacity:v23];

    double v24 = [(UIView *)self->_keyShadowView layer];
    [v24 setShadowRadius:0.0];

    double v25 = [(UIView *)self->_keyShadowView layer];
    objc_msgSend(v25, "setShadowOffset:", 0.0, 1.0);

    double v26 = [(UIView *)self->_keyShadowView layer];
    [v26 setMasksToBounds:0];

    id v27 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v28 = [v27 CGColor];
    double v29 = [(UIView *)self->_keyShadowView layer];
    [v29 setShadowColor:v28];

    [(TUIKeyPopupView *)self addSubview:self->_keyShadowView];
  }
  if ([(TUIKeyPopupView *)self drawsBackground])
  {
    id v30 = objc_alloc(MEMORY[0x1E4FB18C8]);
    double v31 = *v4;
    double v32 = v4[1];
    double v33 = v4[2];
    double v34 = v4[3];
    id v35 = (UIKBVisualEffectView *)objc_msgSend(v30, "initWithFrame:style:", 3903, *v4, v32, v33, v34);
    backdropView = self->_backdropView;
    self->_backdropView = v35;

    [(UIKBVisualEffectView *)self->_backdropView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIKBVisualEffectView *)self->_backdropView setUserInteractionEnabled:0];
    [(TUIKeyPopupView *)self addSubview:self->_backdropView];
    v37 = -[TUIDrawingView initWithFrame:]([TUIDrawingView alloc], "initWithFrame:", v31, v32, v33, v34);
    backgroundMaskView = self->_backgroundMaskView;
    self->_backgroundMaskView = v37;

    [(TUIDrawingView *)self->_backgroundMaskView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TUIDrawingView *)self->_backgroundMaskView setUserInteractionEnabled:0];
    [(UIKBVisualEffectView *)self->_backdropView setMaskView:self->_backgroundMaskView];
    v39 = -[TUIDrawingView initWithFrame:]([TUIDrawingView alloc], "initWithFrame:", v31, v32, v33, v34);
    borderView = self->_borderView;
    self->_borderView = v39;

    [(TUIDrawingView *)self->_borderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TUIDrawingView *)self->_borderView setUserInteractionEnabled:0];
    id v41 = [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v42 = [v41 CGColor];
    id v43 = [(TUIDrawingView *)self->_borderView shapeLayer];
    [v43 setFillColor:v42];

    id v44 = [MEMORY[0x1E4FB1618] systemFillColor];
    uint64_t v45 = [v44 CGColor];
    long long v46 = [(TUIDrawingView *)self->_borderView shapeLayer];
    [v46 setStrokeColor:v45];

    [(TUIKeyPopupView *)self borderViewLineWidth];
    double v48 = v47;
    double v49 = [(TUIDrawingView *)self->_borderView shapeLayer];
    [v49 setLineWidth:v48];

    double v50 = self->_borderView;
    [(TUIKeyPopupView *)self addSubview:v50];
  }
}

- (TUIKeyPopupView)initWithKey:(id)a3 renderTraits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIKeyPopupView;
  double v8 = -[TUIKeyPopupView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v8)
  {
    double v9 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    baseKeyLayoutGuide = v8->_baseKeyLayoutGuide;
    v8->_baseKeyLayoutGuide = v9;

    [(UILayoutGuide *)v8->_baseKeyLayoutGuide setIdentifier:@"TUIVariantSelectorBaseGuide"];
    [(TUIKeyPopupView *)v8 addLayoutGuide:v8->_baseKeyLayoutGuide];
    uint64_t v11 = [v6 backingTree];
    backingTree = v8->_backingTree;
    v8->_backingTree = (UIKBTree *)v11;

    v8->_int64_t layoutStyle = [v6 style];
    objc_storeStrong((id *)&v8->_renderTraits, a4);
    if ([(UIKBTree *)v8->_backingTree state] == 16)
    {
      v8->_needsPopup = 1;
      [(TUIKeyPopupView *)v8 setVariantViewRows:1];
    }
    else
    {
      v8->_needsPopup = [v6 style] == 1;
    }
    [(TUIKeyPopupView *)v8 _addShadowsAndBackgroundsIfNeeded];
    [(TUIKeyPopupView *)v8 setUserInteractionEnabled:[(TUIKeyPopupView *)v8 wantsUserInteractionEnabled]];
  }

  return v8;
}

+ (int64_t)hitTestingMode
{
  return 0;
}

@end