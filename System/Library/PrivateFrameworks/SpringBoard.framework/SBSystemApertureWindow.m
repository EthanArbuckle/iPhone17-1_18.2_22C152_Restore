@interface SBSystemApertureWindow
- (BOOL)_accessibilityInvertColorsIsDarkWindow;
- (BOOL)_allowsOcclusionDetectionOverride;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)setAutorotates:(BOOL)a3 forceUpdateInterfaceOrientation:(BOOL)a4;
@end

@implementation SBSystemApertureWindow

- (BOOL)_accessibilityInvertColorsIsDarkWindow
{
  return 0;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (BOOL)_allowsOcclusionDetectionOverride
{
  return 1;
}

- (void)setAutorotates:(BOOL)a3 forceUpdateInterfaceOrientation:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SBSystemApertureWindow;
  [(SBSystemApertureWindow *)&v4 setAutorotates:0 forceUpdateInterfaceOrientation:a4];
}

@end