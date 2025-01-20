@interface SXGradientFillView
- (CGRect)contentFrame;
- (CGRect)fillFrameWithBoundingSize:(CGSize)a3;
- (SXClippingView)clippingView;
- (SXGradientFillView)initWithGradientFill:(id)a3 gradientFactory:(id)a4;
- (SXGradientView)gradientView;
- (SXLinearGradientFill)gradientFill;
- (void)layoutSubviews;
- (void)setContentFrame:(CGRect)a3;
@end

@implementation SXGradientFillView

- (SXGradientFillView)initWithGradientFill:(id)a3 gradientFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SXGradientFillView;
  v9 = [(SXFillView *)&v19 initWithFill:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_gradientFill, a3);
    v11 = [v7 colorStops];
    v12 = [v11 NSArray];
    [v7 angle];
    v13 = objc_msgSend(v8, "gradientForColorStops:angle:", v12);

    v14 = [[SXGradientView alloc] initWithGradient:v13];
    gradientView = v10->_gradientView;
    v10->_gradientView = v14;

    v16 = [[SXClippingView alloc] initWithContentView:v10->_gradientView];
    clippingView = v10->_clippingView;
    v10->_clippingView = v16;

    [(SXGradientFillView *)v10 addSubview:v10->_clippingView];
  }

  return v10;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SXGradientFillView;
  [(SXGradientFillView *)&v4 layoutSubviews];
  v3 = [(SXGradientFillView *)self clippingView];
  [(SXGradientFillView *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (CGRect)fillFrameWithBoundingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = 0.0;
  double v6 = 0.0;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)contentFrame
{
  v2 = [(SXGradientFillView *)self clippingView];
  [v2 contentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(SXGradientFillView *)self clippingView];
  objc_msgSend(v7, "setContentFrame:", x, y, width, height);
}

- (SXLinearGradientFill)gradientFill
{
  return self->_gradientFill;
}

- (SXClippingView)clippingView
{
  return self->_clippingView;
}

- (SXGradientView)gradientView
{
  return self->_gradientView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_gradientFill, 0);
}

@end