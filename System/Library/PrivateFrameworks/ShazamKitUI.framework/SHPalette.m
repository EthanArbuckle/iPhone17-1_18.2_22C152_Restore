@interface SHPalette
+ (CGColor)sh_colorNamed:(id)a3;
+ (double)contentsScale;
+ (id)default;
- (CGColor)R:(double)a3 G:(double)a4 B:(double)a5 A:(double)a6;
- (CGColor)alternateTintColor;
- (CGColor)appTintColor;
- (CGColor)blackColor;
- (CGColor)clearColor;
- (CGColor)listeningButtonBackgroundColor;
- (CGColor)listeningButtonBackgroundTransparentColor;
- (CGColor)listeningButtonShazamShapeColor;
- (CGColor)listeningButtonTopBorderColor;
- (CGColor)listeningCircleColor;
- (CGColor)shazamColorNearBlack;
@end

@implementation SHPalette

+ (double)contentsScale
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  double v4 = v3;

  return v4;
}

+ (id)default
{
  v2 = (void *)__defaultPalette;
  if (!__defaultPalette)
  {
    double v3 = objc_alloc_init(SHPalette);
    double v4 = (void *)__defaultPalette;
    __defaultPalette = (uint64_t)v3;

    v2 = (void *)__defaultPalette;
  }
  return v2;
}

- (CGColor)shazamColorNearBlack
{
  v2 = NSStringFromSelector(a2);
  double v3 = +[SHPalette sh_colorNamed:v2];

  return v3;
}

- (CGColor)listeningButtonBackgroundColor
{
  v2 = NSStringFromSelector(a2);
  double v3 = +[SHPalette sh_colorNamed:v2];

  return v3;
}

- (CGColor)listeningButtonTopBorderColor
{
  v2 = NSStringFromSelector(a2);
  double v3 = +[SHPalette sh_colorNamed:v2];

  return v3;
}

- (CGColor)listeningButtonShazamShapeColor
{
  v2 = NSStringFromSelector(a2);
  double v3 = +[SHPalette sh_colorNamed:v2];

  return v3;
}

- (CGColor)listeningButtonBackgroundTransparentColor
{
  v2 = NSStringFromSelector(a2);
  double v3 = +[SHPalette sh_colorNamed:v2];

  return v3;
}

- (CGColor)listeningCircleColor
{
  v2 = NSStringFromSelector(a2);
  double v3 = +[SHPalette sh_colorNamed:v2];

  return v3;
}

- (CGColor)appTintColor
{
  v2 = NSStringFromSelector(a2);
  double v3 = +[SHPalette sh_colorNamed:v2];

  return v3;
}

- (CGColor)clearColor
{
  return [(SHPalette *)self R:1.0 G:1.0 B:1.0 A:0.0];
}

- (CGColor)blackColor
{
  return [(SHPalette *)self R:0.0 G:0.0 B:0.0 A:1.0];
}

- (CGColor)alternateTintColor
{
  v2 = NSStringFromSelector(a2);
  double v3 = +[SHPalette sh_colorNamed:v2];

  return v3;
}

- (CGColor)R:(double)a3 G:(double)a4 B:(double)a5 A:(double)a6
{
  CGColorRef SRGB = CGColorCreateSRGB(a3, a4, a5, a6);
  CFAutorelease(SRGB);
  return SRGB;
}

+ (CGColor)sh_colorNamed:(id)a3
{
  double v3 = (void *)MEMORY[0x263F825C8];
  double v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "sh_UIBundle");
  v7 = [v3 colorNamed:v5 inBundle:v6 compatibleWithTraitCollection:0];

  id v8 = v7;
  v9 = (CGColor *)[v8 CGColor];

  return v9;
}

@end