@interface TPSAppearance
+ (BOOL)isMacUI;
+ (BOOL)isPhoneUI;
+ (double)buttonHeight;
+ (double)displayMultiplier;
+ (double)introOutroTitleTopPadding;
+ (id)bodyFont;
+ (id)boldTextFont;
+ (id)defaultBackgroundColor;
+ (id)defaultLabelColor;
+ (id)defaultTextLabelFont;
+ (id)footnoteBoldTextFont;
+ (id)footnoteFont;
+ (id)footnoteItalicTextFont;
+ (id)headlineFont;
+ (id)italicTextFont;
+ (id)language;
+ (id)preferredFontForTextStyle:(id)a3;
+ (id)preferredFontForTextStyle:(id)a3 languageCode:(id)a4;
+ (id)preferredFontForTextStyle:(id)a3 symoblicTraits:(unsigned int)a4 languageCode:(id)a5;
+ (id)secondaryBackgroundColor;
+ (id)secondaryLabelColor;
+ (id)subheadlineFont;
+ (id)systemFontOfSize:(double)a3 weight:(double)a4;
+ (id)titleLabelFont;
- (BOOL)isCompactLayout;
- (BOOL)sideAppMode;
- (CGSize)size;
- (CGSize)sizeWithSizes:(id)a3 mediaSizeType:(unint64_t)a4;
- (UITraitCollection)traitCollection;
- (double)displayMultiplierWithValue:(double)a3;
- (double)displayScale;
- (double)heightToWidthRatioFromSizes:(id)a3 mediaSizeType:(unint64_t)a4 defaultValue:(double)a5;
- (double)nativeSizeForValue:(double)a3;
- (double)sizeToScreenRatio;
- (id)initAppearanceWithTraits:(id)a3 size:(CGSize)a4;
- (unint64_t)mediaSizeType;
- (void)setMediaSizeType:(unint64_t)a3;
- (void)setSize:(CGSize)a3;
- (void)setSizeToScreenRatio:(double)a3;
- (void)setTraitCollection:(id)a3;
- (void)updateAppearanceWithSize:(CGSize)a3;
- (void)updateMediaSizeType;
@end

@implementation TPSAppearance

+ (id)defaultBackgroundColor
{
  return (id)[MEMORY[0x263F825C8] systemBackgroundColor];
}

+ (BOOL)isPhoneUI
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

+ (BOOL)isMacUI
{
  if (isMacUI_onceToken != -1) {
    dispatch_once(&isMacUI_onceToken, &__block_literal_global_2);
  }
  return isMacUI_isMacIdiom;
}

void __24__TPSAppearance_isMacUI__block_invoke()
{
  id v0 = [MEMORY[0x263F82670] currentDevice];
  isMacUI_isMacIdiom = [v0 userInterfaceIdiom] == 5;
}

+ (double)displayMultiplier
{
  if (displayMultiplier_predicate[0] != -1) {
    dispatch_once(displayMultiplier_predicate, &__block_literal_global_2);
  }
  return *(double *)&displayMultiplier_gDisplayMultiplier;
}

void __34__TPSAppearance_displayMultiplier__block_invoke()
{
  if (+[TPSAppearance isPhoneUI])
  {
    displayMultiplier_gDisplayMultiplier = 0x3FF0000000000000;
  }
  else
  {
    id v2 = [MEMORY[0x263F82B60] mainScreen];
    [v2 bounds];
    double Width = CGRectGetWidth(v4);
    [v2 bounds];
    double Height = CGRectGetHeight(v5);
    if (Width < Height) {
      double Height = Width;
    }
    *(double *)&displayMultiplier_gDisplayMultiplier = Height / 768.0;
  }
}

+ (double)buttonHeight
{
  return 44.0;
}

+ (double)introOutroTitleTopPadding
{
  return 60.0;
}

+ (id)defaultLabelColor
{
  return (id)[MEMORY[0x263F825C8] labelColor];
}

+ (id)secondaryLabelColor
{
  return (id)[MEMORY[0x263F825C8] secondaryLabelColor];
}

+ (id)secondaryBackgroundColor
{
  return (id)[MEMORY[0x263F825C8] secondarySystemBackgroundColor];
}

+ (id)language
{
  id v2 = [MEMORY[0x263F7F5C8] sharedInstance];
  BOOL v3 = [v2 language];

  return v3;
}

+ (id)titleLabelFont
{
  id v3 = objc_alloc(MEMORY[0x263F82770]);
  CGRect v4 = (void *)[v3 initForTextStyle:*MEMORY[0x263F83618]];
  CGRect v5 = [a1 systemFontOfSize:22.0 weight:*MEMORY[0x263F81840]];
  v6 = [v4 scaledFontForFont:v5];

  return v6;
}

+ (id)defaultTextLabelFont
{
  return (id)[a1 preferredFontForTextStyle:*MEMORY[0x263F835F0]];
}

+ (id)boldTextFont
{
  uint64_t v3 = *MEMORY[0x263F835F0];
  CGRect v4 = [a1 language];
  CGRect v5 = [a1 preferredFontForTextStyle:v3 symoblicTraits:2 languageCode:v4];

  return v5;
}

+ (id)italicTextFont
{
  uint64_t v3 = *MEMORY[0x263F835F0];
  CGRect v4 = [a1 language];
  CGRect v5 = [a1 preferredFontForTextStyle:v3 symoblicTraits:1 languageCode:v4];

  return v5;
}

+ (id)footnoteBoldTextFont
{
  uint64_t v3 = *MEMORY[0x263F835B8];
  CGRect v4 = [a1 language];
  CGRect v5 = [a1 preferredFontForTextStyle:v3 symoblicTraits:2 languageCode:v4];

  return v5;
}

+ (id)footnoteItalicTextFont
{
  uint64_t v3 = *MEMORY[0x263F835B8];
  CGRect v4 = [a1 language];
  CGRect v5 = [a1 preferredFontForTextStyle:v3 symoblicTraits:1 languageCode:v4];

  return v5;
}

+ (id)bodyFont
{
  return (id)[a1 preferredFontForTextStyle:*MEMORY[0x263F83570]];
}

+ (id)footnoteFont
{
  return (id)[a1 preferredFontForTextStyle:*MEMORY[0x263F835B8]];
}

+ (id)headlineFont
{
  return (id)[a1 preferredFontForTextStyle:*MEMORY[0x263F835D0]];
}

+ (id)subheadlineFont
{
  return (id)[a1 preferredFontForTextStyle:*MEMORY[0x263F835F0]];
}

+ (id)preferredFontForTextStyle:(id)a3
{
  id v4 = a3;
  CGRect v5 = [a1 language];
  v6 = [a1 preferredFontForTextStyle:v4 languageCode:v5];

  return v6;
}

+ (id)preferredFontForTextStyle:(id)a3 languageCode:(id)a4
{
  return (id)[a1 preferredFontForTextStyle:a3 symoblicTraits:0 languageCode:a4];
}

+ (id)preferredFontForTextStyle:(id)a3 symoblicTraits:(unsigned int)a4 languageCode:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x263F81708], "tps_preferredFontForTextStyle:symoblicTraits:languageCode:", a3, *(void *)&a4, a5);
}

+ (id)systemFontOfSize:(double)a3 weight:(double)a4
{
  v6 = (void *)MEMORY[0x263F81708];
  v7 = [a1 language];
  v8 = objc_msgSend(v6, "tps_fontWithSize:weight:languageCode:", v7, a3, a4);

  return v8;
}

- (id)initAppearanceWithTraits:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSAppearance;
  v8 = [(TPSAppearance *)&v11 init];
  v9 = v8;
  if (v8)
  {
    -[TPSAppearance setSize:](v8, "setSize:", width, height);
    [(TPSAppearance *)v9 setTraitCollection:v7];
    -[TPSAppearance updateAppearanceWithSize:](v9, "updateAppearanceWithSize:", width, height);
  }

  return v9;
}

- (BOOL)isCompactLayout
{
  return [(TPSAppearance *)self mediaSizeType] == 1;
}

- (void)setTraitCollection:(id)a3
{
  CGRect v5 = (UITraitCollection *)a3;
  p_traitCollection = &self->_traitCollection;
  if (self->_traitCollection != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_traitCollection, a3);
    p_traitCollection = (UITraitCollection **)[(TPSAppearance *)self updateMediaSizeType];
    CGRect v5 = v7;
  }

  MEMORY[0x270F9A758](p_traitCollection, v5);
}

- (void)updateMediaSizeType
{
  uint64_t v3 = [(TPSAppearance *)self traitCollection];
  uint64_t v4 = [v3 verticalSizeClass];

  CGRect v5 = [(TPSAppearance *)self traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];

  BOOL v8 = v6 == 1 || v4 == 1;

  [(TPSAppearance *)self setMediaSizeType:v8];
}

- (void)updateAppearanceWithSize:(CGSize)a3
{
  self->_size = a3;
}

- (BOOL)sideAppMode
{
  [(TPSAppearance *)self sizeToScreenRatio];
  return v2 < 0.49;
}

- (double)displayScale
{
  [(UITraitCollection *)self->_traitCollection displayScale];
  if (v3 > 0.0)
  {
    traitCollection = self->_traitCollection;
    [(UITraitCollection *)traitCollection displayScale];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F82B60] mainScreen];
    [v4 scale];
    double v6 = v5;

    return v6;
  }
  return result;
}

- (double)displayMultiplierWithValue:(double)a3
{
  +[TPSAppearance displayMultiplier];
  return ceil(v4 * a3);
}

- (double)nativeSizeForValue:(double)a3
{
  [(TPSAppearance *)self displayScale];
  return a3 / v4;
}

- (double)heightToWidthRatioFromSizes:(id)a3 mediaSizeType:(unint64_t)a4 defaultValue:(double)a5
{
  [a3 heightToWidthRatioForViewMode:a4 == 0];
  if (result <= 0.0) {
    return a5;
  }
  return result;
}

- (CGSize)sizeWithSizes:(id)a3 mediaSizeType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4) {
    [v6 compact];
  }
  else {
  BOOL v8 = [v6 regular];
  }
  v9 = v8;
  if (v8)
  {
    v10 = [v8 width];
    [v10 floatValue];
    [(TPSAppearance *)self nativeSizeForValue:v11];
    double v13 = v12;

    v14 = [v9 height];
    [v14 floatValue];
    [(TPSAppearance *)self nativeSizeForValue:v15];
    double v17 = v16;
  }
  else
  {
    double v13 = 0.0;
    double v17 = 0.0;
  }

  double v18 = v13;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (unint64_t)mediaSizeType
{
  return self->_mediaSizeType;
}

- (void)setMediaSizeType:(unint64_t)a3
{
  self->_mediaSizeType = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (double)sizeToScreenRatio
{
  return self->_sizeToScreenRatio;
}

- (void)setSizeToScreenRatio:(double)a3
{
  self->_sizeToScreenRatio = a3;
}

- (void).cxx_destruct
{
}

@end