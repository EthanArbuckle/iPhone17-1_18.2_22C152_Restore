@interface UIInputSwitcherShadowView
- (CGRect)keyRect;
- (NSArray)gradientColors;
- (UIInputSwitcherShadowView)initWithFrame:(CGRect)a3;
- (UIKeyboardMenuView)menu;
- (_UIBackdropView)blurView;
- (double)pointerOffset;
- (int)mode;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBlurView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGradientColors:(id)a3;
- (void)setKeyRect:(CGRect)a3;
- (void)setMenu:(id)a3;
- (void)setMode:(int)a3;
- (void)setPointerOffset:(double)a3;
@end

@implementation UIInputSwitcherShadowView

- (UIInputSwitcherShadowView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)UIInputSwitcherShadowView;
  v3 = -[UIView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setOpaque:0];
    v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = +[UIColor colorWithRed:0.999 green:0.999 blue:0.999 alpha:1.0];
    v7 = +[UIColor colorWithRed:0.999 green:0.999 blue:0.999 alpha:1.0];
    uint64_t v8 = objc_msgSend(v5, "arrayWithObjects:", v6, v7, 0);
    m_gradientColors = v4->m_gradientColors;
    v4->m_gradientColors = (NSArray *)v8;

    v10 = [[_UIBackdropView alloc] initWithStyle:2050];
    [(UIInputSwitcherShadowView *)v4 setBlurView:v10];
    v11 = [(UIInputSwitcherShadowView *)v4 blurView];
    v12 = [v11 inputSettings];
    [v12 setFilterMaskAlpha:1.0];

    v13 = [(UIInputSwitcherShadowView *)v4 blurView];
    v14 = [v13 inputSettings];
    [v14 setBlurRadius:2.0];

    v15 = [(UIInputSwitcherShadowView *)v4 blurView];
    v16 = [v15 inputSettings];
    [v16 setGrayscaleTintLevel:0.17];

    v17 = [(UIInputSwitcherShadowView *)v4 blurView];
    v18 = [v17 inputSettings];
    [v18 setGrayscaleTintAlpha:0.87];

    v19 = v4;
  }

  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(UIInputSwitcherShadowView *)self menu];
  uint64_t v9 = [v8 mode];

  if (v9)
  {
    v12.origin.double x = x;
    v12.origin.double y = y;
    v12.size.double width = width;
    v12.size.double height = height;
    CGRect v13 = CGRectInset(v12, -6.0, -6.0);
    double x = v13.origin.x;
    double y = v13.origin.y;
    double width = v13.size.width;
    double height = v13.size.height;
  }
  if ([(UIInputSwitcherShadowView *)self mode] == 1) {
    double v10 = height + 10.0;
  }
  else {
    double v10 = height;
  }
  v11.receiver = self;
  v11.super_class = (Class)UIInputSwitcherShadowView;
  -[UIView setFrame:](&v11, sel_setFrame_, x, y, width, v10);
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)UIInputSwitcherShadowView;
  [(UIView *)&v11 layoutSubviews];
  int m_mode = self->m_mode;
  v4 = [(UIInputSwitcherShadowView *)self blurView];
  v5 = v4;
  if (m_mode)
  {
    [v4 removeFromSuperview];
  }
  else
  {
    [(UIView *)self addSubview:v4];

    v6 = [(UIInputSwitcherShadowView *)self menu];
    v5 = [v6 maskForShadowViewBlurredBackground];

    v7 = [(UIInputSwitcherShadowView *)self blurView];
    uint64_t v8 = [v7 inputSettings];
    [v8 setFilterMaskImage:v5];

    uint64_t v9 = [(UIInputSwitcherShadowView *)self blurView];
    double v10 = [v9 inputSettings];
    [v10 setGrayscaleTintMaskImage:v5];
  }
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v4 = [(UIView *)self _keyboardOrientation];
  [(UIView *)self bounds];
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v14 = 0;
  }
  else {
    v14 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  if ([(UIInputSwitcherShadowView *)self mode] == 1)
  {
    v15 = [(UIInputSwitcherShadowView *)self menu];
    v16 = [v15 containerView];
    [(UIInputSwitcherShadowView *)self keyRect];
    objc_msgSend(v16, "convertRect:toView:", self);
    CGFloat v18 = v17;
    CGFloat v20 = *(double *)&v19;
    CGFloat v52 = v6;
    id v53 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    v25 = +[UIScreen mainScreen];
    [v25 scale];
    double v51 = v26;

    CGContextSaveGState(v14);
    v27 = [(UIInputSwitcherShadowView *)self menu];
    int v28 = [v27 usesStraightLeftEdge];
    CGFloat v29 = v6;
    CGFloat v30 = v24;
    PopupPath = UIInputSwitcherCreatePopupPath(v28, 0, -1, v4, v29, v8, v10, v12 + -16.0, v18, v20, v22, v24);

    CGContextAddPath(v14, PopupPath);
    id v32 = +[UIColor colorWithWhite:1.0 alpha:0.3];
    v33 = (CGColor *)[v32 CGColor];

    CGContextSetFillColorWithColor(v14, v33);
    id v34 = +[UIColor colorWithWhite:0.0 alpha:0.2];
    v35 = (CGColor *)[v34 CGColor];

    if (v51 <= 1.0) {
      double v36 = 3.0;
    }
    else {
      double v36 = 1.5;
    }
    v56.double width = -v36;
    v56.double height = 0.0;
    CGContextSetShadowWithColor(v14, v56, v36, v35);
    CGContextFillPath(v14);
    CGContextRestoreGState(v14);
    CGContextSaveGState(v14);
    CGContextAddPath(v14, PopupPath);
    CGContextSetFillColorWithColor(v14, v33);
    v57.double height = 0.0;
    v57.double width = v36;
    CGContextSetShadowWithColor(v14, v57, v36, v35);
    CGContextFillPath(v14);
    CGContextRestoreGState(v14);
    CGContextSaveGState(v14);
    CGContextAddPath(v14, PopupPath);
    CGContextSetFillColorWithColor(v14, v33);
    v58.double width = 0.0;
    v58.double height = v36;
    CGContextSetShadowWithColor(v14, v58, v36, v35);
    CGContextFillPath(v14);
    CGContextRestoreGState(v14);
    CGContextSaveGState(v14);
    v37 = [(UIInputSwitcherShadowView *)self menu];
    v38 = UIInputSwitcherCreatePopupPath([v37 usesStraightLeftEdge], 0, -1, v4, v52, v8, v10, v12 + -16.0, v18, *(CGFloat *)&v53, v22, v30);

    id v39 = +[UIColor colorWithWhite:0.0 alpha:0.2];
    v40 = (CGColor *)[v39 CGColor];

    CGContextAddPath(v14, v38);
    CGContextSetStrokeColorWithColor(v14, v40);
    CGContextSetLineWidth(v14, 0.5);
    CGContextStrokePath(v14);
    CGPathRelease(v38);
    CGContextRestoreGState(v14);
    CGContextSaveGState(v14);
    CGContextAddPath(v14, PopupPath);
    CGContextClip(v14);
    v41 = [(UIInputSwitcherShadowView *)self gradientColors];
    v42 = [v41 objectAtIndex:0];

    v43 = [(UIInputSwitcherShadowView *)self gradientColors];
    v44 = [v43 objectAtIndex:1];

    id v54 = v42;
    uint64_t v45 = [v54 CGColor];
    id v46 = v44;
    v47 = UIKBCreateTwoColorLinearGradient(v45, [v46 CGColor]);
    [(UIView *)self bounds];
    if (v47)
    {
      v59.double y = v49 + v50;
      v59.double x = v48;
      CGContextDrawLinearGradient(v14, v47, *(CGPoint *)&v48, v59, 0);
    }
    CGGradientRelease(v47);
    CGContextRestoreGState(v14);
    CGPathRelease(PopupPath);
  }
}

- (int)mode
{
  return self->m_mode;
}

- (void)setMode:(int)a3
{
  self->int m_mode = a3;
}

- (double)pointerOffset
{
  return self->m_pointerOffset;
}

- (void)setPointerOffset:(double)a3
{
  self->m_pointerOffset = a3;
}

- (NSArray)gradientColors
{
  return self->m_gradientColors;
}

- (void)setGradientColors:(id)a3
{
}

- (CGRect)keyRect
{
  double x = self->_keyRect.origin.x;
  double y = self->_keyRect.origin.y;
  double width = self->_keyRect.size.width;
  double height = self->_keyRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setKeyRect:(CGRect)a3
{
  self->_keyRect = a3;
}

- (UIKeyboardMenuView)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  self->_menu = (UIKeyboardMenuView *)a3;
}

- (_UIBackdropView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->m_gradientColors, 0);
}

@end