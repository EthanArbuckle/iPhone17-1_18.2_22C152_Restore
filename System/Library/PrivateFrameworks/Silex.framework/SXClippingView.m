@interface SXClippingView
+ (Class)layerClass;
- (CGRect)contentFrame;
- (CGSize)contentSize;
- (SXClippingView)initWithContentView:(id)a3;
- (UIView)contentView;
- (unint64_t)clippingMode;
- (void)setClippingMode:(id)a3;
- (void)setContentFrame:(CGRect)a3;
@end

@implementation SXClippingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SXClippingView)initWithContentView:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SXClippingView;
  v6 = -[SXClippingView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentView, a3);
    v8 = [(SXClippingView *)v7 layer];
    v9 = [v5 layer];
    [v8 setContentLayer:v9];

    v10 = [(SXClippingView *)v7 layer];
    objc_opt_class();
    [v10 setClippingMode:objc_opt_isKindOfClass() & 1];

    [(SXClippingView *)v7 addSubview:v5];
  }

  return v7;
}

- (void)setContentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_contentFrame = a3;
  id v7 = [(SXClippingView *)self layer];
  objc_msgSend(v7, "setContentFrame:", x, y, width, height);
}

- (void)setClippingMode:(id)a3
{
  self->_clippingMode = (unint64_t)a3;
  id v4 = [(SXClippingView *)self layer];
  [v4 setClippingMode:a3];
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)clippingMode
{
  return self->_clippingMode;
}

- (void).cxx_destruct
{
}

@end