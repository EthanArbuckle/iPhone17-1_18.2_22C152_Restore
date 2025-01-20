@interface UIInputSwitcherSelectionExtraView
- (CGRect)keyRect;
- (UIInputSwitcherSelectionExtraView)initWithFrame:(CGRect)a3;
- (UIKeyboardMenuView)menu;
- (double)pointerOffset;
- (unint64_t)roundedCorners;
- (void)drawRect:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setKeyRect:(CGRect)a3;
- (void)setMenu:(id)a3;
- (void)setPointerOffset:(double)a3;
- (void)setRoundedCorners:(unint64_t)a3;
@end

@implementation UIInputSwitcherSelectionExtraView

- (UIInputSwitcherSelectionExtraView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIInputSwitcherSelectionExtraView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setOpaque:0];
    [(UIView *)v4 setUserInteractionEnabled:0];
    v5 = v4;
  }

  return v4;
}

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIInputSwitcherSelectionExtraView;
  -[UIView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height + 80.0);
}

- (void)drawRect:(CGRect)a3
{
  [(UIView *)self bounds];
  double v5 = v4;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    objc_super v7 = 0;
  }
  else {
    objc_super v7 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSaveGState(v7);
  v8 = [(UIInputSwitcherSelectionExtraView *)self menu];
  v9 = [v8 containerView];
  [(UIInputSwitcherSelectionExtraView *)self keyRect];
  objc_msgSend(v9, "convertRect:toView:", self);
  double v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;

  v18 = [(UIInputSwitcherSelectionExtraView *)self menu];
  v19 = [v18 table];
  int v20 = [v19 isScrollEnabled];

  double v21 = v11 + 0.0;
  double v22 = v13 + -4.0;
  if (v20)
  {
    double v17 = v17 + 4.0;
    double v13 = v13 + -4.0;
    double v11 = v11 + 0.0;
  }
  v23 = [(UIInputSwitcherSelectionExtraView *)self menu];
  v24 = [v23 table];
  [v24 frame];
  double v26 = v25;

  v36.origin.CGFloat x = v11;
  v36.origin.CGFloat y = v13;
  v36.size.CGFloat width = v15;
  v36.size.CGFloat height = v17;
  v37.size.CGFloat height = CGRectGetMaxY(v36) - v26;
  v37.origin.CGFloat x = 8.0;
  v37.origin.CGFloat y = v26;
  v37.size.CGFloat width = v5 + -16.0;
  CGRect v38 = CGRectInset(v37, -6.0, 0.0);
  CGFloat x = v38.origin.x;
  CGFloat y = v38.origin.y;
  CGFloat width = v38.size.width;
  CGFloat height = v38.size.height;
  v31 = [(UIInputSwitcherSelectionExtraView *)self menu];
  PopupPath = UIInputSwitcherCreatePopupPath([v31 usesStraightLeftEdge], 1, -[UIInputSwitcherSelectionExtraView roundedCorners](self, "roundedCorners"), -[UIView _keyboardOrientation](self, "_keyboardOrientation"), x, y, width, height, v11, v13, v15, v17);

  CGContextAddPath(v7, PopupPath);
  id v33 = +[UIColor systemBlueColor];
  v34 = (CGColor *)[v33 CGColor];

  CGContextSetFillColorWithColor(v7, v34);
  CGContextFillPath(v7);
  CGContextRestoreGState(v7);
  CGPathRelease(PopupPath);
}

- (double)pointerOffset
{
  return self->m_pointerOffset;
}

- (void)setPointerOffset:(double)a3
{
  self->m_pointerOffset = a3;
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

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (void)setRoundedCorners:(unint64_t)a3
{
  self->_roundedCorners = a3;
}

- (UIKeyboardMenuView)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  self->_menu = (UIKeyboardMenuView *)a3;
}

@end