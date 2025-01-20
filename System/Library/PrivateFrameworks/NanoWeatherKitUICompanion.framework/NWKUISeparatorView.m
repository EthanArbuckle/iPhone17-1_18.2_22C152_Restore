@interface NWKUISeparatorView
+ (double)lineWidth;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (NWKUISeparatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NWKUISeparatorView

- (NWKUISeparatorView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NWKUISeparatorView;
  v3 = -[NWKUISeparatorView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F15880] layer];
    lineLayer = v3->_lineLayer;
    v3->_lineLayer = (CAShapeLayer *)v4;

    v6 = v3->_lineLayer;
    id v7 = [MEMORY[0x263F825C8] whiteColor];
    -[CAShapeLayer setStrokeColor:](v6, "setStrokeColor:", [v7 CGColor]);

    v3->_lineWidth = 1.5;
    [(CAShapeLayer *)v3->_lineLayer setShouldRasterize:1];
    v8 = v3->_lineLayer;
    v9 = [MEMORY[0x263F82B60] mainScreen];
    [v9 scale];
    -[CAShapeLayer setRasterizationScale:](v8, "setRasterizationScale:");

    [(CAShapeLayer *)v3->_lineLayer setLineCap:*MEMORY[0x263F15E70]];
    LODWORD(v10) = 1045220557;
    [(CAShapeLayer *)v3->_lineLayer setOpacity:v10];
    v11 = [(NWKUISeparatorView *)v3 layer];
    [v11 addSublayer:v3->_lineLayer];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(NWKUISeparatorView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  CGFloat v9 = self->_lineWidth * 0.5;
  CGFloat v10 = v7 - v9;
  v11 = [MEMORY[0x263F82B60] mainScreen];
  [v11 scale];
  CGFloat v13 = 0.5 / v12;

  double lineWidth = self->_lineWidth;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v9, v13);
  CGPathAddLineToPoint(Mutable, 0, v10, v13);
  [(CAShapeLayer *)self->_lineLayer setPath:Mutable];
  -[CAShapeLayer setFrame:](self->_lineLayer, "setFrame:", v4, v6, v8, lineWidth);
  CGPathRelease(Mutable);
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83C20];
  double lineWidth = self->_lineWidth;
  result.height = lineWidth;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double lineWidth = self->_lineWidth;
  result.height = lineWidth;
  return result;
}

+ (double)lineWidth
{
  return 1.5;
}

- (void).cxx_destruct
{
}

@end