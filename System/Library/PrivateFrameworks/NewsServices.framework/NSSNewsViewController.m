@interface NSSNewsViewController
+ (BOOL)canOpenURL:(id)a3;
- (BOOL)isLinkPreviewing;
- (NSArray)articleIDs;
- (NSSNewsViewController)initWithArticleID:(id)a3;
- (NSSNewsViewController)initWithArticleIDs:(id)a3;
- (NSSNewsViewController)initWithURL:(id)a3;
- (_UIResilientRemoteViewContainerViewController)remoteViewContainerViewController;
- (void)dealloc;
- (void)requestRemoteViewController;
- (void)setArticleIDs:(id)a3;
- (void)setLinkPreviewing:(BOOL)a3;
- (void)setRemoteViewContainerViewController:(id)a3;
- (void)setupRemoteViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NSSNewsViewController

+ (BOOL)canOpenURL:(id)a3
{
  return objc_msgSend(a3, "fc_isNewsArticleURL");
}

- (NSSNewsViewController)initWithArticleID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];

  v7 = -[NSSNewsViewController initWithArticleIDs:](self, "initWithArticleIDs:", v6, v9, v10);
  return v7;
}

- (NSSNewsViewController)initWithArticleIDs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSSNewsViewController;
  v6 = [(NSSNewsViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_articleIDs, a3);
    v7->_linkPreviewing = 0;
    [(NSSNewsViewController *)v7 requestRemoteViewController];
  }

  return v7;
}

- (NSSNewsViewController)initWithURL:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[NSSNewsViewController canOpenURL:v4])
  {
    id v5 = objc_msgSend(v4, "fc_NewsArticleID");
    v9[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    self = [(NSSNewsViewController *)self initWithArticleIDs:v6];

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  v3 = [(NSSNewsViewController *)self remoteViewContainerViewController];

  if (v3)
  {
    id v4 = [(NSSNewsViewController *)self remoteViewContainerViewController];
    int v5 = [v4 isViewLoaded];

    if (v5)
    {
      v6 = [(NSSNewsViewController *)self remoteViewContainerViewController];
      v7 = [v6 view];
      [v7 removeFromSuperview];
    }
    v8 = [(NSSNewsViewController *)self remoteViewContainerViewController];
    [v8 willMoveToParentViewController:0];

    objc_super v9 = [(NSSNewsViewController *)self remoteViewContainerViewController];
    [v9 removeFromParentViewController];
  }
  v10.receiver = self;
  v10.super_class = (Class)NSSNewsViewController;
  [(NSSNewsViewController *)&v10 dealloc];
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)NSSNewsViewController;
  [(NSSNewsViewController *)&v25 viewDidLoad];
  v3 = [(NSSNewsViewController *)self view];
  id v4 = [MEMORY[0x263F1C550] whiteColor];
  [v3 setBackgroundColor:v4];

  uint64_t v5 = [(NSSNewsViewController *)self remoteViewContainerViewController];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(NSSNewsViewController *)self remoteViewContainerViewController];
    v8 = [v7 parentViewController];

    if (v8 != self)
    {
      objc_super v9 = [(NSSNewsViewController *)self remoteViewContainerViewController];
      [(NSSNewsViewController *)self addChildViewController:v9];

      objc_super v10 = [(NSSNewsViewController *)self view];
      v11 = [(NSSNewsViewController *)self remoteViewContainerViewController];
      v12 = [v11 view];
      [v10 addSubview:v12];

      v13 = [(NSSNewsViewController *)self view];
      [v13 bounds];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      v22 = [(NSSNewsViewController *)self remoteViewContainerViewController];
      v23 = [v22 view];
      objc_msgSend(v23, "setFrame:", v15, v17, v19, v21);

      v24 = [(NSSNewsViewController *)self remoteViewContainerViewController];
      [v24 didMoveToParentViewController:self];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)NSSNewsViewController;
  [(NSSNewsViewController *)&v15 viewDidLayoutSubviews];
  v3 = [(NSSNewsViewController *)self remoteViewContainerViewController];

  if (v3)
  {
    id v4 = [(NSSNewsViewController *)self view];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(NSSNewsViewController *)self remoteViewContainerViewController];
    double v14 = [v13 view];
    objc_msgSend(v14, "setBounds:", v6, v8, v10, v12);
  }
}

- (void)setLinkPreviewing:(BOOL)a3
{
  BOOL v3 = a3;
  self->_linkPreviewing = a3;
  uint64_t v5 = [(NSSNewsViewController *)self remoteViewContainerViewController];
  if (v5)
  {
    double v6 = (void *)v5;
    double v7 = [(NSSNewsViewController *)self remoteViewContainerViewController];
    double v8 = [v7 remoteViewController];

    if (v8)
    {
      double v9 = [(NSSNewsViewController *)self remoteViewContainerViewController];
      double v10 = [v9 remoteViewController];
      id v11 = [v10 serviceViewControllerProxy];

      [v11 articleViewServiceProviderShouldPresentForLinkPreviewing:v3];
    }
  }
}

- (void)requestRemoteViewController
{
  [(NSSNewsViewController *)self _beginDelayingPresentation:0 cancellationHandler:3.0];
  uint64_t v3 = *MEMORY[0x263F59F80];
  id v27 = 0;
  id v4 = [MEMORY[0x263F08800] extensionWithIdentifier:v3 error:&v27];
  id v5 = v27;
  if (v4)
  {
    objc_initWeak(&location, self);
    double v6 = (void *)MEMORY[0x263F1CD20];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __52__NSSNewsViewController_requestRemoteViewController__block_invoke;
    v24[3] = &unk_2649A9038;
    objc_copyWeak(&v25, &location);
    double v7 = [v6 instantiateWithExtension:v4 completion:v24];
    [(NSSNewsViewController *)self setRemoteViewContainerViewController:v7];

    if ([(NSSNewsViewController *)self isViewLoaded])
    {
      double v8 = [(NSSNewsViewController *)self remoteViewContainerViewController];
      [(NSSNewsViewController *)self addChildViewController:v8];

      double v9 = [(NSSNewsViewController *)self view];
      double v10 = [(NSSNewsViewController *)self remoteViewContainerViewController];
      id v11 = [v10 view];
      [v9 addSubview:v11];

      double v12 = [(NSSNewsViewController *)self view];
      [v12 bounds];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v21 = [(NSSNewsViewController *)self remoteViewContainerViewController];
      v22 = [v21 view];
      objc_msgSend(v22, "setFrame:", v14, v16, v18, v20);

      v23 = [(NSSNewsViewController *)self remoteViewContainerViewController];
      [v23 didMoveToParentViewController:self];
    }
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

void __52__NSSNewsViewController_requestRemoteViewController__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setupRemoteViewController:v6];
  }
}

- (void)setupRemoteViewController:(id)a3
{
  id v7 = a3;
  id v4 = [(NSSNewsViewController *)self articleIDs];

  if (v7 && v4)
  {
    id v5 = [v7 serviceViewControllerProxy];
    objc_msgSend(v5, "articleViewServiceProviderShouldPresentForLinkPreviewing:", -[NSSNewsViewController isLinkPreviewing](self, "isLinkPreviewing"));
    id v6 = [(NSSNewsViewController *)self articleIDs];
    [v5 articleViewServiceProviderShouldLoadArticlesForArticleIDs:v6];
  }
  [(NSSNewsViewController *)self _endDelayingPresentation];
}

- (BOOL)isLinkPreviewing
{
  return self->_linkPreviewing;
}

- (NSArray)articleIDs
{
  return self->_articleIDs;
}

- (void)setArticleIDs:(id)a3
{
}

- (_UIResilientRemoteViewContainerViewController)remoteViewContainerViewController
{
  return self->_remoteViewContainerViewController;
}

- (void)setRemoteViewContainerViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewContainerViewController, 0);
  objc_storeStrong((id *)&self->_articleIDs, 0);
}

@end