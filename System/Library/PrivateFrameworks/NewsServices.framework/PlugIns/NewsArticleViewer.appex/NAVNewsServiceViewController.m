@interface NAVNewsServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (NUArticleContainerViewController)articleContainerViewController;
- (void)articleContainerViewControllerDidFinishPresenting:(id)a3;
- (void)articleViewServiceProviderShouldLoadArticlesForArticleIDs:(id)a3;
- (void)articleViewServiceProviderShouldPresentForLinkPreviewing:(BOOL)a3;
- (void)dealloc;
- (void)setArticleContainerViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NAVNewsServiceViewController

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NAVNewsArticleViewerServiceProviderType];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NAVNewsArticleViewerRemoteProviderType];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)NAVNewsServiceViewController;
  [(NAVNewsServiceViewController *)&v15 viewDidLoad];
  v3 = [(NAVNewsServiceViewController *)self view];
  v4 = +[UIColor whiteColor];
  [v3 setBackgroundColor:v4];

  v5 = [(NAVNewsServiceViewController *)self extensionContext];
  v6 = +[NAVContainer sharedContainerForExtension:v5 hostViewController:self];
  v7 = [v6 resolver];

  v8 = [v7 resolveClass:objc_opt_class()];
  [(NAVNewsServiceViewController *)self setArticleContainerViewController:v8];

  v9 = [(NAVNewsServiceViewController *)self articleContainerViewController];
  [v9 setDelegate:self];

  v10 = [(NAVNewsServiceViewController *)self articleContainerViewController];
  [(NAVNewsServiceViewController *)self addChildViewController:v10];

  v11 = [(NAVNewsServiceViewController *)self view];
  v12 = [(NAVNewsServiceViewController *)self articleContainerViewController];
  v13 = [v12 view];
  [v11 addSubview:v13];

  v14 = [(NAVNewsServiceViewController *)self articleContainerViewController];
  [v14 didMoveToParentViewController:self];
}

- (void)dealloc
{
  v3 = [(NAVNewsServiceViewController *)self articleContainerViewController];
  [v3 willMoveToParentViewController:0];

  v4 = [(NAVNewsServiceViewController *)self articleContainerViewController];
  v5 = [v4 view];
  [v5 removeFromSuperview];

  v6 = [(NAVNewsServiceViewController *)self articleContainerViewController];
  [v6 removeFromParentViewController];

  v7.receiver = self;
  v7.super_class = (Class)NAVNewsServiceViewController;
  [(NAVNewsServiceViewController *)&v7 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)NAVNewsServiceViewController;
  [(NAVNewsServiceViewController *)&v14 viewDidLayoutSubviews];
  v3 = [(NAVNewsServiceViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(NAVNewsServiceViewController *)self articleContainerViewController];
  v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (void)articleViewServiceProviderShouldLoadArticlesForArticleIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(NAVNewsServiceViewController *)self articleContainerViewController];
  [v5 loadWithArticleIDs:v4];
}

- (void)articleViewServiceProviderShouldPresentForLinkPreviewing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NAVNewsServiceViewController *)self articleContainerViewController];
  [v4 setLinkPreviewing:v3];
}

- (void)articleContainerViewControllerDidFinishPresenting:(id)a3
{
  id v3 = [(NAVNewsServiceViewController *)self _remoteViewControllerProxy];
  [v3 articleViewerRemoteProviderShouldDismissAnimated:1];
}

- (NUArticleContainerViewController)articleContainerViewController
{
  return self->_articleContainerViewController;
}

- (void)setArticleContainerViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end