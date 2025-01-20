@interface SUUIViewControllerFactory
- (id)newPlaceholderViewController;
@end

@implementation SUUIViewControllerFactory

- (id)newPlaceholderViewController
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIViewControllerFactory;
  id v2 = [(SUViewControllerFactory *)&v7 newPlaceholderViewController];
  v3 = (void *)MEMORY[0x263F895F8];
  v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v5 = [v3 gradientWithColor:v4];
  [v2 setDefaultBackgroundGradient:v5];

  return v2;
}

@end