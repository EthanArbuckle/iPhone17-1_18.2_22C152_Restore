@interface STUIStatusBarDisplayItem
- (BOOL)clearPreviousTokenDisablementIfNecessary;
- (BOOL)dynamicallyHidden;
- (BOOL)floating;
- (BOOL)hoverHighlightsAsRegion;
- (BOOL)isBackground;
- (BOOL)isEnabled;
- (BOOL)needsAddingToLayout;
- (BOOL)visible;
- (CGAffineTransform)dynamicHidingTransform;
- (CGAffineTransform)dynamicScaleTransform;
- (CGAffineTransform)transform;
- (CGAffineTransform)viewTransform;
- (CGRect)absoluteFrame;
- (CGRect)absoluteHoverFrame;
- (CGRect)absolutePresentationFrame;
- (NSDirectionalEdgeInsets)extendedHoverInsets;
- (NSMutableIndexSet)disablingTokens;
- (NSString)debugDescription;
- (NSString)description;
- (NSTimer)floatingTimer;
- (STUIStatusBarAction)action;
- (STUIStatusBarAction)hoverAction;
- (STUIStatusBarDisplayItem)initWithIdentifier:(id)a3 item:(id)a4;
- (STUIStatusBarDisplayItemPlacement)placement;
- (STUIStatusBarDisplayable)displayable;
- (STUIStatusBarDisplayable)view;
- (STUIStatusBarIdentifier)identifier;
- (STUIStatusBarItem)item;
- (STUIStatusBarRegion)region;
- (STUIStatusBarStyleAttributes)overriddenStyleAttributes;
- (UIEdgeInsets)actionInsets;
- (UILayoutItem)layoutItem;
- (UIView)containerView;
- (UIView)highlightView;
- (double)additionalDynamicPadding;
- (double)alpha;
- (double)baselineOffset;
- (double)centerOffset;
- (double)dynamicHidingAlpha;
- (double)viewAlpha;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)overriddenVerticalAlignment;
- (int64_t)priority;
- (void)_detectedErrorInFloatingState;
- (void)_updateComputedAlpha;
- (void)_updateComputedTransform;
- (void)applyStyleAttributes:(id)a3;
- (void)disableWithToken:(unint64_t)a3;
- (void)enableWithToken:(unint64_t)a3;
- (void)setAbsoluteFrame:(CGRect)a3;
- (void)setAction:(id)a3;
- (void)setActionInsets:(UIEdgeInsets)a3;
- (void)setAdditionalDynamicPadding:(double)a3;
- (void)setAlpha:(double)a3;
- (void)setBackground:(BOOL)a3;
- (void)setBaselineOffset:(double)a3;
- (void)setCenterOffset:(double)a3;
- (void)setContainerView:(id)a3;
- (void)setDisablingTokens:(id)a3;
- (void)setDynamicHidingAlpha:(double)a3;
- (void)setDynamicHidingTransform:(CGAffineTransform *)a3;
- (void)setDynamicScaleTransform:(CGAffineTransform *)a3;
- (void)setDynamicallyHidden:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExtendedHoverInsets:(NSDirectionalEdgeInsets)a3;
- (void)setFloating:(BOOL)a3;
- (void)setFloatingTimer:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setHoverAction:(id)a3;
- (void)setLayoutItem:(id)a3;
- (void)setNeedsAddingToLayout:(BOOL)a3;
- (void)setOverriddenStyleAttributes:(id)a3;
- (void)setOverriddenVerticalAlignment:(int64_t)a3;
- (void)setPlacement:(id)a3;
- (void)setRegion:(id)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setViewAlpha:(double)a3;
- (void)setViewTransform:(CGAffineTransform *)a3;
@end

@implementation STUIStatusBarDisplayItem

- (BOOL)floating
{
  return self->_floating;
}

- (BOOL)isEnabled
{
  return self->_enabled && [(NSMutableIndexSet *)self->_disablingTokens count] == 0;
}

- (BOOL)visible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)clearPreviousTokenDisablementIfNecessary
{
  BOOL wasPreviouslyDisabledWithToken = self->_wasPreviouslyDisabledWithToken;
  self->_BOOL wasPreviouslyDisabledWithToken = 0;
  return wasPreviouslyDisabledWithToken;
}

- (STUIStatusBarDisplayItem)initWithIdentifier:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)STUIStatusBarDisplayItem;
  v9 = [(STUIStatusBarDisplayItem *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeWeak((id *)&v10->_item, v8);
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v10->_alpha = _Q0;
    uint64_t v16 = MEMORY[0x1E4F1DAB8];
    long long v17 = *MEMORY[0x1E4F1DAB8];
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v10->_transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v10->_transform.c = v18;
    long long v19 = *(_OWORD *)(v16 + 32);
    *(_OWORD *)&v10->_transform.tx = v19;
    *(_OWORD *)&v10->_viewTransform.a = v17;
    *(_OWORD *)&v10->_viewTransform.c = v18;
    *(_OWORD *)&v10->_viewTransform.tx = v19;
    v10->_dynamicallyHidden = 0;
    v10->_dynamicHidingAlpha = 1.0;
    *(_OWORD *)&v10->_dynamicHidingTransform.a = v17;
    *(_OWORD *)&v10->_dynamicHidingTransform.c = v18;
    *(_OWORD *)&v10->_dynamicHidingTransform.tx = v19;
    *(_OWORD *)&v10->_dynamicScaleTransform.a = v17;
    *(_OWORD *)&v10->_dynamicScaleTransform.c = v18;
    *(_OWORD *)&v10->_dynamicScaleTransform.tx = v19;
    v10->_overriddenVerticalAlignment = 0;
    uint64_t v20 = [MEMORY[0x1E4F28E60] indexSet];
    disablingTokens = v10->_disablingTokens;
    v10->_disablingTokens = (NSMutableIndexSet *)v20;
  }
  return v10;
}

- (void)setPlacement:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)needsAddingToLayout
{
  return self->_needsAddingToLayout;
}

- (STUIStatusBarStyleAttributes)overriddenStyleAttributes
{
  return self->_overriddenStyleAttributes;
}

- (STUIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (void)setViewAlpha:(double)a3
{
  self->_viewAlpha = a3;
  [(STUIStatusBarDisplayItem *)self _updateComputedAlpha];
}

- (void)setAdditionalDynamicPadding:(double)a3
{
  self->_additionalDynamicPadding = a3;
}

- (void)setDynamicScaleTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_dynamicScaleTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_dynamicScaleTransform.tx = v4;
  *(_OWORD *)&self->_dynamicScaleTransform.a = v3;
  [(STUIStatusBarDisplayItem *)self _updateComputedTransform];
}

- (void)setContainerView:(id)a3
{
  id obj = a3;
  p_containerView = &self->_containerView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

  v6 = obj;
  if (WeakRetained != obj)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_containerView);

    if (v7)
    {
      id v8 = [(STUIStatusBarDisplayItem *)self layoutItem];
      objc_msgSend(v8, "_ui_removeFromParentLayoutItem");
    }
    if (obj)
    {
      BOOL v9 = [(STUIStatusBarDisplayItem *)self isBackground];
      v10 = [(STUIStatusBarDisplayItem *)self layoutItem];
      if (v9) {
        objc_msgSend(obj, "_ui_insertSubLayoutItem:atIndex:", v10, 0);
      }
      else {
        objc_msgSend(obj, "_ui_addSubLayoutItem:", v10);
      }
    }
    objc_storeWeak((id *)p_containerView, obj);
    v6 = obj;
  }
}

- (BOOL)isBackground
{
  return self->_background;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (BOOL)dynamicallyHidden
{
  return self->_dynamicallyHidden;
}

- (double)additionalDynamicPadding
{
  return self->_additionalDynamicPadding;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  v5 = [(STUIStatusBarDisplayItem *)self displayable];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v5 wantsCrossfade]
      && [MEMORY[0x1E4FB1EB0] _isInAnimationBlock])
    {
      v6 = (void *)MEMORY[0x1E4FB1EB0];
      id v7 = [(STUIStatusBarDisplayItem *)self view];
      [MEMORY[0x1E4FB1EB0] _currentAnimationDuration];
      double v9 = v8;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __49__STUIStatusBarDisplayItem_applyStyleAttributes___block_invoke;
      v10[3] = &unk_1E6AA39F0;
      id v11 = v5;
      id v12 = v4;
      [v6 transitionWithView:v7 duration:5242880 options:v10 animations:0 completion:v9];
    }
    else
    {
      [v5 applyStyleAttributes:v4];
    }
  }
}

- (int64_t)overriddenVerticalAlignment
{
  int64_t result = self->_overriddenVerticalAlignment;
  if (!result)
  {
    int64_t result = [(STUIStatusBarDisplayItem *)self displayable];
    if (result)
    {
      id v4 = (void *)result;
      v5 = [(STUIStatusBarDisplayItem *)self displayable];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        id v7 = [(STUIStatusBarDisplayItem *)self displayable];
        int64_t v8 = [v7 overriddenVerticalAlignment];

        return v8;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (STUIStatusBarDisplayable)displayable
{
  layoutItem = self->_layoutItem;
  if (layoutItem)
  {
    if ([(UILayoutItem *)layoutItem conformsToProtocol:&unk_1F2FAD960]) {
      id v4 = self->_layoutItem;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = [(STUIStatusBarDisplayItem *)self view];
  }
  return v4;
}

- (UILayoutItem)layoutItem
{
  layoutItem = self->_layoutItem;
  if (layoutItem)
  {
    long long v3 = layoutItem;
  }
  else
  {
    long long v3 = [(STUIStatusBarDisplayItem *)self view];
  }
  return v3;
}

- (STUIStatusBarDisplayable)view
{
  if (self->_layoutItem)
  {
    v2 = 0;
  }
  else
  {
    view = self->_view;
    if (!view)
    {
      v5 = [(STUIStatusBarDisplayItem *)self item];
      char v6 = [(STUIStatusBarDisplayItem *)self identifier];
      id v7 = [v5 viewForIdentifier:v6];
      [v7 setUserInteractionEnabled:0];
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
      int64_t v8 = self->_view;
      self->_view = (STUIStatusBarDisplayable *)v7;

      [(STUIStatusBarDisplayItem *)self _updateComputedAlpha];
      [(STUIStatusBarDisplayItem *)self _updateComputedTransform];

      view = self->_view;
    }
    v2 = view;
  }
  return v2;
}

- (void)_updateComputedTransform
{
  memset(&v15, 0, sizeof(v15));
  if (self->_dynamicallyHidden)
  {
    long long v3 = *(_OWORD *)&self->_dynamicHidingTransform.c;
    *(_OWORD *)&v15.a = *(_OWORD *)&self->_dynamicHidingTransform.a;
    *(_OWORD *)&v15.c = v3;
    *(_OWORD *)&v15.tx = *(_OWORD *)&self->_dynamicHidingTransform.tx;
  }
  else
  {
    long long v4 = *(_OWORD *)&self->_viewTransform.c;
    long long v5 = *(_OWORD *)&self->_viewTransform.tx;
    long long v6 = *(_OWORD *)&self->_transform.tx;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->_viewTransform.a;
    *(_OWORD *)&t1.c = v4;
    *(_OWORD *)&t1.tx = v5;
    long long v7 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t2.c = v7;
    *(_OWORD *)&t2.tx = v6;
    CGAffineTransformConcat(&v14, &t1, &t2);
    long long v8 = *(_OWORD *)&self->_dynamicScaleTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->_dynamicScaleTransform.a;
    *(_OWORD *)&t1.c = v8;
    *(_OWORD *)&t1.tx = *(_OWORD *)&self->_dynamicScaleTransform.tx;
    CGAffineTransformConcat(&v15, &t1, &v14);
  }
  view = self->_view;
  if (view)
  {
    [(STUIStatusBarDisplayable *)view transform];
    CGAffineTransform t1 = v15;
    if (!CGAffineTransformEqualToTransform(&t1, &v11))
    {
      CGAffineTransform v10 = v15;
      [(STUIStatusBarDisplayable *)self->_view setTransform:&v10];
    }
  }
}

- (void)_updateComputedAlpha
{
  if (self->_dynamicallyHidden) {
    double dynamicHidingAlpha = self->_dynamicHidingAlpha;
  }
  else {
    double dynamicHidingAlpha = self->_alpha * self->_viewAlpha;
  }
  view = self->_view;
  if (view)
  {
    [(STUIStatusBarDisplayable *)view alpha];
    if (vabdd_f64(dynamicHidingAlpha, v5) > 2.22044605e-16)
    {
      long long v6 = self->_view;
      [(STUIStatusBarDisplayable *)v6 setAlpha:dynamicHidingAlpha];
    }
  }
}

- (STUIStatusBarItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (STUIStatusBarItem *)WeakRetained;
}

- (void)setLayoutItem:(id)a3
{
}

- (void)setRegion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_floatingTimer, 0);
  objc_storeStrong((id *)&self->_disablingTokens, 0);
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->_region);
  objc_storeStrong((id *)&self->_overriddenStyleAttributes, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_layoutItem, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hoverAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

uint64_t __49__STUIStatusBarDisplayItem_applyStyleAttributes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyStyleAttributes:*(void *)(a1 + 40)];
}

- (void)setAction:(id)a3
{
}

- (CGRect)absoluteFrame
{
  uint64_t v3 = [(STUIStatusBarDisplayItem *)self layoutItem];
  if (v3
    && (long long v4 = (void *)v3,
        id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView),
        WeakRetained,
        v4,
        WeakRetained))
  {
    long long v6 = [(STUIStatusBarDisplayItem *)self containerView];
    long long v7 = [(STUIStatusBarDisplayItem *)self layoutItem];
    objc_msgSend(v7, "_ui_frame");
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    uint64_t v16 = [(STUIStatusBarDisplayItem *)self region];
    long long v17 = [v16 statusBar];
    objc_msgSend(v6, "convertRect:toView:", v17, v9, v11, v13, v15);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
  }
  else
  {
    double v19 = *MEMORY[0x1E4F1DB20];
    double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v23 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)absolutePresentationFrame
{
  uint64_t v3 = [(STUIStatusBarDisplayItem *)self layoutItem];
  if (v3
    && (long long v4 = (void *)v3,
        id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView),
        WeakRetained,
        v4,
        WeakRetained))
  {
    long long v6 = [(STUIStatusBarDisplayItem *)self layoutItem];
    long long v7 = objc_msgSend(v6, "_ui_view");
    double v8 = [v7 layer];
    double v9 = [v8 presentationLayer];
    [v9 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    v38.origin.x = v11;
    v38.origin.y = v13;
    v38.size.width = v15;
    v38.size.height = v17;
    if (CGRectIsEmpty(v38))
    {
      double v18 = [(STUIStatusBarDisplayItem *)self layoutItem];
      objc_msgSend(v18, "_ui_frame");
      double v11 = v19;
      double v13 = v20;
      double v15 = v21;
      double v17 = v22;
    }
    double v23 = [(STUIStatusBarDisplayItem *)self containerView];
    double v24 = [(STUIStatusBarDisplayItem *)self region];
    double v25 = [v24 statusBar];
    objc_msgSend(v23, "convertRect:toView:", v25, v11, v13, v15, v17);
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
  }
  else
  {
    double v27 = *MEMORY[0x1E4F1DB20];
    double v29 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v31 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v33 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v34 = v27;
  double v35 = v29;
  double v36 = v31;
  double v37 = v33;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (void)setAbsoluteFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(STUIStatusBarDisplayItem *)self floating] && x == 0.0 && y == 0.0)
  {
    [(STUIStatusBarDisplayItem *)self _detectedErrorInFloatingState];
  }
  else
  {
    uint64_t v8 = [(STUIStatusBarDisplayItem *)self layoutItem];
    if (v8)
    {
      double v9 = (void *)v8;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

      if (WeakRetained)
      {
        double v11 = [(STUIStatusBarDisplayItem *)self containerView];
        double v12 = [(STUIStatusBarDisplayItem *)self region];
        double v13 = [v12 statusBar];
        objc_msgSend(v11, "convertRect:fromView:", v13, x, y, width, height);
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;

        id v22 = [(STUIStatusBarDisplayItem *)self layoutItem];
        objc_msgSend(v22, "set_ui_frame:", v15, v17, v19, v21);
      }
    }
  }
}

- (STUIStatusBarRegion)region
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_region);
  return (STUIStatusBarRegion *)WeakRetained;
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIView *)WeakRetained;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tdouble x = v4;
  *(_OWORD *)&self->_transform.a = v3;
  [(STUIStatusBarDisplayItem *)self _updateComputedTransform];
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
  [(STUIStatusBarDisplayItem *)self _updateComputedAlpha];
}

- (void)setActionInsets:(UIEdgeInsets)a3
{
  self->_actionInsets = a3;
}

- (NSString)description
{
  return (NSString *)[(STUIStatusBarDisplayItem *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STUIStatusBarDisplayItem *)self debugDescriptionWithMultilinePrefix:0];
}

- (void)_detectedErrorInFloatingState
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v3 = _STUIStatusBar_Log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v9 = self;
    _os_log_impl(&dword_1D7E39000, v3, OS_LOG_TYPE_FAULT, "Item %@ left floating and in invalid state. Reseting status bar layout.", buf, 0xCu);
  }

  [(STUIStatusBarDisplayItem *)self setFloating:0];
  [(STUIStatusBarDisplayItem *)self setContainerView:0];
  [(STUIStatusBarDisplayItem *)self setAlpha:1.0];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v7[0] = *MEMORY[0x1E4F1DAB8];
  v7[1] = v4;
  v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(STUIStatusBarDisplayItem *)self setTransform:v7];
  double v5 = [(STUIStatusBarDisplayItem *)self item];
  long long v6 = [v5 statusBar];
  [v6 updateForcingIterativeOverflow];
}

- (void)disableWithToken:(unint64_t)a3
{
  self->_BOOL wasPreviouslyDisabledWithToken = 0;
}

- (void)enableWithToken:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableIndexSet *)self->_disablingTokens count];
  [(NSMutableIndexSet *)self->_disablingTokens removeIndex:a3];
  if (v5) {
    BOOL v6 = [(NSMutableIndexSet *)self->_disablingTokens count] == 0;
  }
  else {
    BOOL v6 = 0;
  }
  self->_BOOL wasPreviouslyDisabledWithToken = v6;
}

- (BOOL)hoverHighlightsAsRegion
{
  v2 = [(STUIStatusBarDisplayItem *)self view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (CGRect)absoluteHoverFrame
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setHighlightView:(id)a3
{
  double v5 = (UIView *)a3;
  highlightView = self->_highlightView;
  if (highlightView != v5)
  {
    long long v7 = v5;
    if (v5)
    {
      [(STUIStatusBarDisplayable *)self->_view bounds];
      -[UIView setFrame:](v7, "setFrame:");
      [(STUIStatusBarDisplayable *)self->_view addSubview:v7];
      highlightView = self->_highlightView;
    }
    [(UIView *)highlightView removeFromSuperview];
    objc_storeStrong((id *)&self->_highlightView, a3);
    double v5 = v7;
  }
  MEMORY[0x1F41817F8](highlightView, v5);
}

- (void)setDynamicHidingAlpha:(double)a3
{
  self->_double dynamicHidingAlpha = a3;
  [(STUIStatusBarDisplayItem *)self _updateComputedAlpha];
}

- (void)setViewTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_viewTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_viewTransform.tdouble x = v4;
  *(_OWORD *)&self->_viewTransform.a = v3;
  [(STUIStatusBarDisplayItem *)self _updateComputedTransform];
}

- (void)setDynamicHidingTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_dynamicHidingTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_dynamicHidingTransform.tdouble x = v4;
  *(_OWORD *)&self->_dynamicHidingTransform.a = v3;
  [(STUIStatusBarDisplayItem *)self _updateComputedTransform];
}

- (int64_t)priority
{
  return [(STUIStatusBarDisplayItemPlacement *)self->_placement priority];
}

- (void)setFloating:(BOOL)a3
{
  if (self->_floating != a3)
  {
    self->_floating = a3;
    BOOL v4 = !a3;
    [(STUIStatusBarDisplayItem *)self setNeedsAddingToLayout:!a3];
    if (v4)
    {
      floatingTimer = self->_floatingTimer;
      if (floatingTimer)
      {
        [(NSTimer *)floatingTimer invalidate];
        double v14 = self->_floatingTimer;
        self->_floatingTimer = 0;
      }
    }
    else
    {
      double v5 = [(STUIStatusBarDisplayItem *)self region];
      BOOL v6 = [v5 layout];

      long long v7 = [v6 displayItems];
      uint64_t v8 = (void *)[v7 mutableCopy];

      [v8 removeObject:self];
      [v6 setDisplayItems:v8];
      double v9 = [(STUIStatusBarDisplayItem *)self layoutItem];
      objc_msgSend(v9, "set_ui_usesManualLayout:", 1);

      objc_initWeak(&location, self);
      uint64_t v10 = (void *)MEMORY[0x1E4F1CB00];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __40__STUIStatusBarDisplayItem_setFloating___block_invoke;
      v15[3] = &unk_1E6AA3A18;
      objc_copyWeak(&v16, &location);
      double v11 = [v10 scheduledTimerWithTimeInterval:0 repeats:v15 block:5.0];
      double v12 = self->_floatingTimer;
      self->_floatingTimer = v11;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __40__STUIStatusBarDisplayItem_setFloating___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    [WeakRetained setFloatingTimer:0];
    id WeakRetained = (id)[v4 floating];
    id v2 = v4;
    if (WeakRetained)
    {
      id WeakRetained = (id)[v4 _detectedErrorInFloatingState];
      id v2 = v4;
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

- (id)succinctDescription
{
  id v2 = [(STUIStatusBarDisplayItem *)self succinctDescriptionBuilder];
  long long v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  long long v3 = [(STUIStatusBarDisplayItem *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  long long v3 = [(STUIStatusBarDisplayItem *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STUIStatusBarDisplayItem *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v7 = [(STUIStatusBarDisplayItem *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  uint64_t v8 = [v7 activeMultilinePrefix];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__STUIStatusBarDisplayItem__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E6AA39F0;
  id v9 = v7;
  id v13 = v9;
  double v14 = self;
  [v9 appendBodySectionWithName:0 multilinePrefix:v8 block:v12];

  id v10 = v9;
  return v10;
}

void __76__STUIStatusBarDisplayItem__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  long long v3 = [*(id *)(a1 + 40) identifier];
  id v4 = (id)[v2 appendObject:v3 withName:@"identifier"];

  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isEnabled"), @"enabled");
  id v6 = *(void **)(a1 + 32);
  long long v7 = [*(id *)(a1 + 40) item];
  id v8 = (id)[v6 appendObject:v7 withName:@"item"];

  id v9 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) view];
  id v10 = (id)[v9 appendObject:v11 withName:@"view"];
}

- (STUIStatusBarAction)action
{
  return self->_action;
}

- (UIEdgeInsets)actionInsets
{
  double top = self->_actionInsets.top;
  double left = self->_actionInsets.left;
  double bottom = self->_actionInsets.bottom;
  double right = self->_actionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (STUIStatusBarAction)hoverAction
{
  return self->_hoverAction;
}

- (void)setHoverAction:(id)a3
{
}

- (NSDirectionalEdgeInsets)extendedHoverInsets
{
  double top = self->_extendedHoverInsets.top;
  double leading = self->_extendedHoverInsets.leading;
  double bottom = self->_extendedHoverInsets.bottom;
  double trailing = self->_extendedHoverInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setExtendedHoverInsets:(NSDirectionalEdgeInsets)a3
{
  self->_extendedHoverInsets = a3;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setBackground:(BOOL)a3
{
  self->_background = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (double)viewAlpha
{
  return self->_viewAlpha;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[5].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[5].tx;
  return self;
}

- (CGAffineTransform)viewTransform
{
  long long v3 = *(_OWORD *)&self[6].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[6].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[6].tx;
  return self;
}

- (double)centerOffset
{
  return self->_centerOffset;
}

- (void)setCenterOffset:(double)a3
{
  self->_centerOffset = a3;
}

- (void)setOverriddenStyleAttributes:(id)a3
{
}

- (void)setOverriddenVerticalAlignment:(int64_t)a3
{
  self->_overriddenVerticalAlignment = a3;
}

- (void)setDynamicallyHidden:(BOOL)a3
{
  self->_dynamicallyHidden = a3;
}

- (double)dynamicHidingAlpha
{
  return self->_dynamicHidingAlpha;
}

- (CGAffineTransform)dynamicHidingTransform
{
  long long v3 = *(_OWORD *)&self[7].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[7].tx;
  return self;
}

- (CGAffineTransform)dynamicScaleTransform
{
  long long v3 = *(_OWORD *)&self[8].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[8].tx;
  return self;
}

- (NSMutableIndexSet)disablingTokens
{
  return self->_disablingTokens;
}

- (void)setDisablingTokens:(id)a3
{
}

- (NSTimer)floatingTimer
{
  return self->_floatingTimer;
}

- (void)setFloatingTimer:(id)a3
{
}

- (STUIStatusBarDisplayItemPlacement)placement
{
  return self->_placement;
}

- (void)setNeedsAddingToLayout:(BOOL)a3
{
  self->_needsAddingToLayout = a3;
}

@end