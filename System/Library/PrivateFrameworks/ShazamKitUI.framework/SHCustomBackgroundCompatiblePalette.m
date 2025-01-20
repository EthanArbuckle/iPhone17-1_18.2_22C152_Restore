@interface SHCustomBackgroundCompatiblePalette
- (CGColor)listeningButtonBackgroundColor;
- (CGColor)listeningButtonBackgroundTransparentColor;
- (CGColor)listeningCircleColor;
@end

@implementation SHCustomBackgroundCompatiblePalette

- (CGColor)listeningButtonBackgroundColor
{
  return +[SHPalette sh_colorNamed:@"customBackgroundListeningButtonBackgroundColor"];
}

- (CGColor)listeningCircleColor
{
  return +[SHPalette sh_colorNamed:@"customBackgroundListeningCircleColor"];
}

- (CGColor)listeningButtonBackgroundTransparentColor
{
  return +[SHPalette sh_colorNamed:@"customBackgroundListeningButtonBackgroundTransparentColor"];
}

@end