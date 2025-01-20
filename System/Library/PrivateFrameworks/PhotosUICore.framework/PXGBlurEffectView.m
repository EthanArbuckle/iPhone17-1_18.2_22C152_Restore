@interface PXGBlurEffectView
- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4;
- (CGRect)clippingRect;
- (PXGBlurEffectViewConfiguration)userData;
- (UIView)contentView;
- (void)addHostedLayer:(id)a3;
- (void)addHostedView:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXGBlurEffectView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
}

- (PXGBlurEffectViewConfiguration)userData
{
  return self->_userData;
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

- (UIView)contentView
{
  return [(UIVisualEffectView *)self->_effectView contentView];
}

- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(PXGBlurEffectView *)self contentView];
  v9 = [v8 layer];
  objc_msgSend(v9, "convertPoint:fromLayer:", v7, x, y);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (void)addHostedLayer:(id)a3
{
  id v4 = a3;
  id v6 = [(PXGBlurEffectView *)self contentView];
  v5 = [v6 layer];
  [v5 addSublayer:v4];
}

- (void)addHostedView:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGBlurEffectView *)self contentView];
  [v5 addSubview:v4];
}

- (void)prepareForReuse
{
}

- (void)setUserData:(id)a3
{
  v8 = (PXGBlurEffectViewConfiguration *)a3;
  id v5 = self->_userData;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    BOOL v7 = [(PXGBlurEffectViewConfiguration *)v5 isEqual:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_userData, a3);
      [(PXGBlurEffectView *)self setNeedsLayout];
    }
  }
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PXGBlurEffectView;
  [(PXGBlurEffectView *)&v10 layoutSubviews];
  if (!self->_effectView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1F00]);
    [(PXGBlurEffectView *)self bounds];
    id v4 = (UIVisualEffectView *)objc_msgSend(v3, "initWithFrame:");
    effectView = self->_effectView;
    self->_effectView = v4;

    [(UIVisualEffectView *)self->_effectView setAutoresizingMask:18];
    [(PXGBlurEffectView *)self addSubview:self->_effectView];
  }
  id v6 = (void *)MEMORY[0x1E4FB14C8];
  BOOL v7 = [(PXGBlurEffectView *)self userData];
  [v7 style];
  v8 = [v6 effectWithStyle:4015];
  [(UIVisualEffectView *)self->_effectView setEffect:v8];

  v9 = [(PXGBlurEffectView *)self superview];
  [v9 sendSubviewToBack:self];
}

@end