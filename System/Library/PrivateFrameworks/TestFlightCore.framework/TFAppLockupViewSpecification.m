@interface TFAppLockupViewSpecification
- (CGSize)iconSize;
- (TFAppLockupViewSpecification)initWithTraitCollection:(id)a3;
- (UIColor)iconPlaceholderColor;
- (UIColor)subtitleTextColor;
- (UIColor)titleTextColor;
- (UIFont)subtitleLabelFont;
- (UIFont)titleLabelFont;
- (double)firstSubtitleLabelBaselineToSecondSubtitleLabelBaseline;
- (double)paddingBetweenIconAndText;
- (double)titleLabelBaselineToFirstSubtitleLabelBaseline;
- (id)_createSubtitleLabelFontWithTraitCollection:(id)a3;
- (id)_createTitleLabelFontWithTraitCollection:(id)a3;
- (id)_subtitleFontStyle;
- (id)_titleFontStyle;
@end

@implementation TFAppLockupViewSpecification

- (TFAppLockupViewSpecification)initWithTraitCollection:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TFAppLockupViewSpecification;
  v5 = [(TFAppLockupViewSpecification *)&v20 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(TFAppLockupViewSpecification *)v5 _createTitleLabelFontWithTraitCollection:v4];
    titleLabelFont = v6->_titleLabelFont;
    v6->_titleLabelFont = (UIFont *)v7;

    uint64_t v9 = [(TFAppLockupViewSpecification *)v6 _createSubtitleLabelFontWithTraitCollection:v4];
    subtitleLabelFont = v6->_subtitleLabelFont;
    v6->_subtitleLabelFont = (UIFont *)v9;

    v11 = (void *)MEMORY[0x263F1C668];
    v12 = [(TFAppLockupViewSpecification *)v6 _titleFontStyle];
    v13 = [v11 metricsForTextStyle:v12];
    [v13 scaledValueForValue:24.0];
    v6->_titleLabelBaselineToFirstSubtitleLabelBaseline = v14;

    v15 = (void *)MEMORY[0x263F1C668];
    v16 = [(TFAppLockupViewSpecification *)v6 _subtitleFontStyle];
    v17 = [v15 metricsForTextStyle:v16];
    [v17 scaledValueForValue:20.0];
    v6->_firstSubtitleLabelBaselineToSecondSubtitleLabelBaseline = v18;
  }
  return v6;
}

- (UIColor)titleTextColor
{
  return (UIColor *)[MEMORY[0x263F1C550] labelColor];
}

- (UIColor)subtitleTextColor
{
  return (UIColor *)[MEMORY[0x263F1C550] secondaryLabelColor];
}

- (UIColor)iconPlaceholderColor
{
  return (UIColor *)[MEMORY[0x263F1C550] secondarySystemBackgroundColor];
}

- (CGSize)iconSize
{
  v2.n128_u64[0] = 0x4054000000000000;
  v3.n128_u64[0] = 0x4054000000000000;
  PPMScaledFloatValue(self, a2, v2, v3);
  result.height = v5;
  result.width = v4;
  return result;
}

- (double)paddingBetweenIconAndText
{
  return 14.0;
}

- (id)_createTitleLabelFontWithTraitCollection:(id)a3
{
  double v4 = (void *)MEMORY[0x263F1C660];
  id v5 = a3;
  v6 = [(TFAppLockupViewSpecification *)self _titleFontStyle];
  uint64_t v7 = objc_msgSend(v4, "tf_systemFontWithTextStyle:weight:forTraitCollection:", v6, v5, *MEMORY[0x263F1D340]);

  return v7;
}

- (id)_titleFontStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_createSubtitleLabelFontWithTraitCollection:(id)a3
{
  double v4 = (void *)MEMORY[0x263F1C660];
  id v5 = a3;
  v6 = [(TFAppLockupViewSpecification *)self _subtitleFontStyle];
  uint64_t v7 = objc_msgSend(v4, "tf_systemFontWithTextStyle:weight:forTraitCollection:", v6, v5, *MEMORY[0x263F1D338]);

  return v7;
}

- (id)_subtitleFontStyle
{
  return (id)*MEMORY[0x263F1D2C0];
}

- (double)titleLabelBaselineToFirstSubtitleLabelBaseline
{
  return self->_titleLabelBaselineToFirstSubtitleLabelBaseline;
}

- (double)firstSubtitleLabelBaselineToSecondSubtitleLabelBaseline
{
  return self->_firstSubtitleLabelBaselineToSecondSubtitleLabelBaseline;
}

- (UIFont)titleLabelFont
{
  return self->_titleLabelFont;
}

- (UIFont)subtitleLabelFont
{
  return self->_subtitleLabelFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabelFont, 0);

  objc_storeStrong((id *)&self->_titleLabelFont, 0);
}

@end