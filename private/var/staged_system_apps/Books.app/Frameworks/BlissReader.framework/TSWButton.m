@interface TSWButton
- (UIEdgeInsets)hitRegionEdgeInsets;
- (double)hitRegionInset;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setHitRegionEdgeInsets:(UIEdgeInsets)a3;
- (void)setHitRegionInset:(double)a3;
@end

@implementation TSWButton

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v5 = self;
  [(TSWButton *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(TSWButton *)v5 hitRegionEdgeInsets];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  if (([(TSWButton *)v5 isHidden] & 1) != 0
    || (v25.origin.x = v7 + v17,
        v25.origin.y = v9 + v15,
        v25.size.width = v11 - (v17 + v21),
        v25.size.height = v13 - (v15 + v19),
        !CGRectContainsPoint(v25, a3)))
  {
    v24.receiver = v5;
    v24.super_class = (Class)TSWButton;
    return -[TSWButton hitTest:withEvent:](&v24, "hitTest:withEvent:", a4, a3.x, a3.y);
  }
  return v5;
}

- (double)hitRegionInset
{
  return 0.0;
}

- (void)setHitRegionInset:(double)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  +[CATransaction begin];
  v5.receiver = self;
  v5.super_class = (Class)TSWButton;
  [(TSWButton *)&v5 setHighlighted:v3];
  +[CATransaction commit];
}

- (UIEdgeInsets)hitRegionEdgeInsets
{
  double top = self->mHitRegionEdgeInsets.top;
  double left = self->mHitRegionEdgeInsets.left;
  double bottom = self->mHitRegionEdgeInsets.bottom;
  double right = self->mHitRegionEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHitRegionEdgeInsets:(UIEdgeInsets)a3
{
  self->mHitRegionEdgeInsets = a3;
}

@end