@interface PKLinkedAppIconView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)intrinsicContentSize;
- (PKLinkedAppIconView)initWithCoder:(id)a3;
- (PKLinkedAppIconView)initWithFrame:(CGRect)a3;
- (PKLinkedAppIconView)initWithLinkedApplication:(id)a3;
- (PKLinkedApplication)linkedApplication;
- (void)_updateWithIconImage:(id)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)linkedApplicationDidChangeState:(id)a3;
- (void)tapped:(id)a3;
@end

@implementation PKLinkedAppIconView

- (PKLinkedAppIconView)initWithCoder:(id)a3
{
  return 0;
}

- (PKLinkedAppIconView)initWithFrame:(CGRect)a3
{
  return -[PKLinkedAppIconView initWithLinkedApplication:](self, "initWithLinkedApplication:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKLinkedAppIconView)initWithLinkedApplication:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKLinkedAppIconView;
  v6 = -[PKLinkedAppIconView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    p_linkedApplication = (id *)&v6->_linkedApplication;
    objc_storeStrong((id *)&v6->_linkedApplication, a3);
    [*p_linkedApplication addObserver:v7];
    v9 = -[WLEasyToHitCustomButton initWithMargins:]([WLEasyToHitCustomButton alloc], "initWithMargins:", 10.0, 10.0, 10.0, 10.0);
    iconButton = v7->_iconButton;
    v7->_iconButton = v9;

    [(WLEasyToHitCustomButton *)v7->_iconButton addTarget:v7 action:sel_tapped_ forControlEvents:64];
    [(WLEasyToHitCustomButton *)v7->_iconButton setAlpha:0.0];
    -[WLEasyToHitCustomButton setMargins:](v7->_iconButton, "setMargins:", 10.0, 10.0, 10.0, 10.0);
    [(WLEasyToHitCustomButton *)v7->_iconButton setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
    v11 = [*p_linkedApplication iconImage];
    [(PKLinkedAppIconView *)v7 _updateWithIconImage:v11 animated:0];

    [(PKLinkedAppIconView *)v7 setAccessibilityIgnoresInvertColors:1];
    [(PKLinkedAppIconView *)v7 setAccessibilityIdentifier:*MEMORY[0x1E4F85688]];
  }

  return v7;
}

- (void)dealloc
{
  [(PKLinkedApplication *)self->_linkedApplication removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKLinkedAppIconView;
  [(PKLinkedAppIconView *)&v3 dealloc];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PKLinkedAppIconView;
  [(PKLinkedAppIconView *)&v4 didMoveToWindow];
  objc_super v3 = [(PKLinkedAppIconView *)self window];

  if (v3) {
    [(PKLinkedApplication *)self->_linkedApplication reloadApplicationStateIfNecessary];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v6 = self;
  iconButton = self->_iconButton;
  id v8 = a4;
  -[PKLinkedAppIconView convertPoint:toView:](v6, "convertPoint:toView:", iconButton, x, y);
  LOBYTE(v6) = -[WLEasyToHitCustomButton pointInside:withEvent:](iconButton, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (CGSize)intrinsicContentSize
{
  if (self->_iconImage) {
    [(UIImage *)self->_iconImage size];
  }
  else {
    [(PKLinkedApplication *)self->_linkedApplication expectedIconSize];
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)PKLinkedAppIconView;
  [(PKLinkedAppIconView *)&v28 layoutSubviews];
  [(PKLinkedAppIconView *)self bounds];
  [(UIImage *)self->_iconImage size];
  double v4 = v3;
  double v6 = v5;
  PKSizeAspectFit();
  double v9 = 1.0;
  double v10 = 1.0;
  if (v4 != 0.0) {
    double v10 = fmin(v7 / v4, 1.0);
  }
  if (v6 != 0.0) {
    double v9 = fmin(v8 / v6, 1.0);
  }
  double v24 = v8;
  double v25 = v7;
  PKSizeAlignedInRect();
  double v12 = v11;
  double v14 = v13;
  v15 = [(WLEasyToHitCustomButton *)self->_iconButton layer];
  [v15 anchorPoint];
  double v17 = v16;
  double v19 = v18;
  [v15 bounds];
  if (v21 != v4 || v20 != v6)
  {
    objc_msgSend(v15, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v4, v6);
    [(WLEasyToHitCustomButton *)self->_iconButton setNeedsLayout];
  }
  memset(&v27, 0, sizeof(v27));
  CGFloat v23 = fmin(v10, v9);
  CATransform3DMakeScale(&v27, v23, v23, 1.0);
  CATransform3D v26 = v27;
  [v15 setTransform:&v26];
  objc_msgSend(v15, "setPosition:", v12 + v17 * v25, v14 + v19 * v24);
}

- (void)_updateWithIconImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (UIImage *)a3;
  p_iconImage = &self->_iconImage;
  if (self->_iconImage != v7)
  {
    objc_storeStrong((id *)&self->_iconImage, a3);
    double v9 = [(WLEasyToHitCustomButton *)self->_iconButton superview];
    if (v9) {
      BOOL v10 = *p_iconImage == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      if (v4)
      {
        double v11 = [(WLEasyToHitCustomButton *)self->_iconButton snapshotViewAfterScreenUpdates:0];
        [(WLEasyToHitCustomButton *)self->_iconButton frame];
        objc_msgSend(v11, "setFrame:");
        [v9 addSubview:v11];
        double v12 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
        [v11 alpha];
        objc_msgSend(v12, "pkui_updateForAdditiveAnimationFromScalar:toScalar:");
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __53__PKLinkedAppIconView__updateWithIconImage_animated___block_invoke;
        v22[3] = &unk_1E59CB6D8;
        id v23 = v11;
        id v13 = v11;
        objc_msgSend(v12, "pkui_setCompletionHandler:", v22);
        double v14 = [v13 layer];
        id v15 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v12);

        [v13 setAlpha:0.0];
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __53__PKLinkedAppIconView__updateWithIconImage_animated___block_invoke_2;
      v21[3] = &unk_1E59CA7D0;
      v21[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v21];
    }
    -[WLEasyToHitCustomButton setImage:forState:](self->_iconButton, "setImage:forState:");
    if (*p_iconImage)
    {
      [(PKLinkedAppIconView *)self setNeedsLayout];
      if (!v9)
      {
        [(PKLinkedAppIconView *)self layoutIfNeeded];
        [(WLEasyToHitCustomButton *)self->_iconButton alpha];
        double v17 = v16;
        [(PKLinkedAppIconView *)self addSubview:self->_iconButton];
        [(WLEasyToHitCustomButton *)self->_iconButton setAlpha:1.0];
        if (v4 && v17 != 1.0)
        {
          double v18 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
          objc_msgSend(v18, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v17, 1.0);
          double v19 = [(WLEasyToHitCustomButton *)self->_iconButton layer];
          id v20 = (id)objc_msgSend(v19, "pkui_addAdditiveAnimation:", v18);
        }
      }
    }
  }
}

uint64_t __53__PKLinkedAppIconView__updateWithIconImage_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

void __53__PKLinkedAppIconView__updateWithIconImage_animated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
  [v2 removeAllAnimations];
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
  [v2 clearHasBeenCommitted];
}

- (void)tapped:(id)a3
{
  if (([(PKLinkedApplication *)self->_linkedApplication state] & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    linkedApplication = self->_linkedApplication;
    id v5 = [(UIView *)self pkui_viewControllerFromResponderChain];
    [(PKLinkedApplication *)linkedApplication openApplication:v5];
  }
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  id v6 = a3;
  if (![v6 state])
  {
    BOOL v4 = [(PKLinkedAppIconView *)self window];

    if (v4) {
      [v6 reloadApplicationStateIfNecessary];
    }
  }
  id v5 = [v6 iconImage];
  [(PKLinkedAppIconView *)self _updateWithIconImage:v5 animated:1];
}

- (PKLinkedApplication)linkedApplication
{
  return self->_linkedApplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);

  objc_storeStrong((id *)&self->_iconButton, 0);
}

@end