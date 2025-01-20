@interface _UITextFieldRoundedRectBackgroundViewNeue
- (BOOL)hasFlexibleCornerRadius;
- (BOOL)usesSinglePixelLineWidth;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (_UITextFieldRoundedRectBackgroundViewNeue)initWithFrame:(CGRect)a3;
- (_UITextFieldRoundedRectBackgroundViewNeue)initWithFrame:(CGRect)a3 active:(BOOL)a4;
- (double)_cornerRadiusAdjustedForBoundsHeight;
- (double)_screenScale;
- (double)cornerRadius;
- (double)lineWidth;
- (id)_fillColor:(BOOL)a3;
- (id)_initWithFrame:(CGRect)a3 active:(BOOL)a4 usesSinglePixelLineWidth:(BOOL)a5;
- (id)_initWithFrame:(CGRect)a3 active:(BOOL)a4 usesSinglePixelLineWidth:(BOOL)a5 updateView:(BOOL)a6;
- (id)_strokeColor:(BOOL)a3;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setFillColor:(id)a3;
- (void)setHasFlexibleCornerRadius:(BOOL)a3;
- (void)setLineWidth:(double)a3;
- (void)setStrokeColor:(id)a3;
- (void)setUsesSinglePixelLineWidth:(BOOL)a3;
- (void)updateView;
@end

@implementation _UITextFieldRoundedRectBackgroundViewNeue

- (_UITextFieldRoundedRectBackgroundViewNeue)initWithFrame:(CGRect)a3 active:(BOOL)a4
{
  return (_UITextFieldRoundedRectBackgroundViewNeue *)-[_UITextFieldRoundedRectBackgroundViewNeue _initWithFrame:active:usesSinglePixelLineWidth:](self, "_initWithFrame:active:usesSinglePixelLineWidth:", a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_initWithFrame:(CGRect)a3 active:(BOOL)a4 usesSinglePixelLineWidth:(BOOL)a5
{
  return -[_UITextFieldRoundedRectBackgroundViewNeue _initWithFrame:active:usesSinglePixelLineWidth:updateView:](self, "_initWithFrame:active:usesSinglePixelLineWidth:updateView:", a4, a5, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setHasFlexibleCornerRadius:(BOOL)a3
{
  char flags = (char)self->_flags;
  if (((((flags & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char flags = flags & 0xFD | v4;
    [(_UITextFieldRoundedRectBackgroundViewNeue *)self updateView];
  }
}

- (id)_initWithFrame:(CGRect)a3 active:(BOOL)a4 usesSinglePixelLineWidth:(BOOL)a5 updateView:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)_UITextFieldRoundedRectBackgroundViewNeue;
  v8 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  if (v8)
  {
    [(UIView *)v8 setAutoresizingMask:18];
    [(UIView *)v9 setOpaque:0];
    [(UIView *)v9 setUserInteractionEnabled:0];
    if (v7) {
      char v10 = 5;
    }
    else {
      char v10 = 1;
    }
    *(unsigned char *)&v9->_char flags = *(unsigned char *)&v9->_flags & 0xF8 | v10;
    v9->_cornerRadius = 5.0;
    if (v6) {
      [(_UITextFieldRoundedRectBackgroundViewNeue *)v9 updateView];
    }
  }
  return v9;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(_UITextFieldRoundedRectBackgroundViewNeue *)self updateView];
  }
}

- (void)layoutSubviews
{
  [(_UITextFieldRoundedRectBackgroundViewNeue *)self updateView];
  v3.receiver = self;
  v3.super_class = (Class)_UITextFieldRoundedRectBackgroundViewNeue;
  [(UIView *)&v3 layoutSubviews];
}

- (void)updateView
{
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      v18 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }
    }
  }
  else if (!self)
  {
    v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &updateView___s_category) + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20[0] = 0;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", (uint8_t *)v20, 2u);
    }
  }
  objc_super v3 = +[UITraitCollection _currentTraitCollectionIfExists]();
  char v4 = [(UIView *)self traitCollection];
  +[UITraitCollection setCurrentTraitCollection:v4];

  v5 = (void *)_UISetCurrentFallbackEnvironment(self);
  if ([(_UITextFieldRoundedRectBackgroundViewNeue *)self usesSinglePixelLineWidth])
  {
    BOOL v6 = [(UIView *)self traitCollection];
    [v6 displayScale];
    double lineWidth = 1.0 / v7;
  }
  else
  {
    double lineWidth = self->_lineWidth;
  }
  strokeColor = self->_strokeColor;
  if (strokeColor)
  {
    char v10 = strokeColor;
  }
  else
  {
    char v10 = [(_UITextFieldRoundedRectBackgroundViewNeue *)self _strokeColor:*(unsigned char *)&self->_flags & 1];
  }
  v11 = v10;
  fillColor = self->_fillColor;
  if (fillColor)
  {
    v13 = fillColor;
  }
  else
  {
    v13 = [(_UITextFieldRoundedRectBackgroundViewNeue *)self _fillColor:*(unsigned char *)&self->_flags & 1];
  }
  v14 = v13;
  [(UIView *)self setBackgroundColor:v13];
  v15 = [(UIView *)self layer];
  v16 = v11;
  objc_msgSend(v15, "setBorderColor:", -[UIColor CGColor](v16, "CGColor"));
  [v15 setBorderWidth:lineWidth];
  if ([(_UITextFieldRoundedRectBackgroundViewNeue *)self hasFlexibleCornerRadius]) {
    [(_UITextFieldRoundedRectBackgroundViewNeue *)self _cornerRadiusAdjustedForBoundsHeight];
  }
  else {
    double cornerRadius = self->_cornerRadius;
  }
  [v15 setCornerRadius:cornerRadius];
  [v15 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  _UIRestorePreviousFallbackEnvironment(v5);
  +[UITraitCollection setCurrentTraitCollection:v3];
}

- (BOOL)usesSinglePixelLineWidth
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)hasFlexibleCornerRadius
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)_strokeColor:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = [(UIView *)self traitCollection];
  unint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 > 8 || ((1 << v5) & 0x144) == 0)
  {
    if (v3) {
      +[UIColor _textFieldBorderColor];
    }
    else {
    double v7 = +[UIColor _textFieldDisabledBorderColor];
    }
  }
  else
  {
    double v7 = +[UIColor clearColor];
  }
  return v7;
}

- (double)_cornerRadiusAdjustedForBoundsHeight
{
  [(UIView *)self bounds];
  double v4 = v3;
  [(_UITextFieldRoundedRectBackgroundViewNeue *)self _screenScale];
  double result = floor(v5 * (v4 * 0.5)) / v5;
  if (result > self->_cornerRadius) {
    return self->_cornerRadius;
  }
  return result;
}

- (double)_screenScale
{
  v2 = [(UIView *)self window];
  double v3 = [v2 screen];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[UIScreen mainScreen];
  }
  BOOL v6 = v5;

  [v6 scale];
  double v8 = v7;

  return v8;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (id)_fillColor:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = [(UIView *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  switch(v5)
  {
    case 8:
      goto LABEL_4;
    case 6:
      double v7 = +[UIColor blackColor];
      double v8 = [v7 colorWithAlphaComponent:0.15];

      goto LABEL_11;
    case 2:
LABEL_4:
      uint64_t v6 = +[UIColor clearColor];
      break;
    default:
      if (v3) {
        +[UIColor _textFieldBackgroundColor];
      }
      else {
      uint64_t v6 = +[UIColor _textFieldDisabledBackgroundColor];
      }
      break;
  }
  double v8 = (void *)v6;
LABEL_11:
  return v8;
}

- (void)setFillColor:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self->_fillColor;
  double v7 = (UIColor *)v5;
  v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(UIColor *)v6 isEqual:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_fillColor, a3);
    [(_UITextFieldRoundedRectBackgroundViewNeue *)self updateView];
  }
LABEL_9:
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

- (_UITextFieldRoundedRectBackgroundViewNeue)initWithFrame:(CGRect)a3
{
  return -[_UITextFieldRoundedRectBackgroundViewNeue initWithFrame:active:](self, "initWithFrame:active:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setStrokeColor:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self->_strokeColor;
  double v7 = (UIColor *)v5;
  v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(UIColor *)v6 isEqual:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_strokeColor, a3);
    [(_UITextFieldRoundedRectBackgroundViewNeue *)self updateView];
  }
LABEL_9:
}

- (void)setLineWidth:(double)a3
{
  [(_UITextFieldRoundedRectBackgroundViewNeue *)self setUsesSinglePixelLineWidth:0];
  if (self->_lineWidth != a3)
  {
    self->_double lineWidth = a3;
    [(_UITextFieldRoundedRectBackgroundViewNeue *)self updateView];
  }
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  char flags = (char)self->_flags;
  if (((((flags & 1) == 0) ^ a3) & 1) == 0)
  {
    *(unsigned char *)&self->_char flags = flags & 0xFE | a3;
    [(_UITextFieldRoundedRectBackgroundViewNeue *)self updateView];
  }
}

- (void)setUsesSinglePixelLineWidth:(BOOL)a3
{
  char flags = (char)self->_flags;
  if (((((flags & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 4;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char flags = flags & 0xFB | v4;
    [(_UITextFieldRoundedRectBackgroundViewNeue *)self updateView];
  }
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

@end