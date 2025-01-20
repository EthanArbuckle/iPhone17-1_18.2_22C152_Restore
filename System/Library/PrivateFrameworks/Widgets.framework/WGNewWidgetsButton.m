@interface WGNewWidgetsButton
- (CGSize)_numberLabelSizeForText:(id)a3 withAttributes:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)numberText;
- (NSString)text;
- (WGNewWidgetsButton)init;
- (_UILegibilitySettings)legibilitySettings;
- (id)_attributedStringWithColor:(id)a3;
- (id)_numberAttributedStringWithNumberText:(id)a3 attributes:(id)a4;
- (id)_numberImageForNumberText:(id)a3 withAttributes:(id)a4;
- (id)_numberTextAttributes;
- (id)_textAttributesWithColor:(id)a3;
- (id)_textFont;
- (unint64_t)badgeNumber;
- (void)_buttonPushed:(id)a3;
- (void)_buttonStateChanged:(id)a3;
- (void)_setAttributeTitleForButton:(id)a3 withColor:(id)a4;
- (void)_updateButtons;
- (void)layoutSubviews;
- (void)setBadgeNumber:(unint64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setNumberText:(id)a3;
- (void)setText:(id)a3;
@end

@implementation WGNewWidgetsButton

- (WGNewWidgetsButton)init
{
  v14.receiver = self;
  v14.super_class = (Class)WGNewWidgetsButton;
  v2 = [(WGNewWidgetsButton *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(WGNewWidgetsButton *)v2 titleLabel];
    [v4 setNumberOfLines:0];

    uint64_t v5 = [MEMORY[0x263F1C488] buttonWithType:0];
    vibrantButton = v3->_vibrantButton;
    v3->_vibrantButton = (UIButton *)v5;

    [(UIButton *)v3->_vibrantButton _setDrawsAsBackdropOverlayWithBlendMode:3];
    v7 = [(UIButton *)v3->_vibrantButton titleLabel];
    [v7 setNumberOfLines:0];

    [(WGNewWidgetsButton *)v3 addSubview:v3->_vibrantButton];
    uint64_t v8 = [MEMORY[0x263F1C488] buttonWithType:0];
    overlayButton = v3->_overlayButton;
    v3->_overlayButton = (UIButton *)v8;

    v10 = [(UIButton *)v3->_overlayButton titleLabel];
    [v10 setNumberOfLines:0];

    [(WGNewWidgetsButton *)v3 addSubview:v3->_overlayButton];
    v11 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    numberAttributedStringCache = v3->_numberAttributedStringCache;
    v3->_numberAttributedStringCache = v11;

    [(UIButton *)v3->_overlayButton addTarget:v3 action:sel__buttonStateChanged_ forControlEvents:0xFFFFFFFFLL];
    [(UIButton *)v3->_overlayButton addTarget:v3 action:sel__buttonPushed_ forControlEvents:64];
    [(WGNewWidgetsButton *)v3 setBadgeNumber:0];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIButton sizeThatFits:](self->_overlayButton, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setBadgeNumber:(unint64_t)a3
{
  self->_badgeNumber = a3;
  double v4 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%u", a3);
  [(WGNewWidgetsButton *)self setNumberText:v4];

  uint64_t v5 = NSString;
  int v6 = _os_feature_enabled_impl();
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = v7;
  if (v6) {
    v9 = @"NEW_WIDGETS_AVAILABLE_LEGACY";
  }
  else {
    v9 = @"NEW_WIDGETS_AVAILABLE";
  }
  v10 = [v7 localizedStringForKey:v9 value:&stru_26D5C79B8 table:@"Widgets"];
  v11 = objc_msgSend(v5, "localizedStringWithFormat:", v10, self->_badgeNumber);
  [(WGNewWidgetsButton *)self setText:v11];

  [(WGNewWidgetsButton *)self _updateButtons];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIButton setHighlighted:](self->_vibrantButton, "setHighlighted:");
  overlayButton = self->_overlayButton;
  [(UIButton *)overlayButton setHighlighted:v3];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)WGNewWidgetsButton;
  [(WGNewWidgetsButton *)&v11 layoutSubviews];
  [(WGNewWidgetsButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIButton setFrame:](self->_vibrantButton, "setFrame:");
  -[UIButton setFrame:](self->_overlayButton, "setFrame:", v4, v6, v8, v10);
}

- (void)_buttonPushed:(id)a3
{
}

- (void)_buttonStateChanged:(id)a3
{
  [(UIButton *)self->_vibrantButton setSelected:[(UIButton *)self->_overlayButton isSelected]];
  vibrantButton = self->_vibrantButton;
  uint64_t v5 = [(UIButton *)self->_overlayButton isHighlighted];
  [(UIButton *)vibrantButton setHighlighted:v5];
}

- (void)_updateButtons
{
  vibrantButton = self->_vibrantButton;
  double v4 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(WGNewWidgetsButton *)self _setAttributeTitleForButton:vibrantButton withColor:v4];

  overlayButton = self->_overlayButton;
  double v6 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(WGNewWidgetsButton *)self _setAttributeTitleForButton:overlayButton withColor:v6];

  [(WGNewWidgetsButton *)self setNeedsLayout];
}

- (void)_setAttributeTitleForButton:(id)a3 withColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(WGNewWidgetsButton *)self _attributedStringWithColor:v6];
  [v7 setAttributedTitle:v8 forState:0];

  id v9 = [(WGNewWidgetsButton *)self _attributedStringWithColor:v6];

  [v7 setAttributedTitle:v9 forState:4];
  [v7 setAttributedTitle:v9 forState:1];
}

- (id)_textFont
{
  v2 = [MEMORY[0x263F29D38] preferredFontProvider];
  double v3 = [v2 preferredFontForTextStyle:*MEMORY[0x263F1D278] hiFontStyle:1];

  return v3;
}

- (id)_textAttributesWithColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = [(WGNewWidgetsButton *)self _textFont];
  if (v6) {
    [v5 setObject:v6 forKey:*MEMORY[0x263F1C238]];
  }
  if (v4) {
    [v5 setObject:v4 forKey:*MEMORY[0x263F1C240]];
  }
  id v7 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  double v8 = (void *)[v7 mutableCopy];

  [v8 setAlignment:1];
  [v5 setObject:v8 forKey:*MEMORY[0x263F1C268]];

  return v5;
}

- (id)_numberTextAttributes
{
  double v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(WGNewWidgetsButton *)self _numberFont];
  if (v4) {
    [v3 setObject:v4 forKey:*MEMORY[0x263F1C238]];
  }
  legibilitySettings = self->_legibilitySettings;
  if (legibilitySettings) {
    [(_UILegibilitySettings *)legibilitySettings shadowColor];
  }
  else {
  id v6 = [MEMORY[0x263F1C550] blackColor];
  }
  [v3 setObject:v6 forKey:*MEMORY[0x263F1C240]];

  id v7 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  double v8 = (void *)[v7 mutableCopy];

  [v8 setAlignment:1];
  [v3 setObject:v8 forKey:*MEMORY[0x263F1C268]];

  return v3;
}

- (id)_attributedStringWithColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WGNewWidgetsButton *)self numberText];
  id v6 = [(WGNewWidgetsButton *)self _numberTextAttributes];
  id v7 = [(WGNewWidgetsButton *)self _numberAttributedStringWithNumberText:v5 attributes:v6];

  id v8 = objc_alloc(MEMORY[0x263F089B8]);
  id v9 = [(WGNewWidgetsButton *)self text];
  double v10 = [(WGNewWidgetsButton *)self _textAttributesWithColor:v4];

  objc_super v11 = (void *)[v8 initWithString:v9 attributes:v10];
  v12 = [v11 string];
  v13 = [(WGNewWidgetsButton *)self numberText];
  uint64_t v14 = [v12 rangeOfString:v13];
  uint64_t v16 = v15;

  if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v11, "replaceCharactersInRange:withAttributedString:", v14, v16, v7);
  }

  return v11;
}

- (id)_numberAttributedStringWithNumberText:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v6];
  if (v7)
  {
    id v9 = [v7 description];
    [v8 appendString:v9];
  }
  legibilitySettings = self->_legibilitySettings;
  if (legibilitySettings)
  {
    objc_super v11 = [(_UILegibilitySettings *)legibilitySettings primaryColor];
    v12 = [v11 description];
    [v8 appendString:v12];

    v13 = [(_UILegibilitySettings *)self->_legibilitySettings shadowColor];
    uint64_t v14 = [v13 description];
    [v8 appendString:v14];
  }
  uint64_t v15 = [(NSCache *)self->_numberAttributedStringCache objectForKey:v8];
  if (!v15)
  {
    uint64_t v16 = [(WGNewWidgetsButton *)self _numberImageForNumberText:v6 withAttributes:v7];
    v17 = (void *)[objc_alloc(MEMORY[0x263F1C370]) initWithData:0 ofType:0];
    [v17 setImage:v16];
    v18 = [(WGNewWidgetsButton *)self _numberFont];
    [v18 descender];
    _WGMainScreenScale();
    BSFloatFloorForScale();
    double v20 = v19;

    [v16 size];
    objc_msgSend(v17, "setBounds:", 0.0, v20, v21, v22);
    uint64_t v15 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v17];
    [(NSCache *)self->_numberAttributedStringCache setObject:v15 forKey:v8];
  }
  return v15;
}

- (id)_numberImageForNumberText:(id)a3 withAttributes:(id)a4
{
  id v6 = a4;
  [(WGNewWidgetsButton *)self _numberLabelSizeForText:a3 withAttributes:v6];
  double width = v21.width;
  double height = v21.height;
  UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
  id v9 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [v9 set];

  double v10 = *MEMORY[0x263F00148];
  double v11 = *(double *)(MEMORY[0x263F00148] + 8);
  v12 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x263F00148], v11, width, height, height * 0.5);
  [v12 fill];
  if (self->_badgeNumber == 1)
  {
    v22.origin.x = v10;
    v22.origin.y = v11;
    v22.size.double width = width;
    v22.size.double height = height;
    CGRect v23 = CGRectOffset(v22, -0.5, 0.0);
    WGRectRoundForMainScreenScale(v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
    double v10 = v13;
    double v11 = v14;
    double width = v15;
    double height = v16;
  }
  v17 = [(WGNewWidgetsButton *)self numberText];
  objc_msgSend(v17, "drawInRect:withAttributes:", v6, v10, v11, width, height);

  v18 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v18;
}

- (CGSize)_numberLabelSizeForText:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  [v6 sizeWithAttributes:a4];
  uint64_t v7 = [v6 length];

  if (v7 == 1)
  {
    _WGMainScreenScale();
    BSFloatCeilForScale();
    double v9 = v8;
  }
  else
  {
    double v10 = [(WGNewWidgetsButton *)self _numberFont];
    [v10 capHeight];
    _WGMainScreenScale();
    BSFloatCeilForScale();
    double v9 = v11;
  }
  _WGMainScreenScale();
  BSFloatCeilForScale();
  double v13 = v12;
  double v14 = v9;
  result.double height = v13;
  result.double width = v14;
  return result;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  [(WGNewWidgetsButton *)self _updateButtons];
}

- (unint64_t)badgeNumber
{
  return self->_badgeNumber;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)numberText
{
  return self->_numberText;
}

- (void)setNumberText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_numberAttributedStringCache, 0);
  objc_storeStrong((id *)&self->_overlayButton, 0);
  objc_storeStrong((id *)&self->_vibrantButton, 0);
}

@end