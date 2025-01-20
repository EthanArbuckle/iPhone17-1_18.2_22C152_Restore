@interface UIKBDimmingView
- (UIKBDimmingView)initWithFrame:(CGRect)a3;
- (UIKBScreenTraits)screenTraits;
- (void)drawRect:(CGRect)a3;
- (void)refreshStyleForKeyplane:(id)a3;
- (void)setScreenTraits:(id)a3;
@end

@implementation UIKBDimmingView

- (UIKBDimmingView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIKBDimmingView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setUserInteractionEnabled:0];
    [(UIView *)v4 setOpaque:0];
    v5 = v4;
  }

  return v4;
}

- (void)refreshStyleForKeyplane:(id)a3
{
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v9 = 0;
  }
  else {
    v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSaveGState(v9);
  if ([(UIKBTree *)self->_keyplane isSplit]
    && ![(UIKBScreenTraits *)self->_screenTraits centerFilled])
  {
    char v10 = [(UIView *)self _clipCornersOfView:self] | 0xC;
    [(UIKBTree *)self->_keyplane frameForKeylayoutName:@"split-left"];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    double v16 = v15;
    [(UIKBTree *)self->_keyplane frameForKeylayoutName:@"split-right"];
    UIKBClipTwoPieceBackground(v9, v10, x, y, width, height, v12, v14, v16, height, v17, v18, v19, height);
  }
  v20 = +[UIColor blackColor];
  [v20 set];

  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  CGContextFillRect(v9, v22);
  CGContextRestoreGState(v9);
}

- (UIKBScreenTraits)screenTraits
{
  return self->_screenTraits;
}

- (void)setScreenTraits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
}

@end