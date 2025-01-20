@interface NTKBlackcombColorPalette
- (NTKBlackcombColorPalette)init;
- (NTKInterpolatedColorPalette)dialColorTransitionalPalette;
- (id)_background;
- (id)_hourMarker;
- (id)_largeTick;
- (id)_secondHand;
- (id)_smallTick;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)transitionalPaletteFromDialColor:(unint64_t)a3 toDialColor:(unint64_t)a4;
- (id)tritiumPalette;
- (int64_t)richComplicationViewTheme;
- (unint64_t)dialColorStyle;
- (void)setDialColorStyle:(unint64_t)a3;
- (void)setDialColorTransitionalPalette:(id)a3;
@end

@implementation NTKBlackcombColorPalette

- (NTKBlackcombColorPalette)init
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)NTKBlackcombColorPalette;
  return [(NTKFaceColorPalette *)&v5 initWithFaceClass:v3];
}

- (id)identifier
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)NTKBlackcombColorPalette;
  v4 = [(NTKFaceColorPalette *)&v7 identifier];
  objc_super v5 = [v3 stringWithFormat:@"%@-%lu", v4, self->_dialColorStyle];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKBlackcombColorPalette;
  v4 = [(NTKFaceColorPalette *)&v6 copyWithZone:a3];
  v4[11] = [(NTKBlackcombColorPalette *)self dialColorStyle];
  return v4;
}

- (id)transitionalPaletteFromDialColor:(unint64_t)a3 toDialColor:(unint64_t)a4
{
  dialColorTransitionalPalette = self->_dialColorTransitionalPalette;
  if (!dialColorTransitionalPalette)
  {
    v8 = [[NTKInterpolatedColorPalette alloc] initWithColorPalette:self];
    v9 = self->_dialColorTransitionalPalette;
    self->_dialColorTransitionalPalette = v8;

    dialColorTransitionalPalette = self->_dialColorTransitionalPalette;
  }
  v10 = [(NTKInterpolatedColorPalette *)dialColorTransitionalPalette fromPalette];
  v11 = [(NTKInterpolatedColorPalette *)self->_dialColorTransitionalPalette toPalette];
  v12 = [(NTKFaceColorPalette *)self configuration];
  v13 = (void *)[v12 copy];
  [v10 setConfiguration:v13];

  v14 = [(NTKFaceColorPalette *)self configuration];
  v15 = (void *)[v14 copy];
  [v11 setConfiguration:v15];

  [v10 setDialColorStyle:a3];
  [v11 setDialColorStyle:a4];
  v16 = self->_dialColorTransitionalPalette;

  return v16;
}

- (id)_background
{
  uint64_t v3 = [(NTKBlackcombColorPalette *)self dialColorStyle];
  if (v3 == (void *)1)
  {
    uint64_t v3 = [(NTKBlackcombColorPalette *)self lightBackground];
  }
  else if (!v3)
  {
    uint64_t v3 = [(NTKBlackcombColorPalette *)self darkBackground];
  }
  return v3;
}

- (id)_hourMarker
{
  uint64_t v3 = [(NTKBlackcombColorPalette *)self dialColorStyle];
  if (v3 == (void *)1)
  {
    uint64_t v3 = [(NTKBlackcombColorPalette *)self darkHourMarker];
  }
  else if (!v3)
  {
    uint64_t v3 = [(NTKBlackcombColorPalette *)self lightHourMarker];
  }
  return v3;
}

- (id)_smallTick
{
  v2 = [(NTKBlackcombColorPalette *)self hourMarker];
  uint64_t v3 = [v2 colorWithAlphaComponent:0.3];

  return v3;
}

- (id)_largeTick
{
  unint64_t v4 = [(NTKBlackcombColorPalette *)self dialColorStyle];
  if (v4 == 1)
  {
    objc_super v5 = [(NTKBlackcombColorPalette *)self hourMarker];
    objc_super v6 = v5;
    double v7 = 0.6;
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    objc_super v5 = [(NTKBlackcombColorPalette *)self hourMarker];
    objc_super v6 = v5;
    double v7 = 0.7;
  }
  v2 = [v5 colorWithAlphaComponent:v7];

LABEL_6:
  return v2;
}

- (id)_secondHand
{
  return (id)[MEMORY[0x1E4FB1618] systemRedColor];
}

- (int64_t)richComplicationViewTheme
{
  return [(NTKBlackcombColorPalette *)self dialColorStyle] == 0;
}

- (id)tritiumPalette
{
  v4.receiver = self;
  v4.super_class = (Class)NTKBlackcombColorPalette;
  v2 = [(NTKFaceColorPalette *)&v4 tritiumPalette];
  [v2 setDialColorStyle:0];
  return v2;
}

- (unint64_t)dialColorStyle
{
  return self->_dialColorStyle;
}

- (void)setDialColorStyle:(unint64_t)a3
{
  self->_dialColorStyle = a3;
}

- (NTKInterpolatedColorPalette)dialColorTransitionalPalette
{
  return self->_dialColorTransitionalPalette;
}

- (void)setDialColorTransitionalPalette:(id)a3
{
}

- (void).cxx_destruct
{
}

@end