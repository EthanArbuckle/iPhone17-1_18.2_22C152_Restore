@interface TPNumberPadDarkStyleButton
+ (double)highlightedCircleViewAlpha;
+ (double)unhighlightedCircleViewAlpha;
+ (id)imageForCharacter:(int64_t)a3;
+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4;
- (id)buttonColor;
- (id)defaultColor;
@end

@implementation TPNumberPadDarkStyleButton

- (id)defaultColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:1.0];
}

+ (id)imageForCharacter:(int64_t)a3
{
  return (id)[a1 imageForCharacter:a3 highlighted:0 whiteVersion:1];
}

+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4
{
  return (id)[a1 imageForCharacter:a3 highlighted:0 whiteVersion:1];
}

- (id)buttonColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

+ (double)unhighlightedCircleViewAlpha
{
  return 0.200000003;
}

+ (double)highlightedCircleViewAlpha
{
  return 0.649999976;
}

@end