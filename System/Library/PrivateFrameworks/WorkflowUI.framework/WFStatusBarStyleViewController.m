@interface WFStatusBarStyleViewController
- (int64_t)preferredStatusBarStyle;
- (void)setPreferredStatusBarStyle:(int64_t)a3;
@end

@implementation WFStatusBarStyleViewController

- (void)setPreferredStatusBarStyle:(int64_t)a3
{
  self->_preferredStatusBarStyle = a3;
}

- (int64_t)preferredStatusBarStyle
{
  return self->_preferredStatusBarStyle;
}

@end