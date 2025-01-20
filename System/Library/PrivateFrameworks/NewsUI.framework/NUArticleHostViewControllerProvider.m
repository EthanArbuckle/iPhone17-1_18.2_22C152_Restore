@interface NUArticleHostViewControllerProvider
- (NUArticleHostViewController)articleHostViewController;
- (NUArticleHostViewControllerProvider)initWithArticleHostViewController:(id)a3;
@end

@implementation NUArticleHostViewControllerProvider

- (NUArticleHostViewControllerProvider)initWithArticleHostViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUArticleHostViewControllerProvider;
  v5 = [(NUArticleHostViewControllerProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_articleHostViewController, v4);
  }

  return v6;
}

- (NUArticleHostViewController)articleHostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_articleHostViewController);

  return (NUArticleHostViewController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end