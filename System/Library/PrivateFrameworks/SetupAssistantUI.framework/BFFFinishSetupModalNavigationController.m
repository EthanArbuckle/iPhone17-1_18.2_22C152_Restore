@interface BFFFinishSetupModalNavigationController
- (BOOL)isModalInPresentation;
- (BOOL)isPad;
- (CGSize)preferredContentSize;
- (int64_t)modalPresentationStyle;
- (void)setIsPad:(BOOL)a3;
@end

@implementation BFFFinishSetupModalNavigationController

- (BOOL)isModalInPresentation
{
  return 1;
}

- (CGSize)preferredContentSize
{
  v2 = [(BFFFinishSetupModalNavigationController *)self topViewController];
  [v2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)modalPresentationStyle
{
  if ([(BFFFinishSetupModalNavigationController *)self isPad]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)isPad
{
  return self->_isPad;
}

- (void)setIsPad:(BOOL)a3
{
  self->_isPad = a3;
}

@end