@interface _UILegibilityLabel
- (BOOL)usesSecondaryColor;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)string;
- (UIFont)font;
- (_UILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 string:(id)a5 font:(id)a6;
- (_UILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 string:(id)a5 font:(id)a6 options:(int64_t)a7;
- (double)baselineOffset;
- (void)dealloc;
- (void)setFont:(id)a3;
- (void)setString:(id)a3;
- (void)updateImage;
@end

@implementation _UILegibilityLabel

- (_UILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 string:(id)a5 font:(id)a6
{
  return [(_UILegibilityLabel *)self initWithSettings:a3 strength:a5 string:a6 font:0 options:a4];
}

- (_UILegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 string:(id)a5 font:(id)a6 options:(int64_t)a7
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v19 = *(void *)off_1E52D2040;
  v20[0] = a6;
  objc_msgSend(a5, "sizeWithAttributes:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1));
  v18.receiver = self;
  v18.super_class = (Class)_UILegibilityLabel;
  v15 = -[UIView initWithFrame:](&v18, sel_initWithFrame_, 0.0, 0.0, v13, v14);
  v16 = v15;
  if (v15)
  {
    [(CALayer *)[(UIView *)v15 layer] setAllowsGroupBlending:0];
    [(CALayer *)[(UIView *)v16 layer] setAllowsGroupOpacity:0];
    [(_UILegibilityView *)v16 setStrength:a4];
    v16->_string = (NSString *)[a5 copy];
    v16->_font = (UIFont *)a6;
    [(_UILegibilityView *)v16 setOptions:a7];
    [(_UILegibilityView *)v16 updateForChangedSettings:a3];
  }
  return v16;
}

- (void)dealloc
{
  self->_string = 0;
  self->_font = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UILegibilityLabel;
  [(_UILegibilityView *)&v3 dealloc];
}

- (void)setString:(id)a3
{
  if (([a3 isEqualToString:self->_string] & 1) == 0)
  {

    self->_string = (NSString *)[a3 copy];
    [(_UILegibilityView *)self setImage:0];
    [(_UILegibilityView *)self setShadowImage:0];
    [(_UILegibilityLabel *)self updateImage];
    v5 = [(_UILegibilityView *)self settings];
    v6 = [(_UILegibilityView *)self image];
    v7 = [(_UILegibilityView *)self shadowImage];
    [(_UILegibilityView *)self setSettings:v5 image:v6 shadowImage:v7];
  }
}

- (void)setFont:(id)a3
{
  if (([(UIFont *)[(_UILegibilityLabel *)self font] isEqual:a3] & 1) == 0)
  {

    self->_font = (UIFont *)a3;
    [(UIView *)self sizeToFit];
    [(_UILegibilityView *)self setImage:0];
    [(_UILegibilityView *)self setShadowImage:0];
    [(_UILegibilityLabel *)self updateImage];
    v5 = [(_UILegibilityView *)self settings];
    v6 = [(_UILegibilityView *)self image];
    v7 = [(_UILegibilityView *)self shadowImage];
    [(_UILegibilityView *)self setSettings:v5 image:v6 shadowImage:v7];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(void *)off_1E52D2040;
  v9[0] = [(_UILegibilityLabel *)self font];
  -[NSString sizeWithAttributes:](-[_UILegibilityLabel string](self, "string"), "sizeWithAttributes:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1]);
  *(float *)&double v4 = v4;
  double v5 = ceilf(*(float *)&v4);
  *(float *)&double v6 = v6;
  double v7 = ceilf(*(float *)&v6);
  result.height = v7;
  result.width = v5;
  return result;
}

- (double)baselineOffset
{
  objc_super v3 = [UILabel alloc];
  [(UIView *)self bounds];
  double v4 = -[UILabel initWithFrame:](v3, "initWithFrame:");
  [(UILabel *)v4 setText:[(_UILegibilityLabel *)self string]];
  [(UILabel *)v4 setFont:[(_UILegibilityLabel *)self font]];
  [(UILabel *)v4 _baselineOffsetFromBottom];
  double v6 = v5;

  return v6;
}

- (void)updateImage
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if ([(_UILegibilityView *)self settings]
    && [(NSString *)[(_UILegibilityLabel *)self string] length]
    && [(_UILegibilityLabel *)self font])
  {
    objc_super v3 = [(_UILegibilityView *)self drawingColor];
    if ([(_UILegibilityView *)self usesColorFilters]) {
      objc_super v3 = +[UIColor whiteColor];
    }
    double v4 = [(_UILegibilityLabel *)self font];
    uint64_t v5 = *(void *)off_1E52D2048;
    v18[0] = *(void *)off_1E52D2040;
    v18[1] = v5;
    v19[0] = v4;
    v19[1] = v3;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    double v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28B18]), "initWithString:attributes:", -[_UILegibilityLabel string](self, "string"), v6);
    [(UIView *)self bounds];
    +[UILabel _insetRect:forAttributedString:withDefaultFont:inView:](UILabel, "_insetRect:forAttributedString:withDefaultFont:inView:", v7, v4, self);
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [+[UIScreen mainScreen] scale];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __33___UILegibilityLabel_updateImage__block_invoke;
    v17[3] = &unk_1E52F1BC8;
    v17[6] = v9;
    v17[7] = v11;
    *(double *)&v17[8] = v13;
    *(double *)&v17[9] = v15;
    v17[4] = self;
    v17[5] = v7;
    [(_UILegibilityView *)self setImage:_UIGraphicsDrawIntoImageContextWithMoreOptions(0, 0, v17, v13, v15, v16)];

    [(_UILegibilityView *)self setShadowImage:0];
  }
  else
  {
    [(_UILegibilityView *)self setImage:0];
    [(_UILegibilityView *)self setShadowImage:0];
  }
}

- (NSString)string
{
  return self->_string;
}

- (UIFont)font
{
  return self->_font;
}

- (BOOL)usesSecondaryColor
{
  return self->_usesSecondaryColor;
}

@end