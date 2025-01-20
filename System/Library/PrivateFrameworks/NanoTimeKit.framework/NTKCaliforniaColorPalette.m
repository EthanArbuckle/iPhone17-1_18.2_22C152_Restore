@interface NTKCaliforniaColorPalette
- (BOOL)isBlackBackground;
- (NTKCaliforniaColorPalette)init;
- (id)_background;
- (id)_circularBackground;
- (id)_clockHands;
- (id)_clockHandsInlay;
- (id)_colorForCircularTicksForMinute:(unint64_t)a3;
- (id)_largeTick;
- (id)_simpleTextComplication;
- (id)_smallTick;
- (id)circularDialFillColor;
- (id)circularDialSubtickColor;
- (id)colorForCircularTicksForHour:(unint64_t)a3;
- (id)colorForCircularTicksForMinute:(unint64_t)a3;
- (id)colorForHourMarker:(unint64_t)a3;
- (id)digitColorAtIndex:(unint64_t)a3;
- (int64_t)richComplicationViewTheme;
@end

@implementation NTKCaliforniaColorPalette

- (NTKCaliforniaColorPalette)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCaliforniaColorPalette;
  return [(NTKFaceColorPalette *)&v3 initWithDomainName:@"california" inBundle:0];
}

- (id)colorForHourMarker:(unint64_t)a3
{
  v5 = [(NTKCaliforniaColorPalette *)self _colorForCircularTicksForMinute:1];
  if ([(NTKFaceColorPalette *)self isNotFoundColor:v5])
  {
    uint64_t v6 = [(NTKCaliforniaColorPalette *)self digit];
  }
  else
  {
    unint64_t v7 = a3 - 2;
    if (a3 <= 0xB) {
      unint64_t v7 = a3;
    }
    uint64_t v6 = [(NTKCaliforniaColorPalette *)self _colorForCircularTicksForMinute:5 * ((v7 + 1) % 0xC)];
  }
  v8 = (void *)v6;

  return v8;
}

- (id)digitColorAtIndex:(unint64_t)a3
{
  v5 = NSString;
  uint64_t v6 = NSStringFromSelector(sel_digit);
  unint64_t v7 = [NSNumber numberWithUnsignedInteger:a3 + 1];
  v8 = [v5 stringWithFormat:@"%@%@", v6, v7];

  v9 = [(NTKFaceColorPalette *)self valueForKey:v8];

  return v9;
}

- (id)colorForCircularTicksForMinute:(unint64_t)a3
{
  if ([(NTKFaceColorPalette *)self isRainbowColor])
  {
    v5 = [(NTKCaliforniaColorPalette *)self _colorForCircularTicksForMinute:a3];
    uint64_t v6 = [v5 colorWithAlphaComponent:0.4];
  }
  else
  {
    uint64_t v6 = [(NTKCaliforniaColorPalette *)self circularDialSubtickColor];
  }
  return v6;
}

- (id)colorForCircularTicksForHour:(unint64_t)a3
{
  if ([(NTKFaceColorPalette *)self isRainbowColor]) {
    [(NTKCaliforniaColorPalette *)self _colorForCircularTicksForMinute:5 * a3];
  }
  else {
  v5 = [(NTKCaliforniaColorPalette *)self circularDialTickColor];
  }
  return v5;
}

- (id)_colorForCircularTicksForMinute:(unint64_t)a3
{
  unint64_t v3 = 59;
  if (a3 < 0x3B) {
    unint64_t v3 = a3;
  }
  NTKCaliforniaMulticolorColor(self, (double)v3 / 60.0);
}

- (id)circularDialSubtickColor
{
  v2 = [(NTKCaliforniaColorPalette *)self bezelComplication];
  unint64_t v3 = [v2 colorWithAlphaComponent:0.4];

  return v3;
}

- (id)circularDialFillColor
{
  return (id)[MEMORY[0x1E4FB1618] clearColor];
}

- (id)_background
{
  if ([(NTKFaceColorPalette *)self isEvergreenCollection])
  {
    unint64_t v3 = [(NTKCaliforniaColorPalette *)self primaryColor];
  }
  else
  {
    unint64_t v3 = 0;
  }
  return v3;
}

- (id)_circularBackground
{
  if ([(NTKFaceColorPalette *)self isEvergreenCollection])
  {
    unint64_t v3 = [(NTKCaliforniaColorPalette *)self primaryColor];
  }
  else if ([(NTKFaceColorPalette *)self isRainbowColor])
  {
    unint64_t v3 = [(NTKCaliforniaColorPalette *)self background];
  }
  else
  {
    unint64_t v3 = 0;
  }
  return v3;
}

- (id)_smallTick
{
  BOOL v3 = [(NTKFaceColorPalette *)self isEvergreenCollection];
  v4 = [(NTKCaliforniaColorPalette *)self digit];
  v5 = v4;
  double v6 = 0.4;
  if (v3) {
    double v6 = 0.2;
  }
  unint64_t v7 = [v4 colorWithAlphaComponent:v6];

  return v7;
}

- (id)_largeTick
{
  BOOL v3 = [(NTKFaceColorPalette *)self isEvergreenCollection];
  v4 = [(NTKCaliforniaColorPalette *)self digit];
  v5 = v4;
  double v6 = 0.9;
  if (v3) {
    double v6 = 0.7;
  }
  unint64_t v7 = [v4 colorWithAlphaComponent:v6];

  return v7;
}

- (id)_clockHands
{
  if ([(NTKFaceColorPalette *)self isEvergreenCollection]) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  return v2;
}

- (id)_clockHandsInlay
{
  if ([(NTKFaceColorPalette *)self isEvergreenCollection])
  {
    BOOL v3 = [(NTKCaliforniaColorPalette *)self primaryColor];
    v4 = NTKColorByApplyingWhiteOverlay(v3, 0.3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_simpleTextComplication
{
  if ([(NTKFaceColorPalette *)self isEvergreenCollection]) {
    [(NTKCaliforniaColorPalette *)self digit];
  }
  else {
  BOOL v3 = [(NTKCaliforniaColorPalette *)self simpleTextComplicationColorValue];
  }
  return v3;
}

- (int64_t)richComplicationViewTheme
{
  return 1;
}

- (BOOL)isBlackBackground
{
  if ([(NTKFaceColorPalette *)self isEvergreenCollection]) {
    return 0;
  }
  v4 = [(NTKFaceColorPalette *)self pigmentEditOption];
  v5 = [v4 collectionName];
  int v6 = [v5 isEqualToString:@"seasons.fall2021"];

  if (!v6) {
    return 1;
  }
  unint64_t v7 = [(NTKFaceColorPalette *)self pigmentEditOption];
  v8 = [v7 fullname];

  if ([v8 isEqualToString:@"seasons.fall2021.purple1"]) {
    char v3 = 1;
  }
  else {
    char v3 = [v8 isEqualToString:@"seasons.fall2021.purple2"];
  }

  return v3;
}

@end