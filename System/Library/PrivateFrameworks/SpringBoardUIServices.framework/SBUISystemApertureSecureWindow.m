@interface SBUISystemApertureSecureWindow
+ (BOOL)_isSecure;
- (BOOL)_accessibilityInvertColorsIsDarkWindow;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SBUISystemApertureSecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_accessibilityInvertColorsIsDarkWindow
{
  return 0;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end