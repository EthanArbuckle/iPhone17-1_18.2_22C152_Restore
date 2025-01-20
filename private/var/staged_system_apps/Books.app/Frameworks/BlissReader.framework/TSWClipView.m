@interface TSWClipView
- (BOOL)needInnerMask;
- (BOOL)needOuterMask;
- (TSDBezierPath)innerPath;
- (TSDBezierPath)outerPath;
- (TSWClipView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)fadeSizes;
- (UIView)innerClipView;
- (UIView)outerClipView;
- (double)maskGroupVerticalInset;
- (id)p_innerMaskLayerWithBounds:(CGRect)a3 path:(CGPath *)a4 fadeSizes:(UIEdgeInsets)a5;
- (id)p_outerMaskLayerWithFrame:(CGRect)a3 path:(CGPath *)a4;
- (void)addBackgroundView:(id)a3;
- (void)addContentView:(id)a3;
- (void)dealloc;
- (void)p_clearViewMasks;
- (void)p_updateViewMasks;
- (void)setBounds:(CGRect)a3;
- (void)setFadeSizes:(UIEdgeInsets)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInnerClipView:(id)a3;
- (void)setInnerPath:(id)a3;
- (void)setMaskGroupVerticalInset:(double)a3;
- (void)setOuterClipView:(id)a3;
- (void)setOuterPath:(id)a3;
- (void)updateClipWithOuterPath:(CGPath *)a3 innerPath:(CGPath *)a4 fadeSizes:(UIEdgeInsets)a5;
@end

@implementation TSWClipView

- (TSWClipView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TSWClipView;
  v3 = -[TSWClipView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIView);
    [(TSWClipView *)v3 bounds];
    v5 = [v4 initWithFrame:];
    v3->_outerClipView = v5;
    [(TSWClipView *)v3 addSubview:v5];
    id v6 = objc_alloc((Class)UIView);
    [(TSWClipView *)v3 bounds];
    v7 = [v6 initWithFrame:];
    v3->_innerClipView = v7;
    [(UIView *)v3->_outerClipView addSubview:v7];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWClipView;
  [(TSWClipView *)&v3 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TSWClipView;
  -[TSWClipView setFrame:](&v12, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(TSWClipView *)self bounds];
  -[UIView setFrame:]([(TSWClipView *)self outerClipView], "setFrame:", v4, v5, v6, v7);
  [(TSWClipView *)self bounds];
  -[UIView setFrame:]([(TSWClipView *)self innerClipView], "setFrame:", v8, v9, v10, v11);
  [(TSWClipView *)self p_clearViewMasks];
  [(TSWClipView *)self p_updateViewMasks];
}

- (void)setBounds:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TSWClipView;
  -[TSWClipView setBounds:](&v12, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(TSWClipView *)self bounds];
  -[UIView setFrame:]([(TSWClipView *)self outerClipView], "setFrame:", v4, v5, v6, v7);
  [(TSWClipView *)self bounds];
  -[UIView setFrame:]([(TSWClipView *)self innerClipView], "setFrame:", v8, v9, v10, v11);
  [(TSWClipView *)self p_clearViewMasks];
  [(TSWClipView *)self p_updateViewMasks];
}

- (void)updateClipWithOuterPath:(CGPath *)a3 innerPath:(CGPath *)a4 fadeSizes:(UIEdgeInsets)a5
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;

  self->_outerPath = +[TSDBezierPath bezierPathWithCGPath:a3];
  self->_innerPath = +[TSDBezierPath bezierPathWithCGPath:a4];
  self->_fadeSizes.CGFloat top = top;
  self->_fadeSizes.CGFloat left = left;
  self->_fadeSizes.CGFloat bottom = bottom;
  self->_fadeSizes.CGFloat right = right;
  TSURound();
  self->_fadeSizes.CGFloat top = v12;
  TSURound();
  self->_fadeSizes.CGFloat bottom = v13;
  TSURound();
  self->_fadeSizes.CGFloat left = v14;
  TSURound();
  self->_fadeSizes.CGFloat right = v15;
  [(TSWClipView *)self p_clearViewMasks];

  [(TSWClipView *)self p_updateViewMasks];
}

- (void)addBackgroundView:(id)a3
{
  [(UIView *)self->_outerClipView insertSubview:a3 belowSubview:self->_innerClipView];

  [(TSWClipView *)self p_updateViewMasks];
}

- (void)addContentView:(id)a3
{
  [(UIView *)self->_innerClipView addSubview:a3];

  [(TSWClipView *)self p_updateViewMasks];
}

- (BOOL)needOuterMask
{
  return [(NSArray *)[(UIView *)self->_outerClipView subviews] count] >= 2 && self->_outerPath != 0;
}

- (BOOL)needInnerMask
{
  NSUInteger v3 = [(NSArray *)[(UIView *)self->_innerClipView subviews] count];
  if (v3) {
    LOBYTE(v3) = self->_innerPath != 0;
  }
  return v3;
}

- (void)p_clearViewMasks
{
  [(CALayer *)[(UIView *)self->_outerClipView layer] setMask:0];
  NSUInteger v3 = [(UIView *)self->_innerClipView layer];

  [(CALayer *)v3 setMask:0];
}

- (void)p_updateViewMasks
{
  unsigned int v3 = [(TSWClipView *)self needOuterMask];
  double v4 = [(UIView *)self->_outerClipView layer];
  if (v3)
  {
    if ([(CALayer *)v4 mask]) {
      goto LABEL_6;
    }
    [(UIView *)self->_outerClipView bounds];
    id v9 = -[TSWClipView p_outerMaskLayerWithFrame:path:](self, "p_outerMaskLayerWithFrame:path:", [(TSDBezierPath *)self->_outerPath CGPath], v5, v6, v7, v8);
    double v4 = [(UIView *)self->_outerClipView layer];
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }
  [(CALayer *)v4 setMask:v10];
LABEL_6:
  unsigned int v11 = [(TSWClipView *)self needInnerMask];
  CGFloat v12 = [(UIView *)self->_innerClipView layer];
  if (v11)
  {
    if ([(CALayer *)v12 mask]) {
      return;
    }
    [(UIView *)self->_innerClipView bounds];
    id v18 = -[TSWClipView p_innerMaskLayerWithBounds:path:fadeSizes:](self, "p_innerMaskLayerWithBounds:path:fadeSizes:", [(TSDBezierPath *)self->_innerPath CGPath], v14, v15, v16, v17, self->_fadeSizes.top, self->_fadeSizes.left, self->_fadeSizes.bottom, self->_fadeSizes.right);
    CGFloat v12 = [(UIView *)self->_innerClipView layer];
    id v13 = v18;
  }
  else
  {
    id v13 = 0;
  }

  [(CALayer *)v12 setMask:v13];
}

- (id)p_innerMaskLayerWithBounds:(CGRect)a3 path:(CGPath *)a4 fadeSizes:(UIEdgeInsets)a5
{
  double rect_8 = a5.bottom;
  double rect_16 = a3.size.width;
  CGFloat top = a5.top;
  double rect_24 = a3.size.height;
  double x = a3.origin.x;
  double y = a3.origin.y;
  [(TSWClipView *)self maskGroupVerticalInset];
  double v7 = top;
  CGPathGetBoundingBox(a4);
  TSDRoundedRectForMainScreen();
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v16 = (CGContext *)TSUCreateRGBABitmapContext();
  double v17 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", [+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0, 0.0) CGColor], [+[TSUColor colorWithWhite:0.0 alpha:1.0] CGColor], 0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v19 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)v17, 0);
  CGContextAddPath(v16, a4);
  CGContextClip(v16);
  v38.origin.double x = v9;
  v38.origin.double y = v11;
  v38.size.width = v13;
  v38.size.height = v15;
  CGFloat MinY = CGRectGetMinY(v38);
  v39.origin.double x = v9;
  v39.origin.double y = v11;
  v39.size.width = v13;
  v39.size.height = v15;
  v36.double y = v7 + CGRectGetMinY(v39);
  v34.double x = 0.0;
  v36.double x = 0.0;
  v34.double y = MinY;
  CGContextDrawLinearGradient(v16, v19, v34, v36, 0);
  v40.origin.double x = v9;
  v40.origin.double y = v11;
  v40.size.width = v13;
  v40.size.height = v15;
  CGFloat MaxY = CGRectGetMaxY(v40);
  v41.origin.double x = v9;
  v41.origin.double y = v11;
  v41.size.width = v13;
  v41.size.height = v15;
  v37.double y = CGRectGetMaxY(v41) - rect_8;
  v35.double x = 0.0;
  v37.double x = 0.0;
  v35.double y = MaxY;
  CGContextDrawLinearGradient(v16, v19, v35, v37, 0);
  CGContextSetRGBFillColor(v16, 0.0, 0.0, 0.0, 1.0);
  v42.origin.double x = v9;
  v42.origin.double y = v11;
  v42.size.width = v13;
  v42.size.height = v15;
  CGFloat rect = CGRectGetMinX(v42);
  v43.origin.double x = v9;
  v43.origin.double y = v11;
  v43.size.width = v13;
  v43.size.height = v15;
  CGFloat v22 = v7 + CGRectGetMinY(v43);
  v44.origin.double x = v9;
  v44.origin.double y = v11;
  v44.size.width = v13;
  v44.size.height = v15;
  CGFloat Width = CGRectGetWidth(v44);
  v45.origin.double x = v9;
  v45.origin.double y = v11;
  v45.size.width = v13;
  v45.size.height = v15;
  v46.size.height = CGRectGetHeight(v45) - v7 - rect_8;
  v46.origin.double x = rect;
  v46.origin.double y = v22;
  v46.size.width = Width;
  CGContextFillRect(v16, v46);
  CGGradientRelease(v19);
  CGColorSpaceRelease(DeviceRGB);
  Image = CGBitmapContextCreateImage(v16);
  CGContextRelease(v16);
  id v25 = objc_alloc_init((Class)CALayer);
  [v25 setFrame:x, y, rect_16, rect_24];
  [v25 setContents:Image];
  CGImageRelease(Image);

  return v25;
}

- (id)p_outerMaskLayerWithFrame:(CGRect)a3 path:(CGPath *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = objc_alloc_init((Class)CAShapeLayer);
  [v9 setFrame:CGRectMake(x, y, width, height)];
  [v9 setPath:a4];

  return v9;
}

- (UIView)outerClipView
{
  return self->_outerClipView;
}

- (void)setOuterClipView:(id)a3
{
}

- (UIView)innerClipView
{
  return self->_innerClipView;
}

- (void)setInnerClipView:(id)a3
{
}

- (TSDBezierPath)outerPath
{
  return self->_outerPath;
}

- (void)setOuterPath:(id)a3
{
}

- (TSDBezierPath)innerPath
{
  return self->_innerPath;
}

- (void)setInnerPath:(id)a3
{
}

- (UIEdgeInsets)fadeSizes
{
  double top = self->_fadeSizes.top;
  double left = self->_fadeSizes.left;
  double bottom = self->_fadeSizes.bottom;
  double right = self->_fadeSizes.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setFadeSizes:(UIEdgeInsets)a3
{
  self->_fadeSizes = a3;
}

- (double)maskGroupVerticalInset
{
  return self->_maskGroupVerticalInset;
}

- (void)setMaskGroupVerticalInset:(double)a3
{
  self->_maskGroupVerticalInset = a3;
}

@end