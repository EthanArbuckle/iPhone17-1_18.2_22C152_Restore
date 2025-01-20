@interface SXQuickLookPreviewViewControllerFactory
- (id)viewControllerForFile:(id)a3 transitionContext:(id)a4;
@end

@implementation SXQuickLookPreviewViewControllerFactory

- (id)viewControllerForFile:(id)a3 transitionContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[SXQuickLookPreviewViewController alloc] initWithFile:v6 transitionContext:v5];

  return v7;
}

@end