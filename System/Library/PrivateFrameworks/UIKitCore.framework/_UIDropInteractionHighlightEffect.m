@interface _UIDropInteractionHighlightEffect
- (CAShapeLayer)shapeLayer;
- (CGRect)clippingRectInView:(id)a3 forView:(id)a4;
- (CGRect)highlightRectInView:(id)a3 forDragInteraction:(id)a4 withContext:(id)a5;
- (UIColor)highlightColor;
- (_UIDropInteractionHighlightEffect)init;
- (double)cornerRadius;
- (double)highlightInset;
- (double)highlightWidth;
- (id)updateShapeLayerForFrame:(CGRect)a3 inView:(id)a4;
- (void)dealloc;
- (void)interaction:(id)a3 didChangeWithContext:(id)a4;
- (void)removeShapeLayer;
- (void)setCornerRadius:(double)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightInset:(double)a3;
- (void)setHighlightWidth:(double)a3;
- (void)setShapeLayer:(id)a3;
@end

@implementation _UIDropInteractionHighlightEffect

- (_UIDropInteractionHighlightEffect)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDropInteractionHighlightEffect;
  v2 = [(_UIDropInteractionHighlightEffect *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_highlightWidth = xmmword_186B94D80;
    v2->_highlightInset = -3.0;
    uint64_t v4 = +[UIColor systemBlueColor];
    highlightColor = v3->_highlightColor;
    v3->_highlightColor = (UIColor *)v4;
  }
  return v3;
}

- (id)updateShapeLayerForFrame:(CGRect)a3 inView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = [v9 keyboardSceneDelegate];
  v11 = [v10 containerView];

  v12 = [v11 window];
  objc_msgSend(v12, "convertRect:fromView:", v9, x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  objc_msgSend(v12, "convertRect:toView:", v11, v14, v16, v18, v20);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  CGFloat v29 = *MEMORY[0x1E4F1DAD8];
  CGFloat v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  shapeLayer = self->_shapeLayer;
  if (!shapeLayer)
  {
    v32 = [MEMORY[0x1E4F39C88] layer];
    [(CAShapeLayer *)v32 setAllowsHitTesting:0];
    [(CAShapeLayer *)v32 setFillColor:0];
    v33 = [v11 layer];
    [v33 addSublayer:v32];

    v34 = self->_shapeLayer;
    self->_shapeLayer = v32;

    shapeLayer = self->_shapeLayer;
  }
  [(CAShapeLayer *)shapeLayer setLineWidth:self->_highlightWidth];
  [(CAShapeLayer *)self->_shapeLayer setStrokeColor:[(UIColor *)self->_highlightColor CGColor]];
  [(CAShapeLayer *)self->_shapeLayer bounds];
  v43.origin.double x = v29;
  v43.origin.double y = v30;
  v43.size.double width = v26;
  v43.size.double height = v28;
  if (!CGRectEqualToRect(v40, v43))
  {
    [(CAShapeLayer *)self->_shapeLayer lineWidth];
    CGFloat v36 = v35 * 0.5 + -1.0;
    v41.origin.double x = v29;
    v41.origin.double y = v30;
    v41.size.double width = v26;
    v41.size.double height = v28;
    CGRect v42 = CGRectInset(v41, v36, v36);
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v42.origin.x, v42.origin.y, v42.size.width, v42.size.height, self->_cornerRadius);
    id v37 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](self->_shapeLayer, "setPath:", [v37 CGPath]);
  }
  -[CAShapeLayer setFrame:](self->_shapeLayer, "setFrame:", v22, v24, v26, v28);
  v38 = self->_shapeLayer;

  return v38;
}

- (void)removeShapeLayer
{
  [(CAShapeLayer *)self->_shapeLayer removeFromSuperlayer];
  shapeLayer = self->_shapeLayer;
  self->_shapeLayer = 0;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  int64_t visualState = self->_visualState;
  if (visualState != [v6 state])
  {
    int64_t v8 = [v6 state];
    self->_int64_t visualState = v8;
    if (!v8 || v8 == 3)
    {
      [(_UIDropInteractionHighlightEffect *)self removeShapeLayer];
    }
    else if (v8 == 1)
    {
      id v9 = [v28 view];
      [(_UIDropInteractionHighlightEffect *)self highlightRectInView:v9 forDragInteraction:v28 withContext:v6];
      CGRect v31 = CGRectInset(v30, self->_highlightInset - self->_highlightWidth, self->_highlightInset - self->_highlightWidth);
      double x = v31.origin.x;
      double y = v31.origin.y;
      double width = v31.size.width;
      double height = v31.size.height;
      [(_UIDropInteractionHighlightEffect *)self clippingRectInView:v9 forView:v9];
      v34.origin.double x = v14;
      v34.origin.double y = v15;
      v34.size.double width = v16;
      v34.size.double height = v17;
      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.double width = width;
      v32.size.double height = height;
      CGRect v33 = CGRectIntersection(v32, v34);
      double v18 = v33.origin.x;
      double v19 = v33.origin.y;
      double v20 = v33.size.width;
      double v21 = v33.size.height;
      BOOL IsNull = CGRectIsNull(v33);
      if (IsNull) {
        double v23 = x;
      }
      else {
        double v23 = v18;
      }
      if (IsNull) {
        double v24 = y;
      }
      else {
        double v24 = v19;
      }
      if (IsNull) {
        double v25 = width;
      }
      else {
        double v25 = v20;
      }
      if (IsNull) {
        double v26 = height;
      }
      else {
        double v26 = v21;
      }
      id v27 = -[_UIDropInteractionHighlightEffect updateShapeLayerForFrame:inView:](self, "updateShapeLayerForFrame:inView:", v9, v23, v24, v25, v26);
    }
  }
}

- (CGRect)clippingRectInView:(id)a3 forView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [v6 window];
  [v7 bounds];
  objc_msgSend(v5, "convertRect:fromView:", v7);
  CGFloat x = v8;
  CGFloat y = v10;
  CGFloat width = v12;
  CGFloat height = v14;
  uint64_t v16 = [v6 _viewControllerForAncestor];
  if (v16)
  {
    CGFloat v17 = (void *)v16;
    do
    {
      if ([v17 _isHostedRootViewController]) {
        break;
      }
      if (![v6 _isMemberOfViewControllerHierarchy:v17]) {
        break;
      }
      double v18 = [v17 view];
      double v19 = [v18 safeAreaLayoutGuide];

      [v19 layoutFrame];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      id v28 = [v19 owningView];
      objc_msgSend(v5, "convertRect:fromView:", v28, v21, v23, v25, v27);
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;

      v42.origin.CGFloat x = v30;
      v42.origin.CGFloat y = v32;
      v42.size.CGFloat width = v34;
      v42.size.CGFloat height = v36;
      v45.origin.CGFloat x = x;
      v45.origin.CGFloat y = y;
      v45.size.CGFloat width = width;
      v45.size.CGFloat height = height;
      CGRect v43 = CGRectIntersection(v42, v45);
      CGFloat x = v43.origin.x;
      CGFloat y = v43.origin.y;
      CGFloat width = v43.size.width;
      CGFloat height = v43.size.height;
      uint64_t v37 = [v17 parentViewController];

      CGFloat v17 = (void *)v37;
    }
    while (v37);
  }
  double v38 = x;
  double v39 = y;
  double v40 = width;
  double v41 = height;
  result.size.CGFloat height = v41;
  result.size.CGFloat width = v40;
  result.origin.CGFloat y = v39;
  result.origin.CGFloat x = v38;
  return result;
}

- (CGRect)highlightRectInView:(id)a3 forDragInteraction:(id)a4 withContext:(id)a5
{
  id v6 = a3;
  objc_super v7 = [a4 view];
  [v7 bounds];
  objc_msgSend(v6, "convertRect:fromView:", v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)dealloc
{
  [(_UIDropInteractionHighlightEffect *)self removeShapeLayer];
  v3.receiver = self;
  v3.super_class = (Class)_UIDropInteractionHighlightEffect;
  [(_UIDropInteractionHighlightEffect *)&v3 dealloc];
}

- (double)highlightWidth
{
  return self->_highlightWidth;
}

- (void)setHighlightWidth:(double)a3
{
  self->_highlightWidth = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)highlightInset
{
  return self->_highlightInset;
}

- (void)setHighlightInset:(double)a3
{
  self->_highlightInset = a3;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (CAShapeLayer)shapeLayer
{
  return self->_shapeLayer;
}

- (void)setShapeLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end