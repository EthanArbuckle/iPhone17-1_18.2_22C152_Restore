@interface _UIDebugAlignmentRectView
- (BOOL)isOpaque;
- (_UIDebugAlignmentRectView)initWithFrame:(CGRect)a3 baselineOffset:(double)a4;
- (void)drawRect:(CGRect)a3;
@end

@implementation _UIDebugAlignmentRectView

- (_UIDebugAlignmentRectView)initWithFrame:(CGRect)a3 baselineOffset:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIDebugAlignmentRectView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_baselineOffset = a4;
    [(UIView *)v5 setAutoresizingMask:18];
    [(UIView *)v6 setUserInteractionEnabled:0];
  }
  return v6;
}

- (void)drawRect:(CGRect)a3
{
  [+[UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:0.8] set];
  [(UIView *)self bounds];
  CGFloat v5 = v4;
  double v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  UIRectFrameUsingOperation(1, v4, v6, v8, v10);
  if (self->_baselineOffset > 0.0)
  {
    [(UIScreen *)[(UIWindow *)[(UIView *)self window] screen] scale];
    double v13 = v7 + v11 - self->_baselineOffset - 1.0 / v12;
    UIRectFillUsingOperation(1, v5, v13, v9, 1.0 / v12);
  }
}

- (BOOL)isOpaque
{
  return 0;
}

@end