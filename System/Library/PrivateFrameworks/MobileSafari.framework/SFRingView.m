@interface SFRingView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (SFRingView)initWithFrame:(CGRect)a3;
- (double)radius;
- (void)setRadius:(double)a3;
- (void)tintColorDidChange;
@end

@implementation SFRingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SFRingView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFRingView;
  v3 = -[SFRingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SFRingView *)v3 shapeLayer];
    [v5 setFillColor:0];
    [v5 setLineCap:*MEMORY[0x1E4F3A458]];
    v6 = v4;
  }
  return v4;
}

- (void)setRadius:(double)a3
{
  if (self->_radius != a3)
  {
    self->_radius = a3;
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a3, a3, a3, -1.57079633, 4.71238898);
    id v6 = objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v6 CGPath];
    v5 = [(SFRingView *)self shapeLayer];
    [v5 setPath:v4];
  }
}

- (void)tintColorDidChange
{
  id v7 = [(SFRingView *)self tintColor];
  v3 = [(SFRingView *)self traitCollection];
  id v4 = [v7 resolvedColorWithTraitCollection:v3];
  uint64_t v5 = [v4 CGColor];
  id v6 = [(SFRingView *)self shapeLayer];
  [v6 setStrokeColor:v5];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"strokeEnd"] & 1) != 0
    || ([v4 isEqualToString:@"strokeColor"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SFRingView;
    BOOL v5 = [(SFRingView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (double)radius
{
  return self->_radius;
}

@end