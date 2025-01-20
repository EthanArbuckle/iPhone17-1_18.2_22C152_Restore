@interface ICMainSplitViewController
- (BOOL)isDisplacingColumn;
- (BOOL)requiresNotificationForSecondaryColumnSize:(CGSize)a3;
- (BOOL)shouldDisplaceColumn;
- (ICMainSplitViewController)initWithStyle:(int64_t)a3 viewControllerManager:(id)a4;
- (ICViewControllerManager)viewControllerManager;
- (double)nonDisplacedColumnWidth;
- (double)preferredDisplacedColumnWidth;
- (int64_t)preferredDisplacedColumn;
- (void)registerForTraitChanges;
- (void)setIsDisplacingColumn:(BOOL)a3;
- (void)setNonDisplacedColumnWidth:(double)a3;
- (void)setPreferredDisplacedColumn:(int64_t)a3;
- (void)setPreferredDisplacedColumnWidth:(double)a3;
- (void)setShouldDisplaceColumn:(BOOL)a3;
- (void)updateStateForTrailingSidebarVisible:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ICMainSplitViewController

- (void)registerForTraitChanges
{
  v3 = [(ICMainSplitViewController *)self viewControllerManager];
  id v4 = [v3 behavior];

  if (v4 == (id)1)
  {
    objc_initWeak(&location, self);
    v5 = [(ICMainSplitViewController *)self viewControllerManager];
    v6 = [v5 noteEditorViewController];
    uint64_t v12 = objc_opt_class();
    v7 = +[NSArray arrayWithObjects:&v12 count:1];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100134544;
    v9[3] = &unk_100625EB8;
    objc_copyWeak(&v10, &location);
    id v8 = [v6 registerForTraitChanges:v7 withHandler:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (ICViewControllerManager)viewControllerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerManager);

  return (ICViewControllerManager *)WeakRetained;
}

- (ICMainSplitViewController)initWithStyle:(int64_t)a3 viewControllerManager:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ICMainSplitViewController;
  v7 = [(ICMainSplitViewController *)&v10 initWithStyle:a3];
  id v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_viewControllerManager, v6);
    [(ICMainSplitViewController *)v8 registerForTraitChanges];
  }

  return v8;
}

- (double)preferredDisplacedColumnWidth
{
  if (![(ICMainSplitViewController *)self isDisplacingColumn]
    && [(ICMainSplitViewController *)self displayMode] == (id)1)
  {
    v3 = [(ICMainSplitViewController *)self view];
    [v3 frame];
    double v5 = v4;
    id v6 = [(ICMainSplitViewController *)self view];
    [v6 frame];
    double v8 = v7;

    if (v5 < v8) {
      return 0.0;
    }
  }
  if ((id)[(ICMainSplitViewController *)self preferredDisplacedColumn] == (id)1)
  {
    [(ICMainSplitViewController *)self supplementaryColumnWidth];
  }
  else
  {
    [(ICMainSplitViewController *)self primaryColumnWidth];
  }
  return result;
}

- (void)updateStateForTrailingSidebarVisible:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  double v5 = [(ICMainSplitViewController *)self viewControllerManager];
  id v6 = [v5 trailingSidebarViewController];
  double v7 = ICDynamicCast();

  if (v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100005D34;
    v11[3] = &unk_100625F50;
    BOOL v13 = v3;
    v11[4] = self;
    id v8 = v7;
    id v12 = v8;
    v9 = objc_retainBlock(v11);
    objc_super v10 = v9;
    if (v3) {
      ((void (*)(void *))v9[2])(v9);
    }
    else {
      [v8 ic_performBlockAfterActiveTransition:v9];
    }
  }
}

- (BOOL)isDisplacingColumn
{
  return self->_isDisplacingColumn;
}

- (BOOL)shouldDisplaceColumn
{
  v2 = [(ICMainSplitViewController *)self viewControllerForColumn:[(ICMainSplitViewController *)self preferredDisplacedColumn]];
  unsigned __int8 v3 = [v2 ic_isViewVisible];

  return v3;
}

- (int64_t)preferredDisplacedColumn
{
  unsigned __int8 v3 = [(ICMainSplitViewController *)self viewControllerManager];
  id v4 = [v3 noteContainerViewMode];

  if (v4 == (id)-1)
  {
    double v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1004DD3E4(v7);
    }

    return 0;
  }
  if (v4) {
    return 0;
  }
  double v5 = [(ICMainSplitViewController *)self viewControllerManager];
  int64_t v6 = ([v5 canTilePrimaryContent] & 1) == 0
    && [(ICMainSplitViewController *)self style] != (id)1;

  return v6;
}

- (double)nonDisplacedColumnWidth
{
  if ([(ICMainSplitViewController *)self preferredDisplacedColumn]) {
    return 0.0;
  }
  unsigned __int8 v3 = [(ICMainSplitViewController *)self viewControllerForColumn:1];
  unsigned int v4 = [v3 ic_isViewVisible];

  if (!v4) {
    return 0.0;
  }

  [(ICMainSplitViewController *)self supplementaryColumnWidth];
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(ICMainSplitViewController *)self viewControllerManager];
  v9 = [v8 trailingSidebarViewController];
  unsigned __int8 v10 = [v9 isTransitioning];

  if ((v10 & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)ICMainSplitViewController;
    -[ICSplitViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  }
}

- (BOOL)requiresNotificationForSecondaryColumnSize:(CGSize)a3
{
  double width = a3.width;
  unsigned int v4 = -[ICMainSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", 2, a3.width, a3.height);
  double v5 = [v4 view];
  [v5 frame];
  double v7 = v6 - width;

  double v8 = -v7;
  if (v7 >= 0.0) {
    double v8 = v7;
  }
  BOOL v9 = v8 >= 10.0;

  return v9;
}

- (void)setShouldDisplaceColumn:(BOOL)a3
{
  self->_shouldDisplaceColumn = a3;
}

- (void)setPreferredDisplacedColumn:(int64_t)a3
{
  self->_preferredDisplacedColumn = a3;
}

- (void)setPreferredDisplacedColumnWidth:(double)a3
{
  self->_preferredDisplacedColumnWidth = a3;
}

- (void)setNonDisplacedColumnWidth:(double)a3
{
  self->_nonDisplacedColumnWidth = a3;
}

- (void)setIsDisplacingColumn:(BOOL)a3
{
  self->_isDisplacingColumn = a3;
}

- (void).cxx_destruct
{
}

@end