@interface NTKOlympusColorPalette
- (BOOL)isMulticolorPalette;
- (BOOL)useSmallFont;
- (NTKOlympusColorPalette)init;
- (UIColor)secondaryBackgroundColor;
- (double)colorBrightness:(id)a3;
- (id)_circularDialFillColor;
- (id)_circularDialSubtickColor;
- (id)_customBlack;
- (id)_darker;
- (id)_digits;
- (id)_largeHandsColor;
- (id)_logo;
- (id)_primaryBackgroundColor;
- (id)_primaryTextColor;
- (id)_secondHandColor;
- (id)_secondHandForColorName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)mainColor;
- (unint64_t)dial;
- (unint64_t)style;
- (void)setDial:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setUseSmallFont:(BOOL)a3;
@end

@implementation NTKOlympusColorPalette

- (NTKOlympusColorPalette)init
{
  v3 = +[NTKOlympusColorEditOption pigmentFaceDomain];
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7.receiver = self;
  v7.super_class = (Class)NTKOlympusColorPalette;
  v5 = [(NTKFaceColorPalette *)&v7 initWithDomainName:v3 inBundle:v4];

  if (v5) {
    [(NTKOlympusColorPalette *)v5 setDial:0];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKOlympusColorPalette;
  id v4 = [(NTKFaceColorPalette *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setStyle:", -[NTKOlympusColorPalette style](self, "style"));
  objc_msgSend(v4, "setDial:", -[NTKOlympusColorPalette dial](self, "dial"));
  objc_msgSend(v4, "setUseSmallFont:", -[NTKOlympusColorPalette useSmallFont](self, "useSmallFont"));
  return v4;
}

- (id)identifier
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)NTKOlympusColorPalette;
  id v4 = [(NTKFaceColorPalette *)&v7 identifier];
  v5 = [v3 stringWithFormat:@"%@-%lu-%lu-%lu", v4, self->_style, self->_dial, self->_useSmallFont];

  return v5;
}

- (BOOL)isMulticolorPalette
{
  return 0;
}

- (id)mainColor
{
  if ([(NTKFaceColorPalette *)self isCompositePalette])
  {
    v3 = [(NTKFaceColorPalette *)self paletteAtIndex:0];
    id v4 = [v3 primaryColor];

    v5 = [(NTKFaceColorPalette *)self paletteAtIndex:1];
    objc_super v6 = [v5 primaryColor];

    [(NTKOlympusColorPalette *)self colorBrightness:v4];
    double v8 = v7;
    [(NTKOlympusColorPalette *)self colorBrightness:v6];
    if (v8 <= v9) {
      v10 = v6;
    }
    else {
      v10 = v4;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = [(NTKOlympusColorPalette *)self primaryColor];
  }
  return v11;
}

- (id)_primaryTextColor
{
  if ([(NTKFaceColorPalette *)self isCompositePalette])
  {
    v3 = [(NTKFaceColorPalette *)self paletteAtIndex:1];
    id v4 = [v3 primaryColor];
  }
  else
  {
    id v4 = [(NTKOlympusColorPalette *)self digits];
  }
  return v4;
}

- (id)_digits
{
  v3 = [(NTKOlympusColorPalette *)self darker];
  if ([(NTKFaceColorPalette *)self isNotFoundColor:v3])
  {
    if ([(NTKFaceColorPalette *)self isCompositePalette])
    {
      id v4 = [(NTKFaceColorPalette *)self paletteAtIndex:1];
      uint64_t v5 = [v4 primaryColor];

      v3 = v4;
    }
    else
    {
      uint64_t v5 = [(NTKOlympusColorPalette *)self primaryColor];
    }

    v3 = (void *)v5;
  }
  return v3;
}

- (id)_darker
{
  v2 = [(NTKOlympusColorPalette *)self primaryColor];
  v3 = NTKColorByApplyingBlackOverlay(v2, 0.2);

  return v3;
}

- (id)_primaryBackgroundColor
{
  if ([(NTKFaceColorPalette *)self isCompositePalette])
  {
    v3 = [(NTKFaceColorPalette *)self paletteAtIndex:0];
    if ([v3 isBlackColor]) {
      [(NTKOlympusColorPalette *)self _customBlack];
    }
    else {
    id v4 = [v3 primaryColor];
    }
  }
  else
  {
    id v4 = [(NTKOlympusColorPalette *)self primaryColor];
  }
  return v4;
}

- (id)_logo
{
  if ([(NTKFaceColorPalette *)self isCompositePalette])
  {
    v3 = [(NTKFaceColorPalette *)self paletteAtIndex:0];
    int v4 = [v3 isBlackColor];

    uint64_t v5 = [(NTKFaceColorPalette *)self paletteAtIndex:v4 != 0];
    objc_super v6 = [v5 logo];
  }
  else
  {
    objc_super v6 = [(NTKOlympusColorPalette *)self orangeLogo];
  }
  return v6;
}

- (id)_secondHandColor
{
  v3 = [(NTKFaceColorPalette *)self pigmentEditOption];
  int v4 = [v3 identifier];

  if ([(NTKFaceColorPalette *)self isCompositePalette])
  {
    uint64_t v5 = [(NTKFaceColorPalette *)self paletteAtIndex:0];
    unsigned int v6 = [v5 isBlackColor];

    double v7 = [(NTKFaceColorPalette *)self paletteAtIndex:v6];
    double v8 = [v7 pigmentEditOption];
    uint64_t v9 = [v8 identifier];

    int v4 = (void *)v9;
  }
  v10 = [(NTKOlympusColorPalette *)self _secondHandForColorName:v4];

  return v10;
}

- (id)_secondHandForColorName:(id)a3
{
  id v4 = a3;
  if (([v4 isEqual:@"victory.limeBlast"] & 1) != 0
    || ([v4 isEqual:@"victory.spruceAura"] & 1) != 0
    || ([v4 isEqual:@"victory.blueBlack"] & 1) != 0
    || ([v4 isEqual:@"victory.hasta"] & 1) != 0
    || ([v4 isEqual:@"victory.chlorineBlue"] & 1) != 0
    || [v4 isEqual:@"victory.ironstone"])
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    uint64_t v5 = [(NTKOlympusColorPalette *)self logo];
  }
  unsigned int v6 = (void *)v5;

  return v6;
}

- (id)_largeHandsColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

- (id)_circularDialSubtickColor
{
  v2 = [(NTKOlympusColorPalette *)self ticks];
  v3 = [v2 colorWithAlphaComponent:0.35];

  return v3;
}

- (id)_circularDialFillColor
{
  return (id)[MEMORY[0x1E4FB1618] clearColor];
}

- (UIColor)secondaryBackgroundColor
{
  if ([(NTKFaceColorPalette *)self isCompositePalette])
  {
    v3 = [(NTKFaceColorPalette *)self paletteAtIndex:1];
    if ([v3 isBlackColor])
    {
      id v4 = [(NTKOlympusColorPalette *)self _customBlack];

      goto LABEL_6;
    }
  }
  id v4 = [(NTKOlympusColorPalette *)self primaryTextColor];
LABEL_6:
  return (UIColor *)v4;
}

- (double)colorBrightness:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  double v7 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  uint64_t v4 = 0;
  [a3 getRed:&v7 green:&v6 blue:&v5 alpha:&v4];
  return (v6 * 587.0 + v7 * 299.0 + v5 * 114.0) / 1000.0;
}

- (id)_customBlack
{
  if (self->_useSmallFont)
  {
    v2 = [(NTKOlympusColorPalette *)self softBlack];
  }
  else if (self->_dial || self->_style != 2)
  {
    v2 = [(NTKOlympusColorPalette *)self black];
  }
  else
  {
    v2 = [(NTKOlympusColorPalette *)self softerBlack];
  }
  return v2;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)dial
{
  return self->_dial;
}

- (void)setDial:(unint64_t)a3
{
  self->_dial = a3;
}

- (BOOL)useSmallFont
{
  return self->_useSmallFont;
}

- (void)setUseSmallFont:(BOOL)a3
{
  self->_useSmallFont = a3;
}

@end