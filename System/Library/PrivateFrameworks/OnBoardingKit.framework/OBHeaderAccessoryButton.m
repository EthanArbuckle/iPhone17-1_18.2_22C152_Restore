@interface OBHeaderAccessoryButton
+ (OBHeaderAccessoryButton)buttonWithType:(int64_t)a3;
+ (id)accessoryButton;
- (BOOL)underlineLinks;
- (id)_fontTextStyle;
- (void)_updateText;
- (void)setUnderlineLinks:(BOOL)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OBHeaderAccessoryButton

+ (OBHeaderAccessoryButton)buttonWithType:(int64_t)a3
{
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___OBHeaderAccessoryButton;
  v3 = objc_msgSendSuper2(&v11, sel_buttonWithType_, a3);
  v4 = (void *)MEMORY[0x1E4FB08E0];
  v5 = [v3 _fontTextStyle];
  v6 = [v4 preferredFontForTextStyle:v5];
  v7 = [v3 titleLabel];
  [v7 setFont:v6];

  v8 = [v3 titleLabel];
  [v8 setNumberOfLines:1];

  v9 = [v3 titleLabel];
  [v9 setTextAlignment:1];

  return (OBHeaderAccessoryButton *)v3;
}

+ (id)accessoryButton
{
  v2 = [a1 buttonWithType:1];
  v3 = [v2 titleLabel];
  [v3 setAdjustsFontSizeToFitWidth:1];

  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 _updateText];
  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBHeaderAccessoryButton;
  [(OBHeaderAccessoryButton *)&v4 traitCollectionDidChange:a3];
  [(OBHeaderAccessoryButton *)self _updateText];
}

- (id)_fontTextStyle
{
  return (id)*MEMORY[0x1E4FB28C8];
}

- (void)_updateText
{
  v3 = (void *)MEMORY[0x1E4FB08E0];
  objc_super v4 = [(OBHeaderAccessoryButton *)self _fontTextStyle];
  v5 = [v3 preferredFontForTextStyle:v4];
  v6 = [(OBHeaderAccessoryButton *)self titleLabel];
  [v6 setFont:v5];

  if (+[OBViewUtilities shouldUseAccessibilityLayout])
  {
    [(OBHeaderAccessoryButton *)self setContentHorizontalAlignment:4];
    v7 = [(OBHeaderAccessoryButton *)self titleLabel];
    double v8 = 0.0;
  }
  else
  {
    [(OBHeaderAccessoryButton *)self setContentHorizontalAlignment:0];
    v7 = [(OBHeaderAccessoryButton *)self titleLabel];
    double v8 = 0.65;
  }
  id v9 = v7;
  [v7 setMinimumScaleFactor:v8];
}

- (void)tintColorDidChange
{
  v10.receiver = self;
  v10.super_class = (Class)OBHeaderAccessoryButton;
  [(OBHeaderAccessoryButton *)&v10 tintColorDidChange];
  BOOL v3 = [(OBHeaderAccessoryButton *)self underlineLinks];
  objc_super v4 = [(OBHeaderAccessoryButton *)self titleLabel];
  v5 = [v4 attributedText];
  v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = *MEMORY[0x1E4FB0808];
  uint64_t v8 = [v6 length];
  if (v3) {
    objc_msgSend(v6, "addAttribute:value:range:", v7, &unk_1EEC379A0, 0, v8);
  }
  else {
    objc_msgSend(v6, "removeAttribute:range:", v7, 0, v8);
  }
  id v9 = [(OBHeaderAccessoryButton *)self titleLabel];
  [v9 setAttributedText:v6];
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
}

@end