@interface MenuContaineeViewController
- (MenuContaineeViewController)initWithContentView:(id)a3;
- (MenuContaineeViewController)initWithContentViewController:(id)a3;
- (UIScrollView)trackedScrollview;
- (id)keyCommands;
- (void)dealloc;
- (void)escapePressed:(id)a3;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)returnPressed:(id)a3;
- (void)setTrackedScrollview:(id)a3;
- (void)viewDidLoad;
@end

@implementation MenuContaineeViewController

- (MenuContaineeViewController)initWithContentView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MenuContaineeViewController;
  v6 = [(MenuContaineeViewController *)&v10 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentView, a3);
    [(ContaineeViewController *)v7 setPreferredPresentationStyle:5];
    long long v8 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v7->contentInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v7->contentInsets.bottom = v8;
  }

  return v7;
}

- (MenuContaineeViewController)initWithContentViewController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MenuContaineeViewController;
  v6 = [(MenuContaineeViewController *)&v10 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentViewController, a3);
    [(ContaineeViewController *)v7 setPreferredPresentationStyle:5];
    long long v8 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v7->contentInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v7->contentInsets.bottom = v8;
  }

  return v7;
}

- (void)dealloc
{
  [(UIScrollView *)self->_trackedScrollview removeObserver:self forKeyPath:@"contentSize"];
  v3.receiver = self;
  v3.super_class = (Class)MenuContaineeViewController;
  [(MenuContaineeViewController *)&v3 dealloc];
}

- (void)loadView
{
  objc_super v3 = [[CardView alloc] initWithThickBlur];
  [(CardView *)v3 setLayoutStyle:6];
  [(MenuContaineeViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)MenuContaineeViewController;
  [(ContaineeViewController *)&v11 viewDidLoad];
  objc_super v3 = [(MenuContaineeViewController *)self view];
  if (self->_contentViewController)
  {
    -[MenuContaineeViewController addChildViewController:](self, "addChildViewController:");
    v4 = [(UIViewController *)self->_contentViewController view];
    [(UIViewController *)self->_contentViewController didMoveToParentViewController:self];
  }
  else
  {
    v4 = self->_contentView;
  }
  [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 bounds];
  -[UIView setFrame:](v4, "setFrame:");
  id v5 = [v3 contentView];
  [v5 addSubview:v4];

  id v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = [v3 contentView];
  LODWORD(v8) = 1148846080;
  v9 = [(UIView *)v4 _maps_constraintsEqualToEdgesOfView:v7 priority:v8];
  objc_super v10 = [v9 allConstraints];
  [v6 addObjectsFromArray:v10];

  +[NSLayoutConstraint activateConstraints:v6];
}

- (id)keyCommands
{
  v2 = +[UIKeyCommand keyCommandWithInput:UIKeyInputEscape modifierFlags:0 action:"escapePressed:"];
  [v2 setWantsPriorityOverSystemBehavior:1];
  objc_super v3 = +[UIKeyCommand keyCommandWithInput:@"\r" modifierFlags:0 action:"returnPressed:"];
  [v3 setWantsPriorityOverSystemBehavior:1];
  v6[0] = v2;
  v6[1] = v3;
  v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (void)escapePressed:(id)a3
{
  id v3 = [(ContaineeViewController *)self macMenuPresentationController];
  [v3 dismissAnimated:1 completion:0];
}

- (void)returnPressed:(id)a3
{
  v4 = [(MenuContaineeViewController *)self trackedScrollview];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(MenuContaineeViewController *)self trackedScrollview];
    v7 = [v6 indexPathForSelectedRow];

    if (v7)
    {
      double v8 = [v6 delegate];
      v9 = [v6 indexPathForSelectedRow];
      [v8 tableView:v6 didSelectRowAtIndexPath:v9];
    }
  }
  objc_super v10 = [(MenuContaineeViewController *)self trackedScrollview];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if (v11)
  {
    id v16 = [(MenuContaineeViewController *)self trackedScrollview];
    v12 = [v16 indexPathsForSelectedItems];

    if (v12)
    {
      v13 = [v16 delegate];
      v14 = [v16 indexPathsForSelectedItems];
      v15 = [v14 firstObject];
      [v13 collectionView:v16 didSelectItemAtIndexPath:v15];
    }
  }
}

- (void)setTrackedScrollview:(id)a3
{
  id v5 = (UIScrollView *)a3;
  p_trackedScrollview = &self->_trackedScrollview;
  trackedScrollview = self->_trackedScrollview;
  if (trackedScrollview != v5)
  {
    v14 = v5;
    [(UIScrollView *)trackedScrollview removeObserver:self forKeyPath:@"contentSize"];
    objc_storeStrong((id *)&self->_trackedScrollview, a3);
    [(UIScrollView *)*p_trackedScrollview addObserver:self forKeyPath:@"contentSize" options:1 context:&unk_10160F9D8];
    uint64_t v8 = sub_1000BBB44(*p_trackedScrollview);
    id v5 = v14;
    if (v8 == 5)
    {
      p_contentInsets = &self->contentInsets;
      [(UIScrollView *)v14 adjustedContentInset];
      id v5 = v14;
      p_contentInsets->top = v10;
      p_contentInsets->left = v11;
      p_contentInsets->bottom = v12;
      p_contentInsets->right = v13;
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &unk_10160F9D8 && ![(NSDictionary *)self->_change isEqualToDictionary:v12])
  {
    if (qword_10160F9E8 != -1) {
      dispatch_once(&qword_10160F9E8, &stru_1012F9480);
    }
    CGFloat v13 = qword_10160F9E0;
    if (os_log_type_enabled((os_log_t)qword_10160F9E0, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412802;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v11;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "keyPath - %@, object - %@, change - %@", (uint8_t *)&v19, 0x20u);
    }
    objc_storeStrong((id *)&self->_change, a5);
    v14 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    [v14 CGSizeValue];
    double v16 = v15;

    if (v16 + self->contentInsets.top + self->contentInsets.bottom >= 60.0) {
      double v17 = v16 + self->contentInsets.top + self->contentInsets.bottom;
    }
    else {
      double v17 = 60.0;
    }
    v18 = [(MenuContaineeViewController *)self view];
    [v18 setOverriddenIntrinsicHeight:v17];
    [v18 invalidateIntrinsicContentSize];
  }
}

- (UIScrollView)trackedScrollview
{
  return self->_trackedScrollview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedScrollview, 0);
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end