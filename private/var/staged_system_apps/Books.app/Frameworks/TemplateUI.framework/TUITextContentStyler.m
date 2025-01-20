@interface TUITextContentStyler
- (BOOL)isEqualToStyle:(id)a3;
- (UIColor)textColor;
- (UIColor)tintColor;
- (UIFont)font;
- (void)applyStylingToLayer:(id)a3;
- (void)applyStylingToView:(id)a3;
- (void)setFont:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation TUITextContentStyler

- (void)applyStylingToLayer:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TUITextContentStyler;
  [(TUIBackgroundColorStyler *)&v3 applyStylingToLayer:a3];
}

- (void)applyStylingToView:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TUITextContentStyler;
  [(TUIBackgroundColorStyler *)&v5 applyStylingToView:v4];
  if (self->_tintColor && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 setTintColor:self->_tintColor];
  }
  if (self->_textColor && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 setTextColor:self->_textColor];
  }
  if (self->_font && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 setFont:self->_font];
  }
}

- (BOOL)isEqualToStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TUIDynamicCast(v5, v4);

  v12.receiver = self;
  v12.super_class = (Class)TUITextContentStyler;
  if ([(TUIBackgroundColorStyler *)&v12 isEqualToStyle:v6]
    && ((textColor = self->_textColor, textColor == (UIColor *)v6[2])
     || -[UIColor isEqual:](textColor, "isEqual:"))
    && ((font = self->_font, font == (UIFont *)v6[3]) || -[UIFont isEqual:](font, "isEqual:")))
  {
    tintColor = self->_tintColor;
    if (tintColor == (UIColor *)v6[4]) {
      unsigned __int8 v10 = 1;
    }
    else {
      unsigned __int8 v10 = -[UIColor isEqual:](tintColor, "isEqual:");
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_font, 0);

  objc_storeStrong((id *)&self->_textColor, 0);
}

@end