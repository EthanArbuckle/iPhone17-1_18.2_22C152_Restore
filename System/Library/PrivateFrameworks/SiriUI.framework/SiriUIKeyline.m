@interface SiriUIKeyline
+ (SiriUIKeyline)keylineWithDefaultInsets;
+ (SiriUIKeyline)keylineWithKeylineType:(int64_t)a3;
+ (SiriUIKeyline)keylineWithKeylineType:(int64_t)a3 platterStyling:(BOOL)a4;
+ (id)keyline;
+ (id)keylineForSelectableRow;
+ (id)verticalKeyline;
- (BOOL)_isVeritical;
- (CGSize)_sizeThatFits:(CGSize)a3 useAutolayout:(BOOL)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriUIKeyline)initWithKeylineType:(int64_t)a3;
- (SiriUIKeyline)initWithKeylineType:(int64_t)a3 platterStyling:(BOOL)a4;
- (UIColor)customBackgroundColor;
- (double)_keylineThicknessForType:(int64_t)a3;
- (double)customLeftPadding;
- (double)customRightPadding;
- (id)_keylineColorForType:(int64_t)a3 platterStyling:(BOOL)a4;
- (int64_t)keylineType;
- (void)_setVertical:(BOOL)a3;
- (void)layoutSubviews;
- (void)setCustomBackgroundColor:(id)a3;
- (void)setCustomLeftPadding:(double)a3;
- (void)setCustomRightPadding:(double)a3;
- (void)setKeylineType:(int64_t)a3;
@end

@implementation SiriUIKeyline

+ (id)keyline
{
  v2 = (void *)[objc_alloc((Class)a1) initWithKeylineType:2];
  return v2;
}

+ (SiriUIKeyline)keylineWithDefaultInsets
{
  v2 = (void *)[objc_alloc((Class)a1) initWithKeylineType:1];
  return (SiriUIKeyline *)v2;
}

+ (id)keylineForSelectableRow
{
  v2 = (void *)[objc_alloc((Class)a1) initWithKeylineType:3];
  return v2;
}

+ (id)verticalKeyline
{
  v2 = (void *)[objc_alloc((Class)a1) initWithKeylineType:5];
  return v2;
}

+ (SiriUIKeyline)keylineWithKeylineType:(int64_t)a3
{
  uint64_t v5 = SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets();
  return (SiriUIKeyline *)[a1 keylineWithKeylineType:a3 platterStyling:v5];
}

+ (SiriUIKeyline)keylineWithKeylineType:(int64_t)a3 platterStyling:(BOOL)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithKeylineType:a3 platterStyling:a4];
  return (SiriUIKeyline *)v4;
}

- (SiriUIKeyline)initWithKeylineType:(int64_t)a3
{
  uint64_t v5 = SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets();
  return [(SiriUIKeyline *)self initWithKeylineType:a3 platterStyling:v5];
}

- (SiriUIKeyline)initWithKeylineType:(int64_t)a3 platterStyling:(BOOL)a4
{
  BOOL v4 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SiriUIKeyline;
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  v10 = -[SiriUIKeyline initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x263F001A8], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    v10->_keylineType = a3;
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v6, v7, v8, v9);
    keyLineView = v11->_keyLineView;
    v11->_keyLineView = (UIView *)v12;

    v14 = v11->_keyLineView;
    v15 = [(SiriUIKeyline *)v11 _keylineColorForType:v11->_keylineType platterStyling:v4];
    [(UIView *)v14 setBackgroundColor:v15];

    [(SiriUIKeyline *)v11 addSubview:v11->_keyLineView];
  }
  return v11;
}

- (id)_keylineColorForType:(int64_t)a3 platterStyling:(BOOL)a4
{
  if (a4) {
    objc_msgSend(MEMORY[0x263F1C550], "siriui_platterKeylineColor", a3);
  }
  else {
  BOOL v4 = objc_msgSend(MEMORY[0x263F1C550], "siriui_lightKeylineColor", a3);
  }
  return v4;
}

- (double)_keylineThicknessForType:(int64_t)a3
{
  v3 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", a3);
  [v3 scale];
  double v5 = v4;

  return 1.0 / v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SiriUIKeyline _sizeThatFits:useAutolayout:](self, "_sizeThatFits:useAutolayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[SiriUIKeyline _sizeThatFits:useAutolayout:](self, "_sizeThatFits:useAutolayout:", 1, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_sizeThatFits:(CGSize)a3 useAutolayout:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  int64_t v8 = [(SiriUIKeyline *)self keylineType];
  double v9 = *MEMORY[0x263F1D7C8];
  v10 = [MEMORY[0x263F1C920] mainScreen];
  [v10 scale];
  double v12 = v11;
  [(SiriUIKeyline *)self _keylineThicknessForType:self->_keylineType];
  double v14 = ceil(v13);
  if (v12 < 2.0) {
    double v13 = v14;
  }
  if (v4) {
    double v15 = v9;
  }
  else {
    double v15 = height;
  }
  if (v4) {
    double v16 = v9;
  }
  else {
    double v16 = width;
  }
  if (v8 == 5) {
    double v17 = v13;
  }
  else {
    double v17 = v16;
  }
  if (v8 == 5) {
    double v18 = v15;
  }
  else {
    double v18 = v13;
  }

  double v19 = v17;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)SiriUIKeyline;
  [(SiriUIKeyline *)&v16 layoutSubviews];
  [(SiriUIKeyline *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int64_t v11 = [(SiriUIKeyline *)self keylineType];
  if (v11 == 4)
  {
    [(SiriUIKeyline *)self customLeftPadding];
    double v12 = v14;
    [(SiriUIKeyline *)self customRightPadding];
  }
  else if (v11 == 3)
  {
    BOOL IsRTL = SiriLanguageIsRTL();
    double v13 = 16.0;
    if (IsRTL) {
      double v12 = 0.0;
    }
    else {
      double v12 = 16.0;
    }
    if (!IsRTL) {
      double v13 = 0.0;
    }
  }
  else
  {
    double v12 = 0.0;
    double v13 = 0.0;
    if (v11 == 1)
    {
      double v12 = 16.0;
      double v13 = 16.0;
    }
  }
  -[UIView setFrame:](self->_keyLineView, "setFrame:", v4 + v12, v6, v8 - (v12 + v13), v10);
}

- (void)setKeylineType:(int64_t)a3
{
  self->_keylineType = a3;
  [(SiriUIKeyline *)self setHidden:a3 == 0];
  [(SiriUIKeyline *)self setNeedsLayout];
}

- (void)setCustomLeftPadding:(double)a3
{
  self->_customLeftPadding = a3;
  [(SiriUIKeyline *)self setNeedsLayout];
}

- (void)setCustomRightPadding:(double)a3
{
  self->_customRightPadding = a3;
  [(SiriUIKeyline *)self setNeedsLayout];
}

- (void)setCustomBackgroundColor:(id)a3
{
}

- (int64_t)keylineType
{
  return self->_keylineType;
}

- (double)customLeftPadding
{
  return self->_customLeftPadding;
}

- (double)customRightPadding
{
  return self->_customRightPadding;
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (BOOL)_isVeritical
{
  return self->_veritical;
}

- (void)_setVertical:(BOOL)a3
{
  self->_veritical = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
  objc_storeStrong((id *)&self->_keyLineView, 0);
}

@end