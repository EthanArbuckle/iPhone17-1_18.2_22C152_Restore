@interface SKUIColorScheme
+ (BOOL)supportsSecureCoding;
- (SKUIColorScheme)initWithCoder:(id)a3;
- (SKUIColorScheme)initWithColorSchemeDictionary:(id)a3;
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

@implementation SKUIColorScheme

- (SKUIColorScheme)initWithColorSchemeDictionary:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIColorScheme initWithColorSchemeDictionary:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)SKUIColorScheme;
  v13 = [(SKUIColorScheme *)&v30 init];
  if (v13)
  {
    v14 = [v4 objectForKey:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = SKUIColorWithHTMLCode(v14);
      backgroundColor = v13->_backgroundColor;
      v13->_backgroundColor = (UIColor *)v15;
    }
    v17 = [v4 objectForKey:@"primaryTextColor"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = SKUIColorWithHTMLCode(v17);
      primaryTextColor = v13->_primaryTextColor;
      v13->_primaryTextColor = (UIColor *)v18;
    }
    v20 = [v4 objectForKey:@"titleTextColor"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v21 = SKUIColorWithHTMLCode(v20);
      secondaryTextColor = v13->_secondaryTextColor;
      v13->_secondaryTextColor = (UIColor *)v21;
    }
    double v28 = 0.0;
    double v29 = 0.0;
    double v26 = 0.0;
    double v27 = 0.0;
    [(UIColor *)v13->_primaryTextColor getHue:&v29 saturation:&v28 brightness:&v27 alpha:&v26];
    uint64_t v23 = [MEMORY[0x1E4FB1618] colorWithHue:v29 saturation:v28 brightness:v27 + dbl_1C1CCB1C0[v27 < 0.5] alpha:v26];
    highlightedTextColor = v13->_highlightedTextColor;
    v13->_highlightedTextColor = (UIColor *)v23;
  }
  return v13;
}

- (int64_t)schemeStyle
{
  return SKUIColorSchemeStyleForColor(self->_backgroundColor);
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(UIColor *)self->_backgroundColor copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(UIColor *)self->_highlightedTextColor copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(UIColor *)self->_primaryTextColor copyWithZone:a3];
  uint64_t v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(UIColor *)self->_secondaryTextColor copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKUIColorScheme)initWithCoder:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIColorScheme initWithCoder:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIColorScheme;
  v13 = [(SKUIColorScheme *)&v22 init];
  if (v13)
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v4 decodeObjectOfClass:v14 forKey:@"bgc"];
    backgroundColor = v13->_backgroundColor;
    v13->_backgroundColor = (UIColor *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:v14 forKey:@"ptc"];
    primaryTextColor = v13->_primaryTextColor;
    v13->_primaryTextColor = (UIColor *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:v14 forKey:@"ttc"];
    secondaryTextColor = v13->_secondaryTextColor;
    v13->_secondaryTextColor = (UIColor *)v19;
  }
  return v13;
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

- (void)initWithColorSchemeDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end