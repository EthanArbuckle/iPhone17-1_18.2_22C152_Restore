@interface ICSEContainerViewController
- (BOOL)isShowingTableContainer;
- (ICSEMainViewController)mainViewController;
- (ICSERootViewController)rootViewController;
- (ICSETableViewController)tableViewController;
- (UIView)mainContainerView;
- (UIView)tableViewContainerView;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)setIsShowingTableContainer:(BOOL)a3;
- (void)setMainContainerView:(id)a3;
- (void)setMainViewController:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setTableViewContainerView:(id)a3;
- (void)setTableViewController:(id)a3;
- (void)setUpForIsShowingTableContainer:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ICSEContainerViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ICSEContainerViewController;
  [(ICSEContainerViewController *)&v3 viewDidLoad];
  [(ICSEContainerViewController *)self setUpForIsShowingTableContainer:self->_isShowingTableContainer];
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  v6 = [v5 destinationViewController];

  ICDynamicCast();
  id v30 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v7 = [v30 viewControllers];
  v8 = [v7 firstObject];
  v9 = ICDynamicCast();

  objc_opt_class();
  v10 = [v30 viewControllers];
  v11 = [v10 firstObject];
  v12 = ICDynamicCast();

  if (v9)
  {
    if ((+[UIDevice ic_isVision] & 1) == 0)
    {
      v13 = +[UIColor whiteColor];
      v14 = [v9 navigationController];
      v15 = [v14 navigationBar];
      [v15 setTintColor:v13];
    }
    [v9 setContainerViewController:self];
    v16 = [(ICSEContainerViewController *)self rootViewController];
    [v16 setMainViewController:v9];

    v17 = [(ICSEContainerViewController *)self tableViewController];

    if (v17)
    {
      v18 = [(ICSEContainerViewController *)self tableViewController];
      [v18 setDelegate:v9];
    }
    [(ICSEContainerViewController *)self setMainViewController:v9];
  }
  else if (v12)
  {
    [v12 setContainerViewController:self];
    v19 = +[ICNoteContext sharedContext];
    v20 = [v19 managedObjectContext];
    v21 = +[ICAccount allActiveAccountsInContextSortedByAccountType:v20];
    id v22 = [v21 count];
    v23 = +[NSBundle mainBundle];
    v24 = v23;
    if ((unint64_t)v22 >= 2) {
      CFStringRef v25 = @"Choose Location";
    }
    else {
      CFStringRef v25 = @"Choose Folder";
    }
    v26 = [v23 localizedStringForKey:v25 value:&stru_1000F2510 table:0];
    [v12 setTitle:v26];

    v27 = [(ICSEContainerViewController *)self rootViewController];
    [v27 setTableViewController:v12];

    v28 = [(ICSEContainerViewController *)self mainViewController];

    if (v28)
    {
      v29 = [(ICSEContainerViewController *)self mainViewController];
      [v12 setDelegate:v29];
    }
    [(ICSEContainerViewController *)self setTableViewController:v12];
  }
}

- (void)setIsShowingTableContainer:(BOOL)a3
{
  if (self->_isShowingTableContainer != a3)
  {
    self->_isShowingTableContainer = a3;
    -[ICSEContainerViewController setUpForIsShowingTableContainer:](self, "setUpForIsShowingTableContainer:");
  }
}

- (void)setUpForIsShowingTableContainer:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  if (a3) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.0;
  }
  v7 = [(ICSEContainerViewController *)self mainContainerView];
  [v7 setHidden:0];

  v8 = [(ICSEContainerViewController *)self tableViewContainerView];
  [v8 setHidden:0];

  v9 = [(ICSEContainerViewController *)self mainContainerView];
  [v9 setAlpha:v6];

  v10 = [(ICSEContainerViewController *)self tableViewContainerView];
  [v10 setAlpha:v5];

  v11 = [(ICSEContainerViewController *)self view];
  [v11 setUserInteractionEnabled:0];

  if (v3)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v12 = [(ICSEContainerViewController *)self tableViewController];
    v13 = [v12 navigationController];
    v14 = [v13 viewControllers];

    id v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) willAppearInContainer:self];
        }
        id v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);
    }
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100023780;
  v22[3] = &unk_1000EE9F0;
  v22[4] = self;
  *(double *)&v22[5] = v5;
  *(double *)&v22[6] = v6;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100023800;
  v19[3] = &unk_1000EEA18;
  v19[4] = self;
  BOOL v20 = v3;
  BOOL v21 = !v3;
  +[UIView animateWithDuration:v22 animations:v19 completion:0.0];
}

- (ICSERootViewController)rootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootViewController);

  return (ICSERootViewController *)WeakRetained;
}

- (void)setRootViewController:(id)a3
{
}

- (ICSEMainViewController)mainViewController
{
  return self->_mainViewController;
}

- (void)setMainViewController:(id)a3
{
}

- (ICSETableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
}

- (BOOL)isShowingTableContainer
{
  return self->_isShowingTableContainer;
}

- (UIView)mainContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainContainerView);

  return (UIView *)WeakRetained;
}

- (void)setMainContainerView:(id)a3
{
}

- (UIView)tableViewContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableViewContainerView);

  return (UIView *)WeakRetained;
}

- (void)setTableViewContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableViewContainerView);
  objc_destroyWeak((id *)&self->_mainContainerView);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_mainViewController, 0);

  objc_destroyWeak((id *)&self->_rootViewController);
}

@end