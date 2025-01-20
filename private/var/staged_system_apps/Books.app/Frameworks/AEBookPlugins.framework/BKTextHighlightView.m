@interface BKTextHighlightView
+ (int)bkTextHighlightTypeForIMTextHighlightType:(unint64_t)a3;
- (AEHighlightLine)highlightLine;
- (BKTextHighlightView)initWithFrame:(CGRect)a3;
- (BOOL)imageHighlight;
- (BOOL)lightenBlend;
- (CGRect)_safeInsetRect:(CGRect)a3 widthInset:(double)a4 heightInset:(double)a5;
- (UIEdgeInsets)contentInsets;
- (float)currentScale;
- (id)_selectionImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)owner;
- (int)highlightType;
- (void)didMoveToSuperview;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setCurrentScale:(float)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlightLine:(id)a3;
- (void)setHighlightType:(int)a3;
- (void)setImageHighlight:(BOOL)a3;
- (void)setLightenBlend:(BOOL)a3;
- (void)setOwner:(id)a3;
- (void)updateHighlightImage;
@end

@implementation BKTextHighlightView

- (BKTextHighlightView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKTextHighlightView;
  v3 = -[BKTextHighlightView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(BKTextHighlightView *)v3 layer];
    [v5 setMasksToBounds:1];

    [(BKTextHighlightView *)v4 setOpaque:0];
    [(BKTextHighlightView *)v4 setUserInteractionEnabled:1];
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [BKTextHighlightView alloc];
  [(BKTextHighlightView *)self frame];
  v5 = -[BKTextHighlightView initWithFrame:](v4, "initWithFrame:");
  [(BKTextHighlightView *)v5 setHighlightType:[(BKTextHighlightView *)self highlightType]];
  v6 = [(BKTextHighlightView *)self owner];
  [(BKTextHighlightView *)v5 setOwner:v6];

  objc_super v7 = [(BKTextHighlightView *)self image];
  [(BKTextHighlightView *)v5 setImage:v7];

  [(BKTextHighlightView *)self currentScale];
  -[BKTextHighlightView setCurrentScale:](v5, "setCurrentScale:");
  [(BKTextHighlightView *)v5 setLightenBlend:[(BKTextHighlightView *)self lightenBlend]];
  return v5;
}

+ (int)bkTextHighlightTypeForIMTextHighlightType:(unint64_t)a3
{
  if (a3 - 1 < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)BKTextHighlightView;
  [(BKTextHighlightView *)&v4 didMoveToSuperview];
  v3 = [(BKTextHighlightView *)self image];

  if (!v3) {
    [(BKTextHighlightView *)self updateHighlightImage];
  }
}

- (CGRect)_safeInsetRect:(CGRect)a3 widthInset:(double)a4 heightInset:(double)a5
{
  if (a3.size.width <= a4 + a4) {
    a4 = 0.0;
  }
  if (a3.size.height <= a5 + a5) {
    a5 = 0.0;
  }
  return CGRectInset(a3, a4, a5);
}

- (id)_selectionImage
{
  int type = self->_type;
  if (type == 3)
  {
    double v6 = 0.9;
    double v4 = 1.0;
    double v5 = 1.0;
    goto LABEL_5;
  }
  if (!type)
  {
    double v4 = 0.647058824;
    double v5 = 0.780392157;
    double v6 = 0.47;
LABEL_5:
    double v7 = 1.0;
    goto LABEL_7;
  }
  double v5 = 0.89;
  double v7 = 0.22;
  double v4 = 1.0;
  double v6 = 1.0;
LABEL_7:
  id v8 = +[UIColor colorWithRed:v4 green:v5 blue:v7 alpha:v6];
  [(BKTextHighlightView *)self bounds];
  v26.width = v9;
  v26.height = v10;
  UIGraphicsBeginImageContextWithOptions(v26, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  [(BKTextHighlightView *)self bounds];
  -[BKTextHighlightView _safeInsetRect:widthInset:heightInset:](self, "_safeInsetRect:widthInset:heightInset:");
  v12 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  CGContextSaveGState(CurrentContext);
  [v12 addClip];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)locations = xmmword_18EDF0;
  id v14 = v8;
  v23[0] = [v14 CGColor];
  id v15 = v14;
  v23[1] = [v15 CGColor:v23[0]];
  CFArrayRef v16 = CFArrayCreate(0, v23, 2, &kCFTypeArrayCallBacks);
  v17 = CGGradientCreateWithColors(DeviceRGB, v16, locations);
  [(BKTextHighlightView *)self bounds];
  CGFloat MidX = CGRectGetMidX(v29);
  [(BKTextHighlightView *)self bounds];
  CGFloat MinY = CGRectGetMinY(v30);
  [(BKTextHighlightView *)self bounds];
  CGFloat v20 = CGRectGetMidX(v31);
  [(BKTextHighlightView *)self bounds];
  v28.y = CGRectGetMaxY(v32);
  v27.x = MidX;
  v27.y = MinY;
  v28.x = v20;
  CGContextDrawLinearGradient(CurrentContext, v17, v27, v28, 0);
  CGGradientRelease(v17);
  CFRelease(v16);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRestoreGState(CurrentContext);
  v21 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v21;
}

- (void)updateHighlightImage
{
  [(BKTextHighlightView *)self frame];
  if (CGRectGetWidth(v33) != 0.0)
  {
    v3 = [(BKTextHighlightView *)self superview];

    if (v3)
    {
      [(BKTextHighlightView *)self setHidden:1];
      if (self->_type > 3u)
      {
        id v29 = 0;
      }
      else
      {
        id v29 = [(BKTextHighlightView *)self _selectionImage];
      }
      [(BKTextHighlightView *)self frame];
      CGFloat v5 = v4;
      CGFloat v7 = v6;
      double top = self->_contentInsets.top;
      double left = self->_contentInsets.left;
      double v10 = left + 0.0;
      double v11 = top + 0.0;
      double v12 = v4 - (left + self->_contentInsets.right);
      double v13 = v6 - (top + self->_contentInsets.bottom);
      v31.width = v12;
      v31.height = v13;
      UIGraphicsBeginImageContextWithOptions(v31, 0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      [(BKTextHighlightView *)self frame];
      CGFloat v15 = -CGRectGetMinX(v34);
      v35.origin.x = v10;
      v35.origin.y = v11;
      v35.size.width = v12;
      v35.size.height = v13;
      CGFloat v16 = v15 - CGRectGetMinX(v35);
      [(BKTextHighlightView *)self frame];
      CGFloat v17 = -CGRectGetMinY(v36);
      v37.origin.x = v10;
      v37.origin.y = v11;
      v37.size.width = v12;
      v37.size.height = v13;
      CGFloat MinY = CGRectGetMinY(v37);
      CGContextTranslateCTM(CurrentContext, v16, v17 - MinY);
      v19 = [(BKTextHighlightView *)self superview];
      CGFloat v20 = [v19 layer];
      [v20 renderInContext:CurrentContext];

      v21 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      if (v29)
      {
        v32.width = v5;
        v32.height = v7;
        UIGraphicsBeginImageContextWithOptions(v32, 0, 0.0);
        v22 = UIGraphicsGetCurrentContext();
        CGContextSaveGState(v22);
        [(BKTextHighlightView *)self lightenBlend];
        [(BKTextHighlightView *)self bounds];
        [v29 drawInRect:0];
        if (!self->_type)
        {
          CGContextSetBlendMode(v22, kCGBlendModeSourceAtop);
          v23 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
          [v23 set];

          [(BKTextHighlightView *)self bounds];
          -[BKTextHighlightView _safeInsetRect:widthInset:heightInset:](self, "_safeInsetRect:widthInset:heightInset:");
          v24 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
          [v24 stroke];
        }
        CGContextRestoreGState(v22);
        if ([(BKTextHighlightView *)self lightenBlend]) {
          uint64_t v25 = 2;
        }
        else {
          uint64_t v25 = 1;
        }
        [v21 drawInRect:v25 blendMode:v10 alpha:v11];
        if (self->_type == 3)
        {
          CGContextSetBlendMode(v22, kCGBlendModeNormal);
          CGSize v26 = +[UIColor colorWithWhite:0.0 alpha:0.2];
          [v26 setStroke];

          [(BKTextHighlightView *)self bounds];
          -[BKTextHighlightView _safeInsetRect:widthInset:heightInset:](self, "_safeInsetRect:widthInset:heightInset:");
          CGPoint v27 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
          [v27 stroke];
        }
        CGPoint v28 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [(BKTextHighlightView *)self setImage:v28];
      }
      [(BKTextHighlightView *)self setHidden:0];
    }
  }
}

- (void)setHighlightType:(int)a3
{
  if (self->_type != a3)
  {
    self->_int type = a3;
    [(BKTextHighlightView *)self updateHighlightImage];
  }
}

- (void)setFrame:(CGRect)a3
{
  CGRect v13 = CGRectIntegral(a3);
  double x = v13.origin.x;
  double y = v13.origin.y;
  double width = v13.size.width;
  double height = v13.size.height;
  [(BKTextHighlightView *)self frame];
  v15.origin.double x = v8;
  v15.origin.double y = v9;
  v15.size.double width = v10;
  v15.size.double height = v11;
  v14.origin.double x = x;
  v14.origin.double y = y;
  v14.size.double width = width;
  v14.size.double height = height;
  if (!CGRectEqualToRect(v14, v15))
  {
    v12.receiver = self;
    v12.super_class = (Class)BKTextHighlightView;
    -[BKTextHighlightView setFrame:](&v12, "setFrame:", x, y, width, height);
    [(BKTextHighlightView *)self updateHighlightImage];
  }
}

- (id)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (BOOL)imageHighlight
{
  return self->_imageHighlight;
}

- (void)setImageHighlight:(BOOL)a3
{
  self->_imageHighlight = a3;
}

- (float)currentScale
{
  return self->_currentScale;
}

- (void)setCurrentScale:(float)a3
{
  self->_currentScale = a3;
}

- (BOOL)lightenBlend
{
  return self->_lightenBlend;
}

- (void)setLightenBlend:(BOOL)a3
{
  self->_lightenBlend = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (int)highlightType
{
  return self->_type;
}

- (AEHighlightLine)highlightLine
{
  return self->_highlightLine;
}

- (void)setHighlightLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightLine, 0);

  objc_storeStrong(&self->_owner, 0);
}

@end