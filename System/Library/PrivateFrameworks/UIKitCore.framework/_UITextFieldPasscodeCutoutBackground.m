@interface _UITextFieldPasscodeCutoutBackground
+ (Class)layerClass;
+ (id)_fillColor:(BOOL)a3;
+ (id)_strokeColor:(BOOL)a3;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (UIBezierPath)customPath;
- (_UITextFieldPasscodeCutoutBackground)initWithFrame:(CGRect)a3;
- (_UITextFieldPasscodeCutoutBackground)initWithFrame:(CGRect)a3 active:(BOOL)a4;
- (double)_pathInset;
- (double)cornerRadius;
- (double)lineWidth;
- (double)outlineAlpha;
- (id)_fillColor:(BOOL)a3;
- (id)_strokeColor:(BOOL)a3;
- (id)fillColor;
- (id)strokeColor;
- (void)_updateLightingOutlinePath;
- (void)_updatePath;
- (void)setBounds:(CGRect)a3;
- (void)setCornerRadius:(double)a3;
- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setFillColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLineWidth:(double)a3;
- (void)setLineWidth:(double)a3 updatePath:(BOOL)a4;
- (void)setOutlineAlpha:(double)a3;
- (void)setStrokeColor:(id)a3;
@end

@implementation _UITextFieldPasscodeCutoutBackground

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UITextFieldPasscodeCutoutBackground)initWithFrame:(CGRect)a3 active:(BOOL)a4
{
  v14.receiver = self;
  v14.super_class = (Class)_UITextFieldPasscodeCutoutBackground;
  v4 = -[UITextFieldBackgroundView initWithFrame:active:](&v14, sel_initWithFrame_active_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    [(UIView *)v4 setAutoresizingMask:18];
    v5->_cornerRadius = 5.0;
    [(_UITextFieldPasscodeCutoutBackground *)v5 setLineWidth:1.0];
    v6 = [(_UITextFieldPasscodeCutoutBackground *)v5 _shapeLayer];
    [v6 setFillRule:*MEMORY[0x1E4F39FB8]];

    [(UIView *)v5 setOpaque:0];
    v7 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    lighteningOutline = v5->_lighteningOutline;
    v5->_lighteningOutline = v7;

    id v9 = +[UIColor clearColor];
    -[CAShapeLayer setFillColor:](v5->_lighteningOutline, "setFillColor:", [v9 CGColor]);

    id v10 = +[UIColor colorWithWhite:1.0 alpha:0.25];
    -[CAShapeLayer setStrokeColor:](v5->_lighteningOutline, "setStrokeColor:", [v10 CGColor]);

    v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    [(CAShapeLayer *)v5->_lighteningOutline setCompositingFilter:v11];

    [(CAShapeLayer *)v5->_lighteningOutline setLineWidth:1.0];
    v12 = [(UIView *)v5 layer];
    [v12 addSublayer:v5->_lighteningOutline];
  }
  return v5;
}

- (_UITextFieldPasscodeCutoutBackground)initWithFrame:(CGRect)a3
{
  return -[_UITextFieldPasscodeCutoutBackground initWithFrame:active:](self, "initWithFrame:active:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (double)_pathInset
{
  v2 = [(_UITextFieldPasscodeCutoutBackground *)self _shapeLayer];
  [v2 lineWidth];
  double v4 = v3;

  return v4 * 0.5;
}

- (void)setOutlineAlpha:(double)a3
{
  self->_outlineAlpha = a3;
  id v4 = +[UIColor colorWithWhite:1.0 alpha:a3];
  -[CAShapeLayer setStrokeColor:](self->_lighteningOutline, "setStrokeColor:", [v4 CGColor]);
}

- (double)outlineAlpha
{
  return self->_outlineAlpha;
}

+ (id)_strokeColor:(BOOL)a3
{
  return +[UIColor clearColor];
}

+ (id)_fillColor:(BOOL)a3
{
  return 0;
}

- (void)setStrokeColor:(id)a3
{
  id v4 = a3;
  self->_hasCustomStrokeColor = v4 != 0;
  if (!v4)
  {
    id v4 = [(_UITextFieldPasscodeCutoutBackground *)self _strokeColor:self->super._enabled];
  }
  id v7 = v4;
  uint64_t v5 = [v7 CGColor];
  v6 = [(_UITextFieldPasscodeCutoutBackground *)self _shapeLayer];
  [v6 setStrokeColor:v5];
}

- (id)strokeColor
{
  v2 = [(_UITextFieldPasscodeCutoutBackground *)self _shapeLayer];
  double v3 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v2 strokeColor]);

  return v3;
}

- (void)setFillColor:(id)a3
{
  id v4 = a3;
  self->_hasCustomFillColor = v4 != 0;
  if (!v4)
  {
    id v4 = [(_UITextFieldPasscodeCutoutBackground *)self _fillColor:self->super._enabled];
  }
  id v7 = v4;
  uint64_t v5 = [v7 CGColor];
  v6 = [(_UITextFieldPasscodeCutoutBackground *)self _shapeLayer];
  [v6 setFillColor:v5];
}

- (id)fillColor
{
  v2 = [(_UITextFieldPasscodeCutoutBackground *)self _shapeLayer];
  double v3 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v2 fillColor]);

  return v3;
}

- (void)setLineWidth:(double)a3 updatePath:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(_UITextFieldPasscodeCutoutBackground *)self _shapeLayer];
  [v7 setLineWidth:a3];

  if (v4)
  {
    [(_UITextFieldPasscodeCutoutBackground *)self _updatePath];
  }
}

- (void)setLineWidth:(double)a3
{
}

- (double)lineWidth
{
  v2 = [(_UITextFieldPasscodeCutoutBackground *)self _shapeLayer];
  [v2 lineWidth];
  double v4 = v3;

  return v4;
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextFieldPasscodeCutoutBackground;
  -[UITextFieldBackgroundView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UITextFieldPasscodeCutoutBackground *)self _updatePath];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextFieldPasscodeCutoutBackground;
  -[UITextFieldBackgroundView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UITextFieldPasscodeCutoutBackground *)self _updatePath];
}

- (UIBezierPath)customPath
{
  [(_UITextFieldPasscodeCutoutBackground *)self cornerRadius];
  double v4 = v3;
  [(_UITextFieldPasscodeCutoutBackground *)self _pathInset];
  CGFloat v6 = v5;
  [(UIView *)self bounds];
  CGRect v23 = CGRectInset(v22, v6, v6);
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;
  if (CGRectIsNull(v23))
  {
    v11 = 0;
  }
  else
  {
    v11 = +[UIBezierPath bezierPath];
    [(_UITextFieldPasscodeCutoutBackground *)self lineWidth];
    double v13 = v12;
    CGFloat v14 = v12 * 0.5;
    [(UIView *)self bounds];
    CGFloat v15 = -(v13 * 0.5);
    CGRect v25 = CGRectInset(v24, v15, v15);
    v16 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
    [v11 appendPath:v16];

    double v17 = v13 * 0.25;
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    CGRect v27 = CGRectInset(v26, v15, v15);
    v18 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height, v4 + v17);
    [v11 appendPath:v18];

    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    CGRect v29 = CGRectInset(v28, v14, v14);
    v19 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height, v4 - v17);
    [v11 appendPath:v19];
  }
  return (UIBezierPath *)v11;
}

- (void)_updateLightingOutlinePath
{
  [(_UITextFieldPasscodeCutoutBackground *)self _pathInset];
  CGFloat v4 = v3;
  [(_UITextFieldPasscodeCutoutBackground *)self cornerRadius];
  double v6 = v5;
  [(UIView *)self bounds];
  CGRect v16 = CGRectInset(v15, v4, v4);
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;
  v11 = +[UIBezierPath bezierPath];
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  if (!CGRectIsNull(v17))
  {
    uint64_t v12 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v6);

    v11 = (void *)v12;
  }
  id v13 = v11;
  -[CAShapeLayer setPath:](self->_lighteningOutline, "setPath:", [v13 CGPath]);
}

- (void)_updatePath
{
  [(_UITextFieldPasscodeCutoutBackground *)self _updateLightingOutlinePath];
  double v3 = [(_UITextFieldPasscodeCutoutBackground *)self _shapeLayer];
  CGFloat v4 = [(_UITextFieldPasscodeCutoutBackground *)self customPath];

  if (v4)
  {
    double v5 = [(_UITextFieldPasscodeCutoutBackground *)self customPath];
    [v3 setStrokeColor:0];
  }
  else
  {
    [(_UITextFieldPasscodeCutoutBackground *)self _pathInset];
    CGFloat v7 = v6;
    [(UIView *)self bounds];
    CGRect v18 = CGRectInset(v17, v7, v7);
    double x = v18.origin.x;
    double y = v18.origin.y;
    double width = v18.size.width;
    double height = v18.size.height;
    if (CGRectIsNull(v18))
    {
      double v5 = 0;
    }
    else
    {
      [(_UITextFieldPasscodeCutoutBackground *)self cornerRadius];
      double v5 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v12);
    }
  }
  if (+[UIView _isInAnimationBlock])
  {
    id v13 = [v3 animationForKey:@"path"];

    if (v13)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __51___UITextFieldPasscodeCutoutBackground__updatePath__block_invoke;
      v15[3] = &unk_1E52D9F70;
      id v16 = v3;
      +[UIView performWithoutAnimation:v15];
    }
  }
  CGFloat v14 = [v3 animationForKey:@"path"];

  if (!v14) {
    objc_msgSend(v3, "setPath:", objc_msgSend(v5, "CGPath"));
  }
  [(UIView *)self setNeedsDisplay];
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UITextFieldPasscodeCutoutBackground;
  -[UITextFieldBackgroundView setEnabled:animated:](&v11, sel_setEnabled_animated_);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60___UITextFieldPasscodeCutoutBackground_setEnabled_animated___block_invoke;
  v9[3] = &unk_1E52D9FC0;
  v9[4] = self;
  BOOL v10 = a3;
  CGFloat v7 = _Block_copy(v9);
  v8 = v7;
  if (v4) {
    +[UIView animateWithDuration:v7 animations:0.35];
  }
  else {
    (*((void (**)(void *))v7 + 2))(v7);
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  double v5 = (void *)_shouldAnimatePropertyWithKey__properties;
  if (!_shouldAnimatePropertyWithKey__properties)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"path", @"fillColor", @"lineWidth", @"strokeColor", 0);
    CGFloat v7 = (void *)_shouldAnimatePropertyWithKey__properties;
    _shouldAnimatePropertyWithKey__properties = v6;

    double v5 = (void *)_shouldAnimatePropertyWithKey__properties;
  }
  if ([v5 containsObject:v4])
  {
    BOOL v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UITextFieldPasscodeCutoutBackground;
    BOOL v8 = [(UIView *)&v10 _shouldAnimatePropertyWithKey:v4];
  }

  return v8;
}

- (id)_strokeColor:(BOOL)a3
{
  if (a3) {
    +[UIColor _textFieldBorderColor];
  }
  else {
  double v3 = +[UIColor _textFieldDisabledBorderColor];
  }
  return v3;
}

- (id)_fillColor:(BOOL)a3
{
  if (a3) {
    +[UIColor _textFieldBackgroundColor];
  }
  else {
  double v3 = +[UIColor _textFieldDisabledBackgroundColor];
  }
  return v3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
}

@end