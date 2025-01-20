@interface SBIgnoredForAutorotationSecureWindow
- (BOOL)_shouldControlAutorotation;
@end

@implementation SBIgnoredForAutorotationSecureWindow

- (BOOL)_shouldControlAutorotation
{
  return 0;
}

@end