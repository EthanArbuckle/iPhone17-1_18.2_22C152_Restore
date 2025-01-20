@interface IMSegmentedViewController
- (IMSegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (IMViewControllerTransition)defaultTransition;
- (NSArray)viewControllers;
- (UIViewController)selectedViewController;
- (id)viewControllerAtIndex:(int64_t)a3;
- (int64_t)selectedIndex;
- (unint64_t)supportedInterfaceOrientations;
- (void)dealloc;
- (void)reconcileChildViewControllersWithOldViewControllers:(id)a3 newViewControllers:(id)a4;
- (void)selectDefaultIndex;
- (void)setDefaultTransition:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelectedIndex:(int64_t)a3;
- (void)setSelectedIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setSelectedIndex:(int64_t)a3 withTransition:(id)a4;
- (void)setSelectedIndex:(int64_t)a3 withTransition:(id)a4 force:(BOOL)a5;
- (void)setViewControllers:(id)a3;
- (void)showViewController:(id)a3 sendAppearanceMessages:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation IMSegmentedViewController

- (IMSegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)IMSegmentedViewController;
  result = [(IMViewController *)&v5 initWithNibName:a3 bundle:a4];
  if (result) {
    result->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  [(IMViewController *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)IMSegmentedViewController;
  [(IMViewController *)&v3 dealloc];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(IMSegmentedViewController *)self selectedViewController];
  [v6 setEditing:v5 animated:v4];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)IMSegmentedViewController;
  [(IMSegmentedViewController *)&v4 viewDidLoad];
  objc_super v3 = [(IMSegmentedViewController *)self selectedViewController];
  [(IMSegmentedViewController *)self showViewController:v3 sendAppearanceMessages:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(IMSegmentedViewController *)self viewControllers];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    unint64_t v6 = 30;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v6 &= (unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * i) supportedInterfaceOrientations];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v6 = 30;
  }

  return v6;
}

- (void)setSelectedIndex:(int64_t)a3
{
}

- (UIViewController)selectedViewController
{
  int64_t v3 = [(IMSegmentedViewController *)self selectedIndex];

  return (UIViewController *)[(IMSegmentedViewController *)self viewControllerAtIndex:v3];
}

- (void)setViewControllers:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  unint64_t v6 = v5;
  if (self->_viewControllers != v5)
  {
    self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v7 = v5;
    [(IMSegmentedViewController *)self reconcileChildViewControllersWithOldViewControllers:self->_viewControllers newViewControllers:v5];
    objc_storeStrong((id *)&self->_viewControllers, a3);
    uint64_t v5 = (NSArray *)[(IMSegmentedViewController *)self selectDefaultIndex];
    unint64_t v6 = v7;
  }

  _objc_release_x1(v5, v6);
}

- (void)setSelectedIndex:(int64_t)a3 animated:(BOOL)a4
{
  if (a4)
  {
    uint64_t v6 = [(IMSegmentedViewController *)self defaultTransition];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  [(IMSegmentedViewController *)self setSelectedIndex:a3 withTransition:v6];
}

- (void)setSelectedIndex:(int64_t)a3 withTransition:(id)a4
{
}

- (void)setSelectedIndex:(int64_t)a3 withTransition:(id)a4 force:(BOOL)a5
{
  id v7 = a4;
  if (self->_selectedIndex != a3)
  {
    id v12 = v7;
    v8 = [(IMSegmentedViewController *)self viewControllerAtIndex:a3];
    long long v9 = [(IMSegmentedViewController *)self selectedViewController];
    int64_t v10 = [(IMSegmentedViewController *)self selectedIndex];
    self->_selectedIndex = a3;
    if (v9)
    {
      id v11 = [(IMViewController *)self transitionFromViewController:v9 toViewController:v8 transition:v12 reverse:v10 > a3];
    }
    else if ([(IMSegmentedViewController *)self isViewLoaded])
    {
      [(IMSegmentedViewController *)self showViewController:v8 sendAppearanceMessages:1];
    }

    id v7 = v12;
  }
}

- (void)selectDefaultIndex
{
  int64_t v3 = [(IMSegmentedViewController *)self viewControllers];
  id v4 = [v3 count];

  if (v4)
  {
    [(IMSegmentedViewController *)self setSelectedIndex:0 withTransition:0 force:1];
  }
}

- (id)viewControllerAtIndex:(int64_t)a3
{
  if (a3 < 0
    || ([(IMSegmentedViewController *)self viewControllers],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        (unint64_t)v6 <= a3))
  {
    v8 = 0;
  }
  else
  {
    id v7 = [(IMSegmentedViewController *)self viewControllers];
    v8 = [v7 objectAtIndex:a3];
  }

  return v8;
}

- (void)reconcileChildViewControllersWithOldViewControllers:(id)a3 newViewControllers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSMutableArray) initWithArray:v7];
  [v8 removeObjectsInArray:v6];
  id v9 = [objc_alloc((Class)NSMutableArray) initWithArray:v6];
  [v9 removeObjectsInArray:v7];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(IMSegmentedViewController *)self addChildViewController:*(void *)(*((void *)&v24 + 1) + 8 * (void)v14)];
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v9;
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) removeFromParentViewController];
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (void)showViewController:(id)a3 sendAppearanceMessages:(BOOL)a4
{
  id v17 = [(IMSegmentedViewController *)self viewIfLoaded];
  uint64_t v5 = [(IMSegmentedViewController *)self selectedViewController];
  [v17 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [v5 view];
  [v14 setFrame:v7, v9, v11, v13];

  id v15 = [v5 view];
  [v15 setAutoresizingMask:18];

  id v16 = [v5 view];
  [v17 addSubview:v16];
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (IMViewControllerTransition)defaultTransition
{
  return self->_defaultTransition;
}

- (void)setDefaultTransition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTransition, 0);

  objc_storeStrong((id *)&self->_viewControllers, 0);
}

@end