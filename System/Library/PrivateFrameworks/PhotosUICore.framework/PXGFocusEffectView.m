@interface PXGFocusEffectView
- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4;
- (CGRect)clippingRect;
- (PXGFocusEffectView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (UIView)hostedContentView;
- (void)_handleSelectTap:(id)a3;
- (void)_updatePressedAppearance;
- (void)addHostedLayer:(id)a3;
- (void)addHostedView:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setClippingRect:(CGRect)a3;
@end

@implementation PXGFocusEffectView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedContentView, 0);
  objc_storeStrong((id *)&self->_floatingContentView, 0);
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(PXGFocusEffectView *)self layer];
  objc_msgSend(v8, "convertPoint:fromLayer:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)addHostedLayer:(id)a3
{
  hostedContentView = self->_hostedContentView;
  id v4 = a3;
  id v5 = [(UIView *)hostedContentView layer];
  [v5 addSublayer:v4];
}

- (void)addHostedView:(id)a3
{
}

- (void)_updatePressedAppearance
{
  if ([(PXGFocusEffectView *)self isFocused])
  {
    if (self->_activeSelectPressesCount <= 0) {
      uint64_t v3 = 8;
    }
    else {
      uint64_t v3 = 9;
    }
    floatingContentView = self->_floatingContentView;
    [(_UIFloatingContentView *)floatingContentView setControlState:v3 animated:1];
  }
}

- (void)_handleSelectTap:(id)a3
{
  id v13 = a3;
  if ([v13 state] == 3)
  {
    uint64_t v5 = [(PXGFocusEffectView *)self superview];
    if (v5)
    {
      v6 = (void *)v5;
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v7 = [v6 superview];

        v6 = (void *)v7;
        if (!v7) {
          goto LABEL_10;
        }
      }
      id v8 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v9 = [MEMORY[0x1E4F28B00] currentHandler];
        double v10 = (objc_class *)objc_opt_class();
        double v11 = NSStringFromClass(v10);
        double v12 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
        [v9 handleFailureInMethod:a2, self, @"PXGFocusEffectView.m", 208, @"%@ should be an instance inheriting from %@, but it is %@", @"ancestor", v11, v12 object file lineNumber description];
      }
      [v13 locationInView:v8];
      objc_msgSend(v8, "handlePrimaryInteractionAtPoint:");
    }
  }
LABEL_10:
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PXGFocusEffectView;
  [(PXGFocusableView *)&v10 didUpdateFocusInContext:a3 withAnimationCoordinator:v6];
  if ([(PXGFocusEffectView *)self isFocused])
  {
    uint64_t v7 = [(PXGFocusEffectView *)self superview];
    [v7 bringSubviewToFront:self];

    uint64_t v8 = 8;
  }
  else
  {
    uint64_t v8 = 0;
  }
  [(_UIFloatingContentView *)self->_floatingContentView setControlState:v8 withAnimationCoordinator:v6];
  [(PXGFocusEffectView *)self setNeedsLayout];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__PXGFocusEffectView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v9[3] = &unk_1E5DD36F8;
  v9[4] = self;
  [v6 addCoordinatedAnimations:v9 completion:0];
}

uint64_t __71__PXGFocusEffectView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGFocusEffectView;
  [(PXGFocusEffectView *)&v17 pressesCancelled:v6 withEvent:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "type", (void)v13) == 4)
        {
          --self->_activeSelectPressesCount;
          char v10 = 1;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);

    if (v10) {
      [(PXGFocusEffectView *)self _updatePressedAppearance];
    }
  }
  else
  {
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGFocusEffectView;
  [(PXGFocusEffectView *)&v17 pressesEnded:v6 withEvent:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "type", (void)v13) == 4)
        {
          --self->_activeSelectPressesCount;
          char v10 = 1;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);

    if (v10) {
      [(PXGFocusEffectView *)self _updatePressedAppearance];
    }
  }
  else
  {
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGFocusEffectView;
  [(PXGFocusEffectView *)&v17 pressesBegan:v6 withEvent:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "type", (void)v13) == 4)
        {
          ++self->_activeSelectPressesCount;
          char v10 = 1;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);

    if (v10) {
      [(PXGFocusEffectView *)self _updatePressedAppearance];
    }
  }
  else
  {
  }
}

- (void)layoutSubviews
{
  [(PXGFocusEffectView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PXGFocusEffectView *)self setClipsToBounds:0];
  id v21 = [(PXGFocusableView *)self userData];
  -[_UIFloatingContentView setFrame:](self->_floatingContentView, "setFrame:", v4, v6, v8, v10);
  [v21 cornerRadius];
  -[_UIFloatingContentView setCornerRadius:](self->_floatingContentView, "setCornerRadius:");
  floatingContentView = self->_floatingContentView;
  [v21 contentMotionRotation];
  double v13 = v12;
  double v15 = v14;
  [v21 contentMotionTranslation];
  -[_UIFloatingContentView setContentMotionRotation:translation:](floatingContentView, "setContentMotionRotation:translation:", v13, v15, v16, v17);
  [v21 focusedSizeIncrease];
  -[_UIFloatingContentView setFocusedSizeIncrease:](self->_floatingContentView, "setFocusedSizeIncrease:");
  [v21 shadowVerticalOffset];
  -[_UIFloatingContentView setShadowVerticalOffset:](self->_floatingContentView, "setShadowVerticalOffset:");
  v18 = self->_floatingContentView;
  [v21 shadowOpacity];
  -[_UIFloatingContentView setShadowOpacity:forUserInterfaceStyle:](v18, "setShadowOpacity:forUserInterfaceStyle:", 1);
  uint64_t v19 = self->_floatingContentView;
  [v21 shadowOpacity];
  -[_UIFloatingContentView setShadowOpacity:forUserInterfaceStyle:](v19, "setShadowOpacity:forUserInterfaceStyle:", 2);
  [(_UIFloatingContentView *)self->_floatingContentView layoutIfNeeded];
  v20 = [(_UIFloatingContentView *)self->_floatingContentView contentView];
  [v20 bounds];
  -[UIView setFrame:](self->_hostedContentView, "setFrame:");
}

- (UIView)contentView
{
  return [(_UIFloatingContentView *)self->_floatingContentView contentView];
}

- (UIView)hostedContentView
{
  return self->_hostedContentView;
}

- (PXGFocusEffectView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PXGFocusEffectView;
  double v3 = -[PXGFocusEffectView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PXGFocusEffectView *)v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v7, v9, v11);
    hostedContentView = v4->_hostedContentView;
    v4->_hostedContentView = (UIView *)v13;

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB2110]), "initWithFrame:", v6, v8, v10, v12);
    floatingContentView = v4->_floatingContentView;
    v4->_floatingContentView = (_UIFloatingContentView *)v15;

    [(PXGFocusEffectView *)v4 addSubview:v4->_floatingContentView];
    double v17 = [(_UIFloatingContentView *)v4->_floatingContentView contentView];
    [v17 addSubview:v4->_hostedContentView];

    v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__handleSelectTap_];
    [v18 setAllowedPressTypes:&unk_1F02D4F30];
    [v18 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
    [v18 setCancelsTouchesInView:0];
    [(PXGFocusEffectView *)v4 addGestureRecognizer:v18];
  }
  return v4;
}

@end