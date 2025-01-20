@interface UIInputSwitcherTableCellBackgroundView
- (BOOL)drawsBorder;
- (BOOL)drawsOpaque;
- (BOOL)isSelected;
- (BOOL)usesDarkTheme;
- (unint64_t)roundedCorners;
- (void)drawRect:(CGRect)a3;
- (void)setDrawsBorder:(BOOL)a3;
- (void)setDrawsOpaque:(BOOL)a3;
- (void)setRoundedCorners:(unint64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setUsesDarkTheme:(BOOL)a3;
@end

@implementation UIInputSwitcherTableCellBackgroundView

- (void)drawRect:(CGRect)a3
{
  [(UIView *)self bounds];
  CGFloat v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v13 = 0;
  }
  else {
    v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSaveGState(v13);
  v14 = +[UIScreen mainScreen];
  [v14 scale];
  double v16 = v15;

  double v17 = 1.0 / v16;
  unint64_t v18 = [(UIInputSwitcherTableCellBackgroundView *)self roundedCorners];
  double v19 = 0.0;
  if (!v18) {
    double v19 = v17;
  }
  double v20 = v11 - v19;
  double v21 = -0.0;
  if (!v18) {
    double v21 = v17;
  }
  double v22 = v7 + v21;
  uint64_t SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
  if ([(UIInputSwitcherTableCellBackgroundView *)self roundedCorners])
  {
    if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v24 = 6.0;
    }
    else {
      double v24 = 8.0;
    }
    UIKBAddRoundedRect(v13, [(UIInputSwitcherTableCellBackgroundView *)self roundedCorners], v5, v22, v9, v20, v24);
    CGContextClip(v13);
  }
  if (!_MergedGlobals_17_2[0])
  {
    uint64_t v25 = +[UIColor systemBlueColor];
    v26 = (void *)_MergedGlobals_17_2[0];
    _MergedGlobals_17_2[0] = v25;
  }
  if ([(UIInputSwitcherTableCellBackgroundView *)self isSelected])
  {
    [(id)_MergedGlobals_17_2[0] set];
  }
  else
  {
    if (![(UIInputSwitcherTableCellBackgroundView *)self drawsOpaque]) {
      goto LABEL_20;
    }
    v27 = +[UIColor whiteColor];
    [v27 set];
  }
  UIRectFillUsingOperation(1, v5, v22, v9, v20);
LABEL_20:
  if (!qword_1EB25D098)
  {
    uint64_t v28 = +[UIColor colorWithWhite:0.839215686 alpha:1.0];
    v29 = (void *)qword_1EB25D098;
    qword_1EB25D098 = v28;
  }
  if (!qword_1EB25D0A0) {
    objc_storeStrong((id *)&qword_1EB25D0A0, (id)_MergedGlobals_17_2[0]);
  }
  if (!qword_1EB25D0A8) {
    objc_storeStrong((id *)&qword_1EB25D0A8, (id)_MergedGlobals_17_2[0]);
  }
  if (!qword_1EB25D0B0)
  {
    uint64_t v30 = +[UIColor colorWithWhite:0.839215686 alpha:1.0];
    v31 = (void *)qword_1EB25D0B0;
    qword_1EB25D0B0 = v30;
  }
  if (!qword_1EB25D0B8) {
    objc_storeStrong((id *)&qword_1EB25D0B8, (id)_MergedGlobals_17_2[0]);
  }
  if (!qword_1EB25D0C0)
  {
    v32 = [[UIColor alloc] initWithWhite:0.8 alpha:0.5];
    v33 = (void *)qword_1EB25D0C0;
    qword_1EB25D0C0 = (uint64_t)v32;
  }
  if ([(UIInputSwitcherTableCellBackgroundView *)self usesDarkTheme])
  {
    if (qword_1EB25D0C8) {
      goto LABEL_38;
    }
    v34 = [[UIColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:0.15];
    v35 = (void *)qword_1EB25D0C8;
    qword_1EB25D0C8 = (uint64_t)v34;
  }
  else
  {
    if (qword_1EB25D0D0) {
      goto LABEL_38;
    }
    v36 = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.15];
    v35 = (void *)qword_1EB25D0D0;
    qword_1EB25D0D0 = (uint64_t)v36;
  }

LABEL_38:
  if ([(UIInputSwitcherTableCellBackgroundView *)self drawsBorder])
  {
    if ([(UIInputSwitcherTableCellBackgroundView *)self isSelected])
    {
      v37 = (void *)qword_1EB25D0A0;
    }
    else
    {
      BOOL v38 = [(UIInputSwitcherTableCellBackgroundView *)self usesDarkTheme];
      uint64_t v39 = 8;
      if (v38) {
        uint64_t v39 = 7;
      }
      v37 = (void *)_MergedGlobals_17_2[v39];
    }
    [v37 set];
    UIRectFillUsingOperation(1, v5, 0.0, v9, v17);
  }
  CGContextRestoreGState(v13);
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(UIView *)self setNeedsDisplay];
  }
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)drawsOpaque
{
  return self->_drawsOpaque;
}

- (void)setDrawsOpaque:(BOOL)a3
{
  self->_drawsOpaque = a3;
}

- (BOOL)drawsBorder
{
  return self->_drawsBorder;
}

- (void)setDrawsBorder:(BOOL)a3
{
  self->_drawsBorder = a3;
}

- (BOOL)usesDarkTheme
{
  return self->_usesDarkTheme;
}

- (void)setUsesDarkTheme:(BOOL)a3
{
  self->_usesDarkTheme = a3;
}

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (void)setRoundedCorners:(unint64_t)a3
{
  self->_roundedCorners = a3;
}

@end