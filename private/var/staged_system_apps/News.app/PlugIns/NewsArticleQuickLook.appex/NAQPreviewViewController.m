@interface NAQPreviewViewController
+ (id)resolver;
- (BOOL)validateSearchableItemIdentifier:(id)a3;
- (NAQPreviewViewController)init;
- (NSString)previewItemIdentifier;
- (NUArticleContainerViewController)articleContainerViewController;
- (id)previewItemCallback;
- (void)articleContainerViewController:(id)a3 didLoadFirstPageWithIdentifier:(id)a4 error:(id)a5;
- (void)preparePreviewOfSearchableItemWithIdentifier:(id)a3 queryString:(id)a4 completionHandler:(id)a5;
- (void)setArticleContainerViewController:(id)a3;
- (void)setPreviewItemCallback:(id)a3;
- (void)setPreviewItemIdentifier:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NAQPreviewViewController

+ (id)resolver
{
  if (qword_100008848 != -1) {
    dispatch_once(&qword_100008848, &stru_100004140);
  }
  v2 = (void *)qword_100008840;

  return [v2 resolver];
}

- (NAQPreviewViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)NAQPreviewViewController;
  v2 = [(NAQPreviewViewController *)&v7 init];
  if (v2)
  {
    v3 = [(id)objc_opt_class() resolver];
    uint64_t v4 = [v3 resolveClass:objc_opt_class()];
    articleContainerViewController = v2->_articleContainerViewController;
    v2->_articleContainerViewController = (NUArticleContainerViewController *)v4;

    [(NUArticleContainerViewController *)v2->_articleContainerViewController setLinkPreviewing:1];
    [(NUArticleContainerViewController *)v2->_articleContainerViewController setDelegate:v2];
  }
  return v2;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)NAQPreviewViewController;
  [(NAQPreviewViewController *)&v8 viewDidLoad];
  v3 = [(NAQPreviewViewController *)self articleContainerViewController];
  [(NAQPreviewViewController *)self addChildViewController:v3];

  uint64_t v4 = [(NAQPreviewViewController *)self view];
  v5 = [(NAQPreviewViewController *)self articleContainerViewController];
  v6 = [v5 view];
  [v4 addSubview:v6];

  objc_super v7 = [(NAQPreviewViewController *)self articleContainerViewController];
  [v7 didMoveToParentViewController:self];
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)NAQPreviewViewController;
  [(NAQPreviewViewController *)&v14 viewDidLayoutSubviews];
  v3 = [(NAQPreviewViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(NAQPreviewViewController *)self articleContainerViewController];
  v13 = [v12 view];
  [v13 setFrame:v5, v7, v9, v11];
}

- (void)preparePreviewOfSearchableItemWithIdentifier:(id)a3 queryString:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([(NAQPreviewViewController *)self validateSearchableItemIdentifier:v7])
  {
    [(NAQPreviewViewController *)self setPreviewItemIdentifier:v7];
    [(NAQPreviewViewController *)self setPreviewItemCallback:v8];
    double v9 = [(NAQPreviewViewController *)self articleContainerViewController];
    id v14 = v7;
    double v10 = +[NSArray arrayWithObjects:&v14 count:1];
    [v9 loadWithArticleIDs:v10];
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100002CD4;
    v11[3] = &unk_100004168;
    id v13 = v8;
    id v12 = v7;
    sub_100002CD4((uint64_t)v11);

    double v9 = v13;
  }
}

- (void)articleContainerViewController:(id)a3 didLoadFirstPageWithIdentifier:(id)a4 error:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8) {
    goto LABEL_5;
  }
  uint64_t v10 = [(NAQPreviewViewController *)self previewItemIdentifier];
  if (!v10) {
    goto LABEL_5;
  }
  double v11 = (void *)v10;
  id v12 = [(NAQPreviewViewController *)self previewItemIdentifier];
  unsigned int v13 = [v8 isEqualToString:v12];

  if (v13)
  {
    id v14 = [(NAQPreviewViewController *)self previewItemCallback];
    ((void (**)(void, id))v14)[2](v14, v9);
  }
  else
  {
LABEL_5:
    v15 = [(NAQPreviewViewController *)self previewItemIdentifier];
    uint64_t v16 = +[NSError naq_errorFailedUnexpectedArticleLoadedWithIdentifier:v8 expectedIdentifier:v15];

    id v14 = [(NAQPreviewViewController *)self previewItemCallback];
    v14[2](v14, v16);
    id v9 = (id)v16;
  }

  [(NAQPreviewViewController *)self setPreviewItemCallback:0];
}

- (BOOL)validateSearchableItemIdentifier:(id)a3
{
  id v3 = [a3 copy];
  double v4 = [v3 uppercaseString];
  unsigned __int8 v5 = [v4 hasPrefix:@"A"];

  return v5;
}

- (NUArticleContainerViewController)articleContainerViewController
{
  return self->_articleContainerViewController;
}

- (void)setArticleContainerViewController:(id)a3
{
}

- (NSString)previewItemIdentifier
{
  return self->_previewItemIdentifier;
}

- (void)setPreviewItemIdentifier:(id)a3
{
}

- (id)previewItemCallback
{
  return self->_previewItemCallback;
}

- (void)setPreviewItemCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previewItemCallback, 0);
  objc_storeStrong((id *)&self->_previewItemIdentifier, 0);

  objc_storeStrong((id *)&self->_articleContainerViewController, 0);
}

@end