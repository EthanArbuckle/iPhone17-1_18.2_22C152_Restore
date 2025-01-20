@interface OverridenBackgroundColorButton
+ (id)newChromeBlueButton;
- (BOOL)hasRoundedRectColor;
- (UIColor)overridingBackgroundColor;
- (void)setBackgroundColor:(id)a3;
- (void)setOverridingBackgroundColor:(id)a3;
@end

@implementation OverridenBackgroundColorButton

- (void)setOverridingBackgroundColor:(id)a3
{
  id v5 = a3;
  p_overridingBackgroundColor = &self->_overridingBackgroundColor;
  if (([v5 isEqual:self->_overridingBackgroundColor] & 1) == 0
    && (v5 || *p_overridingBackgroundColor))
  {
    objc_storeStrong((id *)&self->_overridingBackgroundColor, a3);
    v7 = *p_overridingBackgroundColor;
    v8.receiver = self;
    v8.super_class = (Class)OverridenBackgroundColorButton;
    [(OverridenBackgroundColorButton *)&v8 setBackgroundColor:v7];
    [(OverridenBackgroundColorButton *)self setNeedsDisplay];
  }
}

- (BOOL)hasRoundedRectColor
{
  overridingBackgroundColor = self->_overridingBackgroundColor;
  if (overridingBackgroundColor)
  {
    v3 = +[UIColor clearColor];
    LODWORD(overridingBackgroundColor) = [(UIColor *)overridingBackgroundColor isEqual:v3] ^ 1;
  }
  return (char)overridingBackgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (![(OverridenBackgroundColorButton *)self hasRoundedRectColor])
  {
    v5.receiver = self;
    v5.super_class = (Class)OverridenBackgroundColorButton;
    [(OverridenBackgroundColorButton *)&v5 setBackgroundColor:v4];
  }
}

+ (id)newChromeBlueButton
{
  v2 = +[OverridenBackgroundColorButton buttonWithType:1];
  v3 = [v2 layer];
  [v3 setCornerRadius:5.0];

  [v2 setClipsToBounds:1];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = +[UIFont boldSystemFontOfSize:15.0];
  objc_super v5 = [v2 titleLabel];
  [v5 setFont:v4];

  v6 = +[UIColor whiteColor];
  [v2 setTitleColor:v6 forState:0];

  [v2 setContentEdgeInsets:5.0, 15.0, 5.0, 15.0];
  v7 = [v2 theme];
  objc_super v8 = [v7 keyColor];
  [v2 setOverridingBackgroundColor:v8];

  return v2;
}

- (UIColor)overridingBackgroundColor
{
  return self->_overridingBackgroundColor;
}

- (void).cxx_destruct
{
}

@end