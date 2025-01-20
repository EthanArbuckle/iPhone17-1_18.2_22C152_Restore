@interface PSSplitViewController
- (int64_t)preferredStatusBarStyle;
@end

@implementation PSSplitViewController

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

@end