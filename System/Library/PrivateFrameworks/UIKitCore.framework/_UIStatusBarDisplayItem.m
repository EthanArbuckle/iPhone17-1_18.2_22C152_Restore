@interface _UIStatusBarDisplayItem
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
- (CGRect)presentationAbsoluteFrame;
- (NSDirectionalEdgeInsets)extendedHoverInsets;
- (NSMutableIndexSet)disablingTokens;
- (NSString)description;
- (NSTimer)floatingTimer;
- (UIEdgeInsets)actionInsets;
- (UILayoutItem)layoutItem;
- (UIView)containerView;
- (UIView)highlightView;
- (_UIStatusBarAction)action;
- (_UIStatusBarAction)hoverAction;
- (_UIStatusBarDisplayItem)initWithIdentifier:(id)a3 item:(id)a4;
- (_UIStatusBarDisplayItemPlacement)placement;
- (_UIStatusBarDisplayable)displayable;
- (_UIStatusBarDisplayable)view;
- (_UIStatusBarIdentifier)identifier;
- (_UIStatusBarItem)item;
- (_UIStatusBarRegion)region;
- (_UIStatusBarStyleAttributes)overriddenStyleAttributes;
- (double)alpha;
- (double)baselineOffset;
- (double)centerOffset;
- (double)dynamicHidingAlpha;
- (double)viewAlpha;
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

@implementation _UIStatusBarDisplayItem

- (_UIStatusBarDisplayItem)initWithIdentifier:(id)a3 item:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_UIStatusBarDisplayItem;
  v10 = [(_UIStatusBarDisplayItem *)&v25 init];
  if (v10)
  {
    if (v9)
    {
      if (v8)
      {
LABEL_4:
        objc_storeStrong((id *)v10 + 5, a3);
        objc_storeWeak((id *)v10 + 6, v9);
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)(v10 + 72) = _Q0;
        uint64_t v16 = MEMORY[0x1E4F1DAB8];
        long long v17 = *MEMORY[0x1E4F1DAB8];
        long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)(v10 + 264) = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)(v10 + 280) = v18;
        long long v19 = *(_OWORD *)(v16 + 32);
        *(_OWORD *)(v10 + 296) = v19;
        *(_OWORD *)(v10 + 312) = v17;
        *(_OWORD *)(v10 + 328) = v18;
        *(_OWORD *)(v10 + 344) = v19;
        v10[11] = 0;
        *((void *)v10 + 17) = 0x3FF0000000000000;
        *(_OWORD *)(v10 + 376) = v18;
        *(_OWORD *)(v10 + 392) = v19;
        *(_OWORD *)(v10 + 360) = v17;
        *(_OWORD *)(v10 + 424) = v18;
        *(_OWORD *)(v10 + 440) = v19;
        *(_OWORD *)(v10 + 408) = v17;
        *((void *)v10 + 14) = 0;
        uint64_t v20 = [MEMORY[0x1E4F28E60] indexSet];
        v21 = (void *)*((void *)v10 + 18);
        *((void *)v10 + 18) = v20;

        goto LABEL_5;
      }
    }
    else
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:v10 file:@"_UIStatusBarDisplayItem.m" lineNumber:42 description:@"item must not be nil"];

      if (v8) {
        goto LABEL_4;
      }
    }
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:v10 file:@"_UIStatusBarDisplayItem.m" lineNumber:43 description:@"identifier must not be nil"];

    goto LABEL_4;
  }
LABEL_5:

  return (_UIStatusBarDisplayItem *)v10;
}

- (void)_detectedErrorInFloatingState
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    v7 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = self;
      _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Item %@ left floating and in invalid state. Reseting status bar layout.", buf, 0xCu);
    }
  }
  else
  {
    v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_detectedErrorInFloatingState___s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = self;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Item %@ left floating and in invalid state. Reseting status bar layout.", buf, 0xCu);
    }
  }
  [(_UIStatusBarDisplayItem *)self setFloating:0];
  [(_UIStatusBarDisplayItem *)self setContainerView:0];
  [(_UIStatusBarDisplayItem *)self setAlpha:1.0];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v4;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(_UIStatusBarDisplayItem *)self setTransform:v8];
  v5 = [(_UIStatusBarDisplayItem *)self item];
  v6 = [v5 statusBar];
  [v6 updateForcingIterativeOverflow];
}

- (BOOL)isEnabled
{
  return self->_enabled && [(NSMutableIndexSet *)self->_disablingTokens count] == 0;
}

- (void)disableWithToken:(unint64_t)a3
{
  self->_wasPreviouslyDisabledWithToken = 0;
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
  self->_wasPreviouslyDisabledWithToken = v6;
}

- (BOOL)clearPreviousTokenDisablementIfNecessary
{
  BOOL wasPreviouslyDisabledWithToken = self->_wasPreviouslyDisabledWithToken;
  self->_BOOL wasPreviouslyDisabledWithToken = 0;
  return wasPreviouslyDisabledWithToken;
}

- (BOOL)hoverHighlightsAsRegion
{
  v2 = [(_UIStatusBarDisplayItem *)self view];
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
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (_UIStatusBarDisplayable)view
{
  if (self->_layoutItem)
  {
    double v2 = 0;
  }
  else
  {
    view = self->_view;
    if (!view)
    {
      BOOL v6 = [(_UIStatusBarDisplayItem *)self item];
      if (!v6)
      {
        uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2, self, @"_UIStatusBarDisplayItem.m", 130, @"_UIStatusBarItem was nil when attempting to load view for %@", self object file lineNumber description];
      }
      v7 = [(_UIStatusBarDisplayItem *)self identifier];
      id v8 = [v6 viewForIdentifier:v7];
      if (!v8)
      {
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2, self, @"_UIStatusBarDisplayItem.m", 133, @"_UIStatusBarItem (%@) failed to return a view for identifier: %@", v6, v7 object file lineNumber description];
      }
      [v8 setUserInteractionEnabled:0];
      [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v9 = self->_view;
      self->_view = (_UIStatusBarDisplayable *)v8;

      [(_UIStatusBarDisplayItem *)self _updateComputedAlpha];
      [(_UIStatusBarDisplayItem *)self _updateComputedTransform];

      view = self->_view;
    }
    double v2 = view;
  }
  return v2;
}

- (UILayoutItem)layoutItem
{
  layoutItem = self->_layoutItem;
  if (layoutItem)
  {
    double v3 = layoutItem;
  }
  else
  {
    double v3 = [(_UIStatusBarDisplayItem *)self view];
  }
  return v3;
}

- (_UIStatusBarDisplayable)displayable
{
  layoutItem = self->_layoutItem;
  if (layoutItem)
  {
    if ([(UILayoutItem *)layoutItem conformsToProtocol:&unk_1ED477450]) {
      double v4 = self->_layoutItem;
    }
    else {
      double v4 = 0;
    }
  }
  else
  {
    double v4 = [(_UIStatusBarDisplayItem *)self view];
  }
  return v4;
}

- (NSString)description
{
  v10[4] = *MEMORY[0x1E4F143B8];
  double v3 = NSStringFromSelector(sel_identifier);
  v10[0] = v3;
  double v4 = NSStringFromSelector(sel_enabled);
  v10[1] = v4;
  double v5 = NSStringFromSelector(sel_item);
  v10[2] = v5;
  BOOL v6 = NSStringFromSelector(sel_view);
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  id v8 = +[UIDescriptionBuilder descriptionForObject:self keys:v7];

  return (NSString *)v8;
}

- (void)setContainerView:(id)a3
{
  id obj = a3;
  p_containerView = &self->_containerView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

  BOOL v6 = obj;
  if (WeakRetained != obj)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_containerView);

    if (v7)
    {
      id v8 = [(_UIStatusBarDisplayItem *)self layoutItem];
      objc_msgSend(v8, "_ui_removeFromParentLayoutItem");
    }
    if (obj)
    {
      BOOL v9 = [(_UIStatusBarDisplayItem *)self isBackground];
      v10 = [(_UIStatusBarDisplayItem *)self layoutItem];
      if (v9) {
        objc_msgSend(obj, "_ui_insertSubLayoutItem:atIndex:", v10, 0);
      }
      else {
        objc_msgSend(obj, "_ui_addSubLayoutItem:", v10);
      }
    }
    objc_storeWeak((id *)p_containerView, obj);
    BOOL v6 = obj;
  }
}

- (void)setHighlightView:(id)a3
{
  double v5 = (UIView *)a3;
  highlightView = self->_highlightView;
  if (highlightView != v5)
  {
    id v7 = v5;
    if (v5)
    {
      [(_UIStatusBarDisplayable *)self->_view bounds];
      -[UIView setFrame:](v7, "setFrame:");
      [(_UIStatusBarDisplayable *)self->_view addSubview:v7];
      highlightView = self->_highlightView;
    }
    [(UIView *)highlightView removeFromSuperview];
    objc_storeStrong((id *)&self->_highlightView, a3);
    double v5 = v7;
  }
}

- (BOOL)visible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
  [(_UIStatusBarDisplayItem *)self _updateComputedAlpha];
}

- (void)setViewAlpha:(double)a3
{
  self->_viewAlpha = a3;
  [(_UIStatusBarDisplayItem *)self _updateComputedAlpha];
}

- (void)setDynamicHidingAlpha:(double)a3
{
  self->_dynamicHidingAlpha = a3;
  [(_UIStatusBarDisplayItem *)self _updateComputedAlpha];
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
    [(_UIStatusBarDisplayable *)view alpha];
    if (vabdd_f64(dynamicHidingAlpha, v5) > 2.22044605e-16)
    {
      BOOL v6 = self->_view;
      [(_UIStatusBarDisplayable *)v6 setAlpha:dynamicHidingAlpha];
    }
  }
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
  [(_UIStatusBarDisplayItem *)self _updateComputedTransform];
}

- (void)setViewTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_viewTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_viewTransform.tx = v4;
  *(_OWORD *)&self->_viewTransform.a = v3;
  [(_UIStatusBarDisplayItem *)self _updateComputedTransform];
}

- (void)setDynamicHidingTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_dynamicHidingTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_dynamicHidingTransform.tx = v4;
  *(_OWORD *)&self->_dynamicHidingTransform.a = v3;
  [(_UIStatusBarDisplayItem *)self _updateComputedTransform];
}

- (void)setDynamicScaleTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_dynamicScaleTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_dynamicScaleTransform.tx = v4;
  *(_OWORD *)&self->_dynamicScaleTransform.a = v3;
  [(_UIStatusBarDisplayItem *)self _updateComputedTransform];
}

- (void)_updateComputedTransform
{
  memset(&v14, 0, sizeof(v14));
  if (self->_dynamicallyHidden)
  {
    long long v3 = *(_OWORD *)&self->_dynamicHidingTransform.c;
    *(_OWORD *)&v14.a = *(_OWORD *)&self->_dynamicHidingTransform.a;
    *(_OWORD *)&v14.c = v3;
    *(_OWORD *)&v14.tx = *(_OWORD *)&self->_dynamicHidingTransform.tx;
  }
  else
  {
    p_dynamicScaleTransform = &self->_dynamicScaleTransform;
    long long v5 = *(_OWORD *)&self->_viewTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->_viewTransform.a;
    *(_OWORD *)&t1.c = v5;
    *(_OWORD *)&t1.tx = *(_OWORD *)&self->_viewTransform.tx;
    long long v6 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t2.c = v6;
    *(_OWORD *)&t2.tx = *(_OWORD *)&self->_transform.tx;
    CGAffineTransformConcat(&v13, &t1, &t2);
    long long v7 = *(_OWORD *)&self->_dynamicScaleTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_dynamicScaleTransform->a;
    *(_OWORD *)&t1.c = v7;
    *(_OWORD *)&t1.tx = *(_OWORD *)&self->_dynamicScaleTransform.tx;
    CGAffineTransformConcat(&v14, &t1, &v13);
  }
  view = self->_view;
  if (view)
  {
    [(_UIStatusBarDisplayable *)view transform];
    CGAffineTransform t1 = v14;
    if (!CGAffineTransformEqualToTransform(&t1, &v10))
    {
      CGAffineTransform v9 = v14;
      [(_UIStatusBarDisplayable *)self->_view setTransform:&v9];
    }
  }
}

- (CGRect)presentationAbsoluteFrame
{
  uint64_t v3 = [(_UIStatusBarDisplayItem *)self layoutItem];
  if (v3
    && (long long v4 = (void *)v3,
        id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView),
        WeakRetained,
        v4,
        WeakRetained))
  {
    long long v6 = [(_UIStatusBarDisplayItem *)self layoutItem];
    long long v7 = objc_msgSend(v6, "_ui_view");
    id v8 = [v7 layer];
    CGAffineTransform v9 = [v8 presentationLayer];
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
      long long v18 = [(_UIStatusBarDisplayItem *)self layoutItem];
      objc_msgSend(v18, "_ui_frame");
      double v11 = v19;
      double v13 = v20;
      double v15 = v21;
      double v17 = v22;
    }
    v23 = [(_UIStatusBarDisplayItem *)self containerView];
    v24 = [(_UIStatusBarDisplayItem *)self region];
    objc_super v25 = [v24 statusBar];
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

- (CGRect)absoluteFrame
{
  uint64_t v3 = [(_UIStatusBarDisplayItem *)self layoutItem];
  if (v3
    && (long long v4 = (void *)v3,
        id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView),
        WeakRetained,
        v4,
        WeakRetained))
  {
    long long v6 = [(_UIStatusBarDisplayItem *)self containerView];
    long long v7 = [(_UIStatusBarDisplayItem *)self layoutItem];
    objc_msgSend(v7, "_ui_frame");
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [(_UIStatusBarDisplayItem *)self region];
    double v17 = [v16 statusBar];
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

- (void)setAbsoluteFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(_UIStatusBarDisplayItem *)self floating] && x == 0.0 && y == 0.0)
  {
    [(_UIStatusBarDisplayItem *)self _detectedErrorInFloatingState];
  }
  else
  {
    uint64_t v8 = [(_UIStatusBarDisplayItem *)self layoutItem];
    if (v8)
    {
      double v9 = (void *)v8;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

      if (WeakRetained)
      {
        double v11 = [(_UIStatusBarDisplayItem *)self containerView];
        double v12 = [(_UIStatusBarDisplayItem *)self region];
        double v13 = [v12 statusBar];
        objc_msgSend(v11, "convertRect:fromView:", v13, x, y, width, height);
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;

        id v22 = [(_UIStatusBarDisplayItem *)self layoutItem];
        objc_msgSend(v22, "set_ui_frame:", v15, v17, v19, v21);
      }
    }
  }
}

- (int64_t)priority
{
  return [(_UIStatusBarDisplayItemPlacement *)self->_placement priority];
}

- (int64_t)overriddenVerticalAlignment
{
  int64_t result = self->_overriddenVerticalAlignment;
  if (!result)
  {
    int64_t result = [(_UIStatusBarDisplayItem *)self displayable];
    if (result)
    {
      long long v4 = (void *)result;
      long long v5 = [(_UIStatusBarDisplayItem *)self displayable];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        long long v7 = [(_UIStatusBarDisplayItem *)self displayable];
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

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  long long v5 = [(_UIStatusBarDisplayItem *)self displayable];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v5 wantsCrossfade]
      && +[UIView _isInAnimationBlock])
    {
      char v6 = [(_UIStatusBarDisplayItem *)self view];
      +[UIView _currentAnimationDuration];
      double v8 = v7;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __48___UIStatusBarDisplayItem_applyStyleAttributes___block_invoke;
      v9[3] = &unk_1E52D9F98;
      id v10 = v5;
      id v11 = v4;
      +[UIView transitionWithView:v6 duration:5242880 options:v9 animations:0 completion:v8];
    }
    else
    {
      [v5 applyStyleAttributes:v4];
    }
  }
}

- (void)setFloating:(BOOL)a3
{
  if (self->_floating != a3)
  {
    self->_floating = a3;
    BOOL v4 = !a3;
    [(_UIStatusBarDisplayItem *)self setNeedsAddingToLayout:!a3];
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
      long long v5 = [(_UIStatusBarDisplayItem *)self region];
      char v6 = [v5 layout];

      double v7 = [v6 displayItems];
      double v8 = (void *)[v7 mutableCopy];

      [v8 removeObject:self];
      [v6 setDisplayItems:v8];
      double v9 = [(_UIStatusBarDisplayItem *)self layoutItem];
      objc_msgSend(v9, "set_ui_usesManualLayout:", 1);

      objc_initWeak(&location, self);
      id v10 = (void *)MEMORY[0x1E4F1CB00];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __39___UIStatusBarDisplayItem_setFloating___block_invoke;
      v15[3] = &unk_1E52DAB28;
      objc_copyWeak(&v16, &location);
      id v11 = [v10 scheduledTimerWithTimeInterval:0 repeats:v15 block:5.0];
      double v12 = self->_floatingTimer;
      self->_floatingTimer = v11;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

- (_UIStatusBarAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
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

- (void)setActionInsets:(UIEdgeInsets)a3
{
  self->_actionInsets = a3;
}

- (_UIStatusBarAction)hoverAction
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

- (_UIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

- (_UIStatusBarItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (_UIStatusBarItem *)WeakRetained;
}

- (void)setLayoutItem:(id)a3
{
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isBackground
{
  return self->_background;
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
  long long v3 = *(_OWORD *)&self[5].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[6].b;
  return self;
}

- (CGAffineTransform)viewTransform
{
  long long v3 = *(_OWORD *)&self[6].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[6].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[7].b;
  return self;
}

- (CGRect)absolutePresentationFrame
{
  double x = self->_absolutePresentationFrame.origin.x;
  double y = self->_absolutePresentationFrame.origin.y;
  double width = self->_absolutePresentationFrame.size.width;
  double height = self->_absolutePresentationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (double)centerOffset
{
  return self->_centerOffset;
}

- (void)setCenterOffset:(double)a3
{
  self->_centerOffset = a3;
}

- (_UIStatusBarStyleAttributes)overriddenStyleAttributes
{
  return self->_overriddenStyleAttributes;
}

- (void)setOverriddenStyleAttributes:(id)a3
{
}

- (void)setOverriddenVerticalAlignment:(int64_t)a3
{
  self->_overriddenVerticalAlignment = a3;
}

- (_UIStatusBarRegion)region
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_region);
  return (_UIStatusBarRegion *)WeakRetained;
}

- (void)setRegion:(id)a3
{
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIView *)WeakRetained;
}

- (BOOL)dynamicallyHidden
{
  return self->_dynamicallyHidden;
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
  long long v3 = *(_OWORD *)&self[7].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[8].b;
  return self;
}

- (CGAffineTransform)dynamicScaleTransform
{
  long long v3 = *(_OWORD *)&self[8].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[9].b;
  return self;
}

- (BOOL)floating
{
  return self->_floating;
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

- (_UIStatusBarDisplayItemPlacement)placement
{
  return self->_placement;
}

- (void)setPlacement:(id)a3
{
}

- (BOOL)needsAddingToLayout
{
  return self->_needsAddingToLayout;
}

- (void)setNeedsAddingToLayout:(BOOL)a3
{
  self->_needsAddingToLayout = a3;
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

@end