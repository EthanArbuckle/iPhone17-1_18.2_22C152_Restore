@interface TPNumberPadLightStyleButton
+ (BOOL)usesTelephonyGlyphsWhereAvailable;
+ (double)highlightedCircleViewAlpha;
+ (double)unhighlightedCircleViewAlpha;
+ (id)imageForCharacter:(int64_t)a3;
+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4;
- (id)buttonColor;
- (id)defaultColor;
@end

@implementation TPNumberPadLightStyleButton

- (id)defaultColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
}

+ (id)imageForCharacter:(int64_t)a3
{
  return (id)[a1 imageForCharacter:a3 highlighted:0 whiteVersion:0];
}

+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4
{
  return (id)[a1 imageForCharacter:a3 highlighted:0 whiteVersion:0];
}

+ (BOOL)usesTelephonyGlyphsWhereAvailable
{
  return 1;
}

- (id)buttonColor
{
  return (id)[MEMORY[0x1E4FB1618] blackColor];
}

+ (double)unhighlightedCircleViewAlpha
{
  return 0.100000001;
}

+ (double)highlightedCircleViewAlpha
{
  return 0.300000012;
}

@end