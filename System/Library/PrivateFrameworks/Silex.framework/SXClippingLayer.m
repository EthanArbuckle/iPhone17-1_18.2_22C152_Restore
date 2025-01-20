@interface SXClippingLayer
- (CALayer)contentLayer;
- (CGRect)contentFrame;
- (unint64_t)clippingMode;
- (void)layoutForContentsRect;
- (void)layoutForMasking;
- (void)layoutSublayers;
- (void)setClippingMode:(unint64_t)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setContentLayer:(id)a3;
@end

@implementation SXClippingLayer

- (void)layoutSublayers
{
  v4.receiver = self;
  v4.super_class = (Class)SXClippingLayer;
  [(SXClippingLayer *)&v4 layoutSublayers];
  unint64_t v3 = [(SXClippingLayer *)self clippingMode];
  if (v3 == 1)
  {
    [(SXClippingLayer *)self layoutForContentsRect];
  }
  else if (!v3)
  {
    [(SXClippingLayer *)self layoutForMasking];
  }
}

- (void)layoutForContentsRect
{
  [(SXClippingLayer *)self contentFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SXClippingLayer *)self bounds];
  v58.origin.CGFloat x = v11;
  v58.origin.CGFloat y = v12;
  v58.size.CGFloat width = v13;
  v58.size.CGFloat height = v14;
  v44.origin.CGFloat x = v4;
  v44.origin.CGFloat y = v6;
  v44.size.CGFloat width = v8;
  v44.size.CGFloat height = v10;
  CGRect v45 = CGRectIntersection(v44, v58);
  CGFloat x = v45.origin.x;
  CGFloat y = v45.origin.y;
  CGFloat width = v45.size.width;
  CGFloat height = v45.size.height;
  double MidX = CGRectGetMidX(v45);
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v46);
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  double v40 = CGRectGetWidth(v47);
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  double v19 = CGRectGetHeight(v48);
  v49.origin.CGFloat x = v4;
  v49.origin.CGFloat y = v6;
  v49.size.CGFloat width = v8;
  v49.size.CGFloat height = v10;
  if (CGRectIsEmpty(v49))
  {
    double v20 = 0.0;
    double v21 = 0.0;
    double v22 = 0.0;
    double v23 = 0.0;
  }
  else
  {
    v50.origin.CGFloat x = v4;
    v50.origin.CGFloat y = v6;
    v50.size.CGFloat width = v8;
    v50.size.CGFloat height = v10;
    double MinX = CGRectGetMinX(v50);
    double v25 = -fmin(MinX, 0.0);
    double v41 = v19;
    if (MinX >= 0.0) {
      double v26 = 0.0;
    }
    else {
      double v26 = v25;
    }
    v51.origin.CGFloat x = v4;
    v51.origin.CGFloat y = v6;
    v51.size.CGFloat width = v8;
    v51.size.CGFloat height = v10;
    double v37 = v26 / CGRectGetWidth(v51);
    v52.origin.CGFloat x = v4;
    v52.origin.CGFloat y = v6;
    v52.size.CGFloat width = v8;
    v52.size.CGFloat height = v10;
    double MinY = CGRectGetMinY(v52);
    double v28 = -fmin(MinY, 0.0);
    if (MinY >= 0.0) {
      double v29 = 0.0;
    }
    else {
      double v29 = v28;
    }
    v53.origin.CGFloat x = v4;
    v53.origin.CGFloat y = v6;
    v53.size.CGFloat width = v8;
    v53.size.CGFloat height = v10;
    double v36 = v29 / CGRectGetHeight(v53);
    v54.origin.CGFloat x = 0.0;
    v54.origin.CGFloat y = 0.0;
    v54.size.CGFloat height = v41;
    v54.size.CGFloat width = v40;
    double v30 = CGRectGetWidth(v54);
    v55.origin.CGFloat x = v4;
    v55.origin.CGFloat y = v6;
    v55.size.CGFloat width = v8;
    v55.size.CGFloat height = v10;
    double v31 = v30 / CGRectGetWidth(v55);
    v56.origin.CGFloat x = 0.0;
    v56.origin.CGFloat y = 0.0;
    v56.size.CGFloat width = v40;
    double v19 = v41;
    v56.size.CGFloat height = v41;
    double v32 = CGRectGetHeight(v56);
    v57.origin.CGFloat x = v4;
    v57.origin.CGFloat y = v6;
    v57.size.CGFloat width = v8;
    v57.size.CGFloat height = v10;
    double v33 = v32 / CGRectGetHeight(v57);
    double v23 = v37;
    if (v31 >= 1.0 - v37) {
      double v21 = 1.0 - v37;
    }
    else {
      double v21 = v31;
    }
    double v22 = v36;
    if (v33 >= 1.0 - v36) {
      double v20 = 1.0 - v36;
    }
    else {
      double v20 = v33;
    }
  }
  id v42 = [(SXClippingLayer *)self contentLayer];
  v34 = [(SXClippingLayer *)self contentLayer];
  objc_msgSend(v34, "setPosition:", MidX, MidY);

  v35 = [(SXClippingLayer *)self contentLayer];
  objc_msgSend(v35, "setBounds:", 0.0, 0.0, v40, v19);

  objc_msgSend(v42, "setContentsRect:", v23, v22, v21, v20);
}

- (void)layoutForMasking
{
  [(SXClippingLayer *)self contentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(SXClippingLayer *)self contentLayer];
  objc_msgSend(v11, "setFrameUsingCenterAndBounds:", v4, v6, v8, v10);
}

- (void)setContentLayer:(id)a3
{
  double v4 = (CALayer *)a3;
  contentLayer = self->_contentLayer;
  if (contentLayer != v4) {
    [(CALayer *)contentLayer removeFromSuperlayer];
  }
  double v6 = self->_contentLayer;
  self->_contentLayer = v4;
  double v7 = v4;

  [(SXClippingLayer *)self addSublayer:self->_contentLayer];
  [(SXClippingLayer *)self setNeedsLayout];
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
  [(SXClippingLayer *)self setNeedsLayout];
}

- (void)setClippingMode:(unint64_t)a3
{
  self->_clippingMode = a3;
  [(SXClippingLayer *)self setMasksToBounds:a3 == 0];
  [(SXClippingLayer *)self setNeedsLayout];
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (unint64_t)clippingMode
{
  return self->_clippingMode;
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

- (void).cxx_destruct
{
}

@end