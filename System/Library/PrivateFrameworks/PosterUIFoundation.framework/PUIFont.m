@interface PUIFont
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFont:(id)a3;
- (NSString)description;
- (NSString)fontIdentifier;
- (PUIFont)init;
- (PUIFont)initWithCustomFont:(id)a3;
- (PUIFont)initWithFontIdentifier:(id)a3;
- (PUIFont)initWithFontIdentifier:(id)a3 weight:(double)a4;
- (UIFont)customFont;
- (UIFont)effectiveFont;
- (double)_defaultWeightForFontIdentifier:(id)a3;
- (double)weight;
- (id)effectiveFontForRole:(id)a3;
- (id)effectiveFontForRole:(id)a3 ignoringWeight:(BOOL)a4;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation PUIFont

- (PUIFont)initWithFontIdentifier:(id)a3
{
  id v4 = a3;
  [(PUIFont *)self _defaultWeightForFontIdentifier:v4];
  v5 = -[PUIFont initWithFontIdentifier:weight:](self, "initWithFontIdentifier:weight:", v4);

  return v5;
}

- (PUIFont)initWithFontIdentifier:(id)a3 weight:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUIFont;
  v7 = [(PUIFont *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    fontIdentifier = v7->_fontIdentifier;
    v7->_fontIdentifier = (NSString *)v8;

    v7->_weight = a4;
  }

  return v7;
}

- (PUIFont)initWithCustomFont:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUIFont;
  id v6 = [(PUIFont *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_customFont, a3);
  }

  return v7;
}

- (PUIFont)init
{
  v3 = objc_msgSend(MEMORY[0x263F1C658], "pui_defaultFontIdentifier");
  id v4 = [(PUIFont *)self initWithFontIdentifier:v3];

  return v4;
}

- (UIFont)effectiveFont
{
  return (UIFont *)[(PUIFont *)self effectiveFontForRole:*MEMORY[0x263F5F460]];
}

- (id)effectiveFontForRole:(id)a3
{
  return [(PUIFont *)self effectiveFontForRole:a3 ignoringWeight:0];
}

- (id)effectiveFontForRole:(id)a3 ignoringWeight:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(PUIFont *)self customFont];

  if (v7)
  {
    uint64_t v8 = [(PUIFont *)self customFont];
  }
  else
  {
    objc_super v9 = (void *)MEMORY[0x263F1C658];
    v10 = [(PUIFont *)self fontIdentifier];
    objc_super v11 = objc_msgSend(v9, "pui_UIFontWithPUIFontIdentifier:forRole:", v10, v6);

    if (v4)
    {
      id v12 = v11;
    }
    else
    {
      [(PUIFont *)self weight];
      objc_msgSend(v11, "pui_UIFontWithVariantWeight:forRole:", (unint64_t)v13, v6);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v8 = v12;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (PUIFont *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v4
  }
      && (self,
          id v6 = objc_claimAutoreleasedReturnValue(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v6,
          (isKindOfClass & 1) != 0)
      && [(PUIFont *)self isEqualToFont:v5];

  return v8;
}

- (BOOL)isEqualToFont:(id)a3
{
  BOOL v4 = (PUIFont *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    id v6 = [(PUIFont *)self fontIdentifier];
    v7 = [(PUIFont *)v5 fontIdentifier];
    int v8 = BSEqualObjects();

    if (!v8) {
      goto LABEL_6;
    }
    [(PUIFont *)self weight];
    [(PUIFont *)v5 weight];
    if (BSFloatEqualToFloat())
    {
      objc_super v9 = [(PUIFont *)self customFont];
      v10 = [(PUIFont *)v5 customFont];
      char v11 = BSEqualObjects();
    }
    else
    {
LABEL_6:
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  BOOL v4 = [(PUIFont *)self fontIdentifier];
  id v5 = (id)[v3 appendString:v4];

  [(PUIFont *)self weight];
  id v6 = (id)objc_msgSend(v3, "appendCGFloat:");
  v7 = [(PUIFont *)self customFont];
  id v8 = (id)[v3 appendObject:v7];

  unint64_t v9 = [v3 hash];
  return v9;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C48]);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  unint64_t v9 = __22__PUIFont_description__block_invoke;
  v10 = &unk_265471108;
  char v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __22__PUIFont_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v8 = a3;
  id v4 = [(PUIFont *)self fontIdentifier];
  [v8 appendString:v4 withName:@"timeFontIdentifier" skipIfEmpty:1];

  [(PUIFont *)self weight];
  id v5 = (id)objc_msgSend(v8, "appendFloat:withName:", @"weight");
  id v6 = [(PUIFont *)self customFont];
  id v7 = (id)[v8 appendObject:v6 withName:@"customFont" skipIfNil:1];
}

- (double)_defaultWeightForFontIdentifier:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F1C658], "pui_UIFontWithPUIFontIdentifier:", a3);
  double v4 = (double)(unint64_t)objc_msgSend(v3, "pui_variantWeight");

  return v4;
}

- (NSString)fontIdentifier
{
  return self->_fontIdentifier;
}

- (double)weight
{
  return self->_weight;
}

- (UIFont)customFont
{
  return self->_customFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFont, 0);
  objc_storeStrong((id *)&self->_fontIdentifier, 0);
}

@end