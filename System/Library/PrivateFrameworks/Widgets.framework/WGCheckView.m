@interface WGCheckView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)isChecked;
- (CGPath)_newPathForBounds:(CGRect)a3;
- (WGCheckView)initWithFrame:(CGRect)a3;
- (void)_invalidatePath;
- (void)layoutSubviews;
- (void)setChecked:(BOOL)a3;
@end

@implementation WGCheckView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (WGCheckView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WGCheckView;
  v3 = -[WGCheckView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(WGCheckView *)v3 _shapeLayer];
    id v6 = [MEMORY[0x263F1C550] clearColor];
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

    id v7 = [MEMORY[0x263F1C550] whiteColor];
    objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

    [v5 setLineWidth:1.0];
    [(WGCheckView *)v4 setChecked:0];
  }
  return v4;
}

- (BOOL)isChecked
{
  v2 = [(WGCheckView *)self _shapeLayer];
  [v2 strokeEnd];
  BOOL v4 = fabs(v3 + -1.0) < 2.22044605e-16;

  return v4;
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(WGCheckView *)self _shapeLayer];
  id v6 = v4;
  double v5 = 0.0;
  if (v3) {
    double v5 = 1.0;
  }
  [v4 setStrokeEnd:v5];
}

- (void)layoutSubviews
{
  BOOL v3 = [(WGCheckView *)self _shapeLayer];
  uint64_t v4 = [v3 path];

  if (!v4)
  {
    [(WGCheckView *)self bounds];
    double v5 = -[WGCheckView _newPathForBounds:](self, "_newPathForBounds:");
    id v6 = [(WGCheckView *)self _shapeLayer];
    [v6 setPath:v5];

    CGPathRelease(v5);
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"strokeEnd"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WGCheckView;
    BOOL v5 = [(WGCheckView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)_invalidatePath
{
  BOOL v3 = [(WGCheckView *)self _shapeLayer];
  [v3 setPath:0];

  [(WGCheckView *)self setNeedsLayout];
}

- (CGPath)_newPathForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGFloat v8 = CGRectGetWidth(v15) * 0.2;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGFloat v9 = CGRectGetHeight(v16);
  CGPathMoveToPoint(Mutable, 0, v8, v9 * 0.525);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGFloat v10 = CGRectGetWidth(v17) * 0.375;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat v11 = CGRectGetHeight(v18);
  CGPathAddLineToPoint(Mutable, 0, v10, v11 * 0.7);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat v12 = CGRectGetWidth(v19) * 0.775;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat v13 = CGRectGetHeight(v20);
  CGPathAddLineToPoint(Mutable, 0, v12, v13 * 0.3);
  return Mutable;
}

@end