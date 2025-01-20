@interface SFBadge
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)intrinsicContentSize;
- (SFBadge)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation SFBadge

- (SFBadge)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFBadge;
  v3 = -[SFBadge initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SFBadge *)v3 tintColor];
    [(SFBadge *)v4 setBackgroundColor:v5];

    uint64_t v6 = *MEMORY[0x1E4F39EA0];
    v7 = [(SFBadge *)v4 layer];
    [v7 setCornerCurve:v6];

    v8 = v4;
  }

  return v4;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)SFBadge;
  [(SFBadge *)&v4 tintColorDidChange];
  v3 = [(SFBadge *)self tintColor];
  [(SFBadge *)self setBackgroundColor:v3];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SFBadge;
  [(SFBadge *)&v10 layoutSubviews];
  [(SFBadge *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  double v7 = CGRectGetWidth(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double v8 = fmin(v7, CGRectGetHeight(v12)) * 0.5;
  v9 = [(SFBadge *)self layer];
  [v9 setCornerRadius:v8];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 6.0;
  double v3 = 6.0;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

@end