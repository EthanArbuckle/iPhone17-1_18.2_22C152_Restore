@interface PXAssetsSectionBlurView
- (CGRect)clippingRect;
- (NSCopying)userData;
- (PXAssetsSectionBlurView)initWithFrame:(CGRect)a3;
- (UIView)dimmingView;
- (UIVisualEffectView)blurEffectView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXAssetsSectionBlurView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->userData, 0);
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (NSCopying)userData
{
  return self->userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->clippingRect.origin.x;
  double y = self->clippingRect.origin.y;
  double width = self->clippingRect.size.width;
  double height = self->clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUserData:(id)a3
{
  id v18 = a3;
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      v17 = objc_msgSend(v18, "px_descriptionForAssertionMessage");
      [v14 handleFailureInMethod:a2, self, @"PXAssetsSectionBlurView.m", 53, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"userData", v16, v17 object file lineNumber description];
    }
  }
  [v18 intensity];
  double v6 = v5;
  [v18 maximumBlurRadius];
  double v8 = v6 * v7;
  [v18 maximumDimmingFraction];
  double v10 = v6 * v9;
  v11 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:v8];
  v12 = [(PXAssetsSectionBlurView *)self blurEffectView];
  [v12 setEffect:v11];

  v13 = [(PXAssetsSectionBlurView *)self dimmingView];
  [v13 setAlpha:v10];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)layoutSubviews
{
  [(PXAssetsSectionBlurView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PXAssetsSectionBlurView *)self blurEffectView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  id v12 = [(PXAssetsSectionBlurView *)self dimmingView];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
}

- (PXAssetsSectionBlurView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PXAssetsSectionBlurView;
  double v3 = -[PXAssetsSectionBlurView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    blurEffectView = v3->_blurEffectView;
    v3->_blurEffectView = v4;

    [(PXAssetsSectionBlurView *)v3 addSubview:v3->_blurEffectView];
    double v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    dimmingView = v3->_dimmingView;
    v3->_dimmingView = v6;

    double v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(UIView *)v3->_dimmingView setBackgroundColor:v8];

    [(PXAssetsSectionBlurView *)v3 addSubview:v3->_dimmingView];
  }
  return v3;
}

@end