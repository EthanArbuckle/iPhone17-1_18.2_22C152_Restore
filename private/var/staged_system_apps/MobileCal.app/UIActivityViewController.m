@interface UIActivityViewController
- (BOOL)prefersForcedModalShowViewController;
@end

@implementation UIActivityViewController

- (BOOL)prefersForcedModalShowViewController
{
  return 1;
}

@end