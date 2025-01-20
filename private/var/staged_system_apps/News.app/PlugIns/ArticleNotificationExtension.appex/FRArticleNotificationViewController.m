@interface FRArticleNotificationViewController
- (CGSize)articlePreferredSize;
- (FRArticleNotificationArticleSource)articleSource;
- (NSSArticleViewControllerInternal)articleViewController;
- (NSString)articleID;
- (void)didReceiveNotification:(id)a3;
- (void)setArticleID:(id)a3;
- (void)setArticlePreferredSize:(CGSize)a3;
- (void)setArticleSource:(id)a3;
- (void)setArticleViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation FRArticleNotificationViewController

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)FRArticleNotificationViewController;
  [(FRArticleNotificationViewController *)&v17 viewDidLoad];
  id v3 = [objc_alloc((Class)NSSArticleViewControllerInternal) initWithNibName:0 bundle:0];
  [(FRArticleNotificationViewController *)self setArticleViewController:v3];

  v4 = [(FRArticleNotificationViewController *)self articleViewController];
  v5 = [v4 view];
  [v5 setAutoresizingMask:18];

  v6 = [(FRArticleNotificationViewController *)self view];
  [v6 bounds];
  double Width = CGRectGetWidth(v18);
  v8 = [(FRArticleNotificationViewController *)self view];
  [v8 bounds];
  double Height = CGRectGetHeight(v19);
  v10 = [(FRArticleNotificationViewController *)self articleViewController];
  v11 = [v10 view];
  [v11 setFrame:CGRectMake(0.0, 0.0, Width, Height)];

  v12 = [(FRArticleNotificationViewController *)self articleViewController];
  [(FRArticleNotificationViewController *)self addChildViewController:v12];

  v13 = [(FRArticleNotificationViewController *)self view];
  v14 = [(FRArticleNotificationViewController *)self articleViewController];
  v15 = [v14 view];
  [v13 addSubview:v15];

  v16 = [(FRArticleNotificationViewController *)self articleViewController];
  [v16 didMoveToParentViewController:self];
}

- (FRArticleNotificationArticleSource)articleSource
{
  articleSource = self->_articleSource;
  if (!articleSource)
  {
    v4 = FCURLForContainerizedUserAccountCachesDirectory();
    v5 = [[FRArticleNotificationArticleSource alloc] initWithCachesDirectory:v4];
    v6 = self->_articleSource;
    self->_articleSource = v5;

    articleSource = self->_articleSource;
  }

  return articleSource;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FRArticleNotificationViewController;
  [(FRArticleNotificationViewController *)&v4 viewDidAppear:a3];
  [(FRArticleNotificationViewController *)self articlePreferredSize];
  -[FRArticleNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FRArticleNotificationViewController;
  [(FRArticleNotificationViewController *)&v5 viewDidDisappear:a3];
  articleSource = self->_articleSource;
  self->_articleSource = 0;
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 request];
  v6 = [v5 content];
  v7 = [v6 userInfo];

  v8 = [v4 request];
  v9 = [v8 content];
  v10 = [v9 attachments];
  id v11 = [v10 count];

  v12 = [v7 objectForKeyedSubscript:FCNotificationPayloadNewsKey];
  v13 = [v12 objectForKeyedSubscript:FCNotificationPayloadArticleIDKey];
  [(FRArticleNotificationViewController *)self setArticleID:v13];
  objc_initWeak(&location, self);
  if (v11)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100004CF4;
    v19[3] = &unk_100008350;
    objc_copyWeak(&v20, &location);
    +[NSSArticleInternal articleFromNotification:v4 completion:v19];
    v14 = &v20;
  }
  else
  {
    v15 = [(FRArticleNotificationViewController *)self articleSource];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100004DF8;
    v16[3] = &unk_100008378;
    objc_copyWeak(&v18, &location);
    id v17 = v4;
    [v15 fetchArticleWithID:v13 completion:v16];

    v14 = &v18;
  }
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

- (NSSArticleViewControllerInternal)articleViewController
{
  return self->_articleViewController;
}

- (void)setArticleViewController:(id)a3
{
}

- (void)setArticleSource:(id)a3
{
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
}

- (CGSize)articlePreferredSize
{
  double width = self->_articlePreferredSize.width;
  double height = self->_articlePreferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setArticlePreferredSize:(CGSize)a3
{
  self->_articlePreferredSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_articleSource, 0);

  objc_storeStrong((id *)&self->_articleViewController, 0);
}

@end