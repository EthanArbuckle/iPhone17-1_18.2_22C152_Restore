@interface UIViewPrintFormatter
- (CGRect)rectForPageAtIndex:(int64_t)a3;
- (UIView)view;
- (id)_initWithView:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_recalcPageCount;
- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4;
@end

@implementation UIViewPrintFormatter

- (id)_initWithView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIViewPrintFormatter;
  v6 = [(UIPrintFormatter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_view, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIViewPrintFormatter;
  v4 = [(UIPrintFormatter *)&v7 copyWithZone:a3];
  id v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 15, self->_view);
  }
  return v5;
}

- (int64_t)_recalcPageCount
{
  view = self->_view;
  if (!view) {
    return 0;
  }
  [(UIView *)view bounds];
  if (v4 <= 0.0) {
    return 0;
  }
  double v5 = v4;
  v10.receiver = self;
  v10.super_class = (Class)UIViewPrintFormatter;
  int64_t v6 = 1;
  [(UIPrintFormatter *)&v10 _pageContentRect:1];
  double v7 = v5 - CGRectGetHeight(v11);
  if (v7 > 0.0)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIViewPrintFormatter;
    [(UIPrintFormatter *)&v9 _pageContentRect:0];
    return (uint64_t)(ceil(v7 / CGRectGetHeight(v12)) + 1.0);
  }
  return v6;
}

- (CGRect)rectForPageAtIndex:(int64_t)a3
{
  v31.receiver = self;
  v31.super_class = (Class)UIViewPrintFormatter;
  [(UIPrintFormatter *)&v31 _pageContentRect:1];
  uint64_t v6 = v5;
  double v8 = v7;
  uint64_t v10 = v9;
  double v12 = v11;
  [(UIView *)self->_view bounds];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  NSInteger v17 = [(UIPrintFormatter *)self startPage];
  if (v17 == a3)
  {
    uint64_t v18 = v6;
    double v19 = v8;
    uint64_t v20 = v14;
    uint64_t v21 = v16;
    uint64_t v22 = v6;
    double v23 = v8;
    uint64_t v24 = v10;
    double v25 = v12;
  }
  else
  {
    NSInteger v26 = v17;
    v30.receiver = self;
    v30.super_class = (Class)UIViewPrintFormatter;
    [(UIPrintFormatter *)&v30 _pageContentRect:0];
    double v23 = v27;
    uint64_t v24 = v28;
    double v25 = v29;
    double v19 = v27 - (v12 + v29 * (double)(~v26 + a3));
    uint64_t v20 = v14;
    uint64_t v21 = v16;
    uint64_t v22 = v18;
  }
  return CGRectIntersection(*(CGRect *)&v18, *(CGRect *)&v22);
}

- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  CGContextClipToRect(CurrentContext, v17);
  CGContextTranslateCTM(CurrentContext, x, y);
  NSInteger v11 = [(UIPrintFormatter *)self startPage];
  int64_t v12 = a4 - v11 - 1;
  if (a4 - v11 < 1)
  {
    double v14 = 0.0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)UIViewPrintFormatter;
    [(UIPrintFormatter *)&v16 _pageContentRect:1];
    double v13 = CGRectGetHeight(v18);
    v15.receiver = self;
    v15.super_class = (Class)UIViewPrintFormatter;
    [(UIPrintFormatter *)&v15 _pageContentRect:0];
    double v14 = v13 + (double)v12 * CGRectGetHeight(v19);
  }
  CGContextTranslateCTM(CurrentContext, 0.0, -v14);
  -[UIView drawRect:forViewPrintFormatter:](self->_view, "drawRect:forViewPrintFormatter:", self, 0.0, v14, width, height);
  CGContextRestoreGState(CurrentContext);
}

- (UIView)view
{
  return self->_view;
}

- (void).cxx_destruct
{
}

@end