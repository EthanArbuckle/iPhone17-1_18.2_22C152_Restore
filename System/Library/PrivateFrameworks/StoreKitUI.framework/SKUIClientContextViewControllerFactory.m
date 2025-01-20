@interface SKUIClientContextViewControllerFactory
- (id)newPlaceholderViewController;
@end

@implementation SKUIClientContextViewControllerFactory

- (id)newPlaceholderViewController
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIClientContextViewControllerFactory;
  id v2 = [(SUViewControllerFactory *)&v7 newPlaceholderViewController];
  v3 = (void *)MEMORY[0x1E4FB88B0];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v5 = [v3 gradientWithColor:v4];
  [v2 setDefaultBackgroundGradient:v5];

  return v2;
}

@end