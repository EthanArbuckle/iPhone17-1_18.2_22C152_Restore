@interface BKLoupeView
- (BKLoupeView)initWithTargetView:(id)a3;
- (BOOL)isVertical;
- (BOOL)shouldInvertContent;
- (CGPoint)loupePointForPoint:(CGPoint)a3;
- (UIColor)pageColor;
- (UIImage)loupeMask;
- (UIImage)loupeSheen;
- (UIView)targetView;
- (double)loupeHeight;
- (double)loupeWidth;
- (id)p_kitImageWithName:(id)a3;
- (void)dealloc;
- (void)dismissAnimated:(BOOL)a3;
- (void)drawRect:(CGRect)a3;
- (void)moveToPoint:(CGPoint)a3;
- (void)presentAtPoint:(CGPoint)a3 animated:(BOOL)a4;
- (void)resetImages;
- (void)setIsVertical:(BOOL)a3;
- (void)setPageColor:(id)a3;
- (void)setShouldInvertContent:(BOOL)a3;
@end

@implementation BKLoupeView

- (BKLoupeView)initWithTargetView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKLoupeView;
  v5 = -[BKLoupeView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_targetView, v4);
    [(BKLoupeView *)v6 setOpaque:0];
    [(BKLoupeView *)v6 setUserInteractionEnabled:0];
  }

  return v6;
}

- (id)p_kitImageWithName:(id)a3
{
  return +[UIImage kitImageNamed:a3];
}

- (UIImage)loupeMask
{
  p_loupeMask = &self->_loupeMask;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loupeMask);

  if (!WeakRetained)
  {
    if (self->_isVertical) {
      CFStringRef v5 = @"Vertical";
    }
    else {
      CFStringRef v5 = @"Horizontal";
    }
    v6 = +[NSString stringWithFormat:@"RangedMagnifierMask_%@_Normal", v5];
    v7 = [(BKLoupeView *)self p_kitImageWithName:v6];
    objc_storeWeak((id *)p_loupeMask, v7);
  }
  id v8 = objc_loadWeakRetained((id *)p_loupeMask);

  return (UIImage *)v8;
}

- (UIImage)loupeSheen
{
  p_loupeSheen = &self->_loupeSheen;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loupeSheen);

  if (!WeakRetained)
  {
    if (self->_isVertical) {
      CFStringRef v5 = @"Vertical";
    }
    else {
      CFStringRef v5 = @"Horizontal";
    }
    v6 = +[NSString stringWithFormat:@"RangedMagnifierGlass_%@_Normal", v5];
    v7 = [(BKLoupeView *)self p_kitImageWithName:v6];
    objc_storeWeak((id *)p_loupeSheen, v7);
  }
  id v8 = objc_loadWeakRetained((id *)p_loupeSheen);

  return (UIImage *)v8;
}

- (void)setIsVertical:(BOOL)a3
{
  if (self->_isVertical != a3)
  {
    [(BKLoupeView *)self willChangeValueForKey:@"isVertical"];
    self->_isVertical = a3;
    [(BKLoupeView *)self resetImages];
    [(BKLoupeView *)self didChangeValueForKey:@"isVertical"];
  }
}

- (void)resetImages
{
  objc_storeWeak((id *)&self->_loupeMask, 0);

  objc_storeWeak((id *)&self->_loupeSheen, 0);
}

- (void)dealloc
{
  [(BKLoupeView *)self resetImages];
  v3.receiver = self;
  v3.super_class = (Class)BKLoupeView;
  [(BKLoupeView *)&v3 dealloc];
}

- (double)loupeWidth
{
  v2 = [(BKLoupeView *)self loupeMask];
  [v2 size];
  double v4 = v3;

  return v4;
}

- (double)loupeHeight
{
  v2 = [(BKLoupeView *)self loupeMask];
  [v2 size];
  double v4 = v3;

  return v4;
}

- (void)dismissAnimated:(BOOL)a3
{
  double v3 = 0.0;
  if (a3) {
    double v3 = 0.25;
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10CDB8;
  v4[3] = &unk_1DAB88;
  v4[4] = self;
  +[UIView animateWithDuration:v4 animations:v3];
}

- (CGPoint)loupePointForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unsigned int v6 = [(BKLoupeView *)self isVertical];
  [(BKLoupeView *)self loupeWidth];
  if (v6)
  {
    double v8 = x - v7;
    [(BKLoupeView *)self loupeHeight];
    double v10 = y + v9 * -0.5;
    double v11 = v8 + -18.0;
  }
  else
  {
    double v11 = x - floor(v7 * 0.5);
    [(BKLoupeView *)self loupeHeight];
    double v10 = y - v12 + -18.0;
  }
  double v13 = v11;
  result.double y = v10;
  result.double x = v13;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  double v9 = [(BKLoupeView *)self superview];
  [(BKLoupeView *)self frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(BKLoupeView *)self targetView];
  [v9 convertRect:v18 toView:v11];
  double v20 = v19;
  double v22 = v21;
  double v45 = v23;
  id v46 = v24;

  CGContextSaveGState(CurrentContext);
  [(BKLoupeView *)self loupeWidth];
  CGFloat v26 = v25;
  [(BKLoupeView *)self loupeHeight];
  CGFloat v28 = v27;
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  [(BKLoupeView *)self loupeHeight];
  CGContextTranslateCTM(CurrentContext, 0.0, -v29);
  id v30 = [(BKLoupeView *)self loupeMask];
  v31 = (CGImage *)[v30 CGImage];
  v49.origin.double x = 0.0;
  v49.origin.double y = 0.0;
  v49.size.double width = v26;
  v49.size.double height = v28;
  CGContextClipToMask(CurrentContext, v49, v31);

  [(BKLoupeView *)self loupeHeight];
  CGContextTranslateCTM(CurrentContext, 0.0, v32);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  unsigned int v33 = [(BKLoupeView *)self shouldInvertContent];
  char v34 = v33;
  if (v33)
  {
    v35 = [(BKLoupeView *)self pageColor];
    [v35 setFill];

    v50.origin.double x = x;
    v50.origin.double y = y;
    v50.size.double width = width;
    v50.size.double height = height;
    CGContextFillRect(CurrentContext, v50);
  }
  CGContextSaveGState(CurrentContext);
  CGContextScaleCTM(CurrentContext, 1.2, 1.2);
  double v36 = -v20;
  if ([(BKLoupeView *)self isVertical])
  {
    [(BKLoupeView *)self loupeWidth];
    double v38 = v36 - v37 + 18.0 + -10.0;
    double v39 = -v22;
    v40 = CurrentContext;
  }
  else
  {
    [(BKLoupeView *)self loupeHeight];
    double v39 = -v22 - v41 + 18.0 + -10.0;
    v40 = CurrentContext;
    double v38 = v36;
  }
  CGContextTranslateCTM(v40, v38, v39);
  CGContextTranslateCTM(CurrentContext, v45 * -0.2 * 0.5, *(double *)&v46 * -0.2 * 0.5);
  v51.origin.double x = x;
  v51.origin.double y = y;
  v51.size.double width = width;
  v51.size.double height = height;
  CGContextFillRect(CurrentContext, v51);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  v43 = [WeakRetained layer];
  [v43 renderInContext:CurrentContext];

  CGContextRestoreGState(CurrentContext);
  if ((v34 & 1) == 0 && ![(BKLoupeView *)self shouldInvertContent])
  {
    v44 = [(BKLoupeView *)self pageColor];
    [v44 setFill];

    v52.origin.double x = x;
    v52.origin.double y = y;
    v52.size.double width = width;
    v52.size.double height = height;
    UIRectFillUsingBlendMode(v52, kCGBlendModeMultiply);
  }
  CGContextRestoreGState(CurrentContext);
  id v47 = [(BKLoupeView *)self loupeSheen];
  [v47 drawInRect:x, y, width, height];
}

- (void)presentAtPoint:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  [(BKLoupeView *)self frame];
  double v9 = v8;
  double v11 = v10;
  double v12 = [(BKLoupeView *)self superview];
  double v13 = [(BKLoupeView *)self targetView];
  [v12 convertPoint:v13 fromView:x, y];
  -[BKLoupeView loupePointForPoint:](self, "loupePointForPoint:");
  double v15 = v14;
  double v17 = v16;

  [(BKLoupeView *)self loupeWidth];
  double v19 = v15 + floor(v18 * 0.5);
  [(BKLoupeView *)self loupeHeight];
  double v21 = v20;
  unsigned int v22 = [(BKLoupeView *)self isVertical];
  double v23 = fmax(v19, 0.0);
  if (!v22) {
    double v23 = v19;
  }
  -[BKLoupeView setFrame:](self, "setFrame:", v23, v17 + v21, v9, v11);
  [(BKLoupeView *)self setNeedsDisplay];
  v25[1] = 3221225472;
  double v24 = 0.25;
  v25[0] = _NSConcreteStackBlock;
  v25[2] = sub_10D390;
  v25[3] = &unk_1DABB0;
  if (!v4) {
    double v24 = 0.0;
  }
  v25[4] = self;
  *(double *)&v25[5] = x;
  *(double *)&v25[6] = y;
  +[UIView animateWithDuration:v25 animations:v24];
}

- (void)moveToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(BKLoupeView *)self frame];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(BKLoupeView *)self superview];
  double v11 = [(BKLoupeView *)self targetView];
  [v10 convertPoint:v11 fromView:x, y];
  -[BKLoupeView loupePointForPoint:](self, "loupePointForPoint:");
  double v13 = v12;
  double v15 = v14;

  unsigned int v16 = [(BKLoupeView *)self isVertical];
  double v17 = fmax(v13, 0.0);
  if (v16) {
    double v13 = v17;
  }
  [(BKLoupeView *)self setNeedsDisplay];

  -[BKLoupeView setFrame:](self, "setFrame:", v13, v15, v7, v9);
}

- (UIView)targetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);

  return (UIView *)WeakRetained;
}

- (BOOL)isVertical
{
  return self->_isVertical;
}

- (UIColor)pageColor
{
  return self->_pageColor;
}

- (void)setPageColor:(id)a3
{
}

- (BOOL)shouldInvertContent
{
  return self->_shouldInvertContent;
}

- (void)setShouldInvertContent:(BOOL)a3
{
  self->_shouldInvertContent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_loupeSheen);
  objc_destroyWeak((id *)&self->_loupeMask);
  objc_storeStrong((id *)&self->_pageColor, 0);

  objc_destroyWeak((id *)&self->_targetView);
}

@end