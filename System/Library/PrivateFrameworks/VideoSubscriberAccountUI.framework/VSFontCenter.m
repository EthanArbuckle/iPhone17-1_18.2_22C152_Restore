@interface VSFontCenter
- (UIFont)appAgeRatingFont;
- (UIFont)bodyFont;
- (UIFont)calloutFont;
- (UIFont)caption1Font;
- (UIFont)caption2Font;
- (UIFont)footnoteFont;
- (UIFont)headlineFont;
- (UIFont)subheadlineFont;
- (UIFont)title0Font;
- (UIFont)title1Font;
- (UIFont)title2Font;
- (UIFont)title3Font;
- (UITraitCollection)traitCollection;
- (UITraitEnvironment)traitEnvironment;
- (VSFontCenter)init;
- (VSFontCenter)initWithTraitEnvironment:(id)a3;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_updateFontsWithTraitCollection:(id)a3;
- (void)dealloc;
- (void)setAppAgeRatingFont:(id)a3;
- (void)setBodyFont:(id)a3;
- (void)setCalloutFont:(id)a3;
- (void)setCaption1Font:(id)a3;
- (void)setCaption2Font:(id)a3;
- (void)setFootnoteFont:(id)a3;
- (void)setHeadlineFont:(id)a3;
- (void)setSubheadlineFont:(id)a3;
- (void)setTitle0Font:(id)a3;
- (void)setTitle1Font:(id)a3;
- (void)setTitle2Font:(id)a3;
- (void)setTitle3Font:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)setTraitEnvironment:(id)a3;
@end

@implementation VSFontCenter

- (VSFontCenter)init
{
  return [(VSFontCenter *)self initWithTraitEnvironment:0];
}

- (VSFontCenter)initWithTraitEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSFontCenter;
  v5 = [(VSFontCenter *)&v9 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = v4;
      v7 = [v6 traitCollection];
      objc_storeWeak((id *)&v5->_traitEnvironment, v6);
    }
    else
    {
      id v6 = [MEMORY[0x263F08A00] defaultCenter];
      [v6 addObserver:v5 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];
      v7 = 0;
    }

    [(VSFontCenter *)v5 setTraitCollection:v7];
  }

  return v5;
}

- (void)dealloc
{
  if (!self->_traitCollection)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263F1D158] object:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)VSFontCenter;
  [(VSFontCenter *)&v4 dealloc];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
}

- (void)_updateFontsWithTraitCollection:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x263F1C658];
  uint64_t v5 = *MEMORY[0x263F1D2F0];
  id v6 = a3;
  v7 = [v4 preferredFontForTextStyle:v5 compatibleWithTraitCollection:v6];
  [(VSFontCenter *)self setTitle0Font:v7];

  v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2F8] compatibleWithTraitCollection:v6];
  [(VSFontCenter *)self setTitle1Font:v8];

  objc_super v9 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D300] compatibleWithTraitCollection:v6];
  [(VSFontCenter *)self setTitle2Font:v9];

  v10 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D308] compatibleWithTraitCollection:v6];
  [(VSFontCenter *)self setTitle3Font:v10];

  v11 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298] compatibleWithTraitCollection:v6];
  [(VSFontCenter *)self setHeadlineFont:v11];

  v12 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0] compatibleWithTraitCollection:v6];
  [(VSFontCenter *)self setSubheadlineFont:v12];

  v13 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260] compatibleWithTraitCollection:v6];
  [(VSFontCenter *)self setBodyFont:v13];

  v14 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D268] compatibleWithTraitCollection:v6];
  [(VSFontCenter *)self setCalloutFont:v14];

  v15 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280] compatibleWithTraitCollection:v6];
  [(VSFontCenter *)self setFootnoteFont:v15];

  v16 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D270] compatibleWithTraitCollection:v6];
  [(VSFontCenter *)self setCaption1Font:v16];

  v17 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D278] compatibleWithTraitCollection:v6];

  [(VSFontCenter *)self setCaption2Font:v17];
  id v18 = [MEMORY[0x263F1C658] systemFontOfSize:17.0 weight:*MEMORY[0x263F1D318]];
  [(VSFontCenter *)self setAppAgeRatingFont:v18];
}

- (void)setTraitCollection:(id)a3
{
  id v6 = a3;
  objc_super v4 = (UITraitCollection *)[v6 copy];
  traitCollection = self->_traitCollection;
  self->_traitCollection = v4;

  [(VSFontCenter *)self _updateFontsWithTraitCollection:v6];
}

- (UITraitEnvironment)traitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitEnvironment);
  return (UITraitEnvironment *)WeakRetained;
}

- (void)setTraitEnvironment:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (UIFont)title0Font
{
  return self->_title0Font;
}

- (void)setTitle0Font:(id)a3
{
}

- (UIFont)title1Font
{
  return self->_title1Font;
}

- (void)setTitle1Font:(id)a3
{
}

- (UIFont)title2Font
{
  return self->_title2Font;
}

- (void)setTitle2Font:(id)a3
{
}

- (UIFont)title3Font
{
  return self->_title3Font;
}

- (void)setTitle3Font:(id)a3
{
}

- (UIFont)headlineFont
{
  return self->_headlineFont;
}

- (void)setHeadlineFont:(id)a3
{
}

- (UIFont)subheadlineFont
{
  return self->_subheadlineFont;
}

- (void)setSubheadlineFont:(id)a3
{
}

- (UIFont)bodyFont
{
  return self->_bodyFont;
}

- (void)setBodyFont:(id)a3
{
}

- (UIFont)calloutFont
{
  return self->_calloutFont;
}

- (void)setCalloutFont:(id)a3
{
}

- (UIFont)footnoteFont
{
  return self->_footnoteFont;
}

- (void)setFootnoteFont:(id)a3
{
}

- (UIFont)caption1Font
{
  return self->_caption1Font;
}

- (void)setCaption1Font:(id)a3
{
}

- (UIFont)caption2Font
{
  return self->_caption2Font;
}

- (void)setCaption2Font:(id)a3
{
}

- (UIFont)appAgeRatingFont
{
  return self->_appAgeRatingFont;
}

- (void)setAppAgeRatingFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appAgeRatingFont, 0);
  objc_storeStrong((id *)&self->_caption2Font, 0);
  objc_storeStrong((id *)&self->_caption1Font, 0);
  objc_storeStrong((id *)&self->_footnoteFont, 0);
  objc_storeStrong((id *)&self->_calloutFont, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_subheadlineFont, 0);
  objc_storeStrong((id *)&self->_headlineFont, 0);
  objc_storeStrong((id *)&self->_title3Font, 0);
  objc_storeStrong((id *)&self->_title2Font, 0);
  objc_storeStrong((id *)&self->_title1Font, 0);
  objc_storeStrong((id *)&self->_title0Font, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_destroyWeak((id *)&self->_traitEnvironment);
}

@end