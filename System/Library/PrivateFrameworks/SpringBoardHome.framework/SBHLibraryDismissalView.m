@interface SBHLibraryDismissalView
+ (Class)layerClass;
- (SBHLibraryDismissalView)initWithFrame:(CGRect)a3;
- (SBIconImageInfo)iconImageInfo;
- (double)brightness;
- (id)layer;
- (void)layoutSubviews;
- (void)setBrightness:(double)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
@end

@implementation SBHLibraryDismissalView

- (SBHLibraryDismissalView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBHLibraryDismissalView;
  v3 = -[SBHLibraryDismissalView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SBHLibraryDismissalView *)v3 layer];
    id v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.18];
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));
    [v5 setFillRule:*MEMORY[0x1E4F39FB8]];
  }
  return v4;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    [(SBHLibraryDismissalView *)self setNeedsLayout];
  }
}

- (void)setBrightness:(double)a3
{
  if (self->_brightness != a3)
  {
    self->_brightness = a3;
    int IsOne = BSFloatIsOne();
    id v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:1.0 - a3 + (1.0 - (1.0 - a3)) * 0.18];
    double v6 = [(SBHLibraryDismissalView *)self layer];
    if (IsOne)
    {
      double v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"fillColor"];
      double v8 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [v7 setTimingFunction:v8];

      objc_msgSend(v7, "setFromValue:", objc_msgSend(v6, "fillColor"));
      [v7 setFillMode:*MEMORY[0x1E4F39FA8]];
      [v7 setDuration:0.3];
      objc_msgSend(v6, "setFillColor:", objc_msgSend(v9, "CGColor"));
      [v6 addAnimation:v7 forKey:0];
    }
    else
    {
      objc_msgSend(v6, "setFillColor:", objc_msgSend(v9, "CGColor"));
    }
  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)layer
{
  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryDismissalView;
  v2 = [(SBHLibraryDismissalView *)&v4 layer];
  return v2;
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)SBHLibraryDismissalView;
  [(SBHLibraryDismissalView *)&v38 layoutSubviews];
  [(SBHLibraryDismissalView *)self bounds];
  double v4 = v3;
  double continuousCornerRadius = self->_iconImageInfo.continuousCornerRadius;
  double v6 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:");
  double v7 = [MEMORY[0x1E4FB14C0] bezierPath];
  UIRectCenteredRect();
  double rect_16 = continuousCornerRadius / 6.0;
  CGFloat rect_24 = v39.size.width;
  CGFloat x = v39.origin.x;
  CGFloat rect = v39.origin.x;
  v39.origin.CGFloat y = v4 * 0.3 * 0.1 + v10;
  CGFloat y = v39.origin.y;
  CGFloat height = v39.size.height;
  CGRect v40 = CGRectInset(v39, continuousCornerRadius / 6.0, continuousCornerRadius / 6.0);
  double v12 = v40.origin.x;
  double v13 = v40.origin.y;
  CGFloat width = v40.size.width;
  CGFloat v15 = v40.size.height;
  long double v16 = atan(v40.size.height / (fmax(v40.size.width, 2.22507386e-308) * 0.5));
  long double rect_8 = 1.57079633 - v16;
  long double v37 = v16 + 1.57079633;
  v41.origin.CGFloat x = v12;
  v41.origin.CGFloat y = v13;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = v15;
  double MinX = CGRectGetMinX(v41);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = rect_24;
  v42.size.CGFloat height = height;
  objc_msgSend(v7, "moveToPoint:", MinX, CGRectGetMinY(v42));
  v43.origin.CGFloat x = v12;
  v43.origin.CGFloat y = v13;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = v15;
  double MaxX = CGRectGetMaxX(v43);
  v44.origin.CGFloat x = rect;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = rect_24;
  v44.size.CGFloat height = height;
  objc_msgSend(v7, "addLineToPoint:", MaxX, CGRectGetMinY(v44));
  v45.origin.CGFloat x = v12;
  v45.origin.CGFloat y = v13;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = v15;
  double v19 = CGRectGetMaxX(v45);
  v46.origin.CGFloat x = v12;
  v46.origin.CGFloat y = v13;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = v15;
  objc_msgSend(v7, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v19, CGRectGetMinY(v46), rect_16);
  [v7 currentPoint];
  double v21 = v20;
  v47.origin.CGFloat x = v12;
  v47.origin.CGFloat y = v13;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = v15;
  double v22 = v21 - CGRectGetWidth(v47) * 0.5;
  [v7 currentPoint];
  double v24 = v23;
  v48.origin.CGFloat x = v12;
  v48.origin.CGFloat y = v13;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = v15;
  objc_msgSend(v7, "addLineToPoint:", v22, v24 + CGRectGetHeight(v48));
  v49.origin.CGFloat x = v12;
  v49.origin.CGFloat y = v13;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = v15;
  double MidX = CGRectGetMidX(v49);
  v50.origin.CGFloat x = v12;
  v50.origin.CGFloat y = v13;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = v15;
  objc_msgSend(v7, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMaxY(v50), rect_16, (double)rect_8, (double)v37);
  [v7 currentPoint];
  double v27 = v26;
  v51.origin.CGFloat x = v12;
  v51.origin.CGFloat y = v13;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = v15;
  double v28 = v27 - CGRectGetWidth(v51) * 0.5;
  [v7 currentPoint];
  double v30 = v29;
  v52.origin.CGFloat x = v12;
  v52.origin.CGFloat y = v13;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = v15;
  objc_msgSend(v7, "addLineToPoint:", v28, v30 - CGRectGetHeight(v52));
  objc_msgSend(v7, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v12, v13, rect_16, (double)v37, 4.71238898);
  [v6 appendPath:v7];
  v31 = [(SBHLibraryDismissalView *)self layer];
  id v32 = v6;
  objc_msgSend(v31, "setPath:", objc_msgSend(v32, "CGPath"));
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (double)brightness
{
  return self->_brightness;
}

@end