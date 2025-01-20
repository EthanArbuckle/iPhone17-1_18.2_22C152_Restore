@interface COSPasscodeCreateComplexViewController
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)isComplex;
@end

@implementation COSPasscodeCreateComplexViewController

- (BOOL)isComplex
{
  return 1;
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

@end