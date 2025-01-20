@interface SearchUIPlayVideoHandler
- (id)createViewControllerForCommand:(id)a3 environment:(id)a4;
- (unint64_t)destination;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUIPlayVideoHandler

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  id v4 = a3;
  v5 = [SearchUIMediaPlayerViewController alloc];
  v6 = (void *)MEMORY[0x1E4F9A2F8];
  v7 = [v4 url];

  v8 = [v6 punchoutWithURL:v7];
  v9 = [(SearchUIMediaPlayerViewController *)v5 initWithDestination:v8];

  return v9;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v6 = a5;
  id v8 = [(SearchUICommandHandler *)self viewController];
  v7 = [v6 sourceView];

  [v8 showFullScreenPresentationFromView:v7 completion:0];
}

- (unint64_t)destination
{
  return 3;
}

@end