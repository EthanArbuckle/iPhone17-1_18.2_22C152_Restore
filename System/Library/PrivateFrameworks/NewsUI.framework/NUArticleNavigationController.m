@interface NUArticleNavigationController
- (void)viewDidLoad;
@end

@implementation NUArticleNavigationController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)NUArticleNavigationController;
  [(NUArticleNavigationController *)&v2 viewDidLoad];
}

@end