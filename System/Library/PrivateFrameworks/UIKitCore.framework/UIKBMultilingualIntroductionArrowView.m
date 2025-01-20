@interface UIKBMultilingualIntroductionArrowView
- (CAShapeLayer)arrowHeadLayer;
- (CAShapeLayer)arrowTailLayer;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (UIKBMultilingualIntroductionArrowView)init;
- (void)_updatePath;
- (void)setArrowHeadLayer:(id)a3;
- (void)setArrowTailLayer:(id)a3;
- (void)setEndPoint:(CGPoint)a3;
- (void)setStartPoint:(CGPoint)a3;
- (void)setStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4;
@end

@implementation UIKBMultilingualIntroductionArrowView

- (UIKBMultilingualIntroductionArrowView)init
{
  v19.receiver = self;
  v19.super_class = (Class)UIKBMultilingualIntroductionArrowView;
  v2 = [(UIView *)&v19 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(UIView *)v2 _inheritedRenderConfig];
    int v5 = [v4 lightKeyboard];
    double v6 = 0.35;
    if (v5) {
      double v6 = 0.65;
    }
    v7 = +[UIColor colorWithWhite:v6 alpha:1.0];
    v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    arrowTailLayer = v3->_arrowTailLayer;
    v3->_arrowTailLayer = v8;

    id v10 = +[UIColor clearColor];
    -[CAShapeLayer setFillColor:](v3->_arrowTailLayer, "setFillColor:", [v10 CGColor]);

    id v11 = v7;
    -[CAShapeLayer setStrokeColor:](v3->_arrowTailLayer, "setStrokeColor:", [v11 CGColor]);
    v12 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    arrowHeadLayer = v3->_arrowHeadLayer;
    v3->_arrowHeadLayer = v12;

    id v14 = v11;
    -[CAShapeLayer setFillColor:](v3->_arrowHeadLayer, "setFillColor:", [v14 CGColor]);
    id v15 = v14;
    -[CAShapeLayer setStrokeColor:](v3->_arrowHeadLayer, "setStrokeColor:", [v15 CGColor]);
    [(UIView *)v3 setUserInteractionEnabled:0];
    v16 = [(UIView *)v3 layer];
    [v16 addSublayer:v3->_arrowTailLayer];

    v17 = [(UIView *)v3 layer];
    [v17 addSublayer:v3->_arrowHeadLayer];
  }
  return v3;
}

- (void)setStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  self->_startPoint = a3;
  self->_endPoint = a4;
  [(UIKBMultilingualIntroductionArrowView *)self _updatePath];
}

- (void)_updatePath
{
  v3 = +[UIBezierPath bezierPath];
  objc_msgSend(v3, "moveToPoint:", self->_startPoint.x, self->_startPoint.y);
  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", self->_endPoint.x, self->_endPoint.y + 3.0, self->_startPoint.x + (self->_endPoint.x - self->_startPoint.x) * 0.5, self->_startPoint.y + -5.0, self->_endPoint.x, self->_startPoint.y - (self->_startPoint.y - self->_endPoint.y) / 3.0);
  id v12 = v3;
  -[CAShapeLayer setPath:](self->_arrowTailLayer, "setPath:", [v12 CGPath]);
  v4 = +[UIBezierPath bezierPath];
  [(UIKBMultilingualIntroductionArrowView *)self endPoint];
  objc_msgSend(v4, "moveToPoint:");
  [(UIKBMultilingualIntroductionArrowView *)self endPoint];
  double v6 = v5 + -4.0;
  [(UIKBMultilingualIntroductionArrowView *)self endPoint];
  objc_msgSend(v4, "addLineToPoint:", v6, v7 + 8.0);
  [(UIKBMultilingualIntroductionArrowView *)self endPoint];
  double v9 = v8 + 4.0;
  [(UIKBMultilingualIntroductionArrowView *)self endPoint];
  objc_msgSend(v4, "addLineToPoint:", v9, v10 + 8.0);
  id v11 = v4;
  -[CAShapeLayer setPath:](self->_arrowHeadLayer, "setPath:", [v11 CGPath]);
}

- (CGPoint)startPoint
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  self->_startPoint = a3;
}

- (CGPoint)endPoint
{
  double x = self->_endPoint.x;
  double y = self->_endPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  self->_endPoint = a3;
}

- (CAShapeLayer)arrowTailLayer
{
  return self->_arrowTailLayer;
}

- (void)setArrowTailLayer:(id)a3
{
}

- (CAShapeLayer)arrowHeadLayer
{
  return self->_arrowHeadLayer;
}

- (void)setArrowHeadLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrowHeadLayer, 0);
  objc_storeStrong((id *)&self->_arrowTailLayer, 0);
}

@end