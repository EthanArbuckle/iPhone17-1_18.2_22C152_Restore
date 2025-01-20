@interface TextLineLayer
- (UIColor)lineColor;
- (UIEdgeInsets)insets;
- (double)centerOffset;
- (double)lineWidth;
- (void)drawInContext:(CGContext *)a3;
- (void)setCenterOffset:(double)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setLineColor:(id)a3;
- (void)setLineWidth:(double)a3;
@end

@implementation TextLineLayer

- (void)drawInContext:(CGContext *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)TextLineLayer;
  -[TextLineLayer drawInContext:](&v24, sel_drawInContext_);
  UIGraphicsPushContext(a3);
  [(TextLineLayer *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(TextLineLayer *)self lineWidth];
  double v14 = v13;
  [(TextLineLayer *)self centerOffset];
  double v16 = v15;
  v17 = [(TextLineLayer *)self lineColor];
  [v17 setFill];

  [(TextLineLayer *)self insets];
  double v19 = v18;
  double v21 = v20;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  float v22 = v16 + CGRectGetMidY(v25) + v14 * -0.5;
  CGFloat v23 = ceilf(v22);
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  v27.size.width = CGRectGetWidth(v26) - v19 - v21;
  v27.origin.x = v19;
  v27.origin.y = v23;
  v27.size.height = v14;
  CGContextFillRect(a3, v27);
  UIGraphicsPopContext();
}

- (double)centerOffset
{
  return self->_centerOffset;
}

- (void)setCenterOffset:(double)a3
{
  self->_centerOffset = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (void)setLineColor:(id)a3
{
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (void).cxx_destruct
{
}

@end