@interface UIRoundedRectButton
+ (Class)_visualProviderClassForIdiom:(int64_t)a3;
- (BOOL)_canDrawContent;
- (UIRoundedRectButton)initWithFrame:(CGRect)a3;
- (UIRoundedRectButton)initWithFrame:(CGRect)a3 fillColor:(id)a4;
- (id)_contentBackgroundColor;
- (int64_t)buttonType;
- (void)_invalidatePaths;
- (void)_updateState;
- (void)drawRect:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setTintColor:(id)a3;
@end

@implementation UIRoundedRectButton

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  return (Class)objc_opt_class();
}

- (UIRoundedRectButton)initWithFrame:(CGRect)a3
{
  return -[UIRoundedRectButton initWithFrame:fillColor:](self, "initWithFrame:fillColor:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIRoundedRectButton)initWithFrame:(CGRect)a3 fillColor:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIRoundedRectButton;
  v11 = -[UIButton initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11) {
    objc_storeStrong((id *)&v11->_fillColor, a4);
  }

  return v12;
}

- (BOOL)_canDrawContent
{
  return 0;
}

- (id)_contentBackgroundColor
{
  fillColor = self->_fillColor;
  if (fillColor)
  {
    v3 = fillColor;
  }
  else
  {
    v3 = +[UIColor whiteColor];
  }
  return v3;
}

- (void)_updateState
{
  if ([(UIRoundedRectButton *)self _canDrawContent])
  {
    [(UIView *)self setNeedsDisplay];
  }
  else
  {
    id v4 = [(UIButton *)self _visualProvider];
    id v3 = (id)[v4 _setupBackgroundView];
  }
}

- (void)_invalidatePaths
{
  fillPath = self->_fillPath;
  if (fillPath)
  {
    self->_fillPath = 0;
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIRoundedRectButton *)self _invalidatePaths];
  v8.receiver = self;
  v8.super_class = (Class)UIRoundedRectButton;
  -[UIButton setFrame:](&v8, sel_setFrame_, x, y, width, height);
  [(UIRoundedRectButton *)self _updateState];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIRoundedRectButton *)self _invalidatePaths];
  v8.receiver = self;
  v8.super_class = (Class)UIRoundedRectButton;
  -[UIButton setBounds:](&v8, sel_setBounds_, x, y, width, height);
  [(UIRoundedRectButton *)self _updateState];
}

- (int64_t)buttonType
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIRoundedRectButton;
  [(UIButton *)&v4 setHighlighted:a3];
  [(UIRoundedRectButton *)self _updateState];
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(UIView *)self tintColor];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIRoundedRectButton;
    [(UIButton *)&v6 setTintColor:v4];
    if ([(UIControl *)self isHighlighted]
      || ![(UIRoundedRectButton *)self _canDrawContent])
    {
      [(UIRoundedRectButton *)self _updateState];
    }
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!_MergedGlobals_31_0)
  {
    uint64_t v8 = +[UIColor tableBackgroundColor];
    v9 = (void *)_MergedGlobals_31_0;
    _MergedGlobals_31_0 = v8;

    id v10 = [[UIColor alloc] initWithWhite:0.6 alpha:0.94];
    v11 = (void *)qword_1EB25EC60;
    qword_1EB25EC60 = (uint64_t)v10;

    uint64_t v12 = +[UIColor tableSelectionColor];
    v13 = (void *)qword_1EB25EC68;
    qword_1EB25EC68 = v12;

    objc_super v14 = [[UIColor alloc] initWithRed:0.17 green:0.26 blue:0.37 alpha:0.94];
    v15 = (void *)qword_1EB25EC70;
    qword_1EB25EC70 = (uint64_t)v14;

    v16 = [[UIColor alloc] initWithRed:0.17 green:0.26 blue:0.37 alpha:0.75];
    v17 = (void *)qword_1EB25EC78;
    qword_1EB25EC78 = (uint64_t)v16;
  }
  [(UIView *)self bounds];
  CGFloat v19 = v18;
  double v21 = v20;
  CGFloat v23 = v22;
  double v25 = v24;
  v26 = +[UIDevice currentDevice];
  uint64_t v27 = [v26 userInterfaceIdiom];

  if ((v27 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (![(UIView *)self clearsContextBeforeDrawing])
    {
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1) {
        v29 = 0;
      }
      else {
        v29 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      }
      v58.origin.CGFloat x = x;
      v58.origin.CGFloat y = y;
      v58.size.CGFloat width = width;
      v58.size.CGFloat height = height;
      CGContextClearRect(v29, v58);
    }
    double v25 = v25 + -1.0;
  }
  v59.origin.CGFloat x = v19;
  v59.origin.CGFloat y = v21;
  v59.size.CGFloat width = v23;
  v59.size.CGFloat height = v25;
  if (!CGRectEqualToRect(v59, *(CGRect *)ymmword_1EB25EC88))
  {
    v30 = (void *)qword_1EB25EC80;
    qword_1EB25EC80 = 0;
  }
  if (!qword_1EB25EC80)
  {
    *(CGFloat *)ymmword_1EB25EC88 = v19;
    *(double *)&ymmword_1EB25EC88[8] = v21;
    *(CGFloat *)&ymmword_1EB25EC88[16] = v23;
    *(double *)&ymmword_1EB25EC88[24] = v25;
    v60.origin.CGFloat x = v19;
    v60.origin.CGFloat y = v21;
    v60.size.CGFloat width = v23;
    v60.size.CGFloat height = v25;
    CGRect v61 = CGRectInset(v60, 0.5, 0.5);
    uint64_t v31 = +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, v61.origin.x, v61.origin.y, v61.size.width, v61.size.height, 4.5);
    v32 = (void *)qword_1EB25EC80;
    qword_1EB25EC80 = v31;
  }
  v33 = +[UIDevice currentDevice];
  uint64_t v34 = [v33 userInterfaceIdiom];

  if ((v34 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v62.origin.CGFloat y = v21 + 1.0;
    v62.origin.CGFloat x = v19;
    v62.size.CGFloat width = v23;
    v62.size.CGFloat height = v25;
    CGRect v63 = CGRectInset(v62, 0.5, 0.5);
    v35 = +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, v63.origin.x, v63.origin.y, v63.size.width, v63.size.height, 4.5);
    v36 = +[UIColor tableShadowColor];
    [v36 set];

    [v35 stroke];
  }
  fillColor = self->_fillColor;
  if (!fillColor) {
    fillColor = (UIColor *)_MergedGlobals_31_0;
  }
  v56 = fillColor;
  if ([(UIControl *)self isHighlighted])
  {
    v38 = +[UIDevice currentDevice];
    uint64_t v39 = [v38 userInterfaceIdiom];

    if ((v39 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      [(UIColor *)v56 set];
      [(id)qword_1EB25EC80 fill];
      v40 = GetContextStack(0);
      if (*(int *)v40 < 1) {
        v41 = 0;
      }
      else {
        v41 = (CGContext *)v40[3 * (*(_DWORD *)v40 - 1) + 1];
      }
      CGContextSaveGState(v41);
    }
    else
    {
      v41 = 0;
    }
    [(id)qword_1EB25EC80 clip];
    v42 = [(UIView *)self tintColor];
    v43 = v42;
    if (v42)
    {
      [v42 set];
      v44 = GetContextStack(0);
      if (*(int *)v44 < 1) {
        v45 = 0;
      }
      else {
        v45 = (CGContext *)v44[3 * (*(_DWORD *)v44 - 1) + 1];
      }
      v64.origin.CGFloat x = v19;
      v64.origin.CGFloat y = v21;
      v64.size.CGFloat width = v23;
      v64.size.CGFloat height = v25;
      CGContextFillRect(v45, v64);
    }
    v46 = +[UIDevice currentDevice];
    uint64_t v47 = [v46 userInterfaceIdiom];

    if ((v47 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      CGContextRestoreGState(v41);
    }
  }
  else
  {
    [(UIColor *)v56 set];
    [(id)qword_1EB25EC80 fill];
  }
  v48 = +[UIDevice currentDevice];
  uint64_t v49 = [v48 userInterfaceIdiom];

  if ((v49 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v65.origin.CGFloat y = v21 + 1.0;
    v65.size.CGFloat height = v25 + -1.0;
    v65.origin.CGFloat x = v19;
    v65.size.CGFloat width = v23;
    CGRect v66 = CGRectInset(v65, 0.5, 0.5);
    v50 = +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, v66.origin.x, v66.origin.y, v66.size.width, v66.size.height, 4.5);
    v51 = +[UIColor tableGroupedTopShadowColor];
    [v51 set];

    [v50 stroke];
  }
  if ([(UIControl *)self isHighlighted])
  {
    v52 = +[UIDevice currentDevice];
    uint64_t v53 = [v52 userInterfaceIdiom];

    if ((v53 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      v54 = (void *)qword_1EB25EC78;
    }
    else {
      v54 = (void *)qword_1EB25EC70;
    }
  }
  else
  {
    if ([(UIButton *)self _buttonType] == 113)
    {
      v55 = +[UIColor tableSeparatorDarkColor];
      [v55 set];

      goto LABEL_44;
    }
    v54 = (void *)qword_1EB25EC60;
  }
  [v54 set];
LABEL_44:
  [(id)qword_1EB25EC80 stroke];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_fillPath, 0);
}

@end