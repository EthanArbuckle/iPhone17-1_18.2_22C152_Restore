@interface RAPWebBundleContaineeViewController
- (BOOL)_supportsFullHeightCardsOnly;
- (RAPWebBundleContaineeViewController)initWithReport:(id)a3 completion:(id)a4;
- (double)heightForLayout:(unint64_t)a3;
- (id)_backgroundColorForModalFormSheet;
- (id)webBundleQuestion;
- (void)_handleKeyboardNotification:(id)a3 aboutToHide:(BOOL)a4;
- (void)_keyboardAboutToChangeFrame:(id)a3;
- (void)_keyboardAboutToHide:(id)a3;
- (void)_keyboardAboutToShow:(id)a3;
- (void)_setInitialCardHeightIfNeeded;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)didDismissByGesture;
- (void)enableDismissByGesture:(BOOL)a3;
- (void)saveInitialCardHeight:(double)a3;
- (void)updateCardHeight:(double)a3;
- (void)updatePreferredContentSize;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RAPWebBundleContaineeViewController

- (RAPWebBundleContaineeViewController)initWithReport:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RAPWebBundleContaineeViewController;
  v9 = [(RAPWebBundleContaineeViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_report, a3);
    v11 = [[RAPWebBundleHomeViewController alloc] initWithReport:v7 completion:v8];
    contentViewController = v10->_contentViewController;
    v10->_contentViewController = v11;

    [(RAPWebBundleBaseViewController *)v10->_contentViewController setDelegate:v10];
    [(ContaineeViewController *)v10 setKeepOriginalSafeInsets:1];
  }

  return v10;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)RAPWebBundleContaineeViewController;
  [(ContaineeViewController *)&v3 viewDidLoad];
  [(RAPWebBundleContaineeViewController *)self _setupViews];
  [(RAPWebBundleContaineeViewController *)self _setupConstraints];
  [(RAPWebBundleContaineeViewController *)self updatePreferredContentSize];
  [(RAPWebBundleContaineeViewController *)self setModalInPresentation:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RAPWebBundleContaineeViewController;
  [(ContaineeViewController *)&v7 viewWillAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_keyboardAboutToShow:" name:UIKeyboardWillShowNotification object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_keyboardAboutToHide:" name:UIKeyboardWillHideNotification object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_keyboardAboutToChangeFrame:" name:UIKeyboardWillChangeFrameNotification object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RAPWebBundleContaineeViewController;
  [(RAPWebBundleContaineeViewController *)&v5 viewDidDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (id)_backgroundColorForModalFormSheet
{
  v2 = [(RAPWebBundleContaineeViewController *)self theme];
  objc_super v3 = [v2 backgroundColorForModalFormSheet];

  return v3;
}

- (void)_setupViews
{
  objc_super v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setPresentedModally:1];

  v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 setTakesAvailableHeight:1];

  objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 setAllowsSwipeToDismiss:0];

  v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 setDefaultContaineeLayout:5];

  objc_super v7 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self->_contentViewController];
  id v8 = [(UINavigationController *)v7 view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(RAPWebBundleContaineeViewController *)self addChildViewController:v7];
  v9 = [(RAPWebBundleContaineeViewController *)self view];
  v10 = [(UINavigationController *)v7 view];
  [v9 addSubview:v10];

  [(UINavigationController *)v7 didMoveToParentViewController:self];
  navController = self->_navController;
  self->_navController = v7;

  [(RAPWebBundleContaineeViewController *)self _setInitialCardHeightIfNeeded];
}

- (void)_setupConstraints
{
  v23 = [(UINavigationController *)self->_navController view];
  v21 = [v23 topAnchor];
  v22 = [(RAPWebBundleContaineeViewController *)self view];
  v20 = [v22 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v24[0] = v19;
  v18 = [(UINavigationController *)self->_navController view];
  v16 = [v18 leadingAnchor];
  v17 = [(RAPWebBundleContaineeViewController *)self view];
  v15 = [v17 leadingAnchor];
  objc_super v14 = [v16 constraintEqualToAnchor:v15];
  v24[1] = v14;
  v13 = [(UINavigationController *)self->_navController view];
  objc_super v3 = [v13 trailingAnchor];
  v4 = [(RAPWebBundleContaineeViewController *)self view];
  objc_super v5 = [v4 trailingAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  v24[2] = v6;
  objc_super v7 = [(UINavigationController *)self->_navController view];
  id v8 = [v7 bottomAnchor];
  v9 = [(RAPWebBundleContaineeViewController *)self view];
  v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v24[3] = v11;
  v12 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_setInitialCardHeightIfNeeded
{
  if (![(RAPWebBundleContaineeViewController *)self _supportsFullHeightCardsOnly])
  {
    id v8 = +[NSUserDefaults standardUserDefaults];
    objc_super v3 = [v8 dictionaryForKey:@"RAPInlineCardHeightDictionary"];
    v4 = [(RAPWebBundleContaineeViewController *)self webBundleQuestion];
    objc_super v5 = [v4 questionTypeAsString];
    v6 = [v3 objectForKeyedSubscript:v5];

    if (v6) {
      [v6 doubleValue];
    }
    else {
      double v7 = 160.0;
    }
    [(RAPWebBundleContaineeViewController *)self updateCardHeight:v7];
  }
}

- (id)webBundleQuestion
{
  objc_super v3 = [(RAPReport *)self->_report initialQuestion];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v5 = [(RAPReport *)self->_report initialQuestion];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (double)heightForLayout:(unint64_t)a3
{
  double result = -1.0;
  if (a3 == 5)
  {
    if ([(RAPWebBundleContaineeViewController *)self _supportsFullHeightCardsOnly]
      || self->_cardContentsHeight <= 0.0)
    {
      v11 = [(ContaineeViewController *)self cardPresentationController];
      [v11 availableHeight];
      double v13 = v12;

      return v13;
    }
    else
    {
      objc_super v5 = [(UINavigationController *)self->_navController navigationBar];
      [v5 frame];
      double v7 = v6;

      double v8 = 470.0 - v7;
      double cardContentsHeight = self->_cardContentsHeight;
      if (self->_keyboardShown)
      {
        double keyboardHeight = self->_keyboardHeight;
        if (cardContentsHeight + keyboardHeight < v8) {
          double cardContentsHeight = v8 - keyboardHeight;
        }
      }
      else
      {
        if (cardContentsHeight < v8) {
          double cardContentsHeight = 470.0 - v7;
        }
        objc_super v14 = [(ContaineeViewController *)self cardPresentationController];
        [v14 bottomSafeOffset];
        double cardContentsHeight = cardContentsHeight + v15;
      }
      return v7 + cardContentsHeight;
    }
  }
  return result;
}

- (BOOL)_supportsFullHeightCardsOnly
{
  if (sub_1000BBB44(self) && sub_1000BBB44(self) != 5) {
    return 1;
  }
  objc_super v3 = [(RAPWebBundleContaineeViewController *)self webBundleQuestion];
  BOOL v4 = (char *)[v3 questionType] - 21 < (char *)0xFFFFFFFFFFFFFFF8;

  return v4;
}

- (void)didDismissByGesture
{
}

- (void)enableDismissByGesture:(BOOL)a3
{
  BOOL v3 = a3;
  [(RAPWebBundleContaineeViewController *)self setModalInPresentation:!a3];
  objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 setAllowsSwipeToDismiss:v3];

  double v6 = [(RAPWebBundleContaineeViewController *)self presentationController];
  double v7 = [v6 delegate];

  if (!v7)
  {
    id v8 = [(RAPWebBundleContaineeViewController *)self presentationController];
    [v8 setDelegate:self];
  }
}

- (void)updateCardHeight:(double)a3
{
  if (self->_cardContentsHeight != a3)
  {
    self->_double cardContentsHeight = a3;
    BOOL v4 = [(ContaineeViewController *)self cardPresentationController];
    [v4 updateHeightForCurrentLayoutAnimated:1];

    [(RAPWebBundleContaineeViewController *)self updatePreferredContentSize];
  }
}

- (void)saveInitialCardHeight:(double)a3
{
  if (![(RAPWebBundleContaineeViewController *)self _supportsFullHeightCardsOnly])
  {
    id v19 = +[NSUserDefaults standardUserDefaults];
    objc_super v5 = [v19 dictionaryForKey:@"RAPInlineCardHeightDictionary"];
    id v6 = [v5 mutableCopy];
    double v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
    }
    v9 = v8;

    v10 = [(RAPWebBundleContaineeViewController *)self webBundleQuestion];
    v11 = [v10 questionTypeAsString];
    double v12 = [v9 objectForKeyedSubscript:v11];
    [v12 doubleValue];
    double v14 = v13;

    if (v14 != a3)
    {
      double v15 = +[NSNumber numberWithDouble:a3];
      v16 = [(RAPWebBundleContaineeViewController *)self webBundleQuestion];
      v17 = [v16 questionTypeAsString];
      [v9 setObject:v15 forKeyedSubscript:v17];

      id v18 = [v9 copy];
      [v19 setObject:v18 forKey:@"RAPInlineCardHeightDictionary"];
    }
  }
}

- (void)updatePreferredContentSize
{
  if (sub_1000BBB44(self) == 5)
  {
    BOOL v3 = [(RAPWebBundleContaineeViewController *)self presentingViewController];
    BOOL v4 = [v3 view];
    objc_super v5 = [v4 window];
    [v5 bounds];
    double v6 = 520.0;
    if (v7 < 520.0)
    {
      id v8 = [(RAPWebBundleContaineeViewController *)self presentingViewController];
      v9 = [v8 view];
      v10 = [v9 window];
      [v10 bounds];
      double v6 = v11;
    }
    unsigned __int8 v12 = [(RAPWebBundleContaineeViewController *)self _supportsFullHeightCardsOnly];
    double v13 = v6;
    if ((v12 & 1) == 0)
    {
      double v14 = self->_contentViewController;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        double v15 = v14;
      }
      else {
        double v15 = 0;
      }
      v16 = v15;

      v17 = [(RAPWebBundleHomeViewController *)v16 headerView];
      [v17 frame];
      double v19 = v18;
      v20 = [(RAPWebBundleHomeViewController *)v16 footerView];

      [v20 frame];
      double v22 = v19 + v21;

      double cardContentsHeight = 160.0 - v22;
      if (self->_cardContentsHeight >= 160.0 - v22) {
        double cardContentsHeight = self->_cardContentsHeight;
      }
      double v13 = v22 + cardContentsHeight;
    }
    if (v13 <= v6) {
      double v24 = v13;
    }
    else {
      double v24 = v6;
    }
    -[RAPWebBundleContaineeViewController setPreferredContentSize:](self, "setPreferredContentSize:", 390.0, v24);
  }
}

- (void)_handleKeyboardNotification:(id)a3 aboutToHide:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = v6;
  if (v4)
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  else
  {
    unsigned __int8 v12 = [v6 userInfo];
    double v13 = [v12 objectForKey:UIKeyboardFrameEndUserInfoKey];
    [v13 CGRectValue];
    CGFloat x = v14;
    CGFloat y = v15;
    CGFloat width = v16;
    CGFloat height = v17;
  }
  double v18 = [v7 userInfo];
  double v19 = [v18 objectForKeyedSubscript:UIKeyboardAnimationDurationUserInfoKey];
  [v19 doubleValue];
  double v21 = v20;

  double v22 = [v7 userInfo];
  v23 = [v22 objectForKeyedSubscript:UIKeyboardAnimationCurveUserInfoKey];
  id v24 = [v23 unsignedIntegerValue];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100403030;
  v25[3] = &unk_1012E9418;
  v25[4] = self;
  *(CGFloat *)&v25[5] = x;
  *(CGFloat *)&v25[6] = y;
  *(CGFloat *)&v25[7] = width;
  *(CGFloat *)&v25[8] = height;
  +[UIView animateWithDuration:v24 delay:v25 options:0 animations:v21 completion:0.0];
}

- (void)_keyboardAboutToShow:(id)a3
{
  self->_keyboardShown = 1;
  [(RAPWebBundleContaineeViewController *)self _handleKeyboardNotification:a3 aboutToHide:0];
}

- (void)_keyboardAboutToChangeFrame:(id)a3
{
  if (self->_keyboardShown) {
    [(RAPWebBundleContaineeViewController *)self _handleKeyboardNotification:a3 aboutToHide:0];
  }
}

- (void)_keyboardAboutToHide:(id)a3
{
  self->_keyboardShown = 0;
  [(RAPWebBundleContaineeViewController *)self _handleKeyboardNotification:a3 aboutToHide:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end