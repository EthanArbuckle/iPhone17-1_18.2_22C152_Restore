@interface SUUIColorScheme
+ (BOOL)supportsSecureCoding;
- (SUUIColorScheme)initWithCoder:(id)a3;
- (SUUIColorScheme)initWithColorSchemeDictionary:(id)a3;
- (UIColor)backgroundColor;
- (UIColor)highlightedTextColor;
- (UIColor)primaryTextColor;
- (UIColor)secondaryTextColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)schemeStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setHighlightedTextColor:(id)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
@end

@implementation SUUIColorScheme

- (SUUIColorScheme)initWithColorSchemeDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUUIColorScheme;
  v5 = [(SUUIColorScheme *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = SUUIColorWithHTMLCode(v6);
      backgroundColor = v5->_backgroundColor;
      v5->_backgroundColor = (UIColor *)v7;
    }
    v9 = [v4 objectForKey:@"primaryTextColor"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = SUUIColorWithHTMLCode(v9);
      primaryTextColor = v5->_primaryTextColor;
      v5->_primaryTextColor = (UIColor *)v10;
    }
    v12 = [v4 objectForKey:@"titleTextColor"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = SUUIColorWithHTMLCode(v12);
      secondaryTextColor = v5->_secondaryTextColor;
      v5->_secondaryTextColor = (UIColor *)v13;
    }
    double v20 = 0.0;
    double v21 = 0.0;
    double v18 = 0.0;
    double v19 = 0.0;
    [(UIColor *)v5->_primaryTextColor getHue:&v21 saturation:&v20 brightness:&v19 alpha:&v18];
    uint64_t v15 = [MEMORY[0x263F825C8] colorWithHue:v21 saturation:v20 brightness:v19 + dbl_2568A0CC0[v19 < 0.5] alpha:v18];
    highlightedTextColor = v5->_highlightedTextColor;
    v5->_highlightedTextColor = (UIColor *)v15;
  }
  return v5;
}

- (int64_t)schemeStyle
{
  return SUUIColorSchemeStyleForColor(self->_backgroundColor);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(UIColor *)self->_backgroundColor copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(UIColor *)self->_highlightedTextColor copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(UIColor *)self->_primaryTextColor copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(UIColor *)self->_secondaryTextColor copyWithZone:a3];
  uint64_t v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUUIColorScheme)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIColorScheme;
  v5 = [(SUUIColorScheme *)&v14 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"bgc"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:v6 forKey:@"ptc"];
    primaryTextColor = v5->_primaryTextColor;
    v5->_primaryTextColor = (UIColor *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:v6 forKey:@"ttc"];
    secondaryTextColor = v5->_secondaryTextColor;
    v5->_secondaryTextColor = (UIColor *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  backgroundColor = self->_backgroundColor;
  id v5 = a3;
  [v5 encodeObject:backgroundColor forKey:@"bgc"];
  [v5 encodeObject:self->_primaryTextColor forKey:@"ptc"];
  [v5 encodeObject:self->_secondaryTextColor forKey:@"ttc"];
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (void)setHighlightedTextColor:(id)a3
{
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end