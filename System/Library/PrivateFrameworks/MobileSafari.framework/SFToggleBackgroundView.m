@interface SFToggleBackgroundView
+ (Class)layerClass;
- (id)shapeLayer;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_updateShape;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation SFToggleBackgroundView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)shapeLayer
{
  if (a1)
  {
    a1 = [a1 layer];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFToggleBackgroundView;
  [(SFToggleBackgroundView *)&v3 layoutSubviews];
  -[SFToggleBackgroundView _updateShape](self);
}

- (void)_updateShape
{
  if (a1)
  {
    uint64_t v2 = a1[53];
    int v3 = objc_msgSend(a1, "_sf_usesLeftToRightLayout");
    [a1 _continuousCornerRadius];
    if (v2) {
      int v5 = v3;
    }
    else {
      int v5 = 1;
    }
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    int v7 = v3 ^ 1;
    if (!v2) {
      int v7 = 1;
    }
    if (v5) {
      double v8 = v4;
    }
    else {
      double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    if (v5) {
      double v9 = v4;
    }
    else {
      double v9 = *MEMORY[0x1E4F1DB30];
    }
    double v28 = v8;
    double v29 = v9;
    if (v7) {
      double v6 = v4;
    }
    else {
      double v4 = *MEMORY[0x1E4F1DB30];
    }
    double v30 = v4;
    double v31 = v6;
    [a1 bounds];
    CGFloat x = v34.origin.x;
    CGFloat y = v34.origin.y;
    CGFloat width = v34.size.width;
    CGFloat height = v34.size.height;
    double MinX = CGRectGetMinX(v34);
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v35);
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v36);
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    double v16 = CGRectGetMinY(v37);
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    double v26 = CGRectGetMaxX(v38);
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v39);
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    double v27 = CGRectGetMinX(v40);
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    double v18 = CGRectGetMaxY(v41);
    v19 = [MEMORY[0x1E4FB14C0] bezierPath];
    objc_msgSend(v19, "moveToPoint:", MinX, MinY + v28 * 1.528665);
    objc_msgSend(v19, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, MinX, MinY, v29, v28);
    objc_msgSend(v19, "addLineToPoint:", MaxX - v30 * 1.528665, v16);
    objc_msgSend(v19, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, MaxX, v16, v30, v31);
    objc_msgSend(v19, "addLineToPoint:", v26, MaxY - v31 * 1.528665);
    objc_msgSend(v19, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v26, MaxY, v30, v31);
    objc_msgSend(v19, "addLineToPoint:", v27 + v29 * 1.528665, v18);
    objc_msgSend(v19, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v27, v18, v29, v28);
    [v19 closePath];
    v20 = [a1 layer];
    id v32 = v19;
    objc_msgSend(v20, "setPath:", objc_msgSend(v32, "CGPath"));
    v21 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"path"];
    v22 = [v20 presentationLayer];
    v23 = [v22 valueForKeyPath:@"path"];
    [v21 setFromValue:v23];

    v24 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    [v21 setTimingFunction:v24];

    [v21 setFillMode:*MEMORY[0x1E4F39F98]];
    [v21 setRemovedOnCompletion:1];
    [v20 addAnimation:v21 forKey:@"path"];
  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
  [(SFToggleBackgroundView *)self _continuousCornerRadius];
  if (v5 != a3) {
    [(SFToggleBackgroundView *)self setNeedsLayout];
  }
  v6.receiver = self;
  v6.super_class = (Class)SFToggleBackgroundView;
  [(SFToggleBackgroundView *)&v6 _setContinuousCornerRadius:a3];
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)SFToggleBackgroundView;
  [(SFToggleBackgroundView *)&v6 tintColorDidChange];
  id v3 = [(SFToggleBackgroundView *)self tintColor];
  uint64_t v4 = [v3 CGColor];
  double v5 = -[SFToggleBackgroundView shapeLayer](self);
  [v5 setFillColor:v4];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)SFToggleBackgroundView;
  [(SFToggleBackgroundView *)&v6 _dynamicUserInterfaceTraitDidChange];
  id v3 = [(SFToggleBackgroundView *)self tintColor];
  uint64_t v4 = [v3 CGColor];
  double v5 = -[SFToggleBackgroundView shapeLayer](self);
  [v5 setFillColor:v4];
}

@end