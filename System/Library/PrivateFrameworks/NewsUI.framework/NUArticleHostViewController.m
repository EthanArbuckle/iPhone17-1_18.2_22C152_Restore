@interface NUArticleHostViewController
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (FCArticle)article;
- (FCIssue)issue;
- (FCObservable)articleViewStyler;
- (NSHashTable)loadingListeners;
- (NSString)contentSizeCategory;
- (NSString)pageIdentifier;
- (NSString)selectedText;
- (NUAnalyticsReporting)analyticsReporting;
- (NUArticleContentSizeManager)contentSizeManager;
- (NUArticleContext)articleContext;
- (NUArticleHostViewController)initWithArticle:(id)a3 articleViewControllerFactory:(id)a4 settings:(id)a5 errorMessageFactory:(id)a6 contentSizeManager:(id)a7;
- (NUArticleHostViewController)initWithArticle:(id)a3 issue:(id)a4 articleViewControllerFactory:(id)a5 settings:(id)a6 errorMessageFactory:(id)a7 analyticsReporting:(id)a8 contentSizeManager:(id)a9 relativePriority:(int64_t)a10;
- (NUArticleHostViewControllerDelegate)delegate;
- (NUArticleViewControllerFactory)articleViewControllerFactory;
- (NUErrorMessageFactory)errorMessageFactory;
- (NULoadingDelegate)loadingDelegate;
- (NULoadingViewProviding)loadingView;
- (NUSettings)settings;
- (TFMultiDelegate)multiLoadingDelegate;
- (UIResponder)responder;
- (UIScrollView)scrollView;
- (UIViewController)contentTypeViewController;
- (id)loadingTextForArticle:(id)a3;
- (int64_t)contentScale;
- (int64_t)relativePriority;
- (void)articleViewController:(id)a3 didScrollToPosition:(id)a4;
- (void)articleViewControllerDidScrollToBottomOfPrimaryContent:(id)a3;
- (void)loadArticleAndEmbedArticleViewController;
- (void)loadingDidFinishWithError:(id)a3;
- (void)loadingDidStart;
- (void)loadingDidUpdateProgress:(double)a3;
- (void)loadingWillStart;
- (void)reportEvent:(id)a3;
- (void)setArticleContext:(id)a3;
- (void)setContentScale:(int64_t)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setContentTypeViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLoadingDelegate:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setResponder:(id)a3;
- (void)updateContentScaleAndSize;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation NUArticleHostViewController

- (NUArticleHostViewController)initWithArticle:(id)a3 issue:(id)a4 articleViewControllerFactory:(id)a5 settings:(id)a6 errorMessageFactory:(id)a7 analyticsReporting:(id)a8 contentSizeManager:(id)a9 relativePriority:(int64_t)a10
{
  id v17 = a3;
  id v33 = a4;
  id v32 = a5;
  id v31 = a6;
  id v30 = a7;
  id v29 = a8;
  id v18 = a9;
  v34.receiver = self;
  v34.super_class = (Class)NUArticleHostViewController;
  v19 = [(NUArticleHostViewController *)&v34 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_article, a3);
    objc_storeStrong((id *)&v20->_issue, a4);
    uint64_t v21 = [objc_alloc(MEMORY[0x263F59588]) initWithValue:0];
    articleViewStyler = v20->_articleViewStyler;
    v20->_articleViewStyler = (FCObservable *)v21;

    objc_storeStrong((id *)&v20->_articleViewControllerFactory, a5);
    objc_storeStrong((id *)&v20->_settings, a6);
    objc_storeStrong((id *)&v20->_errorMessageFactory, a7);
    v23 = [v17 articleID];
    uint64_t v24 = [v23 copy];
    pageIdentifier = v20->_pageIdentifier;
    v20->_pageIdentifier = (NSString *)v24;

    uint64_t v26 = [objc_alloc(MEMORY[0x263F7D0C8]) initWithDelegate:v20 delegateProtocol:&unk_26D4C0A08];
    multiLoadingDelegate = v20->_multiLoadingDelegate;
    v20->_multiLoadingDelegate = (TFMultiDelegate *)v26;

    objc_storeStrong((id *)&v20->_analyticsReporting, a8);
    objc_storeStrong((id *)&v20->_contentSizeManager, a9);
    v20->_relativePriority = a10;
  }

  return v20;
}

- (NUArticleHostViewController)initWithArticle:(id)a3 articleViewControllerFactory:(id)a4 settings:(id)a5 errorMessageFactory:(id)a6 contentSizeManager:(id)a7
{
  return [(NUArticleHostViewController *)self initWithArticle:a3 issue:0 articleViewControllerFactory:a4 settings:a5 errorMessageFactory:a6 analyticsReporting:0 contentSizeManager:a7 relativePriority:0];
}

- (NSHashTable)loadingListeners
{
  return [(NUArticleViewControllerFactory *)self->_articleViewControllerFactory loadingListeners];
}

- (void)viewDidLoad
{
  v14[1] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)NUArticleHostViewController;
  [(NUArticleHostViewController *)&v13 viewDidLoad];
  v3 = [(NUArticleHostViewController *)self view];
  [v3 setPreservesSuperviewLayoutMargins:1];

  v4 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v5 = [(NUArticleHostViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(NUArticleHostViewController *)self article];
  v7 = [(NUArticleHostViewController *)self loadingTextForArticle:v6];

  v8 = [[NUActivityIndicatorLoadingView alloc] initWithText:v7 activityIndicatorStyle:100];
  [(NUArticleHostViewController *)self setLoadingView:v8];

  v9 = [(NUArticleHostViewController *)self view];
  v10 = [(NUArticleHostViewController *)self loadingView];
  [v9 addSubview:v10];

  [(NUArticleHostViewController *)self loadArticleAndEmbedArticleViewController];
  v14[0] = objc_opt_class();
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v12 = (id)[(NUArticleHostViewController *)self registerForTraitChanges:v11 withHandler:&__block_literal_global_7];
}

uint64_t __42__NUArticleHostViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateContentScaleAndSize];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUArticleHostViewController;
  [(NUArticleHostViewController *)&v5 viewWillAppear:a3];
  v4 = [(NUArticleHostViewController *)self scrollView];
  [v4 setFocusEffect:0];

  [(NUArticleHostViewController *)self updateContentScaleAndSize];
}

- (void)viewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NUArticleHostViewController;
  [(NUArticleHostViewController *)&v12 viewWillLayoutSubviews];
  [(NUArticleHostViewController *)self additionalSafeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(NUArticleHostViewController *)self contentTypeViewController];
  objc_msgSend(v11, "setAdditionalSafeAreaInsets:", v4, v6, v8, v10);
}

- (BOOL)becomeFirstResponder
{
  double v3 = [(NUArticleHostViewController *)self contentTypeViewController];
  [v3 becomeFirstResponder];

  v5.receiver = self;
  v5.super_class = (Class)NUArticleHostViewController;
  return [(NUArticleHostViewController *)&v5 becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  double v3 = [(NUArticleHostViewController *)self contentTypeViewController];
  [v3 becomeFirstResponder];

  v5.receiver = self;
  v5.super_class = (Class)NUArticleHostViewController;
  return [(NUArticleHostViewController *)&v5 resignFirstResponder];
}

- (UIResponder)responder
{
  double v3 = [(NUArticleHostViewController *)self contentTypeViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  objc_super v5 = [(NUArticleHostViewController *)self contentTypeViewController];
  double v6 = v5;
  if (isKindOfClass)
  {
    uint64_t v7 = [v5 responder];

    double v6 = (void *)v7;
  }

  return (UIResponder *)v6;
}

- (NSString)contentSizeCategory
{
  double v3 = [(NUArticleHostViewController *)self article];
  double v4 = [v3 headline];

  if (!v4)
  {
    double v8 = [MEMORY[0x263F1C408] sharedApplication];
    id v9 = [v8 preferredContentSizeCategory];
    goto LABEL_5;
  }
  objc_super v5 = [(NUArticleHostViewController *)self contentSizeManager];
  double v6 = [(NUArticleHostViewController *)self article];
  uint64_t v7 = [v6 headline];
  double v8 = [v5 contentSizeCategoryForArticle:v7];

  if (v8)
  {
    id v9 = v8;
    double v8 = v9;
LABEL_5:
    double v10 = v9;
    goto LABEL_7;
  }
  v11 = [MEMORY[0x263F1C408] sharedApplication];
  double v10 = [v11 preferredContentSizeCategory];

LABEL_7:

  return (NSString *)v10;
}

- (void)setContentSizeCategory:(id)a3
{
  id v12 = a3;
  double v4 = [(NUArticleHostViewController *)self article];
  objc_super v5 = [v4 headline];

  if (v5)
  {
    double v6 = [(NUArticleHostViewController *)self contentSizeManager];
    uint64_t v7 = [(NUArticleHostViewController *)self article];
    double v8 = [v7 headline];
    [v6 updateContentSizeCategory:v12 forArticle:v8];
  }
  id v9 = [(NUArticleHostViewController *)self contentTypeViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v11 = [(NUArticleHostViewController *)self contentTypeViewController];
    [v11 setContentSizeCategory:v12];
  }
}

- (int64_t)contentScale
{
  double v3 = [(NUArticleHostViewController *)self article];
  double v4 = [v3 headline];

  if (!v4) {
    return 4;
  }
  objc_super v5 = [(NUArticleHostViewController *)self contentSizeManager];
  double v6 = [(NUArticleHostViewController *)self article];
  uint64_t v7 = [v6 headline];
  int64_t v8 = [v5 contentScaleForArticle:v7];

  if (v8) {
    return v8;
  }
  else {
    return 4;
  }
}

- (void)setContentScale:(int64_t)a3
{
  objc_super v5 = [(NUArticleHostViewController *)self article];
  double v6 = [v5 headline];

  if (v6)
  {
    uint64_t v7 = [(NUArticleHostViewController *)self contentSizeManager];
    int64_t v8 = [(NUArticleHostViewController *)self article];
    id v9 = [v8 headline];
    [v7 updateContentScale:a3 forArticle:v9];
  }
  double v10 = [(NUArticleHostViewController *)self contentTypeViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v12 = [(NUArticleHostViewController *)self contentTypeViewController];
    [v12 setContentScale:a3];
  }
}

- (void)updateContentScaleAndSize
{
  double v3 = [(NUArticleHostViewController *)self contentTypeViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(NUArticleHostViewController *)self contentTypeViewController];
    objc_msgSend(v6, "setContentScale:", -[NUArticleHostViewController contentScale](self, "contentScale"));
    objc_super v5 = [(NUArticleHostViewController *)self contentSizeCategory];
    [v6 setContentSizeCategory:v5];
  }
}

- (void)viewDidLayoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)NUArticleHostViewController;
  [(NUArticleHostViewController *)&v24 viewDidLayoutSubviews];
  double v3 = [(NUArticleHostViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(NUArticleHostViewController *)self contentTypeViewController];
  objc_super v13 = [v12 view];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  v14 = [(NUArticleHostViewController *)self view];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(NUArticleHostViewController *)self loadingView];
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);
}

- (NSString)selectedText
{
  objc_opt_class();
  double v3 = [(NUArticleHostViewController *)self contentTypeViewController];
  double v4 = FCDynamicCast();

  double v5 = [v4 selectedText];

  return (NSString *)v5;
}

- (void)setLoadingDelegate:(id)a3
{
  id obj = a3;
  double v4 = [(NUArticleHostViewController *)self multiLoadingDelegate];
  self = (NUArticleHostViewController *)((char *)self + 984);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  [v4 replaceDelegate:WeakRetained withDelegate:obj];

  objc_storeWeak((id *)&self->super.super.super.isa, obj);
}

- (void)loadingWillStart
{
  id v3 = [(NUArticleHostViewController *)self contentTypeViewController];
  v2 = [v3 view];
  [v2 setAlpha:0.0];
}

- (void)loadingDidStart
{
  id v2 = [(NUArticleHostViewController *)self loadingView];
  [v2 loadingViewStartAnimating];
}

- (void)loadingDidFinishWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(NUArticleHostViewController *)self loadingView];
    [v5 loadingViewStopAnimating];

    double v6 = [(NUArticleHostViewController *)self loadingView];
    [v6 removeFromSuperview];

    [(NUArticleHostViewController *)self setLoadingView:0];
    double v7 = [(NUArticleHostViewController *)self errorMessageFactory];
    double v8 = [v7 errorMessageForArticleView];

    if (v8)
    {
      double v9 = [[NUErrorView alloc] initWithErrorMessage:v8];
      [(NUErrorView *)v9 setAutoresizingMask:18];
      double v10 = [(NUArticleHostViewController *)self navigationController];
      double v11 = [v10 navigationBar];
      [v11 frame];
      double MaxY = CGRectGetMaxY(v25);
      objc_super v13 = [(NUArticleHostViewController *)self navigationController];
      v14 = [v13 toolbar];
      [v14 frame];
      CGRectGetHeight(v26);

      double v15 = [(NUArticleHostViewController *)self view];
      [v15 bounds];
      -[NUErrorView setFrame:](v9, "setFrame:", v16 + 0.0, MaxY + v17);

      double v18 = [(NUArticleHostViewController *)self view];
      [v18 addSubview:v9];
    }
  }
  else
  {
    objc_initWeak(&location, self);
    double v19 = (void *)MEMORY[0x263F1CB60];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __57__NUArticleHostViewController_loadingDidFinishWithError___block_invoke;
    v22[3] = &unk_2645FED68;
    objc_copyWeak(&v23, &location);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __57__NUArticleHostViewController_loadingDidFinishWithError___block_invoke_3;
    v20[3] = &unk_2645FEF50;
    objc_copyWeak(&v21, &location);
    [v19 animateWithDuration:v22 animations:v20 completion:0.15];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

void __57__NUArticleHostViewController_loadingDidFinishWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v2 = WeakRetained;
    id v3 = [v2 contentTypeViewController];
    id v4 = [v3 view];
    [v4 setAlpha:1.0];

    double v5 = [v2 loadingView];

    [v5 setAlpha:0.0];
    id WeakRetained = v6;
  }
}

void __57__NUArticleHostViewController_loadingDidFinishWithError___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v2 = WeakRetained;
    id v3 = [v2 contentTypeViewController];
    id v4 = [v3 view];
    [v4 setAlpha:1.0];

    double v5 = [v2 loadingView];
    [v5 loadingViewStopAnimating];

    id v6 = [v2 loadingView];
    [v6 removeFromSuperview];

    [v2 setLoadingView:0];
    id WeakRetained = v7;
  }
}

- (void)loadingDidUpdateProgress:(double)a3
{
  double v5 = [(NUArticleHostViewController *)self loadingView];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(NUArticleHostViewController *)self loadingView];
    [v7 loadingViewUpdateProgress:a3];
  }
}

- (UIScrollView)scrollView
{
  id v3 = [(NUArticleHostViewController *)self contentTypeViewController];
  int v4 = [v3 conformsToProtocol:&unk_26D4C8F78];

  if (v4)
  {
    double v5 = [(NUArticleHostViewController *)self contentTypeViewController];
    char v6 = [v5 scrollView];
  }
  else
  {
    char v6 = 0;
  }

  return (UIScrollView *)v6;
}

- (void)articleViewController:(id)a3 didScrollToPosition:(id)a4
{
  id v8 = a4;
  double v5 = [(NUArticleHostViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(NUArticleHostViewController *)self delegate];
    [v7 articleHostViewController:self didScrollToPosition:v8];
  }
}

- (void)articleViewControllerDidScrollToBottomOfPrimaryContent:(id)a3
{
  int v4 = [(NUArticleHostViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(NUArticleHostViewController *)self delegate];
    [v6 articleHostViewControllerDidScrollToBottomOfPrimaryContent:self];
  }
}

- (void)reportEvent:(id)a3
{
  id v4 = a3;
  id v6 = [(NUArticleHostViewController *)self analyticsReporting];
  char v5 = [[NUContentAnalyticsEvent alloc] initWithEvent:v4];

  [v6 reportEvent:v5];
}

- (void)setArticleContext:(id)a3
{
  id v8 = a3;
  id v4 = (NUArticleContext *)[v8 copy];
  articleContext = self->_articleContext;
  self->_articleContext = v4;

  objc_opt_class();
  id v6 = [(NUArticleHostViewController *)self contentTypeViewController];
  id v7 = FCDynamicCast();

  if (v7) {
    [v7 setArticleContext:v8];
  }
}

- (void)loadArticleAndEmbedArticleViewController
{
  id v3 = [(NUArticleHostViewController *)self contentTypeViewController];

  if (v3)
  {
    id v4 = [(NUArticleHostViewController *)self contentTypeViewController];
    [v4 willMoveToParentViewController:0];

    char v5 = [(NUArticleHostViewController *)self contentTypeViewController];
    id v6 = [v5 view];
    [v6 removeFromSuperview];

    id v7 = [(NUArticleHostViewController *)self contentTypeViewController];
    [v7 removeFromParentViewController];
  }
  id v8 = [(NUArticleHostViewController *)self loadingView];
  [v8 loadingViewStartAnimating];

  objc_initWeak(&location, self);
  double v9 = [(NUArticleHostViewController *)self article];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke;
  v10[3] = &unk_2645FEFA0;
  objc_copyWeak(&v11, &location);
  [v9 performBlockWhenFullyLoaded:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    double v10 = v9;
    if (v6)
    {
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_3;
      v61[3] = &unk_2645FE470;
      v61[4] = v9;
      id v62 = v6;
      __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_3((uint64_t)v61);
      id v11 = v62;
    }
    else
    {
      id v12 = [v5 headline];

      if (v12)
      {
        objc_super v13 = [v5 headline];
        uint64_t v14 = [v13 contentType];

        switch(v14)
        {
          case 0:
          case 1:
          case 3:
            double v15 = (void *)MEMORY[0x263F087E8];
            double v16 = [v5 headline];
            double v17 = objc_msgSend(v15, "nu_errorArticleContentTypeUnsupported:", v16);

            double v18 = [v10 multiLoadingDelegate];
            double v19 = [v18 delegate];
            [v19 loadingDidFinishWithError:v17];

            goto LABEL_12;
          case 2:
            double v20 = [v10 articleViewControllerFactory];
            id v21 = [v10 issue];
            double v22 = [v10 articleContext];
            double v17 = objc_msgSend(v20, "createArticleViewControllerWithArticle:issue:context:relativePriority:articleHostViewController:", v5, v21, v22, objc_msgSend(v10, "relativePriority"), v10);

            [v10 setContentTypeViewController:v17];
            [v17 setDelegate:v10];
            id v23 = [v10 multiLoadingDelegate];
            objc_super v24 = [v23 delegate];
            [v17 setLoadingDelegate:v24];

            CGRect v25 = [v10 contentSizeCategory];
            [v17 setContentSizeCategory:v25];

            objc_msgSend(v17, "setContentScale:", objc_msgSend(v10, "contentScale"));
            [v17 setAnalyticsReporting:v10];
            CGRect v26 = [v10 articleViewStyler];
            objc_initWeak(&location, v26);

            v27 = [v17 articleViewStyler];
            uint64_t v52 = MEMORY[0x263EF8330];
            uint64_t v53 = 3221225472;
            v54 = __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_5;
            v55 = &unk_2645FEF78;
            objc_copyWeak(&v56, &location);
            id v28 = (id)[v27 observe:&v52];

            id v29 = objc_msgSend(v10, "articleViewStyler", v52, v53, v54, v55);
            id v30 = [v17 articleViewStyler];
            id v31 = [v30 value];
            [v29 next:v31];

            [v17 updateScrollPositionFromContext];
            objc_destroyWeak(&v56);
            objc_destroyWeak(&location);
LABEL_12:

            break;
          default:
            break;
        }
        id v32 = [v10 contentTypeViewController];

        if (v32)
        {
          id v33 = [v10 contentTypeViewController];
          [v10 addChildViewController:v33];

          objc_super v34 = [v10 view];
          [v34 bounds];
          double v36 = v35;
          double v38 = v37;
          double v40 = v39;
          double v42 = v41;
          v43 = [v10 contentTypeViewController];
          v44 = [v43 view];
          objc_msgSend(v44, "setFrame:", v36, v38, v40, v42);

          v45 = [v10 loadingView];
          v46 = [v45 superview];

          v47 = [v10 view];
          v48 = [v10 contentTypeViewController];
          v49 = [v48 view];
          if (v46)
          {
            v50 = [v10 loadingView];
            [v47 insertSubview:v49 belowSubview:v50];
          }
          else
          {
            [v47 addSubview:v49];
          }

          v51 = [v10 contentTypeViewController];
          [v51 didMoveToParentViewController:v10];
        }
        goto LABEL_5;
      }
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_4;
      v58[3] = &unk_2645FE470;
      id v59 = v5;
      v60 = v10;
      __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_4((uint64_t)v58);
      id v11 = v59;
    }

LABEL_5:
  }
}

void __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) multiLoadingDelegate];
  id v2 = [v3 delegate];
  [v2 loadingDidFinishWithError:*(void *)(a1 + 40)];
}

void __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_4(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263F087E8], "nu_errorArticleMissingHeadline:", *(void *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 40) multiLoadingDelegate];
  id v3 = [v2 delegate];
  [v3 loadingDidFinishWithError:v4];
}

void __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained next:v3];
}

- (id)loadingTextForArticle:(id)a3
{
  id v3 = a3;
  id v4 = NUBundle();
  id v5 = [v4 localizedStringForKey:@"LOADING" value:&stru_26D495918 table:0];

  id v6 = [v3 headline];

  if (v6)
  {
    id v7 = [v3 headline];
    unint64_t v8 = [v7 role];

    if (v8 <= 8)
    {
      if (((1 << v8) & 0x1AD) != 0)
      {
        unint64_t v8 = v5;
      }
      else
      {
        id v9 = NUBundle();
        double v10 = v9;
        if (((1 << v8) & 0x42) != 0) {
          id v11 = @"LOADING STORY";
        }
        else {
          id v11 = @"LOADING ADVERTISEMENT";
        }
        unint64_t v8 = [v9 localizedStringForKey:v11 value:&stru_26D495918 table:0];
      }
    }
  }
  else
  {
    unint64_t v8 = v5;
  }

  return (id)v8;
}

id __53__NUArticleHostViewController_loadingTextForArticle___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSString)pageIdentifier
{
  return self->_pageIdentifier;
}

- (NULoadingDelegate)loadingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loadingDelegate);

  return (NULoadingDelegate *)WeakRetained;
}

- (NUArticleHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NUArticleHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FCObservable)articleViewStyler
{
  return self->_articleViewStyler;
}

- (NUArticleContext)articleContext
{
  return self->_articleContext;
}

- (void)setResponder:(id)a3
{
}

- (FCArticle)article
{
  return self->_article;
}

- (FCIssue)issue
{
  return self->_issue;
}

- (NUArticleViewControllerFactory)articleViewControllerFactory
{
  return self->_articleViewControllerFactory;
}

- (NUSettings)settings
{
  return self->_settings;
}

- (UIViewController)contentTypeViewController
{
  return self->_contentTypeViewController;
}

- (void)setContentTypeViewController:(id)a3
{
}

- (NULoadingViewProviding)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (TFMultiDelegate)multiLoadingDelegate
{
  return self->_multiLoadingDelegate;
}

- (NUErrorMessageFactory)errorMessageFactory
{
  return self->_errorMessageFactory;
}

- (NUAnalyticsReporting)analyticsReporting
{
  return self->_analyticsReporting;
}

- (NUArticleContentSizeManager)contentSizeManager
{
  return self->_contentSizeManager;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentSizeManager, 0);
  objc_storeStrong((id *)&self->_analyticsReporting, 0);
  objc_storeStrong((id *)&self->_errorMessageFactory, 0);
  objc_storeStrong((id *)&self->_multiLoadingDelegate, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_contentTypeViewController, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_articleViewControllerFactory, 0);
  objc_storeStrong((id *)&self->_issue, 0);
  objc_storeStrong((id *)&self->_article, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_articleContext, 0);
  objc_storeStrong((id *)&self->_articleViewStyler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_loadingDelegate);

  objc_storeStrong((id *)&self->_pageIdentifier, 0);
}

@end