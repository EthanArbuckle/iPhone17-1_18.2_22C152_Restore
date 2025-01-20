@interface OBTrayButton
+ (double)standardHeight;
+ (id)buttonWithType:(int64_t)a3;
- (double)lastTitleLabelHeight;
- (id)_fontTextStyle;
- (id)buttonFont;
- (void)hidesBusyIndicator;
- (void)setLastTitleLabelHeight:(double)a3;
- (void)showsBusyIndicator;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OBTrayButton

+ (id)buttonWithType:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___OBTrayButton;
  v3 = objc_msgSendSuper2(&v5, sel_buttonWithType_, a3);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)OBTrayButton;
  [(OBTrayButton *)&v10 traitCollectionDidChange:a3];
  v4 = [(OBTrayButton *)self attributedTitleForState:0];
  [(OBTrayButton *)self setAttributedTitle:v4 forState:0];

  objc_super v5 = [(OBTrayButton *)self attributedTitleForState:1];
  [(OBTrayButton *)self setAttributedTitle:v5 forState:1];

  v6 = [(OBTrayButton *)self attributedTitleForState:4];
  [(OBTrayButton *)self setAttributedTitle:v6 forState:4];

  v7 = [(OBTrayButton *)self attributedTitleForState:8];
  [(OBTrayButton *)self setAttributedTitle:v7 forState:8];

  v8 = [(OBTrayButton *)self attributedTitleForState:16711680];
  [(OBTrayButton *)self setAttributedTitle:v8 forState:16711680];

  v9 = [(OBTrayButton *)self attributedTitleForState:2];
  [(OBTrayButton *)self setAttributedTitle:v9 forState:2];

  [(OBTrayButton *)self setNeedsUpdateConfiguration];
}

- (void)showsBusyIndicator
{
  v3 = [(OBTrayButton *)self configuration];
  char v4 = [v3 showsActivityIndicator];

  if ((v4 & 1) == 0)
  {
    objc_super v5 = [(OBTrayButton *)self configuration];
    [v5 setShowsActivityIndicator:1];
    [(OBTrayButton *)self setConfiguration:v5];
    [(OBTrayButton *)self setNeedsUpdateConfiguration];
    v6.receiver = self;
    v6.super_class = (Class)OBTrayButton;
    [(OBTrayButton *)&v6 setEnabled:0];
  }
}

- (void)hidesBusyIndicator
{
  v3 = [(OBTrayButton *)self configuration];
  int v4 = [v3 showsActivityIndicator];

  if (v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)OBTrayButton;
    [(OBTrayButton *)&v6 setEnabled:1];
    objc_super v5 = [(OBTrayButton *)self configuration];
    [v5 setShowsActivityIndicator:0];
    [(OBTrayButton *)self setConfiguration:v5];
    [(OBTrayButton *)self setNeedsUpdateConfiguration];
  }
}

+ (double)standardHeight
{
  return 50.0;
}

- (id)_fontTextStyle
{
  return (id)*MEMORY[0x1E4FB28C8];
}

- (id)buttonFont
{
  v3 = [(OBTrayButton *)self _fontTextStyle];
  int v4 = [(UIButton *)self fontForStyle:v3 maxSizeCategory:*MEMORY[0x1E4FB2780]];

  objc_super v5 = (void *)MEMORY[0x1E4FB08E0];
  [v4 pointSize];
  objc_super v6 = objc_msgSend(v5, "boldSystemFontOfSize:");

  return v6;
}

- (double)lastTitleLabelHeight
{
  return self->_lastTitleLabelHeight;
}

- (void)setLastTitleLabelHeight:(double)a3
{
  self->_lastTitleLabelHeight = a3;
}

@end