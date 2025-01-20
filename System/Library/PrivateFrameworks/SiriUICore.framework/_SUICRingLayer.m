@interface _SUICRingLayer
- (UIColor)ringColor;
- (_SUICRingLayer)init;
- (double)customLineWidth;
- (void)setCustomLineWidth:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setRingColor:(id)a3;
@end

@implementation _SUICRingLayer

- (_SUICRingLayer)init
{
  v7.receiver = self;
  v7.super_class = (Class)_SUICRingLayer;
  v2 = [(_SUICRingLayer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(_SUICRingLayer *)v2 setCustomLineWidth:0.0];
    id v4 = [MEMORY[0x1E4FB1618] clearColor];
    -[_SUICRingLayer setFillColor:](v3, "setFillColor:", [v4 CGColor]);

    v5 = [MEMORY[0x1E4FB1618] blackColor];
    [(_SUICRingLayer *)v3 setRingColor:v5];

    [(_SUICRingLayer *)v3 setStrokeEnd:1.0];
    [(_SUICRingLayer *)v3 setLineCap:*MEMORY[0x1E4F3A478]];
  }
  return v3;
}

- (void)setRingColor:(id)a3
{
  id v4 = (id) [a3 copy];
  -[_SUICRingLayer setStrokeColor:](self, "setStrokeColor:", [v4 CGColor]);
}

- (UIColor)ringColor
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithCGColor:", -[_SUICRingLayer strokeColor](self, "strokeColor"));
  v3 = (void *)[v2 copy];

  return (UIColor *)v3;
}

- (void)setCustomLineWidth:(double)a3
{
  if (self->_customLineWidth != a3)
  {
    self->_customLineWidth = a3;
    [(_SUICRingLayer *)self setNeedsLayout];
  }
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)_SUICRingLayer;
  -[_SUICRingLayer setFrame:](&v17, sel_setFrame_);
  [(_SUICRingLayer *)self customLineWidth];
  if (v8 <= 0.0)
  {
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    double v10 = CGRectGetWidth(v18);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double v9 = round((v10 + CGRectGetHeight(v19)) * 0.5 * 0.05);
  }
  else
  {
    [(_SUICRingLayer *)self customLineWidth];
  }
  [(_SUICRingLayer *)self setLineWidth:v9];
  UIRectGetCenter();
  double v12 = v11;
  double v14 = v13;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat v15 = CGRectGetHeight(v20) * 0.5;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v12, v14, (v15 + CGRectGetWidth(v21) * 0.5) * 0.5, 4.71238898, 10.9955743);
  id v16 = objc_claimAutoreleasedReturnValue();
  -[_SUICRingLayer setPath:](self, "setPath:", [v16 CGPath]);
}

- (double)customLineWidth
{
  return self->_customLineWidth;
}

@end