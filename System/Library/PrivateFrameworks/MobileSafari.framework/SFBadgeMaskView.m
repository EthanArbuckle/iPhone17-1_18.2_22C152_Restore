@interface SFBadgeMaskView
+ (Class)layerClass;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)badgeRect;
- (SFBadgeMaskView)initWithFrame:(CGRect)a3;
- (void)_updateShape;
- (void)layoutSubviews;
- (void)setBadgeRect:(CGRect)a3;
@end

@implementation SFBadgeMaskView

- (SFBadgeMaskView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SFBadgeMaskView;
  v3 = -[SFBadgeMaskView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v5 = [v4 CGColor];
    v6 = [(SFBadgeMaskView *)v3 shapeLayer];
    [v6 setFillColor:v5];

    v7 = v3;
  }

  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3 = [(SFBadgeMaskView *)self shapeLayer];
  BoundingBoCGFloat x = CGPathGetBoundingBox((CGPathRef)[v3 path]);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  [(SFBadgeMaskView *)self bounds];
  v16.origin.CGFloat x = v8;
  v16.origin.CGFloat y = v9;
  v16.size.CGFloat width = v10;
  v16.size.CGFloat height = v11;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  BOOL v12 = CGRectEqualToRect(v15, v16);

  if (!v12)
  {
    [(SFBadgeMaskView *)self _updateShape];
  }
}

- (void)setBadgeRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_badgeRect = &self->_badgeRect;
  if (!CGRectEqualToRect(a3, self->_badgeRect))
  {
    p_badgeRect->origin.CGFloat x = x;
    p_badgeRect->origin.CGFloat y = y;
    p_badgeRect->size.CGFloat width = width;
    p_badgeRect->size.CGFloat height = height;
    [(SFBadgeMaskView *)self _updateShape];
  }
}

- (void)_updateShape
{
  v3 = (void *)MEMORY[0x1E4FB14C0];
  [(SFBadgeMaskView *)self bounds];
  id v4 = objc_msgSend(v3, "bezierPathWithRect:");
  uint64_t v5 = (void *)MEMORY[0x1E4FB14C0];
  CGRect v12 = CGRectInset(self->_badgeRect, -2.0, -2.0);
  v6 = objc_msgSend(v5, "bezierPathWithOvalInRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  v7 = [v6 bezierPathByReversingPath];
  [v4 appendPath:v7];

  id v10 = v4;
  uint64_t v8 = [v10 CGPath];
  CGFloat v9 = [(SFBadgeMaskView *)self shapeLayer];
  [v9 setPath:v8];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (CGRect)badgeRect
{
  double x = self->_badgeRect.origin.x;
  double y = self->_badgeRect.origin.y;
  double width = self->_badgeRect.size.width;
  double height = self->_badgeRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end