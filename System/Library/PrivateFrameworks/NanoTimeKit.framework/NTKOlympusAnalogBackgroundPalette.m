@interface NTKOlympusAnalogBackgroundPalette
- (BOOL)hasWhiteElements;
- (BOOL)isMulticolor;
- (NTKOlympusAnalogBackgroundPalette)initWithOlympusColorPalette:(id)a3;
- (NTKOlympusAnalogBackgroundPalette)initWithOlympusColorPalette:(id)a3 alternatePalette:(id)a4;
- (NTKOlympusColorPalette)olympusPalette;
- (NTKOlympusColorPalette)tritiumPalette;
- (UIColor)analogDotColor;
- (UIColor)backgroundColor;
- (UIColor)numbersColor;
- (double)smallDotsColorBrightness;
- (double)smallNumbersColorBrightness;
- (id)_softBlackColor;
- (id)dotMarkerAlpha;
- (id)logoColor;
- (id)tritiumBackgroundColor;
- (id)tritiumLargeNumbers;
- (id)tritiumLargeNumbersOutline;
- (id)tritiumOutlineNumbers;
- (id)tritiumSmallNumbers;
- (void)setOlympusPalette:(id)a3;
- (void)setTritiumPalette:(id)a3;
@end

@implementation NTKOlympusAnalogBackgroundPalette

- (NTKOlympusAnalogBackgroundPalette)initWithOlympusColorPalette:(id)a3
{
  return [(NTKOlympusAnalogBackgroundPalette *)self initWithOlympusColorPalette:a3 alternatePalette:0];
}

- (NTKOlympusAnalogBackgroundPalette)initWithOlympusColorPalette:(id)a3 alternatePalette:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKOlympusAnalogBackgroundPalette;
  v9 = [(NTKOlympusAnalogBackgroundPalette *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_olympusPalette, a3);
    objc_storeStrong((id *)&v10->_tritiumPalette, a4);
  }

  return v10;
}

- (id)dotMarkerAlpha
{
  return &unk_1F16E0E40;
}

- (UIColor)backgroundColor
{
  return (UIColor *)[(NTKOlympusColorPalette *)self->_olympusPalette primaryBackgroundColor];
}

- (UIColor)numbersColor
{
  return (UIColor *)[(NTKOlympusColorPalette *)self->_olympusPalette primaryTextColor];
}

- (id)logoColor
{
  return (id)[(NTKOlympusColorPalette *)self->_olympusPalette primaryLogoColor];
}

- (UIColor)analogDotColor
{
  return 0;
}

- (BOOL)hasWhiteElements
{
  return 0;
}

- (id)_softBlackColor
{
  return (id)NTKColorWithRGBA(33, 33, 33, 1.0);
}

- (id)tritiumLargeNumbers
{
  return (id)[(NTKOlympusColorPalette *)self->_tritiumPalette primaryTextColor];
}

- (id)tritiumLargeNumbersOutline
{
  return (id)[(NTKOlympusColorPalette *)self->_tritiumPalette primaryOutlineTextColor];
}

- (id)tritiumSmallNumbers
{
  return (id)[(NTKOlympusColorPalette *)self->_tritiumPalette primaryTextColor];
}

- (id)tritiumOutlineNumbers
{
  return (id)[(NTKOlympusColorPalette *)self->_tritiumPalette primaryOutlineTextColor];
}

- (double)smallNumbersColorBrightness
{
  return 1.0;
}

- (double)smallDotsColorBrightness
{
  return 1.0;
}

- (id)tritiumBackgroundColor
{
  return (id)[(NTKOlympusColorPalette *)self->_tritiumPalette primaryBackgroundColor];
}

- (BOOL)isMulticolor
{
  return [(NTKFaceColorPalette *)self->_olympusPalette isMulticolor];
}

- (NTKOlympusColorPalette)olympusPalette
{
  return self->_olympusPalette;
}

- (void)setOlympusPalette:(id)a3
{
}

- (NTKOlympusColorPalette)tritiumPalette
{
  return self->_tritiumPalette;
}

- (void)setTritiumPalette:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tritiumPalette, 0);

  objc_storeStrong((id *)&self->_olympusPalette, 0);
}

@end