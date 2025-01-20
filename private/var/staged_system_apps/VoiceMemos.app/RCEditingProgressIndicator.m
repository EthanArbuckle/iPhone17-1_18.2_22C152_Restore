@interface RCEditingProgressIndicator
- (CAShapeLayer)progressLayer;
- (CGPath)_progressPath;
- (CGSize)intrinsicContentSize;
- (RCEditingProgressIndicator)initWithCoder:(id)a3;
- (RCEditingProgressIndicator)initWithFrame:(CGRect)a3;
- (UIColor)progressColor;
- (double)_radius;
- (double)diameter;
- (double)outerRingThickness;
- (float)progress;
- (void)_commonInit;
- (void)_styleView;
- (void)_updateLayers;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)layoutSubviews;
- (void)setDiameter:(double)a3;
- (void)setOuterRingThickness:(double)a3;
- (void)setProgress:(float)a3;
- (void)setProgressColor:(id)a3;
- (void)setProgressLayer:(id)a3;
@end

@implementation RCEditingProgressIndicator

- (void)setProgress:(float)a3
{
  self->_progress = a3;
  v4 = [(RCEditingProgressIndicator *)self _progressPath];
  id v5 = [(RCEditingProgressIndicator *)self progressLayer];
  [v5 setPath:v4];
}

- (void)setProgressColor:(id)a3
{
  objc_storeStrong((id *)&self->_progressColor, a3);
  id v5 = a3;
  id v6 = [v5 CGColor];

  id v7 = [(RCEditingProgressIndicator *)self progressLayer];
  [v7 setFillColor:v6];
}

- (RCEditingProgressIndicator)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCEditingProgressIndicator;
  v3 = [(RCEditingProgressIndicator *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(RCEditingProgressIndicator *)v3 _commonInit];
  }
  return v4;
}

- (RCEditingProgressIndicator)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCEditingProgressIndicator;
  v3 = -[RCEditingProgressIndicator initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(RCEditingProgressIndicator *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  id v5 = [(RCEditingProgressIndicator *)self layer];
  v3 = objc_opt_new();
  [v3 setAnchorPoint:0.0, 0.0];
  [(RCEditingProgressIndicator *)self setProgressLayer:v3];
  v4 = +[UIColor secondaryLabelColor];
  [(RCEditingProgressIndicator *)self setProgressColor:v4];

  [v5 addSublayer:v3];
  [(RCEditingProgressIndicator *)self _updateLayers];
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCEditingProgressIndicator;
  [(RCEditingProgressIndicator *)&v4 layoutSublayersOfLayer:a3];
  [(RCEditingProgressIndicator *)self _updateLayers];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RCEditingProgressIndicator;
  [(RCEditingProgressIndicator *)&v3 layoutSubviews];
  [(RCEditingProgressIndicator *)self _updateLayers];
  [(RCEditingProgressIndicator *)self _styleView];
}

- (void)_updateLayers
{
  id v4 = [(RCEditingProgressIndicator *)self progressLayer];
  objc_super v3 = [(RCEditingProgressIndicator *)self layer];
  [v3 bounds];
  [v4 setBounds:];

  [v4 setPath:[self _progressPath]];
}

- (CGPath)_progressPath
{
  objc_super v3 = objc_opt_new();
  [(RCEditingProgressIndicator *)self outerRingThickness];
  double v5 = v4;
  [(RCEditingProgressIndicator *)self _radius];
  double v7 = v6;
  double v8 = v5 + v6;
  v9 = [(RCEditingProgressIndicator *)self progressLayer];
  [v9 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v26.origin.x = v11;
  v26.origin.y = v13;
  v26.size.width = v15;
  v26.size.height = v17;
  double MidX = CGRectGetMidX(v26);
  v27.origin.x = v11;
  v27.origin.y = v13;
  v27.size.width = v15;
  v27.size.height = v17;
  double MidY = CGRectGetMidY(v27);
  double v20 = MidY - v7;
  [v3 moveToPoint:MidX, MidY - v8];
  [v3 addArcWithCenter:CGPointMake(1, MidX, MidY) radius:v8 startAngle:-1.57079637 endAngle:4.71238899 clockwise:0];
  [(RCEditingProgressIndicator *)self progress];
  if (v21 <= 0.01)
  {
    [v3 addLineToPoint:MidX, v20];
    [v3 addArcWithCenter:0 MidX MidY v7 -1.57079637 4.71238899];
    [v3 closePath];
  }
  else
  {
    [v3 moveToPoint:MidX, v20];
    [(RCEditingProgressIndicator *)self progress];
    [v3 addArcWithCenter:0 MidX MidY v7 -1.57079637 (float)((float)(v22 * 6.2832) + -1.5708)];
    [v3 addLineToPoint:MidX, MidY];
    [v3 addLineToPoint:MidX, v20];
  }
  id v23 = v3;
  v24 = (CGPath *)[v23 CGPath];

  return v24;
}

- (double)_radius
{
  [(RCEditingProgressIndicator *)self diameter];
  double v3 = v2 * 0.5;

  return RCRoundCoord(v3);
}

- (CGSize)intrinsicContentSize
{
  [(RCEditingProgressIndicator *)self diameter];
  double v4 = v3;
  [(RCEditingProgressIndicator *)self diameter];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)_styleView
{
  id v5 = [(RCEditingProgressIndicator *)self progressColor];
  id v3 = [v5 CGColor];
  double v4 = [(RCEditingProgressIndicator *)self progressLayer];
  [v4 setFillColor:v3];
}

- (float)progress
{
  return self->_progress;
}

- (double)outerRingThickness
{
  return self->_outerRingThickness;
}

- (void)setOuterRingThickness:(double)a3
{
  self->_outerRingThickness = a3;
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (UIColor)progressColor
{
  return self->_progressColor;
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLayer, 0);

  objc_storeStrong((id *)&self->_progressColor, 0);
}

@end